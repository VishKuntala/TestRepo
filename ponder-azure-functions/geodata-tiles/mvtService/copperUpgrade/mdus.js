const mvt = (bbox, pgClient, filterParams) => {
  return pgClient.query(
    `
WITH geom_envelop (geom_e) AS
(SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
geom_filter AS
(
    SELECT * from (
    SELECT mdu.mdu_id as id, mdu.wireless_score, mdu.latitude, mdu.longitude, 
    point_geom.geom
    from sot.sales_opp_mdu_prod mdu join sot.sales_opp_point_geom  point_geom
    on mdu.latitude = point_geom.latitude and mdu.longitude = point_geom.longitude ) nf 
    , geom_envelop ge
WHERE ST_Within(nf.geom, ge.geom_e))
SELECT ST_AsMVT(q, 'mduLayer', 4096, 'geom') FROM (
SELECT id, wireless_score, latitude, longitude, ST_AsMVTGeom(geom, geom_e, 4096, 256, true) geom FROM geom_filter gf) q;
`,
    [bbox[0], bbox[1], bbox[2], bbox[3]]
  );
};
module.exports = { mvt };
