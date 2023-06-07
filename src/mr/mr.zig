pub const thread = @import("core/thread.zig");

const rt = @cImport({
    @cInclude("rtapi.h");
});

var main_thread = thread.Thread{};
var main_thread_stack: [2048]u8 align(8) = undefined;

pub fn startup(main_entry: thread.ThreadEntry) void {
    _ = rt.rt_hw_interrupt_disable();

    // board level initialization
    // NOTE: please initialize heap inside board initialization.
    //rt_hw_board_init(heap_begin, heap_end);

    // show RT-Thread version
    rt.rt_show_version();

    // timer system initialization
    rt.rt_system_timer_init();

    // scheduler system initialization
    rt.rt_system_scheduler_init();

    // signal

    // application initialization (main_thread)
    _ = main_thread.init("main", main_entry, null, &main_thread_stack, rt.RT_THREAD_PRIORITY_MAX / 3, 20) catch {};
    _ = main_thread.startup() catch {};

    // timer thread initialization
    rt.rt_system_timer_thread_init();

    // idle thread initialization
    rt.rt_thread_idle_init();

    // start scheduler
    rt.rt_system_scheduler_start();

    unreachable;
}
