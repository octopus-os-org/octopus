const regs = @import("../../chip/register/register.zig");

// uart2
pub fn init() void {
    // Init pin and uart

    // Enable clock
    regs.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });
    regs.RCC.APB1ENR.modify(.{ .USART2EN = 1 });

    // Set pin 2/3 mode to Alternate function mode
    regs.GPIOA.MODER.modify(.{ .MODER2 = 0b10, .MODER3 = 0b10 });
    regs.GPIOA.AFRL.modify(.{ .AFRL2 = 0b0111, .AFRL3 = 0b0111 });

    // Init uart (115200)
    regs.USART2.CR1.modify(.{ .UE = 0 });
    regs.USART2.BRR.modify(.{ .DIV_Fraction = 12, .DIV_Mantissa = 22 });
    regs.USART2.CR1.modify(.{ .UE = 1, .TE = 1, .RE = 1, .M = 0, .OVER8 = 0 });
}

pub fn uart_putc(c: u8) void {
    const uart = regs.USART2;
    while (uart.SR.read().TXE == 0) {} // wait last transmit done
    uart.DR.write_raw(c);
}

pub fn uart_getc() u8 {
    const uart = regs.USART2;

    while (uart.SR.read().RXNE == 0) {} // wait rx ready
    return @as(u8, uart.DR.read().DR);
}

// TODO: optimize this. consider just keep a getc
pub fn uart_getc_noblock() i8 {
    const uart = regs.USART2;

    if (uart.SR.read().RXNE == 1) {
        return @bitCast(i8, @truncate(u8, uart.DR.read().DR));
    }
    return -1;
}
