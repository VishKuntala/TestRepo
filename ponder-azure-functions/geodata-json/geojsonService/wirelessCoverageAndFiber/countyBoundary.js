
const geodata = (pgClient, filterParams) => pgClient.query(`
SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
FROM spatial.county where cnty_fips::integer=$1
`,[filterParams.county]);

module.exports = { geodata } ;