const { Pool } = require('pg');
const R = require('ramda');
const jwt = require('jsonwebtoken');
let pool = null;

const insertSearchResult = async (pool, searchResult, attuid, address) => {

    let serviceStatus = '';

    if (searchResult.match_quality === 'unacceptable') {

        serviceStatus = 'grey';

    }

    else if (searchResult.ics_score == 1) {

        serviceStatus = 'red';

    } else if (searchResult.ics_score == 2) {

        serviceStatus = 'yellow';

    } else {

        serviceStatus = 'green';

    }

    return pool.query(`INSERT INTO cmn.service_status_search_results(att_userid, service_status, service_address)

    VALUES

    ($1, $2, $3)`,[attuid, serviceStatus, address]);

}

const getMatchQuality = async (pool, postParams ) => {

    const { id, lat, lng, address, serviceType } = postParams;

    const streetNumber = address.split(' ')[0];

    const query = `with

    input_address as
    (
       select 
         ${lng}  lon,
         ${lat}   lat,
         '${streetNumber}'   street_number  
    )
    
    ,cache_result as
    (
    SELECT 
       (select street_number from input_address) street_number,
       geom <-> ST_Transform(ST_SetSRID(ST_MakePoint((select lon from input_address),(select lat from input_address)),4326),3857) as dist,
       c.street_number c_street_number,
       c.ics_score
    FROM ys460u.ics_cache_125m c
    ORDER BY dist
    limit 1
    )
    
    
    select 
        c.*,
        1 as dist_rank,
        case 
          when (dist < 25) and (street_number = c_street_number) then 'best'
          when dist < 25 then 'excellent'
          when dist < 50 then 'good'
          when dist < 75 then 'acceptable'
          when dist < 100 then 'marginal'
          when dist < 150 then 'poor'
          else 'unacceptable'
          end match_quality
    from cache_result c`;



    return pool.query(query);
}

module.exports = async function (context, req) {

    try {
        let attuid = process.env.ATTUID;
        if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
          const decoded = jwt.verify(req.headers['authorization'],process.env.SECRET);
          attuid = decoded.attuid;
        }
        if (!pool) {
            if (process.env.AZURE_FUNCTIONS_ENVIRONMENT !== 'Development') {
                pool = new Pool({ connectionString: process.env.SERVICESTATUS_PG_CONN_STRING});
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
        const result = await getMatchQuality(pool, req.body);
        if (result.rows) {

            await insertSearchResult(pool, result.rows[0], attuid, req.body.address );

        }
        context.res = { 'Content-Type': 'application/json', body: result.rows ? result.rows[0] : null };
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