const R = require("ramda");

const get = async (pgClient, params) => {
  const { accMasterPropertyId } = params;

  //TODO: add mdu_acc_prod.ab_avg_market_pen, mdu_acc_prod.sales_region, mdu_acc_prod.sales_market, mdu_acc_prod.dma, mdu_acc_prod.zip 
  return await pgClient.query(
    `select fa.zip_co_psa, fa.addr_id, fa.house_number,fa.prefix,fa.street_name, fa.unit_number, fa.city,fa.state,fa.zip,fa.wireless_score,
     fa.customer, fa.dwelling_type, fa.latitude::text, fa.longitude::text,
     mdu_acc_prod.acc_mstr_prpty_id, mdu_acc_prod.property_name, mdu_acc_prod.contract_type, mdu_acc_prod.preferred_partner, 
     mdu_acc_prod.area_mgr,mdu_acc_prod.gm, to_char(mdu_acc_prod.fibr_elgbl_yrmo, 'YYYY-MM-DD') as fibr_elgbl_yrmo,
     mdu_acc_prod.fiber_customers,mdu_acc_prod.fiber_opportunity_new, 
     mdu_acc_elu_prod.hsiaplan  
     from sot.sales_opp_fiber_addr fa
     LEFT OUTER JOIN sot.sales_opp_mdu_acc_elu_prod mdu_acc_elu_prod ON fa.network_service_addr = mdu_acc_elu_prod.elu
     LEFT OUTER JOIN sot.sales_opp_mdu_acc_prod mdu_acc_prod ON mdu_acc_elu_prod.acc_id = mdu_acc_prod.acc_id
     WHERE mdu_acc_prod.acc_mstr_prpty_id  =  '${accMasterPropertyId}' and mdu_acc_prod.mappable_location = true
    `
  );
};

module.exports = { get };
