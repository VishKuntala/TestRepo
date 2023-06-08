const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {

  const config = conf(process.env.GROUP_MEMBERSHIP);

   const result = await pgClient.query(
          `SELECT zip, isp_name, cnt, samples, dl_speed, ul_speed, latency FROM (SELECT * FROM
          (SELECT zip, isp_name, cnt, samples, dl_speed, ul_speed, latency, competitor_rank
          FROM wst.neon_rivals_competitor_zip_summary WHERE zip = '${entityType}'
          ORDER BY competitor_rank LIMIT 5
          ) a
        UNION ALL
        SELECT zip, isp_name, cnt, samples, dl_speed, ul_speed, latency, 6 AS competitor_rank
        FROM wst.neon_rivals_competitor_zip_summary WHERE zip = '${entityType}' AND isp_name = 'T-Mobile Hotspot'
        ORDER BY competitor_rank) B`
      );

      return result.rows;


}