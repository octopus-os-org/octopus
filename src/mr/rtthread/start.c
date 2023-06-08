#include "rtapi.h"

static void rt_hw_board_init(unsigned int heap_begin, unsigned int heap_end);
static void rt_application_init(void (*main_thread_entry)(void *parameter));

void rtthread_startup(const void *main_thread_entry, unsigned int heap_begin, unsigned int heap_end)
{
    rt_hw_interrupt_disable();

    /* board level initialization
     * NOTE: please initialize heap inside board initialization.
     */
    rt_hw_board_init(heap_begin, heap_end);

    /* show RT-Thread version */
    rt_show_version();

    /* timer system initialization */
    rt_system_timer_init();

    /* scheduler system initialization */
    rt_system_scheduler_init();

#ifdef RT_USING_SIGNALS
    /* signal system initialization */
    rt_system_signal_init();
#endif /* RT_USING_SIGNALS */

    // main thread
    /* create init_thread */
    rt_application_init((void (*)(void *parameter))main_thread_entry);

    /* timer thread initialization */
    rt_system_timer_thread_init();

    /* idle thread initialization */
    rt_thread_idle_init();

#ifdef RT_USING_SMP
    rt_hw_spin_lock(&_cpus_lock);
#endif /* RT_USING_SMP */

    /* start scheduler */
    rt_system_scheduler_start();

    // never reach here
}

static void rt_hw_board_init(unsigned int heap_begin, unsigned int heap_end) {
    if ((heap_begin == 0) && (heap_end == 0)) {
        return;
    }
#ifdef RT_USING_HEAP
    rt_system_heap_init((void *)heap_begin, (void *)heap_end);
#endif

}

// #ifdef RT_USING_USER_MAIN
#ifndef RT_MAIN_THREAD_STACK_SIZE
#define RT_MAIN_THREAD_STACK_SIZE     2048
#endif /* RT_MAIN_THREAD_STACK_SIZE */
#ifndef RT_MAIN_THREAD_PRIORITY
#define RT_MAIN_THREAD_PRIORITY       (RT_THREAD_PRIORITY_MAX / 3)
#endif /* RT_MAIN_THREAD_PRIORITY */
// #endif /* RT_USING_USER_MAIN */

#ifndef RT_USING_HEAP
/* if there is not enable heap, we should use static thread and stack. */
rt_align(RT_ALIGN_SIZE)
static rt_uint8_t main_thread_stack[RT_MAIN_THREAD_STACK_SIZE];
struct rt_thread main_thread;
#endif /* RT_USING_HEAP */

/**
 * @brief  This function will create and start the main thread, but this thread
 *         will not run until the scheduler starts.
 */
static void rt_application_init(void (*main_thread_entry)(void *parameter)) {
    rt_thread_t tid;

    if (main_thread_entry == 0) {
        return;
    }

#ifdef RT_USING_HEAP
    tid = rt_thread_create("main", main_thread_entry, RT_NULL,
                           RT_MAIN_THREAD_STACK_SIZE, RT_MAIN_THREAD_PRIORITY, 20);
    RT_ASSERT(tid != RT_NULL);
#else
    rt_err_t result;

    tid = &main_thread;
    result = rt_thread_init(tid, "main", main_thread_entry, RT_NULL,
                            main_thread_stack, sizeof(main_thread_stack), RT_MAIN_THREAD_PRIORITY, 20);
    RT_ASSERT(result == RT_EOK);

    /* if not define RT_USING_HEAP, using to eliminate the warning */
    (void)result;
#endif /* RT_USING_HEAP */

    rt_thread_startup(tid);
}
