const buildAccessTypeWhereClause = (accessType, attuid) =>
{
    let sql = "";

    if (accessType == "mine")
    {
        sql = " ADMIN_USER = '" + attuid + "'";
    } 
    if (accessType == "shared")
    {
        sql = " VIEW_USER = '" + attuid + "'";
    }
    if (accessType == "public")
    {
        sql = " VIEW_PUBLIC = 1";
    }
    if (accessType == "all")
    {
        sql = "( ADMIN_USER = '" + attuid + "' OR VIEW_PUBLIC = 1 OR VIEW_USER = '" + attuid + "')";
    }
    return sql;
}

const whereClause = params =>
{
    const {
        accessType, clusterId,
            zipcode, statecode, indoorCovScore, fiveg, band14, tputText, fnet, wbbSuitabilityIcs, attuid
            , scsScore, fivegplusCbandScs, wbbSuitabilityScs, speedExperienceScs, wbbEvaluationIcs, wbbEvaluationScs, newlyLit, psa, fiberPid, svid, nsbId,  locationId, firstLit, noSpend, businessEmployees, sicCdGrp
    } = params;

    let sql = " AND IS_ACTIVE = 1 AND IS_PROCESSED = 1 ";

    if (accessType)
    {
        sql = sql + " AND " + buildAccessTypeWhereClause(accessType, attuid);
    }
    if (clusterId)
    {
        sql = sql + " AND WST.SALES_OPP_BYOC_DETAIL.BYOC_CLUSTER_ID IN (" + clusterId + ")";
    }
    if (zipcode)
    {
        sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
    }
    if (statecode)
    {
        sql = sql + " AND STATE IN (" + statecode + ")";
    }
    if (indoorCovScore)
    {
        sql = sql + " AND COVERAGE_SCORE IN (" + indoorCovScore + ")";
    }
    if (fiveg)
    {
        sql = sql + " AND FIVEG IN (" + fiveg + ")";
    }
    if (band14)
    {
        sql = sql + " AND BAND_14 IN (" + band14 + ")";
    }
    if (tputText)
    {
        sql = sql + " AND TPUT_TEXT IN (" + tputText + ")";
    }
    if (fnet)
    {
        sql = sql + " AND FIRST_NET IN (" + fnet + ")";
    }
    if (wbbSuitabilityIcs)
    {
        sql = sql + " AND LEGACY_DEVICE_TEXT IN (" + wbbSuitabilityIcs + ")";
    }
    if (scsScore) {
        sql = sql + " AND scs_score_id IN (" + scsScore + ")";
    } 
    if (fivegplusCbandScs) {
        sql = sql + " AND fiveg_plus_sband_scs_id IN (" + fivegplusCbandScs + ")";
    }
    if (wbbSuitabilityScs) {
        sql = sql + " AND wireless_broadband_suitability_scs_id IN (" + wbbSuitabilityScs + ")";
    } 
    if (speedExperienceScs) {
        sql = sql + " AND speed_experience_scs_id IN (" + speedExperienceScs + ")";
    } 
    if (wbbEvaluationIcs) {
        sql = sql + " AND wireless_broadband_evaluation_ics_id IN (" + wbbEvaluationIcs + ")";
    } 
    if (wbbEvaluationScs) {
        sql = sql + " AND wireless_broadband_evaluation_scs_id IN (" + wbbEvaluationScs + ")";
    }
    if (newlyLit) {
        sql = sql + " AND newly_lit_gpon_id IN (" + newlyLit + ")";
    }
    if (psa) {
        sql = sql + " AND wcpsa IN (" + psa.toUpperCase() + ")";
    }
        if (nsbId) {
        sql = sql + " AND lus.nsb_id = " + nsbId;
    }
    if (locationId) {

        sql = sql + " AND lus.location_id IN (" + locationId + ")";
    }
    if (svid) {
        sql = sql + " AND ts.co_id IN (" + svid + ")";
    }
    if (businessEmployees) {
        sql = sql + " AND tenant_employees_id  IN (" + businessEmployees + ")";
    }
    if (sicCdGrp) {
        sql = sql + " AND bcl_sic   IN (" + sicCdGrp + ")";
    }

    if (noSpend) {
        sql = sql + " AND active_mobility_spend_id  IN (" + noSpend + ")";
    }
    if (firstLit) {
        sql = sql + " AND any_fiber_lit_yearmo IN (" + firstLit + ")";
    }
    if (fiberPid) {
        sql = sql + " AND fiber_pid IN (" + fiberPid + ")";
    }

    return sql;

}

module.exports = { whereClause };