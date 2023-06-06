const std = @import("std");
const rt = @import("rtthread/subuild.zig");

pub fn subuild(b: *std.build.Builder, t: *std.build.LibExeObjStep) void {
    rt.subuild(b, t);
}
