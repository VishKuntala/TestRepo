import { config } from "../config/config.js";
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";

const pointLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { pointsLayers, pointColorConfig } = config;
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

    const { color, attribute } = pointColorConfig[instance.store.locationAttribute];

    let postData = buildPayloadFromStore(instance);
    postData = Object.assign(postData, { attribute });
    const queryStringParams = new URLSearchParams(postData).toString();



    map.loadImage(`${store.rootUrl}sales/wst/${imgUrl}`, function(error, image) {
        if (error) throw error;
         // if (!map.hasImage("psa-icon")) {
            map.addImage("psa-icon", image, { sdf: true });
         //}

        /* if (map.getSource(source)) {
            console.log(map.getSource(source));
            map.getSource(source).setData(`${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/locations/{z}/{x}/{y}.mvt?${queryStringParams}`)
        } else { */
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
        /* if (instance.store.mapClickHandled === true) {
            return;
        } */
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
    });
};
export default pointLayer;
