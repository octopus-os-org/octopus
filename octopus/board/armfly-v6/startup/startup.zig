const app = @import("app");
const builtin = @import("std").builtin;

const octopus = @import("octopus");
const ts = @import("octopus").types;
const chip = octopus.chip.st.stm32f429bit6;
const regs = chip.reg.devices.STM32F429.peripherals;

const uart = @import("uart.zig");
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

    // Init comm interface
    _ = uart.init() catch {};

    // Init systick (os clock)
    // init_systick();

    // inject debug-output to octopus debug
    octopus.debug.set_lower_puts(uart.puts);

    uart.puts("Going to main\r\n");

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

    // Set prescalers for 180 MHz: AHB = DIV_1, APB1 = DIV_4, APB2 = DIV_2
    regs.RCC.CFGR.modify(.{ .HPRE = 0, .PPRE1 = 0b101, .PPRE2 = 0b100 });

    // Disable PLL before changing its configuration
    regs.RCC.CR.modify(.{ .PLLON = 0 });

    // Set PLL prescalers and HSE clock source
    regs.RCC.PLLCFGR.modify(.{
        // PLL source from HSE
        .PLLSRC = 1,
        // PLLM = DIV_4
        .PLLM = 4,
        // PLLN = DIV_180
        .PLLN = 180,
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
    // x = 180000000 / 1000  = 180000  (180MHz, 1ms / per irq)
    // clock = 180 / 8 = 22.5MHz
    chip.systick.config(225000, chip.systick.ClockSourceEnum.ExternalReferenceClock);
    chip.systick.enable();
}

// uart definitions
const uartT = struct {
    const Self = @This();

    fn read(
        ctx: *anyopaque,
        buf: []u8,
    ) usize {
        // TODO
        // const self = @as(*Self, @ptrCast(ctx));
        _ = ctx;

        var cnt: usize = 0;

        while (cnt < buf.len) {
            // has data
            if (uart.getc_noblock()) |c| {
                buf[cnt] = c;
                cnt += 1;
            } else {
                break;
            }
        }

        return cnt;
    }

    fn write(ctx: *anyopaque, buf: []const u8) usize {
        _ = ctx;
        var cnt: usize = 0;
        while (cnt < buf.len) {
            uart.putc(buf[cnt]);
            cnt += 1;
        }
        return cnt;
    }

    fn Dev(self: *Self) octopus.dev.Dev {
        return .{
            .ptr = self,
            .vtable = &.{ .read = read, .write = write },
        };
    }
};

var _console_dev = uartT{};
var console_dev = _console_dev.Dev();

export fn _init() void {
    // init uart
    const say = "Board Initialization...\r\n";
    _ = console_dev.write(say);
    _ = octopus.idm.dev.register(octopus.default.TTY, &console_dev) catch {};
}
export var board_init: octopus.initm.OctopusInitElem linksection(octopus.initm.OISN) = .{ .name = "board_init", .init = _init };

pub fn panic(msg: []const u8, error_return_trace: ?*builtin.StackTrace, ret_addr: ?usize) noreturn {
    @setCold(true);
    _ = error_return_trace;
    _ = ret_addr;
    uart.puts("\n!KERNEL PANIC!\n");
    uart.puts(msg);
    uart.puts("\n");
    while (true) {}
}
