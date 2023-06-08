const md5 = require('js-md5');
const { sqlBuilder } = require('../../../../../wst-common/channels/neonGigapower');
const conf = require('../../../../../wst-common/channels/neonGigapower/config');
// const blobService = require('../../../../../wst-common/blobService');
// const TableCacheService = require('../../../../../wst-common/TableCacheService');


const mvt = async (bbox, pgClient, filterParams, channel) => {
  const config = conf(process.env.GROUP_MEMBERSHIP);
  // const tableCacheService = new TableCacheService();
  const whereClause = filterParams.whereClause || sqlBuilder.whereClause(filterParams);

  const partitionKey = md5(bbox.join(',') + whereClause.trim());

  const containerName = `wst-data-cache-location-density-heatmap`;
  // Create a unique name for the blob
  const blobName = `location-density-heatmap-vpgm-${channel.toLowerCase()}-${partitionKey}.mvt`;
 
  // await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'vpgms','locationDensity' );

  /* const mvtString = await blobService.get(containerName, blobName);
  if (mvtString) {
    return mvtString;
  } */

  const results =  await pgClient.query(
        `
          WITH 
          geom_filter AS
          (
              SELECT * from (
                SELECT py.gid as id, py.geom,density_percentage, py.vpgm_markt as sales_market
                FROM spatial.vpgm_market py LEFT OUTER JOIN (
                SELECT (numerator*100)/denominator as density_percentage, A.sales_market_id from (
	             (
                 SELECT count(*) as denominator, sales_market_id 
	              from ${config.tableName} group by sales_market_id) A
	              JOIN 
                (
                  SELECT count(*) as numerator, sales_market_id from ${config.tableName} lus 
                  inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey
                  WHERE 1=1 ${whereClause}
                  group by sales_market_id) B
	                on A.sales_market_id = B.sales_market_id)
	              ) C
	              on py.gid = C.sales_market_id        
                WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
              ) nf 
          )
          SELECT ST_AsMVT(q, 'vpgmLayer', 4096, 'geom') FROM (
          SELECT 
                id, sales_market, density_percentage,
                ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
          `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );

      const tile = results.rows[0];
      if (tile?.st_asmvt.length !== 0) {
        // await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
        return tile.st_asmvt;
      }
      return null;
    
  };
  
  module.exports = { mvt };
  