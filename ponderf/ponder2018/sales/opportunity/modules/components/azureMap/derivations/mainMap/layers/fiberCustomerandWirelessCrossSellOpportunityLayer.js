import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/address.js";

const fiberCustomerandWirelessCrossSellOpportunityLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
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
        minShapeSize
    } = pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CROSS_SELL_OPPORTUNITY;

    //const { color, attribute } = instance.appState.userPermissions.pointColorConfig?.[instance.store.locationAttribute] || config.pointColorConfig[instance.store.locationAttribute];

    ////Create an array of custom icon promises to load into the map. 
    //const iconPromises = [
    //    map.imageSprite.createFromTemplate(`fiberCustomerandWirelessCrossSellOpportunityIcon`, 'ponder-ellipse', color)
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

        const src = new atlas.source.VectorTileSource(source, {
            "tileSize": 256,
            "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=2&searchedPSA=${store.searchedPSA}`]
        });
        map.sources.add(src);
        instance.store.sourcesAddedToMap.push(source);

        const layer = new atlas.layer.SymbolLayer(src, id, {
            sourceLayer: sourceLayer,
            visible,
            minZoom,
            iconOptions: {
                image: 'fiberCustomerandWirelessCrossSellOpportunityIcon',
                allowOverlap: true,
                anchor: 'center',
                //size: pointMinShapeSize || minShapeSize,
                size: instance.store.shapeSizes?.find(
                    shapeSize => shapeSize.layerId == id
                )?.shapeSize || (pointMinShapeSize || minShapeSize)
            }
        });

        map.layers.add([layer], config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CROSS_SELL_OPPORTUNITY.id);
        instance.store.layersAddedToMap.push(id);

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

    //    map.addImage("fiberCustomerandWirelessCrossSellOpportunityIcon", image, { sdf: true });

    //    map.addSource(source, {
    //        "type": "vector",
    //        "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=2`],
    //        "tolerance": 0,
    //        promoteId,
    //    });

    //    map.addLayer(
    //        {
    //            id,
    //            "minzoom": minZoom,
    //            source,
    //            "source-layer": sourceLayer,
    //            layout: {
    //                visibility: visibility,
    //            },
    //            type: "symbol",
    //            layout: {
    //                visibility: visibility,
    //                "icon-image": "fiberCustomerandWirelessCrossSellOpportunityIcon",
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

    //    await clicked(instance, coordinates, properties.addr_id);
    //};

    //map.on("click", id, markerClicked);

};
export default fiberCustomerandWirelessCrossSellOpportunityLayer;
