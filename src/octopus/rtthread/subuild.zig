const std = @import("std");
const components = @import("components/subuild.zig");

const rpwd = "src/octopus/rtthread/";

pub fn subuild(b: *std.build.Builder, t: *std.build.LibExeObjStep) void {
    const rtt = genRttObject(b);

    rtt.setTarget(t.target);
    rtt.setBuildMode(std.builtin.Mode.ReleaseFast); // must

    rtt.addIncludePath(rpwd ++ "components/finsh"); // optional
    t.addIncludePath(rpwd);
    t.addIncludePath(rpwd ++ "include");
    t.addObject(rtt);

    components.subuild(b, t);
}

fn genRttObject(b: *std.build.Builder) *std.build.LibExeObjStep {
    const rtt = b.addObject("rtthread-obj", null);
    const cflags = &[_][]const u8{"-std=c11"};

    // set outside
    // rtt.setTarget(target);
    // rtt.setBuildMode(std.builtin.Mode.ReleaseFast);

    // include path
    rtt.addIncludePath(rpwd ++ "components/finsh"); // optional
    rtt.addIncludePath(rpwd);
    rtt.addIncludePath(rpwd ++ "include");

    // port source files
    rtt.addCSourceFile(rpwd ++ "start.c", cflags);

    // chip-specific source files
    rtt.addAssemblyFile(rpwd ++ "cpu/arm/cortex-m4/context.s");
    rtt.addCSourceFile(rpwd ++ "cpu/arm/cortex-m4/cpuport.c", cflags);

    // core source files
    rtt.addCSourceFile(rpwd ++ "src/clock.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/idle.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/ipc.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/irq.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/kservice.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/mem.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/memheap.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/mempool.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/object.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/scheduler_up.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/slab.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/thread.c", cflags);
    rtt.addCSourceFile(rpwd ++ "src/timer.c", cflags);

    return rtt;
}

pub fn test_subuild(b: *std.build.Builder, t: *std.build.LibExeObjStep) void {
    _ = b;
    t.addIncludePath(rpwd ++ "port");
    t.addIncludePath(rpwd ++ "include");

    const cflags = &[_][]const u8{"-std=c11"};

    // port source files
    t.addCSourceFile(rpwd ++ "port/start.c", cflags);

    // chip-specific source files
    t.addAssemblyFile(rpwd ++ "cpu/arm/cortex-m4/context.s");
    t.addCSourceFile(rpwd ++ "cpu/arm/cortex-m4/cpuport.c", cflags);

    // core source files
    t.addCSourceFile(rpwd ++ "src/clock.c", cflags);
    t.addCSourceFile(rpwd ++ "src/idle.c", cflags);
    t.addCSourceFile(rpwd ++ "src/ipc.c", cflags);
    t.addCSourceFile(rpwd ++ "src/irq.c", cflags);
    t.addCSourceFile(rpwd ++ "src/kservice.c", cflags);
    t.addCSourceFile(rpwd ++ "src/mem.c", cflags);
    t.addCSourceFile(rpwd ++ "src/memheap.c", cflags);
    t.addCSourceFile(rpwd ++ "src/mempool.c", cflags);
    t.addCSourceFile(rpwd ++ "src/object.c", cflags);
    t.addCSourceFile(rpwd ++ "src/scheduler_up.c", cflags);
    t.addCSourceFile(rpwd ++ "src/slab.c", cflags);
    t.addCSourceFile(rpwd ++ "src/thread.c", cflags);
    t.addCSourceFile(rpwd ++ "src/timer.c", cflags);
}
