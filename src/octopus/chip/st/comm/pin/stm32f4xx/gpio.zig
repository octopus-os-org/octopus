const pinid = @import("pinid.zig");
const base = @import("base.zig");

const GpioPinRep = struct {
    pin_id: u16,

    const Self = @This();

    fn init(pin_id: u16) Self {
        return Self{ .pin_id = pin_id };
    }

    /// 0 input mode, 1 output mode
    pub fn set_io(self: Self, io: anytype) void {
        var group = pinid.get_group(self.pin_id);
        var port = pinid.get_port(self.pin_id);

        var mode: u2 = 0b00;
        if (io != 0) {
            mode = 0b01;
        }

        // mode
        base.modify_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_MODE), 0b11, @as(u5, @truncate(2 * port)), mode);
    }

    pub fn set_ec(self: Self, ec: GpioPinEc) void {
        var group = pinid.get_group(self.pin_id);
        var port = pinid.get_port(self.pin_id);

        // mode
        // base.modify_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_MODE), 0b11, @as(u5, 2 * port), mode);

        // output type
        base.modify_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_OTYPE), 0b1, @as(u5, port), ec.output_type);
        // output speed
        base.modify_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_OSPEED), 0b11, @as(u5, 2 * port), ec.output_speed);
        // push-up push-down
        base.modify_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_PUPD), 0b11, @as(u5, 2 * port), ec.pupd);
    }
    pub fn get_ec(self: Self) GpioPinEc {
        var group = pinid.get_group(self.pin_id);
        var port = pinid.get_port(self.pin_id);
        var ec: GpioPinEc = undefined;

        // output type
        ec.output_type = base.read_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_OTYPE), 0b1, @as(u5, port));
        // output speed
        ec.output_speed = base.read_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_OSPEED), 0b11, @as(u5, 2 * port));
        // push-up push-down
        ec.pupd = base.read_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_PUPD), 0b11, @as(u5, 2 * port));

        return ec;
    }

    pub fn set_output(self: Self, val: anytype) void {
        var group = pinid.get_group(self.pin_id);
        var port = pinid.get_port(self.pin_id);
        base.modify_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_OD), 0b1, @as(u5, @truncate(port)), val);
    }

    pub fn get_output(self: Self) u1 {
        var group = pinid.get_group(self.pin_id);
        var port = pinid.get_port(self.pin_id);
        return @as(u1,@truncate(base.read_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_OD), 0b1, @as(u5, @truncate(port)))));
    }

    pub fn get_input(self: Self) u1 {
        var group = pinid.get_group(self.pin_id);
        var port = pinid.get_port(self.pin_id);
        return @as(u1, base.read_reg_bits(u32, base.gpiox_reg_ptr(group, base.GPIO_REG_ID), 0b1, @as(u5, port)));
    }
};

pub fn gpio_request_pin(pin_id: u16) !GpioPinRep {
    if (!pinid.is_valid_pin_id(pin_id)) {
        return error.Failure;
    }

    return GpioPinRep.init(pin_id);
}

pub const GpioPinEc = packed struct {
    /// 0b00: input
    /// 0b01: output
    mode: u1 = undefined,
    /// 0b00: No pull-up, pull-down
    /// 0b01: Pull-up
    /// 0b10: Pull-down
    /// 0b11: Reserved
    pupd: u2 = undefined,
    /// 0: Output push-pull (reset state)
    /// 1: Output open-drain
    output_type: u1 = undefined,
    /// 0b00: Low speed
    /// 0b01: Medium speed
    /// 0b10: High speed
    /// 0b11: Very high speed
    output_speed: u2 = undefined,

    _reserved: u2 = undefined,
};
