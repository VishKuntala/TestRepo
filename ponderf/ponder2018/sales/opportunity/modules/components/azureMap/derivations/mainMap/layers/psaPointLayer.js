import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/psa.js";

const psaPointLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
    const { map, store } = instance;
    const { pointsLayers } = config;
    const {
        id,
        source,
        sourceLayer,
        /*visibility,*/
        visible,
        minZoom,
        maxZoom,
        color,
        imgUrl,
        promoteId,
        minShapeSize,
    } = pointsLayers.PSA_POINTS;

    //const { color, attribute } = instance.appState.userPermissions.pointColorConfig?.[instance.store.locationAttribute] || config.pointColorConfig[instance.store.locationAttribute];


    //Create an array of custom icon promises to load into the map. 
    //const iconPromises = [
    //    map.imageSprite.createFromTemplate(`psa-point-icon-1`, 'ponder-ellipse', color.WIRELESS_SCORE_1),
    //    map.imageSprite.createFromTemplate(`psa-point-icon-2`, 'ponder-ellipse', color.WIRELESS_SCORE_2),
    //    map.imageSprite.createFromTemplate(`psa-point-icon-3`, 'ponder-ellipse', color.WIRELESS_SCORE_3),
    //    map.imageSprite.createFromTemplate(`psa-point-icon-4`, 'ponder-ellipse', color.WIRELESS_SCORE_4),
    //    map.imageSprite.createFromTemplate(`psa-point-icon-5`, 'ponder-ellipse', color.WIRELESS_SCORE_5)
    //];

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
    }


    //let postData = buildPayloadFromStore(instance);
    //postData = Object.assign(postData, { attribute });
    //const queryStringParams = new URLSearchParams(postData).toString();

    const src = new atlas.source.VectorTileSource(source, {
        "tileSize": 256,
        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/psas/{z}/{x}/{y}.mvt`]
    });
    map.sources.add(src);
    instance.store.sourcesAddedToMap.push(source);

    const layer = new atlas.layer.SymbolLayer(src, id, {
        sourceLayer: sourceLayer,
        visible,
        minZoom,
        maxZoom,
        iconOptions: {
            image: [
                "match",
                ["get", "wireless_score"],
                1, `psa-point-icon-1`,
                2, `psa-point-icon-2`,
                3, `psa-point-icon-3`,
                4, `psa-point-icon-4`,
                5, `psa-point-icon-5`,
                `psa-point-icon-1`
            ],
            allowOverlap: true,
            //size: minShapeSize
            size: instance.store.shapeSizes?.find(
                shapeSize => shapeSize.layerId == id
            )?.shapeSize || (pointMinShapeSize || minShapeSize)
        }
    });

    map.layers.add([layer], config.pointsLayers.PSA_POINTS.id, config);
    instance.store.layersAddedToMap.push(id);

    const markerClicked = async event => {
        //instance.store.ignoreNsbBoundaryClick = true;
        //instance.store.mapClickHandled = true;
        //$("div.toast-box").remove();
        //if (!$(".clearBuilding").hasClass("ponderHidden")) {
        //    instance.store.clearBuilding = `${Date.now().toString()}`;
        //}
        //if (!event?.shapes?.[0]?.properties) return;

        //const { properties } = event.shapes[0];

        //const coordinates = event.position;
        //// Ensure that if the map is zoomed out such that multiple
        //// copies of the feature are visible, the popup appears
        //// over the copy being pointed to.

        ///* while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
        //     coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
        // } */

        //if (instance.popup.isOpen()) {
        //    instance.popup.close();
        //}
        //instance.popup.setOptions({
        //    content: `<div class="ui compact message">
        //    <div class="ui active mini blue elastic loader"></div>
        //  </div>`,
        //    position: coordinates,
        //    closeButton: true
        //});
        //instance.popup.open(map);

        ////instance.popup.setLngLat(coordinates)
        ////    .setHTML('<div class="ui active mini blue elastic loader"></div>')
        ////    .addTo(map);

        //try {
        //    const { data } = await instance.getData(
        //        `${instance.store.config.baseUrl}/location/${properties.id}`,
        //    );
        //    instance.popup.setOptions({
        //        closeButton: true,
        //        content: `<div class="ui message">
        //        ${instance.store.config.map.popupHtml(data[0])}
        //      </div>`
        //    })
        //} catch (err) {
        //    console.error(err);
        //}            
        if (!event?.shapes?.[0]?.properties) return;
        const { properties } = event.shapes[0];

        //if (!event?.features?.[0]?.properties) return;
        //if (!event?.features?.[0]?.geometry?.coordinates) return;

        //const { geometry, properties } = event.features[0];

        //const coordinates = geometry.coordinates.slice();

        const coordinates = event.position;
        // Ensure that if the map is zoomed out such that multiple
        // copies of the feature are visible, the popup appears
        // over the copy being pointed to.

        //while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
        //    coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
        //}

        await clicked(instance, coordinates, properties.zip_co_psa, config);
    };

    map.events.add('click', layer, async function (e) {
        markerClicked(e);
    });

    //Promise.all(iconPromises).then(function () {



    //});

    //map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
    //    if (error) throw error;

    //    map.addImage("psa-icon", image, { sdf: true });

    //    map.addSource(source, {
    //        type: "vector",
    //        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/psas/{z}/{x}/{y}.mvt`],
    //        tolerance: 0,
    //    });

    //    map.addLayer(
    //        {
    //            id: id,
    //            "minzoom": minZoom,
    //            "maxzoom": maxZoom,
    //            source,
    //            "source-layer": sourceLayer,
    //            layout: {
    //                visibility: visibility,
    //            },
    //            type: "symbol",
    //            layout: {
    //                visibility: visibility,
    //                "icon-image": "psa-icon",
    //                "icon-allow-overlap": true,
    //                "icon-size": minShapeSize,
    //            },
    //            paint: {
    //                "icon-color": [
    //                    "interpolate",
    //                    ["linear"],
    //                    ["get", "wireless_score"],
    //                    1,
    //                    color.WIRELESS_SCORE_1,
    //                    2,
    //                    color.WIRELESS_SCORE_2,
    //                    3,
    //                    color.WIRELESS_SCORE_3,
    //                    4,
    //                    color.WIRELESS_SCORE_4,
    //                    5,
    //                    color.WIRELESS_SCORE_5,
    //                ],
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

    //    await clicked(instance, coordinates, properties.zip_co_psa);
    //};

    //map.on("click", id, markerClicked);

};
export default psaPointLayer;
