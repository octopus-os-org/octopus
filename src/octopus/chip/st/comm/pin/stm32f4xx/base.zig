const GPIOA_BASE_ADDR = 0x4002_0000;

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
    return @intToPtr(*u32, gpiox_base_addr(group) + reg);
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
