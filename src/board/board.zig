pub const led = @import("led/led.zig");
pub const uart = @import("uart/uart.zig");

pub fn init() !void {
    try led.init();
    try uart.init();
}
