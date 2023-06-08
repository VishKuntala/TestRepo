import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/mdu.js";

const mduAllATTFiberCustomerLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
    const { map, store } = instance;
    const { pointsLayers } = config;
    const {
        id,
        promoteId,
        source,
        sourceLayer,
        visible,
        minZoom,
        color,
        imgUrl,
        minShapeSize,
    } = pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS;

    //const { color, attribute } = instance.appState.userPermissions.pointColorConfig?.[instance.store.locationAttribute] || config.pointColorConfig[instance.store.locationAttribute];

    ////Create an array of custom icon promises to load into the map. 
    //const iconPromises = [
    //    map.imageSprite.createFromTemplate(`mduAllATTFiberCustomerIcon`, 'ponder-acc-rectangle', color)
    //];

    //Promise.all(iconPromises).then(function () {

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
    }

    if (map.layers.getLayerById(`${id}-mduoutline`)) {
        map.layers.remove(`${id}-mduoutline`);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== `${id}-mduoutline`);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
    }

    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=7&searchedPSA=${store.searchedPSA}`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);

    const size = instance.store.shapeSizes?.find(
        shapeSize => shapeSize.layerId == id
    )?.shapeSize || (pointMinShapeSize || minShapeSize);

    const mduOutlineLayer = new atlas.layer.SymbolLayer(src, `${id}-mduoutline`, {
        sourceLayer: sourceLayer,
        visible,
        minZoom,
        iconOptions: {
            image: 'redRectangleIcon',
            anchor: 'center',
            allowOverlap: true,            
            size: size + 0.1 //mduOutlineLayer icon size should be little greater than MDU layer
        },
        filter: ['==', ['get', 'mdu_acc_flag_code'], 1], //Only MDUs with a "mdu_acc_flag_code" property with a value of '1' will be rendered.
    });

    const layer = new atlas.layer.SymbolLayer(src, id, {
        sourceLayer: sourceLayer,
        visible,
        minZoom,
        iconOptions: {
            image: 'mduAllATTFiberCustomerIcon',
            anchor: 'center',
            allowOverlap: true,            
            size
        }
    });

    map.layers.add([mduOutlineLayer, layer], config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id);
    instance.store.layersAddedToMap.push(id);
    instance.store.layersAddedToMap.push(`${id}-mduoutline`);

    const markerClicked = async event => {
        if (!event?.shapes?.[0]?.properties) return;
        const { properties } = event.shapes[0];
        const coordinates = event.position;
        await clicked(instance, coordinates, properties.addr_id);
    };

    map.events.add('click', layer, async function (e) {
        markerClicked(e);
    });

    /*    });*/

    //map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
    //    if (error) throw error;

    //    map.addImage("mduAllATTFiberCustomerIcon", image, { sdf: true });
    //    map.addSource(source, {
    //        "type": "vector",
    //        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=7`],
    //        "tolerance": 0,
    //        promoteId,
    //    });

    //    map.addLayer(
    //        {
    //            id: id,
    //            source,
    //            "source-layer": sourceLayer,
    //            layout: {
    //                visibility: visibility,
    //            },
    //            "minzoom": minZoom,
    //            type: "symbol",
    //            layout: {
    //                visibility: visibility,
    //                "icon-image": "mduAllATTFiberCustomerIcon",
    //                "icon-allow-overlap": true,
    //                "icon-size": minShapeSize,
    //            },
    //            paint: {
    //                "icon-color": [
    //                    "interpolate",
    //                    ["linear"],
    //                    ["get", "customer_category_id"],
    //                    2,
    //                    color,
    //                ],
    //                "icon-halo-color": [
    //                    "interpolate",
    //                    ["linear"],
    //                    ["get", "mdu_acc_flag_code"],
    //                    1,
    //                    "#FF0000",
    //                    2,
    //                    color,
    //                ],
    //                "icon-halo-width": 5,
    //            },
    //        },
    //        //beforeLayerId
    //    );

    //});

    //const markerClicked = async event => {
    //    if (!event?.features?.[0]?.properties) return;
    //    if (!event?.features?.[0]?.geometry?.coordinates) return;

    //    const { geometry, properties } = event.features[0];

    //    const coordinates = geometry.coordinates.slice();
    //    // Ensure that if the map is zoomed out such that multiple
    //    // copies of the feature are visible, the popup appears
    //    // over the copy being pointed to.

    //    while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
    //        coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
    //    }
    //    await clicked(instance, coordinates, properties.addr_id);
    //};

    //map.on("click", id, markerClicked);

};
export default mduAllATTFiberCustomerLayer;
