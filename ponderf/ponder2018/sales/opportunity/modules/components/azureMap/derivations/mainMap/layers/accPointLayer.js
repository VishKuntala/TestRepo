import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/acc.js";

const accPointLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
    const { map, store } = instance;
    const {
        id,
        source,
        visible,
        minZoom,
        color,
        promoteId,
        imgUrl,
        minShapeSize,
    } = config.pointsLayers.ACC_POINTS;

    //if (map.layers.getLayerById(id)) {
    //    return;
    //}

    //Create an array of custom icon promises to load into the map. 
    /*const iconPromises = [map.imageSprite.createFromTemplate(`accIcon`, 'ponder-rectangle', color)];*/

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
    }

    const { generalManager, areaManager, preferredPartner, contractType } = store.accFilterData;
    const params = {
        generalManager,
        areaManager,
        preferredPartner,
        contractType
    };
    instance.getData(
        /*`${store.baseApiUrl}/point/accs?generalManager=${generalManager}&areaManager=${areaManager}&preferredPartner=${preferredPartner}&contractType=${contractType}`,*/
        `${store.baseApiUrl}/point/accs`,
        params
    ).then(function (res) {
        const src = new atlas.source.DataSource(source);
        src.add(res);
        map.sources.add(src);
        instance.store.sourcesAddedToMap.push(source);

        const layer = new atlas.layer.SymbolLayer(src, id, {
            visible,
            minZoom,
            iconOptions: {
                image: 'accIcon',
                allowOverlap: true,
                size: instance.store.shapeSizes?.find(
                    shapeSize => shapeSize.layerId == id
                )?.shapeSize || (pointMinShapeSize || minShapeSize)
            }
        });

        map.layers.add([layer], config.pointsLayers.ACC_POINTS.id);
        instance.store.layersAddedToMap.push(id);
        //reload userACCTable data
        instance.store.userACCTableData = R.pluck("properties", res.features);
        // userACCTable data is already reloaded in above line so set this flag to true to cancel reloading of this again in zoomend event
        instance.store.ignoreZoomEndEvent = true;
        //set bounds
        map.setCamera({ bounds: atlas.data.BoundingBox.fromData(res) });
        //set currentZoom value in store
        instance.store.currentZoom = instance.map.getCamera().zoom;

        const markerClicked = async event => {
            if (!event?.shapes?.[0]?.data.properties) return;
            const { properties } = event.shapes[0].data;
            const coordinates = event.position;
            await clicked(instance, coordinates, properties.acc_mstr_prpty_id);
        };

        map.events.add('click', layer, async function (e) {
            markerClicked(e);
        });

    });

    //Promise.all(iconPromises).then(function () {


    //});

    //map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
    //    if (error) throw error;

    //    map.addImage("accIcon", image, { sdf: true });

    //    map.addSource(source, {
    //        type: "geojson",
    //        data: `${store.baseApiUrl}/point/accs`,
    //        promoteId,
    //    });

    //    map.addLayer(
    //        {
    //            id: id,
    //            source: source,
    //            minzoom: minZoom,
    //            type: "symbol",
    //            layout: {
    //                visibility: visibility,
    //                "icon-image": "accIcon",
    //                "icon-allow-overlap": true,
    //                "icon-size": minShapeSize,
    //            },
    //            paint: {
    //                "icon-color": [
    //                    "interpolate",
    //                    ["linear"],
    //                    ["get", "acc_mstr_prpty_id"],
    //                    2,
    //                    color,
    //                ]
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
    //    await clicked(instance, coordinates, properties.acc_mstr_prpty_id);
    //};

    //map.on("click", id, markerClicked);

};
export default accPointLayer;
