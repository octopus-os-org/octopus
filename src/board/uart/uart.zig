const regs = @import("../../chip/register/register.zig");

pub fn uart_init() void {}

pub fn uart_putc(c: u8) void {
    const uart1 = regs.UART.UART1;
    while (uart1.USR2.read().TXDC == 0) {} // wait last transmit done
    uart1.UTXD.write_raw(c);
}

pub fn uart_getc() u8 {
    const uart1 = regs.UART.UART1;

    while (uart1.USR2.read().RDR == 0) {} // wait rx ready
    return uart1.URXD.read().RX_DATA;
}
