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
        afVal = @as(u4, @truncate(pin_mux & 0xF));
    }

    const gpioBaseAddr = base.gpiox_base_addr(pinid.get_group(pin_id));
    const port = pinid.get_port(pin_id);

    // set pin mode
    const mode_reg = @as(*u32, @ptrFromInt(gpioBaseAddr + GPIO_MODE_REG_AO));
    var oldVal = mode_reg.*;
    mode_reg.* = base.modify_bits_of(u32, oldVal, 0x3, @as(u5, @truncate(2 * port)), modeVal);

    // set alternate
    const af_reg = @as(*u32, @ptrFromInt(gpioBaseAddr + GPIO_AFRL_REG_AO + ((port / 8) * 4)));
    oldVal = af_reg.*;
    af_reg.* = base.modify_bits_of(u32, oldVal, 0xF, @as(u5, @truncate(4 * (port % 8))), afVal);
}

/// set pin electrical characteristics
pub fn pinmgr_set_pin_ec(pin_id: u16, pin_ec: anytype) !void {
    _ = pin_id;
    _ = pin_ec;
}
