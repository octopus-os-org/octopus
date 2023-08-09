// experimental version

const chip = @import("../../../chip/chip.zig");
const reg = chip.st.stm32mp157x.reg.devices.STM32MP157x.peripherals;

const pact = @import("../bhost.zig");
const fv = @import("../const.zig");
const ds = @import("../ds.zig");

pub const StSdmmcHost = struct {
    reserved: u8 = undefined,
    lastCmdRespType: fv.CmdRespType = undefined,

    const Self = @This();

    pub fn set_bus_400Khz(self: Self) void {
        _ = self;
        // modify clock to be under 400Khz && 1-bit bus
        reg.SDMMC2.SDMMC_CLKCR.write_raw(0x0003009D);
    }

    inline fn _reg_respvalue_from_resptype(resptype: fv.CmdRespType) u2 {
        return switch (resptype) {
            fv.CmdRespType.None => 0b00,
            fv.CmdRespType.R2 => 0b11,
            fv.CmdRespType.R3 => 0b10,
            else => 0b01,
        };
    }

    fn send_cmd(ctx: *anyopaque, cmdidx: u6, cmdarg: u32, resptype: fv.CmdRespType) void {
        const self = @as(*Self, @ptrCast(ctx));

        // clear all status first
        reg.SDMMC2.SDMMC_STAR.write_raw(0xffff_ffff);

        reg.SDMMC2.SDMMC_ARGR.write_raw(cmdarg);
        reg.SDMMC2.SDMMC_CMDR.write_raw(0x1000 | (@as(u32, _reg_respvalue_from_resptype(resptype)) << 8) | (cmdidx & 0x3F));

        self.lastCmdRespType = resptype;

        // wait command complete
        while (reg.SDMMC2.SDMMC_CMDR.read().CPSMEN == 1) {}
    }

    fn get_resp(ctx: *anyopaque) fv.CmdResp {
        const self = @as(*Self, @ptrCast(ctx));
        var ret = fv.CmdResp{};

        if (self.lastCmdRespType.isShortResponse()) {
            ret.setDataByArrayU32([4]u32{
                reg.SDMMC2.SDMMC_RESP1R.read_raw(),
                0,
                0,
                0,
            });
        } else {
            ret.setDataByArrayU32([4]u32{
                reg.SDMMC2.SDMMC_RESP4R.read_raw(),
                reg.SDMMC2.SDMMC_RESP3R.read_raw(),
                reg.SDMMC2.SDMMC_RESP2R.read_raw(),
                reg.SDMMC2.SDMMC_RESP1R.read_raw(),
            });
        }

        return ret;
    }

    pub fn host(self: *Self) pact {
        return pact{
            .ptr = self,
            .vtable = &pact.VTable{ .get_resp = get_resp, .send_cmd = send_cmd },
        };
    }
};
