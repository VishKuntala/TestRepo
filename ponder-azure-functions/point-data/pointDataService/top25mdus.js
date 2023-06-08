const points = (pgClient, filterParams) => {
  let whereCondition = "";
  const { market, marketType } = filterParams;
  if (marketType === "REGION") {
    whereCondition = `AND sales_region = '${market}'`;
  } else if (marketType === "MARKET") {
    whereCondition = `AND sales_market = '${market}'`;
  }
  return pgClient.query(
    `
        select zip_co_psa, latitude::text, longitude::text, wireless_score from SOT.SALES_OPP_MDU_PROD WHERE MARKET_RANK <= 25
        ${whereCondition}
        `
  );
};

const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `
    SELECT SOT.SALES_OPP_MDU_PROD.*,
    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                                        WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                                        WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                                        WHEN WIRELESS_SCORE = 2 THEN '2 (Uneven)'
                                        WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                                        ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT,
    FIBER_AVAILABLE - FIBER_OPPORTUNITY AS FIBER_CUSTOMERS
    FROM SOT.SALES_OPP_MDU_PROD
    WHERE zip_co_psa = $1
`,
    [pointId]
  );

module.exports = { points, point };
