const rh = @import("octopus").util;

const constants = @import("const.zig");

/// System control block
pub const SCB = struct {
    const base_address = 0xe000ed00;
    /// CPUID
    const CPUID_val = packed struct {
        /// Revision [0:3]
        /// Revision number
        Revision: u4 = 1,
        /// PartNo [4:15]
        /// Part number of the
        PartNo: u12 = 3108,
        /// Constant [16:19]
        /// Reads as 0xF
        Constant: u4 = 15,
        /// Variant [20:23]
        /// Variant number
        Variant: u4 = 0,
        /// Implementer [24:31]
        /// Implementer code
        Implementer: u8 = 65,
    };
    /// CPUID base register
    pub const CPUID = rh.Register(CPUID_val).init(base_address + 0x0);

    /// ICSR
    const ICSR_val = packed struct {
        /// VECTACTIVE [0:8]
        /// Active vector
        VECTACTIVE: u9 = 0,
        /// unused [9:10]
        _unused9: u2 = 0,
        /// RETTOBASE [11:11]
        /// Return to base level
        RETTOBASE: u1 = 0,
        /// VECTPENDING [12:18]
        /// Pending vector
        VECTPENDING: u7 = 0,
        /// unused [19:21]
        _unused19: u3 = 0,
        /// ISRPENDING [22:22]
        /// Interrupt pending flag
        ISRPENDING: u1 = 0,
        /// unused [23:24]
        _unused23: u1 = 0,
        _unused24: u1 = 0,
        /// PENDSTCLR [25:25]
        /// SysTick exception clear-pending
        PENDSTCLR: u1 = 0,
        /// PENDSTSET [26:26]
        /// SysTick exception set-pending
        PENDSTSET: u1 = 0,
        /// PENDSVCLR [27:27]
        /// PendSV clear-pending bit
        PENDSVCLR: u1 = 0,
        /// PENDSVSET [28:28]
        /// PendSV set-pending bit
        PENDSVSET: u1 = 0,
        /// unused [29:30]
        _unused29: u2 = 0,
        /// NMIPENDSET [31:31]
        /// NMI set-pending bit.
        NMIPENDSET: u1 = 0,
    };
    /// Interrupt control and state
    pub const ICSR = rh.Register(ICSR_val).init(base_address + 0x4);

    /// VTOR
    const VTOR_val = packed struct {
        /// unused [0:8]
        _unused0: u8 = 0,
        _unused8: u1 = 0,
        /// TBLOFF [9:29]
        /// Vector table base offset
        TBLOFF: u21 = 0,
        /// unused [30:31]
        _unused30: u2 = 0,
    };
    /// Vector table offset register
    pub const VTOR = rh.Register(VTOR_val).init(base_address + 0x8);

    /// AIRCR
    const AIRCR_val = packed struct {
        /// VECTRESET [0:0]
        /// VECTRESET
        VECTRESET: u1 = 0,
        /// VECTCLRACTIVE [1:1]
        /// VECTCLRACTIVE
        VECTCLRACTIVE: u1 = 0,
        /// SYSRESETREQ [2:2]
        /// SYSRESETREQ
        SYSRESETREQ: u1 = 0,
        /// unused [3:7]
        _unused3: u5 = 0,
        /// PRIGROUP [8:10]
        /// PRIGROUP
        PRIGROUP: u3 = 0,
        /// unused [11:14]
        _unused11: u4 = 0,
        /// ENDIANESS [15:15]
        /// ENDIANESS
        ENDIANESS: u1 = 0,
        /// VECTKEYSTAT [16:31]
        /// rh.Register key
        VECTKEYSTAT: u16 = 0,
    };
    /// Application interrupt and reset control
    pub const AIRCR = rh.Register(AIRCR_val).init(base_address + 0xc);

    /// SCR
    const SCR_val = packed struct {
        /// unused [0:0]
        _unused0: u1 = 0,
        /// SLEEPONEXIT [1:1]
        /// SLEEPONEXIT
        SLEEPONEXIT: u1 = 0,
        /// SLEEPDEEP [2:2]
        /// SLEEPDEEP
        SLEEPDEEP: u1 = 0,
        /// unused [3:3]
        _unused3: u1 = 0,
        /// SEVEONPEND [4:4]
        /// Send Event on Pending bit
        SEVEONPEND: u1 = 0,
        /// unused [5:31]
        _unused5: u3 = 0,
        _unused8: u8 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };
    /// System control register
    pub const SCR = rh.Register(SCR_val).init(base_address + 0x10);

    /// CCR
    const CCR_val = packed struct {
        /// NONBASETHRDENA [0:0]
        /// Configures how the processor enters
        NONBASETHRDENA: u1 = 0,
        /// USERSETMPEND [1:1]
        /// USERSETMPEND
        USERSETMPEND: u1 = 0,
        /// unused [2:2]
        _unused2: u1 = 0,
        /// UNALIGN__TRP [3:3]
        /// UNALIGN_ TRP
        UNALIGN__TRP: u1 = 0,
        /// DIV_0_TRP [4:4]
        /// DIV_0_TRP
        DIV_0_TRP: u1 = 0,
        /// unused [5:7]
        _unused5: u3 = 0,
        /// BFHFNMIGN [8:8]
        /// BFHFNMIGN
        BFHFNMIGN: u1 = 0,
        /// STKALIGN [9:9]
        /// STKALIGN
        STKALIGN: u1 = 0,
        /// unused [10:31]
        _unused10: u6 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };
    /// Configuration and control
    pub const CCR = rh.Register(CCR_val).init(base_address + 0x14);

    /// SHPR1
    const SHPR1_val = packed struct {
        /// PRI_4 [0:7]
        /// Priority of system handler
        PRI_4: u8 = 0,
        /// PRI_5 [8:15]
        /// Priority of system handler
        PRI_5: u8 = 0,
        /// PRI_6 [16:23]
        /// Priority of system handler
        PRI_6: u8 = 0,
        /// unused [24:31]
        _unused24: u8 = 0,
    };
    /// System handler priority
    pub const SHPR1 = rh.Register(SHPR1_val).init(base_address + 0x18);

    /// SHPR2
    const SHPR2_val = packed struct {
        /// unused [0:23]
        _unused0: u8 = 0,
        _unused8: u8 = 0,
        _unused16: u8 = 0,
        /// PRI_11 [24:31]
        /// Priority of system handler
        PRI_11: u8 = 0,
    };
    /// System handler priority
    pub const SHPR2 = rh.Register(SHPR2_val).init(base_address + 0x1c);

    /// SHPR3
    const SHPR3_val = packed struct {
        /// unused [0:15]
        _unused0: u8 = 0,
        _unused8: u8 = 0,
        /// PRI_14 [16:23]
        /// Priority of system handler
        PRI_14: u8 = 0,
        /// PRI_15 [24:31]
        /// Priority of system handler
        PRI_15: u8 = 0,
    };
    /// System handler priority
    pub const SHPR3 = rh.Register(SHPR3_val).init(base_address + 0x20);

    /// SHCSR
    const SHCSR_val = packed struct {
        /// MEMFAULTACT [0:0]
        /// Memory management fault exception active
        MEMFAULTACT: u1 = 0,
        /// BUSFAULTACT [1:1]
        /// Bus fault exception active
        BUSFAULTACT: u1 = 0,
        /// unused [2:2]
        _unused2: u1 = 0,
        /// USGFAULTACT [3:3]
        /// Usage fault exception active
        USGFAULTACT: u1 = 0,
        /// unused [4:6]
        _unused4: u3 = 0,
        /// SVCALLACT [7:7]
        /// SVC call active bit
        SVCALLACT: u1 = 0,
        /// MONITORACT [8:8]
        /// Debug monitor active bit
        MONITORACT: u1 = 0,
        /// unused [9:9]
        _unused9: u1 = 0,
        /// PENDSVACT [10:10]
        /// PendSV exception active
        PENDSVACT: u1 = 0,
        /// SYSTICKACT [11:11]
        /// SysTick exception active
        SYSTICKACT: u1 = 0,
        /// USGFAULTPENDED [12:12]
        /// Usage fault exception pending
        USGFAULTPENDED: u1 = 0,
        /// MEMFAULTPENDED [13:13]
        /// Memory management fault exception
        MEMFAULTPENDED: u1 = 0,
        /// BUSFAULTPENDED [14:14]
        /// Bus fault exception pending
        BUSFAULTPENDED: u1 = 0,
        /// SVCALLPENDED [15:15]
        /// SVC call pending bit
        SVCALLPENDED: u1 = 0,
        /// MEMFAULTENA [16:16]
        /// Memory management fault enable
        MEMFAULTENA: u1 = 0,
        /// BUSFAULTENA [17:17]
        /// Bus fault enable bit
        BUSFAULTENA: u1 = 0,
        /// USGFAULTENA [18:18]
        /// Usage fault enable bit
        USGFAULTENA: u1 = 0,
        /// unused [19:31]
        _unused19: u5 = 0,
        _unused24: u8 = 0,
    };
    /// System handler control and state
    pub const SHCSR = rh.Register(SHCSR_val).init(base_address + 0x24);

    /// CFSR_UFSR_BFSR_MMFSR
    const CFSR_UFSR_BFSR_MMFSR_val = packed struct {
        /// unused [0:0]
        _unused0: u1 = 0,
        /// IACCVIOL [1:1]
        /// Instruction access violation
        IACCVIOL: u1 = 0,
        /// unused [2:2]
        _unused2: u1 = 0,
        /// MUNSTKERR [3:3]
        /// Memory manager fault on unstacking for a
        MUNSTKERR: u1 = 0,
        /// MSTKERR [4:4]
        /// Memory manager fault on stacking for
        MSTKERR: u1 = 0,
        /// MLSPERR [5:5]
        /// MLSPERR
        MLSPERR: u1 = 0,
        /// unused [6:6]
        _unused6: u1 = 0,
        /// MMARVALID [7:7]
        /// Memory Management Fault Address rh.Register
        MMARVALID: u1 = 0,
        /// IBUSERR [8:8]
        /// Instruction bus error
        IBUSERR: u1 = 0,
        /// PRECISERR [9:9]
        /// Precise data bus error
        PRECISERR: u1 = 0,
        /// IMPRECISERR [10:10]
        /// Imprecise data bus error
        IMPRECISERR: u1 = 0,
        /// UNSTKERR [11:11]
        /// Bus fault on unstacking for a return
        UNSTKERR: u1 = 0,
        /// STKERR [12:12]
        /// Bus fault on stacking for exception
        STKERR: u1 = 0,
        /// LSPERR [13:13]
        /// Bus fault on floating-point lazy state
        LSPERR: u1 = 0,
        /// unused [14:14]
        _unused14: u1 = 0,
        /// BFARVALID [15:15]
        /// Bus Fault Address rh.Register (BFAR) valid
        BFARVALID: u1 = 0,
        /// UNDEFINSTR [16:16]
        /// Undefined instruction usage
        UNDEFINSTR: u1 = 0,
        /// INVSTATE [17:17]
        /// Invalid state usage fault
        INVSTATE: u1 = 0,
        /// INVPC [18:18]
        /// Invalid PC load usage
        INVPC: u1 = 0,
        /// NOCP [19:19]
        /// No coprocessor usage
        NOCP: u1 = 0,
        /// unused [20:23]
        _unused20: u4 = 0,
        /// UNALIGNED [24:24]
        /// Unaligned access usage
        UNALIGNED: u1 = 0,
        /// DIVBYZERO [25:25]
        /// Divide by zero usage fault
        DIVBYZERO: u1 = 0,
        /// unused [26:31]
        _unused26: u6 = 0,
    };
    /// Configurable fault status
    pub const CFSR_UFSR_BFSR_MMFSR = rh.Register(CFSR_UFSR_BFSR_MMFSR_val).init(base_address + 0x28);

    /// HFSR
    const HFSR_val = packed struct {
        /// unused [0:0]
        _unused0: u1 = 0,
        /// VECTTBL [1:1]
        /// Vector table hard fault
        VECTTBL: u1 = 0,
        /// unused [2:29]
        _unused2: u6 = 0,
        _unused8: u8 = 0,
        _unused16: u8 = 0,
        _unused24: u6 = 0,
        /// FORCED [30:30]
        /// Forced hard fault
        FORCED: u1 = 0,
        /// DEBUG_VT [31:31]
        /// Reserved for Debug use
        DEBUG_VT: u1 = 0,
    };
    /// Hard fault status register
    pub const HFSR = rh.Register(HFSR_val).init(base_address + 0x2c);

    /// MMFAR
    const MMFAR_val = packed struct {
        /// MMFAR [0:31]
        /// Memory management fault
        MMFAR: u32 = 0,
    };
    /// Memory management fault address
    pub const MMFAR = rh.Register(MMFAR_val).init(base_address + 0x34);

    /// BFAR
    const BFAR_val = packed struct {
        /// BFAR [0:31]
        /// Bus fault address
        BFAR: u32 = 0,
    };
    /// Bus fault address register
    pub const BFAR = rh.Register(BFAR_val).init(base_address + 0x38);

    /// AFSR
    const AFSR_val = packed struct {
        /// IMPDEF [0:31]
        /// Implementation defined
        IMPDEF: u32 = 0,
    };
    /// Auxiliary fault status
    pub const AFSR = rh.Register(AFSR_val).init(base_address + 0x3c);
};

