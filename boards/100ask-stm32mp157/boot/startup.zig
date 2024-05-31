const builtin = @import("std").builtin;
const octopus = @import("octopus");
const ts = @import("octopus").types;
const chip = @import("octopus").chip.st.stm32mp157x;
const chipreg = chip.reg.devices.STM32MP157x.peripherals;

const HEAP_SIZE = 1 * 1024 * 1024;
var _g_heap_mem: [HEAP_SIZE]u8 linksection(".octopus.heap") = undefined;

// stack 32K
const STACK_SIZE = 32 * 1024;
var _g_stack_mem: [STACK_SIZE]u8 linksection(".octopus.main_stack") = undefined;

// These symbols come from the linker script
extern const _data_loadaddr: usize;
extern var _data_start: usize;
extern const _data_end: usize;
extern var _bss_start: usize;
extern const _bss_end: usize;

export fn main_stack_size() usize {
    return _g_stack_mem.len;
}
export fn main_stack_addr() usize {
    return @intFromPtr(&_g_stack_mem[0]);
}

// note: ref https://ziglang.org/documentation/master/std/#A;std:builtin.CallingConvention
export fn resetHandler() callconv(.C) void {
    // // Copy data from flash to RAM
    // const data_loadaddr = @as([*]const u8, @ptrCast(&_data_loadaddr));
    // const data = @as([*]u8, @ptrCast(&_data_start));
    // const data_size = @as(usize, @intFromPtr(&_data_end)) - @as(usize, @intFromPtr(&_data_start));
    // for (data_loadaddr[0..data_size], 0..) |d, i| data[i] = d;

    // Clear the bss
    const bss = @as([*]u8, @ptrCast(&_bss_start));
    const bss_size = @as(usize, @intFromPtr(&_bss_end)) - @as(usize, @intFromPtr(&_bss_start));
    for (bss[0..bss_size]) |*b| b.* = 0;

    // // Initialize clock, uart
    init_basic();

    // Initialize octopus debug, heap, ...
    init_octopus();

    // say hello
    _ = console_write("Hello From Start\n");

    // goto octopus
    octopus.entry();

    unreachable;
}

fn init_basic() void {
    // Skip clock stuff on qemu
    // clock_init();

    // ignore error handling
    // init uart
    chipreg.USART4.CR1.modify(.{ .TE = 1, .RE = 1 });
}

fn init_octopus() void {
    // provide "base" for octopus-debug
    octopus.debug.set_lower_puts(dputs);

    // provide heap memorey
    octopus.set_heap_mem(_g_heap_mem[0.._g_heap_mem.len]);
}

fn dputs(buf: []const u8) void {
    _ = console_write(buf);
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
    // init uart
    // chipreg.USART4.CR1.modify(.{ .TE = 1, .RE = 1 });

    const say = "Board Initialization...\r\n";
    _ = console_dev.write(say);
    // _ = octopus.idm.dev.register(octopus.default.TTY, &console_dev) catch {};
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
