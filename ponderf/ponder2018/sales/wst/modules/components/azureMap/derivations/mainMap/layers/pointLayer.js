import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";

const pointLayer = ({ instance, beforeLayerId, pointMinShapeSize }) => {
    const { map, store } = instance;
    const { pointsLayers } = config;
    // const pointColorConfig = instance.appState.userPermissions.pointColorConfig || config.pointColorConfig;

    const {
        id,
        source,
        sourceLayer,
        visibility,
        minZoom,
        maxZoom,
        borderColor,
        imgUrl,
        promoteId,
        minShapeSize,
    } = pointsLayers.WS_POINTS;


    const { color, attribute } = instance.appState.userPermissions.pointColorConfig?.[instance.store.locationAttribute] || config.pointColorConfig[instance.store.locationAttribute];


     //Create an array of custom icon promises to load into the map. 
     const iconPromises = [
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_0`, 'ponder-rectangle', color.COLOR_0),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_1`, 'ponder-rectangle', color.COLOR_1),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_2`, 'ponder-rectangle', color.COLOR_2),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_3`, 'ponder-rectangle', color.COLOR_3),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_4`, 'ponder-rectangle', color.COLOR_4),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_5`, 'ponder-rectangle', color.COLOR_5),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_6`, 'ponder-rectangle', color.COLOR_6),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_7`, 'ponder-rectangle', color.COLOR_7),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_8`, 'ponder-rectangle', color.COLOR_8),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_30`, 'ponder-rectangle', color.COLOR_30),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_60`, 'ponder-rectangle', color.COLOR_60),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_90`, 'ponder-rectangle', color.COLOR_90),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_98`, 'ponder-rectangle', color.COLOR_98),
        map.imageSprite.createFromTemplate(`${instance.store.locationAttribute}-point-icon_99`, 'ponder-rectangle', color.COLOR_99)
    ];


    Promise.all(iconPromises).then(function () {

        if (map.layers.getLayerById(id)) {
            map.layers.remove(id);
            instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter (layerId => layerId !== id);
        }
    
        if (map.sources.getById(source)) {
            map.sources.remove(source);
            instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter (sourceId => sourceId !== source);
        }
    

        let postData = buildPayloadFromStore(instance);
        postData = Object.assign(postData, { attribute });
        const queryStringParams = new URLSearchParams(postData).toString();

        const src = new atlas.source.VectorTileSource(source, {
            "tileSize": 256,
            "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/locations/{z}/{x}/{y}.mvt?${queryStringParams}`]
        });
        map.sources.add(src);
        instance.store.sourcesAddedToMap.push(source);

        const layer = new atlas.layer.SymbolLayer(src, id, {
            sourceLayer: sourceLayer,
            visible: true,
            minZoom,
            maxZoom,
            iconOptions: {
                image: [
                    "match",
                    ["get", "location_attribute"],
                    0, `${instance.store.locationAttribute}-point-icon_0`,
                    1, `${instance.store.locationAttribute}-point-icon_1`,
                    2, `${instance.store.locationAttribute}-point-icon_2`,
                    3, `${instance.store.locationAttribute}-point-icon_3`,
                    4, `${instance.store.locationAttribute}-point-icon_4`,
                    5, `${instance.store.locationAttribute}-point-icon_5`,
                    6, `${instance.store.locationAttribute}-point-icon_6`,
                    7, `${instance.store.locationAttribute}-point-icon_7`,
                    8, `${instance.store.locationAttribute}-point-icon_8`,
                    30, `${instance.store.locationAttribute}-point-icon_30`,
                    60, `${instance.store.locationAttribute}-point-icon_60`,
                    90, `${instance.store.locationAttribute}-point-icon_90`,
                    98, `${instance.store.locationAttribute}-point-icon_98`,
                    99, `${instance.store.locationAttribute}-point-icon_99`,
                    `${instance.store.locationAttribute}-point-icon_99`
                ],
                allowOverlap: true,
                size: instance.store.shapeSizes?.find(
                    shapeSize => shapeSize.layerId == id
                    )?.shapeSize || (pointMinShapeSize || minShapeSize)
            }
        });

        map.layers.add([layer], 'labels');
        instance.store.layersAddedToMap.push(id);

        const markerClicked = async event => {
            instance.store.ignoreNsbBoundaryClick = true;
            instance.store.mapClickHandled = true;
            $("div.toast-box").remove();
            if (!$(".clearBuilding").hasClass("ponderHidden")) {
                instance.store.clearBuilding = `${Date.now().toString()}`;
            }
            if (!event?.shapes?.[0]?.properties) return;
    
            const { properties } = event.shapes[0];
    
            const coordinates = event.position;
            // Ensure that if the map is zoomed out such that multiple
            // copies of the feature are visible, the popup appears
            // over the copy being pointed to.
    
           /* while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
                coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
            } */
            
            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            instance.popup.setOptions({
                content : `<div class="ui compact message">
                <div class="ui active mini blue elastic loader"></div>
              </div>`,
                position: coordinates,
                closeButton: true
            });
            instance.popup.open(map);
            
            //instance.popup.setLngLat(coordinates)
            //    .setHTML('<div class="ui active mini blue elastic loader"></div>')
            //    .addTo(map);
    
            try {
                const { data } = await instance.getData(
                    `${instance.store.config.baseUrl}/location/${properties.id}`,               
                );
                instance.popup.setOptions({
                    closeButton: true,
                    content: `<div class="ui message">
                    ${instance.store.config.map.popupHtml(data[0])}
                  </div>`
                })
            } catch (err) {
                console.error(err);
            }
        };

        map.events.add('click', layer, async function (e) {
            markerClicked(e);
        });

    });

    /*
    let postData = buildPayloadFromStore(instance);
    postData = Object.assign(postData, { attribute });
    const queryStringParams = new URLSearchParams(postData).toString();



    map.loadImage(`${store.rootUrl}sales/wst/${imgUrl}`, function(error, image) {
        if (error) throw error;
         // if (!map.hasImage("psa-icon")) {
            map.addImage("psa-icon", image, { sdf: true });
         //}

        
            map.addSource(source, {
                type: "vector",
                "tiles": [
                    `${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/locations/{z}/{x}/{y}.mvt?${queryStringParams}`
                ],
                tolerance: 0,
                volatile: true,
            });
        // }

        map.addLayer(
                {
                    id: id,
                    "minzoom": minZoom,
                    "maxzoom": maxZoom,
                    source,
                    "source-layer": sourceLayer,
                    layout: {
                        visibility: visibility,
                    },
                    type: "symbol",
                    layout: {
                        "icon-image": "psa-icon",
                        "icon-allow-overlap": true,
                        "icon-size": minShapeSize
                    },
                    paint: {
                        "icon-color": [
                            "interpolate",
                            ["linear"],
                            ["get", "location_attribute"],
                            0,
                            color.COLOR_0,
                            1,
                            color.COLOR_1,
                            2,
                            color.COLOR_2,
                            3,
                            color.COLOR_3,
                            4,
                            color.COLOR_4,
                            5,
                            color.COLOR_5,
                            6,
                            color.COLOR_6,
                            7,
                            color.COLOR_7,
                            30,
                            color.COLOR_30,
                            60,
                            color.COLOR_60,
                            90,
                            color.COLOR_90,
                            98,
                            color.COLOR_98,
                            99,
                            color.COLOR_99
                        ],
                        "icon-halo-color": [
                            "interpolate",
                            ["linear"],
                            ["get", "campaign_id"],
                            1,
                            borderColor?.CAMPAIGN_ID_1,
                            2,
                            borderColor?.CAMPAIGN_ID_2,
                            3,
                            borderColor?.CAMPAIGN_ID_3,
                            4,
                            borderColor?.CAMPAIGN_ID_4,
                            5,
                            borderColor?.CAMPAIGN_ID_5,
                            6,
                            borderColor?.CAMPAIGN_ID_6,
                            7,
                            borderColor?.CAMPAIGN_ID_7,
                            8,
                            borderColor?.CAMPAIGN_ID_8,
                        ],
                        "icon-halo-width": borderColor ? 25 : 0,
                    },
                },
                
            );
        
        });

    const markerClicked = async event => {
        instance.store.ignoreNsbBoundaryClick = true;
        console.log('point layer clicked');
       
        instance.store.mapClickHandled = true;
        $("div.toast-box").remove();
        if (!$(".clearBuilding").hasClass("ponderHidden")) {
            instance.store.clearBuilding = `${Date.now().toString()}`;
        }
        if (!event?.features?.[0]?.properties) return;
        if (!event?.features?.[0]?.geometry?.coordinates) return;

        const { geometry, properties } = event.features[0];

        const coordinates = geometry.coordinates.slice();
        // Ensure that if the map is zoomed out such that multiple
        // copies of the feature are visible, the popup appears
        // over the copy being pointed to.

        while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
            coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
        }

        instance.popup
            .setLngLat(coordinates)
            .setHTML('<div class="ui active mini blue elastic loader"></div>')
            .addTo(map);

        try {
            const { data } = await instance.getData(
                `${instance.store.config.baseUrl}/location/${properties.id}`,
            );
            instance.popup.setHTML(
                instance.store.config.map.popupHtml(data[0])
            );

        } catch (err) {
            console.error(err);
        }
    };

    let featureId = null;
    const setActivePoint = event => {
        if (!event?.features) return;

        if (event.features.length > 0) {
            //if id exists from a previous hover, set the point's hovered feature to false
            if (featureId) {
                map.setFeatureState(
                    { source, sourceLayer, id: featureId },
                    { hover: false }
                );
            }

            // get ID of currently hovered point, and set it's hover feature to true
            featureId = event.features[0].id;
            map.setFeatureState({ source, sourceLayer, id: featureId }, { hover: true });
        }
    };

    map.on("click", id, markerClicked);
    map.on("mousemove", id, setActivePoint);
    map.on("mouseleave", id, () => {
        // When the mouse leaves the layer, update the feature-state of the
        // previously hovered feature.
        if (featureId) {
            map.setFeatureState({ source, sourceLayer, id: featureId }, { hover: false });
        }
        featureId = null;
    }); */
};
export default pointLayer;
