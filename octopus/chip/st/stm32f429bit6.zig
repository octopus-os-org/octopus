const _core = @import("../arch/arm/cortex_m4.zig");
pub const systick = _core.systick;
pub const irq = _core.irq;
pub const dwt = _core.dwt;

pub const IrqId = @import("comm/irqid/stm32f42xxx_stm32f43xxx.zig").IrqId;

const _pin = @import("comm/pin/stm32f4xx/pin.zig");
pub const pinid = _pin.pinid;
pub const pinmgr = _pin.pinmgr;
pub const gpio = _pin.gpio;

const _adc = @import("comm/adc/stm32f4xx/adc.zig");

pub const adcid = _adc.adcid;
pub const adcmgr = _adc.adcmgr;

pub const reg = @import("reg/reg.zig").stm32f429;
