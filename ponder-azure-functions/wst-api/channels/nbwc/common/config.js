const config = {
tableName: 'WST.SALES_CAMP_WIRELESS_SUM_PROD',
entityTypeMappings: {
    Campaigns: 'campaignIds',
    States: 'statecode',
    Zipcodes: 'zipcode',
    CoverageScores: 'indoorCovScore',
    FiveGs: 'fiveg',
    Band14s: 'band14',
    TputTexts: 'tputText',
    RoamingDependencies: 'roamingDependency',
    LegacyPens: 'legacyPen'
},


filterDataKeys: 
    { 
        campaignIds: {

        },
        zipcode: {
            filterTextTableColumn: 'ZIPCODE',
            filterValueTableColumn: 'ZIPCODE',
            filterSortTableColumn: 'ZIPCODE'
        },
        statecode: {
            filterTextTableColumn: 'STATE_Y',
            filterValueTableColumn: 'STATE_Y',
            filterSortTableColumn: 'STATE_Y'
        },
        indoorCovScore: {
            filterTextTableColumn: 'COVERAGE_SCORE',
            filterValueTableColumn: 'COVERAGE_SCORE',
            filterSortTableColumn: 'COVERAGE_SCORE'
        },
        fiveg: {
            filterTextTableColumn: 'FIVEG',
            filterValueTableColumn: 'FIVEG',
            filterSortTableColumn: 'FIVEG'
        },
        band14: {
            filterTextTableColumn: 'BAND_14',
            filterValueTableColumn: 'BAND_14',
            filterSortTableColumn: 'BAND_14'
        },
        tputText: {
            filterTextTableColumn: 'TPUT_TEXT',
            filterValueTableColumn: 'TPUT_TEXT',
            filterSortTableColumn: 'TPUT_TEXT'
        },
        roamingDependency: {
            filterTextTableColumn: 'ROAM_TEXT',
            filterValueTableColumn: 'ROAM_TEXT',
            filterSortTableColumn: 'ROAM_TEXT'
        },
        legacyPen: {
            filterTextTableColumn: 'FIBER_CUST',
            filterValueTableColumn: 'FIBER_CUST',
            filterSortTableColumn: 'FIBER_CUST'
        }
    }

}

module.exports = config;