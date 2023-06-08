const sortRankingConfig = {
    coverage_score: {
        '0': 0,
        '1': 1,
        '2': 2,
        '3': 3,
        '4': 4,
        '5': 5
    },
    fiveg: {
        'Unknown': 0,
        'No': 1,
        'Partial': 2,
        'Yes': 3

    },
    band_14: {
        'Unknown': 0,
        'No': 1,
        'Partial': 2,
        'Yes': 3

    },
    first_net: {
        'Unknown': 0,
        'No': 1,
        'Partial': 2,
        'Yes': 3

    },
    tput_text: {
        "Unknown": 0,
        "LowSpeedVeryLowAvailCapacity": 1,
        "MediumSpeedLowAvailCapacity": 2,
        "MediumSpeedMediumAvailCapacity": 3,
        "MediumSpeedHighAvailCapacity": 4,
        "HighSpeedVeryHighAvailCapacity": 5
    },
    roam_text: {
        "Unknown": 0,
        "Heavyroaming": 1,
        "Mediumroaming": 2,
        "No": 3
    },
    fiber_cust: {
        'Unknown': 0,
        'High': 1,
        'Medium': 2,
        'Low': 3,
        'CheckwithRAN': 4,
        'Unsuitable': 5,
        'Suitable': 6

    },
    suitability: {
        'Unknown': 0,
        'CheckwithRAN': 1,
        'Unsuitable': 2,
        'BackupOnly': 3,
        'Suitable': 4

    },
    simple_coverage_score: {
        '0': 0,
        '1': 1,
        '2': 2,
        '3': 3,
        '4': 4,
        '5': 5
    },
    awb_capacity_text: {
        "Unknown": 0,
        "VeryLowAvailCapacity": 1,
        "LowAvailCapacity": 2,
        "MediumAvailCapacity": 3,
        "HighAvailCapacity": 4,
        "VeryHighAvailCapacity": 5
    },
    awb_spectrum_efficiency: {
        "Unknown": 0,
        "VeryLowUserLimit": 1,
        "LowUserLimit": 2,
        "MediumUserLimit": 3,
        "HighUserLimit": 4,
        "HighestUserLimit": 5
    },
    gpon_status: {
        "Unknown": 0,
        "GPON_AVAILABLE": 1,
        "GPON_CUSTOMER": 2
    },
};

export default sortRankingConfig;