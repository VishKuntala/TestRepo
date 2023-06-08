import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';

const censusBlockLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.CENSUS_BLOCK;

    map.addSource(source, {
        "type": "vector",
        "tiles": [
            `${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/censusBlocks/{z}/{x}/{y}.mvt`,
        ],
        "tolerance": 0,
        promoteId
    });
    map.addLayer({
        "id": id,
        "source": source,
        "source-layer": sourceLayer,
        "minzoom": minZoom,
        "maxzoom": maxZoom,
        "type": "fill",
        "layout": {
            "visibility": "visible"
        },
        "paint": {
            'fill-color': heatmapConfig[store.currentHeatmapFilter].fillColorExpression,
            'fill-opacity': heatmapConfig[store.currentHeatmapFilter].fillOpacityExpression,
            'fill-outline-color': [
                'case',
                ['boolean', ['feature-state', 'hover'], false],
                '#555500',
                '#D3D3D3'
            ],
        }
    },
        beforeLayerId
    );

    map.addLayer(
        {
            id: `${id}-line`,
            source: source,
            "source-layer": sourceLayer,
            minzoom: minZoom,
            maxzoom: maxZoom,
            type: "line",
            layout: {
                visibility: "visible",
            },
            paint: {
                "line-width": [
                    "case",
                    ["boolean", ["feature-state", "hover"], false],
                    4,
                    0.5,
                ],
                "line-color": '#a9a9a9',
            }
        },
        beforeLayerId
    );

    let featureId = null;
    const setActiveArea = (event) => {
        if (!event?.features) return;

        if (event.features.length > 0) {
            //if id exists from a previous hover, set the area's hovered feature to false
            if (featureId) {
                map.setFeatureState(
                    { source, sourceLayer, id: featureId },
                    { hover: false }
                );
            }

            // get ID of currently hovered area, and set it's hover feature to true
            featureId = event.features[0].properties.id;
            map.setFeatureState(
                { source, sourceLayer, id: featureId },
                { hover: true }
            );

            // update the baseball card info with the current area's information
            const { properties } = event.features[0];
            const cardData = {
                mapCardHeader: header,
                mapCardInfo: [
                    { label: "Census Block", property: properties.name },
                    { label: "Avg Indoor Coverage Score", property: properties.avg_cov_score },                      ],
            };
            updateMapInfo(store, cardData);
        }
    };


    const censusLayerClicked = async event => {
        if (instance.store.mapClickHandled === true) {
            instance.store.mapClickHandled = false;
            return;
        }
        if (!event?.features?.[0]?.properties) return;
        const { properties } = event.features[0];
        if (properties.id) {
            instance.popup.setLngLat([event.lngLat.lng, event.lngLat.lat])
                .setHTML(
                    `
                  <div style="text-align: center">                   
                   <br/><div style = "align:center"></div><a href="#" censusBlockId="${properties.id}" class="censusTenantsExportLink">Show businesses in this census block</a>
                  </div>
                `
                )
                .addTo(map);
            
        }
    };

    map.on("mousemove", id, setActiveArea);
    // handle click event
    map.on("click", id, censusLayerClicked);


    // When the mouse leaves the layer, update the feature-state of the
    // previously hovered feature.
    map.on("mouseleave", id, () => {
        if (featureId) {
            map.setFeatureState(
                { source, sourceLayer, id: featureId },
                { hover: false }
            );
        }
        featureId = null;
    });
};
export default censusBlockLayer;
