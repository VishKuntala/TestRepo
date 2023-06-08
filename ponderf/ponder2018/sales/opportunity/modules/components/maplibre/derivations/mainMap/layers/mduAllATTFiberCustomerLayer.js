﻿import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/mdu.js";

const mduAllATTFiberCustomerLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const { pointsLayers } = config;
    const {
        id,
        promoteId,
        source,
        sourceLayer,
        visibility,
        minZoom,
        color,
        imgUrl,
        minShapeSize,
    } = pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS;

    map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
        if (error) throw error;

        map.addImage("mduAllATTFiberCustomerIcon", image, { sdf: true });
        map.addSource(source, {
            "type": "vector",
            "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=7`],
            "tolerance": 0,
            promoteId,
        });

        map.addLayer(
            {
                id: id,
                source,
                "source-layer": sourceLayer,
                layout: {
                    visibility: visibility,
                },
                "minzoom": minZoom,
                type: "symbol",
                layout: {
                    visibility: visibility,
                    "icon-image": "mduAllATTFiberCustomerIcon",
                    "icon-allow-overlap": true,
                    "icon-size": minShapeSize,
                },
                paint: {
                    "icon-color": [
                        "interpolate",
                        ["linear"],
                        ["get", "customer_category_id"],
                        2,
                        color,
                    ],
                    "icon-halo-color": [
                        "interpolate",
                        ["linear"],
                        ["get", "mdu_acc_flag_code"],
                        1,
                        "#FF0000",
                        2,
                        color,
                    ],
                    "icon-halo-width": 5,
                },
            },
            //beforeLayerId
        );

    });

    const markerClicked = async event => {
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
        await clicked(instance, coordinates, properties.addr_id);
    };

    map.on("click", id, markerClicked);

};
export default mduAllATTFiberCustomerLayer;