const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");

pub fn main() void {
    periph.clock.clock_init();
    board.led.led_init();
    board.uart.uart_init();

    board.uart.uart_putc(':');

    while (true) {
        board.led.led_toggle();

        // Sleep for some time
        var i: u32 = 0;
        while (i < 900000) {
            asm volatile ("nop");
            i += 1;
        }
        var rd = board.uart.uart_getc_noblock();

        if (rd >= 0) {
            board.uart.uart_putc(@bitCast(u8, rd));
        }
    }
}
