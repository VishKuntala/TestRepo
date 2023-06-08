import { config } from "../config/config.js";
import { heatmapConfig } from "../config/heatmapConfig.js";
import { updateMapInfo } from "../utils/utils.js";

const cmaLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const {
        source,
        id,
        promoteId,
        sourceLayer,
        header,
        minZoom,
        maxZoom,
    } = config.heatmapLayers.CMA;

    map.addSource(source, {
        type: "vector",
        tiles: [
            `${store.baseApiUrl}/tiles/${store.heatmap}/cmas/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`],
        tolerance: 0,
        promoteId,
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
                'fill-color': heatmapConfig[store.currentHeatmapFilter].fillColorExpression,
                'fill-opacity': heatmapConfig[store.currentHeatmapFilter].fillOpacityExpression,
                "fill-outline-color": [
                    "case",
                    ["boolean", ["feature-state", "hover"], false],
                    "#555500",
                    "#D3D3D3",
                ],
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
                mapCardInfo: [
                    { label: "Name", property: properties.name },
                    { label: "CMA Number", property: properties.cma },
                    { label: "Region", property: properties.sales_region1 },
                    { label: "Market", property: properties.sales_market1 },
                    {
                        label: "Fiber Percentage",
                        property: properties.fiber_percentage,
                        format: "percent",
                    },
                ],
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

export default cmaLayer;
