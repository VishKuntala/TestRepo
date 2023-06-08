const md5 = require('js-md5');
const { sqlBuilder } = require('../../common');
const config = require('../../common/config');
const blobService = require('../../../../common/blobService');
const TableCacheService = require('../../../../common/TableCacheService');


const mvt = async (bbox, pgClient, filterParams, channel) => {
  const tableCacheService = new TableCacheService();
  const whereClause = filterParams.whereClause || sqlBuilder.whereClause(filterParams);

  const partitionKey = md5(bbox.join(',') + whereClause.trim());

  const containerName = `wst-data-cache-location-density-heatmap`;
  // Create a unique name for the blob
  const blobName = `location-density-heatmap-zip-${channel}-${partitionKey}.mvt`;
 
  await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'zips','locationDensity' );

  const mvtString = await blobService.get(containerName, blobName);
  if (mvtString) {
    return mvtString;
  }

  const results =  await pgClient.query(
        `
          WITH 
          geom_filter AS
          (
              SELECT * from (
                SELECT py.gid as id, py.geom,density_percentage, py.zip, py.state
                FROM spatial.zip py LEFT OUTER JOIN (
                SELECT (numerator*100)/denominator as density_percentage, A.zipcode from (
	             (
                 SELECT count(*) as denominator, zipcode 
	              from ${config.tableName} group by zipcode) A
	              JOIN 
                (
                  SELECT count(*) as numerator, zipcode from ${config.tableName} lus 
                  inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey
                  WHERE 1=1 ${whereClause}
                  group by zipcode) B
	                on A.zipcode = B.zipcode)
	              ) C
	              on py.zip = C.zipcode        
                WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
              ) nf 
          )
          SELECT ST_AsMVT(q, 'zipLayer', 4096, 'geom') FROM (
          SELECT 
                id, zip, state, density_percentage,
                ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
          `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );

      const tile = results.rows[0];
      if (tile?.st_asmvt.length !== 0) {
        await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
        return tile.st_asmvt;
      }
      return null;
    
  };
  
  module.exports = { mvt };
  