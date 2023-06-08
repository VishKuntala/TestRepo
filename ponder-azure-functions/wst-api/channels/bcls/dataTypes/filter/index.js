const R = require('ramda');
const config = require('../../common/config');
const { sqlBuilder } = require('../../common');

const fetchDataSql = (getParams, valueColumn,  nameColumn,  sortColumn,  sortDirection = "ASC") =>
{
    const searchString = getParams["q"]?.replace("undefined", "");
    const whereClause = sqlBuilder.whereClause(getParams);
    let sql;
    if (!searchString)
    {
            sql = `select distinct ${valueColumn} as value, ${nameColumn} as name from ${config.tableName} WHERE 1=1  `;
            sql = sql + whereClause;
    }
    else
    {
            sql = `select distinct ${valueColumn} as value, ${nameColumn} as name from ${config.tableName} WHERE LOWER(${nameColumn.toLowerCase()}) LIKE '${searchString.toLowerCase()}%'  `;
            sql = sql + whereClause;
    }
    sql = `${sql} AND ${valueColumn} IS NOT NULL ORDER BY ${sortColumn} ${sortDirection} `;
    return sql;
}

module.exports = async (pgClient, postParams, getParams, entityType) => {
    let result;
    let response;
    if (entityType) {
        const entityConfig = config.filterDataKeys[config.entityTypeMappings[entityType]];
        const sql = fetchDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, entityConfig.filterSortTableColumn);
        result = await pgClient.query(sql);
        response = result.rows;
    } else {
        const keysToBeRequeried = getParams["keysToBeRequeried"].split(',');
        const sqls = R.map(key => {
            const item = config.filterDataKeys[key];
            const sql = fetchDataSql(getParams, item.filterValueTableColumn, item.filterTextTableColumn, item.filterSortTableColumn);
            return sql;
        }, keysToBeRequeried);
        const batchSql = R.join(';', R.values(sqls));
        result = await pgClient.query(batchSql);
        if (Array.isArray(result)) {
            response =  R.zipObj(keysToBeRequeried, R.map(item => item.rows, result));
        } else {
            response = R.zipObj(keysToBeRequeried, [result.rows]);
        }
    }
    return {d : response}
} ;