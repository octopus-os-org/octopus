#include <rtthread.h>
#include "rb.h"

#ifdef RT_USING_FINSH

// ringbuffer representation
static struct ringbuffer rb;
static char _rb_buffer [RT_ENC_FINSH_RINGBUFFER_SIZE];

// semaphore representation
static struct rt_semaphore rx_sem;


void finsh_extern_init_hook(void)
{
    rb_init(&rb, _rb_buffer, sizeof(_rb_buffer));

    rt_sem_init(&rx_sem, "finshRx", 0, RT_IPC_FLAG_PRIO);
}

char rt_hw_console_getchar(void) {
    char ret = -1;

    rt_sem_take(&rx_sem, RT_WAITING_FOREVER);

    if (rb_data_length(&rb) > 0) {
        rb_get(&rb, &ret, 1);
    } else {
        // should be not happen
    }

    return ret;
}

void finsh_console_input_char(char c) {
    rb_put(&rb, &c, 1);
    rt_sem_release(&rx_sem);
}


#endif