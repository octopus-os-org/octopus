const std = @import("std");

const rpwd = "src/mr/rtthread/";

pub fn subuild(b: *std.build.Builder, t: *std.build.LibExeObjStep) void {
    const rtt = genRttObject(b);

    rtt.setTarget(t.target);
    rtt.setBuildMode(std.builtin.Mode.ReleaseFast); // must

    t.addIncludePath(rpwd ++ "port");
    t.addIncludePath(rpwd ++ "include");
    t.addObject(rtt);
}

fn genRttObject(b: *std.build.Builder) *std.build.LibExeObjStep {
    const rtt = b.addObject("rtthread-obj", null);
    const cflags = &[_][]const u8{"-std=c11"};

    // set outside
    // rtt.setTarget(target);
    // rtt.setBuildMode(std.builtin.Mode.ReleaseFast);

    // include path
    rtt.addIncludePath(rpwd ++ "port");
    rtt.addIncludePath(rpwd ++ "include");

    // port source files
    rtt.addCSourceFile(rpwd ++ "port/start.c", cflags);

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