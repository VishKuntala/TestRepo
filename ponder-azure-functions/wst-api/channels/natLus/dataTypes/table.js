const R = require('ramda');
const md5 = require('js-md5');
// const { TableClient, TableServiceClient, TableTransaction, odata } = require("@azure/data-tables");
const { odata } = require("@azure/data-tables");
const TableCacheService = require('../../../common/TableCacheService');
const config = require('../common/config');
const { sqlBuilder } = require('../common');


/* const tableService = TableServiceClient.fromConnectionString(
  process.env.AZURE_STORAGE_CONNECTION_STRING
); */

module.exports = async (pgClient, postParams, getParams, entityType) => {

  const tableCacheService = new TableCacheService();

  const { channel } = getParams;

  /* await tableService.createTable(channel);
  await tableService.createTable('wstCacheTracker');

  const tableClient = TableClient.fromConnectionString(
    process.env.AZURE_STORAGE_CONNECTION_STRING, channel
  );

  const cacheTrackerTableClient = TableClient.fromConnectionString(
    process.env.AZURE_STORAGE_CONNECTION_STRING, "wstCacheTracker"
  ); */
  
    const {
        sorters, filters, limit
      } = postParams;

    let { offset } = postParams;
    if (offset) {
        offset = (offset -1);
    } else {
        offset = 0;
    }


    const sortClause = () => {
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
        return ` ${sqlBuilder.whereClause(postParams)} ${filterClause()}`;
    }

    let currentPageResults = [];
    let totalCount = 0;
    let lastPage = 0;
    let rowsFromCache = [];

    const partitionKey = md5(sortClause().trim() + whereClause().trim());
    
    const rowKeyLowerLimit = `${(offset)*(limit)}`.padStart(9, '0');

    const rowKeyUpperLimit = `${(offset+1)*limit}`.padStart(9, '0');

   

    await tableCacheService.initService(channel, partitionKey, whereClause(), sortClause() );
    

    /* let summaryEntityDoesNotExist = false;

    let summaryEntity = null;

    let cacheTrackerEntity = null;

    let cacheTrackerEntityDoesNotExist = false;


  
    try {
      summaryEntity = await tableClient.getEntity(`${partitionKey}-summary`, "1");
    } catch (err) {
      summaryEntityDoesNotExist = (err.statusCode === 404);
    }
    

    try {
      cacheTrackerEntity = await cacheTrackerTableClient.getEntity(`${partitionKey}-${channel}`, "1");
    } catch (err) {
      cacheTrackerEntityDoesNotExist = (err.statusCode === 404);
    }

    if (cacheTrackerEntityDoesNotExist) {
      await cacheTrackerTableClient.createEntity({
        partitionKey: `${partitionKey}-${channel}`,
        rowKey: "1",
        whereClause: whereClause().trim(),
        sortClause: sortClause().trim(),
        requestCount: 1
      });
    } else {
      await cacheTrackerTableClient.updateEntity({
        partitionKey: `${partitionKey}-${channel}`,
        rowKey: "1",
        whereClause: whereClause().trim(),
        sortClause: sortClause().trim(),
        requestCount: cacheTrackerEntity.requestCount + 1
      });
    }
    */

    if (tableCacheService.summaryEntityDoesNotExist) {

      const totalCountResult = await  pgClient.query(
        `SELECT count(*) total_count FROM ${config.tableName} 
        WHERE 1=1 ${whereClause()}`
      );
  
      totalCount = totalCountResult.rows[0].total_count;


  
      const result = await pgClient.query(
              sortClause() === '' ? `
              SELECT
                    lus.id as rownum, mkt.vpgm_markt AS sales_market, dc.dma_name, address, city, st.state_abbr AS state, zipcode,
                    lus.ics_score_id, fvg.name AS fiveg, mmw.name AS fiveg_plus_mmwave, lus.fiveg_plus_speed,
                    fgpc.name AS fiveg_plus_cband, lus.cband_scs_id, cband_speed, b14.name AS band_14, fnt.name AS first_net,
                    shss.name AS sales_high_speed_suitability, rsc.name AS ran_suitability_cause, exp.name AS speed_experience,
                    lus.weighted_avg_tput, tput_min, tput_max, acp.name AS avail_capacity, cqi, spef.name AS spectrum_efficiency_12_pl,
                    weighted_avg_mcep_prbutl, rtxt.name AS roam_text, lus.roaming_rate, lus.coverage_radius, lus.coverage_score_rank,
                    lus.latitude::text, lus.longitude::text
                    FROM ${config.tableName} lus
                    INNER JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
                    INNER JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
                    INNER JOIN spatial.state st ON lus.state_id = st.gid
                    INNER JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
                    INNER JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
                    INNER JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
                    INNER JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
                    INNER JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
                    INNER JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
                    INNER JOIN wst.ref_ran_suitability_cause rsc ON lus.ran_suitability_cause_id = rsc.id
                    INNER JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
                    INNER JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
                    INNER JOIN wst.ref_spectrum_efficiency_12_pl spef ON lus.spectrum_efficiency_12_pl_id = spef.id
                    INNER JOIN wst.ref_roam_text rtxt ON lus.roam_text_id = rtxt.id
                    WHERE 1=1 ${whereClause()}
                    order by lus.id asc 
                    limit 5000 
            ` : `
              SELECT
                    lus.id as rownum, mkt.vpgm_markt AS sales_market, dc.dma_name, address, city, st.state_abbr AS state, zipcode,
                    lus.ics_score_id, fvg.name AS fiveg, mmw.name AS fiveg_plus_mmwave, lus.fiveg_plus_speed,
                    fgpc.name AS fiveg_plus_cband, lus.cband_scs_id, cband_speed, b14.name AS band_14, fnt.name AS first_net,
                    shss.name AS sales_high_speed_suitability, rsc.name AS ran_suitability_cause, exp.name AS speed_experience,
                    lus.weighted_avg_tput, tput_min, tput_max, acp.name AS avail_capacity, cqi, spef.name AS spectrum_efficiency_12_pl,
                    weighted_avg_mcep_prbutl, rtxt.name AS roam_text, lus.roaming_rate, lus.coverage_radius, lus.coverage_score_rank,
                    lus.latitude::text, lus.longitude::text
                    FROM ${config.tableName} lus
                    INNER JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
                    INNER JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
                    INNER JOIN spatial.state st ON lus.state_id = st.gid
                    INNER JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
                    INNER JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
                    INNER JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
                    INNER JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
                    INNER JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
                    INNER JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
                    INNER JOIN wst.ref_ran_suitability_cause rsc ON lus.ran_suitability_cause_id = rsc.id
                    INNER JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
                    INNER JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
                    INNER JOIN wst.ref_spectrum_efficiency_12_pl spef ON lus.spectrum_efficiency_12_pl_id = spef.id
                    INNER JOIN wst.ref_roam_text rtxt ON lus.roam_text_id = rtxt.id
                    WHERE 1=1 ${whereClause()} 
                    ${sortClause()}
                    limit 5000 
            `
          );
  
          const tableData = sortClause() === '' ? result.rows :  R.sortWith([
            R[`${sorters[0].dir}end`](R.prop(sorters[0].field)),
            R.ascend(R.prop('rownum'))
          ], result.rows);
         /* const batchedRows = R.splitEvery(100,tableData);
          for ( let i = 0; i < batchedRows.length; i += 1) {
                // Create a transaction
                const transaction = new TableTransaction();
                const batch = batchedRows[i];
                for ( let j = 0; j < batch.length; j += 1) {
                  const row = batch[j];
                  transaction.createEntity(Object.assign({
                    partitionKey,
                    rowKey: `${i*100 + j}`.padStart(9, '0'),
                  }, row));
                }
            const transactionResult = await tableClient.submitTransaction(transaction.actions);
          } */
          rowsFromCache = tableData;
          lastPage = Math.ceil(tableData.length / limit);
          const pagedRows = R.splitEvery(limit,tableData);
          currentPageResults = pagedRows[offset];
          /* await tableClient.createEntity({
            partitionKey: `${partitionKey}-summary`,
            rowKey: `1`,
            totalCount, lastPage
          }); */
          await tableCacheService.putInCache(tableData, partitionKey, totalCount, lastPage);
    } else {
      /* const entities = tableClient.listEntities(
        { 
          queryOptions: { 
            filter: odata`PartitionKey eq '${partitionKey}' and (RowKey ge '${rowKeyLowerLimit}' and RowKey lt '${rowKeyUpperLimit}')` 
          }
        });
  
      for await (const entity of entities) {
        rowsFromCache.push(entity)
      } */
      const  queryOptions = {
        filter: odata`PartitionKey eq '${partitionKey}' and (RowKey ge '${rowKeyLowerLimit}' and RowKey lt '${rowKeyUpperLimit}')` 
      }; 
      rowsFromCache = await tableCacheService.getFromCache(queryOptions);
      totalCount = tableCacheService.summaryEntity.totalCount;
      lastPage = tableCacheService.summaryEntity.lastPage;
      currentPageResults = rowsFromCache;
    }


    const functionResponse = {
      "locationCount": totalCount,
      "last_page": lastPage,
      "data": currentPageResults
    }
  return functionResponse

}