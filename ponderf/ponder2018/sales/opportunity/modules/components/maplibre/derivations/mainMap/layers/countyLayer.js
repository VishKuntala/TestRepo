import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';
import centroid from "@turf/centroid";
import maplibregl from "maplibre-gl";

const countyLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, sourceLayer, promoteId, header, minZoom, maxZoom } = config.heatmapLayers.COUNTY;

    map.addSource(source, {
        "type": "vector",
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/counties/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`],
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
                    { label: "County", property: properties.cnty_fips },
                    { label: "County Name", property: properties.county_state },
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

    const countyLayerClicked = async event => {        
        if (!event?.features?.[0]?.properties) return;
        const { properties } = event.features[0];
        if (properties.cnty_fips) {
            const popup = new maplibregl.Popup({
                maxWidth: "500px",
                closeButton: true,
                anchor: "bottom",
            })
                .setLngLat([event.lngLat.lng, event.lngLat.lat])
                .setHTML(
                    `
                  <div style="text-align: center">                   
                   County: ${properties.county_state}
                   <br/><div style = "align:center"></div><a href="#" class="countyLayerLink">Click to Show Fiber Opportunities in this County</a>
                  </div>
                `
                )
                .addTo(map);
            $('.countyLayerLink').click(async function () {
                // remove open popup
                $('.mapboxgl-popup').remove();
                const value = properties.cnty_fips;
                instance.store.searchMode = 'countySearch';
                instance.store.inSearchMode = true;
                instance.store.searchedCounty = value;
                const boundaryData = await instance.getData(
                    `${store.baseApiUrl}/geodata/${store.heatmap
                    }/countyBoundary.geojson?county=${value}`
                );
                const countyCenter = centroid(boundaryData.data);
                instance.store.zoomToPoint = {
                    lat: countyCenter.geometry.coordinates[1],
                    lng: countyCenter.geometry.coordinates[0],
                    zoom: config.heatmapLayers.COUNTY.minZoom,
                    addMarker: false,
                };
                //store.countyBoundary = boundaryData.data;
                store.setBoundaryLayer = {
                    layerName: "COUNTY_BOUNDARY",
                    featureCollection: boundaryData.data
                };
            });
        }
    };

    map.on("mousemove", id, setActiveArea);
    // handle click event
    map.on("click", id, countyLayerClicked);

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
export default countyLayer;
