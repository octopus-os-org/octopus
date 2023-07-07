pub const led = @import("led/led.zig");
// pub const uart = @import("uart/uart.zig");
// pub const adc_power = @import("adc_power/adc_power.zig");

pub fn init() !void {
    try led.init();
    // try uart.init();

    // try adc_power.init();
}
