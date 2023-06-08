import { html } from "lit-element";


export const config = {
    pointColorConfig: {
        customerCategory: {
            attribute: "map_customer_category_id",
            title: "Customer Category",
            colorRamp: [
                { color: "COLOR_1", heading: 'Fiber Customer and Wireless Customer', },
                { color: "COLOR_2", heading: 'Fiber Customer and Wireless Cross-Sell Opportunity', },
                { color: "COLOR_3", heading: 'Wireless Customer and Fiber Cross-Sell Opportunity', },
                { color: "COLOR_4", heading: 'Opportunity for Fiber and Wireless', },
                { color: "COLOR_7", heading: 'MDU All AT&T Fiber Customers', },
                { color: "COLOR_8", heading: 'MDU with AT&T Fiber Prospects', }
            ],
            color: {                
                COLOR_0: "#ffe6cc",
                COLOR_1: "#00FF00",
                COLOR_2: "#0000FF",
                COLOR_3: "#FFA500",
                COLOR_4: "#FF0000",
                COLOR_5: "#00FF00",
                COLOR_6: "#0000FF",
                COLOR_7: "#00cc00",
                COLOR_8: "#236B8E",
                COLOR_30: "#0066cc",
                COLOR_60: "#4da6ff",
                COLOR_90: "#008000",
                COLOR_98: "#595959",
                COLOR_99: "#a9a9a9" 
            },
        },        
        fiberPenetration: {
            attribute: "fiber_penetration",
            title: "Fiber Penetration",
            colorRamp: [
                { color: "COLOR_0", heading: 'No Fiber', },
                { color: "COLOR_1", heading: '<30% Fiber', },
                { color: "COLOR_2", heading: '30-40% Fiber', },
                { color: "COLOR_3", heading: '>40% Fiber', }
            ],
            color: {                
                COLOR_0: "#ffe6cc",
                COLOR_1: "#ffff99",
                COLOR_2: "#b3d9ff",
                COLOR_3: "#b3ffb3",
                COLOR_4: "#008000",
                COLOR_5: "#003300",
                COLOR_6: "#a9a9a9",
                COLOR_7: "#a9a9a9",
                COLOR_8: "#236B8E",
                COLOR_30: "#0066cc",
                COLOR_60: "#4da6ff",
                COLOR_90: "#008000",
                COLOR_98: "#595959",
                COLOR_99: "#a9a9a9" 
            },
        },
        indoorCoverageScore: {
            attribute: "indoor_coverage_score",
            title: "Indoor Coverage Score",
            colorRamp: [
                { color: "COLOR_0", heading: 'Unknown', },
                { color: "COLOR_1", heading: 'Very Weak', },
                { color: "COLOR_2", heading: 'Uneven', },
                { color: "COLOR_3", heading: 'Strong', },
                { color: "COLOR_4", heading: 'Very Strong', },
                { color: "COLOR_5", heading: 'Best' }
            ],
            color: {                
                COLOR_0: "#a9a9a9",
                COLOR_1: "#e6b800",
                COLOR_2: "#ffff00",
                COLOR_3: "#00cc00",
                COLOR_4: "#008000",
                COLOR_5: "#003300",
                COLOR_6: "#a9a9a9",
                COLOR_7: "#a9a9a9",
                COLOR_8: "#236B8E",
                COLOR_30: "#0066cc",
                COLOR_60: "#4da6ff",
                COLOR_90: "#008000",
                COLOR_98: "#595959",
                COLOR_99: "#a9a9a9" 
            },
        },
        wirelessScore: {
            attribute: "ics_score_id",
            title: "Indoor Coverage Score",
            colorRamp: [
                { color: "COLOR_0", heading: 'Unknown', },
                { color: "COLOR_1", heading: 'Very Weak', },
                { color: "COLOR_2", heading: 'Uneven', },
                { color: "COLOR_3", heading: 'Strong', },
                { color: "COLOR_4", heading: 'Very Strong', },
                { color: "COLOR_5", heading: 'Best' }
            ],
            color: {                
                COLOR_0: "#a9a9a9",
                COLOR_1: "#e6b800",
                COLOR_2: "#ffff00",
                COLOR_3: "#00cc00",
                COLOR_4: "#008000",
                COLOR_5: "#003300",
                COLOR_6: "#a9a9a9",
                COLOR_7: "#a9a9a9",
                COLOR_8: "#236B8E",
                COLOR_30: "#0066cc",
                COLOR_60: "#4da6ff",
                COLOR_90: "#008000",
                COLOR_98: "#595959",
                COLOR_99: "#a9a9a9" 
            },
        },
        fiberStatus: {
            attribute: "fiber_status_report_rows_id",
            title: "Fiber Status",
            colorRamp: [
                { color: "COLOR_4", heading: 'GPON LIT', },
                { color: "COLOR_1", heading: 'EMT' },
                { color: "COLOR_2", heading: 'MULTI CUSTOMER NTE' },
                { color: "COLOR_3", heading: 'SINGLE CUSTOMER NTE/CELL/LEGACY' },
                { color: "COLOR_5", heading: 'FIBER THERE (Not Lit)', },
                { color: "COLOR_6", heading: 'GPON SERVING AREA (Not Lit)', },
                { color: "COLOR_7", heading: 'NEAR FIBER 1,000ft (Not Lit)', },
                { color: "COLOR_99", heading: 'NONE', }                
            ],
            color: {                
                COLOR_0: "#a9a9a9",
                COLOR_1: "#00a170",
                COLOR_2: "#7c568f",
                COLOR_3: "#6978a5",
                COLOR_4: "#00ff00",
                COLOR_5: "#f1d30e",
                COLOR_6: "#b55a30",
                COLOR_7: "#fec181",
                COLOR_8: "#236B8E",
                COLOR_30: "#0066cc",
                COLOR_60: "#4da6ff",
                COLOR_90: "#008000",
                COLOR_98: "#595959",
                COLOR_99: "#a9a9a9"
            },
        },
        futureFiberStatus: {
            attribute: "future_fiber_status_id",
            title: "Future Fiber Status",
            colorRamp: [
                
                { color: "COLOR_30", heading: 'T-30', },
                { color: "COLOR_60", heading: 'T-60', },
                { color: "COLOR_90", heading: 'Currently EMT', },
                { color: "COLOR_4", heading: 'Currently GPON Lit', },
                { color: "COLOR_98", heading: 'Currently Not Lit', },
                { color: "COLOR_99", heading: 'Other', }
            ],
            color: {
                COLOR_0: "#a9a9a9",
                COLOR_1: "#0066cc",
                COLOR_2: "#4da6ff",
                COLOR_3: "#008000",
                COLOR_4: "#00ff00",
                COLOR_5: "#595959",
                COLOR_6: "#a9a9a9",
                COLOR_7: "#a9a9a9",
                COLOR_8: "#236B8E",
                COLOR_30: "#0066cc",
                COLOR_60: "#4da6ff",
                COLOR_90: "#008000",
                COLOR_98: "#595959",
                COLOR_99: "#a9a9a9"
            },
        }
    },
    mapboxLightStyle: "https://api.maptiler.com/maps/openstreetmap/style.json?key=",
    heatmapLayers: {
        SALES_MARKET: {
            name: "sales-market",
            id: "sales-market-heatmap-id",
            promoteId: "id",
            source: "sales-market-heatmap-source",
            sourceLayer: "vpgmLayer",
            header: "Sales Market Information",
            minZoom: 1,
            maxZoom: 3,
            vectorTileUrl: "vpgms",
            tableType: "vpgms",
        },
        DMA: {
            name: "dma",
            id: "dma-heatmap-id",
            promoteId: "id",
            source: "dma-heatmap-source",
            sourceLayer: "dmaLayer",
            header: "DMA Information",
            minZoom: 3,
            maxZoom: 6,
            vectorTileUrl: "dmas",
            tableType: "dmas",
        },
        COUNTY: {
            name: "county",
            id: "county-heatmap-id",
            promoteId: "id",
            source: "county-heatmap-source",
            sourceLayer: "countyLayer",
            header: "County Information",
            minZoom: 6,
            maxZoom: 9,
            vectorTileUrl: "counties",
            tableType: "counties",
        },
        ZIP: {
            name: "zip",
            id: "zipcode-heatmap-id",
            promoteId: "id",
            source: "zipcode-heatmap-source",
            sourceLayer: "zipLayer",
            header: "ZIP Code Information",
            minZoom: 9,
            maxZoom: 12,
            vectorTileUrl: "zips",
            tableType: "zips",
            parentLayerIds: [
                "county-heatmap-id",
                "dma-heatmap-id",
                "sales-market-heatmap-id",
            ],
        },
        CENSUS_BLOCK: {
            name: "census-block",
            id: "census-block-heatmap-id",
            promoteId: "id",
            source: "census-block-heatmap-source",
            sourceLayer: "censusBlockLayer",
            header: "Census Block Information",
            minZoom: 12,
            maxZoom: 20,
            vectorTileUrl: "censusBlocks",
            tableType: "zips",
        },
    },
    boundaryLayers: {
        SALES_MARKET_BOUNDARY: {
            name: "sales-market-boundary",
            id: "sales-market-boundary",
            source: "sales-market-boundary-source",
        },
        ZIP_BOUNDARY: {
            name: "zip-boundary",
            id: "zip-boundary",
            source: "zip-boundary-source",
        },
        NSB_BOUNDARY: {
            name: "nsb-boundary",
            id: "nsb-boundary",
            source: "nsb-boundary-source",
        }
    },
    pointsLayers: {
        CLUSTER_POINTS: {
            promoteId: "id",
            id: "cluster-layer-id",
            name: "Location Clusters",
            sourceLayer: "clusterLayer",
            source: "cluster-source",
            visibility: "visible",
            minZoom: 2,
            maxZoom: 12,
            checked: false,
            imgUrl: "assets/images/Rectangle.png",
            svgIcon: html`<rectangle-icon width="8" height="8" color="#00cc00"></rectangle-icon>`,
            color: "#0ABFFF",
            vectorTileUrl: "stores",
            updateSourceData: false,
            denominatorValue: 24,
            isAddressLayer: false,
        },
        ATTR_POINTS: {
            promoteId: "location_id",
            id: "attr-storepoint-layer-id",
            name: "AT&T Retail Store",
            source: "attr-storepoint-source",
            visibility: "none",
            minZoom: 2,
            checked: false,
            imgUrl: "assets/images/Ellipse-Outline.png",
            svgIcon: html`<ellipse-outline-icon color='#0ABFFF'></ellipse-outline-icon>`,
            color: "#0ABFFF",
            vectorTileUrl: "stores",
            updateSourceData: true,
            minShapeSize: 0.1,
            maxShapeSize: 0.9,
            denominatorValue: 24,
            isAddressLayer: false,
        },
        AR_POINTS: {
            promoteId: "location_id",
            id: "ar-storepoint-layer-id",
            name: "Authorized Reseller Store",
            source: "ar-storepoint-source",
            visibility: "none",
            minZoom: 2,            
            imgUrl: "assets/images/Ellipse-Outline.png",
            svgIcon: html`<ellipse-outline-icon color='#004B66'></ellipse-outline-icon>`,
            color: "#004B66",
            checked: false,
            vectorTileUrl: "stores",
            updateSourceData: true,
            minShapeSize: 0.1,
            maxShapeSize: 0.9,
            denominatorValue: 24,
            isAddressLayer: false,
        },
        WS_POINTS: {
            promoteId: "id",
            sourceLayer: "wsLayer",
            id: "ws-point-layer-id",
            name: "Business Customer Locations",
            isNameOverridable: true,
            source: "ws-point-source",
            sourceLayer: "wsLayer",
            visibility: "visible",
            minZoom: 12,
            maxZoom: 20,
            vectorTileUrl: "locations",
            imgUrl: "assets/images/Rectangle.png",
            svgIcon: html`<rectangle-icon width="8" height="8" color="#00cc00"></rectangle-icon>`,
            borderColor: {
                CAMPAIGN_ID_1: "#4363d8",
                CAMPAIGN_ID_2: "#3cb44b",
                CAMPAIGN_ID_3: "#ffe119",
                CAMPAIGN_ID_4: "#a9a9a9",
                CAMPAIGN_ID_5: "#469990",
                CAMPAIGN_ID_6: "#42d4f4",
                CAMPAIGN_ID_7: "#f032e6",
                CAMPAIGN_ID_8: "#808080"
            },
            checked: true,
            minShapeSize: 0.1,
            maxShapeSize: 0.9,
            denominatorValue: 36,
            isAddressLayer: false,
        },
        PSA_POINTS: {
            promoteId: "ZIP_CO_PSA",
            sourceLayer: "psaLayer",
            id: "psa-point-layer-id",
            name: "PSA Locations",
            source: "psa-point-source",
            sourceLayer: "psaLayer",
            visibility: "visible",
            minZoom: 0,
            maxZoom: 12,
            imgUrl: "assets/images/Ellipse.png",
            svgIcon: html`<ellipse-icon width="8" height="8" color="#00cc00"></ellipse-icon>`,
            color: {
                WIRELESS_SCORE_1: "#e6b800",
                WIRELESS_SCORE_2: "#ffff00",
                WIRELESS_SCORE_3: "#00cc00",
                WIRELESS_SCORE_4: "#008000",
                WIRELESS_SCORE_5: "#003300",
            },
            checked: true,
            minShapeSize: 0.4,
            maxShapeSize: 0.9,
            denominatorValue: 36,
            fixedSize: true,
            isAddressLayer: false,
        },

    },
};
