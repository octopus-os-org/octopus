const rh = @import("octopus").util;
const scb = @import("scb.zig");

/// SysTick timer
const STK = struct {
    const base_address = 0xe000e010;
    /// CTRL
    const CTRL_val = packed struct {
        /// ENABLE [0:0]
        /// Counter enable
        ENABLE: u1 = 0,
        /// TICKINT [1:1]
        /// SysTick exception request
        TICKINT: u1 = 0,
        /// CLKSOURCE [2:2]
        /// Clock source selection
        CLKSOURCE: u1 = 0,
        /// unused [3:15]
        _unused3: u5 = 0,
        _unused8: u8 = 0,
        /// COUNTFLAG [16:16]
        /// COUNTFLAG
        COUNTFLAG: u1 = 0,
        /// unused [17:31]
        _unused17: u7 = 0,
        _unused24: u8 = 0,
    };
    /// SysTick control and status
    pub const CTRL = rh.Register(CTRL_val).init(base_address + 0x0);

    /// LOAD
    const LOAD_val = packed struct {
        /// RELOAD [0:23]
        /// RELOAD value
        RELOAD: u24 = 0,
        /// unused [24:31]
        _unused24: u8 = 0,
    };
    /// SysTick reload value register
    pub const LOAD = rh.Register(LOAD_val).init(base_address + 0x4);

    /// VAL
    const VAL_val = packed struct {
        /// CURRENT [0:23]
        /// Current counter value
        CURRENT: u24 = 0,
        /// unused [24:31]
        _unused24: u8 = 0,
    };
    /// SysTick current value register
    pub const VAL = rh.Register(VAL_val).init(base_address + 0x8);

    /// CALIB
    const CALIB_val = packed struct {
        /// TENMS [0:23]
        /// Calibration value
        TENMS: u24 = 0,
        /// unused [24:29]
        _unused24: u6 = 0,
        /// SKEW [30:30]
        /// SKEW flag: Indicates whether the TENMS
        SKEW: u1 = 0,
        /// NOREF [31:31]
        /// NOREF flag. Reads as zero
        NOREF: u1 = 0,
    };
    /// SysTick calibration value
    pub const CALIB = rh.Register(CALIB_val).init(base_address + 0xc);
};

pub const ClockSourceEnum = enum(u1) {
    ExternalReferenceClock = 0,
    ProcessorClock = 1,
};

/// set systick enabled and triggered interrupt every "ticks"
/// and the interrupt priority value is zero (configurable highest)
/// and make systick clock source from the processor clock
pub fn config(ticks: u24, clk_source: ClockSourceEnum) void {
    // check reload value
    // if (ticks - 1 > SYSTICK_RELOAD_MAX) {
    //     return error.Failure; // Reload value impossible
    // }

    // set reload value
    STK.LOAD.write(.{ .RELOAD = ticks - 1 });
    // set systick interrupt priority to zero (reset-default is 0 too)
    _ = scb.set_irq_priority(15, 0) catch {};
    // clear current counter value
    STK.VAL.write_raw(0);
    // set clock source (),
    // enable interrupt,
    STK.CTRL.modify(.{ .CLKSOURCE = @intFromEnum(clk_source), .TICKINT = 1 });
}

pub fn set_clock_source(clk_source: ClockSourceEnum) void {
    STK.CTRL.modify(.{ .CLKSOURCE = @intFromEnum(clk_source) });
}

pub fn set_interrupt(enable_irq: bool, priority: u8) void {
    scb.config_irq_priority_systick(priority);
    STK.CTRL.modify(.{
        .TICKINT = @as(u1, enable_irq),
    });
}

pub fn enable() void {
    STK.CTRL.modify(.{ .ENABLE = 1 });
}

pub fn disable() void {
    STK.CTRL.modify(.{ .ENABLE = 0 });
}
