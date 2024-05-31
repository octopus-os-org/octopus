/// Used for octopus internal to print msg
/// the "output port" is initialized by board's code
/// note: global instance
const std = @import("std");
const tickm = @import("octopus").tickm;

// All here output is finally by this function
var g_lower_puts: ?*const fn (s: []const u8) void = null;

pub const g_writer = std.io.Writer(?*anyopaque, anyerror, _writer_write){
    .context = null,
};

fn _writer_write(context: ?*anyopaque, bytes: []const u8) anyerror!usize {
    _ = context;
    puts(bytes);

    return bytes.len;
}
pub fn puts(msg: []const u8) void {
    if (g_lower_puts) |f| {
        f(msg);
    }
}

pub fn printf(comptime format: []const u8, args: anytype) void {
    _ = g_writer.print(format, args) catch {};
}

/// set "output port"
pub fn set_lower_puts(f: *const fn (s: []const u8) void) void {
    g_lower_puts = f;
}

// nothing special compares to printf except adding "new line" at the end
pub fn log(comptime format: []const u8, args: anytype) void {
    // _ = g_writer.print("{} ", .{tickm.get()}) catch {};
    _ = g_writer.print("" ++ format ++ "\r\n", args) catch {};
    // _ = args;
    // puts(format ++ "\r\n");
}
