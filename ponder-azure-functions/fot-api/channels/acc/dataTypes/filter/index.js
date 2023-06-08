const R = require('ramda');
const config = require('../../common/config');
const { sqlBuilder } = require('../../common');

const fetchDataSql = (getParams, valueColumn,  nameColumn,  sortColumn, joinClause, filterTable, sortDirection = "ASC") =>
{
    const searchString = getParams["q"]?.replace("undefined", "");
    const whereClause = sqlBuilder.whereClause(getParams);
 
    return ` select distinct ${valueColumn}::text as value,  ${nameColumn} as name, ${sortColumn} from ${filterTable} lus
                WHERE ${searchString ? `LOWER(${nameColumn.toLowerCase()}) LIKE '${searchString.toLowerCase()}%'` : `1=1`}  
                ${whereClause}
                AND ${valueColumn} IS NOT NULL
    order by ${sortColumn}`;
}

module.exports = async (pgClient, postParams, getParams, entityType) => {
    let result;
    let response;
    let sql = '';
    if (entityType) {
        const entityConfig = config.filterDataKeys[config.entityTypeMappings[entityType]];     
            
            sql = fetchDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, 
                entityConfig.filterSortTableColumn, entityConfig.joinClause, config.tableName);


        result = await pgClient.query(sql);
        response = result.rows;
    } else {
        const keysToBeRequeried = getParams["keysToBeRequeried"].split(',');
        const sqls = R.map(key => {
            const item = config.filterDataKeys[key];
           
                return fetchDataSql(getParams, item.filterValueTableColumn, item.filterTextTableColumn, item.filterSortTableColumn, item.joinClause, config.tableName);

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