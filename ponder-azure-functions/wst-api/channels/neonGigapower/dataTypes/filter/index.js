const R = require('ramda');
const conf = require('../../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../../wst-common/channels/neonGigapower');



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

const fetchDataSql = (getParams, valueColumn,  nameColumn,  sortColumn, joinClause, filterTable, userAttributes, sortDirection = "ASC", wildcard = false, isOnlyLocationBased) =>
{
    const searchString = getParams["q"]?.replace("undefined", "");
    const whereClause = sqlBuilder.whereClause(getParams, userAttributes);

    return ` select distinct ${valueColumn}::text as value,  ${nameColumn} as name, ${sortColumn} from ${filterTable} lus
                ${ isOnlyLocationBased && (!joinClause || !joinClause.includes('ts.')) ? '' : ' inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa '}
                ${(!isOnlyLocationBased && joinClause) || (isOnlyLocationBased && (joinClause && !joinClause.includes('ts.'))) ? `inner join ${joinClause}` : '' } 
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

    const config = conf(process.env.GROUP_MEMBERSHIP);

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
            const isOnlyLocationBased = isLocationBasedEntity(config.entityTypeMappings[entityType], getParams);
            const filterTable = isOnlyLocationBased ? config.filterTableName : config.tableName;
            sql = fetchDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, 
                entityConfig.filterSortTableColumn, entityConfig.joinClause, filterTable, userAttributes,entityConfig.filterSortDirection, entityConfig.wildcard, isOnlyLocationBased);
        }
        result = await pgClient.query(sql);
        response = filterByUserAttributes(entityConfig,result.rows);
    } else {
        const keysToBeRequeried = getParams["keysToBeRequeried"].split(',');
        const isOnlyLocationBased = isOnlyLocationBasedFilters(keysToBeRequeried, getParams);
        const filterTable = isOnlyLocationBased ? config.filterTableName : config.tableName;
        const sqls = R.map(key => {
            const item = config.filterDataKeys[key];
            // if no location based filter is selected, then smart filtering is avoided and the query is run
            // directly against the reference tables.
            if (!isLocationBasedEntity(key, getParams) && sansLocationFilters(getParams) && item.refTable ) {
                return `select id::text as value, name from ${item.refTable} order by order_id`;
            } else {    
                return fetchDataSql(getParams, item.filterValueTableColumn, 
                    item.filterTextTableColumn, item.filterSortTableColumn, item.joinClause, filterTable, userAttributes,null,null,isOnlyLocationBased);
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