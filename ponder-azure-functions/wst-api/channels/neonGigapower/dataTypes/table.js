const R = require('ramda');
const md5 = require('js-md5');
const { odata } = require("@azure/data-tables");
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');
// const TableCacheService = require('../../../../wst-common/TableCacheService');



module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {
  const config = conf(process.env.GROUP_MEMBERSHIP);


  // const tableCacheService = new TableCacheService();

  const { channel } = getParams;

  const defaultLimit = 8;

    const {
        sorters, filters, limit, tableExport,
      } = postParams;

    let { offset } = postParams;
    if (offset) {
        offset = (offset -1);
    } else {
        offset = 0;
    }


    const sortClause = () => {
      if (postParams.sortClause) {
        return postParams.sortClause;
      }
        if (sorters && sorters.length) {
          return `ORDER BY ${sorters[0].field} ${sorters[0].dir}`
        }
        return ``;
    }
      
    const filterClause = () => {
        if (filters && filters.length) {
          return ` AND ( ${R.join(' OR ', R.map(item => `LOWER(${item.field}) like '%${item.value.toLowerCase()}%'`, 
          filters.length > 1 && Array.isArray(filters[1]) ? filters[1] : filters))} )`;
        }
        return '';
    }
    
    const limitClause = () => {
        if (!limit) {
          return '';
        } 
        return ` LIMIT ${limit}`;
    }
    
    const whereClause = () => {
      if (postParams.whereClause) {
        return postParams.whereClause;
      }
        return ` ${sqlBuilder.whereClause(postParams,userAttributes)} ${filterClause()}`;
    }

    const containerName = `wst-data-cache-${channel.toLowerCase()}-table`;
    // Create a unique name for the blob
    const blobName = `${channel.toLowerCase()}-table-data-${offset}.json`;

    
    let currentPageResults = [];
    let totalCount = 0;
    let businessCount = 0;
    let lastPage = 0;
    let rowsFromCache = [];

    const partitionKey = md5(sortClause().trim() + whereClause().trim());
    const partitionKeyWithOffset = `${md5(sortClause().trim() + whereClause().trim())}-${offset}`;

    const rowKeyLowerLimit = `${(offset)*(limit)}`.padStart(9, '0');

    const rowKeyUpperLimit = `${(offset+1)*limit}`.padStart(9, '0');

    // await tableCacheService.initService(channel, partitionKey, whereClause(), sortClause() );

    let summaryEntityDoesNotExist = false;

    let summaryEntity = null;

  

   // if (tableCacheService.summaryEntityDoesNotExist) {      
      const totalCountResult = await  pgClient.query(
        `SELECT count(*) total_count FROM ${config.tableName} lus 
        inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
        LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_gid = mkt.gid
        LEFT JOIN spatial.dma_county dc ON lus.dma_gid = dc.gid
        LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
        WHERE 1=1 ${whereClause()}`
      );
  
      totalCount = totalCountResult.rows[0].total_count;

      const businessCountResult = await  pgClient.query(
        `SELECT count(distinct lus.zip_co_psa) total_count FROM ${config.tableName} lus 
        inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
        LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_gid = mkt.gid
        LEFT JOIN spatial.dma_county dc ON lus.dma_gid = dc.gid
        LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
        WHERE 1=1 ${whereClause()}`
      );

      businessCount = businessCountResult.rows[0].total_count;
  
      const result = await pgClient.query(
              sortClause() === '' ? `
              SELECT
                    distinct(lus.id) as rownum, mkt.vpgm_markt AS sales_market, 
                    dc.dma_name, lus.zip_co_psa, lus.fiber_customers, 
                    lus.fiber_opportunity, lus.fiber_available, lus.fiber_percentage, 
                    lus.wireless_customers, lus.wireless_percentage,
                    lus.fiber_customer_wireless_customer, lus.fiber_customer_no_wireless, 
                    lus.wireless_customer_no_fiber, lus.no_fiber_no_wireless, st.state_abbr AS state, lus.zip,
                    lus.latitude::text, lus.longitude::text
                    FROM ${config.tableName} lus 
                    inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
                    LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_gid = mkt.gid
                    LEFT JOIN spatial.dma_county dc ON lus.dma_gid = dc.gid
                    LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
                    LEFT JOIN spatial.state st ON lus.state_gid = st.gid
                    WHERE 1=1  ${whereClause()}
                    order by lus.id asc 
                    limit 5000 
            ` : `
            SELECT
            distinct(lus.id) as rownum, mkt.vpgm_markt AS sales_market, 
            dc.dma_name, lus.zip_co_psa, lus.fiber_customers, 
            lus.fiber_opportunity, lus.fiber_available, lus.fiber_percentage, 
            lus.wireless_customers, lus.wireless_percentage,
            lus.fiber_customer_wireless_customer, lus.fiber_customer_no_wireless, 
            lus.wireless_customer_no_fiber, lus.no_fiber_no_wireless, st.state_abbr AS state, lus.zip,
            lus.latitude::text, lus.longitude::text
            FROM ${config.tableName} lus 
            inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
            LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_gid = mkt.gid
            LEFT JOIN spatial.dma_county dc ON lus.dma_gid = dc.gid
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN spatial.state st ON lus.state_gid = st.gid
            WHERE 1=1  ${whereClause()} 
              ${sortClause()}
              limit 5000 
            `
          );
  
          const tableData = sortClause() === '' ? result.rows :  R.sortWith([
            R[`${sorters[0].dir}end`](R.prop(sorters[0].field)),
            R.ascend(R.prop('rownum'))
          ], result.rows);
          rowsFromCache = tableData;
          lastPage = Math.ceil(tableData.length / limit);
          const pagedRows = R.splitEvery(limit,tableData);
          currentPageResults = pagedRows[offset];
          // await tableCacheService.putInCache(tableData, partitionKey, totalCount, lastPage, businessCount);
   // } else {

     /* const  queryOptions = {
        filter: tableExport ? odata`PartitionKey eq '${partitionKey}'`  : odata`PartitionKey eq '${partitionKey}' and (RowKey ge '${rowKeyLowerLimit}' and RowKey lt '${rowKeyUpperLimit}')` 
      }; 
      rowsFromCache = await tableCacheService.getFromCache(queryOptions);
      totalCount = tableCacheService.summaryEntity.totalCount;
      businessCount = tableCacheService.summaryEntity.businessCount;
      lastPage = tableCacheService.summaryEntity.lastPage;
      currentPageResults = rowsFromCache; */
   // }



    const functionResponse = {
      "locationCount": totalCount,
      "businessCount": businessCount,
      "last_page": lastPage,
      "data": currentPageResults
    }

    return functionResponse

}