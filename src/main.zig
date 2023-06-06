const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");

const std = @import("std");
const expect = std.testing.expect;

const rt = @cImport({
    @cInclude("rtapi.h");
});

pub fn main() void {
    periph.clock.clock_init();

    board.init();

    board.uart.uart_putc(':');

    rt.rtthread_startup(@ptrCast(?*const anyopaque, &main_thread_entry), 0, 0);

    // regs.SCB.ICSR.modify(.{ .PENDSVSET = 1 });

    // never reach here

}

fn main_thread_entry(p: *anyopaque) callconv(.C) void {
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

// port for rtthread
export fn rt_hw_console_output(s: [*c]const u8) void {
    var str = s;
    while (str.* != 0) : (str += 1) {
        board.uart.uart_putc(str.*);
    }
}

export fn InterruptHandler() callconv(.C) void {
    var sta = regs.SCB.ICSR.read();

    //_ = board.uart.uart_getc_noblock(); //clear uart rx-isr
    board.uart.puts("InterruptHandler");
    board.uart.uart_putc(@truncate(u8, sta.VECTACTIVE));
    while (true) {}
}
