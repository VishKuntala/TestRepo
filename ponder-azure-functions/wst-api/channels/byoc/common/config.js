const config = {
entityTypeMappings: {
    States: 'statecode',
    CoverageScores: 'indoorCovScore',
    Zipcodes: 'zipcode',
    ClusterNames: 'clusterId',
    FiveGs: 'fiveg',
    TputTexts: 'tputText',
    Fnets: 'fnet',
    Band14s: 'band14',
    Suitabilities: 'wbbSuitabilityIcs'
},
filterDataKeys: 
    { 
        statecode: {
            filterTextTableColumn: 'STATE',
            filterValueTableColumn: 'STATE',
            filterSortTableColumn: 'STATE'
        },
        indoorCovScore: {
            filterTextTableColumn: 'COVERAGE_SCORE',
            filterValueTableColumn: 'COVERAGE_SCORE',
            filterSortTableColumn: 'COVERAGE_SCORE'
        },
        zipcode: {
            filterTextTableColumn: 'ZIPCODE',
            filterValueTableColumn: 'ZIPCODE',
            filterSortTableColumn: 'ZIPCODE'
        },
        clusterId: {
            filterTextTableColumn: 'BYOC_CLUSTER_NAME',
            filterValueTableColumn: 'WST.SALES_OPP_BYOC_DETAIL.BYOC_CLUSTER_ID::text',
            filterSortTableColumn: 'BYOC_CLUSTER_NAME'
        },
        fiveg: {
            filterTextTableColumn: 'FIVEG',
            filterValueTableColumn: 'FIVEG',
            filterSortTableColumn: 'FIVEG'
        },
        tputText: {
            filterTextTableColumn: 'TPUT_TEXT',
            filterValueTableColumn: 'TPUT_TEXT',
            filterSortTableColumn: 'TPUT_TEXT'
        },
        fnet: {
            filterTextTableColumn: 'FIRST_NET',
            filterValueTableColumn: 'FIRST_NET',
            filterSortTableColumn: 'FIRST_NET'
        },
        band14: {
            filterTextTableColumn: 'BAND_14',
            filterValueTableColumn: 'BAND_14',
            filterSortTableColumn: 'BAND_14'
        },
        wbbSuitabilityIcs: {
            filterTextTableColumn: 'LEGACY_DEVICE_TEXT',
            filterValueTableColumn: 'LEGACY_DEVICE_TEXT',
            filterSortTableColumn: 'LEGACY_DEVICE_TEXT'
        }
    }

}

module.exports = config;