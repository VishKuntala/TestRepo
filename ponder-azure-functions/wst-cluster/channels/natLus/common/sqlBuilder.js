const whereClause = params =>
{
    const {
        salesMarket, dmaName, statecode, zipcode, indoorCovScore,
        fiveg, band14,  fivegplus, cband, fnet, 
        wbbSuitabilityIcs, ranCause, speedExperienceIcs, weightedAvgTuputGrp,
        availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp
        , scsScore, fivegplusCbandScs, wbbSuitabilityScs, speedExperienceScs, wbbEvaluationIcs, wbbEvaluationScs, newlyLit, psa, fiberPid, svid, nsbId,  locationId, firstLit, noSpend, businessEmployees, sicCdGrp
    } = params;

    let sql = "";


    if (salesMarket)
    {
        sql = sql + " AND sales_market_id IN (" + salesMarket + ")";
    }
    if (dmaName)
    {
        sql = sql + " AND dma_id IN (" + dmaName + ")";
    }
    if (statecode)
    {
        sql = sql + " AND state_id IN (" + statecode + ")";
    }
    if (zipcode)
    {
        sql = sql + " AND zipcode IN (" + zipcode + ")";
    }
    if (indoorCovScore)
    {
        sql = sql + " AND ics_score_id IN (" + indoorCovScore + ")";
    }
    if (fiveg)
    {
        sql = sql + " AND fiveg_id IN (" + fiveg + ")";
    }
    if (fivegplus)
    {
        sql = sql + " AND fiveg_plus_mmwave_id IN (" + fivegplus + ")";
    }
    if (cband)
    {
        sql = sql + " AND fiveg_plus_cband_ics_id IN (" + cband + ")";
    }
    if (band14)
    {
        sql = sql + " AND band_14_id IN (" + band14 + ")";
    }
    if (fnet)
    {
        sql = sql + " AND first_net_id IN (" + fnet + ")";
    }
    if (wbbSuitabilityIcs)
    {
        sql = sql + " AND wireless_broadband_suitability_ics_id IN (" + wbbSuitabilityIcs + ")";
    }
    if (ranCause)
    {
        sql = sql + " AND ran_suitability_cause_id IN (" + ranCause + ")";
    }
    if (speedExperienceIcs)
    {
        sql = sql + " AND speed_experience_ics_id IN (" + speedExperienceIcs + ")";
    }
    if (weightedAvgTuputGrp)
    {
        sql = sql + " AND weighted_avg_tput_grp_id IN (" + weightedAvgTuputGrp + ")";
    }
    if (availCapacity)
    {
        sql = sql + " AND avail_capacity_id IN (" + availCapacity + ")";
    }
    if (roamText)
    {
        sql = sql + " AND roam_text_id IN (" + roamText + ")";
    }
    if (cqiGrp)
    {
        sql = sql + " AND cqi_grp_id IN (" + cqiGrp + ")";
    }
    if (spectrumEff12Pl)
    {
        sql = sql + " AND spectrum_efficiency_12_pl_id IN (" + spectrumEff12Pl + ")";
    }
    if (cbandScs)
    {
        sql = sql + " AND cband_scs_id IN (" + cbandScs + ")";
    }
    if (weightedAvgMcepPrbUtlGrp)
    {
        sql = sql + " AND weighted_avg_mcep_prbutl_grp_id IN (" + weightedAvgMcepPrbUtlGrp + ")";
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