const rh = @import("register_helper.zig");

/// Common ADC registers
pub const C_ADC = struct {
    const base_address = 0x40012300;
    /// CSR
    const CSR_val = packed struct {
        /// AWD1 [0:0]
        /// Analog watchdog flag of ADC
        AWD1: u1 = 0,
        /// EOC1 [1:1]
        /// End of conversion of ADC 1
        EOC1: u1 = 0,
        /// JEOC1 [2:2]
        /// Injected channel end of conversion of
        JEOC1: u1 = 0,
        /// JSTRT1 [3:3]
        /// Injected channel Start flag of ADC
        JSTRT1: u1 = 0,
        /// STRT1 [4:4]
        /// Regular channel Start flag of ADC
        STRT1: u1 = 0,
        /// OVR1 [5:5]
        /// Overrun flag of ADC 1
        OVR1: u1 = 0,
        /// unused [6:7]
        _unused6: u2 = 0,
        /// AWD2 [8:8]
        /// Analog watchdog flag of ADC
        AWD2: u1 = 0,
        /// EOC2 [9:9]
        /// End of conversion of ADC 2
        EOC2: u1 = 0,
        /// JEOC2 [10:10]
        /// Injected channel end of conversion of
        JEOC2: u1 = 0,
        /// JSTRT2 [11:11]
        /// Injected channel Start flag of ADC
        JSTRT2: u1 = 0,
        /// STRT2 [12:12]
        /// Regular channel Start flag of ADC
        STRT2: u1 = 0,
        /// OVR2 [13:13]
        /// Overrun flag of ADC 2
        OVR2: u1 = 0,
        /// unused [14:15]
        _unused14: u2 = 0,
        /// AWD3 [16:16]
        /// Analog watchdog flag of ADC
        AWD3: u1 = 0,
        /// EOC3 [17:17]
        /// End of conversion of ADC 3
        EOC3: u1 = 0,
        /// JEOC3 [18:18]
        /// Injected channel end of conversion of
        JEOC3: u1 = 0,
        /// JSTRT3 [19:19]
        /// Injected channel Start flag of ADC
        JSTRT3: u1 = 0,
        /// STRT3 [20:20]
        /// Regular channel Start flag of ADC
        STRT3: u1 = 0,
        /// OVR3 [21:21]
        /// Overrun flag of ADC3
        OVR3: u1 = 0,
        /// unused [22:31]
        _unused22: u2 = 0,
        _unused24: u8 = 0,
    };
    /// ADC Common status register
    pub const CSR = rh.Register(CSR_val).init(base_address + 0x0);

    /// CCR
    const CCR_val = packed struct {
        /// MULT [0:4]
        /// Multi ADC mode selection
        MULT: u5 = 0,
        /// unused [5:7]
        _unused5: u3 = 0,
        /// DELAY [8:11]
        /// Delay between 2 sampling
        DELAY: u4 = 0,
        /// unused [12:12]
        _unused12: u1 = 0,
        /// DDS [13:13]
        /// DMA disable selection for multi-ADC
        DDS: u1 = 0,
        /// DMA [14:15]
        /// Direct memory access mode for multi ADC
        DMA: u2 = 0,
        /// ADCPRE [16:17]
        /// ADC prescaler
        ADCPRE: u2 = 0,
        /// unused [18:21]
        _unused18: u4 = 0,
        /// VBATE [22:22]
        /// VBAT enable
        VBATE: u1 = 0,
        /// TSVREFE [23:23]
        /// Temperature sensor and VREFINT
        TSVREFE: u1 = 0,
        /// unused [24:31]
        _unused24: u8 = 0,
    };
    /// ADC common control register
    pub const CCR = rh.Register(CCR_val).init(base_address + 0x4);

    /// CDR
    const CDR_val = packed struct {
        /// DATA1 [0:15]
        /// 1st data item of a pair of regular
        DATA1: u16 = 0,
        /// DATA2 [16:31]
        /// 2nd data item of a pair of regular
        DATA2: u16 = 0,
    };
    /// ADC common regular data register for dual
    pub const CDR = rh.Register(CDR_val).init(base_address + 0x8);
};

