const md5 = require('js-md5');
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');
// const blobService = require('../../../../wst-common/blobService');
// const TableCacheService = require('../../../../wst-common/TableCacheService');


const mvt = async (bbox, pgClient, filterParams, channel) => {
  const config = conf(process.env.GROUP_MEMBERSHIP);
  // const tableCacheService = new TableCacheService();
  const whereClause = filterParams.whereClause || sqlBuilder.whereClause(filterParams);
  const { attribute } = filterParams;

  const partitionKey = md5(bbox.join(',') + whereClause.trim() + attribute);
 
  const containerName = `wst-data-cache-${channel.toLowerCase()}-locations`;
  // Create a unique name for the blob
  const blobName = `${channel.toLowerCase()}-locations-${partitionKey}.mvt`;

  // await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'locations', null, attribute );

  /* const mvtString = await blobService.get(containerName, blobName);
  if (mvtString) {
    return mvtString;
  } */

  const results =  await pgClient.query(`
    WITH 
    geom_filter AS
    (
        SELECT * from (
          SELECT ts.addr_id as id, ts.zip_co_psa, cpg.geom, ts.${attribute}::INT8 as location_attribute
          from ${config.tableName} lus 
          inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
          JOIN wst.neon_gigapower_point_geom cpg
          on ts.latitude = cpg.latitude
          and ts.longitude = cpg.longitude
          left join wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
          where COALESCE(mdu.show_map,1) = 1 and
         ST_Within(cpg.geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
         ${whereClause}) nf 
    )
    SELECT ST_AsMVT(q, 'wsLayer', 4096, 'geom') FROM (
    SELECT id, zip_co_psa, location_attribute, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
  `, [bbox[0], bbox[1], bbox[2], bbox[3]]
    );

    const tile = results.rows[0];
    if (tile?.st_asmvt.length !== 0) {
      // await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
      return tile.st_asmvt;
    }
    return null;
  
};
  
  module.exports = { mvt };
  