const c = @cImport({
    @cInclude("uart.h");
});

pub fn init() !void {
    c.uart_init();
}

pub fn putc(ch: u8) void {
    c.uart_send(ch);
}

pub fn getc() u8 {
    while (c.uart_has_data() == 0) {}
    return c.uart_recv();
}

pub fn has_rxdata() bool {
    return c.uart_has_data() != 0;
}

pub fn puts(s: []const u8) void {
    for (s) |ch| {
        putc(ch);
    }
}
