const R = require('ramda');
const md5 = require('js-md5');
const config = require('../common/config');
const { sqlBuilder } = require('../common');
const blobService = require('../../../common/blobService');
const TableCacheService = require('../../../common/TableCacheService');

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {
    const tableCacheService = new TableCacheService();
    const { channel } = getParams;
    const whereClause = postParams.whereClause || sqlBuilder.whereClause(postParams, userAttributes);
    const blobNameQualifier = md5(postParams["chartKeys"] + whereClause.trim());
    await tableCacheService.initService(channel, blobNameQualifier, whereClause, null, postParams["chartKeys"], null );
    const fetchDataSql = attribute =>
     `SELECT count(*) as count, ${attribute} from ${config.tableName} lus
     inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey 
    WHERE  1=1 ${whereClause} 
    GROUP BY ${attribute}
    `;
    const containerName = `wst-data-cache-${channel}-chart`;
    // Create a unique name for the blob
    const blobName = `${blobNameQualifier}-${channel}-chart-data.json`;
    let blobText = null;


    // if (!postParams.cacheBuilder) {
      blobText = await blobService.get(containerName, blobName, '', '');

      if (blobText) {
        return { d: JSON.parse(blobText)};
      }
    // }
    const chartKeys = postParams["chartKeys"].split(',');
    const sqls = R.map(key =>  fetchDataSql(key), chartKeys);
    const batchSql = R.join(';', R.concat(R.values(sqls),[
      `select sum(COALESCE(main1.total_opportunities_at_location, 0)) as count, 
      'Total Wireline Opportunities (as filtered)' as label  from ${config.tableName} main1,(SELECT distinct lus.mikey, lus.total_opportunities_at_location FROM ${config.tableName} lus 
        inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey
        WHERE 1=1 ${whereClause} ) subquery1
		  where subquery1.mikey = main1.mikey `
      ]
    ));
    const result = await pgClient.query(batchSql);
    const response =  R.zipObj(R.concat(chartKeys,['addlInfo']), R.map(item => item.rows, result));
    await blobService.put(containerName, blobName, '', '', JSON.stringify(response))
    return { d :response};
};