const app = @import("app");
const builtin = @import("std").builtin;

// "not good smell"
const regs = @import("../../../chip/st/reg/stm32l4x5.zig").devices.STM32L4x5.peripherals;
const chipcore = @import("../../../chip/arch/arm/cortex_m4.zig");

// These symbols come from the linker script
extern const _data_loadaddr: u32;
extern var _data_start: u32;
extern var _data_end: u32;
extern var _bss_start: u32;
extern var _bss_end: u32;

// note: ref https://ziglang.org/documentation/master/std/#A;std:builtin.CallingConvention
export fn resetHandler() callconv(.C) void {

    // Copy data from flash to RAM
    const data_loadaddr = @as([*]const u8, @ptrCast(&_data_loadaddr));
    const data = @as([*]u8, @ptrCast(&_data_start));
    const data_size = @as(u32, @intFromPtr(&_data_end)) - @as(u32, @intFromPtr(&_data_start));
    for (data_loadaddr[0..data_size], 0..) |d, i| data[i] = d;

    // Clear the bss
    const bss = @as([*]u8, @ptrCast(&_bss_start));
    const bss_size = @as(u32, @intFromPtr(&_bss_end)) - @as(u32, @intFromPtr(&_bss_start));
    for (bss[0..bss_size]) |*b| b.* = 0;

    // Init clock
    init_clock();

    // Init systick (os clock)
    init_systick();

    // Call user application (entry)
    app.main();

    unreachable;
}

// this will make system clock to 80MHz using PLL by HSE
fn init_clock() void {
    // This init does these things:
    // - Enables the FPU coprocessor
    // - Sets the external oscillator to achieve a clock frequency of 80MHz
    // - Sets the correct PLL prescalers for that clock frequency
    // - Enables the flash data and instruction cache and sets the correct latency for 80MHz

    // Enable FPU coprocessor
    // WARN: currently not supported in qemu, comment if testing it there
    regs.FPU_CPACR.CPACR.modify(.{ .CP = 0b11 });

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

// make 100 ticks / 1s
// related to system clock
fn init_systick() void {
    // . configure system tick
    // ticks = clockHZ / neededHZ
    // x = 80000000 / 100  = 800000  (80MHz, 10ms / per irq)
    // 800000 / 8 = 100000
    chipcore.systick.config(100000, chipcore.systick.ClockSourceEnum.ExternalReferenceClock);
    chipcore.systick.enable();
}

// const board = @import("board/board.zig");

// pub fn panic(msg: []const u8, error_return_trace: ?*builtin.StackTrace, ret_addr: ?usize) noreturn {
//     @setCold(true);
//     _ = error_return_trace;
//     _ = ret_addr;
//     board.uart.puts("\n!KERNEL PANIC!\n");
//     board.uart.puts(msg);
//     board.uart.puts("\n");
//     while (true) {}
// }
