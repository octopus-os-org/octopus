const BHost = @import("bhost.zig");
const fv = @import("const.zig");
const ds = @import("ds.zig");

/// This function will (re-)initialize the emmc card
/// ocr: operation conditions register
pub fn emmc_reinit(host: BHost, ocr: u32, rca: u16) anyerror!ds.EmmcCardInfo {
    // Step1
    // Make card go to idle state

    _stage_go_idle_state(host);

    // Step2
    // Do voltage identification
    const rocr = try _stage_do_voltage_identification(host, ocr);

    // Step3
    // Fetch card CID
    const cid = _stage_fetch_cid(host);

    // Step4
    // Set card RCA
    // (CMD3 with argument RCA)
    // todo
    host.send_cmd_vlp(fv.CMD3, @as(u32, rca) << 16);

    return ds.EmmcCardInfo{
        .ocr = rocr,
        .cid = cid,
        .rca = rca,
    };
}

inline fn _stage_go_idle_state(host: BHost) void {
    // (CMD0 with argument 0)
    host.send_cmd_vlp(fv.CMD0, 0);
}

// temporary solution
fn mmc_delay(cnt: u32) void {
    var i: u32 = 0;

    while (i < cnt) {
        i += 1;
    }
}

// TODO: improve timeout solution
inline fn _stage_do_voltage_identification(host: BHost, ocr: u32) anyerror!u32 {
    // The number is arbitrary
    var tryMax: u32 = 0xFFFF;

    // poll until non-busy or timeout with error
    while (true) {
        // (CMD1 with argument OCR)
        host.send_cmd_vlp(fv.CMD1, ocr);

        // wait for response ready
        mmc_delay(1024);

        var resp = host.get_resp();
        if (!resp.isBusyOCR()) {
            return resp.val32bits();
        }

        tryMax -= 1;
        if (tryMax == 0) {
            return fv.EmmcError.OCRTimeout;
        }
    }
}

inline fn _stage_fetch_cid(host: BHost) u128 {
    // (CMD2)
    host.send_cmd_vlp(fv.CMD2, 0);
    var resp = host.get_resp();
    return resp.val128bits();
}

// Used for test only
const mockHostT = struct {
    data4: u8 = 0,

    const Self = @This();

    fn send_cmd(ctx: *anyopaque, cmdidx: u6, cmdarg: u32, resptype: fv.CmdRespType) void {
        _ = resptype;
        _ = cmdarg;
        _ = cmdidx;
        _ = ctx;
    }

    fn get_resp(ctx: *anyopaque) fv.CmdResp {
        const self = @as(*Self, @ptrCast(ctx));

        var ret = fv.CmdResp{};

        ret.data[4] = self.data4;

        return ret;
    }

    fn GetHost(self: *Self) BHost {
        return BHost{
            .ptr = self,
            .vtable = &BHost.VTable{ .get_resp = get_resp, .send_cmd = send_cmd },
        };
    }
};

test "_stage_do_voltage_identification" {
    const std = @import("std");

    // case normal
    {
        var _mockhost = mockHostT{
            .data4 = 0x80,
        };
        const mockhost = _mockhost.GetHost();

        const result = _stage_do_voltage_identification(mockhost, 0);
        const hasError = if (result) |_| false else |_| true;

        try std.testing.expect(!hasError);
    }

    // case timeout
    {
        var _mockhost = mockHostT{
            .data4 = 0x7f,
        };
        const mockhost = _mockhost.GetHost();
        try std.testing.expectError(fv.EmmcError.OCRTimeout, _stage_do_voltage_identification(mockhost, 0));
    }
}

test "emmc_reinit" {
    // todo
    // const std = @import("std");

    var _mockhost = mockHostT{ .data4 = 0x80 };
    const mockhost = _mockhost.GetHost();

    const d = try emmc_reinit(mockhost, 0, 2);
    _ = d;

    // std.debug.print("einfo {any}\r\n", .{d});
}
