// import centroid from "@turf/centroid";



export const config = {
    tables: {
        midmarket: {
            name: "midmarket",
            type: "midmarket",
            dataKeys: ["sales_market", "archetype", "total_opportunities_at_location", "simple_coverage_score", "address", "city", "state", "zipcode", "fiber_status", "dma_name", "mikey", "fiveg", "band_14",
                "fiveg_plus_mmwave", "fiveg_plus_cband", "first_net", "sales_high_speed_suitability",
                "speed_experience", "avail_capacity", "multigig", "eligible_max_speed", "fiber_competitor_any",
                "multi_tenant", "customers_at_location", "total_employees_here",
                "opportunity_large", "opportunity_mid", "opportunity_small", "opportunity_unknown",
                "att_ookla_quintile", "tmo_ratio_ookla", "vzn_ratio_ookla", "pop_density_zip", "median_income", "percentHispanic",
                "latitude", "longitude"],
            headers: ["Sales Market", "Archetype", "Total Opportunities at Location", "Indoor Coverage Score", "Address", "City", "State", "Zip", "Fiber Status", "DMA", "MIKEY", "5G", "Band 14",
                "5G Plus - mmWave", "5G Plus - C-Band",
                "FNET", "Sales High Speed Suitability", "Speed Experience",
                "Available Capacity", "Multi-Gig", "BB Eligible Max Speed", "Fiber Competitor - Any",
                "Multi Tenant", "Customers at Location", "Total Employees Here",
                "Total Opportunities at Location (Large)", "Total Opportunities at Location (Mid)",
                "Total Opportunities at Location (Small)", "Total Opportunities at Location (Unknown)", "ATT Ookla Quintile",
                "TMO Ratio Ookla", "VZN Ratio Ookla", "Pop Density", "Median Income", "Percent Hispanic",
                "Latitude", "Longitude"],
            frozenDataKeys: [],
            hiddenColumns: [],
            dataTableExportOmitKeys: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "mkt.vpgm_markt", type: "!=", value: "" },
                [
                    { field: "mkt.vpgm_markt", type: "like", value: val },
                    { field: "dc.dma_name", type: "like", value: val },
                    { field: "arch.name", type: "like", value: val },
                    { field: "address", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "st.state_abbr", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {

                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        omni: {
            name: "omni",
            type: "omni",
            dataKeys: ["rownum","svid_name","sm_attuid","owning_attuid","coverage_score","fiveg","fiveg_plus","tput_text","roam_text","first_net","band_14","fiber_cust","addr","city","state_y","zipcode"],
            headers: ["Rank","Business Name","Sales Manager","Seller","Indoor Coverage Score","5G","5G Plus","Speed and Available Capacity","Roaming","FNET","FNET Band 14","Legacy Device Penetration","Address","City","State","Zip"],
            frozenDataKeys: ['rownum', 'svid_name'],
            dataTableExportOmitKeys: ["roam_text_sort_column", "tput_text_sort_column", "fiber_cust_sort_column", "band_14_sort_column", "fiveg_sort_column", "fiveg_plus_sort_column", "first_net_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "svid_name", type: "!=", value: "" },
                [
                    { field: "svid_name", type: "like", value: val },
                    { field: "sm_attuid", type: "like", value: val },
                    { field: "owning_attuid", type: "like", value: val },
                    { field: "coverage_score", type: "like", value: val },
                    { field: "fiveg", type: "like", value: val },
                    { field: "fiveg_plus", type: "like", value: val },
                    { field: "tput_text", type: "like", value: val },
                    { field: "roam_text", type: "like", value: val },
                    { field: "first_net", type: "like", value: val },
                    { field: "band_14", type: "like", value: val },
                    { field: "fiber_cust", type: "like", value: val },
                    { field: "fiber_status", type: "like", value: val },
                    { field: "addr", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "state_y", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        globalBusiness: {
            name: "globalBusiness",
            type: "globalBusiness",
            dataKeys: ["rownum", "industry", "svid", "company_name", "addr", "city", "state_y", "zipcode", "coverage_score", "fiveg", "fiveg_plus", "tput_text", "roam_text", "first_net", "band_14", "fiber_cust", "no_low_account"],
            headers: ["Rank", "Industry", "SVID", "Business Name", "Address", "City", "State", "Zip", "Indoor Coverage Score", "5G", "5G Plus", "Speed and Available Capacity", "Roaming", "FNET", "FNET Band 14", "Legacy Device Penetration", "No Low Account"],
            frozenDataKeys: ['rownum', 'industry', 'svid'],
            dataTableExportOmitKeys: ["roam_text_sort_column","tput_text_sort_column","fiber_cust_sort_column","band_14_sort_column","fiveg_sort_column","fiveg_plus_sort_column","first_net_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "industry", type: "!=", value: "" },
                [
                    { field: "industry", type: "like", value: val },
                    { field: "svid", type: "like", value: val },
                    { field: "company_name", type: "like", value: val },
                    { field: "addr", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "state_y", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val },
                    { field: "coverage_score", type: "like", value: val },
                    { field: "fiveg", type: "like", value: val },
                    { field: "fiveg_plus", type: "like", value: val },
                    { field: "tput_text", type: "like", value: val },
                    { field: "roam_text", type: "like", value: val },
                    { field: "first_net", type: "like", value: val },
                    { field: "band_14", type: "like", value: val },
                    { field: "fiber_cust", type: "like", value: val },
                    { field: "no_low_account", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        byoc: {
            name: "byoc",
            type: "byoc",
            dataKeys: ["rownum", "location_id", "company_name", "address", "city", "state", "zipcode", "coverage_score", "fiveg", "tput_text", "first_net", "band_14", "wbbSuitabilityIcs"],
            headers: ["Rank", "Location ID", "Company Name", "Address", "City", "State", "Zip", "Indoor Coverage Score", "5G", "Speed and Available Capacity", "FNET", "FNET Band 14", "Suitability"],
            frozenDataKeys: ['rownum', 'location_id', 'company_name'],
            dataTableExportOmitKeys: ["roam_text_sort_column","tput_text_sort_column","fiber_cust_sort_column","band_14_sort_column","fiveg_sort_column","fiveg_plus_sort_column","first_net_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "location_id", type: "!=", value: "" },
                [
                    { field: "location_id", type: "like", value: val },
                    { field: "company_name", type: "like", value: val },
                    { field: "address", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "state", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val },
                    { field: "coverage_score", type: "like", value: val },
                    { field: "fiveg", type: "like", value: val },
                    { field: "tput_text", type: "like", value: val },
                    { field: "first_net", type: "like", value: val },
                    { field: "band_14", type: "like", value: val },
                    { field: "wbbSuitabilityIcs", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        natLus: {
            name: "natLus",
            type: "natLus",
            dataKeys: ["rownum", "sales_market", "dma_name", "address", "city", "state", "zipcode", "ics_score_id", "fiveg", "fiveg_plus_mmwave",
                "fiveg_plus_speed", "fiveg_plus_cband", "cband_scs_id", "cband_speed","band_14", "first_net", "sales_high_speed_suitability",
                "ran_suitability_cause", "speed_experience", "weighted_avg_tput", "tput_min", "tput_max", "avail_capacity",
                "cqi", "spectrum_efficiency_12_pl", "weighted_avg_mcep_prbutl", "roam_text", "roaming_rate", "coverage_radius", "latitude",
                "longitude"],
            headers: ["Rank", "VPGM Market", "DMA Name", "Address", "City", "State", "Zip", "Indoor Coverage Score", "5G",
                "5G Plus mmWave", "5G Plus Speed", "5G Plus C-Band", "C-Band Indoor Coverage Score", "C-Band Speed",
                "FNET Band 14", "FNET", "AWB High Speed Suitability", "RAN Suitability Cause", "Speed Experience",
                "Weighted Avg Tput", "Tput Min", "Tput Max","Available Capacity", "CQI", "Spectrum Efficiency",
                "Average MCEP PRB Utilization", "Roaming", "Roaming Rate", "Coverage Radius", "Latitude", "Longitude"],
            frozenDataKeys: ['rownum', 'sales_market'],
            dataTableExportOmitKeys: ["roam_text_sort_column","tput_text_sort_column","fiber_cust_sort_column","band_14_sort_column","fiveg_sort_column","fiveg_plus_sort_column","first_net_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "sales_market", type: "!=", value: "" },
                [
                    { field: "sales_market", type: "like", value: val },
                    { field: "dma_name", type: "like", value: val },
                    { field: "address", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "state", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {

                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        nbwc: {
            name: "nbwc",
            type: "nbwc",
            dataKeys: ["rownum", "campaign_name", "contact_company_nm", "coverage_score", "fiveg", "fiveg_plus", "tput_text", "roam_text",
                "first_net", "band_14", "fiber_cust", "primary_competitor_name", "number_of_employees", "city_nm", "state_y", "postl_cd", "campaign_id"],
            headers: ["Rank", "Campaign Name", "Company Name", "Indoor Coverage Score", "5G", "5G Plus", "Speed and Available Capacity", "Roaming", "FNET", "FNET Band 14", "Legacy Device Penetration", "Primary Competitor", "Employee Count", "City", "State", "Zip", "Campaign ID"],
            frozenDataKeys: ['rownum', 'campaign_name'],
            dataTableExportOmitKeys: ["contact_email","roam_text_sort_column","tput_text_sort_column","fiber_cust_sort_column","band_14_sort_column","fiveg_sort_column","fiveg_plus_sort_column","first_net_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "campaign_name", type: "!=", value: "" },
                [
                    { field: "campaign_name", type: "like", value: val },
                    { field: "contact_company_nm", type: "like", value: val },
                    { field: "coverage_score", type: "like", value: val },
                    { field: "fiveg", type: "like", value: val },
                    { field: "fiveg_plus", type: "like", value: val },
                    { field: "tput_text", type: "like", value: val },
                    { field: "roam_text", type: "like", value: val },
                    { field: "first_net", type: "like", value: val },
                    { field: "band_14", type: "like", value: val },
                    { field: "fiber_cust", type: "like", value: val },
                    { field: "primary_competitor_name", type: "like", value: val },
                    { field: "number_of_employees", type: "like", value: val },
                    { field: "city_nm", type: "like", value: val },
                    { field: "state_y", type: "like", value: val },
                    { field: "postl_cd", type: "like", value: val },
                    { field: "campaign_id", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {

                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        nationalLUs: {
            name: "nationalLUs",
            type: "nationalLUs",
            dataKeys: ["rownum","external_living_unit_id","address","city","state_cd","zipcode","address_line_2","network_build_type_cd"],
            headers: ["Rank", "External Living Unit ID", "Address", "City", "State", "Zip", "Unit", "Network Build Type"],
            frozenDataKeys: ['rownum', 'external_living_unit_id'],
            dataTableExportOmitKeys: ["roam_text_sort_column", "tput_text_sort_column", "fiber_cust_sort_column", "band_14_sort_column", "fiveg_sort_column", "fiveg_plus_sort_column", "first_net_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "external_living_unit_id", type: "!=", value: "" },
                [
                    { field: "external_living_unit_id", type: "like", value: val },
                    { field: "address", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "state_cd", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val },
                    { field: "address_line_2", type: "like", value: val },
                    { field: "network_build_type_cd", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {

                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        bcls: {
            name: "bcls",
            type: "bcls",
            dataKeys: ["rownum", "vpgm", "archetype", "dma_nm", "mikey", "simple_coverage_score", "fiveg", "band_14",
                "awb_capacity_text", "awb_spectrum_efficiency", "gpon_status", "gpon_customers", "hypergig", "att_rank_gws",
                "tmo_rank_gws", "vz_rank_gws", "att_ookla_quantile", "tmo_ratio_ookla_lte", "verizon_ratio_ookla_lte", "pop_density_text",
                "hh_median_income_text", "addr", "city", "st", "zip", "contact_first_nm", "contact_last_nm", "contact_phone1",
                "latitude", "longitude"],
            headers: ["Rank", "VPGM", "Archetype", "DMA Name", "MIKEY", "Indoor Coverage Score", "5G",
                "FNET Band 14", "AWB Capacity", "AWB Spectrum Efficiency", "GPON Status", "GPON Customers", "Hyper-Gig",
                "ATT GWS Rank", "TMO GWS Rank", "VZ GWS Rank", "ATT Ookla Quantile", "TMO Ratio Ookla", "VZ Ratio Ookla",
                "Pop Density", "Median Income", "Address", "City", "State", "Zip", "Contact First Name", "Contact Last Name",
                "Contact Phone", "Lat", "Long"],
            frozenDataKeys: ['rownum', 'vpgm'],
            dataTableExportOmitKeys: ["fiveg_sort_column","band_14_sort_column","awb_cap_text_sort_column","awb_spec_eff_sort_column","gpon_status_sort_column","hypergig_sort_column"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "vpgm", type: "!=", value: "" },
                [
                    { field: "vpgm", type: "like", value: val },
                    { field: "archetype", type: "like", value: val },
                    { field: "dma_nm", type: "like", value: val },
                    { field: "mikey", type: "like", value: val },
                    { field: "simple_coverage_score", type: "like", value: val },
                    { field: "fiveg", type: "like", value: val },
                    { field: "band_14", type: "like", value: val },
                    { field: "awb_capacity_text", type: "like", value: val },
                    { field: "awb_spectrum_efficiency", type: "like", value: val },
                    { field: "gpon_status", type: "like", value: val },
                    { field: "gpon_customers", type: "like", value: val },
                    { field: "hypergig", type: "like", value: val },
                    { field: "att_rank_gws", type: "like", value: val },
                    { field: "tmo_rank_gws", type: "like", value: val },
                    { field: "vz_rank_gws", type: "like", value: val },
                    { field: "att_ookla_quantile", type: "like", value: val },
                    { field: "tmo_ratio_ookla_lte", type: "like", value: val },
                    { field: "verizon_ratio_ookla_lte", type: "like", value: val },
                    { field: "pop_density_text", type: "like", value: val },
                    { field: "hh_median_income_text", type: "like", value: val },
                    { field: "addr", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "st", type: "like", value: val },
                    { field: "zip", type: "like", value: val },
                    { field: "contact_first_nm", type: "like", value: val },
                    { field: "contact_last_nm", type: "like", value: val },
                    { field: "contact_phone1", type: "like", value: val },
                    { field: "latitude", type: "like", value: val },
                    { field: "longitude", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {

                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        bclsv2: {
            name: "bclsv2",
            type: "bclsv2",
            dataKeys: ["sales_market", "archetype", "total_opportunities_at_location", "simple_coverage_score", "address", "city", "state", "zipcode", "fiber_status", "dma_name", "mikey", "fiveg", "band_14",
                "fiveg_plus_mmwave", "fiveg_plus_cband", "first_net", "sales_high_speed_suitability",
                "speed_experience", "avail_capacity", "multigig", "eligible_max_speed", "fiber_competitor_any",
                "multi_tenant", "total_employees_here", "total_customers_at_location", "non_fiber_customers_at_location",
                "att_ookla_quintile", "tmo_ratio_ookla", "vzn_ratio_ookla", "pop_density_zip", "median_income", "percentHispanic",
                "latitude", "longitude"],
            headers: ["Sales Market", "Archetype", "Total Wireline Opportunities at Location", "Indoor Coverage Score", "Address", "City", "State", "Zip", "Fiber Status", "DMA", "MIKEY", "5G", "Band 14",
                "5G Plus - mmWave", "5G Plus - C-Band",
                "FNET", "Sales High Speed Suitability", "Speed Experience",
                "Available Capacity", "Multi-Gig", "BB Eligible Max Speed", "Fiber Competitor - Any",
                "Multi Tenant", "Total Employees Here", "Wireline Customers at Location", "Non-Wireline Customers at Location",
                "ATT Ookla Quintile", "TMO Ratio Ookla", "VZN Ratio Ookla", "Pop Density", "Median Income", "Percent Hispanic",
                "Latitude", "Longitude"],
            frozenDataKeys: [],
            hiddenColumns: [],
            dataTableExportOmitKeys: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "mkt.vpgm_markt", type: "!=", value: "" },
                [
                    { field: "mkt.vpgm_markt", type: "like", value: val },
                    { field: "dc.dma_name", type: "like", value: val },
                    { field: "arch.name", type: "like", value: val },
                    { field: "address", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "st.state_abbr", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val }
                ]
            ],
            pagination: "remote",
            rowClick: async (instance, rowData) => {

                instance.store.zoomToPoint = Object.assign(rowData, {
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });

            }
        },
        midmarketFiber: {
            name: "midmarketFiber",
            type: "midmarketFiber",
            dataKeys: ["sales_market", "archetype", "total_opportunities_at_location", "simple_coverage_score", "address", "city", "state", "zipcode", "fiber_status", "future_fiber_status", "dma_name", "mikey", "fiveg", "band_14",
                "fiveg_plus_mmwave", "fiveg_plus_cband", "first_net", "sales_high_speed_suitability",
                "speed_experience", "avail_capacity", "multigig", "eligible_max_speed", "fiber_competitor_any",
                "multi_tenant", "total_customers_at_location", "non_fiber_customers_at_location",
                "att_ookla_quintile", "tmo_ratio_ookla", "vzn_ratio_ookla", "pop_density_zip", "median_income", "percentHispanic",

                "latitude", "longitude"],
            headers: ["Sales Market", "Archetype", "Total Wireline Opportunities at Location", "Indoor Coverage Score", "Address", "City", "State", "Zip", "Fiber Status", "Future Fiber Status", "DMA", "MIKEY", "5G", "Band 14",
                "5G Plus - mmWave", "5G Plus - C-Band",
                "FNET", "Sales High Speed Suitability", "Speed Experience",
                "Available Capacity", "Multi-Gig", "BB Eligible Max Speed", "Fiber Competitor - Any",
                "Multi Tenant", "Wireline Customers at Location", "Non-Wireline Customers at Location",
                "ATT Ookla Quintile", "TMO Ratio Ookla", "VZN Ratio Ookla", "Pop Density", "Median Income", "Percent Hispanic",
                "Latitude", "Longitude"],
            frozenDataKeys: [],
            hiddenColumns: [],
            dataTableExportOmitKeys: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button>` : `<span/>`,
            tableFilters: val => [
                { field: "mkt.vpgm_markt", type: "!=", value: "" },
                [
                    { field: "mkt.vpgm_markt", type: "like", value: val },
                    { field: "dc.dma_name", type: "like", value: val },
                    { field: "arch.name", type: "like", value: val },
                    { field: "address", type: "like", value: val },
                    { field: "city", type: "like", value: val },
                    { field: "st.state_abbr", type: "like", value: val },
                    { field: "zipcode", type: "like", value: val }
                ]
            ],
            pagination: "remote"
        },
        tenants: {
            name: "tenant",
            type: "tenants",
            dataKeys: [
                "segment_name",
                "owning_sales_center_id",
                "owning_module",
                "loc_cust_prosp",
                "co_id_type",
                "co_id",
                "bc_company_nm",
                "bc_company_street_address",
                "bc_company_city",
                "bc_company_state",
                "bc_company_zip",
                "mikey",
                "tot_fiber_ports",
                "adi_ports",
                "abf_ports",
                "gpon_ports",
                "bb_uverse_ports",
                "bb_ipdsl_ports",
                "bb_dsl_ports",
                "ase_ports",
                "ase_nod_ports",
                "pid",   
                "ade_ports",
                "vpn_ports",
                "pnt_ports",
                "ds3_ports",                
                "metro_e_ports",                
                "sonet_ports",                
                "opt_e_man_ports",
                "opt_e_wan_ports",                
                "epsl_ports",                
                "bb_ent_ports",
                "legacy_data_ports",
                "voice_ports",
                "video_ports",
                "transport_ports",
                "owning_segment",
                "owning_ae_first_nm",
                "owning_ae_last_nm",
                "owning_ae_user"
            ],
            headers: [
                "Owning Segment Name",
                "Owning Sales Center ID",
                "Owning Module",
                "Customer Status",
                "Customer ID Type",
                "Customer ID Number",
                "Business Name",
                "Business Street Address",
                "Business City",
                "Business ST",
                "Business ZIP",
                "miKey",
                "Total Fiber Ports",
                "ADI Ports",
                "ABF Ports",
                "GPON Ports",
                "U-verse Ports",
                "IPDSL Ports",
                "DSL Ports",
                "Classic ASE Ports",
                "ASENOD Ports",
                "PID",                
                "ADE Ports",
                "VPN Ports",
                "PNT Ports",
                "DS3 Ports",                
                "Metro E Ports",                
                "SONET Ports",                
                "OPT E MAN Ports",
                "OPT E WAN Ports",                
                "EPSL Ports",                
                "BB ENT Ports",
                "Legacy Data Ports",
                "Voice Ports",
                "Video Ports",
                "Transport Ports",
                "Owning Segment",
                "Owning AE First Name",
                "Owning AE Last Name",
                "Owning AE User"
            ],
            frozenDataKeys: ["owning_module,bc_company_nm"],
            hiddenColumns: [],
            footerElement: showExportButton => showExportButton ? `<button class="exportData ui blue mini left floated button">Export</button><button class="clearBuilding ponderHidden ui blue mini left floated button">Clear Building</button>` : `<button class="clearBuilding ponderHidden ui blue mini left floated button">Clear Building</button>`,
            pagination: "remote"

        },
    },
};
