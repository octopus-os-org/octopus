const std = @import("std");
const rt = @import("src/mr/subuild.zig");

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
    elf.install();

    // add rtthread
    rt.subuild(b, elf);

    // add other files
    elf.addAssemblyFile("src/startup/startup.s");

    // add linker script
    elf.setLinkerScriptPath(.{ .path = "src/startup/link.ld" });

    // std.debug.print("mode:{}\n", .{mode});

    // add lib
    elf.addIncludePath("src/lib/ringbuffer");
    elf.addCSourceFile("src/lib/ringbuffer/rb.c", &[_][]const u8{"-std=c11"});

    // BIN STEP
    const bin = b.addInstallRaw(elf, "zig-program.bin", .{});
    const bin_step = b.step("bin", "Generate binary file to be flashed");
    bin_step.dependOn(&bin.step);

    // FLASH STEP
    const flash_cmd = b.addSystemCommand(&[_][]const u8{ "bash", "tools/flash.sh" });
    flash_cmd.step.dependOn(&bin.step);
    const flash_step = b.step("flash", "flash program into target");
    flash_step.dependOn(&flash_cmd.step);

    // FLASH ELF STEP
    const flashelf_cmd = b.addSystemCommand(&[_][]const u8{ "bash", "tools/flashelf.sh" });
    flashelf_cmd.step.dependOn(b.default_step);
    const flashelf_step = b.step("flashelf", "flash program(elf) into target");
    flashelf_step.dependOn(&flashelf_cmd.step);

    // TEST STEP
    const elf_tests = b.addTest("src/startup.zig");

    rt.test_subuild(b, elf_tests);
    elf_tests.addAssemblyFile("src/startup/startup.s");
    elf_tests.setLinkerScriptPath(.{ .path = "src/startup/link.ld" });

    elf_tests.setTarget(target);
    elf_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&elf_tests.step);
}
