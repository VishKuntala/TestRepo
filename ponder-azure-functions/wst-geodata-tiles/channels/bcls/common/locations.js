const sqlBuilder = require('./sqlBuilder');
const config = require('./config');
const mvt = async (bbox, pgClient, filterParams) => {

  const whereClause = sqlBuilder.whereClause(filterParams);
  const { attribute } = filterParams

  return pgClient.query(`
    WITH geom_envelop (geom_e) AS
    (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
    geom_filter AS
    (
        SELECT * from (
         SELECT CONCAT(t1.LATITUDE,'|', t1.LONGITUDE) as id, cpg.geom, ${attribute}::INT8 as coverage_score
         from ${config.tableName} t1 JOIN WST.channel_point_geom cpg
         on t1.latitude = cpg.latitude
         and t1.longitude = cpg.longitude
         where 
        ST_Within(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)) 
        AND SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0  
        ${whereClause}) nf 
    )
    SELECT ST_AsMVT(q, 'wsLayer', 4096, 'geom') FROM (
    SELECT id, coverage_score, ST_AsMVTGeom(geom, ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857), 4096, 256, true) geom FROM geom_filter gf) q;
  `, [bbox[0], bbox[1], bbox[2], bbox[3]]
    );
  };
  
  module.exports = { mvt };
  
  