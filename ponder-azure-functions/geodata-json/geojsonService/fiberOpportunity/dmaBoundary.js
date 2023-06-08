
const geodata = (pgClient, filterParams) => pgClient.query(`
SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
FROM spatial.dma_county where dma=$1
`,[filterParams.dma]);

module.exports = { geodata } ;