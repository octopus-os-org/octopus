const std = @import("std");
const components = @import("components/subuild.zig");

const rpwd = "octopus/rtthread/";

pub fn subuild(b: *std.Build, t: *std.Build.Step.Compile) void {
    const rtt = genRttObject(b, t);

    // rtt.setTarget(t.target);
    // rtt.setBuildMode(std.builtin.Mode.ReleaseFast); // must

    rtt.addIncludePath(.{.path=rpwd ++ "components/finsh"}); // optional
    t.addIncludePath(.{.path=rpwd});
    t.addIncludePath(.{.path=rpwd ++ "include"});
    t.addObject(rtt);

    components.subuild(b, t);
}

fn genRttObject(b: *std.Build, t: *std.Build.Step.Compile) *std.Build.Step.Compile {
    const rtt = b.addObject(.{
        .name = "obj-rtthread",
        .target = t.target,
        .optimize = std.builtin.Mode.ReleaseFast, // must
    });
    const cflags = &[_][]const u8{"-std=c11"};

    // include path
    rtt.addIncludePath(.{.path = rpwd ++ "components/finsh"}); // optional
    rtt.addIncludePath(.{.path = rpwd});
    rtt.addIncludePath(.{.path = rpwd ++ "include"});

    // port source files
    // rtt.addCSourceFile(rpwd ++ "start.c", cflags);

    // chip-specific source files
    rtt.addAssemblyFile(.{.path = rpwd ++ "cpu/arm/cortex-m4/context.s"});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "cpu/arm/cortex-m4/cpuport.c"}, .flags = cflags});

    // core source files
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/clock.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/idle.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/ipc.c"},.flags =  cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/irq.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/kservice.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/mem.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/memheap.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/mempool.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/object.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/scheduler_up.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/slab.c"},.flags =  cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/thread.c"}, .flags = cflags});
    rtt.addCSourceFile(.{.file = .{.path = rpwd ++ "src/timer.c"}, .flags = cflags});

    return rtt;
}
