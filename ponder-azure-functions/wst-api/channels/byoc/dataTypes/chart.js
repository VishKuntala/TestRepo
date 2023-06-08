const R = require('ramda');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType) => {
    const whereClause = sqlBuilder.whereClause(postParams);
    const fetchDataSql = attribute =>
     `SELECT count(*) as count, ${attribute} FROM WST.SALES_OPP_BYOC_DETAIL 
     INNER JOIN WST.SALES_OPP_BYOC_LIST ON WST.SALES_OPP_BYOC_DETAIL.BYOC_CLUSTER_ID = WST.SALES_OPP_BYOC_LIST.BYOC_CLUSTER_ID
    WHERE  COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != '0' ${whereClause} 
    GROUP BY ${attribute}
    `;
    const chartKeys = postParams["chartKeys"].split(',');
    const sqls = R.map(key =>  fetchDataSql(key), chartKeys);
    const batchSql = R.join(';', R.values(sqls));
    const result = await pgClient.query(batchSql);
    const response =  R.zipObj(chartKeys, R.map(item => item.rows, result));
    return { d :response};
};