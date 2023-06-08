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
        let attuid = process.env.ATTUID;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
          const decoded = jwt.verify(req.headers['authorization'],process.env.SECRET);
          attuid = decoded.attuid;
        } 
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                // pgClient = new Client({ connectionString: process.env.WST_PG_CONN_STRING});
                pool = new Pool({ connectionString: process.env.FOT_PG_CONN_STRING});
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
        const channel = req.params.channel;    
        const result = await channels[channel]['dataTypes'][req.params.dataType](pool, req.body, Object.assign(req.query, { attuid, channel }), req.params.entityType);
        context.res = { 'Content-Type': 'application/json', body: result };        
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