// const { Client } = require('pg');
const { Pool } = require('pg');
const jwt = require('jsonwebtoken');
// let pgClient = null;
let pool = null;
const pointDataService = require('./pointDataService');
const { point, featureCollection } =  require('@turf/helpers');
const R = require('ramda');

module.exports = async function (context, req) {

    try {
        jwt.verify(req.headers['authorization'],process.env.SECRET);
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                // pgClient = new Client({ connectionString: process.env.FOT_PG_CONN_STRING});
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
        const pointId = req.params.id;
        const searchId = req.query.searchId;
        let result = [];
        if (pointId) {
            // result = await pointDataService[req.params.type].point(pgClient, pointId, req.query);
            result = await pointDataService[req.params.type].point(pool, pointId, req.query);
        } else {
            // result = searchId ? await pointDataService[req.params.type].search(pgClient, req.query)
            // : await pointDataService[req.params.type].points(pgClient, req.query);
            result = searchId ? await pointDataService[req.params.type].search(pool, req.query)
            : await pointDataService[req.params.type].points(pool, req.query);
        }
        if (searchId) {
            context.res = { 'Content-Type': 'application/json', body: result.rows}
        } else {
            if (result.rows) {
                const geojsonResult = featureCollection(R.map(p => point(p.point, p.props), R.map(item => {
                    return { point: R.props(['longitude', 'latitude'], item), props: item };
                }, result.rows)));
                context.res = { 'Content-Type': 'application/json', body: geojsonResult};
            } else {
                context.res = { 'Content-Type': 'application/json', body: result};
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