const points = (pgClient, filterParams) => {
  const baseQuery = `SELECT zip_co_psa, latitude::text, longitude::text, wireless_score FROM sot.sales_opp_psa_future_prod `;
  let whereCondition = "";

  if (filterParams.searchedZip && filterParams.searchedZip !== "undefined" && filterParams.searchedZip !== "null") {
    whereCondition = `WHERE zip='${filterParams.searchedZip}'`;
  } else if (
    filterParams.searchedCounty &&
    filterParams.searchedCounty !== "undefined" &&
    filterParams.searchedCounty !== "null"
  ) {
    whereCondition = `WHERE county_fips='${filterParams.searchedCounty}'`;
  } else if (
    filterParams.searchedDMA &&
    filterParams.searchedDMA !== "undefined" &&
    filterParams.searchedDMA !== "null"
  ) {
    whereCondition = `WHERE dma='${filterParams.searchedDMA}'`;
  } else {
    const { market, marketType } = filterParams;
    if (marketType === "REGION") {
      whereCondition = `WHERE sales_region = '${market}'`;
    } else if (marketType === "MARKET") {
      whereCondition = `WHERE sales_market = '${market}'`;
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
      SELECT zip_co_psa, future_fiber_opportunity, grn_30day_dt, latitude::text, longitude::text,
      CONCAT(TO_CHAR((FIBER_CUSTOMERS*100/FIBER_AVAILABLE),'FM99990.0'),'%') AS FIBER_PENETRATION_RATE,
      CASE WHEN DISTINCT_MAPPABLE / (FIBER_AVAILABLE - MISSING_LAT_LONG) >= .8 THEN 'Low - Few or No MDUs'
      WHEN DISTINCT_MAPPABLE / (FIBER_AVAILABLE - MISSING_LAT_LONG) <= .2 THEN 'High - Significant MDUs'
      ELSE 'Med - Some MDUs' END AS MDU_DENSITY_TEXT,
      CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
      WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
      WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
      WHEN WIRELESS_SCORE = 2 THEN '2 (Uneven)'
      WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
      ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
      FROM SOT.SALES_OPP_PSA_FUTURE_PROD
      WHERE zip_co_psa  = $1
    `,
    [pointId]
  );

module.exports = { points, point };
