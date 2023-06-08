const config = {
tableName: 'WST.SALES_BCLS_ENRICHED',
entityTypeMappings: {
    Vpgms: 'vpgm',
    ArcheTypes: 'archetype',
    DmaNames: 'dmaName',
    Zipcodes: 'zipcode',
    CoverageScores: 'indoorCovScore',
    FiveGs: 'fiveg',
    Band14s: 'band14',
    AwbCapTexts: 'awbCapText',
    AwbSpecEffs: 'awbSpecEff',
    AttRankGwss: 'attRankGws',
    gponStatuss: 'gponStatus',
    AttOoklaQs: 'attOoklaQ',
    TmoRatioOoklas: 'tmoRatioOokla',
    VznRationOoklas: 'vznRatioOokla',
    PopDensitys: 'popDensity',
    MedIncomes: 'medIncome',
    Hypergigs: 'hypergig',
},

filterDataKeys: 
    { 
        vpgm: {
            filterTextTableColumn: 'VPGM',
            filterValueTableColumn: 'VPGM',
            filterSortTableColumn: 'VPGM'
        },
        archetype: {
            filterTextTableColumn: 'ARCHETYPE',
            filterValueTableColumn: 'ARCHETYPE',
            filterSortTableColumn: 'ARCHETYPE'
        },
        dmaName: {
            filterTextTableColumn: 'DMA_NM',
            filterValueTableColumn: 'DMA_NM',
            filterSortTableColumn: 'DMA_NM'
        },
        zipcode: {
            filterTextTableColumn: 'ZIP',
            filterValueTableColumn: 'ZIP',
            filterSortTableColumn: 'ZIP'
        },
        awbCapText: {
            filterTextTableColumn: 'AWB_CAPACITY_TEXT',
            filterValueTableColumn: 'AWB_CAPACITY_TEXT',
            filterSortTableColumn: 'awb_cap_text_sort_column'
        },
        indoorCovScore: {
            filterTextTableColumn: 'SIMPLE_COVERAGE_SCORE',
            filterValueTableColumn: 'SIMPLE_COVERAGE_SCORE',
            filterSortTableColumn: 'SIMPLE_COVERAGE_SCORE'
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
        awbSpecEff: {
            filterTextTableColumn: 'AWB_SPECTRUM_EFFICIENCY',
            filterValueTableColumn: 'AWB_SPECTRUM_EFFICIENCY',
            filterSortTableColumn: 'awb_spec_eff_sort_column'
        },
        attRankGws: {
            filterTextTableColumn: 'ATT_RANK_GWS',
            filterValueTableColumn: 'ATT_RANK_GWS',
            filterSortTableColumn: 'ATT_RANK_GWS'
        },
        gponStatus: {
            filterTextTableColumn: 'GPON_STATUS',
            filterValueTableColumn: 'GPON_STATUS',
            filterSortTableColumn: 'GPON_STATUS'
        },
        attOoklaQ: {
            filterTextTableColumn: 'ATT_OOKLA_QUANTILE',
            filterValueTableColumn: 'ATT_OOKLA_QUANTILE',
            filterSortTableColumn: 'ATT_OOKLA_QUANTILE'
        },
        tmoRatioOokla: {
            filterTextTableColumn: 'TMO_RATIO_OOKLA_LTE',
            filterValueTableColumn: 'TMO_RATIO_OOKLA_LTE',
            filterSortTableColumn: 'TMO_RATIO_OOKLA_LTE'
        },
        vznRatioOokla: {
            filterTextTableColumn: 'VERIZON_RATIO_OOKLA_LTE',
            filterValueTableColumn: 'VERIZON_RATIO_OOKLA_LTE',
            filterSortTableColumn: 'VERIZON_RATIO_OOKLA_LTE'
        },
        popDensity: {
            filterTextTableColumn: 'POP_DENSITY_TEXT',
            filterValueTableColumn: 'POP_DENSITY_TEXT',
            filterSortTableColumn: 'POP_DENSITY_TEXT'
        },
        medIncome: {
            filterTextTableColumn: 'HH_MEDIAN_INCOME_TEXT',
            filterValueTableColumn: 'HH_MEDIAN_INCOME_TEXT',
            filterSortTableColumn: 'HH_MEDIAN_INCOME_TEXT'
        },
        hypergig: {
            filterTextTableColumn: 'HYPERGIG',
            filterValueTableColumn: 'HYPERGIG',
            filterSortTableColumn: 'HYPERGIG_SORT_COLUMN'
        }

    }

}

module.exports = config;