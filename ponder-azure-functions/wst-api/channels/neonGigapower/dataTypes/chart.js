const R = require('ramda');
const md5 = require('js-md5');
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');
// const blobService = require('../../../../wst-common/blobService');
// const TableCacheService = require('../../../../wst-common/TableCacheService');


module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {
    // const tableCacheService = new TableCacheService();
    const config = conf(process.env.GROUP_MEMBERSHIP);
    const { channel } = getParams;
    const whereClause = postParams.whereClause || sqlBuilder.whereClause(postParams, userAttributes);
    const blobNameQualifier = md5(postParams["chartKeys"] + whereClause.trim());
    // await tableCacheService.initService(channel, blobNameQualifier, whereClause, null, postParams["chartKeys"], null );
    const fetchDataSql = attribute =>
     `SELECT count(*) as count, ts.${config.accessGroupBasedSelectColumns[config.groupMembership][attribute] || attribute}  
     as ${attribute}
     FROM ${config.tableName} lus 
    inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
    WHERE  1=1 ${whereClause} 
    GROUP BY ts.${config.accessGroupBasedSelectColumns[config.groupMembership][attribute] || attribute}
    `;
    const containerName = `wst-data-cache-${channel.toLowerCase()}-chart`;
    // Create a unique name for the blob
    const blobName = `${blobNameQualifier}-${channel.toLowerCase()}-chart-data.json`;
    let blobText = null;


     /* blobText = await blobService.get(containerName, blobName, '', '');

      if (blobText) {
        return { d: JSON.parse(blobText)};
      } */

      const chartKeys = postParams["chartKeys"].split(',');
    const sqls = R.map(key =>  fetchDataSql(key), chartKeys);
    const batchSql = R.join(';', R.concat(R.values(sqls),[`select count(*) as count, 
    'Total Fiber Opportunities (as filtered)' as label from wst.neon_gigapower_fiber_addresses ts 
    inner join wst.neon_gigapower_psa lus 
     on ts.zip_co_psa = lus.zip_co_psa
   WHERE ts.fiber_customer=0 ${whereClause}`]));
    const result = await pgClient.query(batchSql);
    const response =  R.zipObj(R.concat(chartKeys,['addlInfo']), R.map(item => item.rows, result));
    // await blobService.put(containerName, blobName, JSON.stringify(response))
    return { d :response};
};