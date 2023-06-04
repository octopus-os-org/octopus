const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    // const target = b.standardTargetOptions(.{});

    const target = .{
        .cpu_arch = std.Target.Cpu.Arch.thumb,
        .cpu_model = .{ .explicit = &std.Target.arm.cpu.cortex_m4 },
        .os_tag = std.Target.Os.Tag.freestanding,
        .abi = std.Target.Abi.eabi,
    };

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    // b.setPreferredReleaseMode(std.builtin.Mode.ReleaseSmall);
    const mode = b.standardReleaseOptions();
    const elf = b.addExecutable("zig-program.elf", "src/startup.zig");
    elf.setTarget(target);
    elf.setBuildMode(mode);
    // add other files
    elf.addAssemblyFileSource(.{ .path = "src/startup/startup.s" });

    elf.addAssemblyFileSource(.{ .path = "src/mr/cpu/arm/cortex-m4/context.s" });
    elf.addCSourceFile("src/mr/cpu/arm/cortex-m4/cpuport.c", &[_][]const u8{"-std=c11"});
    elf.addIncludePath("src/mr/include");

    // add linker script
    elf.setLinkerScriptPath(.{ .path = "src/linkscript/link.ld" });

    // std.debug.print("mode:{}\n", .{mode});

    // BIN STEP
    const bin = b.addInstallRaw(elf, "zig-program.bin", .{});
    const bin_step = b.step("bin", "Generate binary file to be flashed");
    bin_step.dependOn(&bin.step);

    // FLASH STEP
    const flash_cmd = b.addSystemCommand(&[_][]const u8{ "bash", "tools/flash.sh" });
    flash_cmd.step.dependOn(&bin.step);
    const flash_step = b.step("flash", "flash program into target");
    flash_step.dependOn(&flash_cmd.step);

    // .
    b.default_step.dependOn(&elf.step);
    b.installArtifact(elf);
}
