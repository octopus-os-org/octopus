// var i: u32 = 0;
// var j: u32 = 10;
const regs = @import("registers.zig");

const uart0 = @intToPtr(*volatile u32, 0x10009000);
// var counterc: u8 = 1;
const tcons: u32 = 4;
var tvar: u32 = 4;

pub fn main() void {
    // regs.UART.DR.modify(.{ .RNDATA = 65 });
    uart0.* = 'H';
    var i: u32 = 1;
    tvar += 1;
    uart0.* = 65 + tcons;
    uart0.* = 65 + tvar;
    uart0.* = 65 + 5;

    tvar += 1;
    uart0.* = 65 + tvar;

    while (true) {
        uart0.* = 65;

        i = 0;
        while (i < 10000000) {
            i += 1;
        }
    }

    while (true) {}
}
