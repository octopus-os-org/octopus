#ifndef RT_CONFIG_H__
#define RT_CONFIG_H__

/* Automatically generated file; DO NOT EDIT. */
/* MR RT-Thread Configuration */

/* RT-Thread Kernel */

#define RT_NAME_MAX 8
#define RT_ALIGN_SIZE 8
#define RT_THREAD_PRIORITY_32
#define RT_THREAD_PRIORITY_MAX 32
#define RT_TICK_PER_SECOND 1000
#define RT_USING_OVERFLOW_CHECK
#define RT_USING_IDLE_HOOK
#define RT_IDLE_HOOK_LIST_SIZE 4
#define IDLE_THREAD_STACK_SIZE 256
#define RT_USING_TIMER_SOFT
#define RT_TIMER_THREAD_PRIO 4
#define RT_TIMER_THREAD_STACK_SIZE 512

/* kservice optimization */

#define RT_DEBUG
#define RT_DEBUG_INIT_CONFIG
#define RT_DEBUG_INIT 1
#define RT_DEBUG_THREAD_CONFIG
#define RT_DEBUG_THREAD 1
#define RT_DEBUG_SCHEDULER_CONFIG
#define RT_DEBUG_SCHEDULER 1
#define RT_DEBUG_IPC_CONFIG
#define RT_DEBUG_IPC 1
#define RT_DEBUG_TIMER_CONFIG
#define RT_DEBUG_TIMER 1
#define RT_DEBUG_IRQ_CONFIG
#define RT_DEBUG_IRQ 1
#define RT_DEBUG_MEM_CONFIG
#define RT_DEBUG_MEM 1
#define RT_DEBUG_SLAB_CONFIG
#define RT_DEBUG_SLAB 1
#define RT_DEBUG_MEMHEAP_CONFIG
#define RT_DEBUG_MEMHEAP 1
#define RT_DEBUG_MODULE_CONFIG
#define RT_DEBUG_MODULE 1

/* Inter-Thread communication */

#define RT_USING_SEMAPHORE
#define RT_USING_MUTEX
#define RT_USING_EVENT
#define RT_USING_MAILBOX
#define RT_USING_MESSAGEQUEUE

/* Memory Management */

#define RT_USING_NOHEAP

/* Kernel Device Object */

#define RT_USING_CONSOLE
#define RT_CONSOLEBUF_SIZE 128
#define RT_CONSOLE_DEVICE_NAME "uart"
#define RT_VER_NUM 0x50001

#endif
