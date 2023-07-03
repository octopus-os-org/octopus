const std = @import("std");
const rt = @import("rtthread/subuild.zig");

pub fn subuild(b: *std.build.Builder, t: *std.Build.Step.Compile) void {
    rt.subuild(b, t);
}

pub fn test_subuild(b: *std.build.Builder, t: *std.Build.Step.Compile) void {
    rt.test_subuild(b, t);
}
