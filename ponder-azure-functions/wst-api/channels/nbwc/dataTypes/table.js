const R = require('ramda');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType) => {

    const defaultLimit = 8;

    const {
        sorters, filters, limit, sortCriteria, sortDirection
      } = postParams;

    let { offset } = postParams;
    if (offset) {
        offset = (offset -1)*limit;
    } else {
        offset = 0;
    }

    const sortClause = () => {
        if (sorters && sorters.length) {
          return `ORDER BY ${sorters[0].field} ${sorters[0].dir}, COVERAGE_SCORE_RANK ASC`
        }
        return `ORDER BY ${sortCriteria} ${sortDirection}, COVERAGE_SCORE_RANK ASC`;
    }
      
    const filterClause = () => {
        if (filters && filters.length) {
          return R.join(' OR ', R.map(item => `LOWER(${item.field}) like '%${item.value.toLowerCase()}%'`, 
          filters.length > 1 && Array.isArray(filters[1]) ? filters[1] : filters));
        }
        return '1=1';
    }
    
    const limitClause = () => {
        if (!limit) {
          return '';
        } 
        return ` LIMIT ${limit}`;
    }
    
    const whereClause = () => {
       
        return ` ${sqlBuilder.whereClause(postParams)} AND (${filterClause()})`;
    }

    const totalCountResult = await  pgClient.query(
      `SELECT count(*) total_count FROM ${config.tableName} 
      WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 ${whereClause()}`
    );

    const totalCount = totalCountResult.rows[0].total_count;
    const lastPage = Math.ceil(totalCount/(limit || defaultLimit));

    const result = await pgClient.query(`
    SELECT * FROM (
        SELECT  row_number() OVER (${sortClause()}) as ROWNUM, TBL1.* FROM 
        (SELECT CAMPAIGN_ID, CASE WHEN CAMPAIGN_ID = '1-33735165693' THEN '2T21 Grow Mobility Add A Line'
        WHEN CAMPAIGN_ID = '1-33735165652' THEN '2T21 Acquire Mobility Existing Wireline'
        WHEN CAMPAIGN_ID = '1-33735165636' THEN '2T21 Acquire Mobility Port Outs'
        WHEN CAMPAIGN_ID = '1-33735165719' THEN '2T21 Acquire Mobility Fiber Fast Follow'
        WHEN CAMPAIGN_ID = '1-33735165667' THEN '2T21 Acquire Mobility New Logo'
        WHEN CAMPAIGN_ID = '1-33761622514' THEN '2T21 Grow Top Mobility'
        WHEN CAMPAIGN_ID = '1-33735165706' THEN '2T21 Grow FAN Fast Follow' 
        WHEN CAMPAIGN_ID = '1-35275858218' THEN '2T21 Grow Mobility Voice'
        END AS CAMPAIGN_NAME, 
                       COVERAGE_SCORE, FIVEG, FIVEG_PLUS,
                       TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, CONTACT_COMPANY_NM, CITY_NM, STATE_Y, POSTL_CD, 
                       latitude::text, longitude::text,
                       LOCATION_ID, CONTACT_PHONE1, CONTACT_FIRST_NM, CONTACT_LAST_NM, COVERAGE_SCORE_RANK,
                       NUMERIC_OF_EMPLOYEES::FLOAT8 AS NUMBER_OF_EMPLOYEES,
                       roam_text_sort_column,tput_text_sort_column,fiber_cust_sort_column,band_14_sort_column,
                       fiveg_sort_column,fiveg_plus_sort_column,first_net_sort_column
                FROM ${config.tableName}  WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 ${whereClause()}
                ) TBL1
      ) A  ${sortClause()} OFFSET ${offset} ${limitClause()}
  `);

  return {
    "locationCount": totalCount,
    "last_page": lastPage,
    "data": result.rows
  }

}
