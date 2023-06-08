// const md5 = require('js-md5');
// const blobService = require('../../common/blobService');

const mvt = async (bbox, pgClient, filterParams) => {
  const whereClauseForFilters = () => {
    let whereClause = "1=1";
    if (filterParams.searchedZip && filterParams.searchedZip !== "undefined") {
      whereClause = `${whereClause} and psa.zip='${filterParams.searchedZip}'`;
    }
    if (
      filterParams.searchedCounty &&
      filterParams.searchedCounty !== "undefined"
    ) {
      whereClause = `${whereClause} and psa.county_fips='${filterParams.searchedCounty}'`;
    }
    if (filterParams.searchedDMA && filterParams.searchedDMA !== "undefined") {
      whereClause = `${whereClause} and psa.dma='${filterParams.searchedDMA}'`;
    }
    return whereClause;
  };

  // const partitionKey = md5(bbox.join(',') + whereClauseForFilters().trim());

  // const containerName = `fot-data-cache-wireless-coverage-and-fiber-heatmap`;
  // // Create a unique name for the blob
  // const blobName = `wireless-coverage-and-fiber-heatmap-psa-${partitionKey}.mvt`;

  // const mvtString = await blobService.get(containerName, blobName);
  // if (mvtString) {
  //   return mvtString;
  // }

  const results = await pgClient.query(
    `
        WITH geom_envelop (geom_e) AS
        (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
        geom_filter AS
        (
            SELECT * from (
            SELECT psa.zip_co_psa as id, psa.zip_co_psa, psa.wireless_score, psa.latitude, psa.longitude, 
            point_geom.geom
            from sot.sales_opp_psa_prod psa join sot.sales_opp_point_geom  point_geom
            on psa.latitude = point_geom.latitude and psa.longitude = point_geom.longitude where ${whereClauseForFilters()}) nf 
            , geom_envelop ge
        WHERE ST_Within(nf.geom, ge.geom_e))
        SELECT ST_AsMVT(q, 'psaLayer', 4096, 'geom') FROM (
        SELECT id, zip_co_psa, wireless_score, latitude, longitude, ST_AsMVTGeom(geom, geom_e, 4096, 256, true) geom FROM geom_filter gf) q;
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
