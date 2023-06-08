import { config } from "../config/config.js";
import { heatmapConfig } from "../config/heatmapConfig.js";
import { updateMapInfo } from "../utils/utils.js";

const salesMarketLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.SALES_MARKET;

    // SALES MARKET HEATMAP AREAS
    map.addSource(source, {
        type: "vector",
        tiles: [
            `${store.baseApiUrl}/tiles/${store.heatmap}/vpgms/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`,
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
                mapCardInfo: [
                    { label: "Sales Market Name", property: properties.name },
                    { label: "Wireless Category", property: properties.wireless_category },
                    { label: "Fiber Addresses Available", property: properties.fiber_available.toLocaleString() },                    
                    { label: "Current Fiber Customers", property: `${properties.fiber_customers.toLocaleString()} (${properties.fiber_percentage}%)` },
                    { label: "Fiber Customer and Wireless Customer", property: properties.fiber_customer_wireless_customer.toLocaleString() },
                    { label: "Fiber Customer and Wireless Cross-Sell Opportunity", property: properties.fiber_customer_no_wireless.toLocaleString() },
                    { label: "Copper Upgrade and Wireless Customer", property: properties.copper_upgrade_wireless_customer.toLocaleString() },
                    { label: "Copper Upgrade and Wireless Cross-Sell Opportunity", property: properties.copper_upgrade_no_wireless.toLocaleString() },
                    { label: "Wireless Customer and Fiber Cross-Sell Opportunity", property: properties.wireless_customer_no_fiber.toLocaleString() },
                    { label: "Opportunity for Fiber and Wireless", property: properties.no_fiber_no_wireless.toLocaleString() },                    
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

export default salesMarketLayer;
