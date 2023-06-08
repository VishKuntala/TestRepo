const search = (pgClient, filterParams) =>
  pgClient.query(`
    SELECT zip_co_psa as name, CONCAT(latitude, '|', longitude) as value FROM sot.sales_opp_psa_prod
    WHERE zip_co_psa like '%${filterParams.searchId.toUpperCase()}%'
`);

const points = (pgClient, filterParams) =>
  pgClient.query(`
SELECT zip_co_psa, latitude::text, longitude::text, wireless_score FROM sot.sales_opp_psa_prod
`);

const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `
    SELECT 
    zip_co_psa, wireless_score, fiber_available, fiber_customers, fiber_percentage, fiber_opportunity, copper_upgrade, mdu_density_text,
    fiber_customer_wireless_customer,fiber_customer_no_wireless,copper_upgrade_wireless_customer,copper_upgrade_no_wireless,wireless_customer_no_fiber,no_fiber_no_wireless,
    latitude::text, longitude::text, dma, county_fips, zip 
	  FROM sot.sales_opp_psa_prod WHERE zip_co_psa  = $1
`,
    [pointId]
  );

module.exports = { points, point, search };
