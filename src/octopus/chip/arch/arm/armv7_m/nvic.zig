const rh = @import("register_helper.zig");

const nvic_iser_base_addr = @intToPtr(*u32, 0xE000E100);
const nvic_icer_base_addr = @intToPtr(*u32, 0xE000E180);

const nvic_ipr_base_addr = @intToPtr(*u32, 0xE000E400);

/// config interrupt priority of irq_id (which is exception number)
/// attention: can only handle irq_id [16..]
pub fn set_irq_priority(irq_id: u8, val: u8) !void {
    var irqn = try check_irq_id(irq_id);

    write_reg_8bit_of_irqn(nvic_ipr_base_addr, irqn, val);
}

// used for writing NVIC_IPR register
inline fn write_reg_8bit_of_irqn(regbase: *u32, irqn: u8, val: u8) void {
    // using byte access
    var h = irqn >> 3; // irqn / 8

    @ptrCast([*c]u8, regbase)[h] = val;
}

/// enable irq of irq_id (which is exception number)
/// attention: can only handle irq_id [16..]
pub fn enable_irq(irq_id: u8) !void {
    var irqn = try check_irq_id(irq_id);

    write_1_to_regbit_of_irqn(nvic_iser_base_addr, irqn);
}

/// disable irq of irq_id (which is exception number)
/// attention: can only handle irq_id [16..]
pub fn disable_irq(irq_id: u8) !void {
    var irqn = try check_irq_id(irq_id);

    write_1_to_regbit_of_irqn(nvic_icer_base_addr, irqn);
}

inline fn write_1_to_regbit_of_irqn(regbase: *u32, irqn: u8) void {
    var h = irqn >> 5; // irqn / 32
    var l = irqn & 0x1F; // irqn % 32

    // read
    var cur = @ptrCast([*c]u32, regbase)[h];
    // modify
    cur = cur | @as(u32, 1) << @truncate(u5, l);
    // write
    @ptrCast([*c]u32, regbase)[h] = cur;
}

inline fn check_irq_id(irq_id: u8) !u8 {
    if (irq_id < 16) { // only support irqn (16..)
        return error.Failure;
    }

    return irq_id - 16;
}
