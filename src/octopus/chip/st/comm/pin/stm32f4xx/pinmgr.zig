const pinid = @import("pinid.zig");
const base = @import("base.zig");

const GPIO_MODE_REG_AO = 0;
const GPIO_AFRL_REG_AO = 0x20;

/// set pin multiplexing
/// note: pin_mux 0x40 means mux as adc
/// note: pin_mux 0x20 means mux as gpio
pub fn pinmgr_set_pin_mux(pin_id: u16, pin_mux: u8) !void {
    if (!pinid.is_valid_pin_id(pin_id)) {
        return error.Failure;
    }

    var modeVal: u2 = undefined;
    var afVal: u4 = undefined;

    if (pin_mux == 0x40) {
        // alternate adc
        modeVal = 0b11;
        afVal = 0;
    } else if (pin_mux == 0x20) {
        // gpio
        modeVal = 0b00;
        afVal = 0;
    } else {
        // alternate
        modeVal = 0b10;
        afVal = @truncate(u4, pin_mux & 0xF);
    }

    var gpioBaseAddr = base.gpiox_base_addr(pinid.get_group(pin_id));
    var port = pinid.get_port(pin_id);

    // set pin mode
    var mode_reg = @intToPtr(*u32, gpioBaseAddr + GPIO_MODE_REG_AO);
    var oldVal = mode_reg.*;
    mode_reg.* = base.modify_bits_of(u32, oldVal, 0x3, @truncate(u5, 2 * port), modeVal);

    // set alternate
    var af_reg = @intToPtr(*u32, gpioBaseAddr + GPIO_AFRL_REG_AO + port / 8);
    oldVal = af_reg.*;
    af_reg.* = base.modify_bits_of(u32, oldVal, 0xF, @truncate(u5, 4 * (port % 8)), afVal);
}

const _s = packed struct {
    // mode:u1,
    // output_type:u1,
    // output_speed:u2,
    pupd: u2,
    _reserved: u2,
};

/// set pin electrical characteristics
pub fn pinmgr_set_pin_ec(pin_id: u16, pin_ec: anytype) !void {
    _ = pin_id;
    _ = pin_ec;
}
