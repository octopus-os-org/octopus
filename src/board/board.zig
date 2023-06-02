pub const led = @import("led/led.zig");
pub const uart = @import("uart/uart.zig");

pub fn init() void {
    led.init();
    uart.init();
}
