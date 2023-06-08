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
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 1 THEN 1 ELSE 0 END) AS copper_upgrade_count_1,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 2 THEN 1 ELSE 0 END) AS copper_upgrade_count_2,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 3 THEN 1 ELSE 0 END) AS copper_upgrade_count_3,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 4 THEN 1 ELSE 0 END) AS copper_upgrade_count_4,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 1 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_1,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 2 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_2,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 3 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_3,
			  SUM(CASE WHEN copper_upgrade_hm_color_code = 4 THEN COPPER_UPGRADE ELSE 0 END) AS copper_upgrade_opp_4
			  FROM SOT.SALES_OPP_ZIP_PROD ${whereCondition}		
		`);
  };
  
  module.exports = { get };
  

