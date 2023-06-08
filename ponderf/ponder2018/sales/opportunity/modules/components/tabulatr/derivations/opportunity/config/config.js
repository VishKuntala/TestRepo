import centroid from "@turf/centroid";
import { config as mapConfig } from "../../../../azureMap/derivations/mainMap/config/config.js";

export const config = {
    tables: {
        vpgms: {
            name: "vpgm",
            description: "Sales Markets",
            type: "vpgms",
            dataKeys: [
                "sales_market",
                "fiber_percentage",
                "wireless_category",
                "fiber_available",
                "fiber_customers",
                "fiber_opportunity",
                "copper_upgrade",
                "fiber_customer_wireless_customer",
                "fiber_customer_no_wireless",
                "copper_upgrade_wireless_customer",
                "copper_upgrade_no_wireless",
                "wireless_customer_no_fiber",
                "no_fiber_no_wireless",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            headers: [
                "Sales Market Name",
                "Fiber Penetration",
                "Wireless Category",
                "Fiber Available",
                "Fiber Customers",
                "Fiber Opportunity",
                "Copper Upgrade",
                "Fiber Customer and Wireless Customer",
                "Fiber Customer and Wireless Cross-Sell Opportunity",
                "Copper Upgrade and Wireless Customer",
                "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "Wireless Customer and Fiber Cross-Sell Opportunity",
                "Opportunity for Fiber and Wireless",
                "Data Date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            //frozenDataKeys: ["sales_market"],
            frozenDataKeys: [],
            hiddenColumns: [
                //"wireless_category",
                //"fiber_available_sort_value",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export Sales Markets</button>`,
            tableFilters: val => [{ field: 'sales_market', type: 'like', value: val }],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                const params = { id: rowData.sales_market_id };            
                const boundaryData = await instance.getData(
                    `${instance.store.baseApiUrl}/geodata/fiberPenetration/salesMarketBoundary.geojson`, //boundary data same all heatmaps
                    params
                );
                instance.store.tableRowClicked = true;
                const salesMarketCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: salesMarketCenter.geometry.coordinates[1],
                    lng: salesMarketCenter.geometry.coordinates[0],
                    zoom: mapConfig.heatmapLayers.SALES_MARKET.minZoom,
                    addMarker: false,
                };
                instance.store.setBoundaryLayer = {
                    layerName: "SALES_MARKET_BOUNDARY",
                    featureCollection: boundaryData
                };
            },
            minWidthColumns: ["sales_market"], //sets the minWidth of columns to 200px
            exportDataKeysMap: {
                "sales_market": "Sales Market Name",
                "fiber_percentage": "Fiber Penetration",
                "fiber_available": "Fiber Available",
                "fiber_customers": "Fiber Customers",
                "fiber_opportunity": "Fiber Opportunity",
                "copper_upgrade": "Copper Upgrade",
                "fiber_customer_wireless_customer": "Fiber Customer and Wireless Customer",
                "fiber_customer_no_wireless": "Fiber Customer and Wireless Cross-Sell Opportunity",
                "copper_upgrade_wireless_customer": "Copper Upgrade and Wireless Customer",
                "copper_upgrade_no_wireless": "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "wireless_customer_no_fiber": "Wireless Customer and Fiber Cross-Sell Opportunity",
                "no_fiber_no_wireless": "Opportunity for Fiber and Wireless"                
            },
        },
        cmas: {
            name: "cma",
            description: "CMAs",
            type: "cmas",
            dataKeys: [
                "cma_name",
                "cma",
                //"elderly_percent_text",
                "fiber_percentage",
                "wireless_category",
                //"fiber_available_sort_value",
                "fiber_available",
                "fiber_customers",
                "fiber_opportunity",
                "copper_upgrade",
                "data_date",
            ],
            headers: [
                "CMA Name",
                "CMA",
                "Wireless Category",
                //"Elderly Percentage",
                "Fiber Penetration",
                //"Sort Value",
                "Fiber Available",
                "Fiber Customers",
                "Fiber Opportunity",
                "Copper Upgrade",
                "Data Date",
            ],
            frozenDataKeys: ["cma_name", "cma"],
            hiddenColumns: [
                //"wireless_category",
                "elderly_percent_text",
                "fiber_available_sort_value",
                "data_date",
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export CMAs</button>`,
            pagination: "remote",
        },
        dmas: {
            name: "dma",
            description: "DMAs",
            type: "dmas",
            dataKeys: [
                "dma_name",
                "dma",
                //"elderly_percent_text",
                "fiber_percentage",
                //"fiber_available_sort_value",
                "wireless_category",
                "fiber_available",
                "fiber_customers",
                "fiber_opportunity",
                "copper_upgrade",
                "fiber_customer_wireless_customer",
                "fiber_customer_no_wireless",
                "copper_upgrade_wireless_customer",
                "copper_upgrade_no_wireless",
                "wireless_customer_no_fiber",
                "no_fiber_no_wireless",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            headers: [
                "DMA Name",
                "DMA",
                //"Elderly Percentage",
                "Fiber Penetration",
                "Wireless Category",
                //"Sort Value",
                "Fiber Available",
                "Fiber Customers",
                "Fiber Opportunity",
                "Copper Upgrade",
                "Fiber Customer and Wireless Customer",
                "Fiber Customer and Wireless Cross-Sell Opportunity",
                "Copper Upgrade and Wireless Customer",
                "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "Wireless Customer and Fiber Cross-Sell Opportunity",
                "Opportunity for Fiber and Wireless",
                "Data Date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            /*frozenDataKeys: ["dma_name", "dma"],*/
            frozenDataKeys: [],
            hiddenColumns: [
                //"wireless_category",
                //"elderly_percent_text",
                //"fiber_available_sort_value",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export DMAs</button>`,
            tableFilters: val => [{ field: 'dma_name', type: 'like', value: val }],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                const params = {dma: rowData.dma};
                const boundaryData = await instance.getData(
                    `${instance.store.baseApiUrl}/geodata/fiberPenetration/dmaBoundary.geojson`, //boundary data same all heatmaps
                    params
                );
                instance.store.tableRowClicked = true;
                const dmaCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: dmaCenter.geometry.coordinates[1],
                    lng: dmaCenter.geometry.coordinates[0],
                    zoom: mapConfig.heatmapLayers.DMA.minZoom,
                    addMarker: false,
                };
                instance.store.setBoundaryLayer = {
                    layerName: "DMA_BOUNDARY",
                    featureCollection: boundaryData
                };
            },
            minWidthColumns: ["dma_name"], //sets the minWidth of columns to 200px
            exportDataKeysMap: {
                "dma_name": "DMA Name",
                "dma": "DMA",
                "fiber_percentage": "Fiber Penetration",
                "fiber_available": "Fiber Available",
                "fiber_customers": "Fiber Customers",
                "fiber_opportunity": "Fiber Opportunity",
                "copper_upgrade": "Copper Upgrade",
                "fiber_customer_wireless_customer": "Fiber Customer and Wireless Customer",
                "fiber_customer_no_wireless": "Fiber Customer and Wireless Cross-Sell Opportunity",
                "copper_upgrade_wireless_customer": "Copper Upgrade and Wireless Customer",
                "copper_upgrade_no_wireless": "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "wireless_customer_no_fiber": "Wireless Customer and Fiber Cross-Sell Opportunity",
                "no_fiber_no_wireless": "Opportunity for Fiber and Wireless"
            },
        },
        counties: {
            name: "county",
            description: "Counties",
            type: "counties",
            dataKeys: [
                "county_state",
                //"elderly_percent_text",
                "fiber_percentage",
                "wireless_category",
                //"fiber_available_sort_value",
                "fiber_available",
                "fiber_customers",
                "fiber_opportunity",
                "copper_upgrade",
                "fiber_customer_wireless_customer",
                "fiber_customer_no_wireless",
                "copper_upgrade_wireless_customer",
                "copper_upgrade_no_wireless",
                "wireless_customer_no_fiber",
                "no_fiber_no_wireless",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            headers: [
                "County",
                //"Elderly Percentage",
                "Fiber Penetration",
                "Wireless Category",
                //"Sort Value",
                "Fiber Available",
                "Fiber Customers",
                "Fiber Opportunity",
                "Copper Upgrade",
                "Fiber Customer and Wireless Customer",
                "Fiber Customer and Wireless Cross-Sell Opportunity",
                "Copper Upgrade and Wireless Customer",
                "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "Wireless Customer and Fiber Cross-Sell Opportunity",
                "Opportunity for Fiber and Wireless",
                "Data Date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            /*frozenDataKeys: ["county_state"],*/
            frozenDataKeys: [],
            hiddenColumns: [
                //"wireless_category",
                //"elderly_percent_text",
                //"fiber_available_sort_value",
                "data_date",
                "cnty_fips",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export Counties</button>`,
            tableFilters: val => [{ field: 'county_state', type: 'like', value: val }],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                const params = {county: rowData.cnty_fips};
                const boundaryData = await instance.getData(
                    `${instance.store.baseApiUrl}/geodata/fiberPenetration/countyBoundary.geojson`, //boundary data same all heatmaps
                    params
                );
                instance.store.tableRowClicked = true;
                const countyCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: countyCenter.geometry.coordinates[1],
                    lng: countyCenter.geometry.coordinates[0],
                    zoom: mapConfig.heatmapLayers.COUNTY.minZoom,
                    addMarker: false,
                };
                instance.store.setBoundaryLayer = {
                    layerName: "COUNTY_BOUNDARY",
                    featureCollection: boundaryData
                };
            },
            minWidthColumns: ["county_state"], //sets the minWidth of columns to 200px
            exportDataKeysMap: {
                "county_state": "County",
                "fiber_percentage": "Fiber Penetration",
                "fiber_available": "Fiber Available",
                "fiber_customers": "Fiber Customers",
                "fiber_opportunity": "Fiber Opportunity",
                "copper_upgrade": "Copper Upgrade",
                "fiber_customer_wireless_customer": "Fiber Customer and Wireless Customer",
                "fiber_customer_no_wireless": "Fiber Customer and Wireless Cross-Sell Opportunity",
                "copper_upgrade_wireless_customer": "Copper Upgrade and Wireless Customer",
                "copper_upgrade_no_wireless": "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "wireless_customer_no_fiber": "Wireless Customer and Fiber Cross-Sell Opportunity",
                "no_fiber_no_wireless": "Opportunity for Fiber and Wireless"
            },
        },
        zips: {
            name: "zip",
            description: "Zips",
            type: "zips",
            dataKeys: [
                "zip",
                //"elderly_percent_text",
                "fiber_percentage",
                "wireless_category",
                //"fiber_available_sort_value",
                "fiber_available",
                "fiber_customers",
                "fiber_opportunity",
                "copper_upgrade",
                "fiber_customer_wireless_customer",
                "fiber_customer_no_wireless",
                "copper_upgrade_wireless_customer",
                "copper_upgrade_no_wireless",
                "wireless_customer_no_fiber",
                "no_fiber_no_wireless",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            headers: [
                "Zip Code",
                //"Elderly Percentage",
                "Fiber Penetration",
                "Wireless Category",
                //"Sort Value",
                "Fiber Available",
                "Fiber Customers",
                "Fiber Opportunity",
                "Copper Upgrade",
                "Fiber Customer and Wireless Customer",
                "Fiber Customer and Wireless Cross-Sell Opportunity",
                "Copper Upgrade and Wireless Customer",
                "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "Wireless Customer and Fiber Cross-Sell Opportunity",
                "Opportunity for Fiber and Wireless",
                "Data Date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            /*frozenDataKeys: ["zip"],*/
            frozenDataKeys: [],
            hiddenColumns: [
                //"wireless_category",
                //"elderly_percent_text",
                "fiber_available_sort_value",
                "data_date",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export Zips</button>`,
            tableFilters: val => [{ field: 'zip', type: 'like', value: val }],
            pagination: "remote",
            rowClick: async (instance, rowData) => {
                const params = {zip: rowData.zip};
                const boundaryData = await instance.getData(
                    `${instance.store.baseApiUrl}/geodata/fiberPenetration/zipBoundary.geojson`, //boundary data same all heatmaps
                    params
                );
                instance.store.tableRowClicked = true;
                const zipCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: zipCenter.geometry.coordinates[1],
                    lng: zipCenter.geometry.coordinates[0],
                    zoom: mapConfig.heatmapLayers.ZIP.minZoom,
                    addMarker: false,
                };
                instance.store.setBoundaryLayer = {
                    layerName: "ZIP_BOUNDARY",
                    featureCollection: boundaryData
                };
            },
            exportDataKeysMap: {
                "zip": "Zip Code",
                "fiber_percentage": "Fiber Penetration",
                "fiber_available": "Fiber Available",
                "fiber_customers": "Fiber Customers",
                "fiber_opportunity": "Fiber Opportunity",
                "copper_upgrade": "Copper Upgrade",
                "fiber_customer_wireless_customer": "Fiber Customer and Wireless Customer",
                "fiber_customer_no_wireless": "Fiber Customer and Wireless Cross-Sell Opportunity",
                "copper_upgrade_wireless_customer": "Copper Upgrade and Wireless Customer",
                "copper_upgrade_no_wireless": "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "wireless_customer_no_fiber": "Wireless Customer and Fiber Cross-Sell Opportunity",
                "no_fiber_no_wireless": "Opportunity for Fiber and Wireless"
            },
        },
        censusblocks: {
            name: "censusblock",
            description: "Census Blocks",
            type: "censusblocks",
            dataKeys: [
                "id",
                "name",
                "fiber_percentage",
                "wireless_category",
                "fiber_available",
                "fiber_customers",
                "fiber_opportunity",
                "copper_upgrade",
                "fiber_customer_wireless_customer",
                "fiber_customer_no_wireless",
                "copper_upgrade_wireless_customer",
                "copper_upgrade_no_wireless",
                "wireless_customer_no_fiber",
                "no_fiber_no_wireless",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            headers: [
                "ID",
                "Name",
                "Fiber Penetration",
                "Wireless Category",
                "Fiber Available",
                "Fiber Customers",
                "Fiber Opportunity",
                "Copper Upgrade",
                "Fiber Customer and Wireless Customer",
                "Fiber Customer and Wireless Cross-Sell Opportunity",
                "Copper Upgrade and Wireless Customer",
                "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "Wireless Customer and Fiber Cross-Sell Opportunity",
                "Opportunity for Fiber and Wireless",
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            //frozenDataKeys: ["id", "name"],
            frozenDataKeys: [],
            hiddenColumns: [
                "fiber_penetration_hm_color_code",
                "wireless_coverage_hm_color_code",
                "copper_upgrade_hm_color_code",
                "fiber_opportunity_hm_color_code"
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export Census Blocks</button>`,
            pagination: "local",
            rowClick: async (instance, rowData) => {
                const params = {id: rowData.id};
                const boundaryData = await instance.getData(
                    `${instance.store.baseApiUrl}/geodata/fiberPenetration/censusBlockBoundary.geojson`, //boundary data same all heatmaps
                    params
                );
                instance.store.tableRowClicked = true;
                const censusBlockCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: censusBlockCenter.geometry.coordinates[1],
                    lng: censusBlockCenter.geometry.coordinates[0],
                    zoom: mapConfig.heatmapLayers.CENSUS_BLOCK.minZoom,
                    addMarker: false,
                };
                instance.store.setBoundaryLayer = {
                    layerName: "CENSUS_BLOCK_BOUNDARY",
                    featureCollection: boundaryData
                };

            },
            minWidthColumns: ["wireless_category"], //sets the minWidth of columns to 200px
            exportDataKeysMap: {
                "id": "ID",
                "name": "Name",
                "fiber_percentage": "Fiber Penetration",
                "fiber_available": "Fiber Available",
                "fiber_customers": "Fiber Customers",
                "fiber_opportunity": "Fiber Opportunity",
                "copper_upgrade": "Copper Upgrade",
                "fiber_customer_wireless_customer": "Fiber Customer and Wireless Customer",
                "fiber_customer_no_wireless": "Fiber Customer and Wireless Cross-Sell Opportunity",
                "copper_upgrade_wireless_customer": "Copper Upgrade and Wireless Customer",
                "copper_upgrade_no_wireless": "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "wireless_customer_no_fiber": "Wireless Customer and Fiber Cross-Sell Opportunity",
                "no_fiber_no_wireless": "Opportunity for Fiber and Wireless"
            },
        },
        psas: {
            name: "psas",
            type: "psas",
            dataKeys: [
                "zip_co_psa",
                "fiber_available",
                "fiber_opportunity",
                "fiber_customers",
                "fiber_percentage",
                "copper_upgrade",
                "fiber_customer_wireless_customer",
                "fiber_customer_no_wireless",
                "copper_upgrade_wireless_customer",
                "copper_upgrade_no_wireless",
                "wireless_customer_no_fiber",
                "no_fiber_no_wireless",
                "mdu_density_text",
                "simple_coverage_score",
                "market_rank",
                "latitude",
                "longitude",
                "data_date",
                "psa_events_exists"
            ],
            headers: [
                "Zip CO PSA",
                "Fiber Available",
                "Fiber Opportunity",
                "Fiber Customers",
                "Fiber Penetration",
                "Copper Upgrade",
                "Fiber Customer and Wireless Customer",
                "Fiber Customer and Wireless Cross-Sell Opportunity",
                "Copper Upgrade and Wireless Customer",
                "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "Wireless Customer and Fiber Cross-Sell Opportunity",
                "Opportunity for Fiber and Wireless",
                "MDU Density",
                "Indoor Coverage Score",
                "Market Rank",
                "Latitude",
                "Longitude",
                "Data Date",
                "Event"
            ],
            //frozenDataKeys: ["zip_co_psa"],
            frozenDataKeys: [],
            hiddenColumns: [                
                "latitude",
                "longitude",
                "data_date",
                "psa_events_exists"
            ],
            footerElement: `<button class="exportData ui blue mini left floated button">Export PSAs</button>`,
            tableFilters: val => [{ field: 'zip_co_psa', type: 'like', value: val }],
            pagination: "remote",
            minWidthColumns: ["zip_co_psa", "mdu_density_text"], //sets the minWidth of columns to 200px
            psasExportDataKeysMap: {
                "zip_co_psa": "Zip CO PSA",
                "fiber_available": "Fiber Available",
                "fiber_opportunity": "Fiber Opportunity",
                "fiber_customers": "Fiber Customers",
                "fiber_percentage": "Fiber Penetration",
                "copper_upgrade": "Copper Upgrade",
                "fiber_customer_wireless_customer": "Fiber Customer and Wireless Customer",
                "fiber_customer_no_wireless": "Fiber Customer and Wireless Cross-Sell Opportunity",
                "copper_upgrade_wireless_customer": "Copper Upgrade and Wireless Customer",
                "copper_upgrade_no_wireless": "Copper Upgrade and Wireless Cross-Sell Opportunity",
                "wireless_customer_no_fiber": "Wireless Customer and Fiber Cross-Sell Opportunity",
                "no_fiber_no_wireless": "Opportunity for Fiber and Wireless",
                "mdu_density_text": "MDU Density",
                "simple_coverage_score": "Indoor Coverage Score",
                "market_rank": "Market Rank"
            },
        },
        addresses: {
            name: "address",
            type: "addresses",
            dataKeys: [
                "customer_category",
                "address",
                "unit_number",
                "dwelling_type",
                //"customer",
                "zip_co_psa",
                "regreen",
                "adsl",
                "csi_eligible",
                "latitude",
                "longitude",
                "addr_id",
            ],
            headers: [
                "Customer Category",
                "Address",
                "Unit #",
                "Dwelling Type",
                //"Customer",
                "Zip CO PSA",
                "Regreen",
                "ADSL",
                "CSI Eligible",
                "Latitude",
                "Longitude",
                "Address Id",
            ],
            //frozenDataKeys: ["customer_category"],
            frozenDataKeys: [],
            hiddenColumns: ["addr_id", "id"],
            footerElement: `<button class="exportData ui blue mini left floated button">Export Addresses</button>`,
            pagination: "local",
            addressExportDataKeysMap: {                
                "customer_category": "Customer Category",
                "address": "Address",
                "unit_number": "Unit #",
                "dwelling_type": "Dwelling Type",
                //"customer": "Customer",
                "zip_co_psa": "Zip CO PSA",
                "regreen": "Regreen",
                "adsl": "ADSL",
                "csi_eligible": "CSI Eligible",
                "latitude": "Latitude",
                "longitude": "Longitude",
            },
        },
        mdus: {
            name: "mdu",
            type: "mdus",
            dataKeys: [
                "customer_category",
                "mdu_acc_flag",
                "address",
                "zip_co_psa",
                "wireless_score",
                "fiber_available",
                "fiber_opportunity",
                "fiber_penetration_rate",
                "market_rank",
                "regreen",
                "adsl",
                "csi_eligible",
                //"preferred_partner",
                "area_mgr",
                "gm",
                "latitude",
                "longitude",
            ],
            headers: [
                "Customer Category",
                "ACC MDU",
                "Address",
                "Zip CO PSA",
                "Indoor Coverage Score",
                "Fiber Available",
                "Fiber Opportunity",
                "Fiber Penetration",
                "Market Rank",
                "Regreen",
                "ADSL",
                "CSI Eligible",
                //"Preferred Partner",
                "Area Manager",
                "ACC GM",
                "Latitude",
                "Longitude",
            ],
            //frozenDataKeys: ["customer_category"],
            frozenDataKeys: [],
            hiddenColumns: [],
            footerElement: `<button class="exportData ui blue mini left floated button">Export MDUs</button>`,
            pagination: "local",
            mduExportDataKeysMap: {
                "customer_category":"Customer Category",
                "mdu_acc_flag": "ACC MDU",
                "address": "Address",
                "zip_co_psa": "Zip CO PSA",
                "fiber_available": "Fiber Available",
                "fiber_penetration_rate": "Fiber Penetration",
                "wireless_score": "Indoor Coverage Score",
                "regreen": "Regreen",
                "adsl": "ADSL",
                "csi_eligible": "CSI Eligible",
                "area_mgr": "ACC Area Manager",
                "gm": "ACC General Manager",
                "latitude": "Latitude",
                "longitude": "Longitude",
                //"preferred_partner": "Preferred Partner",
            },
            // used for all units and individual unit export buttons
            mduUnitsExportDataKeysMap: {
                "mdu_acc_flag": "ACC MDU",
                "house_number": "House Number",
                "prefix": "Prefix",
                "street_name": "Street Name",
                "unit_number": "Unit Number",
                "city": "City",
                "state": "State",
                "zip": "Zip",
                "latitude": "Latitude",
                "longitude": "Longitude",
                "zip_co_psa": "Zip CO PSA",
                "wireless_score": "Indoor Coverage Score",                                
                "dwelling_type": "Dwelling Type",
                "regreen": "Regreen",
                "adsl": "ADSL",
                "csi_eligible": "CSI Eligible",
                "area_mgr": "ACC Area Manager",
                "gm": "ACC General Manager"
                //"preferred_partner": "Preferred Partner"
            }
        },
        accs: {
            name: "acc",
            type: "acc",
            dataKeys: [
                "acc_mstr_prpty_id",
                "property_name",
                "mdu_acc_prod_fiber_available",
                "mdu_acc_prod_fiber_opportunity",
                "mdu_acc_prod_fiber_penetration_rate",
                "mdu_acc_prod_copper_upgrade",
                "mdu_acc_prod_psa_coverage_score",
                "contract_type",
                "preferred_partner",
                "area_mgr",
                "gm",
                "fibr_elgbl_yrmo",
                //"mdu_acc_prod_latitude", //acc lat
                //"mdu_acc_prod_longitude", //acc lang
                "zip_co_psa",
                "latitude",
                "longitude"
            ],
            headers: [
                "Property ID (Parent)",
                "Property Name",
                "Fiber Available",
                "Fiber Opportunity",
                "Fiber Penetration",
                "Copper Upgrade",
                "PSA Coverage Score",
                "Contract Type",
                "Preferred Partner",
                "Area Manager",
                "General Manager",
                "Fiber Eligibility",
                //"MDU ACC Latitude", //acc lat
                //"MDU ACC Longitude", //acc lang,
                "Zip CO PSA",
                "Latitude",
                "Longitude"
            ],
            frozenDataKeys: [],
            hiddenColumns: ["area_mgr", "gm", "fibr_elgbl_yrmo", "zip_co_psa"],
            footerElement: `<button class="exportData ui blue mini left floated button">Export ACCs</button>`,
            pagination: "local",
            accExportDataKeysMap: {
                "acc_mstr_prpty_id": "Property ID (Parent)",
                "property_name": "Property Name",
                "mdu_acc_prod_fiber_available": "Fiber Available",
                "mdu_acc_prod_fiber_penetration_rate": "Fiber Penetration",                
                "mdu_acc_prod_psa_coverage_score": "Indoor Coverage Score",
                "contract_type": "Contract Type",
                "preferred_partner": "Preferred Partner",
                "area_mgr": "Area Manager",
                "gm": "General Manager",
                "latitude": "Latitude", // lat
                "latitude": "Longitude", // lang
                "zip_co_psa": "Zip CO PSA",
            },
            // used for all units and individual unit export buttons
            accUnitsExportDataKeysMap: {
                "house_number": "House Number",
                "prefix": "Prefix",
                "street_name": "Street Name",
                "unit_number": "Unit Number",
                "city": "City",
                "state": "State",
                "zip": "Zip",
                "wireless_score": "Indoor Coverage Score",
                "customer": "Customer",
                "dwelling_type": "Dwelling Type",
                "latitude": "Latitude",
                "longitude": "Longitude",
                "acc_mstr_prpty_id": "Property ID (Parent)",
                "property_name": "Property Name",
                "contract_type": "Contract Type",
                "preferred_partner": "Preferred Partner",
                "area_mgr": "Area Manager",
                "gm": "General Manager",
                "hsiaplan": "HSIA Plan",
                "fibr_elgbl_yrmo": "Fiber Eligibility",
                "zip_co_psa": "Zip CO PSA", //only used in unit exports
            }
        },
        useraccs: {
            name: "useraccs",
            type: "useraccs",
            dataKeys: [
                "acc_mstr_prpty_id",
                "property_name",
                "fiber_available", //Fiber ALUs
                "fiber_opportunity", //Total Opportunity
                "fiber_opportunity_new", //Fiber Opportunity(new)
                "copper_upgrade", //Fiber Opportunity (migration)
                "fiber_customers", //Fiber In Service
                "fiber_penetration_rate",                
                // "ab_avg_market_pen", //Above Below Average Market Penetration
                "psa_coverage_score",
                "contract_type",
                "preferred_partner",
                "area_mgr",
                "gm",                
                "fibr_elgbl_yrmo",
                "latitude",
                "longitude"                
            ],
            headers: [
                "Property ID (Parent)",
                "Property Name",
                "Fiber ALUs",
                "Total Opportunity",
                "Fiber Opportunity(new)",
                "Fiber Opportunity (migration)",
                "Fiber In Service",
                "Fiber Penetration",                
                // "Above Below Average Market Penetration",
                "Indoor Coverage Score+",
                "Contract Type",
                "Preferred Partner",
                "Area Manager",
                "General Manager",                
                "Fiber Eligibility",
                "Latitude",
                "Longitude"                
            ],
            frozenDataKeys: [],
            hiddenColumns: ["area_mgr", "gm", "fibr_elgbl_yrmo", "latitude", "longitude"],
            footerElement: `<button class="exportData ui blue mini left floated button">Export ACCs</button>`,
            pagination: "local",
            userACCExportDataKeysMap: {
                "acc_mstr_prpty_id": "Property ID (Parent)",
                "property_name": "Property Name",
                "fiber_available": "Fiber ALUs",
                "fiber_opportunity": "Total Opportunity",
                "fiber_opportunity_new": "Fiber Opportunity(new)",
                "copper_upgrade": "Fiber Opportunity (migration)",
                "fiber_customers": "Fiber In Service",
                "fiber_penetration_rate": "Fiber Penetration",                
                // "ab_avg_market_pen": "Above Below Average Market Penetration",
                "psa_coverage_score": "Indoor Coverage Score",
                "contract_type": "Contract Type",
                "preferred_partner": "Preferred Partner",
                "area_mgr": "Area Manager",
                "gm": "General Manager",
                "latitude": "Latitude",
                "longitude": "Longitude"
            },
            // used for individual unit export buttons, data for this export from API endpoint (useraccsrow)
            userACCUnitsExportDataKeysMap: {
                "house_number": "House Number",
                "prefix": "Prefix",
                "street_name": "Street Name",
                "unit_number": "Unit Number",
                "city": "City",
                "state": "State",
                "zip": "Zip",
                "wireless_score": "Indoor Coverage Score",
                "customer": "Customer",
                "dwelling_type": "Dwelling Type",
                "latitude": "Latitude",
                "longitude": "Longitude",
                "acc_mstr_prpty_id": "Property ID (Parent)",
                "property_name": "Property Name",
                "contract_type": "Contract Type",
                "preferred_partner": "Preferred Partner",
                "area_mgr": "Area Manager",
                "gm": "General Manager",
                "hsiaplan": "HSIA Plan",
                "fibr_elgbl_yrmo": "Fiber Eligibility",
                "zip_co_psa": "Zip CO PSA", //only used in unit exports
            }
        },
    },
    tabs: {
        allTabs: ["mainTableTab", "psaTableTab", "addressTableTab", "mduTableTab", "accTableTab", "userACCTableTab"],
        allTabDivs: ["mainTableDiv", "psaTableDiv", "addressTableDiv", "mduTableDiv", "accTableDiv", "userACCTableDiv"],
        main: {
            tabName: "mainTableTab",
            divName: "mainTableDiv",
            tableName: "mainTable"
        },
        psa: {
            tabName: "psaTableTab",
            divName: "psaTableDiv",
            tableName: "psaTable"
        },
        address: {
            tabName: "addressTableTab",
            divName: "addressTableDiv",
            tableName: "addressTable"
        },
        mdu: {
            tabName: "mduTableTab",
            divName: "mduTableDiv",
            tableName: "mduTable"
        },
        acc: {
            tabName: "accTableTab",
            divName: "accTableDiv",
            tableName: "accTable"
        },
        userACC: {
            tabName: "userACCTableTab",
            divName: "userACCTableDiv",
            tableName: "userACCTable"
        },
    }
};
