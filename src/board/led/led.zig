const regs = @import("../../chip/register/register.zig");

pub fn led_init() void {}

pub fn led_toggle() void {
    regs.GPIO.GPIO1.DR.modify(.{ .IO3 = ~regs.GPIO.GPIO1.DR.read().IO3 });
}
