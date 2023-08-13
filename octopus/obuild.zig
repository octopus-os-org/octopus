const std = @import("std");
const rt = @import("rtthread/subuild.zig");

const c30d = @import("board/wheeltec-c30d/startup/obuild.zig");

pub const octopusBuildOptions = struct {
    board: []const u8,
    fileSource: std.Build.FileSource,
};

pub fn addOctopus(b: *std.Build, comptime options: octopusBuildOptions) *std.Build.Step.Compile {
    const elf = genExecutableCompileByBoard(b, options.board);
    const hsOptions = genHardwareOptionsByBoard(b, options.board);

    const octopus_module = genModule(b, elf.target, elf.optimize);
    // put hardware-specific options into octopus
    // todo: optimize
    // "bad smell"
    // note: because current zig's flaw and octopus is a module, must use the following way
    {
        const eok = octopus_module.dependencies.put("hs", hsOptions.createModule());
        if (eok) |_| {} else |err| {
            std.debug.print("Oops! {}", .{err});
            // @compileError("failed to add hs options to octopus");
        }
    }

    {
        const eok = octopus_module.dependencies.put("octopus", octopus_module);
        if (eok) |_| {} else |err| {
            std.debug.print("Oops! {}", .{err});
            // @compileError("failed to add hs options to octopus");
        }
    }

    const app_module = b.createModule(.{
        .source_file = options.fileSource,
        .dependencies = &.{
            // make 'octopus' top-namespace available for app
            .{ .name = "octopus", .module = octopus_module },
        },
    });

    // "app" is used for transfer control-flow to user program by octopus(startup)
    elf.addModule("app", app_module);
    elf.addModule("octopus", octopus_module);

    // ----------------------------------------------------------------
    // Octopus core
    // ----------------------------------------------------------------
    rt.subuild(b, elf);
    // elf.addModule("octopus", octopus_module);

    return elf;
}

fn getBoardObuild(comptime board_name: []const u8) type {
    const board_table = [_][]const u8{ "wheeltec/c30d", "atk/pandora", "100ask/stm32mp157" };

    const board_obuild_table = [_]type{
        @import("board/wheeltec-c30d/startup/obuild.zig"),
        @import("board/atk-pandora/startup/obuild.zig"),
        @import("board/100ask-stm32mp157/startup/obuild.zig"),
    };

    // find board info
    const boardObuild: type = comptime blk: {
        for (board_table, 0..) |board, idx| {
            if (std.mem.eql(u8, board, board_name)) {
                break :blk board_obuild_table[idx];
            }
        } else {
            @compileLog("Your input board is '" ++ board_name ++ "'");
            @compileLog("You may mispell the board name or it is not supported yet");
            @compileLog("Here is the board list: ");
            @compileLog(board_table);

            @compileError("unknown board: " ++ board_name);
        }
    };

    return boardObuild;
}

// todo: improve
// 'tmp'
fn genExecutableCompileByBoard(b: *std.Build, comptime board_name: []const u8) *std.Build.Step.Compile {
    return getBoardObuild(board_name).genExecutableCompile(b, "octopus.elf");
}

// todo: improve
// 'tmp'
fn genHardwareOptionsByBoard(b: *std.Build, comptime board_name: []const u8) *std.Build.Step.Options {
    return getBoardObuild(board_name).genHardwareOptions(b);
}

fn genModule(b: *std.Build, target: std.zig.CrossTarget, optimize: std.builtin.Mode) *std.Build.Module {
    _ = target;
    _ = optimize;

    const m = b.addModule("octopus", .{
        .source_file = .{ .path = comptime rootDir() ++ "/octopus.zig" },
    });

    return m;
}

fn rootDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}
