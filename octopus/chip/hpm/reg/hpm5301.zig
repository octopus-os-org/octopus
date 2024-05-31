const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    ///  HPM5300 device
    pub const HPM5301 = struct {
        pub const properties = struct {
            pub const @"cpu.endian" = "little";
            pub const @"cpu.mpuPresent" = "false";
            pub const license =
                \\
                \\    /*
                \\ * Copyright (c) 2021-2023 HPMicro
                \\ *
                \\ * SPDX-License-Identifier: BSD-3-Clause
                \\ *
                \\ */
                \\
                \\  
            ;
            pub const @"cpu.name" = "other";
            pub const @"cpu.revision" = "r0p0";
            pub const @"cpu.nvicPrioBits" = "7";
            pub const @"cpu.vendorSystickConfig" = "false";
            pub const @"cpu.fpuPresent" = "true";
            pub const @"cpu.vtorPresent" = "true";
        };

        pub const peripherals = struct {
            ///  FGPIO
            pub const FGPIO = @as(*volatile types.peripherals.FGPIO, @ptrFromInt(0xc0000));
            ///  PLIC
            pub const PLIC = @as(*volatile types.peripherals.PLIC, @ptrFromInt(0xe4000000));
            ///  MCHTMR
            pub const MCHTMR = @as(*volatile types.peripherals.MCHTMR, @ptrFromInt(0xe6000000));
            ///  PLICSW
            pub const PLICSW = @as(*volatile types.peripherals.PLICSW, @ptrFromInt(0xe6400000));
            ///  GPTMR0
            pub const GPTMR0 = @as(*volatile types.peripherals.GPTMR0, @ptrFromInt(0xf0000000));
            ///  GPTMR1
            pub const GPTMR1 = @as(*volatile types.peripherals.GPTMR0, @ptrFromInt(0xf0004000));
            ///  UART0
            pub const UART0 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0xf0040000));
            ///  UART1
            pub const UART1 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0xf0044000));
            ///  UART2
            pub const UART2 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0xf0048000));
            ///  UART3
            pub const UART3 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0xf004c000));
            ///  I2C0
            pub const I2C0 = @as(*volatile types.peripherals.I2C0, @ptrFromInt(0xf0060000));
            ///  I2C1
            pub const I2C1 = @as(*volatile types.peripherals.I2C0, @ptrFromInt(0xf0064000));
            ///  I2C2
            pub const I2C2 = @as(*volatile types.peripherals.I2C0, @ptrFromInt(0xf0068000));
            ///  I2C3
            pub const I2C3 = @as(*volatile types.peripherals.I2C0, @ptrFromInt(0xf006c000));
            ///  SPI0
            pub const SPI0 = @as(*volatile types.peripherals.SPI0, @ptrFromInt(0xf0070000));
            ///  SPI1
            pub const SPI1 = @as(*volatile types.peripherals.SPI0, @ptrFromInt(0xf0074000));
            ///  SPI2
            pub const SPI2 = @as(*volatile types.peripherals.SPI0, @ptrFromInt(0xf0078000));
            ///  SPI3
            pub const SPI3 = @as(*volatile types.peripherals.SPI0, @ptrFromInt(0xf007c000));
            ///  CRC
            pub const CRC = @as(*volatile types.peripherals.CRC, @ptrFromInt(0xf0080000));
            ///  TSNS
            pub const TSNS = @as(*volatile types.peripherals.TSNS, @ptrFromInt(0xf0090000));
            ///  MBX0A
            pub const MBX0A = @as(*volatile types.peripherals.MBX0A, @ptrFromInt(0xf00a0000));
            ///  MBX0B
            pub const MBX0B = @as(*volatile types.peripherals.MBX0A, @ptrFromInt(0xf00a4000));
            ///  WDG0
            pub const WDG0 = @as(*volatile types.peripherals.WDG0, @ptrFromInt(0xf00b0000));
            ///  WDG1
            pub const WDG1 = @as(*volatile types.peripherals.WDG0, @ptrFromInt(0xf00b4000));
            ///  DMAMUX
            pub const DMAMUX = @as(*volatile types.peripherals.DMAMUX, @ptrFromInt(0xf00c4000));
            ///  HDMA
            pub const HDMA = @as(*volatile types.peripherals.HDMA, @ptrFromInt(0xf00c8000));
            ///  GPIO0
            pub const GPIO0 = @as(*volatile types.peripherals.FGPIO, @ptrFromInt(0xf00d0000));
            ///  GPIOM
            pub const GPIOM = @as(*volatile types.peripherals.GPIOM, @ptrFromInt(0xf00d8000));
            ///  PTPC
            pub const PTPC = @as(*volatile types.peripherals.PTPC, @ptrFromInt(0xf02fc000));
            ///  PLB
            pub const PLB = @as(*volatile types.peripherals.PLB, @ptrFromInt(0xf0324000));
            ///  SYNT
            pub const SYNT = @as(*volatile types.peripherals.SYNT, @ptrFromInt(0xf0328000));
            ///  TRGM0
            pub const TRGM0 = @as(*volatile types.peripherals.TRGM0, @ptrFromInt(0xf033c000));
            ///  USB0
            pub const USB0 = @as(*volatile types.peripherals.USB0, @ptrFromInt(0xf300c000));
            ///  SDP
            pub const SDP = @as(*volatile types.peripherals.SDP, @ptrFromInt(0xf3040000));
            ///  SEC
            pub const SEC = @as(*volatile types.peripherals.SEC, @ptrFromInt(0xf3044000));
            ///  MON
            pub const MON = @as(*volatile types.peripherals.MON, @ptrFromInt(0xf3048000));
            ///  RNG
            pub const RNG = @as(*volatile types.peripherals.RNG, @ptrFromInt(0xf304c000));
            ///  OTP
            pub const OTP = @as(*volatile types.peripherals.OTP, @ptrFromInt(0xf3050000));
            ///  KEYM
            pub const KEYM = @as(*volatile types.peripherals.KEYM, @ptrFromInt(0xf3054000));
            ///  ADC0
            pub const ADC0 = @as(*volatile types.peripherals.ADC0, @ptrFromInt(0xf3080000));
            ///  ACMP
            pub const ACMP = @as(*volatile types.peripherals.ACMP, @ptrFromInt(0xf30b0000));
            ///  SYSCTL
            pub const SYSCTL = @as(*volatile types.peripherals.SYSCTL, @ptrFromInt(0xf4000000));
            ///  IOC
            pub const IOC = @as(*volatile types.peripherals.IOC, @ptrFromInt(0xf4040000));
            ///  PLLCTLV2
            pub const PLLCTLV2 = @as(*volatile types.peripherals.PLLCTLV2, @ptrFromInt(0xf40c0000));
            ///  PPOR
            pub const PPOR = @as(*volatile types.peripherals.PPOR, @ptrFromInt(0xf4100000));
            ///  PCFG
            pub const PCFG = @as(*volatile types.peripherals.PCFG, @ptrFromInt(0xf4104000));
            ///  PGPR0
            pub const PGPR0 = @as(*volatile types.peripherals.PGPR0, @ptrFromInt(0xf4110000));
            ///  PGPR1
            pub const PGPR1 = @as(*volatile types.peripherals.PGPR0, @ptrFromInt(0xf4114000));
            ///  PIOC
            pub const PIOC = @as(*volatile types.peripherals.IOC, @ptrFromInt(0xf4118000));
            ///  PGPIO
            pub const PGPIO = @as(*volatile types.peripherals.FGPIO, @ptrFromInt(0xf411c000));
            ///  PTMR
            pub const PTMR = @as(*volatile types.peripherals.GPTMR0, @ptrFromInt(0xf4120000));
            ///  PUART
            pub const PUART = @as(*volatile types.peripherals.UART0, @ptrFromInt(0xf4124000));
            ///  PWDG
            pub const PWDG = @as(*volatile types.peripherals.WDG0, @ptrFromInt(0xf4128000));
            ///  PDGO
            pub const PDGO = @as(*volatile types.peripherals.PDGO, @ptrFromInt(0xf4134000));
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  FGPIO
        pub const FGPIO = struct {};

        ///  PDGO
        pub const PDGO = extern struct {
            ///  trunoff control
            DGO_TURNOFF: mmio.Mmio(packed struct(u32) {
                ///  trunoff counter, counter stops when it counts down to 0, the trunoff occurs when the counter value is 1.
                COUNTER: u32,
            }),
            ///  RC32K CLOCK
            DGO_RC32K_CFG: mmio.Mmio(packed struct(u32) {
                ///  capacitor trim bits
                CAP_TRIM: u9,
                reserved22: u13,
                ///  IRC32K bit 6
                CAPEX6_TRIM: u1,
                ///  IRC32K bit 7
                CAPEX7_TRIM: u1,
                reserved31: u7,
                ///  IRC32K trim happened, this bit set by hardware after trim value loaded, and stop load, write 0 will clear this bit and reload trim value 0: irc is not trimmed 1: irc is trimmed
                IRC_TRIMMED: u1,
            }),
            reserved1536: [1528]u8,
            ///  Generic control 0
            DGO_GPR00: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control 1
            DGO_GPR01: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control 2
            DGO_GPR02: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control 3
            DGO_GPR03: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            reserved1792: [240]u8,
            ///  control register 0
            DGO_CTR0: mmio.Mmio(packed struct(u32) {
                reserved16: u16,
                ///  dgo register status retenion
                RETENTION: u1,
                padding: u15,
            }),
            ///  control register 1
            DGO_CTR1: mmio.Mmio(packed struct(u32) {
                ///  wakeup pin status
                PIN_WAKEUP_STATUS: u1,
                reserved16: u15,
                ///  permit wakeup pin or software wakeup
                WAKEUP_EN: u1,
                reserved31: u14,
                ///  software wakeup： 0 : wakeup once； 1：auto wakeup Continuously
                AOTO_SYS_WAKEUP: u1,
            }),
            ///  control register 2
            DGO_CTR2: mmio.Mmio(packed struct(u32) {
                reserved16: u16,
                ///  wakeup pin pull down disable
                WAKEUP_PULLDN_DISABLE: u1,
                reserved24: u7,
                ///  resetn pin pull up disable
                RESETN_PULLUP_DISABLE: u1,
                padding: u7,
            }),
            ///  control register 3
            DGO_CTR3: mmio.Mmio(packed struct(u32) {
                ///  software wakeup counter
                WAKEUP_COUNTER: u32,
            }),
            ///  control register 4
            DGO_CTR4: mmio.Mmio(packed struct(u32) {
                ///  Banggap work in low power mode, banggap function limited 0: banggap works in normal mode 1: banggap works in low power mode
                BANDGAP_LP_MODE: u1,
                ///  Banggap work in power save mode, banggap function normally 0: banggap works in high performance mode 1: banggap works in power saving mode
                BANDGAP_LESS_POWER: u1,
                padding: u30,
            }),
        };

        ///  TRGM0
        pub const TRGM0 = extern struct {
            reserved1280: [1280]u8,
            ///  General Control Register
            GCR: mmio.Mmio(packed struct(u32) {
                ///  The bitfield enable the TRGM outputs.
                TRGOPEN: u8,
                padding: u24,
            }),
            reserved1296: [12]u8,
            ///  adc matrix select register
            ADC_MATRIX_SEL: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                QEI0_ADC0_SEL: u8,
                ///  No description avaiable
                QEI0_ADC1_SEL: u8,
                ///  No description avaiable
                QEI1_ADC0_SEL: u8,
                ///  0-adc0; 1-adc1; 2-rdc_adc0; 3-rdc_adc1; bit7 is used to invert adc_value; others reserved
                QEI1_ADC1_SEL: u8,
            }),
            ///  dac matrix select register
            DAC_MATRIX_SEL: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                ACMP0_DAC_SEL: u8,
                ///  No description avaiable
                ACMP1_DAC_SEL: u8,
                ///  No description avaiable
                DAC0_DAC_SEL: u8,
                ///  0-qeo0_dac0; 1-qeo0_dac1; 2-qeo0_dac2; 3-qeo1_dac0; 4-qeo1_dac1; 5-qeo1_dac2; 6-rdc_dac0; 7-rdc_dac1; bit7 is used to invert dac_value; others reserved
                DAC1_DAC_SEL: u8,
            }),
            ///  position matrix select register0
            POS_MATRIX_SEL0: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                SEI_POSIN0_SEL: u8,
                ///  No description avaiable
                SEI_POSIN1_SEL: u8,
                ///  No description avaiable
                MMC0_POSIN_SEL: u8,
                ///  0-sei_pos_out0; 1-sei_pos_out1; 2-qei0_pos; 3-qei1_pos; 4-mmc0_pos_out0; 5-mmc0_pos_out1; 6-mmc1_pos_out0; 7-mmc1_pos_out1; bit7 is used to invert position value; others reserved
                MMC1_POSIN_SEL: u8,
            }),
            ///  position matrix select register1
            POS_MATRIX_SEL1: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                QEO0_POS_SEL: u8,
                ///  No description avaiable
                QEO1_POS_SEL: u8,
                padding: u16,
            }),
        };

        ///  PLIC
        pub const PLIC = extern struct {
            ///  Feature enable register
            feature: mmio.Mmio(packed struct(u32) {
                ///  Preemptive priority interrupt enable 0: Disabled 1: Enabled
                PREEMPT: u1,
                ///  Vector mode enable 0: Disabled 1: Enabled
                VECTORED: u1,
                padding: u30,
            }),
            reserved4352: [4348]u8,
            ///  Number of supported interrupt sources and targets
            NUMBER: mmio.Mmio(packed struct(u32) {
                ///  The number of supported interrupt sources
                NUM_INTERRUPT: u16,
                ///  The number of supported targets
                NUM_TARGET: u16,
            }),
            ///  Version and the maximum priority
            INFO: mmio.Mmio(packed struct(u32) {
                ///  The version of the PLIC design
                VERSION: u16,
                ///  The maximum priority supported
                MAX_PRIORITY: u16,
            }),
        };

        ///  MCHTMR
        pub const MCHTMR = extern struct {
            ///  Machine Time
            MTIME: mmio.Mmio(packed struct(u64) {
                ///  Machine time
                MTIME: u64,
            }),
            ///  Machine Time Compare
            MTIMECMP: mmio.Mmio(packed struct(u64) {
                ///  Machine time compare
                MTIMECMP: u64,
            }),
        };

        ///  PLICSW
        pub const PLICSW = extern struct {
            reserved4096: [4096]u8,
            ///  Pending status
            PENDING: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  writing 1 to trigger software interrupt
                INTERRUPT: u1,
                padding: u30,
            }),
            reserved8192: [4092]u8,
            ///  Interrupt enable
            INTEN: mmio.Mmio(packed struct(u32) {
                ///  enable software interrupt
                INTERRUPT: u1,
                padding: u31,
            }),
            reserved2097156: [2088960]u8,
            ///  Claim and complete.
            CLAIM: mmio.Mmio(packed struct(u32) {
                ///  On reads, indicating the interrupt source that has being claimed. On writes, indicating the interrupt source that has been handled (completed).
                INTERRUPT_ID: u1,
                padding: u31,
            }),
        };

        ///  GPTMR0
        pub const GPTMR0 = extern struct {
            reserved512: [512]u8,
            ///  Status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  channel 1 counter reload flag
                CH0RLDF: u1,
                ///  channel 1 capture flag, the flag will be set at the valid capture edge per CAPMODE setting. If the capture channel is set to measure mode, the flag will be set at rising edge.
                CH0CAPF: u1,
                ///  channel 1 compare value 1 match flag
                CH0CMP0F: u1,
                ///  channel 1 compare value 1 match flag
                CH0CMP1F: u1,
                ///  channel 1 counter reload flag
                CH1RLDF: u1,
                ///  channel 1 capture flag, the flag will be set at the valid capture edge per CAPMODE setting. If the capture channel is set to measure mode, the flag will be set at rising edge.
                CH1CAPF: u1,
                ///  channel 1 compare value 1 match flag
                CH1CMP0F: u1,
                ///  channel 1 compare value 1 match flag
                CH1CMP1F: u1,
                ///  channel 2 counter reload flag
                CH2RLDF: u1,
                ///  channel 2 capture flag, the flag will be set at the valid capture edge per CAPMODE setting. If the capture channel is set to measure mode, the flag will be set at rising edge.
                CH2CAPF: u1,
                ///  channel 2 compare value 1 match flag
                CH2CMP0F: u1,
                ///  channel 2 compare value 1 match flag
                CH2CMP1F: u1,
                ///  channel 3 counter reload flag
                CH3RLDF: u1,
                ///  channel 3 capture flag, the flag will be set at the valid capture edge per CAPMODE setting. If the capture channel is set to measure mode, the flag will be set at rising edge.
                CH3CAPF: u1,
                ///  channel 3 compare value 1 match flag
                CH3CMP0F: u1,
                ///  channel 3 compare value 1 match flag
                CH3CMP1F: u1,
                padding: u16,
            }),
            ///  Interrupt request enable register
            IRQEN: mmio.Mmio(packed struct(u32) {
                ///  1- generate interrupt request when ch0rldf flag is set
                CH0RLDEN: u1,
                ///  1- generate interrupt request when ch0capf flag is set
                CH0CAPEN: u1,
                ///  1- generate interrupt request when ch0cmp0f flag is set
                CH0CMP0EN: u1,
                ///  1- generate interrupt request when ch0cmp1f flag is set
                CH0CMP1EN: u1,
                ///  1- generate interrupt request when ch1rldf flag is set
                CH1RLDEN: u1,
                ///  1- generate interrupt request when ch1capf flag is set
                CH1CAPEN: u1,
                ///  1- generate interrupt request when ch1cmp0f flag is set
                CH1CMP0EN: u1,
                ///  1- generate interrupt request when ch1cmp1f flag is set
                CH1CMP1EN: u1,
                ///  1- generate interrupt request when ch2rldf flag is set
                CH2RLDEN: u1,
                ///  1- generate interrupt request when ch2capf flag is set
                CH2CAPEN: u1,
                ///  1- generate interrupt request when ch2cmp0f flag is set
                CH2CMP0EN: u1,
                ///  1- generate interrupt request when ch2cmp1f flag is set
                CH2CMP1EN: u1,
                ///  1- generate interrupt request when ch3rldf flag is set
                CH3RLDEN: u1,
                ///  1- generate interrupt request when ch3capf flag is set
                CH3CAPEN: u1,
                ///  1- generate interrupt request when ch3cmp0f flag is set
                CH3CMP0EN: u1,
                ///  1- generate interrupt request when ch3cmp1f flag is set
                CH3CMP1EN: u1,
                padding: u16,
            }),
            ///  Global control register
            GCR: mmio.Mmio(packed struct(u32) {
                ///  set this bitfield to trigger software coutner sync event
                SWSYNCT: u4,
                padding: u28,
            }),
        };

        ///  PGPR0
        pub const PGPR0 = extern struct {
            ///  Generic control
            PMIC_GPR00: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR01: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR02: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR03: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR04: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR05: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR06: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR07: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR08: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR09: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR10: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR11: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR12: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR13: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR14: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
            ///  Generic control
            PMIC_GPR15: mmio.Mmio(packed struct(u32) {
                ///  Generic control
                GPR: u32,
            }),
        };

        ///  PCFG
        pub const PCFG = extern struct {
            ///  BANGGAP control
            BANDGAP: mmio.Mmio(packed struct(u32) {
                ///  Banggap 1.0V output trim value
                VBG_P50_TRIM: u5,
                reserved8: u3,
                ///  Banggap 1.0V output trim value
                VBG_P65_TRIM: u5,
                reserved16: u3,
                ///  Banggap 1.0V output trim value
                VBG_1P0_TRIM: u5,
                reserved31: u10,
                ///  Bandgap trim happened, this bit set by hardware after trim value loaded, and stop load, write 0 will clear this bit and reload trim value 0: bandgap is not trimmed 1: bandgap is trimmed
                VBG_TRIMMED: u1,
            }),
            ///  1V LDO config
            LDO1P1: mmio.Mmio(packed struct(u32) {
                ///  LDO output voltage in mV, value valid through 700-1320, , step 20mV. Hardware select voltage no less than target if not on valid steps, with maximum 1320mV. 700: 700mV 720: 720mV . . . 1320:1320mV
                VOLT: u12,
                padding: u20,
            }),
            ///  2.5V LDO config
            LDO2P5: mmio.Mmio(packed struct(u32) {
                ///  LDO output voltage in mV, value valid through 2125-2900, step 25mV. Hardware select voltage no less than target if not on valid steps, with maximum 2900mV. 2125: 2125mV 2150: 2150mV . . . 2900:2900mV
                VOLT: u12,
                reserved16: u4,
                ///  LDO enable 0: turn off LDO 1: turn on LDO
                ENABLE: u1,
                reserved28: u11,
                ///  Ready flag, will set 1ms after enabled or voltage change 0: LDO is not ready for use 1: LDO is ready
                READY: u1,
                padding: u3,
            }),
            reserved16: [4]u8,
            ///  DCDC mode select
            DCDC_MODE: mmio.Mmio(packed struct(u32) {
                ///  DCDC voltage in mV in normal mode, value valid through 600-1375, , step 25mV. Hardware select voltage no less than target if not on valid steps, with maximum 1375mV. 600: 600mV 625: 625mV . . . 1375:1375mV
                VOLT: u12,
                reserved16: u4,
                ///  DCDC work mode XX0: trun off 001: basic mode 011: generic mode 101: automatic mode 111: expert mode
                MODE: u3,
                reserved28: u9,
                ///  Ready flag 0: DCDC is applying new change 1: DCDC is ready
                READY: u1,
                padding: u3,
            }),
            ///  DCDC low power mode
            DCDC_LPMODE: mmio.Mmio(packed struct(u32) {
                ///  DCDC voltage in mV in standby mode, , value valid through 600-1375, , step 25mV. Hardware select voltage no less than target if not on valid steps, with maximum 1375mV. 600: 600mV 625: 625mV . . . 1375:1375mV
                STBY_VOLT: u12,
                padding: u20,
            }),
            ///  DCDC protection
            DCDC_PROT: mmio.Mmio(packed struct(u32) {
                ///  short circuit flag 0: current is within limit 1: short circuits detected
                SHORT_FLAG: u1,
                reserved4: u3,
                ///  short circuit current setting 0: 2.0A, 1: 1.3A
                SHORT_CURRENT: u1,
                reserved7: u2,
                ///  disable output short circuit protection 0: short circuits protection enabled, DCDC shut down if short circuit on ouput detected 1: short circuit protection disabled
                DISABLE_SHORT: u1,
                ///  output over voltage flag 0: output is normal 1: output is unexpected high
                OVERVOLT_FLAG: u1,
                reserved15: u6,
                ///  ouput over voltage protection 0: protection enabled, DCDC will shut down is output voltage is unexpected high 1: protection disabled, DCDC continue to adjust output voltage
                DISABLE_OVERVOLTAGE: u1,
                ///  power loss 0: input power is good 1: input power is too low
                POWER_LOSS_FLAG: u1,
                reserved24: u7,
                ///  over current in low power mode 0: current is below setting 1: overcurrent happened in low power mode
                OVERLOAD_LP: u1,
                reserved28: u3,
                ///  over current setting for low power mode 0:250mA 1:200mA
                ILIMIT_LP: u1,
                padding: u3,
            }),
            ///  DCDC current estimation
            DCDC_CURRENT: mmio.Mmio(packed struct(u32) {
                ///  DCDC current level, current level is num * 50mA
                LEVEL: u5,
                reserved8: u3,
                ///  Current level valid 0: data is invalid 1: data is valid
                VALID: u1,
                reserved15: u6,
                ///  enable current measure
                ESTI_EN: u1,
                padding: u16,
            }),
            ///  DCDC advance setting
            DCDC_ADVMODE: mmio.Mmio(packed struct(u32) {
                ///  DCM mode 0: CCM mode 1: DCM mode
                EN_DCM: u1,
                ///  enable skip when voltage is higher than threshold 0: do not skip 1: skip if voltage is excess
                EN_IDLE: u1,
                ///  enable skip on narrow pulse 0: do not skip narrow pulse 1: skip narrow pulse
                EN_SKIP: u1,
                ///  avoid over voltage 0: stay in DCM mode when voltage excess 1: change to CCM mode when voltage excess
                EN_DCM_EXIT: u1,
                ///  enable auto enter low power mode 0: do not enter low power mode 1: enter low power mode if current is detected low
                EN_AUTOLP: u1,
                ///  enable feed forward loop 0: feed forward loop is disabled 1: feed forward loop is enabled
                EN_FF_LOOP: u1,
                ///  enable feed forward detect 0: feed forward detect is disabled 1: feed forward detect is enabled
                EN_FF_DET: u1,
                reserved16: u9,
                ///  Loop R number
                DC_R: u4,
                ///  Loop C number
                DC_C: u2,
                reserved24: u2,
                ///  Enable RC scale
                EN_RCSCALE: u3,
                padding: u5,
            }),
            ///  DCDC advance parameter
            DCDC_ADVPARAM: mmio.Mmio(packed struct(u32) {
                ///  maximum duty cycle
                MAX_DUT: u7,
                reserved8: u1,
                ///  minimum duty cycle
                MIN_DUT: u7,
                padding: u17,
            }),
            ///  DCDC misc parameter
            DCDC_MISC: mmio.Mmio(packed struct(u32) {
                ///  enable stepping in voltage change 0: stepping disabled, 1: steping enabled
                EN_STEP: u1,
                ///  clock selection 0: select DCDC internal oscillator 1: select RC24M oscillator
                CLK_SEL: u1,
                ///  enable delay 0: delay disabled, 1: delay enabled
                DELAY: u1,
                reserved4: u1,
                ///  current hysteres range 0: 12.5mV 1: 25mV
                OL_HYST: u1,
                reserved8: u3,
                ///  overload for threshold for lod power mode
                OL_THRE: u2,
                reserved16: u6,
                ///  Loop feed forward number
                DC_FF: u3,
                reserved20: u1,
                ///  Loop RC scale threshold
                RC_SCALE: u1,
                reserved24: u3,
                ///  hysteres threshold
                HYST_THRS: u1,
                ///  hysteres sign
                HYST_SIGN: u1,
                reserved28: u2,
                ///  hysteres enable
                EN_HYST: u1,
                padding: u3,
            }),
            ///  DCDC Debug
            DCDC_DEBUG: mmio.Mmio(packed struct(u32) {
                ///  DCDC voltage change time in 24M clock cycles, default value is 1mS
                UPDATE_TIME: u20,
                padding: u12,
            }),
            ///  DCDC ramp time
            DCDC_START_TIME: mmio.Mmio(packed struct(u32) {
                ///  Start delay for DCDC to turn on, in 24M clock cycles, default value is 3mS
                START_TIME: u20,
                padding: u12,
            }),
            ///  DCDC resume time
            DCDC_RESUME_TIME: mmio.Mmio(packed struct(u32) {
                ///  Resume delay for DCDC to recover from low power mode, in 24M clock cycles, default value is 1.5mS
                RESUME_TIME: u20,
                padding: u12,
            }),
            reserved64: [8]u8,
            ///  SOC power trap
            POWER_TRAP: mmio.Mmio(packed struct(u32) {
                ///  Enable trap of SOC power supply, trap is used to hold SOC in low power mode for DCDC to enter further low power mode, this bit will self-clear when power related low pwer flow triggered 0: trap not enabled, pmic side low power function disabled 1: trap enabled, STOP operation leads to PMIC low power flow if SOC is not retentioned.
                TRAP: u1,
                reserved16: u15,
                ///  DCDC enter standby mode, which will reduce voltage for memory content retention 0: Shutdown DCDC 1: reduce DCDC voltage
                RETENTION: u1,
                reserved31: u14,
                ///  Low power trap status, thit bit will set when power related low power flow triggered, write 1 to clear this flag. 0: low power trap is not triggered 1: low power trap triggered
                TRIGGERED: u1,
            }),
            ///  Wake up source
            WAKE_CAUSE: mmio.Mmio(packed struct(u32) {
                ///  wake up cause, each bit represents one wake up source, write 1 to clear the register bit 0: wake up source is not active during last wakeup 1: wake up source is active furing last wakeup bit 0: pmic_enable bit 7: UART interrupt bit 8: TMR interrupt bit 9: WDG interrupt bit10: GPIO in PMIC interrupt bit31: pin wakeup
                CAUSE: u32,
            }),
            ///  Wake up mask
            WAKE_MASK: mmio.Mmio(packed struct(u32) {
                ///  mask for wake up sources, each bit represents one wakeup source 0: allow source to wake up system 1: disallow source to wakeup system bit 0: pmic_enable bit 7: UART interrupt bit 8: TMR interrupt bit 9: WDG interrupt bit10: GPIO in PMIC interrupt bit31: pin wakeup
                MASK: u32,
            }),
            ///  Clock gate control in PMIC
            SCG_CTRL: mmio.Mmio(packed struct(u32) {
                ///  control whether clock being gated during PMIC low power flow, 2 bits for each peripheral 00,01: reserved 10: clock is always off 11: clock is always on bit6-7:gpio bit8-9:ioc bit10-11: timer bit12-13:wdog bit14-15:uart
                SCG: u32,
            }),
            reserved96: [16]u8,
            ///  RC 24M config
            RC24M: mmio.Mmio(packed struct(u32) {
                ///  Fine trim for RC24M, bigger value means faster
                TRIM_F: u5,
                reserved8: u3,
                ///  Coarse trim for RC24M, bigger value means faster
                TRIM_C: u3,
                reserved31: u20,
                ///  RC24M trim happened, this bit set by hardware after trim value loaded, and stop load, write 0 will clear this bit and reload trim value 0: RC is not trimmed 1: RC is trimmed
                RC_TRIMMED: u1,
            }),
            ///  RC 24M track mode
            RC24M_TRACK: mmio.Mmio(packed struct(u32) {
                ///  track mode 0: RC24M free running 1: track RC24M to external XTAL
                TRACK: u1,
                reserved4: u3,
                ///  Retrun default value when XTAL loss 0: remain last tracking value 1: switch to default value
                RETURN: u1,
                reserved16: u11,
                ///  Select track reference 0: select 32K as reference 1: select 24M XTAL as reference
                SEL24M: u1,
                padding: u15,
            }),
            ///  RC 24M track target
            TRACK_TARGET: mmio.Mmio(packed struct(u32) {
                ///  Target frequency multiplier of divided source
                TARGET: u16,
                ///  Divider for reference source
                PRE_DIV: u16,
            }),
            ///  RC 24M track status
            STATUS: mmio.Mmio(packed struct(u32) {
                ///  default fine trim value
                TRIM_F: u5,
                reserved8: u3,
                ///  default coarse trim value
                TRIM_C: u3,
                reserved15: u4,
                ///  default value takes effect 0: default value is invalid 1: default value is valid
                EN_TRIM: u1,
                ///  track is using XTAL24M 0: track is not using XTAL24M 1: track is using XTAL24M
                SEL24M: u1,
                reserved20: u3,
                ///  track is using XTAL32K 0: track is not using XTAL32K 1: track is using XTAL32K
                SEL32K: u1,
                padding: u11,
            }),
        };

        ///  UART0
        pub const UART0 = extern struct {
            reserved4: [4]u8,
            ///  Idle Configuration Register
            IDLE_CFG: mmio.Mmio(packed struct(u32) {
                ///  Threshold for UART Receive Idle detection (in terms of bits)
                RX_IDLE_THR: u8,
                ///  UART Idle Detect Enable 0 - Disable 1 - Enable it should be enabled if enable address match feature
                RX_IDLE_EN: u1,
                ///  IDLE Detection Condition 0 - Treat as idle if RX pin is logic one 1 - Treat as idle if UART state machine state is idle
                RX_IDLE_COND: u1,
                reserved11: u1,
                ///  UART receive enable. 0 - hold RX input to high, avoide wrong data input when config pinmux 1 - bypass RX input from PIN software should set it after config pinmux
                RXEN: u1,
                reserved16: u4,
                ///  Threshold for UART transmit Idle detection (in terms of bits)
                TX_IDLE_THR: u8,
                ///  UART TX Idle Detect Enable 0 - Disable 1 - Enable
                TX_IDLE_EN: u1,
                ///  IDLE Detection Condition 0 - Treat as idle if TX pin is logic one 1 - Treat as idle if UART state machine state is idle
                TX_IDLE_COND: u1,
                padding: u6,
            }),
            ///  address match config register
            ADDR_CFG: mmio.Mmio(packed struct(u32) {
                ///  address 0 field.
                ADDR0: u8,
                ///  address 1 fileld. in 9bit mode, this is the full address byte. For other mode(8/7/6/5bit), MSB should be set for address flag. If want address==0 to be matched at 8bit mode, should set addr1=0x80
                ADDR1: u8,
                ///  enable addr0 compare for the first character
                A0_EN: u1,
                ///  enable addr1 compare for the first character. If a1_en OR a0_en, then do not receive data if address not match. If ~a1_en AND ~a0_en, the receive all data like before. NOTE: should set idle_tmout_en if enable address match feature
                A1_EN: u1,
                ///  set to use 9bit mode for receiver, only valid if rxen_addr_msb is set
                RXEN_9BIT: u1,
                ///  set to use MSB as address flag at receiver(actually this is done by software set correct MSB in addr0/addr1). Clr to use first character as address. Only needed if enable address match feature
                RXEN_ADDR_MSB: u1,
                ///  set to use 9bit mode for transmitter, will set the MSB for the first character as address flag, keep 0 for others.
                TXEN_9BIT: u1,
                padding: u11,
            }),
            ///  Interrupt Identification Register2
            IIR2: mmio.Mmio(packed struct(u32) {
                ///  Interrupt ID, see IIR2 for detail decoding
                INTRID: u4,
                reserved6: u2,
                ///  FIFOs enabled These two bits are 1 when bit 0 of the FIFO Control Register (FIFOE) is set to 1.
                FIFOED: u2,
                reserved27: u19,
                ///  assert if data lost before address match status, write one clear; It will not assert if no address match occurs
                DATA_LOST: u1,
                ///  address match and idle irq status, assert at rx bus idle if address match event triggered. Write one clear;
                ADDR_MATCH_IDLE: u1,
                ///  address match irq status, assert if either address match(and enabled). Write one clear NOTE: the address byte may not moved by DMA at this point. User can wait next addr_match_idle irq for the whole data include address
                ADDR_MATCH: u1,
                ///  UART TX IDLE Flag, assert after txd high and then tx idle timeout, write one clear 0 - UART TX is busy 1 - UART TX is idle
                TXIDLE_FLAG: u1,
                ///  UART RX IDLE Flag, assert after rxd high and then rx idle timeout, write one clear 0 - UART RX is busy 1 - UART RX is idle
                RXIDLE_FLAG: u1,
            }),
            ///  Configuration Register
            Cfg: mmio.Mmio(packed struct(u32) {
                ///  The depth of RXFIFO and TXFIFO 0: 16-byte FIFO 1: 32-byte FIFO 2: 64-byte FIFO 3: 128-byte FIFO
                FIFOSIZE: u2,
                padding: u30,
            }),
            ///  Over Sample Control Register
            OSCR: mmio.Mmio(packed struct(u32) {
                ///  Over-sample control The value must be an even number; any odd value writes to this field will be converted to an even value. OSC=0: reserved OSC<=8: The over-sample ratio is 8 8 < OSC< 32: The over sample ratio is OSC
                OSC: u5,
                padding: u27,
            }),
            ///  FIFO Control Register config
            FCRR: mmio.Mmio(packed struct(u32) {
                ///  FIFO enable Write 1 to enable both the transmitter and receiver FIFOs. The FIFOs are reset when the value of this bit toggles.
                FIFOE: u1,
                ///  Receiver FIFO reset Write 1 to clear all bytes in the RXFIFO and resets its counter. The Receiver Shift Register is not cleared. This bit will automatically be cleared.
                RFIFORST: u1,
                ///  Transmitter FIFO reset Write 1 to clear all bytes in the TXFIFO and resets its counter. The Transmitter Shift Register is not cleared. This bit will automatically be cleared.
                TFIFORST: u1,
                ///  DMA enable 0: Disable 1: Enable
                DMAE: u1,
                ///  Transmitter FIFO trigger level
                TFIFOT: u2,
                ///  Receiver FIFO trigger level
                RFIFOT: u2,
                ///  rxfifo threshold(0 for 1byte, 0xF for 16bytes). Uart will send rx_dma_req if data in fifo reachs the threshold, also will set the rxdata irq if enabled
                RFIFOT4: u4,
                reserved16: u4,
                ///  txfifo threshold(0 for 1byte, 0xF for 16bytes), uart will send tx_dma_req when data in fifo is less than threshold.
                TFIFOT4: u4,
                reserved23: u3,
                ///  set to use new 4bit fifo threshold(TFIFOT4 and RFIFOT4) clr to use 2bit(TFIFOT and RFIFOT)
                FIFOT4EN: u1,
                padding: u8,
            }),
            ///  moto system control register
            MOTO_CFG: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  set to insert STOP bits between each tx byte till tx fifo empty. NOTE: there will be no 1.5/2 STOP bits if enabled this feature, LCR.STB should be set to 0 if this bit is set
                TXSTOP_INSERT: u1,
                ///  set to enable the feature that, clear rxfifo at tx trigger(sw or hw), avoid unexpected data in rxfifo.
                TRG_CLR_RFIFO: u1,
                ///  set to enable trigger mode. software should push needed data into txbuffer frist, uart will not start transmission at this time. User should send trigger signal(by hw or sw), uart will send all data in txfifo till empty NOTE: the hw_trigger should be pulse signal from trig mux.
                TRG_MODE: u1,
                ///  set to enable hardware trigger(trigger from moto is shared by other UART)
                HWTRG_EN: u1,
                ///  if TXSTOP_INSERT is enabled, the STOP bits to be inserted between each byte. 0 for 1 bit; 0xFF for 256bits
                TXSTP_BITS: u8,
                reserved31: u15,
                ///  software trigger. User should avoid use sw/hw trigger at same time, otherwise result unknown. Hardware auto reset.
                SWTRG: u1,
            }),
            ///  Receiver Buffer Register (when DLAB = 0)
            RBR: mmio.Mmio(packed struct(u32) {
                ///  Receive data read port
                RBR: u8,
                padding: u24,
            }),
            ///  Interrupt Enable Register (when DLAB = 0)
            IER: mmio.Mmio(packed struct(u32) {
                ///  Enable received data available interrupt and the character timeout interrupt 0: Disable 1: Enable
                ERBI: u1,
                ///  Enable transmitter holding register interrupt
                ETHEI: u1,
                ///  Enable receiver line status interrupt
                ELSI: u1,
                ///  Enable modem status interrupt The interrupt asserts when the status of one of the following occurs: The status of modem_rin, modem_dcdn, modem_dsrn or modem_ctsn (If the auto-cts mode is disabled) has been changed. If the auto-cts mode is enabled (MCR bit4 (AFE) = 1), modem_ctsn would be used to control the transmitter.
                EMSI: u1,
                reserved27: u23,
                ///  enable DATA_LOST interrupt
                EDATLOST: u1,
                ///  enable ADDR_MATCH_IDLE interrupt
                EADDRM_IDLE: u1,
                ///  enable ADDR_MATCH interrupt
                EADDRM: u1,
                ///  enable transmit idle interrupt
                ETXIDLE: u1,
                ///  Enable Receive Idle interrupt 0 - Disable Idle interrupt 1 - Enable Idle interrupt
                ERXIDLE: u1,
            }),
            ///  Interrupt Identification Register
            IIR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt ID, see IIR2 for detail decoding
                INTRID: u4,
                reserved6: u2,
                ///  FIFOs enabled These two bits are 1 when bit 0 of the FIFO Control Register (FIFOE) is set to 1.
                FIFOED: u2,
                reserved31: u23,
                ///  UART IDLE Flag 0 - UART is busy 1 - UART is idle NOTE: when write one to clear this bit, avoid changging FCR register since it's same address as IIR
                RXIDLE_FLAG: u1,
            }),
            ///  Line Control Register
            LCR: mmio.Mmio(packed struct(u32) {
                ///  Word length setting 0: 5 bits 1: 6 bits 2: 7 bits 3: 8 bits
                WLS: u2,
                ///  Number of STOP bits 0: 1 bits 1: The number of STOP bit is based on the WLS setting When WLS = 0, STOP bit is 1.5 bits When WLS = 1, 2, 3, STOP bit is 2 bits
                STB: u1,
                ///  Parity enable When this bit is set, a parity bit is generated in transmitted data before the first STOP bit and the parity bit would be checked for the received data.
                PEN: u1,
                ///  Even parity select 1: Even parity (an even number of logic-1 is in the data and parity bits) 0: Old parity.
                EPS: u1,
                ///  Stick parity 1: Parity bit is constant 0 or 1, depending on bit4 (EPS). 0: Disable the sticky bit parity.
                SPS: u1,
                ///  Break control
                BC: u1,
                ///  Divisor latch access bit
                DLAB: u1,
                padding: u24,
            }),
            ///  Modem Control Register (
            MCR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Request to send This bit controls the modem_rtsn output. 0: The modem_rtsn output signal will be driven HIGH 1: The modem_rtsn output signal will be driven LOW
                RTS: u1,
                reserved4: u2,
                ///  Enable loopback mode 0: Disable 1: Enable
                LOOP: u1,
                ///  Auto flow control enable 0: Disable 1: The auto-CTS and auto-RTS setting is based on the RTS bit setting: When RTS = 0, auto-CTS only When RTS = 1, auto-CTS and auto-RTS
                AFE: u1,
                padding: u26,
            }),
            ///  Line Status Register
            LSR: mmio.Mmio(packed struct(u32) {
                ///  Data ready. This bit is set when there are incoming received data in the Receiver Buffer Register (RBR). It is cleared when all of the received data are read.
                DR: u1,
                ///  Overrun error This bit indicates that data in the Receiver Buffer Register (RBR) is overrun.
                OE: u1,
                ///  Parity error This bit is set when the received parity does not match with the parity selected in the LCR[5:4]. It is cleared when this register is read. In the FIFO mode, this bit indicates the parity error for the received data at the top of the RXFIFO.
                PE: u1,
                ///  Framing error This bit is set when the received STOP bit is not HIGH. It is cleared when this register is read. In the FIFO mode, this bit indicates the framing error for the received data at the top of the RXFIFO.
                FE: u1,
                ///  Line break This bit is set when the uart_sin input signal was held LOWfor longer than the time for a full-word transmission. A full-word transmission is the transmission of the START, data, parity, and STOP bits. It is cleared when this register is read. In the FIFO mode, this bit indicates the line break for the received data at the top of the RXFIFO.
                LBREAK: u1,
                ///  Transmitter Holding Register empty This bit is 1 when the THR (TXFIFO in the FIFO mode) is empty. Otherwise, it is zero. If the THRE interrupt is enabled, an interrupt is triggered when THRE becomes 1.
                THRE: u1,
                ///  Transmitter empty This bit is 1 when the THR (TXFIFO in the FIFO mode) and the Transmitter Shift Register (TSR) are both empty. Otherwise, it is zero.
                TEMT: u1,
                ///  Error in RXFIFO In the FIFO mode, this bit is set when there is at least one parity error, framing error, or line break associated with data in the RXFIFO. It is cleared when this register is read and there is no more error for the rest of data in the RXFIFO.
                ERRF: u1,
                ///  data bytes in txfifo not sent
                TFIFO_NUM: u5,
                reserved16: u3,
                ///  data bytes in rxfifo not read
                RFIFO_NUM: u5,
                reserved30: u9,
                ///  txidle after timeout, clear after tx idle condition not match
                TXIDLE: u1,
                ///  rxidle after timeout, clear after rx idle condition not match
                RXIDLE: u1,
            }),
            ///  Modem Status Register
            MSR: mmio.Mmio(packed struct(u32) {
                ///  Delta clear to send This bit is set when the state of the modem_ctsn input signal has been changed since the last time this register is read.
                DCTS: u1,
                reserved4: u3,
                ///  Clear to send 0: The modem_ctsn input signal is HIGH. 1: The modem_ctsn input signal is LOW.
                CTS: u1,
                padding: u27,
            }),
            ///  GPR Register
            GPR: mmio.Mmio(packed struct(u32) {
                ///  An one-byte storage register
                DATA: u8,
                padding: u24,
            }),
        };

        ///  PPOR
        pub const PPOR = extern struct {
            ///  flag indicate reset source
            RESET_FLAG: mmio.Mmio(packed struct(u32) {
                ///  reset reason of last hard reset, write 1 to clear each bit 0: brownout 1: temperature 4: debug reset 5: jtag soft reset 8: cpu0 lockup(not available) 9: cpu1 lockup(not available) 10: cpu0 request(not available) 11: cpu1 request(not available) 16: watch dog 0 17: watch dog 1 18: watch dog 2(not available) 19: watch dog 3(not available) 24: pmic watch dog 30: jtag ieee reset 31: software
                FLAG: u32,
            }),
            ///  reset source status
            RESET_STATUS: mmio.Mmio(packed struct(u32) {
                ///  current status of reset sources 0: brownout 1: temperature 4: debug reset 5: jtag soft reset 8: cpu0 lockup(not available) 9: cpu1 lockup(not available) 10: cpu0 request(not available) 11: cpu1 request(not available) 16: watch dog 0 17: watch dog 1 18: watch dog 2(not available) 19: watch dog 3(not available) 24: pmic watch dog 30: jtag ieee reset 31: software
                STATUS: u32,
            }),
            ///  reset hold attribute
            RESET_HOLD: mmio.Mmio(packed struct(u32) {
                ///  hold arrtibute, when set, SOC keep in reset status until reset source release, or, reset will be released after SOC enter reset status 0: brownout 1: temperature 4: debug reset 5: jtag soft reset 8: cpu0 lockup(not available) 9: cpu1 lockup(not available) 10: cpu0 request(not available) 11: cpu1 request(not available) 16: watch dog 0 17: watch dog 1 18: watch dog 2(not available) 19: watch dog 3(not available) 24: pmic watch dog 30: jtag ieee reset 31: software
                HOLD: u32,
            }),
            ///  reset source enable
            RESET_ENABLE: mmio.Mmio(packed struct(u32) {
                ///  enable of reset sources 0: brownout 1: temperature 4: debug reset 5: jtag soft reset 8: cpu0 lockup(not available) 9: cpu1 lockup(not available) 10: cpu0 request(not available) 11: cpu1 request(not available) 16: watch dog 0 17: watch dog 1 18: watch dog 2(not available) 19: watch dog 3(not available) 24: pmic watch dog 30: jtag ieee reset 31: software
                ENABLE: u32,
            }),
            ///  reset type triggered by reset
            RESET_TYPE: mmio.Mmio(packed struct(u32) {
                ///  reset type of reset sources, 0 for cold reset, all system control setting cleared except debug/fuse/ioc; 1 for hot reset, keep system control setting and debug/fuse/ioc setting, only clear some subsystem 0: brownout 1: temperature 4: debug reset 5: jtag soft reset 8: cpu0 lockup(not available) 9: cpu1 lockup(not available) 10: cpu0 request(not available) 11: cpu1 request(not available) 16: watch dog 0 17: watch dog 1 18: watch dog 2(not available) 19: watch dog 3(not available) 24: pmic watch dog 30: jtag ieee reset 31: software
                TYPE: u32,
            }),
            reserved28: [8]u8,
            ///  Software reset counter
            SOFTWARE_RESET: mmio.Mmio(packed struct(u32) {
                ///  counter decrease in 24MHz and stop at 0, trigger reset when value reach 2, software can write 0 to cancel reset
                COUNTER: u32,
            }),
        };

        ///  PLLCTLV2
        pub const PLLCTLV2 = extern struct {
            ///  OSC configuration
            XTAL: mmio.Mmio(packed struct(u32) {
                ///  Rampup time of XTAL oscillator in cycles of RC24M clock 0: 0 cycle 1: 1 cycle 2: 2 cycle 1048575: 1048575 cycles
                RAMP_TIME: u20,
                reserved28: u8,
                ///  Crystal oscillator enable status 0: Oscillator is off 1: Oscillator is on
                ENABLE: u1,
                ///  Crystal oscillator status 0: Oscillator is not stable 1: Oscillator is stable for use
                RESPONSE: u1,
                reserved31: u1,
                ///  Busy flag 0: Oscillator is working or shutdown 1: Oscillator is changing status
                BUSY: u1,
            }),
        };

        ///  USB0
        pub const USB0 = extern struct {
            reserved128: [128]u8,
            ///  General Purpose Timer #0 Load Register
            GPTIMER0LD: mmio.Mmio(packed struct(u32) {
                ///  GPTLD General Purpose Timer Load Value These bit fields are loaded to GPTCNT bits when GPTRST bit is set '1b'. This value represents the time in microseconds minus 1 for the timer duration. Example: for a one millisecond timer, load 1000-1=999 or 0x0003E7. NOTE: Max value is 0xFFFFFF or 16.777215 seconds.
                GPTLD: u24,
                padding: u8,
            }),
            ///  General Purpose Timer #0 Controller Register
            GPTIMER0CTRL: mmio.Mmio(packed struct(u32) {
                ///  GPTCNT General Purpose Timer Counter. This field is the count value of the countdown timer.
                GPTCNT: u24,
                ///  GPTMODE General Purpose Timer Mode In one shot mode, the timer will count down to zero, generate an interrupt, and stop until the counter is reset by software; In repeat mode, the timer will count down to zero, generate an interrupt and automatically reload the counter value from GPTLD bits to start again. 0 - One Shot Mode 1 - Repeat Mode
                GPTMODE: u1,
                reserved30: u5,
                ///  GPTRST General Purpose Timer Reset 0 - No action 1 - Load counter value from GPTLD bits in n_GPTIMER0LD
                GPTRST: u1,
                ///  GPTRUN General Purpose Timer Run GPTCNT bits are not effected when setting or clearing this bit. 0 - Stop counting 1 - Run
                GPTRUN: u1,
            }),
            ///  General Purpose Timer #1 Load Register
            GPTIMER1LD: mmio.Mmio(packed struct(u32) {
                ///  GPTLD General Purpose Timer Load Value These bit fields are loaded to GPTCNT bits when GPTRST bit is set '1b'. This value represents the time in microseconds minus 1 for the timer duration. Example: for a one millisecond timer, load 1000-1=999 or 0x0003E7. NOTE: Max value is 0xFFFFFF or 16.777215 seconds.
                GPTLD: u24,
                padding: u8,
            }),
            ///  General Purpose Timer #1 Controller Register
            GPTIMER1CTRL: mmio.Mmio(packed struct(u32) {
                ///  GPTCNT General Purpose Timer Counter. This field is the count value of the countdown timer.
                GPTCNT: u24,
                ///  GPTMODE General Purpose Timer Mode In one shot mode, the timer will count down to zero, generate an interrupt, and stop until the counter is reset by software. In repeat mode, the timer will count down to zero, generate an interrupt and automatically reload the counter value from GPTLD bits to start again. 0 - One Shot Mode 1 - Repeat Mode
                GPTMODE: u1,
                reserved30: u5,
                ///  GPTRST General Purpose Timer Reset 0 - No action 1 - Load counter value from GPTLD bits in USB_n_GPTIMER1LD
                GPTRST: u1,
                ///  GPTRUN General Purpose Timer Run GPTCNT bits are not effected when setting or clearing this bit. 0 - Stop counting 1 - Run
                GPTRUN: u1,
            }),
            ///  System Bus Config Register
            SBUSCFG: mmio.Mmio(packed struct(u32) {
                ///  AHBBRST AHB master interface Burst configuration These bits control AHB master transfer type sequence (or priority). NOTE: This register overrides n_BURSTSIZE register when its value is not zero. 000 - Incremental burst of unspecified length only 001 - INCR4 burst, then single transfer 010 - INCR8 burst, INCR4 burst, then single transfer 011 - INCR16 burst, INCR8 burst, INCR4 burst, then single transfer 100 - Reserved, don't use 101 - INCR4 burst, then incremental burst of unspecified length 110 - INCR8 burst, INCR4 burst, then incremental burst of unspecified length 111 - INCR16 burst, INCR8 burst, INCR4 burst, then incremental burst of unspecified length
                AHBBRST: u3,
                padding: u29,
            }),
            reserved320: [172]u8,
            ///  USB Command Register
            USBCMD: mmio.Mmio(packed struct(u32) {
                ///  RS Run/Stop (RS) - Read/Write. Default 0b. 1=Run. 0=Stop. Host operation mode: When set to '1b', the Controller proceeds with the execution of the schedule. The Controller continues execution as long as this bit is set to a one. When this bit is set to 0, the Host Controller completes the current transaction on the USB and then halts. The HC Halted bit in the status register indicates when the Controller has finished the transaction and has entered the stopped state. Software should not write a one to this field unless the controller is in the Halted state (that is, HCHalted in the USBSTS register is a one). Device operation mode: Writing a one to this bit will cause the controller to enable a pull-up on D+ and initiate an attach event. This control bit is not directly connected to the pull-up enable, as the pull-up will become disabled upon transitioning into high-speed mode. Software should use this bit to prevent an attach event before the controller has been properly initialized. Writing a 0 to this will cause a detach event.
                RS: u1,
                ///  RST Controller Reset (RESET) - Read/Write. Software uses this bit to reset the controller. This bit is set to zero by the Host/Device Controller when the reset process is complete. Software cannot terminate the reset process early by writing a zero to this register. Host operation mode: When software writes a one to this bit, the Controller resets its internal pipelines, timers, counters, state machines etc. to their initial value. Any transaction currently in progress on USB is immediately terminated. A USB reset is not driven on downstream ports. Software should not set this bit to a one when the HCHalted bit in the USBSTS register is a zero. Attempting to reset an actively running host controller will result in undefined behavior. Device operation mode: When software writes a one to this bit, the Controller resets its internal pipelines, timers, counters, state machines etc. to their initial value. Writing a one to this bit when the device is in the attached state is not recommended, because the effect on an attached host is undefined. In order to ensure that the device is not in an attached state before initiating a device controller reset, all primed endpoints should be flushed and the USBCMD Run/Stop bit should be set to 0.
                RST: u1,
                ///  FS_1 See description at bit 15
                FS_1: u2,
                ///  PSE Periodic Schedule Enable- Read/Write. Default 0b. This bit controls whether the host controller skips processing the Periodic Schedule. Only the host controller uses this bit. Values Meaning 0 - Do not process the Periodic Schedule 1 - Use the PERIODICLISTBASE register to access the Periodic Schedule.
                PSE: u1,
                ///  ASE Asynchronous Schedule Enable - Read/Write. Default 0b. This bit controls whether the host controller skips processing the Asynchronous Schedule. Only the host controller uses this bit. Values Meaning 0 - Do not process the Asynchronous Schedule. 1 - Use the ASYNCLISTADDR register to access the Asynchronous Schedule.
                ASE: u1,
                ///  IAA Interrupt on Async Advance Doorbell - Read/Write. This bit is used as a doorbell by software to tell the host controller to issue an interrupt the next time it advances asynchronous schedule. Software must write a 1 to this bit to ring the doorbell. When the host controller has evicted all appropriate cached schedule states, it sets the Interrupt on Async Advance status bit in the USBSTS register. If the Interrupt on Sync Advance Enable bit in the USBINTR register is one, then the host controller will assert an interrupt at the next interrupt threshold. The host controller sets this bit to zero after it has set the Interrupt on Sync Advance status bit in the USBSTS register to one. Software should not write a one to this bit when the asynchronous schedule is inactive. Doing so will yield undefined results. This bit is only used in host mode. Writing a one to this bit when device mode is selected will have undefined results.
                IAA: u1,
                reserved8: u1,
                ///  ASP Asynchronous Schedule Park Mode Count - Read/Write. If the Asynchronous Park Capability bit in the HCCPARAMS register is a one, then this field defaults to 3h and is R/W. Otherwise it defaults to zero and is Read-Only. It contains a count of the number of successive transactions the host controller is allowed to execute from a high-speed queue head on the Asynchronous schedule before continuing traversal of the Asynchronous schedule. Valid values are 1h to 3h. Software must not write a zero to this bit when Park Mode Enable is a one as this will result in undefined behavior. This field is set to 3h in all controller core.
                ASP: u2,
                reserved11: u1,
                ///  ASPE Asynchronous Schedule Park Mode Enable - Read/Write. If the Asynchronous Park Capability bit in the HCCPARAMS register is a one, then this bit defaults to a 1h and is R/W. Otherwise the bit must be a zero and is RO. Software uses this bit to enable or disable Park mode. When this bit is one, Park mode is enabled. When this bit is a zero, Park mode is disabled. NOTE: ASPE bit reset value: '0b' for OTG controller .
                ASPE: u1,
                reserved13: u1,
                ///  SUTW Setup TripWire - Read/Write. [device mode only] This bit is used as a semaphore to ensure that the setup data payload of 8 bytes is extracted from a QH by the DCD without being corrupted. If the setup lockout mode is off (SLOM bit in USB core register n_USBMODE, see USBMODE ) then there is a hazard when new setup data arrives while the DCD is copying the setup data payload from the QH for a previous setup packet. This bit is set and cleared by software. This bit would also be cleared by hardware when a hazard detected.
                SUTW: u1,
                ///  ATDTW Add dTD TripWire - Read/Write. [device mode only] This bit is used as a semaphore to ensure proper addition of a new dTD to an active (primed) endpoint's linked list. This bit is set and cleared by software. This bit would also be cleared by hardware when state machine is hazard region for which adding a dTD to a primed endpoint may go unrecognized.
                ATDTW: u1,
                ///  FS_2 Frame List Size - (Read/Write or Read Only). [host mode only] This field is Read/Write only if Programmable Frame List Flag in the HCCPARAMS registers is set to one. This field specifies the size of the frame list that controls which bits in the Frame Index Register should be used for the Frame List Current index. NOTE: This field is made up from USBCMD bits 15, 3 and 2. Value Meaning 0b000 - 1024 elements (4096 bytes) Default value 0b001 - 512 elements (2048 bytes) 0b010 - 256 elements (1024 bytes) 0b011 - 128 elements (512 bytes) 0b100 - 64 elements (256 bytes) 0b101 - 32 elements (128 bytes) 0b110 - 16 elements (64 bytes) 0b111 - 8 elements (32 bytes)
                FS_2: u1,
                ///  ITC Interrupt Threshold Control -Read/Write. The system software uses this field to set the maximum rate at which the host/device controller will issue interrupts. ITC contains the maximum interrupt interval measured in micro-frames. Valid values are shown below. Value Maximum Interrupt Interval 00000000 - Immediate (no threshold) 00000001 - 1 micro-frame 00000010 - 2 micro-frames 00000100 - 4 micro-frames 00001000 - 8 micro-frames 00010000 - 16 micro-frames 00100000 - 32 micro-frames 01000000 - 64 micro-frames
                ITC: u8,
                padding: u8,
            }),
            ///  USB Status Register
            USBSTS: mmio.Mmio(packed struct(u32) {
                ///  UI USB Interrupt (USBINT) - R/WC. This bit is set by the Host/Device Controller when the cause of an interrupt is a completion of a USB transaction where the Transfer Descriptor (TD) has an interrupt on complete (IOC) bit set. This bit is also set by the Host/Device Controller when a short packet is detected. A short packet is when the actual number of bytes received was less than the expected number of bytes.
                UI: u1,
                ///  UEI USB Error Interrupt (USBERRINT) - R/WC. When completion of a USB transaction results in an error condition, this bit is set by the Host/Device Controller. This bit is set along with the USBINT bit, if the TD on which the error interrupt occurred also had its interrupt on complete (IOC) bit set.
                UEI: u1,
                ///  PCI Port Change Detect - R/WC. The Host Controller sets this bit to a one when on any port a Connect Status occurs, a Port Enable/Disable Change occurs, or the Force Port Resume bit is set as the result of a J-K transition on the suspended port. The Device Controller sets this bit to a one when the port controller enters the full or high-speed operational state. When the port controller exits the full or high-speed operation states due to Reset or Suspend events, the notification mechanisms are the USB Reset Received bit and the DCSuspend bits Respectively.
                PCI: u1,
                ///  FRI Frame List Rollover - R/WC. The Host Controller sets this bit to a one when the Frame List Index rolls over from its maximum value to zero. The exact value at which the rollover occurs depends on the frame list size. For example. If the frame list size (as programmed in the Frame List Size field of the USB_n_USBCMD register) is 1024, the Frame Index Register rolls over every time FRINDEX [13] toggles. Similarly, if the size is 512, the Host Controller sets this bit to a one every time FHINDEX [12] toggles. Only used in host operation mode.
                FRI: u1,
                ///  System Error – RWC. Default = 0b. In the BVCI implementation of the USBHS core, this bit is not used, and will always be cleared to '0b'. In the AMBA implementation, this bit will be set to '1b' when an Error response is seen by the master interface (HRESP[1:0]=ERROR)
                SEI: u1,
                ///  AAI Interrupt on Async Advance - R/WC. System software can force the host controller to issue an interrupt the next time the host controller advances the asynchronous schedule by writing a one to the Interrupt on Async Advance Doorbell bit in the n_USBCMD register. This status bit indicates the assertion of that interrupt source. Only used in host operation mode.
                AAI: u1,
                ///  URI USB Reset Received - R/WC. When the device controller detects a USB Reset and enters the default state, this bit will be set to a one. Software can write a 1 to this bit to clear the USB Reset Received status bit. Only used in device operation mode.
                URI: u1,
                ///  SRI SOF Received - R/WC. When the device controller detects a Start Of (micro) Frame, this bit will be set to a one. When a SOF is extremely late, the device controller will automatically set this bit to indicate that an SOF was expected. Therefore, this bit will be set roughly every 1ms in device FS mode and every 125ms in HS mode and will be synchronized to the actual SOF that is received. Because the device controller is initialized to FS before connect, this bit will be set at an interval of 1ms during the prelude to connect and chirp. In host mode, this bit will be set every 125us and can be used by host controller driver as a time base. Software writes a 1 to this bit to clear it.
                SRI: u1,
                ///  SLI DCSuspend - R/WC. When a controller enters a suspend state from an active state, this bit will be set to a one. The device controller clears the bit upon exiting from a suspend state. Only used in device operation mode.
                SLI: u1,
                reserved12: u3,
                ///  HCH HCHaIted - Read Only. This bit is a zero whenever the Run/Stop bit is a one. The Controller sets this bit to one after it has stopped executing because of the Run/Stop bit being set to 0, either by software or by the Controller hardware (for example, an internal error). Only used in the host operation mode. Default value is '0b' for OTG core . This is because OTG core is not operating as host in default. Please see CM bit in USB_n_USBMODE register. NOTE: HCH bit reset value: '0b' for OTG controller core .
                HCH: u1,
                ///  RCL Reclamation - Read Only. This is a read-only status bit used to detect an empty asynchronous schedule. Only used in the host operation mode.
                RCL: u1,
                ///  PS Periodic Schedule Status - Read Only. This bit reports the current real status of the Periodic Schedule. When set to zero the periodic schedule is disabled, and if set to one the status is enabled. The Host Controller is not required to immediately disable or enable the Periodic Schedule when software transitions the Periodic Schedule Enable bit in the USBCMD register. When this bit and the Periodic Schedule Enable bit are the same value, the Periodic Schedule is either enabled (1) or disabled (0). Only used in the host operation mode.
                PS: u1,
                ///  AS Asynchronous Schedule Status - Read Only. This bit reports the current real status of the Asynchronous Schedule. When set to zero the asynchronous schedule status is disabled and if set to one the status is enabled. The Host Controller is not required to immediately disable or enable the Asynchronous Schedule when software transitions the Asynchronous Schedule Enable bit in the USBCMD register. When this bit and the Asynchronous Schedule Enable bit are the same value, the Asynchronous Schedule is either enabled (1) or disabled (0). Only used in the host operation mode.
                AS: u1,
                ///  NAKI NAK Interrupt Bit--RO. This bit is set by hardware when for a particular endpoint both the TX/RX Endpoint NAK bit and corresponding TX/RX Endpoint NAK Enable bit are set. This bit is automatically cleared by hardware when all Enabled TX/RX Endpoint NAK bits are cleared.
                NAKI: u1,
                reserved18: u1,
                ///  USB Host Asynchronous Interrupt – RWC. Default = 0b. This bit is set by the Host Controller when the cause of an interrupt is a completion of a USB transaction where the Transfer Descriptor (TD) has an interrupt on complete (IOC) bit set AND the TD was from the asynchronous schedule. This bit is also set by the Host when a short packet is detected and the packet is on the asynchronous schedule. A short packet is when the actual number of bytes received was less than expected. This bit is not used by the device controller and will always be zero
                UAI: u1,
                ///  USB Host Periodic Interrupt – RWC. Default = 0b. This bit is set by the Host Controller when the cause of an interrupt is a completion of a USB transaction where the Transfer Descriptor (TD) has an interrupt on complete (IOC) bit set and the TD was from the periodic schedule. This bit is also set by the Host Controller when a short packet is detected and the packet is on the periodic schedule. A short packet is when the actual number of bytes received was less than expected. This bit is not used by the device controller and will always be zero.
                UPI: u1,
                reserved24: u4,
                ///  TI0 General Purpose Timer Interrupt 0(GPTINT0)--R/WC. This bit is set when the counter in the GPTIMER0CTRL register transitions to zero, writing a one to this bit clears it.
                TI0: u1,
                ///  TI1 General Purpose Timer Interrupt 1(GPTINT1)--R/WC. This bit is set when the counter in the GPTIMER1CTRL register transitions to zero, writing a one to this bit will clear it.
                TI1: u1,
                padding: u6,
            }),
            ///  Interrupt Enable Register
            USBINTR: mmio.Mmio(packed struct(u32) {
                ///  UE USB Interrupt Enable When this bit is one and the UI bit in n_USBSTS register is a one the controller will issue an interrupt.
                UE: u1,
                ///  UEE USB Error Interrupt Enable When this bit is one and the UEI bit in n_USBSTS register is a one the controller will issue an interrupt.
                UEE: u1,
                ///  PCE Port Change Detect Interrupt Enable When this bit is one and the PCI bit in n_USBSTS register is a one the controller will issue an interrupt.
                PCE: u1,
                ///  FRE Frame List Rollover Interrupt Enable When this bit is one and the FRI bit in n_USBSTS register is a one the controller will issue an interrupt. Only used in host operation mode.
                FRE: u1,
                ///  SEE System Error Interrupt Enable When this bit is one and the SEI bit in n_USBSTS register is a one the controller will issue an interrupt. Only used in host operation mode.
                SEE: u1,
                ///  AAE Async Advance Interrupt Enable When this bit is one and the AAI bit in n_USBSTS register is a one the controller will issue an interrupt. Only used in host operation mode.
                AAE: u1,
                ///  URE USB Reset Interrupt Enable When this bit is one and the URI bit in n_USBSTS register is a one the controller will issue an interrupt. Only used in device operation mode.
                URE: u1,
                ///  SRE SOF Received Interrupt Enable When this bit is one and the SRI bit in n_USBSTS register is a one the controller will issue an interrupt.
                SRE: u1,
                ///  SLE Sleep Interrupt Enable When this bit is one and the SLI bit in n_n_USBSTS register is a one the controller will issue an interrupt. Only used in device operation mode.
                SLE: u1,
                reserved16: u7,
                ///  NAKE NAK Interrupt Enable When this bit is one and the NAKI bit in n_USBSTS register is a one the controller will issue an interrupt.
                NAKE: u1,
                reserved18: u1,
                ///  UAIE USB Host Asynchronous Interrupt Enable When this bit is one, and the UAI bit in the n_USBSTS register is one, host controller will issue an interrupt at the next interrupt threshold.
                UAIE: u1,
                ///  UPIE USB Host Periodic Interrupt Enable When this bit is one, and the UPI bit in the n_USBSTS register is one, host controller will issue an interrupt at the next interrupt threshold.
                UPIE: u1,
                reserved24: u4,
                ///  TIE0 General Purpose Timer #0 Interrupt Enable When this bit is one and the TI0 bit in n_USBSTS register is a one the controller will issue an interrupt.
                TIE0: u1,
                ///  TIE1 General Purpose Timer #1 Interrupt Enable When this bit is one and the TI1 bit in n_USBSTS register is a one the controller will issue an interrupt.
                TIE1: u1,
                padding: u6,
            }),
            ///  USB Frame Index Register
            FRINDEX: mmio.Mmio(packed struct(u32) {
                ///  FRINDEX Frame Index. The value, in this register, increments at the end of each time frame (micro-frame). Bits [N: 3] are used for the Frame List current index. This means that each location of the frame list is accessed 8 times (frames or micro-frames) before moving to the next index. The following illustrates values of N based on the value of the Frame List Size field in the USBCMD register, when used in host mode. USBCMD [Frame List Size] Number Elements N In device mode the value is the current frame number of the last frame transmitted. It is not used as an index. In either mode bits 2:0 indicate the current microframe. The bit field values description below is represented as (Frame List Size) Number Elements N. 00000000000000 - (1024) 12 00000000000001 - (512) 11 00000000000010 - (256) 10 00000000000011 - (128) 9 00000000000100 - (64) 8 00000000000101 - (32) 7 00000000000110 - (16) 6 00000000000111 - (8) 5
                FRINDEX: u14,
                padding: u18,
            }),
            reserved340: [4]u8,
            ///  Device Address Register
            DEVICEADDR: mmio.Mmio(packed struct(u32) {
                reserved24: u24,
                ///  USBADRA Device Address Advance. Default=0. When this bit is '0', any writes to USBADR are instantaneous. When this bit is written to a '1' at the same time or before USBADR is written, the write to the USBADR field is staged and held in a hidden register. After an IN occurs on endpoint 0 and is ACKed, USBADR will be loaded from the holding register. Hardware will automatically clear this bit on the following conditions: 1) IN is ACKed to endpoint 0. (USBADR is updated from staging register). 2) OUT/SETUP occur to endpoint 0. (USBADR is not updated). 3) Device Reset occurs (USBADR is reset to 0). NOTE: After the status phase of the SET_ADDRESS descriptor, the DCD has 2 ms to program the USBADR field. This mechanism will ensure this specification is met when the DCD can not write of the device address within 2ms from the SET_ADDRESS status phase. If the DCD writes the USBADR with USBADRA=1 after the SET_ADDRESS data phase (before the prime of the status phase), the USBADR will be programmed instantly at the correct time and meet the 2ms USB requirement.
                USBADRA: u1,
                ///  USBADR Device Address. These bits correspond to the USB device address
                USBADR: u7,
            }),
            ///  Next Asynch. Address Register
            ASYNCLISTADDR: mmio.Mmio(packed struct(u32) {
                reserved5: u5,
                ///  ASYBASE Link Pointer Low (LPL). These bits correspond to memory address signals [31:5], respectively. This field may only reference a Queue Head (QH). Only used by the host controller.
                ASYBASE: u27,
            }),
            reserved352: [4]u8,
            ///  Programmable Burst Size Register
            BURSTSIZE: mmio.Mmio(packed struct(u32) {
                ///  RXPBURST Programmable RX Burst Size. Default value is determined by TXBURST bits in n_HWRXBUF. This register represents the maximum length of a the burst in 32-bit words while moving data from the USB bus to system memory.
                RXPBURST: u8,
                ///  TXPBURST Programmable TX Burst Size. Default value is determined by TXBURST bits in n_HWTXBUF. This register represents the maximum length of a the burst in 32-bit words while moving data from system memory to the USB bus.
                TXPBURST: u8,
                padding: u16,
            }),
            ///  TX FIFO Fill Tuning Register
            TXFILLTUNING: mmio.Mmio(packed struct(u32) {
                ///  TXSCHOH Scheduler Overhead. (Read/Write) [Default = 0] This register adds an additional fixed offset to the schedule time estimator described above as Tff. As an approximation, the value chosen for this register should limit the number of back-off events captured in the TXSCHHEALTH to less than 10 per second in a highly utilized bus. Choosing a value that is too high for this register is not desired as it can needlessly reduce USB utilization. The time unit represented in this register is 1.267us when a device is connected in High-Speed Mode. The time unit represented in this register is 6.333us when a device is connected in Low/Full Speed Mode. Default value is '08h' for OTG controller core .
                TXSCHOH: u7,
                reserved8: u1,
                ///  TXSCHHEALTH Scheduler Health Counter. (Read/Write To Clear) Table continues on the next page This register increments when the host controller fails to fill the TX latency FIFO to the level programmed by TXFIFOTHRES before running out of time to send the packet before the next Start-Of-Frame. This health counter measures the number of times this occurs to provide feedback to selecting a proper TXSCHOH. Writing to this register will clear the counter and this counter will max. at 31.
                TXSCHHEALTH: u5,
                reserved16: u3,
                ///  TXFIFOTHRES FIFO Burst Threshold. (Read/Write) This register controls the number of data bursts that are posted to the TX latency FIFO in host mode before the packet begins on to the bus. The minimum value is 2 and this value should be a low as possible to maximize USB performance. A higher value can be used in systems with unpredictable latency and/or insufficient bandwidth where the FIFO may underrun because the data transferred from the latency FIFO to USB occurs before it can be replenished from system memory. This value is ignored if the Stream Disable bit in USB_n_USBMODE register is set.
                TXFIFOTHRES: u6,
                padding: u10,
            }),
            reserved376: [16]u8,
            ///  Endpoint NAK Register
            ENDPTNAK: mmio.Mmio(packed struct(u32) {
                ///  EPRN RX Endpoint NAK - R/WC. Each RX endpoint has 1 bit in this field. The bit is set when the device sends a NAK handshake on a received OUT or PING token for the corresponding endpoint. Bit [N] - Endpoint #[N], N is 0-7
                EPRN: u8,
                reserved16: u8,
                ///  EPTN TX Endpoint NAK - R/WC. Each TX endpoint has 1 bit in this field. The bit is set when the device sends a NAK handshake on a received IN token for the corresponding endpoint. Bit [N] - Endpoint #[N], N is 0-7
                EPTN: u8,
                padding: u8,
            }),
            ///  Endpoint NAK Enable Register
            ENDPTNAKEN: mmio.Mmio(packed struct(u32) {
                ///  EPRNE RX Endpoint NAK Enable - R/W. Each bit is an enable bit for the corresponding RX Endpoint NAK bit. If this bit is set and the corresponding RX Endpoint NAK bit is set, the NAK Interrupt bit is set. Bit [N] - Endpoint #[N], N is 0-7
                EPRNE: u8,
                reserved16: u8,
                ///  EPTNE TX Endpoint NAK Enable - R/W. Each bit is an enable bit for the corresponding TX Endpoint NAK bit. If this bit is set and the corresponding TX Endpoint NAK bit is set, the NAK Interrupt bit is set. Bit [N] - Endpoint #[N], N is 0-7
                EPTNE: u8,
                padding: u8,
            }),
            reserved388: [4]u8,
            ///  Port Status & Control
            PORTSC1: mmio.Mmio(packed struct(u32) {
                ///  CCS Current Connect Status-Read Only. In Host Mode: 1=Device is present on port. 0=No device is present. Default = 0. This value reflects the current state of the port, and may not correspond directly to the event that caused the Connect Status Change bit (Bit 1) to be set. This field is zero if Port Power(PORTSC1) is zero in host mode. In Device Mode: 1=Attached. 0=Not Attached. Default=0. A one indicates that the device successfully attached and is operating in either high speed or full speed as indicated by the High Speed Port bit in this register. A zero indicates that the device did not attach successfully or was forcibly disconnected by the software writing a zero to the Run bit in the USBCMD register. It does not state the device being disconnected or Suspended.
                CCS: u1,
                ///  CSC Connect Status Change-R/WC. 1 =Change in Current Connect Status. 0=No change. Default 0. In Host Mode: Indicates a change has occurred in the port's Current Connect Status. The host/device controller sets this bit for all changes to the port device connect status, even if system software has not cleared an existing connect status change. For example, the insertion status changes twice before system software has cleared the changed condition, hub hardware will be 'setting' an already-set bit (that is, the bit will remain set). Software clears this bit by writing a one to it. This field is zero if Port Power(PORTSC1) is zero in host mode. In Device Mode: This bit is undefined in device controller mode.
                CSC: u1,
                ///  PE Port Enabled/Disabled-Read/Write. 1=Enable. 0=Disable. Default 0. In Host Mode: Ports can only be enabled by the host controller as a part of the reset and enable. Software cannot enable a port by writing a one to this field. Ports can be disabled by either a fault condition (disconnect event or other fault condition) or by the host software. Note that the bit status does not change until the port state actually changes. There may be a delay in disabling or enabling a port due to other host controller and bus events. When the port is disabled, (0b) downstream propagation of data is blocked except for reset. This field is zero if Port Power(PORTSC1) is zero in host mode. In Device Mode: The device port is always enabled, so this bit is always '1b'.
                PE: u1,
                ///  PEC Port Enable/Disable Change-R/WC. 1=Port enabled/disabled status has changed. 0=No change. Default = 0. In Host Mode: For the root hub, this bit is set to a one only when a port is disabled due to disconnect on the port or due to the appropriate conditions existing at the EOF2 point (See Chapter 11 of the USB Specification). Software clears this by writing a one to it. This field is zero if Port Power(PORTSC1) is zero. In Device mode: The device port is always enabled, so this bit is always '0b'.
                PEC: u1,
                ///  OCA Over-current Active-Read Only. Default 0. This bit will automatically transition from one to zero when the over current condition is removed. 0 - This port does not have an over-current condition. 1 - This port currently has an over-current condition
                OCA: u1,
                ///  OCC Over-current Change-R/WC. Default=0. This bit is set '1b' by hardware when there is a change to Over-current Active. Software can clear this bit by writing a one to this bit position.
                OCC: u1,
                ///  FPR Force Port Resume -Read/Write. 1= Resume detected/driven on port. 0=No resume (K-state) detected driven on port. Default = 0. In Host Mode: Software sets this bit to one to drive resume signaling. The Host Controller sets this bit to one if a J-to-K transition is detected while the port is in the Suspend state. When this bit transitions to a one because a J-to-K transition is detected, the Port Change Detect bit in the USBSTS register is also set to one. This bit will automatically change to zero after the resume sequence is complete. This behavior is different from EHCI where the host controller driver is required to set this bit to a zero after the resume duration is timed in the driver. Note that when the Host controller owns the port, the resume sequence follows the defined sequence documented in the USB Specification Revision 2.0. The resume signaling (Full-speed 'K') is driven on the port as long as this bit remains a one. This bit will remain a one until the port has switched to the high-speed idle. Writing a zero has no effect because the port controller will time the resume operation, clear the bit the port control state switches to HS or FS idle. This field is zero if Port Power(PORTSC1) is zero in host mode. This bit is not-EHCI compatible. In Device mode: After the device has been in Suspend State for 5ms or more, software must set this bit to one to drive resume signaling before clearing. The Device Controller will set this bit to one if a J-to-K transition is detected while the port is in the Suspend state. The bit will be cleared when the device returns to normal operation. Also, when this bit wil be cleared because a K-to-J transition detected, the Port Change Detect bit in the USBSTS register is also set to one.
                FPR: u1,
                ///  SUSP Suspend - Read/Write or Read Only. Default = 0b. 1=Port in suspend state. 0=Port not in suspend state. In Host Mode: Read/Write. Port Enabled Bit and Suspend bit of this register define the port states as follows: Bits [Port Enabled, Suspend] Port State 0x Disable 10 Enable 11 Suspend When in suspend state, downstream propagation of data is blocked on this port, except for port reset. The blocking occurs at the end of the current transaction if a transaction was in progress when this bit was written to 1. In the suspend state, the port is sensitive to resume detection. Note that the bit status does not change until the port is suspended and that there may be a delay in suspending a port if there is a transaction currently in progress on the USB. The host controller will unconditionally set this bit to zero when software sets the Force Port Resume bit to zero. The host controller ignores a write of zero to this bit. If host software sets this bit to a one when the port is not enabled (that is, Port enabled bit is a zero) the results are undefined. This field is zero if Port Power(PORTSC1) is zero in host mode. In Device Mode: Read Only. In device mode this bit is a read only status bit.
                SUSP: u1,
                ///  PR Port Reset - Read/Write or Read Only. Default = 0b. In Host Mode: Read/Write. 1=Port is in Reset. 0=Port is not in Reset. Default 0. When software writes a one to this bit the bus-reset sequence as defined in the USB Specification Revision 2.0 is started. This bit will automatically change to zero after the reset sequence is complete. This behavior is different from EHCI where the host controller driver is required to set this bit to a zero after the reset duration is timed in the driver. In Device Mode: This bit is a read only status bit. Device reset from the USB bus is also indicated in the USBSTS register.
                PR: u1,
                ///  HSP High-Speed Port - Read Only. Default = 0b. When the bit is one, the host/device connected to the port is in high-speed mode and if set to zero, the host/device connected to the port is not in a high-speed mode. NOTE: HSP is redundant with PSPD(bit 27, 26) but remained for compatibility.
                HSP: u1,
                ///  LS Line Status-Read Only. These bits reflect the current logical levels of the D+ (bit 11) and D- (bit 10) signal lines. In host mode, the use of linestate by the host controller driver is not necessary (unlike EHCI), because the port controller state machine and the port routing manage the connection of LS and FS. In device mode, the use of linestate by the device controller driver is not necessary. The encoding of the bits are: Bits [11:10] Meaning 00 - SE0 01 - K-state 10 - J-state 11 - Undefined
                LS: u2,
                ///  PP Port Power (PP)-Read/Write or Read Only. The function of this bit depends on the value of the Port Power Switching (PPC) field in the HCSPARAMS register. The behavior is as follows: PPC PP Operation 0 1b Read Only - Host controller does not have port power control switches. Each port is hard-wired to power. 1 1b/0b - Read/Write. OTG controller requires port power control switches. This bit represents the current setting of the switch (0=off, 1=on). When power is not available on a port (that is, PP equals a 0), the port is non-functional and will not report attaches, detaches, etc. When an over-current condition is detected on a powered port and PPC is a one, the PP bit in each affected port may be transitional by the host controller driver from a one to a zero (removing power from the port). This feature is implemented in all controller cores (PPC = 1).
                PP: u1,
                reserved16: u3,
                ///  PTC Port Test Control - Read/Write. Default = 0000b. Refer to Port Test Mode for the operational model for using these test modes and the USB Specification Revision 2.0, Chapter 7 for details on each test mode. The FORCE_ENABLE_FS and FORCE ENABLE_LS are extensions to the test mode support specified in the EHCI specification. Writing the PTC field to any of the FORCE_ENABLE_{HS/FS/LS} values will force the port into the connected and enabled state at the selected speed. Writing the PTC field back to TEST_MODE_DISABLE will allow the port state machines to progress normally from that point. NOTE: Low speed operations are not supported as a peripheral device. Any other value than zero indicates that the port is operating in test mode. Value Specific Test 0000 - TEST_MODE_DISABLE 0001 - J_STATE 0010 - K_STATE 0011 - SE0 (host) / NAK (device) 0100 - Packet 0101 - FORCE_ENABLE_HS 0110 - FORCE_ENABLE_FS 0111 - FORCE_ENABLE_LS 1000-1111 - Reserved
                PTC: u4,
                ///  WKCN Wake on Connect Enable (WKCNNT_E) - Read/Write. Default=0b. Writing this bit to a one enables the port to be sensitive to device connects as wake-up events. This field is zero if Port Power(PORTSC1) is zero or in device mode.
                WKCN: u1,
                ///  WKDC Wake on Disconnect Enable (WKDSCNNT_E) - Read/Write. Default=0b. Writing this bit to a one enables the port to be sensitive to device disconnects as wake-up events. This field is zero if Port Power(PORTSC1) is zero or in device mode.
                WKDC: u1,
                ///  WKOC Wake on Over-current Enable (WKOC_E) - Read/Write. Default = 0b. Writing this bit to a one enables the port to be sensitive to over-current conditions as wake-up events. This field is zero if Port Power(PORTSC1) is zero.
                WKOC: u1,
                ///  PHCD PHY Low Power Suspend - Clock Disable (PLPSCD) - Read/Write. Default = 0b. When this bit is set to '1b', the PHY clock is disabled. Reading this bit will indicate the status of the PHY clock. NOTE: The PHY clock cannot be disabled if it is being used as the system clock. In device mode, The PHY can be put into Low Power Suspend when the device is not running (USBCMD Run/Stop=0b) or the host has signalled suspend (PORTSC1 SUSPEND=1b). PHY Low power suspend will be cleared automatically when the host initials resume. Before forcing a resume from the device, the device controller driver must clear this bit. In host mode, the PHY can be put into Low Power Suspend when the downstream device has been put into suspend mode or when no downstream device is connected. Low power suspend is completely under the control of software. 0 - Enable PHY clock 1 - Disable PHY clock
                PHCD: u1,
                ///  PFSC Port Force Full Speed Connect - Read/Write. Default = 0b. When this bit is set to '1b', the port will be forced to only connect at Full Speed, It disables the chirp sequence that allows the port to identify itself as High Speed. 0 - Normal operation 1 - Forced to full speed
                PFSC: u1,
                reserved26: u1,
                ///  PSPD Port Speed - Read Only. This register field indicates the speed at which the port is operating. 00 - Full Speed 01 - Low Speed 10 - High Speed 11 - Undefined
                PSPD: u2,
                ///  PTW Parallel Transceiver Width This bit has no effect if serial interface engine is used. 0 - Select the 8-bit UTMI interface [60MHz] 1 - Select the 16-bit UTMI interface [30MHz]
                PTW: u1,
                ///  STS Serial Transceiver Select 1 Serial Interface Engine is selected 0 Parallel Interface signals is selected Serial Interface Engine can be used in combination with UTMI+/ULPI physical interface to provide FS/LS signaling instead of the parallel interface signals. When this bit is set '1b', serial interface engine will be used instead of parallel interface signals.
                STS: u1,
                padding: u2,
            }),
            reserved420: [28]u8,
            ///  On-The-Go Status & control Register
            OTGSC: mmio.Mmio(packed struct(u32) {
                ///  VD VBUS_Discharge - Read/Write. Setting this bit causes VBus to discharge through a resistor.
                VD: u1,
                ///  VC VBUS Charge - Read/Write. Setting this bit causes the VBus line to be charged. This is used for VBus pulsing during SRP.
                VC: u1,
                reserved5: u3,
                ///  IDPU ID Pullup - Read/Write This bit provide control over the ID pull-up resistor; 0 = off, 1 = on [default]. When this bit is 0, the ID input will not be sampled.
                IDPU: u1,
                reserved8: u2,
                ///  ID USB ID - Read Only. 0 = A device, 1 = B device
                ID: u1,
                ///  AVV A VBus Valid - Read Only. Indicates VBus is above the A VBus valid threshold.
                AVV: u1,
                ///  ASV A Session Valid - Read Only. Indicates VBus is above the A session valid threshold.
                ASV: u1,
                reserved16: u5,
                ///  IDIS USB ID Interrupt Status - Read/Write. This bit is set when a change on the ID input has been detected. Software must write a one to clear this bit.
                IDIS: u1,
                ///  AVVIS A VBus Valid Interrupt Status - Read/Write to Clear. This bit is set when VBus has either risen above or fallen below the VBus valid threshold on an A device. Software must write a one to clear this bit.
                AVVIS: u1,
                ///  ASVIS A Session Valid Interrupt Status - Read/Write to Clear. This bit is set when VBus has either risen above or fallen below the A session valid threshold. Software must write a one to clear this bit.
                ASVIS: u1,
                reserved24: u5,
                ///  IDIE USB ID Interrupt Enable - Read/Write. Setting this bit enables the USB ID interrupt.
                IDIE: u1,
                ///  AVVIE A VBus Valid Interrupt Enable - Read/Write. Setting this bit enables the A VBus valid interrupt.
                AVVIE: u1,
                ///  ASVIE A Session Valid Interrupt Enable - Read/Write.
                ASVIE: u1,
                padding: u5,
            }),
            ///  USB Device Mode Register
            USBMODE: mmio.Mmio(packed struct(u32) {
                ///  CM Controller Mode - R/WO. Controller mode is defaulted to the proper mode for host only and device only implementations. For those designs that contain both host & device capability, the controller defaults to an idle state and needs to be initialized to the desired operating mode after reset. For combination host/ device controllers, this register can only be written once after reset. If it is necessary to switch modes, software must reset the controller by writing to the RESET bit in the USBCMD register before reprogramming this register. For OTG controller core, reset value is '00b'. 00 - Idle [Default for combination host/device] 01 - Reserved 10 - Device Controller [Default for device only controller] 11 - Host Controller [Default for host only controller]
                CM: u2,
                ///  ES Endian Select - Read/Write. This bit can change the byte alignment of the transfer buffers to match the host microprocessor. The bit fields in the microprocessor interface and the data structures are unaffected by the value of this bit because they are based upon the 32-bit word. Bit Meaning 0 - Little Endian [Default] 1 - Big Endian
                ES: u1,
                ///  SLOM Setup Lockout Mode. In device mode, this bit controls behavior of the setup lock mechanism. See Control Endpoint Operation Model . 0 - Setup Lockouts On (default); 1 - Setup Lockouts Off. DCD requires use of Setup Data Buffer Tripwire in USBCMD.
                SLOM: u1,
                ///  SDIS Stream Disable Mode. (0 - Inactive [default]; 1 - Active) Device Mode: Setting to a '1' disables double priming on both RX and TX for low bandwidth systems. This mode ensures that when the RX and TX buffers are sufficient to contain an entire packet that the standard double buffering scheme is disabled to prevent overruns/underruns in bandwidth limited systems. Note: In High Speed Mode, all packets received are responded to with a NYET handshake when stream disable is active. Host Mode: Setting to a '1' ensures that overruns/underruns of the latency FIFO are eliminated for low bandwidth systems where the RX and TX buffers are sufficient to contain the entire packet. Enabling stream disable also has the effect of ensuring the TX latency is filled to capacity before the packet is launched onto the USB. NOTE: Time duration to pre-fill the FIFO becomes significant when stream disable is active. See TXFILLTUNING and TXTTFILLTUNING [MPH Only] to characterize the adjustments needed for the scheduler when using this feature. NOTE: The use of this feature substantially limits of the overall USB performance that can be achieved.
                SDIS: u1,
                padding: u27,
            }),
            ///  Endpoint Setup Status Register
            ENDPTSETUPSTAT: mmio.Mmio(packed struct(u32) {
                ///  ENDPTSETUPSTAT Setup Endpoint Status. For every setup transaction that is received, a corresponding bit in this register is set to one. Software must clear or acknowledge the setup transfer by writing a one to a respective bit after it has read the setup data from Queue head. The response to a setup packet as in the order of operations and total response time is crucial to limit bus time outs while the setup lock out mechanism is engaged. This register is only used in device mode.
                ENDPTSETUPSTAT: u8,
                padding: u24,
            }),
            ///  Endpoint Prime Register
            ENDPTPRIME: mmio.Mmio(packed struct(u32) {
                ///  PERB Prime Endpoint Receive Buffer - R/WS. For each endpoint, a corresponding bit is used to request a buffer prepare for a receive operation for when a USB host initiates a USB OUT transaction. Software should write a one to the corresponding bit whenever posting a new transfer descriptor to an endpoint queue head. Hardware automatically uses this bit to begin parsing for a new transfer descriptor from the queue head and prepare a receive buffer. Hardware clears this bit when the associated endpoint(s) is (are) successfully primed. NOTE: These bits are momentarily set by hardware during hardware re-priming operations when a dTD is retired, and the dQH is updated. PERB[N] - Endpoint #N, N is in 0..7
                PERB: u8,
                reserved16: u8,
                ///  PETB Prime Endpoint Transmit Buffer - R/WS. For each endpoint a corresponding bit is used to request that a buffer is prepared for a transmit operation in order to respond to a USB IN/INTERRUPT transaction. Software should write a one to the corresponding bit when posting a new transfer descriptor to an endpoint queue head. Hardware automatically uses this bit to begin parsing for a new transfer descriptor from the queue head and prepare a transmit buffer. Hardware clears this bit when the associated endpoint(s) is (are) successfully primed. NOTE: These bits are momentarily set by hardware during hardware re-priming operations when a dTD is retired, and the dQH is updated. PETB[N] - Endpoint #N, N is in 0..7
                PETB: u8,
                padding: u8,
            }),
            ///  Endpoint Flush Register
            ENDPTFLUSH: mmio.Mmio(packed struct(u32) {
                ///  FERB Flush Endpoint Receive Buffer - R/WS. Writing one to a bit(s) causes the associated endpoint(s) to clear any primed buffers. If a packet is in progress for one of the associated endpoints, then that transfer continues until completion. Hardware clears this register after the endpoint flush operation is successful. FERB[N] - Endpoint #N, N is in 0..7
                FERB: u8,
                reserved16: u8,
                ///  FETB Flush Endpoint Transmit Buffer - R/WS. Writing one to a bit(s) in this register causes the associated endpoint(s) to clear any primed buffers. If a packet is in progress for one of the associated endpoints, then that transfer continues until completion. Hardware clears this register after the endpoint flush operation is successful. FETB[N] - Endpoint #N, N is in 0..7
                FETB: u8,
                padding: u8,
            }),
            ///  Endpoint Status Register
            ENDPTSTAT: mmio.Mmio(packed struct(u32) {
                ///  ERBR Endpoint Receive Buffer Ready -- Read Only. One bit for each endpoint indicates status of the respective endpoint buffer. This bit is set to a one by the hardware as a response to receiving a command from a corresponding bit in the ENDPRIME register. There is always a delay between setting a bit in the ENDPRIME register and endpoint indicating ready. This delay time varies based upon the current USB traffic and the number of bits set in the ENDPRIME register. Buffer ready is cleared by USB reset, by the USB DMA system, or through the ENDPTFLUSH register. NOTE: These bits are momentarily cleared by hardware during hardware endpoint re-priming operations when a dTD is retired, and the dQH is updated. ERBR[N] - Endpoint #N, N is in 0..7
                ERBR: u8,
                reserved16: u8,
                ///  ETBR Endpoint Transmit Buffer Ready -- Read Only. One bit for each endpoint indicates status of the respective endpoint buffer. This bit is set to one by the hardware as a response to receiving a command from a corresponding bit in the ENDPTPRIME register. There is always a delay between setting a bit in the ENDPTPRIME register and endpoint indicating ready. This delay time varies based upon the current USB traffic and the number of bits set in the ENDPRIME register. Buffer ready is cleared by USB reset, by the USB DMA system, or through the ENDPTFLUSH register. NOTE: These bits are momentarily cleared by hardware during hardware endpoint re-priming operations when a dTD is retired, and the dQH is updated. ETBR[N] - Endpoint #N, N is in 0..7
                ETBR: u8,
                padding: u8,
            }),
            ///  Endpoint Complete Register
            ENDPTCOMPLETE: mmio.Mmio(packed struct(u32) {
                ///  ERCE Endpoint Receive Complete Event - RW/C. Each bit indicates a received event (OUT/SETUP) occurred and software should read the corresponding endpoint queue to determine the transfer status. If the corresponding IOC bit is set in the Transfer Descriptor, then this bit is set simultaneously with the USBINT . Writing one clears the corresponding bit in this register. ERCE[N] - Endpoint #N, N is in 0..7
                ERCE: u8,
                reserved16: u8,
                ///  ETCE Endpoint Transmit Complete Event - R/WC. Each bit indicates a transmit event (IN/INTERRUPT) occurred and software should read the corresponding endpoint queue to determine the endpoint status. If the corresponding IOC bit is set in the Transfer Descriptor, then this bit is set simultaneously with the USBINT . Writing one clears the corresponding bit in this register. ETCE[N] - Endpoint #N, N is in 0..7
                ETCE: u8,
                padding: u8,
            }),
            reserved512: [64]u8,
            ///  No description avaiable
            OTG_CTRL0: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  for naneng usbphy, only switch to serial mode when suspend
                SER_MODE_SUSPEND_EN: u1,
                reserved7: u2,
                ///  No description avaiable
                OTG_OVER_CUR_DIS: u1,
                ///  No description avaiable
                OTG_OVER_CUR_POL: u1,
                ///  No description avaiable
                OTG_POWER_MASK: u1,
                ///  No description avaiable
                OTG_WAKEUP_INT_ENABLE: u1,
                ///  default 1 for naneng usbphy
                OTG_UTMI_RESET_SW: u1,
                ///  default 0 for naneng usbphy
                OTG_UTMI_SUSPENDM_SW: u1,
                ///  No description avaiable
                OTG_VBUS_SOURCE_SEL: u1,
                reserved16: u2,
                ///  No description avaiable
                OTG_ID_WAKEUP_EN: u1,
                ///  No description avaiable
                OTG_VBUS_WAKEUP_EN: u1,
                reserved19: u1,
                ///  No description avaiable
                AUTORESUME_EN: u1,
                reserved25: u5,
                ///  No description avaiable
                OTG_WKDPDMCHG_EN: u1,
                padding: u6,
            }),
            reserved528: [12]u8,
            ///  No description avaiable
            PHY_CTRL0: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                VBUS_VALID_OVERRIDE_EN: u1,
                ///  No description avaiable
                SESS_VALID_OVERRIDE_EN: u1,
                ///  No description avaiable
                ID_DIG_OVERRIDE_EN: u1,
                reserved12: u9,
                ///  No description avaiable
                VBUS_VALID_OVERRIDE: u1,
                ///  No description avaiable
                SESS_VALID_OVERRIDE: u1,
                ///  No description avaiable
                ID_DIG_OVERRIDE: u1,
                reserved25: u10,
                ///  No description avaiable
                GPIO_ID_SEL_N: u1,
                padding: u6,
            }),
            ///  No description avaiable
            PHY_CTRL1: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  OTG suspend, not utmi_suspendm
                UTMI_OTG_SUSPENDM: u1,
                reserved20: u18,
                ///  No description avaiable
                UTMI_CFG_RST_N: u1,
                padding: u11,
            }),
            reserved544: [8]u8,
            ///  No description avaiable
            TOP_STATUS: mmio.Mmio(packed struct(u32) {
                reserved31: u31,
                ///  No description avaiable
                WAKEUP_INT_STATUS: u1,
            }),
            ///  No description avaiable
            PHY_STATUS: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                VBUS_VALID: u1,
                reserved2: u1,
                ///  No description avaiable
                UTMI_SESS_VALID: u1,
                reserved4: u1,
                ///  No description avaiable
                ID_DIG: u1,
                ///  No description avaiable
                HOST_DISCONNECT: u1,
                ///  No description avaiable
                LINE_STATE: u2,
                reserved31: u23,
                ///  No description avaiable
                UTMI_CLK_VALID: u1,
            }),
        };

        ///  IOC
        pub const IOC = struct {};

        ///  I2C0
        pub const I2C0 = extern struct {
            reserved16: [16]u8,
            ///  Configuration Register
            Cfg: mmio.Mmio(packed struct(u32) {
                ///  FIFO Size: 0: 2 bytes 1: 4 bytes 2: 8 bytes 3: 16 bytes
                FIFOSIZE: u2,
                padding: u30,
            }),
            ///  Interrupt Enable Register
            IntEn: mmio.Mmio(packed struct(u32) {
                ///  Set to enabled the FIFO Empty Interrupt Interrupts when the FIFO is empty.
                FIFOEMPTY: u1,
                ///  Set to enable the FIFO Full Interrupt. Interrupts when the FIFO is full.
                FIFOFULL: u1,
                ///  Set to enable the FIFO Half Interrupt. Receiver: Interrupts when the FIFO is half-empty, i.e, there is >= 1/2 entries in the FIFO. Transmitter: Interrupts when the FIFO is half-empty, i.e. there is <= 1/2 entries in the FIFO. This interrupt depends on the transaction direction; don’t enable this interrupt unless the transfer direction is determined, otherwise unintended interrupts may be triggered.
                FIFOHALF: u1,
                ///  Set to enable the Address Hit Interrupt. Master: interrupts when the addressed slave returned an ACK. Slave: interrupts when the controller is addressed.
                ADDRHIT: u1,
                ///  Set to enable the Arbitration Lose Interrupt. Master: interrupts when the controller loses the bus arbitration Slave: not available in this mode.
                ARBLOSE: u1,
                ///  Set to enable the STOP Condition Interrupt Interrupts when a STOP condition is detected.
                STOP: u1,
                ///  Set to enable the START Condition Interrupt. Interrupts when a START condition/repeated START condition is detected.
                START: u1,
                ///  Set to enable the Byte Transmit Interrupt. Interrupts when a byte of data is transmitted.
                BYTETRANS: u1,
                ///  Set to enable the Byte Receive Interrupt. Interrupts when a byte of data is received Auto-ACK will be disabled if this interrupt is enabled, that is, the software needs to ACK/NACK the received byte manually.
                BYTERECV: u1,
                ///  Set to enable the Completion Interrupt. Master: interrupts when a transaction is issued from this master and completed without losing the bus arbitration. Slave: interrupts when a transaction addressing the controller is completed.
                CMPL: u1,
                padding: u22,
            }),
            ///  Status Register
            Status: mmio.Mmio(packed struct(u32) {
                ///  Indicates that the FIFO is empty.
                FIFOEMPTY: u1,
                ///  Indicates that the FIFO is full.
                FIFOFULL: u1,
                ///  Transmitter: Indicates that the FIFO is half-empty.
                FIFOHALF: u1,
                ///  Master: indicates that a slave has responded to the transaction. Slave: indicates that a transaction is targeting the controller (including the General Call).
                ADDRHIT: u1,
                ///  Indicates that the controller has lost the bus arbitration.
                ARBLOSE: u1,
                ///  Indicates that a STOP Condition has been transmitted/received.
                STOP: u1,
                ///  Indicates that a START Condition or a repeated START condition has been transmitted/received.
                START: u1,
                ///  Indicates that a byte of data has been transmitted.
                BYTETRANS: u1,
                ///  Indicates that a byte of data has been received.
                BYTERECV: u1,
                ///  Transaction Completion Master: Indicates that a transaction has been issued from this master and completed without losing the bus arbitration Slave: Indicates that a transaction addressing the controller has been completed. This status bit must be cleared to receive the next transaction; otherwise, the next incoming transaction will be blocked.
                CMPL: u1,
                ///  Indicates the type of the last received/transmitted acknowledgement bit: 1: ACK 0: NACK
                ACK: u1,
                ///  Indicates that the bus is busy The bus is busy when a START condition is on bus and it ends when a STOP condition is seen on bus 1: Busy 0: Not busy
                BUSBUSY: u1,
                ///  Indicates that the address of the current transaction is a general call address: 1: General call 0: Not general call
                GENCALL: u1,
                ///  Indicates the current status of the SCL line on the bus 1: high 0: low
                LINESCL: u1,
                ///  Indicates the current status of the SDA line on the bus 1: high 0: low
                LINESDA: u1,
                padding: u17,
            }),
            ///  Address Register
            Addr: mmio.Mmio(packed struct(u32) {
                ///  The slave address. For 7-bit addressing mode, the most significant 3 bits are ignored and only the least-significant 7 bits of Addr are valid
                ADDR: u10,
                padding: u22,
            }),
            ///  Data Register
            Data: mmio.Mmio(packed struct(u32) {
                ///  Write this register to put one byte of data to the FIFO. Read this register to get one byte of data from the FIFO.
                DATA: u8,
                padding: u24,
            }),
            ///  Control Register
            Ctrl: mmio.Mmio(packed struct(u32) {
                ///  Data counts in bytes. Master: The number of bytes to transmit/receive. 0 means max length. DataCnt will be decreased by one for each byte transmitted/received. Slave: the meaning of DataCnt depends on the DMA mode: If DMA is not enabled, DataCnt is the number of bytes transmitted/received from the bus master. It is reset to 0 when the controller is addressed and then increased by one for each byte of data transmitted/received. If DMA is enabled, DataCnt is the number of bytes to transmit/receive. It will not be reset to 0 when the slave is addressed and it will be decreased by one for each byte of data transmitted/received.
                DATACNT: u8,
                ///  Transaction direction Master: Set this bit to determine the direction for the next transaction. 0: Transmitter 1: Receiver Slave: The direction of the last received transaction. 0: Receiver 1: Transmitter
                DIR: u1,
                ///  Enable this bit to send a STOP condition at the end of a transaction. Master mode only.
                PHASE_STOP: u1,
                ///  Enable this bit to send the data after Address phase. Master mode only.
                PHASE_DATA: u1,
                ///  Enable this bit to send the address after START condition. Master mode only.
                PHASE_ADDR: u1,
                ///  Enable this bit to send a START condition at the beginning of transaction. Master mode only.
                PHASE_START: u1,
                ///  set to send reset signals(just toggle clock bus defined by reset_len). this register is clered when reset is end, can't be cleared by software
                RESET_ON: u1,
                ///  set to hold input clock to high when reset is active
                RESET_HOLD_SCKIN: u1,
                reserved20: u5,
                ///  reset clock cycles. the clock high/low time is defined by Setup.T_SCLHi, 50% duty cycle.
                RESET_LEN: u4,
                ///  Data counts in bytes. Master: The number of bytes to transmit/receive. 0 means max length. DataCnt will be decreased by one for each byte transmitted/received. Slave: the meaning of DataCnt depends on the DMA mode: If DMA is not enabled, DataCnt is the number of bytes transmitted/received from the bus master. It is reset to 0 when the controller is addressed and then increased by one for each byte of data transmitted/received. If DMA is enabled, DataCnt is the number of bytes to transmit/receive. It will not be reset to 0 when the slave is addressed and it will be decreased by one for each byte of data transmitted/received.
                DATACNT_HIGH: u8,
            }),
            ///  Command Register
            Cmd: mmio.Mmio(packed struct(u32) {
                ///  Write this register with the following values to perform the corresponding actions: 0x0: no action 0x1: issue a data transaction (Master only) 0x2: respond with an ACK to the received byte 0x3: respond with a NACK to the received byte 0x4: clear the FIFO 0x5: reset the I2C controller (abort current transaction, set the SDA and SCL line to the open-drain mode, reset the Status Register and the Interrupt Enable Register, and empty the FIFO) When issuing a data transaction by writing 0x1 to this register, the CMD field stays at 0x1 for the duration of the entire transaction, and it is only cleared to 0x0 after when the transaction has completed or when the controller loses the arbitration. Note: No transaction will be issued by the controller when all phases (Start, Address, Data and Stop) are disabled.
                CMD: u3,
                padding: u29,
            }),
            ///  Setup Register
            Setup: mmio.Mmio(packed struct(u32) {
                ///  Enable the I2C controller. 1: Enable 0: Disable
                IICEN: u1,
                ///  I2C addressing mode: 1: 10-bit addressing mode 0: 7-bit addressing mode
                ADDRESSING: u1,
                ///  Configure this device as a master or a slave. 1: Master mode 0: Slave mode
                MASTER: u1,
                ///  Enable the direct memory access mode data transfer. 1: Enable 0: Disable
                DMAEN: u1,
                ///  The HIGH period of generated SCL clock is defined by T_SCLHi. SCL HIGH period = (2 * tpclk) + (2 + T_SP + T_SCLHi) * tpclk* (TPM+1) The T_SCLHi value must be greater than T_SP and T_HDDAT values. This field is only valid when the controller is in the master mode.
                T_SCLHI: u9,
                ///  The LOW period of the generated SCL clock is defined by the combination of T_SCLRatio and T_SCLHi values. When T_SCLRatio = 0, the LOW period is equal to HIGH period. When T_SCLRatio = 1, the LOW period is roughly two times of HIGH period. SCL LOW period = (2 * tpclk) + (2 + T_SP + T_SCLHi * ratio) * tpclk * (TPM+1) 1: ratio = 2 0: ratio = 1 This field is only valid when the controller is in the master mode.
                T_SCLRADIO: u1,
                reserved16: u2,
                ///  T_HDDAT defines the data hold time after SCL goes LOW Hold time = (2 * tpclk) + (2 + T_SP + T_HDDAT) * tpclk* (TPM+1)
                T_HDDAT: u5,
                ///  T_SP defines the pulse width of spikes that must be suppressed by the input filter. Pulse width = T_SP * tpclk* (TPM+1)
                T_SP: u3,
                ///  T_SUDAT defines the data setup time before releasing the SCL. Setup time = (2 * tpclk) + (2 + T_SP + T_SUDAT) * tpclk* (TPM+1) tpclk = PCLK period TPM = The multiplier value in Timing Parameter Multiplier Register
                T_SUDAT: u5,
                padding: u3,
            }),
            ///  I2C Timing Paramater Multiplier
            TPM: mmio.Mmio(packed struct(u32) {
                ///  A multiplication value for I2C timing parameters. All the timing parameters in the Setup Register are multiplied by (TPM+1).
                TPM: u5,
                padding: u27,
            }),
        };

        ///  SYSCTL
        pub const SYSCTL = extern struct {
            reserved8192: [8192]u8,
            ///  Clock senario
            global00: mmio.Mmio(packed struct(u32) {
                ///  global clock override request bit0: override to preset0 bit1: override to preset1 bit2: override to preset2 bit3: override to preset3 bit4: override to preset4 bit5: override to preset5 bit6: override to preset6 bit7: override to preset7
                MUX: u8,
                padding: u24,
            }),
        };

        ///  ACMP
        pub const ACMP = struct {};

        ///  ADC0
        pub const ADC0 = extern struct {
            reserved48: [48]u8,
            ///  No description avaiable
            trg_dma_addr: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  buffer start address for trigger queue, 192byte total, 16 bytes for each trigger (4 bytes for each conversion)
                TRG_DMA_ADDR: u30,
            }),
            ///  No description avaiable
            trg_sw_sta: mmio.Mmio(packed struct(u32) {
                ///  which trigger for the SW trigger 0 for trig0a, 1 for trig0b… 3 for trig1a, …11 for trig3c
                TRIG_SW_INDEX: u4,
                ///  SW trigger start bit, HW will clear it after all conversions(up to 4) finished. SW should make sure it's 0 before set it.
                TRG_SW_STA: u1,
                padding: u27,
            }),
            reserved1280: [1224]u8,
            ///  No description avaiable
            buf_cfg0: mmio.Mmio(packed struct(u32) {
                ///  set to disable read waiting, get result immediately but maybe not current conversion result.
                WAIT_DIS: u1,
                ///  bus mode enable
                BUS_MODE_EN: u1,
                padding: u30,
            }),
            reserved2048: [764]u8,
            ///  No description avaiable
            seq_cfg0: mmio.Mmio(packed struct(u32) {
                ///  set to enable external HW trigger, only trigger on posedge
                HW_TRIG_EN: u1,
                ///  set to enable SW trigger
                SW_TRIG_EN: u1,
                ///  SW trigger, pulse signal, cleared by HW one cycle later
                SW_TRIG: u1,
                ///  if set, HW will continue process the queue till end(seq_len) after trigger once
                CONT_EN: u1,
                ///  if set together with cont_en, HW will continue process the whole queue after trigger once. If cont_en is 0, this bit is not used
                RESTART_EN: u1,
                reserved8: u3,
                ///  sequence queue length, 0 for one, 0xF for 16
                SEQ_LEN: u4,
                reserved31: u19,
                ///  current dma write cycle bit
                CYCLE: u1,
            }),
            ///  No description avaiable
            seq_dma_addr: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  dma target address, should be 4-byte aligned
                TAR_ADDR: u30,
            }),
            ///  No description avaiable
            seq_wr_addr: mmio.Mmio(packed struct(u32) {
                ///  HW update this field after each dma write, it indicate the next dma write pointer. dma write address is (tar_addr+seq_wr_pointer)*4
                SEQ_WR_POINTER: u24,
                padding: u8,
            }),
            ///  No description avaiable
            seq_dma_cfg: mmio.Mmio(packed struct(u32) {
                ///  dma buffer length, after write to (tar_addr[31:2]+buf_len)*4, the next dma address will be tar_addr[31:2]*4 0 for 4byte; 0xFFF for 16kbyte.
                BUF_LEN: u12,
                ///  set to stop dma if reach the stop_pos
                STOP_EN: u1,
                ///  set this bit will reset HW dma write pointer to seq_dma_addr, and set HW cycle bit to 1. dma is halted if this bit is set. SW should clear all cycle bit in buffer to 0 before clear dma_rst
                DMA_RST: u1,
                reserved16: u2,
                ///  if stop_en is set, SW is responsible to udpate this field to the next read point, HW should not write data to this point since it's not read out by SW yet
                STOP_POS: u12,
                padding: u4,
            }),
            reserved2128: [64]u8,
            ///  No description avaiable
            seq_high_cfg: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                BUF_LEN_HIGH: u12,
                ///  No description avaiable
                STOP_POS_HIGH: u12,
                padding: u8,
            }),
            reserved4356: [2224]u8,
            ///  No description avaiable
            conv_cfg1: mmio.Mmio(packed struct(u32) {
                ///  clock_period, N half clock cycle per half adc cycle 0 for same adc_clk and bus_clk, 1 for 1:2, 2 for 1:3, ... 15 for 1:16 Note: set to 2 can genenerate 66.7MHz adc_clk at 200MHz bus_clk
                CLOCK_DIVIDER: u4,
                ///  convert clock numbers, set to 21 (0x15) for 16bit mode, which means convert need 21 adc clock cycles(based on clock after divider); user can use small value to get faster convertion, but less accuracy, need to config cov_end_cnt at adc16_config1 also. Ex: use 200MHz bus clock for adc, set sample_clock_number to 4, sample_clock_number_shift to 0, covert_clk_number to 21 for 16bit mode, clock_divder to 3, then each ADC convertion(plus sample) need 25 cycles(50MHz).
                CONVERT_CLOCK_NUMBER: u5,
                padding: u23,
            }),
            ///  No description avaiable
            adc_cfg0: mmio.Mmio(packed struct(u32) {
                ///  set to enable trg queue stop other queues
                PORT3_REALTIME: u1,
                reserved12: u11,
                ///  for trigger queue, from trg_sample_req to trg_convert_req
                CONVERT_DURATION: u16,
                reserved29: u1,
                ///  set to 1 to enable ADC DMA to write data to soc memory bus, for trig queue and seq queue;
                ADC_AHB_EN: u1,
                reserved31: u1,
                ///  set to 1 will enable sync AHB bus, to get better bus performance. Adc_clk must to be set to same as bus clock at this mode
                SEL_SYNC_AHB: u1,
            }),
            reserved4368: [4]u8,
            ///  No description avaiable
            int_sts: mmio.Mmio(packed struct(u32) {
                ///  set if one chanel watch dog event triggered
                WDOG: u14,
                reserved21: u7,
                ///  set if got hresp=1, generally caused by wrong trg_dma_addr or seq_dma_addr
                AHB_ERR: u1,
                ///  DMA fifo full interrupt, user need to check clock frequency if it's set.
                DMA_FIFO_FULL: u1,
                ///  one conversion complete in seq_queue if related seq_int_en is set
                SEQ_CVC: u1,
                ///  the whole sequence complete interrupt
                SEQ_CMPT: u1,
                ///  dma abort interrupt, set if seqence dma write pointer reachs sw read pointer if stop_en is set
                SEQ_DMAABT: u1,
                ///  No description avaiable
                SEQ_HW_CFLCT: u1,
                ///  sequence queue conflict interrup, set if HW or SW trigger received during conversion
                SEQ_SW_CFLCT: u1,
                ///  read conflict interrup, set if wait_dis is set, one conversion is in progress, SW read another channel
                READ_CFLCT: u1,
                ///  No description avaiable
                TRIG_HW_CFLCT: u1,
                ///  No description avaiable
                TRIG_SW_CFLCT: u1,
                ///  interrupt for one trigger conversion complete if enabled
                TRIG_CMPT: u1,
            }),
            ///  No description avaiable
            int_en: mmio.Mmio(packed struct(u32) {
                ///  set if one chanel watch dog event triggered
                WDOG: u14,
                reserved21: u7,
                ///  set if got hresp=1, generally caused by wrong trg_dma_addr or seq_dma_addr
                AHB_ERR: u1,
                ///  DMA fifo full interrupt, user need to check clock frequency if it's set.
                DMA_FIFO_FULL: u1,
                ///  one conversion complete in seq_queue if related seq_int_en is set
                SEQ_CVC: u1,
                ///  the whole sequence complete interrupt
                SEQ_CMPT: u1,
                ///  dma abort interrupt, set if seqence dma write pointer reachs sw read pointer if stop_en is set
                SEQ_DMAABT: u1,
                ///  No description avaiable
                SEQ_HW_CFLCT: u1,
                ///  sequence queue conflict interrup, set if HW or SW trigger received during conversion
                SEQ_SW_CFLCT: u1,
                ///  read conflict interrup, set if wait_dis is set, one conversion is in progress, SW read another channel
                READ_CFLCT: u1,
                ///  No description avaiable
                TRIG_HW_CFLCT: u1,
                ///  No description avaiable
                TRIG_SW_CFLCT: u1,
                ///  interrupt for one trigger conversion complete if enabled
                TRIG_CMPT: u1,
            }),
            reserved4608: [232]u8,
            ///  No description avaiable
            ana_ctrl0: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  set to start the offset calibration cycle (Active H). user need to clear it after setting it.
                STARTCAL: u1,
                reserved12: u9,
                ///  set to enable adc clock to analog, Software should set this bit before access to any adc16_* register. MUST set clock_period to 0 or 1 for adc16 reg access
                ADC_CLK_ON: u1,
                reserved31: u18,
                ///  "set to enable moto_soc and moto_valid. Should use AHB clock for adc, this bit can be used avoid async output"
                MOTO_EN: u1,
            }),
            reserved4624: [12]u8,
            ///  No description avaiable
            ana_status: mmio.Mmio(packed struct(u32) {
                reserved7: u7,
                ///  Indicates if the ADC is in calibration mode (Active H).
                CALON: u1,
                padding: u24,
            }),
            reserved5188: [560]u8,
            ///  No description avaiable
            adc16_config0: mmio.Mmio(packed struct(u32) {
                ///  convertion parameter
                CONV_PARAM: u14,
                ///  set to enable preemption feature
                PREEMPT_EN: u1,
                reserved20: u5,
                ///  for average the calibration result. 0- 1 loop; 1- 2 loops; 2- 4 loops; 3- 8 loops; 4- 16 loops; 5-32 loops; others reserved
                CAL_AVG_CFG: u3,
                ///  set to enable bandgap. user should set reg_en and bandgap_en before use adc16.
                BANDGAP_EN: u1,
                ///  set to enable regulator
                REG_EN: u1,
                padding: u7,
            }),
            reserved5216: [24]u8,
            ///  No description avaiable
            adc16_config1: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  used for faster conversion, user can change it to get higher convert speed(but less accuracy). should set to (21-convert_clock_number+1).
                COV_END_CNT: u5,
                padding: u19,
            }),
        };

        ///  SPI0
        pub const SPI0 = extern struct {
            reserved4: [4]u8,
            ///  Transfer count for write data
            wr_trans_cnt: mmio.Mmio(packed struct(u32) {
                ///  Transfer count for write data WrTranCnt indicates the number of units of data to be transmitted to the SPI bus from the Data Register. The actual transfer count is (WrTranCnt+1). WrTranCnt only takes effect when TransMode is 0, 1, 3, 4, 5, 6 or 8. The size (bit-width) of a data unit is defined by the DataLen field of the Transfer Format Register. For TransMode 0, WrTranCnt must be equal to RdTranCnt.
                WRTRANCNT: u32,
            }),
            ///  Transfer count for read data
            rd_trans_cnt: mmio.Mmio(packed struct(u32) {
                ///  Transfer count for read data RdTranCnt indicates the number of units of data to be received from SPI bus and stored to the Data Register. The actual received count is (RdTranCnt+1). RdTransCnt only takes effect when TransMode is 0, 2, 3, 4, 5, 6 or 9. The size (bit-width) of a data unit is defined by the DataLen field of the Transfer Format Register. For TransMode 0, WrTranCnt must equal RdTranCnt.
                RDTRANCNT: u32,
            }),
            reserved16: [4]u8,
            ///  Transfer Format Register
            TransFmt: mmio.Mmio(packed struct(u32) {
                ///  SPI Clock Phase 0x0: Sampling data at odd SCLK edges 0x1: Sampling data at even SCLK edges
                CPHA: u1,
                ///  SPI Clock Polarity 0x0: SCLK is LOW in the idle states 0x1: SCLK is HIGH in the idle states
                CPOL: u1,
                ///  SPI Master/Slave mode selection 0x0: Master mode 0x1: Slave mode
                SLVMODE: u1,
                ///  Transfer data with the least significant bit first 0x0: Most significant bit first 0x1: Least significant bit first
                LSB: u1,
                ///  Bi-directional MOSI in regular (single) mode 0x0: MOSI is uni-directional signal in regular mode. 0x1: MOSI is bi-directional signal in regular mode. This bi-directional signal replaces the two
                MOSIBIDIR: u1,
                reserved7: u2,
                ///  Enable Data Merge mode, which does automatic data split on write and data coalescing on read. This bit only takes effect when DataLen = 0x7. Under Data Merge mode, each write to the Data Register will transmit all fourbytes of the write data; each read from the Data Register will retrieve four bytes of received data as a single word data. When Data Merge mode is disabled, only the least (DataLen+1) significient bits of the Data Register are valid for read/write operations; no automatic data split/coalescing will be performed.
                DATAMERGE: u1,
                ///  The length of each data unit in bits The actual bit number of a data unit is (DataLen + 1)
                DATALEN: u5,
                reserved16: u3,
                ///  Address length in bytes 0x0: 1 byte 0x1: 2 bytes 0x2: 3 bytes 0x3: 4 bytes
                ADDRLEN: u2,
                padding: u14,
            }),
            ///  Direct IO Control Register
            DirectIO: mmio.Mmio(packed struct(u32) {
                ///  Status of the SPI CS (chip select) signal
                CS_I: u1,
                ///  Status of the SPI SCLK signal
                SCLK_I: u1,
                ///  Status of the SPI MOSI signal
                MOSI_I: u1,
                ///  Status of the SPI MISO signal
                MISO_I: u1,
                ///  Status of the SPI Flash write protect signal
                WP_I: u1,
                ///  Status of the SPI Flash hold signal
                HOLD_I: u1,
                reserved8: u2,
                ///  Output value for the SPI CS (chip select) signal
                CS_O: u1,
                ///  Output value for the SPI SCLK signal
                SCLK_O: u1,
                ///  Output value for the SPI MOSI signal
                MOSI_O: u1,
                ///  Output value for the SPI MISO signal
                MISO_O: u1,
                ///  Output value for the SPI Flash write protect signal
                WP_O: u1,
                ///  Output value for the SPI Flash hold signal
                HOLD_O: u1,
                reserved16: u2,
                ///  Output enable for SPI CS (chip select) signal
                CS_OE: u1,
                ///  Output enable for the SPI SCLK signal
                SCLK_OE: u1,
                ///  Output enable for the SPI MOSI signal
                MOSI_OE: u1,
                ///  Output enable fo the SPI MISO signal
                MISO_OE: u1,
                ///  Output enable for the SPI Flash write protect signal
                WP_OE: u1,
                ///  Output enable for the SPI Flash hold signal
                HOLD_OE: u1,
                reserved24: u2,
                ///  Enable Direct IO 0x0: Disable 0x1: Enable
                DIRECTIOEN: u1,
                padding: u7,
            }),
            reserved32: [8]u8,
            ///  Transfer Control Register
            TransCtrl: mmio.Mmio(packed struct(u32) {
                ///  Transfer count for read data RdTranCnt indicates the number of units of data to be received from SPI bus and stored to the Data Register. The actual received count is (RdTranCnt+1). RdTransCnt only takes effect when TransMode is 0, 2, 3, 4, 5, 6 or 9. The size (bit-width) of a data unit is defined by the DataLen field of the Transfer Format Register. For TransMode 0, WrTranCnt must equal RdTranCnt.
                RDTRANCNT: u9,
                ///  Dummy data count. The actual dummy count is (DummyCnt +1). The number of dummy cycles on the SPI interface will be (DummyCnt+1)* ((DataLen+1)/SPI IO width) The Data pins are put into the high impedance during the dummy data phase. DummyCnt is only used for TransMode 5, 6, 8 and 9, which has dummy data phases.
                DUMMYCNT: u2,
                ///  Token value (Master mode only) The value of the one-byte special token following the address phase for SPI read transfers. 0x0: token value = 0x00 0x1: token value = 0x69
                TOKENVALUE: u1,
                ///  Transfer count for write data WrTranCnt indicates the number of units of data to be transmitted to the SPI bus from the Data Register. The actual transfer count is (WrTranCnt+1). WrTranCnt only takes effect when TransMode is 0, 1, 3, 4, 5, 6 or 8. The size (bit-width) of a data unit is defined by the DataLen field of the Transfer Format Register. For TransMode 0, WrTranCnt must be equal to RdTranCnt.
                WRTRANCNT: u9,
                ///  Token transfer enable (Master mode only) Append an one-byte special token following the address phase for SPI read transfers. The value of the special token should be selected in TokenValue. 0x0: Disable the one-byte special token 0x1: Enable the one-byte special token
                TOKENEN: u1,
                ///  SPI data phase format 0x0: Regular (Single) mode 0x1: Dual I/O mode 0x2: Quad I/O mode 0x3: Reserved
                DUALQUAD: u2,
                ///  Transfer mode The transfer sequence could be 0x0: Write and read at the same time 0x1: Write only 0x2: Read only 0x3: Write, Read 0x4: Read, Write 0x5: Write, Dummy, Read 0x6: Read, Dummy, Write 0x7: None Data (must enable CmdEn or AddrEn in master mode) 0x8: Dummy, Write 0x9: Dummy, Read 0xa~0xf: Reserved
                TRANSMODE: u4,
                ///  SPI address phase format (Master mode only) 0x0: Address phase is the regular (single) mode 0x1: The format of the address phase is the same as the data phase (DualQuad).
                ADDRFMT: u1,
                ///  SPI address phase enable (Master mode only) 0x0: Disable the address phase 0x1: Enable the address phase
                ADDREN: u1,
                ///  SPI command phase enable (Master mode only) 0x0: Disable the command phase 0x1: Enable the command phase
                CMDEN: u1,
                ///  Data-only mode (slave mode only) 0x0: Disable the data-only mode 0x1: Enable the data-only mode Note: This mode only works in the uni-directional regular (single) mode so MOSIBiDir, DualQuad and TransMode should be set to 0.
                SLVDATAONLY: u1,
            }),
            ///  Command Register
            Cmd: mmio.Mmio(packed struct(u32) {
                ///  SPI Command
                CMD: u8,
                padding: u24,
            }),
            ///  Address Register
            Addr: mmio.Mmio(packed struct(u32) {
                ///  SPI Address (Master mode only)
                ADDR: u32,
            }),
            ///  Data Register
            Data: mmio.Mmio(packed struct(u32) {
                ///  Data to transmit or the received data For writes, data is enqueued to the TX FIFO. The least significant byte is always transmitted first. If the TX FIFO is full and the SPIActive bit of the status register is 1, the ready signal hready/pready will be deasserted to insert wait states to the transfer. For reads, data is read and dequeued from the RX FIFO. The least significant byte is the first received byte. If the RX FIFO is empty and the SPIActive bit of the status register is 1, the ready signal hready/pready will be deasserted to insert wait states to the transfer. The FIFOs decouple the speed of the SPI transfers and the software鈥檚 generation/consumption of data. When the TX FIFO is empty, SPI transfers will hold until more data is written to the TX FIFO; when the RX FIFO is full, SPI transfers will hold until there is more room in the RX FIFO. If more data is written to the TX FIFO than the write transfer count (WrTranCnt), the remaining data will stay in the TX FIFO for the next transfer or until the TX FIFO is reset.
                DATA: u32,
            }),
            ///  Control Register
            Ctrl: mmio.Mmio(packed struct(u32) {
                ///  SPI reset Write 1 to reset. It is automatically cleared to 0 after the reset operation completes.
                SPIRST: u1,
                ///  Receive FIFO reset Write 1 to reset. It is automatically cleared to 0 after the reset operation completes.
                RXFIFORST: u1,
                ///  Transmit FIFO reset Write 1 to reset. It is automatically cleared to 0 after the reset operation completes.
                TXFIFORST: u1,
                ///  RX DMA enable
                RXDMAEN: u1,
                ///  TX DMA enable
                TXDMAEN: u1,
                reserved8: u3,
                ///  Receive (RX) FIFO Threshold The RXFIFOInt interrupt or DMA request would be issued for consuming the RX FIFO when the RX data count is more than or equal to the RX FIFO threshold.
                RXTHRES: u8,
                ///  Transmit (TX) FIFO Threshold The TXFIFOInt interrupt or DMA request would be issued to replenish the TX FIFO when the TX data count is less than or equal to the TX FIFO threshold.
                TXTHRES: u8,
                ///  No description avaiable
                CS_EN: u4,
                padding: u4,
            }),
            ///  Status Register
            Status: mmio.Mmio(packed struct(u32) {
                ///  SPI register programming is in progress. In master mode, SPIActive becomes 1 after the SPI command register is written and becomes 0 after the transfer is finished. In slave mode, SPIActive becomes 1 after the SPI CS signal is asserted and becomes 0 after the SPI CS signal is deasserted. Note that due to clock synchronization, it may take at most two spi_clock cycles for SPIActive to change when the corresponding condition happens. Note this bit stays 0 when Direct IO Control or the memory-mapped interface is used.
                SPIACTIVE: u1,
                reserved8: u7,
                ///  Number of valid entries in the Receive FIFO
                RXNUM_5_0: u6,
                ///  Receive FIFO Empty flag
                RXEMPTY: u1,
                ///  Receive FIFO Full flag
                RXFULL: u1,
                ///  Number of valid entries in the Transmit FIFO
                TXNUM_5_0: u6,
                ///  Transmit FIFO Empty flag
                TXEMPTY: u1,
                ///  Transmit FIFO Full flag
                TXFULL: u1,
                ///  Number of valid entries in the Receive FIFO
                RXNUM_7_6: u2,
                reserved28: u2,
                ///  Number of valid entries in the Transmit FIFO
                TXNUM_7_6: u2,
                padding: u2,
            }),
            ///  Interrupt Enable Register
            IntrEn: mmio.Mmio(packed struct(u32) {
                ///  Enable the SPI Receive FIFO Overrun interrupt. Control whether interrupts are triggered when the Receive FIFO overflows. (Slave mode only)
                RXFIFOORINTEN: u1,
                ///  Enable the SPI Transmit FIFO Underrun interrupt. Control whether interrupts are triggered when the Transmit FIFO run out of data. (Slave mode only)
                TXFIFOURINTEN: u1,
                ///  Enable the SPI Receive FIFO Threshold interrupt. Control whether interrupts are triggered when the valid entries are greater than or equal to the RX FIFO threshold.
                RXFIFOINTEN: u1,
                ///  Enable the SPI Transmit FIFO Threshold interrupt. Control whether interrupts are triggered when the valid entries are less than or equal to the TX FIFO threshold.
                TXFIFOINTEN: u1,
                ///  Enable the End of SPI Transfer interrupt. Control whether interrupts are triggered when SPI transfers end. (In slave mode, end of read status transaction doesn鈥檛 trigger this interrupt.)
                ENDINTEN: u1,
                ///  Enable the Slave Command Interrupt. Control whether interrupts are triggered whenever slave commands are received. (Slave mode only)
                SLVCMDEN: u1,
                padding: u26,
            }),
            ///  Interrupt Status Register
            IntrSt: mmio.Mmio(packed struct(u32) {
                ///  RX FIFO Overrun interrupt. This bit is set when RX FIFO Overrun interrupts occur. (Slave mode only)
                RXFIFOORINT: u1,
                ///  TX FIFO Underrun interrupt. This bit is set when TX FIFO Underrun interrupts occur. (Slave mode only)
                TXFIFOURINT: u1,
                ///  RX FIFO Threshold interrupt. This bit is set when RX FIFO Threshold interrupts occur.
                RXFIFOINT: u1,
                ///  TX FIFO Threshold interrupt. This bit is set when TX FIFO Threshold interrupts occur.
                TXFIFOINT: u1,
                ///  End of SPI Transfer interrupt. This bit is set when End of SPI Transfer interrupts occur.
                ENDINT: u1,
                ///  Slave Command Interrupt. This bit is set when Slave Command interrupts occur. (Slave mode only)
                SLVCMDINT: u1,
                padding: u26,
            }),
            ///  Interface Timing Register
            Timing: mmio.Mmio(packed struct(u32) {
                ///  The clock frequency ratio between the clock source and SPI interface SCLK. SCLK_period = ((SCLK_DIV + 1) * 2) * (Period of the SPI clock source) The SCLK_DIV value 0xff is a special value which indicates that the SCLK frequency should be the same as the spi_clock frequency.
                SCLK_DIV: u8,
                ///  The minimum time that SPI CS should stay HIGH. SCLK_period * (CSHT + 1) / 2
                CSHT: u4,
                ///  The minimum time between the edges of SPI CS and the edges of SCLK. SCLK_period * (CS2SCLK + 1) / 2
                CS2SCLK: u2,
                padding: u18,
            }),
            reserved96: [28]u8,
            ///  Slave Status Register
            SlvSt: mmio.Mmio(packed struct(u32) {
                ///  User defined status flags
                USR_STATUS: u16,
                ///  Set this bit to indicate that the ATCSPI200 is ready for data transaction. When an SPI transaction other than slave status-reading command ends, this bit will be cleared to 0.
                READY: u1,
                ///  Data overrun occurs in the last transaction
                OVERRUN: u1,
                ///  Data underrun occurs in the last transaction
                UNDERRUN: u1,
                padding: u13,
            }),
            ///  Slave Data Count Register
            SlvDataCnt: mmio.Mmio(packed struct(u32) {
                ///  Slave received data count
                RCNT: u10,
                reserved16: u6,
                ///  Slave transmitted data count
                WCNT: u10,
                padding: u6,
            }),
            ///  WCnt
            SlvDataWCnt: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                VAL: u32,
            }),
            ///  RCnt
            SlvDataRCnt: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                VAL: u32,
            }),
            reserved124: [12]u8,
            ///  Configuration Register
            Config: mmio.Mmio(packed struct(u32) {
                ///  Depth of RX FIFO 0x0: 2 words 0x1: 4 words 0x2: 8 words 0x3: 16 words 0x4: 32 words 0x5: 64 words 0x6: 128 words
                RXFIFOSIZE: u4,
                ///  Depth of TX FIFO 0x0: 2 words 0x1: 4 words 0x2: 8 words 0x3: 16 words 0x4: 32 words 0x5: 64 words 0x6: 128 words
                TXFIFOSIZE: u4,
                ///  Support for Dual I/O SPI
                DUALSPI: u1,
                ///  Support for Quad I/O SPI
                QUADSPI: u1,
                reserved14: u4,
                ///  Support for SPI Slave mode
                SLAVE: u1,
                padding: u17,
            }),
        };

        ///  KEYM
        pub const KEYM = extern struct {
            reserved64: [64]u8,
            ///  secure key generation
            SEC_KEY_CTL: mmio.Mmio(packed struct(u32) {
                ///  secure symmtric key synthesize setting, key is a XOR of followings bit0: fuse mk, 0: not selected, 1:selected bit1: zmk from batt, 0: not selected, 1:selected bit2: software key 0: not selected, 1:selected
                KEY_SEL: u3,
                reserved4: u1,
                ///  fuse symmetric key selection 0: use scramble version of fuse symmetric key 1: use alnertave scramble of fuse symmetric key
                FMK_SEL: u1,
                reserved8: u3,
                ///  batt symmetric key selection 0: use scramble version of software symmetric key 1: use origin value in software symmetric key
                ZMK_SEL: u1,
                reserved12: u3,
                ///  software symmetric key selection 0: use origin value in software symmetric key 1: use scramble version of software symmetric key
                SMK_SEL: u1,
                reserved16: u3,
                ///  session key valid 0: session key is all 0's and not usable 1: session key is valid
                SK_VAL: u1,
                reserved31: u14,
                ///  block secure state key setting being changed
                LOCK_SEC_CTL: u1,
            }),
            ///  non-secure key generation
            NSC_KEY_CTL: mmio.Mmio(packed struct(u32) {
                ///  non-secure symmtric key synthesize setting, key is a XOR of followings bit0: fuse mk, 0: not selected, 1:selected bit1: zmk from batt, 0: not selected, 1:selected bit2: software key 0: not selected, 1:selected
                KEY_SEL: u3,
                reserved4: u1,
                ///  fuse symmetric key selection 0: use scramble version of fuse symmetric key 1: use origin value in fuse symmetric key
                FMK_SEL: u1,
                reserved8: u3,
                ///  batt symmetric key selection 0: use scramble version of software symmetric key 1: use origin value in software symmetric key
                ZMK_SEL: u1,
                reserved12: u3,
                ///  software symmetric key selection 0: use scramble version of software symmetric key 1: use origin value in software symmetric key
                SMK_SEL: u1,
                reserved16: u3,
                ///  session key valid 0: session key is all 0's and not usable 1: session key is valid
                SK_VAL: u1,
                reserved31: u14,
                ///  block non-secure state key setting being changed
                LOCK_NSC_CTL: u1,
            }),
            ///  Random number interface behavior
            RNG: mmio.Mmio(packed struct(u32) {
                ///  control how SFK is accepted from random number generator 0: SFK value replaced by random number input 1: SFK value exclusive or with random number input,this help generate random number using 2 rings inside RNG
                RNG_XOR: u1,
                reserved16: u15,
                ///  block RNG_XOR bit from changing, if this bit is written to 1, it will hold 1 until next reset 0: RNG_XOR can be changed by software 1: RNG_XOR ignore software change from software
                BLOCK_RNG_XOR: u1,
                padding: u15,
            }),
            ///  key read out control
            READ_CONTROL: mmio.Mmio(packed struct(u32) {
                ///  symmetric key readout control, if this bit is written to 1, it will hold 1 until next reset 0: key can be read out 1: key cannot be read out
                BLOCK_SMK_READ: u1,
                reserved16: u15,
                ///  asymmetric key readout control, if this bit is written to 1, it will hold 1 until next reset 0: key can be read out 1: key cannot be read out
                BLOCK_PK_READ: u1,
                padding: u15,
            }),
        };

        ///  OTP
        pub const OTP = extern struct {
            reserved2048: [2048]u8,
            ///  UNLOCK
            UNLOCK: mmio.Mmio(packed struct(u32) {
                ///  unlock word for fuse array operation write "OPEN" to unlock fuse array, write any other value will lock write to fuse. Please make sure 24M crystal is running and 2.5V LDO working properly
                UNLOCK: u32,
            }),
            ///  DATA
            DATA: mmio.Mmio(packed struct(u32) {
                ///  data register for non-blocking access this register hold dat read from fuse array or data to by programmed to fuse array
                DATA: u32,
            }),
            ///  ADDR
            ADDR: mmio.Mmio(packed struct(u32) {
                ///  word address to be read or write
                ADDR: u7,
                padding: u25,
            }),
            ///  CMD
            CMD: mmio.Mmio(packed struct(u32) {
                ///  command to access fure array "BLOW" will update fuse word at ADDR to value hold in DATA "READ" will fetch fuse value in at ADDR to DATA register
                CMD: u32,
            }),
            reserved2560: [496]u8,
            ///  LOAD Request
            LOAD_REQ: mmio.Mmio(packed struct(u32) {
                ///  reload request for 4 regions bit0: region0 bit1: region1 bit2: region2 bit3: region3
                REQUEST: u4,
                padding: u28,
            }),
            ///  LOAD complete
            LOAD_COMP: mmio.Mmio(packed struct(u32) {
                ///  reload complete sign for 4 regions bit0: region 0 bit1: region1 bit2: region2 bit3: region3
                COMPLETE: u4,
                padding: u28,
            }),
            reserved3072: [504]u8,
            ///  interrupt flag
            INT_FLAG: mmio.Mmio(packed struct(u32) {
                ///  fuse load flag, write 1 to clear 0: fuse is not loaded or loading 1: fuse loaded
                LOAD: u1,
                ///  fuse read flag, write 1 to clear 0: fuse is not read or reading 1: fuse value is put in DATA register
                READ: u1,
                ///  fuse write flag, write 1 to clear 0: fuse is not written or writing 1: value in DATA register is programmed into fuse
                WRITE: u1,
                padding: u29,
            }),
            ///  interrupt enable
            INT_EN: mmio.Mmio(packed struct(u32) {
                ///  fuse load interrupt enable 0: fuse load interrupt is not enable 1: fuse load interrupt is enable
                LOAD: u1,
                ///  fuse read interrupt enable 0: fuse read interrupt is not enable 1: fuse read interrupt is enable
                READ: u1,
                ///  fuse write interrupt enable 0: fuse write interrupt is not enable 1: fuse write interrupt is enable
                WRITE: u1,
                padding: u29,
            }),
        };

        ///  RNG
        pub const RNG = extern struct {
            ///  Command Register
            CMD: mmio.Mmio(packed struct(u32) {
                ///  Self Test, when both ST and GS triggered, ST first and GS next.
                SLFCHK: u1,
                ///  Generate Seed, when both ST and GS triggered, ST first and GS next.
                GENSD: u1,
                reserved4: u2,
                ///  Clear the Interrupt, clear the RNG interrupt if an error is not present. This bit is self-clearing. 0 Do not clear the interrupt. 1 Clear the interrupt
                CLRINT: u1,
                ///  Clear the Error, clear the errors in the ESR register and the RNG interrupt. This bit is self-clearing. 0 Do not clear the errors and the interrupt. 1 Clear the errors and the interrupt.
                CLRERR: u1,
                ///  Soft Reset, Perform a software reset of the RNG This bit is self-clearing. 0 Do not perform a software reset. 1 Software reset
                SFTRST: u1,
                padding: u25,
            }),
            ///  Control Register
            CTRL: mmio.Mmio(packed struct(u32) {
                ///  FIFO underflow response mode 00 Return all zeros and set the ESR[FUFE]. 01 Return all zeros and set the ESR[FUFE]. 10 Generate the bus transfer error 11 Generate the interrupt and return all zeros (overrides the CTRL[MASKERR]).
                FUFMOD: u2,
                reserved4: u2,
                ///  Auto Reseed
                AUTRSD: u1,
                ///  Mask Interrupt Request for Done Event, asks the interrupts generated upon the completion of the seed and self-test modes. The status of these jobs can be viewed by: • Reading the STA and viewing the seed done and the self-test done bits (STA[SDN, STDN]). • Viewing the RNG_CMD for the generate-seed or the self-test bits (CMD[GS,ST]) being set, indicating that the operation is still taking place.
                MIRQDN: u1,
                ///  Mask Interrupt Request for Error
                MIRQERR: u1,
                padding: u25,
            }),
            ///  Status Register
            STA: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  when 1, means the RNG engine is busy for seeding or random number generation, self test and so on.
                BUSY: u1,
                ///  Idle, the RNG is in the idle mode, and internal clocks are disabled, in this mode, access to the FIFO is allowed. Once the FIFO is empty, the RNGB fills the FIFO and then enters idle mode again.
                IDLE: u1,
                ///  Reseed needed Indicates that the RNG needs to be reseeded. This is done by setting the CMD[GS], or automatically if the CTRL[ARS] is set.
                RSDREQ: u1,
                ///  Self Check Done Indicates whether Self Test is done or not. Can be cleared by the hardware reset or a new self test is initiated by setting the CMD[ST]. 0 Self test not completed 1 Completed a self test since the last reset.
                SCDN: u1,
                ///  1st Seed done When "1", Indicates that the RNG generated the first seed.
                FSDDN: u1,
                ///  New seed done.
                NSDDN: u1,
                reserved8: u1,
                ///  Fifo Level, Indicates the number of random words currently in the output FIFO
                FRNNU: u4,
                ///  Fifo Size, it is 5 in this design.
                FSIZE: u4,
                ///  Error was detected, check ESR register for details
                FUNCERR: u1,
                reserved21: u4,
                ///  Self Check Pass Fail
                SCPF: u3,
                padding: u8,
            }),
            ///  Error Registers
            ERR: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Self-test error Indicates that the RNG failed the most recent self test. This bit is sticky and can only be reset by a hardware reset or by writing 1 to the CMD[CE]
                SCKERR: u1,
                reserved5: u1,
                ///  FIFO access error(underflow)
                FUFE: u1,
                padding: u26,
            }),
            ///  FIFO out to bus/cpu
            FO2B: mmio.Mmio(packed struct(u32) {
                ///  SW read the FIFO output.
                FO2B: u32,
            }),
        };

        ///  CRC
        pub const CRC = struct {};

        ///  TSNS
        pub const TSNS = extern struct {
            ///  Temperature
            T: mmio.Mmio(packed struct(u32) {
                ///  Signed number of temperature in 256 x celsius degree
                T: u32,
            }),
            ///  Maximum Temperature
            TMAX: mmio.Mmio(packed struct(u32) {
                ///  maximum temperature ever found
                T: u32,
            }),
            ///  Minimum Temperature
            TMIN: mmio.Mmio(packed struct(u32) {
                ///  minimum temperature ever found
                T: u32,
            }),
            ///  Sample age
            AGE: mmio.Mmio(packed struct(u32) {
                ///  age of T register in 24MHz clock cycles
                AGE: u32,
            }),
            ///  Status
            STATUS: mmio.Mmio(packed struct(u32) {
                ///  Software trigger for sensing in trigger mode, trigger will be ignored if in sensing or other mode
                TRIGGER: u1,
                reserved31: u30,
                ///  indicate value in T is valid or not 0: not valid 1:valid
                VALID: u1,
            }),
            ///  Configuration
            CONFIG: mmio.Mmio(packed struct(u32) {
                ///  Enable temperature 0: disable, temperature sensor is shut down 1: enable. Temperature sensor enabled
                ENABLE: u1,
                ///  Acynchronous mode, this mode can work without clock, only available function ios compare to certain ADC value 0: active mode 1: Async mode
                ASYNC: u1,
                reserved4: u2,
                ///  continuous mode that keep sampling temperature peridically 0: trigger mode 1: continuous mode
                CONTINUOUS: u1,
                reserved8: u3,
                ///  Average time, default in 3 0: measure and return 1: twice and average 2: 4 times and average . . . 7: 128 times and average
                AVERAGE: u3,
                reserved16: u5,
                ///  cycles of a progressive step in 24M clock, valide from 24-255, default 96 24: 24 cycle for a step 25: 25 cycle for a step 26: 26 cycle for a step ... 255: 255 cycle for a step
                SPEED: u8,
                ///  Enable compare for maximum temperature
                COMPARE_MAX_EN: u1,
                ///  Enable compare for minimum temperature
                COMPARE_MIN_EN: u1,
                reserved30: u4,
                ///  Enable reset
                RST_EN: u1,
                ///  Enable interrupt
                IRQ_EN: u1,
            }),
            ///  Sample validity
            VALIDITY: mmio.Mmio(packed struct(u32) {
                ///  time for temperature values to expire in 24M clock cycles
                VALIDITY: u32,
            }),
            ///  Temperature flag
            FLAG: mmio.Mmio(packed struct(u32) {
                ///  IRQ flag, write 1 to clear
                IRQ: u1,
                reserved16: u15,
                ///  Clear over temperature status, write 1 to clear
                OVER_TEMP: u1,
                ///  Clear under temperature status, write 1 to clear
                UNDER_TEMP: u1,
                reserved20: u2,
                ///  Clear maximum recorder of temerature, write 1 to clear
                RECORD_MAX_CLR: u1,
                ///  Clear minimum recorder of temerature, write 1 to clear
                RECORD_MIN_CLR: u1,
                padding: u10,
            }),
            ///  Maximum temperature to interrupt
            UPPER_LIM_IRQ: mmio.Mmio(packed struct(u32) {
                ///  Maximum temperature for compare
                T: u32,
            }),
            ///  Minimum temperature to interrupt
            LOWER_LIM_IRQ: mmio.Mmio(packed struct(u32) {
                ///  Minimum temperature for compare
                T: u32,
            }),
            ///  Maximum temperature to reset
            UPPER_LIM_RST: mmio.Mmio(packed struct(u32) {
                ///  Maximum temperature for compare
                T: u32,
            }),
            ///  Minimum temperature to reset
            LOWER_LIM_RST: mmio.Mmio(packed struct(u32) {
                ///  Minimum temperature for compare
                T: u32,
            }),
            ///  Configuration in asynchronous mode
            ASYNC: mmio.Mmio(packed struct(u32) {
                ///  Value of async mode to compare
                VALUE: u11,
                reserved16: u5,
                ///  Polarity of internal comparator
                POLARITY: u1,
                reserved24: u7,
                ///  Compare hotter than or colder than in asynchoronous mode 0: hotter than 1: colder than
                ASYNC_TYPE: u1,
                padding: u7,
            }),
            reserved56: [4]u8,
            ///  Advance configuration
            ADVAN: mmio.Mmio(packed struct(u32) {
                ///  use positive compare polarity only
                POS_ONLY: u1,
                ///  use negative compare polarity only
                NEG_ONLY: u1,
                reserved16: u14,
                ///  temperature sampling is working
                SAMPLING: u1,
                reserved24: u7,
                ///  interrupt status of active mode
                ACTIVE_IRQ: u1,
                ///  interrupt status of asynchronous mode
                ASYNC_IRQ: u1,
                padding: u6,
            }),
        };

        ///  MBX0A
        pub const MBX0A = extern struct {
            ///  Command Registers
            CR: mmio.Mmio(packed struct(u32) {
                ///  RX word message valid interrupt enable. 1, enable the RX word massage valid interrupt. 0, disable the RX word message valid interrupt.
                RWMVIE: u1,
                ///  TX word message empty interrupt enable. 1, enable the TX word massage empty interrupt. 0, disable the TX word message empty interrupt.
                TWMEIE: u1,
                reserved4: u2,
                ///  RX fifo message full interrupt enable. 1, enable the RX fifo message full interrupt. 0, disable the RX fifo message full interrupt.
                RFMFIE: u1,
                ///  RX FIFO message available interrupt enable. 1, enable the RX FIFO massage available interrupt. 0, disable the RX FIFO message available interrupt.
                RFMAIE: u1,
                ///  TX FIFO message empty interrupt enable. 1, enable the TX FIFO massage empty interrupt. 0, disable the TX FIFO message empty interrupt.
                TFMEIE: u1,
                ///  TX FIFO message available interrupt enable. 1, enable the TX FIFO massage available interrupt. 0, disable the TX FIFO message available interrupt.
                TFMAIE: u1,
                ///  Bus Error Interrupt Enable, will enable the interrupt for any bus error as described in the SR bit 13 to bit 8. 1, enable the bus access error interrupt. 0, disable the bus access error interrupt.
                BEIE: u1,
                reserved14: u5,
                ///  Bus Acccess Response Control, when bit 15:14= 00: no bus error will be generated, no wait for fifo write when fifo full and no wait for word/fifo read when word message invalid or fifo empty; or when write to word/fifo message will be ignored. 01: bus error will be generated when: 1, access invalid address; 2, write to ready only addr; 3, write to fulled fifo or valid message; 4, read from a emptied fifo/word message. 10: no error will be generated, but bus will wait when 1, write to fulled fifo/reg message; 2, read from a emptied fifo/reg message; write to word message will overwrite the existing reg value enven word message are still valid; read from invalid word message will read out last read out message data.happen. 11: reserved.
                BARCTL: u2,
                reserved31: u15,
                ///  Reset TX Fifo and word.
                TXRESET: u1,
            }),
            ///  Status Registers
            SR: mmio.Mmio(packed struct(u32) {
                ///  RX word message valid, will trigger interrupt if the related interrupt enable bit set in the control (CR) registrer. 1, the other core had written word message in the RXREG. 0, no valid word message yet in the RXREG.
                RWMV: u1,
                ///  TX word message empty, will trigger interrupt if the related interrupt enable bit set in the control (CR) registrer. 1, means this core had write word message to TXREG. 0, means no valid word message in the TXREG yet.
                TWME: u1,
                reserved4: u2,
                ///  RX FIFO Message Full, message from other core; will trigger interrupt if the related interrupt enable bit set in the control (CR) registrer. 1, the other core had written 4x32 message in the RXFIFO. 0, no 4x32 RX FIFO message from other core yet.
                RFMF: u1,
                ///  RX FIFO Message Available, available data in the 4x32 TX FIFO message buffer to the other core, will trigger interrupt if the related interrupt enable bit set in the control (CR) registrer. 1, no any data in the 4x32 TXFIFO message buffer. 0, there are some data in the the 4x32 TXFIFO message buffer already.
                RFMA: u1,
                ///  TX FIFO Message Empty, no any data in the message FIFO buffer from other core, will not trigger any interrupt.message from other core. 1, no any message data in TXFIFO from other core. 0, there are some data in the 4x32 TX FIFO from other core yet.
                TFME: u1,
                ///  TX FIFO Message slot available, the 4x32 TX FIFO message buffer to the other core full, will not trigger any interrupt. 1, TXFIFO message buffer has slot available 0, no slot available (fifo full)
                TFMA: u1,
                ///  bus Error for Write to Read Only address; this bit is W1C bit. 1, write to read only address happened in the bus of this block. 0, nothis kind of bus error; write this bit to 1 will clear this bit when this kind of error happen.
                EW2RO: u1,
                ///  bus Error for Accessing Invalid Address; this bit is W1C bit. 1, read and write to invalid address in the bus of this block, will set this bit. 0, nothis kind of bus error; write this bit to 1 will clear this bit when this kind of error happen.
                EAIVA: u1,
                ///  bus Error for write when tx fifo full, this bit is W1C bit. 1, write to a fulled tx fifo will cause this error bit set. 0, nothis kind of bus error; write this bit to 1 will clear this bit when this kind of error happen.
                EWTFF: u1,
                ///  bus Error for read when rx fifo empty, this bit is W1C bit. 1, read from a empty rx fifo will cause this error bit set. 0, nothis kind of bus error; write this bit to 1 will clear this bit when this kind of error happen.
                ERRFE: u1,
                ///  bus Error for write when tx word message are still valid, this bit is W1C bit. 1, write to word message when the word message are still valid will cause this error bit set. 0, nothis kind of bus error; write this bit to 1 will clear this bit when this kind of error happen.
                EWTRF: u1,
                ///  bus Error for read when rx word message are still invalid, this bit is W1C bit. 1, read from word message when the word message are still invalid will cause this error bit set. 0, nothis kind of bus error; write this bit to 1 will clear this bit when this kind of error happen.
                ERRRE: u1,
                reserved16: u2,
                ///  TX FIFO empty message word count
                TFEC: u4,
                ///  RX FIFO valid message count
                RFVC: u4,
                padding: u8,
            }),
            ///  Transmit word message to other core.
            TXREG: mmio.Mmio(packed struct(u32) {
                ///  Transmit word message to other core.
                TXREG: u32,
            }),
            ///  Receive word message from other core.
            RXREG: mmio.Mmio(packed struct(u32) {
                ///  Receive word message from other core.
                RXREG: u32,
            }),
        };

        ///  MON
        pub const MON = extern struct {
            reserved64: [64]u8,
            ///  No description avaiable
            IRQ_FLAG: mmio.Mmio(packed struct(u32) {
                ///  interrupt flag, each bit represents for one monitor, write 1 to clear interrupt flag 0: no monitor interrupt 1: monitor interrupt happened
                FLAG: u4,
                padding: u28,
            }),
            ///  No description avaiable
            IRQ_ENABLE: mmio.Mmio(packed struct(u32) {
                ///  interrupt enable, each bit represents for one monitor 0: monitor interrupt disabled 1: monitor interrupt enabled
                ENABLE: u4,
                padding: u28,
            }),
        };

        ///  WDG0
        pub const WDG0 = extern struct {
            ///  wdog ctrl register 0 Note: Parity check is required once writing to this register. The result should be zero by modular two addition of all bits
            CTRL0: mmio.Mmio(packed struct(u32) {
                ///  WDT enable or not in low power mode 2'b00: wdt is halted once in low power mode 2'b01: wdt will work with 1/4 normal clock freq in low power mode 2'b10: wdt will work with 1/2 normal clock freq in low power mode 2'b11: wdt will work with normal clock freq in low power mode
                EN_LP: u2,
                ///  WTD enable or not in debug mode
                EN_DBG: u1,
                ///  Unlock refresh mechanism 00: the required unlock password is the same with refresh_psd_register 01: the required unlock password is a ring shift left value of refresh_psd_register 10: the required unlock password is always 16'h55AA, no matter what refresh_psd_register is 11: the required unlock password is a LSFR result of refresh_psd_register, the characteristic polynomial is X^15 + 1
                REF_UNLOCK_MEC: u2,
                ///  WDT refresh has to be unlocked firstly once refresh lock is enable.
                REF_LOCK: u1,
                reserved12: u6,
                ///  The upper threshold of window value The window period upper limit is: lower_limit + (overtime_rst_value / 16) * upper_reg_value If this register value is zero, then no upper level limitation
                WIN_UPPER: u3,
                ///  If refresh event has to be limited into a period after refresh unlocked. Note: the refresh overtime counter works in bus clock domain, not in wdt function clock domain. The wdt divider doesn't take effect for refresh counter
                REF_OT_REQ: u1,
                reserved17: u1,
                ///  overtime reset can be self released after 32 function cycles
                OT_SELF_CLEAR: u1,
                reserved21: u3,
                ///  The register is locked and unlock is needed before re-config registers Once the lock mechanism takes effect, the CTRL0, CTRL1, timeout int register, timeout rst register, needs unlock before re-config them. The register update needs to be finished in the required period defined by UPD_OT_TIME register
                CFG_LOCK: u1,
                ///  Once window mode is opened, the lower counter value to refresh wdt 00: 4/8 overtime value 01: 5/8 of overtime value 10: 6/8 of overtime value 11: 7/8 of overtime value
                WIN_LOWER: u2,
                ///  window mode enable
                WIN_EN: u1,
                ///  clock divider, the clock divider works as 2 ^ div_value for wdt counter
                DIV_VALUE: u3,
                reserved29: u1,
                ///  clock select 0：bus clock 1：ext clock
                CLK_SEL: u1,
                padding: u2,
            }),
            ///  wdog ctrl register 1 Note: Parity check is required once writing to this register. The result should be zero by modular two addition of all bits
            CTRL1: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Parity error will trigger a interrupt
                PARITY_FAIL_INT_EN: u1,
                ///  Parity error will trigger a reset A parity check is required once writing to ctrl0 and ctrl1 register. The result should be zero by modular two addition of all bits
                PARITY_FAIL_RST_EN: u1,
                ///  Unlock register update failure will trigger a interrupt
                UNL_CTL_FAIL_INT_EN: u1,
                ///  Unlock register update failure will trigger a reset
                UNL_CTL_FAIL_RST_EN: u1,
                ///  Ctrl update violation will trigger a interrupt
                CTL_VIO_INT_EN: u1,
                ///  Ctrl update violation will trigger a reset The violation event is to try updating the locked register before unlock them
                CTL_VIO_RST_EN: u1,
                reserved16: u8,
                ///  WDT can generate an interrupt warning before timeout
                OT_INT_EN: u1,
                ///  WDT overtime will generate a reset
                OT_RST_EN: u1,
                reserved20: u2,
                ///  Refresh unlock fail will trigger a interrupt
                UNL_REF_FAIL_INT_EN: u1,
                ///  Refresh unlock fail will trigger a reset
                UNL_REF_FAIL_RST_EN: u1,
                ///  Refresh violation will trigger an interrupt
                REF_FAIL_INT_EN: u1,
                ///  Refresh violation will trigger an reset. These event will be taken as a refresh violation: 1) Not refresh in the window once window mode is enabled 2) Not unlock refresh firstly if unlock is required 3) Not refresh in the required time after unlock, once refresh unlock overtime is enabled. 4) Not write the required word to refresh wdt.
                REF_FAIL_RST_EN: u1,
                padding: u8,
            }),
            ///  wdog timeout interrupt counter value
            OT_INT_VAL: mmio.Mmio(packed struct(u32) {
                ///  WDT timeout interrupt value
                OT_INT_VAL: u16,
                padding: u16,
            }),
            ///  wdog timeout reset counter value
            OT_RST_VAL: mmio.Mmio(packed struct(u32) {
                ///  WDT timeout reset value
                OT_RST_VAL: u16,
                padding: u16,
            }),
            ///  wdog refresh register
            WDT_REFRESH_REG: mmio.Mmio(packed struct(u32) {
                ///  Write this register by 32'h5A45_524F to refresh wdog Note: Reading this register can read back wdt real time counter value, while it is only used by debug purpose
                WDT_REFRESH_REG: u32,
            }),
            ///  wdog status register
            WDT_STATUS: mmio.Mmio(packed struct(u32) {
                ///  Refresh fail Write one to clear the bit
                REF_VIO: u1,
                ///  Refresh unlock fail Write one to clear the bit
                REF_UNL_FAIL: u1,
                ///  Violate register update protection mechanism Write one to clear the bit
                CTL_VIO: u1,
                ///  Unlock ctrl reg update protection fail Write one to clear the bit
                CTL_UNL_FAIL: u1,
                ///  Timeout happens, a interrupt will happen once enable bit set This bit can be cleared only by refreshing wdt or reset
                OT_INT: u1,
                ///  Timeout happens, a reset will happen once enable bit set This bit can be cleared only by refreshing wdt or reset
                OT_RST: u1,
                ///  parity error Write one to clear the bit
                PARITY_ERROR: u1,
                padding: u25,
            }),
            ///  ctrl register protection register
            CFG_PROT: mmio.Mmio(packed struct(u32) {
                ///  The password of unlocking register update
                UPD_PSD: u16,
                ///  The period in which register update has to be in after unlock The required period is less than： 128 * 2 ^ UPD_OT_TIME * bus_clock_cycle
                UPD_OT_TIME: u4,
                padding: u12,
            }),
            ///  refresh protection register
            REF_PROT: mmio.Mmio(packed struct(u32) {
                ///  The password to unlock refreshing
                REF_UNL_PSD: u16,
                padding: u16,
            }),
            ///  Wdog enable
            WDT_EN: mmio.Mmio(packed struct(u32) {
                ///  Wdog is enabled, the re-written of this register is impacted by enable lock function
                WDOG_EN: u1,
                padding: u31,
            }),
            ///  Refresh period value
            REF_TIME: mmio.Mmio(packed struct(u32) {
                ///  The refresh period after refresh unlocked Note: the refresh overtime counter works in bus clock domain, not in wdt function clock domain. The wdt divider doesn't take effect for refresh counter
                REFRESH_PERIOD: u16,
                padding: u16,
            }),
        };

        ///  SEC
        pub const SEC = extern struct {
            ///  Secure state
            SECURE_STATE: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  PMIC secure state one hot indicator 0: secure state is not in inspect state 1: secure state is in inspect state
                PMIC_INS: u1,
                ///  PMIC secure state one hot indicator 0: secure state is not in secure state 1: secure state is in secure state
                PMIC_SEC: u1,
                ///  PMIC secure state one hot indicator 0: secure state is not in non-secure state 1: secure state is in non-secure state
                PMIC_NSC: u1,
                ///  PMIC secure state one hot indicator 0: secure state is not in fail state 1: secure state is in fail state
                PMIC_FAIL: u1,
                reserved16: u8,
                ///  Secure state allow 0: system is not healthy to enter secure state, request to enter non-secure state will cause a fail state 1: system is healthy to enter secure state
                ALLOW_SEC: u1,
                ///  Non-secure state allow 0: system is not healthy to enter non-secure state, request to enter non-secure state will cause a fail state 1: system is healthy to enter non-secure state
                ALLOW_NSC: u1,
                padding: u14,
            }),
            ///  secure state configuration
            SECURE_STATE_CONFIG: mmio.Mmio(packed struct(u32) {
                ///  allow secure state restart from fail state 0: restart is not allowed, only hardware reset can recover secure state 1: software is allowed to switch to inspect state from fail state
                ALLOW_RESTART: u1,
                reserved3: u2,
                ///  Lock bit of allow restart setting, once locked, lock bit itself and configuration register will keep value until next reset 0: not locked, register can be modified 1: register locked, write access to the register is ignored
                LOCK: u1,
                padding: u28,
            }),
            ///  Security violation config
            VIOLATION_CONFIG: mmio.Mmio(packed struct(u32) {
                ///  configuration of secure state violations, each bit represents one security event 0: event is not a security violation 1: event is a security violation
                SEC_VIO_CFG: u15,
                ///  Lock bit secure violation setting, once locked, lock bit itself and configuration will keep value until next reset 0: not locked, configuration can be modified 1: register locked, write access to the configuration is ignored
                LOCK_SEC: u1,
                ///  configuration of non-secure state violations, each bit represents one security event 0: event is not a security violation 1: event is a security violation
                NSC_VIO_CFG: u15,
                ///  Lock bit non-secure violation setting, once locked, lock bit itself and configuration will keep value until next reset 0: not locked, configuration can be modified 1: register locked, write access to the configuration is ignored
                LOCK_NSC: u1,
            }),
            ///  Escalate behavior on security event
            ESCALATE_CONFIG: mmio.Mmio(packed struct(u32) {
                ///  configuration of secure state escalates, each bit represents one security event 0: event is not a security escalate 1: event is a security escalate
                SEC_VIO_CFG: u15,
                ///  Lock bit secure escalate setting, once locked, lock bit itself and configuration will keep value until next reset 0: not locked, configuration can be modified 1: register locked, write access to the configuration is ignored
                LOCK_SEC: u1,
                ///  configuration of non-secure state escalates, each bit represents one security event 0: event is not a security escalate 1: event is a security escalate
                NSC_VIO_CFG: u15,
                ///  Lock bit non-secure escalate setting, once locked, lock bit itself and configuration will keep value until next reset 0: not locked, configuration can be modified 1: register locked, write access to the configuration is ignored
                LOCK_NSC: u1,
            }),
            ///  Event and escalate status
            EVENT: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  PMIC is escalting secure event
                PMIC_ESC_SEC: u1,
                ///  PMIC is escalating non-secure event
                PMIC_ESC_NSC: u1,
                reserved16: u12,
                ///  local event statue, each bit represents one security event
                EVENT: u16,
            }),
            ///  Lifecycle
            LIFECYCLE: mmio.Mmio(packed struct(u32) {
                ///  lifecycle status, bit7: lifecycle_debate, bit6: lifecycle_scribe, bit5: lifecycle_no_ret, bit4: lifecycle_return, bit3: lifecycle_secure, bit2: lifecycle_nonsec, bit1: lifecycle_create, bit0: lifecycle_unknow
                LIFECYCLE: u8,
                padding: u24,
            }),
        };

        ///  SDP
        pub const SDP = extern struct {
            ///  SDP control register
            SDPCR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt Enablement, controlled by SW. 1, SDP interrupt is enabled. 0, SDP interrupt is disabled.
                INTEN: u1,
                reserved8: u7,
                ///  when set to "1", the 1st data packet descriptor loacted in the register(CMDPTR, NPKTPTR, ...) when set to "0", the 1st data packet descriptor loacted in the memeory(pointed by CMDPTR)
                RDSCEN: u1,
                reserved17: u8,
                ///  Test purpose for interrupt when Packet counter reachs "0", but CHAIN=1 in the current packet.
                TSTPKT0IRQ: u1,
                reserved19: u1,
                ///  Decryption Disable bit, Write to 1 to disable the decryption.
                DCRPDI: u1,
                ///  Constant Fill to memory, controlled by SW. 1, Constant fill is Enabled. 0, Constant fill is Disabled.
                CONFEN: u1,
                ///  Memory Copy Enablement, controlled by SW. 1, Memory copy is Enabled. 0, Memory copy is Disabled.
                MCPEN: u1,
                ///  HASH Enablement, controlled by SW. 1, HASH is Enabled. 0, HASH is Disabled.
                HASHEN: u1,
                ///  Cipher Enablement, controlled by SW. 1, Cipher is Enabled. 0, Cipher is Disabled.
                CIPHEN: u1,
                reserved28: u4,
                ///  HASH Disable, read the info, whether the HASH features is besing disable in this chip or not. 1, HASH is disabled in this chip. 0, HASH is enabled in this chip.
                HASDIS: u1,
                ///  Cipher Disable, read the info, whether the CIPHER features is besing disable in this chip or not. 1, Cipher is disabled in this chip. 0, Cipher is enabled in this chip.
                CIPDIS: u1,
                ///  Clock Gate for the SDP main logic. Write to 1 will clock gate for most logic of the SDP block, dynamic power saving when not use SDP block.
                CLKGAT: u1,
                ///  soft reset. Write 1 then 0, to reset the SDP block.
                SFTRST: u1,
            }),
            ///  Mod control register.
            MODCTRL: mmio.Mmio(packed struct(u32) {
                ///  Decide whether the SDP byteswaps the Key (big-endian data). When all bits are set, the data is assumed to be in the big-endian format
                KEYSWP: u2,
                ///  Decide whether the SDP byteswaps the output data (big-endian data); When all bits are set, the data is assumed to be in the big-endian format
                DOUTSWP: u2,
                ///  Decide whether the SDP byteswaps the input data (big-endian data); When all bits are set, the data is assumed to be in the big-endian format
                DINSWP: u2,
                reserved9: u3,
                ///  When hashing is enabled, this bit controls the input or output data of the AES engine is hashed. 0 INPUT HASH 1 OUTPUT HASH
                HASOUT: u1,
                ///  HASH Check Enable Bit. 1x1, HASH check need, hash result will compare with the HASHRSLT 0-7 registers; 1x0, HASH check is not enabled, HASHRSLT0-7 store the HASH result. For SHA1, will use HASHRSLT0-3 words, and HASH 256 will use HASH0-7 words.
                HASCHK: u1,
                ///  CRC enable. 1x1, CRC is enabled. 1x0, CRC is disabled.
                CRCEN: u1,
                ///  HASH Algorithem selection. 0x0 SHA1 — 0x1 CRC32 — 0x2 SHA256 —
                HASALG: u4,
                ///  AES direction 1x1, AES Decryption 1x0, AES Encryption.
                AESDIR: u1,
                reserved18: u1,
                ///  AES Key Selection. These regisgers are being used to select the AES key that stored in the 16x128 key ram of the SDP, or select the key from the OTP. Detail as following: 0x00: key from the 16x128, this is the key read address, valid for AES128; AES256 will use 128 bit from this address and 128 bit key from next address as 256 bit AES key. 0x01: key from the 16x128, this is the key read address, valid for AES128, not valid for AES286. .... 0x0E: key from the 16x128, this is the key read address, valid for AES128; AES256 will use 128 from this add and 128 from next add for the AES key. 0x0F: key from the 16x128, this is the key read address, valid for AES128, not valid for AES286. 0x20: kman_sk0[127:0] from the key manager for AES128; AES256 will use kman_sk0[255:0] as AES key. 0x21: kman_sk0[255:128] from the key manager for AES128; not valid for AES256. 0x22: kman_sk1[127:0] from the key manager for AES128; AES256 will use kman_sk1[255:0] as AES key. 0x23: kman_sk1[255:128] from the key manager for AES128; not valid for AES256. 0x24: kman_sk2[127:0] from the key manager for AES128; AES256 will use kman_sk2[255:0] as AES key. 0x25: kman_sk2[255:128] from the key manager for AES128; not valid for AES256. 0x26: kman_sk3[127:0] from the key manager for AES128; AES256 will use kman_sk3[255:0] as AES key. 0x27: kman_sk3[255:128] from the key manager for AES128; not valid for AES256. 0x30: exip0_key[127:0] from OTP for AES128; AES256 will use exip0_key[255:0] as AES key. 0x31: exip0_key[255:128] from OTP for AES128; not valid for AES256. 0x32: exip1_key[127:0] from OTP for AES128; AES256 will use exip1_key[255:0] as AES key. 0x33: exip1_key[255:128] from OTP for AES128; not valid for AES256. Other values, reserved.
                AESKS: u6,
                ///  AES mode selection. 0x0 = ECB; 0x1 = CBC; Others, reserved.
                AESMOD: u4,
                ///  AES algorithem selection. 0x0 = AES 128; 0x1 = AES 256; 0x8 = SM4； Others, reserved.
                AESALG: u4,
            }),
            ///  packet counter registers.
            PKTCNT: mmio.Mmio(packed struct(u32) {
                ///  The value written to this field is added to the spacket count.
                CNTINCR: u8,
                reserved16: u8,
                ///  This read-only field shows the current (instantaneous) value of the packet counter
                CNTVAL: u8,
                padding: u8,
            }),
            ///  Status Registers
            STA: mmio.Mmio(packed struct(u32) {
                ///  buffer chain error happen when packet's CHAIN bit=0, but the Packet counter is still not zero.
                ERRCHAIN: u1,
                ///  Hashing Check Error
                ERRHAS: u1,
                ///  Destination Buffer Error
                ERRDST: u1,
                ///  Source Buffer Access Error
                ERRSRC: u1,
                ///  Packet head access error, or status update error.
                ERRPKT: u1,
                ///  Working mode setup error.
                ERRSET: u1,
                reserved16: u10,
                ///  Packet processing done, will trigger this itnerrrupt when the "PKTINT" bit set in the packet control word.
                PKTDON: u1,
                ///  Packet Counter registers reachs to ZERO now.
                PKTCNT0: u1,
                ///  Hashing Busy
                HASBSY: u1,
                ///  AES Busy
                AESBSY: u1,
                ///  the chain buffer "chain" bit is "1", while packet counter is "0", now, waiting for new buffer data.
                CHN1PKT0: u1,
                reserved23: u2,
                ///  interrupt Request, requested when error happen, or when packet processing done, packet counter reach to zero.
                IRQ: u1,
                ///  packet tag.
                TAG: u8,
            }),
            ///  Key Address
            KEYADDR: mmio.Mmio(packed struct(u32) {
                ///  Key subword pointer. The valid indices are 0-3. After each write to the key data register, this field increments; To write a key, the software must first write the desired key index/subword to this register.
                SUBWRD: u2,
                reserved16: u14,
                ///  To write a key to the SDP KEY RAM, the software must first write the desired key index/subword to this register. Key index pointer. The valid indices are 0-[number_keys]. In the SDP, there is a 16x128 key ram can store 16 AES128 keys or 8 AES 256 Keys; this index is for addressing the 16 128-bit key addresses.
                INDEX: u8,
                padding: u8,
            }),
            ///  Key Data
            KEYDAT: mmio.Mmio(packed struct(u32) {
                ///  This register provides the write access to the key/key subword specified by the key index register. Writing this location updates the selected subword for the key located at the index specified by the key index register. The write also triggers the SUBWORD field of the KEY register to increment to the next higher word in the key
                KEYDAT: u32,
            }),
            reserved72: [48]u8,
            ///  Command Pointer
            CMDPTR: mmio.Mmio(packed struct(u32) {
                ///  current command addresses the register points to the multiword descriptor that is to be executed (or is currently being executed)
                CMDPTR: u32,
            }),
            ///  Next Packet Address Pointer
            NPKTPTR: mmio.Mmio(packed struct(u32) {
                ///  Next Packet Address Pointer
                NPKTPTR: u32,
            }),
            ///  Packet Control Registers
            PKTCTL: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Reflects whether the channel must issue an interrupt upon the completion of the packet
                PKTINT: u1,
                ///  whether the channel's semaphore must be decremented at the end of the current operation. When the semaphore reaches a value of zero, no more operations are issued from the channel.
                DCRSEMA: u1,
                ///  whether the next command pointer register must be loaded into the channel's current descriptor pointer.
                CHAIN: u1,
                ///  Hash Initialization packat
                HASINI: u1,
                ///  Hash Termination packet
                HASFNL: u1,
                ///  Load Initial Vector for the AES in this packet.
                CIPHIV: u1,
                reserved24: u17,
                ///  packet tag
                PKTTAG: u8,
            }),
            ///  Packet Memory Source Address
            PKTSRC: mmio.Mmio(packed struct(u32) {
                ///  Packet Memory Source Address
                PKTSRC: u32,
            }),
            ///  Packet Memory Destination Address
            PKTDST: mmio.Mmio(packed struct(u32) {
                ///  Packet Memory Destination Address
                PKTDST: u32,
            }),
            ///  Packet buffer size.
            PKTBUF: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                PKTBUF: u32,
            }),
        };

        ///  DMAMUX
        pub const DMAMUX = struct {};

        ///  HDMA
        pub const HDMA = extern struct {
            reserved4: [4]u8,
            ///  ID Misc
            IDMisc: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  current channel in used
                CURCHAN: u5,
                ///  DMA state machine localparam ST_IDLE = 3'b000; localparam ST_READ = 3'b001; localparam ST_READ_ACK = 3'b010; localparam ST_WRITE = 3'b011; localparam ST_WRITE_ACK = 3'b100; localparam ST_LL = 3'b101; localparam ST_END = 3'b110; localparam ST_END_WAIT = 3'b111;
                DMASTATE: u3,
                padding: u16,
            }),
            reserved16: [8]u8,
            ///  DMAC Configuration Register
            DMACfg: mmio.Mmio(packed struct(u32) {
                ///  Channel number 0x1: 1 channel 0x2: 2 channels ... 0x8: 8 channels Others: Invalid
                CHANNELNUM: u4,
                ///  FIFO depth 0x4: 4 entries 0x8: 8 entries 0x10: 16 entries 0x20: 32 entries Others: Invalid
                FIFODEPTH: u6,
                ///  Request/acknowledge pair number 0x0: 0 pair 0x1: 1 pair 0x2: 2 pairs ... 0x10: 16 pairs
                REQNUM: u5,
                ///  AXI bus interface number 0x0: 1 AXI bus 0x1: 2 AXI busses
                BUSNUM: u1,
                ///  DMA core number 0x0: 1 core 0x1: 2 cores
                CORENUM: u1,
                ///  AXI bus address width 0x18: 24 bits 0x19: 25 bits ... 0x40: 64 bits Others: Invalid
                ADDRWIDTH: u7,
                ///  AXI bus data width 0x0: 32 bits 0x1: 64 bits 0x2: 128 bits 0x3: 256 bits
                DATAWIDTH: u2,
                reserved30: u4,
                ///  DMA request synchronization. The DMA request synchronization should be configured to avoid signal integrity problems when the request signal is not clocked by the system bus clock, which the DMA control logic operates in. If the request synchronization is not configured, the request signal is sampled directly without synchronization. 0x0: Request synchronization is not configured 0x1: Request synchronization is configured
                REQSYNC: u1,
                ///  Chain transfer 0x0: Chain transfer is not configured 0x1: Chain transfer is configured
                CHAINXFR: u1,
            }),
            ///  DMAC Control Register
            DMACtrl: mmio.Mmio(packed struct(u32) {
                ///  Software reset control. Write 1 to this bit to reset the DMA core and disable all channels. Note: The software reset may cause the in-completion of AXI transaction.
                RESET: u1,
                padding: u31,
            }),
            ///  Channel Abort Register
            ChAbort: mmio.Mmio(packed struct(u32) {
                ///  Write 1 to bit n to abort channel n. The bits should only be set when the corresponding channels are enabled. Otherwise, the writes will be ignored for channels that are not enabled. (N: Number of channels)
                CHABORT: u32,
            }),
            reserved36: [8]u8,
            ///  Harlf Complete Interrupt Status
            INTHALFSTS: mmio.Mmio(packed struct(u32) {
                ///  half transfer done irq status
                STS: u32,
            }),
            ///  Trans Complete Interrupt Status Register
            INTTCSTS: mmio.Mmio(packed struct(u32) {
                ///  The terminal count status, one bit per channel. The terminal count status is set when a channel transfer finishes without the abort or error event. 0x0: Channel n has no terminal count status 0x1: Channel n has terminal count status
                STS: u32,
            }),
            ///  Abort Interrupt Status Register
            INTABORTSTS: mmio.Mmio(packed struct(u32) {
                ///  The abort status of channel, one bit per channel. The abort status is set when a channel transfer is aborted. 0x0: Channel n has no abort status 0x1: Channel n has abort status
                STS: u32,
            }),
            ///  Error Interrupt Status Register
            INTERRSTS: mmio.Mmio(packed struct(u32) {
                ///  The error status, one bit per channel. The error status is set when a channel transfer encounters the following error events: - Bus error - Unaligned address - Unaligned transfer width - Reserved configuration 0x0: Channel n has no error status 0x1: Channel n has error status
                STS: u32,
            }),
            ///  Channel Enable Register
            ChEN: mmio.Mmio(packed struct(u32) {
                ///  Alias of the Enable field of all ChnCtrl registers
                CHEN: u32,
            }),
        };

        ///  GPIOM
        pub const GPIOM = struct {};

        ///  PTPC
        pub const PTPC = extern struct {
            reserved8192: [8192]u8,
            ///  No description avaiable
            time_sel: mmio.Mmio(packed struct(u32) {
                ///  set to use ptpc1 for canx clr to use ptpc0 for canx
                CAN0_TIME_SEL: u1,
                ///  No description avaiable
                CAN1_TIME_SEL: u1,
                ///  No description avaiable
                CAN2_TIME_SEL: u1,
                ///  No description avaiable
                CAN3_TIME_SEL: u1,
                padding: u28,
            }),
            ///  No description avaiable
            int_sts: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                PPS_INT_STS0: u1,
                ///  No description avaiable
                CAPTURE_INT_STS0: u1,
                ///  No description avaiable
                COMP_INT_STS0: u1,
                reserved16: u13,
                ///  No description avaiable
                PPS_INT_STS1: u1,
                ///  No description avaiable
                CAPTURE_INT_STS1: u1,
                ///  No description avaiable
                COMP_INT_STS1: u1,
                padding: u13,
            }),
            ///  No description avaiable
            int_en: mmio.Mmio(packed struct(u32) {
                ///  No description avaiable
                PPS_INT_STS0: u1,
                ///  No description avaiable
                CAPTURE_INT_STS0: u1,
                ///  No description avaiable
                COMP_INT_STS0: u1,
                reserved16: u13,
                ///  No description avaiable
                PPS_INT_STS1: u1,
                ///  No description avaiable
                CAPTURE_INT_STS1: u1,
                ///  No description avaiable
                COMP_INT_STS1: u1,
                padding: u13,
            }),
            reserved12288: [4084]u8,
            ///  No description avaiable
            ptpc_can_ts_sel: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  No description avaiable
                TSU_TBIN0_SEL: u6,
                ///  No description avaiable
                TSU_TBIN1_SEL: u6,
                ///  No description avaiable
                TSU_TBIN2_SEL: u6,
                ///  No description avaiable
                TSU_TBIN3_SEL: u6,
            }),
        };

        ///  PLB
        pub const PLB = struct {};

        ///  SYNT
        pub const SYNT = extern struct {
            ///  Global control register
            gcr: mmio.Mmio(packed struct(u32) {
                ///  1- Enable counter
                CEN: u1,
                ///  1- Reset counter
                CRST: u1,
                ///  set to enable cpu_debug_mode to stop the counter
                COUNTER_DEBUG_EN: u1,
                reserved4: u1,
                ///  set to enable the timesamp , clr to stop
                TIMESTAMP_ENABLE: u1,
                ///  set to enable cpu_debug_mode to stop the timesamp
                TIMESTAMP_DEBUG_EN: u1,
                reserved28: u22,
                ///  reset timesamp to 0, auto clr
                TIMESTAMP_RESET: u1,
                ///  set the timesamp to new value, auto clr
                TIMESTAMP_SET_NEW: u1,
                ///  set to decrease the timesamp with new value, auto clr
                TIMESTAMP_DEC_NEW: u1,
                ///  set to increase the timesamp with new value, auto clr
                TIMESTAMP_INC_NEW: u1,
            }),
            ///  Counter reload register
            rld: mmio.Mmio(packed struct(u32) {
                ///  counter reload value
                RLD: u32,
            }),
            ///  timestamp new value register
            timestamp_new: mmio.Mmio(packed struct(u32) {
                ///  new value for timesamp , can be used as set/inc/dec
                VALUE: u32,
            }),
            ///  Counter
            cnt: mmio.Mmio(packed struct(u32) {
                ///  counter
                CNT: u32,
            }),
            ///  timestamp trig save value
            timestamp_sav: mmio.Mmio(packed struct(u32) {
                ///  use the trigger to save timesamp here
                VALUE: u32,
            }),
            ///  timestamp read value
            timestamp_cur: mmio.Mmio(packed struct(u32) {
                ///  current timesamp value
                VALUE: u32,
            }),
        };
    };
};
