import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';

const salesMarketBoundaryLayer = ({ instance }, geojson) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.SALES_MARKET_BOUNDARY;

    if (map.layers.getLayerById(id)) {
       // map.layers.remove(id);
       return;
    }

    /* if (map.sources.getById(source)) {
        map.sources.remove(source);
    } */

    if (geojson) {
        if (map.sources.getById(source)) {
            map.sources.getById(source).setShapes(geojson);
        } else {
            const src = new atlas.source.DataSource(source);
            map.sources.add(src);
            instance.store.sourcesAddedToMap.push(source);
            const layer = new atlas.layer.LineLayer(src, id, {
                strokeColor: '#8ab3ed',
                strokeWidth: 1.5,
                visible: true,
                maxZoom: 3
            });
            map.layers.add(layer, 'labels');
            instance.store.layersAddedToMap.push(id);
        }
    }

    // SALES MARKET BOUNDARY LINES
    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/vpgmBoundaries/{z}/{x}/{y}.mvt`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);
    const layer = new atlas.layer.LineLayer(src, id, {
        sourceLayer: 'vpgmBoundaryLayer',
        strokeColor: '#8ab3ed',
        strokeWidth: 1.5,
        visible: true,
        maxZoom: 3
    });
    map.layers.add(layer, 'labels');
    instance.store.layersAddedToMap.push(id);
};

export default salesMarketBoundaryLayer;