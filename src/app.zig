const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");
const mr = @import("mr/mr.zig");

const std = @import("std");

pub fn app_entry(p: ?*anyopaque) void {
    _ = p;

    while (true) {
        board.led.led_toggle();

        // Sleep for some time
        delay();

        if (board.uart.uart_getc_noblock()) |rd| {
            board.uart.uart_putc(rd);
        }
    }
}

fn delay() void {
    var i: u32 = 0;
    while (i < 9000000) {
        asm volatile ("nop");
        i += 1;
    }
}
