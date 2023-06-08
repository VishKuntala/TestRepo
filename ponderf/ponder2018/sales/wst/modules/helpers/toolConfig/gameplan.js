const toolConfig = {
    "midmarket": {
        tool: 'midmarket',
        toolName: 'MidMarket',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg}
                               <br/><b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave}
                               <br/><b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>FNET:</b> ${d.first_net}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability}
                               <br/><b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Multi-Gig:</b> ${d.multigig}
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon}
                               <br/><b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>BB Eligible Max Speed:</b> ${d.eligible_max_speed}
                               <br/><b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant}
                               <br/><b>Customers at Location:</b> ${d.customers_at_location}
                               <br/><b>Total Employees Here:</b> ${d.total_employees_here}
                               <br/><b>Total Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><b>Total Opportunities at Location (Large):</b> ${d.opportunity_large}
                               <br/><b>Total Opportunities at Location (Mid):</b> ${d.opportunity_mid}
                               <br/><b>Total Opportunities at Location (Small):</b> ${d.opportunity_small}
                               <br/><b>Total Opportunities at Location (Unknown):</b> ${d.opportunity_unknown}
                               <br/><b>ATT Ookla Quintile:</b> ${d.att_ookla_quintile}
                               <br/><b>TMO Ratio Ookla:</b> ${d.tmo_ratio_ookla}
                               <br/><b>VZN Ratio Ookla:</b> ${d.vzn_ratio_ookla}
                               <br/><b>Pop Density:</b> ${d.pop_density_zip}
                               <br/><b>Median Income:</b> ${d.median_income}
                               <br/><b>Percent Hispanic:</b> ${d.percentHispanic}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,EMT,MULTI CUSTOMER NTE,SINGLE CUSTOMER NTE/CELL/LEGACY,GPON LIT,FIBER THERE (Not Lit),GPON SERVING AREA (Not Lit),NEAR FIBER 1000ft (Not Lit),NONE',
            categoryLabels: "Indoor Coverage Score,5G,5G Plus mmWave,5G Plus C-Band,FNET Band 14,FNET,Fiber Status,Speed Experience",
            categoryDataKeys: "ics_score_id,fiveg_id,fiveg_plus_mmwave_id,fiveg_plus_cband_ics_id,band_14_id,first_net_id,fiber_status_report_rows_id,speed_experience_ics_id"
        }
    },
    "omni": {
        tool: 'omni',
        toolName: 'Omni',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/omni`,
        filter: {
            dataKeys: ['smId', 'salesRepId', 'svIds', 'statecode', 'indoorCovScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen'],
            requiredDataKeys: ['smId', 'salesRepId'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['smId'],
            mapResetDataKeys: ['smId', 'salesRepId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "COVERAGE_SCORE", selected: true },
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
        dataTableDataKeys: "rownum,svid_name,sm_attuid,owning_attuid,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,addr,city,state_y,zipcode",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration",
            categoryDataKeys: "coverage_score,fiveg,band_14,tput_text,roam_text,fiber_cust"
        },
        map: {
            heatmapAttribute: 'coverage_score',
            popupHtml: locationData => `
                        <b>Sales Channel:</b> Omni Locations
                        <br/><b>Company Name:</b> ${locationData.svid_name}                        
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state_y} ${locationData.zipcode}
                        <br/><b>Indoor Coverage Score:</b> ${locationData.coverage_score}
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
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/nbwc`,
        filter: {
            dataKeys: ['statecode', 'campaignIds', 'indoorCovScore', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'zipcode', 'legacyPen'],
            requiredDataKeys: ['statecode'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['statecode'],
            mapResetDataKeys: ['statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "COVERAGE_SCORE", selected: true },
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
        dataTableDataKeys: "rownum,campaign_name,contact_company_nm,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,primary_competitor_name,number_of_employees,city_nm,state_y,postl_cd,campaign_id",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming,Legacy Device Penetration",
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
                        <br/><b>Wireless Indoor Coverage Score:</b> ${locationData.coverage_score}
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
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/globalBusiness`,
        filter: {
            dataKeys: ['industry', 'svIds', 'companyNames', 'noLowAccounts', 'statecode', 'zipcode', 'fiveg', 'band14', 'tputText', 'roamingDependency', 'indoorCovScore'],
            requiredDataKeys: ['industry'],
            requiredBooleanOperator: "any",
            singularValueDataKeys: ['industry'],
            mapResetDataKeys: ['industry', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "Roaming", "value": "ROAM_TEXT_SORT_COLUMN" },
            { "name": "5G+", "value": "FIVEG_PLUS_SORT_COLUMN" },
            { "name": "FirstNet", "value": "FIRST_NET_SORT_COLUMN" },
            { "name": "No Low Account", "value": "NO_LOW_ACCOUNT", "sortDirection": 'ASC' }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Industry,SVID,Business Name,Address,City,State,Zip,Indoor Coverage Score,5G,5G Plus,Speed and Available Capacity,Roaming,FNET,FNET Band 14,Legacy Device Penetration,No Low Account",
        dataTableDataKeys: "rownum,industry,svid,company_name,addr,city,state_y,zipcode,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,no_low_account",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'roam_text'],
        barchart: {
            categoryDataValues: 'Unknown,Heavy roaming,Medium roaming,No roaming,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,Speed/Avail Capacity,Roaming",
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
                        <br/><b>Indoor Coverage Score:</b> ${locationData.coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G +:</b > ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b > ${locationData.first_net} - <b>FNET Band 14:</b > ${locationData.band_14}                        
                        <br/><b>No Low Account:</b> ${locationData.no_low_account}
                    `
        },
    },
    "byoc": {
        tool: 'byoc',
        toolName: 'BYOC',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        startingSortCriteria: 'COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/byoc`,
        filter: {
            dataKeys: ['accessType', 'clusterId', 'statecode', 'indoorCovScore', 'fiveg', 'band14', 'tputText', 'fnet', 'zipcode', 'wbbSuitabilityIcs'],
            requiredDataKeys: ['accessType', 'clusterId'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['accessType'],
            mapResetDataKeys: ['accessType', 'clusterId', 'statecode', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "Speed/Avail Capacity", "value": "TPUT_TEXT_SORT_COLUMN" },
            { "name": "FNET", "value": "FNET_TEXT_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "Suitability", "value": "SUITABILITY_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,Location ID,Company Name,Address,City,State,Zip,Indoor Coverage Score,5G,Speed and Available Capacity,FNET,FNET Band 14,Suitability",
        dataTableDataKeys: "rownum,location_id,company_name,address,city,state,zipcode,coverage_score,fiveg,tput_text,first_net,band_14,wbbSuitabilityIcs",
        charts: ['coverage_score', 'fiveg', 'band_14', 'tput_text', 'first_net', 'fiber_cust'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,Unsuitable,Check with RAN,Suitable',
            categoryLabels: "Indoor Coverage Score,5G,Speed/Avail Capacity,FNET,FNET Band 14,Suitability",
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
                      <br/><b>Indoor Coverage Score:</b> ${locationData.coverage_score}
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
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
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
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bcls`,
        filter: {
            dataKeys: ['vpgm', 'archetype', 'dmaName', 'zipcode', 'mqoId', 'indoorCovScore', 'fiveg', 'band14', 'awbCapText', 'awbSpecEff', 'attRankGws', 'gponStatus', 'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'zipHispanic', 'hypergig'],
            requiredDataKeys: ['vpgm'],
            requiredBooleanOperator: "all",
            singularValueDataKeys: [],
            mapResetDataKeys: ['vpgm', 'dmaName', 'zipcode']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
            { "name": "5G", "value": "FIVEG_SORT_COLUMN" },
            { "name": "FNET Band 14", "value": "BAND_14_SORT_COLUMN" },
            { "name": "AWB Capacity", "value": "AWB_CAP_TEXT_SORT_COLUMN" },
            { "name": "AWB Spectrum Efficiency", "value": "AWB_SPEC_EFF_SORT_COLUMN" },
            { "name": "GPON Status", "value": "GPON_STATUS_SORT_COLUMN" }
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank, VPGM, Archetype, DMA Name, MIKEY, Indoor Coverage Score, 5G, FNET Band 14, AWB Capacity, AWB Spectrum Efficiency, GPON Status, GPON Customers, Hyper-Gig, ATT GWS Rank, TMO GWS Rank, VZ GWS Rank, ATT Ookla Quantile, TMO Ratio Ookla, VZ Ratio Ookla, Pop Density, Median Income, Address, City, State, Zip, Contact First Name, Contact Last Name, Contact Phone, Lat, Long, ",
        dataTableDataKeys: "rownum,vpgm,archetype,dma_nm,mikey,simple_coverage_score,fiveg,band_14,awb_capacity_text,awb_spectrum_efficiency,gpon_status,gpon_customers,hypergig,att_rank_gws,tmo_rank_gws,vz_rank_gws,att_ookla_quantile,tmo_ratio_ookla_lte,verizon_ratio_ookla_lte,pop_density_text,hh_median_income_text,addr,city,st,zip,contact_first_nm,contact_last_nm,contact_phone1,latitude,longitude",
        charts: ['simple_coverage_score', 'fiveg', 'band_14', 'awb_capacity_text', 'awb_spectrum_efficiency', 'gpon_status'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Very Low Avail Capacity,Low Avail Capacity,Medium Avail Capacity,High Avail Capacity,Very High Avail Capacity,Very Low User Limit,Low User Limit,Medium User Limit,High User Limit,Highest User Limit,NO_GPON,GPON_AVAILABLE,GPON_CUSTOMER',
            categoryLabels: "Indoor Coverage Score,5G,FNET Band 14,AWB Capacity,AWB Spectrum Efficiency,GPON Status",
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
                        <br/><b>Indoor Coverage Score:</b> ${locationData.simple_coverage_score}
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
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/natLus`,
        filter: {
            dataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'fivegplus', 'cband', 'band14', 'fnet', 'wbbSuitabilityIcs', 'ranCause', 'speedExperienceIcs', 'weightedAvgTuputGrp', 'availCapacity', 'roamText', 'cqiGrp', 'spectrumEff12Pl', 'cbandScs', 'weightedAvgMcepPrbUtlGrp'],
            requiredDataKeys: [],
            requiredBooleanOperator: "all",
            singularValueDataKeys: [''],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.ics_score_id}
                               <br/><b>Five G:</b> ${d.fiveg}
                          
                        `
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        dataTableHeaders: "Rank,VPGM Market,DMA Name,Address,City,State,Zip,Indoor Coverage Score,5G,5G Plus mmWave,5G Plus Speed,5G Plus C-Band,C-Band Indoor Coverage Score,C-Band Speed,FNET Band 14,FNET,AWB High Speed Suitability,RAN Suitability Cause,Speed Experience,Weighted Avg Tput,Tput Min,Tput Max,Available Capacity,CQI,Spectrum Efficiency,Average MCEP PRB Utilization,Roaming,Roaming Rate,Coverage Radius",
        dataTableDataKeys: "rownum,sales_market,dma_name,address,city,state,zipcode,ics_score_id,fiveg,fiveg_plus_mmwave,fiveg_plus_speed,fiveg_plus_cband,cband_scs_id,cband_speed,band_14,first_net,sales_high_speed_suitability,ran_suitability_cause,speed_experience,weighted_avg_tput,tput_min,tput_max,avail_capacity,cqi,spectrum_efficiency_12_pl,weighted_avg_mcep_prbutl,roam_text,roaming_rate,coverage_radius",
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor',
            categoryLabels: "Indoor Coverage Score,5G,5G Plus mmWave,5G Plus C-Band,FNET Band 14,FNET,RAN Suitability Cause,Speed Experience",
            categoryDataKeys: "ics_score_id,fiveg_id,fiveg_plus_mmwave_id,fiveg_plus_cband_ics_id,band_14_id,first_net_id,ran_suitability_cause_id,speed_experience_ics_id"
        }
    },
    "bclsv2": {
        tool: 'bclsv2',
        toolName: 'BCLS',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype} - <b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}, ${d.city}, ${d.state} ${d.zipcode}                               
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg} - <b>FNET:</b> ${d.first_net} - <b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave} - <b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability} - <b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Fiber Status:</b> ${d.fiber_status} - <b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon}
                               <br/><b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>BB Eligible Max Speed:</b> ${d.eligible_max_speed} - <b>Multi-Gig:</b> ${d.multigig}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Total Employees Here:</b> ${d.total_employees_here}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location} - <b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><b>Total Wireline Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><b>ATT Ookla Quintile:</b> ${d.att_ookla_quintile} - <b>TMO Ratio Ookla:</b> ${d.tmo_ratio_ookla} - <b>VZN Ratio Ookla:</b> ${d.vzn_ratio_ookla}
                               <br/><b>Pop Density:</b> ${d.pop_density_zip} - <b>Median Income:</b> ${d.median_income} - <b>Percent Hispanic:</b> ${d.percentHispanic}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT',
            categoryLabels: "Indoor Coverage Score,5G,5G Plus mmWave,5G Plus C-Band,FNET Band 14,FNET,Fiber Status,Speed Experience",
            categoryDataKeys: "ics_score_id,fiveg_id,fiveg_plus_mmwave_id,fiveg_plus_cband_ics_id,band_14_id,first_net_id,fiber_status_report_rows_id,speed_experience_ics_id"
        }
    },
    "neonGigapower": {
        tool: 'neonGigapower',
        toolName: 'Blueprint - Gigapower',
        showPsaLayer: true,
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'customerCategory',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/neonGigapower`,
        addlInfoLabel: `Total Fiber Opportunities (as filtered)`,
        tabs: [{label:'PSAs', icon:'', clearLabel: 'Clear PSA'}, {label:'Addresses', icon:''}],
        heatMaps:  [
   
            {
                name: "Average Indoor Coverage Score",
                value: "aveCoverageScore",
                selected: true
            },
            {
                name: "Fiber Penetration",
                value: "fiberPenetration"
            },
            {
                name: "Wireless Penetration",
                value: "wirelessPenetration"
            }
        ],
        locationAttributes: [

            {
                name: "Customer Category",
                value: "customerCategory",
                selected: true,
            },
            {
                name: "Indoor Coverage Score",
                value: "indoorCoverageScore",
            }
        ],
        filter: {
            dataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'psa', 
            'multiGig', 'fiberStatus', 'csiEligibility'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            layerNameOverrides : {
                'ws-point-layer-id' : 'Addresses'
            },
            pointSizeDenominatorValue: 144,
            pointMinShapeSize: 0.1,
            pointMaxShapSize: 0.9,
            heatmapAttribute: 'indoor_coverage_score',
            censusBlockPopupContent: 'Show addresses in this census block',
            popupHtml: d => d.dataType === 'psa' ? `<b>Sales Market:</b> ${d.sales_market}
                                <br/><b>DMA:</b> ${d.dma_name}
                                <br/><b>PSA:</b> ${d.zip_co_psa}
                                <br/><b>State:</b> ${d.state}
                                <br/><b>Zip:</b> ${d.zip}
                                <br/><b>Fiber Available:</b> ${d.fiber_available}
                                <br/><b>Fiber Customers:</b> ${d.fiber_customers}
                                <br/><b>Fiber Pen Rate:</b> ${d.fiber_percentage}
                                <br/><b>Wireless Customers:</b> ${d.wireless_customers}
                                <br/><b>Wireless Pen Rate:</b> ${d.wireless_percentage}
                                <br/><b>Fiber Opportunities:</b> ${d.fiber_opportunity}
                                <br/><b>Fiber and Wireless Customer:</b> ${d.fiber_customer_wireless_customer}
                                <br/><b>Fiber Customers Wireless Cross-Sell:</b> ${d.fiber_customer_no_wireless}
                                <br/><b>Wireless Customers Fiber Cross-Sell:</b> ${d.wireless_customer_no_fiber}
                                <br/><b>Fiber and Wireless Opportunities:</b> ${d.no_fiber_no_wireless}
                                <br/><a href="#" id="${d.zip_co_psa}" class="tenantExportLink">Show Addresses for this PSA</a>` : `
                               <b>PSA:</b> ${d.zip_co_psa}
                               <br/><b>Address:</b> ${d.house_nbr || ''} ${d.prefix || ''} ${d.street_name || ''} ${d.unit_number || ''} ${d.building_number || ''} ${d.city || ''}, ${d.state || ''} ${d.zip || ''}
                               <br/><b>Customer Category:</b> ${d.customer_category}
                               <br/><b>Indoor Coverage Score:</b> ${d.indoor_coverage_score}
                               <br/><b>Multi-Gig:</b> ${d.hypergig}
                               <br/><b>CSI Eligible:</b> ${d.csi_eligible}
                               <br/><b>Adj. Dwelling Type:</b> ${d.adjusted_dwelling_type}
                               <br/><b>PSA Fiber Pen Rate:</b> ${d.psa_fiber_pen_rate}
                               <br/><b>PSA Wireless Pen Rate:</b> ${d.psa_wireless_pen_rate}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><b>MDU Unit Count:</b> ${d.unit_count}` :``}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><b>MDU Fiber Customer Count:</b> ${d.fiber_customer_count}` :``}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><b>MDU Wireless Customer Count:</b> ${d.wireless_customer_count}` :``}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><b>MDU Multi-Gig Count:</b> ${d.mdu_hypergig_count}` :``}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><b>MDU Fiber Opportunities:</b> ${d.fiber_opportunity}` :``}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><b>MDU Wireless Opportunities:</b> ${d.wireless_opportunity}` :``}
                               ${d.adjusted_dwelling_type === 'M' ? `<br/><a href="#" mduid="${d.mdu_id}" id="${d.mdu_id}" class="mduTenantsExportLink">Show Addresses for this MDU</a>` :``}
                            `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/neonGigapower/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['addr_customer_category_id','indoor_coverage_score', 'csi_eligible', 'hypergig'],
        barchart: {
            categoryDataValues: 'Fiber Customer,Fiber Opportunity,Fiber Customer and Wireless Customer,Fiber Customer and Wireless Cross-Sell Opportunity,Wireless Customer and Fiber Cross-Sell Opportunity,Opportunity for Fiber and Wireless,MDU All AT&T Fiber Customers,MDU with AT&T Fiber Prospects,Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,Currently EMT,T-60,T-30,Currently GPON Lit,Currently Not Lit',
            categoryLabels: "Customer Category,Indoor Coverage Score,CSI Eligible,Multi-Gig",
            categoryDataKeys: "addr_customer_category_id,indoor_coverage_score,csi_eligible,hypergig"
        }
    },    
    "midmarketFiber": {
        tool: 'midmarketFiber',
        toolName: 'Midmarket Fiber',
        defaultHeatmap: 'none',
        defaultLocationAttribute: 'fiberStatus',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'fiberPid'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score} - <b>5G:</b> ${d.fiveg}                                                           
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Future Fiber Status:</b> ${d.future_fiber_status}
                               <br/><b>Multi-Gig:</b> ${d.multigig} - <b>BB Eligible Max Speed:</b> ${d.eligible_max_speed}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><b>Total Wireline Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><b>Fiber PID:</b> ${d.fiber_pid}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,Currently EMT,T-60,T-30,Currently GPON Lit,Currently Not Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status,Future Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id,future_fiber_status_id"
        }
    },
    "ch2Fiber": {
        tool: 'ch2Fiber',
        toolName: 'Small Business Fiber - HQ View',
        defaultHeatmap: 'none',
        showAdditionalInfo: true,
        defaultLocationAttribute: 'fiberStatus',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'locationId'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode', 'locationId']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score} - <b>5G:</b> ${d.fiveg}                                                           
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Future Fiber Status:</b> ${d.future_fiber_status}
                               <br/><b>Multi-Gig:</b> ${d.multigig} - <b>BB Eligible Max Speed:</b> ${d.eligible_max_speed}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><b>Total Wireline Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><b>Store ID:</b> ${d.location_id} <b>Store Name:</b> ${d.location_name}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,Currently EMT,T-60,T-30,Currently GPON Lit,Currently Not Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status,Future Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id,future_fiber_status_id"
        }
    },
    "ch2FiberQv": {
        tool: 'ch2FiberQv',
        toolName: 'Small Business Fiber - Quick View',
        defaultHeatmap: 'none',
        showAdditionalInfo: true,
        defaultLocationAttribute: 'fiberStatus',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'locationId'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode', 'locationId'],
            dataFilter: {
                fiberStatus: d => d.filter(n => ['EMT', 'GPON LIT'].includes(n.name)),
                locCustProsp: d => d.filter(n => ['Prospect', 'Customer-Other'].includes(n.name)),
                owningSegName: d => d.filter(n => n.name.includes('ABS') || n.name.includes('SMALL BUSINESS'))
            }
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score} - <b>5G:</b> ${d.fiveg}                                                           
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Future Fiber Status:</b> ${d.future_fiber_status}
                               <br/><b>Multi-Gig:</b> ${d.multigig} - <b>BB Eligible Max Speed:</b> ${d.eligible_max_speed}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><b>Total Wireline Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><b>Store ID:</b> ${d.location_id} <b>Store Name:</b> ${d.location_name}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,Currently EMT,T-60,T-30,Currently GPON Lit,Currently Not Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status,Future Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id,future_fiber_status_id"
        }
    },
    "ch3Wireless": {
        tool: 'ch3Wireless',
        toolName: 'Small Business Wireless',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}                              
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg} - <b>FNET:</b> ${d.first_net} - <b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave} - <b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability} - <b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,GPON Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id"
        }
    },

    "ch4Fiber": {
        tool: 'ch4Fiber',
        toolName: 'Channel4 Fiber',
        defaultHeatmap: 'none',
        defaultLocationAttribute: 'fiberStatus',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score} - <b>5G:</b> ${d.fiveg}                                                           
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Future Fiber Status:</b> ${d.future_fiber_status}
                               <br/><b>Multi-Gig:</b> ${d.multigig} - <b>BB Eligible Max Speed:</b> ${d.eligible_max_speed}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><b>Total Wireline Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,Currently EMT,T-60,T-30,Currently GPON Lit,Currently Not Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status,Future Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id,future_fiber_status_id"
        }
    },

    "ch5Wireless": {
        tool: 'ch5Wireless',
        toolName: 'Midmarket Wireless',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'totalEmployeesHere', 
                'businessEmployees', 'sicCdGrp', 'noSpend'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}                              
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg} - <b>FNET:</b> ${d.first_net} - <b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave} - <b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability} - <b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Building Occupancy Count:</b> ${d.total_employees_here}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `                   
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,GPON Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id"
        }
    },
    "ch6Wireless": {
        tool: 'ch6Wireless',
        toolName: 'Channel6 Wireless',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}                              
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg} - <b>FNET:</b> ${d.first_net} - <b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave} - <b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability} - <b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,GPON Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id"
        }
    },
    "ch7Sled": {
        tool: 'ch7Sled',
        toolName: 'Public SLED',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'svid'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}                              
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg} - <b>FNET:</b> ${d.first_net} - <b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave} - <b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability} - <b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Fiber Status:</b> ${d.fiber_status} - <b>Newly Lit Building:</b> ${d.newly_lit_gpon}
                               <br/><b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,GPON Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id"
        }
    },
    "ch8Demo": {
        tool: 'ch8Demo',
        toolName: 'Demo Cross-Sell Channel',
        defaultHeatmap: 'aveCoverageScore',
        defaultLocationAttribute: 'wirelessScore',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        showNsbLayer: true,
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'totalEmployeesHere'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode']
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}                              
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score}
                               <br/><b>5G:</b> ${d.fiveg} - <b>FNET:</b> ${d.first_net} - <b>Band 14:</b> ${d.band_14}
                               <br/><b>5G Plus - mmWave:</b> ${d.fiveg_plus_mmwave} - <b>5G Plus - C-Band:</b> ${d.fiveg_plus_cband}
                               <br/><b>Sales High Speed Suitability:</b> ${d.sales_high_speed_suitability} - <b>Speed Experience:</b> ${d.speed_experience}
                               <br/><b>Available Capacity:</b> ${d.avail_capacity}
                               <br/><b>Fiber Status:</b> ${d.fiber_status} - <b>Newly Lit Building:</b> ${d.newly_lit_gpon}
                               <br/><b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Total Employees Here:</b> ${d.total_employees_here}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `,
            nsbLayerPopupHtml: d => `
                    <b>USID:</b> ${d.usid}
                    <br/><b>Address:</b> ${d.address}
                    <br/><b>On Air (Actual):</b> ${d.onair_actual}
                    <br/><a href="#" id="${d.id}" class="nsbTenantExportLink">Show businesses in this NSB</a>
                    `                     
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,GPON Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id"
        }
    },
    "ch9FiberStores": {
        tool: 'ch9FiberStores',
        toolName: 'Small Business Fiber - Store View',
        defaultHeatmap: 'none',
        showAdditionalInfo: true,
        attrPointLayerVisible: true,
        defaultLocationAttribute: 'fiberStatus',
        loadDataOnChannelInit: false,
        startingSortCriteria: 'SIMPLE_COVERAGE_SCORE',
        baseUrl: `${$("#hdnBaseApiUrl").val()}/bclsv2`,
        filter: {
            dataKeys: ['salesMarket', 'archetype', 'dmaName', 'statecode', 'zipcode', 'indoorCovScore', 'fiveg', 'band14', 'fivegplusMmwave',
                'fivegplusCbandIcs', 'fnet', 'wbbSuitabilityIcs', 'speedExperienceIcs',
                'availCapacity', 'multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
                'customersAtLocation', 'totalOppsAtLocation', 'totalLargeOppsAtLocation',
                'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'owningModule', 'futureFiberStatus', 'locCustProsp',
                'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
                'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps', 'newlyLit', 'psa', 'firstLit', 'locationId'
            ],
            requiredDataKeys: ['salesMarket'],
            zoomToAreaDataKey: 'salesMarket',
            requiredBooleanOperator: "all",
            singularValueDataKeys: ['salesMarket', 'owningModule'],
            mapResetDataKeys: ['salesMarket', 'dmaName', 'statecode', 'zipcode', 'locationId'],
            dataFilter: {
                fiberStatus: d => d.filter(n => ['EMT', 'GPON LIT'].includes(n.name)),
                locCustProsp: d => d.filter(n => ['Prospect', 'Customer-Other'].includes(n.name)),
                owningSegName: d => d.filter(n => n.name.includes('ABS') || n.name.includes('SMALL BUSINESS'))
            }
        },
        map: {
            heatmapAttribute: 'ics_score_id',
            popupHtml: d => `
                               <b>Sales Market:</b> ${d.sales_market}
                               <br/><b>Archetype:</b> ${d.archetype}
                               <br/><b>DMA:</b> ${d.dma_name}
                               <br/><b>MIKEY:</b> ${d.mikey}
                               <br/><b>Address:</b> ${d.address}
                               <br/><b>City:</b> ${d.city}, ${d.state} ${d.zipcode}
                               <br/><b>Indoor Coverage Score:</b> ${d.simple_coverage_score} - <b>5G:</b> ${d.fiveg}                                                           
                               <br/><b>Fiber Status:</b> ${d.fiber_status}
                               <br/><b>Newly Lit Building:</b> ${d.newly_lit_gpon} - <b>Building First Lit Date:</b> ${d.any_fiber_lit_yearmo}
                               <br/><b>Future Fiber Status:</b> ${d.future_fiber_status}
                               <br/><b>Multi-Gig:</b> ${d.multigig} - <b>BB Eligible Max Speed:</b> ${d.eligible_max_speed}
                               <br/><b>Multi Tenant:</b> ${d.multi_tenant} - <b>Fiber Competitor - Any:</b> ${d.fiber_competitor_any}
                               <br/><b>Wireline Customers at Location:</b> ${d.total_customers_at_location}
                               <br/><b>Non-Wireline Customers at Location:</b> ${d.non_fiber_customers_at_location}
                               <br/><b>Total Wireline Opportunities at Location:</b> ${d.total_opportunities_at_location}
                               <br/><b>Store ID:</b> ${d.location_id} <b>Store Name:</b> ${d.location_name}
                               <br/><a href="#" id="${d.mikey}" class="tenantExportLink">Show businesses at this building</a>
                    `
        },
        searchSelector: {
            values: [
                {
                    name: "Business Name",
                    value: "businessSearch",
                    defaultText: "Type an business name...",
                    remoteUrl: `${$("#hdnBaseApiUrl").val()}/midmarketFiber/search/businesses?searchId={query}`,
                },
            ],
            dataKeys: ['searchedBusiness']
        },
        sortCriteriaData: [
            { "name": "Indoor Coverage Score", "value": "SIMPLE_COVERAGE_SCORE", selected: true },
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
            { "name": "C-Band Indoor Coverage Score", "value": "CBANDSCS_SORT_COLUMN" },
            { "name": "Average MCEP PRB Utilization", "value": "AVGMCEPPRBUTLGRP_SORT_COLUMN" },
        ],
        tableRecordsLimit: 5000,
        charts: ['simple_coverage_score', 'fiveg', 'fiveg_plus_mmwave', 'fiveg_plus_cband', 'band_14', 'first_net', 'sales_high_speed_suitability', 'speed_experience'],
        barchart: {
            categoryDataValues: 'Unknown,No,Partial,Yes,Very Weak,Uneven,Strong,Very Strong,Best,High,Medium,Low,Low Speed/Very Low Avail Capacity,Medium Speed/Low Avail Capacity,Medium Speed/Medium Avail Capacity,Medium Speed/High Avail Capacity,High Speed/Very High Avail Capacity,No AWB - Check with RAN,Low Speed Failover Only,Low TPUT Failover Only,Insufficient Coverage,Insufficient Capacity,Insuff Cap MCEP Only,Feasible,Feasible Low TPUT,Feasible Low Spect Eff,Feasible Med Spect Eff,Good,Very Good,Excellent,Low Speed,Medium Speed,High Speed,Hotspot,Outdoor Only,Indoor,NONE,NEAR FIBER 1000ft (Not Lit),GPON SERVING AREA (Not Lit),FIBER THERE (Not Lit),SINGLE CUSTOMER NTE/CELL/LEGACY,MULTI CUSTOMER NTE,EMT,GPON LIT,Other,Not Lit,Currently EMT,T-60,T-30,Currently GPON Lit,Currently Not Lit',
            categoryLabels: "Indoor Coverage Score,5G,Fiber Status,Future Fiber Status",
            categoryDataKeys: "ics_score_id,fiveg_id,fiber_status_report_rows_id,future_fiber_status_id"
        }
    },

}

export default toolConfig;