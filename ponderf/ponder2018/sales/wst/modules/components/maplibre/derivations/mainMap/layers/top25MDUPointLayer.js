import { config } from "../config/config.js";

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
            beforeLayerId
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

        const popup = new maplibregl.Popup({
            maxWidth: "500px",
            closeButton: true,
            anchor: "bottom",
        })
            .setLngLat(coordinates)
            .setHTML('<div class="ui active mini blue elastic loader"></div>')
            .addTo(map);

        try {
            const { data } = await instance.getData(
                `${store.baseApiUrl}/point/top25mdus/${properties.zip_co_psa}`,
            );
            const popUpData = data.features[0].properties;
            popup.setHTML(
                `
                  <div style="text-align: center">
                       <h4><b>Market Top 25 MDU</b></h4>
                       <b>Address:</b> ${ popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                       <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                       <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score_text}
                       <br/><b>Fiber Available:</b> ${popUpData.fiber_available}
                       <br/><b>Fiber Customers:</b> ${popUpData.fiber_customers} (${popUpData.fiber_penetration_rate}%)
                       <br/><b>Fiber Opportunity:</b> ${popUpData.fiber_opportunity}
                       <br/><b>Market Rank:</b> ${popUpData.market_rank }
                  </div>
                `
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
                    { source, id: featureId },
                    { hover: false }
                );
            }

            // get ID of currently hovered point, and set it's hover feature to true
            featureId = event.features[0].id;
            map.setFeatureState({ source, id: featureId }, { hover: true });
        }
    };

    map.on("click", id, markerClicked);
    map.on("mousemove", id, setActivePoint);
    map.on("mouseleave", id, () => {
        // When the mouse leaves the layer, update the feature-state of the
        // previously hovered feature.
        if (featureId) {
            map.setFeatureState({ source, id: featureId }, { hover: false });
        }
        featureId = null;
    });
};
export default top25MDUPointLayer;
