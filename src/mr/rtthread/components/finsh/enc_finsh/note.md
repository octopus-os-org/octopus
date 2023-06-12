增强 finsh 的使用便利性

将外部提供 "rt_hw_console_getchar" 改为提供 "input" 接口给外部调用，当外部接收到数据时调用该输入接口即可(可在中断中使用) (ps 实现方式为 ringbuffer + semaphore)