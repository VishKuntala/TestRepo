const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `
    select house_number,prefix,street_name,city,state, zip,wireless_score, customer_category,
    latitude::text, longitude::text,zip_co_psa,customer_count,opportunity_count, upgrade_count,
    CASE WHEN REGREEN = 'true' THEN 'Yes' ELSE 'No' END AS REGREEN, 
    CASE WHEN ADSL = 'true' THEN 'Yes' ELSE 'No' END AS ADSL, 
    CASE WHEN CSI_ELIGIBLE = 'true' THEN 'Yes' ELSE 'No' END AS CSI_ELIGIBLE 
    from sot.sales_opp_fiber_addr WHERE addr_id  = $1
`,
    [pointId]
  );

module.exports = { point };
