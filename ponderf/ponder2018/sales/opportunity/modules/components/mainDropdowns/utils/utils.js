export const getMarketType = (marketType) => {
    if (marketType == "%") {
        return "NATIONAL";
    } else if ((marketType == "EAST") || (marketType == "WEST")) {
        return "REGION";
    } else {
        return "MARKET";
    }
};

export const getTableType = (value) => {
    if (value == "SALES_MARKET") {
        return "vpgms";
    } else if (value == "DMA") {
        return "dmas";
    } else if (value == "COUNTY") {
        return "counties";
    } else if (value == "ZIP") {
        return "zips";
    }
};
