const { Pool } = require('pg');
const jwt = require('jsonwebtoken');
const configTypes = require('./configTypes');
let pool = null;

module.exports = async function (context, req) {

    try {
        let attuid = process.env.ATTUID || process.env.CACHE_BUILDER_ATTID;
        let accessControlId = process.env.ACCESS_CONTROL_ID || process.env.CACHE_BUILDER_ACCESS_CONTROL_ID;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development' && !req.body?.cacheBuilder) {
          const decoded = jwt.verify(req.headers['authorization'],process.env.SECRET);
          attuid = decoded.attuid;
          accessControlId = decoded.accessControlId;
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
        const result = req.params.channel ? await configTypes[req.params.configtypeid]["channels"][req.params.channel](pool, req.query) : await configTypes[req.params.configtypeid](pool, req.query);
        context.res = {
            status: 200, 
            body: result
        };
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