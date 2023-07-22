//! PureDriver
//! The mmc host interface
//! Version 0.0.1

const fv = @import("const.zig");

// Note: apparently, the caller can use vtable directly, here the BHost wrapper
// may be just giving more conveniences by replacing the call "x.xxx(x.ptr,...)" with "x.xxx(...)"

const BHost = @This();

// the type erased pointer to the implementation
ptr: *anyopaque,
vtable: *const VTable,

pub const VTable = struct {
    /// Send a command to device
    /// cmdidx: command index
    /// cmdarg: command argument
    /// resptype: command response type
    send_cmd: *const fn (ctx: *anyopaque, cmdidx: u6, cmdarg: u32, resptype: fv.CmdRespType) void,

    /// Get last command response
    get_resp: *const fn (ctx: *anyopaque) fv.CmdResp,

    // /// Set bus mode (No Need Yet)
    // ///     Data Rate: Single / Dual
    // ///     Bus Width: 1 / 4 / 8
    // ///     Frequency
    // set_bus: *const fn (ctx: *anyopaque) void,
};

/// Send a command to device
/// cmdidx: command index
/// cmdarg: command argument
/// resptype: command response type
pub inline fn send_cmd(self: BHost, cmdidx: u6, cmdarg: u32, resptype: fv.CmdRespType) void {
    self.vtable.send_cmd(
        self.ptr,
        cmdidx,
        cmdarg,
        resptype,
    );
}

/// Get last command response
pub inline fn get_resp(self: BHost) fv.CmdResp {
    return self.vtable.get_resp(
        self.ptr,
    );
}

/// Same but more convenient "send_cmd" with limit that is usable only at compile-time
// (note: vlp stands for "version less parameters")
pub inline fn send_cmd_vlp(self: BHost, comptime cmdidx: u6, cmdarg: u32) void {
    self.vtable.send_cmd(
        self.ptr,
        cmdidx,
        cmdarg,
        fv.getCmdRespType(cmdidx),
    );
}
