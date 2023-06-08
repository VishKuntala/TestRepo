const config = {
tableName: 'WST.SALES_USALU_LUS',
entityTypeMappings: {
    NetworkBuildTypes: 'networkbuildtype',
    States: 'statecode',
    Zipcodes: 'zipcode',
},

filterDataKeys: 
    { 
        networkbuildtype: {
            filterTextTableColumn: 'NETWORK_BUILD_TYPE_CD',
            filterValueTableColumn: 'NETWORK_BUILD_TYPE_CD',
            filterSortTableColumn: 'NETWORK_BUILD_TYPE_CD'
        },
        zipcode: {
            filterTextTableColumn: 'ZIPCODE',
            filterValueTableColumn: 'ZIPCODE',
            filterSortTableColumn: 'ZIPCODE'
        },
        statecode: {
            filterTextTableColumn: 'STATE_CD',
            filterValueTableColumn: 'STATE_CD',
            filterSortTableColumn: 'STATE_CD'
        }
    }

}

module.exports = config;