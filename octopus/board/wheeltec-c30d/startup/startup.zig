const app = @import("app");
const builtin = @import("std").builtin;

const regs = @import("../../../chip/st/reg/stm32f407.zig").devices.STM32F407.peripherals;
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

// this will make system clock to 168MHz using PLL by HSE
fn init_clock() void {
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

// make 100 ticks / 1s
// related to system clock
fn init_systick() void {
    // . configure system tick
    // ticks = clockHZ / neededHZ
    // x = 168000000 / 1000  = 168000  (168MHz, 1ms / per irq)
    // clock = 168 / 8 = 21MHz
    chipcore.systick.config(210000, chipcore.systick.ClockSourceEnum.ExternalReferenceClock);
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
