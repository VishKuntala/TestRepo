const config = {
    coverage_score: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: '0'
        },
        'VeryWeak': {
            name: 'Very Weak', color: '#e6b800', dbLabel: '1'
        },
        'Uneven': {
            name: 'Uneven', color: '#ffff00', dbLabel: '2'
        },
        'Strong': {
            name: 'Strong', color: '#00cc00', dbLabel: '3'
        },
        'VeryStrong': {
            name: 'Very Strong', color: '#008000', dbLabel: '4'
        },
        'Best': {
            name: 'Best', color: '#003300', dbLabel: '5'
        }
    },
    fiveg: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Partial': {
            name: 'Partial', color: '#00cc00', dbLabel: 'Partial'
        },
        'Yes': {
            name: 'Yes', color: '#003300', dbLabel: 'Yes'
        }

    },
    fiveg_plus: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Hotspot': {
            name: 'Hotspot', color: '#003300', dbLabel: 'Hotspot'
        }

    },
    fiveg_plus_mmwave: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Hotspot': {
            name: 'Hotspot', color: '#003300', dbLabel: 'Hotspot'
        }

    },
    band_14: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Partial': {
            name: 'Partial', color: '#00cc00', dbLabel: 'Partial'
        },
        'Yes': {
            name: 'Yes', color: '#003300', dbLabel: 'Yes'
        }

    },
    first_net: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Partial': {
            name: 'Partial', color: '#00cc00', dbLabel: 'Partial'
        },
        'Yes': {
            name: 'Yes', color: '#003300', dbLabel: 'Yes'
        }
    },
    tput_text: {
        "Unknown": {
            name: 'Unknown Cap', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        "LowSpeedVeryLowAvailCapacity": {
            name: 'Low Speed/Very Low Cap', color: '#e6b800', dbLabel: 'LowSpeedVeryLowAvailCapacity'
        },
        "MediumSpeedLowAvailCapacity": {
            name: 'Medium Speed/Low Cap', color: '#ffff00', dbLabel: 'MediumSpeedLowAvailCapacity'
        },
        "MediumSpeedMediumAvailCapacity": {
            name: 'Medium Speed/Medium Cap', color: '#00cc00', dbLabel: 'MediumSpeedMediumAvailCapacity'
        },
        "MediumSpeedHighAvailCapacity": {
            name: 'Medium Speed/High Cap', color: '#008000', dbLabel: 'MediumSpeedHighAvailCapacity'
        },
        "HighSpeedVeryHighAvailCapacity": {
            name: 'High Speed/Very High Cap', color: '#003300', dbLabel: 'HighSpeedVeryHighAvailCapacity'
        }
    },
    roam_text: {
        "Unknown": {
            name: 'Roaming Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        "Heavyroaming": {
            name: 'Heavy Roaming', color: '#e6b800', dbLabel: 'Heavyroaming'
        },
        "Mediumroaming": {
            name: 'Medium Roaming', color: '#00cc00', dbLabel: 'Mediumroaming'
        },
        "Noroaming": {
            name: 'No Roaming', color: '#003300', dbLabel: 'No'
        }
    },
    fiber_cust: {
        'Unknown': {
            name: 'Legacy Device Pen Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'High': {
            name: 'Legacy Device Pen High', color: '#e6b800', dbLabel: 'High'
        },
        'Medium': {
            name: 'Legacy Device Pen Medium', color: '#00cc00', dbLabel: 'Medium'
        },
        'Low': {
            name: 'Legacy Device Pen Low', color: '#003300', dbLabel: 'Low'
        }

    },
    legacy_device_text: {
        'Unknown': {
            name: 'Legacy Device Pen Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'High': {
            name: 'Legacy Device Pen High', color: '#e6b800', dbLabel: 'High'
        },
        'Medium': {
            name: 'Legacy Device Pen Medium', color: '#00cc00', dbLabel: 'Medium'
        },
        'Low': {
            name: 'Legacy Device Pen Low', color: '#003300', dbLabel: 'Low'
        },
        'CheckwithRAN': {
            name: 'Check with RAN', color: '#00cc00', dbLabel: 'CheckwithRAN'
        },
        'Unsuitable': {
            name: 'Unsuitable', color: '#e6b800', dbLabel: 'Unsuitable'
        },
        'Suitable': {
            name: 'Suitable', color: '#003300', dbLabel: 'Suitable'
        }

    },
    suitability: {
        'Unknown': {
            name: 'Legacy Device Pen Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },        
        'CheckwithRAN': {
            name: 'Check with RAN', color: '#00cc00', dbLabel: 'CheckwithRAN'
        },
        'Unsuitable': {
            name: 'Unsuitable', color: '#e6b800', dbLabel: 'Unsuitable'
        },
        'Suitable': {
            name: 'Suitable', color: '#003300', dbLabel: 'Suitable'
        }
    },
    fiber_status: {
        "99-NONE": {
            name: '99 - NONE', color: '#a9a9a9', dbLabel: '99-NONE'
        },
        "7-NEARFIBER1000ft(NotLit)": {
            name: '7 - NEAR FIBER 1000ft (Not Lit)', color: '#e6b800', dbLabel: '7-NEARFIBER1000ft(NotLit)'
        },
        "5-FIBERTHERE(NotLit)": {
            name: '5 - FIBER THERE (Not Lit)', color: '#ffff00', dbLabel: '5-FIBERTHERE(NotLit)'
        },
        "3-SINGLECUSTOMERNTECELLLEGACY": {
            name: '3 - SINGLE CUSTOMER NTE/CELL/LEGACY', color: '#00cc00', dbLabel: '3-SINGLECUSTOMERNTECELLLEGACY'
        },
        "2-MULTICUSTOMERNTE": {
            name: '2 - MULTI CUSTOMER NTE', color: '#008000', dbLabel: '2-MULTICUSTOMERNTE'
        },
        "1-EMT": {
            name: '1 - EMT', color: '#003300', dbLabel: '1-EMT'
        }
    },
    network_build_type_cd: {
        "FTTB-F": {
            name: 'FTTB-F', color: '#003300', dbLabel: 'FTTB-F'
        },
        "FTTP-GPON": {
            name: 'FTTP-GPON', color: '#006600', dbLabel: 'FTTP-GPON'
        },
        "FTTN-BP": {
            name: 'FTTN-BP', color: '#00cc00', dbLabel: 'FTTN-BP'
        },
        "FTTN": {
            name: 'FTTN', color: '#00ff00', dbLabel: 'FTTN'
        },
        "FTTPIP": {
            name: 'FTTPIP', color: '#33ff33', dbLabel: 'FTTPIP'
        },
        "IP-CO-BP": {
            name: 'IP-CO-BP', color: '#ffff00', dbLabel: 'IP-CO-BP'
        },
        "IP-RT-BP": {
            name: 'IP-RT-BP', color: '#ffff33', dbLabel: 'IP-RT-BP'
        },
        "IP-RT": {
            name: 'IP-RT', color: '#ffff66', dbLabel: 'IP-RT'
        },
        "IP-CO": {
            name: 'IP-CO', color: '#ffff99', dbLabel: 'IP-CO'
        },
        "ATMCO": {
            name: 'ATM CO', color: '#808080', dbLabel: 'ATMCO'
        },
        "ATMRT": {
            name: 'ATM RT', color: '#999999', dbLabel: 'ATMRT'
        },
        "NA": {
            name: 'NA', color: '#b3b3b3', dbLabel: 'NA'
        },
    },
    simple_coverage_score: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: '0'
        },
        'VeryWeak': {
            name: 'Very Weak', color: '#e6b800', dbLabel: '1'
        },
        'Uneven': {
            name: 'Uneven', color: '#ffff00', dbLabel: '2'
        },
        'Strong': {
            name: 'Strong', color: '#00cc00', dbLabel: '3'
        },
        'VeryStrong': {
            name: 'Very Strong', color: '#008000', dbLabel: '4'
        },
        'Best': {
            name: 'Best', color: '#003300', dbLabel: '5'
        }
    },
    awb_capacity_text: {
        "Unknown": {
            name: 'Unknown Capacity', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        "VeryLowAvailCapacity": {
            name: 'Very Low Capacity', color: '#e6b800', dbLabel: 'VeryLowAvailCapacity'
        },
        "LowAvailCapacity": {
            name: 'Low Capacity', color: '#ffff00', dbLabel: 'LowAvailCapacity'
        },
        "MediumAvailCapacity": {
            name: 'Medium Capacity', color: '#00cc00', dbLabel: 'MediumAvailCapacity'
        },
        "HighAvailCapacity": {
            name: 'High Capacity', color: '#008000', dbLabel: 'HighAvailCapacity'
        },
        "VeryHighAvailCapacity": {
            name: 'Very High Capacity', color: '#003300', dbLabel: 'VeryHighAvailCapacity'
        }
    },
    awb_spectrum_efficiency: {
        "Unknown": {
            name: 'Unknown Efficiency', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        "VeryLowUserLimit": {
            name: 'Very Low User Limit', color: '#e6b800', dbLabel: 'VeryLowUserLimit'
        },
        "LowUserLimit": {
            name: 'Low User Limit', color: '#ffff00', dbLabel: 'LowUserLimit'
        },
        "MediumUserLimit": {
            name: 'Medium User Limit', color: '#00cc00', dbLabel: 'MediumUserLimit'
        },
        "HighUserLimit": {
            name: 'High User Limit', color: '#008000', dbLabel: 'HighUserLimit'
        },
        "HighestUserLimit": {
            name: 'Highest User Limit', color: '#003300', dbLabel: 'HighestUserLimit'
        }
    },
    gpon_status: {
        "NO_GPON": {
            name: 'NO_GPON', color: '#a9a9a9', dbLabel: 'NO_GPON'
        },
        "GPON_AVAILABLE": {
            name: 'GPON_AVAILABLE', color: '#00cc00', dbLabel: 'GPON_AVAILABLE'
        },
        "GPON_CUSTOMER": {
            name: 'GPON_CUSTOMER', color: '#003300', dbLabel: 'GPON_CUSTOMER'
        }
    },
    sales_high_speed_suitability: {
        'Unknown': {
            name: 'Unknown Efficiency', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'LowSpeedFailoverOnly': {
            name: 'Low Speed Failover Only', color: '#e63900', dbLabel: 'LowSpeedFailoverOnly'
        },
        'NoAWB-CheckwithRAN': {
            name: 'No AWB - Check with RAN', color: '#e6b800', dbLabel: 'NoAWB-CheckwithRAN'
        },
        'NoWBB-CheckwithRAN': {
            name: 'No WBB - Check with RAN', color: '#e6b800', dbLabel: 'NoWBB-CheckwithRAN'
        },
        'Feasible': {
            name: 'Feasible', color: '#ffff00', dbLabel: 'Feasible'
        },
        'Good': {
            name: 'Good', color: '#00cc00', dbLabel: 'Good'
        },
        'VeryGood': {
            name: 'Very Good', color: '#008000', dbLabel: 'VeryGood'
        },
        'Excellent': {
            name: 'Excellent', color: '#003300', dbLabel: 'Excellent'
        },
        'CheckwithRAN': {
            name: 'Check with RAN', color: '#00cc00', dbLabel: 'CheckwithRAN'
        },
        'Unsuitable': {
            name: 'Unsuitable', color: '#e6b800', dbLabel: 'Unsuitable'
        },
        'BackupOnly': {
            name: 'Backup Only', color: '#00cc00', dbLabel: 'BackupOnly'
        },
        'Suitable': {
            name: 'Suitable', color: '#003300', dbLabel: 'Suitable'
        }
    },
    cband: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'OutdoorOnly': {
            name: 'Outdoor Only', color: '#00cc00', dbLabel: 'OutdoorOnly'
        },
        'Indoor': {
            name: 'Indoor', color: '#003300', dbLabel: 'Indoor'
        }

    },
    cband_avail: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'OutdoorOnly': {
            name: 'Outdoor Only', color: '#00cc00', dbLabel: 'OutdoorOnly'
        },
        'Indoor': {
            name: 'Indoor', color: '#003300', dbLabel: 'Indoor'
        }

    },
    fiveg_plus_cband: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'OutdoorOnly': {
            name: 'Outdoor Only', color: '#00cc00', dbLabel: 'OutdoorOnly'
        },
        'Indoor': {
            name: 'Indoor', color: '#003300', dbLabel: 'Indoor'
        }

    },
    speed_experience: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'LowSpeed': {
            name: 'Low Speed', color: '#e6b800', dbLabel: 'LowSpeed'
        },
        'MediumSpeed': {
            name: 'Medium Speed', color: '#00cc00', dbLabel: 'MediumSpeed'
        },
        'HighSpeed': {
            name: 'High Speed', color: '#003300', dbLabel: 'HighSpeed'
        }

    },
};

export default config;