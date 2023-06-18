const regs = @import("../../chip/register/register.zig");

const chip = @import("../../octopus/chip/st/stm32f407vet6.zig");

// uart2
pub fn init() !void {
    // Init pin and uart

    // Enable clock
    regs.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });
    regs.RCC.APB1ENR.modify(.{ .USART2EN = 1 });

    // Set pin 2/3 mode to Alternate function mode
    try chip.pinmgr.pinmgr_set_pin_mux(try chip.pinid.pin_id_from_hrs("A02"), 0b0111);
    try chip.pinmgr.pinmgr_set_pin_mux(try chip.pinid.pin_id_from_hrs("A03"), 0b0111);

    // Init uart (115200)
    regs.USART2.CR1.modify(.{ .UE = 0 });
    regs.USART2.BRR.modify(.{ .DIV_Fraction = 12, .DIV_Mantissa = 22 });
    regs.USART2.CR1.modify(.{ .UE = 1, .TE = 1, .RE = 1, .M = 0, .OVER8 = 0 });

    // enable uart rx interrupt
    regs.USART2.CR1.modify(.{ .RXNEIE = 1 });
}

pub fn putc(c: u8) void {
    const uart = regs.USART2;
    while (uart.SR.read().TXE == 0) {} // wait last transmit done
    uart.DR.write_raw(c);
}

pub fn getc() u8 {
    const uart = regs.USART2;

    while (uart.SR.read().RXNE == 0) {} // wait rx ready
    return @as(u8, uart.DR.read().DR);
}

// TODO: optimize this. consider just keep a getc
pub fn getc_noblock() ?u8 {
    const uart = regs.USART2;

    if (uart.SR.read().RXNE == 1) {
        return @truncate(u8, uart.DR.read().DR);
    }
    return null;
}

pub fn puts(s: []const u8) void {
    for (s) |c| {
        putc(c);
    }
}
