const { sqlBuilder } = require('../../common');
const config = require('../../common/config');

const mvt = async (bbox, pgClient, filterParams) => {

  const whereClause = sqlBuilder.whereClause(filterParams);

  const totalCountResult = await  pgClient.query(
    `SELECT count(*) total_count FROM ${config.tableName} 
    WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 ${ filterParams.filterTotalCount ? whereClause : ''}`
  );

  const totalCount = totalCountResult.rows[0].total_count;

  // const totalCount = 926353;

      return pgClient.query(
        `
          WITH geom_envelop (geom_e) AS
          (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
          geom_filter AS
          (
              SELECT * from (
                SELECT py.gid as id, py.geom,COALESCE((numerator*100)/${totalCount},0)::FLOAT8 as density_percentage, 
                py.vpgm_markt as name, numerator as numberofmatchedlocations, ${totalCount} as totallocations
                FROM spatial.vpgm_market py LEFT OUTER JOIN 
                (
                  SELECT count(*) as numerator, sales_market from ${config.tableName} 
                  WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0  ${whereClause}
                  group by sales_market
                ) B
                  on py.vpgm_markt = B.sales_market
                WHERE ST_Intersects(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857))
              ) nf 
          )
          SELECT ST_AsMVT(q, 'vpgmLayer', 4096, 'geom') FROM (
          SELECT 
                id, name, numberofmatchedlocations, totallocations, density_percentage,
                ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
          `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
    
  };
  
  module.exports = { mvt };
  