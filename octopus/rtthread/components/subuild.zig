const std = @import("std");

const rttroot = "octopus/rtthread/";
const rpwd = "octopus/rtthread/components/";

pub fn subuild(b: *std.build.Builder, t: *std.Build.Step.Compile) void {
    const mobj = genFinshObject(b, t);

    // mobj.setTarget(t.target);
    // mobj.setBuildMode(std.builtin.Mode.ReleaseFast); // must

    t.addIncludePath(.{.path = rttroot});
    t.addIncludePath(.{.path = rttroot ++ "include"});
    t.addIncludePath(.{.path = rpwd ++ "finsh"});
    t.addObject(mobj);
}

fn genFinshObject(b: *std.build.Builder, t: *std.Build.Step.Compile) *std.Build.Step.Compile {
    const mobj = b.addObject(.{
        .name = "obj-finsh",
        .target = t.target,
        .optimize = std.builtin.Mode.ReleaseFast, // must
    });
    const cflags = &[_][]const u8{"-std=c11"};

    // set outside
    // rtt.setTarget(target);
    // rtt.setBuildMode(std.builtin.Mode.ReleaseFast);

    // include path
    mobj.addIncludePath(.{.path = rttroot});
    mobj.addIncludePath(.{.path = rttroot ++ "include"});
    mobj.addIncludePath(.{.path = rpwd ++ "finsh"});

    // core source files
    mobj.addCSourceFile(.{.file = .{.path = rpwd ++ "finsh/cmd.c"}, .flags = cflags});
    mobj.addCSourceFile(.{.file = .{.path = rpwd ++ "finsh/msh_parse.c"}, .flags = cflags});
    mobj.addCSourceFile(.{.file = .{.path = rpwd ++ "finsh/msh.c"}, .flags = cflags});
    mobj.addCSourceFile(.{.file = .{.path = rpwd ++ "finsh/shell.c"}, .flags = cflags});

    mobj.addCSourceFile(.{.file = .{.path = rpwd ++ "finsh/enc_finsh/enc_finsh.c"}, .flags = cflags});
    // mobj.addCSourceFile(rpwd ++ "finsh/enc_finsh/rb.c", cflags);

    return mobj;
}
