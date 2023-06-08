const R = require('ramda');
const config = require('./config');

const whereClause = params =>
{

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
        salesMarket, archetype, dmaName, statecode, zipcode, indoorCovScore,
        fiveg, band14,  fivegplusMmwave, fivegplusCbandIcs, fnet, 
        wbbSuitabilityIcs, speedExperienceIcs,
        availCapacity, multigig, fiberStatus, bbEligibleMaxSpeed, anyFiberCompetitor, multiTenant,
        attOoklaQ, tmoRatioOokla, vznRatioOokla, popDensity, medIncome, percentHispanic, searchedBusiness, owningModule, channelCode,
        futureFiberStatus, locCustProsp, totFiberPort, adiPort, abfPort, gponPort, bbUversePort, bbIpdslPort, bbDslPort, owningSegName,
        owningModuleSpecial, wirelineCust, nonWirelineCust, totalWirelineOpps, 
        scsScore, fivegplusCbandScs, wbbSuitabilityScs, speedExperienceScs, wbbEvaluationIcs, wbbEvaluationScs, newlyLit, psa, fiberPid, svid, nsbId,  locationId, firstLit, noSpend, businessEmployees, sicCdGrp,
        totalEmployeesHere
    } = params;

    let sql = "";

    const segmentMappings = {
        "midmarket":"27,28,29,30,31,32,33,34,35,36,37",
        "globalBusiness":"64,65,66,67,68,69",
        "ch7Sled":"29,30,31,32,33,34,35,36"
    }

    if (channelCode && channelCode !== "bclsv2" && channelCode !== "midmarketFiber" && channelCode !== "ch2Fiber" && channelCode !== "ch3Wireless" && channelCode !== "ch4Fiber" && channelCode !== "ch5Wireless" && channelCode !== "ch6Wireless" && channelCode !== "ch2FiberQv" && channelCode !== "ch8Demo" && channelCode !== "ch9FiberStores")
    {       
        sql = sql + ` AND ts.segment_name_id in (${segmentMappings[channelCode]}) `;
    }
    if (owningModule)
    {
        sql = sql + " AND ts.owning_module like '%" + owningModule.trim().toUpperCase() + "%'";
    }
    if (searchedBusiness)
    {
        sql = sql + " AND lus.mikey = " + searchedBusiness + "";
    }
    if (salesMarket)
    {
        sql = sql + " AND sales_market_id = " + salesMarket + "";
    }
    if (archetype)
    {
        sql = sql + " AND archetype_id IN (" + archetype + ")";
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
    if (fivegplusMmwave)
    {
        sql = sql + " AND fiveg_plus_mmwave_id IN (" + fivegplusMmwave + ")";
    }
    if (fivegplusCbandIcs)
    {
        sql = sql + " AND fiveg_plus_cband_ics_id IN (" + fivegplusCbandIcs + ")";
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
    if (speedExperienceIcs)
    {
        sql = sql + " AND speed_experience_ics_id IN (" + speedExperienceIcs + ")";
    }
    if (availCapacity)
    {
        sql = sql + " AND avail_capacity_id IN (" + availCapacity + ")";
    }
    if (multigig)
    {
        sql = sql + " AND multigig_id IN (" + multigig + ")";
    }
    if (fiberStatus)
    {
        sql = sql + " AND fiber_status_report_rows_id IN (" + fiberStatus + ")";
    }
    if (bbEligibleMaxSpeed)
    {
        sql = sql + " AND bb_eligible_max_speed_id IN (" + bbEligibleMaxSpeed + ")";
    }
    if (anyFiberCompetitor)
    {
        sql = sql + " AND fiber_competitor_any_id IN (" + anyFiberCompetitor + ")";
    }
    if (multiTenant)
    {
        sql = sql + " AND multi_tenant_id IN (" + multiTenant + ")";
    }
    if (percentHispanic)
    {
        sql = sql + " AND pct_hispanic_id IN (" + percentHispanic + ")";
    }
    if (tmoRatioOokla)
    {
        sql = sql + " AND tmo_ratio_ookla_id IN (" + tmoRatioOokla + ")";
    }
    if (attOoklaQ)
    {
        sql = sql + " AND att_ookla_quintile_id IN (" + attOoklaQ + ")";
    }
    if (vznRatioOokla)
    {
        sql = sql + " AND vzn_ratio_ookla_id IN (" + vznRatioOokla + ")";
    }
    if (popDensity)
    {
        sql = sql + " AND pop_density_zip_id IN (" + popDensity + ")";
    }
    if (medIncome)
    {
        sql = sql + " AND median_income_id IN (" + medIncome + ")";
    }
    if (futureFiberStatus)
    {
        sql = sql + " AND future_fiber_status_id IN (" + futureFiberStatus + ")";
    }
    if (locCustProsp)
    {
        sql = sql + " AND loc_cust_prosp_id IN (" + locCustProsp + ")";
    }
    if (totFiberPort)
    {
        sql = sql + " AND tot_fiber_ports IN (" + totFiberPort + ")";
    }
    if (adiPort)
    {
        sql = sql + " AND adi_ports IN (" + adiPort + ")";
    }
    if (abfPort)
    {
        sql = sql + " AND abf_ports IN (" + abfPort + ")";
    }
    if (gponPort)
    {
        sql = sql + " AND gpon_ports IN (" + gponPort + ")";
    }
    if (bbUversePort)
    {
        sql = sql + " AND bb_uverse_ports IN (" + bbUversePort + ")";
    }
    if (bbIpdslPort)
    {
        sql = sql + " AND bb_ipdsl_ports IN (" + bbIpdslPort + ")";
    }
    if (bbDslPort)
    {
        sql = sql + " AND bb_dsl_ports IN (" + bbDslPort + ")";
    }
    if (owningSegName)
    {
        sql = sql + " AND segment_name_id IN (" + owningSegName + ")";
    }
    if (owningModuleSpecial)
    {
        sql = sql + " AND owning_module_special_id IN (" + owningModuleSpecial + ")";
    }
    if (wirelineCust)
    {
        sql = sql + " AND total_customers_at_location_id IN (" + wirelineCust + ")";
    }
    if (nonWirelineCust)
    {
        sql = sql + " AND non_fiber_customers_at_location_id IN (" + nonWirelineCust + ")";
    }
    if (totalWirelineOpps)
    {
        sql = sql + " AND total_opportunities_at_location_id IN (" + totalWirelineOpps + ")";
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
    if (totalEmployeesHere) {
        sql = sql + " AND total_employees_here_id IN (" + totalEmployeesHere + ")";
    }

    return sql;

}

module.exports = { whereClause };