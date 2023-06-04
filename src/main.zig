const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");

pub fn main() void {
    periph.clock.clock_init();

    board.init();

    board.uart.uart_putc(':');

    while (true) {
        board.led.led_toggle();

        // Sleep for some time
        var i: u32 = 0;
        while (i < 900000) {
            asm volatile ("nop");
            i += 1;
        }
        }

export fn interruptHandler() callconv(.C) void {
    var sta = regs.SCB.ICSR.read();

    _ = board.uart.uart_getc_noblock(); //clear uart rx-isr
    board.uart.uart_putc(@truncate(u8, sta.VECTACTIVE));
}
