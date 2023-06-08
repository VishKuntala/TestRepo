const whereClause = params =>
{
    const {
        zipcode, statecode, networkbuildtype
    } = params;

    let sql = "";

    if (statecode)
    {
        sql = sql + " AND STATE_CD = '" + statecode + "'";
    }
    if (zipcode)
    {
        sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
    }
    if (networkbuildtype)
    {
        sql = sql + " AND NETWORK_BUILD_TYPE_CD IN (" + networkbuildtype + ")";
    }

    return sql;

}

module.exports = { whereClause };