const R = require('ramda');
const conf = require('./config');

const whereClause = (params,userAttributes = []) =>
{
    const config = conf(process.env.GROUP_MEMBERSHIP);
    // if a value is not passed for a filter, then default that filter value with data restrictions appropriate to that channel
    if (params.channelCode && config.dataFilter && config.dataFilter[params.channelCode]) {
        const dataFilterKeys = R.keys(config.dataFilter[params.channelCode]);
        for (let i = 0; i < dataFilterKeys.length; i += 1 ) {
            const dataFilterKey = dataFilterKeys[i];
            if (!params[dataFilterKey]) {
                params[dataFilterKey] = config.dataFilter[params.channelCode][dataFilterKey];
            }
        }
    }
    
    const {
        salesMarket, dmaName, statecode, zipcode, indoorCovScore,
        multiGig, fiberStatus, csiEligibility,
        psa
    } = params;

    let sql = "";
    const scopeBySalesMarketAttribute = R.find(R.propEq('attribute_name', 
    config.filterDataKeys.salesMarket.authorizeByUserAttribute))(userAttributes);
    const authorizedSalesMarketValues = scopeBySalesMarketAttribute?.attribute_value;

    if (salesMarket)
    {
        if (authorizedSalesMarketValues) {
            const allowedValues = R.join(",",R.intersection(R.split(",",authorizedSalesMarketValues),R.split(',',salesMarket)))
            sql = sql + " AND lus.sales_market_gid IN (" + allowedValues + ")";
        } else {
            sql = sql + " AND lus.sales_market_gid = " + salesMarket + "";
        }
    } else {
        sql = sql + " AND lus.sales_market_gid IN (" + authorizedSalesMarketValues + ")";
    }

    if (dmaName)
    {
        sql = sql + " AND lus.dma_gid IN (" + dmaName + ")";
    }
    if (statecode)
    {
        sql = sql + " AND lus.state_gid IN (" + statecode + ")";
    }
    if (zipcode)
    {
        sql = sql + " AND lus.zip IN (" + zipcode + ")";
    }
    if (indoorCovScore)
    {
        sql = sql + " AND ts.indoor_coverage_score IN (" + indoorCovScore + ")";
    }
    if (fiberStatus)
    {
        sql = sql + ` AND ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} IN (` + fiberStatus + ")";
    }
    if (psa) {
        sql = sql + " AND lus.zip_co_psa IN (" + psa.toUpperCase() + ")";
    }
    if (multiGig) {
        sql = sql + " AND ts.hypergig IN (" + multiGig + ")";
    }
    if (csiEligibility) {
        sql = sql + " AND ts.csi_eligible IN (" + csiEligibility + ")";
    }

    return sql;

}

module.exports = { whereClause };