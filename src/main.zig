const chip = @import("octopus").chip.st.stm32mp157x;

const chipreg = chip.reg.devices.STM32MP157x.peripherals;

// const os = @import("octopus");

const rtfinsh = @cImport({
    @cInclude("finsh.h");
});

const librb = @cImport({
    @cInclude("rb.h");
});

const std = @import("std");

pub fn main() void {
    led_init();

    while (true) {
        delay(80000);
        led_toggle();
    }
}

fn led_init() void {
    chipreg.RCC.RCC_MP_AHB4ENSETR.modify(.{ .GPIOAEN = 1 });
    chipreg.GPIOA.GPIOA_MODER.modify(.{ .MODER10 = 0b01 });
}

fn led_toggle() void {
    chipreg.GPIOA.GPIOA_ODR.modify(.{ .ODR10 = ~chipreg.GPIOA.GPIOA_ODR.read().ODR10 });
}

fn delay(t: u32) void {
    var i: u32 = 0;

    while (i < t) {
        i += 1;
    }
}
