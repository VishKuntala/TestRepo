const get = (pgClient, params) => {
  const { marketType, market } = params;
  let whereCondition = "";
  if (marketType === "REGION") {
    whereCondition = `WHERE dim.vpgm_reg = '${market}'`;
  } else if (marketType === "MARKET") {
    whereCondition = `WHERE SALES_MARKET = '${market}'`;
  }

  return pgClient.query(`
    SELECT
    'wirelessCoverageAndFiber' AS CATEGORY,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 1 THEN 1 ELSE 0 END) AS wireless_coverage_count_1,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 2 THEN 1 ELSE 0 END) AS wireless_coverage_count_2,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 3 THEN 1 ELSE 0 END) AS wireless_coverage_count_3,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 4 THEN 1 ELSE 0 END) AS wireless_coverage_count_4,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 1 THEN FIBER_OPPORTUNITY ELSE 0 END) AS wireless_coverage_opp_1,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 2 THEN FIBER_OPPORTUNITY ELSE 0 END) AS wireless_coverage_opp_2,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 3 THEN FIBER_OPPORTUNITY ELSE 0 END) AS wireless_coverage_opp_3,
    SUM(CASE WHEN wireless_coverage_hm_color_code = 4 THEN FIBER_OPPORTUNITY ELSE 0 END) AS wireless_coverage_opp_4
    FROM SOT.SALES_OPP_SALES_MARKET_PROD fct
    INNER JOIN spatial.vpgm_market dim ON fct.sales_market = dim.vpgm_markt
    ${whereCondition}
    `);
};

module.exports = { get };
