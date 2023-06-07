- rt_base_t rt_hw_interrupt_disable(void)
    - 打开全局中断
- void rt_hw_interrupt_enable(rt_base_t level)
    - 关闭全局中断

- rt_uint8_t *rt_hw_stack_init(void *tentry, void *parameter, rt_uint8_t *stack_addr, void *texit);
    - 线程栈的初始化
    - 返回值是线程栈的句柄

- void rt_hw_context_switch(rt_uint32_t from, rt_uint32_t to);
    - 从 from 线程切换到 to 线程，用于线程和线程之间的切换

- void rt_hw_context_switch_interrupt(rt_uint32_t from, rt_uint32_t to);
    - 从 from 线程切换到 to 线程，用于中断里面进行切换的时候使用

- rt_uint32_t rt_thread_switch_interrupt_flag;
    - 表示需要在中断里进行切换的标志

- rt_uint32_t rt_interrupt_from_thread
    - 在线程进行上下文切换时候，用来保存 from

- rt_interrupt_to_thread;
    - 在线程进行上下文切换时候，用来保存 to