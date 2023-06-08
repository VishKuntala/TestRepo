const R = require('ramda');
const config = require('../common/config');
const { sqlBuilder } = require('../common');
const blobService = require('../../../common/blobService');

module.exports = async (pgClient, postParams, getParams, entityType) => {
    const whereClause = sqlBuilder.whereClause(postParams);
    const fetchDataSql = attribute =>
     `SELECT count(*) as count, ${attribute} from ${config.tableName}
    WHERE  1=1 ${whereClause} 
    GROUP BY ${attribute}
    `;
    const containerName = `wst-data-cache-natlus-chart`;
    // Create a unique name for the blob
    const blobName = `natlus-chart-data.json`;

    const blobText = await blobService.get(containerName, blobName, '', whereClause);

    if (blobText) {
      return { d: JSON.parse(blobText)};
    }
    const chartKeys = postParams["chartKeys"].split(',');
    const sqls = R.map(key =>  fetchDataSql(key), chartKeys);
    const batchSql = R.join(';', R.values(sqls));
    const result = await pgClient.query(batchSql);
    const response =  R.zipObj(chartKeys, R.map(item => item.rows, result));
    await blobService.put(containerName, blobName, '', whereClause, JSON.stringify(response))
    return { d :response};
};