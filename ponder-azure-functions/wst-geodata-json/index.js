const R = require('ramda');
const { feature, featureCollection } =  require('@turf/helpers');
const { Pool } = require('pg');
const jwt = require('jsonwebtoken');
let pool = null;
const geojsonService = require('./geojsonService');

module.exports = async function (context, req) {

    try {
        let attuid = process.env.ATTUID;
        let accessControlId = process.env.ACCESS_CONTROL_ID || process.env.CACHE_BUILDER_ACCESS_CONTROL_ID;
        process.env.GROUP_MEMBERSHIP = process.env.GROUP_MEMBERSHIP || process.env.CACHE_BUILDER_GROUP_MEMBERSHIP;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
          const decoded = jwt.verify(req.headers['authorization'],process.env.SECRET);
          attuid = decoded.attuid;
          accessControlId = decoded.accessControlId;
          process.env.GROUP_MEMBERSHIP = R.filter(n => n=== 'ADMIN' || n === 'NEON_GIGAPOWER' || n === 'NEON_GIGAPOWER_LIMITED' || n === 'NEON_GIGAPOWER_SELLER' || n === 'NEON_GIGAPOWER_SELLER_LIMITED', 
          R.split('|', decoded.groupMembership || ''))[0] || 'NEON_GIGAPOWER_SELLER_LIMITED';
        } 
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                pool = new Pool({ connectionString: process.env.WST_PG_CONN_STRING});
            } else {
                pool = new Pool({
                    host: process.env.DB_HOST,
                    user: process.env.DB_USER,
                    password: process.env.DB_PASS,
                    database: 'ponder',
                    port: 5432,
                    ssl: {rejectUnauthorized: false},
                });
            }
        }        
        const results = await geojsonService[req.params.type].geodata(pool, Object.assign(req.body, {attuid, accessControlId}));
        context.res = { 'Content-Type': 'application/json', body: featureCollection([feature(JSON.parse(results.rows[0].st_asgeojson))])};

    } catch (error) {
        console.log(`********************${error}`);
        if (['TokenExpiredError','JsonWebTokenError','NotBeforeError'].includes(error.name)) {
            context.res = {
                status: 403,
                body: 'Not Authorized'
            };
        } else {
        context.res = {
            status: 500,
            body: error
        };    
    }   
    }

}