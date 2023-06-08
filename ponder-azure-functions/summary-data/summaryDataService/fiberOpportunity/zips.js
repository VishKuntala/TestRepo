const get = (pgClient, params) => {
	const { market, searchedZip } = params;
	let whereCondition = "";
	if (searchedZip && searchedZip !== "undefined" && searchedZip !== "null") {
    whereCondition = `WHERE ZIP='${searchedZip}'`;
  } else {
    whereCondition = `WHERE SALES_MARKET LIKE '${market}' AND OVERALL_CAT != 'No Category' AND TOTALAREA > 0.2`;
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
			  FROM SOT.SALES_OPP_ZIP_PROD ${whereCondition}		
		`);
  };
  
  module.exports = { get };
  

