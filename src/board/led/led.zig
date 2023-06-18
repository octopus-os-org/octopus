const regs = @import("../../chip/register/register.zig");

const chip = @import("../../octopus/chip/st/stm32f407vet6.zig");
// GPIOA12

pub fn init() !void {
    // enable clock
    regs.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });

    // set pin to output
    var grep = try chip.gpio.gpio_request_pin(try chip.pinid.pin_id_from_hrs("A12"));
    grep.set_io(1);
}

pub fn led_toggle() void {
    var _grep = chip.gpio.gpio_request_pin(chip.pinid.pin_id_from_hrs("A12") catch 0);
    if (_grep) |grep| {
        grep.set_output(~grep.get_output());
    } else |_| {}
}
