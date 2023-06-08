const geodata = (pgClient, filterParams) => pgClient.query(`
SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
FROM spatial.census_block where gid=$1
`,[filterParams.id]);

module.exports = { geodata } ;