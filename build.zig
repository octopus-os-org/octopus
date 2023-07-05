// ref: https://github.com/lmbarros/pi3-zig-simplest-bare-metal/blob/master/build.zig

const std = @import("std");
const octopus = @import("octopus/obuild.zig");

pub fn build(b: *std.Build) void {
    const elf = octopus.addOctopus(b, .{ .board = "wheeltec/c30d", .fileSource = .{ .path = "src/main.zig" } });

    // This declares intent for the executable to be installed into the
    // standard location when the user invokes the "install" step (the default
    // step when running `zig build`).
    b.installArtifact(elf);

    // std.debug.print("mode:{}\n", .{mode});

    // add lib
    elf.addIncludePath("src/lib/ringbuffer");
    elf.addCSourceFile("src/lib/ringbuffer/rb.c", &[_][]const u8{"-std=c11"});

    // ----------------------------------------------------------------
    // BIN File
    // ----------------------------------------------------------------

    // With `addInstallRaw()` I tell the build system that I want to generate a
    // raw binary image from the ELF executable we generated above. This is the
    // binary the Pi 3 can run. I make this "bin generation step" a dependency
    // of the default "install step" so that it gets executed on a regular
    // `zig build`.

    const _bin = elf.addObjCopy(.{ .format = .bin });
    const bin = b.addInstallBinFile(_bin.getOutputSource(), "zig-program.bin");
    b.getInstallStep().dependOn(&bin.step);

    // const step_bin = b.step("bin", "Generate binary file to be flashed");
    // step_bin.dependOn(&bin.step);

    // ----------------------------------------------------------------
    // ----------------------------------------------------------------

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
    // const elf_tests = b.addTest("src/startup.zig");

    // rt.test_subuild(b, elf_tests);

    // elf_tests.addIncludePath("src/lib/ringbuffer");
    // elf_tests.addCSourceFile("src/lib/ringbuffer/rb.c", &[_][]const u8{"-std=c11"});

    // elf_tests.addAssemblyFile("src/startup/startup.s");
    // elf_tests.setLinkerScriptPath(.{ .path = "src/startup/link.ld" });

    // elf_tests.setTarget(target);
    // elf_tests.setBuildMode(optimize);

    // const test_step = b.step("test", "Run unit tests");
    // test_step.dependOn(&elf_tests.step);
}
