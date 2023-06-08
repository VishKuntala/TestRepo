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
        'Low': 3

    }
};

export default sortRankingConfig;