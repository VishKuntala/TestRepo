const get = (pgClient, params) => {
  const { marketType, market, searchedDMA } = params;
  let whereCondition = "";
  if (marketType === "MARKET") {
    whereCondition = `WHERE (SALES_MARKET1 LIKE '${market}' OR SALES_MARKET2 LIKE '${market}' OR SALES_MARKET3 LIKE '${market}')`;
  } else {
    whereCondition = `WHERE (SALES_REGION1 LIKE '${market}' OR SALES_REGION2 LIKE '${market}')`;
  }
  if (searchedDMA && searchedDMA !== "undefined" && searchedDMA !== "null") {
    whereCondition = `${whereCondition} AND dma = '${searchedDMA}'`;
  }
  return pgClient.query(
    `
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
    FROM SOT.SALES_OPP_DMA_PROD
    ${whereCondition}     
    `
  );
};

module.exports = { get };
