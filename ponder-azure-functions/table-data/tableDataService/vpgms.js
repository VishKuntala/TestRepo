const R = require("ramda");

const get = async (pgClient, params) => {
  const defaultLimit = 8;

  const {
    marketTypeVariable,
    marketVariable,
    orderVariable,
    overallCatVariable,
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
    return `order by ${orderVariable}`;
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
    let whereCondition = ` AND 1=1 ${overallCatVariable}`;
    if (marketTypeVariable === "REGION" && marketVariable === "EAST")
      whereCondition = `${whereCondition} AND SALES_MARKET_ID <=8`;
    else if (marketTypeVariable === "REGION" && marketVariable === "WEST")
      whereCondition = `${whereCondition} AND SALES_MARKET_ID >=9`;
    else if (marketTypeVariable === "MARKET")
      whereCondition = `${whereCondition} AND SALES_MARKET='${marketVariable}'`;
    return ` ${whereCondition} AND (${filterClause()})`;
  };

  const totalPagesResult = await pgClient.query(
    `SELECT CEIL(count(*)/(${limit || defaultLimit}*1.00)) last_page FROM SOT.sales_opp_sales_market_prod 
       WHERE OVERALL_CAT != 'No Category' ${whereClause()}`
  );

  const result = await pgClient.query(
    `SELECT * FROM (
    SELECT TDATE.DATA_DATE, row_number() OVER (${sortClause()}) as ROWNUM, TBL1.*, 
    CASE WHEN TO_NUMBER(FIBER_AVAILABLE, '999,999,999,999') > 0 THEN 1 ELSE 0 END AS FIBER_AVAILABLE_SORT_VALUE 
    FROM(SELECT COPPER_UPGRADE, 
    SALES_MARKET_ID, SALES_MARKET, ROUND(TOTALAREA,0) AS TOTALAREA, TO_CHAR(TOTALPOPS + 0, '999,999,999,999') AS TOTALPOPS, 
    TO_CHAR(POP_DENSITY + 0, '999,999,999.9') AS POP_DENSITY, 
    WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, 
    TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE::FLOAT AS FIBER_PERCENTAGE, 
    OVERALL_CAT, TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY,
    fiber_penetration_hm_color_code, wireless_coverage_hm_color_code, copper_upgrade_hm_color_code, fiber_opportunity_hm_color_code,      
    FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT,
    TO_CHAR(fiber_customer_wireless_customer, '999,999,999,999') AS fiber_customer_wireless_customer,TO_CHAR(fiber_customer_no_wireless, '999,999,999,999') AS fiber_customer_no_wireless,
    TO_CHAR(copper_upgrade_wireless_customer, '999,999,999,999') AS copper_upgrade_wireless_customer,TO_CHAR(copper_upgrade_no_wireless, '999,999,999,999') AS copper_upgrade_no_wireless,
    TO_CHAR(wireless_customer_no_fiber, '999,999,999,999') AS wireless_customer_no_fiber,TO_CHAR(no_fiber_no_wireless, '999,999,999,999') AS no_fiber_no_wireless 
    FROM sot.sales_opp_sales_market_prod 
    WHERE OVERALL_CAT != 'No Category'  
    ${whereClause()}
    ORDER BY ${orderVariable} )TBL1
    LEFT JOIN (SELECT DATA_DATE FROM sot.sales_opp_data_info_test WHERE DATA_SOURCE = 'OVALS_Active_Fiber')TDATE ON 1=1
    ) A ${sortClause()} OFFSET ${offset} ${limitClause()}
    `
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
