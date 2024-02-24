const octopus = @import("octopus");
const idm = @import("idm.zig");

/// Find the dev by the name
/// Return null if the name is not found
pub fn find(name: []const u8) ?*octopus.dev.Dev {
    if (idm.gidm.find(name)) |res| {
        const dev: *octopus.dev.Dev = @alignCast(@ptrCast(res));
        return dev;
    }

    return null;
}

/// Register a device
/// the name can't be the existing name
pub fn register(name: []const u8, data: *anyopaque) anyerror!void {
    return idm.gidm.register(name, data);
}

/// Unregister the device
/// Return true if success, otherwise false
pub fn unregister(name: []const u8) bool {
    return idm.gidm.unregister(name);
}
