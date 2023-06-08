const std = @import("std");

const rttroot = "src/mr/rtthread/";
const rpwd = "src/mr/rtthread/components/";

pub fn subuild(b: *std.build.Builder, t: *std.build.LibExeObjStep) void {
    const mobj = genFinshObject(b);

    mobj.setTarget(t.target);
    mobj.setBuildMode(std.builtin.Mode.ReleaseFast); // must

    t.addIncludePath(rttroot);
    t.addIncludePath(rttroot ++ "include");
    t.addIncludePath(rpwd ++ "finsh");
    t.addObject(mobj);
}

fn genFinshObject(b: *std.build.Builder) *std.build.LibExeObjStep {
    const mobj = b.addObject("finsh-obj", null);
    const cflags = &[_][]const u8{"-std=c11"};

    // set outside
    // rtt.setTarget(target);
    // rtt.setBuildMode(std.builtin.Mode.ReleaseFast);

    // include path
    mobj.addIncludePath(rttroot);
    mobj.addIncludePath(rttroot ++ "include");
    mobj.addIncludePath(rpwd ++ "finsh");

    // core source files
    mobj.addCSourceFile(rpwd ++ "finsh/cmd.c", cflags);
    mobj.addCSourceFile(rpwd ++ "finsh/msh_parse.c", cflags);
    mobj.addCSourceFile(rpwd ++ "finsh/msh.c", cflags);
    mobj.addCSourceFile(rpwd ++ "finsh/shell.c", cflags);

    return mobj;
}
