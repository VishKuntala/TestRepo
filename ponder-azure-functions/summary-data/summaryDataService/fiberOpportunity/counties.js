const get = (pgClient, params) => {
  const { marketType, market, searchedCounty } = params;
  let whereCondition = `SALES_REGION LIKE '${market}'`;
  if (marketType === "MARKET") {
    whereCondition = `SALES_MARKET LIKE '${market}'`;
  }
  if (
    searchedCounty &&
    searchedCounty !== "undefined" &&
    searchedCounty !== "null"
  ) {
    whereCondition = `${whereCondition} AND cnty_fips = '${searchedCounty}'`;
  }
  return pgClient.query(`
  SELECT
  'copperUpgrade' AS CATEGORY,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 1 THEN 1 ELSE 0 END) AS fiber_opportunity_count_1,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 2 THEN 1 ELSE 0 END) AS fiber_opportunity_count_2,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 3 THEN 1 ELSE 0 END) AS fiber_opportunity_count_3,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 4 THEN 1 ELSE 0 END) AS fiber_opportunity_count_4,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 1 THEN FIBER_OPPORTUNITY ELSE 0 END) AS fiber_opportunity_opp_1,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 2 THEN FIBER_OPPORTUNITY ELSE 0 END) AS fiber_opportunity_opp_2,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 3 THEN FIBER_OPPORTUNITY ELSE 0 END) AS fiber_opportunity_opp_3,
  SUM(CASE WHEN fiber_opportunity_hm_color_code = 4 THEN FIBER_OPPORTUNITY ELSE 0 END) AS fiber_opportunity_opp_4
  FROM SOT.SALES_OPP_COUNTY_PROD
  WHERE ${whereCondition}
    `);
};

module.exports = { get };
