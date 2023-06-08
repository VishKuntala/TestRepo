const config = {
tableName: 'WST.NATIONAL_LUS',
filterTableName: 'WST.NATIONAL_LUS_LOC_FILTER',
entityTypeMappings: {
    SalesMarkets: 'salesMarket',
    DMAs: 'dmaName',
    States: 'statecode',
    Zipcodes: 'zipcode',
    CoverageScores: 'indoorCovScore',
    FiveGs: 'fiveg',
    Band14s: 'band14',
    FiveGPluses: 'fivegplus',
    CBands: 'cband',
    FNets: 'fnet',
    Suitabilities: 'wbbSuitabilityIcs',
    RANCauses: 'ranCause',
    SpeedExperiences: 'speedExperienceIcs',
    WeightedAvgTuputGrps: 'weightedAvgTuputGrp',
    AvailCapacities: 'availCapacity',
    RoamTexts: 'roamText',
    CqiGrps: 'cqiGrp',
    SpectrumEff12Pls: 'spectrumEff12Pl',
    CbandScses: 'cbandScs',
    WeightedAvgMcepPrbUtlGrps: 'weightedAvgMcepPrbUtlGrp'
},
filterDataKeys: 
    { 
        salesMarket: {
            filterTextTableColumn: 'vpgm.vpgm_markt',
            filterValueTableColumn: 'lus.sales_market_id',
            filterSortTableColumn: 'vpgm.vpgm_markt',
            joinClause: 'spatial.vpgm_market vpgm on lus.sales_market_id = vpgm.gid'
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
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_simple_coverage_score ref on lus.ics_score_id = ref.id',
            refTable: 'wst.ref_simple_coverage_score'
        },
        fiveg: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiveg_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_fiveg ref on lus.fiveg_id = ref.id',
            refTable: 'wst.ref_fiveg'
        },
        fivegplus: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiveg_plus_mmwave_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_fiveg_plus_mmwave ref on lus.fiveg_plus_mmwave_id = ref.id',
            refTable: 'wst.ref_fiveg_plus_mmwave'
        },
        cband: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.fiveg_plus_cband_ics_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_fiveg_plus_cband ref on lus.fiveg_plus_cband_ics_id = ref.id',
            refTable: 'wst.ref_fiveg_plus_cband'
        },
        band14: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.band_14_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_band_14 ref on lus.band_14_id = ref.id',
            refTable: 'wst.ref_band_14'
        },
        fnet: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.first_net_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_first_net ref on lus.first_net_id = ref.id',
            refTable: 'wst.ref_first_net'
        },
        wbbSuitabilityIcs: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.wireless_broadband_suitability_ics_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_sales_high_speed_suitability ref on lus.wireless_broadband_suitability_ics_id = ref.id',
            refTable: 'wst.ref_sales_high_speed_suitability'
        },
        ranCause: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.ran_suitability_cause_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_ran_suitability_cause ref on lus.ran_suitability_cause_id = ref.id',
            refTable: 'wst.ref_ran_suitability_cause'
        },
        speedExperienceIcs: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.speed_experience_ics_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_speed_experience ref on lus.speed_experience_ics_id = ref.id',
            refTable: 'wst.ref_speed_experience'
        },
        weightedAvgTuputGrp: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.weighted_avg_tput_grp_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_weighted_avg_tput_grp ref on lus.weighted_avg_tput_grp_id = ref.id',
            refTable: 'wst.ref_weighted_avg_tput_grp'
        },
        availCapacity: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.avail_capacity_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_avail_capacity ref on lus.avail_capacity_id = ref.id',
            refTable: 'wst.ref_avail_capacity'
        },
        roamText: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.roam_text_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_roam_text ref on lus.roam_text_id = ref.id',
            refTable: 'wst.ref_roam_text'
        },
        cqiGrp: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.cqi_grp_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_cqi_grp ref on lus.cqi_grp_id = ref.id',
            refTable: 'wst.ref_cqi_grp'
        },
        spectrumEff12Pl: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.spectrum_efficiency_12_pl_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_spectrum_efficiency_12_pl ref on lus.spectrum_efficiency_12_pl_id = ref.id',
            refTable: 'wst.ref_spectrum_efficiency_12_pl'
        },
        cbandScs: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.cband_scs_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_cband_scs ref on lus.cband_scs_id = ref.id',
            refTable: 'wst.ref_cband_scs'
        },
        weightedAvgMcepPrbUtlGrp: {
            filterTextTableColumn: 'ref.name',
            filterValueTableColumn: 'lus.weighted_avg_mcep_prbutl_grp_id',
            filterSortTableColumn: 'ref.name',
            joinClause: 'wst.ref_weighted_avg_mcep_prbutl_grp ref on lus.weighted_avg_mcep_prbutl_grp_id = ref.id',
            refTable: 'wst.ref_weighted_avg_mcep_prbutl_grp'
        }



    }

}

module.exports = config;