const debug = @import("octopus").debug;

pub const LowerTicker = struct {
    /// need to return current tick
    get: *const fn () u64,
};

// All here output is finally by this function
var g_lower_ticker: ?*const LowerTicker = null;

/// set lower "tick maker"
pub fn set_lower_ticker(ticker: *const LowerTicker) void {
    debug.log("[octopus][mgr][tick]: set lower-ticker", .{});
    g_lower_ticker = ticker;
}

/// Get the current tick counter value
pub fn get() u64 {
    if (g_lower_ticker) |ticker| {
        return ticker.get();
    }

    return 0;
}
