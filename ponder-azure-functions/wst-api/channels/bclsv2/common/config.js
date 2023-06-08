const config = {
tableName: 'WST.BCLS_SUMMARY',
filterTableName: 'WST.BCLS_SUMMARY_LOC_FILTER',
entityTypeMappings: {
    SalesMarkets: 'salesMarket',
    ArcheTypes: 'archeType',
    DMAs: 'dmaName',
    States: 'statecode',
    Zipcodes: 'zipcode',
    CoverageScores: 'indoorCovScore',
    FiveGs: 'fiveg',
    Band14s: 'band14',
    FiveGPluses: 'fivegplusMmwave',
    CBands: 'fivegplusCbandIcs',
    FNets: 'fnet',
    Suitabilities: 'wbbSuitabilityIcs',
    SpeedExperiences: 'speedExperienceIcs',
    AvailCapacities: 'availCapacity',
    MultiGigs: 'multiGig',
    FiberStatuses: 'fiberStatus',
    EligibleMaxSpeeds: 'eligibleMaxSpeed',
    AnyFiberCompetitors: 'anyFiberCompetitor',
    MultiTenants: 'multiTenant',
    AttOoklaQs: 'attOoklaQ',
    TmoRatioOoklas: 'tmoRatioOokla',
    VznRationOoklas: 'vznRatioOokla',
    PopDensitys: 'popDensity',
    MedIncomes: 'medIncome',
    HispanicPercents: 'percentHispanic',
    FutureFiberStatuses: 'futureFiberStatus',
    LocCustProsps: 'locCustProsp',
    TotFiberPorts: 'totFiberPort',
    AdiPorts: 'adiPort',
    AbfPorts: 'abfPort',
    GponPorts: 'gponPort',
    BbUversePorts: 'bbUversePort',
    BbIpdslPorts: 'bbIpdslPort',
    BbDslPorts: 'bbDslPort',
    OwningSegNames: 'owningSegName',
    OwningModuleSpecials: 'owningModuleSpecial',
    WirelineCustomers: 'wirelineCust',
    NonWirelineCustomers: 'nonWirelineCust',
    TotalWirelineOpportunities: 'totalWirelineOpps',
    NewlyLits: 'newlyLit',
    Psas: 'psa',
    FirstLits: 'firstLit',
    TotalEmployeesHeres: 'totalEmployeesHere',
    LocationIds: 'locationId',
    BusinessEmployees: 'businessEmployees',
    SicCdGrps: 'sicCdGrp',
    NoSpends: 'noSpend',
    Svids: 'svid',
    FiberPids: 'fiberPid'
},
filterDataKeys: 
    { 
        salesMarket: {
            filterTextTableColumn: 'vpgm.vpgm_markt',
            filterValueTableColumn: 'lus.sales_market_id',
            filterSortTableColumn: 'vpgm.vpgm_markt',
            joinClause: 'spatial.vpgm_market vpgm on lus.sales_market_id = vpgm.gid',
            authorizeByUserAttribute: 'sales_market'
        },
        archeType: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.archetype_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_archetype ref on lus.archetype_id = ref.id',
            refTable: 'wst.ref_bb_archetype'        
        },
        dmaName: {
            filterTextTableColumn: 'dmac.dma_name',
            filterValueTableColumn: 'lus.dma_id',
            filterSortTableColumn: 'dmac.dma_name',
            joinClause: 'spatial.dma_county dmac on lus.dma_id = dmac.gid'
        },
        statecode : {
            filterTextTableColumn: 'st.name',
            filterValueTableColumn: 'lus.state_id',
            filterSortTableColumn: 'st.name',
            joinClause: 'spatial.state st on lus.state_id = st.gid'
        },
        zipcode: {
            filterTextTableColumn: 'zipcode',
            filterValueTableColumn: 'zipcode',
            filterSortTableColumn: 'zipcode'
        },
        indoorCovScore: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.ics_score_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_simple_coverage_score ref on lus.ics_score_id = ref.id',
            refTable: 'wst.ref_simple_coverage_score'
        },
        fiveg: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiveg_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_fiveg ref on lus.fiveg_id = ref.id',
            refTable: 'wst.ref_fiveg'
        },
        fivegplusMmwave: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiveg_plus_mmwave_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_fiveg_plus_mmwave ref on lus.fiveg_plus_mmwave_id = ref.id',
            refTable: 'wst.ref_fiveg_plus_mmwave'
        },
        fivegplusCbandIcs: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiveg_plus_cband_ics_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_fiveg_plus_cband ref on lus.fiveg_plus_cband_ics_id = ref.id',
            refTable: 'wst.ref_fiveg_plus_cband'
        },
        band14: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.band_14_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_band_14 ref on lus.band_14_id = ref.id',
            refTable: 'wst.ref_band_14'
        },
        fnet: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.first_net_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_first_net ref on lus.first_net_id = ref.id',
            refTable: 'wst.ref_first_net'
        },
        wbbSuitabilityIcs: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.wireless_broadband_suitability_ics_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_sales_high_speed_suitability ref on lus.wireless_broadband_suitability_ics_id = ref.id',
            refTable: 'wst.ref_sales_high_speed_suitability'
        },
        speedExperienceIcs: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.speed_experience_ics_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_speed_experience ref on lus.speed_experience_ics_id = ref.id',
            refTable: 'wst.ref_speed_experience'
        },
        availCapacity: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.avail_capacity_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_avail_capacity ref on lus.avail_capacity_id = ref.id',
            refTable: 'wst.ref_avail_capacity'
        },
        multiGig: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.multigig_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_alternative ref on lus.multigig_id = ref.id',
            refTable: 'wst.ref_alternative'
        },
        fiberStatus: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiber_status_report_rows_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_fiber_status_report_rows ref on lus.fiber_status_report_rows_id = ref.id',
            refTable: 'wst.ref_bb_fiber_status_report_rows'
        },
        eligibleMaxSpeed: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.bb_eligible_max_speed_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_eligible_max_speed ref on lus.bb_eligible_max_speed_id = ref.id',
            refTable: 'wst.ref_bb_eligible_max_speed'
        },
        anyFiberCompetitor: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiber_competitor_any_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_alternative ref on lus.fiber_competitor_any_id = ref.id',
            refTable: 'wst.ref_alternative'        
        },
        multiTenant: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.multi_tenant_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_alternative ref on lus.multi_tenant_id = ref.id',
            refTable: 'wst.ref_alternative'                
        }, 
        newlyLit: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.newly_lit_gpon_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_alternative ref on lus.newly_lit_gpon_id = ref.id',
            refTable: 'wst.ref_alternative'                
        },
        firstLit: {
            filterTextTableColumn: 'any_fiber_lit_yearmo',
            filterValueTableColumn: 'any_fiber_lit_yearmo',
            filterSortTableColumn: 'any_fiber_lit_yearmo',
            filterSortDirection: 'DESC'
        },
        percentHispanic: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.pct_hispanic_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_pct_hispanic ref on lus.pct_hispanic_id = ref.id',
            refTable: 'wst.ref_bb_pct_hispanic'
        },
        attOoklaQ: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.att_ookla_quintile_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_att_ookla_quintile ref on lus.att_ookla_quintile_id = ref.id',
            refTable: 'wst.ref_bb_att_ookla_quintile'
        },
        tmoRatioOokla: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.tmo_ratio_ookla_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_tmovzn_ratio ref on lus.tmo_ratio_ookla_id = ref.id',
            refTable: 'wst.ref_bb_tmovzn_ratio'
        },
        vznRatioOokla: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.vzn_ratio_ookla_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_tmovzn_ratio ref on lus.vzn_ratio_ookla_id = ref.id',
            refTable: 'wst.ref_bb_tmovzn_ratio'
        },
        popDensity: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.pop_density_zip_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_pop_denisty_quintile ref on lus.pop_density_zip_id = ref.id',
            refTable: 'wst.ref_bb_pop_denisty_quintile'
        },
        medIncome: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.median_income_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_median_income ref on lus.median_income_id = ref.id',
            refTable: 'wst.ref_bb_median_income'
        },
        futureFiberStatus1: {
            filterTextTableColumn: 'lus.ecd_bucket',
            filterValueTableColumn: 'lus.ecd_bucket',
            filterSortTableColumn: 'lus.ecd_bucket'
        },
        futureFiberStatus: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.future_fiber_status_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_future_fiber_status ref on lus.future_fiber_status_id = ref.id',
            refTable: 'wst.ref_bb_future_fiber_status'
        },
        locCustProsp: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.loc_cust_prosp_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_loc_cust_prosp ref on ts.loc_cust_prosp_id = ref.id',
            refTable: 'wst.ref_bb_loc_cust_prosp'
        },
        totFiberPort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.tot_fiber_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_tot_fiber_ports ref on ts.tot_fiber_ports = ref.id',
            refTable: 'wst.ref_tot_fiber_ports'
        },
        adiPort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.adi_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_adi_ports ref on ts.adi_ports = ref.id',
            refTable: 'wst.ref_adi_ports'
        },
        abfPort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.abf_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_abf_ports ref on ts.abf_ports = ref.id',
            refTable: 'wst.ref_abf_ports'
        },
        gponPort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.gpon_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_gpon_ports ref on ts.gpon_ports = ref.id',
            refTable: 'wst.ref_gpon_ports'
        },
        bbUversePort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.bb_uverse_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_uverse_ports ref on ts.bb_uverse_ports = ref.id',
            refTable: 'wst.ref_bb_uverse_ports'
        },
        bbIpdslPort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.bb_ipdsl_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_ipdsl_ports ref on ts.bb_ipdsl_ports = ref.id',
            refTable: 'wst.ref_bb_ipdsl_ports'
        },
        bbDslPort: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.bb_dsl_ports',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_dsl_ports ref on ts.bb_dsl_ports = ref.id',
            refTable: 'wst.ref_bb_dsl_ports'
        },
        owningSegName: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.segment_name_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_segment_name ref on ts.segment_name_id = ref.id',
            refTable: 'wst.ref_bb_segment_name'
        },
        owningModuleSpecial: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.owning_module_special_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_owning_module_special ref on ts.owning_module_special_id = ref.id',
            refTable: 'wst.ref_bb_owning_module_special'
        },
        wirelineCust: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.total_customers_at_location_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_total_customers_at_location ref on lus.total_customers_at_location_id = ref.id',
            refTable: 'wst.ref_bb_total_customers_at_location'
        },
        nonWirelineCust: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.non_fiber_customers_at_location_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_non_fiber_customers_at_location ref on lus.non_fiber_customers_at_location_id = ref.id',
            refTable: 'wst.rref_bb_non_fiber_customers_at_location '
        },
        totalWirelineOpps: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.total_opportunities_at_location_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_total_opportunities_at_location ref on lus.total_opportunities_at_location_id = ref.id',
            refTable: 'wst.ref_bb_total_opportunities_at_location'
        },
        psa: {
            filterTextTableColumn: 'wcpsa',
            filterValueTableColumn: 'wcpsa',
            filterSortTableColumn: 'wcpsa',
            wildcard: true
        },
        totalEmployeesHere: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.total_employees_here_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_total_employees_here ref on lus.total_employees_here_id = ref.id',
            refTable: 'wst.ref_bb_total_employees_here'                
        },
        locationId: {
            filterTextTableColumn: 'location_id',
            filterValueTableColumn: 'location_id',
            filterSortTableColumn: 'location_id',
            wildcard: true
        },
        sicCdGrp: {
            filterTextTableColumn: "CONCAT(ts.bcl_sic,' - ',ts.bcl_sic_grp)",
            filterValueTableColumn: 'ts.bcl_sic',
            filterSortTableColumn: 'ts.bcl_sic',
            wildcard: true
        },
        businessEmployees: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.tenant_employees_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_tenant_employees ref on ts.tenant_employees_id = ref.id',
            refTable: 'wst.ref_bb_tenant_employees'
        },
        noSpend: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'ts.active_mobility_spend_id',
            filterSortTableColumn: 'ref.order_id',
            joinClause: 'wst.ref_bb_active_mobility_spend ref on ts.active_mobility_spend_id = ref.id',
            refTable: 'wst.ref_bb_active_mobility_spend'
        },        
        svid: {
            filterTextTableColumn: 'ts.co_id',
            filterValueTableColumn: 'ts.co_id',
            filterSortTableColumn: 'ts.co_id',
            wildcard: true
        },
        fiberPid: {
            filterTextTableColumn: 'fiber_pid',
            filterValueTableColumn: 'fiber_pid',
            filterSortTableColumn: 'fiber_pid'
        },
      
    },
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