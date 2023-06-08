const toolConfig = {
    "midmarket": {
        tool: 'midmarket',
        toolName: 'MidMarket',
        startingSortCriteria: 'INDOOR_COVERAGE_SCORE',
        baseUrl: '/sales/scoring/MidMarket.aspx',
        filter: {
            dataKeys: ['avpId', 'smId', 'salesRepId', 'mobSellerId', 'insideSalesId', 'companyNames', 'zipcode', 'statecode', 'indoorCovScore', 'fiveg', 'band14', 'speedExperience', 'availCapacity', 'roamingDependency', 'fiberStatus'],
            requiredDataKeys: ['avpId', 'smId', 'salesRepId', 'mobSellerId', 'insideSalesId'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['avpId'],
            mapResetDataKeys: ['avpId', 'smId', 'salesRepId', 'mobSellerId', 'insideSalesId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "INDOOR_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed Experience", "value": "SPEED_EXP_SORT_COLUMN" },
            { "name": "Avalable Capacity", "value": "AVAIL_CAP_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "5G+ mmWave", "value": "FIVEG_PLUS_MMWAVE_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" },
            { "name": "Fiber Status", "value": "FIBER_STATUS_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Business Name,AVP,Sales Manager,Seller,Mobility Seller,Inside Sales Seller,Indoor Coverage Score,5G,5G+ mmWave,Speed Experience,Available Capacity,Roaming,FNET,FNET Band 14,Fiber Status,Address,City,State,Zip",
        dataTableDataKeys: "rownum,company_name,owning_bm_user_id,owning_sm_user_id,owning_ae_user_id,mobility_acq_ae_user_id,inside_sales_moblty_ae_user_id,indoor_coverage_score,fiveg,fiveg_plus_mmwave,speed_experience,avail_capacity,roam_text,first_net,band_14,fiber_status,addr,city,state_y,zipcode",
        dataTableExportOmitKeys: "roam_text_sort_column,speed_exp_sort_column,avail_cap_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_mmwave_sort_column,first_net_sort_column",
        charts: ['indoor_coverage_score', 'fiveg', 'band_14', 'speed_experience', 'avail_cap', 'roam_text', 'fiber_status'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed,Medium Speed,High Speed,Very Low Avail Capacity,Low Avail Capacity,Medium Avail Capacity,High Avail Capacity,Very High Avail Capacity,99 - NONE,7 - NEAR FIBER 1000ft (Not Lit),6 - GPON SERVING AREA (Not Lit),5 - FIBER THERE (Not Lit),4 - GPON LIT,3 - SINGLE CUSTOMER NTE/CELL/LEGACY,2 - MULTI CUSTOMER NTE,1 - EMT',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed Experience,Available Capacity,Roaming,Fiber Status",
            categoryDataKeys: "indoor_coverage_score,fiveg,band_14,speed_experience,avail_capacity,roam_text,fiber_status"
        }
    },
    "omni": {
        tool: 'omni',
        toolName: 'Omni',
        startingSortCriteria: 'INDOOR_COVERAGE_SCORE',
        baseUrl: '/sales/scoring/Omni.aspx',
        filter: {
            dataKeys: ['smId', 'salesRepId', 'svIds', 'statecode', 'indoorCovScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen'],
            requiredDataKeys: ['smId', 'salesRepId'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['smId'],
            mapResetDataKeys: ['smId', 'salesRepId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "INDOOR_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "Legacy Device Penetration", "value": "FIBER_CUST_SORT_COLUMN" },
            { "name": "5G+", "value": "FIVEG_PLUS_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Business Name,Sales Manager,Seller,Indoor Coverage Score,5G,5G Plus,Speed and Available Capacity,Roaming,FNET,FNET Band 14,Legacy Device Penetration,Address,City,State,Zip",
        dataTableDataKeys: "rownum,svid_name,sm_attuid,owning_attuid,indoor_coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,addr,city,state_y,zipcode",
        dataTableExportOmitKeys: "roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['indoor_coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration",
            categoryDataKeys: "indoor_coverage_score,fiveg,band_14,tput_text,roam_text,fiber_cust"
        }
    },
    "nbwc": {
        tool: 'nbwc',
        toolName: 'National Business Wireless',
        startingSortCriteria: 'INDOOR_COVERAGE_SCORE',
        baseUrl: '/sales/scoring/WirelessCampaign.aspx',
        filter: {
            dataKeys: ['statecode', 'campaignIds', 'indoorCovScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen'],
            requiredDataKeys: ['statecode'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['statecode'],
            mapResetDataKeys: ['statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "INDOOR_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "Legacy Device Penetration", "value": "FIBER_CUST_SORT_COLUMN" },
            { "name": "5G+", "value": "FIVEG_PLUS_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" },
            { "name": "Primary Competitor", "value": "PRIMARY_COMPETITOR_NAME", "sortDirection": 'ASC' },
            { "name": "Employee Count", "value": "TO_NUMBER(NVL(NUMBER_OF_EMPLOYEES,0))" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank, Campaign Name, Company Name, Indoor Coverage Score, 5G, 5G Plus, Speed and Available Capacity, Roaming, FNET, FNET Band 14, Legacy Device Penetration, Primary Competitor, Employee Count, City, State, Zip, Campaign ID ",
        dataTableDataKeys: "rownum,campaign_name,contact_company_nm,indoor_coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,primary_competitor_name,number_of_employees,city_nm,state_y,postl_cd,campaign_id",
        dataTableExportOmitKeys: "contact_email,roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['indoor_coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration",
            categoryDataKeys: "indoor_coverage_score,fiveg,band_14,tput_text,roam_text,fiber_cust"
        }
    },
    "globalBusiness": {
        tool: 'globalBusiness',
        toolName: 'Global Business',
        startingSortCriteria: 'INDOOR_COVERAGE_SCORE',
        baseUrl: '/sales/scoring/GlobalBusiness.aspx',
        filter: {
            dataKeys: ['industry', 'svIds', 'companyNames', 'statecode', 'zipcode', 'fiveg', 'band14', 'speedExperience', 'availCapacity', 'roamingDependency', 'indoorCovScore', 'fiberStatus'],
            requiredDataKeys: ['industry'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['industry'],
            mapResetDataKeys: ['industry', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "INDOOR_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed Experience", "value": "SPEED_EXP_SORT_COLUMN" },
            { "name": "Avalable Capacity", "value": "AVAIL_CAP_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "5G+ mmWave", "value": "FIVEG_PLUS_MMWAVE_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" },
            { "name": "Fiber Status", "value": "FIBER_STATUS", "sortDirection": 'ASC' }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Industry,SVID,Business Name,Address,City,State,Zip,Indoor Coverage Score,5G,5G+ mmWave,Speed Experience,Available Capacity,Roaming,FNET,FNET Band 14,Fiber Status",
        dataTableDataKeys: "rownum,industry,svid,company_name,addr,city,state_y,zipcode,indoor_coverage_score,fiveg,fiveg_plus_mmwave,speed_experience,avail_capacity,roam_text,first_net,band_14,fiber_status",
        dataTableExportOmitKeys: "roam_text_sort_column,speed_exp_sort_column,avail_cap_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_mmwave_sort_column,first_net_sort_column",
        charts: ['indoor_coverage_score', 'fiveg', 'band_14', 'speed_experience', 'avail_cap', 'roam_text', 'fiber_status'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed,Medium Speed,High Speed,Very Low Avail Capacity,Low Avail Capacity,Medium Avail Capacity,High Avail Capacity,Very High Avail Capacity,99 - NONE,7 - NEAR FIBER 1000ft (Not Lit),6 - GPON SERVING AREA (Not Lit),5 - FIBER THERE (Not Lit),4 - GPON LIT,3 - SINGLE CUSTOMER NTE/CELL/LEGACY,2 - MULTI CUSTOMER NTE,1 - EMT',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed Experience,Available Capacity,Roaming,Fiber Status",
            categoryDataKeys: "indoor_coverage_score,fiveg,band_14,speed_experience,avail_capacity,roam_text,fiber_status"
        }
    },
    "byoc": {
        tool: 'byoc',
        toolName: 'PONDER - Select',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: '/sales/scoring/BYOC.aspx',
        filter: {
            dataKeys: ['accessType', 'clusterId', 'statecode', 'covScore', 'fiveg', 'band14', 'fnet', 'zipcode', 'suitability', 'fiveg_mmwave', 'fiveg_cband', 'speed_experience'],
            requiredDataKeys: ['accessType', 'clusterId'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['accessType'],
            mapResetDataKeys: ['accessType', 'clusterId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "5G+ mmWave", "value": "FIVEG_PLUS_MMWAVE_SORT_COLUMN" },
            { "name": "5G+ CBand", "value": "FIVEG_PLUS_CBAND_SORT_COLUMN" },
            { "name": "FNET", "value": "FNET_TEXT_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Mobile Speed Experience", "value": "SPEED_EXPERIENCE_SORT_COLUMN" },
            { "name": "Suitability", "value": "SUITABILITY_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Location ID,Company Name,Address,City,State,Zip,Indoor Coverage Score,5G,5G+ mmWave,5G+ CBand,FNET,FNET Band 14,Mobile Speed Experience,Suitability for high download Speed/Volume",
        dataTableDataKeys: "rownum,location_id,company_name,address,city,state,zipcode,coverage_score,fiveg,fiveg_plus_mmwave,fiveg_plus_cband,first_net,band_14,speed_experience,high_speed_suitability",
        dataTableExportOmitKeys: ['fnet_text_sort_column', 'tput_text_sort_column', 'suitability_sort_column', 'band_14_sort_column', 'fiveg_sort_column', 'fiveg_plus_mmwave_sort_column', 'fiveg_plus_cband_sort_column','speed_experience_sort_column'],
        charts: ['coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,No,Hotspot,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Unsuitable,Check with RAN,Suitable,Outdoor Only,Indoor',
            categoryLabels: "Indoor Coverage Score,5G,5G+ mmWave,5G+ CBand,FNET,FNET Band 14,Suitability for high download Speed/Volume",
            categoryDataKeys: "coverage_score,fiveg,fiveg_plus_mmwave,fiveg_plus_cband,first_net,band_14,legacy_device_text"
        }
    },
    "nationalLUs": {
        tool: 'nationalLUs',
        toolName: 'National Living Units',
        startingSortCriteria: 'STATE_CD',
        baseUrl: '/sales/scoring/NationalLUs.aspx',
        filter: {
            dataKeys: ['statecode', 'zipcode', 'networkbuildtype'],
            requiredDataKeys: ['statecode', 'zipcode'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['statecode', 'zipcode'],
            mapResetDataKeys: ['statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Network Build Type", "value": "NETWORK_BUILD_TYPE_CD", selected: true }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank, External Living Unit ID, Address, City, State, Zip, Unit, Network Build Type ",
        dataTableDataKeys: "rownum,external_living_unit_id,address,city,state_cd,zipcode,address_line_2,network_build_type_cd",
        charts: ['network_build_type_cd'],
        barchart: {
            categoryDataValues: 'NA,ATM RT,ATM CO,IP-CO,IP-RT,IP-RT-BP,IP-CO-BP,FTTPIP,FTTN,FTTN-BP,FTTP-GPON,FTTB-F',
            categoryLabels: "Network Build Type",
            categoryDataKeys: "network_build_type_cd"
        }
    },
    "bcls": {
        tool: 'bcls',
        toolName: 'BCLS',
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: '/sales/scoring/BCLS.aspx',
        filter: {            
            dataKeys: ['vpgm', 'archetype', 'dmaName', 'zipcode', 'mqoId', 'covScore', 'fiveg', 'band14', 'awbCapText', 'awbSpecEff', 'attRankGws' ,'gponStatus' ,'attOoklaQ' ,'tmoRatioOokla' ,'vznRatioOokla' ,'popDensity' ,'medIncome' ,'zipHispanic', 'hypergig'],
            requiredDataKeys: ['vpgm'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: [],
            mapResetDataKeys: ['vpgm', 'dmaName', 'zipcode']
        },
        map: { heatmapAttribute: 'simple_coverage_score'},
        sortCriteriaData: [
            { "name": "Simple Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "AWB Capacity", "value": "AWB_CAP_TEXT_SORT_COLUMN" },
            { "name": "AWB Spectrum Efficiency", "value": "AWB_SPEC_EFF_SORT_COLUMN" },
            { "name": "GPON Status", "value": "GPON_STATUS_SORT_COLUMN" }            
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank, VPGM, Archetype, DMA Name, MIKEY, Simple Coverage Score, 5G, FNET Band 14, AWB Capacity, AWB Spectrum Efficiency, GPON Status, GPON Customers, Hyper-Gig, ATT GWS Rank, TMO GWS Rank, VZ GWS Rank, ATT Ookla Quantile, TMO Ratio Ookla, VZ Ratio Ookla, Pop Density, Median Income, Address, City, State, Zip, Contact First Name, Contact Last Name, Contact Phone, Lat, Long, ",
        dataTableDataKeys: "rownum,vpgm,archetype,dma_nm,mikey,simple_coverage_score,fiveg,band_14,awb_capacity_text,awb_spectrum_efficiency,gpon_status,gpon_customers,hypergig,att_rank_gws,tmo_rank_gws,vz_rank_gws,att_ookla_quantile,tmo_ratio_ookla_lte,verizon_ratio_ookla_lte,pop_density_text,hh_median_income_text,addr,city,st,zip,contact_first_nm,contact_last_nm,contact_phone1,latitude,longitude",
        dataTableExportOmitKeys: "fiveg_sort_column,band_14_sort_column,awb_cap_text_sort_column,awb_spec_eff_sort_column,gpon_status_sort_column,hypergig_sort_column",
        charts: ['simple_coverage_score', 'fiveg', 'band_14', 'awb_capacity_text', 'awb_spectrum_efficiency', 'gpon_status'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Very Low Avail Capacity,Low Avail Capacity,Medium Avail Capacity,High Avail Capacity,Very High Avail Capacity,Very Low User Limit,Low User Limit,Medium User Limit,High User Limit,Highest User Limit,NO_GPON,GPON_AVAILABLE,GPON_CUSTOMER',
            categoryLabels: "Simple Coverage Score,5G,FNET Band 14,AWB Capacity,AWB Spectrum Efficiency,GPON Status",
            categoryDataKeys: "simple_coverage_score,fiveg,band_14,awb_capacity_text,awb_spectrum_efficiency,gpon_status"
        }
    },
}

export default toolConfig;