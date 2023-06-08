const mvt = async (bbox, pgClient, filterParams) => {
    const results = await pgClient.query(`
    SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
    FROM spatial.dma_county where county=$1
`,[filterParams.dma]);

const tile = results.rows[0];
if (tile?.st_asmvt.length !== 0) {
  return tile.st_asmvt;
}
return null;
}


module.exports = { mvt } ;