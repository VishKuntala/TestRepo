const statesData =
    [
        { "name": "Alabama", "value": "AL" },
        { "name": "Alaska", "value": "AK" },
        { "name": "Arizona", "value": "AZ" },
        { "name": "Arkansas", "value": "AR" },
        { "name": "California", "value": "CA" },
        { "name": "Colorado", "value": "CO" },
        { "name": "Connecticut", "value": "CT" },
        { "name": "Delaware", "value": "DE" },
        { "name": "District of Columbia", "value": "DC" },
        { "name": "Florida", "value": "FL" },
        { "name": "Georgia", "value": "GA" },
        { "name": "Hawaii", "value": "HI" },
        { "name": "Idaho", "value": "ID" },
        { "name": "Illinois", "value": "IL" },
        { "name": "Indiana", "value": "IN" },
        { "name": "Iowa", "value": "IA" },
        { "name": "Kansa", "value": "KS" },
        { "name": "Kentucky", "value": "KY" },
        { "name": "Lousiana", "value": "LA" },
        { "name": "Maine", "value": "ME" },
        { "name": "Maryland", "value": "MD" },
        { "name": "Massachusetts", "value": "MA" },
        { "name": "Michigan", "value": "MI" },
        { "name": "Minnesota", "value": "MN" },
        { "name": "Mississippi", "value": "MS" },
        { "name": "Missouri", "value": "MO" },
        { "name": "Montana", "value": "MT" },
        { "name": "Nebraska", "value": "NE" },
        { "name": "Nevada", "value": "NV" },
        { "name": "New Hampshire", "value": "NH" },
        { "name": "New Jersey", "value": "NJ" },
        { "name": "New Mexico", "value": "NM" },
        { "name": "New York", "value": "NY" },
        { "name": "North Carolina", "value": "NC" },
        { "name": "North Dakota", "value": "ND" },
        { "name": "Ohio", "value": "OH" },
        { "name": "Oklahoma", "value": "OK" },
        { "name": "Oregon", "value": "OR" },
        { "name": "Pennsylvania", "value": "PA" },
        { "name": "Rhode Island", "value": "RI" },
        { "name": "South Carolina", "value": "SC" },
        { "name": "South Dakota", "value": "SD" },
        { "name": "Tennessee", "value": "TN" },
        { "name": "Texas", "value": "TX" },
        { "name": "Utah", "value": "UT" },
        { "name": "Vermont", "value": "VT" },
        { "name": "Virginia", "value": "VA" },
        { "name": "Washington", "value": "WA" },
        { "name": "West Virginia", "value": "WV" },
        { "name": "Wisconsin", "value": "WI" },
        { "name": "Wyoming", "value": "WY" }
    ];

const coverageScoreData = [
    { "name": "0", "value": "0" },
    { "name": "1", "value": "1" },
    { "name": "2", "value": "2" },
    { "name": "3", "value": "3" },
    { "name": "4", "value": "4" },
    { "name": "5", "value": "5" }
];

const fivegData = [
    { "name": "Yes", "value": "Yes" },
    { "name": "No", "value": "No" },
    { "name": "Partial", "value": "Partial" },
    { "name": "Unknown", "value": "Unknown" }
];

const band14Data = [
    { "name": "Yes", "value": "Yes" },
    { "name": "No", "value": "No" },
    { "name": "Partial", "value": "Partial" },
    { "name": "Unknown", "value": "Unknown" }
];

const firstNetData = [
    { "name": "Yes", "value": "Yes" },
    { "name": "No", "value": "No" },
    { "name": "Partial", "value": "Partial" },
    { "name": "Unknown", "value": "Unknown" }
];

const roamingData = [
    { "name": "Medium roaming", "value": "Medium roaming" },
    { "name": "Heavy roaming", "value": "Heavy roaming" },
    { "name": "Unknown", "value": "Unknown" },
    { "name": "No", "value": "No" }

];

