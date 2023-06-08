// GRANTS ARE ARRANGED IN THE ORDER OF LOWEST TO HIGHEST PRIVILEGE

const grants = {
    "ENGLITE": {
        "allowExport": true,
        "channel": "englite",
        "uploadLimit": 10,
    },
    "BYOC": {
        "allowExport": true,
        "channel": "byoc",
        "uploadLimit": 10000
    },
    "ADMIN": {
        "allowExport": true,
        "channel": "*"
    },
    
}

export default grants;