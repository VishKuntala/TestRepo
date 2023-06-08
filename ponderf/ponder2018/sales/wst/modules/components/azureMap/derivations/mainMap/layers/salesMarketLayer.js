import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { heatmapConfig } from "../config/heatmapConfig.js";
import { updateMapInfo } from "../utils/utils.js";
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";


const salesMarketLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.SALES_MARKET;

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== id);
    }

    if (map.layers.getLayerById(`${id}-hover`)) {
        map.layers.remove(`${id}-hover`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== `${id}-hover`);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter (sourceId => sourceId !== source);
    }

    let postData = buildPayloadFromStore(instance);
    postData = Object.assign(postData, { attribute: (instance.store.config.map && instance.store.config.map.heatmapAttribute) || 'COVERAGE_SCORE' });
    const queryStringParams = new URLSearchParams(postData).toString();


    // SALES MARKET HEATMAP AREAS
    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/vpgms/{z}/{x}/{y}.mvt?${queryStringParams}`]
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

    map.layers.add([layer,polygonHoverLayer], 'labels');
    instance.store.layersAddedToMap.push(id);
    instance.store.layersAddedToMap.push(`${id}-hover`);


    const setActiveArea = (event) => {
        const { properties } = event.shapes[0];
       polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], properties.id] });
        // update the baseball card info with the current area's information
        const cardData = {
            mapCardHeader: header,
            mapCardInfo: heatmapConfig[store.currentHeatmapFilter].mapCardInfo(properties),
        };
        updateMapInfo(store, cardData);
    };

    map.events.add('click', layer, async function (e) {
        setActiveArea(e);
    });

    map.events.add('mousemove', layer, function (e) {
        setActiveArea(e);
    });

    map.events.add('mouseleave', layer, function (e) {
       polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
    });


};

export default salesMarketLayer;
