const R = require('ramda');
const config = require('../../common/config');
const { sqlBuilder } = require('../../common');

const fetchCampaignDataSql = (getParams, valueColumn,  nameColumn,  sortColumn,  sortDirection = "ASC") =>
{
    const searchString = getParams["q"]?.replace("undefined", "");
    const whereClause = sqlBuilder.whereClause(getParams);
    let sql;
    if (!searchString)
    {
        sql = `SELECT * FROM (SELECT DISTINCT CAMPAIGN_ID as value,
        CASE WHEN CAMPAIGN_ID = '1-33735165693' THEN '2T21 Grow Mobility Add A Line'
         WHEN CAMPAIGN_ID = '1-33735165652' THEN '2T21 Acquire Mobility Existing Wireline'
         WHEN CAMPAIGN_ID = '1-33735165636' THEN '2T21 Acquire Mobility Port Outs'
         WHEN CAMPAIGN_ID = '1-33735165719' THEN '2T21 Acquire Mobility Fiber Fast Follow'
         WHEN CAMPAIGN_ID = '1-33735165667' THEN '2T21 Acquire Mobility New Logo'
         WHEN CAMPAIGN_ID = '1-33761622514' THEN '2T21 Grow Top Mobility'
         WHEN CAMPAIGN_ID = '1-33735165706' THEN '2T21 Grow FAN Fast Follow'
         WHEN CAMPAIGN_ID = '1-35275858218' THEN '2T21 Grow Mobility Voice'
         END AS name 
         from ${config.tableName} WHERE 1=1 ${whereClause} ) A
         ORDER BY A.name`;
    }
    else
    {

        sql = `SELECT * FROM (SELECT DISTINCT CAMPAIGN_ID as value, 
                CASE WHEN CAMPAIGN_ID = '1-33735165693' THEN '2T21 Grow Mobility Add A Line'
                 WHEN CAMPAIGN_ID = '1-33735165652' THEN '2T21 Acquire Mobility Existing Wireline'
                 WHEN CAMPAIGN_ID = '1-33735165636' THEN '2T21 Acquire Mobility Port Outs'
                 WHEN CAMPAIGN_ID = '1-33735165719' THEN '2T21 Acquire Mobility Fiber Fast Follow'
                 WHEN CAMPAIGN_ID = '1-33735165667' THEN '2T21 Acquire Mobility New Logo'
                 WHEN CAMPAIGN_ID = '1-33761622514' THEN '2T21 Grow Top Mobility'
                 WHEN CAMPAIGN_ID = '1-33735165706' THEN '2T21 Grow FAN Fast Follow'
                 WHEN CAMPAIGN_ID = '1-35275858218' THEN '2T21 Grow Mobility Voice'
                 END AS name 
                 from ${config.tableName} WHERE 1=1 ${whereClause}
                ) A WHERE LOWER(A.name) LIKE '${searchString.toLowerCase()}%' 
                 ORDER BY A.name`;
    }
    return sql;
}

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
        const sql = entityType === 'Campaigns' ? 
        fetchCampaignDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, entityConfig.filterSortTableColumn)
            : fetchDataSql(getParams, entityConfig.filterValueTableColumn, entityConfig.filterTextTableColumn, entityConfig.filterSortTableColumn);

        result = await pgClient.query(sql);
        response = result.rows;
    } else {
        const keysToBeRequeried = getParams["keysToBeRequeried"].split(',');
        const sqls = R.map(key => {
            const item = config.filterDataKeys[key];
            const sql = key === 'campaignIds' ?
            fetchCampaignDataSql(getParams, item.filterValueTableColumn, item.filterTextTableColumn, item.filterSortTableColumn)
            : fetchDataSql(getParams, item.filterValueTableColumn, item.filterTextTableColumn, item.filterSortTableColumn);
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