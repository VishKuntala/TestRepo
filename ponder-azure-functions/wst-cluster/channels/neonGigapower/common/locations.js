const md5 = require('js-md5');
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');

// const blobService = require('../../../../wst-common/blobService');
const { where } = require('ramda');

const mvt = async (bbox, pgClient, filterParams, sourceLayer = 'wsLayer') => {

  const config = conf(process.env.GROUP_MEMBERSHIP);

  const { channel } = filterParams;

  const whereClause = sqlBuilder.whereClause(filterParams);
  const { attribute } = filterParams;

  const partitionKey = md5(bbox.join(',') + whereClause.trim());
 
  const containerName = `wst-data-cache-${channel}-location-clusters`;
  // Create a unique name for the blob
  const blobName = `${channel}-location-cluster-${partitionKey}.mvt`;
  /* const mvtString = await blobService.get(containerName, blobName);
  if (mvtString) {
    return mvtString;
  } */


  const results =  await pgClient.query(`
    WITH  
    geom_filter AS
    (
        SELECT * from (
         SELECT lus.zip_co_psa as id, lus.geom, ${attribute}::INT8 as location_attribute
         from ${config.tableName} lus
         inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
         where 
        ST_Within(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
        ${whereClause}) nf 
    )
    SELECT ST_AsMVT(q, '${sourceLayer}', 4096, 'geom') FROM (
    SELECT id, location_attribute, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
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
  