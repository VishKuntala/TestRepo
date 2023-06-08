const centroid = require('@turf/centroid').default;
const { multiPoint } = require('@turf/helpers');

const point = async (pgClient, pointId, filterParams) => {
    const result = await pgClient.query(`
        SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) FROM spatial.zip where zip=$1
        `,[pointId]
    );
    const zipMultiPoint = multiPoint(JSON.parse(result.rows[0].st_asgeojson).coordinates[0]);
    const zipCentroid = centroid(zipMultiPoint);
    return zipCentroid;
    
}

module.exports = {  point } ;