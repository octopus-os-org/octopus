const _core = @import("../arch/arm/cortex_m4.zig");
pub const systick = _core.systick;
pub const irq = _core.irq;

pub const IrqId = @import("comm/irqid/stm32l47x_48x_49x_4ax.zig").IrqId;

const _pin = @import("comm/pin/stm32l4xx/pin.zig");
pub const pinid = _pin.pinid;
pub const pinmgr = _pin.pinmgr;
pub const gpio = _pin.gpio;

// const _adc = @import("comm/adc/stm32f4xx/adc.zig");

// pub const adcid = _adc.adcid;
// pub const adcmgr = _adc.adcmgr;

pub const reg = @import("reg/reg.zig").stm32l4x5;
