import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/top25MDU.js";

const top25MDUPointLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const {
        pointsLayers
    } = config;
    const {
        id,
        source,
        visibility,
        minZoom,
        maxZoom,
        color,
        promoteId,
        imgUrl,
        minShapeSize,
    } = pointsLayers.TOP_25_MDU_POINTS;

    map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
        if (error) throw error;

        map.addImage("top-mdu-icon", image, { sdf: true });

        map.addSource(source, {
            type: "geojson",
            data: `${store.baseApiUrl}/point/top25mdus`,
            promoteId,
        });

        map.addLayer(
            {
                id: id,
                source,
                "minzoom": minZoom,
                "maxzoom": maxZoom,
                type: "symbol",
                layout: {
                    visibility: visibility,
                    "icon-image": "top-mdu-icon",
                    "icon-allow-overlap": true,
                    "icon-size": minShapeSize,
                },
                paint: {
                    "icon-color": [
                        "interpolate",
                        ["linear"],
                        ["get", "wireless_score"],
                        1,
                        color.WIRELESS_SCORE_1,
                        2,
                        color.WIRELESS_SCORE_2,
                        3,
                        color.WIRELESS_SCORE_3,
                        4,
                        color.WIRELESS_SCORE_4,
                        5,
                        color.WIRELESS_SCORE_5,
                    ],
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
        await clicked(instance, coordinates, properties.zip_co_psa);
    };

    map.on("click", id, markerClicked);

};
export default top25MDUPointLayer;
