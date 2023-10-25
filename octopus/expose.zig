const _octopus = @import("octopus.zig");

pub const init = _octopus.init;
pub const startup = _octopus.startup;
pub const default = @import("default.zig");

pub const chip = @import("chip/chip.zig");
pub const driver = @import("drivers/drivers.zig");

pub const idm = @import("managers/idm/expose.zig");
pub const dev = @import("managers/dev/expose.zig");
pub const initm = @import("managers/init/expose.zig");

pub const thread = @import("core/thread.zig");
pub const ipc = @import("core/ipc.zig");

pub const types = @import("def/types.zig");
pub const util = @import("util/util.zig");
