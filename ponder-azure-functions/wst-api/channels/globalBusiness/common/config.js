const config = {
tableName: 'WST.SALES_GLOBAL',
entityTypeMappings: {
    Industries: 'industry',
    States: 'statecode',
    CompanyNames: 'companyNames',
    NoLowAccounts: 'noLowAccounts',
    CoverageScores: 'indoorCovScore',
    Zipcodes: 'zipcode',
    SVNames: 'svIds',
    FiveGs: 'fiveg',
    Band14s: 'band14',
    TputTexts: 'tputText',
    RoamingDependencies: 'roamingDependency',
},

filterDataKeys: 
    { 
        industry: {
            filterTextTableColumn: 'industry',
            filterValueTableColumn: 'industry',
            filterSortTableColumn: 'industry'
        },
        statecode: {
            filterTextTableColumn: 'STATE_Y',
            filterValueTableColumn: 'STATE_Y',
            filterSortTableColumn: 'STATE_Y'
        },
        companyNames: {
            filterTextTableColumn: 'company_name',
            filterValueTableColumn: 'company_name',
            filterSortTableColumn: 'company_name'
        },
        noLowAccounts: {
            filterTextTableColumn: 'NO_LOW_ACCOUNT',
            filterValueTableColumn: 'NO_LOW_ACCOUNT',
            filterSortTableColumn: 'NO_LOW_ACCOUNT'
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
        svIds: {
            filterTextTableColumn: 'SVID',
            filterValueTableColumn: 'SVID',
            filterSortTableColumn: 'SVID'
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
    }

}

module.exports = config;