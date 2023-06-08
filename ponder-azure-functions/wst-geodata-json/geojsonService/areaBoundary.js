
const R = require('ramda');
const { point, featureCollection } =  require('@turf/helpers');

const geodata = async (pgClient, postParams) => { 
    const {
        salesMarket,  dmaName, statecode, zipcode, locationId
    } = postParams;

    let query = '';
    // if there is a storeId and only one storeId is selected in the filter then return the geojson for that store
    // so the UI can zoom to that point location
    if (locationId && locationId.split(',').length === 1) {
        query = `SELECT ST_AsGeoJSON(ST_MakePoint( longitude,latitude)) 
        FROM sot.sales_att_store_loc_prod 
        WHERE location_id in (${locationId})`;
    }
    else if (zipcode)
    {
        query = `select ST_AsGeoJSON(ST_Extent(ST_Transform(a.geom,4326))) from
        (select geom from spatial.zip where zip IN (${zipcode})) as a`;
    } else if( dmaName) {
        query = `select ST_AsGeoJSON(ST_Extent(ST_Transform(a.geom,4326))) from
        (select geom from spatial.dma_county where gid IN (${dmaName})) as a`;
    } else if( statecode) {
        query = `select ST_AsGeoJSON(ST_Extent(ST_Transform(a.geom,4326))) from
        (select geom from spatial.state where gid IN (${statecode})) as a`;
    } else {
        query = `select ST_AsGeoJSON(ST_Extent(ST_Transform(a.geom,4326))) from
        (select geom from spatial.vpgm_market where gid IN (${salesMarket})) as a`;
    }
    return pgClient.query(query);
}

module.exports = { geodata } ;