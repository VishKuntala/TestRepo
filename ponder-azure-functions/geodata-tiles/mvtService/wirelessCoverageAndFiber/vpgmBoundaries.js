const mvt = async (bbox, pgClient, filterParams) => {
  const results = await pgClient.query(
    `
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
    `,
    [bbox[0], bbox[1], bbox[2], bbox[3]]
  );

  const tile = results.rows[0];
  if (tile?.st_asmvt.length !== 0) {
    return tile.st_asmvt;
  }
  return null;
};

module.exports = { mvt };
