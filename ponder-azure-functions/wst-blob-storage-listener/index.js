
const fs = require('fs');
const { Pool } = require('pg');
const copyFrom = require('pg-copy-streams').from;
const jwt = require('jsonwebtoken');
const { Readable } = require('stream');
let pool = null;

module.exports = async function (context, blob) {
    try {
        
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
        const client = await pool.connect(); // (function (err, client, done) {
        const done = () => client.release();
        const onError = err => {
            console.error(err);
            done();
          };        
            const stream = client.query(copyFrom(`COPY sh403a.webphone_sf_abs FROM STDIN (FORMAT 'csv')`));
            const readableStream = Readable.from(blob);
            readableStream.on('error', onError);
            stream.on('error', onError);
            stream.on('finish', done);
            readableStream.pipe(stream);
        // });
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

};