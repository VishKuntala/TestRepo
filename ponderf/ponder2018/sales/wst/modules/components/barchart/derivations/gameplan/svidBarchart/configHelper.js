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
    indoor_coverage_score: {
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
    fiveg_id: {
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
    fiveg_plus_mmwave_id: {
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
    ran_suitability_cause_id: {
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
    fiveg_plus_cband_ics_id: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Indoor': {
            name: 'Indoor', color: '#00cc00', dbLabel: 'Partial'
        },
        'OutdoorOnly': {
            name: 'Outdoor Only', color: '#003300', dbLabel: 'Yes'
        }

    },
    wireless_broadband_suitability_ics_id: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'NoWBB-CheckwithRAN': {
            name: 'No WBB - Check with RAN', color: '#e6b800', dbLabel: 'No WBB - Check with RAN'
        },
        'Feasible': {
            name: 'Feasible', color: '#ffff00', dbLabel: 'Partial'
        },
        'Good': {
            name: 'Good', color: '#00cc00', dbLabel: 'Yes'
        },
        'Very Good': {
            name: 'Very Good', color: '#008000', dbLabel: 'Very Good'
        },
        'Excellent': {
            name: 'Excellent', color: '#003300', dbLabel: 'Excellent'
        }
    },
    speed_experience_ics_id: {
        'Unknown': {
            name: 'Unknown', color: '#a9a9a9', dbLabel: 'Unknown'
        },
        'LowSpeed': {
            name: 'Low Speed', color: '#e6b800', dbLabel: 'Low Speed'
        },
        'MediumSpeed': {
            name: 'Medium Speed', color: '#00cc00', dbLabel: 'Medium Speed'
        },
        'HighSpeed': {
            name: 'High Speed', color: '#003300', dbLabel: 'High Speed'
        }
    },
    band_14_id: {
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
    first_net_id: {
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
    wbbSuitabilityIcs: {
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
    fiber_status_report_rows_id: {
        "NONE": {
            name: 'NONE', color: '#a9a9a9', dbLabel: 'NONE'
        },
        "NEARFIBER1000ft(NotLit)": {
            name: 'NEAR FIBER 1,000ft (Not Lit)', color: '#fec181', dbLabel: 'NEAR FIBER 1,000ft (Not Lit)'
        },
        "GPONSERVINGAREA(NotLit)": {
            name: 'GPON SERVING AREA (Not Lit)', color: '#b55a30', dbLabel: 'GPON SERVING AREA (Not Lit)'
        },
        "FIBERTHERE(NotLit)": {
            name: 'FIBER THERE (Not Lit)', color: '#f1d30e', dbLabel: 'FIBERTHERE(NotLit)'
        },
        "GPONLIT": {
            name: 'GPON LIT', color: '#00ff00', dbLabel: 'GPON LIT'
        },
        "SINGLECUSTOMERNTECELLLEGACY": {
            name: 'SINGLE CUSTOMER NTE/CELL/LEGACY', color: '#6978a5', dbLabel: 'SINGLE CUSTOMER NTE/CELL/LEGACY'
        },
        "MULTICUSTOMERNTE": {
            name: 'MULTI CUSTOMER NTE', color: '#7c568f', dbLabel: 'MULTI CUSTOMER NTE'
        },
        "EMT": {
            name: 'EMT', color: '#00a170', dbLabel: 'EMT'
        },
        
    },
    future_fiber_status_id: {
        "T-30": {
            name: 'T-30', color: '#0066cc', dbLabel: 'T-30'
        },
        "T-60": {
            name: 'T-60', color: '#4da6ff', dbLabel: 'T-60'
        },
        "CurrentlyEMT": {
            name: 'Currently EMT', color: '#87cefa', dbLabel: 'Currently EMT'
        },
        "CurrentlyGPONLit": {
            name: 'Currently GPON Lit', color: '#00ff00', dbLabel: 'Currently GPON Lit'
        },
        "CurrentlyNotLit": {
            name: 'Currently Not Lit', color: '#595959', dbLabel: 'Currently Not Lit'
        },
        "Other": {
            name: 'Other', color: '#a9a9a9', dbLabel: 'Other'
        },
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
    ics_score_id: {
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
    addr_customer_category_id: {
        "FiberCustomerandWirelessCustomer" : {
            name: 'Fiber Customer and Wireless Customer', color: '#00FF00', dbLabel: 'Fiber Customer and Wireless Customer'
        },
        "FiberCustomerandWirelessCross-SellOpportunity": {
            name: 'Fiber Customer and Wireless Cross-Sell Opportunity', color: '#0000FF', dbLabel: 'Fiber Customer and Wireless Cross-Sell Opportunity'
        },
        "WirelessCustomerandFiberCross-SellOpportunity": {
            name: 'Wireless Customer and Fiber Cross-Sell Opportunity', color: '#FFA500', dbLabel: 'Wireless Customer and Fiber Cross-Sell Opportunity'
        },
        "OpportunityforFiberandWireless": {
            name: 'Opportunity for Fiber and Wireless', color: '#FF0000', dbLabel: 'Opportunity for Fiber and Wireless'
        },
        "MDUAllAT&TFiberCustomers": {
            name: 'MDU All AT&T Fiber Customers', color: '#00cc00', dbLabel: 'MDU All AT&T Fiber Customers'
        },
        "MDUwithAT&TFiberProspects": {
            name: 'MDU with AT&T Fiber Prospects', color: '#236B8E', dbLabel: 'MDU with AT&T Fiber Prospects'
        },
        "FiberCustomer": {
            name: 'Fiber Customer', color: '#00FF00', dbLabel: 'Fiber Customer'
        },
        "FiberOpportunity": {
            name: 'Fiber Opportunity', color: '#0000FF', dbLabel: 'Fiber Opportunity'
        }
    },
    csi_eligible: {
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Yes': {
            name: 'Yes', color: '#003300', dbLabel: 'Yes'
        }
    },
    hypergig: {
        'No': {
            name: 'No', color: '#e6b800', dbLabel: 'No'
        },
        'Yes': {
            name: 'Yes', color: '#003300', dbLabel: 'Yes'
        }
    }

};

export default config;