# -*- coding: utf-8 -*-
# @Time    : 2022/6/10 17:26
# @Author  : shawnwb
# @FileName: test.py
import os

if __name__ == '__main__':
    fileList1 = []
    fileList2 = []
    for filename in os.listdir(r'./Overflow-Underflow'):
        if filename.endswith('.sol'):
            filename = filename.split('_')[1]
            fileList1.append(filename)
    for filename in os.listdir(r'./HuangGaiIntegerOverflow'):
        if filename.endswith('.sol'):
            filename = filename.split('_')[0]+'.sol'
            fileList2.append(filename)
    print(len(fileList1))
    print(fileList1)
    print(len(fileList2))
    print(fileList2)
    print(len(set(fileList1)&set(fileList2)))