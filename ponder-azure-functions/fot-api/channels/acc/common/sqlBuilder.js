const whereClause = params =>
{
    const {
        generalManager, areaManager, preferredPartner, contractType
    } = params;

    let sql = "";

    if (generalManager)
    {
        sql = sql + " AND gm_id IN (" + generalManager.split(",").map(item => "'" + item + "'").join(",") + ")";        
    }   
    if (areaManager)
    {
        sql = sql + " AND area_mgr_id IN (" + areaManager.split(",").map(item => "'" + item + "'").join(",") + ")";        
    }
    if (preferredPartner)
    {
        sql = sql + " AND preferred_partner IN (" + preferredPartner.split(",").map(item => "'" + item + "'").join(",") + ")";        
    }
    if (contractType)
    {
        sql = sql + " AND contract_type IN (" + contractType.split(",").map(item => "'" + item + "'").join(",") + ")";        
    }

    return sql;
    
}

module.exports = { whereClause };