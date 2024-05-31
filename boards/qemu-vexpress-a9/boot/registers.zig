const mmio = @import("mmio.zig");

pub const UART1 = @as(*volatile types.UART, @ptrFromInt(0x10009000));

pub const types = struct {
    ///  Random number generator
    pub const UART = extern struct {
        // FS_HPRT: mmio.Mmio(packed struct(u32) {

        /// DR
        DR: mmio.Mmio(packed struct(u32) {
            DATA: u8 = 0,
            FE: u1 = 0,
            PE: u1 = 0,
            BE: u1 = 0,
            OE: u1 = 0,
            reserved: u20 = 0,
        }),

        /// RSRECR
        RSRECR: mmio.Mmio(packed struct(u32) {
            FE: u1 = 0,
            PE: u1 = 0,
            BE: u1 = 0,
            OE: u1 = 0,
            reserved: u28 = 0,
        }),

        padding_0x08_0x0c: u32,
        padding_0x0c_0x10: u32,
        padding_0x10_0x14: u32,

        /// FR
        FR: mmio.Mmio(packed struct(u32) {
            CTS: u1 = 0,
            DSR: u1 = 0,
            DCD: u1 = 0,
            BUSY: u1 = 0,
            RXFE: u1 = 0,
            TXFF: u1 = 0,
            RXFF: u1 = 0,
            TXFE: u1 = 0,
            RI: u1 = 0,

            reserved: u23 = 0,
        }),

        padding_0x1c_0x20: u32,
        padding_0x20_0x24: u32,
        padding_0x24_0x28: u32,
        padding_0x2c_0x30: u32,

        /// CR
        CR: mmio.Mmio(packed struct(u32) {
            UARTEN: u1 = 0,
            SIREN: u1 = 0,
            SIRLP: u1 = 0,
            reserved1: u4 = 0,

            LBE: u1 = 0,
            TXE: u1 = 0,
            RXE: u1 = 0,
            DTR: u1 = 0,
            RTS: u1 = 0,
            Out1: u1 = 0,
            Out2: u1 = 0,
            RTSEn: u1 = 0,
            CTSEn: u1 = 0,

            reserved2: u16 = 0,
        }),
    };
};
