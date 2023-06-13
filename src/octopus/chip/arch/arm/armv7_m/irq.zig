const nvic = @import("nvic.zig");
const scb = @import("scb.zig");

pub const get_current_executing_irqid = scb.get_current_executing_irqid;

// abstract

/// enable interrupt of irq_id (which is exception number)
pub fn enable_irq(irq_id: u8) !void {
    if (isNvicIrqId(irq_id)) {
        try nvic.enable_irq(irq_id);
    } else {
        try scb.enable_irq(irq_id);
    }
}

/// disable interrupt of irq_id (which is exception number)
pub fn disable_irq(irq_id: u8) !void {
    if (isNvicIrqId(irq_id)) {
        try nvic.disable_irq(irq_id);
    } else {
        try scb.disable_irq(irq_id);
    }
}

/// config interrupt priority of irq_id (which is exception number)
pub fn set_irq_priority(irq_id: u8, val: u8) !void {
    if (isNvicIrqId(irq_id)) {
        try nvic.set_irq_priority(irq_id, val);
    } else {
        try scb.set_irq_priority(irq_id, val);
    }
}

fn isNvicIrqId(irqId: u8) bool {
    return irqId > 15;
}
