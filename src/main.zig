// var i: u32 = 0;
// var j: u32 = 10;
const regs = @import("registers.zig");

const uart0 = @intToPtr(*volatile u32, 0x10009000);

pub fn main() void {
    // regs.UART.DR.modify(.{ .RNDATA = 65 });
    uart0.* = 'H';

    while (true) {
        uart0.* = 65;

        // Sleep for some time
        var i: u32 = 1;
        uart0.* = 65;

        uart0.* = 65 + 1;
        uart0.* = 65 + i;

        uart0.* = 65;
        // i += 1;
        uart0.* = i + 65;
        // while (i < 100) {
        //     i += 1;
        // }
        break;
    }

    while (true) {}
}
