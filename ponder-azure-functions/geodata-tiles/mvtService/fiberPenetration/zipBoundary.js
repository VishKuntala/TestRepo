const mvt = async (bbox, pgClient, filterParams) => {
  pgClient.query(
    `
    SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
    FROM spatial.zip where zip=$1
`,
    [filterParams.zip]
  );
  const tile = results.rows[0];
  if (tile?.st_asmvt.length !== 0) {
    return tile.st_asmvt;
  }
  return null;
};

module.exports = { mvt };
