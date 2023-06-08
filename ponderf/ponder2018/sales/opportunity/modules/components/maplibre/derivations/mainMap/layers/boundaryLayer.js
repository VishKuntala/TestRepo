import { config } from '../config/config.js';

const boundaryLayer = ({ instance }, geojson, boundaryType) => {    
    const { map } = instance;
    const { source, id } = config.boundaryLayers[boundaryType]
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

export default boundaryLayer;