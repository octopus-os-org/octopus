const regs = @import("../../register/register.zig").devices.STM32L4R7.peripherals;

pub fn clock_init() void {
    // This init does these things:
    // - Enables the FPU coprocessor
    // - Sets the external oscillator to achieve a clock frequency of 168MHz
    // - Sets the correct PLL prescalers for that clock frequency
    // - Enables the flash data and instruction cache and sets the correct latency for 168MHz

    // Enable FPU coprocessor
    // WARN: currently not supported in qemu, comment if testing it there
    // regs.FPU_CPACR.CPACR.modify(.{ .CP = 0b11 });

    // Enable MSI
    regs.RCC.CR.modify(.{ .MSION = 1 });
    // Wait for MSI ready
    while (regs.RCC.CR.read().MSIRDY != 1) {}
    // Select MSI as clock source
    regs.RCC.CFGR.modify(.{ .SW = 0 });

    // Enable external high-speed oscillator (HSE)
    regs.RCC.CR.modify(.{ .HSEON = 1, .HSEBYP = 0 });
    // Wait for HSE ready
    while (regs.RCC.CR.read().HSERDY != 1) {}

    // Set prescalers for 80 MHz: HPRE = 0, PPRE1 = 0, PPRE2 = 0
    regs.RCC.CFGR.modify(.{ .HPRE = 0b0000, .PPRE1 = 0b000, .PPRE2 = 0b000 });
    // Disable PLL before changing its configuration
    regs.RCC.CR.modify(.{ .PLLON = 0 });
    // Set PLL prescalers and HSE clock source
    regs.RCC.PLLCFGR.modify(.{
        .PLLSRC = 0b11, // 11: HSE clock selected as PLL, PLLSAI1 and PLLSAI2 clock entry
        .PLLREN = 1, // to enable the PLLCLK output of the main PLL (used as system clock
        // PLLM = DIV_1
        .PLLM = 0,
        // PLLN = MUL_20
        .PLLN = 20,
        // PLLR = DIV_2 (! 0 is DIV_2)
        .PLLR = 0,

        .PLLP = 0,
        .PLLQ = 0,
    });
    // Enable PLL
    regs.RCC.CR.modify(.{ .PLLON = 1 });
    // Wait for PLL ready
    while (regs.RCC.CR.read().PLLRDY != 1) {}

    // Enable flash data and instruction cache and set latency to be Four wait states
    regs.FLASH.ACR.modify(.{ .DCEN = 1, .ICEN = 1, .LATENCY = 0b100 });

    // Select PLL as clock source
    regs.RCC.CFGR.modify(.{ .SW = 0b11 });

    // Wait for PLL selected as clock source
    var cfgr = regs.RCC.CFGR.read();
    while (cfgr.SWS != 0b11) : (cfgr = regs.RCC.CFGR.read()) {}

    // Disable MSI
    regs.RCC.CR.modify(.{ .MSION = 0 });
}
