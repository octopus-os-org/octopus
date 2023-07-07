const dev = @import("../../chip/register/register.zig");
const regs = dev.devices.STM32L4R7.peripherals;

const chip = @import("octopus").chip.st.stm32l475vet6;
// GPIOA12

pub fn init() !void {
    // enable clock
    regs.RCC.AHB2ENR.modify(.{ .GPIOEEN = 1 });

    // set pin to output
    var grep = try chip.gpio.gpio_request_pin(try chip.pinid.pin_id_from_hrs("E09"));
    grep.set_io(1);
}

pub fn led_toggle() void {
    var _grep = chip.gpio.gpio_request_pin(chip.pinid.pin_id_from_hrs("E09") catch 0);
    if (_grep) |grep| {
        grep.set_output(~grep.get_output());
    } else |_| {}
}
