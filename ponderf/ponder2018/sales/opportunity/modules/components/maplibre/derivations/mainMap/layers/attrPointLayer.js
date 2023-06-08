import { config } from "../config/config.js";
import { clicked } from "../../../../../markerTypes/store.js";

const attrPointLayer = ({ instance, beforeLayerId }) => {
    const { map, store } = instance;
    const {
        pointsLayers
    } = config;
    const { id, source, visibility, minZoom, imgUrl, color, promoteId, minShapeSize } = pointsLayers.ATTR_POINTS;

    map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
        if (error) throw error;

        map.addImage("attrIcon", image, { sdf: true });

        map.addSource(source, {
            type: "geojson",
            data: `${store.baseApiUrl}/point/stores?category=ATTR`,
            promoteId
        });

        map.addLayer(
            {
                "id": id,
                "source": source,
                "minzoom": minZoom,
                "type": "symbol",
                "layout": {
                    "visibility": visibility,
                    "icon-image": "attrIcon",
                    'icon-allow-overlap': true,
                    'icon-size': minShapeSize,
                },
                paint: {
                    "icon-color": [
                        "interpolate",
                        ["linear"],
                        ["get", "store_category_id"],
                        2,
                        color,
                    ],
                    "icon-halo-color": "rgb(255, 0, 0)"
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
        await clicked(instance, coordinates, properties.location_id);
    };

    map.on("click", id, markerClicked);

};

export default attrPointLayer;
