const R = require("ramda");

const get = async (pgClient, params) => {
  const defaultLimit = 8;
  const {
    marketType,
    market,
    searchedZip,
    searchedCounty,
    searchedDMA,
    searchedPSA,
    sorters,
    filters,
    limit,
    overallCatVariable,
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
    // Uncomment this line if we want to filter psa table by heatmap overall cat
    // let whereCondition = ` 1=1 ${overallCatVariable} `;
    // comment this line if we want to filter psa table by heatmap overall cat
    let whereCondition = ` 1=1 `;
    if (searchedZip && searchedZip !== "undefined") {
      return ` ZIP='${searchedZip}' AND (${filterClause()})`;
    } else if (searchedCounty && searchedCounty !== "undefined") {
      return ` county_fips='${searchedCounty}' AND (${filterClause()})`;
    } else if (searchedDMA && searchedDMA !== "undefined") {
      return ` dma='${searchedDMA}' AND (${filterClause()})`;
    } else if (searchedPSA && searchedPSA !== "undefined") {
      return ` zip_co_psa='${searchedPSA}' AND (${filterClause()})`;
    } else {
      if (marketType == "REGION") {
        whereCondition = `${whereCondition} AND sales_region = '${market}'`;
      } else if (marketType == "MARKET") {
        whereCondition = `${whereCondition} AND sales_market = '${market}'`;
      }
      return ` ${whereCondition} AND (${filterClause()})`;
    }
  };

  totalPagesResult = await pgClient.query(
    `SELECT CEIL(count(*)/(${
      limit || defaultLimit
    }*1.00)) last_page FROM SOT.SALES_OPP_PSA_PROD WHERE ${whereClause()}`
  );

  const result = await pgClient.query(
    `SELECT A.*, CASE WHEN evnt.zip_co_psa IS NOT NULL THEN 'Yes' ELSE 'No' END AS PSA_EVENTS_EXISTS FROM (
      SELECT TDATE.DATA_DATE, T1.* FROM(SELECT ZIP_CO_PSA, LATITUDE::TEXT, LONGITUDE::TEXT,        
		    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
        WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
        WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
        WHEN WIRELESS_SCORE = 2 THEN '2 (Uneven)'
        WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
        ELSE 'Not enough Samples' END AS SIMPLE_COVERAGE_SCORE,
        COPPER_UPGRADE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        FIBER_PERCENTAGE::FLOAT AS FIBER_PERCENTAGE, FIBER_OPPORTUNITY, MDU_DENSITY_TEXT,
        MARKET_RANK, DISTINCT_MAPPABLE, MISSING_LAT_LONG, WIRELESS_SCORE , CMA, CMA_NAME, COUNTY_FIPS, ZIP,
        TO_CHAR(fiber_customer_wireless_customer, '999,999,999,999') AS fiber_customer_wireless_customer,TO_CHAR(fiber_customer_no_wireless, '999,999,999,999') AS fiber_customer_no_wireless,
        TO_CHAR(copper_upgrade_wireless_customer, '999,999,999,999') AS copper_upgrade_wireless_customer,TO_CHAR(copper_upgrade_no_wireless, '999,999,999,999') AS copper_upgrade_no_wireless,
        TO_CHAR(wireless_customer_no_fiber, '999,999,999,999') AS wireless_customer_no_fiber,TO_CHAR(no_fiber_no_wireless, '999,999,999,999') AS no_fiber_no_wireless    
        FROM SOT.SALES_OPP_PSA_PROD psa WHERE ${whereClause()}) T1
        LEFT JOIN (SELECT DATA_DATE FROM SOT.SALES_OPP_DATA_INFO_TEST WHERE DATA_SOURCE = 'OVALS_Active_Fiber')TDATE ON 1=1
        ORDER BY T1.MARKET_RANK ASC) A
		    LEFT OUTER JOIN (
						SELECT zip_co_psa FROM SOT.SALES_OPP_PSA_PROD as psa
						WHERE ${whereClause()} AND EXISTS (SELECT * FROM sot.SALES_OPP_PSA_EVENT_DATA AS psa_event WHERE psa.zip_co_psa = psa_event.psa)
						) evnt ON A.zip_co_psa = evnt.zip_co_psa
		${sortClause()} OFFSET ${offset} ${limitClause()}`
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
