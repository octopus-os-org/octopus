const builtin = @import("std").builtin;
const octopus = @import("octopus");
const ts = @import("octopus").types;
const chip = @import("octopus").chip.st.stm32mp157x;
const chipreg = chip.reg.devices.STM32MP157x.peripherals;

// heap 16K
const HEAP_SIZE = 16 * 1024;
var _g_heap_mem: [HEAP_SIZE]u8 linksection(".octopus.heap") = undefined;

// stack 16K
const STACK_SIZE = 16 * 1024;
var _g_stack_mem: [STACK_SIZE]u8 linksection(".octopus.main_stack") = undefined;

// These symbols come from the linker script
extern var _data_loadaddr: u32;
extern var _data_start: u32;
extern var _data_end: u32;
extern var _bss_start: u32;
extern var _bss_end: u32;

export fn main_stack_size() usize {
    return _g_stack_mem.len;
}
export fn main_stack_addr() usize {
    return @intFromPtr(&_g_stack_mem[0]);
}

// note: ref https://ziglang.org/documentation/master/std/#A;std:builtin.CallingConvention
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
    console_puts("Hello From Board\n");

    // goto octopus
    octopus.entry();

    unreachable;
}

fn init_basic() void {
    // init uart
    chipreg.USART4.CR1.modify(.{ .TE = 1, .RE = 1 });
}

fn init_octopus() void {
    // provide "base" for octopus-debug
    octopus.debug.set_lower_puts(console_puts);

    // provide heap memorey
    octopus.set_heap_mem(_g_heap_mem[0.._g_heap_mem.len]);
}

inline fn console_write(buf: []const u8) usize {
    var idx: usize = 0;
    while (idx < buf.len) {
        // wait last transition complete
        while (chipreg.USART4.ISR.read().TXE == 0) {}

        chipreg.USART4.TDR.write_raw(buf[idx]);
        idx += 1;
    }
    return idx;
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
        while ((cnt < buf.len) and (chipreg.USART4.ISR.read().RXNE == 1)) {
            buf[cnt] = @truncate(chipreg.USART4.RDR.read().RDR & 0xFF);
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
    _ = octopus.idm.dev.register(octopus.default.TTY, &console_dev) catch {};
}
export var board_init: octopus.initm.OctopusInitElem linksection(octopus.initm.OISN) = .{ .name = "board_init", .init = _init };

// panic handler
pub fn panic(msg: []const u8, error_return_trace: ?*builtin.StackTrace, ret_addr: ?usize) noreturn {
    @setCold(true);
    _ = error_return_trace;
    _ = ret_addr;
    console_puts("\r\n!KERNEL PANIC!\r\n");
    console_puts(msg);
    console_puts("\r\n");
    while (true) {}
}
