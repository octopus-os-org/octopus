pub const IrqId = struct {
    pub const Reset = 1;
    pub const NMI = 2;
    pub const HardFault = 3;
    pub const MemManageFault = 4;
    pub const BusFault = 5;
    pub const UsageFault = 6;
    pub const SVCall = 11;
    pub const DebugMonitor = 12;
    pub const PendSV = 14;
    pub const SysTick = 15;
};

// // interrupt identifier
// const IrqIdEnum = enum(u8) {
//     Reset = 1,
//     NMI = 2,
//     HardFault = 3,
//     MemManageFault = 4,
//     BusFault = 5,
//     UsageFault = 6,

//     SVCall = 11,
//     DebugMonitor = 12,
//     PendSV = 14,
//     SysTick = 15,
// };

// test "set enum ordinal value" {
//     try expect(@enumToInt(IrqIdEnum.Reset) == 1);
// }
