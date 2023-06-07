const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");

const mr = @import("mr/mr.zig");
const app = @import("app.zig");

pub fn main() void {
    periph.clock.clock_init();

    board.init();

    board.uart.uart_putc(':');

    mr.startup(&app.app_entry);

    // regs.SCB.ICSR.modify(.{ .PENDSVSET = 1 });

    // never reach here
}

// port for rtthread
export fn rt_hw_console_output(s: [*c]const u8) void {
    var str = s;
    while (str.* != 0) : (str += 1) {
        board.uart.uart_putc(str.*);
    }
}

export fn InterruptHandler() callconv(.C) void {
    var sta = regs.SCB.ICSR.read();

    //_ = board.uart.uart_getc_noblock(); //clear uart rx-isr
    board.uart.puts("InterruptHandler");
    board.uart.uart_putc(@truncate(u8, sta.VECTACTIVE));
    while (true) {}
}
