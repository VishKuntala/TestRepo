//mdus popup information comes from this endpoint, moved it to separate call because of extra joins for acc data
const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `
    select fa.house_number,fa.prefix,fa.street_name,fa.city,fa.state,fa.zip,fa.wireless_score,fa.customer_category_id,fa.customer_category,
    fa.latitude::text, fa.longitude::text,fa.zip_co_psa,fa.customer_count,fa.opportunity_count, fa.upgrade_count,
    CASE WHEN fa.REGREEN = 'true' THEN 'Yes' ELSE 'No' END AS REGREEN, 
    CASE WHEN fa.ADSL = 'true' THEN 'Yes' ELSE 'No' END AS ADSL, 
    CASE WHEN fa.CSI_ELIGIBLE = 'true' THEN 'Yes' ELSE 'No' END AS CSI_ELIGIBLE,
    mdu_acc_prod.acc_mstr_prpty_id, mdu_acc_prod.property_name   
    from sot.sales_opp_fiber_addr fa
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_elu_prod mdu_acc_elu_prod ON fa.network_service_addr = mdu_acc_elu_prod.elu
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_prod mdu_acc_prod ON mdu_acc_elu_prod.acc_id = mdu_acc_prod.acc_id
    WHERE fa.addr_id  = $1
`,
    [pointId]
  );

module.exports = { point };
