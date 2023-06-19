pub const AdcId = packed struct {
    adc: u8,
    channel: u8,
};

const _hrs_len = "ADC1CH00".len;

/// get adc_id from human friendly/readable string
/// must be upper case
/// hrs style: "ADC1CH00"
/// start from "ADC1"
pub fn adc_id_from_hrs(hrs: []const u8) !AdcId {
    if (hrs.len != _hrs_len) {
        return error.Failure;
    }

    var id: AdcId = undefined;

    id.adc = hrs[3] - '1';
    id.channel = (hrs[6] - '0') * 10 + (hrs[7] - '0');

    if (!is_valid_adc_id(id)) {
        return error.Failure;
    }

    return id;
}

pub fn is_valid_adc_id(id: AdcId) bool {
    if (id.adc > 9) {
        return false;
    }
    if (id.channel > 20) {
        return false;
    }

    return true;
}

test "adc_id_from_hrs" {
    const testing = @import("std").testing;

    var id = try adc_id_from_hrs("ADC1CH00");
    try testing.expect(id.adc == 0 and id.channel == 0);

    id = try adc_id_from_hrs("ADC1CH08");
    try testing.expect(id.adc == 0 and id.channel == 8);
}
