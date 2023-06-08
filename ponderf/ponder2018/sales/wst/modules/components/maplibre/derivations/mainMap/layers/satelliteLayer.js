import { config } from '../config/config.js';

const satelliteLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
 
    map.addSource("sat", {
        type: "raster",
        tiles: [
            `${$("#hdnSatelliteLayerStyleUrl").val()}?access_token=${$("#hdnMapBoxKey").val()}`
        ]
    });

    map.addLayer(
        {
            id: "satellite",
            type: "raster",
            source: "sat",
            "layout": {
                "visibility": "none"
            }
        }, beforeLayerId
    );


    /* map.addLayer({
        id: 'satellite',
        source: { "type": "raster", "url": `https://api.maptiler.com/maps/hybrid/256/tiles.json?key=${$("#hdnMapTilerKey").val()}`, "tileSize": 256 },
        type: "raster",
        "layout": {
            "visibility": "none"
        },
    }, beforeLayerId); */


};

export default satelliteLayer;