/// Analog-to-digital converter
pub const ADCx = struct {
    SR: rh.Register(SR_val),
    CR1: rh.Register(CR1_val),
    CR2: rh.Register(CR2_val),
    SMPR1: rh.Register(SMPR1_val),
    SMPR2: rh.Register(SMPR2_val),
    JOFR1: rh.Register(JOFR1_val),
    JOFR2: rh.Register(JOFR2_val),
    JOFR3: rh.Register(JOFR3_val),
    JOFR4: rh.Register(JOFR4_val),
    HTR: rh.Register(HTR_val),
    LTR: rh.Register(LTR_val),
    SQR1: rh.Register(SQR1_val),
    SQR2: rh.Register(SQR2_val),
    SQR3: rh.Register(SQR3_val),
    JSQR: rh.Register(JSQR_val),
    JDR1: rh.Register(JDR1_val),
    JDR2: rh.Register(JDR2_val),
    JDR3: rh.Register(JDR3_val),
    JDR4: rh.Register(JDR4_val),
    DR: rh.Register(DR_val),

    const Self = @This();

    pub fn init(comptime base_addr: u32) Self {
        return Self{
            .SR = rh.Register(SR_val).init(base_addr + 0x00),
            .CR1 = rh.Register(CR1_val).init(base_addr + 0x04),
            .CR2 = rh.Register(CR2_val).init(base_addr + 0x08),
            .SMPR1 = rh.Register(SMPR1_val).init(base_addr + 0x0C),
            .SMPR2 = rh.Register(SMPR2_val).init(base_addr + 0x10),
            .JOFR1 = rh.Register(JOFR1_val).init(base_addr + 0x14),
            .JOFR2 = rh.Register(JOFR2_val).init(base_addr + 0x18),
            .JOFR3 = rh.Register(JOFR3_val).init(base_addr + 0x1C),
            .JOFR4 = rh.Register(JOFR4_val).init(base_addr + 0x20),
            .HTR = rh.Register(HTR_val).init(base_addr + 0x24),
            .LTR = rh.Register(LTR_val).init(base_addr + 0x28),
            .SQR1 = rh.Register(SQR1_val).init(base_addr + 0x2C),
            .SQR2 = rh.Register(SQR2_val).init(base_addr + 0x30),
            .SQR3 = rh.Register(SQR3_val).init(base_addr + 0x34),
            .JSQR = rh.Register(JSQR_val).init(base_addr + 0x38),
            .JDR1 = rh.Register(JDR1_val).init(base_addr + 0x3C),
            .JDR2 = rh.Register(JDR2_val).init(base_addr + 0x40),
            .JDR3 = rh.Register(JDR3_val).init(base_addr + 0x44),
            .JDR4 = rh.Register(JDR4_val).init(base_addr + 0x48),
            .DR = rh.Register(DR_val).init(base_addr + 0x4C),
        };
    }

    /// SR status register
    const SR_val = packed struct {
        /// AWD [0:0]
        /// Analog watchdog flag
        AWD: u1 = 0,
        /// EOC [1:1]
        /// Regular channel end of
        EOC: u1 = 0,
        /// JEOC [2:2]
        /// Injected channel end of
        JEOC: u1 = 0,
        /// JSTRT [3:3]
        /// Injected channel start
        JSTRT: u1 = 0,
        /// STRT [4:4]
        /// Regular channel start flag
        STRT: u1 = 0,
        /// OVR [5:5]
        /// Overrun
        OVR: u1 = 0,
        /// unused [6:31]
        _unused6: u2 = 0,
        _unused8: u8 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// CR1 control register 1
    const CR1_val = packed struct {
        /// AWDCH [0:4]
        /// Analog watchdog channel select
        AWDCH: u5 = 0,
        /// EOCIE [5:5]
        /// Interrupt enable for EOC
        EOCIE: u1 = 0,
        /// AWDIE [6:6]
        /// Analog watchdog interrupt
        AWDIE: u1 = 0,
        /// JEOCIE [7:7]
        /// Interrupt enable for injected
        JEOCIE: u1 = 0,
        /// SCAN [8:8]
        /// Scan mode
        SCAN: u1 = 0,
        /// AWDSGL [9:9]
        /// Enable the watchdog on a single channel
        AWDSGL: u1 = 0,
        /// JAUTO [10:10]
        /// Automatic injected group
        JAUTO: u1 = 0,
        /// DISCEN [11:11]
        /// Discontinuous mode on regular
        DISCEN: u1 = 0,
        /// JDISCEN [12:12]
        /// Discontinuous mode on injected
        JDISCEN: u1 = 0,
        /// DISCNUM [13:15]
        /// Discontinuous mode channel
        DISCNUM: u3 = 0,
        /// unused [16:21]
        _unused16: u6 = 0,
        /// JAWDEN [22:22]
        /// Analog watchdog enable on injected
        JAWDEN: u1 = 0,
        /// AWDEN [23:23]
        /// Analog watchdog enable on regular
        AWDEN: u1 = 0,
        /// RES [24:25]
        /// Resolution
        RES: u2 = 0,
        /// OVRIE [26:26]
        /// Overrun interrupt enable
        OVRIE: u1 = 0,
        /// unused [27:31]
        _unused27: u5 = 0,
    };

    /// CR2 control register 2
    const CR2_val = packed struct {
        /// ADON [0:0]
        /// A/D Converter ON / OFF
        ADON: u1 = 0,
        /// CONT [1:1]
        /// Continuous conversion
        CONT: u1 = 0,
        /// unused [2:7]
        _unused2: u6 = 0,
        /// DMA [8:8]
        /// Direct memory access mode (for single
        DMA: u1 = 0,
        /// DDS [9:9]
        /// DMA disable selection (for single ADC
        DDS: u1 = 0,
        /// EOCS [10:10]
        /// End of conversion
        EOCS: u1 = 0,
        /// ALIGN [11:11]
        /// Data alignment
        ALIGN: u1 = 0,
        /// unused [12:15]
        _unused12: u4 = 0,
        /// JEXTSEL [16:19]
        /// External event select for injected
        JEXTSEL: u4 = 0,
        /// JEXTEN [20:21]
        /// External trigger enable for injected
        JEXTEN: u2 = 0,
        /// JSWSTART [22:22]
        /// Start conversion of injected
        JSWSTART: u1 = 0,
        /// unused [23:23]
        _unused23: u1 = 0,
        /// EXTSEL [24:27]
        /// External event select for regular
        EXTSEL: u4 = 0,
        /// EXTEN [28:29]
        /// External trigger enable for regular
        EXTEN: u2 = 0,
        /// SWSTART [30:30]
        /// Start conversion of regular
        SWSTART: u1 = 0,
        /// unused [31:31]
        _unused31: u1 = 0,
    };

    /// SMPR1 sample time register 1
    const SMPR1_val = packed struct {
        /// SMPx_x [0:31]
        /// Sample time bits
        SMPx_x: u32 = 0,
    };

    /// SMPR2 sample time register 2
    const SMPR2_val = packed struct {
        /// SMPx_x [0:31]
        /// Sample time bits
        SMPx_x: u32 = 0,
    };

    /// JOFR1 injected channel data offset register
    const JOFR1_val = packed struct {
        /// JOFFSET1 [0:11]
        /// Data offset for injected channel
        JOFFSET1: u12 = 0,
        /// unused [12:31]
        _unused12: u4 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// JOFR2 injected channel data offset register
    const JOFR2_val = packed struct {
        /// JOFFSET2 [0:11]
        /// Data offset for injected channel
        JOFFSET2: u12 = 0,
        /// unused [12:31]
        _unused12: u4 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// JOFR3 injected channel data offset register
    const JOFR3_val = packed struct {
        /// JOFFSET3 [0:11]
        /// Data offset for injected channel
        JOFFSET3: u12 = 0,
        /// unused [12:31]
        _unused12: u4 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// JOFR4 injected channel data offset register
    const JOFR4_val = packed struct {
        /// JOFFSET4 [0:11]
        /// Data offset for injected channel
        JOFFSET4: u12 = 0,
        /// unused [12:31]
        _unused12: u4 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// HTR watchdog higher threshold
    const HTR_val = packed struct {
        /// HT [0:11]
        /// Analog watchdog higher
        HT: u12 = 4095,
        /// unused [12:31]
        _unused12: u4 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// LTR watchdog lower threshold
    const LTR_val = packed struct {
        /// LT [0:11]
        /// Analog watchdog lower
        LT: u12 = 0,
        /// unused [12:31]
        _unused12: u4 = 0,
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// SQR1 regular sequence register 1
    const SQR1_val = packed struct {
        /// SQ13 [0:4]
        /// 13th conversion in regular
        SQ13: u5 = 0,
        /// SQ14 [5:9]
        /// 14th conversion in regular
        SQ14: u5 = 0,
        /// SQ15 [10:14]
        /// 15th conversion in regular
        SQ15: u5 = 0,
        /// SQ16 [15:19]
        /// 16th conversion in regular
        SQ16: u5 = 0,
        /// L [20:23]
        /// Regular channel sequence
        L: u4 = 0,
        /// unused [24:31]
        _unused24: u8 = 0,
    };

    /// SQR2 regular sequence register 2
    const SQR2_val = packed struct {
        /// SQ7 [0:4]
        /// 7th conversion in regular
        SQ7: u5 = 0,
        /// SQ8 [5:9]
        /// 8th conversion in regular
        SQ8: u5 = 0,
        /// SQ9 [10:14]
        /// 9th conversion in regular
        SQ9: u5 = 0,
        /// SQ10 [15:19]
        /// 10th conversion in regular
        SQ10: u5 = 0,
        /// SQ11 [20:24]
        /// 11th conversion in regular
        SQ11: u5 = 0,
        /// SQ12 [25:29]
        /// 12th conversion in regular
        SQ12: u5 = 0,
        /// unused [30:31]
        _unused30: u2 = 0,
    };

    /// SQR3 regular sequence register 3
    const SQR3_val = packed struct {
        /// SQ1 [0:4]
        /// 1st conversion in regular
        SQ1: u5 = 0,
        /// SQ2 [5:9]
        /// 2nd conversion in regular
        SQ2: u5 = 0,
        /// SQ3 [10:14]
        /// 3rd conversion in regular
        SQ3: u5 = 0,
        /// SQ4 [15:19]
        /// 4th conversion in regular
        SQ4: u5 = 0,
        /// SQ5 [20:24]
        /// 5th conversion in regular
        SQ5: u5 = 0,
        /// SQ6 [25:29]
        /// 6th conversion in regular
        SQ6: u5 = 0,
        /// unused [30:31]
        _unused30: u2 = 0,
    };

    /// JSQR injected sequence register
    const JSQR_val = packed struct {
        /// JSQ1 [0:4]
        /// 1st conversion in injected
        JSQ1: u5 = 0,
        /// JSQ2 [5:9]
        /// 2nd conversion in injected
        JSQ2: u5 = 0,
        /// JSQ3 [10:14]
        /// 3rd conversion in injected
        JSQ3: u5 = 0,
        /// JSQ4 [15:19]
        /// 4th conversion in injected
        JSQ4: u5 = 0,
        /// JL [20:21]
        /// Injected sequence length
        JL: u2 = 0,
        /// unused [22:31]
        _unused22: u2 = 0,
        _unused24: u8 = 0,
    };

    /// JDR1 injected data register x
    const JDR1_val = packed struct {
        /// JDATA [0:15]
        /// Injected data
        JDATA: u16 = 0,
        /// unused [16:31]
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// JDR2 injected data register x
    const JDR2_val = packed struct {
        /// JDATA [0:15]
        /// Injected data
        JDATA: u16 = 0,
        /// unused [16:31]
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// JDR3 injected data register x
    const JDR3_val = packed struct {
        /// JDATA [0:15]
        /// Injected data
        JDATA: u16 = 0,
        /// unused [16:31]
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// JDR4 injected data register x
    const JDR4_val = packed struct {
        /// JDATA [0:15]
        /// Injected data
        JDATA: u16 = 0,
        /// unused [16:31]
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };

    /// DR regular data register
    const DR_val = packed struct {
        /// DATA [0:15]
        /// Regular data
        DATA: u16 = 0,
        /// unused [16:31]
        _unused16: u8 = 0,
        _unused24: u8 = 0,
    };
};

pub const ADC1 = ADCx.init(0x40012000);
pub const ADC2 = ADCx.init(0x40012100);
pub const ADC3 = ADCx.init(0x40012200);
