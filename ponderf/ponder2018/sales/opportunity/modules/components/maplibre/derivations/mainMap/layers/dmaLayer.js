import { config } from "../config/config.js";
import { heatmapConfig } from "../config/heatmapConfig.js";
import { updateMapInfo } from "../utils/utils.js";
import centroid from "@turf/centroid";
import maplibregl from "maplibre-gl";

const dmaLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const {
        source,
        id,
        promoteId,
        sourceLayer,
        header,
        minZoom,
        maxZoom,
    } = config.heatmapLayers.DMA;

    map.addSource(source, {
        type: "vector",
        tiles: [
            `${store.baseApiUrl}/tiles/${store.heatmap}/dmas/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`],
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
            },
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
                    { label: "DMA", property: properties.dma },
                    { label: "DMA Name", property: properties.name },
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

    const dmaLayerClicked = async event => {
        if (!event?.features?.[0]?.properties) return;
        const { properties } = event.features[0];
        if (properties.dma) {
            const popup = new maplibregl.Popup({
                maxWidth: "500px",
                closeButton: true,
                anchor: "bottom",
            })
                .setLngLat([event.lngLat.lng, event.lngLat.lat])
                .setHTML(
                    `
                  <div style="text-align: center">                   
                   DMA: ${properties.name}
                   <br/><div style = "align:center"></div><a href="#" class="dmaLayerLink">Click to Show Fiber Opportunities in this DMA</a>
                  </div>
                `
                )
                .addTo(map);
            $('.dmaLayerLink').click(async function () {
                // remove open popup
                $('.mapboxgl-popup').remove();
                const value = properties.dma;
                instance.store.searchMode = 'dmaSearch';
                instance.store.inSearchMode = true;
                instance.store.searchedDMA = value;
                const boundaryData = await instance.getData(
                    `${store.baseApiUrl}/geodata/${store.heatmap
                    }/dmaBoundary.geojson?dma=${value}`
                );
                const dmaCenter = centroid(boundaryData.data);
                instance.store.zoomToPoint = {
                    lat: dmaCenter.geometry.coordinates[1],
                    lng: dmaCenter.geometry.coordinates[0],
                    zoom: config.heatmapLayers.DMA.minZoom,
                    addMarker: false,
                };
                store.setBoundaryLayer = {
                    layerName: "DMA_BOUNDARY",
                    featureCollection: boundaryData.data
                };
            });
        }
    };

    map.on("mousemove", id, setActiveArea);
    // handle click event
    map.on("click", id, dmaLayerClicked);

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

export default dmaLayer;
