// const md5 = require('js-md5');
// const blobService = require('../../common/blobService');

const mvt = async (bbox, pgClient, filterParams) => {

  // const partitionKey = md5(bbox.join(','));

  // const containerName = `fot-data-cache-copper-upgrade-heatmap`;
  // // Create a unique name for the blob
  // const blobName = `copper-upgrade-heatmap-censusblock-${partitionKey}.mvt`;

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
                  SELECT dim.gid as id, dim.name, dim.geom,
                  fct.copper_upgrade, fct.totalarea, fct.totalpops, fct.pop_density, fct.wireless_score, fct.fiber_score,
                  COALESCE(fct.fiber_available, 0) as fiber_available, COALESCE(fct.fiber_customers, 0) as fiber_customers, COALESCE(fct.fiber_percentage, 0)::float as fiber_percentage, fct.overall_cat, 
                  fct.fiber_opportunity, fct.number_of_psas, fct.wireless_category, fct.fiber_availability, 
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
                  FROM spatial.census_block as dim
                  LEFT OUTER JOIN sot.sales_opp_census_prod fct on dim.gid = fct.census_block_gid
        where ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
        ) nf 
    )
    SELECT ST_AsMVT(q, 'censusBlockLayer', 4096, 'geom') FROM (
              SELECT
              id, name,
              copper_upgrade, totalarea, totalpops, pop_density, wireless_score, fiber_score,
              fiber_available, fiber_customers, fiber_percentage::float, overall_cat,
              fiber_opportunity, number_of_psas, wireless_category, fiber_availability, 
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
