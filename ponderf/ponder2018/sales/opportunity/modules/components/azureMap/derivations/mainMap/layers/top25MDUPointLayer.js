import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/top25MDU.js";

const top25MDUPointLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
    const { map, store } = instance;
    const {
        pointsLayers
    } = config;
    const {
        id,
        source,
        //visibility,
        visible,
        minZoom,
        maxZoom,
        color,
        promoteId,
        imgUrl,
        minShapeSize,
    } = pointsLayers.TOP_25_MDU_POINTS;

    //if (map.layers.getLayerById(id)) {
    //    return;
    //}

    ////Create an array of custom icon promises to load into the map. 
    //const iconPromises = [
    //    map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-1`, 'ponder-rectangle', color.WIRELESS_SCORE_1),
    //    map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-2`, 'ponder-rectangle', color.WIRELESS_SCORE_2),
    //    map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-3`, 'ponder-rectangle', color.WIRELESS_SCORE_3),
    //    map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-4`, 'ponder-rectangle', color.WIRELESS_SCORE_4),
    //    map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-5`, 'ponder-rectangle', color.WIRELESS_SCORE_5)
    //];

    //Promise.all(iconPromises).then(function () {

        if (map.layers.getLayerById(id)) {
            map.layers.remove(id);
            instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
        }

        if (map.sources.getById(source)) {
            map.sources.remove(source);
            instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
        }

    const params = {        
        marketType: `${instance.store.marketType}`,
        market: `${instance.store.market}`,
    };
        instance.getData(
            /*`${store.baseApiUrl}/point/top25mdus?randomize=${Date.now().toString()}`,*/
            //`${store.baseApiUrl}/point/top25mdus?marketType=${instance.store.marketType}&market=${instance.store.market}`,
            `${store.baseApiUrl}/point/top25mdus`,
            params
        ).then(function (res) {
            const src = new atlas.source.DataSource(source);
            src.add(res);
            map.sources.add(src);
            instance.store.sourcesAddedToMap.push(source);

            const layer = new atlas.layer.SymbolLayer(src, id, {
                visible,
                minZoom,
                maxZoom,
                iconOptions: {
                    image: [
                        "match",
                        ["get", "wireless_score"],
                        1, `top25MDU-rectangle-icon-1`,
                        2, `top25MDU-rectangle-icon-2`,
                        3, `top25MDU-rectangle-icon-3`,
                        4, `top25MDU-rectangle-icon-4`,
                        5, `top25MDU-rectangle-icon-5`,
                        `top25MDU-rectangle-icon-1`
                    ],
                    allowOverlap: true,
                    //size: minShapeSize
                    size: instance.store.shapeSizes?.find(
                        shapeSize => shapeSize.layerId == id
                    )?.shapeSize || (pointMinShapeSize || minShapeSize)
                }
            });

            map.layers.add([layer], config.pointsLayers.TOP_25_MDU_POINTS.id);
            instance.store.layersAddedToMap.push(id);

            const markerClicked = async event => {
                if (!event?.shapes?.[0]?.data.properties) return;
                const { properties } = event.shapes[0].data;
                const coordinates = event.position;
                await clicked(instance, coordinates, properties.zip_co_psa);
            };

            map.events.add('click', layer, async function (e) {
                markerClicked(e);
            });

        });
/*    });*/

    //map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
    //    if (error) throw error;

    //    map.addImage("top-mdu-icon", image, { sdf: true });

    //    map.addSource(source, {
    //        type: "geojson",
    //        data: `${store.baseApiUrl}/point/top25mdus`,
    //        promoteId,
    //    });

    //    map.addLayer(
    //        {
    //            id: id,
    //            source,
    //            "minzoom": minZoom,
    //            "maxzoom": maxZoom,
    //            type: "symbol",
    //            layout: {
    //                visibility: visibility,
    //                "icon-image": "top-mdu-icon",
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
export default top25MDUPointLayer;
