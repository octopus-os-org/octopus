const uart = @import("uart.zig");
const putc = uart.putc;
const getc = uart.getc;

pub fn main() void {
    uart.init();
    puts("hello world\r\n");

    puts("echo mode:\n");
    while (true) {
        if (uart.getc()) |d| {
            uart.putc(d);
        }
    }
}

fn puts(s: []const u8) void {
    for (s) |c| {
        uart.putc(c);
    }
}
