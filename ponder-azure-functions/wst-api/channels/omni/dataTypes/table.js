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
      WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != '0' ${whereClause()}`
    );

    const totalCount = totalCountResult.rows[0].total_count;
    const lastPage = Math.ceil(totalCount/(limit || defaultLimit));

    const result = await pgClient.query(`
    SELECT * FROM (
        SELECT  row_number() OVER (${sortClause()}) as ROWNUM, TBL1.* FROM 
        (SELECT coverage_score_rank,svid, svid_name,coverage_score, latitude::text, longitude::text, 
          FIVEG, BAND_14, FIRST_NET, ROAM_TEXT, SM_ATTUID, OWNING_ATTUID,FIVEG_PLUS,TPUT_TEXT,FIBER_CUST,
          ADDR,CITY,STATE_Y,ZIPCODE,ROAM_TEXT_SORT_COLUMN,TPUT_TEXT_SORT_COLUMN,FIBER_CUST_SORT_COLUMN,
                BAND_14_SORT_COLUMN,FIVEG_SORT_COLUMN,FIVEG_PLUS_SORT_COLUMN,FIRST_NET_SORT_COLUMN
                FROM ${config.tableName}  WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != '0' ${whereClause()}
                ) TBL1
      ) A  ${sortClause()} OFFSET ${offset} ${limitClause()}
  `);

  return {
    "locationCount": totalCount,
    "last_page": lastPage,
    "data": result.rows
  }

}
