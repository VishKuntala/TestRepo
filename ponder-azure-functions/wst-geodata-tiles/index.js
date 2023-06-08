const R = require('ramda');
const { feature, featureCollection } =  require('@turf/helpers');
const { Pool, types } = require('pg');
const jwt = require('jsonwebtoken');
const SphericalMercator = require('@mapbox/sphericalmercator');
const mercator = new SphericalMercator({size: 256});
// let pgClient = null;
let pool = null;
const channels = require('./channels');
const mvtService = require('./mvtService');

types.setTypeParser(types.builtins.FLOAT8, value => {
    return parseFloat(value);
});
types.setTypeParser(types.builtins.INT8, value => {
    return parseInt(value,10);
});
types.setTypeParser(types.builtins.NUMERIC, value => {
    return parseInt(value,10);
});

const preCalculatedFilterIndependentHeatMaps = ['none','aveCoverageScore'];



module.exports = async function (context, req) {

    try {
        let attuid = process.env.ATTUID || process.env.CACHE_BUILDER_ATTID;
        let accessControlId = process.env.ACCESS_CONTROL_ID || process.env.CACHE_BUILDER_ACCESS_CONTROL_ID;
        process.env.GROUP_MEMBERSHIP = process.env.GROUP_MEMBERSHIP || process.env.CACHE_BUILDER_GROUP_MEMBERSHIP;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development' && !req.query?.cacheBuilder) {
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
        let channel = "bclsv2";
        const bclsv2Channels = ["bclsv2","midmarket","omni","nbwc","globalBusiness","byoc","nationalLUs","bcls","natLus","midmarketFiber","ch2Fiber","ch3Wireless","ch4Fiber","ch5Wireless","ch6Wireless","ch7Sled","ch2FiberQv","ch8Demo","ch9FiberStores"];
        if (!bclsv2Channels.includes(req.params.channel)) {
            channel = req.params.channel;
        }
        let bbox = mercator.bbox(req.params.x, req.params.y, req.params.z, false);
        let results = {};
        if (req.params.type === 'locations' || req.params.type === 'psas') {
         results = await channels[channel]['mvtService'][req.params.type].mvt(bbox, pool, 
            Object.assign(req.query, { attuid, channel, accessControlId, x: req.params.x, y: req.params.y, z: req.params.z }), channel);
        } else if (!R.includes(req.params.heatmap, preCalculatedFilterIndependentHeatMaps)) {
            results = await channels[channel]['mvtService'][req.params.heatmap][req.params.type].mvt(bbox, pool, 
               Object.assign(req.query, { attuid, channel, accessControlId, x: req.params.x, y: req.params.y, z: req.params.z }), channel);
        } else {
            results = await mvtService[req.params.heatmap][req.params.type].mvt(bbox, pool, 
                Object.assign(req.query, { attuid, channel, accessControlId, x: req.params.x, y: req.params.y, z: req.params.z }), channel);
        }
        if (!results) {
            context.res = {status: 204};
        } else {
            if (!results.rows) {
                context.res = { 'Content-Type': 'application/x-protobuf', body: results};
            } else {
                context.res = { 'Content-Type': 'application/json', body: featureCollection([feature(JSON.parse(results.rows[0].st_asgeojson))])};
            }
        }
       

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