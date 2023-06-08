// const { Client } = require('pg');
const { Pool } = require('pg');
const R = require('ramda');
const jwt = require('jsonwebtoken');
const { point, featureCollection } =  require('@turf/helpers');
// let pgClient = null;
let pool = null;
const channels = require('./channels');

module.exports = async function (context, req) {
    
    try {
        let attuid = process.env.ATTUID || process.env.CACHE_BUILDER_ATTID;
        let accessControlId = process.env.ACCESS_CONTROL_ID || process.env.CACHE_BUILDER_ACCESS_CONTROL_ID;
        process.env.GROUP_MEMBERSHIP = process.env.GROUP_MEMBERSHIP || process.env.CACHE_BUILDER_GROUP_MEMBERSHIP;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development' && !req.body?.cacheBuilder) {
          const decoded = jwt.verify(req.headers['authorization'],process.env.SECRET);
          attuid = decoded.attuid;
          accessControlId = decoded.accessControlId;
          process.env.GROUP_MEMBERSHIP = R.filter(n => n=== 'ADMIN' || n === 'NEON_GIGAPOWER' || n === 'NEON_GIGAPOWER_LIMITED' || n === 'NEON_GIGAPOWER_SELLER' || n === 'NEON_GIGAPOWER_SELLER_LIMITED', 
          R.split('|', decoded.groupMembership || ''))[0] || 'NEON_GIGAPOWER_SELLER_LIMITED';
        } 
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                // pgClient = new Client({ connectionString: process.env.WST_PG_CONN_STRING});
                pool = new Pool({ connectionString: process.env.WST_PG_CONN_STRING});
            } else {
                /* pgClient = new Client({
                    host: process.env.DB_HOST,
                    user: process.env.DB_USER,
                    password: process.env.DB_PASS,
                    database: 'ponder',
                    port: 5432,
                    ssl: {rejectUnauthorized: false},
                }); */
                pool = new Pool({
                    host: process.env.DB_HOST,
                    user: process.env.DB_USER,
                    password: process.env.DB_PASS,
                    database: 'ponder',
                    port: 5432,
                    ssl: {rejectUnauthorized: false},
                  });
            }
            // pgClient.connect();
        }
        const userAttributeResults = await pool.query(`select attribute_name, attribute_value from 
        cmn.ponder_access_control_attribute paca inner join cmn.ponder_access_control pac
        on paca.access_control_id=pac.access_control_id
        where pac.att_userid='${attuid}' and pac.access_control_id=${accessControlId}`);
        let channel = "bclsv2";
        const bclsv2Channels = ["bclsv2","midmarket","omni","nbwc","globalBusiness","byoc","nationalLUs","bcls","natLus","midmarketFiber","ch2Fiber","ch3Wireless","ch4Fiber","ch5Wireless","ch6Wireless","ch7Sled","ch2FiberQv","ch8Demo","ch9FiberStores"];
        if (!bclsv2Channels.includes(req.params.channel)) {
            channel = req.params.channel;
        }      
        const result = await channels[channel]['dataTypes'][req.params.dataType](pool, req.body, Object.assign(req.query, { attuid, channel, accessControlId }), req.params.entityType, userAttributeResults.rows);
        if (channel === 'store') {
            const geojsonResult = featureCollection(R.map(p => point(p.point, p.props), R.map(item => {
                return { point: R.props(['longitude', 'latitude'], item), props: item };
            }, result)));
            context.res = { 'Content-Type': 'application/json', body: geojsonResult};
        } else {
            context.res = { 'Content-Type': 'application/json', body: result };
        }
    } catch (error) {
        context.log(`********************${error}`);
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