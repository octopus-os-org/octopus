const octopus = @import("octopus");
const chip = octopus.chip.st.stm32f429bit6;

const g_ins: octopus.tickm.LowerTicker = .{
    .get = get,
};

fn get() u64 {
    return @as(u64, chip.dwt.get_counter());
}

pub fn init() anyerror!void {
    try chip.dwt.init();
    // set "base" for ocotpus-tick
    octopus.tickm.set_lower_ticker(&g_ins);
}
