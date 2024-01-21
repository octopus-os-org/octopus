const chip = @import("octopus").chip.st.stm32f429bit6;
const uart = @import("uart.zig");

var irq_handler_table: [256]?*const fn (irq_id: u8, p: ?*anyopaque) void = undefined;

pub fn main() void {
    _ = uart.init() catch {};
    uart.puts("hello\r\n");
    while (true) {}
}

export fn InterruptHandler() callconv(.C) void {
    var irqid = chip.irq.get_current_executing_irqid();

    if (irq_handler_table[irqid]) |handler| {
        handler(irqid, null);
        return;
    }

    // board.uart.puts("An Interrupt without handler occur\r\n");
    // board.uart.putc(irqid);
    while (true) {}
}
