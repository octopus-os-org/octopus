pub const thread = @import("core/thread.zig");
pub const ipc = @import("core/ipc.zig");
pub const chip = @import("chip/chip.zig");

pub const driver = @import("drivers/drivers.zig");

pub const util = @import("util/util.zig");
pub const idm = @import("managers/idm/idm.zig");
pub const initm = @import("managers/init/initm.zig");

const rt = @cImport({
    @cInclude("rtapi.h");
});

const finsh = @cImport({
    @cInclude("shell.h");
});

const hs = @import("hs");

var main_thread = thread.Thread{};
var main_thread_stack: [2048]u8 align(8) = undefined;

// "not good smell"
var isOsInitialized = false;

pub fn startup(main_entry: thread.ThreadEntry) void {
    _ = rt.rt_hw_interrupt_disable();

    // NOTE: please initialize heap inside board initialization.
    //rt_hw_board_init(heap_begin, heap_end);

    const heap_begin: *u32 = @ptrFromInt(hs.@"os.heap_addr_begin");
    const heap_end: *u32 = @ptrFromInt(hs.@"os.heap_addr_end");

    rt.rt_system_heap_init(heap_begin, heap_end);

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

    // . finsh
    _ = finsh.finsh_system_init();

    // timer thread initialization
    rt.rt_system_timer_thread_init();

    // idle thread initialization
    rt.rt_thread_idle_init();

    //
    isOsInitialized = true;

    // start scheduler
    rt.rt_system_scheduler_start();

    unreachable;
}

export fn SysTickIrqHandler() callconv(.C) void {
    if (isOsInitialized) {
        //* enter interrupt */
        rt.rt_interrupt_enter();

        rt.rt_tick_increase();

        //* leave interrupt */
        rt.rt_interrupt_leave();
    }
}
