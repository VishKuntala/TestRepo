const search = (pgClient, filterParams) =>
  pgClient.query(
    `SELECT concat(acc_mstr_prpty_id, ' (', property_name, ')') as name, CONCAT(latitude, '|', longitude) as value 
  FROM sot.sales_opp_mdu_acc_prod
  WHERE acc_mstr_prpty_id like '%${filterParams.searchId.toUpperCase()}%' 
  OR property_name like '%${filterParams.searchId.toUpperCase()}%' 
  ORDER BY LENGTH(acc_mstr_prpty_id) asc
  limit 10
  `
  );

const points = (pgClient, filterParams) => {
  const { generalManager, areaManager, preferredPartner, contractType } = filterParams;

  if (Object.keys(filterParams).length === 0 || (generalManager === "undefined" && areaManager === "undefined" && preferredPartner === "undefined" && contractType === "undefined"))
    return pgClient.query(`select * from sot.sales_opp_mdu_acc_prod where 1=2`);    

  // TODO: add ab_avg_market_pen,sales_region, sales_market, dma, zip columns
  const baseQuery = `select acc_mstr_prpty_id, property_name, fiber_available, fiber_opportunity, fiber_penetration_rate::float as fiber_penetration_rate, 
  copper_upgrade, psa_coverage_score, 
  contract_type, gm, area_mgr, preferred_partner, fibr_elgbl_yrmo, latitude::text, longitude::text,
  fiber_customers,fiber_opportunity_new         
  FROM sot.sales_opp_mdu_acc_prod`;

  const whereClauseForFilters = () => {
    let whereCondition = "1=1 and mappable_location = true";
    let inCondition = "1=1";
    if (generalManager && generalManager !== "undefined" && generalManager !== "null") {
      inCondition =  "gm_id IN (" + generalManager.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    if (areaManager && areaManager !== "undefined" && areaManager !== "null") {
      inCondition =  "area_mgr_id IN (" + areaManager.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    if (preferredPartner && preferredPartner !== "undefined" && preferredPartner !== "null") {
      inCondition =  "preferred_partner IN (" + preferredPartner.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    if (contractType && contractType !== "undefined" && contractType !== "null") {
      inCondition =  "contract_type IN (" + contractType.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    return whereCondition;
  };  

  return pgClient.query(
    `        
    ${baseQuery} 
        where ${whereClauseForFilters()}
        `
  );
};

// TODO: add ab_avg_market_pen,sales_region, sales_market, dma, zip columns
const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `select acc_mstr_prpty_id, property_name, fiber_available, fiber_opportunity, fiber_penetration_rate::float as fiber_penetration_rate, 
    copper_upgrade, psa_coverage_score, 
    contract_type, gm, area_mgr, preferred_partner, fibr_elgbl_yrmo, latitude::text, longitude::text,
    fiber_customers,fiber_opportunity_new         
    FROM sot.sales_opp_mdu_acc_prod 
    WHERE acc_mstr_prpty_id = $1 and mappable_location = true`,
    [pointId]
  );

module.exports = { search, points, point };
