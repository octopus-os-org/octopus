const core = @import("../arch/arm/cortex_m4.zig");
pub const systick = core.systick;
pub const irq = core.irq;

pub const IrqId = @import("./comm/irqid/stm32f405xx-07xx_stm32f415xx-17xx.zig").IrqId;
