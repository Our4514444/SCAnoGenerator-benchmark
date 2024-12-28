# SCAnoGenerator Benchmark
***SCAnoGenerator: Automatic Anomaly Injection for Ethereum Smart Contracts***

## Overview

SCAnoGenerator-benchmark repository contains anomalistic contracts that have been injected using [SCAnoGenerator](https://github.com/Our4514444/SCAnoGenerator). 

*SCAnoGenerator* can inject the following 20 types of anomalies into the contracts (the names and definitions of the anomalies are from the *[Jiuzhou](https://github.com/xf97/JiuZhou)* classification framework):

| Num  |                       Anomaly type                       |
| :--: | :------------------------------------------------------: |
|  1   |               Transaction order dependence               |
|  2   |     Results of contract execution affected by miners     |
|  3   |                   Unhandled exception                    |
|  4   |              Integer overflow and underflow              |
|  5   |            Use *tx.origin* for authentication            |
|  6   |                       Re-entrancy                        |
|  7   |                    Wasteful contracts                    |
|  8   |                   Short address attack                   |
|  9   |                    Suicide contractse                    |
|  10  |                       Locked ether                       |
|  11  |                 Forced to receive ether                  |
|  12  |                      Pre-sent ether                      |
|  13  |           Uninitialized local/state variables            |
|  14  | Hash collisions with multiple variable length  arguments |
|  15  |         Specify *function* variable as any type          |
|  16  |            Dos by complex *fallback* function            |
|  17  |   *public* function that could be declared  *external*   |
|  18  | Non-public variables are accessed by *public*/*external* |
|  19  |                    Nonstandard naming                    |
|  20  |               Unlimited compiler versions                |



## Structure

*injectedContractDataSet:* This dataset consists of 4,744 anomalistic contracts, covering 20 types of anomalies. Users can use the contracts this dataset as the benchmark to evaluate the performance of analysis tools, to obtain the true performance of the analysis tools.

*manualCheckDataset:* This dataset consists of 964 anomalistic contracts, covering 20 types of anomalies, and 3 researchers who familiar with smart contract anomalies check the injected anomalies in these anomalistic contracts to ensure that all injected anomalies can be activated (i.e., the injected anomalies can be exploited by external attackers). 

*results:*  the experimental results and inspection notes publicly available.

 Following is an example of results folder's structure:

      results
    │ │
    │ ├── accuracyRate
    │ │ ├── SF (the address names of the contracts injected with anomalies)
    │ │ ├── SG (the address names of the contracts injected with anomalies)
    │ │ 
    │ ├── captureRate(the code and dataset for calculating captureRate)
    │ │ 
    │ ├── inspection-notes
    │ │ ├── expert1 (the checking notes of expert 1)	
    │ │ │ ├── SF (Location of anomalies that can be activated (recorded in excel file) and examples of anomalies  │ │ │ │		that cannot be activated (recorded in docx file))
    │ │ │ ├── SG (Location of anomalies that can be activated (recorded in excel file) and examples of anomalies  │ │ │ │		that cannot be activated (recorded in docx file))
    │ │ ├── expert2
    │ │ ├── expert3
    │ │
    │ ├── successRate
    │ │ ├── SF (the address names of the contracts injected with anomalies)
    │ │ ├── SG (the address names of the contracts injected with anomalies)
    │ │
    │ ├── Transaction(Transactions that can be received by contracts in the dataset. Among them, we split dataset 3 into 5 parts)  	   


​     
