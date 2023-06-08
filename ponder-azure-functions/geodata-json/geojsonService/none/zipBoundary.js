
const geodata = (pgClient, filterParams) => pgClient.query(`
SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
FROM spatial.zip where zip=$1
`,[filterParams.zip]);

module.exports = { geodata } ;