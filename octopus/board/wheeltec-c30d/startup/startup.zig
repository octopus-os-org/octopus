const app = @import("app");
const builtin = @import("std").builtin;

// These symbols come from the linker script
extern const _data_loadaddr: u32;
extern var _data_start: u32;
extern var _data_end: u32;
extern var _bss_start: u32;
extern var _bss_end: u32;

// note: ref https://ziglang.org/documentation/master/std/#A;std:builtin.CallingConvention
export fn resetHandler() callconv(.C) void {

    // Copy data from flash to RAM
    const data_loadaddr = @as([*]const u8, @ptrCast(&_data_loadaddr));
    const data = @as([*]u8, @ptrCast(&_data_start));
    const data_size = @as(u32, @intFromPtr(&_data_end)) - @as(u32, @intFromPtr(&_data_start));
    for (data_loadaddr[0..data_size], 0..) |d, i| data[i] = d;

    // Clear the bss
    const bss = @as([*]u8, @ptrCast(&_bss_start));
    const bss_size = @as(u32, @intFromPtr(&_bss_end)) - @as(u32, @intFromPtr(&_bss_start));
    for (bss[0..bss_size]) |*b| b.* = 0;

    // Call user application (entry)
    app.main();

    unreachable;
}

// const board = @import("board/board.zig");

// pub fn panic(msg: []const u8, error_return_trace: ?*builtin.StackTrace, ret_addr: ?usize) noreturn {
//     @setCold(true);
//     _ = error_return_trace;
//     _ = ret_addr;
//     board.uart.puts("\n!KERNEL PANIC!\n");
//     board.uart.puts(msg);
//     board.uart.puts("\n");
//     while (true) {}
// }
