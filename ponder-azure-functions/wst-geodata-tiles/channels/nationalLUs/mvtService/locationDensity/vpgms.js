const { sqlBuilder } = require('../../common');

const mvt = async (bbox, pgClient, filterParams) => {

  const whereClause = sqlBuilder.whereClause(filterParams);

      return pgClient.query(
        `
          WITH geom_envelop (geom_e) AS
          (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
          geom_filter AS
          (
              SELECT * from (
                SELECT py.gid as id, py.geom,density_percentage, py.vpgm_markt as sales_market
                FROM spatial.vpgm_market py LEFT OUTER JOIN (
                SELECT (numerator*100)/denominator as density_percentage, A.sales_market from (
	             (
                 SELECT count(*) as denominator, sales_market 
	              from wst.sales_midmarket_prod group by sales_market) A
	              JOIN 
                (
                  SELECT count(*) as numerator, sales_market from wst.sales_midmarket_prod 
                  WHERE ${whereClause}
                  group by sales_market) B
	                on A.sales_market = B.sales_market)
	              ) C
	              on py.vpgm_markt = C.sales_market        
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
    
  };
  
  module.exports = { mvt };
  