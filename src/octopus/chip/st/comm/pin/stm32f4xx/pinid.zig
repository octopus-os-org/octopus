// pin_id composition: group(bit 15-8) + port(bit 7-0)

/// 0 represents GPIOA, and so on
pub inline fn get_group(pin_id: u16) u8 {
    return @truncate(u8, (pin_id & 0xFF00) >> 8);
}
/// 0 represents IO0, and so on
pub inline fn get_port(pin_id: u16) u8 {
    return @truncate(u8, (pin_id & 0xFF));
}

/// pin range: GPIOA-GPIOK, IO0-IO15
pub inline fn is_valid_pin_id(pin_id: u16) bool {
    return get_group(pin_id) < ('K' - 'A' + 1) and get_port(pin_id) < 16;
}

const _hrs_len = "A01".len;

/// get pin_id from human friendly/readable string
/// must be upper case
/// e.g. input "A01", get 1
/// start from "Axx"
pub fn pin_id_from_hrs(hrs: []const u8) !u16 {
    if (hrs.len != _hrs_len) {
        return error.Failure;
    }

    var group: u8 = hrs[0] - 'A';
    var port: u8 = (hrs[1] - '0') * 10 + (hrs[2] - '0');

    var pin_id: u16 = (@as(u16, group) << 8) | @as(u16, port);

    if (!is_valid_pin_id(pin_id)) {
        return error.Failure;
    }

    return pin_id;
}

/// e.g. input 1, get "A01"
pub fn pin_id_to_hrs(pin_id: u16, hrs: []u8) ![]u8 {
    if (hrs.len != 3) {
        return error.Failure;
    }

    if (!is_valid_pin_id(pin_id)) {
        return error.Failure;
    }

    var port: u8 = get_port(pin_id);

    hrs[0] = 'A' + get_group(pin_id);
    hrs[1] = '0' + port / 10;
    hrs[2] = '0' + port % 10;

    return hrs;
}

test "pin_id_from_hrs" {
    // const std = @import("std");
    const testing = @import("std").testing;

    try testing.expect((try pin_id_from_hrs("A00")) == 0);
    try testing.expect((try pin_id_from_hrs("A01")) == 1);
    try testing.expect((try pin_id_from_hrs("A15")) == 15);
    try testing.expect((try pin_id_from_hrs("B00")) == 256);
}

test "pin_id_to_hrs" {
    const testing = @import("std").testing;

    var _s: [3]u8 = undefined;

    try testing.expectEqualStrings("A00", (try pin_id_to_hrs(0, &_s)));
}

test "pin_id_from_hrs and pin_id_to_hrs" {
    const testing = @import("std").testing;

    var _s: [3]u8 = undefined;

    try testing.expect(try pin_id_from_hrs(try pin_id_to_hrs(10, &_s)) == 10);
}
