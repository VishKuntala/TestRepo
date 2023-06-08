import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";



const attrPointLayer = ({instance, beforeLayerId }) => {
    const { map, store } = instance;
    const {
        id,
        source,
        visibility,
        minZoom,
        color,
        promoteId,
        imgUrl,
        minShapeSize,
    } = config.pointsLayers.ATTR_POINTS;

    if (map.layers.getLayerById(id)) {
        return;
     }
 


    map.imageSprite.createFromTemplate('attrIcon', 'ellipse-outline', color).then(function () {

        instance.getData(
            `${store.baseApiUrl}/store/locations?category=ATTR`,               
        ).then(function(res) {
            const src = new atlas.source.DataSource(source);
            // src.importDataFromUrl(`${store.baseApiUrl}/store/locations?category=ATTR`);
            src.add(res.data);
            map.sources.add(src);
            instance.store.sourcesAddedToMap.push(source);

            const layer = new atlas.layer.SymbolLayer(src, id, {
                visible: false,
                minZoom,
                iconOptions: {
                    image: 'attrIcon',
                    allowOverlap: true,
                    size: minShapeSize
                }
            });

            map.layers.add([layer], 'labels');
            instance.store.layersAddedToMap.push(id);

            
            const markerClicked = async event => {
                instance.store.mapClickHandled = true;
                if (!event?.shapes?.[0]?.data?.properties) return;
                if (!event?.shapes?.[0]?.data?.geometry?.coordinates) return;
        
                const { geometry, properties } = event.shapes[0].data;
        
                const coordinates = geometry.coordinates.slice();
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
                        `${store.baseSearchApiUrl}/point/stores/${properties.location_id}`,               
                    );
                    const popUpData = data.features[0].properties;
                    instance.popup.setOptions({
                        closeButton: true,
                        content: `<div class="ui compact message">
                        <div style="text-align: center">                   
                    <b>Store Category:</b> ${popUpData.store_category == "ATTR" ? "AT&T Retail Store" : "Authorized Reseller Store"}
                    <br/><b>Location ID:</b> ${popUpData.location_id}
                    <br/><b>Location Name:</b> ${popUpData.location_name}
                    <br/><b>Master Dealer:</b> ${popUpData.master_dealer}
                    <br/><b>Address:</b> ${popUpData.address_1}, ${popUpData.address_2 ? popUpData.address_2 + ', ' : ''}${popUpData.city}, ${popUpData.state}, ${popUpData.zip_code}
                    </div>
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
    });

    /* map.loadImage(`${store.rootUrl}sales/wst/${imgUrl}`, function(error, image) {
        if (error) throw error;

        map.addImage("arIcon", image, { sdf: true });

        map.addSource(source, {
            type: "geojson",
            data: `${store.baseApiUrl}/store/locations?category=AR`,
            promoteId,
        });

        map.addLayer(
            {
                id: id,
                source: source,
                minzoom: minZoom,
                type: "symbol",
                layout: {
                    visibility: visibility,
                    "icon-image": "arIcon",
                    "icon-allow-overlap": true,
                    "icon-size": minShapeSize
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
            config.pointsLayers.ATTR_POINTS.id
        );
    });

    const markerClicked = async event => {
        instance.store.mapClickHandled = true;
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

        
        instance.popup.setLngLat(coordinates)
            .setHTML('<div class="ui active mini blue elastic loader"></div>')
            .addTo(map);

        try {
            const { data } = await instance.getData(
                `${store.baseSearchApiUrl}/point/stores/${properties.location_id}`,               
            );
            const popUpData = data.features[0].properties;
            instance.popup.setHTML(
                `
                  <div style="text-align: center">                   
                   <b>Store Category:</b> ${popUpData.store_category == "ATTR" ? "AT&T Retail Store" : "Authorized Reseller Store"}
                   <br/><b>Location ID:</b> ${popUpData.location_id}
                   <br/><b>Location Name:</b> ${popUpData.location_name}
                   <br/><b>Master Dealer:</b> ${popUpData.master_dealer}
                   <br/><b>Address:</b> ${popUpData.address_1}, ${popUpData.address_2 ? popUpData.address_2 + ', ' : ''}${popUpData.city}, ${popUpData.state}, ${popUpData.zip_code}
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
    }); */
};
export default attrPointLayer;
