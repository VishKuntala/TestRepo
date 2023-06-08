const salesMarkets = [
    { "name": "National", "value": "%", selected: true },
    { "name": "----------", "value": "null", disabled: true },
    { "name": "East Region", "value": "EAST" },
    { "name": "----------", "value": "null", disabled: true },
    { "name": "Florida", "value": "FLORIDA" },
    { "name": "Greater Lakes", "value": "GREATER LAKES" },
    { "name": "Gulf States", "value": "GREATER LAKES" },
    { "name": "Mid-Atlantic", "value": "GREATER LAKES" },
    { "name": "Ohio / Pennsylvania", "value": "GREATER LAKES" },
    { "name": "Southeast States", "value": "GREATER LAKES" },
    { "name": "----------", "value": "null", disabled: true },
    { "name": "West Region", "value": "WEST" },
    { "name": "----------", "value": "null", disabled: true },
    { "name": "KAMO", "value": "KAMO" },
    { "name": "Northern California", "value": "NORTHERN CALIFORNIA" },
    { "name": "North Texas", "value": "NTX" },
    { "name": "South Texas", "value": "STX" },
    { "name": "Southern California", "value": "SOUTHERN CALIFORNIA" },
];

const heatMaps = [
    { "name": "Fiber Penetration Rate", "value": "fiberPenetration", selected: true },
    { "name": "Wireless Coverage & Fiber Avail", "value": "wirelessCoverageAndFiber" },
];

const groupBys = [
    {"name": "Sales Market", "value": "SALES_MARKET" },
    { "name": "CMA", "value": "CMA"},
    { "name": "County", "value": "COUNTY" },
    { "name": "Zip Code", "value": "ZIP" },
    { "name": "Dynamic", "value": "DYNAMIC", selected: true },
];

export {
    salesMarkets, heatMaps, groupBys
};