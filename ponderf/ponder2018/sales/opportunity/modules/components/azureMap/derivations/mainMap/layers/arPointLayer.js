import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/store.js";

const arPointLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
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
    } = config.pointsLayers.AR_POINTS;

    //if (map.layers.getLayerById(id)) {
    //    return;
    //}

    //Create an array of custom icon promises to load into the map. 
    //const iconPromises = [map.imageSprite.createFromTemplate(`arIcon`, 'ellipse-outline', color)];

    if (map.layers.getLayerById(id)) {
        map.layers.remove(id);
        instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
    }

    if (map.sources.getById(source)) {
        map.sources.remove(source);
        instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
    }

    const params = {
        category: 'AR',
        marketType: `${instance.store.marketType}`,
        market: `${instance.store.market}`,
    };
    instance.getData(
        //`${store.baseApiUrl}/point/stores?category=AR&randomize=${Date.now().toString()}`,
        //`${store.baseApiUrl}/point/stores?category=AR&marketType=${instance.store.marketType}&market=${instance.store.market}`,
        `${store.baseApiUrl}/point/stores`,
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
                image: 'arIcon',
                allowOverlap: true,
                //size: minShapeSize
                size: instance.store.shapeSizes?.find(
                    shapeSize => shapeSize.layerId == id
                )?.shapeSize || (pointMinShapeSize || minShapeSize)
            }
        });
        map.layers.add([layer], config.pointsLayers.ATTR_POINTS.id);
        instance.store.layersAddedToMap.push(id);

        const markerClicked = async event => {
            if (!event?.shapes?.[0]?.data.properties) return;
            const { properties } = event.shapes[0].data;
            const coordinates = event.position;
            await clicked(instance, coordinates, properties.location_id);
        };

        map.events.add('click', layer, async function (e) {
            markerClicked(e);
        });

    });

    //Promise.all(iconPromises).then(function () {


    //});
}

export default arPointLayer;
