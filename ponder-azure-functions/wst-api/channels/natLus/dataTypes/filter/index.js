const R = require('ramda');
const config = require('../../common/config');
const { sqlBuilder } = require('../../common');

const sansLocationFilters = getParams => 
    R.trim(R.join('',R.values(R.pick(['salesMarket', 'dmaName', 'statecode', 'zipcode'], getParams)))) === '';

const sansNonLocationFilters = getParams => 
    R.trim(R.join('',R.values(R.pick(['statecode', 'zipcode', 'indoorCovScore', 'fiveg','fivegplus',
'cband','band14','fnet','wbbSuitabilityIcs','ranCause','speedExperienceIcs','weightedAvgTuputGrp',
'availCapacity','roamText','cqiGrp','spectrumEff12Pl','cbandScs','weightedAvgMcepPrbUtlGrp'], getParams)))) === '';    

const isOnlyLocationBasedFilters = (keysToBeRequeried, getParams) => (R.without(
    [ 'salesMarket', 'dmaName', 'statecode', 'zipcode' ], keysToBeRequeried)).length === 0 && sansNonLocationFilters(getParams);

const isLocationBasedEntity = (entityType,getParams) => R.includes(entityType, 
    [ 'salesMarket', 'dmaName', 'statecode', 'zipcode' ]) && sansNonLocationFilters(getParams);

const fetchDataSql = (getParams, valueColumn,  nameColumn,  sortColumn, joinClause, filterTable, sortDirection = "ASC") =>
{
    const searchString = getParams["q"]?.replace("undefined", "");
    const whereClause = sqlBuilder.whereClause(getParams);
 
    return ` select distinct ${valueColumn}::text as value,  ${nameColumn} as name from ${filterTable} lus
               ${joinClause ? `inner join ${joinClause}` : '' } 
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
        // if no location based filter is selected, then smart filtering is avoided and the query is run
        // directly against the reference tables.
        if (!isLocationBasedEntity(config.entityTypeMappings[entityType], getParams) && sansLocationFilters(getParams) && entityConfig.refTable ) {
            sql = `select id::text as value, name from ${entityConfig.refTable} order by name`;
        } else {
            const filterTable = isLocationBasedEntity(config.entityTypeMappings[entityType], getParams) ? config.filterTableName : config.tableName;
            sql = fetchDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, 
                entityConfig.filterSortTableColumn, entityConfig.joinClause, filterTable);
        }
        result = await pgClient.query(sql);
        response = result.rows;
    } else {
        const keysToBeRequeried = getParams["keysToBeRequeried"].split(',');
        const filterTable = isOnlyLocationBasedFilters(keysToBeRequeried, getParams) ? config.filterTableName : config.tableName;
        const sqls = R.map(key => {
            const item = config.filterDataKeys[key];
            // if no location based filter is selected, then smart filtering is avoided and the query is run
            // directly against the reference tables.
            if (!isLocationBasedEntity(key, getParams) && sansLocationFilters(getParams) && item.refTable ) {
                return `select id::text as value, name from ${item.refTable} order by name`;
            } else {    
                return fetchDataSql(getParams, item.filterValueTableColumn, item.filterTextTableColumn, item.filterSortTableColumn, item.joinClause, filterTable);
            }
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