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
  SUM(CASE WHEN copper_upgrade_hm_color_code = 1 THEN 1 ELSE 0 END) AS copper_upgrade_count_1,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 2 THEN 1 ELSE 0 END) AS copper_upgrade_count_2,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 3 THEN 1 ELSE 0 END) AS copper_upgrade_count_3,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 4 THEN 1 ELSE 0 END) AS copper_upgrade_count_4,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 1 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_1,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 2 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_2,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 3 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_3,
  SUM(CASE WHEN copper_upgrade_hm_color_code = 4 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_4
  FROM SOT.SALES_OPP_COUNTY_PROD
  WHERE ${whereCondition}
    `);
};

module.exports = { get };
