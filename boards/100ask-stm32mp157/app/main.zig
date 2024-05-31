const std = @import("std");

const chip = @import("octopus").chip.st.stm32mp157x;
const chipreg = chip.reg.devices.STM32MP157x.peripherals;
const mmc = @import("octopus").driver.mmc;
const octopus = @import("octopus");

// const rtfinsh = @cImport({
//     @cInclude("finsh.h");
// });
// const librb = @cImport({
//     @cInclude("rb.h");
// });

pub fn main() void {
    // _ = octopus.init() catch {};

    const tty = octopus.idm.dev.find(octopus.default.TTY);
    if (tty) |devtty| {
        // var dev: *octopus.dev.Dev = @alignCast(@ptrCast(tty));
        const say = "Welcome To App World!\r\n";
        _ = devtty.*.write(say);
    }

    led_init();

    init_emmc();

    if (tty) |devtty| {
        // var dev: *octopus.dev.Dev = @alignCast(@ptrCast(tty));
        const say = "[info] Echo mode\r\n";
        _ = devtty.*.write(say);
    }

    var i: u32 = 0;
    while (true) {
        i += 1;
        if (tty) |devtty| {
            // const say = "[info] Check\r\n";
            // _ = devtty.*.write(say, say.len);

            var c: [1]u8 = undefined;
            if (devtty.*.read(&c) == 1) {
                // const say2 = "[info] checked\r\n";
                // _ = devtty.*.write(say2, say2.len);
                _ = devtty.*.write(&c);
            }
        }

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

fn init_emmc() void {
    var host = mmc.host.stsdmmc.StSdmmcHost{};
    host.set_bus_400Khz();

    const bhost = host.host();

    _ = mmc.emmc_reinit(bhost, 0xC0FF8080, 6) catch {};
}
