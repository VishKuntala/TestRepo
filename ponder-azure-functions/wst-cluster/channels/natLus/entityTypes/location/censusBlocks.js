const R = require('ramda');
const { sqlBuilder } = require('../../common');
const config = require('../../common/config');

const mvt = async (bbox, pgClient, filterParams) => {

  const whereClause = sqlBuilder.whereClause(filterParams);



      return pgClient.query(
        `
          WITH geom_filter AS
          (
            select id, name, numerator as numberofmatchedlocations, geom from (
                select * from (  
                SELECT gid as id,  zip as name, ST_Centroid(geom) as geom
                FROM spatial.zip 
                WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
                ) py 
                INNER JOIN 
                (
                    SELECT count(*) as numerator, zipcode from ${config.tableName}
                    WHERE 1=1 ${whereClause}
                    group by zipcode
                ) B
                on py.name = B.zipcode 
             ) A   
          )
          SELECT ST_AsMVT(q, 'clusterLayer', 4096, 'geom') FROM (
            SELECT id, name, numberofmatchedlocations, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf
          ) q;
          `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
    
  };
  
  module.exports = { mvt };
