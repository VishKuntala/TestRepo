import * as atlas from 'azure-maps-control';
import { multiLineString } from "@turf/helpers";
import bbox from "@turf/bbox";
import { config } from '../config/config.js';

const nsbBoundaryLayer = ({ instance, beforeLayerId }, geojson) => {
    const { map, store } = instance;
    const { source, id } = config.boundaryLayers.NSB_BOUNDARY

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== id);
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

    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/none/nsbBoundaries/{z}/{x}/{y}.mvt`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);

    const layer = new atlas.layer.PolygonLayer(src, id, {
        sourceLayer: "nsbBoundaryLayer",
        visible: false,
        fillColor: "red",
        fillOpacity: 0.40
    });

    const lineLayer = new atlas.layer.LineLayer(src, `${id}-line`, {
        sourceLayer: "nsbBoundaryLayer",
        strokeColor: '#555500',
        strokeWidth: 0.5,
        visible: false,
    });

    const lineHoverLayer = new atlas.layer.LineLayer(src, `${id}-linehover`, {
        sourceLayer: "nsbBoundaryLayer",
        strokeColor: '#D3D3D3',
        strokeWidth: 0.5,
        visible: false,
        filter: ['==', ['get', 'id'], '']
    });

    map.layers.add([layer, lineLayer, lineHoverLayer], 'labels');
    instance.store.layersAddedToMap.push(id);
    instance.store.layersAddedToMap.push(`${id}-line`);
    instance.store.layersAddedToMap.push(`${id}-linehover`);

    const nsbLayerClicked = async event => {
        if (instance.store.mapClickHandled === true) {
            return;
        }
        instance.store.mapClickHandled = true;
        instance.store.ignoreNsbBoundaryClick = false;
        if (!event?.shapes?.[0]?.properties) return;
        if (map.getCamera().zoom <= 12) {
            const coordinates = event.shapes[0].geometry.coordinates;
            const nsbBoundary = multiLineString(coordinates);
            const nsbBBox = bbox(nsbBoundary);
            map.setCamera( {bounds : nsbBBox, padding: { top: 10, bottom: 25, left: 15, right: 5 } });
        }
        const { properties } = event.shapes[0];
        if (instance.store.config.map?.nsbLayerPopupHtml) {
            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            instance.popup.setOptions({
                content : `<div class="ui compact message">
                ${instance.store.config.map.nsbLayerPopupHtml(properties)}
               </div>
                `,
                position: event.position,
                closeButton: true
            });
            instance.popup.open(map);
            instance.store.ignoreNsbBoundaryClick = false;
           // instance.store.mapClickHandled = false;            
        }
    };

    

    map.events.add('click', layer, async function (e) {
        nsbLayerClicked(e);
    });

    map.events.add('mousemove', layer, function (e) {
        lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], id] });
    });

    map.events.add('mouseleave', layer, function (e) {
       lineHoverLayer.setOptions({ filter: ['==', ['get', 'id'], ''] });
    });

};

export default nsbBoundaryLayer;