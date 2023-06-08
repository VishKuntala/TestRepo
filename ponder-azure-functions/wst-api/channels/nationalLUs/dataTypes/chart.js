const R = require('ramda');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType) => {
    const whereClause = sqlBuilder.whereClause(postParams);
    const fetchDataSql = attribute =>
     `SELECT count(*) as count, ${attribute} from ${config.tableName}
    WHERE  1=1 ${whereClause} 
    GROUP BY ${attribute}
    `;
    const chartKeys = postParams["chartKeys"].split(',');
    const sqls = R.map(key =>  fetchDataSql(key), chartKeys);
    const batchSql = R.join(';', R.values(sqls));
    const result = await pgClient.query(batchSql);
    if (Array.isArray(result)) {
        const response =  R.zipObj(chartKeys, R.map(item => item.rows, result));
        return { d :response};
    } else {
        const response = {[postParams["chartKeys"]]: result.rows }
        return {d: response };
    }
};