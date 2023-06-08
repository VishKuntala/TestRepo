// GRANTS ARE ARRANGED IN THE ORDER OF LOWEST TO HIGHEST PRIVILEGE

const grants = {
    "NEON_GIGAPOWER" :{
        "allowExport": true,
        "channel": "neonGigapower"
    },
    "NEON_GIGAPOWER_LIMITED" :{
        "allowExport": false,
        "channel": "neonGigapower"
    },
    "NEON_GIGAPOWER_SELLER": {
        "allowExport": true,
        "channel": "neonGigapower",
        "pointColorConfig": {
            customerCategory: {
                attribute: "seller_map_cust_cat_id",
                title: "Customer Category",
                colorRamp: [
                    { color: "COLOR_5", heading: 'Fiber Customer', },
                    { color: "COLOR_6", heading: 'Fiber Opportunity', },
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
                    /* COLOR_7: "#a9a9a9", */
                    COLOR_30: "#0066cc",
                    COLOR_60: "#4da6ff",
                    COLOR_90: "#008000",
                    COLOR_98: "#595959",
                    COLOR_99: "#a9a9a9" 
                },
            }
        }
    },
    "NEON_GIGAPOWER_SELLER_LIMITED": {
        "allowExport": false,
        "channel": "neonGigapower",
        "pointColorConfig": {
            customerCategory: {
                attribute: "seller_map_cust_cat_id",
                title: "Customer Category",
                colorRamp: [
                    { color: "COLOR_5", heading: 'Fiber Customer', },
                    { color: "COLOR_6", heading: 'Fiber Opportunity', },
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
                    /* COLOR_7: "#a9a9a9", */
                    COLOR_30: "#0066cc",
                    COLOR_60: "#4da6ff",
                    COLOR_90: "#008000",
                    COLOR_98: "#595959",
                    COLOR_99: "#a9a9a9" 
                },
            }
        }
    },
    "MIDMARKET_LIMITED": {
        "allowExport": false,
        "channel": "midmarket",
    },
    "MIDMARKET": {
        "allowExport": true,
        "channel": "midmarket"
    },
    "CH2FIBER_LIMITED": {
        "allowExport": false,
        "channel": "ch2Fiber",
    },
    "CH2FIBER": {
        "allowExport": true,
        "channel": "ch2Fiber"
    },
    "CH2FIBER_QUICKVIEW": {
        "allowExport": true,
        "channel": "ch2FiberQv"
    },
    "CH3WIRELESS_LIMITED": {
        "allowExport": false,
            "channel": "ch3Wireless",
        },
    "CH3WIRELESS": {
        "allowExport": true,
            "channel": "ch3Wireless"
    },
    "CH4FIBER_LIMITED": {
        "allowExport": false,
        "channel": "ch4Fiber",
    },
    "CH4FIBER": {
        "allowExport": true,
        "channel": "ch4Fiber"
    },
    "CH5WIRELESS_LIMITED": {
        "allowExport": false,
        "channel": "ch5Wireless",
    },
    "CH5WIRELESS": {
        "allowExport": true,
        "channel": "ch5Wireless"
    },
    "CH6WIRELESS_LIMITED": {
        "allowExport": false,
        "channel": "ch6Wireless",
    },
    "CH6WIRELESS": {
        "allowExport": true,
        "channel": "ch6Wireless"
    },
    "CH7SLED_LIMITED": {
        "allowExport": false,
        "channel": "ch7Sled",
    },
    "CH7SLED": {
        "allowExport": true,
        "channel": "ch7Sled"
    },
    "CH8DEMO_LIMITED": {
        "allowExport": false,
        "channel": "ch8Demo",
    },
    "CH8DEMO": {
        "allowExport": true,
        "channel": "ch8Demo"
    },
    "CH9FIBER_STORES_LIMITED": {
        "allowExport": false,
        "channel": "ch9FiberStores",
    },
    "CH9FIBER_STORES": {
        "allowExport": true,
        "channel": "ch9FiberStores"
    },
    "MIDMARKETFIBER_LIMITED": {
        "allowExport": false,
        "channel": "midmarketFiber",
    },
    "MIDMARKETFIBER": {
        "allowExport": true,
        "channel": "midmarketFiber"
    },
    "OMNI_LIMITED": {
        "allowExport": false,
        "channel": "omni"
    },
    "OMNI": {
        "allowExport": true,
        "channel": "omni"
    },
    "BYOC_LIMITED": {
        "allowExport": false,
        "channel": "byoc"
    },
    "BYOC": {
        "allowExport": true,
        "channel": "byoc"
    },
    "NATIONAL_BUSINESS_WIRELESS_LIMITED": {
        "allowExport": false,
        "channel": "nbwc"
    },
    "NATIONAL_BUSINESS_WIRELESS": {
        "allowExport": true,
        "channel": "nbwc"
    },
    "GLOBAL_BUSINESS_LIMITED": {
        "allowExport": false,
        "channel": "globalBusiness"
    },
    "GLOBAL_BUSINESS": {
        "allowExport": true,
        "channel": "globalBusiness"
    },
    "BCLS_LIMITED": {
        "allowExport": false,
        "channel": "bcls"
    },
    "BCLS": {
        "allowExport": true,
        "channel": "bcls"
    },
    "BCLSV2": {
        "allowExport": true,
        "channel": "bclsv2"
    },
    "BCLSV2_LIMITED": {
        "allowExport": false,
        "channel": "bclsv2"
    },
    "ACE": {
        "allowExport": true,
        "channel": "@5"
    },
    "SAMBAR_DIRECTS_CHAINUP": {
        "allowExport": true,
        "channel": "@5"
    },
    "SALES_MANAGEMENT": {
        "allowExport": true,
        "channel": "@5"
    },
    "SALES_OPP_SPECIAL_ACCESS": {
        "allowExport": true,
        "channel": "@5"
    },
    "SALES_OPP_LIMITED": {
        "allowExport": true,
        "channel": "@5"
    },
    "SALES_OPP_LIMITED_SA": {
        "allowExport": true,
        "channel": "@5"
    },
    "WIRELESS_SCORING": {
        "allowExport": true,
        "channel": "@5"
    },
    "WIRELESS_SCORING_@3": {
        "allowExport": true,
        "channel": "@3",
        "description": "Select channels with authids less than or equal to 3 from /modules/helpers/dropdownData.js/channels"
    },
    "ADMIN": {
        "allowExport": true,
        "channel": "*"
    },
    
}

export default grants;