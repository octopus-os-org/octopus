const std = @import("std");
const rt = @import("rtthread/subuild.zig");

const c30d = @import("board/wheeltec-c30d/startup/obuild.zig");

const octopusBuildOptions = struct {
    board: []const u8,
    fileSource: std.Build.FileSource,
};

pub fn addOctopus(b: *std.Build, comptime options: octopusBuildOptions) *std.Build.Step.Compile {
    const elf = genExecutableCompileByBoard(b, options.board);

    const octopus_module = genModule(b, elf.target, elf.optimize);

    const app_module = b.createModule(.{
        .source_file = options.fileSource,
        .dependencies = &.{
            // make 'octopus' top-namespace available for app
            .{ .name = "octopus", .module = octopus_module },
        },
    });

    // "app" is used for transfer control-flow to user program by octopus(startup)
    elf.addModule("app", app_module);

    // ----------------------------------------------------------------
    // Octopus core
    // ----------------------------------------------------------------
    rt.subuild(b, elf);
    // elf.addModule("octopus", octopus_module);

    return elf;
}

// todo: improve
// 'tmp'
fn genExecutableCompileByBoard(b: *std.Build, comptime board_name: []const u8) *std.Build.Step.Compile {
    const board_table = [_][]const u8{
        "wheeltec/c30d",
    };

    const board_obuild_table = [_]type{
        @import("board/wheeltec-c30d/startup/obuild.zig"),
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

    const elf = boardObuild.genExecutableCompile(b, "octopus.elf");

    return elf;
}

fn genModule(b: *std.Build, target: std.zig.CrossTarget, optimize: std.builtin.Mode) *std.Build.Module {
    _ = target;
    _ = optimize;

    const miutil = b.createModule(.{
        .source_file = .{ .path = comptime rootDir() ++ "/util/util.zig" },
    });

    const m = b.addModule("octopus", .{
        .source_file = .{ .path = comptime rootDir() ++ "/octopus.zig" },
        .dependencies = &[_]std.Build.ModuleDependency{.{ .name = "util", .module = miutil }},
    });

    return m;
}

fn rootDir() []const u8 {
    return std.fs.path.dirname(@src().file) orelse unreachable;
}
