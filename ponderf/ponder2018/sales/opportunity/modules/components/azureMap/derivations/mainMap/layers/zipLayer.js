import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';
import centroid from "@turf/centroid";

const zipLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.ZIP;

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
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/zips/{z}/{x}/{y}.mvt?marketType=${store.marketType}&market=${store.market}`]
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
    };

    const zipLayerClicked = async event => {
        if (!event?.shapes?.[0]?.properties) return;
        const { properties } = event.shapes[0];
        const coordinates = event.position;
        if (properties.zip) {

            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            instance.popup.setOptions({
                content: `<div style="text-align: center">
                    ${properties.zip}, ${properties.state}
                    <br /><div style="align:center"></div><a href="#" class="zipLayerLink">Click to Show Fiber Opportunities in this Zip</a>
                </div>`,
                position: coordinates,
                closeButton: true
            });
            instance.popup.open(map);

            $('.zipLayerLink').click(async function () {
                console.log('.zipLayerLink click');
                // remove any open popup
                if (instance.popup.isOpen()) {
                    instance.popup.close();
                }
                const value = properties.zip;
                instance.store.searchMode = 'zipSearch';
                instance.store.inSearchMode = true;
                instance.store.searchedZip = value;
                const params = { zip: value };
                // const boundaryData = await instance.getData(
                //     `${store.baseApiUrl}/geodata/${store.heatmap
                //     }/zipBoundary.geojson?zip=${value}`
                // );
                const boundaryData = await instance.getData(
                    `${store.baseApiUrl}/geodata/${store.heatmap}/zipBoundary.geojson`,
                    params
                );
                const zipCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: zipCenter.geometry.coordinates[1],
                    lng: zipCenter.geometry.coordinates[0],
                    zoom: config.heatmapLayers.ZIP.minZoom,
                    addMarker: false,
                };
                store.setBoundaryLayer = {
                    layerName: "ZIP_BOUNDARY",
                    featureCollection: boundaryData
                };
            });
        }
    };

    map.events.add('click', layer, async function (e) {
        zipLayerClicked(e);
    });

    map.events.add('mousemove', layer, function (e) {
        setActiveArea(e);
    });

    map.events.add('mouseleave', layer, function (e) {
        polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
        lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
    });

    //let featureId = null;
    //const setActiveArea = (event) => {
    //    if (!event?.features) return;

    //    if (event.features.length > 0) {
    //        //if id exists from a previous hover, set the area's hovered feature to false
    //        if (featureId) {
    //            map.setFeatureState(
    //                { source, sourceLayer, id: featureId },
    //                { hover: false }
    //            );
    //        }

    //        // get ID of currently hovered area, and set it's hover feature to true
    //        featureId = event.features[0].properties.id;
    //        map.setFeatureState(
    //            { source, sourceLayer, id: featureId },
    //            { hover: true }
    //        );

    //        // update the baseball card info with the current area's information
    //        const { properties } = event.features[0];
    //        const cardData = {
    //            mapCardHeader: header,
    //            mapCardInfo: [
    //                { label: "Zip", property: properties.zip + ", " + properties.state },
    //                { label: "Wireless Category", property: properties.wireless_category },
    //                { label: "Fiber Addresses Available", property: properties.fiber_available.toLocaleString() },
    //                { label: "Current Fiber Customers", property: `${properties.fiber_customers.toLocaleString()} (${properties.fiber_percentage}%)` },
    //                { label: "Fiber Customer and Wireless Customer", property: properties.fiber_customer_wireless_customer.toLocaleString() },
    //                { label: "Fiber Customer and Wireless Cross-Sell Opportunity", property: properties.fiber_customer_no_wireless.toLocaleString() },
    //                { label: "Copper Upgrade and Wireless Customer", property: properties.copper_upgrade_wireless_customer.toLocaleString() },
    //                { label: "Copper Upgrade and Wireless Cross-Sell Opportunity", property: properties.copper_upgrade_no_wireless.toLocaleString() },
    //                { label: "Wireless Customer and Fiber Cross-Sell Opportunity", property: properties.wireless_customer_no_fiber.toLocaleString() },
    //                { label: "Opportunity for Fiber and Wireless", property: properties.no_fiber_no_wireless.toLocaleString() },
    //            ],
    //        };
    //        updateMapInfo(store, cardData);
    //    }
    //};

    //const zipLayerClicked = async event => {
    //    if (!event?.features?.[0]?.properties) return;
    //    const { properties } = event.features[0];
    //    if (properties.zip) {
    //        const popup = new maplibregl.Popup({
    //            maxWidth: "500px",
    //            closeButton: true,
    //            anchor: "bottom",
    //        })
    //            .setLngLat([event.lngLat.lng, event.lngLat.lat])
    //            .setHTML(
    //                `
                  //<div style="text-align: center">                   
                  // ${properties.zip}, ${properties.state}
                  // <br/><div style = "align:center"></div><a href="#" class="zipLayerLink">Click to Show Fiber Opportunities in this Zip</a>
                  //</div>
    //            `
    //            )
    //            .addTo(map);
            //$('.zipLayerLink').click(async function () {                
            //    // remove open popup
            //    $('.mapboxgl-popup').remove();
            //    const value = properties.zip;
            //    instance.store.searchMode = 'zipSearch';
            //    instance.store.inSearchMode = true;
            //    instance.store.searchedZip = value;
            //    const boundaryData = await instance.getData(
            //        `${store.baseApiUrl}/geodata/${store.heatmap
            //        }/zipBoundary.geojson?zip=${value}`
            //    );
            //    const zipCenter = centroid(boundaryData.data);
            //    instance.store.zoomToPoint = {
            //        lat: zipCenter.geometry.coordinates[1],
            //        lng: zipCenter.geometry.coordinates[0],
            //        zoom: config.heatmapLayers.ZIP.minZoom,
            //        addMarker: false,
            //    };                
            //    store.setBoundaryLayer = {
            //        layerName: "ZIP_BOUNDARY",
            //        featureCollection: boundaryData.data
            //    };
            //});
    //    }
    //};

    //map.on("mousemove", id, setActiveArea);
    //// handle click event
    //map.on("click", id, zipLayerClicked);

    //// When the mouse leaves the layer, update the feature-state of the
    //// previously hovered feature.
    //map.on("mouseleave", id, () => {
    //    if (featureId) {
    //        map.setFeatureState(
    //            { source, sourceLayer, id: featureId },
    //            { hover: false }
    //        );
    //    }
    //    featureId = null;
    //});
};
export default zipLayer;
