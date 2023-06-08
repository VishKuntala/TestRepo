import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';
import centroid from "@turf/centroid";
import maplibregl from "maplibre-gl";

const censusBlockLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.CENSUS_BLOCK;

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
        minZoom,
        maxZoom,
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/censusBlocks/{z}/{x}/{y}.mvt`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);

    const layer = new atlas.layer.PolygonLayer(src, id, {
        sourceLayer: sourceLayer,
        visible: true,
        minZoom,
        maxZoom,
        fillColor: heatmapConfig[store.currentHeatmapFilter]
            .fillColorExpression,
        fillOpacity: heatmapConfig[store.currentHeatmapFilter]
            .fillOpacityExpression,
    });

    //Add a layer for rendering a different color polygon for representing a hover state.
    const polygonHoverLayer = new atlas.layer.PolygonLayer(src, `${id}-hover`, {
        sourceLayer: sourceLayer,
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
        minZoom,
        maxZoom,
    });

    const lineHoverLayer = new atlas.layer.LineLayer(src, `${id}-linehover`, {
        sourceLayer: sourceLayer,
        strokeColor: '#a9a9a9',
        strokeWidth: 4,
        visible: true,
        minZoom,
        maxZoom,
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
                { label: "Census Block", property: properties.id },
                { label: "Wireless Category", property: properties.wireless_category },
                { label: "Fiber Addresses Available", property: properties.fiber_available?.toLocaleString() },
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

    const censusBlockLayerClicked = async event => {
        if (!event?.shapes?.[0]?.properties) return;
        const { properties } = event.shapes[0];
        const coordinates = event.position;
        if (properties.id) {

            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            instance.popup.setOptions({
                content: `<div style="text-align: center">                   
                   Census : ${properties.name}
                   <br/><div style = "align:center"></div><a href="#" class="censusBlockLayerLink">Click to Show Fiber Opportunities in this Census Block</a>
                  </div>`,
                position: coordinates,
                closeButton: true
            });
            instance.popup.open(map);

            $('.censusBlockLayerLink').click(async function () {
                console.log('.censusBlockLayerLink click');
                // remove any open popup
                if (instance.popup.isOpen()) {
                    instance.popup.close();
                }
                const value = properties.id;
                //we just need to zoom in to censuBlock layer no additional filteration logic is applied to the map, don't set store's searchMode, inSearchMode and other properties like do it in CMA, County and Zip
                const params = {            
                    id: value
                };
                //const boundaryData = await instance.getData(`${store.baseApiUrl}/geodata/${store.heatmap}/censusBlockBoundary.geojson?id=${value}`);
                const boundaryData = await instance.getData(`${store.baseApiUrl}/geodata/${store.heatmap}/censusBlockBoundary.geojson`, params);
                const censusBlockCenter = centroid(boundaryData);
                instance.store.zoomToPoint = {
                    lat: censusBlockCenter.geometry.coordinates[1],
                    lng: censusBlockCenter.geometry.coordinates[0],
                    zoom: config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom,
                    addMarker: false,
                };
                store.setBoundaryLayer = {
                    layerName: "CENSUS_BLOCK_BOUNDARY",
                    featureCollection: boundaryData
                };
            });
        }
    };

    map.events.add('click', layer, async function (e) {
        censusBlockLayerClicked(e);
    });

    map.events.add('mousemove', layer, function (e) {
        setActiveArea(e);
    });

    map.events.add('mouseleave', layer, function (e) {
        polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
        lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
    });
};
export default censusBlockLayer;
