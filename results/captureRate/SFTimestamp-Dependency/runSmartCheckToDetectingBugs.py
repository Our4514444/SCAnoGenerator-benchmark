#!/usr/bin/python
#-*- coding: utf-8 -*-

'''
该程序用于自动驱动smartcheck检测bug
并记录检测的结果, 然后通过比对注入记录
和检测记录计算出捕获率
'''

#单体程序, 就采用面向过程好了

#导入所使用的库
import os
import subprocess
from rich.progress import track
import csv
import sys
from judgeInjectSuccessForSolidiFI import canItBeCompiled

#使用的常量
SMARTCHECK_COMMAND = "smartcheck -p "
LOG_TXT = "log.txt"
BUG_TYPE1 = "SOLIDITY_EXACT_TIME"
BUG_TYPE2 = "SOLIDITY_PRIVATE_MODIFIER_DONT_HIDE_DATA"
BUG_PREFIX = "ruleId: "
HUANGGAI_INFOTXT_SUFFIX = "Info.txt"
SOLIDIFI_INFOTXT_SUFFIX = ".csv"

def getBugLocation(_resultList, _bugList):
	#这一部分根据smartcheck的输出定制
	#对于每一个要捕获的bug
	locationList = list()
	for bug in _bugList:
		#遍历每一行
		for (index, line) in enumerate(_resultList):
			if (BUG_PREFIX + bug) in line:
				#找到检测到这种bug, 向下数三行就是保存行号的这一行
				lineStr = _resultList[index + 3]
				#分离出行号
				linenum = int(lineStr.split()[1])
				if linenum not in locationList:
					locationList.append(linenum)
	return locationList

def getInjectLocationForHuangGai(_contractName):
	#根据黄盖的文件名定制
	#把最后的.sol去掉, 加上Info.txt就行
	#分离文件名和后缀
	locationList = list()
	filename = os.path.splitext(_contractName)[0]
	if os.path.exists(filename + HUANGGAI_INFOTXT_SUFFIX):
		#应该都存在的
		infoFilename = filename + HUANGGAI_INFOTXT_SUFFIX
		#打开文件, 读取行号
		with open(infoFilename, "r") as f:
			for line in f.readlines():
				linenum = int(line.split()[1])
				if linenum not in locationList:
					locationList.append(linenum)
				else:
					continue
	return locationList

def getInjectLocationForSolidiFI(_contractName):
	#根据SolidiFI的文件名定制
	#把最后的.sol去掉, 加上Info.txt就行
	#分离文件名和后缀
	locationList = list()
	cutPrefix = _contractName.split("_", 1)[1]
	#分离文件名和后缀
	filename = os.path.splitext(cutPrefix)[0]
	#然后拼接头尾
	filename = "BugLog_" + filename
	if os.path.exists(filename + SOLIDIFI_INFOTXT_SUFFIX):
		#应该都存在的
		infoFilename = filename + SOLIDIFI_INFOTXT_SUFFIX
		#打开文件, 读取行号
		with open(infoFilename, "r") as f:
			reader = csv.reader(f)
			#不要首行, 其余行的第一列就是行号
			locationList = [row[0] for row in list(reader)[1:]]
	return locationList


def main(_usedTool):
	#1. 该程序放置于目标文件夹中运行，因此首先get到所有的sol文件
	#对于SolidiFI来说, 要过滤编译失败的合约
	if _usedTool == "SF":
		compileProgram = canItBeCompiled()
		solList = compileProgram.extractContracts()
	else:
		solList = [file for file in os.listdir() if file.endswith(".sol")]
	print("可以被成功编译的合约数量: ", len(solList))
	#一些信息记录
	totalReportBugNum = 0	#报告这种bug的总数
	injectBugNum = 0	#注入的bug总数
	captureBugNum = 0	#被捕获的bug总数
	#2. 然后，调用smartcheck检测每个合约
	for contract in track(solList, description="SmartCheck is working..."):
		#3. 记录检测的输出, 要重定向终端输出
		detectResultLog = open(LOG_TXT, "w+")	#设置为自动覆盖
		subprocess.run(SMARTCHECK_COMMAND + contract, check = True, shell = True, stdout = detectResultLog, stderr = detectResultLog)
		detectResultLog.close()
		#4. 然后读取检测结果, 解析出检测到的bug类型
		#首先是 合约功能受矿工影响　bug
		#传入检测结果和所需的bug类型列表, 返回位置列表
		bugLocationList = getBugLocation(open(LOG_TXT, "r").readlines(), [BUG_TYPE1])
		totalReportBugNum += len(bugLocationList)	
		#5. 找到该合约对应的bug注入记录, 然后进行比对
		#给定合约名, 找到对应的注入文件
		if _usedTool == "HG":
			#使用黄盖的情况
			injectBugLocationList = getInjectLocationForHuangGai(contract)
		else:
			#使用SolidiFI的情况
			injectBugLocationList = getInjectLocationForSolidiFI(contract)
		injectBugNum += len(injectBugLocationList)
		#6. 进行比对，计算出捕获率
		#实际上就是求交集
		injectedBugSet = set(bugLocationList).intersection(set(injectBugLocationList))
		captureBugNum += len(injectedBugSet)
		#print(contract)
	print("捕获的bug数量: ", captureBugNum)
	print("注入的bug数量: ", injectBugNum)
	print("总的报告的bug数量: ", totalReportBugNum)
	print("捕获率: ", captureBugNum / injectBugNum)


usedTool = sys.argv[1]
main(usedTool)
