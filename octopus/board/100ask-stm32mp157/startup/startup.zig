const app = @import("app");
const builtin = @import("std").builtin;
const octopus = @import("octopus");
const ts = @import("octopus").types;
const chip = @import("octopus").chip.st.stm32mp157x;
const chipreg = chip.reg.devices.STM32MP157x.peripherals;


// These symbols come from the linker script
extern const _data_loadaddr: u32;
extern var _data_start: u32;
extern const _data_end: u32;
extern var _bss_start: u32;
extern const _bss_end: u32;

// note: ref https://ziglang.org/documentation/master/std/#A;std:builtin.CallingConvention
export fn resetHandler() callconv(.C) void {
    // // Copy data from flash to RAM
    // const data_loadaddr = @as([*]const u8, @ptrCast(&_data_loadaddr));
    // const data = @as([*]u8, @ptrCast(&_data_start));
    // const data_size = @as(u32, @intFromPtr(&_data_end)) - @as(u32, @intFromPtr(&_data_start));
    // for (data_loadaddr[0..data_size], 0..) |d, i| data[i] = d;

    // Clear the bss
    const bss = @as([*]u8, @ptrCast(&_bss_start));
    const bss_size = @as(u32, @intFromPtr(&_bss_end)) - @as(u32, @intFromPtr(&_bss_start));
    for (bss[0..bss_size]) |*b| b.* = 0;

    // Call contained in main.zig
    app.main();

    unreachable;
}


// uart definitions
const uartT = struct {
    const Self = @This();

    fn read(ctx: *anyopaque, buf: [*]u8, size: ts.size_t) ts.size_t {
        // TODO
        // const self = @as(*Self, @ptrCast(ctx));
        _ = ctx;
        _ = buf;
        _ = size;

        return 0;
    }

    fn write(ctx: *anyopaque, buf: [*]const u8, size: ts.size_t) ts.size_t {
        _ = ctx;

        var idx: ts.size_t = 0;
        while(idx < size) {
            // wait last transition complete
            while(chipreg.USART4.ISR.read().TXE == 0) {}

            chipreg.USART4.TDR.write_raw(buf[idx]);
            idx += 1;
        }

        return 0;
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
fn _init() void {
    const say = "Board Initialization...\r\n";
    _ = console_dev.write(say, say.len);
    
    _ = octopus.idm.gidm.register("tty", &console_dev) catch {};
}
export var board_init: octopus.initm.OctopusInitElem linksection(octopus.initm.OISN) = .{ .name = "board_init", .init = _init };

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
