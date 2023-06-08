// const md5 = require('js-md5');
// const blobService = require('../../common/blobService');

const mvt = async (bbox, pgClient, filterParams) => {
  const { marketType, market } = filterParams;

  const whereClauseForFilters = () => {
    let whereClause = "1=1";
    if (marketType == "REGION") {
      whereClause = `${whereClause} and UPPER(fct.sales_region) = UPPER('${market}')`;
    }
    if (marketType == "MARKET") {
      whereClause = `${whereClause} and UPPER(fct.sales_market) = UPPER('${market}')`;
    }
    return whereClause;
  };

  // const partitionKey = md5(bbox.join(',') + whereClauseForFilters().trim());

  // const containerName = `fot-data-cache-fiber-opportunity-heatmap`;
  // // Create a unique name for the blob
  // const blobName = `fiber-opportunity-heatmap-county-${partitionKey}.mvt`;

  // const mvtString = await blobService.get(containerName, blobName);
  // if (mvtString) {
  //   return mvtString;
  // }

  const results = await pgClient.query(
    `
    WITH
    geom_filter AS
    (
        SELECT * from (
        SELECT dim.gid as id, dim.cnty_fips, dim.name, dim.geom,
        fct.copper_upgrade, fct.totalarea, fct.totalpops, fct.pop_density, fct.wireless_score, fct.fiber_score,
        fct.fiber_available, fct.fiber_customers, fct.fiber_percentage::float, fct.overall_cat, fct.state_abbr, fct.county_state,
        fct.fiber_opportunity, fct.number_of_psas, fct.wireless_category, fct.fiber_availability, fct.attr_store_count,
        fct.ar_store_count, fct.all_store_count, fct.sales_market, fct.elderly_percent,
        COALESCE (fct.fiber_penetration_hm_color_code, 1) as fiber_penetration_hm_color_code, 
        COALESCE (fct.wireless_coverage_hm_color_code, 1) as wireless_coverage_hm_color_code, 
        COALESCE (fct.copper_upgrade_hm_color_code, -1) as copper_upgrade_hm_color_code, 
        COALESCE (fct.fiber_opportunity_hm_color_code, -1) as fiber_opportunity_hm_color_code,
        COALESCE(fct.fiber_customer_wireless_customer, 0) as fiber_customer_wireless_customer,
        COALESCE(fct.fiber_customer_no_wireless, 0) as fiber_customer_no_wireless,
        COALESCE(fct.copper_upgrade_wireless_customer, 0) as copper_upgrade_wireless_customer,
        COALESCE(fct.copper_upgrade_no_wireless, 0) as copper_upgrade_no_wireless,
        COALESCE(fct.wireless_customer_no_fiber, 0) as wireless_customer_no_fiber,
        COALESCE(fct.no_fiber_no_wireless, 0) as no_fiber_no_wireless 
        FROM spatial.county as dim         
        LEFT OUTER JOIN sot.sales_opp_county_prod fct on dim.gid = fct.county_gid 
        where ${whereClauseForFilters()} AND ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
        ) nf 
    )
    SELECT ST_AsMVT(q, 'countyLayer', 4096, 'geom') FROM (
    SELECT 
    id, cnty_fips, name, 
    copper_upgrade, totalarea, totalpops, pop_density, wireless_score, fiber_score,
    fiber_available, fiber_customers, fiber_percentage::float, overall_cat, state_abbr, county_state,
    fiber_opportunity, number_of_psas, wireless_category, fiber_availability, attr_store_count,
    ar_store_count, all_store_count, sales_market, elderly_percent, 
    fiber_penetration_hm_color_code, wireless_coverage_hm_color_code, copper_upgrade_hm_color_code, fiber_opportunity_hm_color_code,
    fiber_customer_wireless_customer,fiber_customer_no_wireless,copper_upgrade_wireless_customer,copper_upgrade_no_wireless,wireless_customer_no_fiber,no_fiber_no_wireless,
    ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
      `,
    [bbox[0], bbox[1], bbox[2], bbox[3]]
  );
  // const tile = results.rows[0];
  // if (tile?.st_asmvt.length !== 0) {
  //   await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
  //   return tile.st_asmvt;
  // }
  // return null;
  const tile = results.rows[0];
  if (tile?.st_asmvt.length !== 0) {
    return tile.st_asmvt;
  }
  return null;
};

module.exports = { mvt };
