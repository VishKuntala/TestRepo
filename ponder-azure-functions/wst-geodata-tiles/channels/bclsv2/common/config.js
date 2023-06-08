const config = {
    tableName: 'WST.BCLS_SUMMARY',
    dataFilter : {
        ch2FiberQv : {
            fiberStatus : `select id from wst.ref_bb_fiber_status_report_rows where name in ('EMT', 'GPON LIT')`,
            owningSegName: `select id from wst.ref_bb_segment_name where name like 'ABS%' or name like 'SMALL BUSINESS%'`,
            locCustProsp: `select id from wst.ref_bb_loc_cust_prosp where name = 'Prospect' or name = 'Customer-Other'`
        },
        ch9FiberStores : {
            fiberStatus : `select id from wst.ref_bb_fiber_status_report_rows where name in ('EMT', 'GPON LIT')`,
            owningSegName: `select id from wst.ref_bb_segment_name where name like 'ABS%' or name like 'SMALL BUSINESS%'`,
            locCustProsp: `select id from wst.ref_bb_loc_cust_prosp where name = 'Prospect' or name = 'Customer-Other'`
        }
    }
}
    
module.exports = config;