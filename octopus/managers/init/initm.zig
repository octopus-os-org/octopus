// Following pact_auto_init

/// octopus-init-section element type
pub const OctopusInitElem = extern struct {
    name: [*]const u8,
    init: *const fn () void,
};

pub const InitmError = error{
    WrongSectionSize,
};

/// This will initialize all "callee" in the range [begin_addr, end_addr] (like an array)
/// The type of elements in the "array" should be OctopusInitElem
fn do_init_list(begin_addr: [*]u8, length: u32) anyerror!void {
    const _begin: [*]u8 = begin_addr;
    const _len = length;

    // Verify section size based on section-element size
    if ((_len % @sizeOf(OctopusInitElem)) != 0) {
        return InitmError.WrongSectionSize;
    }

    const pe: [*]OctopusInitElem = @alignCast(@ptrCast(_begin));
    var idx: u32 = 0;
    while (idx < (_len / @sizeOf(OctopusInitElem))) {
        pe[idx].init();
        idx += 1;
    }
}

// Contains references to the ".octopus.init"
// note: given in the linkscript
const sections = struct {
    // The address of _octopus_init_begin equals &array[0]
    extern var _octopus_init_begin: u8;
    // The address of _octopus_init_end equals &array[len] (yes, not "len-1")
    extern var _octopus_init_end: u8;
};

/// octopus-init-section-name
/// usage: "export var foo: OctopusInitElem linksection(OISN) = .{ .name = "foo", .init = init_foo };"
pub const OISN = ".octopus.init";

/// This will initialize all entries in the section ".octopus.init" ([_octopus_init_begin, _octopus_init_end])
pub fn do_init_default() anyerror!void {
    const _begin: [*]u8 = @ptrCast(&sections._octopus_init_begin);
    const _end: [*]u8 = @ptrCast(&sections._octopus_init_end);
    const _len:u32 = @intFromPtr(_end) - @intFromPtr(_begin);

    return do_init_list(_begin, _len);
}

test "do_init_list" {
    const std = @import("std");
    var arrElem1 = OctopusInitElem{ .name = "e1", .init = _test_foo };
    var arrElem2 = OctopusInitElem{ .name = "e2", .init = _test_foo };

    const arr = [_]OctopusInitElem{
        arrElem1,
        arrElem2,
    };

    var _octopus_init_begin: usize = @intFromPtr(&arr[0]);

    // case: normal
    {
        _test_foo_count = 0;
        var err = do_init_list(@ptrFromInt(_octopus_init_begin), arr.len * @sizeOf(OctopusInitElem));
        if (err) |_| {} else |e| {
            std.debug.print("unexpected error: {}\r\n", .{e});
            try std.testing.expect(false);
        }

        try std.testing.expect(_test_foo_count == arr.len);
    }

    // case: wrong size
    {
        var err = do_init_list(@ptrFromInt(_octopus_init_begin), @sizeOf(OctopusInitElem) - 1);
        try std.testing.expectError(InitmError.WrongSectionSize, err);
    }
}

var _test_foo_count: u32 = 0;

fn _test_foo() void {
    _test_foo_count += 1;
}