/// config interrupt priority of irq_id (which is exception number)
/// attention: can only hande [..15]
pub fn set_irq_priority(ird_id: u8, priority_value: u8) !void {
    const cii = constants.IrqId;

    switch (ird_id) {
        cii.MemManageFault => {
            SCB.SHPR1.modify(.{ .PRI_4 = priority_value });
        },
        cii.BusFault => {
            SCB.SHPR1.modify(.{ .PRI_5 = priority_value });
        },
        cii.UsageFault => {
            SCB.SHPR1.modify(.{ .PRI_6 = priority_value });
        },
        cii.SVCall => {
            SCB.SHPR2.modify(.{ .PRI_11 = priority_value });
        },
        cii.PendSV => {
            SCB.SHPR3.modify(.{ .PRI_14 = priority_value });
        },
        cii.SysTick => {
            SCB.SHPR3.modify(.{ .PRI_15 = priority_value });
        },

        // ignore others
        else => {
            return error.Failure;
        },
    }
}

/// enable interrupt of irq_id (which is exception number)
/// attention: can only hande [..15]
pub fn enable_irq(irq_id: u8) !void {
    try _switch_irq(irq_id, true);
}

/// disable interrupt of irq_id (which is exception number)
/// attention: can only hande [..15]
pub fn disable_irq(irq_id: u8) !void {
    try _switch_irq(irq_id, false);
}

fn _switch_irq(irq_id: u8, enable: bool) !void {
    const cii = constants.IrqId;

    var val = @intFromBool(enable);

    switch (irq_id) {
        cii.UsageFault => {
            SCB.SHCSR.modify(.{ .USGFAULTENA = val });
        },
        cii.BusFault => {
            SCB.SHCSR.modify(.{ .BUSFAULTENA = val });
        },
        cii.MemManageFault => {
            SCB.SHCSR.modify(.{ .MEMFAULTENA = val });
        },
        // ignore others
        else => {
            return error.Failure;
        },
    }
}

pub inline fn get_current_executing_irqid() u8 {
    var sta = SCB.ICSR.read();

    return @as(u8, @truncate(sta.VECTACTIVE));
}
