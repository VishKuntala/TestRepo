const config = {
tableName: 'sot.sales_opp_mdu_acc_prod',
entityTypeMappings: {
    GeneralManagers: 'generalManager',
    AreaManagers: 'areaManager',
    PreferredPartners: 'preferredPartner',
    ContractTypes: 'contractType'
},
filterDataKeys: 
    { 
        generalManager: {
            filterTextTableColumn: 'gm',
            filterValueTableColumn: 'gm_id',
            filterSortTableColumn: 'gm'
        },
        areaManager: {
            filterTextTableColumn: 'area_mgr',
            filterValueTableColumn: 'area_mgr_id',
            filterSortTableColumn: 'area_mgr'   
        },
        preferredPartner: {
            filterTextTableColumn: 'preferred_partner',
            filterValueTableColumn: 'preferred_partner',
            filterSortTableColumn: 'preferred_partner'
        },
        contractType: {
            filterTextTableColumn: 'contract_type',
            filterValueTableColumn: 'contract_type',
            filterSortTableColumn: 'contract_type'
        }
    }
}

module.exports = config;