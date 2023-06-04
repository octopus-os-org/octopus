const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");

const std = @import("std");
const expect = std.testing.expect;

const rt = @cImport({
    @cInclude("rtapi.h");
});

var r1_buf: [1024]u8 = undefined;
var r1_handle: *u8 = undefined;

var r2_buf: [1024]u8 = undefined;
var r2_handle: *u8 = undefined;

fn routine1(p: *anyopaque) callconv(.C) void {
    _ = p;

    while (true) {
        delay();
        board.uart.uart_putc('1');

        delay();
        rt.rt_hw_context_switch(@ptrToInt(&r1_handle), @ptrToInt(&r2_handle));
    }
}

fn routine2(p: *anyopaque) callconv(.C) void {
    _ = p;

    while (true) {
        delay();
        board.uart.uart_putc('2');

        delay();
        rt.rt_hw_context_switch(@ptrToInt(&r2_handle), @ptrToInt(&r1_handle));
    }
}

pub fn main() void {
    periph.clock.clock_init();

    board.init();

    r1_handle = rt.rt_hw_stack_init(@ptrCast(?*const anyopaque, &routine1), null, &r1_buf[1023], null);
    r2_handle = rt.rt_hw_stack_init(@ptrCast(?*const anyopaque, &routine2), null, &r2_buf[1023], null);

    board.uart.uart_putc(':');

    rt.rt_hw_context_switch_to(@ptrToInt(&r1_handle));

    // regs.SCB.ICSR.modify(.{ .PENDSVSET = 1 });

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
    while (i < 900000) {
        asm volatile ("nop");
        i += 1;
    }
}

export fn InterruptHandler() callconv(.C) void {
    var sta = regs.SCB.ICSR.read();

    //_ = board.uart.uart_getc_noblock(); //clear uart rx-isr
    board.uart.uart_putc(@truncate(u8, sta.VECTACTIVE));
}