const sortCriteriaData = [
    { "name": "Indoor Coverage Score", "value": "COVERAGE_SCORE", selected: true },
    { "name": "5G", "value": "FIVEG" },
    { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT" },
    { "name": "Roaming", "value": "ROAM_TEXT" },
    { "name": "FNET Band 14", "value": "BAND_14" },
    { "name": "Legacy Device Penetration", "value": "FIBER_CUST" },
    { "name": "5G+", "value": "FIVEG_PLUS" },
    { "name": "FirstNet", "value": "FIRST_NET" }
];

const byocAccessTypes = [
    { "name": "My Clusters", "value": "mine" },
    { "name": "Shared With Me", "value": "shared" },
    { "name": "Public", "value": "public" },
    { "name": "All", "value": "all", selected: true }

];

/* const channels = [
    { "name": "National Business Wireless", "value": "nbwc", "stage": "prod", "authid": 1 },
    { "name": "MidMarket", "value": "midmarket", "stage": "prod", "authid": 2 },
    { "name": "Omni", "value": "omni", "stage": "prod", "authid": 3 },
    { "name": "Global Business", "value": "globalBusiness", "stage": "prod", "authid": 4 },
    { "name": "BYOC", "value": "byoc", "stage": "prod", "authid": 5 },
    { "name": "National LUs", "value": "nationalLUs", "stage": "prod", "authid": 6 },
    { "name": "BCLS", "value": "bcls", "stage": "prod", "authid": 7 },
    { "name": "Engineering USA LUs", "value": "natLus", "stage": "prod", "authid": 8 }

]; */

const channels = [
    { "name": "BCLS V2", "value": "bclsv2", "stage": "prod", "authid": 9 },
    { "name": "Blueprint - Gigapower", "value": "neonGigapower", "stage": "prod", "authid": 20 },
    { "name": "MidMarket Fiber", "value": "midmarketFiber", "stage": "prod", "authid": 10 },
    { "name": "Midmarket Wireless", "value": "ch5Wireless", "stage": "prod", "authid": 14 },
    { "name": "Small Business Fiber - HQ View", "value": "ch2Fiber", "stage": "prod", "authid": 11 },
    { "name": "Small Business Fiber - Quick View", "value": "ch2FiberQv", "stage": "prod", "authid": 17 },
    { "name": "Small Business Fiber - Store View", "value": "ch9FiberStores", "stage": "prod", "authid": 18 },
    { "name": "Small Business Wireless", "value": "ch3Wireless", "stage": "prod", "authid": 12 },
    { "name": "Channel4 Fiber", "value": "ch4Fiber", "stage": "prod", "authid": 13 },
    { "name": "Channel6 Wireless", "value": "ch6Wireless", "stage": "prod", "authid": 15 },
    { "name": "Public SLED", "value": "ch7Sled", "stage": "prod", "authid": 16 },
    { "name": "Demo Cross-Sell Channel", "value": "ch8Demo", "stage": "prod", "authid": 19 },
    { "name": "MidMarket", "value": "midmarket", "stage": "prod", "authid": 2 },
    { "name": "National Business Wireless", "value": "nbwc", "stage": "prod", "authid": 1 },
    { "name": "Omni", "value": "omni", "stage": "prod", "authid": 3 },
    { "name": "Global Business", "value": "globalBusiness", "stage": "prod", "authid": 4 },
    { "name": "BYOC", "value": "byoc", "stage": "prod", "authid": 5 },
    { "name": "National LUs", "value": "nationalLUs", "stage": "prod", "authid": 6 },
    { "name": "BCLS", "value": "bcls", "stage": "prod", "authid": 7 },
    { "name": "Engineering USA LUs", "value": "natLus", "stage": "prod", "authid": 8 }
];



export {
    statesData, coverageScoreData, fivegData, band14Data, firstNetData,
    roamingData, sortCriteriaData, byocAccessTypes, channels
};