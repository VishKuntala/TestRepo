import { multiLineString } from "@turf/helpers";
import bbox from "@turf/bbox";
import { config } from '../config/config.js';

const nsbBoundaryLayer = ({ instance, beforeLayerId }, geojson) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.NSB_BOUNDARY

    map.addSource(source, {
        "type": "vector",
        "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/none/nsbBoundaries/{z}/{x}/{y}.mvt`]
    });

    map.addLayer({
        "id": id,
        "source": source,
        "source-layer": "nsbBoundaryLayer",
        "type": "fill",
        "layout": {
            "visibility": "none"
        },
        "paint": {
            'fill-color': "#FF0000",
            'fill-opacity': 0.40,
            'fill-outline-color': [
                'case',
                ['boolean', ['feature-state', 'hover'], false],
                '#555500',
                '#D3D3D3'
            ],
        }
    });

    const nsbLayerClicked = async event => {
            if (instance.store.mapClickHandled === true) {
                return;
            }
            instance.store.mapClickHandled = true;
            instance.store.ignoreNsbBoundaryClick = false;
            if (!event?.features?.[0]?.properties) return;
            if (instance.store.currentZoom <= 12) {
                const coordinates = event.features[0].geometry.coordinates;
                const nsbBoundary = multiLineString(coordinates);
                const nsbBBox = bbox(nsbBoundary);
                map.fitBounds(nsbBBox, {
                    padding: { top: 10, bottom: 25, left: 15, right: 5 },
                });
            }
            const { properties } = event.features[0];
            if (instance.store.config.map?.nsbLayerPopupHtml) {
                instance.store.nsbLayerClickInfo = {lngLat: [event.lngLat.lng, event.lngLat.lat], popupHtml: instance.store.config.map.nsbLayerPopupHtml(properties)};
               /* instance.popup.setLngLat([event.lngLat.lng, event.lngLat.lat])
                    .setHTML(
                    instance.store.config.map.nsbLayerPopupHtml(properties)
                    )
                    .addTo(map); */
                
            }
    };

    map.on("click", id, nsbLayerClicked);


};

export default nsbBoundaryLayer;