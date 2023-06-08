// GRANTS ARE ARRANGED IN THE ORDER OF LOWEST TO HIGHEST PRIVILEGE

const grants = {
    "AWB_SCORING": {
        "allowExport": true,
        "channel": "byoc",
    },
    "MIDMARKET_LIMITED": {
        "allowExport": false,
        "channel": "midmarket",
    },
    "MIDMARKET": {
        "allowExport": true,
        "channel": "midmarket"
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