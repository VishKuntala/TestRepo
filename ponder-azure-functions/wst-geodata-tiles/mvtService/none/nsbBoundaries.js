const md5 = require('js-md5');
const blobService = require('../../common/blobService');
const TableCacheService = require('../../common/TableCacheService');

const mvt = async (bbox, pgClient, filterParams) => { 
    const tableCacheService = new TableCacheService();
    const partitionKey = md5(bbox.join(','));
 
    const containerName = `wst-data-cache-nsb`;
    // Create a unique name for the blob
    const blobName = `nsbBoundaries-${partitionKey}.mvt`;

    await tableCacheService.initService("nsb", partitionKey, null, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'nsbBoundaries','nsb' );

    const mvtString = await blobService.get(containerName, blobName);
    if (mvtString) {
      return mvtString;
    }
    const results =  await pgClient.query(`
        WITH
        geom_filter AS
        (
            SELECT * from (
            SELECT gid as id, usid, address, onair_actual, geom
            FROM spatial.nsb
            WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
            ) nf
        )
        SELECT ST_AsMVT(q, 'nsbBoundaryLayer', 4096, 'geom') FROM (
        SELECT id, usid, address, onair_actual, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
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