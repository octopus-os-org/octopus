const octopus = @import("octopus");
const std = @import("std");
const uart = @import("uart.zig");

// heap
const HEAP_SIZE = 1 * 1024 * 1024;
var _g_heap_mem: [HEAP_SIZE]u8 linksection(".octopus.heap") = undefined;

// These symbols come from the linker script
extern var _data_loadaddr: u32;
extern var _data_start: u32;
extern var _data_end: u32;
extern var _bss_start: u32;
extern var _bss_end: u32;

export fn start() callconv(.C) void {
    // fill .bss with zeroes
    {
        const bss_start: [*]u8 = @ptrCast(&_bss_start);
        const bss_end: [*]u8 = @ptrCast(&_bss_end);
        const bss_len = @intFromPtr(bss_end) - @intFromPtr(bss_start);

        @memset(bss_start[0..bss_len], 0);
    }

    // load .data from flash
    {
        const data_start: [*]u8 = @ptrCast(&_data_start);
        const data_end: [*]u8 = @ptrCast(&_data_end);
        const data_len = @intFromPtr(data_end) - @intFromPtr(data_start);
        const data_src: [*]const u8 = @ptrCast(&_data_loadaddr);

        @memcpy(data_start[0..data_len], data_src[0..data_len]);
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
    _ = uart.init() catch {};
}

fn init_octopus() void {
    // provide "base" for octopus-debug
    octopus.debug.set_lower_puts(uart.puts);

    // provide heap memorey
    octopus.set_heap_mem(_g_heap_mem[0.._g_heap_mem.len]);
}

inline fn console_write(buf: []const u8) usize {
    uart.puts(buf);
    return buf.len;
}

fn console_puts(text: []const u8) void {
    _ = console_write(text);
}

// uart definitions
const uartT = struct {
    const Self = @This();

    fn read(ctx: *anyopaque, buf: []u8) usize {
        // TODO
        // const self = @as(*Self, @ptrCast(ctx));
        _ = ctx;

        var cnt: usize = 0;

        // has data
        while ((cnt < buf.len) and (uart.has_rxdata())) {
            buf[cnt] = uart.getc();
            cnt += 1;
        }

        return cnt;
    }

    fn write(ctx: *anyopaque, buf: []const u8) usize {
        _ = ctx;

        return console_write(buf);
    }

    fn Dev(self: *Self) octopus.dev.Dev {
        return .{
            .ptr = self,
            .vtable = &.{ .read = read, .write = write },
        };
    }
};

var _console_dev = uartT{};
var console_dev = _console_dev.Dev();

// Do uart device initialization and register to octopus
export fn _init() void {
    const say = "Board Initialization...\r\n";
    _ = console_dev.write(say);
    // _ = octopus.idm.dev.register(octopus.default.TTY, &console_dev) catch {};
}
export var board_init: octopus.initm.OctopusInitElem linksection(octopus.initm.OISN) = .{ .name = "board_init", .init = _init };

// panic handler
pub fn panic(msg: []const u8, error_return_trace: ?*std.builtin.StackTrace, ret_addr: ?usize) noreturn {
    @setCold(true);
    _ = error_return_trace;
    _ = ret_addr;
    // _ = msg;
    console_puts("\r\n!KERNEL PANIC!\r\n");
    console_puts(msg);
    console_puts("\r\n");
    while (true) {}
}
