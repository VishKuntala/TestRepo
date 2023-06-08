const R = require('ramda');
const md5 = require('js-md5');
// const { TableClient, TableServiceClient, TableTransaction, odata } = require("@azure/data-tables");
const { odata } = require("@azure/data-tables");
const TableCacheService = require('../../../common/TableCacheService');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

// const blobService = require('../../../common/blobService');
/* const tableService = TableServiceClient.fromConnectionString(
  process.env.AZURE_STORAGE_CONNECTION_STRING
); */

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {
  /*await tableService.createTable('bclsv2');

  const tableClient = TableClient.fromConnectionString(
    process.env.AZURE_STORAGE_CONNECTION_STRING, "bclsv2"
  ); */

  const tableCacheService = new TableCacheService();

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

    const containerName = `wst-data-cache-bclsv2-table`;
    // Create a unique name for the blob
    const blobName = `bclsv2-table-data-${offset}.json`;

    // const blobText = await blobService.get(containerName, blobName, sortClause(), whereClause());

    let currentPageResults = [];
    let totalCount = 0;
    let businessCount = 0;
    let lastPage = 0;
    let rowsFromCache = [];

    const partitionKey = md5(sortClause().trim() + whereClause().trim());
    const partitionKeyWithOffset = `${md5(sortClause().trim() + whereClause().trim())}-${offset}`;

    const rowKeyLowerLimit = `${(offset)*(limit)}`.padStart(9, '0');

    const rowKeyUpperLimit = `${(offset+1)*limit}`.padStart(9, '0');

    await tableCacheService.initService(channel, partitionKey, whereClause(), sortClause() );

    let summaryEntityDoesNotExist = false;

    let summaryEntity = null;


  
   /* try {
      summaryEntity = await tableClient.getEntity(`${partitionKey}-summary`, "1");
    } catch (err) {
      summaryEntityDoesNotExist = (err.statusCode === 404);
    } */


    // if (tableCacheService.summaryEntityDoesNotExist || postParams.cacheBuilder) {
    if (tableCacheService.summaryEntityDoesNotExist) {      
      const totalCountResult = await  pgClient.query(
        `SELECT count(*) total_count FROM ${config.tableName} lus 
        inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey 
        LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
        LEFT JOIN wst.ref_bb_archetype arch on lus.archetype_id = arch.id
        LEFT JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
        LEFT JOIN spatial.state st ON lus.state_id = st.gid
        LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
        LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
        LEFT JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
        LEFT JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
        LEFT JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
        LEFT JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
        LEFT JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
        LEFT JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
        LEFT JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
        LEFT JOIN wst.ref_alternative mgig on lus.multigig_id = mgig.id
        LEFT JOIN wst.ref_bb_fiber_status_report_rows fibstatus on lus.fiber_status_report_rows_id = fibstatus.id
        LEFT JOIN wst.ref_bb_future_fiber_status futurefiberstatus on lus.future_fiber_status_id = futurefiberstatus.id
        LEFT JOIN wst.ref_bb_eligible_max_speed eligmaxspeed on lus.bb_eligible_max_speed_id = eligmaxspeed.id
        LEFT JOIN wst.ref_alternative fibcomp on lus.fiber_competitor_any_id = fibcomp.id
        LEFT JOIN wst.ref_alternative mtnt on lus.multi_tenant_id = mtnt.id
        LEFT JOIN wst.ref_alternative newlitgpon on lus.newly_lit_gpon_id = newlitgpon.id    
        LEFT JOIN wst.ref_bb_pct_hispanic pcthispanic on lus.pct_hispanic_id = pcthispanic.id
        LEFT JOIN wst.ref_bb_att_ookla_quintile attookla on lus.att_ookla_quintile_id = attookla.id
        LEFT JOIN wst.ref_bb_tmovzn_ratio tmo on lus.tmo_ratio_ookla_id = tmo.id
        LEFT JOIN wst.ref_bb_tmovzn_ratio vzn on lus.vzn_ratio_ookla_id = vzn.id
        LEFT JOIN wst.ref_bb_pop_denisty_quintile popden on lus.pop_density_zip_id = popden.id
        LEFT JOIN wst.ref_bb_median_income medinc on lus.median_income_id = medinc.id
        LEFT JOIN wst.ref_bb_total_customers_at_location totcustatloc on lus.total_customers_at_location_id = totcustatloc.id
        LEFT JOIN wst.ref_bb_non_fiber_customers_at_location nonfibercust on lus.non_fiber_customers_at_location_id = nonfibercust.id
        LEFT JOIN wst.ref_bb_total_opportunities_at_location totopploc on lus.total_opportunities_at_location_id = totopploc.id
        LEFT JOIN wst.ref_bb_total_employees_here totemplhere ON lus.total_employees_here_id = totemplhere.id
        LEFT JOIN sot.sales_att_store_loc_prod attstore on lus.location_id = attstore.location_id
        WHERE 1=1 ${whereClause()}`
      );
  
      totalCount = totalCountResult.rows[0].total_count;

      const businessCountResult = await  pgClient.query(
        `SELECT count(distinct lus.mikey) total_count FROM ${config.tableName} lus 
        inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey 
        LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
        LEFT JOIN wst.ref_bb_archetype arch on lus.archetype_id = arch.id
        LEFT JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
        LEFT JOIN spatial.state st ON lus.state_id = st.gid
        LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
        LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
        LEFT JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
        LEFT JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
        LEFT JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
        LEFT JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
        LEFT JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
        LEFT JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
        LEFT JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
        LEFT JOIN wst.ref_alternative mgig on lus.multigig_id = mgig.id
        LEFT JOIN wst.ref_bb_fiber_status_report_rows fibstatus on lus.fiber_status_report_rows_id = fibstatus.id
        LEFT JOIN wst.ref_bb_future_fiber_status futurefiberstatus on lus.future_fiber_status_id = futurefiberstatus.id
        LEFT JOIN wst.ref_bb_eligible_max_speed eligmaxspeed on lus.bb_eligible_max_speed_id = eligmaxspeed.id
        LEFT JOIN wst.ref_alternative fibcomp on lus.fiber_competitor_any_id = fibcomp.id
        LEFT JOIN wst.ref_alternative mtnt on lus.multi_tenant_id = mtnt.id
        LEFT JOIN wst.ref_alternative newlitgpon on lus.newly_lit_gpon_id = newlitgpon.id 
        LEFT JOIN wst.ref_bb_pct_hispanic pcthispanic on lus.pct_hispanic_id = pcthispanic.id
        LEFT JOIN wst.ref_bb_att_ookla_quintile attookla on lus.att_ookla_quintile_id = attookla.id
        LEFT JOIN wst.ref_bb_tmovzn_ratio tmo on lus.tmo_ratio_ookla_id = tmo.id
        LEFT JOIN wst.ref_bb_tmovzn_ratio vzn on lus.vzn_ratio_ookla_id = vzn.id
        LEFT JOIN wst.ref_bb_pop_denisty_quintile popden on lus.pop_density_zip_id = popden.id
        LEFT JOIN wst.ref_bb_median_income medinc on lus.median_income_id = medinc.id
        LEFT JOIN wst.ref_bb_total_customers_at_location totcustatloc on lus.total_customers_at_location_id = totcustatloc.id
        LEFT JOIN wst.ref_bb_non_fiber_customers_at_location nonfibercust on lus.non_fiber_customers_at_location_id = nonfibercust.id
        LEFT JOIN wst.ref_bb_total_opportunities_at_location totopploc on lus.total_opportunities_at_location_id = totopploc.id
        LEFT JOIN wst.ref_bb_total_employees_here totemplhere ON lus.total_employees_here_id = totemplhere.id
        LEFT JOIN sot.sales_att_store_loc_prod attstore on lus.location_id = attstore.location_id
        WHERE 1=1 ${whereClause()}`
      );

      businessCount = businessCountResult.rows[0].total_count;
  
      const result = await pgClient.query(
              sortClause() === '' ? `
              SELECT
                    distinct(lus.id) as rownum, mkt.vpgm_markt AS sales_market, arch.name as archetype, 
                    dc.dma_name, lus.mikey::text, address, split_part(address, ' ', 1) as address_number,
                    SUBSTR(address, STRPOS(address, ' ') + 1) as street_name, lus.city, st.state_abbr AS state, zipcode,
                    cov.name as simple_coverage_score, fvg.name AS fiveg, mmw.name AS fiveg_plus_mmwave, 
                    fgpc.name AS fiveg_plus_cband,  b14.name AS band_14, fnt.name AS first_net,
                    shss.name AS sales_high_speed_suitability,  exp.name AS speed_experience,
                    acp.name AS avail_capacity,mgig.name as multigig,fibstatus.name as fiber_status,
                    futurefiberstatus.name as future_fiber_status,
                    eligmaxspeed.name as eligible_max_speed, fibcomp.name as fiber_competitor_any,
                    mtnt.name as multi_tenant, COALESCE(newlitgpon.name,'n/a') as newly_lit_gpon,
                    attookla.name as att_ookla_quintile,tmo.name as tmo_ratio_ookla,
                    vzn.name as vzn_ratio_ookla,popden.name as pop_density_zip,medinc.name as median_income,
                    pcthispanic.name as percentHispanic, totopploc.name as total_opportunities_at_location,
                    totcustatloc.name as total_customers_at_location, nonfibercust.name as non_fiber_customers_at_location,
                    totemplhere.name as total_employees_here,
                    lus.latitude::text, lus.longitude::text, COALESCE(lus.any_fiber_lit_yearmo::text,'n/a') as any_fiber_lit_yearmo, lus.wcpsa as psa,
                    lus.location_id, attstore.location_name, fiber_pid
                    FROM ${config.tableName} lus
                    inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey 
                    LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
                    LEFT JOIN wst.ref_bb_archetype arch on lus.archetype_id = arch.id
                    LEFT JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
                    LEFT JOIN spatial.state st ON lus.state_id = st.gid
                    LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
                    LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
                    LEFT JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
                    LEFT JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
                    LEFT JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
                    LEFT JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
                    LEFT JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
                    LEFT JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
                    LEFT JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
                    LEFT JOIN wst.ref_alternative mgig on lus.multigig_id = mgig.id
                    LEFT JOIN wst.ref_bb_fiber_status_report_rows fibstatus on lus.fiber_status_report_rows_id = fibstatus.id
                    LEFT JOIN wst.ref_bb_future_fiber_status futurefiberstatus on lus.future_fiber_status_id = futurefiberstatus.id
                    LEFT JOIN wst.ref_bb_eligible_max_speed eligmaxspeed on lus.bb_eligible_max_speed_id = eligmaxspeed.id
                    LEFT JOIN wst.ref_alternative fibcomp on lus.fiber_competitor_any_id = fibcomp.id
                    LEFT JOIN wst.ref_alternative mtnt on lus.multi_tenant_id = mtnt.id
                    LEFT JOIN wst.ref_alternative newlitgpon on lus.newly_lit_gpon_id = newlitgpon.id
                    LEFT JOIN wst.ref_bb_pct_hispanic pcthispanic on lus.pct_hispanic_id = pcthispanic.id
                    LEFT JOIN wst.ref_bb_att_ookla_quintile attookla on lus.att_ookla_quintile_id = attookla.id
                    LEFT JOIN wst.ref_bb_tmovzn_ratio tmo on lus.tmo_ratio_ookla_id = tmo.id
                    LEFT JOIN wst.ref_bb_tmovzn_ratio vzn on lus.vzn_ratio_ookla_id = vzn.id
                    LEFT JOIN wst.ref_bb_pop_denisty_quintile popden on lus.pop_density_zip_id = popden.id
                    LEFT JOIN wst.ref_bb_median_income medinc on lus.median_income_id = medinc.id
                    LEFT JOIN wst.ref_bb_total_customers_at_location totcustatloc on lus.total_customers_at_location_id = totcustatloc.id
                    LEFT JOIN wst.ref_bb_non_fiber_customers_at_location nonfibercust on lus.non_fiber_customers_at_location_id = nonfibercust.id
                    LEFT JOIN wst.ref_bb_total_opportunities_at_location totopploc on lus.total_opportunities_at_location_id = totopploc.id
                    LEFT JOIN wst.ref_bb_total_employees_here totemplhere ON lus.total_employees_here_id = totemplhere.id
                    LEFT JOIN sot.sales_att_store_loc_prod attstore on lus.location_id = attstore.location_id
                    WHERE 1=1  ${whereClause()}
                    order by lus.id asc 
                    limit 5000 
            ` : `
            SELECT
            distinct(lus.id) as rownum, mkt.vpgm_markt AS sales_market, arch.name as archetype, 
            dc.dma_name, lus.mikey::text, address, split_part(address, ' ', 1) as address_number,
            SUBSTR(address, STRPOS(address, ' ') + 1) as street_name, lus.city, st.state_abbr AS state, zipcode,
            cov.name as simple_coverage_score, fvg.name AS fiveg, mmw.name AS fiveg_plus_mmwave, 
            fgpc.name AS fiveg_plus_cband,  b14.name AS band_14, fnt.name AS first_net,
            shss.name AS sales_high_speed_suitability,  exp.name AS speed_experience,
            acp.name AS avail_capacity,mgig.name as multigig,fibstatus.name as fiber_status,
            futurefiberstatus.name as future_fiber_status,
            eligmaxspeed.name as eligible_max_speed, fibcomp.name as fiber_competitor_any,
            mtnt.name as multi_tenant, COALESCE(newlitgpon.name,'n/a') as newly_lit_gpon,
            attookla.name as att_ookla_quintile,tmo.name as tmo_ratio_ookla,
            vzn.name as vzn_ratio_ookla,popden.name as pop_density_zip,medinc.name as median_income,
            pcthispanic.name as percentHispanic, totopploc.name as total_opportunities_at_location,
            totcustatloc.name as total_customers_at_location, nonfibercust.name as non_fiber_customers_at_location,
            totemplhere.name as total_employees_here,
            lus.latitude::text, lus.longitude::text, COALESCE(lus.any_fiber_lit_yearmo::text,'n/a') as any_fiber_lit_yearmo, lus.wcpsa as psa,
            lus.location_id, attstore.location_name, fiber_pid
            FROM ${config.tableName} lus
            inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey 
            LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
            LEFT JOIN wst.ref_bb_archetype arch on lus.archetype_id = arch.id
            LEFT JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
            LEFT JOIN spatial.state st ON lus.state_id = st.gid
            LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
            LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
            LEFT JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
            LEFT JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
            LEFT JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
            LEFT JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
            LEFT JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
            LEFT JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
            LEFT JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
            LEFT JOIN wst.ref_alternative mgig on lus.multigig_id = mgig.id
            LEFT JOIN wst.ref_bb_fiber_status_report_rows fibstatus on lus.fiber_status_report_rows_id = fibstatus.id
            LEFT JOIN wst.ref_bb_future_fiber_status futurefiberstatus on lus.future_fiber_status_id = futurefiberstatus.id
            LEFT JOIN wst.ref_bb_eligible_max_speed eligmaxspeed on lus.bb_eligible_max_speed_id = eligmaxspeed.id
            LEFT JOIN wst.ref_alternative fibcomp on lus.fiber_competitor_any_id = fibcomp.id
            LEFT JOIN wst.ref_alternative mtnt on lus.multi_tenant_id = mtnt.id
            LEFT JOIN wst.ref_alternative newlitgpon on lus.newly_lit_gpon_id = newlitgpon.id
            LEFT JOIN wst.ref_bb_pct_hispanic pcthispanic on lus.pct_hispanic_id = pcthispanic.id
            LEFT JOIN wst.ref_bb_att_ookla_quintile attookla on lus.att_ookla_quintile_id = attookla.id
            LEFT JOIN wst.ref_bb_tmovzn_ratio tmo on lus.tmo_ratio_ookla_id = tmo.id
            LEFT JOIN wst.ref_bb_tmovzn_ratio vzn on lus.vzn_ratio_ookla_id = vzn.id
            LEFT JOIN wst.ref_bb_pop_denisty_quintile popden on lus.pop_density_zip_id = popden.id
            LEFT JOIN wst.ref_bb_median_income medinc on lus.median_income_id = medinc.id
            LEFT JOIN wst.ref_bb_total_customers_at_location totcustatloc on lus.total_customers_at_location_id = totcustatloc.id
            LEFT JOIN wst.ref_bb_non_fiber_customers_at_location nonfibercust on lus.non_fiber_customers_at_location_id = nonfibercust.id
            LEFT JOIN wst.ref_bb_total_opportunities_at_location totopploc on lus.total_opportunities_at_location_id = totopploc.id
            LEFT JOIN wst.ref_bb_total_employees_here totemplhere ON lus.total_employees_here_id = totemplhere.id
            LEFT JOIN sot.sales_att_store_loc_prod attstore on lus.location_id = attstore.location_id
            WHERE 1=1  ${whereClause()} 
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
                  row.rownum = (i)*100 + (j+1);
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
            totalCount, lastPage, businessCount
          }); */
          await tableCacheService.putInCache(tableData, partitionKey, totalCount, lastPage, businessCount);
    } else {
      /* const entities = tableClient.listEntities(
        { 
          queryOptions: { 
            filter: tableExport ? odata`PartitionKey eq '${partitionKey}'`  :
            odata`PartitionKey eq '${partitionKey}' and (RowKey ge '${rowKeyLowerLimit}' and RowKey lt '${rowKeyUpperLimit}')` 
          }
        });
  
      for await (const entity of entities) {
        rowsFromCache.push(entity)
      }
      totalCount = summaryEntity.totalCount;
      businessCount = summaryEntity.businessCount;
      lastPage = summaryEntity.lastPage;
      currentPageResults = rowsFromCache; */

      const  queryOptions = {
        filter: tableExport ? odata`PartitionKey eq '${partitionKey}'`  : odata`PartitionKey eq '${partitionKey}' and (RowKey ge '${rowKeyLowerLimit}' and RowKey lt '${rowKeyUpperLimit}')` 
      }; 
      rowsFromCache = await tableCacheService.getFromCache(queryOptions);
      totalCount = tableCacheService.summaryEntity.totalCount;
      businessCount = tableCacheService.summaryEntity.businessCount;
      lastPage = tableCacheService.summaryEntity.lastPage;
      currentPageResults = rowsFromCache;
    }

   /* if (blobText) {
      return JSON.parse(blobText);
    } */




    const functionResponse = {
      "locationCount": totalCount,
      "businessCount": businessCount,
      "last_page": lastPage,
      "data": currentPageResults
    }
    /* if (sortClause().trim() === '' && whereClause().trim() === '') {
      const data = JSON.stringify(functionResponse);
      await blobService.put(containerName, blobName, sortClause(), whereClause(), data);
    } */
  return functionResponse

}