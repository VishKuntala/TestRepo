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
      WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 ${whereClause()}`
    );

    const totalCount = totalCountResult.rows[0].total_count;
    const lastPage = Math.ceil(totalCount/(limit || defaultLimit));



    const result = await pgClient.query(`
    SELECT * FROM (
        SELECT  row_number() OVER (${sortClause()}) as ROWNUM, TBL1.* FROM 
        (SELECT VPGM, ARCHETYPE, DMA_NM, MIKEY, SIMPLE_COVERAGE_SCORE, FIVEG, BAND_14, AWB_CAPACITY_TEXT, latitude::text, longitude::text, 
          AWB_SPECTRUM_EFFICIENCY, GPON_STATUS, GPON_CUSTOMERS, '' as HYPERGIG, ATT_RANK_GWS, TMO_RANK_GWS, VZ_RANK_GWS, ATT_OOKLA_QUANTILE, TMO_RATIO_OOKLA_LTE, VERIZON_RATIO_OOKLA_LTE,
          POP_DENSITY_TEXT, HH_MEDIAN_INCOME_TEXT, ADDR, CITY, ST, ZIP, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_PHONE1,
          awb_cap_text_sort_column,awb_spec_eff_sort_column,gpon_status_sort_column,hypergig_sort_column,
                BAND_14_SORT_COLUMN,FIVEG_SORT_COLUMN, COVERAGE_SCORE_RANK
                FROM ${config.tableName}  WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 ${whereClause()}
                ) TBL1
      ) A  ${sortClause()} OFFSET ${offset} ${limitClause()}
  `);

  return {
    "locationCount": totalCount,
    "last_page": lastPage,
    "data": result.rows
  }

}
