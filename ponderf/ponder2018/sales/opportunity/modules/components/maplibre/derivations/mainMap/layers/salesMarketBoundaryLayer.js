import { config } from '../config/config.js';

const salesMarketBoundaryLayer = ({ instance }) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.SALES_MARKET_BOUNDARY_DEFAULT

    // DEFAULT SALES MARKET BOUNDARY LINES
    map.addSource(source, {
        "type": "vector",
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/vpgmBoundaries/{z}/{x}/{y}.mvt`]
    });

    map.addLayer({
        "id": id,
        "source": source,
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