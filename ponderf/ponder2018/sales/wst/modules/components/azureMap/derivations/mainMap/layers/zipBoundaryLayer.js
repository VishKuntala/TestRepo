import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';

const zipBoundaryLayer = ({ instance }, geojson) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.ZIP_BOUNDARY

    
    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== id);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter (sourceId => sourceId !== source);
    }

    const src = new atlas.source.DataSource(source);
    src.add(geojson);
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);
    const layer = new atlas.layer.LineLayer(src, id, {
        strokeColor: '#8ab3ed',
        strokeWidth: 2,
        visible: true
    });
    map.layers.add(layer, 'labels');
    instance.store.layersAddedToMap.push(id);

    /* if (map.getSource(source)) {
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
                'line-width': 2
            }
        });
    } */

};

export default zipBoundaryLayer;