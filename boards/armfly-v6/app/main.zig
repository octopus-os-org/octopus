const octopus = @import("octopus");
const debug = octopus.debug;
const chip = @import("octopus").chip.st.stm32f429bit6;

var irq_handler_table: [256]?*const fn (irq_id: u8, p: ?*anyopaque) void = undefined;

pub fn main() void {
    debug.log("Welcome To App World!", .{});
    const tty = octopus.idm.dev.find(octopus.default.TTY);
    if (tty) |devtty| {
        // var dev: *octopus.dev.Dev = @alignCast(@ptrCast(tty));
        const say = "Welcome To App World from tty!\r\n";
        _ = devtty.*.write(say);
    }
    while (true) {}
}

export fn InterruptHandler() callconv(.C) void {
    const irqid = chip.irq.get_current_executing_irqid();

    if (irq_handler_table[irqid]) |handler| {
        handler(irqid, null);
        return;
    }

    // board.uart.puts("An Interrupt without handler occur\r\n");
    // board.uart.putc(irqid);
    while (true) {}
}
