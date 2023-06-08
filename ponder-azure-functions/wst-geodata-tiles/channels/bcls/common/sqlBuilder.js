const whereClause = params =>
{
    const {
        vpgm, archetype, dmaName, zipcode, indoorCovScore, fiveg,
             band14, awbCapText, awbSpecEff, attRankGws, gponStatus, attOoklaQ, tmoRatioOokla, vznRatioOokla, 
             popDensity, medIncome, hypergig
             , scsScore, fivegplusCbandScs, wbbSuitabilityScs, speedExperienceScs, wbbEvaluationIcs, wbbEvaluationScs, newlyLit, psa, fiberPid, svid, nsbId,  locationId, firstLit, noSpend, businessEmployees, sicCdGrp
    } = params;

    let sql = "";


    if (vpgm)
    {
        sql = sql + " AND VPGM IN (" + vpgm + ")";
    }
    if (archetype)
    {
        sql = sql + " AND ARCHETYPE IN (" + archetype + ")";
    }
    if (dmaName)
    {
        sql = sql + " AND DMA_NM IN (" + dmaName + ")";
    }
    if (zipcode)
    {
        sql = sql + " AND ZIP IN (" + zipcode + ")";
    }
    if (awbCapText)
    {
        sql = sql + " AND AWB_CAPACITY_TEXT IN (" + awbCapText + ")";
    }
    if (indoorCovScore)
    {
        sql = sql + " AND SIMPLE_COVERAGE_SCORE IN (" + indoorCovScore + ")";
    }
    if (fiveg)
    {
        sql = sql + " AND FIVEG IN (" + fiveg + ")";
    }
    if (band14)
    {
        sql = sql + " AND BAND_14 IN (" + band14 + ")";
    }
    if (awbSpecEff)
    {
        sql = sql + " AND AWB_SPECTRUM_EFFICIENCY IN (" + awbSpecEff + ")";
    }
    if (attRankGws)
    {
        sql = sql + " AND ATT_RANK_GWS IN (" + attRankGws + ")";
    }
    if (tmoRatioOokla)
    {
        sql = sql + " AND TMO_RATIO_OOKLA_LTE IN (" + tmoRatioOokla + ")";
    }
    if (attOoklaQ)
    {
        sql = sql + " AND ATT_OOKLA_QUANTILE IN (" + attOoklaQ + ")";
    }
    if (gponStatus)
    {
        sql = sql + " AND GPON_STATUS IN (" + gponStatus + ")";
    }
    if (vznRatioOokla)
    {
        sql = sql + " AND VERIZON_RATIO_OOKLA_LTE IN (" + vznRatioOokla + ")";
    }
    if (popDensity)
    {
        sql = sql + " AND POP_DENSITY_TEXT IN (" + popDensity + ")";
    }
    if (medIncome)
    {
        sql = sql + " AND HH_MEDIAN_INCOME_TEXT IN (" + medIncome + ")";
    }
    if (hypergig)
    {
        sql = sql + " AND HYPERGIG IN (" + hypergig + ")";
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