
const salesMarkets = [
    { name: "National", value: "%25", selected: true },
    { name: "----------", value: "null", disabled: true },
    { name: "East Region", value: "EAST" },
    { name: "----------", value: "null", disabled: true },
    { name: "Florida", value: "FLORIDA" },
    { name: "Greater Lakes", value: "GREATER LAKES" },
    { name: "Gulf States", value: "GULF STATES" },
    { name: "Mid-Atlantic", value: "MID-ATLANTIC" },
    { name: "Ohio / Pennsylvania", value: "OHIO PENNSYLVANIA" },
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

const heatMaps = defaultHeatMap => [
   
    {
        name: "Average Indoor Coverage Score",
        value: "aveCoverageScore",
        selected: defaultHeatMap === "aveCoverageScore"
    },
    {
        name: "Location Count Density (Dynamic)",
        value: "locationDensity",
        selected: defaultHeatMap === "locationDensity"
    },
    {
        name: "None",
        value: "none",
        selected: defaultHeatMap === "none"
    }
];

const locationAttributes = defaultLocationAttribute => [

    {
        name: "Indoor Coverage Score",
        value: "wirelessScore",
        selected: defaultLocationAttribute === "wirelessScore",
    },
    {
        name: "Fiber Status",
        value: "fiberStatus",
        selected: defaultLocationAttribute === "fiberStatus",
    },
    {
        name: "Future Fiber Status",
        value: "futureFiberStatus",
        selected: defaultLocationAttribute === "futureFiberStatus",
    }
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

export { salesMarkets, heatMaps, groupBys, locationAttributes };
