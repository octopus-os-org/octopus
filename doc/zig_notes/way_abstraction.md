```zig

const Host = @This();

// the type erased pointer to the implementation
ptr: *anyopaque,
vtable: *const VTable,

pub const VTable = struct {
    /// Send a command to device
    send_cmd: *const fn (ctx: *anyopaque, cmdidx: u6, cmdarg: u32, resptype: fv.CmdRespType) void,

    /// Get last command response
    get_resp: *const fn (ctx: *anyopaque) fv.CmdResp,
};

/// Send a command to device
pub inline fn send_cmd(self: Host, cmdidx: u6, cmdarg: u32, resptype: fv.CmdRespType) void {
    self.vtable.send_cmd(
        self.ptr,
        cmdidx,
        cmdarg,
        resptype,
    );
}

/// Get last command response
pub inline fn get_resp(self: Host) fv.CmdResp {
    return self.vtable.get_resp(
        self.ptr,
    );
}

```