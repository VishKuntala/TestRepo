// const md5 = require('js-md5');
// const blobService = require('../../common/blobService');

const mvt = async (bbox, pgClient, filterParams) => {
  const {
    searchedZip,
    searchedCounty,
    searchedDMA,
    customerCategoryId,
    searchedPSA,
  } = filterParams;
  const whereClauseForFilters = () => {
    let whereClause = "1=1";
    if (searchedZip && searchedZip !== "undefined") {
      whereClause = `${whereClause} and fa.zip='${searchedZip}'`;
    }
    if (searchedCounty && searchedCounty !== "undefined") {
      whereClause = `${whereClause} and fa.county_fips='${searchedCounty}'`;
    }
    if (searchedDMA && searchedDMA !== "undefined") {
      whereClause = `${whereClause} and fa.dma='${searchedDMA}'`;
    }
    if (searchedPSA && searchedPSA !== "undefined") {
      whereClause = `${whereClause} and fa.zip_co_psa='${searchedPSA}'`;
    }
    return whereClause;
  };

  let mduTableJoinClause = `LEFT OUTER JOIN sot.SALES_OPP_MDU_PROD mdu ON fa.latitude = mdu.latitude and fa.longitude = mdu.longitude`;
  if (customerCategoryId == 7 || customerCategoryId == 8)
    mduTableJoinClause = `INNER JOIN sot.SALES_OPP_MDU_PROD mdu ON fa.latitude = mdu.latitude and fa.longitude = mdu.longitude`;

  // const partitionKey = md5(bbox.join(',') + whereClauseForFilters().trim() + mduTableJoinClause.trim() + customerCategoryId);

  // const containerName = `fot-data-cache-wireless-coverage-and-fiber-heatmap`;
  // // Create a unique name for the blob
  // const blobName = `wireless-coverage-and-fiber-heatmap-address-${partitionKey}.mvt`;

  // const mvtString = await blobService.get(containerName, blobName);
  // if (mvtString) {
  //   return mvtString;
  // }

  const results = await pgClient.query(
    `
    WITH geom_filter AS
    (
    SELECT * from (
    SELECT addr_id, fa.network_service_addr as id, fa.zip_co_psa, fa.sales_category, fa.wireless_score, fa.latitude, fa.longitude,
    fa.house_number, fa.prefix, fa.street_name, fa.city, fa.state, fa.zip,
    CONCAT(fa.house_number, ' ', fa.prefix, ' ', fa.street_name, ', ',fa.city, ' ',fa.zip, ' ', fa.state) as address,
    CASE WHEN fa.REGREEN = 'true' THEN 'Yes' ELSE 'No' END AS REGREEN, 
    CASE WHEN fa.ADSL = 'true' THEN 'Yes' ELSE 'No' END AS ADSL, 
    CASE WHEN fa.CSI_ELIGIBLE = 'true' THEN 'Yes' ELSE 'No' END AS CSI_ELIGIBLE,
    fa.unit_number,fa.dwelling_type, customer, customer_category_id, customer_category, point_geom.geom,
    mdu.fiber_available, mdu.fiber_opportunity, mdu.FIBER_PENETRATION_RATE::float AS fiber_penetration_rate, mdu.market_rank,     
    CASE WHEN mdu.acc_flag IS TRUE THEN 'Yes' ELSE 'No' END AS mdu_acc_flag,
    CASE WHEN mdu.acc_flag IS TRUE THEN 1 ELSE 2 END AS mdu_acc_flag_code,
    mdu_acc_prod.acc_mstr_prpty_id, mdu_acc_prod.property_name, mdu_acc_prod.preferred_partner, mdu_acc_prod.contract_type, mdu_acc_prod.gm, mdu_acc_prod.area_mgr, mdu_acc_prod.fibr_elgbl_yrmo,
    mdu_acc_prod.fiber_available as mdu_acc_prod_fiber_available,
    mdu_acc_prod.fiber_opportunity as mdu_acc_prod_fiber_opportunity,
    mdu_acc_prod.latitude as mdu_acc_prod_latitude,
    mdu_acc_prod.longitude as mdu_acc_prod_longitude,
    mdu_acc_prod.copper_upgrade as mdu_acc_prod_copper_upgrade,
    mdu_acc_prod.psa_coverage_score as mdu_acc_prod_psa_coverage_score,
    mdu_acc_elu_prod.hsiaplan,
    CONCAT(TO_CHAR(mdu_acc_prod.fiber_penetration_rate,'FM99990.0'),'%') as mdu_acc_prod_fiber_penetration_rate  
    from sot.sales_opp_fiber_addr fa join sot.sales_opp_point_geom  point_geom on fa.latitude = point_geom.latitude and fa.longitude = point_geom.longitude
    ${mduTableJoinClause}
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_elu_prod mdu_acc_elu_prod ON fa.network_service_addr = mdu_acc_elu_prod.elu
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_prod mdu_acc_prod ON mdu_acc_elu_prod.acc_id = mdu_acc_prod.acc_id
    where customer_category_id = '${customerCategoryId}' AND ${whereClauseForFilters()} 
    AND ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
    ) nf     
)
SELECT ST_AsMVT(q, 'customerCategoryId${customerCategoryId}AddressLayer', 4096, 'geom') FROM (
SELECT addr_id, id, zip_co_psa, customer, customer_category_id, customer_category, sales_category, house_number, prefix, street_name, city, state, zip, address, 
regreen, adsl, csi_eligible, 
unit_number,dwelling_type, latitude, longitude, wireless_score, fiber_available, fiber_opportunity, fiber_penetration_rate, 
market_rank, mdu_acc_flag, mdu_acc_flag_code, property_name, acc_mstr_prpty_id, preferred_partner, contract_type, gm, area_mgr, fibr_elgbl_yrmo, mdu_acc_prod_fiber_available, mdu_acc_prod_fiber_opportunity, mdu_acc_prod_latitude, mdu_acc_prod_longitude, mdu_acc_prod_fiber_penetration_rate, mdu_acc_prod_copper_upgrade, mdu_acc_prod_psa_coverage_score, 
hsiaplan, 
ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($5, $6, $7, $8, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
`,
    [
      bbox[0],
      bbox[1],
      bbox[2],
      bbox[3],
      bbox[0],
      bbox[1],
      bbox[2],
      bbox[3]
    ]
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
