#!/usr/bin/python
#-*- coding: utf-8 -*-

'''
该程序用于收集SolidiFI注入的代码段
'''

import os
import csv

SOLIDIFI_INFOTXT_SUFFIX = ".csv"

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
			#不要首行, 其余行的第一列就是行号，第二列是代码段的行数
			#将其中的所有行号放入注入中
			for row in list(reader)[1:]:
				#aBugLocation = list(range(int(row[0]), int(row[0]) + int(row[1])))
				locationList.append([row[0], row[1]])
			#locationList = [row[0] for row in list(reader)[1:]]
	return locationList

def main():
	#1. 获取所有的被注入合约
	solList = [file for file in os.listdir() if file.endswith(".sol") and file.startswith("buggy_")]
	#2. 进入每一个合约中，获取被注入的代码段，保存为列表(需要被去重)
	codeList = list()
	num = 0
	for contract in solList:
		locationList = getInjectLocationForSolidiFI(contract)
		#根据位置，进入到代码中找代码
		#先排序
		locationList = sorted(locationList, key = lambda x: x[0])
		codeLineList = open(contract, "r").readlines()
		#逐个寻找
		for loc in locationList:
			num += 1
			#截取代码行
			snippetList = codeLineList[int(loc[0]) : int(loc[0]) + int(loc[1])]
			#然后合成一句
			snippetCode = str()
			for line in snippetList:
				#snippetCode += line
				snippetCode += line.strip() + "\n"
			#然后放入结果
			if snippetCode.strip() not in codeList:
				codeList.append(snippetCode.strip())
				#插入分隔符
				codeList.append("\n%s\n" % ("*" * 10))
		codeList.append("\n%s\n" % ("---" * 10))
	print(len(codeList))
	num = 0
	for code in codeList:
		if ".call.value" in code:
			num += 1
	print(num)
	#3. 保存结果
	with open("code.txt", "w") as f:
		f.writelines(codeList)
	print("Done")


main()