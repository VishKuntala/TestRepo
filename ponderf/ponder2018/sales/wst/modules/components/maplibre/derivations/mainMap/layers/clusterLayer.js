import { config } from '../config/config.js';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";



const clusterLayer = ({ instance, beforeLayerId }, geojson) => {
    const { map, store } = instance;
    const { source, id, sourceLayer, visibility, minZoom, maxZoom } = config.pointsLayers.CLUSTER_POINTS;
    const { imgUrl, maxShapeSize, borderColor } = config.pointsLayers.WS_POINTS;

    const { pointsLayers, pointColorConfig } = config;

    const { color, attribute } = pointColorConfig[instance.store.locationAttribute];


    if (store.clearClusterLayer) {
        map.setLayoutProperty(id, "visibility", "none");
        map.setLayoutProperty(`${id}-labels`, "visibility", "none");
        store.channelChanged = false;
        // store.clearClusterLayer = true;
        return;
    }

    if (!store.isChannelActive) {
        map.setLayoutProperty(id, "visibility", "visible");
        map.setLayoutProperty(`${id}-labels`, "visibility", "visible");
    }

    if (map.getLayer(id)) map.removeLayer(id);
    if (map.getLayer(`${id}-labels`)) map.removeLayer(`${id}-labels`);
    if (map.getSource(source)) map.removeSource(source);
    if (map.hasImage('psa-icon')) map.removeImage('psa-icon');


    store.clearClusterLayer = false;


    if (!store.clusterLayerBeforeLayerId) {
        store.clusterLayerBeforeLayerId = beforeLayerId
    }


    let postData = buildPayloadFromStore(instance);
    postData = Object.assign(postData, { attribute });
    const queryStringParams = new URLSearchParams(postData).toString();

    map.loadImage(`${store.rootUrl}sales/wst/${imgUrl}`, function (error, image) {
        if (error) throw error;
        if (store.searchMode === 'businessSearch') {
            if (!map.hasImage("psa-icon")) {
                map.addImage("psa-icon", image, { sdf: true });
            }
        }


        map.addSource(source, {
            "type": "vector",
            'tiles': [
                `${store.baseApiUrl}/clusters/${store.config.tool}/location/${store.geoEntity}/{z}/{x}/{y}.mvt?${queryStringParams}`
            ],
            tolerance: 0,
        });

    
        

        if (store.searchMode !== 'businessSearch') {
            map.addLayer({
                "id": id,
                "minzoom": minZoom,
                "maxZoom": maxZoom,
                "source": source,
                "source-layer": sourceLayer,
                type: "circle",
                "paint": {
                    'circle-color': '#feb24c',
                    'circle-opacity': ['step', ['zoom'], 0.6, 12.1, 0],
                    'circle-radius': 12
                }
            }, map.getLayer(beforeLayerId) ? beforeLayerId : null);

            map.addLayer({
                'id': `${id}-labels`,
                'type': 'symbol',
                'source': source,
                "source-layer": sourceLayer,
                "minzoom": minZoom,
                "maxZoom": maxZoom,
                'layout': {
                    'text-field': [
                        'number-format',
                        ['get', 'numberofmatchedlocations'],
                        { "max-fraction-digits": 2, "notation": "compact", "compact-display": "short" }
                    ],
                    'text-font': [
                        'Open Sans Bold',
                        'Arial Unicode MS Bold'
                    ],
                    'text-size': 10
                },
                'paint': {
                    'text-color': 'rgba(0,0,0,0.5)',
                    'text-opacity': ['step', ['zoom'], 0.6, 12.1, 0]
                }
            });
        } else {
            map.addLayer(
                {
                    id: id,
                    "minzoom": minZoom,
                    source,
                    "source-layer": sourceLayer,
                    layout: {
                        visibility: visibility,
                    },
                    type: "symbol",
                    layout: {
                        visibility: visibility,
                        "icon-image": "psa-icon",
                        "icon-allow-overlap": true,
                        "icon-size": 0.4,
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
                map.getLayer(beforeLayerId) ? beforeLayerId : null
            );

        }

        const markerClicked = async event => {
            if (store.searchMode !== 'businessSearch') {
                return;
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

        map.on("click", id, markerClicked);

    });
    

};

export default clusterLayer;