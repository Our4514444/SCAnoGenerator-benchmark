#!/usr/bin/python
#-*- coding: utf-8 -*-

'''
该程序用于自动驱动mythril检测bug
并记录检测的结果, 然后通过比对注入记录
和检测记录计算出捕获率
'''

'''
mythril要设置超时时间
'''

#单体程序, 就采用面向过程好了

#导入所使用的库
import os
import subprocess
from rich.progress import track
import csv
import sys
from judgeInjectSuccessForSolidiFI import canItBeCompiled
import re
import signal	#用于指定杀死进程时的信号
import time

#使用的常量
COMMAND = "myth analyze "
LOG_TXT = "log.txt"
BUG_TYPE1 = "107"
BUG_TYPE2 = "120"
BUG_PREFIX = "SWC ID: "
HUANGGAI_INFOTXT_SUFFIX = "Info.txt"
SOLIDIFI_INFOTXT_SUFFIX = ".csv"
STOP_FLAG1 = "===="
STOP_FLAG2 = "SWC ID: "
STOP_FLAG3 = "Caller:"

def getBugLocation(_resultList, _bugList):
	#这一部分根据smartcheck的输出定制
	#对于每一个要捕获的bug
	locationList = list()
	lineNumPattern = re.compile(r"^(In file:)(.)+(:)(\d)+")
	for bug in _bugList:
		#遍历每一行
		for (index, line) in enumerate(_resultList):
			if (BUG_PREFIX + bug) in line:
				#print(line)
				#找到检测到这种bug的语句段
				#进入这个语句段进行查找
				tempIndex = index + 1
				infoLine = _resultList[tempIndex]
				while STOP_FLAG1 not in infoLine and STOP_FLAG2 not in infoLine and STOP_FLAG3 not in infoLine: 
					#print(infoLine)
					#此行是否包含行号
					if lineNumPattern.search(infoLine):
						#包含行号, 提取行号
						lineStr = lineNumPattern.search(infoLine).group()
						lineNum = lineStr[lineStr.find(".sol:") + 5:]	#如何没有-分隔号, 则默认返回-1
						#try:
						if int(lineNum) not in locationList:
							locationList.append(int(lineNum))
					tempIndex += 1
					infoLine = _resultList[tempIndex]
			else:
				continue
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

#提前切换版本
def changeSolcVersion(_sourceCode):
	#首先明确－如果合约内存在多个solc版本语句，则只不处理该合约
	#变更，处理有多个solc语句的合约，使用第一个语句的版本
	#要考虑多种情况，1-pragma solidity 0.5.0
	#2-pragma solidity ^0.5.0
	#3-pragma solidity >=0.5.0 <0.6.0
	#考虑的思路是-使用正则表达式从pragma solidity直接提取到;
	#然后再取第一个的数字
	pragmaPattern = re.compile(r"(\b)pragma(\s)+(solidity)(\s)*(.)+?(;)")
	lowVersionPattern = re.compile(r"(\b)(\d)(\.)(\d)(.)(\d)+(\b)")
	pragmaStatement_mulLine = pragmaPattern.search(_sourceCode, re.S)	#匹配多行
	pragmaStatement_sinLine = pragmaPattern.search(_sourceCode)	#匹配多行 
	pragmaStatement = pragmaStatement_sinLine if pragmaStatement_sinLine else pragmaStatement_mulLine #优先使用单行匹配
	defaultSolc = "0.6.0"
	#如果存在声明
	if pragmaStatement:
		#抽取出最低版本
		solcVersion = lowVersionPattern.search(pragmaStatement.group())
		#print("solcVersion", solcVersion)
		if solcVersion:
			defaultSolc = solcVersion.group()
	#否则使用默认声明
	try:
		compileResult = subprocess.run("solc-select use " + defaultSolc, check = True, shell = True, stdout = subprocess.PIPE, stderr = subprocess.PIPE)	#切换版本
	except Exception as e:
		#切换编译器失败，则终止运行
		print(e)
		raise Exception("Failed to switch the solc version.")


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
	bugContractNum = 0	#检出含有该种bug的合约数量
	#2. 然后，调用smartcheck检测每个合约
	for contract in track(solList, description="Mythril is working..."):
		#切换编译器版本
		sourceCode = open(contract, "r").read()
		changeSolcVersion(sourceCode)
		try:
			#3. 记录检测的输出, 要重定向终端输出
			detectResultLog = open(LOG_TXT, "w+", encoding = "utf-8")	#设置为自动覆盖
			#subprocess.run(COMMAND + contract, shell = True, stdout = detectResultLog, stderr = detectResultLog)
			process = subprocess.Popen(COMMAND + contract, shell = True, preexec_fn = os.setpgrp, stdout = detectResultLog, stderr = detectResultLog)
			#5. 找到该合约对应的bug注入记录, 然后进行比对
			#给定合约名, 找到对应的注入文件
			if _usedTool == "HG":
				#使用黄盖的情况
				injectBugLocationList = getInjectLocationForHuangGai(contract)
			else:
				#使用SolidiFI的情况
				injectBugLocationList = getInjectLocationForSolidiFI(contract)
			injectBugNum += len(injectBugLocationList)
			process.communicate(timeout = 900)	#设置超时时间
			detectResultLog.close()
			#4. 然后读取检测结果, 解析出检测到的bug类型
			#首先是 合约功能受矿工影响　bug
			#传入检测结果和所需的bug类型列表, 返回位置列表
			bugLocationList = getBugLocation(open(LOG_TXT, "r").readlines(), [BUG_TYPE1])
			print("合约: ", contract, "检出bug位置: ", bugLocationList)
			totalReportBugNum += len(bugLocationList)
			if len(bugLocationList) > 0:
				bugContractNum += 1
			#6. 进行比对，计算出捕获率
			#实际上就是求交集
			injectedBugSet = set(bugLocationList).intersection(set(injectBugLocationList))
			captureBugNum += len(injectedBugSet)
		except subprocess.TimeoutExpired:
			print("分析超时: ", contract)
			os.killpg(os.getpgid(process.pid),signal.SIGUSR1)
			time.sleep(3)
			#超时的话, 注入的bug数量要增加
			if _usedTool == "HG":
				#使用黄盖的情况
				injectBugLocationList = getInjectLocationForHuangGai(contract)
			else:
				#使用SolidiFI的情况
				injectBugLocationList = getInjectLocationForSolidiFI(contract)
			injectBugNum += len(injectBugLocationList)
		except:
			if _usedTool == "HG":
				#使用黄盖的情况
				injectBugLocationList = getInjectLocationForHuangGai(contract)
			else:
				#使用SolidiFI的情况
				injectBugLocationList = getInjectLocationForSolidiFI(contract)
			injectBugNum += len(injectBugLocationList)		
		#print(contract)
	print("捕获的bug数量: ", captureBugNum)
	print("注入的bug数量: ", injectBugNum)
	print("总的报告的bug数量: ", totalReportBugNum)
	print("捕获率: ", captureBugNum / injectBugNum)
	print("含有bug的合约数量: ", bugContractNum)
	print("bug包含率: ", bugContractNum / len(solList))


usedTool = sys.argv[1]
main(usedTool)
'''
a = getBugLocation(open(LOG_TXT, "r").readlines(), ["107"])
print(a)
'''