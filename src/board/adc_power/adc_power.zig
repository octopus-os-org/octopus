const regs = @import("../../chip/register/register.zig");
const chip = @import("../../octopus/chip/st/stm32f407vet6.zig");

pub fn init() !void {
    // Enable clock PB0 ADC1IN8
    regs.RCC.AHB1ENR.modify(.{ .GPIOBEN = 1 });
    regs.RCC.APB2ENR.modify(.{ .ADC1EN = 1 });
}
