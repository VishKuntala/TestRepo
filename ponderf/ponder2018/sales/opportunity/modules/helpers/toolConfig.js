const toolConfig = {
    opportunity: {
        tool: "opportunity",
        toolName: "Sales Opportunity",
        startingSortCriteria: "fiber_opportunity desc",       
        baseUrl: `${$("#hdnBaseApiUrl").val()}/fot/acc`,
        zoomStart: 2.9,
        mapCoordsStart: [-99.6600291, 36.9321606],
        heatmapStart: "fiberPenetration",
        filter: {
            dataKeys: ["generalManager", "areaManager", "preferredPartner", "contractType"],
            requiredDataKeys: ["generalManager", "areaManager", "preferredPartner", "contractType"],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ["generalManager", "areaManager", "preferredPartner", "contractType"],
            mapResetDataKeys: [],
        },
        sortCriteriaData: [],
        tableRecordsLimit: 5000,
        defaultMainTable: "vpgms",
        dataInfo: [{ display_name: '' }, { display_name: '' }, { display_name: '' }, { display_name: '' }, { display_name: '' }]
    }
};

export default toolConfig;
