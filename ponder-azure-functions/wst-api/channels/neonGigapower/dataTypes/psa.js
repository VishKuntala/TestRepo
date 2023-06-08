const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {

  const config = conf(process.env.GROUP_MEMBERSHIP);

   const result = await pgClient.query(
          `
          SELECT
          distinct(lus.id) as rownum, mkt.vpgm_markt AS sales_market, 
            dc.dma_name, lus.zip_co_psa, lus.fiber_customers, 
            lus.fiber_opportunity, lus.fiber_available, lus.fiber_percentage, 
            lus.fiber_customer_wireless_customer, lus.fiber_customer_no_wireless, 
            lus.wireless_customer_no_fiber, lus.no_fiber_no_wireless, st.state_abbr AS state, lus.zip,
            lus.wireless_customers, lus.wireless_percentage,
            lus.latitude::text, lus.longitude::text
            FROM ${config.tableName} lus 
            LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_gid = mkt.gid
            LEFT JOIN spatial.dma_county dc ON lus.dma_gid = dc.gid
            LEFT JOIN spatial.state st ON lus.state_gid = st.gid
          WHERE lus.zip_co_psa='${entityType}'
        `
      );

      return result.rows;


}