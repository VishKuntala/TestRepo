import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';
import centroid from "@turf/centroid";

const countyLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.COUNTY;

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
    }

    if (map.layers.getLayerById(`${id}-hover`)) {
        map.layers.remove(`${id}-hover`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== `${id}-hover`);
    }

    if (map.layers.getLayerById(`${id}-line`)) {
        map.layers.remove(`${id}-line`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== `${id}-line`);
    }

    if (map.layers.getLayerById(`${id}-linehover`)) {
        map.layers.remove(`${id}-linehover`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== `${id}-linehover`);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
    }

    const src = new atlas.source.VectorTileSource(source, {
        minZoom: instance.store.groupBy == "DYNAMIC" ? minZoom : 1,
        maxZoom: instance.store.groupBy == "DYNAMIC" ? maxZoom : 17,
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/counties/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);

    const layer = new atlas.layer.PolygonLayer(src, id, {
        sourceLayer: sourceLayer,
        visible: true,
        minZoom: instance.store.groupBy == "DYNAMIC" ? minZoom : 1,
        maxZoom: instance.store.groupBy == "DYNAMIC" ? maxZoom : 17,
        fillColor: heatmapConfig[store.currentHeatmapFilter]
            .fillColorExpression,
        fillOpacity: heatmapConfig[store.currentHeatmapFilter]
            .fillOpacityExpression,
    });

    //Add a layer for rendering a different color polygon for representing a hover state.
    const polygonHoverLayer = new atlas.layer.PolygonLayer(src, `${id}-hover`, {
        sourceLayer: sourceLayer,
        minZoom: instance.store.groupBy == "DYNAMIC" ? minZoom : 1,
        maxZoom: instance.store.groupBy == "DYNAMIC" ? maxZoom : 17,
        fillColor: heatmapConfig[store.currentHeatmapFilter]
            .fillColorExpression,
        fillOpacity: heatmapConfig[store.currentHeatmapFilter]
            .fillOpacityHoverExpression,
        //Only polygons with a "id" property with a value of '' will be rendered.
        filter: ['==', ['get', 'id'], '']
    });

    const lineLayer = new atlas.layer.LineLayer(src, `${id}-line`, {
        sourceLayer: sourceLayer,
        strokeColor: '#a9a9a9',
        strokeWidth: 0.5,
        visible: true,
        minZoom: instance.store.groupBy == "DYNAMIC" ? minZoom : 1,
        maxZoom: instance.store.groupBy == "DYNAMIC" ? maxZoom : 17,
    });

    const lineHoverLayer = new atlas.layer.LineLayer(src, `${id}-linehover`, {
        sourceLayer: sourceLayer,
        strokeColor: '#a9a9a9',
        strokeWidth: 4,
        visible: true,
        minZoom: instance.store.groupBy == "DYNAMIC" ? minZoom : 1,
        maxZoom: instance.store.groupBy == "DYNAMIC" ? maxZoom : 17,
        filter: ['==', ['get', 'id'], '']
    });

    map.layers.add([layer, polygonHoverLayer, lineLayer, lineHoverLayer], 'labels');
    instance.store.layersAddedToMap.push(id);
    instance.store.layersAddedToMap.push(`${id}-hover`);
    instance.store.layersAddedToMap.push(`${id}-line`);
    instance.store.layersAddedToMap.push(`${id}-linehover`);

    const setActiveArea = (event) => {
        const { properties } = event.shapes[0];
        polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], properties.id] });
        lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], properties.id] });
        // update the baseball card info with the current area's information
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
    };

    const countyLayerClicked = async event => {
        if (!event?.shapes?.[0]?.properties) return;
        const { properties } = event.shapes[0];
        const coordinates = event.position;
        if (properties.cnty_fips) {

            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            instance.popup.setOptions({
                content: `<div style="text-align: center">                   
                   County: ${properties.county_state}
                   <br/><div style = "align:center"></div><a href="#" class="countyLayerLink">Click to Show Fiber Opportunities in this County</a>
                  </div>`,
                position: coordinates,
                closeButton: true
            });
            instance.popup.open(map);

            $('.countyLayerLink').click(async function () {
                console.log('.countyLayerLink click');
                // remove any open popup
                if (instance.popup.isOpen()) {
                    instance.popup.close();
                }
                const value = properties.cnty_fips;
                instance.store.searchMode = 'countySearch';
                instance.store.inSearchMode = true;
                instance.store.searchedCounty = value;
                const params = {county: value}
                // const boundaryData = await instance.getData(
                //     `${store.baseApiUrl}/geodata/${store.heatmap
                //     }/countyBoundary.geojson?county=${value}`
                // );
                const boundaryData = await instance.getData(
                    `${store.baseApiUrl}/geodata/${store.heatmap}/countyBoundary.geojson`,
                    params
                );
                const countyCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: countyCenter.geometry.coordinates[1],
                    lng: countyCenter.geometry.coordinates[0],
                    zoom: config.heatmapLayers.COUNTY.minZoom,
                    addMarker: false,
                };
                //store.countyBoundary = boundaryData.data;
                store.setBoundaryLayer = {
                    layerName: "COUNTY_BOUNDARY",
                    featureCollection: boundaryData
                };
            });
        }
    };

    map.events.add('click', layer, async function (e) {
        countyLayerClicked(e);
    });

    map.events.add('mousemove', layer, function (e) {
        setActiveArea(e);
    });

    map.events.add('mouseleave', layer, function (e) {
        polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
        lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
    });
};
export default countyLayer;
