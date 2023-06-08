import * as atlas from 'azure-maps-control';
import { config } from "../config/config.js";
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";

const psaLayer = ({ instance, beforeLayerId }) => {
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
    } = pointsLayers.PSA_POINTS;

    const { color, attribute } = pointColorConfig["indoorCoverageScore"];


     //Create an array of custom icon promises to load into the map. 
     const iconPromises = [
        map.imageSprite.createFromTemplate('psa-icon_0', 'ponder-ellipse', color.COLOR_0),
        map.imageSprite.createFromTemplate('psa-icon_1', 'ponder-ellipse', color.COLOR_1),
        map.imageSprite.createFromTemplate('psa-icon_2', 'ponder-ellipse', color.COLOR_2),
        map.imageSprite.createFromTemplate('psa-icon_3', 'ponder-ellipse', color.COLOR_3),
        map.imageSprite.createFromTemplate('psa-icon_4', 'ponder-ellipse', color.COLOR_4),
        map.imageSprite.createFromTemplate('psa-icon_5', 'ponder-ellipse', color.COLOR_5),
        map.imageSprite.createFromTemplate('psa-icon_99', 'ponder-ellipse', color.COLOR_99)
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
            "tiles": [`${store.baseApiUrl}/${store.config.tool}/tiles/${store.heatmap}/psas/{z}/{x}/{y}.mvt?${queryStringParams}`]
        });
        map.sources.add(src);
        instance.store.sourcesAddedToMap.push(source);

        const layer = new atlas.layer.SymbolLayer(src, id, {
            sourceLayer: sourceLayer,
            visible: true,
            minZoom,
            maxZoom,
            iconOptions: {
                image:  [
                    "match",
                    ["get", "location_attribute"],
                    0, 'psa-icon_0',
                    1, 'psa-icon_1',
                    2, 'psa-icon_2',
                    3, 'psa-icon_3',
                    4, 'psa-icon_4',
                    5, 'psa-icon_5',
                    'psa-icon_99'
                ],
                allowOverlap: true,
                size: minShapeSize
            }
        });

        map.layers.add([layer], 'labels');
        instance.store.layersAddedToMap.push(id);

        const markerClicked = async event => {
            instance.store.psaPopupOpened = true;
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
            

            try {
                const { data } = await instance.getData(
                    `${instance.store.config.baseUrl}/psa/${properties.id}`,               
                );
                const popUpData = data[0];
                popUpData.dataType = 'psa';
                instance.popup.setOptions({
                    closeButton: true,
                    content: `<div class="ui compact message">
                    ${instance.store.config.map.popupHtml(popUpData)}
                  </div>`
                });
            } catch (err) {
                console.error(err);
            }
        };

        map.events.add('click', layer, async function (e) {
            markerClicked(e);
        });

    });


};
export default psaLayer;
