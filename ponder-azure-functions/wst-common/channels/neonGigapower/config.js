const R = require('ramda');

/* const groupMembership = R.filter(n => n === 'NEON_GIGAPOWER' || n === 'NEON_GIGAPOWER_LIMITED' || n === 'NEON_GIGAPOWER_SELLER' || n === 'NEON_GIGAPOWER_SELLER_LIMITED', 
R.split('|', process.env.GROUP_MEMBERSHIP || ''))[0] || 'NEON_GIGAPOWER_SELLER_LIMITED'; */

const accessGroupBasedSelectColumns = {
    "ADMIN" : {
        "addr_customer_category_id" : "addr_customer_category_id",
        "map_customer_category_id" : "map_customer_category_id"

    },
    "NEON_GIGAPOWER" : {
        "addr_customer_category_id" : "addr_customer_category_id",
        "map_customer_category_id" : "map_customer_category_id"

    },
    "NEON_GIGAPOWER_LIMITED": {
        "addr_customer_category_id" : "addr_customer_category_id",
        "map_customer_category_id" : "map_customer_category_id"
    },
     "NEON_GIGAPOWER_SELLER" : {
        "addr_customer_category_id" : "seller_addr_cust_cat_id",
        "map_customer_category_id" : "seller_map_cust_cat_id"

    },
    "NEON_GIGAPOWER_SELLER_LIMITED": {
        "addr_customer_category_id" : "seller_addr_cust_cat_id",
        "map_customer_category_id" : "seller_map_cust_cat_id"
    }
};
const config = groupMembership => { return {
    tableName: 'wst.neon_gigapower_psa',
    filterTableName: 'wst.neon_gigapower_loc_filter',
    accessGroupBasedSelectColumns,
    groupMembership,
    entityTypeMappings: {
        SalesMarkets: 'salesMarket',
        DMAs: 'dmaName',
        States: 'statecode',
        Zipcodes: 'zipcode',
        CoverageScores: 'indoorCovScore',
        MultiGigs: 'multiGig',
        FiberStatuses: 'fiberStatus',
        CsiEligibilities: 'csiEligibility',
        Psas: 'psa',
    },
    filterDataKeys: 
        { 
            salesMarket: {
                filterTextTableColumn: 'vpgm.vpgm_markt',
                filterValueTableColumn: 'lus.sales_market_gid',
                filterSortTableColumn: 'vpgm.vpgm_markt',
                joinClause: 'spatial.vpgm_market vpgm on lus.sales_market_gid = vpgm.gid',
                authorizeByUserAttribute: 'sales_market'
            },
            dmaName: {
                filterTextTableColumn: 'dmac.dma_name',
                filterValueTableColumn: 'lus.dma_gid',
                filterSortTableColumn: 'dmac.dma_name',
                joinClause: 'spatial.dma_county dmac on lus.dma_gid = dmac.gid'
            },
            statecode : {
                filterTextTableColumn: 'st.name',
                filterValueTableColumn: 'lus.state_gid',
                filterSortTableColumn: 'st.name',
                joinClause: 'spatial.state st on lus.state_gid = st.gid'
            },
            zipcode: {
                filterTextTableColumn: 'lus.zip',
                filterValueTableColumn: 'lus.zip',
                filterSortTableColumn: 'lus.zip'
            },
            indoorCovScore: {
                filterTextTableColumn: 'ref.name',
                filterValueTableColumn: 'ts.indoor_coverage_score',
                filterSortTableColumn: 'ref.order_id',
                joinClause: 'wst.ref_simple_coverage_score ref on ts.indoor_coverage_score = ref.id',
                refTable: 'wst.ref_simple_coverage_score'
            },
            multiGig: {
                filterTextTableColumn: 'ref.name',
                filterValueTableColumn: 'ts.hypergig',
                filterSortTableColumn: 'ref.order_id',
                joinClause: 'wst.ref_alternative ref on ts.hypergig = ref.id',
                refTable: 'wst.ref_alternative'
            },
            fiberStatus: {
                filterTextTableColumn: 'ref.name',
                filterValueTableColumn: `ts.${accessGroupBasedSelectColumns[groupMembership]["addr_customer_category_id"]}`,
                filterSortTableColumn: 'ref.order_id',
                joinClause: `wst.ref_neon_gigapower_addr_customer_category ref on ts.${accessGroupBasedSelectColumns[groupMembership]["addr_customer_category_id"]} = ref.id`,
                refTable: 'wst.ref_neon_gigapower_addr_customer_category'
            },
            psa: {
                filterTextTableColumn: 'lus.zip_co_psa',
                filterValueTableColumn: 'lus.zip_co_psa',
                filterSortTableColumn: 'lus.zip_co_psa',
                wildcard: true
            },
            csiEligibility: {
                filterTextTableColumn: 'ref.name',
                filterValueTableColumn: 'ts.csi_eligible',
                filterSortTableColumn: 'ref.order_id',
                joinClause: 'wst.ref_alternative ref on ts.csi_eligible = ref.id',
                refTable: 'wst.ref_alternative'
            }
        },
        dataFilter : {
        }

    }
}

module.exports = config;