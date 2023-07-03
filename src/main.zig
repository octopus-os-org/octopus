const regs = @import("chip/register/register.zig");
const periph = @import("chip/peripheral/peripheral.zig");
const board = @import("board/board.zig");

const chip = @import("octopus").chip.st.stm32f407vet6;
const os = @import("octopus");

const rtfinsh = @cImport({
    @cInclude("finsh.h");
});

const app = @import("app.zig");

const librb = @cImport({
    @cInclude("rb.h");
});

var irq_handler_table: [256]?*const fn (irq_id: u8, p: ?*anyopaque) void = undefined;

pub fn main() void {
    periph.clock.clock_init();

    _ = board.init() catch {};

    board.uart.putc(':');
    board.uart.puts("Going to initialize octopus\r\n");

    os.startup(&_app_entry);
    // regs.SCB.ICSR.modify(.{ .PENDSVSET = 1 });

    // never reach here
}

pub fn _app_entry(p: ?*anyopaque) void {
    // enable uart rx int

    irq_handler_table[chip.IrqId.USART2] = uart2_irq_handler;
    _ = chip.irq.set_irq_priority(chip.IrqId.USART2, 150) catch {};
    _ = chip.irq.enable_irq(chip.IrqId.USART2) catch {};

    board.uart.puts("Going to run app\r\n");

    // jump to app entry
    app.app_entry(p);
}

fn uart2_irq_handler(irq_id: u8, p: ?*anyopaque) void {
    _ = irq_id;
    _ = p;
    while (true) {
        var rx = board.uart.getc_noblock(); //clear uart rx-isr
        if (rx != null) {
            rtfinsh.finsh_console_input_char(rx.?);
        } else {
            break;
        }
    }
}

export fn InterruptHandler() callconv(.C) void {
    var irqid = chip.irq.get_current_executing_irqid();

    if (irq_handler_table[irqid]) |handler| {
        handler(irqid, null);
        return;
    }

    board.uart.puts("An Interrupt without handler occur\r\n");
    board.uart.putc(irqid);
    while (true) {}
}

// port for rtthread
export fn rt_hw_console_output(s: [*c]const u8) void {
    var str = s;
    while (str.* != 0) : (str += 1) {
        board.uart.putc(str.*);
    }
}
