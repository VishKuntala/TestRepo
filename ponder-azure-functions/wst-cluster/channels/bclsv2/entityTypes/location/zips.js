const md5 = require('js-md5');
const R = require('ramda');
const { sqlBuilder, locations } = require('../../common');
const config = require('../../common/config');
const blobService = require('../../../../common/blobService');
const TableCacheService = require('../../../../common/TableCacheService');

const mvt = async (bbox, pgClient, filterParams) => {
  const tableCacheService = new TableCacheService();
  const { channel } = filterParams;
  const whereClause = filterParams.whereClause || sqlBuilder.whereClause(filterParams);

  const partitionKey = md5(bbox.join(',') + whereClause.trim());
 
  const containerName = `wst-data-cache-${channel}-zip-clusters`;
  // Create a unique name for the blob
  const blobName = `${channel}-zip-cluster-${partitionKey}.mvt`;

  await tableCacheService.initService(channel, partitionKey, whereClause, null, null, `${filterParams.z}/${filterParams.x}/${filterParams.y}`,'zips' );

  if (!filterParams.searchedBusiness) {

    const mvtString = await blobService.get(containerName, blobName);
    if (mvtString) {
      return mvtString;
    }

    
    const results = await pgClient.query(
        `
          WITH geom_filter AS
          (
            select id, geom, name, numberofmatchedlocations
            from 
            (SELECT py.gid as id, ST_Centroid(py.geom) as geom,
            zip as name
            FROM spatial.zip py
            WHERE 
            ST_Intersects(py.geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4 , 4326), 3857)) 
            ) A INNER JOIN 
            (
            SELECT lus.zipcode ,count(distinct lus.mikey) as numberofmatchedlocations
            FROM ${config.tableName} lus
            inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey
            WHERE 1=1 ${whereClause}
            group by lus.zipcode) as B
            ON A.name = B.zipcode
          )
          SELECT ST_AsMVT(q, 'clusterLayer', 4096, 'geom') FROM (
            SELECT id, name, numberofmatchedlocations, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf
          ) q;
          `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
      const tile = results.rows[0];
      if (tile?.st_asmvt.length !== 0) {
        await blobService.put(containerName, blobName, new Buffer.from(tile.st_asmvt));
        return tile.st_asmvt;
      }
      return null;
    } else {
      return locations.mvt(bbox, pgClient, filterParams, 'clusterLayer');
    }
    
  };
  
  module.exports = { mvt };
