const points = (pgClient, filterParams) => {
  const baseQuery = `select zip_co_psa, latitude::text, longitude::text, wireless_score from SOT.SALES_OPP_PSA_PROD WHERE MARKET_RANK <= 25 `;
  let whereCondition = "";

  if (
    filterParams.searchedZip &&
    filterParams.searchedZip !== "undefined" &&
    filterParams.searchedZip !== "null"
  ) {
    whereCondition = `AND zip='${filterParams.searchedZip}'`;
  } else if (
    filterParams.searchedCounty &&
    filterParams.searchedCounty !== "undefined" &&
    filterParams.searchedCounty !== "null"
  ) {
    whereCondition = `AND county_fips='${filterParams.searchedCounty}'`;
  } else if (
    filterParams.searchedDMA &&
    filterParams.searchedDMA !== "undefined" &&
    filterParams.searchedDMA !== "null"
  ) {
    whereCondition = `AND dma='${filterParams.searchedDMA}'`;
  } else {
    const { market, marketType } = filterParams;
    if (marketType === "REGION") {
      whereCondition = `AND sales_region = '${market}'`;
    } else if (marketType === "MARKET") {
      whereCondition = `AND sales_market = '${market}'`;
    }
  }
  return pgClient.query(
    `
    ${baseQuery} 
    ${whereCondition}
    `
  );
};

const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `
      SELECT 
      zip_co_psa, market_rank, wireless_score, fiber_available, fiber_customers, fiber_percentage, fiber_opportunity, copper_upgrade, mdu_density_text,
      latitude::text, longitude::text, dma, county_fips, zip, 
      CONCAT(TO_CHAR((FIBER_CUSTOMERS*100/FIBER_AVAILABLE),'FM99990.0'),'%') AS fiber_penetration_rate,
      CASE WHEN DISTINCT_MAPPABLE / (FIBER_AVAILABLE - MISSING_LAT_LONG) >= .8 THEN 'Low - Few or No MDUs'
      WHEN DISTINCT_MAPPABLE / (FIBER_AVAILABLE - MISSING_LAT_LONG) <= .2 THEN 'High - Significant MDUs'
      ELSE 'Med - Some MDUs' END AS MDU_DENSITY_TEXT,
      CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
      WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
      WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
      WHEN WIRELESS_SCORE = 2 THEN '2 (Uneven)'
      WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
      ELSE 'Not enough Samples' END AS wireless_score_text,
      fiber_customer_wireless_customer,fiber_customer_no_wireless,copper_upgrade_wireless_customer,copper_upgrade_no_wireless,wireless_customer_no_fiber,no_fiber_no_wireless 
      FROM SOT.SALES_OPP_PSA_PROD 
      WHERE zip_co_psa = $1
    `,
    [pointId]
  );

module.exports = { points, point };
