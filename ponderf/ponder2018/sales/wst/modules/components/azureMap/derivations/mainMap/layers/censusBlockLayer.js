import * as atlas from 'azure-maps-control';
import { config } from '../config/config.js';
import { heatmapConfig } from '../config/heatmapConfig.js';
import { updateMapInfo } from '../utils/utils.js';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";

const censusBlockLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { source, id, promoteId, sourceLayer, header, minZoom, maxZoom } = config.heatmapLayers.CENSUS_BLOCK;

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== id);
    }

    if (map.layers.getLayerById(`${id}-hover`)) {
        map.layers.remove(`${id}-hover`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== `${id}-hover`);
    }

    if (map.layers.getLayerById(`${id}-line`)) {
        map.layers.remove(`${id}-line`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== `${id}-line`);
    }

    if (map.layers.getLayerById(`${id}-linehover`)) {
        map.layers.remove(`${id}-linehover`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== `${id}-linehover`);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter (sourceId => sourceId !== source);
    }

    let postData = buildPayloadFromStore(instance);
    postData = Object.assign(postData, { attribute: (instance.store.config.map && instance.store.config.map.heatmapAttribute) || 'COVERAGE_SCORE' });
    const queryStringParams = new URLSearchParams(postData).toString();


    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [  `${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/censusBlocks/{z}/{x}/{y}.mvt?${queryStringParams}`]
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

    const censusLayerClicked = async event => {
        if (instance.store.mapClickHandled === true) {
            instance.store.mapClickHandled = false;
            return;
        }
        if (!event?.shapes?.[0]?.properties) return;
        const { properties } = event.shapes[0];
        const coordinates = event.position;

        if (properties.id) {
            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            instance.popup.setOptions({
                content : `<div class="ui compact message"><div style="text-align: center">                   
                <br/><a href="#" censusBlockId="${properties.id}" class="censusTenantsExportLink">${instance.store.config.map.censusBlockPopupContent || 'Show businesses in this census block'}</a>
               </div></div>
                `,
                position: coordinates,
                closeButton: true
            });
            instance.popup.open(map);

            /* instance.popup.setLngLat([event.lngLat.lng, event.lngLat.lat])
                .setHTML(
                    `
                  <div style="text-align: center">                   
                   <br/><div style = "align:center"></div><a href="#" censusBlockId="${properties.id}" class="censusTenantsExportLink">Show businesses in this census block</a>
                  </div>
                `
                )
                .addTo(map); */
            
        }
    };

    const setActiveArea = (event) => {
        const { properties } = event.shapes[0];
       polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], properties.id] });
       lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], properties.id] });
        // update the baseball card info with the current area's information
        const cardData = {
            mapCardHeader: header,
            mapCardInfo: [
                { label: "Census Block", property: properties.name },
                { label: "Avg Indoor Coverage Score", property: properties.avg_cov_score },                      ],
        };
        updateMapInfo(store, cardData);
    };

    map.events.add('click', layer, async function (e) {
        censusLayerClicked(e);
    });

    map.events.add('mousemove', layer, function (e) {
        setActiveArea(e);
    });

    map.events.add('mouseleave', layer, function (e) {
       polygonHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
       lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
    });

/*
    map.addSource(source, {
        "type": "vector",
        "tiles": [
            `${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/censusBlocks/{z}/{x}/{y}.mvt`,
        ],
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
                    { label: "Census Block", property: properties.name },
                    { label: "Avg Indoor Coverage Score", property: properties.avg_cov_score },                      ],
            };
            updateMapInfo(store, cardData);
        }
    };


    const censusLayerClicked = async event => {
        if (instance.store.mapClickHandled === true) {
            instance.store.mapClickHandled = false;
            return;
        }
        if (!event?.features?.[0]?.properties) return;
        const { properties } = event.features[0];
        if (properties.id) {
            instance.popup.setLngLat([event.lngLat.lng, event.lngLat.lat])
                .setHTML(
                    `
                  <div style="text-align: center">                   
                   <br/><div style = "align:center"></div><a href="#" censusBlockId="${properties.id}" class="censusTenantsExportLink">Show businesses in this census block</a>
                  </div>
                `
                )
                .addTo(map);
            
        }
    };

    map.on("mousemove", id, setActiveArea);
    // handle click event
    map.on("click", id, censusLayerClicked);


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
    }); */
};
export default censusBlockLayer;
