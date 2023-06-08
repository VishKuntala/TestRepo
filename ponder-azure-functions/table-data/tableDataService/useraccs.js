//NOTE: This endpoint no longer in use as we are now loading the table data from map
const R = require("ramda");

const get = async (pgClient, params) => {
  const defaultLimit = 8;

  const {
    generalManager,
    areaManager,
    preferredPartner,
    contractType,
    sorters,
    filters,
    limit,
  } = params;

  let { offset } = params;
  if (offset) {
    offset = (offset - 1) * limit;
  } else {
    offset = 0;
  }

  const sortClause = () => {
    if (sorters && sorters.length) {
      return `order by ${sorters[0].field} ${sorters[0].dir}`;
    }
    return "";
  };

  const filterClause = () => {
    if (filters && filters.length) {
      return R.join(
        " OR ",
        R.map(
          (item) => `LOWER(${item.field}) like '%${item.value.toLowerCase()}%'`,
          filters
        )
      );
    }
    return "1=1";
  };

  const limitClause = () => {
    if (!limit) {
      return "";
    }
    return ` LIMIT ${limit}`;
  };

  const whereClause = () => {
    if (!generalManager && !areaManager && !preferredPartner && !contractType)
      return `1=2 AND (${filterClause()})`;

    let whereCondition = "1=1";
    let inCondition = "1=1";
    if (generalManager && generalManager !== "undefined") {
      inCondition =  "gm_id IN (" + generalManager.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    if (areaManager && areaManager !== "undefined") {
      inCondition =  "area_mgr_id IN (" + areaManager.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    if (preferredPartner && preferredPartner !== "undefined") {
      inCondition =  "preferred_partner IN (" + preferredPartner.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    if (contractType && contractType !== "undefined") {
      inCondition =  "contract_type IN (" + contractType.split(",").map(item => "'" + item + "'").join(",") + ")"
      whereCondition = `${whereCondition} AND ${inCondition}`;
    }
    return `${whereCondition}  AND (${filterClause()})`;
  };  
 
  totalPagesResult = await pgClient.query(
    `SELECT CEIL(count(*)/(${
      limit || defaultLimit
    }*1.00)) last_page FROM sot.sales_opp_mdu_acc_prod WHERE ${whereClause()}`
  );

  // TODO: add ab_avg_market_pen,sales_region, sales_market, dma, zip columns
  result = await pgClient.query(
    `select acc_mstr_prpty_id, property_name, fiber_available, fiber_opportunity, fiber_penetration_rate::float as fiber_penetration_rate, 
       copper_upgrade, psa_coverage_score, 
       contract_type, gm, area_mgr, preferred_partner, fibr_elgbl_yrmo, latitude::text, longitude::text,
       fiber_customers,fiber_opportunity_new         
       FROM sot.sales_opp_mdu_acc_prod WHERE ${whereClause()} ${sortClause()} OFFSET ${offset} ${limitClause()}`
  );

  //export table data
  if (!limit) {
    return result.rows;
  }
  
  return {
    last_page: parseInt(totalPagesResult.rows[0].last_page, 10),
    data: result.rows,
  };
};

module.exports = { get };
