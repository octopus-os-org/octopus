const std = @import("std");

// things about startup
pub fn genExecutableCompile(b: *std.Build, name: []const u8) *std.Build.Step.Compile {
    // ----------------------------------------------------------------
    // ELF File
    // ----------------------------------------------------------------

    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{
        .default_target = .{
            .cpu_arch = std.Target.Cpu.Arch.thumb,
            .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
            .os_tag = std.Target.Os.Tag.freestanding,
            .abi = std.Target.Abi.eabi,
        },
    });

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const elf = b.addExecutable(.{
        .name = name,
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = comptime rootDir() ++ "/startup.zig" },
        .target = target,
        .optimize = optimize,
    });

    // startup
    elf.addAssemblyFile(comptime rootDir() ++ "/startup.s");
    elf.setLinkerScriptPath(.{ .path = comptime rootDir() ++ "/link.ld" });

    return elf;
}

fn rootDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}
