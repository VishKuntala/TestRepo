const points = (pgClient, filterParams) => {
  const baseQuery = `SELECT store_category, 
  CASE WHEN store_category = 'ATTR' THEN 1 WHEN store_category = 'AR' THEN 2 ELSE NULL END AS store_category_id, 
  location_id, location_name, city, zip_code, county, 
  latitude::text, longitude::text FROM sot.sales_att_store_loc_prod `;
  let whereCondition = "";

  if (filterParams.searchedZip && filterParams.searchedZip !== "undefined" && filterParams.searchedZip !== "null") {
    whereCondition = `WHERE store_category = '${filterParams.category}' AND zip_code='${filterParams.searchedZip}'`;
  } else if (
    filterParams.searchedCounty &&
    filterParams.searchedCounty !== "undefined" &&
    filterParams.searchedCounty !== "null"
  ) {
    whereCondition = `WHERE store_category = '${filterParams.category}' AND county_fip='${filterParams.searchedCounty}'`;
  } else if (
    filterParams.searchedDMA &&
    filterParams.searchedDMA !== "undefined" &&
    filterParams.searchedDMA !== "null"
  ) {
    whereCondition = `WHERE store_category = '${filterParams.category}' AND dma='${filterParams.searchedDMA}'`;
  } else {
    const { category, market, marketType } = filterParams;
    if (marketType === "REGION") {
      whereCondition = `WHERE store_category = '${category}' AND region = '${market}'`;
    } else if (marketType === "MARKET") {
      whereCondition = `WHERE store_category = '${category}' AND market_group = '${market}'`;
    } else {
      whereCondition = `WHERE store_category = '${category}'`;
    }
  }

  return pgClient.query(
    `
    ${baseQuery} 
    ${whereCondition}
    `
  );
};

const point = (pgClient, pointId, filterParams) =>
  pgClient.query(
    `
SELECT store_category, 
CASE WHEN store_category = 'ATTR' THEN 1 WHEN store_category = 'AR' THEN 2 ELSE NULL END AS store_category_id, 
location_id, location_name, city, zip_code, county, 
master_dealer, address_1, address_2, state, region market_group,
latitude, longitude FROM sot.sales_att_store_loc_prod 
WHERE location_id = $1
`,
    [pointId]
  );

module.exports = { points, point };
