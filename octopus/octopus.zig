pub usingnamespace @import("./expose.zig");

const std = @import("std");
const thread = @import("core/thread.zig");
const idm = @import("managers/idm/expose.zig");
const initm = @import("managers/init/initm.zig");

const hs = @import("hs");

const debug = @import("debug.zig");

// var main_thread = thread.Thread{};
// var main_thread_stack: [2048]u8 align(8) = undefined;

// "not good smell"
var isOsInitialized = false;

export fn SysTickIrqHandler() callconv(.C) void {
    if (isOsInitialized) {}
}

export fn PendSV_Handler() callconv(.C) void {
    if (isOsInitialized) {}
}

// The entry of octopus
pub fn init() anyerror!void {
    debug.log("[octopus]: init...", .{});
    // heap
    const heap_begin: [*]u8 = @ptrFromInt(hs.@"os.heap_addr_begin");
    const heap_end: [*]u8 = @ptrFromInt(hs.@"os.heap_addr_end");
    const heap_len: u32 = @intFromPtr(heap_end) - @intFromPtr(heap_begin);
    var buffer: *[heap_len]u8 = @as(*[heap_len]u8, @ptrCast(heap_begin));

    debug.log("[octopus][dbg]: heap-info(begin,end,len): 0x{x} 0x{x} 0x{x}", .{ @intFromPtr(heap_begin), @intFromPtr(heap_end), heap_len });
    var _allocator = std.heap.FixedBufferAllocator.init(buffer);
    const allocator = _allocator.allocator();
    // idm
    idm.init(allocator);

    // init-section
    try initm.do_init_default();

    debug.log("[octopus]: init done", .{});
}
