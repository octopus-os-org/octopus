// const regs = @import("../../chip/register/register.zig");

const chip = @import("octopus").chip.st.stm32f429bit6;

const regs = chip.reg.devices.STM32F429.peripherals;

// uart2
pub fn init() !void {
    // Init pin and uart

    // Enable clock
    regs.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });
    regs.RCC.APB2ENR.modify(.{ .USART1EN = 1 });

    // Set pin A9/A10 mode to Alternate function mode
    try chip.pinmgr.pinmgr_set_pin_mux(try chip.pinid.pin_id_from_hrs("A09"), 0b0111);
    try chip.pinmgr.pinmgr_set_pin_mux(try chip.pinid.pin_id_from_hrs("A10"), 0b0111);

    // Init uart (115200)
    regs.USART1.CR1.modify(.{ .UE = 0 });
    // 115200 bps
    // Desired: 48.828125 = 90MHz / (16 * 115200)
    // Actual: 48.(13/16) = 48.8125
    regs.USART1.BRR.modify(.{ .DIV_Mantissa = 48, .DIV_Fraction = 13 });
    regs.USART1.CR1.modify(.{ .UE = 1, .TE = 1, .RE = 1, .M = 0, .OVER8 = 0 });

    // enable uart rx interrupt
    // regs.USART1.CR1.modify(.{ .RXNEIE = 1 });

    puts("\r\nuart initialized ok\r\n");
}

pub fn putc(c: u8) void {
    const uart = regs.USART1;
    while (uart.SR.read().TXE == 0) {} // wait last transmit done
    uart.DR.write_raw(c);
}

pub fn getc() u8 {
    const uart = regs.USART1;

    while (uart.SR.read().RXNE == 0) {} // wait rx ready
    return @as(u8, uart.DR.read().DR);
}

// TODO: optimize this. consider just keep a getc
pub fn getc_noblock() ?u8 {
    const uart = regs.USART1;

    if (uart.SR.read().RXNE == 1) {
        return @as(u8, @truncate(uart.DR.read().DR));
    }
    return null;
}

pub fn puts(s: []const u8) void {
    for (s) |c| {
        putc(c);
    }
}
