const md5 = require('js-md5');
const config = require('./config');
const blobService = require('../../common/blobService');
const TableCacheService = require('../../common/TableCacheService');

const mvt = async (bbox, pgClient, filterParams, channel) => {
  const tableCacheService = new TableCacheService();
  const partitionKey = md5(bbox.join(','));
 
  const containerName = `wst-data-cache-none-heatmap`;
  // Create a unique name for the blob
  const blobName = `none-heatmap-dma-${channel.toLowerCase()}-${partitionKey}.mvt`;

  await tableCacheService.initService(channel, partitionKey, null, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'dmas','none' );

  const mvtString = await blobService.get(containerName, blobName);
  if (mvtString) {
    return mvtString;
  }

  const results =  await pgClient.query(
        `
          WITH  
          geom_filter AS
          (
                SELECT dc.gid as id, dc.dma, dc.dma_name as name, geom, 0 as avg_cov_score FROM 
                spatial.dma_county dc
                 WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
          )
          SELECT ST_AsMVT(q, 'dmaLayer', 4096, 'geom') FROM (
          SELECT 
                id, name, dma, avg_cov_score,
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
  