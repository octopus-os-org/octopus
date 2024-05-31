const std = @import("std");

const programname = parentDirname();

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    const target = b.resolveTargetQuery(.{
        .cpu_arch = std.Target.Cpu.Arch.thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .os_tag = std.Target.Os.Tag.freestanding,
        .abi = std.Target.Abi.eabi,
    });
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = programname ++ ".elf",
        .root_source_file = b.path("boot/startup.zig"),
        .target = target,
        .optimize = optimize,
        // .code_model = .medium,
    });

    // boot
    exe.addAssemblyFile(b.path("boot/startup.s"));
    exe.addAssemblyFile(b.path("boot/context.s"));

    exe.setLinkerScriptPath(b.path("boot/link.ld"));
    exe.addIncludePath(b.path("boot"));

    // octopus
    const octopus_module = b.dependency("octopus", .{
        .target = target,
        .optimize = optimize,
    }).module("octopus");
    const app_module = b.createModule(.{
        .root_source_file = b.path("app/main.zig" ),
        .imports = &.{
            // make 'octopus' top-namespace available for app
            .{ .name = "octopus", .module = octopus_module },
        },
    });

    octopus_module.addImport("app", app_module);
    exe.root_module.addImport("octopus", octopus_module);

    // ----------------------------------------------------------------
    // steps
    // ----------------------------------------------------------------

    // bin file
    const _bin = exe.addObjCopy(.{ .format = .bin });
    const bin = b.addInstallBinFile(_bin.getOutputSource(), programname ++ ".bin");
    b.getInstallStep().dependOn(&bin.step);

    // This declares intent for the executable to be installed into the
    // standard location when the user invokes the "install" step (the default
    // step when running `zig build`).
    b.installArtifact(exe);
}

fn parentDirname() []const u8 {
    const dir = std.fs.path.dirname(@src().file) orelse unreachable;

    return std.fs.path.basename(dir);
}
