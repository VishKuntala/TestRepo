const { feature, featureCollection } =  require('@turf/helpers');
//const { Client } = require('pg');
const { Pool } = require('pg');
const jwt = require('jsonwebtoken');
const SphericalMercator = require('@mapbox/sphericalmercator');
const mercator = new SphericalMercator({size: 256});
//let pgClient = null;
let pool = null;
const mvtService = require('./mvtService');

module.exports = async function (context, req) {

    try {
        jwt.verify(req.headers['authorization'],process.env.SECRET);
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                //pgClient = new Client({ connectionString: process.env.FOT_PG_CONN_STRING});
                pool = new Pool({ connectionString: process.env.FOT_PG_CONN_STRING});
            } else {
                // pgClient = new Client({
                //     host: process.env.DB_HOST,
                //     user: process.env.DB_USER,
                //     password: process.env.DB_PASS,
                //     database: 'ponder',
                //     port: 5432,
                //     ssl: {rejectUnauthorized: false},
                // });
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
        let bbox = mercator.bbox(req.params.x, req.params.y, req.params.z, false);
        //const results = await mvtService[req.params.heatmap][req.params.type].mvt(bbox, pgClient, req.query);
        const results = await mvtService[req.params.heatmap][req.params.type].mvt(bbox, pool, req.query);
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