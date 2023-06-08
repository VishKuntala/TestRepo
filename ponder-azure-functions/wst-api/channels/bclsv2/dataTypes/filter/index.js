const R = require('ramda');
const config = require('../../common/config');
const { sqlBuilder } = require('../../common');



const sansLocationFilters = getParams => 
    R.trim(R.join('',R.values(R.pick(['salesMarket', 'dmaName', 'statecode', 'zipcode'], getParams)))) === '';

const sansNonLocationFilters = getParams => 
    R.trim(R.join('',R.values(R.pick(['archetype', 'indoorCovScore', 'fiveg','fivegplusMmwave',
'fivegplusCbandIcs','band14','fnet','wbbSuitabilityIcs','speedExperienceIcs',
'availCapacity','multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'percentHispanic', 'futureFiberStatus', 'channelCode',
'locCustProsp', 'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps'], getParams)))) === '';    

const sansNonLocationAndChannelCodeFilters = getParams => 
    R.trim(R.join('',R.values(R.pick(['archetype', 'indoorCovScore', 'fiveg','fivegplusMmwave',
'fivegplusCbandIcs','band14','fnet','wbbSuitabilityIcs','speedExperienceIcs',
'availCapacity','multigig', 'fiberStatus', 'bbEligibleMaxSpeed', 'anyFiberCompetitor', 'multiTenant',
'attOoklaQ', 'tmoRatioOokla', 'vznRatioOokla', 'popDensity', 'medIncome', 'percentHispanic', 'futureFiberStatus',
'locCustProsp', 'totFiberPort', 'adiPort', 'abfPort', 'gponPort', 'bbUversePort', 'bbIpdslPort', 'bbDslPort', 'owningSegName',
'owningModuleSpecial', 'wirelineCust', 'nonWirelineCust', 'totalWirelineOpps'], getParams)))) === '';    


const isOnlyLocationBasedFilters = (keysToBeRequeried, getParams) => (R.without(
    [ 'salesMarket', 'dmaName', 'statecode', 'zipcode' ], keysToBeRequeried)).length === 0 && sansNonLocationFilters(getParams);

const isOnlySalesMarketEntity = (entityType, getParams) => 
    entityType === 'salesMarket'  && sansNonLocationAndChannelCodeFilters(getParams);    

const isLocationBasedEntity = (entityType,getParams) => R.includes(entityType, 
    [ 'salesMarket', 'dmaName', 'statecode', 'zipcode' ]) && sansNonLocationFilters(getParams);

const fetchDataSql = (getParams, valueColumn,  nameColumn,  sortColumn, joinClause, filterTable, userAttributes, sortDirection = "ASC", wildcard = false) =>
{
    const searchString = getParams["q"]?.replace("undefined", "");
    const whereClause = sqlBuilder.whereClause(getParams, userAttributes);

    return ` select distinct ${valueColumn}::text as value,  ${nameColumn} as name, ${sortColumn} from ${filterTable} lus
               ${ filterTable === config.filterTableName ? '' : ' inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey '}
               ${joinClause ? `inner join ${joinClause}` : '' } 
                WHERE ${searchString ? `LOWER(${nameColumn.toLowerCase()}::varchar(255)) LIKE '${wildcard ? '%' : ''}${searchString.toLowerCase()}%'` : `1=1`}  
                ${whereClause}
                AND ${valueColumn} IS NOT NULL
    order by ${sortColumn} ${sortDirection || 'ASC'}`;
}

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {
    let result;
    let response;
    let sql = '';

    const mapIndexed = R.addIndex(R.map);

    const filterByUserAttributes = (entityConfig, data) => {
        if(entityConfig.authorizeByUserAttribute) {
            const scopeByAttribute = R.find(R.propEq('attribute_name', entityConfig.authorizeByUserAttribute))(userAttributes);
            if (scopeByAttribute) {
             const authorizedValues = scopeByAttribute.attribute_value.split(',');
             return R.filter(R.where({value: R.includes(R.__,authorizedValues)}))(data);
            }
         }
         return data;
    }

    if (entityType) {
        const entityConfig = config.filterDataKeys[config.entityTypeMappings[entityType]];
        // if no location based filter is selected OR if it is just sales market, then smart filtering is avoided and the query is run
        // directly against the reference tables.
        if ( isOnlySalesMarketEntity(config.entityTypeMappings[entityType], getParams)) {
            sql = `select gid::text as value, vpgm_markt as name from spatial.vpgm_market order by vpgm_markt`;
        } else if (!isLocationBasedEntity(config.entityTypeMappings[entityType], getParams) && sansLocationFilters(getParams) && entityConfig.refTable) {
            sql = `select id::text as value, name from ${entityConfig.refTable} order by order_id`;
        } else {
            const filterTable = isLocationBasedEntity(config.entityTypeMappings[entityType], getParams) ? config.filterTableName : config.tableName;
            sql = fetchDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, 
                entityConfig.filterSortTableColumn, entityConfig.joinClause, filterTable, userAttributes,entityConfig.filterSortDirection, entityConfig.wildcard);
        }
        result = await pgClient.query(sql);
        response = filterByUserAttributes(entityConfig,result.rows);
    } else {
        const keysToBeRequeried = getParams["keysToBeRequeried"].split(',');
        const filterTable = isOnlyLocationBasedFilters(keysToBeRequeried, getParams) ? config.filterTableName : config.tableName;
        const sqls = R.map(key => {
            const item = config.filterDataKeys[key];
            // if no location based filter is selected, then smart filtering is avoided and the query is run
            // directly against the reference tables.
            if (!isLocationBasedEntity(key, getParams) && sansLocationFilters(getParams) && item.refTable ) {
                return `select id::text as value, name from ${item.refTable} order by order_id`;
            } else {    
                return fetchDataSql(getParams, item.filterValueTableColumn, 
                    item.filterTextTableColumn, item.filterSortTableColumn, item.joinClause, filterTable, userAttributes);
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