const md5 = require('js-md5');
const { sqlBuilder } = require('../../../../../wst-common/channels/neonGigapower');
const conf = require('../../../../../wst-common/channels/neonGigapower/config');
// const blobService = require('../../../../../wst-common/blobService');
// const TableCacheService = require('../../../../../wst-common/TableCacheService');


const mvt = async (bbox, pgClient, filterParams, channel) => {
  const config = conf(process.env.GROUP_MEMBERSHIP);
  // const tableCacheService = new TableCacheService();
  const whereClause= filterParams.whereClause || sqlBuilder.whereClause(filterParams);


  const partitionKey = md5(bbox.join(',') + whereClause.trim());

  const containerName = `wst-data-cache-fiber-penetration-heatmap`;
  // Create a unique name for the blob
  const blobName = `fiber-penetration-heatmap-vpgm-${channel.toLowerCase()}-${partitionKey}.mvt`;

  // await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'censusBlocks','locationDensity' );

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
                SELECT py.gid as id, py.geom,fiber_penetration, py.vpgm_markt as name
                FROM spatial.vpgm_market py LEFT OUTER JOIN (
                 SELECT lus.sales_market_gid, sum(lus.fiber_customers)*100/sum(lus.fiber_opportunity) as fiber_penetration 
	              from ${config.tableName} lus 
                  inner join wst.neon_gigapower_fiber_addresses ts on lus.zip_co_psa = ts.zip_co_psa 
                  WHERE 1=1 ${whereClause}
                  group by lus.sales_market_gid) A
	              on py.gid = A.sales_market_gid        
                WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
              ) nf 
          )
          SELECT ST_AsMVT(q, 'vpgmLayer', 4096, 'geom') FROM (
          SELECT 
                id, name, fiber_penetration,
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
  