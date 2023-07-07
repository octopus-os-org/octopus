const mmio = @import("mmio.zig");

pub const devices = struct {
    ///  STM32L4x5
    pub const STM32L4x5 = struct {
        pub const properties = struct {
            pub const @"cpu.endian" = "little";
            pub const @"cpu.mpuPresent" = "false";
            pub const @"cpu.revision" = "r1p0";
            pub const @"cpu.name" = "CM4";
            pub const @"cpu.nvicPrioBits" = "3";
            pub const @"cpu.vendorSystickConfig" = "false";
            pub const @"cpu.fpuPresent" = "false";
        };

        pub const VectorTable = extern struct {
            const Handler = 4;
            const unhandled = 4;

            initial_stack_pointer: u32,
            Reset: Handler = unhandled,
            NMI: Handler = unhandled,
            HardFault: Handler = unhandled,
            MemManageFault: Handler = unhandled,
            BusFault: Handler = unhandled,
            UsageFault: Handler = unhandled,
            reserved5: [4]u32 = undefined,
            SVCall: Handler = unhandled,
            reserved10: [2]u32 = undefined,
            PendSV: Handler = unhandled,
            SysTick: Handler = unhandled,
            ///  Window Watchdog interrupt
            WWDG: Handler = unhandled,
            ///  PVD through EXTI line detection
            PVD: Handler = unhandled,
            ///  Tamper and TimeStamp interrupts
            TAMP_STAMP: Handler = unhandled,
            ///  RTC Tamper or TimeStamp /CSS on LSE through EXTI line 19 interrupts
            RTC_WKUP: Handler = unhandled,
            reserved18: [1]u32 = undefined,
            ///  RCC global interrupt
            RCC: Handler = unhandled,
            ///  EXTI Line 0 interrupt
            EXTI0: Handler = unhandled,
            ///  EXTI Line 1 interrupt
            EXTI1: Handler = unhandled,
            ///  EXTI Line 2 interrupt
            EXTI2: Handler = unhandled,
            ///  EXTI Line 3 interrupt
            EXTI3: Handler = unhandled,
            ///  EXTI Line4 interrupt
            EXTI4: Handler = unhandled,
            ///  DMA1 Channel1 global interrupt
            DMA1_Channel1: Handler = unhandled,
            ///  DMA1 Channel2 global interrupt
            DMA1_Channel2: Handler = unhandled,
            ///  DMA1 Channel3 interrupt
            DMA1_Channel3: Handler = unhandled,
            ///  DMA1 Channel4 interrupt
            DMA1_Channel4: Handler = unhandled,
            ///  DMA1 Channel5 interrupt
            DMA1_Channel5: Handler = unhandled,
            ///  DMA1 Channel6 interrupt
            DMA1_Channel6: Handler = unhandled,
            ///  DMA1 Channel 7 interrupt
            DMA1_Channel7: Handler = unhandled,
            ///  ADC1 and ADC2 global interrupt
            ADC1_2: Handler = unhandled,
            reserved33: [4]u32 = undefined,
            ///  EXTI Line5 to Line9 interrupts
            EXTI9_5: Handler = unhandled,
            ///  Timer 15 global interrupt
            TIM15: Handler = unhandled,
            ///  Timer 16 global interrupt
            TIM16: Handler = unhandled,
            ///  TIM1 Trigger and Commutation interrupts and TIM17 global interrupt
            TIM1_TRG_COM_TIM17: Handler = unhandled,
            ///  TIM1 Capture Compare interrupt
            TIM1_CC: Handler = unhandled,
            ///  TIM2 global interrupt
            TIM2: Handler = unhandled,
            ///  TIM3 global interrupt
            TIM3: Handler = unhandled,
            ///  TIM4 global interrupt
            TIM4: Handler = unhandled,
            ///  I2C1 event interrupt
            I2C1_EV: Handler = unhandled,
            ///  I2C1 error interrupt
            I2C1_ER: Handler = unhandled,
            ///  I2C2 event interrupt
            I2C2_EV: Handler = unhandled,
            ///  I2C2 error interrupt
            I2C2_ER: Handler = unhandled,
            ///  SPI1 global interrupt
            SPI1: Handler = unhandled,
            ///  SPI2 global interrupt
            SPI2: Handler = unhandled,
            ///  USART1 global interrupt
            USART1: Handler = unhandled,
            ///  USART2 global interrupt
            USART2: Handler = unhandled,
            ///  USART3 global interrupt
            USART3: Handler = unhandled,
            ///  EXTI Lines 10 to 15 interrupts
            EXTI15_10: Handler = unhandled,
            ///  RTC alarms through EXTI line 18 interrupts
            RTC_ALARM: Handler = unhandled,
            ///  SD Filter 3 global Interrupt
            DFSDM3: Handler = unhandled,
            ///  TIM8 Break Interrupt
            TIM8_BRK: Handler = unhandled,
            ///  TIM8 Update Interrupt
            TIM8: Handler = unhandled,
            ///  TIM8 Trigger and Commutation Interrupt
            TIM8_TRG_COM: Handler = unhandled,
            ///  TIM8 Capture Compare Interrupt
            TIM8_CC: Handler = unhandled,
            ///  ADC3 global Interrupt
            ADC3: Handler = unhandled,
            ///  FMC global Interrupt
            FMC: Handler = unhandled,
            ///  SDMMC global Interrupt
            SDMMC: Handler = unhandled,
            ///  TIM5 global Interrupt
            TIM5: Handler = unhandled,
            ///  SPI3 global Interrupt
            SPI3: Handler = unhandled,
            ///  UART4 global Interrupt
            UART4: Handler = unhandled,
            ///  UART5 global Interrupt
            UART5: Handler = unhandled,
            ///  TIM6 global and DAC1 and 2 underrun error interrupts
            TIM6_DAC: Handler = unhandled,
            ///  TIM7 global interrupt
            TIM7: Handler = unhandled,
            ///  DMA2 Channel 1 global Interrupt
            DMA2_Channel1: Handler = unhandled,
            ///  DMA2 Channel 2 global Interrupt
            DMA2_Channel2: Handler = unhandled,
            ///  DMA2 Channel 3 global Interrupt
            DMA2_Channel3: Handler = unhandled,
            ///  DMA2 Channel 4 global Interrupt
            DMA2_Channel4: Handler = unhandled,
            ///  DMA2 Channel 5 global Interrupt
            DMA2_Channel5: Handler = unhandled,
            ///  SD Filter 0 global Interrupt
            DFSDM0: Handler = unhandled,
            ///  SD Filter 1 global Interrupt
            DFSDM1: Handler = unhandled,
            ///  SD Filter 2 global Interrupt
            DFSDM2: Handler = unhandled,
            ///  COMP1 and COMP2 interrupts
            COMP: Handler = unhandled,
            ///  LP TIM1 interrupt
            LPTIM1: Handler = unhandled,
            ///  LP TIM2 interrupt
            LPTIM2: Handler = unhandled,
            reserved81: [1]u32 = undefined,
            ///  DMA2 Channel 6 global Interrupt
            DMA2_Channel6: Handler = unhandled,
            ///  DMA2 Channel 7 global Interrupt
            DMA2_Channel7: Handler = unhandled,
            reserved84: [1]u32 = undefined,
            ///  Quad SPI global interrupt
            QUADSPI: Handler = unhandled,
            ///  I2C3 event interrupt
            I2C3_EV: Handler = unhandled,
            ///  I2C3 error interrupt
            I2C3_ER: Handler = unhandled,
            ///  SAI1 global interrupt
            SAI1: Handler = unhandled,
            ///  SAI2 global interrupt
            SAI2: Handler = unhandled,
            ///  SWPMI1 global interrupt
            SWPMI1: Handler = unhandled,
            ///  TSC global interrupt
            TSC: Handler = unhandled,
            ///  LCD global interrupt
            LCD: Handler = unhandled,
            ///  RNG global interrupt
            RNG: Handler = unhandled,
            reserved94: [1]u32 = undefined,
            ///  Floating point interrupt
            FPU: Handler = unhandled,
        };

        pub const peripherals = struct {
            ///  General-purpose-timers
            pub const TIM2 = @as(*volatile types.peripherals.TIM2, @ptrFromInt(0x40000000));
            ///  General-purpose-timers
            pub const TIM3 = @as(*volatile types.peripherals.TIM2, @ptrFromInt(0x40000400));
            ///  General-purpose-timers
            pub const TIM4 = @as(*volatile types.peripherals.TIM2, @ptrFromInt(0x40000800));
            ///  General-purpose-timers
            pub const TIM5 = @as(*volatile types.peripherals.TIM2, @ptrFromInt(0x40000c00));
            ///  Basic-timers
            pub const TIM6 = @as(*volatile types.peripherals.TIM6, @ptrFromInt(0x40001000));
            ///  Basic-timers
            pub const TIM7 = @as(*volatile types.peripherals.TIM6, @ptrFromInt(0x40001400));
            ///  Liquid crystal display controller
            pub const LCD = @as(*volatile types.peripherals.LCD, @ptrFromInt(0x40002400));
            ///  Real-time clock
            pub const RTC = @as(*volatile types.peripherals.RTC, @ptrFromInt(0x40002800));
            ///  System window watchdog
            pub const WWDG = @as(*volatile types.peripherals.WWDG, @ptrFromInt(0x40002c00));
            ///  Independent watchdog
            pub const IWDG = @as(*volatile types.peripherals.IWDG, @ptrFromInt(0x40003000));
            ///  Serial peripheral interface/Inter-IC sound
            pub const SPI2 = @as(*volatile types.peripherals.SPI1, @ptrFromInt(0x40003800));
            ///  Serial peripheral interface/Inter-IC sound
            pub const SPI3 = @as(*volatile types.peripherals.SPI1, @ptrFromInt(0x40003c00));
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART2 = @as(*volatile types.peripherals.USART1, @ptrFromInt(0x40004400));
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART3 = @as(*volatile types.peripherals.USART1, @ptrFromInt(0x40004800));
            ///  Universal synchronous asynchronous receiver transmitter
            pub const UART4 = @as(*volatile types.peripherals.USART1, @ptrFromInt(0x40004c00));
            ///  Universal synchronous asynchronous receiver transmitter
            pub const UART5 = @as(*volatile types.peripherals.USART1, @ptrFromInt(0x40005000));
            ///  Inter-integrated circuit
            pub const I2C1 = @as(*volatile types.peripherals.I2C1, @ptrFromInt(0x40005400));
            ///  Inter-integrated circuit
            pub const I2C2 = @as(*volatile types.peripherals.I2C1, @ptrFromInt(0x40005800));
            ///  Inter-integrated circuit
            pub const I2C3 = @as(*volatile types.peripherals.I2C1, @ptrFromInt(0x40005c00));
            ///  Clock recovery system
            pub const CRS = @as(*volatile types.peripherals.CRS, @ptrFromInt(0x40006000));
            ///  Controller area network
            pub const CAN1 = @as(*volatile types.peripherals.CAN1, @ptrFromInt(0x40006400));
            ///  Universal serial bus full-speed device interface
            pub const USB = @as(*volatile types.peripherals.USB, @ptrFromInt(0x40006c00));
            ///  Power control
            pub const PWR = @as(*volatile types.peripherals.PWR, @ptrFromInt(0x40007000));
            ///  Digital-to-analog converter
            pub const DAC1 = @as(*volatile types.peripherals.DAC1, @ptrFromInt(0x40007400));
            ///  Operational amplifiers
            pub const OPAMP = @as(*volatile types.peripherals.OPAMP, @ptrFromInt(0x40007800));
            ///  Low power timer
            pub const LPTIM1 = @as(*volatile types.peripherals.LPTIM1, @ptrFromInt(0x40007c00));
            ///  Universal synchronous asynchronous receiver transmitter
            pub const LPUART1 = @as(*volatile types.peripherals.LPUART1, @ptrFromInt(0x40008000));
            ///  Single Wire Protocol Master Interface
            pub const SWPMI1 = @as(*volatile types.peripherals.SWPMI1, @ptrFromInt(0x40008800));
            ///  Low power timer
            pub const LPTIM2 = @as(*volatile types.peripherals.LPTIM1, @ptrFromInt(0x40009400));
            ///  System configuration controller
            pub const SYSCFG = @as(*volatile types.peripherals.SYSCFG, @ptrFromInt(0x40010000));
            ///  Voltage reference buffer
            pub const VREFBUF = @as(*volatile types.peripherals.VREFBUF, @ptrFromInt(0x40010030));
            ///  Comparator
            pub const COMP = @as(*volatile types.peripherals.COMP, @ptrFromInt(0x40010200));
            ///  External interrupt/event controller
            pub const EXTI = @as(*volatile types.peripherals.EXTI, @ptrFromInt(0x40010400));
            ///  Firewall
            pub const FIREWALL = @as(*volatile types.peripherals.FIREWALL, @ptrFromInt(0x40011c00));
            ///  Secure digital input/output interface
            pub const SDMMC = @as(*volatile types.peripherals.SDMMC, @ptrFromInt(0x40012800));
            ///  Advanced-timers
            pub const TIM1 = @as(*volatile types.peripherals.TIM1, @ptrFromInt(0x40012c00));
            ///  Serial peripheral interface/Inter-IC sound
            pub const SPI1 = @as(*volatile types.peripherals.SPI1, @ptrFromInt(0x40013000));
            ///  Advanced-timers
            pub const TIM8 = @as(*volatile types.peripherals.TIM8, @ptrFromInt(0x40013400));
            ///  Universal synchronous asynchronous receiver transmitter
            pub const USART1 = @as(*volatile types.peripherals.USART1, @ptrFromInt(0x40013800));
            ///  General purpose timers
            pub const TIM15 = @as(*volatile types.peripherals.TIM15, @ptrFromInt(0x40014000));
            ///  General purpose timers
            pub const TIM16 = @as(*volatile types.peripherals.TIM16, @ptrFromInt(0x40014400));
            ///  General purpose timers
            pub const TIM17 = @as(*volatile types.peripherals.TIM16, @ptrFromInt(0x40014800));
            ///  Serial audio interface
            pub const SAI1 = @as(*volatile types.peripherals.SAI1, @ptrFromInt(0x40015400));
            ///  Serial audio interface
            pub const SAI2 = @as(*volatile types.peripherals.SAI1, @ptrFromInt(0x40015800));
            ///  Digital filter for sigma delta modulators
            pub const DFSDM = @as(*volatile types.peripherals.DFSDM, @ptrFromInt(0x40016000));
            ///  Direct memory access controller
            pub const DMA1 = @as(*volatile types.peripherals.DMA1, @ptrFromInt(0x40020000));
            ///  Direct memory access controller
            pub const DMA2 = @as(*volatile types.peripherals.DMA1, @ptrFromInt(0x40020400));
            ///  Reset and clock control
            pub const RCC = @as(*volatile types.peripherals.RCC, @ptrFromInt(0x40021000));
            ///  Flash
            pub const FLASH = @as(*volatile types.peripherals.FLASH, @ptrFromInt(0x40022000));
            ///  Cyclic redundancy check calculation unit
            pub const CRC = @as(*volatile types.peripherals.CRC, @ptrFromInt(0x40023000));
            ///  Touch sensing controller
            pub const TSC = @as(*volatile types.peripherals.TSC, @ptrFromInt(0x40024000));
            ///  General-purpose I/Os
            pub const GPIOA = @as(*volatile types.peripherals.GPIOA, @ptrFromInt(0x48000000));
            ///  General-purpose I/Os
            pub const GPIOB = @as(*volatile types.peripherals.GPIOB, @ptrFromInt(0x48000400));
            ///  General-purpose I/Os
            pub const GPIOC = @as(*volatile types.peripherals.GPIOC, @ptrFromInt(0x48000800));
            ///  General-purpose I/Os
            pub const GPIOD = @as(*volatile types.peripherals.GPIOC, @ptrFromInt(0x48000c00));
            ///  General-purpose I/Os
            pub const GPIOE = @as(*volatile types.peripherals.GPIOC, @ptrFromInt(0x48001000));
            ///  General-purpose I/Os
            pub const GPIOF = @as(*volatile types.peripherals.GPIOC, @ptrFromInt(0x48001400));
            ///  General-purpose I/Os
            pub const GPIOG = @as(*volatile types.peripherals.GPIOC, @ptrFromInt(0x48001800));
            ///  General-purpose I/Os
            pub const GPIOH = @as(*volatile types.peripherals.GPIOC, @ptrFromInt(0x48001c00));
            ///  Analog-to-Digital Converter
            pub const ADC1 = @as(*volatile types.peripherals.ADC1, @ptrFromInt(0x50040000));
            ///  Analog-to-Digital Converter
            pub const ADC2 = @as(*volatile types.peripherals.ADC1, @ptrFromInt(0x50040100));
            ///  Analog-to-Digital Converter
            pub const ADC3 = @as(*volatile types.peripherals.ADC1, @ptrFromInt(0x50040200));
            ///  Analog-to-Digital Converter
            pub const ADC123_Common = @as(*volatile types.peripherals.ADC123_Common, @ptrFromInt(0x50040300));
            ///  Advanced encryption standard hardware accelerator
            pub const AES = @as(*volatile types.peripherals.AES, @ptrFromInt(0x50060000));
            ///  Random number generator
            pub const RNG = @as(*volatile types.peripherals.RNG, @ptrFromInt(0x50060800));
            ///  Flexible memory controller
            pub const FMC = @as(*volatile types.peripherals.FMC, @ptrFromInt(0xa0000000));
            ///  QuadSPI interface
            pub const QUADSPI = @as(*volatile types.peripherals.QUADSPI, @ptrFromInt(0xa0001000));
            ///  System control block ACTLR
            pub const SCB_ACTRL = @as(*volatile types.peripherals.SCB_ACTRL, @ptrFromInt(0xe000e008));
            ///  SysTick timer
            pub const STK = @as(*volatile types.peripherals.STK, @ptrFromInt(0xe000e010));
            ///  Nested Vectored Interrupt Controller
            pub const NVIC = @as(*volatile types.peripherals.NVIC, @ptrFromInt(0xe000e100));
            ///  System control block
            pub const SCB = @as(*volatile types.peripherals.SCB, @ptrFromInt(0xe000ed00));
            ///  Floating point unit CPACR
            pub const FPU_CPACR = @as(*volatile types.peripherals.FPU_CPACR, @ptrFromInt(0xe000ed88));
            ///  Memory protection unit
            pub const MPU = @as(*volatile types.peripherals.MPU, @ptrFromInt(0xe000ed90));
            ///  Nested vectored interrupt controller
            pub const NVIC_STIR = @as(*volatile types.peripherals.NVIC_STIR, @ptrFromInt(0xe000ef00));
            ///  Floting point unit
            pub const FPU = @as(*volatile types.peripherals.FPU, @ptrFromInt(0xe000ef34));
            ///  Debug support
            pub const DBGMCU = @as(*volatile types.peripherals.DBGMCU, @ptrFromInt(0xe0042000));
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        ///  Digital-to-analog converter
        pub const DAC1 = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 enable
                EN1: u1,
                reserved2: u1,
                ///  DAC channel1 trigger enable
                TEN1: u1,
                ///  DAC channel1 trigger selection
                TSEL1: u3,
                ///  DAC channel1 noise/triangle wave generation enable
                WAVE1: u2,
                ///  DAC channel1 mask/amplitude selector
                MAMP1: u4,
                ///  DAC channel1 DMA enable
                DMAEN1: u1,
                ///  DAC channel1 DMA Underrun Interrupt enable
                DMAUDRIE1: u1,
                ///  DAC Channel 1 calibration enable
                CEN1: u1,
                reserved16: u1,
                ///  DAC channel2 enable
                EN2: u1,
                reserved18: u1,
                ///  DAC channel2 trigger enable
                TEN2: u1,
                ///  DAC channel2 trigger selection
                TSEL2: u3,
                ///  DAC channel2 noise/triangle wave generation enable
                WAVE2: u2,
                ///  DAC channel2 mask/amplitude selector
                MAMP2: u4,
                ///  DAC channel2 DMA enable
                DMAEN2: u1,
                ///  DAC channel2 DMA underrun interrupt enable
                DMAUDRIE2: u1,
                ///  DAC Channel 2 calibration enable
                CEN2: u1,
                padding: u1,
            }),
            ///  software trigger register
            SWTRIGR: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 software trigger
                SWTRIG1: u1,
                ///  DAC channel2 software trigger
                SWTRIG2: u1,
                padding: u30,
            }),
            ///  channel1 12-bit right-aligned data holding register
            DHR12R1: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 12-bit right-aligned data
                DACC1DHR: u12,
                padding: u20,
            }),
            ///  channel1 12-bit left-aligned data holding register
            DHR12L1: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  DAC channel1 12-bit left-aligned data
                DACC1DHR: u12,
                padding: u16,
            }),
            ///  channel1 8-bit right-aligned data holding register
            DHR8R1: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 8-bit right-aligned data
                DACC1DHR: u8,
                padding: u24,
            }),
            ///  channel2 12-bit right aligned data holding register
            DHR12R2: mmio.Mmio(packed struct(u32) {
                ///  DAC channel2 12-bit right-aligned data
                DACC2DHR: u12,
                padding: u20,
            }),
            ///  channel2 12-bit left aligned data holding register
            DHR12L2: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  DAC channel2 12-bit left-aligned data
                DACC2DHR: u12,
                padding: u16,
            }),
            ///  channel2 8-bit right-aligned data holding register
            DHR8R2: mmio.Mmio(packed struct(u32) {
                ///  DAC channel2 8-bit right-aligned data
                DACC2DHR: u8,
                padding: u24,
            }),
            ///  Dual DAC 12-bit right-aligned data holding register
            DHR12RD: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 12-bit right-aligned data
                DACC1DHR: u12,
                reserved16: u4,
                ///  DAC channel2 12-bit right-aligned data
                DACC2DHR: u12,
                padding: u4,
            }),
            ///  DUAL DAC 12-bit left aligned data holding register
            DHR12LD: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  DAC channel1 12-bit left-aligned data
                DACC1DHR: u12,
                reserved20: u4,
                ///  DAC channel2 12-bit left-aligned data
                DACC2DHR: u12,
            }),
            ///  DUAL DAC 8-bit right aligned data holding register
            DHR8RD: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 8-bit right-aligned data
                DACC1DHR: u8,
                ///  DAC channel2 8-bit right-aligned data
                DACC2DHR: u8,
                padding: u16,
            }),
            ///  channel1 data output register
            DOR1: mmio.Mmio(packed struct(u32) {
                ///  DAC channel1 data output
                DACC1DOR: u12,
                padding: u20,
            }),
            ///  channel2 data output register
            DOR2: mmio.Mmio(packed struct(u32) {
                ///  DAC channel2 data output
                DACC2DOR: u12,
                padding: u20,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                reserved13: u13,
                ///  DAC channel1 DMA underrun flag
                DMAUDR1: u1,
                ///  DAC Channel 1 calibration offset status
                CAL_FLAG1: u1,
                ///  DAC Channel 1 busy writing sample time flag
                BWST1: u1,
                reserved29: u13,
                ///  DAC channel2 DMA underrun flag
                DMAUDR2: u1,
                ///  DAC Channel 2 calibration offset status
                CAL_FLAG2: u1,
                ///  DAC Channel 2 busy writing sample time flag
                BWST2: u1,
            }),
            ///  calibration control register
            CCR: mmio.Mmio(packed struct(u32) {
                ///  DAC Channel 1 offset trimming value
                OTRIM1: u5,
                reserved16: u11,
                ///  DAC Channel 2 offset trimming value
                OTRIM2: u5,
                padding: u11,
            }),
            ///  mode control register
            MCR: mmio.Mmio(packed struct(u32) {
                ///  DAC Channel 1 mode
                MODE1: u3,
                reserved16: u13,
                ///  DAC Channel 2 mode
                MODE2: u3,
                padding: u13,
            }),
            ///  Sample and Hold sample time register 1
            SHSR1: mmio.Mmio(packed struct(u32) {
                ///  DAC Channel 1 sample Time
                TSAMPLE1: u10,
                padding: u22,
            }),
            ///  Sample and Hold sample time register 2
            SHSR2: mmio.Mmio(packed struct(u32) {
                ///  DAC Channel 2 sample Time
                TSAMPLE2: u10,
                padding: u22,
            }),
            ///  Sample and Hold hold time register
            SHHR: mmio.Mmio(packed struct(u32) {
                ///  DAC Channel 1 hold Time
                THOLD1: u10,
                reserved16: u6,
                ///  DAC Channel 2 hold time
                THOLD2: u10,
                padding: u6,
            }),
            ///  Sample and Hold refresh time register
            SHRR: mmio.Mmio(packed struct(u32) {
                ///  DAC Channel 1 refresh Time
                TREFRESH1: u8,
                reserved16: u8,
                ///  DAC Channel 2 refresh Time
                TREFRESH2: u8,
                padding: u8,
            }),
        };

        ///  Direct memory access controller
        pub const DMA1 = extern struct {
            ///  interrupt status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF1: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF1: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF1: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF1: u1,
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF2: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF2: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF2: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF2: u1,
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF3: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF3: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF3: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF3: u1,
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF4: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF4: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF4: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF4: u1,
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF5: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF5: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF5: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF5: u1,
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF6: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF6: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF6: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF6: u1,
                ///  Channel x global interrupt flag (x = 1 ..7)
                GIF7: u1,
                ///  Channel x transfer complete flag (x = 1 ..7)
                TCIF7: u1,
                ///  Channel x half transfer flag (x = 1 ..7)
                HTIF7: u1,
                ///  Channel x transfer error flag (x = 1 ..7)
                TEIF7: u1,
                padding: u4,
            }),
            ///  interrupt flag clear register
            IFCR: mmio.Mmio(packed struct(u32) {
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF1: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF1: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF1: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF1: u1,
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF2: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF2: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF2: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF2: u1,
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF3: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF3: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF3: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF3: u1,
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF4: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF4: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF4: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF4: u1,
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF5: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF5: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF5: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF5: u1,
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF6: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF6: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF6: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF6: u1,
                ///  Channel x global interrupt clear (x = 1 ..7)
                CGIF7: u1,
                ///  Channel x transfer complete clear (x = 1 ..7)
                CTCIF7: u1,
                ///  Channel x half transfer clear (x = 1 ..7)
                CHTIF7: u1,
                ///  Channel x transfer error clear (x = 1 ..7)
                CTEIF7: u1,
                padding: u4,
            }),
            ///  channel x configuration register
            CCR1: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR1: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR1: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR1: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved28: [4]u8,
            ///  channel x configuration register
            CCR2: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR2: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR2: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR2: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved48: [4]u8,
            ///  channel x configuration register
            CCR3: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR3: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR3: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR3: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved68: [4]u8,
            ///  channel x configuration register
            CCR4: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR4: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR4: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR4: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved88: [4]u8,
            ///  channel x configuration register
            CCR5: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR5: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR5: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR5: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved108: [4]u8,
            ///  channel x configuration register
            CCR6: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR6: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR6: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR6: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved128: [4]u8,
            ///  channel x configuration register
            CCR7: mmio.Mmio(packed struct(u32) {
                ///  Channel enable
                EN: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  Half transfer interrupt enable
                HTIE: u1,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Data transfer direction
                DIR: u1,
                ///  Circular mode
                CIRC: u1,
                ///  Peripheral increment mode
                PINC: u1,
                ///  Memory increment mode
                MINC: u1,
                ///  Peripheral size
                PSIZE: u2,
                ///  Memory size
                MSIZE: u2,
                ///  Channel priority level
                PL: u2,
                ///  Memory to memory mode
                MEM2MEM: u1,
                padding: u17,
            }),
            ///  channel x number of data register
            CNDTR7: mmio.Mmio(packed struct(u32) {
                ///  Number of data to transfer
                NDT: u16,
                padding: u16,
            }),
            ///  channel x peripheral address register
            CPAR7: mmio.Mmio(packed struct(u32) {
                ///  Peripheral address
                PA: u32,
            }),
            ///  channel x memory address register
            CMAR7: mmio.Mmio(packed struct(u32) {
                ///  Memory address
                MA: u32,
            }),
            reserved168: [24]u8,
            ///  channel selection register
            CSELR: mmio.Mmio(packed struct(u32) {
                ///  DMA channel 1 selection
                C1S: u4,
                ///  DMA channel 2 selection
                C2S: u4,
                ///  DMA channel 3 selection
                C3S: u4,
                ///  DMA channel 4 selection
                C4S: u4,
                ///  DMA channel 5 selection
                C5S: u4,
                ///  DMA channel 6 selection
                C6S: u4,
                ///  DMA channel 7 selection
                C7S: u4,
                padding: u4,
            }),
        };

        ///  System control block ACTLR
        pub const SCB_ACTRL = extern struct {
            ///  Auxiliary control register
            ACTRL: mmio.Mmio(packed struct(u32) {
                ///  DISMCYCINT
                DISMCYCINT: u1,
                ///  DISDEFWBUF
                DISDEFWBUF: u1,
                ///  DISFOLD
                DISFOLD: u1,
                reserved8: u5,
                ///  DISFPCA
                DISFPCA: u1,
                ///  DISOOFP
                DISOOFP: u1,
                padding: u22,
            }),
        };

        ///  Cyclic redundancy check calculation unit
        pub const CRC = extern struct {
            ///  Data register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Data register bits
                DR: u32,
            }),
            ///  Independent data register
            IDR: mmio.Mmio(packed struct(u32) {
                ///  General-purpose 8-bit data register bits
                IDR: u8,
                padding: u24,
            }),
            ///  Control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  RESET bit
                RESET: u1,
                reserved3: u2,
                ///  Polynomial size
                POLYSIZE: u2,
                ///  Reverse input data
                REV_IN: u2,
                ///  Reverse output data
                REV_OUT: u1,
                padding: u24,
            }),
            reserved16: [4]u8,
            ///  Initial CRC value
            INIT: mmio.Mmio(packed struct(u32) {
                ///  Programmable initial CRC value
                CRC_INIT: u32,
            }),
            ///  polynomial
            POL: mmio.Mmio(packed struct(u32) {
                ///  Programmable polynomial
                Polynomialcoefficients: u32,
            }),
        };

        ///  Liquid crystal display controller
        pub const LCD = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  LCD controller enable
                LCDEN: u1,
                ///  Voltage source selection
                VSEL: u1,
                ///  Duty selection
                DUTY: u3,
                ///  Bias selector
                BIAS: u2,
                ///  Mux segment enable
                MUX_SEG: u1,
                ///  Voltage output buffer enable
                BUFEN: u1,
                padding: u23,
            }),
            ///  frame control register
            FCR: mmio.Mmio(packed struct(u32) {
                ///  High drive enable
                HD: u1,
                ///  Start of frame interrupt enable
                SOFIE: u1,
                reserved3: u1,
                ///  Update display done interrupt enable
                UDDIE: u1,
                ///  Pulse ON duration
                PON: u3,
                ///  Dead time duration
                DEAD: u3,
                ///  Contrast control
                CC: u3,
                ///  Blink frequency selection
                BLINKF: u3,
                ///  Blink mode selection
                BLINK: u2,
                ///  DIV clock divider
                DIV: u4,
                ///  PS 16-bit prescaler
                PS: u4,
                padding: u6,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  ENS
                ENS: u1,
                ///  Start of frame flag
                SOF: u1,
                ///  Update display request
                UDR: u1,
                ///  Update Display Done
                UDD: u1,
                ///  Ready flag
                RDY: u1,
                ///  LCD Frame Control Register Synchronization flag
                FCRSF: u1,
                padding: u26,
            }),
            ///  clear register
            CLR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Start of frame flag clear
                SOFC: u1,
                reserved3: u1,
                ///  Update display done clear
                UDDC: u1,
                padding: u28,
            }),
            reserved20: [4]u8,
            ///  display memory
            RAM_COM0: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                padding: u1,
            }),
            reserved28: [4]u8,
            ///  display memory
            RAM_COM1: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
            reserved36: [4]u8,
            ///  display memory
            RAM_COM2: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
            reserved44: [4]u8,
            ///  display memory
            RAM_COM3: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
            reserved52: [4]u8,
            ///  display memory
            RAM_COM4: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
            reserved60: [4]u8,
            ///  display memory
            RAM_COM5: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
            reserved68: [4]u8,
            ///  display memory
            RAM_COM6: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
            reserved76: [4]u8,
            ///  display memory
            RAM_COM7: mmio.Mmio(packed struct(u32) {
                ///  S00
                S00: u1,
                ///  S01
                S01: u1,
                ///  S02
                S02: u1,
                ///  S03
                S03: u1,
                ///  S04
                S04: u1,
                ///  S05
                S05: u1,
                ///  S06
                S06: u1,
                ///  S07
                S07: u1,
                ///  S08
                S08: u1,
                ///  S09
                S09: u1,
                ///  S10
                S10: u1,
                ///  S11
                S11: u1,
                ///  S12
                S12: u1,
                ///  S13
                S13: u1,
                ///  S14
                S14: u1,
                ///  S15
                S15: u1,
                ///  S16
                S16: u1,
                ///  S17
                S17: u1,
                ///  S18
                S18: u1,
                ///  S19
                S19: u1,
                ///  S20
                S20: u1,
                ///  S21
                S21: u1,
                ///  S22
                S22: u1,
                ///  S23
                S23: u1,
                ///  S24
                S24: u1,
                ///  S25
                S25: u1,
                ///  S26
                S26: u1,
                ///  S27
                S27: u1,
                ///  S28
                S28: u1,
                ///  S29
                S29: u1,
                ///  S30
                S30: u1,
                ///  S31
                S31: u1,
            }),
        };

        ///  Touch sensing controller
        pub const TSC = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Touch sensing controller enable
                TSCE: u1,
                ///  Start a new acquisition
                START: u1,
                ///  Acquisition mode
                AM: u1,
                ///  Synchronization pin polarity
                SYNCPOL: u1,
                ///  I/O Default mode
                IODEF: u1,
                ///  Max count value
                MCV: u3,
                reserved12: u4,
                ///  pulse generator prescaler
                PGPSC: u3,
                ///  Spread spectrum prescaler
                SSPSC: u1,
                ///  Spread spectrum enable
                SSE: u1,
                ///  Spread spectrum deviation
                SSD: u7,
                ///  Charge transfer pulse low
                CTPL: u4,
                ///  Charge transfer pulse high
                CTPH: u4,
            }),
            ///  interrupt enable register
            IER: mmio.Mmio(packed struct(u32) {
                ///  End of acquisition interrupt enable
                EOAIE: u1,
                ///  Max count error interrupt enable
                MCEIE: u1,
                padding: u30,
            }),
            ///  interrupt clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  End of acquisition interrupt clear
                EOAIC: u1,
                ///  Max count error interrupt clear
                MCEIC: u1,
                padding: u30,
            }),
            ///  interrupt status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  End of acquisition flag
                EOAF: u1,
                ///  Max count error flag
                MCEF: u1,
                padding: u30,
            }),
            ///  I/O hysteresis control register
            IOHCR: mmio.Mmio(packed struct(u32) {
                ///  G1_IO1
                G1_IO1: u1,
                ///  G1_IO2
                G1_IO2: u1,
                ///  G1_IO3
                G1_IO3: u1,
                ///  G1_IO4
                G1_IO4: u1,
                ///  G2_IO1
                G2_IO1: u1,
                ///  G2_IO2
                G2_IO2: u1,
                ///  G2_IO3
                G2_IO3: u1,
                ///  G2_IO4
                G2_IO4: u1,
                ///  G3_IO1
                G3_IO1: u1,
                ///  G3_IO2
                G3_IO2: u1,
                ///  G3_IO3
                G3_IO3: u1,
                ///  G3_IO4
                G3_IO4: u1,
                ///  G4_IO1
                G4_IO1: u1,
                ///  G4_IO2
                G4_IO2: u1,
                ///  G4_IO3
                G4_IO3: u1,
                ///  G4_IO4
                G4_IO4: u1,
                ///  G5_IO1
                G5_IO1: u1,
                ///  G5_IO2
                G5_IO2: u1,
                ///  G5_IO3
                G5_IO3: u1,
                ///  G5_IO4
                G5_IO4: u1,
                ///  G6_IO1
                G6_IO1: u1,
                ///  G6_IO2
                G6_IO2: u1,
                ///  G6_IO3
                G6_IO3: u1,
                ///  G6_IO4
                G6_IO4: u1,
                ///  G7_IO1
                G7_IO1: u1,
                ///  G7_IO2
                G7_IO2: u1,
                ///  G7_IO3
                G7_IO3: u1,
                ///  G7_IO4
                G7_IO4: u1,
                ///  G8_IO1
                G8_IO1: u1,
                ///  G8_IO2
                G8_IO2: u1,
                ///  G8_IO3
                G8_IO3: u1,
                ///  G8_IO4
                G8_IO4: u1,
            }),
            reserved24: [4]u8,
            ///  I/O analog switch control register
            IOASCR: mmio.Mmio(packed struct(u32) {
                ///  G1_IO1
                G1_IO1: u1,
                ///  G1_IO2
                G1_IO2: u1,
                ///  G1_IO3
                G1_IO3: u1,
                ///  G1_IO4
                G1_IO4: u1,
                ///  G2_IO1
                G2_IO1: u1,
                ///  G2_IO2
                G2_IO2: u1,
                ///  G2_IO3
                G2_IO3: u1,
                ///  G2_IO4
                G2_IO4: u1,
                ///  G3_IO1
                G3_IO1: u1,
                ///  G3_IO2
                G3_IO2: u1,
                ///  G3_IO3
                G3_IO3: u1,
                ///  G3_IO4
                G3_IO4: u1,
                ///  G4_IO1
                G4_IO1: u1,
                ///  G4_IO2
                G4_IO2: u1,
                ///  G4_IO3
                G4_IO3: u1,
                ///  G4_IO4
                G4_IO4: u1,
                ///  G5_IO1
                G5_IO1: u1,
                ///  G5_IO2
                G5_IO2: u1,
                ///  G5_IO3
                G5_IO3: u1,
                ///  G5_IO4
                G5_IO4: u1,
                ///  G6_IO1
                G6_IO1: u1,
                ///  G6_IO2
                G6_IO2: u1,
                ///  G6_IO3
                G6_IO3: u1,
                ///  G6_IO4
                G6_IO4: u1,
                ///  G7_IO1
                G7_IO1: u1,
                ///  G7_IO2
                G7_IO2: u1,
                ///  G7_IO3
                G7_IO3: u1,
                ///  G7_IO4
                G7_IO4: u1,
                ///  G8_IO1
                G8_IO1: u1,
                ///  G8_IO2
                G8_IO2: u1,
                ///  G8_IO3
                G8_IO3: u1,
                ///  G8_IO4
                G8_IO4: u1,
            }),
            reserved32: [4]u8,
            ///  I/O sampling control register
            IOSCR: mmio.Mmio(packed struct(u32) {
                ///  G1_IO1
                G1_IO1: u1,
                ///  G1_IO2
                G1_IO2: u1,
                ///  G1_IO3
                G1_IO3: u1,
                ///  G1_IO4
                G1_IO4: u1,
                ///  G2_IO1
                G2_IO1: u1,
                ///  G2_IO2
                G2_IO2: u1,
                ///  G2_IO3
                G2_IO3: u1,
                ///  G2_IO4
                G2_IO4: u1,
                ///  G3_IO1
                G3_IO1: u1,
                ///  G3_IO2
                G3_IO2: u1,
                ///  G3_IO3
                G3_IO3: u1,
                ///  G3_IO4
                G3_IO4: u1,
                ///  G4_IO1
                G4_IO1: u1,
                ///  G4_IO2
                G4_IO2: u1,
                ///  G4_IO3
                G4_IO3: u1,
                ///  G4_IO4
                G4_IO4: u1,
                ///  G5_IO1
                G5_IO1: u1,
                ///  G5_IO2
                G5_IO2: u1,
                ///  G5_IO3
                G5_IO3: u1,
                ///  G5_IO4
                G5_IO4: u1,
                ///  G6_IO1
                G6_IO1: u1,
                ///  G6_IO2
                G6_IO2: u1,
                ///  G6_IO3
                G6_IO3: u1,
                ///  G6_IO4
                G6_IO4: u1,
                ///  G7_IO1
                G7_IO1: u1,
                ///  G7_IO2
                G7_IO2: u1,
                ///  G7_IO3
                G7_IO3: u1,
                ///  G7_IO4
                G7_IO4: u1,
                ///  G8_IO1
                G8_IO1: u1,
                ///  G8_IO2
                G8_IO2: u1,
                ///  G8_IO3
                G8_IO3: u1,
                ///  G8_IO4
                G8_IO4: u1,
            }),
            reserved40: [4]u8,
            ///  I/O channel control register
            IOCCR: mmio.Mmio(packed struct(u32) {
                ///  G1_IO1
                G1_IO1: u1,
                ///  G1_IO2
                G1_IO2: u1,
                ///  G1_IO3
                G1_IO3: u1,
                ///  G1_IO4
                G1_IO4: u1,
                ///  G2_IO1
                G2_IO1: u1,
                ///  G2_IO2
                G2_IO2: u1,
                ///  G2_IO3
                G2_IO3: u1,
                ///  G2_IO4
                G2_IO4: u1,
                ///  G3_IO1
                G3_IO1: u1,
                ///  G3_IO2
                G3_IO2: u1,
                ///  G3_IO3
                G3_IO3: u1,
                ///  G3_IO4
                G3_IO4: u1,
                ///  G4_IO1
                G4_IO1: u1,
                ///  G4_IO2
                G4_IO2: u1,
                ///  G4_IO3
                G4_IO3: u1,
                ///  G4_IO4
                G4_IO4: u1,
                ///  G5_IO1
                G5_IO1: u1,
                ///  G5_IO2
                G5_IO2: u1,
                ///  G5_IO3
                G5_IO3: u1,
                ///  G5_IO4
                G5_IO4: u1,
                ///  G6_IO1
                G6_IO1: u1,
                ///  G6_IO2
                G6_IO2: u1,
                ///  G6_IO3
                G6_IO3: u1,
                ///  G6_IO4
                G6_IO4: u1,
                ///  G7_IO1
                G7_IO1: u1,
                ///  G7_IO2
                G7_IO2: u1,
                ///  G7_IO3
                G7_IO3: u1,
                ///  G7_IO4
                G7_IO4: u1,
                ///  G8_IO1
                G8_IO1: u1,
                ///  G8_IO2
                G8_IO2: u1,
                ///  G8_IO3
                G8_IO3: u1,
                ///  G8_IO4
                G8_IO4: u1,
            }),
            reserved48: [4]u8,
            ///  I/O group control status register
            IOGCSR: mmio.Mmio(packed struct(u32) {
                ///  Analog I/O group x enable
                G1E: u1,
                ///  Analog I/O group x enable
                G2E: u1,
                ///  Analog I/O group x enable
                G3E: u1,
                ///  Analog I/O group x enable
                G4E: u1,
                ///  Analog I/O group x enable
                G5E: u1,
                ///  Analog I/O group x enable
                G6E: u1,
                ///  Analog I/O group x enable
                G7E: u1,
                ///  Analog I/O group x enable
                G8E: u1,
                reserved16: u8,
                ///  Analog I/O group x status
                G1S: u1,
                ///  Analog I/O group x status
                G2S: u1,
                ///  Analog I/O group x status
                G3S: u1,
                ///  Analog I/O group x status
                G4S: u1,
                ///  Analog I/O group x status
                G5S: u1,
                ///  Analog I/O group x status
                G6S: u1,
                ///  Analog I/O group x status
                G7S: u1,
                ///  Analog I/O group x status
                G8S: u1,
                padding: u8,
            }),
            ///  I/O group x counter register
            IOG1CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG2CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG3CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG4CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG5CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG6CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG7CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
            ///  I/O group x counter register
            IOG8CR: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u14,
                padding: u18,
            }),
        };

        ///  Independent watchdog
        pub const IWDG = extern struct {
            ///  Key register
            KR: mmio.Mmio(packed struct(u32) {
                ///  Key value (write only, read 0x0000)
                KEY: u16,
                padding: u16,
            }),
            ///  Prescaler register
            PR: mmio.Mmio(packed struct(u32) {
                ///  Prescaler divider
                PR: u3,
                padding: u29,
            }),
            ///  Reload register
            RLR: mmio.Mmio(packed struct(u32) {
                ///  Watchdog counter reload value
                RL: u12,
                padding: u20,
            }),
            ///  Status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Watchdog prescaler value update
                PVU: u1,
                ///  Watchdog counter reload value update
                RVU: u1,
                ///  Watchdog counter window value update
                WVU: u1,
                padding: u29,
            }),
            ///  Window register
            WINR: mmio.Mmio(packed struct(u32) {
                ///  Watchdog counter window value
                WIN: u12,
                padding: u20,
            }),
        };

        ///  System window watchdog
        pub const WWDG = extern struct {
            ///  Control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  7-bit counter (MSB to LSB)
                T: u7,
                ///  Activation bit
                WDGA: u1,
                padding: u24,
            }),
            ///  Configuration register
            CFR: mmio.Mmio(packed struct(u32) {
                ///  7-bit window value
                W: u7,
                ///  Timer base
                WDGTB: u2,
                ///  Early wakeup interrupt
                EWI: u1,
                padding: u22,
            }),
            ///  Status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Early wakeup interrupt flag
                EWIF: u1,
                padding: u31,
            }),
        };

        ///  Comparator
        pub const COMP = extern struct {
            ///  Comparator 1 control and status register
            COMP1_CSR: mmio.Mmio(packed struct(u32) {
                ///  Comparator 1 enable bit
                COMP1_EN: u1,
                reserved2: u1,
                ///  Power Mode of the comparator 1
                COMP1_PWRMODE: u2,
                ///  Comparator 1 Input Minus connection configuration bit
                COMP1_INMSEL: u3,
                ///  Comparator1 input plus selection bit
                COMP1_INPSEL: u1,
                reserved15: u7,
                ///  Comparator 1 polarity selection bit
                COMP1_POLARITY: u1,
                ///  Comparator 1 hysteresis selection bits
                COMP1_HYST: u2,
                ///  Comparator 1 blanking source selection bits
                COMP1_BLANKING: u3,
                reserved22: u1,
                ///  Scaler bridge enable
                COMP1_BRGEN: u1,
                ///  Voltage scaler enable bit
                COMP1_SCALEN: u1,
                reserved30: u6,
                ///  Comparator 1 output status bit
                COMP1_VALUE: u1,
                ///  COMP1_CSR register lock bit
                COMP1_LOCK: u1,
            }),
            ///  Comparator 2 control and status register
            COMP2_CSR: mmio.Mmio(packed struct(u32) {
                ///  Comparator 2 enable bit
                COMP2_EN: u1,
                reserved2: u1,
                ///  Power Mode of the comparator 2
                COMP2_PWRMODE: u2,
                ///  Comparator 2 Input Minus connection configuration bit
                COMP2_INMSEL: u3,
                ///  Comparator 2 Input Plus connection configuration bit
                COMP2_INPSEL: u1,
                reserved9: u1,
                ///  Windows mode selection bit
                COMP2_WINMODE: u1,
                reserved15: u5,
                ///  Comparator 2 polarity selection bit
                COMP2_POLARITY: u1,
                ///  Comparator 2 hysteresis selection bits
                COMP2_HYST: u2,
                ///  Comparator 2 blanking source selection bits
                COMP2_BLANKING: u3,
                reserved22: u1,
                ///  Scaler bridge enable
                COMP2_BRGEN: u1,
                ///  Voltage scaler enable bit
                COMP2_SCALEN: u1,
                reserved30: u6,
                ///  Comparator 2 output status bit
                COMP2_VALUE: u1,
                ///  COMP2_CSR register lock bit
                COMP2_LOCK: u1,
            }),
        };

        ///  Firewall
        pub const FIREWALL = extern struct {
            ///  Code segment start address
            CSSA: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  code segment start address
                ADD: u16,
                padding: u8,
            }),
            ///  Code segment length
            CSL: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  code segment length
                LENG: u14,
                padding: u10,
            }),
            ///  Non-volatile data segment start address
            NVDSSA: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  Non-volatile data segment start address
                ADD: u16,
                padding: u8,
            }),
            ///  Non-volatile data segment length
            NVDSL: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  Non-volatile data segment length
                LENG: u14,
                padding: u10,
            }),
            ///  Volatile data segment start address
            VDSSA: mmio.Mmio(packed struct(u32) {
                reserved6: u6,
                ///  Volatile data segment start address
                ADD: u10,
                padding: u16,
            }),
            ///  Volatile data segment length
            VDSL: mmio.Mmio(packed struct(u32) {
                reserved6: u6,
                ///  Non-volatile data segment length
                LENG: u10,
                padding: u16,
            }),
            reserved32: [8]u8,
            ///  Configuration register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Firewall pre alarm
                FPA: u1,
                ///  Volatile data shared
                VDS: u1,
                ///  Volatile data execution
                VDE: u1,
                padding: u29,
            }),
        };

        ///  Inter-integrated circuit
        pub const I2C1 = extern struct {
            ///  Control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Peripheral enable
                PE: u1,
                ///  TX Interrupt enable
                TXIE: u1,
                ///  RX Interrupt enable
                RXIE: u1,
                ///  Address match interrupt enable (slave only)
                ADDRIE: u1,
                ///  Not acknowledge received interrupt enable
                NACKIE: u1,
                ///  STOP detection Interrupt enable
                STOPIE: u1,
                ///  Transfer Complete interrupt enable
                TCIE: u1,
                ///  Error interrupts enable
                ERRIE: u1,
                ///  Digital noise filter
                DNF: u4,
                ///  Analog noise filter OFF
                ANFOFF: u1,
                reserved14: u1,
                ///  DMA transmission requests enable
                TXDMAEN: u1,
                ///  DMA reception requests enable
                RXDMAEN: u1,
                ///  Slave byte control
                SBC: u1,
                ///  Clock stretching disable
                NOSTRETCH: u1,
                ///  Wakeup from STOP enable
                WUPEN: u1,
                ///  General call enable
                GCEN: u1,
                ///  SMBus Host address enable
                SMBHEN: u1,
                ///  SMBus Device Default address enable
                SMBDEN: u1,
                ///  SMBUS alert enable
                ALERTEN: u1,
                ///  PEC enable
                PECEN: u1,
                padding: u8,
            }),
            ///  Control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Slave address bit (master mode)
                SADD: u10,
                ///  Transfer direction (master mode)
                RD_WRN: u1,
                ///  10-bit addressing mode (master mode)
                ADD10: u1,
                ///  10-bit address header only read direction (master receiver mode)
                HEAD10R: u1,
                ///  Start generation
                START: u1,
                ///  Stop generation (master mode)
                STOP: u1,
                ///  NACK generation (slave mode)
                NACK: u1,
                ///  Number of bytes
                NBYTES: u8,
                ///  NBYTES reload mode
                RELOAD: u1,
                ///  Automatic end mode (master mode)
                AUTOEND: u1,
                ///  Packet error checking byte
                PECBYTE: u1,
                padding: u5,
            }),
            ///  Own address register 1
            OAR1: mmio.Mmio(packed struct(u32) {
                ///  Interface address
                OA1: u10,
                ///  Own Address 1 10-bit mode
                OA1MODE: u1,
                reserved15: u4,
                ///  Own Address 1 enable
                OA1EN: u1,
                padding: u16,
            }),
            ///  Own address register 2
            OAR2: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Interface address
                OA2: u7,
                ///  Own Address 2 masks
                OA2MSK: u3,
                reserved15: u4,
                ///  Own Address 2 enable
                OA2EN: u1,
                padding: u16,
            }),
            ///  Timing register
            TIMINGR: mmio.Mmio(packed struct(u32) {
                ///  SCL low period (master mode)
                SCLL: u8,
                ///  SCL high period (master mode)
                SCLH: u8,
                ///  Data hold time
                SDADEL: u4,
                ///  Data setup time
                SCLDEL: u4,
                reserved28: u4,
                ///  Timing prescaler
                PRESC: u4,
            }),
            ///  Status register 1
            TIMEOUTR: mmio.Mmio(packed struct(u32) {
                ///  Bus timeout A
                TIMEOUTA: u12,
                ///  Idle clock timeout detection
                TIDLE: u1,
                reserved15: u2,
                ///  Clock timeout enable
                TIMOUTEN: u1,
                ///  Bus timeout B
                TIMEOUTB: u12,
                reserved31: u3,
                ///  Extended clock timeout enable
                TEXTEN: u1,
            }),
            ///  Interrupt and Status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  Transmit data register empty (transmitters)
                TXE: u1,
                ///  Transmit interrupt status (transmitters)
                TXIS: u1,
                ///  Receive data register not empty (receivers)
                RXNE: u1,
                ///  Address matched (slave mode)
                ADDR: u1,
                ///  Not acknowledge received flag
                NACKF: u1,
                ///  Stop detection flag
                STOPF: u1,
                ///  Transfer Complete (master mode)
                TC: u1,
                ///  Transfer Complete Reload
                TCR: u1,
                ///  Bus error
                BERR: u1,
                ///  Arbitration lost
                ARLO: u1,
                ///  Overrun/Underrun (slave mode)
                OVR: u1,
                ///  PEC Error in reception
                PECERR: u1,
                ///  Timeout or t_low detection flag
                TIMEOUT: u1,
                ///  SMBus alert
                ALERT: u1,
                reserved15: u1,
                ///  Bus busy
                BUSY: u1,
                ///  Transfer direction (Slave mode)
                DIR: u1,
                ///  Address match code (Slave mode)
                ADDCODE: u7,
                padding: u8,
            }),
            ///  Interrupt clear register
            ICR: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Address Matched flag clear
                ADDRCF: u1,
                ///  Not Acknowledge flag clear
                NACKCF: u1,
                ///  Stop detection flag clear
                STOPCF: u1,
                reserved8: u2,
                ///  Bus error flag clear
                BERRCF: u1,
                ///  Arbitration lost flag clear
                ARLOCF: u1,
                ///  Overrun/Underrun flag clear
                OVRCF: u1,
                ///  PEC Error flag clear
                PECCF: u1,
                ///  Timeout detection flag clear
                TIMOUTCF: u1,
                ///  Alert flag clear
                ALERTCF: u1,
                padding: u18,
            }),
            ///  PEC register
            PECR: mmio.Mmio(packed struct(u32) {
                ///  Packet error checking register
                PEC: u8,
                padding: u24,
            }),
            ///  Receive data register
            RXDR: mmio.Mmio(packed struct(u32) {
                ///  8-bit receive data
                RXDATA: u8,
                padding: u24,
            }),
            ///  Transmit data register
            TXDR: mmio.Mmio(packed struct(u32) {
                ///  8-bit transmit data
                TXDATA: u8,
                padding: u24,
            }),
        };

        ///  Floating point unit CPACR
        pub const FPU_CPACR = extern struct {
            ///  Coprocessor access control register
            CPACR: mmio.Mmio(packed struct(u32) {
                reserved20: u20,
                ///  CP
                CP: u4,
                padding: u8,
            }),
        };

        ///  Nested vectored interrupt controller
        pub const NVIC_STIR = extern struct {
            ///  Software trigger interrupt register
            STIR: mmio.Mmio(packed struct(u32) {
                ///  Software generated interrupt ID
                INTID: u9,
                padding: u23,
            }),
        };

        ///  Flash
        pub const FLASH = extern struct {
            ///  Access control register
            ACR: mmio.Mmio(packed struct(u32) {
                ///  Latency
                LATENCY: u3,
                reserved8: u5,
                ///  Prefetch enable
                PRFTEN: u1,
                ///  Instruction cache enable
                ICEN: u1,
                ///  Data cache enable
                DCEN: u1,
                ///  Instruction cache reset
                ICRST: u1,
                ///  Data cache reset
                DCRST: u1,
                ///  Flash Power-down mode during Low-power run mode
                RUN_PD: u1,
                ///  Flash Power-down mode during Low-power sleep mode
                SLEEP_PD: u1,
                padding: u17,
            }),
            ///  Power down key register
            PDKEYR: mmio.Mmio(packed struct(u32) {
                ///  RUN_PD in FLASH_ACR key
                PDKEYR: u32,
            }),
            ///  Flash key register
            KEYR: mmio.Mmio(packed struct(u32) {
                ///  KEYR
                KEYR: u32,
            }),
            ///  Option byte key register
            OPTKEYR: mmio.Mmio(packed struct(u32) {
                ///  Option byte key
                OPTKEYR: u32,
            }),
            ///  Status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  End of operation
                EOP: u1,
                ///  Operation error
                OPERR: u1,
                reserved3: u1,
                ///  Programming error
                PROGERR: u1,
                ///  Write protected error
                WRPERR: u1,
                ///  Programming alignment error
                PGAERR: u1,
                ///  Size error
                SIZERR: u1,
                ///  Programming sequence error
                PGSERR: u1,
                ///  Fast programming data miss error
                MISERR: u1,
                ///  Fast programming error
                FASTERR: u1,
                reserved14: u4,
                ///  PCROP read error
                RDERR: u1,
                ///  Option validity error
                OPTVERR: u1,
                ///  Busy
                BSY: u1,
                padding: u15,
            }),
            ///  Flash control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Programming
                PG: u1,
                ///  Page erase
                PER: u1,
                ///  Bank 1 Mass erase
                MER1: u1,
                ///  Page number
                PNB: u8,
                ///  Bank erase
                BKER: u1,
                reserved15: u3,
                ///  Bank 2 Mass erase
                MER2: u1,
                ///  Start
                START: u1,
                ///  Options modification start
                OPTSTRT: u1,
                ///  Fast programming
                FSTPG: u1,
                reserved24: u5,
                ///  End of operation interrupt enable
                EOPIE: u1,
                ///  Error interrupt enable
                ERRIE: u1,
                ///  PCROP read error interrupt enable
                RDERRIE: u1,
                ///  Force the option byte loading
                OBL_LAUNCH: u1,
                reserved30: u2,
                ///  Options Lock
                OPTLOCK: u1,
                ///  FLASH_CR Lock
                LOCK: u1,
            }),
            ///  Flash ECC register
            ECCR: mmio.Mmio(packed struct(u32) {
                ///  ECC fail address
                ADDR_ECC: u19,
                ///  ECC fail bank
                BK_ECC: u1,
                ///  System Flash ECC fail
                SYSF_ECC: u1,
                reserved24: u3,
                ///  ECC correction interrupt enable
                ECCIE: u1,
                reserved30: u5,
                ///  ECC correction
                ECCC: u1,
                ///  ECC detection
                ECCD: u1,
            }),
            reserved32: [4]u8,
            ///  Flash option register
            OPTR: mmio.Mmio(packed struct(u32) {
                ///  Read protection level
                RDP: u8,
                ///  BOR reset Level
                BOR_LEV: u3,
                reserved12: u1,
                ///  nRST_STOP
                nRST_STOP: u1,
                ///  nRST_STDBY
                nRST_STDBY: u1,
                reserved16: u2,
                ///  Independent watchdog selection
                IDWG_SW: u1,
                ///  Independent watchdog counter freeze in Stop mode
                IWDG_STOP: u1,
                ///  Independent watchdog counter freeze in Standby mode
                IWDG_STDBY: u1,
                ///  Window watchdog selection
                WWDG_SW: u1,
                ///  Dual-bank boot
                BFB2: u1,
                ///  Dual-Bank on 512 KB or 256 KB Flash memory devices
                DUALBANK: u1,
                reserved23: u1,
                ///  Boot configuration
                nBOOT1: u1,
                ///  SRAM2 parity check enable
                SRAM2_PE: u1,
                ///  SRAM2 Erase when system reset
                SRAM2_RST: u1,
                padding: u6,
            }),
            ///  Flash Bank 1 PCROP Start address register
            PCROP1SR: mmio.Mmio(packed struct(u32) {
                ///  Bank 1 PCROP area start offset
                PCROP1_STRT: u16,
                padding: u16,
            }),
            ///  Flash Bank 1 PCROP End address register
            PCROP1ER: mmio.Mmio(packed struct(u32) {
                ///  Bank 1 PCROP area end offset
                PCROP1_END: u16,
                reserved31: u15,
                ///  PCROP area preserved when RDP level decreased
                PCROP_RDP: u1,
            }),
            ///  Flash Bank 1 WRP area A address register
            WRP1AR: mmio.Mmio(packed struct(u32) {
                ///  Bank 1 WRP first area start offset
                WRP1A_STRT: u8,
                reserved16: u8,
                ///  Bank 1 WRP first area A end offset
                WRP1A_END: u8,
                padding: u8,
            }),
            ///  Flash Bank 1 WRP area B address register
            WRP1BR: mmio.Mmio(packed struct(u32) {
                ///  Bank 1 WRP second area B start offset
                WRP1B_END: u8,
                reserved16: u8,
                ///  Bank 1 WRP second area B end offset
                WRP1B_STRT: u8,
                padding: u8,
            }),
            reserved68: [16]u8,
            ///  Flash Bank 2 PCROP Start address register
            PCROP2SR: mmio.Mmio(packed struct(u32) {
                ///  Bank 2 PCROP area start offset
                PCROP2_STRT: u16,
                padding: u16,
            }),
            ///  Flash Bank 2 PCROP End address register
            PCROP2ER: mmio.Mmio(packed struct(u32) {
                ///  Bank 2 PCROP area end offset
                PCROP2_END: u16,
                padding: u16,
            }),
            ///  Flash Bank 2 WRP area A address register
            WRP2AR: mmio.Mmio(packed struct(u32) {
                ///  Bank 2 WRP first area A start offset
                WRP2A_STRT: u8,
                reserved16: u8,
                ///  Bank 2 WRP first area A end offset
                WRP2A_END: u8,
                padding: u8,
            }),
            ///  Flash Bank 2 WRP area B address register
            WRP2BR: mmio.Mmio(packed struct(u32) {
                ///  Bank 2 WRP second area B start offset
                WRP2B_STRT: u8,
                reserved16: u8,
                ///  Bank 2 WRP second area B end offset
                WRP2B_END: u8,
                padding: u8,
            }),
        };

        ///  Power control
        pub const PWR = extern struct {
            ///  Power control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Low-power mode selection
                LPMS: u3,
                reserved8: u5,
                ///  Disable backup domain write protection
                DBP: u1,
                ///  Voltage scaling range selection
                VOS: u2,
                reserved14: u3,
                ///  Low-power run
                LPR: u1,
                padding: u17,
            }),
            ///  Power control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Power voltage detector enable
                PVDE: u1,
                ///  Power voltage detector level selection
                PLS: u3,
                ///  Peripheral voltage monitoring 1 enable: VDDUSB vs. 1.2V
                PVME1: u1,
                ///  Peripheral voltage monitoring 2 enable: VDDIO2 vs. 0.9V
                PVME2: u1,
                ///  Peripheral voltage monitoring 3 enable: VDDA vs. 1.62V
                PVME3: u1,
                ///  Peripheral voltage monitoring 4 enable: VDDA vs. 2.2V
                PVME4: u1,
                reserved9: u1,
                ///  VDDIO2 Independent I/Os supply valid
                IOSV: u1,
                ///  VDDUSB USB supply valid
                USV: u1,
                padding: u21,
            }),
            ///  Power control register 3
            CR3: mmio.Mmio(packed struct(u32) {
                ///  Enable Wakeup pin WKUP1
                EWUP1: u1,
                ///  Enable Wakeup pin WKUP2
                EWUP2: u1,
                ///  Enable Wakeup pin WKUP3
                EWUP3: u1,
                ///  Enable Wakeup pin WKUP4
                EWUP4: u1,
                ///  Enable Wakeup pin WKUP5
                EWUP5: u1,
                reserved8: u3,
                ///  SRAM2 retention in Standby mode
                RRS: u1,
                reserved10: u1,
                ///  Apply pull-up and pull-down configuration
                APC: u1,
                reserved15: u4,
                ///  Enable internal wakeup line
                EWF: u1,
                padding: u16,
            }),
            ///  Power control register 4
            CR4: mmio.Mmio(packed struct(u32) {
                ///  Wakeup pin WKUP1 polarity
                WP1: u1,
                ///  Wakeup pin WKUP2 polarity
                WP2: u1,
                ///  Wakeup pin WKUP3 polarity
                WP3: u1,
                ///  Wakeup pin WKUP4 polarity
                WP4: u1,
                ///  Wakeup pin WKUP5 polarity
                WP5: u1,
                reserved8: u3,
                ///  VBAT battery charging enable
                VBE: u1,
                ///  VBAT battery charging resistor selection
                VBRS: u1,
                padding: u22,
            }),
            ///  Power status register 1
            SR1: mmio.Mmio(packed struct(u32) {
                ///  Wakeup flag 1
                CWUF1: u1,
                ///  Wakeup flag 2
                CWUF2: u1,
                ///  Wakeup flag 3
                CWUF3: u1,
                ///  Wakeup flag 4
                CWUF4: u1,
                ///  Wakeup flag 5
                CWUF5: u1,
                reserved8: u3,
                ///  Standby flag
                CSBF: u1,
                reserved15: u6,
                ///  Wakeup flag internal
                WUFI: u1,
                padding: u16,
            }),
            ///  Power status register 2
            SR2: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  Low-power regulator started
                REGLPS: u1,
                ///  Low-power regulator flag
                REGLPF: u1,
                ///  Voltage scaling flag
                VOSF: u1,
                ///  Power voltage detector output
                PVDO: u1,
                ///  Peripheral voltage monitoring output: VDDUSB vs. 1.2 V
                PVMO1: u1,
                ///  Peripheral voltage monitoring output: VDDIO2 vs. 0.9 V
                PVMO2: u1,
                ///  Peripheral voltage monitoring output: VDDA vs. 1.62 V
                PVMO3: u1,
                ///  Peripheral voltage monitoring output: VDDA vs. 2.2 V
                PVMO4: u1,
                padding: u16,
            }),
            ///  Power status clear register
            SCR: mmio.Mmio(packed struct(u32) {
                ///  Clear wakeup flag 1
                WUF1: u1,
                ///  Clear wakeup flag 2
                WUF2: u1,
                ///  Clear wakeup flag 3
                WUF3: u1,
                ///  Clear wakeup flag 4
                WUF4: u1,
                ///  Clear wakeup flag 5
                WUF5: u1,
                reserved8: u3,
                ///  Clear standby flag
                SBF: u1,
                padding: u23,
            }),
            reserved32: [4]u8,
            ///  Power Port A pull-up control register
            PUCRA: mmio.Mmio(packed struct(u32) {
                ///  Port A pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port A pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port A pull-down control register
            PDCRA: mmio.Mmio(packed struct(u32) {
                ///  Port A pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port A pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port B pull-up control register
            PUCRB: mmio.Mmio(packed struct(u32) {
                ///  Port B pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port B pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port B pull-down control register
            PDCRB: mmio.Mmio(packed struct(u32) {
                ///  Port B pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port B pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port C pull-up control register
            PUCRC: mmio.Mmio(packed struct(u32) {
                ///  Port C pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port C pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port C pull-down control register
            PDCRC: mmio.Mmio(packed struct(u32) {
                ///  Port C pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port C pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port D pull-up control register
            PUCRD: mmio.Mmio(packed struct(u32) {
                ///  Port D pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port D pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port D pull-down control register
            PDCRD: mmio.Mmio(packed struct(u32) {
                ///  Port D pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port D pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port E pull-up control register
            PUCRE: mmio.Mmio(packed struct(u32) {
                ///  Port E pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port E pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port E pull-down control register
            PDCRE: mmio.Mmio(packed struct(u32) {
                ///  Port E pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port E pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port F pull-up control register
            PUCRF: mmio.Mmio(packed struct(u32) {
                ///  Port F pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port F pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port F pull-down control register
            PDCRF: mmio.Mmio(packed struct(u32) {
                ///  Port F pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port F pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port G pull-up control register
            PUCRG: mmio.Mmio(packed struct(u32) {
                ///  Port G pull-up bit y (y=0..15)
                PU0: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU1: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU2: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU3: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU4: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU5: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU6: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU7: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU8: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU9: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU10: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU11: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU12: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU13: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU14: u1,
                ///  Port G pull-up bit y (y=0..15)
                PU15: u1,
                padding: u16,
            }),
            ///  Power Port G pull-down control register
            PDCRG: mmio.Mmio(packed struct(u32) {
                ///  Port G pull-down bit y (y=0..15)
                PD0: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD1: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD2: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD3: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD4: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD5: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD6: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD7: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD8: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD9: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD10: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD11: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD12: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD13: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD14: u1,
                ///  Port G pull-down bit y (y=0..15)
                PD15: u1,
                padding: u16,
            }),
            ///  Power Port H pull-up control register
            PUCRH: mmio.Mmio(packed struct(u32) {
                ///  Port H pull-up bit y (y=0..1)
                PU0: u1,
                ///  Port H pull-up bit y (y=0..1)
                PU1: u1,
                padding: u30,
            }),
            ///  Power Port H pull-down control register
            PDCRH: mmio.Mmio(packed struct(u32) {
                ///  Port H pull-down bit y (y=0..1)
                PD0: u1,
                ///  Port H pull-down bit y (y=0..1)
                PD1: u1,
                padding: u30,
            }),
        };

        ///  System configuration controller
        pub const SYSCFG = extern struct {
            ///  memory remap register
            MEMRMP: mmio.Mmio(packed struct(u32) {
                ///  Memory mapping selection
                MEM_MODE: u3,
                ///  QUADSPI memory mapping swap
                QFS: u1,
                reserved8: u4,
                ///  Flash Bank mode selection
                FB_MODE: u1,
                padding: u23,
            }),
            ///  configuration register 1
            CFGR1: mmio.Mmio(packed struct(u32) {
                ///  Firewall disable
                FWDIS: u1,
                reserved8: u7,
                ///  I/O analog switch voltage booster enable
                BOOSTEN: u1,
                reserved16: u7,
                ///  Fast-mode Plus (Fm+) driving capability activation on PB6
                I2C_PB6_FMP: u1,
                ///  Fast-mode Plus (Fm+) driving capability activation on PB7
                I2C_PB7_FMP: u1,
                ///  Fast-mode Plus (Fm+) driving capability activation on PB8
                I2C_PB8_FMP: u1,
                ///  Fast-mode Plus (Fm+) driving capability activation on PB9
                I2C_PB9_FMP: u1,
                ///  I2C1 Fast-mode Plus driving capability activation
                I2C1_FMP: u1,
                ///  I2C2 Fast-mode Plus driving capability activation
                I2C2_FMP: u1,
                ///  I2C3 Fast-mode Plus driving capability activation
                I2C3_FMP: u1,
                reserved26: u3,
                ///  Floating Point Unit interrupts enable bits
                FPU_IE: u6,
            }),
            ///  external interrupt configuration register 1
            EXTICR1: mmio.Mmio(packed struct(u32) {
                ///  EXTI 0 configuration bits
                EXTI0: u3,
                reserved4: u1,
                ///  EXTI 1 configuration bits
                EXTI1: u3,
                reserved8: u1,
                ///  EXTI 2 configuration bits
                EXTI2: u3,
                reserved12: u1,
                ///  EXTI 3 configuration bits
                EXTI3: u3,
                padding: u17,
            }),
            ///  external interrupt configuration register 2
            EXTICR2: mmio.Mmio(packed struct(u32) {
                ///  EXTI 4 configuration bits
                EXTI4: u3,
                reserved4: u1,
                ///  EXTI 5 configuration bits
                EXTI5: u3,
                reserved8: u1,
                ///  EXTI 6 configuration bits
                EXTI6: u3,
                reserved12: u1,
                ///  EXTI 7 configuration bits
                EXTI7: u3,
                padding: u17,
            }),
            ///  external interrupt configuration register 3
            EXTICR3: mmio.Mmio(packed struct(u32) {
                ///  EXTI 8 configuration bits
                EXTI8: u3,
                reserved4: u1,
                ///  EXTI 9 configuration bits
                EXTI9: u3,
                reserved8: u1,
                ///  EXTI 10 configuration bits
                EXTI10: u3,
                reserved12: u1,
                ///  EXTI 11 configuration bits
                EXTI11: u3,
                padding: u17,
            }),
            ///  external interrupt configuration register 4
            EXTICR4: mmio.Mmio(packed struct(u32) {
                ///  EXTI12 configuration bits
                EXTI12: u3,
                reserved4: u1,
                ///  EXTI13 configuration bits
                EXTI13: u3,
                reserved8: u1,
                ///  EXTI14 configuration bits
                EXTI14: u3,
                reserved12: u1,
                ///  EXTI15 configuration bits
                EXTI15: u3,
                padding: u17,
            }),
            ///  SCSR
            SCSR: mmio.Mmio(packed struct(u32) {
                ///  SRAM2 Erase
                SRAM2ER: u1,
                ///  SRAM2 busy by erase operation
                SRAM2BSY: u1,
                padding: u30,
            }),
            ///  CFGR2
            CFGR2: mmio.Mmio(packed struct(u32) {
                ///  Cortex LOCKUP (Hardfault) output enable bit
                CLL: u1,
                ///  SRAM2 parity lock bit
                SPL: u1,
                ///  PVD lock enable bit
                PVDL: u1,
                ///  ECC Lock
                ECCL: u1,
                reserved8: u4,
                ///  SRAM2 parity error flag
                SPF: u1,
                padding: u23,
            }),
            ///  SWPR
            SWPR: mmio.Mmio(packed struct(u32) {
                ///  P0WP
                P0WP: u1,
                ///  P1WP
                P1WP: u1,
                ///  P2WP
                P2WP: u1,
                ///  P3WP
                P3WP: u1,
                ///  P4WP
                P4WP: u1,
                ///  P5WP
                P5WP: u1,
                ///  P6WP
                P6WP: u1,
                ///  P7WP
                P7WP: u1,
                ///  P8WP
                P8WP: u1,
                ///  P9WP
                P9WP: u1,
                ///  P10WP
                P10WP: u1,
                ///  P11WP
                P11WP: u1,
                ///  P12WP
                P12WP: u1,
                ///  P13WP
                P13WP: u1,
                ///  P14WP
                P14WP: u1,
                ///  P15WP
                P15WP: u1,
                ///  P16WP
                P16WP: u1,
                ///  P17WP
                P17WP: u1,
                ///  P18WP
                P18WP: u1,
                ///  P19WP
                P19WP: u1,
                ///  P20WP
                P20WP: u1,
                ///  P21WP
                P21WP: u1,
                ///  P22WP
                P22WP: u1,
                ///  P23WP
                P23WP: u1,
                ///  P24WP
                P24WP: u1,
                ///  P25WP
                P25WP: u1,
                ///  P26WP
                P26WP: u1,
                ///  P27WP
                P27WP: u1,
                ///  P28WP
                P28WP: u1,
                ///  P29WP
                P29WP: u1,
                ///  P30WP
                P30WP: u1,
                ///  SRAM2 page 31 write protection
                P31WP: u1,
            }),
            ///  SKR
            SKR: mmio.Mmio(packed struct(u32) {
                ///  SRAM2 write protection key for software erase
                KEY: u8,
                padding: u24,
            }),
        };

        ///  Random number generator
        pub const RNG = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Random number generator enable
                RNGEN: u1,
                ///  Interrupt enable
                IE: u1,
                padding: u28,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Data ready
                DRDY: u1,
                ///  Clock error current status
                CECS: u1,
                ///  Seed error current status
                SECS: u1,
                reserved5: u2,
                ///  Clock error interrupt status
                CEIS: u1,
                ///  Seed error interrupt status
                SEIS: u1,
                padding: u25,
            }),
            ///  data register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Random data
                RNDATA: u32,
            }),
        };

        ///  Advanced encryption standard hardware accelerator
        pub const AES = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  AES enable
                EN: u1,
                ///  Data type selection (for data in and data out to/from the cryptographic block)
                DATATYPE: u2,
                ///  AES operating mode
                MODE: u2,
                ///  AES chaining mode
                CHMOD: u2,
                ///  Computation Complete Flag Clear
                CCFC: u1,
                ///  Error clear
                ERRC: u1,
                ///  CCF flag interrupt enable
                CCFIE: u1,
                ///  Error interrupt enable
                ERRIE: u1,
                ///  Enable DMA management of data input phase
                DMAINEN: u1,
                ///  Enable DMA management of data output phase
                DMAOUTEN: u1,
                padding: u19,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Computation complete flag
                CCF: u1,
                ///  Read error flag
                RDERR: u1,
                ///  Write error flag
                WRERR: u1,
                padding: u29,
            }),
            ///  data input register
            DINR: mmio.Mmio(packed struct(u32) {
                ///  Data Input Register
                AES_DINR: u32,
            }),
            ///  data output register
            DOUTR: mmio.Mmio(packed struct(u32) {
                ///  Data output register
                AES_DOUTR: u32,
            }),
            ///  key register 0
            KEYR0: mmio.Mmio(packed struct(u32) {
                ///  Data Output Register (LSB key [31:0])
                AES_KEYR0: u32,
            }),
            ///  key register 1
            KEYR1: mmio.Mmio(packed struct(u32) {
                ///  AES key register (key [63:32])
                AES_KEYR1: u32,
            }),
            ///  key register 2
            KEYR2: mmio.Mmio(packed struct(u32) {
                ///  AES key register (key [95:64])
                AES_KEYR2: u32,
            }),
            ///  key register 3
            KEYR3: mmio.Mmio(packed struct(u32) {
                ///  AES key register (MSB key [127:96])
                AES_KEYR3: u32,
            }),
            ///  initialization vector register 0
            IVR0: mmio.Mmio(packed struct(u32) {
                ///  initialization vector register (LSB IVR [31:0])
                AES_IVR0: u32,
            }),
            ///  initialization vector register 1
            IVR1: mmio.Mmio(packed struct(u32) {
                ///  Initialization Vector Register (IVR [63:32])
                AES_IVR1: u32,
            }),
            ///  initialization vector register 2
            IVR2: mmio.Mmio(packed struct(u32) {
                ///  Initialization Vector Register (IVR [95:64])
                AES_IVR2: u32,
            }),
            ///  initialization vector register 3
            IVR3: mmio.Mmio(packed struct(u32) {
                ///  Initialization Vector Register (MSB IVR [127:96])
                AES_IVR3: u32,
            }),
        };

        ///  Analog-to-Digital Converter
        pub const ADC1 = extern struct {
            ///  interrupt and status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  ADRDY
                ADRDY: u1,
                ///  EOSMP
                EOSMP: u1,
                ///  EOC
                EOC: u1,
                ///  EOS
                EOS: u1,
                ///  OVR
                OVR: u1,
                ///  JEOC
                JEOC: u1,
                ///  JEOS
                JEOS: u1,
                ///  AWD1
                AWD1: u1,
                ///  AWD2
                AWD2: u1,
                ///  AWD3
                AWD3: u1,
                ///  JQOVF
                JQOVF: u1,
                padding: u21,
            }),
            ///  interrupt enable register
            IER: mmio.Mmio(packed struct(u32) {
                ///  ADRDYIE
                ADRDYIE: u1,
                ///  EOSMPIE
                EOSMPIE: u1,
                ///  EOCIE
                EOCIE: u1,
                ///  EOSIE
                EOSIE: u1,
                ///  OVRIE
                OVRIE: u1,
                ///  JEOCIE
                JEOCIE: u1,
                ///  JEOSIE
                JEOSIE: u1,
                ///  AWD1IE
                AWD1IE: u1,
                ///  AWD2IE
                AWD2IE: u1,
                ///  AWD3IE
                AWD3IE: u1,
                ///  JQOVFIE
                JQOVFIE: u1,
                padding: u21,
            }),
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  ADEN
                ADEN: u1,
                ///  ADDIS
                ADDIS: u1,
                ///  ADSTART
                ADSTART: u1,
                ///  JADSTART
                JADSTART: u1,
                ///  ADSTP
                ADSTP: u1,
                ///  JADSTP
                JADSTP: u1,
                reserved28: u22,
                ///  ADVREGEN
                ADVREGEN: u1,
                ///  DEEPPWD
                DEEPPWD: u1,
                ///  ADCALDIF
                ADCALDIF: u1,
                ///  ADCAL
                ADCAL: u1,
            }),
            ///  configuration register
            CFGR: mmio.Mmio(packed struct(u32) {
                ///  DMAEN
                DMAEN: u1,
                ///  DMACFG
                DMACFG: u1,
                reserved3: u1,
                ///  RES
                RES: u2,
                ///  ALIGN
                ALIGN: u1,
                ///  EXTSEL
                EXTSEL: u4,
                ///  EXTEN
                EXTEN: u2,
                ///  OVRMOD
                OVRMOD: u1,
                ///  CONT
                CONT: u1,
                ///  AUTDLY
                AUTDLY: u1,
                ///  AUTOFF
                AUTOFF: u1,
                ///  DISCEN
                DISCEN: u1,
                ///  DISCNUM
                DISCNUM: u3,
                ///  JDISCEN
                JDISCEN: u1,
                ///  JQM
                JQM: u1,
                ///  AWD1SGL
                AWD1SGL: u1,
                ///  AWD1EN
                AWD1EN: u1,
                ///  JAWD1EN
                JAWD1EN: u1,
                ///  JAUTO
                JAUTO: u1,
                ///  AWDCH1CH
                AWDCH1CH: u5,
                padding: u1,
            }),
            ///  configuration register
            CFGR2: mmio.Mmio(packed struct(u32) {
                ///  DMAEN
                ROVSE: u1,
                ///  DMACFG
                JOVSE: u1,
                ///  RES
                OVSR: u3,
                ///  ALIGN
                OVSS: u4,
                ///  EXTSEL
                TOVS: u1,
                ///  EXTEN
                ROVSM: u1,
                padding: u21,
            }),
            ///  sample time register 1
            SMPR1: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  SMP1
                SMP1: u3,
                ///  SMP2
                SMP2: u3,
                ///  SMP3
                SMP3: u3,
                ///  SMP4
                SMP4: u3,
                ///  SMP5
                SMP5: u3,
                ///  SMP6
                SMP6: u3,
                ///  SMP7
                SMP7: u3,
                ///  SMP8
                SMP8: u3,
                ///  SMP9
                SMP9: u3,
                padding: u2,
            }),
            ///  sample time register 2
            SMPR2: mmio.Mmio(packed struct(u32) {
                ///  SMP10
                SMP10: u3,
                ///  SMP11
                SMP11: u3,
                ///  SMP12
                SMP12: u3,
                ///  SMP13
                SMP13: u3,
                ///  SMP14
                SMP14: u3,
                ///  SMP15
                SMP15: u3,
                ///  SMP16
                SMP16: u3,
                ///  SMP17
                SMP17: u3,
                ///  SMP18
                SMP18: u3,
                padding: u5,
            }),
            reserved32: [4]u8,
            ///  watchdog threshold register 1
            TR1: mmio.Mmio(packed struct(u32) {
                ///  LT1
                LT1: u12,
                reserved16: u4,
                ///  HT1
                HT1: u12,
                padding: u4,
            }),
            ///  watchdog threshold register
            TR2: mmio.Mmio(packed struct(u32) {
                ///  LT2
                LT2: u8,
                reserved16: u8,
                ///  HT2
                HT2: u8,
                padding: u8,
            }),
            ///  watchdog threshold register 3
            TR3: mmio.Mmio(packed struct(u32) {
                ///  LT3
                LT3: u8,
                reserved16: u8,
                ///  HT3
                HT3: u8,
                padding: u8,
            }),
            reserved48: [4]u8,
            ///  regular sequence register 1
            SQR1: mmio.Mmio(packed struct(u32) {
                ///  L3
                L3: u4,
                reserved6: u2,
                ///  SQ1
                SQ1: u5,
                reserved12: u1,
                ///  SQ2
                SQ2: u5,
                reserved18: u1,
                ///  SQ3
                SQ3: u5,
                reserved24: u1,
                ///  SQ4
                SQ4: u5,
                padding: u3,
            }),
            ///  regular sequence register 2
            SQR2: mmio.Mmio(packed struct(u32) {
                ///  SQ5
                SQ5: u5,
                reserved6: u1,
                ///  SQ6
                SQ6: u5,
                reserved12: u1,
                ///  SQ7
                SQ7: u5,
                reserved18: u1,
                ///  SQ8
                SQ8: u5,
                reserved24: u1,
                ///  SQ9
                SQ9: u5,
                padding: u3,
            }),
            ///  regular sequence register 3
            SQR3: mmio.Mmio(packed struct(u32) {
                ///  SQ10
                SQ10: u5,
                reserved6: u1,
                ///  SQ11
                SQ11: u5,
                reserved12: u1,
                ///  SQ12
                SQ12: u5,
                reserved18: u1,
                ///  SQ13
                SQ13: u5,
                reserved24: u1,
                ///  SQ14
                SQ14: u5,
                padding: u3,
            }),
            ///  regular sequence register 4
            SQR4: mmio.Mmio(packed struct(u32) {
                ///  SQ15
                SQ15: u5,
                reserved6: u1,
                ///  SQ16
                SQ16: u5,
                padding: u21,
            }),
            ///  regular Data Register
            DR: mmio.Mmio(packed struct(u32) {
                ///  regularDATA
                regularDATA: u16,
                padding: u16,
            }),
            reserved76: [8]u8,
            ///  injected sequence register
            JSQR: mmio.Mmio(packed struct(u32) {
                ///  JL
                JL: u2,
                ///  JEXTSEL
                JEXTSEL: u4,
                ///  JEXTEN
                JEXTEN: u2,
                ///  JSQ1
                JSQ1: u5,
                reserved14: u1,
                ///  JSQ2
                JSQ2: u5,
                reserved20: u1,
                ///  JSQ3
                JSQ3: u5,
                reserved26: u1,
                ///  JSQ4
                JSQ4: u5,
                padding: u1,
            }),
            reserved96: [16]u8,
            ///  offset register 1
            OFR1: mmio.Mmio(packed struct(u32) {
                ///  OFFSET1
                OFFSET1: u12,
                reserved26: u14,
                ///  OFFSET1_CH
                OFFSET1_CH: u5,
                ///  OFFSET1_EN
                OFFSET1_EN: u1,
            }),
            ///  offset register 2
            OFR2: mmio.Mmio(packed struct(u32) {
                ///  OFFSET2
                OFFSET2: u12,
                reserved26: u14,
                ///  OFFSET2_CH
                OFFSET2_CH: u5,
                ///  OFFSET2_EN
                OFFSET2_EN: u1,
            }),
            ///  offset register 3
            OFR3: mmio.Mmio(packed struct(u32) {
                ///  OFFSET3
                OFFSET3: u12,
                reserved26: u14,
                ///  OFFSET3_CH
                OFFSET3_CH: u5,
                ///  OFFSET3_EN
                OFFSET3_EN: u1,
            }),
            ///  offset register 4
            OFR4: mmio.Mmio(packed struct(u32) {
                ///  OFFSET4
                OFFSET4: u12,
                reserved26: u14,
                ///  OFFSET4_CH
                OFFSET4_CH: u5,
                ///  OFFSET4_EN
                OFFSET4_EN: u1,
            }),
            reserved128: [16]u8,
            ///  injected data register 1
            JDR1: mmio.Mmio(packed struct(u32) {
                ///  JDATA1
                JDATA1: u16,
                padding: u16,
            }),
            ///  injected data register 2
            JDR2: mmio.Mmio(packed struct(u32) {
                ///  JDATA2
                JDATA2: u16,
                padding: u16,
            }),
            ///  injected data register 3
            JDR3: mmio.Mmio(packed struct(u32) {
                ///  JDATA3
                JDATA3: u16,
                padding: u16,
            }),
            ///  injected data register 4
            JDR4: mmio.Mmio(packed struct(u32) {
                ///  JDATA4
                JDATA4: u16,
                padding: u16,
            }),
            reserved160: [16]u8,
            ///  Analog Watchdog 2 Configuration Register
            AWD2CR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  AWD2CH
                AWD2CH: u18,
                padding: u13,
            }),
            ///  Analog Watchdog 3 Configuration Register
            AWD3CR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  AWD3CH
                AWD3CH: u18,
                padding: u13,
            }),
            reserved176: [8]u8,
            ///  Differential Mode Selection Register 2
            DIFSEL: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Differential mode for channels 15 to 1
                DIFSEL_1_15: u15,
                ///  Differential mode for channels 18 to 16
                DIFSEL_16_18: u3,
                padding: u13,
            }),
            ///  Calibration Factors
            CALFACT: mmio.Mmio(packed struct(u32) {
                ///  CALFACT_S
                CALFACT_S: u7,
                reserved16: u9,
                ///  CALFACT_D
                CALFACT_D: u7,
                padding: u9,
            }),
        };

        ///  System control block
        pub const SCB = extern struct {
            ///  CPUID base register
            CPUID: mmio.Mmio(packed struct(u32) {
                ///  Revision number
                Revision: u4,
                ///  Part number of the processor
                PartNo: u12,
                ///  Reads as 0xF
                Constant: u4,
                ///  Variant number
                Variant: u4,
                ///  Implementer code
                Implementer: u8,
            }),
            ///  Interrupt control and state register
            ICSR: mmio.Mmio(packed struct(u32) {
                ///  Active vector
                VECTACTIVE: u9,
                reserved11: u2,
                ///  Return to base level
                RETTOBASE: u1,
                ///  Pending vector
                VECTPENDING: u7,
                reserved22: u3,
                ///  Interrupt pending flag
                ISRPENDING: u1,
                reserved25: u2,
                ///  SysTick exception clear-pending bit
                PENDSTCLR: u1,
                ///  SysTick exception set-pending bit
                PENDSTSET: u1,
                ///  PendSV clear-pending bit
                PENDSVCLR: u1,
                ///  PendSV set-pending bit
                PENDSVSET: u1,
                reserved31: u2,
                ///  NMI set-pending bit.
                NMIPENDSET: u1,
            }),
            ///  Vector table offset register
            VTOR: mmio.Mmio(packed struct(u32) {
                reserved9: u9,
                ///  Vector table base offset field
                TBLOFF: u21,
                padding: u2,
            }),
            ///  Application interrupt and reset control register
            AIRCR: mmio.Mmio(packed struct(u32) {
                ///  VECTRESET
                VECTRESET: u1,
                ///  VECTCLRACTIVE
                VECTCLRACTIVE: u1,
                ///  SYSRESETREQ
                SYSRESETREQ: u1,
                reserved8: u5,
                ///  PRIGROUP
                PRIGROUP: u3,
                reserved15: u4,
                ///  ENDIANESS
                ENDIANESS: u1,
                ///  Register key
                VECTKEYSTAT: u16,
            }),
            ///  System control register
            SCR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  SLEEPONEXIT
                SLEEPONEXIT: u1,
                ///  SLEEPDEEP
                SLEEPDEEP: u1,
                reserved4: u1,
                ///  Send Event on Pending bit
                SEVEONPEND: u1,
                padding: u27,
            }),
            ///  Configuration and control register
            CCR: mmio.Mmio(packed struct(u32) {
                ///  Configures how the processor enters Thread mode
                NONBASETHRDENA: u1,
                ///  USERSETMPEND
                USERSETMPEND: u1,
                reserved3: u1,
                ///  UNALIGN_ TRP
                UNALIGN__TRP: u1,
                ///  DIV_0_TRP
                DIV_0_TRP: u1,
                reserved8: u3,
                ///  BFHFNMIGN
                BFHFNMIGN: u1,
                ///  STKALIGN
                STKALIGN: u1,
                padding: u22,
            }),
            ///  System handler priority registers
            SHPR1: mmio.Mmio(packed struct(u32) {
                ///  Priority of system handler 4
                PRI_4: u8,
                ///  Priority of system handler 5
                PRI_5: u8,
                ///  Priority of system handler 6
                PRI_6: u8,
                padding: u8,
            }),
            ///  System handler priority registers
            SHPR2: mmio.Mmio(packed struct(u32) {
                reserved24: u24,
                ///  Priority of system handler 11
                PRI_11: u8,
            }),
            ///  System handler priority registers
            SHPR3: mmio.Mmio(packed struct(u32) {
                reserved16: u16,
                ///  Priority of system handler 14
                PRI_14: u8,
                ///  Priority of system handler 15
                PRI_15: u8,
            }),
            ///  System handler control and state register
            SHCRS: mmio.Mmio(packed struct(u32) {
                ///  Memory management fault exception active bit
                MEMFAULTACT: u1,
                ///  Bus fault exception active bit
                BUSFAULTACT: u1,
                reserved3: u1,
                ///  Usage fault exception active bit
                USGFAULTACT: u1,
                reserved7: u3,
                ///  SVC call active bit
                SVCALLACT: u1,
                ///  Debug monitor active bit
                MONITORACT: u1,
                reserved10: u1,
                ///  PendSV exception active bit
                PENDSVACT: u1,
                ///  SysTick exception active bit
                SYSTICKACT: u1,
                ///  Usage fault exception pending bit
                USGFAULTPENDED: u1,
                ///  Memory management fault exception pending bit
                MEMFAULTPENDED: u1,
                ///  Bus fault exception pending bit
                BUSFAULTPENDED: u1,
                ///  SVC call pending bit
                SVCALLPENDED: u1,
                ///  Memory management fault enable bit
                MEMFAULTENA: u1,
                ///  Bus fault enable bit
                BUSFAULTENA: u1,
                ///  Usage fault enable bit
                USGFAULTENA: u1,
                padding: u13,
            }),
            ///  Configurable fault status register
            CFSR_UFSR_BFSR_MMFSR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Instruction access violation flag
                IACCVIOL: u1,
                reserved3: u1,
                ///  Memory manager fault on unstacking for a return from exception
                MUNSTKERR: u1,
                ///  Memory manager fault on stacking for exception entry.
                MSTKERR: u1,
                ///  MLSPERR
                MLSPERR: u1,
                reserved7: u1,
                ///  Memory Management Fault Address Register (MMAR) valid flag
                MMARVALID: u1,
                ///  Instruction bus error
                IBUSERR: u1,
                ///  Precise data bus error
                PRECISERR: u1,
                ///  Imprecise data bus error
                IMPRECISERR: u1,
                ///  Bus fault on unstacking for a return from exception
                UNSTKERR: u1,
                ///  Bus fault on stacking for exception entry
                STKERR: u1,
                ///  Bus fault on floating-point lazy state preservation
                LSPERR: u1,
                reserved15: u1,
                ///  Bus Fault Address Register (BFAR) valid flag
                BFARVALID: u1,
                ///  Undefined instruction usage fault
                UNDEFINSTR: u1,
                ///  Invalid state usage fault
                INVSTATE: u1,
                ///  Invalid PC load usage fault
                INVPC: u1,
                ///  No coprocessor usage fault.
                NOCP: u1,
                reserved24: u4,
                ///  Unaligned access usage fault
                UNALIGNED: u1,
                ///  Divide by zero usage fault
                DIVBYZERO: u1,
                padding: u6,
            }),
            ///  Hard fault status register
            HFSR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Vector table hard fault
                VECTTBL: u1,
                reserved30: u28,
                ///  Forced hard fault
                FORCED: u1,
                ///  Reserved for Debug use
                DEBUG_VT: u1,
            }),
            reserved52: [4]u8,
            ///  Memory management fault address register
            MMFAR: mmio.Mmio(packed struct(u32) {
                ///  Memory management fault address
                MMFAR: u32,
            }),
            ///  Bus fault address register
            BFAR: mmio.Mmio(packed struct(u32) {
                ///  Bus fault address
                BFAR: u32,
            }),
            ///  Auxiliary fault status register
            AFSR: mmio.Mmio(packed struct(u32) {
                ///  Implementation defined
                IMPDEF: u32,
            }),
        };

        ///  SysTick timer
        pub const STK = extern struct {
            ///  SysTick control and status register
            CTRL: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                ENABLE: u1,
                ///  SysTick exception request enable
                TICKINT: u1,
                ///  Clock source selection
                CLKSOURCE: u1,
                reserved16: u13,
                ///  COUNTFLAG
                COUNTFLAG: u1,
                padding: u15,
            }),
            ///  SysTick reload value register
            LOAD: mmio.Mmio(packed struct(u32) {
                ///  RELOAD value
                RELOAD: u24,
                padding: u8,
            }),
            ///  SysTick current value register
            VAL: mmio.Mmio(packed struct(u32) {
                ///  Current counter value
                CURRENT: u24,
                padding: u8,
            }),
            ///  SysTick calibration value register
            CALIB: mmio.Mmio(packed struct(u32) {
                ///  Calibration value
                TENMS: u24,
                reserved30: u6,
                ///  SKEW flag: Indicates whether the TENMS value is exact
                SKEW: u1,
                ///  NOREF flag. Reads as zero
                NOREF: u1,
            }),
        };

        ///  General-purpose I/Os
        pub const GPIOA = extern struct {
            ///  GPIO port mode register
            MODER: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                MODER0: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER1: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER2: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER3: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER4: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER5: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER6: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER7: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER8: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER9: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER10: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER11: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER12: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER13: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER14: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER15: u2,
            }),
            ///  GPIO port output type register
            OTYPER: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                OT0: u1,
                ///  Port x configuration bits (y = 0..15)
                OT1: u1,
                ///  Port x configuration bits (y = 0..15)
                OT2: u1,
                ///  Port x configuration bits (y = 0..15)
                OT3: u1,
                ///  Port x configuration bits (y = 0..15)
                OT4: u1,
                ///  Port x configuration bits (y = 0..15)
                OT5: u1,
                ///  Port x configuration bits (y = 0..15)
                OT6: u1,
                ///  Port x configuration bits (y = 0..15)
                OT7: u1,
                ///  Port x configuration bits (y = 0..15)
                OT8: u1,
                ///  Port x configuration bits (y = 0..15)
                OT9: u1,
                ///  Port x configuration bits (y = 0..15)
                OT10: u1,
                ///  Port x configuration bits (y = 0..15)
                OT11: u1,
                ///  Port x configuration bits (y = 0..15)
                OT12: u1,
                ///  Port x configuration bits (y = 0..15)
                OT13: u1,
                ///  Port x configuration bits (y = 0..15)
                OT14: u1,
                ///  Port x configuration bits (y = 0..15)
                OT15: u1,
                padding: u16,
            }),
            ///  GPIO port output speed register
            OSPEEDR: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR0: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR1: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR2: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR3: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR4: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR5: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR6: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR7: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR8: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR9: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR10: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR11: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR12: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR13: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR14: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR15: u2,
            }),
            ///  GPIO port pull-up/pull-down register
            PUPDR: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                PUPDR0: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR1: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR2: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR3: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR4: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR5: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR6: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR7: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR8: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR9: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR10: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR11: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR12: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR13: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR14: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR15: u2,
            }),
            ///  GPIO port input data register
            IDR: mmio.Mmio(packed struct(u32) {
                ///  Port input data (y = 0..15)
                IDR0: u1,
                ///  Port input data (y = 0..15)
                IDR1: u1,
                ///  Port input data (y = 0..15)
                IDR2: u1,
                ///  Port input data (y = 0..15)
                IDR3: u1,
                ///  Port input data (y = 0..15)
                IDR4: u1,
                ///  Port input data (y = 0..15)
                IDR5: u1,
                ///  Port input data (y = 0..15)
                IDR6: u1,
                ///  Port input data (y = 0..15)
                IDR7: u1,
                ///  Port input data (y = 0..15)
                IDR8: u1,
                ///  Port input data (y = 0..15)
                IDR9: u1,
                ///  Port input data (y = 0..15)
                IDR10: u1,
                ///  Port input data (y = 0..15)
                IDR11: u1,
                ///  Port input data (y = 0..15)
                IDR12: u1,
                ///  Port input data (y = 0..15)
                IDR13: u1,
                ///  Port input data (y = 0..15)
                IDR14: u1,
                ///  Port input data (y = 0..15)
                IDR15: u1,
                padding: u16,
            }),
            ///  GPIO port output data register
            ODR: mmio.Mmio(packed struct(u32) {
                ///  Port output data (y = 0..15)
                ODR0: u1,
                ///  Port output data (y = 0..15)
                ODR1: u1,
                ///  Port output data (y = 0..15)
                ODR2: u1,
                ///  Port output data (y = 0..15)
                ODR3: u1,
                ///  Port output data (y = 0..15)
                ODR4: u1,
                ///  Port output data (y = 0..15)
                ODR5: u1,
                ///  Port output data (y = 0..15)
                ODR6: u1,
                ///  Port output data (y = 0..15)
                ODR7: u1,
                ///  Port output data (y = 0..15)
                ODR8: u1,
                ///  Port output data (y = 0..15)
                ODR9: u1,
                ///  Port output data (y = 0..15)
                ODR10: u1,
                ///  Port output data (y = 0..15)
                ODR11: u1,
                ///  Port output data (y = 0..15)
                ODR12: u1,
                ///  Port output data (y = 0..15)
                ODR13: u1,
                ///  Port output data (y = 0..15)
                ODR14: u1,
                ///  Port output data (y = 0..15)
                ODR15: u1,
                padding: u16,
            }),
            ///  GPIO port bit set/reset register
            BSRR: mmio.Mmio(packed struct(u32) {
                ///  Port x set bit y (y= 0..15)
                BS0: u1,
                ///  Port x set bit y (y= 0..15)
                BS1: u1,
                ///  Port x set bit y (y= 0..15)
                BS2: u1,
                ///  Port x set bit y (y= 0..15)
                BS3: u1,
                ///  Port x set bit y (y= 0..15)
                BS4: u1,
                ///  Port x set bit y (y= 0..15)
                BS5: u1,
                ///  Port x set bit y (y= 0..15)
                BS6: u1,
                ///  Port x set bit y (y= 0..15)
                BS7: u1,
                ///  Port x set bit y (y= 0..15)
                BS8: u1,
                ///  Port x set bit y (y= 0..15)
                BS9: u1,
                ///  Port x set bit y (y= 0..15)
                BS10: u1,
                ///  Port x set bit y (y= 0..15)
                BS11: u1,
                ///  Port x set bit y (y= 0..15)
                BS12: u1,
                ///  Port x set bit y (y= 0..15)
                BS13: u1,
                ///  Port x set bit y (y= 0..15)
                BS14: u1,
                ///  Port x set bit y (y= 0..15)
                BS15: u1,
                ///  Port x set bit y (y= 0..15)
                BR0: u1,
                ///  Port x reset bit y (y = 0..15)
                BR1: u1,
                ///  Port x reset bit y (y = 0..15)
                BR2: u1,
                ///  Port x reset bit y (y = 0..15)
                BR3: u1,
                ///  Port x reset bit y (y = 0..15)
                BR4: u1,
                ///  Port x reset bit y (y = 0..15)
                BR5: u1,
                ///  Port x reset bit y (y = 0..15)
                BR6: u1,
                ///  Port x reset bit y (y = 0..15)
                BR7: u1,
                ///  Port x reset bit y (y = 0..15)
                BR8: u1,
                ///  Port x reset bit y (y = 0..15)
                BR9: u1,
                ///  Port x reset bit y (y = 0..15)
                BR10: u1,
                ///  Port x reset bit y (y = 0..15)
                BR11: u1,
                ///  Port x reset bit y (y = 0..15)
                BR12: u1,
                ///  Port x reset bit y (y = 0..15)
                BR13: u1,
                ///  Port x reset bit y (y = 0..15)
                BR14: u1,
                ///  Port x reset bit y (y = 0..15)
                BR15: u1,
            }),
            ///  GPIO port configuration lock register
            LCKR: mmio.Mmio(packed struct(u32) {
                ///  Port x lock bit y (y= 0..15)
                LCK0: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK1: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK2: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK3: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK4: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK5: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK6: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK7: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK8: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK9: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK10: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK11: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK12: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK13: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK14: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK15: u1,
                ///  Port x lock bit y (y= 0..15)
                LCKK: u1,
                padding: u15,
            }),
            ///  GPIO alternate function low register
            AFRL: mmio.Mmio(packed struct(u32) {
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL0: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL1: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL2: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL3: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL4: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL5: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL6: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL7: u4,
            }),
            ///  GPIO alternate function high register
            AFRH: mmio.Mmio(packed struct(u32) {
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH8: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH9: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH10: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH11: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH12: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH13: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH14: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH15: u4,
            }),
        };

        ///  General-purpose I/Os
        pub const GPIOB = extern struct {
            ///  GPIO port mode register
            MODER: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                MODER0: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER1: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER2: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER3: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER4: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER5: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER6: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER7: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER8: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER9: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER10: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER11: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER12: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER13: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER14: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER15: u2,
            }),
            ///  GPIO port output type register
            OTYPER: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                OT0: u1,
                ///  Port x configuration bits (y = 0..15)
                OT1: u1,
                ///  Port x configuration bits (y = 0..15)
                OT2: u1,
                ///  Port x configuration bits (y = 0..15)
                OT3: u1,
                ///  Port x configuration bits (y = 0..15)
                OT4: u1,
                ///  Port x configuration bits (y = 0..15)
                OT5: u1,
                ///  Port x configuration bits (y = 0..15)
                OT6: u1,
                ///  Port x configuration bits (y = 0..15)
                OT7: u1,
                ///  Port x configuration bits (y = 0..15)
                OT8: u1,
                ///  Port x configuration bits (y = 0..15)
                OT9: u1,
                ///  Port x configuration bits (y = 0..15)
                OT10: u1,
                ///  Port x configuration bits (y = 0..15)
                OT11: u1,
                ///  Port x configuration bits (y = 0..15)
                OT12: u1,
                ///  Port x configuration bits (y = 0..15)
                OT13: u1,
                ///  Port x configuration bits (y = 0..15)
                OT14: u1,
                ///  Port x configuration bits (y = 0..15)
                OT15: u1,
                padding: u16,
            }),
            ///  GPIO port output speed register
            OSPEEDR: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR0: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR1: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR2: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR3: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR4: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR5: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR6: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR7: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR8: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR9: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR10: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR11: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR12: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR13: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR14: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR15: u2,
            }),
            ///  GPIO port pull-up/pull-down register
            PUPDR: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                PUPDR0: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR1: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR2: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR3: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR4: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR5: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR6: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR7: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR8: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR9: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR10: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR11: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR12: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR13: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR14: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR15: u2,
            }),
            ///  GPIO port input data register
            IDR: mmio.Mmio(packed struct(u32) {
                ///  Port input data (y = 0..15)
                IDR0: u1,
                ///  Port input data (y = 0..15)
                IDR1: u1,
                ///  Port input data (y = 0..15)
                IDR2: u1,
                ///  Port input data (y = 0..15)
                IDR3: u1,
                ///  Port input data (y = 0..15)
                IDR4: u1,
                ///  Port input data (y = 0..15)
                IDR5: u1,
                ///  Port input data (y = 0..15)
                IDR6: u1,
                ///  Port input data (y = 0..15)
                IDR7: u1,
                ///  Port input data (y = 0..15)
                IDR8: u1,
                ///  Port input data (y = 0..15)
                IDR9: u1,
                ///  Port input data (y = 0..15)
                IDR10: u1,
                ///  Port input data (y = 0..15)
                IDR11: u1,
                ///  Port input data (y = 0..15)
                IDR12: u1,
                ///  Port input data (y = 0..15)
                IDR13: u1,
                ///  Port input data (y = 0..15)
                IDR14: u1,
                ///  Port input data (y = 0..15)
                IDR15: u1,
                padding: u16,
            }),
            ///  GPIO port output data register
            ODR: mmio.Mmio(packed struct(u32) {
                ///  Port output data (y = 0..15)
                ODR0: u1,
                ///  Port output data (y = 0..15)
                ODR1: u1,
                ///  Port output data (y = 0..15)
                ODR2: u1,
                ///  Port output data (y = 0..15)
                ODR3: u1,
                ///  Port output data (y = 0..15)
                ODR4: u1,
                ///  Port output data (y = 0..15)
                ODR5: u1,
                ///  Port output data (y = 0..15)
                ODR6: u1,
                ///  Port output data (y = 0..15)
                ODR7: u1,
                ///  Port output data (y = 0..15)
                ODR8: u1,
                ///  Port output data (y = 0..15)
                ODR9: u1,
                ///  Port output data (y = 0..15)
                ODR10: u1,
                ///  Port output data (y = 0..15)
                ODR11: u1,
                ///  Port output data (y = 0..15)
                ODR12: u1,
                ///  Port output data (y = 0..15)
                ODR13: u1,
                ///  Port output data (y = 0..15)
                ODR14: u1,
                ///  Port output data (y = 0..15)
                ODR15: u1,
                padding: u16,
            }),
            ///  GPIO port bit set/reset register
            BSRR: mmio.Mmio(packed struct(u32) {
                ///  Port x set bit y (y= 0..15)
                BS0: u1,
                ///  Port x set bit y (y= 0..15)
                BS1: u1,
                ///  Port x set bit y (y= 0..15)
                BS2: u1,
                ///  Port x set bit y (y= 0..15)
                BS3: u1,
                ///  Port x set bit y (y= 0..15)
                BS4: u1,
                ///  Port x set bit y (y= 0..15)
                BS5: u1,
                ///  Port x set bit y (y= 0..15)
                BS6: u1,
                ///  Port x set bit y (y= 0..15)
                BS7: u1,
                ///  Port x set bit y (y= 0..15)
                BS8: u1,
                ///  Port x set bit y (y= 0..15)
                BS9: u1,
                ///  Port x set bit y (y= 0..15)
                BS10: u1,
                ///  Port x set bit y (y= 0..15)
                BS11: u1,
                ///  Port x set bit y (y= 0..15)
                BS12: u1,
                ///  Port x set bit y (y= 0..15)
                BS13: u1,
                ///  Port x set bit y (y= 0..15)
                BS14: u1,
                ///  Port x set bit y (y= 0..15)
                BS15: u1,
                ///  Port x set bit y (y= 0..15)
                BR0: u1,
                ///  Port x reset bit y (y = 0..15)
                BR1: u1,
                ///  Port x reset bit y (y = 0..15)
                BR2: u1,
                ///  Port x reset bit y (y = 0..15)
                BR3: u1,
                ///  Port x reset bit y (y = 0..15)
                BR4: u1,
                ///  Port x reset bit y (y = 0..15)
                BR5: u1,
                ///  Port x reset bit y (y = 0..15)
                BR6: u1,
                ///  Port x reset bit y (y = 0..15)
                BR7: u1,
                ///  Port x reset bit y (y = 0..15)
                BR8: u1,
                ///  Port x reset bit y (y = 0..15)
                BR9: u1,
                ///  Port x reset bit y (y = 0..15)
                BR10: u1,
                ///  Port x reset bit y (y = 0..15)
                BR11: u1,
                ///  Port x reset bit y (y = 0..15)
                BR12: u1,
                ///  Port x reset bit y (y = 0..15)
                BR13: u1,
                ///  Port x reset bit y (y = 0..15)
                BR14: u1,
                ///  Port x reset bit y (y = 0..15)
                BR15: u1,
            }),
            ///  GPIO port configuration lock register
            LCKR: mmio.Mmio(packed struct(u32) {
                ///  Port x lock bit y (y= 0..15)
                LCK0: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK1: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK2: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK3: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK4: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK5: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK6: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK7: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK8: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK9: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK10: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK11: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK12: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK13: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK14: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK15: u1,
                ///  Port x lock bit y (y= 0..15)
                LCKK: u1,
                padding: u15,
            }),
            ///  GPIO alternate function low register
            AFRL: mmio.Mmio(packed struct(u32) {
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL0: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL1: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL2: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL3: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL4: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL5: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL6: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL7: u4,
            }),
            ///  GPIO alternate function high register
            AFRH: mmio.Mmio(packed struct(u32) {
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH8: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH9: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH10: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH11: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH12: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH13: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH14: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH15: u4,
            }),
        };

        ///  General-purpose I/Os
        pub const GPIOC = extern struct {
            ///  GPIO port mode register
            MODER: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                MODER0: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER1: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER2: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER3: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER4: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER5: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER6: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER7: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER8: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER9: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER10: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER11: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER12: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER13: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER14: u2,
                ///  Port x configuration bits (y = 0..15)
                MODER15: u2,
            }),
            ///  GPIO port output type register
            OTYPER: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                OT0: u1,
                ///  Port x configuration bits (y = 0..15)
                OT1: u1,
                ///  Port x configuration bits (y = 0..15)
                OT2: u1,
                ///  Port x configuration bits (y = 0..15)
                OT3: u1,
                ///  Port x configuration bits (y = 0..15)
                OT4: u1,
                ///  Port x configuration bits (y = 0..15)
                OT5: u1,
                ///  Port x configuration bits (y = 0..15)
                OT6: u1,
                ///  Port x configuration bits (y = 0..15)
                OT7: u1,
                ///  Port x configuration bits (y = 0..15)
                OT8: u1,
                ///  Port x configuration bits (y = 0..15)
                OT9: u1,
                ///  Port x configuration bits (y = 0..15)
                OT10: u1,
                ///  Port x configuration bits (y = 0..15)
                OT11: u1,
                ///  Port x configuration bits (y = 0..15)
                OT12: u1,
                ///  Port x configuration bits (y = 0..15)
                OT13: u1,
                ///  Port x configuration bits (y = 0..15)
                OT14: u1,
                ///  Port x configuration bits (y = 0..15)
                OT15: u1,
                padding: u16,
            }),
            ///  GPIO port output speed register
            OSPEEDR: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR0: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR1: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR2: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR3: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR4: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR5: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR6: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR7: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR8: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR9: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR10: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR11: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR12: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR13: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR14: u2,
                ///  Port x configuration bits (y = 0..15)
                OSPEEDR15: u2,
            }),
            ///  GPIO port pull-up/pull-down register
            PUPDR: mmio.Mmio(packed struct(u32) {
                ///  Port x configuration bits (y = 0..15)
                PUPDR0: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR1: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR2: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR3: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR4: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR5: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR6: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR7: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR8: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR9: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR10: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR11: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR12: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR13: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR14: u2,
                ///  Port x configuration bits (y = 0..15)
                PUPDR15: u2,
            }),
            ///  GPIO port input data register
            IDR: mmio.Mmio(packed struct(u32) {
                ///  Port input data (y = 0..15)
                IDR0: u1,
                ///  Port input data (y = 0..15)
                IDR1: u1,
                ///  Port input data (y = 0..15)
                IDR2: u1,
                ///  Port input data (y = 0..15)
                IDR3: u1,
                ///  Port input data (y = 0..15)
                IDR4: u1,
                ///  Port input data (y = 0..15)
                IDR5: u1,
                ///  Port input data (y = 0..15)
                IDR6: u1,
                ///  Port input data (y = 0..15)
                IDR7: u1,
                ///  Port input data (y = 0..15)
                IDR8: u1,
                ///  Port input data (y = 0..15)
                IDR9: u1,
                ///  Port input data (y = 0..15)
                IDR10: u1,
                ///  Port input data (y = 0..15)
                IDR11: u1,
                ///  Port input data (y = 0..15)
                IDR12: u1,
                ///  Port input data (y = 0..15)
                IDR13: u1,
                ///  Port input data (y = 0..15)
                IDR14: u1,
                ///  Port input data (y = 0..15)
                IDR15: u1,
                padding: u16,
            }),
            ///  GPIO port output data register
            ODR: mmio.Mmio(packed struct(u32) {
                ///  Port output data (y = 0..15)
                ODR0: u1,
                ///  Port output data (y = 0..15)
                ODR1: u1,
                ///  Port output data (y = 0..15)
                ODR2: u1,
                ///  Port output data (y = 0..15)
                ODR3: u1,
                ///  Port output data (y = 0..15)
                ODR4: u1,
                ///  Port output data (y = 0..15)
                ODR5: u1,
                ///  Port output data (y = 0..15)
                ODR6: u1,
                ///  Port output data (y = 0..15)
                ODR7: u1,
                ///  Port output data (y = 0..15)
                ODR8: u1,
                ///  Port output data (y = 0..15)
                ODR9: u1,
                ///  Port output data (y = 0..15)
                ODR10: u1,
                ///  Port output data (y = 0..15)
                ODR11: u1,
                ///  Port output data (y = 0..15)
                ODR12: u1,
                ///  Port output data (y = 0..15)
                ODR13: u1,
                ///  Port output data (y = 0..15)
                ODR14: u1,
                ///  Port output data (y = 0..15)
                ODR15: u1,
                padding: u16,
            }),
            ///  GPIO port bit set/reset register
            BSRR: mmio.Mmio(packed struct(u32) {
                ///  Port x set bit y (y= 0..15)
                BS0: u1,
                ///  Port x set bit y (y= 0..15)
                BS1: u1,
                ///  Port x set bit y (y= 0..15)
                BS2: u1,
                ///  Port x set bit y (y= 0..15)
                BS3: u1,
                ///  Port x set bit y (y= 0..15)
                BS4: u1,
                ///  Port x set bit y (y= 0..15)
                BS5: u1,
                ///  Port x set bit y (y= 0..15)
                BS6: u1,
                ///  Port x set bit y (y= 0..15)
                BS7: u1,
                ///  Port x set bit y (y= 0..15)
                BS8: u1,
                ///  Port x set bit y (y= 0..15)
                BS9: u1,
                ///  Port x set bit y (y= 0..15)
                BS10: u1,
                ///  Port x set bit y (y= 0..15)
                BS11: u1,
                ///  Port x set bit y (y= 0..15)
                BS12: u1,
                ///  Port x set bit y (y= 0..15)
                BS13: u1,
                ///  Port x set bit y (y= 0..15)
                BS14: u1,
                ///  Port x set bit y (y= 0..15)
                BS15: u1,
                ///  Port x set bit y (y= 0..15)
                BR0: u1,
                ///  Port x reset bit y (y = 0..15)
                BR1: u1,
                ///  Port x reset bit y (y = 0..15)
                BR2: u1,
                ///  Port x reset bit y (y = 0..15)
                BR3: u1,
                ///  Port x reset bit y (y = 0..15)
                BR4: u1,
                ///  Port x reset bit y (y = 0..15)
                BR5: u1,
                ///  Port x reset bit y (y = 0..15)
                BR6: u1,
                ///  Port x reset bit y (y = 0..15)
                BR7: u1,
                ///  Port x reset bit y (y = 0..15)
                BR8: u1,
                ///  Port x reset bit y (y = 0..15)
                BR9: u1,
                ///  Port x reset bit y (y = 0..15)
                BR10: u1,
                ///  Port x reset bit y (y = 0..15)
                BR11: u1,
                ///  Port x reset bit y (y = 0..15)
                BR12: u1,
                ///  Port x reset bit y (y = 0..15)
                BR13: u1,
                ///  Port x reset bit y (y = 0..15)
                BR14: u1,
                ///  Port x reset bit y (y = 0..15)
                BR15: u1,
            }),
            ///  GPIO port configuration lock register
            LCKR: mmio.Mmio(packed struct(u32) {
                ///  Port x lock bit y (y= 0..15)
                LCK0: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK1: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK2: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK3: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK4: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK5: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK6: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK7: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK8: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK9: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK10: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK11: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK12: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK13: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK14: u1,
                ///  Port x lock bit y (y= 0..15)
                LCK15: u1,
                ///  Port x lock bit y (y= 0..15)
                LCKK: u1,
                padding: u15,
            }),
            ///  GPIO alternate function low register
            AFRL: mmio.Mmio(packed struct(u32) {
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL0: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL1: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL2: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL3: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL4: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL5: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL6: u4,
                ///  Alternate function selection for port x bit y (y = 0..7)
                AFRL7: u4,
            }),
            ///  GPIO alternate function high register
            AFRH: mmio.Mmio(packed struct(u32) {
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH8: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH9: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH10: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH11: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH12: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH13: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH14: u4,
                ///  Alternate function selection for port x bit y (y = 8..15)
                AFRH15: u4,
            }),
        };

        ///  Memory protection unit
        pub const MPU = extern struct {
            ///  MPU type register
            MPU_TYPER: mmio.Mmio(packed struct(u32) {
                ///  Separate flag
                SEPARATE: u1,
                reserved8: u7,
                ///  Number of MPU data regions
                DREGION: u8,
                ///  Number of MPU instruction regions
                IREGION: u8,
                padding: u8,
            }),
            ///  MPU control register
            MPU_CTRL: mmio.Mmio(packed struct(u32) {
                ///  Enables the MPU
                ENABLE: u1,
                ///  Enables the operation of MPU during hard fault
                HFNMIENA: u1,
                ///  Enable priviliged software access to default memory map
                PRIVDEFENA: u1,
                padding: u29,
            }),
            ///  MPU region number register
            MPU_RNR: mmio.Mmio(packed struct(u32) {
                ///  MPU region
                REGION: u8,
                padding: u24,
            }),
            ///  MPU region base address register
            MPU_RBAR: mmio.Mmio(packed struct(u32) {
                ///  MPU region field
                REGION: u4,
                ///  MPU region number valid
                VALID: u1,
                ///  Region base address field
                ADDR: u27,
            }),
            ///  MPU region attribute and size register
            MPU_RASR: mmio.Mmio(packed struct(u32) {
                ///  Region enable bit.
                ENABLE: u1,
                ///  Size of the MPU protection region
                SIZE: u5,
                reserved8: u2,
                ///  Subregion disable bits
                SRD: u8,
                ///  memory attribute
                B: u1,
                ///  memory attribute
                C: u1,
                ///  Shareable memory attribute
                S: u1,
                ///  memory attribute
                TEX: u3,
                reserved24: u2,
                ///  Access permission
                AP: u3,
                reserved28: u1,
                ///  Instruction access disable bit
                XN: u1,
                padding: u3,
            }),
        };

        ///  Floting point unit
        pub const FPU = extern struct {
            ///  Floating-point context control register
            FPCCR: mmio.Mmio(packed struct(u32) {
                ///  LSPACT
                LSPACT: u1,
                ///  USER
                USER: u1,
                reserved3: u1,
                ///  THREAD
                THREAD: u1,
                ///  HFRDY
                HFRDY: u1,
                ///  MMRDY
                MMRDY: u1,
                ///  BFRDY
                BFRDY: u1,
                reserved8: u1,
                ///  MONRDY
                MONRDY: u1,
                reserved30: u21,
                ///  LSPEN
                LSPEN: u1,
                ///  ASPEN
                ASPEN: u1,
            }),
            ///  Floating-point context address register
            FPCAR: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Location of unpopulated floating-point
                ADDRESS: u29,
            }),
            ///  Floating-point status control register
            FPSCR: mmio.Mmio(packed struct(u32) {
                ///  Invalid operation cumulative exception bit
                IOC: u1,
                ///  Division by zero cumulative exception bit.
                DZC: u1,
                ///  Overflow cumulative exception bit
                OFC: u1,
                ///  Underflow cumulative exception bit
                UFC: u1,
                ///  Inexact cumulative exception bit
                IXC: u1,
                reserved7: u2,
                ///  Input denormal cumulative exception bit.
                IDC: u1,
                reserved22: u14,
                ///  Rounding Mode control field
                RMode: u2,
                ///  Flush-to-zero mode control bit:
                FZ: u1,
                ///  Default NaN mode control bit
                DN: u1,
                ///  Alternative half-precision control bit
                AHP: u1,
                reserved28: u1,
                ///  Overflow condition code flag
                V: u1,
                ///  Carry condition code flag
                C: u1,
                ///  Zero condition code flag
                Z: u1,
                ///  Negative condition code flag
                N: u1,
            }),
        };

        ///  Debug support
        pub const DBGMCU = extern struct {
            ///  MCU Device ID Code Register
            IDCODE: mmio.Mmio(packed struct(u32) {
                ///  Device Identifier
                DEV_ID: u16,
                ///  Revision Identifier
                REV_ID: u16,
            }),
            ///  Debug MCU Configuration Register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Debug Sleep Mode
                DBG_SLEEP: u1,
                ///  Debug Stop Mode
                DBG_STOP: u1,
                ///  Debug Standby Mode
                DBG_STANDBY: u1,
                reserved5: u2,
                ///  Trace pin assignment control
                TRACE_IOEN: u1,
                ///  Trace pin assignment control
                TRACE_MODE: u2,
                padding: u24,
            }),
            ///  APB Low Freeze Register 1
            APB1_FZR1: mmio.Mmio(packed struct(u32) {
                ///  Debug Timer 2 stopped when Core is halted
                DBG_TIMER2_STOP: u1,
                ///  TIM3 counter stopped when core is halted
                DBG_TIM3_STOP: u1,
                ///  TIM4 counter stopped when core is halted
                DBG_TIM4_STOP: u1,
                ///  TIM5 counter stopped when core is halted
                DBG_TIM5_STOP: u1,
                ///  Debug Timer 6 stopped when Core is halted
                DBG_TIMER6_STOP: u1,
                ///  TIM7 counter stopped when core is halted
                DBG_TIM7_STOP: u1,
                reserved10: u4,
                ///  Debug RTC stopped when Core is halted
                DBG_RTC_STOP: u1,
                ///  Debug Window Wachdog stopped when Core is halted
                DBG_WWDG_STOP: u1,
                ///  Debug Independent Wachdog stopped when Core is halted
                DBG_IWDG_STOP: u1,
                reserved21: u8,
                ///  I2C1 SMBUS timeout mode stopped when core is halted
                DBG_I2C1_STOP: u1,
                ///  I2C2 SMBUS timeout mode stopped when core is halted
                DBG_I2C2_STOP: u1,
                ///  I2C3 SMBUS timeout counter stopped when core is halted
                DBG_I2C3_STOP: u1,
                reserved25: u1,
                ///  bxCAN stopped when core is halted
                DBG_CAN_STOP: u1,
                reserved31: u5,
                ///  LPTIM1 counter stopped when core is halted
                DBG_LPTIMER_STOP: u1,
            }),
            ///  APB Low Freeze Register 2
            APB1_FZR2: mmio.Mmio(packed struct(u32) {
                reserved5: u5,
                ///  LPTIM2 counter stopped when core is halted
                DBG_LPTIM2_STOP: u1,
                padding: u26,
            }),
            ///  APB High Freeze Register
            APB2_FZR: mmio.Mmio(packed struct(u32) {
                reserved11: u11,
                ///  TIM1 counter stopped when core is halted
                DBG_TIM1_STOP: u1,
                reserved13: u1,
                ///  TIM8 counter stopped when core is halted
                DBG_TIM8_STOP: u1,
                reserved16: u2,
                ///  TIM15 counter stopped when core is halted
                DBG_TIM15_STOP: u1,
                ///  TIM16 counter stopped when core is halted
                DBG_TIM16_STOP: u1,
                ///  TIM17 counter stopped when core is halted
                DBG_TIM17_STOP: u1,
                padding: u13,
            }),
        };

        ///  Analog-to-Digital Converter
        pub const ADC123_Common = extern struct {
            ///  ADC Common status register
            CSR: mmio.Mmio(packed struct(u32) {
                ///  ADDRDY_MST
                ADDRDY_MST: u1,
                ///  EOSMP_MST
                EOSMP_MST: u1,
                ///  EOC_MST
                EOC_MST: u1,
                ///  EOS_MST
                EOS_MST: u1,
                ///  OVR_MST
                OVR_MST: u1,
                ///  JEOC_MST
                JEOC_MST: u1,
                ///  JEOS_MST
                JEOS_MST: u1,
                ///  AWD1_MST
                AWD1_MST: u1,
                ///  AWD2_MST
                AWD2_MST: u1,
                ///  AWD3_MST
                AWD3_MST: u1,
                ///  JQOVF_MST
                JQOVF_MST: u1,
                reserved16: u5,
                ///  ADRDY_SLV
                ADRDY_SLV: u1,
                ///  EOSMP_SLV
                EOSMP_SLV: u1,
                ///  End of regular conversion of the slave ADC
                EOC_SLV: u1,
                ///  End of regular sequence flag of the slave ADC
                EOS_SLV: u1,
                ///  Overrun flag of the slave ADC
                OVR_SLV: u1,
                ///  End of injected conversion flag of the slave ADC
                JEOC_SLV: u1,
                ///  End of injected sequence flag of the slave ADC
                JEOS_SLV: u1,
                ///  Analog watchdog 1 flag of the slave ADC
                AWD1_SLV: u1,
                ///  Analog watchdog 2 flag of the slave ADC
                AWD2_SLV: u1,
                ///  Analog watchdog 3 flag of the slave ADC
                AWD3_SLV: u1,
                ///  Injected Context Queue Overflow flag of the slave ADC
                JQOVF_SLV: u1,
                padding: u5,
            }),
            reserved8: [4]u8,
            ///  ADC common control register
            CCR: mmio.Mmio(packed struct(u32) {
                ///  Multi ADC mode selection
                MULT: u5,
                reserved8: u3,
                ///  Delay between 2 sampling phases
                DELAY: u4,
                reserved13: u1,
                ///  DMA configuration (for multi-ADC mode)
                DMACFG: u1,
                ///  Direct memory access mode for multi ADC mode
                MDMA: u2,
                ///  ADC clock mode
                CKMODE: u2,
                reserved22: u4,
                ///  VREFINT enable
                VREFEN: u1,
                ///  Temperature sensor enable
                TSEN: u1,
                ///  VBAT enable
                VBATEN: u1,
                padding: u7,
            }),
            ///  ADC common regular data register for dual and triple modes
            CDR: mmio.Mmio(packed struct(u32) {
                ///  Regular data of the master ADC
                RDATA_MST: u16,
                ///  Regular data of the slave ADC
                RDATA_SLV: u16,
            }),
        };

        ///  Reset and clock control
        pub const RCC = extern struct {
            ///  Clock control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  MSI clock enable
                MSION: u1,
                ///  MSI clock ready flag
                MSIRDY: u1,
                ///  MSI clock PLL enable
                MSIPLLEN: u1,
                ///  MSI clock range selection
                MSIRGSEL: u1,
                ///  MSI clock ranges
                MSIRANGE: u4,
                ///  HSI clock enable
                HSION: u1,
                ///  HSI always enable for peripheral kernels
                HSIKERON: u1,
                ///  HSI clock ready flag
                HSIRDY: u1,
                ///  HSI automatic start from Stop
                HSIASFS: u1,
                reserved16: u4,
                ///  HSE clock enable
                HSEON: u1,
                ///  HSE clock ready flag
                HSERDY: u1,
                ///  HSE crystal oscillator bypass
                HSEBYP: u1,
                ///  Clock security system enable
                CSSON: u1,
                reserved24: u4,
                ///  Main PLL enable
                PLLON: u1,
                ///  Main PLL clock ready flag
                PLLRDY: u1,
                ///  SAI1 PLL enable
                PLLSAI1ON: u1,
                ///  SAI1 PLL clock ready flag
                PLLSAI1RDY: u1,
                ///  SAI2 PLL enable
                PLLSAI2ON: u1,
                ///  SAI2 PLL clock ready flag
                PLLSAI2RDY: u1,
                padding: u2,
            }),
            ///  Internal clock sources calibration register
            ICSCR: mmio.Mmio(packed struct(u32) {
                ///  MSI clock calibration
                MSICAL: u8,
                ///  MSI clock trimming
                MSITRIM: u8,
                ///  HSI clock calibration
                HSICAL: u8,
                ///  HSI clock trimming
                HSITRIM: u5,
                padding: u3,
            }),
            ///  Clock configuration register
            CFGR: mmio.Mmio(packed struct(u32) {
                ///  System clock switch
                SW: u2,
                ///  System clock switch status
                SWS: u2,
                ///  AHB prescaler
                HPRE: u4,
                ///  PB low-speed prescaler (APB1)
                PPRE1: u3,
                ///  APB high-speed prescaler (APB2)
                PPRE2: u3,
                reserved15: u1,
                ///  Wakeup from Stop and CSS backup clock selection
                STOPWUCK: u1,
                reserved24: u8,
                ///  Microcontroller clock output
                MCOSEL: u3,
                reserved28: u1,
                ///  Microcontroller clock output prescaler
                MCOPRE: u3,
                padding: u1,
            }),
            ///  PLL configuration register
            PLLCFGR: mmio.Mmio(packed struct(u32) {
                ///  Main PLL, PLLSAI1 and PLLSAI2 entry clock source
                PLLSRC: u2,
                reserved4: u2,
                ///  Division factor for the main PLL and audio PLL (PLLSAI1 and PLLSAI2) input clock
                PLLM: u3,
                reserved8: u1,
                ///  Main PLL multiplication factor for VCO
                PLLN: u7,
                reserved16: u1,
                ///  Main PLL PLLSAI3CLK output enable
                PLLPEN: u1,
                ///  Main PLL division factor for PLLSAI3CLK (SAI1 and SAI2 clock)
                PLLP: u1,
                reserved20: u2,
                ///  Main PLL PLLUSB1CLK output enable
                PLLQEN: u1,
                ///  Main PLL division factor for PLLUSB1CLK(48 MHz clock)
                PLLQ: u2,
                reserved24: u1,
                ///  Main PLL PLLCLK output enable
                PLLREN: u1,
                ///  Main PLL division factor for PLLCLK (system clock)
                PLLR: u2,
                padding: u5,
            }),
            ///  PLLSAI1 configuration register
            PLLSAI1CFGR: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  SAI1PLL multiplication factor for VCO
                PLLSAI1N: u7,
                reserved16: u1,
                ///  SAI1PLL PLLSAI1CLK output enable
                PLLSAI1PEN: u1,
                ///  SAI1PLL division factor for PLLSAI1CLK (SAI1 or SAI2 clock)
                PLLSAI1P: u1,
                reserved20: u2,
                ///  SAI1PLL PLLUSB2CLK output enable
                PLLSAI1QEN: u1,
                ///  SAI1PLL division factor for PLLUSB2CLK (48 MHz clock)
                PLLSAI1Q: u2,
                reserved24: u1,
                ///  PLLSAI1 PLLADC1CLK output enable
                PLLSAI1REN: u1,
                ///  PLLSAI1 division factor for PLLADC1CLK (ADC clock)
                PLLSAI1R: u2,
                padding: u5,
            }),
            ///  PLLSAI2 configuration register
            PLLSAI2CFGR: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  SAI2PLL multiplication factor for VCO
                PLLSAI2N: u7,
                reserved16: u1,
                ///  SAI2PLL PLLSAI2CLK output enable
                PLLSAI2PEN: u1,
                ///  SAI1PLL division factor for PLLSAI2CLK (SAI1 or SAI2 clock)
                PLLSAI2P: u1,
                reserved24: u6,
                ///  PLLSAI2 PLLADC2CLK output enable
                PLLSAI2REN: u1,
                ///  PLLSAI2 division factor for PLLADC2CLK (ADC clock)
                PLLSAI2R: u2,
                padding: u5,
            }),
            ///  Clock interrupt enable register
            CIER: mmio.Mmio(packed struct(u32) {
                ///  LSI ready interrupt enable
                LSIRDYIE: u1,
                ///  LSE ready interrupt enable
                LSERDYIE: u1,
                ///  MSI ready interrupt enable
                MSIRDYIE: u1,
                ///  HSI ready interrupt enable
                HSIRDYIE: u1,
                ///  HSE ready interrupt enable
                HSERDYIE: u1,
                ///  PLL ready interrupt enable
                PLLRDYIE: u1,
                ///  PLLSAI1 ready interrupt enable
                PLLSAI1RDYIE: u1,
                ///  PLLSAI2 ready interrupt enable
                PLLSAI2RDYIE: u1,
                reserved9: u1,
                ///  LSE clock security system interrupt enable
                LSECSSIE: u1,
                padding: u22,
            }),
            ///  Clock interrupt flag register
            CIFR: mmio.Mmio(packed struct(u32) {
                ///  LSI ready interrupt flag
                LSIRDYF: u1,
                ///  LSE ready interrupt flag
                LSERDYF: u1,
                ///  MSI ready interrupt flag
                MSIRDYF: u1,
                ///  HSI ready interrupt flag
                HSIRDYF: u1,
                ///  HSE ready interrupt flag
                HSERDYF: u1,
                ///  PLL ready interrupt flag
                PLLRDYF: u1,
                ///  PLLSAI1 ready interrupt flag
                PLLSAI1RDYF: u1,
                ///  PLLSAI2 ready interrupt flag
                PLLSAI2RDYF: u1,
                ///  Clock security system interrupt flag
                CSSF: u1,
                ///  LSE Clock security system interrupt flag
                LSECSSF: u1,
                padding: u22,
            }),
            ///  Clock interrupt clear register
            CICR: mmio.Mmio(packed struct(u32) {
                ///  LSI ready interrupt clear
                LSIRDYC: u1,
                ///  LSE ready interrupt clear
                LSERDYC: u1,
                ///  MSI ready interrupt clear
                MSIRDYC: u1,
                ///  HSI ready interrupt clear
                HSIRDYC: u1,
                ///  HSE ready interrupt clear
                HSERDYC: u1,
                ///  PLL ready interrupt clear
                PLLRDYC: u1,
                ///  PLLSAI1 ready interrupt clear
                PLLSAI1RDYC: u1,
                ///  PLLSAI2 ready interrupt clear
                PLLSAI2RDYC: u1,
                ///  Clock security system interrupt clear
                CSSC: u1,
                ///  LSE Clock security system interrupt clear
                LSECSSC: u1,
                padding: u22,
            }),
            reserved40: [4]u8,
            ///  AHB1 peripheral reset register
            AHB1RSTR: mmio.Mmio(packed struct(u32) {
                ///  DMA1 reset
                DMA1RST: u1,
                ///  DMA2 reset
                DMA2RST: u1,
                reserved8: u6,
                ///  Flash memory interface reset
                FLASHRST: u1,
                reserved11: u2,
                ///  CRC reset
                CRCRST: u1,
                reserved16: u4,
                ///  Touch Sensing Controller reset
                TSCRST: u1,
                padding: u15,
            }),
            ///  AHB2 peripheral reset register
            AHB2RSTR: mmio.Mmio(packed struct(u32) {
                ///  IO port A reset
                GPIOARST: u1,
                ///  IO port B reset
                GPIOBRST: u1,
                ///  IO port C reset
                GPIOCRST: u1,
                ///  IO port D reset
                GPIODRST: u1,
                ///  IO port E reset
                GPIOERST: u1,
                ///  IO port F reset
                GPIOFRST: u1,
                ///  IO port G reset
                GPIOGRST: u1,
                ///  IO port H reset
                GPIOHRST: u1,
                reserved12: u4,
                ///  USB OTG FS reset
                OTGFSRST: u1,
                ///  ADC reset
                ADCRST: u1,
                reserved16: u2,
                ///  AES hardware accelerator reset
                AESRST: u1,
                reserved18: u1,
                ///  Random number generator reset
                RNGRST: u1,
                padding: u13,
            }),
            ///  AHB3 peripheral reset register
            AHB3RSTR: mmio.Mmio(packed struct(u32) {
                ///  Flexible memory controller reset
                FMCRST: u1,
                reserved8: u7,
                ///  Quad SPI memory interface reset
                QSPIRST: u1,
                padding: u23,
            }),
            reserved56: [4]u8,
            ///  APB1 peripheral reset register 1
            APB1RSTR1: mmio.Mmio(packed struct(u32) {
                ///  TIM2 timer reset
                TIM2RST: u1,
                ///  TIM3 timer reset
                TIM3RST: u1,
                ///  TIM3 timer reset
                TIM4RST: u1,
                ///  TIM5 timer reset
                TIM5RST: u1,
                ///  TIM6 timer reset
                TIM6RST: u1,
                ///  TIM7 timer reset
                TIM7RST: u1,
                reserved9: u3,
                ///  LCD interface reset
                LCDRST: u1,
                reserved14: u4,
                ///  SPI2 reset
                SPI2RST: u1,
                ///  SPI3 reset
                SPI3RST: u1,
                reserved17: u1,
                ///  USART2 reset
                USART2RST: u1,
                ///  USART3 reset
                USART3RST: u1,
                ///  UART4 reset
                UART4RST: u1,
                ///  UART5 reset
                UART5RST: u1,
                ///  I2C1 reset
                I2C1RST: u1,
                ///  I2C2 reset
                I2C2RST: u1,
                ///  I2C3 reset
                I2C3RST: u1,
                reserved25: u1,
                ///  CAN1 reset
                CAN1RST: u1,
                reserved28: u2,
                ///  Power interface reset
                PWRRST: u1,
                ///  DAC1 interface reset
                DAC1RST: u1,
                ///  OPAMP interface reset
                OPAMPRST: u1,
                ///  Low Power Timer 1 reset
                LPTIM1RST: u1,
            }),
            ///  APB1 peripheral reset register 2
            APB1RSTR2: mmio.Mmio(packed struct(u32) {
                ///  Low-power UART 1 reset
                LPUART1RST: u1,
                reserved2: u1,
                ///  Single wire protocol reset
                SWPMI1RST: u1,
                reserved5: u2,
                ///  Low-power timer 2 reset
                LPTIM2RST: u1,
                padding: u26,
            }),
            ///  APB2 peripheral reset register
            APB2RSTR: mmio.Mmio(packed struct(u32) {
                ///  System configuration (SYSCFG) reset
                SYSCFGRST: u1,
                reserved10: u9,
                ///  SDMMC reset
                SDMMCRST: u1,
                ///  TIM1 timer reset
                TIM1RST: u1,
                ///  SPI1 reset
                SPI1RST: u1,
                ///  TIM8 timer reset
                TIM8RST: u1,
                ///  USART1 reset
                USART1RST: u1,
                reserved16: u1,
                ///  TIM15 timer reset
                TIM15RST: u1,
                ///  TIM16 timer reset
                TIM16RST: u1,
                ///  TIM17 timer reset
                TIM17RST: u1,
                reserved21: u2,
                ///  Serial audio interface 1 (SAI1) reset
                SAI1RST: u1,
                ///  Serial audio interface 2 (SAI2) reset
                SAI2RST: u1,
                reserved24: u1,
                ///  Digital filters for sigma-delata modulators (DFSDM) reset
                DFSDMRST: u1,
                padding: u7,
            }),
            reserved72: [4]u8,
            ///  AHB1 peripheral clock enable register
            AHB1ENR: mmio.Mmio(packed struct(u32) {
                ///  DMA1 clock enable
                DMA1EN: u1,
                ///  DMA2 clock enable
                DMA2EN: u1,
                reserved8: u6,
                ///  Flash memory interface clock enable
                FLASHEN: u1,
                reserved11: u2,
                ///  CRC clock enable
                CRCEN: u1,
                reserved16: u4,
                ///  Touch Sensing Controller clock enable
                TSCEN: u1,
                padding: u15,
            }),
            ///  AHB2 peripheral clock enable register
            AHB2ENR: mmio.Mmio(packed struct(u32) {
                ///  IO port A clock enable
                GPIOAEN: u1,
                ///  IO port B clock enable
                GPIOBEN: u1,
                ///  IO port C clock enable
                GPIOCEN: u1,
                ///  IO port D clock enable
                GPIODEN: u1,
                ///  IO port E clock enable
                GPIOEEN: u1,
                ///  IO port F clock enable
                GPIOFEN: u1,
                ///  IO port G clock enable
                GPIOGEN: u1,
                ///  IO port H clock enable
                GPIOHEN: u1,
                reserved12: u4,
                ///  OTG full speed clock enable
                OTGFSEN: u1,
                ///  ADC clock enable
                ADCEN: u1,
                reserved16: u2,
                ///  AES accelerator clock enable
                AESEN: u1,
                reserved18: u1,
                ///  Random Number Generator clock enable
                RNGEN: u1,
                padding: u13,
            }),
            ///  AHB3 peripheral clock enable register
            AHB3ENR: mmio.Mmio(packed struct(u32) {
                ///  Flexible memory controller clock enable
                FMCEN: u1,
                reserved8: u7,
                ///  QSPIEN
                QSPIEN: u1,
                padding: u23,
            }),
            reserved88: [4]u8,
            ///  APB1ENR1
            APB1ENR1: mmio.Mmio(packed struct(u32) {
                ///  TIM2 timer clock enable
                TIM2EN: u1,
                ///  TIM3 timer clock enable
                TIM3EN: u1,
                ///  TIM4 timer clock enable
                TIM4EN: u1,
                ///  TIM5 timer clock enable
                TIM5EN: u1,
                ///  TIM6 timer clock enable
                TIM6EN: u1,
                ///  TIM7 timer clock enable
                TIM7EN: u1,
                reserved9: u3,
                ///  LCD clock enable
                LCDEN: u1,
                reserved11: u1,
                ///  Window watchdog clock enable
                WWDGEN: u1,
                reserved14: u2,
                ///  SPI2 clock enable
                SPI2EN: u1,
                ///  SPI3 clock enable
                SP3EN: u1,
                reserved17: u1,
                ///  USART2 clock enable
                USART2EN: u1,
                ///  USART3 clock enable
                USART3EN: u1,
                ///  UART4 clock enable
                UART4EN: u1,
                ///  UART5 clock enable
                UART5EN: u1,
                ///  I2C1 clock enable
                I2C1EN: u1,
                ///  I2C2 clock enable
                I2C2EN: u1,
                ///  I2C3 clock enable
                I2C3EN: u1,
                reserved25: u1,
                ///  CAN1 clock enable
                CAN1EN: u1,
                reserved28: u2,
                ///  Power interface clock enable
                PWREN: u1,
                ///  DAC1 interface clock enable
                DAC1EN: u1,
                ///  OPAMP interface clock enable
                OPAMPEN: u1,
                ///  Low power timer 1 clock enable
                LPTIM1EN: u1,
            }),
            ///  APB1 peripheral clock enable register 2
            APB1ENR2: mmio.Mmio(packed struct(u32) {
                ///  Low power UART 1 clock enable
                LPUART1EN: u1,
                reserved2: u1,
                ///  Single wire protocol clock enable
                SWPMI1EN: u1,
                reserved5: u2,
                ///  LPTIM2EN
                LPTIM2EN: u1,
                padding: u26,
            }),
            ///  APB2ENR
            APB2ENR: mmio.Mmio(packed struct(u32) {
                ///  SYSCFG clock enable
                SYSCFGEN: u1,
                reserved7: u6,
                ///  Firewall clock enable
                FIREWALLEN: u1,
                reserved10: u2,
                ///  SDMMC clock enable
                SDMMCEN: u1,
                ///  TIM1 timer clock enable
                TIM1EN: u1,
                ///  SPI1 clock enable
                SPI1EN: u1,
                ///  TIM8 timer clock enable
                TIM8EN: u1,
                ///  USART1clock enable
                USART1EN: u1,
                reserved16: u1,
                ///  TIM15 timer clock enable
                TIM15EN: u1,
                ///  TIM16 timer clock enable
                TIM16EN: u1,
                ///  TIM17 timer clock enable
                TIM17EN: u1,
                reserved21: u2,
                ///  SAI1 clock enable
                SAI1EN: u1,
                ///  SAI2 clock enable
                SAI2EN: u1,
                reserved24: u1,
                ///  DFSDM timer clock enable
                DFSDMEN: u1,
                padding: u7,
            }),
            reserved104: [4]u8,
            ///  AHB1 peripheral clocks enable in Sleep and Stop modes register
            AHB1SMENR: mmio.Mmio(packed struct(u32) {
                ///  DMA1 clocks enable during Sleep and Stop modes
                DMA1SMEN: u1,
                ///  DMA2 clocks enable during Sleep and Stop modes
                DMA2SMEN: u1,
                reserved8: u6,
                ///  Flash memory interface clocks enable during Sleep and Stop modes
                FLASHSMEN: u1,
                ///  SRAM1 interface clocks enable during Sleep and Stop modes
                SRAM1SMEN: u1,
                reserved11: u1,
                ///  CRCSMEN
                CRCSMEN: u1,
                reserved16: u4,
                ///  Touch Sensing Controller clocks enable during Sleep and Stop modes
                TSCSMEN: u1,
                padding: u15,
            }),
            ///  AHB2 peripheral clocks enable in Sleep and Stop modes register
            AHB2SMENR: mmio.Mmio(packed struct(u32) {
                ///  IO port A clocks enable during Sleep and Stop modes
                GPIOASMEN: u1,
                ///  IO port B clocks enable during Sleep and Stop modes
                GPIOBSMEN: u1,
                ///  IO port C clocks enable during Sleep and Stop modes
                GPIOCSMEN: u1,
                ///  IO port D clocks enable during Sleep and Stop modes
                GPIODSMEN: u1,
                ///  IO port E clocks enable during Sleep and Stop modes
                GPIOESMEN: u1,
                ///  IO port F clocks enable during Sleep and Stop modes
                GPIOFSMEN: u1,
                ///  IO port G clocks enable during Sleep and Stop modes
                GPIOGSMEN: u1,
                ///  IO port H clocks enable during Sleep and Stop modes
                GPIOHSMEN: u1,
                reserved9: u1,
                ///  SRAM2 interface clocks enable during Sleep and Stop modes
                SRAM2SMEN: u1,
                reserved12: u2,
                ///  OTG full speed clocks enable during Sleep and Stop modes
                OTGFSSMEN: u1,
                ///  ADC clocks enable during Sleep and Stop modes
                ADCFSSMEN: u1,
                reserved16: u2,
                ///  AES accelerator clocks enable during Sleep and Stop modes
                AESSMEN: u1,
                reserved18: u1,
                ///  Random Number Generator clocks enable during Sleep and Stop modes
                RNGSMEN: u1,
                padding: u13,
            }),
            ///  AHB3 peripheral clocks enable in Sleep and Stop modes register
            AHB3SMENR: mmio.Mmio(packed struct(u32) {
                ///  Flexible memory controller clocks enable during Sleep and Stop modes
                FMCSMEN: u1,
                reserved8: u7,
                ///  QSPISMEN
                QSPISMEN: u1,
                padding: u23,
            }),
            reserved120: [4]u8,
            ///  APB1SMENR1
            APB1SMENR1: mmio.Mmio(packed struct(u32) {
                ///  TIM2 timer clocks enable during Sleep and Stop modes
                TIM2SMEN: u1,
                ///  TIM3 timer clocks enable during Sleep and Stop modes
                TIM3SMEN: u1,
                ///  TIM4 timer clocks enable during Sleep and Stop modes
                TIM4SMEN: u1,
                ///  TIM5 timer clocks enable during Sleep and Stop modes
                TIM5SMEN: u1,
                ///  TIM6 timer clocks enable during Sleep and Stop modes
                TIM6SMEN: u1,
                ///  TIM7 timer clocks enable during Sleep and Stop modes
                TIM7SMEN: u1,
                reserved9: u3,
                ///  LCD clocks enable during Sleep and Stop modes
                LCDSMEN: u1,
                reserved11: u1,
                ///  Window watchdog clocks enable during Sleep and Stop modes
                WWDGSMEN: u1,
                reserved14: u2,
                ///  SPI2 clocks enable during Sleep and Stop modes
                SPI2SMEN: u1,
                ///  SPI3 clocks enable during Sleep and Stop modes
                SP3SMEN: u1,
                reserved17: u1,
                ///  USART2 clocks enable during Sleep and Stop modes
                USART2SMEN: u1,
                ///  USART3 clocks enable during Sleep and Stop modes
                USART3SMEN: u1,
                ///  UART4 clocks enable during Sleep and Stop modes
                UART4SMEN: u1,
                ///  UART5 clocks enable during Sleep and Stop modes
                UART5SMEN: u1,
                ///  I2C1 clocks enable during Sleep and Stop modes
                I2C1SMEN: u1,
                ///  I2C2 clocks enable during Sleep and Stop modes
                I2C2SMEN: u1,
                ///  I2C3 clocks enable during Sleep and Stop modes
                I2C3SMEN: u1,
                reserved25: u1,
                ///  CAN1 clocks enable during Sleep and Stop modes
                CAN1SMEN: u1,
                reserved28: u2,
                ///  Power interface clocks enable during Sleep and Stop modes
                PWRSMEN: u1,
                ///  DAC1 interface clocks enable during Sleep and Stop modes
                DAC1SMEN: u1,
                ///  OPAMP interface clocks enable during Sleep and Stop modes
                OPAMPSMEN: u1,
                ///  Low power timer 1 clocks enable during Sleep and Stop modes
                LPTIM1SMEN: u1,
            }),
            ///  APB1 peripheral clocks enable in Sleep and Stop modes register 2
            APB1SMENR2: mmio.Mmio(packed struct(u32) {
                ///  Low power UART 1 clocks enable during Sleep and Stop modes
                LPUART1SMEN: u1,
                reserved2: u1,
                ///  Single wire protocol clocks enable during Sleep and Stop modes
                SWPMI1SMEN: u1,
                reserved5: u2,
                ///  LPTIM2SMEN
                LPTIM2SMEN: u1,
                padding: u26,
            }),
            ///  APB2SMENR
            APB2SMENR: mmio.Mmio(packed struct(u32) {
                ///  SYSCFG clocks enable during Sleep and Stop modes
                SYSCFGSMEN: u1,
                reserved10: u9,
                ///  SDMMC clocks enable during Sleep and Stop modes
                SDMMCSMEN: u1,
                ///  TIM1 timer clocks enable during Sleep and Stop modes
                TIM1SMEN: u1,
                ///  SPI1 clocks enable during Sleep and Stop modes
                SPI1SMEN: u1,
                ///  TIM8 timer clocks enable during Sleep and Stop modes
                TIM8SMEN: u1,
                ///  USART1clocks enable during Sleep and Stop modes
                USART1SMEN: u1,
                reserved16: u1,
                ///  TIM15 timer clocks enable during Sleep and Stop modes
                TIM15SMEN: u1,
                ///  TIM16 timer clocks enable during Sleep and Stop modes
                TIM16SMEN: u1,
                ///  TIM17 timer clocks enable during Sleep and Stop modes
                TIM17SMEN: u1,
                reserved21: u2,
                ///  SAI1 clocks enable during Sleep and Stop modes
                SAI1SMEN: u1,
                ///  SAI2 clocks enable during Sleep and Stop modes
                SAI2SMEN: u1,
                reserved24: u1,
                ///  DFSDM timer clocks enable during Sleep and Stop modes
                DFSDMSMEN: u1,
                padding: u7,
            }),
            reserved136: [4]u8,
            ///  CCIPR
            CCIPR: mmio.Mmio(packed struct(u32) {
                ///  USART1 clock source selection
                USART1SEL: u2,
                ///  USART2 clock source selection
                USART2SEL: u2,
                ///  USART3 clock source selection
                USART3SEL: u2,
                ///  UART4 clock source selection
                UART4SEL: u2,
                ///  UART5 clock source selection
                UART5SEL: u2,
                ///  LPUART1 clock source selection
                LPUART1SEL: u2,
                ///  I2C1 clock source selection
                I2C1SEL: u2,
                ///  I2C2 clock source selection
                I2C2SEL: u2,
                ///  I2C3 clock source selection
                I2C3SEL: u2,
                ///  Low power timer 1 clock source selection
                LPTIM1SEL: u2,
                ///  Low power timer 2 clock source selection
                LPTIM2SEL: u2,
                ///  SAI1 clock source selection
                SAI1SEL: u2,
                ///  SAI2 clock source selection
                SAI2SEL: u2,
                ///  48 MHz clock source selection
                CLK48SEL: u2,
                ///  ADCs clock source selection
                ADCSEL: u2,
                ///  SWPMI1 clock source selection
                SWPMI1SEL: u1,
                ///  DFSDM clock source selection
                DFSDMSEL: u1,
            }),
            reserved144: [4]u8,
            ///  BDCR
            BDCR: mmio.Mmio(packed struct(u32) {
                ///  LSE oscillator enable
                LSEON: u1,
                ///  LSE oscillator ready
                LSERDY: u1,
                ///  LSE oscillator bypass
                LSEBYP: u1,
                ///  SE oscillator drive capability
                LSEDRV: u2,
                ///  LSECSSON
                LSECSSON: u1,
                ///  LSECSSD
                LSECSSD: u1,
                reserved8: u1,
                ///  RTC clock source selection
                RTCSEL: u2,
                reserved15: u5,
                ///  RTC clock enable
                RTCEN: u1,
                ///  Backup domain software reset
                BDRST: u1,
                reserved24: u7,
                ///  Low speed clock output enable
                LSCOEN: u1,
                ///  Low speed clock output selection
                LSCOSEL: u1,
                padding: u6,
            }),
            ///  CSR
            CSR: mmio.Mmio(packed struct(u32) {
                ///  LSI oscillator enable
                LSION: u1,
                ///  LSI oscillator ready
                LSIRDY: u1,
                reserved8: u6,
                ///  SI range after Standby mode
                MSISRANGE: u4,
                reserved23: u11,
                ///  Remove reset flag
                RMVF: u1,
                ///  Firewall reset flag
                FIREWALLRSTF: u1,
                ///  Option byte loader reset flag
                OBLRSTF: u1,
                ///  Pin reset flag
                PINRSTF: u1,
                ///  BOR flag
                BORRSTF: u1,
                ///  Software reset flag
                SFTRSTF: u1,
                ///  Independent window watchdog reset flag
                IWDGRSTF: u1,
                ///  Window watchdog reset flag
                WWDGRSTF: u1,
                ///  Low-power reset flag
                LPWRSTF: u1,
            }),
        };

        ///  Serial audio interface
        pub const SAI1 = extern struct {
            reserved4: [4]u8,
            ///  AConfiguration register 1
            ACR1: mmio.Mmio(packed struct(u32) {
                ///  Audio block mode
                MODE: u2,
                ///  Protocol configuration
                PRTCFG: u2,
                reserved5: u1,
                ///  Data size
                DS: u3,
                ///  Least significant bit first
                LSBFIRST: u1,
                ///  Clock strobing edge
                CKSTR: u1,
                ///  Synchronization enable
                SYNCEN: u2,
                ///  Mono mode
                MONO: u1,
                ///  Output drive
                OutDri: u1,
                reserved16: u2,
                ///  Audio block A enable
                SAIAEN: u1,
                ///  DMA enable
                DMAEN: u1,
                reserved19: u1,
                ///  No divider
                NODIV: u1,
                ///  Master clock divider
                MCJDIV: u4,
                padding: u8,
            }),
            ///  AConfiguration register 2
            ACR2: mmio.Mmio(packed struct(u32) {
                ///  FIFO threshold
                FTH: u3,
                ///  FIFO flush
                FFLUS: u1,
                ///  Tristate management on data line
                TRIS: u1,
                ///  Mute
                MUTE: u1,
                ///  Mute value
                MUTEVAL: u1,
                ///  Mute counter
                MUTECN: u6,
                ///  Complement bit
                CPL: u1,
                ///  Companding mode
                COMP: u2,
                padding: u16,
            }),
            ///  AFRCR
            AFRCR: mmio.Mmio(packed struct(u32) {
                ///  Frame length
                FRL: u8,
                ///  Frame synchronization active level length
                FSALL: u7,
                reserved16: u1,
                ///  Frame synchronization definition
                FSDEF: u1,
                ///  Frame synchronization polarity
                FSPOL: u1,
                ///  Frame synchronization offset
                FSOFF: u1,
                padding: u13,
            }),
            ///  ASlot register
            ASLOTR: mmio.Mmio(packed struct(u32) {
                ///  First bit offset
                FBOFF: u5,
                reserved6: u1,
                ///  Slot size
                SLOTSZ: u2,
                ///  Number of slots in an audio frame
                NBSLOT: u4,
                reserved16: u4,
                ///  Slot enable
                SLOTEN: u16,
            }),
            ///  AInterrupt mask register2
            AIM: mmio.Mmio(packed struct(u32) {
                ///  Overrun/underrun interrupt enable
                OVRUDRIE: u1,
                ///  Mute detection interrupt enable
                MUTEDET: u1,
                ///  Wrong clock configuration interrupt enable
                WCKCFG: u1,
                ///  FIFO request interrupt enable
                FREQIE: u1,
                ///  Codec not ready interrupt enable
                CNRDYIE: u1,
                ///  Anticipated frame synchronization detection interrupt enable
                AFSDETIE: u1,
                ///  Late frame synchronization detection interrupt enable
                LFSDET: u1,
                padding: u25,
            }),
            ///  AStatus register
            ASR: mmio.Mmio(packed struct(u32) {
                ///  Overrun / underrun
                OVRUDR: u1,
                ///  Mute detection
                MUTEDET: u1,
                ///  Wrong clock configuration flag. This bit is read only
                WCKCFG: u1,
                ///  FIFO request
                FREQ: u1,
                ///  Codec not ready
                CNRDY: u1,
                ///  Anticipated frame synchronization detection
                AFSDET: u1,
                ///  Late frame synchronization detection
                LFSDET: u1,
                reserved16: u9,
                ///  FIFO level threshold
                FLVL: u3,
                padding: u13,
            }),
            ///  AClear flag register
            ACLRFR: mmio.Mmio(packed struct(u32) {
                ///  Clear overrun / underrun
                OVRUDR: u1,
                ///  Mute detection flag
                MUTEDET: u1,
                ///  Clear wrong clock configuration flag
                WCKCFG: u1,
                reserved4: u1,
                ///  Clear codec not ready flag
                CNRDY: u1,
                ///  Clear anticipated frame synchronization detection flag
                CAFSDET: u1,
                ///  Clear late frame synchronization detection flag
                LFSDET: u1,
                padding: u25,
            }),
            ///  AData register
            ADR: mmio.Mmio(packed struct(u32) {
                ///  Data
                DATA: u32,
            }),
            ///  BConfiguration register 1
            BCR1: mmio.Mmio(packed struct(u32) {
                ///  Audio block mode
                MODE: u2,
                ///  Protocol configuration
                PRTCFG: u2,
                reserved5: u1,
                ///  Data size
                DS: u3,
                ///  Least significant bit first
                LSBFIRST: u1,
                ///  Clock strobing edge
                CKSTR: u1,
                ///  Synchronization enable
                SYNCEN: u2,
                ///  Mono mode
                MONO: u1,
                ///  Output drive
                OutDri: u1,
                reserved16: u2,
                ///  Audio block B enable
                SAIBEN: u1,
                ///  DMA enable
                DMAEN: u1,
                reserved19: u1,
                ///  No divider
                NODIV: u1,
                ///  Master clock divider
                MCJDIV: u4,
                padding: u8,
            }),
            ///  BConfiguration register 2
            BCR2: mmio.Mmio(packed struct(u32) {
                ///  FIFO threshold
                FTH: u3,
                ///  FIFO flush
                FFLUS: u1,
                ///  Tristate management on data line
                TRIS: u1,
                ///  Mute
                MUTE: u1,
                ///  Mute value
                MUTEVAL: u1,
                ///  Mute counter
                MUTECN: u6,
                ///  Complement bit
                CPL: u1,
                ///  Companding mode
                COMP: u2,
                padding: u16,
            }),
            ///  BFRCR
            BFRCR: mmio.Mmio(packed struct(u32) {
                ///  Frame length
                FRL: u8,
                ///  Frame synchronization active level length
                FSALL: u7,
                reserved16: u1,
                ///  Frame synchronization definition
                FSDEF: u1,
                ///  Frame synchronization polarity
                FSPOL: u1,
                ///  Frame synchronization offset
                FSOFF: u1,
                padding: u13,
            }),
            ///  BSlot register
            BSLOTR: mmio.Mmio(packed struct(u32) {
                ///  First bit offset
                FBOFF: u5,
                reserved6: u1,
                ///  Slot size
                SLOTSZ: u2,
                ///  Number of slots in an audio frame
                NBSLOT: u4,
                reserved16: u4,
                ///  Slot enable
                SLOTEN: u16,
            }),
            ///  BInterrupt mask register2
            BIM: mmio.Mmio(packed struct(u32) {
                ///  Overrun/underrun interrupt enable
                OVRUDRIE: u1,
                ///  Mute detection interrupt enable
                MUTEDET: u1,
                ///  Wrong clock configuration interrupt enable
                WCKCFG: u1,
                ///  FIFO request interrupt enable
                FREQIE: u1,
                ///  Codec not ready interrupt enable
                CNRDYIE: u1,
                ///  Anticipated frame synchronization detection interrupt enable
                AFSDETIE: u1,
                ///  Late frame synchronization detection interrupt enable
                LFSDETIE: u1,
                padding: u25,
            }),
            ///  BStatus register
            BSR: mmio.Mmio(packed struct(u32) {
                ///  Overrun / underrun
                OVRUDR: u1,
                ///  Mute detection
                MUTEDET: u1,
                ///  Wrong clock configuration flag
                WCKCFG: u1,
                ///  FIFO request
                FREQ: u1,
                ///  Codec not ready
                CNRDY: u1,
                ///  Anticipated frame synchronization detection
                AFSDET: u1,
                ///  Late frame synchronization detection
                LFSDET: u1,
                reserved16: u9,
                ///  FIFO level threshold
                FLVL: u3,
                padding: u13,
            }),
            ///  BClear flag register
            BCLRFR: mmio.Mmio(packed struct(u32) {
                ///  Clear overrun / underrun
                OVRUDR: u1,
                ///  Mute detection flag
                MUTEDET: u1,
                ///  Clear wrong clock configuration flag
                WCKCFG: u1,
                reserved4: u1,
                ///  Clear codec not ready flag
                CNRDY: u1,
                ///  Clear anticipated frame synchronization detection flag
                CAFSDET: u1,
                ///  Clear late frame synchronization detection flag
                LFSDET: u1,
                padding: u25,
            }),
            ///  BData register
            BDR: mmio.Mmio(packed struct(u32) {
                ///  Data
                DATA: u32,
            }),
        };

        ///  Advanced-timers
        pub const TIM8 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                CEN: u1,
                ///  Update disable
                UDIS: u1,
                ///  Update request source
                URS: u1,
                ///  One-pulse mode
                OPM: u1,
                ///  Direction
                DIR: u1,
                ///  Center-aligned mode selection
                CMS: u2,
                ///  Auto-reload preload enable
                ARPE: u1,
                ///  Clock division
                CKD: u2,
                padding: u22,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Capture/compare preloaded control
                CCPC: u1,
                reserved2: u1,
                ///  Capture/compare control update selection
                CCUS: u1,
                ///  Capture/compare DMA selection
                CCDS: u1,
                ///  Master mode selection
                MMS: u3,
                ///  TI1 selection
                TI1S: u1,
                ///  Output Idle state 1
                OIS1: u1,
                ///  Output Idle state 1
                OIS1N: u1,
                ///  Output Idle state 2
                OIS2: u1,
                ///  Output Idle state 2
                OIS2N: u1,
                ///  Output Idle state 3
                OIS3: u1,
                ///  Output Idle state 3
                OIS3N: u1,
                ///  Output Idle state 4
                OIS4: u1,
                padding: u17,
            }),
            ///  slave mode control register
            SMCR: mmio.Mmio(packed struct(u32) {
                ///  Slave mode selection
                SMS: u3,
                reserved4: u1,
                ///  Trigger selection
                TS: u3,
                ///  Master/Slave mode
                MSM: u1,
                ///  External trigger filter
                ETF: u4,
                ///  External trigger prescaler
                ETPS: u2,
                ///  External clock enable
                ECE: u1,
                ///  External trigger polarity
                ETP: u1,
                padding: u16,
            }),
            ///  DMA/Interrupt enable register
            DIER: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt enable
                UIE: u1,
                ///  Capture/Compare 1 interrupt enable
                CC1IE: u1,
                ///  Capture/Compare 2 interrupt enable
                CC2IE: u1,
                ///  Capture/Compare 3 interrupt enable
                CC3IE: u1,
                ///  Capture/Compare 4 interrupt enable
                CC4IE: u1,
                ///  COM interrupt enable
                COMIE: u1,
                ///  Trigger interrupt enable
                TIE: u1,
                ///  Break interrupt enable
                BIE: u1,
                ///  Update DMA request enable
                UDE: u1,
                ///  Capture/Compare 1 DMA request enable
                CC1DE: u1,
                ///  Capture/Compare 2 DMA request enable
                CC2DE: u1,
                ///  Capture/Compare 3 DMA request enable
                CC3DE: u1,
                ///  Capture/Compare 4 DMA request enable
                CC4DE: u1,
                ///  COM DMA request enable
                COMDE: u1,
                ///  Trigger DMA request enable
                TDE: u1,
                padding: u17,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt flag
                UIF: u1,
                ///  Capture/compare 1 interrupt flag
                CC1IF: u1,
                ///  Capture/Compare 2 interrupt flag
                CC2IF: u1,
                ///  Capture/Compare 3 interrupt flag
                CC3IF: u1,
                ///  Capture/Compare 4 interrupt flag
                CC4IF: u1,
                ///  COM interrupt flag
                COMIF: u1,
                ///  Trigger interrupt flag
                TIF: u1,
                ///  Break interrupt flag
                BIF: u1,
                reserved9: u1,
                ///  Capture/Compare 1 overcapture flag
                CC1OF: u1,
                ///  Capture/compare 2 overcapture flag
                CC2OF: u1,
                ///  Capture/Compare 3 overcapture flag
                CC3OF: u1,
                ///  Capture/Compare 4 overcapture flag
                CC4OF: u1,
                padding: u19,
            }),
            ///  event generation register
            EGR: mmio.Mmio(packed struct(u32) {
                ///  Update generation
                UG: u1,
                ///  Capture/compare 1 generation
                CC1G: u1,
                ///  Capture/compare 2 generation
                CC2G: u1,
                ///  Capture/compare 3 generation
                CC3G: u1,
                ///  Capture/compare 4 generation
                CC4G: u1,
                ///  Capture/Compare control update generation
                COMG: u1,
                ///  Trigger generation
                TG: u1,
                ///  Break generation
                BG: u1,
                padding: u24,
            }),
            ///  capture/compare mode register 1 (output mode)
            CCMR1_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 selection
                CC1S: u2,
                ///  Output Compare 1 fast enable
                OC1FE: u1,
                ///  Output Compare 1 preload enable
                OC1PE: u1,
                ///  Output Compare 1 mode
                OC1M: u3,
                ///  Output Compare 1 clear enable
                OC1CE: u1,
                ///  Capture/Compare 2 selection
                CC2S: u2,
                ///  Output Compare 2 fast enable
                OC2FE: u1,
                ///  Output Compare 2 preload enable
                OC2PE: u1,
                ///  Output Compare 2 mode
                OC2M: u3,
                ///  Output Compare 2 clear enable
                OC2CE: u1,
                padding: u16,
            }),
            ///  capture/compare mode register 2 (output mode)
            CCMR2_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 3 selection
                CC3S: u2,
                ///  Output compare 3 fast enable
                OC3FE: u1,
                ///  Output compare 3 preload enable
                OC3PE: u1,
                ///  Output compare 3 mode
                OC3M: u3,
                ///  Output compare 3 clear enable
                OC3CE: u1,
                ///  Capture/Compare 4 selection
                CC4S: u2,
                ///  Output compare 4 fast enable
                OC4FE: u1,
                ///  Output compare 4 preload enable
                OC4PE: u1,
                ///  Output compare 4 mode
                OC4M: u3,
                ///  Output compare 4 clear enable
                OC4CE: u1,
                padding: u16,
            }),
            ///  capture/compare enable register
            CCER: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 output enable
                CC1E: u1,
                ///  Capture/Compare 1 output Polarity
                CC1P: u1,
                ///  Capture/Compare 1 complementary output enable
                CC1NE: u1,
                ///  Capture/Compare 1 output Polarity
                CC1NP: u1,
                ///  Capture/Compare 2 output enable
                CC2E: u1,
                ///  Capture/Compare 2 output Polarity
                CC2P: u1,
                ///  Capture/Compare 2 complementary output enable
                CC2NE: u1,
                ///  Capture/Compare 2 output Polarity
                CC2NP: u1,
                ///  Capture/Compare 3 output enable
                CC3E: u1,
                ///  Capture/Compare 3 output Polarity
                CC3P: u1,
                ///  Capture/Compare 3 complementary output enable
                CC3NE: u1,
                ///  Capture/Compare 3 output Polarity
                CC3NP: u1,
                ///  Capture/Compare 4 output enable
                CC4E: u1,
                ///  Capture/Compare 3 output Polarity
                CC4P: u1,
                padding: u18,
            }),
            ///  counter
            CNT: mmio.Mmio(packed struct(u32) {
                ///  counter value
                CNT: u16,
                padding: u16,
            }),
            ///  prescaler
            PSC: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u16,
                padding: u16,
            }),
            ///  auto-reload register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Auto-reload value
                ARR: u16,
                padding: u16,
            }),
            ///  repetition counter register
            RCR: mmio.Mmio(packed struct(u32) {
                ///  Repetition counter value
                REP: u8,
                padding: u24,
            }),
            ///  capture/compare register 1
            CCR1: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 value
                CCR1: u16,
                padding: u16,
            }),
            ///  capture/compare register 2
            CCR2: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 2 value
                CCR2: u16,
                padding: u16,
            }),
            ///  capture/compare register 3
            CCR3: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR3: u16,
                padding: u16,
            }),
            ///  capture/compare register 4
            CCR4: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR4: u16,
                padding: u16,
            }),
            ///  break and dead-time register
            BDTR: mmio.Mmio(packed struct(u32) {
                ///  Dead-time generator setup
                DTG: u8,
                ///  Lock configuration
                LOCK: u2,
                ///  Off-state selection for Idle mode
                OSSI: u1,
                ///  Off-state selection for Run mode
                OSSR: u1,
                ///  Break enable
                BKE: u1,
                ///  Break polarity
                BKP: u1,
                ///  Automatic output enable
                AOE: u1,
                ///  Main output enable
                MOE: u1,
                padding: u16,
            }),
            ///  DMA control register
            DCR: mmio.Mmio(packed struct(u32) {
                ///  DMA base address
                DBA: u5,
                reserved8: u3,
                ///  DMA burst length
                DBL: u5,
                padding: u19,
            }),
            ///  DMA address for full transfer
            DMAR: mmio.Mmio(packed struct(u32) {
                ///  DMA register for burst accesses
                DMAB: u16,
                padding: u16,
            }),
            ///  DMA address for full transfer
            OR1: mmio.Mmio(packed struct(u32) {
                ///  External trigger remap on ADC2 analog watchdog
                ETR_ADC2_RMP: u2,
                ///  External trigger remap on ADC3 analog watchdog
                ETR_ADC3_RMP: u2,
                ///  Input Capture 1 remap
                TI1_RMP: u1,
                padding: u27,
            }),
            ///  capture/compare mode register 2 (output mode)
            CCMR3_Output: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Output compare 5 fast enable
                OC5FE: u1,
                ///  Output compare 5 preload enable
                OC5PE: u1,
                ///  Output compare 5 mode
                OC5M: u3,
                ///  Output compare 5 clear enable
                OC5CE: u1,
                reserved10: u2,
                ///  Output compare 6 fast enable
                OC6FE: u1,
                ///  Output compare 6 preload enable
                OC6PE: u1,
                ///  Output compare 6 mode
                OC6M: u3,
                ///  Output compare 6 clear enable
                OC6CE: u1,
                ///  Output Compare 5 mode bit 3
                OC5M_bit3: u3,
                reserved24: u5,
                ///  Output Compare 6 mode bit 3
                OC6M_bit3: u1,
                padding: u7,
            }),
            ///  capture/compare register 4
            CCR5: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR5: u16,
                reserved29: u13,
                ///  Group Channel 5 and Channel 1
                GC5C1: u1,
                ///  Group Channel 5 and Channel 2
                GC5C2: u1,
                ///  Group Channel 5 and Channel 3
                GC5C3: u1,
            }),
            ///  capture/compare register 4
            CCR6: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR6: u16,
                padding: u16,
            }),
            ///  DMA address for full transfer
            OR2: mmio.Mmio(packed struct(u32) {
                ///  BRK BKIN input enable
                BKINE: u1,
                ///  BRK COMP1 enable
                BKCMP1E: u1,
                ///  BRK COMP2 enable
                BKCMP2E: u1,
                reserved8: u5,
                ///  BRK DFSDM_BREAK2 enable
                BKDFBK2E: u1,
                ///  BRK BKIN input polarity
                BKINP: u1,
                ///  BRK COMP1 input polarity
                BKCMP1P: u1,
                ///  BRK COMP2 input polarity
                BKCMP2P: u1,
                reserved14: u2,
                ///  ETR source selection
                ETRSEL: u3,
                padding: u15,
            }),
            ///  DMA address for full transfer
            OR3: mmio.Mmio(packed struct(u32) {
                ///  BRK2 BKIN input enable
                BK2INE: u1,
                ///  BRK2 COMP1 enable
                BK2CMP1E: u1,
                ///  BRK2 COMP2 enable
                BK2CMP2E: u1,
                reserved8: u5,
                ///  BRK2 DFSDM_BREAK3 enable
                BK2DFBK3E: u1,
                ///  BRK2 BKIN input polarity
                BK2INP: u1,
                ///  BRK2 COMP1 input polarity
                BK2CMP1P: u1,
                ///  BRK2 COMP2 input polarity
                BK2CMP2P: u1,
                padding: u20,
            }),
        };

        ///  General-purpose-timers
        pub const TIM2 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                CEN: u1,
                ///  Update disable
                UDIS: u1,
                ///  Update request source
                URS: u1,
                ///  One-pulse mode
                OPM: u1,
                ///  Direction
                DIR: u1,
                ///  Center-aligned mode selection
                CMS: u2,
                ///  Auto-reload preload enable
                ARPE: u1,
                ///  Clock division
                CKD: u2,
                padding: u22,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Capture/compare DMA selection
                CCDS: u1,
                ///  Master mode selection
                MMS: u3,
                ///  TI1 selection
                TI1S: u1,
                padding: u24,
            }),
            ///  slave mode control register
            SMCR: mmio.Mmio(packed struct(u32) {
                ///  Slave mode selection
                SMS: u3,
                reserved4: u1,
                ///  Trigger selection
                TS: u3,
                ///  Master/Slave mode
                MSM: u1,
                ///  External trigger filter
                ETF: u4,
                ///  External trigger prescaler
                ETPS: u2,
                ///  External clock enable
                ECE: u1,
                ///  External trigger polarity
                ETP: u1,
                padding: u16,
            }),
            ///  DMA/Interrupt enable register
            DIER: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt enable
                UIE: u1,
                ///  Capture/Compare 1 interrupt enable
                CC1IE: u1,
                ///  Capture/Compare 2 interrupt enable
                CC2IE: u1,
                ///  Capture/Compare 3 interrupt enable
                CC3IE: u1,
                ///  Capture/Compare 4 interrupt enable
                CC4IE: u1,
                reserved6: u1,
                ///  Trigger interrupt enable
                TIE: u1,
                reserved8: u1,
                ///  Update DMA request enable
                UDE: u1,
                ///  Capture/Compare 1 DMA request enable
                CC1DE: u1,
                ///  Capture/Compare 2 DMA request enable
                CC2DE: u1,
                ///  Capture/Compare 3 DMA request enable
                CC3DE: u1,
                ///  Capture/Compare 4 DMA request enable
                CC4DE: u1,
                ///  COM DMA request enable
                COMDE: u1,
                ///  Trigger DMA request enable
                TDE: u1,
                padding: u17,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt flag
                UIF: u1,
                ///  Capture/compare 1 interrupt flag
                CC1IF: u1,
                ///  Capture/Compare 2 interrupt flag
                CC2IF: u1,
                ///  Capture/Compare 3 interrupt flag
                CC3IF: u1,
                ///  Capture/Compare 4 interrupt flag
                CC4IF: u1,
                reserved6: u1,
                ///  Trigger interrupt flag
                TIF: u1,
                reserved9: u2,
                ///  Capture/Compare 1 overcapture flag
                CC1OF: u1,
                ///  Capture/compare 2 overcapture flag
                CC2OF: u1,
                ///  Capture/Compare 3 overcapture flag
                CC3OF: u1,
                ///  Capture/Compare 4 overcapture flag
                CC4OF: u1,
                padding: u19,
            }),
            ///  event generation register
            EGR: mmio.Mmio(packed struct(u32) {
                ///  Update generation
                UG: u1,
                ///  Capture/compare 1 generation
                CC1G: u1,
                ///  Capture/compare 2 generation
                CC2G: u1,
                ///  Capture/compare 3 generation
                CC3G: u1,
                ///  Capture/compare 4 generation
                CC4G: u1,
                reserved6: u1,
                ///  Trigger generation
                TG: u1,
                padding: u25,
            }),
            ///  capture/compare mode register 1 (output mode)
            CCMR1_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 selection
                CC1S: u2,
                ///  Output compare 1 fast enable
                OC1FE: u1,
                ///  Output compare 1 preload enable
                OC1PE: u1,
                ///  Output compare 1 mode
                OC1M: u3,
                ///  Output compare 1 clear enable
                OC1CE: u1,
                ///  Capture/Compare 2 selection
                CC2S: u2,
                ///  Output compare 2 fast enable
                OC2FE: u1,
                ///  Output compare 2 preload enable
                OC2PE: u1,
                ///  Output compare 2 mode
                OC2M: u3,
                ///  Output compare 2 clear enable
                OC2CE: u1,
                padding: u16,
            }),
            ///  capture/compare mode register 2 (output mode)
            CCMR2_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 3 selection
                CC3S: u2,
                ///  Output compare 3 fast enable
                OC3FE: u1,
                ///  Output compare 3 preload enable
                OC3PE: u1,
                ///  Output compare 3 mode
                OC3M: u3,
                ///  Output compare 3 clear enable
                OC3CE: u1,
                ///  Capture/Compare 4 selection
                CC4S: u2,
                ///  Output compare 4 fast enable
                OC4FE: u1,
                ///  Output compare 4 preload enable
                OC4PE: u1,
                ///  Output compare 4 mode
                OC4M: u3,
                ///  Output compare 4 clear enable
                OC4CE: u1,
                padding: u16,
            }),
            ///  capture/compare enable register
            CCER: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 output enable
                CC1E: u1,
                ///  Capture/Compare 1 output Polarity
                CC1P: u1,
                reserved3: u1,
                ///  Capture/Compare 1 output Polarity
                CC1NP: u1,
                ///  Capture/Compare 2 output enable
                CC2E: u1,
                ///  Capture/Compare 2 output Polarity
                CC2P: u1,
                reserved7: u1,
                ///  Capture/Compare 2 output Polarity
                CC2NP: u1,
                ///  Capture/Compare 3 output enable
                CC3E: u1,
                ///  Capture/Compare 3 output Polarity
                CC3P: u1,
                reserved11: u1,
                ///  Capture/Compare 3 output Polarity
                CC3NP: u1,
                ///  Capture/Compare 4 output enable
                CC4E: u1,
                ///  Capture/Compare 3 output Polarity
                CC4P: u1,
                reserved15: u1,
                ///  Capture/Compare 4 output Polarity
                CC4NP: u1,
                padding: u16,
            }),
            ///  counter
            CNT: mmio.Mmio(packed struct(u32) {
                ///  Low counter value
                CNT_L: u16,
                ///  High counter value (TIM2 only)
                CNT_H: u16,
            }),
            ///  prescaler
            PSC: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u16,
                padding: u16,
            }),
            ///  auto-reload register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Low Auto-reload value
                ARR_L: u16,
                ///  High Auto-reload value (TIM2 only)
                ARR_H: u16,
            }),
            reserved52: [4]u8,
            ///  capture/compare register 1
            CCR1: mmio.Mmio(packed struct(u32) {
                ///  Low Capture/Compare 1 value
                CCR1_L: u16,
                ///  High Capture/Compare 1 value (TIM2 only)
                CCR1_H: u16,
            }),
            ///  capture/compare register 2
            CCR2: mmio.Mmio(packed struct(u32) {
                ///  Low Capture/Compare 2 value
                CCR2_L: u16,
                ///  High Capture/Compare 2 value (TIM2 only)
                CCR2_H: u16,
            }),
            ///  capture/compare register 3
            CCR3: mmio.Mmio(packed struct(u32) {
                ///  Low Capture/Compare value
                CCR3_L: u16,
                ///  High Capture/Compare value (TIM2 only)
                CCR3_H: u16,
            }),
            ///  capture/compare register 4
            CCR4: mmio.Mmio(packed struct(u32) {
                ///  Low Capture/Compare value
                CCR4_L: u16,
                ///  High Capture/Compare value (TIM2 only)
                CCR4_H: u16,
            }),
            reserved72: [4]u8,
            ///  DMA control register
            DCR: mmio.Mmio(packed struct(u32) {
                ///  DMA base address
                DBA: u5,
                reserved8: u3,
                ///  DMA burst length
                DBL: u5,
                padding: u19,
            }),
            ///  DMA address for full transfer
            DMAR: mmio.Mmio(packed struct(u32) {
                ///  DMA register for burst accesses
                DMAB: u16,
                padding: u16,
            }),
            ///  TIM2 option register
            OR: mmio.Mmio(packed struct(u32) {
                ///  Timer2 ETR remap
                ETR_RMP: u3,
                ///  Internal trigger
                TI4_RMP: u2,
                padding: u27,
            }),
        };

        ///  Digital filter for sigma delta modulators
        pub const DFSDM = extern struct {
            ///  channel configuration y register
            CHCFG0R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                ///  CKOUTDIV
                CKOUTDIV: u8,
                reserved30: u6,
                ///  CKOUTSRC
                CKOUTSRC: u1,
                ///  DFSDMEN
                DFSDMEN: u1,
            }),
            ///  channel configuration y register
            CHCFG0R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  analog watchdog and short-circuit detector register
            AWSCD0R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  channel watchdog filter data register
            CHWDAT0R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  channel data input register
            CHDATIN0R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved32: [12]u8,
            ///  CHCFG1R1
            CHCFG1R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG1R2
            CHCFG1R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD1R
            AWSCD1R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT1R
            CHWDAT1R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN1R
            CHDATIN1R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved64: [12]u8,
            ///  CHCFG2R1
            CHCFG2R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG2R2
            CHCFG2R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD2R
            AWSCD2R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT2R
            CHWDAT2R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN2R
            CHDATIN2R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved96: [12]u8,
            ///  CHCFG3R1
            CHCFG3R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG3R2
            CHCFG3R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD3R
            AWSCD3R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT3R
            CHWDAT3R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN3R
            CHDATIN3R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved128: [12]u8,
            ///  CHCFG4R1
            CHCFG4R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG4R2
            CHCFG4R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD4R
            AWSCD4R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT4R
            CHWDAT4R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN4R
            CHDATIN4R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved160: [12]u8,
            ///  CHCFG5R1
            CHCFG5R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG5R2
            CHCFG5R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD5R
            AWSCD5R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT5R
            CHWDAT5R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN5R
            CHDATIN5R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved192: [12]u8,
            ///  CHCFG6R1
            CHCFG6R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG6R2
            CHCFG6R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD6R
            AWSCD6R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT6R
            CHWDAT6R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN6R
            CHDATIN6R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved224: [12]u8,
            ///  CHCFG7R1
            CHCFG7R1: mmio.Mmio(packed struct(u32) {
                ///  SITP
                SITP: u2,
                ///  SPICKSEL
                SPICKSEL: u2,
                reserved5: u1,
                ///  SCDEN
                SCDEN: u1,
                ///  CKABEN
                CKABEN: u1,
                ///  CHEN
                CHEN: u1,
                ///  CHINSEL
                CHINSEL: u1,
                reserved12: u3,
                ///  DATMPX
                DATMPX: u2,
                ///  DATPACK
                DATPACK: u2,
                padding: u16,
            }),
            ///  CHCFG7R2
            CHCFG7R2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  DTRBS
                DTRBS: u5,
                ///  OFFSET
                OFFSET: u24,
            }),
            ///  AWSCD7R
            AWSCD7R: mmio.Mmio(packed struct(u32) {
                ///  SCDT
                SCDT: u8,
                reserved12: u4,
                ///  BKSCD
                BKSCD: u4,
                ///  AWFOSR
                AWFOSR: u5,
                reserved22: u1,
                ///  AWFORD
                AWFORD: u2,
                padding: u8,
            }),
            ///  CHWDAT7R
            CHWDAT7R: mmio.Mmio(packed struct(u32) {
                ///  WDATA
                WDATA: u16,
                padding: u16,
            }),
            ///  CHDATIN7R
            CHDATIN7R: mmio.Mmio(packed struct(u32) {
                ///  INDAT0
                INDAT0: u16,
                ///  INDAT1
                INDAT1: u16,
            }),
            reserved256: [12]u8,
            ///  control register 1
            DFSDM0_CR1: mmio.Mmio(packed struct(u32) {
                ///  DFSDM enable
                DFEN: u1,
                ///  Start a conversion of the injected group of channels
                JSWSTART: u1,
                reserved3: u1,
                ///  Launch an injected conversion synchronously with the DFSDM0 JSWSTART trigger
                JSYNC: u1,
                ///  Scanning conversion mode for injected conversions
                JSCAN: u1,
                ///  DMA channel enabled to read data for the injected channel group
                JDMAEN: u1,
                reserved8: u2,
                ///  Trigger signal selection for launching injected conversions
                JEXTSEL: u3,
                reserved13: u2,
                ///  Trigger enable and trigger edge selection for injected conversions
                JEXTEN: u2,
                reserved17: u2,
                ///  Software start of a conversion on the regular channel
                RSWSTART: u1,
                ///  Continuous mode selection for regular conversions
                RCONT: u1,
                ///  Launch regular conversion synchronously with DFSDM0
                RSYNC: u1,
                reserved21: u1,
                ///  DMA channel enabled to read data for the regular conversion
                RDMAEN: u1,
                reserved24: u2,
                ///  Regular channel selection
                RCH: u3,
                reserved29: u2,
                ///  Fast conversion mode selection for regular conversions
                FAST: u1,
                ///  Analog watchdog fast mode select
                AWFSEL: u1,
                padding: u1,
            }),
            ///  control register 2
            DFSDM0_CR2: mmio.Mmio(packed struct(u32) {
                ///  Injected end of conversion interrupt enable
                JEOCIE: u1,
                ///  Regular end of conversion interrupt enable
                REOCIE: u1,
                ///  Injected data overrun interrupt enable
                JOVRIE: u1,
                ///  Regular data overrun interrupt enable
                ROVRIE: u1,
                ///  Analog watchdog interrupt enable
                AWDIE: u1,
                ///  Short-circuit detector interrupt enable
                SCDIE: u1,
                ///  Clock absence interrupt enable
                CKABIE: u1,
                reserved8: u1,
                ///  Extremes detector channel selection
                EXCH: u8,
                ///  Analog watchdog channel selection
                AWDCH: u8,
                padding: u8,
            }),
            ///  interrupt and status register
            DFSDM0_ISR: mmio.Mmio(packed struct(u32) {
                ///  End of injected conversion flag
                JEOCF: u1,
                ///  End of regular conversion flag
                REOCF: u1,
                ///  Injected conversion overrun flag
                JOVRF: u1,
                ///  Regular conversion overrun flag
                ROVRF: u1,
                ///  Analog watchdog
                AWDF: u1,
                reserved13: u8,
                ///  Injected conversion in progress status
                JCIP: u1,
                ///  Regular conversion in progress status
                RCIP: u1,
                reserved16: u1,
                ///  Clock absence flag
                CKABF: u8,
                ///  short-circuit detector flag
                SCDF: u8,
            }),
            ///  interrupt flag clear register
            DFSDM0_ICR: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Clear the injected conversion overrun flag
                CLRJOVRF: u1,
                ///  Clear the regular conversion overrun flag
                CLRROVRF: u1,
                reserved16: u12,
                ///  Clear the clock absence flag
                CLRCKABF: u8,
                ///  Clear the short-circuit detector flag
                CLRSCDF: u8,
            }),
            ///  injected channel group selection register
            DFSDM0_JCHGR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel group selection
                JCHG: u8,
                padding: u24,
            }),
            ///  filter control register
            DFSDM0_FCR: mmio.Mmio(packed struct(u32) {
                ///  Integrator oversampling ratio (averaging length)
                IOSR: u8,
                reserved16: u8,
                ///  Sinc filter oversampling ratio (decimation rate)
                FOSR: u10,
                reserved29: u3,
                ///  Sinc filter order
                FORD: u3,
            }),
            ///  data register for injected group
            DFSDM0_JDATAR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel most recently converted
                JDATACH: u3,
                reserved8: u5,
                ///  Injected group conversion data
                JDATA: u24,
            }),
            ///  data register for the regular channel
            DFSDM0_RDATAR: mmio.Mmio(packed struct(u32) {
                ///  Regular channel most recently converted
                RDATACH: u3,
                reserved4: u1,
                ///  Regular channel pending data
                RPEND: u1,
                reserved8: u3,
                ///  Regular channel conversion data
                RDATA: u24,
            }),
            ///  analog watchdog high threshold register
            DFSDM0_AWHTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog high threshold event
                BKAWH: u4,
                reserved8: u4,
                ///  Analog watchdog high threshold
                AWHT: u24,
            }),
            ///  analog watchdog low threshold register
            DFSDM0_AWLTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog low threshold event
                BKAWL: u4,
                reserved8: u4,
                ///  Analog watchdog low threshold
                AWLT: u24,
            }),
            ///  analog watchdog status register
            DFSDM0_AWSR: mmio.Mmio(packed struct(u32) {
                ///  Analog watchdog low threshold flag
                AWLTF: u8,
                ///  Analog watchdog high threshold flag
                AWHTF: u8,
                padding: u16,
            }),
            ///  analog watchdog clear flag register
            DFSDM0_AWCFR: mmio.Mmio(packed struct(u32) {
                ///  Clear the analog watchdog low threshold flag
                CLRAWLTF: u8,
                ///  Clear the analog watchdog high threshold flag
                CLRAWHTF: u8,
                padding: u16,
            }),
            ///  Extremes detector maximum register
            DFSDM0_EXMAX: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector maximum data channel
                EXMAXCH: u3,
                reserved8: u5,
                ///  Extremes detector maximum value
                EXMAX: u24,
            }),
            ///  Extremes detector minimum register
            DFSDM0_EXMIN: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector minimum data channel
                EXMINCH: u3,
                reserved8: u5,
                ///  EXMIN
                EXMIN: u24,
            }),
            ///  conversion timer register
            DFSDM0_CNVTIMR: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  28-bit timer counting conversion time t = CNVCNT[27:0] / fDFSDM_CKIN
                CNVCNT: u28,
            }),
            reserved512: [196]u8,
            ///  control register 1
            DFSDM1_CR1: mmio.Mmio(packed struct(u32) {
                ///  DFSDM enable
                DFEN: u1,
                ///  Start a conversion of the injected group of channels
                JSWSTART: u1,
                reserved3: u1,
                ///  Launch an injected conversion synchronously with the DFSDM0 JSWSTART trigger
                JSYNC: u1,
                ///  Scanning conversion mode for injected conversions
                JSCAN: u1,
                ///  DMA channel enabled to read data for the injected channel group
                JDMAEN: u1,
                reserved8: u2,
                ///  Trigger signal selection for launching injected conversions
                JEXTSEL: u3,
                reserved13: u2,
                ///  Trigger enable and trigger edge selection for injected conversions
                JEXTEN: u2,
                reserved17: u2,
                ///  Software start of a conversion on the regular channel
                RSWSTART: u1,
                ///  Continuous mode selection for regular conversions
                RCONT: u1,
                ///  Launch regular conversion synchronously with DFSDM0
                RSYNC: u1,
                reserved21: u1,
                ///  DMA channel enabled to read data for the regular conversion
                RDMAEN: u1,
                reserved24: u2,
                ///  Regular channel selection
                RCH: u3,
                reserved29: u2,
                ///  Fast conversion mode selection for regular conversions
                FAST: u1,
                ///  Analog watchdog fast mode select
                AWFSEL: u1,
                padding: u1,
            }),
            ///  control register 2
            DFSDM1_CR2: mmio.Mmio(packed struct(u32) {
                ///  Injected end of conversion interrupt enable
                JEOCIE: u1,
                ///  Regular end of conversion interrupt enable
                REOCIE: u1,
                ///  Injected data overrun interrupt enable
                JOVRIE: u1,
                ///  Regular data overrun interrupt enable
                ROVRIE: u1,
                ///  Analog watchdog interrupt enable
                AWDIE: u1,
                ///  Short-circuit detector interrupt enable
                SCDIE: u1,
                ///  Clock absence interrupt enable
                CKABIE: u1,
                reserved8: u1,
                ///  Extremes detector channel selection
                EXCH: u8,
                ///  Analog watchdog channel selection
                AWDCH: u8,
                padding: u8,
            }),
            ///  interrupt and status register
            DFSDM1_ISR: mmio.Mmio(packed struct(u32) {
                ///  End of injected conversion flag
                JEOCF: u1,
                ///  End of regular conversion flag
                REOCF: u1,
                ///  Injected conversion overrun flag
                JOVRF: u1,
                ///  Regular conversion overrun flag
                ROVRF: u1,
                ///  Analog watchdog
                AWDF: u1,
                reserved13: u8,
                ///  Injected conversion in progress status
                JCIP: u1,
                ///  Regular conversion in progress status
                RCIP: u1,
                reserved16: u1,
                ///  Clock absence flag
                CKABF: u8,
                ///  short-circuit detector flag
                SCDF: u8,
            }),
            ///  interrupt flag clear register
            DFSDM1_ICR: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Clear the injected conversion overrun flag
                CLRJOVRF: u1,
                ///  Clear the regular conversion overrun flag
                CLRROVRF: u1,
                reserved16: u12,
                ///  Clear the clock absence flag
                CLRCKABF: u8,
                ///  Clear the short-circuit detector flag
                CLRSCDF: u8,
            }),
            ///  injected channel group selection register
            DFSDM1_JCHGR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel group selection
                JCHG: u8,
                padding: u24,
            }),
            ///  filter control register
            DFSDM1_FCR: mmio.Mmio(packed struct(u32) {
                ///  Integrator oversampling ratio (averaging length)
                IOSR: u8,
                reserved16: u8,
                ///  Sinc filter oversampling ratio (decimation rate)
                FOSR: u10,
                reserved29: u3,
                ///  Sinc filter order
                FORD: u3,
            }),
            ///  data register for injected group
            DFSDM1_JDATAR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel most recently converted
                JDATACH: u3,
                reserved8: u5,
                ///  Injected group conversion data
                JDATA: u24,
            }),
            ///  data register for the regular channel
            DFSDM1_RDATAR: mmio.Mmio(packed struct(u32) {
                ///  Regular channel most recently converted
                RDATACH: u3,
                reserved4: u1,
                ///  Regular channel pending data
                RPEND: u1,
                reserved8: u3,
                ///  Regular channel conversion data
                RDATA: u24,
            }),
            ///  analog watchdog high threshold register
            DFSDM1_AWHTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog high threshold event
                BKAWH: u4,
                reserved8: u4,
                ///  Analog watchdog high threshold
                AWHT: u24,
            }),
            ///  analog watchdog low threshold register
            DFSDM1_AWLTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog low threshold event
                BKAWL: u4,
                reserved8: u4,
                ///  Analog watchdog low threshold
                AWLT: u24,
            }),
            ///  analog watchdog status register
            DFSDM1_AWSR: mmio.Mmio(packed struct(u32) {
                ///  Analog watchdog low threshold flag
                AWLTF: u8,
                ///  Analog watchdog high threshold flag
                AWHTF: u8,
                padding: u16,
            }),
            ///  analog watchdog clear flag register
            DFSDM1_AWCFR: mmio.Mmio(packed struct(u32) {
                ///  Clear the analog watchdog low threshold flag
                CLRAWLTF: u8,
                ///  Clear the analog watchdog high threshold flag
                CLRAWHTF: u8,
                padding: u16,
            }),
            ///  Extremes detector maximum register
            DFSDM1_EXMAX: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector maximum data channel
                EXMAXCH: u3,
                reserved8: u5,
                ///  Extremes detector maximum value
                EXMAX: u24,
            }),
            ///  Extremes detector minimum register
            DFSDM1_EXMIN: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector minimum data channel
                EXMINCH: u3,
                reserved8: u5,
                ///  EXMIN
                EXMIN: u24,
            }),
            ///  conversion timer register
            DFSDM1_CNVTIMR: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  28-bit timer counting conversion time t = CNVCNT[27:0] / fDFSDM_CKIN
                CNVCNT: u28,
            }),
            reserved768: [196]u8,
            ///  control register 1
            DFSDM2_CR1: mmio.Mmio(packed struct(u32) {
                ///  DFSDM enable
                DFEN: u1,
                ///  Start a conversion of the injected group of channels
                JSWSTART: u1,
                reserved3: u1,
                ///  Launch an injected conversion synchronously with the DFSDM0 JSWSTART trigger
                JSYNC: u1,
                ///  Scanning conversion mode for injected conversions
                JSCAN: u1,
                ///  DMA channel enabled to read data for the injected channel group
                JDMAEN: u1,
                reserved8: u2,
                ///  Trigger signal selection for launching injected conversions
                JEXTSEL: u3,
                reserved13: u2,
                ///  Trigger enable and trigger edge selection for injected conversions
                JEXTEN: u2,
                reserved17: u2,
                ///  Software start of a conversion on the regular channel
                RSWSTART: u1,
                ///  Continuous mode selection for regular conversions
                RCONT: u1,
                ///  Launch regular conversion synchronously with DFSDM0
                RSYNC: u1,
                reserved21: u1,
                ///  DMA channel enabled to read data for the regular conversion
                RDMAEN: u1,
                reserved24: u2,
                ///  Regular channel selection
                RCH: u3,
                reserved29: u2,
                ///  Fast conversion mode selection for regular conversions
                FAST: u1,
                ///  Analog watchdog fast mode select
                AWFSEL: u1,
                padding: u1,
            }),
            ///  control register 2
            DFSDM2_CR2: mmio.Mmio(packed struct(u32) {
                ///  Injected end of conversion interrupt enable
                JEOCIE: u1,
                ///  Regular end of conversion interrupt enable
                REOCIE: u1,
                ///  Injected data overrun interrupt enable
                JOVRIE: u1,
                ///  Regular data overrun interrupt enable
                ROVRIE: u1,
                ///  Analog watchdog interrupt enable
                AWDIE: u1,
                ///  Short-circuit detector interrupt enable
                SCDIE: u1,
                ///  Clock absence interrupt enable
                CKABIE: u1,
                reserved8: u1,
                ///  Extremes detector channel selection
                EXCH: u8,
                ///  Analog watchdog channel selection
                AWDCH: u8,
                padding: u8,
            }),
            ///  interrupt and status register
            DFSDM2_ISR: mmio.Mmio(packed struct(u32) {
                ///  End of injected conversion flag
                JEOCF: u1,
                ///  End of regular conversion flag
                REOCF: u1,
                ///  Injected conversion overrun flag
                JOVRF: u1,
                ///  Regular conversion overrun flag
                ROVRF: u1,
                ///  Analog watchdog
                AWDF: u1,
                reserved13: u8,
                ///  Injected conversion in progress status
                JCIP: u1,
                ///  Regular conversion in progress status
                RCIP: u1,
                reserved16: u1,
                ///  Clock absence flag
                CKABF: u8,
                ///  short-circuit detector flag
                SCDF: u8,
            }),
            ///  interrupt flag clear register
            DFSDM2_ICR: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Clear the injected conversion overrun flag
                CLRJOVRF: u1,
                ///  Clear the regular conversion overrun flag
                CLRROVRF: u1,
                reserved16: u12,
                ///  Clear the clock absence flag
                CLRCKABF: u8,
                ///  Clear the short-circuit detector flag
                CLRSCDF: u8,
            }),
            ///  injected channel group selection register
            DFSDM2_JCHGR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel group selection
                JCHG: u8,
                padding: u24,
            }),
            ///  filter control register
            DFSDM2_FCR: mmio.Mmio(packed struct(u32) {
                ///  Integrator oversampling ratio (averaging length)
                IOSR: u8,
                reserved16: u8,
                ///  Sinc filter oversampling ratio (decimation rate)
                FOSR: u10,
                reserved29: u3,
                ///  Sinc filter order
                FORD: u3,
            }),
            ///  data register for injected group
            DFSDM2_JDATAR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel most recently converted
                JDATACH: u3,
                reserved8: u5,
                ///  Injected group conversion data
                JDATA: u24,
            }),
            ///  data register for the regular channel
            DFSDM2_RDATAR: mmio.Mmio(packed struct(u32) {
                ///  Regular channel most recently converted
                RDATACH: u3,
                reserved4: u1,
                ///  Regular channel pending data
                RPEND: u1,
                reserved8: u3,
                ///  Regular channel conversion data
                RDATA: u24,
            }),
            ///  analog watchdog high threshold register
            DFSDM2_AWHTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog high threshold event
                BKAWH: u4,
                reserved8: u4,
                ///  Analog watchdog high threshold
                AWHT: u24,
            }),
            ///  analog watchdog low threshold register
            DFSDM2_AWLTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog low threshold event
                BKAWL: u4,
                reserved8: u4,
                ///  Analog watchdog low threshold
                AWLT: u24,
            }),
            ///  analog watchdog status register
            DFSDM2_AWSR: mmio.Mmio(packed struct(u32) {
                ///  Analog watchdog low threshold flag
                AWLTF: u8,
                ///  Analog watchdog high threshold flag
                AWHTF: u8,
                padding: u16,
            }),
            ///  analog watchdog clear flag register
            DFSDM2_AWCFR: mmio.Mmio(packed struct(u32) {
                ///  Clear the analog watchdog low threshold flag
                CLRAWLTF: u8,
                ///  Clear the analog watchdog high threshold flag
                CLRAWHTF: u8,
                padding: u16,
            }),
            ///  Extremes detector maximum register
            DFSDM2_EXMAX: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector maximum data channel
                EXMAXCH: u3,
                reserved8: u5,
                ///  Extremes detector maximum value
                EXMAX: u24,
            }),
            ///  Extremes detector minimum register
            DFSDM2_EXMIN: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector minimum data channel
                EXMINCH: u3,
                reserved8: u5,
                ///  EXMIN
                EXMIN: u24,
            }),
            ///  conversion timer register
            DFSDM2_CNVTIMR: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  28-bit timer counting conversion time t = CNVCNT[27:0] / fDFSDM_CKIN
                CNVCNT: u28,
            }),
            reserved1024: [196]u8,
            ///  control register 1
            DFSDM3_CR1: mmio.Mmio(packed struct(u32) {
                ///  DFSDM enable
                DFEN: u1,
                ///  Start a conversion of the injected group of channels
                JSWSTART: u1,
                reserved3: u1,
                ///  Launch an injected conversion synchronously with the DFSDM0 JSWSTART trigger
                JSYNC: u1,
                ///  Scanning conversion mode for injected conversions
                JSCAN: u1,
                ///  DMA channel enabled to read data for the injected channel group
                JDMAEN: u1,
                reserved8: u2,
                ///  Trigger signal selection for launching injected conversions
                JEXTSEL: u3,
                reserved13: u2,
                ///  Trigger enable and trigger edge selection for injected conversions
                JEXTEN: u2,
                reserved17: u2,
                ///  Software start of a conversion on the regular channel
                RSWSTART: u1,
                ///  Continuous mode selection for regular conversions
                RCONT: u1,
                ///  Launch regular conversion synchronously with DFSDM0
                RSYNC: u1,
                reserved21: u1,
                ///  DMA channel enabled to read data for the regular conversion
                RDMAEN: u1,
                reserved24: u2,
                ///  Regular channel selection
                RCH: u3,
                reserved29: u2,
                ///  Fast conversion mode selection for regular conversions
                FAST: u1,
                ///  Analog watchdog fast mode select
                AWFSEL: u1,
                padding: u1,
            }),
            ///  control register 2
            DFSDM3_CR2: mmio.Mmio(packed struct(u32) {
                ///  Injected end of conversion interrupt enable
                JEOCIE: u1,
                ///  Regular end of conversion interrupt enable
                REOCIE: u1,
                ///  Injected data overrun interrupt enable
                JOVRIE: u1,
                ///  Regular data overrun interrupt enable
                ROVRIE: u1,
                ///  Analog watchdog interrupt enable
                AWDIE: u1,
                ///  Short-circuit detector interrupt enable
                SCDIE: u1,
                ///  Clock absence interrupt enable
                CKABIE: u1,
                reserved8: u1,
                ///  Extremes detector channel selection
                EXCH: u8,
                ///  Analog watchdog channel selection
                AWDCH: u8,
                padding: u8,
            }),
            ///  interrupt and status register
            DFSDM3_ISR: mmio.Mmio(packed struct(u32) {
                ///  End of injected conversion flag
                JEOCF: u1,
                ///  End of regular conversion flag
                REOCF: u1,
                ///  Injected conversion overrun flag
                JOVRF: u1,
                ///  Regular conversion overrun flag
                ROVRF: u1,
                ///  Analog watchdog
                AWDF: u1,
                reserved13: u8,
                ///  Injected conversion in progress status
                JCIP: u1,
                ///  Regular conversion in progress status
                RCIP: u1,
                reserved16: u1,
                ///  Clock absence flag
                CKABF: u8,
                ///  short-circuit detector flag
                SCDF: u8,
            }),
            ///  interrupt flag clear register
            DFSDM3_ICR: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Clear the injected conversion overrun flag
                CLRJOVRF: u1,
                ///  Clear the regular conversion overrun flag
                CLRROVRF: u1,
                reserved16: u12,
                ///  Clear the clock absence flag
                CLRCKABF: u8,
                ///  Clear the short-circuit detector flag
                CLRSCDF: u8,
            }),
            ///  injected channel group selection register
            DFSDM3_JCHGR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel group selection
                JCHG: u8,
                padding: u24,
            }),
            ///  filter control register
            DFSDM3_FCR: mmio.Mmio(packed struct(u32) {
                ///  Integrator oversampling ratio (averaging length)
                IOSR: u8,
                reserved16: u8,
                ///  Sinc filter oversampling ratio (decimation rate)
                FOSR: u10,
                reserved29: u3,
                ///  Sinc filter order
                FORD: u3,
            }),
            ///  data register for injected group
            DFSDM3_JDATAR: mmio.Mmio(packed struct(u32) {
                ///  Injected channel most recently converted
                JDATACH: u3,
                reserved8: u5,
                ///  Injected group conversion data
                JDATA: u24,
            }),
            ///  data register for the regular channel
            DFSDM3_RDATAR: mmio.Mmio(packed struct(u32) {
                ///  Regular channel most recently converted
                RDATACH: u3,
                reserved4: u1,
                ///  Regular channel pending data
                RPEND: u1,
                reserved8: u3,
                ///  Regular channel conversion data
                RDATA: u24,
            }),
            ///  analog watchdog high threshold register
            DFSDM3_AWHTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog high threshold event
                BKAWH: u4,
                reserved8: u4,
                ///  Analog watchdog high threshold
                AWHT: u24,
            }),
            ///  analog watchdog low threshold register
            DFSDM3_AWLTR: mmio.Mmio(packed struct(u32) {
                ///  Break signal assignment to analog watchdog low threshold event
                BKAWL: u4,
                reserved8: u4,
                ///  Analog watchdog low threshold
                AWLT: u24,
            }),
            ///  analog watchdog status register
            DFSDM3_AWSR: mmio.Mmio(packed struct(u32) {
                ///  Analog watchdog low threshold flag
                AWLTF: u8,
                ///  Analog watchdog high threshold flag
                AWHTF: u8,
                padding: u16,
            }),
            ///  analog watchdog clear flag register
            DFSDM3_AWCFR: mmio.Mmio(packed struct(u32) {
                ///  Clear the analog watchdog low threshold flag
                CLRAWLTF: u8,
                ///  Clear the analog watchdog high threshold flag
                CLRAWHTF: u8,
                padding: u16,
            }),
            ///  Extremes detector maximum register
            DFSDM3_EXMAX: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector maximum data channel
                EXMAXCH: u3,
                reserved8: u5,
                ///  Extremes detector maximum value
                EXMAX: u24,
            }),
            ///  Extremes detector minimum register
            DFSDM3_EXMIN: mmio.Mmio(packed struct(u32) {
                ///  Extremes detector minimum data channel
                EXMINCH: u3,
                reserved8: u5,
                ///  EXMIN
                EXMIN: u24,
            }),
            ///  conversion timer register
            DFSDM3_CNVTIMR: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  28-bit timer counting conversion time t = CNVCNT[27:0] / fDFSDM_CKIN
                CNVCNT: u28,
            }),
        };

        ///  Flexible memory controller
        pub const FMC = extern struct {
            ///  SRAM/NOR-Flash chip-select control register 1
            BCR1: mmio.Mmio(packed struct(u32) {
                ///  MBKEN
                MBKEN: u1,
                ///  MUXEN
                MUXEN: u1,
                ///  MTYP
                MTYP: u2,
                ///  MWID
                MWID: u2,
                ///  FACCEN
                FACCEN: u1,
                reserved8: u1,
                ///  BURSTEN
                BURSTEN: u1,
                ///  WAITPOL
                WAITPOL: u1,
                reserved11: u1,
                ///  WAITCFG
                WAITCFG: u1,
                ///  WREN
                WREN: u1,
                ///  WAITEN
                WAITEN: u1,
                ///  EXTMOD
                EXTMOD: u1,
                ///  ASYNCWAIT
                ASYNCWAIT: u1,
                reserved19: u3,
                ///  CBURSTRW
                CBURSTRW: u1,
                ///  CCLKEN
                CCLKEN: u1,
                ///  Write FIFO Disable
                WFDIS: u1,
                padding: u10,
            }),
            ///  SRAM/NOR-Flash chip-select timing register 1
            BTR1: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                ///  BUSTURN
                BUSTURN: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            ///  SRAM/NOR-Flash chip-select control register 2
            BCR2: mmio.Mmio(packed struct(u32) {
                ///  MBKEN
                MBKEN: u1,
                ///  MUXEN
                MUXEN: u1,
                ///  MTYP
                MTYP: u2,
                ///  MWID
                MWID: u2,
                ///  FACCEN
                FACCEN: u1,
                reserved8: u1,
                ///  BURSTEN
                BURSTEN: u1,
                ///  WAITPOL
                WAITPOL: u1,
                ///  WRAPMOD
                WRAPMOD: u1,
                ///  WAITCFG
                WAITCFG: u1,
                ///  WREN
                WREN: u1,
                ///  WAITEN
                WAITEN: u1,
                ///  EXTMOD
                EXTMOD: u1,
                ///  ASYNCWAIT
                ASYNCWAIT: u1,
                reserved19: u3,
                ///  CBURSTRW
                CBURSTRW: u1,
                padding: u12,
            }),
            ///  SRAM/NOR-Flash chip-select timing register 2
            BTR2: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                ///  BUSTURN
                BUSTURN: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            ///  SRAM/NOR-Flash chip-select control register 3
            BCR3: mmio.Mmio(packed struct(u32) {
                ///  MBKEN
                MBKEN: u1,
                ///  MUXEN
                MUXEN: u1,
                ///  MTYP
                MTYP: u2,
                ///  MWID
                MWID: u2,
                ///  FACCEN
                FACCEN: u1,
                reserved8: u1,
                ///  BURSTEN
                BURSTEN: u1,
                ///  WAITPOL
                WAITPOL: u1,
                ///  WRAPMOD
                WRAPMOD: u1,
                ///  WAITCFG
                WAITCFG: u1,
                ///  WREN
                WREN: u1,
                ///  WAITEN
                WAITEN: u1,
                ///  EXTMOD
                EXTMOD: u1,
                ///  ASYNCWAIT
                ASYNCWAIT: u1,
                reserved19: u3,
                ///  CBURSTRW
                CBURSTRW: u1,
                padding: u12,
            }),
            ///  SRAM/NOR-Flash chip-select timing register 3
            BTR3: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                ///  BUSTURN
                BUSTURN: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            ///  SRAM/NOR-Flash chip-select control register 4
            BCR4: mmio.Mmio(packed struct(u32) {
                ///  MBKEN
                MBKEN: u1,
                ///  MUXEN
                MUXEN: u1,
                ///  MTYP
                MTYP: u2,
                ///  MWID
                MWID: u2,
                ///  FACCEN
                FACCEN: u1,
                reserved8: u1,
                ///  BURSTEN
                BURSTEN: u1,
                ///  WAITPOL
                WAITPOL: u1,
                ///  WRAPMOD
                WRAPMOD: u1,
                ///  WAITCFG
                WAITCFG: u1,
                ///  WREN
                WREN: u1,
                ///  WAITEN
                WAITEN: u1,
                ///  EXTMOD
                EXTMOD: u1,
                ///  ASYNCWAIT
                ASYNCWAIT: u1,
                reserved19: u3,
                ///  CBURSTRW
                CBURSTRW: u1,
                padding: u12,
            }),
            ///  SRAM/NOR-Flash chip-select timing register 4
            BTR4: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                ///  BUSTURN
                BUSTURN: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            reserved128: [96]u8,
            ///  PC Card/NAND Flash control register 3
            PCR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  PWAITEN
                PWAITEN: u1,
                ///  PBKEN
                PBKEN: u1,
                ///  PTYP
                PTYP: u1,
                ///  PWID
                PWID: u2,
                ///  ECCEN
                ECCEN: u1,
                reserved9: u2,
                ///  TCLR
                TCLR: u4,
                ///  TAR
                TAR: u4,
                ///  ECCPS
                ECCPS: u3,
                padding: u12,
            }),
            ///  FIFO status and interrupt register 3
            SR: mmio.Mmio(packed struct(u32) {
                ///  IRS
                IRS: u1,
                ///  ILS
                ILS: u1,
                ///  IFS
                IFS: u1,
                ///  IREN
                IREN: u1,
                ///  ILEN
                ILEN: u1,
                ///  IFEN
                IFEN: u1,
                ///  FEMPT
                FEMPT: u1,
                padding: u25,
            }),
            ///  Common memory space timing register 3
            PMEM: mmio.Mmio(packed struct(u32) {
                ///  MEMSETx
                MEMSETx: u8,
                ///  MEMWAITx
                MEMWAITx: u8,
                ///  MEMHOLDx
                MEMHOLDx: u8,
                ///  MEMHIZx
                MEMHIZx: u8,
            }),
            ///  Attribute memory space timing register 3
            PATT: mmio.Mmio(packed struct(u32) {
                ///  ATTSETx
                ATTSETx: u8,
                ///  ATTWAITx
                ATTWAITx: u8,
                ///  ATTHOLDx
                ATTHOLDx: u8,
                ///  ATTHIZx
                ATTHIZx: u8,
            }),
            reserved148: [4]u8,
            ///  ECC result register 3
            ECCR: mmio.Mmio(packed struct(u32) {
                ///  ECCx
                ECCx: u32,
            }),
            reserved260: [108]u8,
            ///  SRAM/NOR-Flash write timing registers 1
            BWTR1: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                reserved20: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            reserved268: [4]u8,
            ///  SRAM/NOR-Flash write timing registers 2
            BWTR2: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                reserved20: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            reserved276: [4]u8,
            ///  SRAM/NOR-Flash write timing registers 3
            BWTR3: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                reserved20: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
            reserved284: [4]u8,
            ///  SRAM/NOR-Flash write timing registers 4
            BWTR4: mmio.Mmio(packed struct(u32) {
                ///  ADDSET
                ADDSET: u4,
                ///  ADDHLD
                ADDHLD: u4,
                ///  DATAST
                DATAST: u8,
                reserved20: u4,
                ///  CLKDIV
                CLKDIV: u4,
                ///  DATLAT
                DATLAT: u4,
                ///  ACCMOD
                ACCMOD: u2,
                padding: u2,
            }),
        };

        ///  QuadSPI interface
        pub const QUADSPI = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Enable
                EN: u1,
                ///  Abort request
                ABORT: u1,
                ///  DMA enable
                DMAEN: u1,
                ///  Timeout counter enable
                TCEN: u1,
                ///  Sample shift
                SSHIFT: u1,
                reserved6: u1,
                ///  Dual-flash mode
                DFM: u1,
                ///  FLASH memory selection
                FSEL: u1,
                ///  IFO threshold level
                FTHRES: u5,
                reserved16: u3,
                ///  Transfer error interrupt enable
                TEIE: u1,
                ///  Transfer complete interrupt enable
                TCIE: u1,
                ///  FIFO threshold interrupt enable
                FTIE: u1,
                ///  Status match interrupt enable
                SMIE: u1,
                ///  TimeOut interrupt enable
                TOIE: u1,
                reserved22: u1,
                ///  Automatic poll mode stop
                APMS: u1,
                ///  Polling match mode
                PMM: u1,
                ///  Clock prescaler
                PRESCALER: u8,
            }),
            ///  device configuration register
            DCR: mmio.Mmio(packed struct(u32) {
                ///  Mode 0 / mode 3
                CKMODE: u1,
                reserved8: u7,
                ///  Chip select high time
                CSHT: u3,
                reserved16: u5,
                ///  FLASH memory size
                FSIZE: u5,
                padding: u11,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Transfer error flag
                TEF: u1,
                ///  Transfer complete flag
                TCF: u1,
                ///  FIFO threshold flag
                FTF: u1,
                ///  Status match flag
                SMF: u1,
                ///  Timeout flag
                TOF: u1,
                ///  Busy
                BUSY: u1,
                reserved8: u2,
                ///  FIFO level
                FLEVEL: u7,
                padding: u17,
            }),
            ///  flag clear register
            FCR: mmio.Mmio(packed struct(u32) {
                ///  Clear transfer error flag
                CTEF: u1,
                ///  Clear transfer complete flag
                CTCF: u1,
                reserved3: u1,
                ///  Clear status match flag
                CSMF: u1,
                ///  Clear timeout flag
                CTOF: u1,
                padding: u27,
            }),
            ///  data length register
            DLR: mmio.Mmio(packed struct(u32) {
                ///  Data length
                DL: u32,
            }),
            ///  communication configuration register
            CCR: mmio.Mmio(packed struct(u32) {
                ///  Instruction
                INSTRUCTION: u8,
                ///  Instruction mode
                IMODE: u2,
                ///  Address mode
                ADMODE: u2,
                ///  Address size
                ADSIZE: u2,
                ///  Alternate bytes mode
                ABMODE: u2,
                ///  Alternate bytes size
                ABSIZE: u2,
                ///  Number of dummy cycles
                DCYC: u5,
                reserved24: u1,
                ///  Data mode
                DMODE: u2,
                ///  Functional mode
                FMODE: u2,
                ///  Send instruction only once mode
                SIOO: u1,
                reserved30: u1,
                ///  DDR hold half cycle
                DHHC: u1,
                ///  Double data rate mode
                DDRM: u1,
            }),
            ///  address register
            AR: mmio.Mmio(packed struct(u32) {
                ///  Address
                ADDRESS: u32,
            }),
            ///  ABR
            ABR: mmio.Mmio(packed struct(u32) {
                ///  ALTERNATE
                ALTERNATE: u32,
            }),
            ///  data register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Data
                DATA: u32,
            }),
            ///  polling status mask register
            PSMKR: mmio.Mmio(packed struct(u32) {
                ///  Status mask
                MASK: u32,
            }),
            ///  polling status match register
            PSMAR: mmio.Mmio(packed struct(u32) {
                ///  Status match
                MATCH: u32,
            }),
            ///  polling interval register
            PIR: mmio.Mmio(packed struct(u32) {
                ///  Polling interval
                INTERVAL: u16,
                padding: u16,
            }),
            ///  low-power timeout register
            LPTR: mmio.Mmio(packed struct(u32) {
                ///  Timeout period
                TIMEOUT: u16,
                padding: u16,
            }),
        };

        ///  General purpose timers
        pub const TIM15 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                CEN: u1,
                ///  Update disable
                UDIS: u1,
                ///  Update request source
                URS: u1,
                ///  One-pulse mode
                OPM: u1,
                reserved7: u3,
                ///  Auto-reload preload enable
                ARPE: u1,
                ///  Clock division
                CKD: u2,
                reserved11: u1,
                ///  UIF status bit remapping
                UIFREMAP: u1,
                padding: u20,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Capture/compare preloaded control
                CCPC: u1,
                reserved2: u1,
                ///  Capture/compare control update selection
                CCUS: u1,
                ///  Capture/compare DMA selection
                CCDS: u1,
                reserved8: u4,
                ///  Output Idle state 1
                OIS1: u1,
                ///  Output Idle state 1
                OIS1N: u1,
                padding: u22,
            }),
            reserved12: [4]u8,
            ///  DMA/Interrupt enable register
            DIER: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt enable
                UIE: u1,
                ///  Capture/Compare 1 interrupt enable
                CC1IE: u1,
                reserved5: u3,
                ///  COM interrupt enable
                COMIE: u1,
                ///  Trigger interrupt enable
                TIE: u1,
                ///  Break interrupt enable
                BIE: u1,
                ///  Update DMA request enable
                UDE: u1,
                ///  Capture/Compare 1 DMA request enable
                CC1DE: u1,
                reserved13: u3,
                ///  COM DMA request enable
                COMDE: u1,
                ///  Trigger DMA request enable
                TDE: u1,
                padding: u17,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt flag
                UIF: u1,
                ///  Capture/compare 1 interrupt flag
                CC1IF: u1,
                reserved5: u3,
                ///  COM interrupt flag
                COMIF: u1,
                ///  Trigger interrupt flag
                TIF: u1,
                ///  Break interrupt flag
                BIF: u1,
                reserved9: u1,
                ///  Capture/Compare 1 overcapture flag
                CC1OF: u1,
                padding: u22,
            }),
            ///  event generation register
            EGR: mmio.Mmio(packed struct(u32) {
                ///  Update generation
                UG: u1,
                ///  Capture/compare 1 generation
                CC1G: u1,
                reserved5: u3,
                ///  Capture/Compare control update generation
                COMG: u1,
                ///  Trigger generation
                TG: u1,
                ///  Break generation
                BG: u1,
                padding: u24,
            }),
            ///  capture/compare mode register (output mode)
            CCMR1_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 selection
                CC1S: u2,
                ///  Output Compare 1 fast enable
                OC1FE: u1,
                ///  Output Compare 1 preload enable
                OC1PE: u1,
                ///  Output Compare 1 mode
                OC1M: u3,
                reserved16: u9,
                ///  Output Compare 1 mode
                OC1M_2: u1,
                padding: u15,
            }),
            reserved32: [4]u8,
            ///  capture/compare enable register
            CCER: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 output enable
                CC1E: u1,
                ///  Capture/Compare 1 output Polarity
                CC1P: u1,
                ///  Capture/Compare 1 complementary output enable
                CC1NE: u1,
                ///  Capture/Compare 1 output Polarity
                CC1NP: u1,
                padding: u28,
            }),
            ///  counter
            CNT: mmio.Mmio(packed struct(u32) {
                ///  counter value
                CNT: u16,
                reserved31: u15,
                ///  UIF Copy
                UIFCPY: u1,
            }),
            ///  prescaler
            PSC: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u16,
                padding: u16,
            }),
            ///  auto-reload register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Auto-reload value
                ARR: u16,
                padding: u16,
            }),
            ///  repetition counter register
            RCR: mmio.Mmio(packed struct(u32) {
                ///  Repetition counter value
                REP: u8,
                padding: u24,
            }),
            ///  capture/compare register 1
            CCR1: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 value
                CCR1: u16,
                padding: u16,
            }),
            reserved68: [12]u8,
            ///  break and dead-time register
            BDTR: mmio.Mmio(packed struct(u32) {
                ///  Dead-time generator setup
                DTG: u8,
                ///  Lock configuration
                LOCK: u2,
                ///  Off-state selection for Idle mode
                OSSI: u1,
                ///  Off-state selection for Run mode
                OSSR: u1,
                ///  Break enable
                BKE: u1,
                ///  Break polarity
                BKP: u1,
                ///  Automatic output enable
                AOE: u1,
                ///  Main output enable
                MOE: u1,
                ///  Break filter
                BKF: u4,
                padding: u12,
            }),
            ///  DMA control register
            DCR: mmio.Mmio(packed struct(u32) {
                ///  DMA base address
                DBA: u5,
                reserved8: u3,
                ///  DMA burst length
                DBL: u5,
                padding: u19,
            }),
            ///  DMA address for full transfer
            DMAR: mmio.Mmio(packed struct(u32) {
                ///  DMA register for burst accesses
                DMAB: u16,
                padding: u16,
            }),
        };

        ///  General purpose timers
        pub const TIM16 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                CEN: u1,
                ///  Update disable
                UDIS: u1,
                ///  Update request source
                URS: u1,
                ///  One-pulse mode
                OPM: u1,
                reserved7: u3,
                ///  Auto-reload preload enable
                ARPE: u1,
                ///  Clock division
                CKD: u2,
                reserved11: u1,
                ///  UIF status bit remapping
                UIFREMAP: u1,
                padding: u20,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Capture/compare preloaded control
                CCPC: u1,
                reserved2: u1,
                ///  Capture/compare control update selection
                CCUS: u1,
                ///  Capture/compare DMA selection
                CCDS: u1,
                reserved8: u4,
                ///  Output Idle state 1
                OIS1: u1,
                ///  Output Idle state 1
                OIS1N: u1,
                padding: u22,
            }),
            reserved12: [4]u8,
            ///  DMA/Interrupt enable register
            DIER: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt enable
                UIE: u1,
                ///  Capture/Compare 1 interrupt enable
                CC1IE: u1,
                reserved5: u3,
                ///  COM interrupt enable
                COMIE: u1,
                ///  Trigger interrupt enable
                TIE: u1,
                ///  Break interrupt enable
                BIE: u1,
                ///  Update DMA request enable
                UDE: u1,
                ///  Capture/Compare 1 DMA request enable
                CC1DE: u1,
                reserved13: u3,
                ///  COM DMA request enable
                COMDE: u1,
                ///  Trigger DMA request enable
                TDE: u1,
                padding: u17,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt flag
                UIF: u1,
                ///  Capture/compare 1 interrupt flag
                CC1IF: u1,
                reserved5: u3,
                ///  COM interrupt flag
                COMIF: u1,
                ///  Trigger interrupt flag
                TIF: u1,
                ///  Break interrupt flag
                BIF: u1,
                reserved9: u1,
                ///  Capture/Compare 1 overcapture flag
                CC1OF: u1,
                padding: u22,
            }),
            ///  event generation register
            EGR: mmio.Mmio(packed struct(u32) {
                ///  Update generation
                UG: u1,
                ///  Capture/compare 1 generation
                CC1G: u1,
                reserved5: u3,
                ///  Capture/Compare control update generation
                COMG: u1,
                ///  Trigger generation
                TG: u1,
                ///  Break generation
                BG: u1,
                padding: u24,
            }),
            ///  capture/compare mode register (output mode)
            CCMR1_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 selection
                CC1S: u2,
                ///  Output Compare 1 fast enable
                OC1FE: u1,
                ///  Output Compare 1 preload enable
                OC1PE: u1,
                ///  Output Compare 1 mode
                OC1M: u3,
                reserved16: u9,
                ///  Output Compare 1 mode
                OC1M_2: u1,
                padding: u15,
            }),
            reserved32: [4]u8,
            ///  capture/compare enable register
            CCER: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 output enable
                CC1E: u1,
                ///  Capture/Compare 1 output Polarity
                CC1P: u1,
                ///  Capture/Compare 1 complementary output enable
                CC1NE: u1,
                ///  Capture/Compare 1 output Polarity
                CC1NP: u1,
                padding: u28,
            }),
            ///  counter
            CNT: mmio.Mmio(packed struct(u32) {
                ///  counter value
                CNT: u16,
                reserved31: u15,
                ///  UIF Copy
                UIFCPY: u1,
            }),
            ///  prescaler
            PSC: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u16,
                padding: u16,
            }),
            ///  auto-reload register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Auto-reload value
                ARR: u16,
                padding: u16,
            }),
            ///  repetition counter register
            RCR: mmio.Mmio(packed struct(u32) {
                ///  Repetition counter value
                REP: u8,
                padding: u24,
            }),
            ///  capture/compare register 1
            CCR1: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 value
                CCR1: u16,
                padding: u16,
            }),
            reserved68: [12]u8,
            ///  break and dead-time register
            BDTR: mmio.Mmio(packed struct(u32) {
                ///  Dead-time generator setup
                DTG: u8,
                ///  Lock configuration
                LOCK: u2,
                ///  Off-state selection for Idle mode
                OSSI: u1,
                ///  Off-state selection for Run mode
                OSSR: u1,
                ///  Break enable
                BKE: u1,
                ///  Break polarity
                BKP: u1,
                ///  Automatic output enable
                AOE: u1,
                ///  Main output enable
                MOE: u1,
                ///  Break filter
                BKF: u4,
                padding: u12,
            }),
            ///  DMA control register
            DCR: mmio.Mmio(packed struct(u32) {
                ///  DMA base address
                DBA: u5,
                reserved8: u3,
                ///  DMA burst length
                DBL: u5,
                padding: u19,
            }),
            ///  DMA address for full transfer
            DMAR: mmio.Mmio(packed struct(u32) {
                ///  DMA register for burst accesses
                DMAB: u16,
                padding: u16,
            }),
            ///  TIM16 option register 1
            OR1: mmio.Mmio(packed struct(u32) {
                ///  Input capture 1 remap
                TI1_RMP: u2,
                padding: u30,
            }),
            reserved96: [12]u8,
            ///  TIM17 option register 1
            OR2: mmio.Mmio(packed struct(u32) {
                ///  BRK BKIN input enable
                BKINE: u1,
                ///  BRK COMP1 enable
                BKCMP1E: u1,
                ///  BRK COMP2 enable
                BKCMP2E: u1,
                reserved8: u5,
                ///  BRK DFSDM_BREAK1 enable
                BKDFBK1E: u1,
                ///  BRK BKIN input polarity
                BKINP: u1,
                ///  BRK COMP1 input polarity
                BKCMP1P: u1,
                ///  BRK COMP2 input polarit
                BKCMP2P: u1,
                padding: u20,
            }),
        };

        ///  Universal serial bus full-speed device interface
        pub const USB = extern struct {
            ///  endpoint 0 register
            EP0R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 1 register
            EP1R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 2 register
            EP2R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 3 register
            EP3R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 4 register
            EP4R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 5 register
            EP5R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 6 register
            EP6R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            ///  endpoint 7 register
            EP7R: mmio.Mmio(packed struct(u32) {
                ///  Endpoint address
                EA: u4,
                ///  Status bits, for transmission transfers
                STAT_TX: u2,
                ///  Data Toggle, for transmission transfers
                DTOG_TX: u1,
                ///  Correct Transfer for transmission
                CTR_TX: u1,
                ///  Endpoint kind
                EP_KIND: u1,
                ///  Endpoint type
                EP_TYPE: u2,
                ///  Setup transaction completed
                SETUP: u1,
                ///  Status bits, for reception transfers
                STAT_RX: u2,
                ///  Data Toggle, for reception transfers
                DTOG_RX: u1,
                ///  Correct transfer for reception
                CTR_RX: u1,
                padding: u16,
            }),
            reserved64: [32]u8,
            ///  control register
            CNTR: mmio.Mmio(packed struct(u32) {
                ///  Force USB Reset
                FRES: u1,
                ///  Power down
                PDWN: u1,
                ///  Low-power mode
                LPMODE: u1,
                ///  Force suspend
                FSUSP: u1,
                ///  Resume request
                RESUME: u1,
                ///  LPM L1 Resume request
                L1RESUME: u1,
                reserved7: u1,
                ///  LPM L1 state request interrupt mask
                L1REQM: u1,
                ///  Expected start of frame interrupt mask
                ESOFM: u1,
                ///  Start of frame interrupt mask
                SOFM: u1,
                ///  USB reset interrupt mask
                RESETM: u1,
                ///  Suspend mode interrupt mask
                SUSPM: u1,
                ///  Wakeup interrupt mask
                WKUPM: u1,
                ///  Error interrupt mask
                ERRM: u1,
                ///  Packet memory area over / underrun interrupt mask
                PMAOVRM: u1,
                ///  Correct transfer interrupt mask
                CTRM: u1,
                padding: u16,
            }),
            ///  interrupt status register
            ISTR: mmio.Mmio(packed struct(u32) {
                ///  Endpoint Identifier
                EP_ID: u4,
                ///  Direction of transaction
                DIR: u1,
                reserved7: u2,
                ///  LPM L1 state request
                L1REQ: u1,
                ///  Expected start frame
                ESOF: u1,
                ///  start of frame
                SOF: u1,
                ///  reset request
                RESET: u1,
                ///  Suspend mode request
                SUSP: u1,
                ///  Wakeup
                WKUP: u1,
                ///  Error
                ERR: u1,
                ///  Packet memory area over / underrun
                PMAOVR: u1,
                ///  Correct transfer
                CTR: u1,
                padding: u16,
            }),
            ///  frame number register
            FNR: mmio.Mmio(packed struct(u32) {
                ///  Frame number
                FN: u11,
                ///  Lost SOF
                LSOF: u2,
                ///  Locked
                LCK: u1,
                ///  Receive data - line status
                RXDM: u1,
                ///  Receive data + line status
                RXDP: u1,
                padding: u16,
            }),
            ///  device address
            DADDR: mmio.Mmio(packed struct(u32) {
                ///  Device address
                ADD: u7,
                ///  Enable function
                EF: u1,
                padding: u24,
            }),
            ///  Buffer table address
            BTABLE: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Buffer table
                BTABLE: u13,
                padding: u16,
            }),
        };

        ///  Advanced-timers
        pub const TIM1 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                CEN: u1,
                ///  Update disable
                UDIS: u1,
                ///  Update request source
                URS: u1,
                ///  One-pulse mode
                OPM: u1,
                ///  Direction
                DIR: u1,
                ///  Center-aligned mode selection
                CMS: u2,
                ///  Auto-reload preload enable
                ARPE: u1,
                ///  Clock division
                CKD: u2,
                padding: u22,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Capture/compare preloaded control
                CCPC: u1,
                reserved2: u1,
                ///  Capture/compare control update selection
                CCUS: u1,
                ///  Capture/compare DMA selection
                CCDS: u1,
                ///  Master mode selection
                MMS: u3,
                ///  TI1 selection
                TI1S: u1,
                ///  Output Idle state 1
                OIS1: u1,
                ///  Output Idle state 1
                OIS1N: u1,
                ///  Output Idle state 2
                OIS2: u1,
                ///  Output Idle state 2
                OIS2N: u1,
                ///  Output Idle state 3
                OIS3: u1,
                ///  Output Idle state 3
                OIS3N: u1,
                ///  Output Idle state 4
                OIS4: u1,
                padding: u17,
            }),
            ///  slave mode control register
            SMCR: mmio.Mmio(packed struct(u32) {
                ///  Slave mode selection
                SMS: u3,
                reserved4: u1,
                ///  Trigger selection
                TS: u3,
                ///  Master/Slave mode
                MSM: u1,
                ///  External trigger filter
                ETF: u4,
                ///  External trigger prescaler
                ETPS: u2,
                ///  External clock enable
                ECE: u1,
                ///  External trigger polarity
                ETP: u1,
                padding: u16,
            }),
            ///  DMA/Interrupt enable register
            DIER: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt enable
                UIE: u1,
                ///  Capture/Compare 1 interrupt enable
                CC1IE: u1,
                ///  Capture/Compare 2 interrupt enable
                CC2IE: u1,
                ///  Capture/Compare 3 interrupt enable
                CC3IE: u1,
                ///  Capture/Compare 4 interrupt enable
                CC4IE: u1,
                ///  COM interrupt enable
                COMIE: u1,
                ///  Trigger interrupt enable
                TIE: u1,
                ///  Break interrupt enable
                BIE: u1,
                ///  Update DMA request enable
                UDE: u1,
                ///  Capture/Compare 1 DMA request enable
                CC1DE: u1,
                ///  Capture/Compare 2 DMA request enable
                CC2DE: u1,
                ///  Capture/Compare 3 DMA request enable
                CC3DE: u1,
                ///  Capture/Compare 4 DMA request enable
                CC4DE: u1,
                ///  COM DMA request enable
                COMDE: u1,
                ///  Trigger DMA request enable
                TDE: u1,
                padding: u17,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt flag
                UIF: u1,
                ///  Capture/compare 1 interrupt flag
                CC1IF: u1,
                ///  Capture/Compare 2 interrupt flag
                CC2IF: u1,
                ///  Capture/Compare 3 interrupt flag
                CC3IF: u1,
                ///  Capture/Compare 4 interrupt flag
                CC4IF: u1,
                ///  COM interrupt flag
                COMIF: u1,
                ///  Trigger interrupt flag
                TIF: u1,
                ///  Break interrupt flag
                BIF: u1,
                reserved9: u1,
                ///  Capture/Compare 1 overcapture flag
                CC1OF: u1,
                ///  Capture/compare 2 overcapture flag
                CC2OF: u1,
                ///  Capture/Compare 3 overcapture flag
                CC3OF: u1,
                ///  Capture/Compare 4 overcapture flag
                CC4OF: u1,
                padding: u19,
            }),
            ///  event generation register
            EGR: mmio.Mmio(packed struct(u32) {
                ///  Update generation
                UG: u1,
                ///  Capture/compare 1 generation
                CC1G: u1,
                ///  Capture/compare 2 generation
                CC2G: u1,
                ///  Capture/compare 3 generation
                CC3G: u1,
                ///  Capture/compare 4 generation
                CC4G: u1,
                ///  Capture/Compare control update generation
                COMG: u1,
                ///  Trigger generation
                TG: u1,
                ///  Break generation
                BG: u1,
                padding: u24,
            }),
            ///  capture/compare mode register 1 (output mode)
            CCMR1_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 selection
                CC1S: u2,
                ///  Output Compare 1 fast enable
                OC1FE: u1,
                ///  Output Compare 1 preload enable
                OC1PE: u1,
                ///  Output Compare 1 mode
                OC1M: u3,
                ///  Output Compare 1 clear enable
                OC1CE: u1,
                ///  Capture/Compare 2 selection
                CC2S: u2,
                ///  Output Compare 2 fast enable
                OC2FE: u1,
                ///  Output Compare 2 preload enable
                OC2PE: u1,
                ///  Output Compare 2 mode
                OC2M: u3,
                ///  Output Compare 2 clear enable
                OC2CE: u1,
                padding: u16,
            }),
            ///  capture/compare mode register 2 (output mode)
            CCMR2_Output: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 3 selection
                CC3S: u2,
                ///  Output compare 3 fast enable
                OC3FE: u1,
                ///  Output compare 3 preload enable
                OC3PE: u1,
                ///  Output compare 3 mode
                OC3M: u3,
                ///  Output compare 3 clear enable
                OC3CE: u1,
                ///  Capture/Compare 4 selection
                CC4S: u2,
                ///  Output compare 4 fast enable
                OC4FE: u1,
                ///  Output compare 4 preload enable
                OC4PE: u1,
                ///  Output compare 4 mode
                OC4M: u3,
                ///  Output compare 4 clear enable
                OC4CE: u1,
                padding: u16,
            }),
            ///  capture/compare enable register
            CCER: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 output enable
                CC1E: u1,
                ///  Capture/Compare 1 output Polarity
                CC1P: u1,
                ///  Capture/Compare 1 complementary output enable
                CC1NE: u1,
                ///  Capture/Compare 1 output Polarity
                CC1NP: u1,
                ///  Capture/Compare 2 output enable
                CC2E: u1,
                ///  Capture/Compare 2 output Polarity
                CC2P: u1,
                ///  Capture/Compare 2 complementary output enable
                CC2NE: u1,
                ///  Capture/Compare 2 output Polarity
                CC2NP: u1,
                ///  Capture/Compare 3 output enable
                CC3E: u1,
                ///  Capture/Compare 3 output Polarity
                CC3P: u1,
                ///  Capture/Compare 3 complementary output enable
                CC3NE: u1,
                ///  Capture/Compare 3 output Polarity
                CC3NP: u1,
                ///  Capture/Compare 4 output enable
                CC4E: u1,
                ///  Capture/Compare 3 output Polarity
                CC4P: u1,
                padding: u18,
            }),
            ///  counter
            CNT: mmio.Mmio(packed struct(u32) {
                ///  counter value
                CNT: u16,
                padding: u16,
            }),
            ///  prescaler
            PSC: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u16,
                padding: u16,
            }),
            ///  auto-reload register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Auto-reload value
                ARR: u16,
                padding: u16,
            }),
            ///  repetition counter register
            RCR: mmio.Mmio(packed struct(u32) {
                ///  Repetition counter value
                REP: u8,
                padding: u24,
            }),
            ///  capture/compare register 1
            CCR1: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 1 value
                CCR1: u16,
                padding: u16,
            }),
            ///  capture/compare register 2
            CCR2: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare 2 value
                CCR2: u16,
                padding: u16,
            }),
            ///  capture/compare register 3
            CCR3: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR3: u16,
                padding: u16,
            }),
            ///  capture/compare register 4
            CCR4: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR4: u16,
                padding: u16,
            }),
            ///  break and dead-time register
            BDTR: mmio.Mmio(packed struct(u32) {
                ///  Dead-time generator setup
                DTG: u8,
                ///  Lock configuration
                LOCK: u2,
                ///  Off-state selection for Idle mode
                OSSI: u1,
                ///  Off-state selection for Run mode
                OSSR: u1,
                ///  Break enable
                BKE: u1,
                ///  Break polarity
                BKP: u1,
                ///  Automatic output enable
                AOE: u1,
                ///  Main output enable
                MOE: u1,
                padding: u16,
            }),
            ///  DMA control register
            DCR: mmio.Mmio(packed struct(u32) {
                ///  DMA base address
                DBA: u5,
                reserved8: u3,
                ///  DMA burst length
                DBL: u5,
                padding: u19,
            }),
            ///  DMA address for full transfer
            DMAR: mmio.Mmio(packed struct(u32) {
                ///  DMA register for burst accesses
                DMAB: u16,
                padding: u16,
            }),
            ///  DMA address for full transfer
            OR1: mmio.Mmio(packed struct(u32) {
                ///  External trigger remap on ADC1 analog watchdog
                ETR_ADC1_RMP: u2,
                ///  External trigger remap on ADC3 analog watchdog
                ETR_ADC3_RMP: u2,
                ///  Input Capture 1 remap
                TI1_RMP: u1,
                padding: u27,
            }),
            ///  capture/compare mode register 2 (output mode)
            CCMR3_Output: mmio.Mmio(packed struct(u32) {
                reserved2: u2,
                ///  Output compare 5 fast enable
                OC5FE: u1,
                ///  Output compare 5 preload enable
                OC5PE: u1,
                ///  Output compare 5 mode
                OC5M: u3,
                ///  Output compare 5 clear enable
                OC5CE: u1,
                reserved10: u2,
                ///  Output compare 6 fast enable
                OC6FE: u1,
                ///  Output compare 6 preload enable
                OC6PE: u1,
                ///  Output compare 6 mode
                OC6M: u3,
                ///  Output compare 6 clear enable
                OC6CE: u1,
                ///  Output Compare 5 mode bit 3
                OC5M_bit3: u3,
                reserved24: u5,
                ///  Output Compare 6 mode bit 3
                OC6M_bit3: u1,
                padding: u7,
            }),
            ///  capture/compare register 4
            CCR5: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR5: u16,
                reserved29: u13,
                ///  Group Channel 5 and Channel 1
                GC5C1: u1,
                ///  Group Channel 5 and Channel 2
                GC5C2: u1,
                ///  Group Channel 5 and Channel 3
                GC5C3: u1,
            }),
            ///  capture/compare register 4
            CCR6: mmio.Mmio(packed struct(u32) {
                ///  Capture/Compare value
                CCR6: u16,
                padding: u16,
            }),
            ///  DMA address for full transfer
            OR2: mmio.Mmio(packed struct(u32) {
                ///  BRK BKIN input enable
                BKINE: u1,
                ///  BRK COMP1 enable
                BKCMP1E: u1,
                ///  BRK COMP2 enable
                BKCMP2E: u1,
                reserved8: u5,
                ///  BRK DFSDM_BREAK0 enable
                BKDFBK0E: u1,
                ///  BRK BKIN input polarity
                BKINP: u1,
                ///  BRK COMP1 input polarity
                BKCMP1P: u1,
                ///  BRK COMP2 input polarity
                BKCMP2P: u1,
                reserved14: u2,
                ///  ETR source selection
                ETRSEL: u3,
                padding: u15,
            }),
            ///  DMA address for full transfer
            OR3: mmio.Mmio(packed struct(u32) {
                ///  BRK2 BKIN input enable
                BK2INE: u1,
                ///  BRK2 COMP1 enable
                BK2CMP1E: u1,
                ///  BRK2 COMP2 enable
                BK2CMP2E: u1,
                reserved8: u5,
                ///  BRK2 DFSDM_BREAK0 enable
                BK2DFBK0E: u1,
                ///  BRK2 BKIN input polarity
                BK2INP: u1,
                ///  BRK2 COMP1 input polarity
                BK2CMP1P: u1,
                ///  BRK2 COMP2 input polarity
                BK2CMP2P: u1,
                padding: u20,
            }),
        };

        ///  Basic-timers
        pub const TIM6 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Counter enable
                CEN: u1,
                ///  Update disable
                UDIS: u1,
                ///  Update request source
                URS: u1,
                ///  One-pulse mode
                OPM: u1,
                reserved7: u3,
                ///  Auto-reload preload enable
                ARPE: u1,
                padding: u24,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  Master mode selection
                MMS: u3,
                padding: u25,
            }),
            reserved12: [4]u8,
            ///  DMA/Interrupt enable register
            DIER: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt enable
                UIE: u1,
                reserved8: u7,
                ///  Update DMA request enable
                UDE: u1,
                padding: u23,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Update interrupt flag
                UIF: u1,
                padding: u31,
            }),
            ///  event generation register
            EGR: mmio.Mmio(packed struct(u32) {
                ///  Update generation
                UG: u1,
                padding: u31,
            }),
            reserved36: [12]u8,
            ///  counter
            CNT: mmio.Mmio(packed struct(u32) {
                ///  Low counter value
                CNT: u16,
                padding: u16,
            }),
            ///  prescaler
            PSC: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u16,
                padding: u16,
            }),
            ///  auto-reload register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Low Auto-reload value
                ARR: u16,
                padding: u16,
            }),
        };

        ///  Clock recovery system
        pub const CRS = extern struct {
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  SYNC event OK interrupt enable
                SYNCOKIE: u1,
                ///  SYNC warning interrupt enable
                SYNCWARNIE: u1,
                ///  Synchronization or trimming error interrupt enable
                ERRIE: u1,
                ///  Expected SYNC interrupt enable
                ESYNCIE: u1,
                reserved5: u1,
                ///  Frequency error counter enable
                CEN: u1,
                ///  Automatic trimming enable
                AUTOTRIMEN: u1,
                ///  Generate software SYNC event
                SWSYNC: u1,
                ///  HSI48 oscillator smooth trimming
                TRIM: u6,
                padding: u18,
            }),
            ///  configuration register
            CFGR: mmio.Mmio(packed struct(u32) {
                ///  Counter reload value
                RELOAD: u16,
                ///  Frequency error limit
                FELIM: u8,
                ///  SYNC divider
                SYNCDIV: u3,
                reserved28: u1,
                ///  SYNC signal source selection
                SYNCSRC: u2,
                reserved31: u1,
                ///  SYNC polarity selection
                SYNCPOL: u1,
            }),
            ///  interrupt and status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  SYNC event OK flag
                SYNCOKF: u1,
                ///  SYNC warning flag
                SYNCWARNF: u1,
                ///  Error flag
                ERRF: u1,
                ///  Expected SYNC flag
                ESYNCF: u1,
                reserved8: u4,
                ///  SYNC error
                SYNCERR: u1,
                ///  SYNC missed
                SYNCMISS: u1,
                ///  Trimming overflow or underflow
                TRIMOVF: u1,
                reserved15: u4,
                ///  Frequency error direction
                FEDIR: u1,
                ///  Frequency error capture
                FECAP: u16,
            }),
            ///  interrupt flag clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  SYNC event OK clear flag
                SYNCOKC: u1,
                ///  SYNC warning clear flag
                SYNCWARNC: u1,
                ///  Error clear flag
                ERRC: u1,
                ///  Expected SYNC clear flag
                ESYNCC: u1,
                padding: u28,
            }),
        };

        ///  Low power timer
        pub const LPTIM1 = extern struct {
            ///  Interrupt and Status Register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  Compare match
                CMPM: u1,
                ///  Autoreload match
                ARRM: u1,
                ///  External trigger edge event
                EXTTRIG: u1,
                ///  Compare register update OK
                CMPOK: u1,
                ///  Autoreload register update OK
                ARROK: u1,
                ///  Counter direction change down to up
                UP: u1,
                ///  Counter direction change up to down
                DOWN: u1,
                padding: u25,
            }),
            ///  Interrupt Clear Register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  compare match Clear Flag
                CMPMCF: u1,
                ///  Autoreload match Clear Flag
                ARRMCF: u1,
                ///  External trigger valid edge Clear Flag
                EXTTRIGCF: u1,
                ///  Compare register update OK Clear Flag
                CMPOKCF: u1,
                ///  Autoreload register update OK Clear Flag
                ARROKCF: u1,
                ///  Direction change to UP Clear Flag
                UPCF: u1,
                ///  Direction change to down Clear Flag
                DOWNCF: u1,
                padding: u25,
            }),
            ///  Interrupt Enable Register
            IER: mmio.Mmio(packed struct(u32) {
                ///  Compare match Interrupt Enable
                CMPMIE: u1,
                ///  Autoreload match Interrupt Enable
                ARRMIE: u1,
                ///  External trigger valid edge Interrupt Enable
                EXTTRIGIE: u1,
                ///  Compare register update OK Interrupt Enable
                CMPOKIE: u1,
                ///  Autoreload register update OK Interrupt Enable
                ARROKIE: u1,
                ///  Direction change to UP Interrupt Enable
                UPIE: u1,
                ///  Direction change to down Interrupt Enable
                DOWNIE: u1,
                padding: u25,
            }),
            ///  Configuration Register
            CFGR: mmio.Mmio(packed struct(u32) {
                ///  Clock selector
                CKSEL: u1,
                ///  Clock Polarity
                CKPOL: u2,
                ///  Configurable digital filter for external clock
                CKFLT: u2,
                reserved6: u1,
                ///  Configurable digital filter for trigger
                TRGFLT: u2,
                reserved9: u1,
                ///  Clock prescaler
                PRESC: u3,
                reserved13: u1,
                ///  Trigger selector
                TRIGSEL: u3,
                reserved17: u1,
                ///  Trigger enable and polarity
                TRIGEN: u2,
                ///  Timeout enable
                TIMOUT: u1,
                ///  Waveform shape
                WAVE: u1,
                ///  Waveform shape polarity
                WAVPOL: u1,
                ///  Registers update mode
                PRELOAD: u1,
                ///  counter mode enabled
                COUNTMODE: u1,
                ///  Encoder mode enable
                ENC: u1,
                padding: u7,
            }),
            ///  Control Register
            CR: mmio.Mmio(packed struct(u32) {
                ///  LPTIM Enable
                ENABLE: u1,
                ///  LPTIM start in single mode
                SNGSTRT: u1,
                ///  Timer start in continuous mode
                CNTSTRT: u1,
                padding: u29,
            }),
            ///  Compare Register
            CMP: mmio.Mmio(packed struct(u32) {
                ///  Compare value
                CMP: u16,
                padding: u16,
            }),
            ///  Autoreload Register
            ARR: mmio.Mmio(packed struct(u32) {
                ///  Auto reload value
                ARR: u16,
                padding: u16,
            }),
            ///  Counter Register
            CNT: mmio.Mmio(packed struct(u32) {
                ///  Counter value
                CNT: u16,
                padding: u16,
            }),
        };

        ///  Nested Vectored Interrupt Controller
        pub const NVIC = extern struct {
            ///  Interrupt Set-Enable Register
            ISER0: mmio.Mmio(packed struct(u32) {
                ///  SETENA
                SETENA: u32,
            }),
            ///  Interrupt Set-Enable Register
            ISER1: mmio.Mmio(packed struct(u32) {
                ///  SETENA
                SETENA: u32,
            }),
            ///  Interrupt Set-Enable Register
            ISER2: mmio.Mmio(packed struct(u32) {
                ///  SETENA
                SETENA: u32,
            }),
            reserved128: [116]u8,
            ///  Interrupt Clear-Enable Register
            ICER0: mmio.Mmio(packed struct(u32) {
                ///  CLRENA
                CLRENA: u32,
            }),
            ///  Interrupt Clear-Enable Register
            ICER1: mmio.Mmio(packed struct(u32) {
                ///  CLRENA
                CLRENA: u32,
            }),
            ///  Interrupt Clear-Enable Register
            ICER2: mmio.Mmio(packed struct(u32) {
                ///  CLRENA
                CLRENA: u32,
            }),
            reserved256: [116]u8,
            ///  Interrupt Set-Pending Register
            ISPR0: mmio.Mmio(packed struct(u32) {
                ///  SETPEND
                SETPEND: u32,
            }),
            ///  Interrupt Set-Pending Register
            ISPR1: mmio.Mmio(packed struct(u32) {
                ///  SETPEND
                SETPEND: u32,
            }),
            ///  Interrupt Set-Pending Register
            ISPR2: mmio.Mmio(packed struct(u32) {
                ///  SETPEND
                SETPEND: u32,
            }),
            reserved384: [116]u8,
            ///  Interrupt Clear-Pending Register
            ICPR0: mmio.Mmio(packed struct(u32) {
                ///  CLRPEND
                CLRPEND: u32,
            }),
            ///  Interrupt Clear-Pending Register
            ICPR1: mmio.Mmio(packed struct(u32) {
                ///  CLRPEND
                CLRPEND: u32,
            }),
            ///  Interrupt Clear-Pending Register
            ICPR2: mmio.Mmio(packed struct(u32) {
                ///  CLRPEND
                CLRPEND: u32,
            }),
            reserved512: [116]u8,
            ///  Interrupt Active Bit Register
            IABR0: mmio.Mmio(packed struct(u32) {
                ///  ACTIVE
                ACTIVE: u32,
            }),
            ///  Interrupt Active Bit Register
            IABR1: mmio.Mmio(packed struct(u32) {
                ///  ACTIVE
                ACTIVE: u32,
            }),
            ///  Interrupt Active Bit Register
            IABR2: mmio.Mmio(packed struct(u32) {
                ///  ACTIVE
                ACTIVE: u32,
            }),
            reserved768: [244]u8,
            ///  Interrupt Priority Register
            IPR0: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR1: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR2: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR3: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR4: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR5: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR6: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR7: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR8: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR9: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR10: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR11: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR12: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR13: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR14: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR15: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR16: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR17: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR18: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR19: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
            ///  Interrupt Priority Register
            IPR20: mmio.Mmio(packed struct(u32) {
                ///  IPR_N0
                IPR_N0: u8,
                ///  IPR_N1
                IPR_N1: u8,
                ///  IPR_N2
                IPR_N2: u8,
                ///  IPR_N3
                IPR_N3: u8,
            }),
        };

        ///  Universal synchronous asynchronous receiver transmitter
        pub const USART1 = extern struct {
            ///  Control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  USART enable
                UE: u1,
                ///  USART enable in Stop mode
                UESM: u1,
                ///  Receiver enable
                RE: u1,
                ///  Transmitter enable
                TE: u1,
                ///  IDLE interrupt enable
                IDLEIE: u1,
                ///  RXNE interrupt enable
                RXNEIE: u1,
                ///  Transmission complete interrupt enable
                TCIE: u1,
                ///  interrupt enable
                TXEIE: u1,
                ///  PE interrupt enable
                PEIE: u1,
                ///  Parity selection
                PS: u1,
                ///  Parity control enable
                PCE: u1,
                ///  Receiver wakeup method
                WAKE: u1,
                ///  Word length
                M0: u1,
                ///  Mute mode enable
                MME: u1,
                ///  Character match interrupt enable
                CMIE: u1,
                ///  Oversampling mode
                OVER8: u1,
                ///  DEDT0
                DEDT0: u1,
                ///  DEDT1
                DEDT1: u1,
                ///  DEDT2
                DEDT2: u1,
                ///  DEDT3
                DEDT3: u1,
                ///  Driver Enable de-assertion time
                DEDT4: u1,
                ///  DEAT0
                DEAT0: u1,
                ///  DEAT1
                DEAT1: u1,
                ///  DEAT2
                DEAT2: u1,
                ///  DEAT3
                DEAT3: u1,
                ///  Driver Enable assertion time
                DEAT4: u1,
                ///  Receiver timeout interrupt enable
                RTOIE: u1,
                ///  End of Block interrupt enable
                EOBIE: u1,
                ///  Word length
                M1: u1,
                padding: u3,
            }),
            ///  Control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  7-bit Address Detection/4-bit Address Detection
                ADDM7: u1,
                ///  LIN break detection length
                LBDL: u1,
                ///  LIN break detection interrupt enable
                LBDIE: u1,
                reserved8: u1,
                ///  Last bit clock pulse
                LBCL: u1,
                ///  Clock phase
                CPHA: u1,
                ///  Clock polarity
                CPOL: u1,
                ///  Clock enable
                CLKEN: u1,
                ///  STOP bits
                STOP: u2,
                ///  LIN mode enable
                LINEN: u1,
                ///  Swap TX/RX pins
                SWAP: u1,
                ///  RX pin active level inversion
                RXINV: u1,
                ///  TX pin active level inversion
                TXINV: u1,
                ///  Binary data inversion
                TAINV: u1,
                ///  Most significant bit first
                MSBFIRST: u1,
                ///  Auto baud rate enable
                ABREN: u1,
                ///  ABRMOD0
                ABRMOD0: u1,
                ///  Auto baud rate mode
                ABRMOD1: u1,
                ///  Receiver timeout enable
                RTOEN: u1,
                ///  Address of the USART node
                ADD0_3: u4,
                ///  Address of the USART node
                ADD4_7: u4,
            }),
            ///  Control register 3
            CR3: mmio.Mmio(packed struct(u32) {
                ///  Error interrupt enable
                EIE: u1,
                ///  Ir mode enable
                IREN: u1,
                ///  Ir low-power
                IRLP: u1,
                ///  Half-duplex selection
                HDSEL: u1,
                ///  Smartcard NACK enable
                NACK: u1,
                ///  Smartcard mode enable
                SCEN: u1,
                ///  DMA enable receiver
                DMAR: u1,
                ///  DMA enable transmitter
                DMAT: u1,
                ///  RTS enable
                RTSE: u1,
                ///  CTS enable
                CTSE: u1,
                ///  CTS interrupt enable
                CTSIE: u1,
                ///  One sample bit method enable
                ONEBIT: u1,
                ///  Overrun Disable
                OVRDIS: u1,
                ///  DMA Disable on Reception Error
                DDRE: u1,
                ///  Driver enable mode
                DEM: u1,
                ///  Driver enable polarity selection
                DEP: u1,
                reserved17: u1,
                ///  Smartcard auto-retry count
                SCARCNT: u3,
                ///  Wakeup from Stop mode interrupt flag selection
                WUS: u2,
                ///  Wakeup from Stop mode interrupt enable
                WUFIE: u1,
                padding: u9,
            }),
            ///  Baud rate register
            BRR: mmio.Mmio(packed struct(u32) {
                ///  DIV_Fraction
                DIV_Fraction: u4,
                ///  DIV_Mantissa
                DIV_Mantissa: u12,
                padding: u16,
            }),
            ///  Guard time and prescaler register
            GTPR: mmio.Mmio(packed struct(u32) {
                ///  Prescaler value
                PSC: u8,
                ///  Guard time value
                GT: u8,
                padding: u16,
            }),
            ///  Receiver timeout register
            RTOR: mmio.Mmio(packed struct(u32) {
                ///  Receiver timeout value
                RTO: u24,
                ///  Block Length
                BLEN: u8,
            }),
            ///  Request register
            RQR: mmio.Mmio(packed struct(u32) {
                ///  Auto baud rate request
                ABRRQ: u1,
                ///  Send break request
                SBKRQ: u1,
                ///  Mute mode request
                MMRQ: u1,
                ///  Receive data flush request
                RXFRQ: u1,
                ///  Transmit data flush request
                TXFRQ: u1,
                padding: u27,
            }),
            ///  Interrupt & status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  PE
                PE: u1,
                ///  FE
                FE: u1,
                ///  NF
                NF: u1,
                ///  ORE
                ORE: u1,
                ///  IDLE
                IDLE: u1,
                ///  RXNE
                RXNE: u1,
                ///  TC
                TC: u1,
                ///  TXE
                TXE: u1,
                ///  LBDF
                LBDF: u1,
                ///  CTSIF
                CTSIF: u1,
                ///  CTS
                CTS: u1,
                ///  RTOF
                RTOF: u1,
                ///  EOBF
                EOBF: u1,
                reserved14: u1,
                ///  ABRE
                ABRE: u1,
                ///  ABRF
                ABRF: u1,
                ///  BUSY
                BUSY: u1,
                ///  CMF
                CMF: u1,
                ///  SBKF
                SBKF: u1,
                ///  RWU
                RWU: u1,
                ///  WUF
                WUF: u1,
                ///  TEACK
                TEACK: u1,
                ///  REACK
                REACK: u1,
                padding: u9,
            }),
            ///  Interrupt flag clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  Parity error clear flag
                PECF: u1,
                ///  Framing error clear flag
                FECF: u1,
                ///  Noise detected clear flag
                NCF: u1,
                ///  Overrun error clear flag
                ORECF: u1,
                ///  Idle line detected clear flag
                IDLECF: u1,
                reserved6: u1,
                ///  Transmission complete clear flag
                TCCF: u1,
                reserved8: u1,
                ///  LIN break detection clear flag
                LBDCF: u1,
                ///  CTS clear flag
                CTSCF: u1,
                reserved11: u1,
                ///  Receiver timeout clear flag
                RTOCF: u1,
                ///  End of block clear flag
                EOBCF: u1,
                reserved17: u4,
                ///  Character match clear flag
                CMCF: u1,
                reserved20: u2,
                ///  Wakeup from Stop mode clear flag
                WUCF: u1,
                padding: u11,
            }),
            ///  Receive data register
            RDR: mmio.Mmio(packed struct(u32) {
                ///  Receive data value
                RDR: u9,
                padding: u23,
            }),
            ///  Transmit data register
            TDR: mmio.Mmio(packed struct(u32) {
                ///  Transmit data value
                TDR: u9,
                padding: u23,
            }),
        };

        ///  Operational amplifiers
        pub const OPAMP = extern struct {
            ///  OPAMP1 control/status register
            OPAMP1_CSR: mmio.Mmio(packed struct(u32) {
                ///  Operational amplifier Enable
                OPAEN: u1,
                ///  Operational amplifier Low Power Mode
                OPALPM: u1,
                ///  Operational amplifier PGA mode
                OPAMODE: u2,
                ///  Operational amplifier Programmable amplifier gain value
                PGA_GAIN: u2,
                reserved8: u2,
                ///  Inverting input selection
                VM_SEL: u2,
                ///  Non inverted input selection
                VP_SEL: u1,
                reserved12: u1,
                ///  Calibration mode enabled
                CALON: u1,
                ///  Calibration selection
                CALSEL: u1,
                ///  allows to switch from AOP offset trimmed values to AOP offset
                USERTRIM: u1,
                ///  Operational amplifier calibration output
                CALOUT: u1,
                reserved31: u15,
                ///  Operational amplifier power supply range for stability
                OPA_RANGE: u1,
            }),
            ///  OPAMP1 offset trimming register in normal mode
            OPAMP1_OTR: mmio.Mmio(packed struct(u32) {
                ///  Trim for NMOS differential pairs
                TRIMOFFSETN: u5,
                reserved8: u3,
                ///  Trim for PMOS differential pairs
                TRIMOFFSETP: u5,
                padding: u19,
            }),
            ///  OPAMP1 offset trimming register in low-power mode
            OPAMP1_LPOTR: mmio.Mmio(packed struct(u32) {
                ///  Trim for NMOS differential pairs
                TRIMLPOFFSETN: u5,
                reserved8: u3,
                ///  Trim for PMOS differential pairs
                TRIMLPOFFSETP: u5,
                padding: u19,
            }),
            reserved16: [4]u8,
            ///  OPAMP2 control/status register
            OPAMP2_CSR: mmio.Mmio(packed struct(u32) {
                ///  Operational amplifier Enable
                OPAEN: u1,
                ///  Operational amplifier Low Power Mode
                OPALPM: u1,
                ///  Operational amplifier PGA mode
                OPAMODE: u2,
                ///  Operational amplifier Programmable amplifier gain value
                PGA_GAIN: u2,
                reserved8: u2,
                ///  Inverting input selection
                VM_SEL: u2,
                ///  Non inverted input selection
                VP_SEL: u1,
                reserved12: u1,
                ///  Calibration mode enabled
                CALON: u1,
                ///  Calibration selection
                CALSEL: u1,
                ///  allows to switch from AOP offset trimmed values to AOP offset
                USERTRIM: u1,
                ///  Operational amplifier calibration output
                CALOUT: u1,
                padding: u16,
            }),
            ///  OPAMP2 offset trimming register in normal mode
            OPAMP2_OTR: mmio.Mmio(packed struct(u32) {
                ///  Trim for NMOS differential pairs
                TRIMOFFSETN: u5,
                reserved8: u3,
                ///  Trim for PMOS differential pairs
                TRIMOFFSETP: u5,
                padding: u19,
            }),
            ///  OPAMP2 offset trimming register in low-power mode
            OPAMP2_LPOTR: mmio.Mmio(packed struct(u32) {
                ///  Trim for NMOS differential pairs
                TRIMLPOFFSETN: u5,
                reserved8: u3,
                ///  Trim for PMOS differential pairs
                TRIMLPOFFSETP: u5,
                padding: u19,
            }),
        };

        ///  Single Wire Protocol Master Interface
        pub const SWPMI1 = extern struct {
            ///  SWPMI Configuration/Control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Reception DMA enable
                RXDMA: u1,
                ///  Transmission DMA enable
                TXDMA: u1,
                ///  Reception buffering mode
                RXMODE: u1,
                ///  Transmission buffering mode
                TXMODE: u1,
                ///  Loopback mode enable
                LPBK: u1,
                ///  Single wire protocol master interface enable
                SWPME: u1,
                reserved10: u4,
                ///  Single wire protocol master interface deactivate
                DEACT: u1,
                padding: u21,
            }),
            ///  SWPMI Bitrate register
            BRR: mmio.Mmio(packed struct(u32) {
                ///  Bitrate prescaler
                BR: u6,
                padding: u26,
            }),
            reserved12: [4]u8,
            ///  SWPMI Interrupt and Status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  Receive buffer full flag
                RXBFF: u1,
                ///  Transmit buffer empty flag
                TXBEF: u1,
                ///  Receive CRC error flag
                RXBERF: u1,
                ///  Receive overrun error flag
                RXOVRF: u1,
                ///  Transmit underrun error flag
                TXUNRF: u1,
                ///  Receive data register not empty
                RXNE: u1,
                ///  Transmit data register empty
                TXE: u1,
                ///  Transfer complete flag
                TCF: u1,
                ///  Slave resume flag
                SRF: u1,
                ///  SUSPEND flag
                SUSP: u1,
                ///  DEACTIVATED flag
                DEACTF: u1,
                padding: u21,
            }),
            ///  SWPMI Interrupt Flag Clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  Clear receive buffer full flag
                CRXBFF: u1,
                ///  Clear transmit buffer empty flag
                CTXBEF: u1,
                ///  Clear receive CRC error flag
                CRXBERF: u1,
                ///  Clear receive overrun error flag
                CRXOVRF: u1,
                ///  Clear transmit underrun error flag
                CTXUNRF: u1,
                reserved7: u2,
                ///  Clear transfer complete flag
                CTCF: u1,
                ///  Clear slave resume flag
                CSRF: u1,
                padding: u23,
            }),
            ///  SWPMI Interrupt Enable register
            IER: mmio.Mmio(packed struct(u32) {
                ///  Receive buffer full interrupt enable
                RXBFIE: u1,
                ///  Transmit buffer empty interrupt enable
                TXBEIE: u1,
                ///  Receive CRC error interrupt enable
                RXBERIE: u1,
                ///  Receive overrun error interrupt enable
                RXOVRIE: u1,
                ///  Transmit underrun error interrupt enable
                TXUNRIE: u1,
                ///  Receive interrupt enable
                RIE: u1,
                ///  Transmit interrupt enable
                TIE: u1,
                ///  Transmit complete interrupt enable
                TCIE: u1,
                ///  Slave resume interrupt enable
                SRIE: u1,
                padding: u23,
            }),
            ///  SWPMI Receive Frame Length register
            RFL: mmio.Mmio(packed struct(u32) {
                ///  Receive frame length
                RFL: u5,
                padding: u27,
            }),
            ///  SWPMI Transmit data register
            TDR: mmio.Mmio(packed struct(u32) {
                ///  Transmit data
                TD: u32,
            }),
            ///  SWPMI Receive data register
            RDR: mmio.Mmio(packed struct(u32) {
                ///  received data
                RD: u32,
            }),
            ///  SWPMI Option register
            OR: mmio.Mmio(packed struct(u32) {
                ///  SWP transceiver bypass
                SWP_TBYP: u1,
                ///  SWP class selection
                SWP_CLASS: u1,
                padding: u30,
            }),
        };

        ///  Real-time clock
        pub const RTC = extern struct {
            ///  time register
            TR: mmio.Mmio(packed struct(u32) {
                ///  Second units in BCD format
                SU: u4,
                ///  Second tens in BCD format
                ST: u3,
                reserved8: u1,
                ///  Minute units in BCD format
                MNU: u4,
                ///  Minute tens in BCD format
                MNT: u3,
                reserved16: u1,
                ///  Hour units in BCD format
                HU: u4,
                ///  Hour tens in BCD format
                HT: u2,
                ///  AM/PM notation
                PM: u1,
                padding: u9,
            }),
            ///  date register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Date units in BCD format
                DU: u4,
                ///  Date tens in BCD format
                DT: u2,
                reserved8: u2,
                ///  Month units in BCD format
                MU: u4,
                ///  Month tens in BCD format
                MT: u1,
                ///  Week day units
                WDU: u3,
                ///  Year units in BCD format
                YU: u4,
                ///  Year tens in BCD format
                YT: u4,
                padding: u8,
            }),
            ///  control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Wakeup clock selection
                WCKSEL: u3,
                ///  Time-stamp event active edge
                TSEDGE: u1,
                ///  Reference clock detection enable (50 or 60 Hz)
                REFCKON: u1,
                ///  Bypass the shadow registers
                BYPSHAD: u1,
                ///  Hour format
                FMT: u1,
                reserved8: u1,
                ///  Alarm A enable
                ALRAE: u1,
                ///  Alarm B enable
                ALRBE: u1,
                ///  Wakeup timer enable
                WUTE: u1,
                ///  Time stamp enable
                TSE: u1,
                ///  Alarm A interrupt enable
                ALRAIE: u1,
                ///  Alarm B interrupt enable
                ALRBIE: u1,
                ///  Wakeup timer interrupt enable
                WUTIE: u1,
                ///  Time-stamp interrupt enable
                TSIE: u1,
                ///  Add 1 hour (summer time change)
                ADD1H: u1,
                ///  Subtract 1 hour (winter time change)
                SUB1H: u1,
                ///  Backup
                BKP: u1,
                ///  Calibration output selection
                COSEL: u1,
                ///  Output polarity
                POL: u1,
                ///  Output selection
                OSEL: u2,
                ///  Calibration output enable
                COE: u1,
                ///  timestamp on internal event enable
                ITSE: u1,
                padding: u7,
            }),
            ///  initialization and status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  Alarm A write flag
                ALRAWF: u1,
                ///  Alarm B write flag
                ALRBWF: u1,
                ///  Wakeup timer write flag
                WUTWF: u1,
                ///  Shift operation pending
                SHPF: u1,
                ///  Initialization status flag
                INITS: u1,
                ///  Registers synchronization flag
                RSF: u1,
                ///  Initialization flag
                INITF: u1,
                ///  Initialization mode
                INIT: u1,
                ///  Alarm A flag
                ALRAF: u1,
                ///  Alarm B flag
                ALRBF: u1,
                ///  Wakeup timer flag
                WUTF: u1,
                ///  Time-stamp flag
                TSF: u1,
                ///  Time-stamp overflow flag
                TSOVF: u1,
                ///  Tamper detection flag
                TAMP1F: u1,
                ///  RTC_TAMP2 detection flag
                TAMP2F: u1,
                ///  RTC_TAMP3 detection flag
                TAMP3F: u1,
                ///  Recalibration pending Flag
                RECALPF: u1,
                padding: u15,
            }),
            ///  prescaler register
            PRER: mmio.Mmio(packed struct(u32) {
                ///  Synchronous prescaler factor
                PREDIV_S: u15,
                reserved16: u1,
                ///  Asynchronous prescaler factor
                PREDIV_A: u7,
                padding: u9,
            }),
            ///  wakeup timer register
            WUTR: mmio.Mmio(packed struct(u32) {
                ///  Wakeup auto-reload value bits
                WUT: u16,
                padding: u16,
            }),
            reserved28: [4]u8,
            ///  alarm A register
            ALRMAR: mmio.Mmio(packed struct(u32) {
                ///  Second units in BCD format
                SU: u4,
                ///  Second tens in BCD format
                ST: u3,
                ///  Alarm A seconds mask
                MSK1: u1,
                ///  Minute units in BCD format
                MNU: u4,
                ///  Minute tens in BCD format
                MNT: u3,
                ///  Alarm A minutes mask
                MSK2: u1,
                ///  Hour units in BCD format
                HU: u4,
                ///  Hour tens in BCD format
                HT: u2,
                ///  AM/PM notation
                PM: u1,
                ///  Alarm A hours mask
                MSK3: u1,
                ///  Date units or day in BCD format
                DU: u4,
                ///  Date tens in BCD format
                DT: u2,
                ///  Week day selection
                WDSEL: u1,
                ///  Alarm A date mask
                MSK4: u1,
            }),
            ///  alarm B register
            ALRMBR: mmio.Mmio(packed struct(u32) {
                ///  Second units in BCD format
                SU: u4,
                ///  Second tens in BCD format
                ST: u3,
                ///  Alarm B seconds mask
                MSK1: u1,
                ///  Minute units in BCD format
                MNU: u4,
                ///  Minute tens in BCD format
                MNT: u3,
                ///  Alarm B minutes mask
                MSK2: u1,
                ///  Hour units in BCD format
                HU: u4,
                ///  Hour tens in BCD format
                HT: u2,
                ///  AM/PM notation
                PM: u1,
                ///  Alarm B hours mask
                MSK3: u1,
                ///  Date units or day in BCD format
                DU: u4,
                ///  Date tens in BCD format
                DT: u2,
                ///  Week day selection
                WDSEL: u1,
                ///  Alarm B date mask
                MSK4: u1,
            }),
            ///  write protection register
            WPR: mmio.Mmio(packed struct(u32) {
                ///  Write protection key
                KEY: u8,
                padding: u24,
            }),
            ///  sub second register
            SSR: mmio.Mmio(packed struct(u32) {
                ///  Sub second value
                SS: u16,
                padding: u16,
            }),
            ///  shift control register
            SHIFTR: mmio.Mmio(packed struct(u32) {
                ///  Subtract a fraction of a second
                SUBFS: u15,
                reserved31: u16,
                ///  Add one second
                ADD1S: u1,
            }),
            ///  time stamp time register
            TSTR: mmio.Mmio(packed struct(u32) {
                ///  Second units in BCD format
                SU: u4,
                ///  Second tens in BCD format
                ST: u3,
                reserved8: u1,
                ///  Minute units in BCD format
                MNU: u4,
                ///  Minute tens in BCD format
                MNT: u3,
                reserved16: u1,
                ///  Hour units in BCD format
                HU: u4,
                ///  Hour tens in BCD format
                HT: u2,
                ///  AM/PM notation
                PM: u1,
                padding: u9,
            }),
            ///  time stamp date register
            TSDR: mmio.Mmio(packed struct(u32) {
                ///  Date units in BCD format
                DU: u4,
                ///  Date tens in BCD format
                DT: u2,
                reserved8: u2,
                ///  Month units in BCD format
                MU: u4,
                ///  Month tens in BCD format
                MT: u1,
                ///  Week day units
                WDU: u3,
                padding: u16,
            }),
            ///  timestamp sub second register
            TSSSR: mmio.Mmio(packed struct(u32) {
                ///  Sub second value
                SS: u16,
                padding: u16,
            }),
            ///  calibration register
            CALR: mmio.Mmio(packed struct(u32) {
                ///  Calibration minus
                CALM: u9,
                reserved13: u4,
                ///  Use a 16-second calibration cycle period
                CALW16: u1,
                ///  Use an 8-second calibration cycle period
                CALW8: u1,
                ///  Increase frequency of RTC by 488.5 ppm
                CALP: u1,
                padding: u16,
            }),
            ///  tamper configuration register
            TAMPCR: mmio.Mmio(packed struct(u32) {
                ///  Tamper 1 detection enable
                TAMP1E: u1,
                ///  Active level for tamper 1
                TAMP1TRG: u1,
                ///  Tamper interrupt enable
                TAMPIE: u1,
                ///  Tamper 2 detection enable
                TAMP2E: u1,
                ///  Active level for tamper 2
                TAMP2TRG: u1,
                ///  Tamper 3 detection enable
                TAMP3E: u1,
                ///  Active level for tamper 3
                TAMP3TRG: u1,
                ///  Activate timestamp on tamper detection event
                TAMPTS: u1,
                ///  Tamper sampling frequency
                TAMPFREQ: u3,
                ///  Tamper filter count
                TAMPFLT: u2,
                ///  Tamper precharge duration
                TAMPPRCH: u2,
                ///  TAMPER pull-up disable
                TAMPPUDIS: u1,
                ///  Tamper 1 interrupt enable
                TAMP1IE: u1,
                ///  Tamper 1 no erase
                TAMP1NOERASE: u1,
                ///  Tamper 1 mask flag
                TAMP1MF: u1,
                ///  Tamper 2 interrupt enable
                TAMP2IE: u1,
                ///  Tamper 2 no erase
                TAMP2NOERASE: u1,
                ///  Tamper 2 mask flag
                TAMP2MF: u1,
                ///  Tamper 3 interrupt enable
                TAMP3IE: u1,
                ///  Tamper 3 no erase
                TAMP3NOERASE: u1,
                ///  Tamper 3 mask flag
                TAMP3MF: u1,
                padding: u7,
            }),
            ///  alarm A sub second register
            ALRMASSR: mmio.Mmio(packed struct(u32) {
                ///  Sub seconds value
                SS: u15,
                reserved24: u9,
                ///  Mask the most-significant bits starting at this bit
                MASKSS: u4,
                padding: u4,
            }),
            ///  alarm B sub second register
            ALRMBSSR: mmio.Mmio(packed struct(u32) {
                ///  Sub seconds value
                SS: u15,
                reserved24: u9,
                ///  Mask the most-significant bits starting at this bit
                MASKSS: u4,
                padding: u4,
            }),
            ///  option register
            OR: mmio.Mmio(packed struct(u32) {
                ///  RTC_ALARM on PC13 output type
                RTC_ALARM_TYPE: u1,
                ///  RTC_OUT remap
                RTC_OUT_RMP: u1,
                padding: u30,
            }),
            ///  backup register
            BKP0R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP1R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP2R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP3R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP4R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP5R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP6R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP7R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP8R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP9R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP10R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP11R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP12R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP13R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP14R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP15R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP16R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP17R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP18R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP19R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP20R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP21R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP22R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP23R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP24R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP25R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP26R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP27R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP28R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP29R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP30R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
            ///  backup register
            BKP31R: mmio.Mmio(packed struct(u32) {
                ///  BKP
                BKP: u32,
            }),
        };

        ///  Controller area network
        pub const CAN1 = extern struct {
            ///  master control register
            MCR: mmio.Mmio(packed struct(u32) {
                ///  INRQ
                INRQ: u1,
                ///  SLEEP
                SLEEP: u1,
                ///  TXFP
                TXFP: u1,
                ///  RFLM
                RFLM: u1,
                ///  NART
                NART: u1,
                ///  AWUM
                AWUM: u1,
                ///  ABOM
                ABOM: u1,
                ///  TTCM
                TTCM: u1,
                reserved15: u7,
                ///  RESET
                RESET: u1,
                ///  DBF
                DBF: u1,
                padding: u15,
            }),
            ///  master status register
            MSR: mmio.Mmio(packed struct(u32) {
                ///  INAK
                INAK: u1,
                ///  SLAK
                SLAK: u1,
                ///  ERRI
                ERRI: u1,
                ///  WKUI
                WKUI: u1,
                ///  SLAKI
                SLAKI: u1,
                reserved8: u3,
                ///  TXM
                TXM: u1,
                ///  RXM
                RXM: u1,
                ///  SAMP
                SAMP: u1,
                ///  RX
                RX: u1,
                padding: u20,
            }),
            ///  transmit status register
            TSR: mmio.Mmio(packed struct(u32) {
                ///  RQCP0
                RQCP0: u1,
                ///  TXOK0
                TXOK0: u1,
                ///  ALST0
                ALST0: u1,
                ///  TERR0
                TERR0: u1,
                reserved7: u3,
                ///  ABRQ0
                ABRQ0: u1,
                ///  RQCP1
                RQCP1: u1,
                ///  TXOK1
                TXOK1: u1,
                ///  ALST1
                ALST1: u1,
                ///  TERR1
                TERR1: u1,
                reserved15: u3,
                ///  ABRQ1
                ABRQ1: u1,
                ///  RQCP2
                RQCP2: u1,
                ///  TXOK2
                TXOK2: u1,
                ///  ALST2
                ALST2: u1,
                ///  TERR2
                TERR2: u1,
                reserved23: u3,
                ///  ABRQ2
                ABRQ2: u1,
                ///  CODE
                CODE: u2,
                ///  Lowest priority flag for mailbox 0
                TME0: u1,
                ///  Lowest priority flag for mailbox 1
                TME1: u1,
                ///  Lowest priority flag for mailbox 2
                TME2: u1,
                ///  Lowest priority flag for mailbox 0
                LOW0: u1,
                ///  Lowest priority flag for mailbox 1
                LOW1: u1,
                ///  Lowest priority flag for mailbox 2
                LOW2: u1,
            }),
            ///  receive FIFO 0 register
            RF0R: mmio.Mmio(packed struct(u32) {
                ///  FMP0
                FMP0: u2,
                reserved3: u1,
                ///  FULL0
                FULL0: u1,
                ///  FOVR0
                FOVR0: u1,
                ///  RFOM0
                RFOM0: u1,
                padding: u26,
            }),
            ///  receive FIFO 1 register
            RF1R: mmio.Mmio(packed struct(u32) {
                ///  FMP1
                FMP1: u2,
                reserved3: u1,
                ///  FULL1
                FULL1: u1,
                ///  FOVR1
                FOVR1: u1,
                ///  RFOM1
                RFOM1: u1,
                padding: u26,
            }),
            ///  interrupt enable register
            IER: mmio.Mmio(packed struct(u32) {
                ///  TMEIE
                TMEIE: u1,
                ///  FMPIE0
                FMPIE0: u1,
                ///  FFIE0
                FFIE0: u1,
                ///  FOVIE0
                FOVIE0: u1,
                ///  FMPIE1
                FMPIE1: u1,
                ///  FFIE1
                FFIE1: u1,
                ///  FOVIE1
                FOVIE1: u1,
                reserved8: u1,
                ///  EWGIE
                EWGIE: u1,
                ///  EPVIE
                EPVIE: u1,
                ///  BOFIE
                BOFIE: u1,
                ///  LECIE
                LECIE: u1,
                reserved15: u3,
                ///  ERRIE
                ERRIE: u1,
                ///  WKUIE
                WKUIE: u1,
                ///  SLKIE
                SLKIE: u1,
                padding: u14,
            }),
            ///  interrupt enable register
            ESR: mmio.Mmio(packed struct(u32) {
                ///  EWGF
                EWGF: u1,
                ///  EPVF
                EPVF: u1,
                ///  BOFF
                BOFF: u1,
                reserved4: u1,
                ///  LEC
                LEC: u3,
                reserved16: u9,
                ///  TEC
                TEC: u8,
                ///  REC
                REC: u8,
            }),
            ///  bit timing register
            BTR: mmio.Mmio(packed struct(u32) {
                ///  BRP
                BRP: u10,
                reserved16: u6,
                ///  TS1
                TS1: u4,
                ///  TS2
                TS2: u3,
                reserved24: u1,
                ///  SJW
                SJW: u2,
                reserved30: u4,
                ///  LBKM
                LBKM: u1,
                ///  SILM
                SILM: u1,
            }),
            reserved384: [352]u8,
            ///  TX mailbox identifier register
            TI0R: mmio.Mmio(packed struct(u32) {
                ///  TXRQ
                TXRQ: u1,
                ///  RTR
                RTR: u1,
                ///  IDE
                IDE: u1,
                ///  EXID
                EXID: u18,
                ///  STID
                STID: u11,
            }),
            ///  mailbox data length control and time stamp register
            TDT0R: mmio.Mmio(packed struct(u32) {
                ///  DLC
                DLC: u4,
                reserved8: u4,
                ///  TGT
                TGT: u1,
                reserved16: u7,
                ///  TIME
                TIME: u16,
            }),
            ///  mailbox data low register
            TDL0R: mmio.Mmio(packed struct(u32) {
                ///  DATA0
                DATA0: u8,
                ///  DATA1
                DATA1: u8,
                ///  DATA2
                DATA2: u8,
                ///  DATA3
                DATA3: u8,
            }),
            ///  mailbox data high register
            TDH0R: mmio.Mmio(packed struct(u32) {
                ///  DATA4
                DATA4: u8,
                ///  DATA5
                DATA5: u8,
                ///  DATA6
                DATA6: u8,
                ///  DATA7
                DATA7: u8,
            }),
            ///  mailbox identifier register
            TI1R: mmio.Mmio(packed struct(u32) {
                ///  TXRQ
                TXRQ: u1,
                ///  RTR
                RTR: u1,
                ///  IDE
                IDE: u1,
                ///  EXID
                EXID: u18,
                ///  STID
                STID: u11,
            }),
            ///  mailbox data length control and time stamp register
            TDT1R: mmio.Mmio(packed struct(u32) {
                ///  DLC
                DLC: u4,
                reserved8: u4,
                ///  TGT
                TGT: u1,
                reserved16: u7,
                ///  TIME
                TIME: u16,
            }),
            ///  mailbox data low register
            TDL1R: mmio.Mmio(packed struct(u32) {
                ///  DATA0
                DATA0: u8,
                ///  DATA1
                DATA1: u8,
                ///  DATA2
                DATA2: u8,
                ///  DATA3
                DATA3: u8,
            }),
            ///  mailbox data high register
            TDH1R: mmio.Mmio(packed struct(u32) {
                ///  DATA4
                DATA4: u8,
                ///  DATA5
                DATA5: u8,
                ///  DATA6
                DATA6: u8,
                ///  DATA7
                DATA7: u8,
            }),
            ///  mailbox identifier register
            TI2R: mmio.Mmio(packed struct(u32) {
                ///  TXRQ
                TXRQ: u1,
                ///  RTR
                RTR: u1,
                ///  IDE
                IDE: u1,
                ///  EXID
                EXID: u18,
                ///  STID
                STID: u11,
            }),
            ///  mailbox data length control and time stamp register
            TDT2R: mmio.Mmio(packed struct(u32) {
                ///  DLC
                DLC: u4,
                reserved8: u4,
                ///  TGT
                TGT: u1,
                reserved16: u7,
                ///  TIME
                TIME: u16,
            }),
            ///  mailbox data low register
            TDL2R: mmio.Mmio(packed struct(u32) {
                ///  DATA0
                DATA0: u8,
                ///  DATA1
                DATA1: u8,
                ///  DATA2
                DATA2: u8,
                ///  DATA3
                DATA3: u8,
            }),
            ///  mailbox data high register
            TDH2R: mmio.Mmio(packed struct(u32) {
                ///  DATA4
                DATA4: u8,
                ///  DATA5
                DATA5: u8,
                ///  DATA6
                DATA6: u8,
                ///  DATA7
                DATA7: u8,
            }),
            ///  receive FIFO mailbox identifier register
            RI0R: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  RTR
                RTR: u1,
                ///  IDE
                IDE: u1,
                ///  EXID
                EXID: u18,
                ///  STID
                STID: u11,
            }),
            ///  mailbox data high register
            RDT0R: mmio.Mmio(packed struct(u32) {
                ///  DLC
                DLC: u4,
                reserved8: u4,
                ///  FMI
                FMI: u8,
                ///  TIME
                TIME: u16,
            }),
            ///  mailbox data high register
            RDL0R: mmio.Mmio(packed struct(u32) {
                ///  DATA0
                DATA0: u8,
                ///  DATA1
                DATA1: u8,
                ///  DATA2
                DATA2: u8,
                ///  DATA3
                DATA3: u8,
            }),
            ///  receive FIFO mailbox data high register
            RDH0R: mmio.Mmio(packed struct(u32) {
                ///  DATA4
                DATA4: u8,
                ///  DATA5
                DATA5: u8,
                ///  DATA6
                DATA6: u8,
                ///  DATA7
                DATA7: u8,
            }),
            ///  mailbox data high register
            RI1R: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  RTR
                RTR: u1,
                ///  IDE
                IDE: u1,
                ///  EXID
                EXID: u18,
                ///  STID
                STID: u11,
            }),
            ///  mailbox data high register
            RDT1R: mmio.Mmio(packed struct(u32) {
                ///  DLC
                DLC: u4,
                reserved8: u4,
                ///  FMI
                FMI: u8,
                ///  TIME
                TIME: u16,
            }),
            ///  mailbox data high register
            RDL1R: mmio.Mmio(packed struct(u32) {
                ///  DATA0
                DATA0: u8,
                ///  DATA1
                DATA1: u8,
                ///  DATA2
                DATA2: u8,
                ///  DATA3
                DATA3: u8,
            }),
            ///  mailbox data high register
            RDH1R: mmio.Mmio(packed struct(u32) {
                ///  DATA4
                DATA4: u8,
                ///  DATA5
                DATA5: u8,
                ///  DATA6
                DATA6: u8,
                ///  DATA7
                DATA7: u8,
            }),
            reserved576: [112]u8,
            ///  Filter bank 0 register 1
            F0R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 0 register 2
            F0R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 1 register 1
            F1R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 1 register 2
            F1R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 2 register 1
            F2R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 2 register 2
            F2R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 3 register 1
            F3R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 3 register 2
            F3R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 4 register 1
            F4R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 4 register 2
            F4R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 5 register 1
            F5R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 5 register 2
            F5R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 6 register 1
            F6R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 6 register 2
            F6R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 7 register 1
            F7R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 7 register 2
            F7R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 8 register 1
            F8R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 8 register 2
            F8R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 9 register 1
            F9R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 9 register 2
            F9R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 10 register 1
            F10R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 10 register 2
            F10R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 11 register 1
            F11R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 11 register 2
            F11R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 4 register 1
            F12R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 12 register 2
            F12R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 13 register 1
            F13R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 13 register 2
            F13R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 14 register 1
            F14R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 14 register 2
            F14R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 15 register 1
            F15R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 15 register 2
            F15R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 16 register 1
            F16R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 16 register 2
            F16R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 17 register 1
            F17R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 17 register 2
            F17R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 18 register 1
            F18R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 18 register 2
            F18R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 19 register 1
            F19R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 19 register 2
            F19R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 20 register 1
            F20R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 20 register 2
            F20R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 21 register 1
            F21R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 21 register 2
            F21R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 22 register 1
            F22R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 22 register 2
            F22R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 23 register 1
            F23R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 23 register 2
            F23R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 24 register 1
            F24R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 24 register 2
            F24R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 25 register 1
            F25R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 25 register 2
            F25R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 26 register 1
            F26R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 26 register 2
            F26R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 27 register 1
            F27R1: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
            ///  Filter bank 27 register 2
            F27R2: mmio.Mmio(packed struct(u32) {
                ///  Filter bits
                FB0: u1,
                ///  Filter bits
                FB1: u1,
                ///  Filter bits
                FB2: u1,
                ///  Filter bits
                FB3: u1,
                ///  Filter bits
                FB4: u1,
                ///  Filter bits
                FB5: u1,
                ///  Filter bits
                FB6: u1,
                ///  Filter bits
                FB7: u1,
                ///  Filter bits
                FB8: u1,
                ///  Filter bits
                FB9: u1,
                ///  Filter bits
                FB10: u1,
                ///  Filter bits
                FB11: u1,
                ///  Filter bits
                FB12: u1,
                ///  Filter bits
                FB13: u1,
                ///  Filter bits
                FB14: u1,
                ///  Filter bits
                FB15: u1,
                ///  Filter bits
                FB16: u1,
                ///  Filter bits
                FB17: u1,
                ///  Filter bits
                FB18: u1,
                ///  Filter bits
                FB19: u1,
                ///  Filter bits
                FB20: u1,
                ///  Filter bits
                FB21: u1,
                ///  Filter bits
                FB22: u1,
                ///  Filter bits
                FB23: u1,
                ///  Filter bits
                FB24: u1,
                ///  Filter bits
                FB25: u1,
                ///  Filter bits
                FB26: u1,
                ///  Filter bits
                FB27: u1,
                ///  Filter bits
                FB28: u1,
                ///  Filter bits
                FB29: u1,
                ///  Filter bits
                FB30: u1,
                ///  Filter bits
                FB31: u1,
            }),
        };

        ///  Universal synchronous asynchronous receiver transmitter
        pub const LPUART1 = extern struct {
            ///  Control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  USART enable
                UE: u1,
                ///  USART enable in Stop mode
                UESM: u1,
                ///  Receiver enable
                RE: u1,
                ///  Transmitter enable
                TE: u1,
                ///  IDLE interrupt enable
                IDLEIE: u1,
                ///  RXNE interrupt enable
                RXNEIE: u1,
                ///  Transmission complete interrupt enable
                TCIE: u1,
                ///  interrupt enable
                TXEIE: u1,
                ///  PE interrupt enable
                PEIE: u1,
                ///  Parity selection
                PS: u1,
                ///  Parity control enable
                PCE: u1,
                ///  Receiver wakeup method
                WAKE: u1,
                ///  Word length
                M0: u1,
                ///  Mute mode enable
                MME: u1,
                ///  Character match interrupt enable
                CMIE: u1,
                reserved16: u1,
                ///  DEDT0
                DEDT0: u1,
                ///  DEDT1
                DEDT1: u1,
                ///  DEDT2
                DEDT2: u1,
                ///  DEDT3
                DEDT3: u1,
                ///  Driver Enable de-assertion time
                DEDT4: u1,
                ///  DEAT0
                DEAT0: u1,
                ///  DEAT1
                DEAT1: u1,
                ///  DEAT2
                DEAT2: u1,
                ///  DEAT3
                DEAT3: u1,
                ///  Driver Enable assertion time
                DEAT4: u1,
                reserved28: u2,
                ///  Word length
                M1: u1,
                padding: u3,
            }),
            ///  Control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                reserved4: u4,
                ///  7-bit Address Detection/4-bit Address Detection
                ADDM7: u1,
                reserved11: u6,
                ///  Clock enable
                CLKEN: u1,
                ///  STOP bits
                STOP: u2,
                reserved15: u1,
                ///  Swap TX/RX pins
                SWAP: u1,
                ///  RX pin active level inversion
                RXINV: u1,
                ///  TX pin active level inversion
                TXINV: u1,
                ///  Binary data inversion
                TAINV: u1,
                ///  Most significant bit first
                MSBFIRST: u1,
                reserved24: u4,
                ///  Address of the USART node
                ADD0_3: u4,
                ///  Address of the USART node
                ADD4_7: u4,
            }),
            ///  Control register 3
            CR3: mmio.Mmio(packed struct(u32) {
                ///  Error interrupt enable
                EIE: u1,
                reserved3: u2,
                ///  Half-duplex selection
                HDSEL: u1,
                reserved6: u2,
                ///  DMA enable receiver
                DMAR: u1,
                ///  DMA enable transmitter
                DMAT: u1,
                ///  RTS enable
                RTSE: u1,
                ///  CTS enable
                CTSE: u1,
                ///  CTS interrupt enable
                CTSIE: u1,
                reserved12: u1,
                ///  Overrun Disable
                OVRDIS: u1,
                ///  DMA Disable on Reception Error
                DDRE: u1,
                ///  Driver enable mode
                DEM: u1,
                ///  Driver enable polarity selection
                DEP: u1,
                reserved20: u4,
                ///  Wakeup from Stop mode interrupt flag selection
                WUS: u2,
                ///  Wakeup from Stop mode interrupt enable
                WUFIE: u1,
                padding: u9,
            }),
            ///  Baud rate register
            BRR: mmio.Mmio(packed struct(u32) {
                ///  BRR
                BRR: u20,
                padding: u12,
            }),
            reserved24: [8]u8,
            ///  Request register
            RQR: mmio.Mmio(packed struct(u32) {
                reserved1: u1,
                ///  Send break request
                SBKRQ: u1,
                ///  Mute mode request
                MMRQ: u1,
                ///  Receive data flush request
                RXFRQ: u1,
                padding: u28,
            }),
            ///  Interrupt & status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  PE
                PE: u1,
                ///  FE
                FE: u1,
                ///  NF
                NF: u1,
                ///  ORE
                ORE: u1,
                ///  IDLE
                IDLE: u1,
                ///  RXNE
                RXNE: u1,
                ///  TC
                TC: u1,
                ///  TXE
                TXE: u1,
                reserved9: u1,
                ///  CTSIF
                CTSIF: u1,
                ///  CTS
                CTS: u1,
                reserved16: u5,
                ///  BUSY
                BUSY: u1,
                ///  CMF
                CMF: u1,
                ///  SBKF
                SBKF: u1,
                ///  RWU
                RWU: u1,
                ///  WUF
                WUF: u1,
                ///  TEACK
                TEACK: u1,
                ///  REACK
                REACK: u1,
                padding: u9,
            }),
            ///  Interrupt flag clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  Parity error clear flag
                PECF: u1,
                ///  Framing error clear flag
                FECF: u1,
                ///  Noise detected clear flag
                NCF: u1,
                ///  Overrun error clear flag
                ORECF: u1,
                ///  Idle line detected clear flag
                IDLECF: u1,
                reserved6: u1,
                ///  Transmission complete clear flag
                TCCF: u1,
                reserved9: u2,
                ///  CTS clear flag
                CTSCF: u1,
                reserved17: u7,
                ///  Character match clear flag
                CMCF: u1,
                reserved20: u2,
                ///  Wakeup from Stop mode clear flag
                WUCF: u1,
                padding: u11,
            }),
            ///  Receive data register
            RDR: mmio.Mmio(packed struct(u32) {
                ///  Receive data value
                RDR: u9,
                padding: u23,
            }),
            ///  Transmit data register
            TDR: mmio.Mmio(packed struct(u32) {
                ///  Transmit data value
                TDR: u9,
                padding: u23,
            }),
        };

        ///  Serial peripheral interface/Inter-IC sound
        pub const SPI1 = extern struct {
            ///  control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Clock phase
                CPHA: u1,
                ///  Clock polarity
                CPOL: u1,
                ///  Master selection
                MSTR: u1,
                ///  Baud rate control
                BR: u3,
                ///  SPI enable
                SPE: u1,
                ///  Frame format
                LSBFIRST: u1,
                ///  Internal slave select
                SSI: u1,
                ///  Software slave management
                SSM: u1,
                ///  Receive only
                RXONLY: u1,
                ///  Data frame format
                DFF: u1,
                ///  CRC transfer next
                CRCNEXT: u1,
                ///  Hardware CRC calculation enable
                CRCEN: u1,
                ///  Output enable in bidirectional mode
                BIDIOE: u1,
                ///  Bidirectional data mode enable
                BIDIMODE: u1,
                padding: u16,
            }),
            ///  control register 2
            CR2: mmio.Mmio(packed struct(u32) {
                ///  Rx buffer DMA enable
                RXDMAEN: u1,
                ///  Tx buffer DMA enable
                TXDMAEN: u1,
                ///  SS output enable
                SSOE: u1,
                ///  NSS pulse management
                NSSP: u1,
                ///  Frame format
                FRF: u1,
                ///  Error interrupt enable
                ERRIE: u1,
                ///  RX buffer not empty interrupt enable
                RXNEIE: u1,
                ///  Tx buffer empty interrupt enable
                TXEIE: u1,
                ///  Data size
                DS: u4,
                ///  FIFO reception threshold
                FRXTH: u1,
                ///  Last DMA transfer for reception
                LDMA_RX: u1,
                ///  Last DMA transfer for transmission
                LDMA_TX: u1,
                padding: u17,
            }),
            ///  status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Receive buffer not empty
                RXNE: u1,
                ///  Transmit buffer empty
                TXE: u1,
                reserved4: u2,
                ///  CRC error flag
                CRCERR: u1,
                ///  Mode fault
                MODF: u1,
                ///  Overrun flag
                OVR: u1,
                ///  Busy flag
                BSY: u1,
                ///  TI frame format error
                TIFRFE: u1,
                ///  FIFO reception level
                FRLVL: u2,
                ///  FIFO transmission level
                FTLVL: u2,
                padding: u19,
            }),
            ///  data register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Data register
                DR: u16,
                padding: u16,
            }),
            ///  CRC polynomial register
            CRCPR: mmio.Mmio(packed struct(u32) {
                ///  CRC polynomial register
                CRCPOLY: u16,
                padding: u16,
            }),
            ///  RX CRC register
            RXCRCR: mmio.Mmio(packed struct(u32) {
                ///  Rx CRC register
                RxCRC: u16,
                padding: u16,
            }),
            ///  TX CRC register
            TXCRCR: mmio.Mmio(packed struct(u32) {
                ///  Tx CRC register
                TxCRC: u16,
                padding: u16,
            }),
        };

        ///  Voltage reference buffer
        pub const VREFBUF = extern struct {
            ///  VREF control and status register
            CSR: mmio.Mmio(packed struct(u32) {
                ///  Voltage reference buffer enable
                ENVR: u1,
                ///  High impedance mode
                HIZ: u1,
                ///  Voltage reference scale
                VRS: u1,
                ///  Voltage reference buffer ready
                VRR: u1,
                padding: u28,
            }),
            ///  calibration control register
            CCR: mmio.Mmio(packed struct(u32) {
                ///  Trimming code
                TRIM: u6,
                padding: u26,
            }),
        };

        ///  External interrupt/event controller
        pub const EXTI = extern struct {
            ///  Interrupt mask register
            IMR1: mmio.Mmio(packed struct(u32) {
                ///  Interrupt Mask on line 0
                MR0: u1,
                ///  Interrupt Mask on line 1
                MR1: u1,
                ///  Interrupt Mask on line 2
                MR2: u1,
                ///  Interrupt Mask on line 3
                MR3: u1,
                ///  Interrupt Mask on line 4
                MR4: u1,
                ///  Interrupt Mask on line 5
                MR5: u1,
                ///  Interrupt Mask on line 6
                MR6: u1,
                ///  Interrupt Mask on line 7
                MR7: u1,
                ///  Interrupt Mask on line 8
                MR8: u1,
                ///  Interrupt Mask on line 9
                MR9: u1,
                ///  Interrupt Mask on line 10
                MR10: u1,
                ///  Interrupt Mask on line 11
                MR11: u1,
                ///  Interrupt Mask on line 12
                MR12: u1,
                ///  Interrupt Mask on line 13
                MR13: u1,
                ///  Interrupt Mask on line 14
                MR14: u1,
                ///  Interrupt Mask on line 15
                MR15: u1,
                ///  Interrupt Mask on line 16
                MR16: u1,
                ///  Interrupt Mask on line 17
                MR17: u1,
                ///  Interrupt Mask on line 18
                MR18: u1,
                ///  Interrupt Mask on line 19
                MR19: u1,
                ///  Interrupt Mask on line 20
                MR20: u1,
                ///  Interrupt Mask on line 21
                MR21: u1,
                ///  Interrupt Mask on line 22
                MR22: u1,
                ///  Interrupt Mask on line 23
                MR23: u1,
                ///  Interrupt Mask on line 24
                MR24: u1,
                ///  Interrupt Mask on line 25
                MR25: u1,
                ///  Interrupt Mask on line 26
                MR26: u1,
                ///  Interrupt Mask on line 27
                MR27: u1,
                ///  Interrupt Mask on line 28
                MR28: u1,
                ///  Interrupt Mask on line 29
                MR29: u1,
                ///  Interrupt Mask on line 30
                MR30: u1,
                ///  Interrupt Mask on line 31
                MR31: u1,
            }),
            ///  Event mask register
            EMR1: mmio.Mmio(packed struct(u32) {
                ///  Event Mask on line 0
                MR0: u1,
                ///  Event Mask on line 1
                MR1: u1,
                ///  Event Mask on line 2
                MR2: u1,
                ///  Event Mask on line 3
                MR3: u1,
                ///  Event Mask on line 4
                MR4: u1,
                ///  Event Mask on line 5
                MR5: u1,
                ///  Event Mask on line 6
                MR6: u1,
                ///  Event Mask on line 7
                MR7: u1,
                ///  Event Mask on line 8
                MR8: u1,
                ///  Event Mask on line 9
                MR9: u1,
                ///  Event Mask on line 10
                MR10: u1,
                ///  Event Mask on line 11
                MR11: u1,
                ///  Event Mask on line 12
                MR12: u1,
                ///  Event Mask on line 13
                MR13: u1,
                ///  Event Mask on line 14
                MR14: u1,
                ///  Event Mask on line 15
                MR15: u1,
                ///  Event Mask on line 16
                MR16: u1,
                ///  Event Mask on line 17
                MR17: u1,
                ///  Event Mask on line 18
                MR18: u1,
                ///  Event Mask on line 19
                MR19: u1,
                ///  Event Mask on line 20
                MR20: u1,
                ///  Event Mask on line 21
                MR21: u1,
                ///  Event Mask on line 22
                MR22: u1,
                ///  Event Mask on line 23
                MR23: u1,
                ///  Event Mask on line 24
                MR24: u1,
                ///  Event Mask on line 25
                MR25: u1,
                ///  Event Mask on line 26
                MR26: u1,
                ///  Event Mask on line 27
                MR27: u1,
                ///  Event Mask on line 28
                MR28: u1,
                ///  Event Mask on line 29
                MR29: u1,
                ///  Event Mask on line 30
                MR30: u1,
                ///  Event Mask on line 31
                MR31: u1,
            }),
            ///  Rising Trigger selection register
            RTSR1: mmio.Mmio(packed struct(u32) {
                ///  Rising trigger event configuration of line 0
                TR0: u1,
                ///  Rising trigger event configuration of line 1
                TR1: u1,
                ///  Rising trigger event configuration of line 2
                TR2: u1,
                ///  Rising trigger event configuration of line 3
                TR3: u1,
                ///  Rising trigger event configuration of line 4
                TR4: u1,
                ///  Rising trigger event configuration of line 5
                TR5: u1,
                ///  Rising trigger event configuration of line 6
                TR6: u1,
                ///  Rising trigger event configuration of line 7
                TR7: u1,
                ///  Rising trigger event configuration of line 8
                TR8: u1,
                ///  Rising trigger event configuration of line 9
                TR9: u1,
                ///  Rising trigger event configuration of line 10
                TR10: u1,
                ///  Rising trigger event configuration of line 11
                TR11: u1,
                ///  Rising trigger event configuration of line 12
                TR12: u1,
                ///  Rising trigger event configuration of line 13
                TR13: u1,
                ///  Rising trigger event configuration of line 14
                TR14: u1,
                ///  Rising trigger event configuration of line 15
                TR15: u1,
                ///  Rising trigger event configuration of line 16
                TR16: u1,
                reserved18: u1,
                ///  Rising trigger event configuration of line 18
                TR18: u1,
                ///  Rising trigger event configuration of line 19
                TR19: u1,
                ///  Rising trigger event configuration of line 20
                TR20: u1,
                ///  Rising trigger event configuration of line 21
                TR21: u1,
                ///  Rising trigger event configuration of line 22
                TR22: u1,
                padding: u9,
            }),
            ///  Falling Trigger selection register
            FTSR1: mmio.Mmio(packed struct(u32) {
                ///  Falling trigger event configuration of line 0
                TR0: u1,
                ///  Falling trigger event configuration of line 1
                TR1: u1,
                ///  Falling trigger event configuration of line 2
                TR2: u1,
                ///  Falling trigger event configuration of line 3
                TR3: u1,
                ///  Falling trigger event configuration of line 4
                TR4: u1,
                ///  Falling trigger event configuration of line 5
                TR5: u1,
                ///  Falling trigger event configuration of line 6
                TR6: u1,
                ///  Falling trigger event configuration of line 7
                TR7: u1,
                ///  Falling trigger event configuration of line 8
                TR8: u1,
                ///  Falling trigger event configuration of line 9
                TR9: u1,
                ///  Falling trigger event configuration of line 10
                TR10: u1,
                ///  Falling trigger event configuration of line 11
                TR11: u1,
                ///  Falling trigger event configuration of line 12
                TR12: u1,
                ///  Falling trigger event configuration of line 13
                TR13: u1,
                ///  Falling trigger event configuration of line 14
                TR14: u1,
                ///  Falling trigger event configuration of line 15
                TR15: u1,
                ///  Falling trigger event configuration of line 16
                TR16: u1,
                reserved18: u1,
                ///  Falling trigger event configuration of line 18
                TR18: u1,
                ///  Falling trigger event configuration of line 19
                TR19: u1,
                ///  Falling trigger event configuration of line 20
                TR20: u1,
                ///  Falling trigger event configuration of line 21
                TR21: u1,
                ///  Falling trigger event configuration of line 22
                TR22: u1,
                padding: u9,
            }),
            ///  Software interrupt event register
            SWIER1: mmio.Mmio(packed struct(u32) {
                ///  Software Interrupt on line 0
                SWIER0: u1,
                ///  Software Interrupt on line 1
                SWIER1: u1,
                ///  Software Interrupt on line 2
                SWIER2: u1,
                ///  Software Interrupt on line 3
                SWIER3: u1,
                ///  Software Interrupt on line 4
                SWIER4: u1,
                ///  Software Interrupt on line 5
                SWIER5: u1,
                ///  Software Interrupt on line 6
                SWIER6: u1,
                ///  Software Interrupt on line 7
                SWIER7: u1,
                ///  Software Interrupt on line 8
                SWIER8: u1,
                ///  Software Interrupt on line 9
                SWIER9: u1,
                ///  Software Interrupt on line 10
                SWIER10: u1,
                ///  Software Interrupt on line 11
                SWIER11: u1,
                ///  Software Interrupt on line 12
                SWIER12: u1,
                ///  Software Interrupt on line 13
                SWIER13: u1,
                ///  Software Interrupt on line 14
                SWIER14: u1,
                ///  Software Interrupt on line 15
                SWIER15: u1,
                ///  Software Interrupt on line 16
                SWIER16: u1,
                reserved18: u1,
                ///  Software Interrupt on line 18
                SWIER18: u1,
                ///  Software Interrupt on line 19
                SWIER19: u1,
                ///  Software Interrupt on line 20
                SWIER20: u1,
                ///  Software Interrupt on line 21
                SWIER21: u1,
                ///  Software Interrupt on line 22
                SWIER22: u1,
                padding: u9,
            }),
            ///  Pending register
            PR1: mmio.Mmio(packed struct(u32) {
                ///  Pending bit 0
                PR0: u1,
                ///  Pending bit 1
                PR1: u1,
                ///  Pending bit 2
                PR2: u1,
                ///  Pending bit 3
                PR3: u1,
                ///  Pending bit 4
                PR4: u1,
                ///  Pending bit 5
                PR5: u1,
                ///  Pending bit 6
                PR6: u1,
                ///  Pending bit 7
                PR7: u1,
                ///  Pending bit 8
                PR8: u1,
                ///  Pending bit 9
                PR9: u1,
                ///  Pending bit 10
                PR10: u1,
                ///  Pending bit 11
                PR11: u1,
                ///  Pending bit 12
                PR12: u1,
                ///  Pending bit 13
                PR13: u1,
                ///  Pending bit 14
                PR14: u1,
                ///  Pending bit 15
                PR15: u1,
                ///  Pending bit 16
                PR16: u1,
                reserved18: u1,
                ///  Pending bit 18
                PR18: u1,
                ///  Pending bit 19
                PR19: u1,
                ///  Pending bit 20
                PR20: u1,
                ///  Pending bit 21
                PR21: u1,
                ///  Pending bit 22
                PR22: u1,
                padding: u9,
            }),
            reserved32: [8]u8,
            ///  Interrupt mask register
            IMR2: mmio.Mmio(packed struct(u32) {
                ///  Interrupt Mask on external/internal line 32
                MR32: u1,
                ///  Interrupt Mask on external/internal line 33
                MR33: u1,
                ///  Interrupt Mask on external/internal line 34
                MR34: u1,
                ///  Interrupt Mask on external/internal line 35
                MR35: u1,
                ///  Interrupt Mask on external/internal line 36
                MR36: u1,
                ///  Interrupt Mask on external/internal line 37
                MR37: u1,
                ///  Interrupt Mask on external/internal line 38
                MR38: u1,
                ///  Interrupt Mask on external/internal line 39
                MR39: u1,
                padding: u24,
            }),
            ///  Event mask register
            EMR2: mmio.Mmio(packed struct(u32) {
                ///  Event mask on external/internal line 32
                MR32: u1,
                ///  Event mask on external/internal line 33
                MR33: u1,
                ///  Event mask on external/internal line 34
                MR34: u1,
                ///  Event mask on external/internal line 35
                MR35: u1,
                ///  Event mask on external/internal line 36
                MR36: u1,
                ///  Event mask on external/internal line 37
                MR37: u1,
                ///  Event mask on external/internal line 38
                MR38: u1,
                ///  Event mask on external/internal line 39
                MR39: u1,
                padding: u24,
            }),
            ///  Rising Trigger selection register
            RTSR2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Rising trigger event configuration bit of line 35
                RT35: u1,
                ///  Rising trigger event configuration bit of line 36
                RT36: u1,
                ///  Rising trigger event configuration bit of line 37
                RT37: u1,
                ///  Rising trigger event configuration bit of line 38
                RT38: u1,
                padding: u25,
            }),
            ///  Falling Trigger selection register
            FTSR2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Falling trigger event configuration bit of line 35
                FT35: u1,
                ///  Falling trigger event configuration bit of line 36
                FT36: u1,
                ///  Falling trigger event configuration bit of line 37
                FT37: u1,
                ///  Falling trigger event configuration bit of line 38
                FT38: u1,
                padding: u25,
            }),
            ///  Software interrupt event register
            SWIER2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Software interrupt on line 35
                SWI35: u1,
                ///  Software interrupt on line 36
                SWI36: u1,
                ///  Software interrupt on line 37
                SWI37: u1,
                ///  Software interrupt on line 38
                SWI38: u1,
                padding: u25,
            }),
            ///  Pending register
            PR2: mmio.Mmio(packed struct(u32) {
                reserved3: u3,
                ///  Pending interrupt flag on line 35
                PIF35: u1,
                ///  Pending interrupt flag on line 36
                PIF36: u1,
                ///  Pending interrupt flag on line 37
                PIF37: u1,
                ///  Pending interrupt flag on line 38
                PIF38: u1,
                padding: u25,
            }),
        };

        ///  Secure digital input/output interface
        pub const SDMMC = extern struct {
            ///  power control register
            POWER: mmio.Mmio(packed struct(u32) {
                ///  PWRCTRL
                PWRCTRL: u2,
                padding: u30,
            }),
            ///  SDI clock control register
            CLKCR: mmio.Mmio(packed struct(u32) {
                ///  Clock divide factor
                CLKDIV: u8,
                ///  Clock enable bit
                CLKEN: u1,
                ///  Power saving configuration bit
                PWRSAV: u1,
                ///  Clock divider bypass enable bit
                BYPASS: u1,
                ///  Wide bus mode enable bit
                WIDBUS: u2,
                ///  SDIO_CK dephasing selection bit
                NEGEDGE: u1,
                ///  HW Flow Control enable
                HWFC_EN: u1,
                padding: u17,
            }),
            ///  argument register
            ARG: mmio.Mmio(packed struct(u32) {
                ///  Command argument
                CMDARG: u32,
            }),
            ///  command register
            CMD: mmio.Mmio(packed struct(u32) {
                ///  Command index
                CMDINDEX: u6,
                ///  Wait for response bits
                WAITRESP: u2,
                ///  CPSM waits for interrupt request
                WAITINT: u1,
                ///  CPSM Waits for ends of data transfer (CmdPend internal signal)
                WAITPEND: u1,
                ///  Command path state machine (CPSM) Enable bit
                CPSMEN: u1,
                ///  SD I/O suspend command
                SDIOSuspend: u1,
                ///  Enable CMD completion
                ENCMDcompl: u1,
                ///  not Interrupt Enable
                nIEN: u1,
                ///  CE-ATA command
                CE_ATACMD: u1,
                padding: u17,
            }),
            ///  command response register
            RESPCMD: mmio.Mmio(packed struct(u32) {
                ///  Response command index
                RESPCMD: u6,
                padding: u26,
            }),
            ///  response 1..4 register
            RESP1: mmio.Mmio(packed struct(u32) {
                ///  see Table 132
                CARDSTATUS1: u32,
            }),
            ///  response 1..4 register
            RESP2: mmio.Mmio(packed struct(u32) {
                ///  see Table 132
                CARDSTATUS2: u32,
            }),
            ///  response 1..4 register
            RESP3: mmio.Mmio(packed struct(u32) {
                ///  see Table 132
                CARDSTATUS3: u32,
            }),
            ///  response 1..4 register
            RESP4: mmio.Mmio(packed struct(u32) {
                ///  see Table 132
                CARDSTATUS4: u32,
            }),
            ///  data timer register
            DTIMER: mmio.Mmio(packed struct(u32) {
                ///  Data timeout period
                DATATIME: u32,
            }),
            ///  data length register
            DLEN: mmio.Mmio(packed struct(u32) {
                ///  Data length value
                DATALENGTH: u25,
                padding: u7,
            }),
            ///  data control register
            DCTRL: mmio.Mmio(packed struct(u32) {
                ///  DTEN
                DTEN: u1,
                ///  Data transfer direction selection
                DTDIR: u1,
                ///  Data transfer mode selection 1: Stream or SDIO multibyte data transfer
                DTMODE: u1,
                ///  DMA enable bit
                DMAEN: u1,
                ///  Data block size
                DBLOCKSIZE: u4,
                ///  Read wait start
                RWSTART: u1,
                ///  Read wait stop
                RWSTOP: u1,
                ///  Read wait mode
                RWMOD: u1,
                ///  SD I/O enable functions
                SDIOEN: u1,
                padding: u20,
            }),
            ///  data counter register
            DCOUNT: mmio.Mmio(packed struct(u32) {
                ///  Data count value
                DATACOUNT: u25,
                padding: u7,
            }),
            ///  status register
            STA: mmio.Mmio(packed struct(u32) {
                ///  Command response received (CRC check failed)
                CCRCFAIL: u1,
                ///  Data block sent/received (CRC check failed)
                DCRCFAIL: u1,
                ///  Command response timeout
                CTIMEOUT: u1,
                ///  Data timeout
                DTIMEOUT: u1,
                ///  Transmit FIFO underrun error
                TXUNDERR: u1,
                ///  Received FIFO overrun error
                RXOVERR: u1,
                ///  Command response received (CRC check passed)
                CMDREND: u1,
                ///  Command sent (no response required)
                CMDSENT: u1,
                ///  Data end (data counter, SDIDCOUNT, is zero)
                DATAEND: u1,
                ///  Start bit not detected on all data signals in wide bus mode
                STBITERR: u1,
                ///  Data block sent/received (CRC check passed)
                DBCKEND: u1,
                ///  Command transfer in progress
                CMDACT: u1,
                ///  Data transmit in progress
                TXACT: u1,
                ///  Data receive in progress
                RXACT: u1,
                ///  Transmit FIFO half empty: at least 8 words can be written into the FIFO
                TXFIFOHE: u1,
                ///  Receive FIFO half full: there are at least 8 words in the FIFO
                RXFIFOHF: u1,
                ///  Transmit FIFO full
                TXFIFOF: u1,
                ///  Receive FIFO full
                RXFIFOF: u1,
                ///  Transmit FIFO empty
                TXFIFOE: u1,
                ///  Receive FIFO empty
                RXFIFOE: u1,
                ///  Data available in transmit FIFO
                TXDAVL: u1,
                ///  Data available in receive FIFO
                RXDAVL: u1,
                ///  SDIO interrupt received
                SDIOIT: u1,
                ///  CE-ATA command completion signal received for CMD61
                CEATAEND: u1,
                padding: u8,
            }),
            ///  interrupt clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  CCRCFAIL flag clear bit
                CCRCFAILC: u1,
                ///  DCRCFAIL flag clear bit
                DCRCFAILC: u1,
                ///  CTIMEOUT flag clear bit
                CTIMEOUTC: u1,
                ///  DTIMEOUT flag clear bit
                DTIMEOUTC: u1,
                ///  TXUNDERR flag clear bit
                TXUNDERRC: u1,
                ///  RXOVERR flag clear bit
                RXOVERRC: u1,
                ///  CMDREND flag clear bit
                CMDRENDC: u1,
                ///  CMDSENT flag clear bit
                CMDSENTC: u1,
                ///  DATAEND flag clear bit
                DATAENDC: u1,
                ///  STBITERR flag clear bit
                STBITERRC: u1,
                ///  DBCKEND flag clear bit
                DBCKENDC: u1,
                reserved22: u11,
                ///  SDIOIT flag clear bit
                SDIOITC: u1,
                ///  CEATAEND flag clear bit
                CEATAENDC: u1,
                padding: u8,
            }),
            ///  mask register
            MASK: mmio.Mmio(packed struct(u32) {
                ///  Command CRC fail interrupt enable
                CCRCFAILIE: u1,
                ///  Data CRC fail interrupt enable
                DCRCFAILIE: u1,
                ///  Command timeout interrupt enable
                CTIMEOUTIE: u1,
                ///  Data timeout interrupt enable
                DTIMEOUTIE: u1,
                ///  Tx FIFO underrun error interrupt enable
                TXUNDERRIE: u1,
                ///  Rx FIFO overrun error interrupt enable
                RXOVERRIE: u1,
                ///  Command response received interrupt enable
                CMDRENDIE: u1,
                ///  Command sent interrupt enable
                CMDSENTIE: u1,
                ///  Data end interrupt enable
                DATAENDIE: u1,
                ///  Start bit error interrupt enable
                STBITERRIE: u1,
                ///  Data block end interrupt enable
                DBCKENDIE: u1,
                ///  Command acting interrupt enable
                CMDACTIE: u1,
                ///  Data transmit acting interrupt enable
                TXACTIE: u1,
                ///  Data receive acting interrupt enable
                RXACTIE: u1,
                ///  Tx FIFO half empty interrupt enable
                TXFIFOHEIE: u1,
                ///  Rx FIFO half full interrupt enable
                RXFIFOHFIE: u1,
                ///  Tx FIFO full interrupt enable
                TXFIFOFIE: u1,
                ///  Rx FIFO full interrupt enable
                RXFIFOFIE: u1,
                ///  Tx FIFO empty interrupt enable
                TXFIFOEIE: u1,
                ///  Rx FIFO empty interrupt enable
                RXFIFOEIE: u1,
                ///  Data available in Tx FIFO interrupt enable
                TXDAVLIE: u1,
                ///  Data available in Rx FIFO interrupt enable
                RXDAVLIE: u1,
                ///  SDIO mode interrupt received interrupt enable
                SDIOITIE: u1,
                ///  CE-ATA command completion signal received interrupt enable
                CEATAENDIE: u1,
                padding: u8,
            }),
            reserved72: [8]u8,
            ///  FIFO counter register
            FIFOCNT: mmio.Mmio(packed struct(u32) {
                ///  Remaining number of words to be written to or read from the FIFO
                FIFOCOUNT: u24,
                padding: u8,
            }),
            reserved128: [52]u8,
            ///  data FIFO register
            FIFO: mmio.Mmio(packed struct(u32) {
                ///  Receive and transmit FIFO data
                FIFOData: u32,
            }),
        };
    };
};
