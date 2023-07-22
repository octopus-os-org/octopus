pub const CMD0 = 0;
pub const CMD1 = 1;
pub const CMD2 = 2;
pub const CMD3 = 3;
pub const CMD4 = 4;
pub const CMD5 = 5;
pub const CMD6 = 6;
pub const CMD7 = 7;
pub const CMD8 = 8;
pub const CMD9 = 9;
pub const CMD10 = 10;
pub const CMD11 = 11;
pub const CMD12 = 12;
pub const CMD13 = 13;
pub const CMD14 = 14;
pub const CMD15 = 15;
pub const CMD16 = 16;
pub const CMD17 = 17;
pub const CMD18 = 18;
pub const CMD19 = 19;
pub const CMD20 = 20;
pub const CMD21 = 21;
pub const CMD22 = 22;
pub const CMD23 = 23;
pub const CMD24 = 24;
pub const CMD25 = 25;
pub const CMD26 = 26;
pub const CMD27 = 27;
pub const CMD28 = 28;
pub const CMD29 = 29;
pub const CMD30 = 30;
pub const CMD31 = 31;
pub const CMD32 = 32;
pub const CMD33 = 33;
pub const CMD34 = 34;
pub const CMD35 = 35;
pub const CMD36 = 36;
pub const CMD37 = 37;
pub const CMD38 = 38;
pub const CMD39 = 39;
pub const CMD40 = 40;
pub const CMD41 = 41;
pub const CMD42 = 42;
pub const CMD43 = 43;
pub const CMD44 = 44;
pub const CMD45 = 45;
pub const CMD46 = 46;
pub const CMD47 = 47;
pub const CMD48 = 48;
pub const CMD49 = 49;
pub const CMD50 = 50;
pub const CMD51 = 51;
pub const CMD52 = 52;
pub const CMD53 = 53;
pub const CMD54 = 54;
pub const CMD55 = 55;
pub const CMD56 = 56;
pub const CMD57 = 57;
pub const CMD58 = 58;
pub const CMD59 = 59;
pub const CMD60 = 60;
pub const CMD61 = 61;
pub const CMD62 = 62;
pub const CMD63 = 63;

/// The value is an fixed-size-17B array and the both byte-order and bit-order of a byte should be LSB
/// array[0] bit position in whole response should be [0:7], array[1] will be [8:15] and so on,
/// the bit-order of array[x] should be like (array[0] & 0x1) representing whole-resp-bit[0]
// Thinking: Is useless to keep crc-filed,...? Maybe should remove them
pub const CmdResp = struct {
    data: [17]u8 = undefined,

    const Self = @This();

    /// Extract 32-bit data part from the response
    pub fn val32bits(self: *Self) u32 {
        // Will get panic at runtime (arm) when using the following style. Why?
        // return (@as(u32, self.data[4]) << 24) |
        //     (@as(u32, self.data[3]) << 16) |
        //     (@as(u32, self.data[2]) << 8) |
        //     self.data[1];
        var ret: u32 = 0;
        ret = (@as(u32, self.data[4]) << 24);
        ret |= (@as(u32, self.data[3]) << 16);
        ret |= (@as(u32, self.data[2]) << 8);
        ret |= (@as(u32, self.data[1]) << 0);
        return ret;
    }

    /// Extract 128-bit data part from the response
    pub fn val128bits(self: *Self) u128 {
        // note: the same questions with val32bits
        var ret: u128 = 0;
        ret = (@as(u128, self.data[16]) << (15 * 8));
        ret |= (@as(u128, self.data[15]) << (14 * 8));
        ret |= (@as(u128, self.data[14]) << (13 * 8));
        ret |= (@as(u128, self.data[13]) << (12 * 8));
        ret |= (@as(u128, self.data[12]) << (11 * 8));
        ret |= (@as(u128, self.data[11]) << (10 * 8));
        ret |= (@as(u128, self.data[10]) << (9 * 8));
        ret |= (@as(u128, self.data[9]) << (8 * 8));
        ret |= (@as(u128, self.data[8]) << (7 * 8));
        ret |= (@as(u128, self.data[7]) << (6 * 8));
        ret |= (@as(u128, self.data[6]) << (5 * 8));
        ret |= (@as(u128, self.data[5]) << (4 * 8));
        ret |= (@as(u128, self.data[4]) << (3 * 8));
        ret |= (@as(u128, self.data[3]) << (2 * 8));
        ret |= (@as(u128, self.data[2]) << (1 * 8));
        ret |= (@as(u128, self.data[1]) << (0 * 8));

        return ret;
    }

    pub fn isBusyOCR(self: *Self) bool {
        return (self.val32bits() & @as(u32, 1 << 31)) == 0;
    }

    fn _u32_to_array_u8(src: u32) [4]u8 {
        var ret = [4]u8{
            @as(u8, @truncate(src & 0xff)),
            @as(u8, @truncate((src >> 8) & 0xff)),
            @as(u8, @truncate((src >> 16) & 0xff)),
            @as(u8, @truncate((src >> 24) & 0xff)),
        };

        return ret;
    }

    /// set data only
    /// used by lower-level
    pub fn setDataByArrayU32(self: *Self, src: [4]u32) void {
        var idx: u8 = 1;
        for (src) |v| {
            var arr = _u32_to_array_u8(v);
            for (arr) |byte| {
                self.data[idx] = byte;
                idx += 1;
            }
        }
    }
};

/// Command responses type enumeration
pub const CmdRespType = enum(u8) {
    /// No response
    None,

    /// 48-bit with CRC
    R1,

    /// 136-bit with CRC
    R2,

    /// 48-bit without CRC
    R3,

    /// 48-bit with CRC
    R4,

    /// 48-bit with CRC
    R5,

    pub fn hasCRC(self: CmdRespType) bool {
        return self != CmdRespType.R3;
    }

    pub fn isShortResponse(self: CmdRespType) bool {
        return self != CmdRespType.R2;
    }
};

pub fn getCmdRespType(comptime cmd: u8) CmdRespType {
    if (cmd > CMD63) {
        //TODO
        @compileError("Unexpected command");
    }

    return switch (cmd) {
        CMD0 => CmdRespType.None,
        CMD2, CMD9, CMD10 => CmdRespType.R2,
        CMD1 => CmdRespType.R3,
        CMD39 => CmdRespType.R4,
        CMD40 => CmdRespType.R5,
        else => CmdRespType.R1,
    };
}

pub const EmmcError = error{
    OCRTimeout,
};

test "CmdResp" {
    const std = @import("std");

    var resp = CmdResp{};
    resp.data[1] = 0x1;
    resp.data[2] = 0x2;
    resp.data[3] = 0x3;
    resp.data[4] = 0xff;
    try std.testing.expect(resp.val32bits() == 0xff030201);

    resp.data[4] = 0x70;
    try std.testing.expect(resp.isBusyOCR() == true);

    resp.data[4] = 0x00;
    try std.testing.expect(resp.isBusyOCR() == true);

    resp.data[4] = 0x80;
    try std.testing.expect(resp.isBusyOCR() == false);

    // val

    _ = resp.val32bits();

    // ---
    resp.setDataByArrayU32([4]u32{ 0x05010203, 6, 7, 8 });

    try std.testing.expect(resp.data[1] == 0x3);
    try std.testing.expect(resp.data[2] == 0x2);
    try std.testing.expect(resp.data[3] == 0x1);
    try std.testing.expect(resp.data[4] == 0x5);

    // std.debug.print("val {any}\r\n", .{resp.data});
}
