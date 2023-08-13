const std = @import("std");

// Note: This implementation is experimental, currently the way that hash-map may cost too much space

/// Identification manager
/// Its usage is simple that just like "put and get"
/// The initialization is "var _allocator =  IDM().init(allocator)"
pub fn IDM() type {
    return struct {
        allocator: std.mem.Allocator,
        hashMapMgr: std.StringHashMap(*anyopaque),

        const Self = @This();

        /// Create an IDM instance
        pub fn init(allocator: std.mem.Allocator) Self {
            return .{
                .allocator = allocator,
                .hashMapMgr = std.StringHashMap(*anyopaque).init(allocator),
            };
        }

        /// Register a name with data
        /// the name can't be the existing name
        pub fn register(self: *Self, name: []const u8, data: *anyopaque) anyerror!void {
            if (self.has(name)) {
                return error.Failure;
            }
            try self.hashMapMgr.put(name, data);
        }
        /// Unregister the name
        /// Return true if success, otherwise false
        pub fn unregister(self: *Self, name: []const u8) bool {
            return self.hashMapMgr.remove(name);
        }

        /// Find the name and return its data
        /// Return null if the name is not found
        pub fn find(self: *Self, name: []const u8) ?*anyopaque {
            return self.hashMapMgr.get(name);
        }

        /// Check the presence of the name
        /// Return true if present, otherwise false
        pub fn has(self: *Self, name: []const u8) bool {
            if (self.hashMapMgr.get(name)) |_| {
                return true;
            }
            return false;
        }
    };
}

// "not good smell"
// global IDM instance
pub var gidm:IDM() = undefined;

pub fn init(allocator: std.mem.Allocator) void {
    gidm = IDM().init(allocator);
}

test "global IDM instance" {
    var buffer: [1024]u8 = undefined;

    var _allocator = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = _allocator.allocator();

    init(allocator);

    try std.testing.expect(gidm.has("idm") == false);
    var tmp: u32 = undefined;
    try gidm.register("idm", &tmp);
    try std.testing.expect(gidm.has("idm") == true);
    _ = gidm.unregister("idm");
    try std.testing.expect(gidm.has("idm") == false);
}

test "normally put and get" {
    var buffer: [1024]u8 = undefined;

    var _allocator = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = _allocator.allocator();
    var idm = IDM().init(allocator);

    try std.testing.expect(idm.has("idm") == false);

    var tmp: u32 = undefined;
    try idm.register("idm", &tmp);
    try idm.register("idm00", &tmp);
    try idm.register("idm01", &tmp);
    try idm.register("idm02", &tmp);
    try idm.register("idm03", &tmp);
    try idm.register("idm04", &tmp);
    try idm.register("idm05", &tmp);
    try idm.register("idm06", &tmp);
    try idm.register("idm07", &tmp);
    try idm.register("idm08", &tmp);
    try idm.register("idm09", &tmp);
    try idm.register("idm010", &tmp);

    try std.testing.expect(idm.has("idm"));

    if (idm.find("idm")) |d| {
        try std.testing.expect(@as(*u32, @ptrCast(@alignCast(d))) == &tmp);
    } else {
        try std.testing.expect(false);
    }
}

test "unregister" {
    var buffer: [1024]u8 = undefined;
    var _allocator = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = _allocator.allocator();
    var idm = IDM().init(allocator);

    var tmp: u32 = undefined;

    try std.testing.expect(idm.has("idm") == false);
    try std.testing.expect(idm.unregister("idm") == false);

    try idm.register("idm", &tmp);
    try std.testing.expect(idm.has("idm"));

    try std.testing.expect(idm.unregister("idm"));
    try std.testing.expect(idm.has("idm") == false);
}

test "forbid registering the existing name" {
    var buffer: [1024]u8 = undefined;
    var _allocator = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = _allocator.allocator();
    var idm = IDM().init(allocator);
    var tmp: u32 = 0;
    try idm.register("idm", &tmp);

    if (idm.register("idm", &tmp)) |_| {
        try std.testing.expect(false);
    } else |err| {
        _ = err catch {};
        try std.testing.expect(true);
    }
}
