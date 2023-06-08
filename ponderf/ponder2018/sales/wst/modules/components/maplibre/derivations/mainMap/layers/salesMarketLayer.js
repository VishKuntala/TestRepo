import { config } from "../config/config.js";
import { heatmapConfig } from "../config/heatmapConfig.js";
import { updateMapInfo } from "../utils/utils.js";
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";


const salesMarketLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.SALES_MARKET;

    let postData = buildPayloadFromStore(instance);
    postData = Object.assign(postData, { attribute: (instance.store.config.map && instance.store.config.map.heatmapAttribute) || 'COVERAGE_SCORE' });
    const queryStringParams = new URLSearchParams(postData).toString();


    // SALES MARKET HEATMAP AREAS
    map.addSource(source, {
        type: "vector",
        tiles: [
            `${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/vpgms/{z}/{x}/{y}.mvt?${queryStringParams}`,
        ],
        tolerance: 0,
        promoteId: promoteId,
    });

    map.addLayer(
        {
            id: id,
            source: source,
            "source-layer": sourceLayer,
            minzoom: minZoom,
            maxzoom: maxZoom,
            type: "fill",
            layout: {
                visibility: "visible",
            },
            paint: {
                "fill-color":
                    heatmapConfig[store.currentHeatmapFilter]
                        .fillColorExpression,
                "fill-opacity":
                    heatmapConfig[store.currentHeatmapFilter]
                        .fillOpacityExpression,
            },
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
                mapCardInfo: heatmapConfig[store.currentHeatmapFilter].mapCardInfo(properties),
            };
            updateMapInfo(store, cardData);
        }
    };

    map.on("mousemove", id, setActiveArea);
    // handle mobile interaction
    map.on("click", id, setActiveArea);

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

export default salesMarketLayer;
