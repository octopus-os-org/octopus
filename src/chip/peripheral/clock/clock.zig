const regs = @import("../../register/register.zig");

pub fn clock_init() void {
    // This init does these things:
    // - Enables the FPU coprocessor
    // - Sets the external oscillator to achieve a clock frequency of 168MHz
    // - Sets the correct PLL prescalers for that clock frequency
    // - Enables the flash data and instruction cache and sets the correct latency for 168MHz

    // Enable FPU coprocessor
    // WARN: currently not supported in qemu, comment if testing it there
    regs.FPU_CPACR.CPACR.modify(.{ .CP = 0b11 });

    // Enable HSI
    regs.RCC.CR.modify(.{ .HSION = 1 });

    // Wait for HSI ready
    while (regs.RCC.CR.read().HSIRDY != 1) {}

    // Select HSI as clock source
    regs.RCC.CFGR.modify(.{ .SW = 0 });

    // Enable external high-speed oscillator (HSE)
    regs.RCC.CR.modify(.{ .HSEON = 1, .HSEBYP = 0 });

    // Wait for HSE ready
    while (regs.RCC.CR.read().HSERDY != 1) {}

    // Set prescalers for 168 MHz: HPRE = 0, PPRE1 = DIV_2, PPRE2 = DIV_4
    regs.RCC.CFGR.modify(.{ .HPRE = 0, .PPRE1 = 0b101, .PPRE2 = 0b100 });

    // Disable PLL before changing its configuration
    regs.RCC.CR.modify(.{ .PLLON = 0 });

    // Set PLL prescalers and HSE clock source
    regs.RCC.PLLCFGR.modify(.{
        .PLLSRC = 1,
        // PLLM = DIV_4
        .PLLM = 4,
        // PLLN = DIV_168
        .PLLN = 168,
        // PLLP = DIV_2 (! 0 is DIV_2)
        .PLLP = 0,
        // PLLQ = DIV_4
        .PLLQ = 4,
    });

    // Enable PLL
    regs.RCC.CR.modify(.{ .PLLON = 1 });

    // Wait for PLL ready
    while (regs.RCC.CR.read().PLLRDY != 1) {}

    // Enable flash data and instruction cache and set flash latency to 5 wait states
    regs.FLASH.ACR.modify(.{ .DCEN = 1, .ICEN = 1, .LATENCY = 5 });

    // Select PLL as clock source
    regs.RCC.CFGR.modify(.{ .SW = 0b10 });

    // Wait for PLL selected as clock source
    var cfgr = regs.RCC.CFGR.read();
    while (cfgr.SWS != 0b10) : (cfgr = regs.RCC.CFGR.read()) {}

    // Disable HSI
    regs.RCC.CR.modify(.{ .HSION = 0 });
}
