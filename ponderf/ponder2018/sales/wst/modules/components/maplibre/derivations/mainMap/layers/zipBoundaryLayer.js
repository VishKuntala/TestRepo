import { config } from '../config/config.js';

const zipBoundaryLayer = ({ instance }, geojson) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.ZIP_BOUNDARY

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
                'line-width': 2
            }
        });
    }

};

export default zipBoundaryLayer;