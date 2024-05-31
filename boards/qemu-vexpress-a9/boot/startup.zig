const std = @import("std");
const builtin = @import("std").builtin;
const octopus = @import("octopus");
const uart = @import("uart.zig");

// heap 1M
const HEAP_SIZE = 1 * 1024 * 1024;
var _g_heap_mem: [HEAP_SIZE]u8 linksection(".octopus.heap") = undefined;

// stack 1M
const STACK_SIZE = 1 * 1024 * 1024;
var _g_stack_mem: [STACK_SIZE]u8 linksection(".octopus.main_stack") = undefined;

// These symbols come from the linker script
extern var _data_loadaddr: usize;
extern var _data_start: usize;
extern var _data_end: usize;
extern var _bss_start: usize;
extern var _bss_end: usize;

export fn main_stack_size() usize {
    return _g_stack_mem.len;
}
export fn main_stack_addr() usize {
    return @intFromPtr(&_g_stack_mem[0]);
}

export fn resetHandler() void {
    // fill .bss with zeroes
    {
        // const bss_start: [*]u8 = @ptrCast(&_bss_start);
        // const bss_end: [*]u8 = @ptrCast(&_bss_end);
        // const bss_len = @intFromPtr(bss_end) - @intFromPtr(bss_start);

        // TODO: solve using @memset will cause problems
        // @memset(bss_start[0..bss_len], 0);

        // note: must make sure "align <usize>" for _bss_start and _bss_end
        const bss_start: [*]usize = @ptrCast(&_bss_start);
        const bss_end: [*]usize = @ptrCast(&_bss_end);
        const bss_len = @intFromPtr(bss_end) - @intFromPtr(bss_start);

        for (0..(bss_len / @sizeOf(usize))) |i| {
            bss_start[i] = 0;
        }
    }

    // load .data from flash
    {
        // const data_start: [*]u8 = @ptrCast(&_data_start);
        // const data_end: [*]u8 = @ptrCast(&_data_end);
        // const data_len = @intFromPtr(data_end) - @intFromPtr(data_start);
        // const data_src: [*]const u8 = @ptrCast(&_data_loadaddr);

        // TODO: solve using @memcpy will cause problems
        // @memcpy(data_start[0..data_len], data_src[0..data_len]);

        // note: must make sure "align <usize>" for _data_start and _data_end
        const data_start: [*]usize = @ptrCast(&_data_start);
        const data_end: [*]usize = @ptrCast(&_data_end);
        const data_len = @intFromPtr(data_end) - @intFromPtr(data_start);
        const data_src: [*]const usize = @ptrCast(&_data_loadaddr);

        for (0..(data_len / @sizeOf(usize))) |i| {
            data_start[i] = data_src[i];
        }
    }

    // // Initialize clock, uart
    init_basic();

    // Initialize octopus debug, heap, ...
    init_octopus();

    // say hello
    uart.puts("Hello From Board\n");

    // goto octopus
    octopus.entry();

    unreachable;
}

fn init_basic() void {
    // Skip clock stuff on qemu
    // clock_init();

    // ignore error handling
    // _ = uart.init() catch {};
    uart.init();
}

fn init_octopus() void {
    // provide "base" for octopus-debug
    octopus.debug.set_lower_puts(uart.puts);

    // provide heap memorey
    octopus.set_heap_mem(_g_heap_mem[0.._g_heap_mem.len]);
}
