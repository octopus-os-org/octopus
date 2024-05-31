// todo: optimize
// "bad smell"
// is there anyway to inject value at comptime?
const specific = struct {
    const std = @import("std");
    pub fn gpioa_base_addr(comptime chip_family: []const u8) u32 {
        if (std.mem.eql(u8, chip_family, "stm32l4xx")) {
            return 0x4800_0000;
        } else if (std.mem.eql(u8, chip_family, "stm32f4xx")) {
            return 0x4002_0000;
        } else {
            @compileError("unknown chip family");
        }
    }
};

const hs = @import("hs");
const GPIOA_BASE_ADDR: u32 = specific.gpioa_base_addr(hs.@"chip.family");

//0x4002_0000
pub const GPIO_REG_MODE = 0;
pub const GPIO_REG_OTYPE = 0x04;
pub const GPIO_REG_OSPEED = 0x08;
pub const GPIO_REG_PUPD = 0x0C;
pub const GPIO_REG_ID = 0x10;
pub const GPIO_REG_OD = 0x14;

pub inline fn gpiox_base_addr(group: u8) u32 {
    return GPIOA_BASE_ADDR + 0x400 * @as(u32, group);
}

pub inline fn gpiox_reg_ptr(group: u8, reg: anytype) *u32 {
    return @as(*u32, @ptrFromInt(gpiox_base_addr(group) + reg));
}

/// very common utility function
/// e.g. modify_bits_of(u32, 0xFF, 0x3, 2, 1) will get 0xF7
pub inline fn modify_bits_of(comptime T: type, old: T, maskZS: anytype, sbit: anytype, valZS: anytype) T {
    return (old & ~(@as(T, maskZS) << sbit)) | ((@as(T, maskZS) & @as(T, valZS)) << sbit);
}

// todo: change mask to size
pub inline fn read_bits_of(comptime T: type, val: T, maskZS: anytype, sbit: anytype) T {
    return (val & (@as(T, maskZS) << sbit)) >> sbit;
}

pub inline fn modify_reg_bits(comptime T: type, regPointer: *T, maskZS: anytype, sbit: anytype, valZS: anytype) void {
    regPointer.* = modify_bits_of(T, regPointer.*, maskZS, sbit, valZS);
}

pub inline fn read_reg_bits(comptime T: type, regPointer: *T, maskZS: anytype, sbit: anytype) T {
    return read_bits_of(T, regPointer.*, maskZS, sbit);
}

test "modify_reg_bits" {
    const testing = @import("std").testing;

    var _treg: u32 = 0xFF;
    modify_reg_bits(u32, &_treg, 0b11, 0, 0b10);
    try testing.expect(_treg == 0xFE);
}

test "read_reg_bits" {
    const testing = @import("std").testing;

    var _treg: u32 = 0xF9;
    try testing.expect(read_reg_bits(u32, &_treg, 0b11, 0) == 0b01);
}
