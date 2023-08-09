const chip = @import("octopus").chip.st.stm32mp157x;

const chipreg = chip.reg.devices.STM32MP157x.peripherals;

const mmc = @import("octopus").driver.mmc;

const rtfinsh = @cImport({
    @cInclude("finsh.h");
});

const librb = @cImport({
    @cInclude("rb.h");
});

const std = @import("std");

fn init_emmc() void {
    var host = mmc.host.stsdmmc.StSdmmcHost{};
    host.set_bus_400Khz();

    var bhost = host.host();

    _ = mmc.emmc_reinit(bhost, 0xC0FF8080, 6) catch {};
}

pub fn main() void {
    led_init();

    init_emmc();

    var i: u32 = 0;
    while (true) {
        i += 1;

        if (i > 500000) {
            i = 0;
            led_toggle();
        }
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
