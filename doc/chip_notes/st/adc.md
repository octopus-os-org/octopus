## Basic concepts

First we must understand channels meanings,channels are the most basic things of ADC.

A "ADC" is a tool which can make analog-to-digital conversion,
well it is a channel, there can have many channels in the system.

(image) A ADC is a person who has many channels. 


## Features / Limits

- ADCs can work parallelly
- There can only one channel is working in the same ADC at the same time 

- a channel has two ends, one connects to input(analog source) and the other one connects to output data (target)


- 有单次模式和扫描模式
    - 单次模式即单通道 (1)
    - 扫描模式即多通道 (n)

- 有规则组和注入组
    - 规则组和注入组是相互依存的概念
    - 规则组即是相当于普通程序，注入组则相当于中断

- 有单次和连续模式
    - 单次即触发一次则执行一次转换
    - 连续模式即启动一次即开始不停的转换

there has the concept of regular / inject 