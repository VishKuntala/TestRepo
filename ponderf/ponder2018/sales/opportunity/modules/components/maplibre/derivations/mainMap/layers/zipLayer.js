import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';
import centroid from "@turf/centroid";
import maplibregl from "maplibre-gl";

const zipLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.ZIP;

    map.addSource(source, {
        "type": "vector",
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/zips/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`],
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
                    { label: "Zip", property: properties.zip + ", " + properties.state },
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

    const zipLayerClicked = async event => {
        if (!event?.features?.[0]?.properties) return;
        const { properties } = event.features[0];
        if (properties.zip) {
            const popup = new maplibregl.Popup({
                maxWidth: "500px",
                closeButton: true,
                anchor: "bottom",
            })
                .setLngLat([event.lngLat.lng, event.lngLat.lat])
                .setHTML(
                    `
                  <div style="text-align: center">                   
                   ${properties.zip}, ${properties.state}
                   <br/><div style = "align:center"></div><a href="#" class="zipLayerLink">Click to Show Fiber Opportunities in this Zip</a>
                  </div>
                `
                )
                .addTo(map);
            $('.zipLayerLink').click(async function () {                
                // remove open popup
                $('.mapboxgl-popup').remove();
                const value = properties.zip;
                instance.store.searchMode = 'zipSearch';
                instance.store.inSearchMode = true;
                instance.store.searchedZip = value;
                const boundaryData = await instance.getData(
                    `${store.baseApiUrl}/geodata/${store.heatmap
                    }/zipBoundary.geojson?zip=${value}`
                );
                const zipCenter = centroid(boundaryData.data);
                instance.store.zoomToPoint = {
                    lat: zipCenter.geometry.coordinates[1],
                    lng: zipCenter.geometry.coordinates[0],
                    zoom: config.heatmapLayers.ZIP.minZoom,
                    addMarker: false,
                };                
                store.setBoundaryLayer = {
                    layerName: "ZIP_BOUNDARY",
                    featureCollection: boundaryData.data
                };
            });
        }
    };

    map.on("mousemove", id, setActiveArea);
    // handle click event
    map.on("click", id, zipLayerClicked);

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
export default zipLayer;
