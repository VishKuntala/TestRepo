const { sqlBuilder } = require('../../common');
const config = require('../../common/config');

const mvt = async (bbox, pgClient, filterParams) => {

  const whereClause = sqlBuilder.whereClause(filterParams);

      return pgClient.query(
        `
          WITH geom_envelop (geom_e) AS
          (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
          geom_filter AS
          (
                SELECT py.gid as id,  ST_Centroid(py.geom) as geom,
                py.dma_name as name, numerator as numberofmatchedlocations
                FROM spatial.dma_county py INNER JOIN 
                (
                  SELECT count(*) as numerator, dma_id from ${config.tableName}
                  WHERE 1=1  ${whereClause}
                  group by dma_id
                ) B
                on py.gid = B.dma_id WHERE ST_Intersects(py.geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
          )
          SELECT ST_AsMVT(q, 'clusterLayer', 4096, 'geom') FROM (
            SELECT id, name, numberofmatchedlocations, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf
          ) q;
          `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
    
  };
  
  module.exports = { mvt };
