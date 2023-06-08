// const { Client } = require('pg');
const { Pool } = require('pg');
const jwt = require('jsonwebtoken');
// let pgClient = null;
let pool = null;
const summaryDataService = require('./summaryDataService');

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
        // const result = await summaryDataService[req.params.heatmap][req.params.type].get(pgClient, req.query)
        const result = await summaryDataService[req.params.heatmap][req.params.type].get(pool, req.query)
        context.res = { 'Content-Type': 'application/json', body: result.rows}

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