const regs = @import("../../chip/register/register.zig");

// GPIOA12

pub fn led_init() void {
    // enable clock
    regs.RCC.AHB1ENR.modify(.{ .GPIOAEN = 1 });

    // set pin to output
    regs.GPIOA.MODER.modify(.{ .MODER12 = 0b01 });
}

pub fn led_toggle() void {
    regs.GPIOA.ODR.modify(.{ .ODR12 = ~regs.GPIOA.ODR.read().ODR12 });
}
