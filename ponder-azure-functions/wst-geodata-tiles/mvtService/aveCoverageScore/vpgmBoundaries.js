const md5 = require('js-md5');
const blobService = require('../../common/blobService');
const TableCacheService = require('../../common/TableCacheService');

const mvt = async (bbox, pgClient, filterParams) => { 
    const tableCacheService = new TableCacheService();
    const { channel } = filterParams;
    const partitionKey = md5(bbox.join(','));
 
    const containerName = `wst-data-cache-ave-cov-score-heatmap`;
    // Create a unique name for the blob
    const blobName = `ave-cov-score-heatmap-vpgmboundaries-${partitionKey}.mvt`;

    await tableCacheService.initService(channel, partitionKey, null, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'vpgmBoundaries','aveCoverageScore' );

    const mvtString = await blobService.get(containerName, blobName);
    if (mvtString) {
      return mvtString;
    }
    const results =  await pgClient.query(`
        WITH geom_envelop (geom_e) AS
        (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
        geom_filter AS
        (
            SELECT * from (
            SELECT gid as id, ST_BOUNDARY(geom) geom
            FROM spatial.vpgm_market) nf
            ,geom_envelop ge
        WHERE ST_Intersects(nf.geom, ge.geom_e))
        SELECT ST_AsMVT(q, 'vpgmBoundaryLayer', 4096, 'geom') FROM (
        SELECT id, ST_AsMVTGeom(geom, geom_e, 4096, 256, true) geom FROM geom_filter gf) q;
        `,[bbox[0], bbox[1], bbox[2], bbox[3]]
    );

    const tile = results.rows[0];
    if (tile?.st_asmvt.length !== 0) {
      await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
      return tile.st_asmvt;
    }
    return null;
  
}

module.exports = { mvt } ;