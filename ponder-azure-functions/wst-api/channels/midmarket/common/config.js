const config = {
tableName: 'WST.SALES_MIDMARKET_PROD',
entityTypeMappings: {
    AVPs: 'avpId',
    SalesManagers: 'smId',
    SalesRepresentatives: 'salesRepId',
    MobSellers: 'mobSellerId',
    SVNames: 'svIds',
    States: 'statecode',
    Zipcodes: 'zipcode',
    CoverageScores: 'indoorCovScore',
    FiveGs: 'fiveg',
    Band14s: 'band14',
    TputTexts: 'tputText',
    RoamingDependencies: 'roamingDependency',
    LegacyPens: 'legacyPen',
    FiberStatuses: 'fiberStatus',
},
filterDataKeys: 
    { 
        avpId : {
            filterTextTableColumn: 'avp_attuid',
            filterValueTableColumn: 'avp_attuid',
            filterSortTableColumn: 'avp_attuid'
        },
        smId: {
            filterTextTableColumn: 'sm_attuid',
            filterValueTableColumn: 'sm_attuid',
            filterSortTableColumn: 'sm_attuid'
        },
        salesRepId: {
            filterTextTableColumn: 'owning_attuid',
            filterValueTableColumn: 'owning_attuid',
            filterSortTableColumn: 'owning_attuid'
        },
        mobSellerId: {
            filterTextTableColumn: 'MOB_SE_ATTUID',
            filterValueTableColumn: 'MOB_SE_ATTUID',
            filterSortTableColumn: 'MOB_SE_ATTUID'
        },
        svIds: {
            filterTextTableColumn: 'SVID_NAME',
            filterValueTableColumn: 'SVID',
            filterSortTableColumn: 'SVID_NAME'
        },
        zipcode: {
            filterTextTableColumn: 'ZIPCODE',
            filterValueTableColumn: 'ZIPCODE',
            filterSortTableColumn: 'ZIPCODE'
        },
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
            filterTextTableColumn: 'LEGACY_DEVICE_TEXT',
            filterValueTableColumn: 'LEGACY_DEVICE_TEXT',
            filterSortTableColumn: 'LEGACY_DEVICE_TEXT'
        },
        fiberStatus: {
            filterTextTableColumn: 'FIBER_STATUS',
            filterValueTableColumn: 'FIBER_STATUS',
            filterSortTableColumn: 'FIBER_STATUS'
        }
    }

}

module.exports = config;