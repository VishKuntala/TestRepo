const toolConfig = {
    "midmarket": {
        tool: 'midmarket',
        toolName: 'MidMarket',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/midmarket`,
        filter: {
            dataKeys: ['avpId', 'smId', 'salesRepId', 'mobSellerId', 'svIds', 'statecode', 'covScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen', 'fiberStatus'],
            requiredDataKeys: ['avpId', 'smId', 'salesRepId', 'mobSellerId'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['avpId'],
            mapResetDataKeys: ['avpId', 'smId', 'salesRepId', 'mobSellerId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "Legacy Device Penetration", "value": "LEGACY_DEVICE_TEXT_SORT_COLUMN" },
            { "name": "5G+", "value": "FIVEG_PLUS_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" },
            { "name": "Fiber Status", "value": "FIBER_STATUS_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Business Name,AVP,Sales Manager,Seller,Mobility Seller,Simple Coverage Score,5G,5G Plus,Speed and Available Capacity,Roaming,FNET,FNET Band 14,Legacy Device Penetration,Fiber Status,Address,City,State,Zip",
        dataTableDataKeys: "rownum,svid_name,avp_attuid,sm_attuid,owning_attuid,mob_se_attuid,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,legacy_device_text,fiber_status,addr,city,state,zipcode",
        dataTableExportOmitKeys: "roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'legacy_device_text'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,99 - NONE,7 - NEAR FIBER 1000ft (Not Lit),5 - FIBER THERE (Not Lit),3 - SINGLE CUSTOMER NTE/CELL/LEGACY,2 - MULTI CUSTOMER NTE,1 - EMT',
            categoryLabels: "Simple Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration,Fiber Status",
            categoryDataKeys: "coverage_score,fiveg,band_14,tput_text,roam_text,legacy_device_text,fiber_status"
        },
        map: {
            heatmapAttribute: 'coverage_score',
            popupHtml: locationData => `
                        <b>Sales Channel:</b> Mid Market Locations
                        <br/><b>Company Name:</b> ${locationData.svid_name}                        
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state} ${locationData.zipcode}
                        <br/><b>Simple Coverage Score:</b> ${locationData.coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G+:</b> ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b> ${locationData.first_net} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>Legacy Device Penetration:</b> ${locationData.legacy_device_text}
                        <br/><b>Fiber Status:</b> ${locationData.fiber_status}
                     `
        },
    },
    "omni": {
        tool: 'omni',
        toolName: 'Omni',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/omni`,
        filter: {
            dataKeys: ['smId', 'salesRepId', 'svIds', 'statecode', 'covScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen'],
            requiredDataKeys: ['smId', 'salesRepId'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['smId'],
            mapResetDataKeys: ['smId', 'salesRepId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "Legacy Device Penetration", "value": "FIBER_CUST_SORT_COLUMN" },
            { "name": "5G+", "value": "FIVEG_PLUS_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Business Name,Sales Manager,Seller,Simple Coverage Score,5G,5G Plus,Speed and Available Capacity,Roaming,FNET,FNET Band 14,Legacy Device Penetration,Address,City,State,Zip",
        dataTableDataKeys: "rownum,svid_name,sm_attuid,owning_attuid,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,addr,city,state_y,zipcode",
        dataTableExportOmitKeys: "roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Simple Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration",
            categoryDataKeys: "coverage_score,fiveg,band_14,tput_text,roam_text,fiber_cust"
        },
        map: {
            heatmapAttribute: 'coverage_score',
            popupHtml: locationData => `
                        <b>Sales Channel:</b> Omni Locations
                        <br/><b>Company Name:</b> ${locationData.svid_name}                        
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state_y} ${locationData.zipcode}
                        <br/><b>Simple Coverage Score:</b> ${locationData.coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G+:</b> ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b> ${locationData.first_net} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>Legacy Device Penetration:</b> ${locationData.fiber_cust}
                    `
        },
    },
    "nbwc": {
        tool: 'nbwc',
        toolName: 'National Business Wireless',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/nbwc`,
        filter: {
            dataKeys: ['statecode', 'campaignIds', 'covScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen'],
            requiredDataKeys: ['statecode'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['statecode'],
            mapResetDataKeys: ['statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Coverage Score", "value": "COVERAGE_SCORE", selected: true },
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
        dataTableHeaders: "Rank, Campaign Name, Company Name, Simple Coverage Score, 5G, 5G Plus, Speed and Available Capacity, Roaming, FNET, FNET Band 14, Legacy Device Penetration, Primary Competitor, Employee Count, City, State, Zip, Campaign ID ",
        dataTableDataKeys: "rownum,campaign_name,contact_company_nm,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,primary_competitor_name,number_of_employees,city_nm,state_y,postl_cd,campaign_id",
        dataTableExportOmitKeys: "contact_email,roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Simple Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration",
            categoryDataKeys: "coverage_score,fiveg,band_14,tput_text,roam_text,fiber_cust"
        },
        map: {
            heatmapAttribute: 'coverage_score',
            popupHtml: locationData => `
                        <b>Campaign ID:</b> ${locationData.campaign_id}
                        <br/><b>Campaign Name:</b> ${locationData.campaign_name}
                        <br/><b>Company Name:</b> ${locationData.contact_company_nm}
                        <br/><b>Location ID:</b> ${locationData.location_id}
                        <br/><b>Contact Name:</b> ${locationData.contact_first_nm} ${locationData.contact_last_nm}
                        <br/><b>Contact Phone:</b> ${locationData.contact_phone1}
                        <br/><b>Contact email:</b> ${locationData.contact_email}
                        <br/><b>Address:</b> ${locationData.addr_line1}
                        <br/><b>City, State Zip:</b> ${locationData.city_nm}, ${locationData.state_y} ${locationData.postl_cd}
                        <br/><b>Number of Employees:</b> ${locationData.number_of_employees}
                        <br/><b>Wireless Coverage Score:</b> ${locationData.coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G+:</b> ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b> ${locationData.first_net} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>Legacy Device Penetration:</b> ${locationData.fiber_cust}
                        <br/><b>Primary Competitor:</b> ${locationData.primary_competitor_name}
                     `
        },
    },
    "globalBusiness": {
        tool: 'globalBusiness',
        toolName: 'Global Business',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/globalBusiness`,
        filter: {
            dataKeys: ['industry', 'svIds', 'companyNames', 'noLowAccounts', 'statecode', 'zipcode', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'covScore'],
            requiredDataKeys: ['industry'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['industry'],
            mapResetDataKeys: ['industry', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "5G+", "value": "FIVEG_PLUS_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" },
            { "name": "No Low Account", "value": "NO_LOW_ACCOUNT", "sortDirection": 'ASC' }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Industry,SVID,Business Name,Address,City,State,Zip,Simple Coverage Score,5G,5G Plus,Speed and Available Capacity,Roaming,FNET,FNET Band 14,Legacy Device Penetration,No Low Account",
        dataTableDataKeys: "rownum,industry,svid,company_name,addr,city,state_y,zipcode,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,no_low_account",
        dataTableExportOmitKeys: "roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Simple Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming",
            categoryDataKeys: "coverage_score,fiveg,band_14,tput_text,roam_text"
        },
        map: {
            heatmapAttribute: 'coverage_score',
            popupHtml: locationData => `
                        <b>Sales Channel:</b> Global Business Locations
                        <br/><b>Industry:</b> ${locationData.industry}
                        <br/><b>SVID:</b> ${locationData.svid}
                        <br/><b>Company Name:</b> ${locationData.company_name}                        
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state_y} ${locationData.zipcode}
                        <br/><b>Simple Coverage Score:</b> ${locationData.coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G +:</b > ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b > ${locationData.first_net} - <b>FNET Band 14:</b > ${locationData.band_14}                        
                        <br/><b>No Low Account:</b> ${locationData.no_low_account }
                    `
            },
    },
    "byoc": {
        tool: 'byoc',
        toolName: 'BYOC',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/byoc`,
        filter: {
            dataKeys: ['accessType', 'clusterId', 'statecode', 'covScore', 'fiveg', 'band14', 'tputText', 'fnet', 'zipcode', 'suitability'],
            requiredDataKeys: ['accessType', 'clusterId'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['accessType'],
            mapResetDataKeys: ['accessType', 'clusterId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },            
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "FNET", "value": "FNET_TEXT_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Suitability", "value": "SUITABILITY_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Location ID,Company Name,Address,City,State,Zip,Simple Coverage Score,5G,Speed and Available Capacity,FNET,FNET Band 14,Suitability",
        dataTableDataKeys: "rownum,location_id,company_name,address,city,state,zipcode,coverage_score,fiveg,tput_text,first_net,band_14,suitability",
        dataTableExportOmitKeys: "roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'first_net', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,Unsuitable,Check with RAN,Suitable',
            categoryLabels: "Simple Coverage Score,5G,Speed/Avail Capacity,FNET,FNET Band 14,Suitability",
            categoryDataKeys: "coverage_score,fiveg,tput_text,first_net,band_14,legacy_device_text"
        },
        map: {
            heatmapAttribute: 'coverage_score',
            popupHtml: locationData => `
                      <b>Sales Channel:</b> BYOC Locations
                      <br/><b>Cluster Name:</b> ${locationData.byoc_cluster_name}
                      <br/><b>Company Name:</b> ${locationData.company_name}
                      <br/><b>Location ID:</b> ${locationData.location_id}
                      <br/><b>Address:</b> ${locationData.address}
                      <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state} ${locationData.zipcode}
                      <br/><b>Simple Coverage Score:</b> ${locationData.coverage_score}
                      <br/><b>5G:</b> ${locationData.fiveg}
                      <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                      <br/><b>FNET:</b> ${locationData.first_net}
                      <br/><b>FNET Band 14:</b> ${locationData.band_14}
                      <br/><b>Suitability:</b> ${locationData.legacy_device_text}
                    `
        },
    },
    "nationalLUs": {
        tool: 'nationalLUs',
        toolName: 'National Living Units',
        startingSortCriteria: 'STATE_CD',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/nationalLUs`,
        filter: {
            dataKeys: ['statecode', 'zipcode', 'networkbuildtype'],
            requiredDataKeys: ['statecode', 'zipcode'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['statecode'],
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
        },
        map: {
            popupHtml: locationData => `
                        <b>Sales Channel:</b> National Living Unit Locations
                        <br/><b>External Living Unit ID:</b> ${locationData.external_living_unit_id}                        
                        <br/><b>Address:</b> ${locationData.address}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state_cd} ${locationData.zipcode}
                        <br/><b>Unit:</b> ${locationData.address_line_2}
                        <br/><b>Network Build Type:</b> ${locationData.network_build_type_cd}
                    `
        },
    },
    "bcls": {
        tool: 'bcls',
        toolName: 'BCLS',
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bcls`,
        filter: {            
            dataKeys: ['vpgm', 'archetype', 'dmaName', 'zipcode', 'mqoId', 'covScore', 'fiveg', 'band14', 'awbCapText', 'awbSpecEff', 'attRankGws' ,'gponStatus' ,'attOoklaQ' ,'tmoRatioOokla' ,'vznRatioOokla' ,'popDensity' ,'medIncome' ,'zipHispanic', 'hypergig'],
            requiredDataKeys: ['vpgm'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: [],
            mapResetDataKeys: ['vpgm', 'dmaName', 'zipcode']
        },
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
        },
        map: {
            heatmapAttribute: 'simple_coverage_score',
            popupHtml: locationData => `
                        <b>VPGM:</b> ${locationData.vpgm}
                        <br/><b>Archetype:</b> ${locationData.archetype}
                        <br/><b>DMA Name:</b> ${locationData.dma_nm}
                        <br/><b>MIKEY:</b> ${locationData.mikey}
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.st} ${locationData.zip}
                        <br/><b>Contact Name:</b> ${locationData.contact_first_nm} ${locationData.contact_last_nm}
                        <br/><b>Contact Phone:</b> ${locationData.contact_phone1}
                        <br/><b>Contact email:</b> ${locationData.contact_email}
                        <br/><b>Simple Coverage Score:</b> ${locationData.simple_coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>AWB Available Capacity:</b> ${locationData.awb_capacity_text}
                        <br/><b>AWB Spectrum Efficiency:</b> ${locationData.awb_spectrum_efficiency}
                        <br/><b>GPON Status:</b> ${locationData.gpon_status} - <b>GPON Customers:</b> ${locationData.gpon_customers} - <b>Hyper-Gig:</b> ${locationData.hypergig}
                        <br/><b>ATT Rank GWS:</b> ${locationData.att_rank_gws}
                        <br/><b>TMO Rank GWS:</b> ${locationData.tmo_rank_gws} - <b>VZN Rank GWS:</b> ${locationData.vz_rank_gws}
                        <br/><b>ATT Ookla Quantile:</b> ${locationData.att_ookla_quantile}
                        <br/><b>TMO Ratio Ookla:</b> ${locationData.tmo_ratio_ookla_lte} - <b>VZN Ratio Ookla:</b> ${locationData.verizon_ratio_ookla_lte}
                        <br/><b>Pop Density:</b> ${locationData.pop_density_text} - <b>Median Income:</b> ${locationData.hh_median_income_text}
                    `
        },
    },
    "natLus": {
        tool: 'natLus',
        toolName: 'Engineering USA LUs',
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/natLus`,
        filter: {
            dataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode', 'covScore', 'fiveg', 'fivegplus', 'cband', 'band14', 'fnet', 'suitability', 'ranCause', 'speedExperience', 'weightedAvgTuputGrp', 'availCapacity', 'roamText', 'cqiGrp', 'spectrumEff12Pl', 'cbandScs', 'weightedAvgMcepPrbUtlGrp'],
            requiredDataKeys: [],
            requiredBooleanOperator: "all",
            singularValueDataKeys: [''],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'simple_coverage_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Coverage Score:</b> ${d.simple_coverage_score_id}
                               <br/><b>Five G:</b> ${d.fiveg}
                          
                        `
        },
        sortCriteriaData: [
            { "name": "Simple Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "5G+ mmWave", "value": "FIVEGPLUS_SORT_COLUMN" },
            { "name": "5G+ C-Band", "value": "CBAND_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "FNET", "value": "FNET_TEXT_SORT_COLUMN" },
            { "name": "AWB High Speed Suitability", "value": "SUITABILITY_SORT_COLUMN" },
            { "name": "RAN Suitability Cause", "value": "RANCAUSE_SORT_COLUMN" },
            { "name": "Speed Experience", "value": "SPEEDEXPERIENCE_SORT_COLUMN" },
            { "name": "Weighted Avg Tput", "value": "WEIGHTEDAVGTPUTGRP_SORT_COLUMN" },
            { "name": "Available Capacity", "value": "AVAILCAPACITY_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAMTEXT_SORT_COLUMN" },
            { "name": "CQI", "value": "CQIGRP_SORT_COLUMN" },
            { "name": "Spectrum Efficiency", "value": "SPECTRUMEFF12PL_SORT_COLUMN" },
            { "name": "C-Band Simple Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,VPGM Market,DMA Name,Address,City,State,Zip,Simple Coverage Score,5G,5G Plus mmWave,5G Plus Speed,5G Plus C-Band,C-Band Simple Coverage Score,C-Band Speed,FNET Band 14,FNET,AWB High Speed Suitability,RAN Suitability Cause,Speed Experience,Weighted Avg Tput,Tput Min,Tput Max,Available Capacity,CQI,Spectrum Efficiency,Average MCEP PRB Utilization,Roaming,Roaming Rate,Coverage Radius",
        dataTableDataKeys: "rownum,sales_market,dma_name,address,city,state,zipcode,simple_coverage_score_id,fiveg,fiveg_plus_mmwave,fiveg_plus_speed,fiveg_plus_cband,cband_scs_id,cband_speed,band_14,first_net,sales_high_speed_suitability,ran_suitability_cause,speed_experience,weighted_avg_tput,tput_min,tput_max,avail_capacity,cqi,spectrum_efficiency_12_pl,weighted_avg_mcep_prbutl,roam_text,roaming_rate,coverage_radius",
        dataTableExportOmitKeys: "roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column",
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor',
            categoryLabels: "Simple Coverage Score,5G,5G Plus mmWave,5G Plus C-Band,FNET Band 14,FNET,RAN Suitability Cause,Speed Experience",
            categoryDataKeys: "simple_coverage_score_id,fiveg_id,fiveg_plus_mmwave_id,fiveg_plus_cband_id,band_14_id,first_net_id,ran_suitability_cause_id,speed_experience_id"
        }
    },
}

export default toolConfig;