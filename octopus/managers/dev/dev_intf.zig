/// TODO experimental
const ts = @import("octopus").types;

const Dev = @This();

// the type erased pointer to the implementation
ptr: *anyopaque,
vtable: *const VTable,

/// api class: [data,status,control] + "irq"
pub const VTable = struct {
    read: *const fn (ctx: *anyopaque, buf: []u8) usize,
    write: *const fn (ctx: *anyopaque, buf: []const u8) usize,
    // open: *const fn (ctx: *anyopaque) !void;
    // close: *const fn (ctx: *anyopaque) !void;
    // signal: *const fn (ctx: *anyopaque, id: signal_id_t, callback: ?sig_callback_t) !void
    //   link_signal
    //   unlink_signal
    //   enum_signal_outputable (op?)
    //   enum_signal_acceptable (op?)
    //   emit_signal (caller to callee)
    // status: *const fn (ctx: *anyopaque, id: status_id_t) ?status_t;
    // ctrl: *const fn (ctx: *anyopaque, arg: anyopaque) !?anyopaque;
};

pub inline fn read(self: Dev, buf: []u8) usize {
    return self.vtable.read(
        self.ptr,
        buf,
    );
}

pub inline fn write(self: Dev, buf: []const u8) usize {
    return self.vtable.write(
        self.ptr,
        buf,
    );
}
