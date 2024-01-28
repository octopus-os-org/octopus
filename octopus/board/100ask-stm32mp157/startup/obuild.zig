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
            .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_a7 },
            .os_tag = std.Target.Os.Tag.freestanding,
            .abi = std.Target.Abi.eabi,
        },
    });

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall. Here we do not
    // set a preferred release mode, allowing the user to decide how to optimize.
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = name,
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = comptime rootDir() ++ "/startup.zig" },
        .target = target,
        .optimize = optimize,
    });

    // startup
    exe.addAssemblyFile(.{ .path = comptime rootDir() ++ "/startup.s" });
    exe.addAssemblyFile(.{ .path = comptime rootDir() ++ "/stm32header.s" });
    exe.setLinkerScriptPath(.{ .path = comptime rootDir() ++ "/link.ld" });

    return exe;
}

pub fn genHardwareOptions(
    b: *std.Build,
) *std.Build.Step.Options {
    // ----------------------------------------------------------------
    // Inject hardware-specific information by options
    // ----------------------------------------------------------------
    //
    // todo: find a better way to handle this
    const hsOption = b.addOptions();
    hsOption.addOption([]const u8, "chip.id", "stm32l475vet6");
    hsOption.addOption([]const u8, "chip.family", "stm32l4xx");

    // TODO consider moving heap-specific information to linker script
    hsOption.addOption(u32, "os.heap_addr_begin", (0xC0100000 + 0x1F400000 - 0x8000000));
    hsOption.addOption(u32, "os.heap_addr_end", (0xC0100000 + 0x1F400000)); // 128MB

    // hsOption.addOption([]const u8, "chip.vendor", "st");

    return hsOption;
}

fn rootDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}
