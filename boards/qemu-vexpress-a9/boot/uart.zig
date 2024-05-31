const regs = @import("registers.zig");

pub fn putc(c: u8) void {
    while (regs.UART1.FR.read().TXFF == 1) {}
    regs.UART1.DR.write(.{ .DATA = c });
}

pub fn getc() ?u8 {
    if (regs.UART1.FR.read().RXFE == 1) {
        return null;
    }

    return regs.UART1.DR.read().DATA;
}

pub fn init() void {
    regs.UART1.CR.modify(.{ .UARTEN = 1, .TXE = 1, .RXE = 1 });
}

pub fn puts(s: []const u8) void {
    for (s) |c| {
        putc(c);
    }
}
