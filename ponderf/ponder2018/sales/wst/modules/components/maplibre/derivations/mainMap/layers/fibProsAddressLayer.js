import { config } from "../config/config.js";

const fibProsAddressLayer = ({ instance, beforeLayerId }) => {
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
    } = pointsLayers.ATT_FIBER_PROSPECTS;

    map.loadImage(`${store.rootUrl}sales/opportunity/${imgUrl}`, function (error, image) {
        if (error) throw error;

        map.addImage("fibProsAddressIcon", image, { sdf: true });

        map.addSource(source, {
            "type": "vector",
            "tiles": [`${store.baseApiUrl}/tiles/${store.heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=3`],
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
                    "icon-image": "fibProsAddressIcon",
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
                    ]
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
                `${store.baseApiUrl}/point/address/${properties.addr_id}`,
            );
            const popUpData = data.features[0].properties;
            popup.setHTML(
                `
                  <div style="text-align: center">
                   <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                   <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                   <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
                   <br/><b>Customer Category:</b> ${popUpData.customer_category}
                   <br/><div style = "align:center"></div><a href="#" class="fibProsAddressLayerPSAFilterLink">Click To Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
                  </div>
                `
            );
            $('.fibProsAddressLayerPSAFilterLink').click(function () {
                instance.store.addPSAFilter = {
                    psa: popUpData.zip_co_psa,
                    latitude: popUpData.latitude,
                    longitude: popUpData.longitude
                };
            });
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
export default fibProsAddressLayer;
