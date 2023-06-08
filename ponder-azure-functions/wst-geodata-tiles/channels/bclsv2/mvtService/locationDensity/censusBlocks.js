const md5 = require('js-md5');
const { sqlBuilder } = require('../../common');
const config = require('../../common/config');
const blobService = require('../../../../common/blobService');
const TableCacheService = require('../../../../common/TableCacheService');

const mvt = async (bbox, pgClient, filterParams, channel) => {
  const tableCacheService = new TableCacheService();
  const whereClause= filterParams.whereClause || sqlBuilder.whereClause(filterParams);


  const partitionKey = md5(bbox.join(',') + whereClause.trim());

  const containerName = `wst-data-cache-location-density-heatmap`;
  // Create a unique name for the blob
  const blobName = `location-density-heatmap-census-block-${channel}-${partitionKey}.mvt`;

  await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'censusBlocks','locationDensity' );

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
                SELECT py.gid as id, py.geom,density_percentage, py.name
                FROM spatial.census_block py LEFT OUTER JOIN (
                SELECT (numerator*100)/denominator as density_percentage, A.census_block_gid from (
	             (
                 SELECT count(*) as denominator, census_block_gid 
	              from ${config.tableName} lus 
                  inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey inner join wst.channel_point_geom cpg
                  on lus.latitude = cpg.latitude and
                  lus.longitude = cpg.longitude
                  group by cpg.census_block_gid) A
	              JOIN 
                (
                  SELECT count(*) as numerator, census_block_gid 
                  from ${config.tableName} lus 
                  inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey inner join wst.channel_point_geom cpg
                  on lus.latitude = cpg.latitude and
                  lus.longitude = cpg.longitude
                  WHERE 1=1 ${whereClause}
                  group by cpg.census_block_gid) B
	              on A.census_block_gid = B.census_block_gid)
	              ) C
	              on py.gid = C.census_block_gid        
                WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
              ) nf 
          )
          SELECT ST_AsMVT(q, 'censusBlockLayer', 4096, 'geom') FROM (
          SELECT 
                id, name, density_percentage,
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
  