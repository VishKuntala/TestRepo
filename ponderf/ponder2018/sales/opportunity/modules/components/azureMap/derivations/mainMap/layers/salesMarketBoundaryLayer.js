import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';

const salesMarketBoundaryLayer = ({ instance }) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.SALES_MARKET_BOUNDARY_DEFAULT

    // DEFAULT SALES MARKET BOUNDARY LINES
    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/vpgmBoundaries/{z}/{x}/{y}.mvt`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);
    const layer = new atlas.layer.LineLayer(src, id, {
        sourceLayer: 'vpgmBoundaryLayer',        
        strokeColor: '#8ab3ed',
        strokeWidth: 1.5,
        visible: true
    });
    map.layers.add(layer, 'labels');
    instance.store.layersAddedToMap.push(id);
};

export default salesMarketBoundaryLayer;


