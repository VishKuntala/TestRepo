const md5 = require('js-md5');
const sqlBuilder = require('./sqlBuilder');
const config = require('./config');
const blobService = require('../../../common/blobService');
const TableCacheService = require('../../../common/TableCacheService');


const mvt = async (bbox, pgClient, filterParams, channel) => {
  const tableCacheService = new TableCacheService();
  const whereClause = filterParams.whereClause || sqlBuilder.whereClause(filterParams);

  const { attribute } = filterParams;

  const partitionKey = md5(bbox.join(',') + whereClause.trim() + attribute);
 
  const containerName = `wst-data-cache-${channel}-locations`;
  // Create a unique name for the blob
  const blobName = `${channel}-locations-${partitionKey}.mvt`;

  await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'locations', null, attribute );

  const mvtString = await blobService.get(containerName, blobName);
  if (mvtString) {
    return mvtString;
  }


  const results =  await pgClient.query(`
    WITH 
    geom_filter AS
    (
        SELECT * from (
         SELECT lus.mikey::text as id, cpg.geom, ${attribute}::INT8 as location_attribute
         from ${config.tableName} lus 
         inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey JOIN WST.channel_point_geom cpg
         on lus.latitude = cpg.latitude
         and lus.longitude = cpg.longitude
         where 
        ST_Within(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
        ${whereClause}) nf 
    )
    SELECT ST_AsMVT(q, 'wsLayer', 4096, 'geom') FROM (
    SELECT id, location_attribute, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
  `, [bbox[0], bbox[1], bbox[2], bbox[3]]
    );

    const tile = results.rows[0];
    if (tile?.st_asmvt.length !== 0) {
      await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
      return tile.st_asmvt;
    }
    return null;
  
};
  
  module.exports = { mvt };
  