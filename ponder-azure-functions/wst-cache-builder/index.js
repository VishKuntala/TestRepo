/*
 * This function is not intended to be invoked directly. Instead it will be
 * triggered by an orchestrator function.
 * 
 * Before running this sample, please:
 * - create a Durable orchestration function
 * - create a Durable HTTP starter function
 * - run 'npm install durable-functions' from the wwwroot folder of your
 *   function app in Kudu
 */

const axios = require('axios');


// http://localhost:7071/api/wst/clusters/bclsv2/location/vpgms/2/0/1.mvt
// wst/{channel}/tiles/{heatmap}/{type}/{z:decimal}/{x:decimal}/{y:decimal}.mvt"

module.exports = async function (context, req) {

    const { whereClause, sortClause, channel, baseApiUrl, chartKeys, bbox, geoEntity, heatmap, locationAttribute } = JSON.parse(context.bindings.name);
    if (bbox && geoEntity) {
        if (geoEntity === 'locations') {
            const locationsResult = await axios.get(`${baseApiUrl}/wst/${channel}/tiles/none/${geoEntity}/${bbox}.mvt?whereClause=${whereClause}&attribute=${locationAttribute}&cacheBuilder=true`);
        } else {
            if (heatmap) {
                const heatmapResult = await axios.get(`${baseApiUrl}/wst/${channel}/tiles/${heatmap}/${geoEntity}/${bbox}.mvt?whereClause=${whereClause}&cacheBuilder=true`);
            } else {
                const clusterResult = await axios.get(`${baseApiUrl}/wst/clusters/${channel}/location/${geoEntity}/${bbox}.mvt?whereClause=${whereClause}&cacheBuilder=true`);
            }
        }
    } else {
        const tableResult = chartKeys ? null : await axios.post(`${baseApiUrl}/wst/${channel}/table/`, {
            whereClause, sortClause, cacheBuilder: true 
        });
        const chartResult = chartKeys ? await axios.post(`${baseApiUrl}/wst/${channel}/chart/`, {
            whereClause, sortClause, cacheBuilder: true , chartKeys
        }) : null;
    }
    return 'success';
}
