const salesMarkets = [
    { name: "National", value: "%", selected: true },
    { name: "----------", value: "null", disabled: true },
    { name: "East Region", value: "EAST" },
    { name: "----------", value: "null", disabled: true },
    { name: "Florida", value: "FLORIDA" },
    { name: "Greater Lakes", value: "GREATER LAKES" },
    { name: "Gulf States", value: "GULF STATES" },
    { name: "Mid-Atlantic", value: "MID-ATLANTIC" },
    { name: "Ohio / Pennsylvania", value: "OHIO/PENNSYLVANIA" },
    { name: "Southeast States", value: "SOUTHEAST STATES" },
    { name: "----------", value: "null", disabled: true },
    { name: "West Region", value: "WEST" },
    { name: "----------", value: "null", disabled: true },
    { name: "KAMO", value: "KAMO" },
    { name: "Northern California", value: "NORTHERN CALIFORNIA" },
    { name: "North Texas", value: "NTX" },
    { name: "South Texas", value: "STX" },
    { name: "Southern California", value: "SOUTHERN CALIFORNIA" },
];

const heatMaps = [
    {
        name: "Fiber Penetration Rate",
        value: "fiberPenetration",
        selected: true,
    },
    {
        name: "Wireless Coverage & Fiber Avail",
        value: "wirelessCoverageAndFiber",
    },
    {
        name: "Copper Upgrade",
        value: "copperUpgrade",
    },
    {
        name: "Fiber Opportunity",
        value: "fiberOpportunity",
    },
];

const groupBys = [
    { name: "Dynamic", value: "DYNAMIC", selected: true },
    { name: "----------", value: "null", disabled: true },
    { name: "Sales Market", value: "SALES_MARKET" },
    //{ name: "CMA", value: "CMA" },
    { name: "DMA", value: "DMA" },
    { name: "County", value: "COUNTY", disabled: true },
    { name: "Zip Code", value: "ZIP", disabled: true },
];

export { salesMarkets, heatMaps, groupBys };
