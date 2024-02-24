const std = @import("std");

pub const octopusBuildOptions = struct {
    board: []const u8,
    fileSource: std.Build.LazyPath,
};

pub fn genExecutable(b: *std.Build, comptime options: octopusBuildOptions) *std.Build.Step.Compile {
    const exe = genExecutableCompileByBoard(b, options.board);
    const hsOptions = genHardwareOptionsByBoard(b, options.board);

    const octopus_module = addOctopusModule(b);
    // put hardware-specific options into octopus
    // todo: optimize
    // "bad smell"
    // note: because current zig's flaw and octopus is a module, must use the following way
    {
        octopus_module.addOptions("hs", hsOptions);
    }

    {
        octopus_module.addImport("octopus", octopus_module);
    }

    const app_module = b.createModule(.{
        .root_source_file = options.fileSource,
        .imports = &.{
            // make 'octopus' top-namespace available for app
            .{ .name = "octopus", .module = octopus_module },
        },
    });

    // "app" is used for transfer control-flow to user program by octopus(startup)
    exe.root_module.addImport("app", app_module);
    exe.root_module.addImport("octopus", octopus_module);

    return exe;
}

fn getBoardObuild(comptime board_name: []const u8) type {
    const board_table = [_][]const u8{
        "wheeltec/c30d",
        "atk/pandora",
        "100ask/stm32mp157",
        "armfly/v6",
    };

    const board_obuild_table = [_]type{
        @import("board/wheeltec-c30d/startup/obuild.zig"),
        @import("board/atk-pandora/startup/obuild.zig"),
        @import("board/100ask-stm32mp157/startup/obuild.zig"),
        @import("board/armfly-v6/startup/obuild.zig"),
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

fn addOctopusModule(b: *std.Build) *std.Build.Module {
    const m = b.addModule("octopus", .{
        .root_source_file = .{ .path = comptime rootDir() ++ "/octopus.zig" },
    });

    return m;
}

fn rootDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}
