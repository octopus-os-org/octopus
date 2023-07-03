const _core = @import("../arch/arm/cortex_m4.zig");
pub const systick = _core.systick;
pub const irq = _core.irq;

pub const IrqId = @import("comm/irqid/stm32f405xx-07xx_stm32f415xx-17xx.zig").IrqId;

const _pin = @import("comm/pin/stm32f4xx/pin.zig");
pub const pinid = _pin.pinid;
pub const pinmgr = _pin.pinmgr;
pub const gpio = _pin.gpio;

const _adc = @import("comm/adc/stm32f4xx/adc.zig");

pub const adcid = _adc.adcid;
pub const adcmgr = _adc.adcmgr;
