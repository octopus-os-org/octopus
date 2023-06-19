const adcid = @import("adcid.zig");
const reg = @import("reg.zig");

fn get_adc(adc: anytype) ?*const reg.ADCx {
    switch (adc) {
        0 => {
            return &reg.ADC1;
        },

        1 => {
            return &reg.ADC2;
        },

        2 => {
            return &reg.ADC3;
        },
        else => {
            return null;
        },
    }
}

pub fn adcmgr_init() void {
    // todo optmize
    // configure clock 14 = 84/6 (max clock is 14MHz)
    reg.C_ADC.CCR.modify(.{ .ADCPRE = 0b10 });
}

pub fn adcmgr_start_and_wait_channel_once(adc_id: adcid.AdcId) u16 {
    var adc = get_adc(adc_id.adc).?;

    // enable the adc
    adc.CR2.modify(.{ .ADON = 1 });

    // set the channel to be converted
    adc.SQR3.modify(.{ .SQ1 = @truncate(u5, adc_id.channel) });

    // start the conversion
    adc.CR2.modify(.{ .SWSTART = 1 });

    // wait for the conversion to complete
    while (adc.SR.read().EOC != 1) {}

    // fetch the result

    return adc.DR.read().DATA;
}
