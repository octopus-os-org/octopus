const std = @import("std");
const builtin = @import("std").builtin;
const octopus = @import("octopus");
const chip = @import("reg/stm32f405_reg.zig");
const reg = chip.devices.STM32F405.peripherals;

const uart = @import("uart.zig");
const putc = uart.putc;
const getc = uart.getc;
const puts = uart.puts;

// heap 40K
const HEAP_SIZE = 40 * 1024;
var _g_heap_mem: [HEAP_SIZE]u8 linksection(".octopus.heap") = undefined;

// stack 24K
const STACK_SIZE = 24 * 1024;
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

export fn resetHandler() callconv(.C) void {
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

// uart definitions
const uartT = struct {
    const Self = @This();

    fn read(ctx: *anyopaque, buf: []u8) usize {
        _ = buf; // autofix
        _ = ctx; // autofix
        // TODO
        // const self = @as(*Self, @ptrCast(ctx));
        // _ = ctx;

        // var cnt: usize = 0;

        // // has data
        // while ((cnt < buf.len) and (uart.has_rxdata())) {
        //     buf[cnt] = uart.getc();
        //     cnt += 1;
        // }

        // return cnt;
        return 0;
    }

    fn write(ctx: *anyopaque, buf: []const u8) usize {
        _ = ctx;

        debug_puts(buf);
        return buf.len;
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

inline fn debug_puts(s: []const u8) void {
    puts(s);
}
fn writeFn(context: void, bytes: []const u8) anyerror!usize {
    _ = context;
    debug_puts(bytes);
    return bytes.len;
}
const mwriter = std.io.Writer(void, anyerror, writeFn);
const dwriter = mwriter{ .context = undefined };
fn debug_print(comptime format: []const u8, args: anytype) void {
    _ = dwriter.print(format, args) catch {};
}

// panic handler
pub fn panic(msg: []const u8, error_return_trace: ?*builtin.StackTrace, ret_addr: ?usize) noreturn {
    @setCold(true);
    _ = error_return_trace;
    debug_puts("\r\n!KERNEL PANIC!\r\n");
    debug_puts(msg);
    debug_print("\r\nreturn-address {?}\r\n", .{ret_addr});
    debug_puts("\r\n");
    while (true) {}
}

export fn interruptHandler() void {
    // TODO

    debug_puts("\r\nIrq handling has not yet been implemented!\r\n");

    // octopus.debug.printf("irq id: {}\n", .{octopus.chip.st.stm32f429bit6.irq.get_current_executing_irqid()});
    while (true) {}
}
