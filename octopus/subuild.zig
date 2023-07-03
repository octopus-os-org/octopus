const std = @import("std");
const rt = @import("rtthread/subuild.zig");

pub fn subuild(b: *std.Build, t: *std.Build.Step.Compile) void {
    rt.subuild(b, t);
    const m = genModule(b, t.target, t.optimize);
    t.addModule("octopus", m);
}

fn genModule(b: *std.Build, target: std.zig.CrossTarget, optimize: std.builtin.Mode) *std.Build.Module {
    _ = target;
    _ = optimize;

    const m = b.addModule("octopus", .{
        .source_file = .{ .path = "octopus/octopus.zig" },
    });

    return m;
}
