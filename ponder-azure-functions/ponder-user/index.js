// const { Client } = require('pg');
const { Pool } = require('pg');
const jwt = require('jsonwebtoken');
// let pgClient = null;
let pool = null;
const userService = require('./userService');

module.exports = async function (context, req) {

    try {
        let attuid = process.env.ATTUID;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
          const decoded = jwt.verify(req.headers['authorization'],process.env.SECRET);
          attuid = decoded.attuid;
        } 
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                // pgClient = new Client({ connectionString: process.env.PG_CONN_STRING});
                pool = new Pool({ connectionString: process.env.PG_CONN_STRING});
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
        // const results = await userService[req.params.accessGroup ? 'accessGroups' : 'get'](pgClient, attuid, req.params.accessGroup);
        const results = await userService[req.params.accessGroup ? 'accessGroups' : 'get'](pool, attuid, req.params.accessGroup);
        context.res = { 'Content-Type': 'application/json', body: results.rows[0] };

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