const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");
const cc = @import("./mr/cpu/arm/cortex_m4.zig");

const mr = @import("mr/mr.zig");
const app = @import("app.zig");

pub fn main() void {
    periph.clock.clock_init();

    board.init();

    board.uart.uart_putc(':');
    _ = cc.irq.enable_irq(16) catch {};
    mr.startup(&app.app_entry);

    // regs.SCB.ICSR.modify(.{ .PENDSVSET = 1 });

    // never reach here
}

export fn InterruptHandler() callconv(.C) void {
    var sta = regs.SCB.ICSR.read();

    //_ = board.uart.uart_getc_noblock(); //clear uart rx-isr
    board.uart.puts("InterruptHandler");
    board.uart.uart_putc(@truncate(u8, sta.VECTACTIVE));
    while (true) {}
}

// port for rtthread
export fn rt_hw_console_output(s: [*c]const u8) void {
    var str = s;
    while (str.* != 0) : (str += 1) {
        board.uart.uart_putc(str.*);
    }
}

const tcmd = "help\n";
var tcmdIdx: u32 = 0;

// port for rtthread
export fn rt_hw_console_getchar() u8 {
    mr.thread.sleepMs(1000);

    if (tcmdIdx >= 5) {
        tcmdIdx = 0;
    }

    var tc = tcmd[tcmdIdx];
    tcmdIdx += 1;
    return tc;
}
