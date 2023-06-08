import { config } from '../config/config.js';

const salesMarketBoundaryLayer = ({ instance }, geojson) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.SALES_MARKET_BOUNDARY

    if (geojson) {
        if (map.getSource(source)) {
            map.getSource(source).setData(geojson);
        } else {

            map.addSource(source, {
                "type": "geojson",
                "data": geojson
            });

            map.addLayer({
                "id": id,
                "source": source,
                "type": "line",
                "layout": {
                    "visibility": "visible"
                },
                "paint": {
                    'line-color': '#8ab3ed',
                    'line-width': 1.5
                }
            });
        }
    }

    // SALES MARKET BOUNDARY LINES
    map.addSource(source, {
        "type": "vector",
        "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/vpgmBoundaries/{z}/{x}/{y}.mvt`]
    });

    map.addLayer({
        "id": id,
        "source": source,
        "maxzoom": 3,
        "source-layer": "vpgmBoundaryLayer",
        "type": "line",
        "layout": {
            "visibility": "visible"
        },
        "paint": {
            'line-color': '#8ab3ed',
            'line-width': 1.5
        }
        });


};

export default salesMarketBoundaryLayer;