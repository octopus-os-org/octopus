pub usingnamespace @import("./expose.zig");

const std = @import("std");
const idm = @import("managers/idm/expose.zig");
const initm = @import("managers/init/initm.zig");
const context = @import("managers/context/context.zig");

const debug = @import("debug.zig");

extern fn main_stack_size() usize;
extern fn main_stack_addr() usize;

var g_heap_mem: ?[]u8 = null;

fn show_logo_info() void {
    debug.puts("\r\n");
    const text =
        \\   ___           _                                  
        \\  / _ \    ___  | |_    ___    _ __    _   _   ___  
        \\ | | | |  / __| | __|  / _ \  | '_ \  | | | | / __| 
        \\ | |_| | | (__  | |_  | (_) | | |_) | | |_| | \__ \ 
        \\  \___/   \___|  \__|  \___/  | .__/   \__,_| |___/ 
        \\                              |_|      0.1.0  0.0.0 
    ;
    debug.puts(text);
    debug.puts("\r\n");
}

pub fn set_heap_mem(mem: []u8) void {
    g_heap_mem = mem;
}

pub fn entry() void {
    _ = init() catch {};
    while (true) {}
}

// The entry of octopus
fn init() anyerror!void {
    show_logo_info();

    debug.puts("[octopus]: init ...\r\n");

    if (g_heap_mem) |heap| {
        debug.puts("[octopus][info]: heap o\r\n");

        debug.printf("[octopus][dbg]: heap-info(begin,len): 0x{x} 0x{x}\n", .{ @intFromPtr(g_heap_mem.?.ptr), g_heap_mem.?.len });
        var _allocator = std.heap.FixedBufferAllocator.init(heap);
        const allocator = _allocator.allocator();
        // idm
        idm.init(allocator);
    } else {
        debug.puts("[octopus][warn]: heap x\r\n");
    }

    // init-section
    debug.puts("[octopus]: init section\n");
    try initm.do_init_default();

    debug.puts("[octopus]: init section done\n");

    // init context main
    context.init_main_routine(main_stack_addr(), main_stack_size());
    debug.printf("[octopus][info]: main-routine: sp: {}/{}\n", .{ context.g_main_routine.used_stack_space(), context.g_main_routine.total_stack_space() });

    // go to app
    @import("app").main();
}
