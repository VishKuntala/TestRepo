import * as R from "ramda";
import { multiLineString } from "@turf/helpers";
import bbox from "@turf/bbox";
import salesMarketLayer from "./layers/salesMarketLayer.js";
//import cmaLayer from "./layers/cmaLayer.js";
import dmaLayer from "./layers/dmaLayer.js";
import countyLayer from "./layers/countyLayer.js";
import zipLayer from "./layers/zipLayer.js";
import censusBlockLayer from "./layers/censusBlockLayer.js";
import attrPointLayer from "./layers/attrPointLayer.js";
import arPointLayer from "./layers/arPointLayer.js";
import futurePSAPointLayer from "./layers/futurePSAPointLayer.js";
import top25PSAPointLayer from "./layers/top25PSAPointLayer.js";
import top25MDUPointLayer from "./layers/top25MDUPointLayer.js";
import pointLayer from "./layers/pointLayer.js";
import fibCustAddressLayer from "./layers/fibCustAddressLayer.js";
import fibProsAddressLayer from "./layers/fibProsAddressLayer.js";
import fibUpgradeAddressLayer from "./layers/fibUpgradeAddressLayer.js";
import mduAllATTFiberCustomerLayer from "./layers/mduAllATTFiberCustomerLayer.js";
import mduWithATTFiberProspectLayer from "./layers/mduWithATTFiberProspectLayer.js";
import salesMarketBoundaryLayer from "./layers/salesMarketBoundaryLayer.js";
import zipBoundaryLayer from "./layers/zipBoundaryLayer.js";
import satelliteLayer from "./layers/satelliteLayer.js";
import clusterLayer from "./layers/clusterLayer.js";
import nsbBoundaryLayer from "./layers/nsbBoundaryLayer.js";

import { config } from "./config/config.js";
import { updateShapeSize, getPaintFill } from "./utils/utils.js";
import { heatmapConfig } from "./config/heatmapConfig.js";
import { buildPayloadFromStore } from "../../../../helpers/remoteData.js";




const mainMap = ({ instance }) => {

    const lonLatToWorldPixelCoords = ([lon, lat], worldSize) => {
        const mercatorX = worldSize * (lon / 360 + 0.5);
        const mercatorY =
          (worldSize *
            (1 - Math.log(Math.tan(Math.PI * (0.25 + lat / 360))) / Math.PI)) /
          2;
      
        return [Math.round(mercatorX), Math.round(mercatorY)];
      };
    

    const getPixelCoords = () => {
        const pixelCoords = [];
        const zoom = instance.map.getZoom();
        const mapBounds = instance.map.getBounds();
        const ne = mapBounds.getNorthEast();
        const sw = mapBounds.getSouthWest();
        const tileSize = 256;
        const tilesAcross = Math.pow(2, zoom);
        const worldSize = tileSize * tilesAcross;
        const swWorldPixelCoords = lonLatToWorldPixelCoords([sw.lng, sw.lat], worldSize);
        const neWorldPixelCoords = lonLatToWorldPixelCoords([ne.lng, ne.lat], worldSize);
        for (let i = Math.min(Math.floor(swWorldPixelCoords[0]/tileSize), Math.floor(neWorldPixelCoords[0]/tileSize)); i <= Math.max(Math.floor(swWorldPixelCoords[0]/tileSize), Math.floor(neWorldPixelCoords[0]/tileSize)); i += 1) {
            for (let j = Math.min(Math.floor(swWorldPixelCoords[1]/tileSize), Math.floor(neWorldPixelCoords[1]/tileSize)); j <= Math.max(Math.floor(swWorldPixelCoords[1]/tileSize), Math.floor(neWorldPixelCoords[1]/tileSize)); j += 1) {
                pixelCoords.push(`${zoom},${i},${j}`);
            }
        }
        return pixelCoords;
    }


    const getLayerProps = () => {
        const { map } = instance;
        let beforeLayerId = 1;
        const layers = map.getStyle().layers;
        const symbolLayer = layers.find(l => l.type === "symbol");
        if (symbolLayer) {
            beforeLayerId = symbolLayer.id;
        }
        return { instance, beforeLayerId };
    };

    const loadClusterLayer = $("#hdnClusterLayer").val() === "on";

    const updatePointLayer = map => {

        // clear the tiles for the Points layer
        if (map.getSource(config.pointsLayers.WS_POINTS.source)) {
            map.style.sourceCaches[config.pointsLayers.WS_POINTS.source].clearTiles();
        }
        const { color, attribute } = config.pointColorConfig[instance.store.locationAttribute];
        let postData = buildPayloadFromStore(instance);
        postData = Object.assign(postData, {
            attribute,
            randomize: Date.now().toString()
        });
        const queryStringParams = new URLSearchParams(postData).toString();
        const vectorTileSource = map.getSource(config.pointsLayers.WS_POINTS.source);

        if (vectorTileSource) {
            vectorTileSource.tiles = [
                `${instance.store.baseApiUrl}/${instance.store.config.tool}/tiles/${instance.store.heatmap}/locations/{z}/{x}/{y}.mvt?${queryStringParams}`,
            ];

            // Reload the new tiles for the current viewport (map.transform ==> viewport)
            map.style.sourceCaches[config.pointsLayers.WS_POINTS.source].update(map.transform);

            map.setPaintProperty(config.pointsLayers.WS_POINTS.id, 'icon-color', [
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
                99,
                color.COLOR_99
            ]);

            // Force a repaint, so that the map will be repainted without you having to touch the map
            map.triggerRepaint();
        }

        

    }

    const updateClusterLayer = geoEntity => {
        const map = instance.map;
        if (instance.store.clearClusterLayer) {
            instance.store.clearClusterLayer = false;
            map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "none");
            map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "none");
            return;
        } else {
            instance.map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "visible");
            instance.map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "visible");
        }

        if (!instance.store.isChannelActive) {
            instance.map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "visible");
            instance.map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "visible");
        }

        // clear the tiles for the Points layer
        if (map.getSource(config.pointsLayers.CLUSTER_POINTS.source)) {
            map.style.sourceCaches[config.pointsLayers.CLUSTER_POINTS.source].clearTiles();

            const { attribute } = config.pointColorConfig[instance.store.locationAttribute];
            let postData = buildPayloadFromStore(instance);
            postData = Object.assign(postData, {
                attribute,
                randomize: Date.now().toString()
            });
            const queryStringParams = new URLSearchParams(postData).toString();
            const vectorTileSource = map.getSource(config.pointsLayers.CLUSTER_POINTS.source);
            if (vectorTileSource) {
                vectorTileSource.tiles = [
                    `${instance.store.baseApiUrl}/clusters/${instance.store.config.tool}/location/${geoEntity || instance.store.geoEntity}/{z}/{x}/{y}.mvt?${queryStringParams}`
                ];

                // Reload the new tiles for the current viewport (map.transform ==> viewport)
                map.style.sourceCaches[config.pointsLayers.CLUSTER_POINTS.source].update(map.transform);

                // Force a repaint, so that the map will be repainted without you having to touch the map
                map.triggerRepaint();
            }
        } else {
            if (!instance.store.clearClusterLayer) {
                instance.store.clearClusterLayer = false;
                map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "visible");
                map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "visible");

                /* console.log(config.pointsLayers.WS_POINTS.id);
                if (map.getLayer(config.pointsLayers.WS_POINTS.id)) map.removeLayer(config.pointsLayers.WS_POINTS.id);
                if (map.getSource(config.pointsLayers.WS_POINTS.source)) map.removeSource(config.pointsLayers.WS_POINTS.source);
                if (map.hasImage('psa-icon')) map.removeImage('psa-icon');
                pointLayer(getLayerProps());
                if (loadClusterLayer) {
                    clusterLayer(getLayerProps());
                } */

                // clusterLayer({ beforeLayerId: config.pointsLayers.WS_POINTS.id, instance});
            }
            instance.store.clearClusterLayer = false;
        }

    }

    const updateVectorTileSource = ({ source, vectorTileUrl, map }) => {
        const { baseApiUrl, heatmap } = instance.store;
        const vectorTileSource = map.getSource(source);
        const { attribute } = config.pointColorConfig[instance.store.locationAttribute];
        let postData = buildPayloadFromStore(instance);
        postData = Object.assign(postData, {
            attribute,
            randomize: Date.now().toString()
        });
        const queryStringParams = new URLSearchParams(postData).toString();

        vectorTileSource.tiles = [
            `${baseApiUrl}/${instance.store.config.tool}/tiles/${heatmap}/${vectorTileUrl}/{z}/{x}/{y}.mvt?${queryStringParams}`,
        ];

        // Clear the tiles for a particular source
        map.style.sourceCaches[source].clearTiles();

        // Reload the new tiles for the current viewport (map.transform ==> viewport)
        map.style.sourceCaches[source].update(map.transform);

        // Force a repaint, so that the map will be repainted without you having to touch the map
        map.triggerRepaint();
    };

    const updateAddressVectorTileSource = ({ source, map, customerCategoryId, psa }) => {
        const { baseApiUrl, heatmap } = instance.store;
        const vectorTileSource = map.getSource(source);

        //set tiles
        const tileURL = psa ? `${baseApiUrl}/tiles/${heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=${customerCategoryId}&psa=${psa}` : `${baseApiUrl}/tiles/${heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=${customerCategoryId}`
        vectorTileSource.tiles = [tileURL];

        // Clear the tiles for a particular source
        map.style.sourceCaches[source].clearTiles();

        // Reload the new tiles for the current viewport (map.transform ==> viewport)
        map.style.sourceCaches[source].update(map.transform);

        // Force a repaint, so that the map will be repainted without you having to touch the map
        map.triggerRepaint();
    };

    const unlockBoundary = async map => {
        instance.store.inSearchMode = false;
        instance.store.searchMode = null;
        instance.store.searchedZip = null;

        // clear search
        instance.store.clearSearch = `${Date.now().toString()}`;
        // hide the clear Zip Boundary button
        $('#btnClearZipBoundary').addClass('ponderHidden');

        // clear the zip boundary
        const { source, id } = config.boundaryLayers.ZIP_BOUNDARY;
        if (map.getLayer(id)) map.removeLayer(id);
        if (map.getSource(source)) map.removeSource(source);


    }

    const unlockBusinessSearch = async map => {
        instance.store.inSearchMode = false;
        instance.store.searchMode = null;
        instance.store.searchedBusiness = null;

        // clear search
        instance.store.clearSearch = `${Date.now().toString()}`;
        // hide the clear Business Search button
        $('#btnClearBusinessSearch').addClass('ponderHidden');
        await updateLayers(map);
        if (loadClusterLayer) {
            await updateClusterLayer(map);
        }
        //clusterLayer(getLayerProps());
        await updatePointLayer(map);
        // update Main table
        instance.store.updateTable = `${Date.now().toString()}`;
        instance.store.currentZoom = map.getZoom();
    }

    const lockBoundary = async map => {
        // show the clear Zip Boundary button
        $('#btnClearZipBoundary').removeClass('ponderHidden');
        //switch off all layers above zip 
        config.heatmapLayers.ZIP.parentLayerIds.forEach(layerId => map.setLayoutProperty(layerId, "visibility", "none"));
        // clear the tiles for the PSA layer
        if (map.getSource(config.pointsLayers.PSA_POINTS.source)) {
            map.style.sourceCaches[config.pointsLayers.PSA_POINTS.source].clearTiles();
        }
        // update Main table
        instance.store.updateMainTable = `${Date.now().toString()}`;
        // update PSA table
        instance.store.updatePSATable = `${Date.now().toString()}`;
        // reload geojson layers
        map.getSource(config.pointsLayers.AR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=AR&randomize=${Date.now().toString()}`);
        map.getSource(config.pointsLayers.ATTR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=ATTR&randomize=${Date.now().toString()}`);
        map.getSource(config.pointsLayers.FUTURE_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/futurepsas?randomize=${Date.now().toString()}`);
        map.getSource(config.pointsLayers.TOP_25_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/top25psas?randomize=${Date.now().toString()}`);
    }

    const updateLayers = async map => {
        const { baseApiUrl, heatmap } = instance.store;
            for (let layer in config.heatmapLayers) {
                const {
                    id,
                    minZoom,
                    maxZoom,
                    source,
                    vectorTileUrl,
                } = config.heatmapLayers[layer];
                updateVectorTileSource({ source, vectorTileUrl, map });
                //reset layers visibility and zoom levels
                map.setLayoutProperty(id, "visibility", "visible");
                map.setLayerZoomRange(id, minZoom, maxZoom);
            }

        updatePointLayer(map);
        if (instance.store.clearClusterLayer) {
            map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "none");
            map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "none");
        }


    };

    const initSubscriptions = async () => {
        instance.stateManager.subscribe(
            "currentHeatmapFilter",
            async currentFilter => {
                const { map } = instance;
                if (map) {
                    // update visible layer's paint properties based on heatmap filter
                    for (let layer in config.heatmapLayers) {
                        map.setPaintProperty(
                            config.heatmapLayers[layer].id,
                            "fill-color",
                            heatmapConfig[currentFilter].fillColorExpression
                        );
                    }
                }
            }
        );

        instance.stateManager.subscribe(
            "currentHeatmapFilterIndex",
            async filterIndex => {
                const { map, store } = instance;
                if (map) {
                    const fillCollor = getPaintFill(
                        filterIndex,
                        store.currentHeatmapFilter
                    );

                    // loops over the layers and updates the colors based on the selected filter
                    for (let layer in config.heatmapLayers) {
                        map.setPaintProperty(
                            config.heatmapLayers[layer].id,
                            "fill-color",
                            fillCollor
                        );
                    }
                }
            }
        );

        instance.stateManager.subscribe("storeLayerVisibilityChange", async d => {
            const { map } = instance;
            if (map) {
                const { layerId, layerVisibilityStatus } = d;
                if (map.getLayer(layerId)) {
                    if (layerVisibilityStatus) {
                        map.setLayoutProperty(layerId, "visibility", "visible");
                    } else {
                        map.setLayoutProperty(layerId, "visibility", "none");
                       
                    }
                }
            }
        });

        instance.stateManager.subscribe("layerVisibilityChange", async d => {
            const { map } = instance;
            if (map) {
                
                //show or hide specific layer on the map
                const { layerId, layerVisibilityStatus } = d;
                const visibility = map.getLayoutProperty(layerId, "visibility");
                if (map.getLayer(layerId)) {
                    if (visibility === "visible" || !layerVisibilityStatus) {
                        map.setLayoutProperty(layerId, "visibility", "none");
                    } else {
                        map.setLayoutProperty(layerId, "visibility", "visible");
                        if (layerId !== 'satellite') {
                            map.moveLayer("satellite", layerId);
                        }
                    }
                }
            }
        });

        instance.stateManager.subscribe("shapeSizes", async shapeSizes => {
            const { map } = instance;

            if (map) {
                for (const key in config.pointsLayers) {
                    const layerId = config.pointsLayers[key].id;
                    const shapeSizeValue = shapeSizes.find(
                        shapeSize => shapeSize.layerId == layerId
                    )?.shapeSize;
                    if (shapeSizeValue) {
                        if (map.getLayer(layerId)) {
                            map.setLayoutProperty(
                                layerId,
                                "icon-size",
                                shapeSizeValue
                            );
                        }
                    }
                }
            }
        });

        instance.stateManager.subscribe("updateMainMap", async d => {
            const { map } = instance;
            if (map) {
                await updateLayers(map);
            }
        });

        /* instance.stateManager.subscribe("resetMapToInitialView", async d => {
            const { map } = instance;
            if (map && !R.is(Array, d)) {
                map.jumpTo({ zoom: instance.store.zoom, center: instance.store.mapCoordinates });
            }
        }); */

        

        instance.stateManager.subscribe("createMapLayers",
            async d => {
                if (!R.is(Array, d)) {
                    const { map } = instance;
                    if (instance.appState.userGroups.length && map) {
                        createMapLayers();
                        map.setZoom(instance.store.zoom);


                    }
                }
            });

        instance.stateManager.subscribe("updateLayers",
            async d => {
                if (!R.is(Array, d)) {
                    const { map } = instance;
                    if (instance.appState.userGroups.length && map) {
                        if (instance.store.config.loadDataOnChannelInit || instance.store.mapLayersReady) {
                            updateLayers(map);
                        }
                        
                    }
                }
            });

        instance.stateManager.subscribe("updateClusterLayer",
            async d => {
                if (!R.is(Array, d)) {
                    const { map } = instance;
                    if (instance.appState.userGroups.length && map) {
                        if (loadClusterLayer) {
                            updateClusterLayer();
                        }

                    }
                }
            });

        instance.stateManager.subscribe("updateClusterLayerForBusinessSearch",
            async d => {
                if (!R.is(Array, d)) {
                    const { map } = instance;
                    const currentZoom = map.getZoom();
                    instance.store.currentZoom = currentZoom;
                    if (instance.appState.userGroups.length && map &&
                        currentZoom <= config.heatmapLayers.CENSUS_BLOCK.minZoom) {
                        //clusterLayer(getLayerProps());

                    }
                }
            });

        instance.stateManager.subscribe("updatePointLayer", async d => {
            const { map } = instance;
            if (map) {
                
                updatePointLayer(map);
            }

        });

        instance.stateManager.subscribe("locationAttribute", async d => {
            const { map } = instance;
            if (map) {

                updatePointLayer(map);
            }

        });

        

        instance.stateManager.subscribe("salesMarketBoundary", async d => {
            const { map } = instance;
            if (map && d) {
                const featureCollection = d;
                salesMarketBoundaryLayer(getLayerProps(), featureCollection);
                const coordinates =
                    featureCollection.features[0].geometry.coordinates;
                const smBoundary = multiLineString(coordinates);
                const smBBox = bbox(smBoundary);
                map.fitBounds(smBBox, {
                    padding: { top: 10, bottom: 25, left: 15, right: 5 },
                });
            }
        });

        instance.stateManager.subscribe("zoomToArea", async d => {
            const { map } = instance;
            if (map && d) {
                const featureCollection = d;
                const coordinates =
                    featureCollection.features[0].geometry.coordinates;
                const areaBoundary = multiLineString(coordinates);
                const areaBBox = bbox(areaBoundary);
                map.fitBounds(areaBBox, {
                    padding: { top: 10, bottom: 25, left: 15, right: 5 },
                });
                if (instance.store.zipcode) {
                    await updateClusterLayer(config.heatmapLayers.ZIP.vectorTileUrl);
                } else if (instance.store.dmaName || instance.store.statecode) {
                    await updateClusterLayer(config.heatmapLayers.DMA.vectorTileUrl);
                } else {
                    await updateClusterLayer(config.heatmapLayers.SALES_MARKET.vectorTileUrl);
                }
            }
        });

        instance.stateManager.subscribe("movePointLayers", async d => {
            const { map } = instance;
            if (map && d && !R.is(Array, d)) {
                if (map.getLayer(config.pointsLayers.WS_POINTS.id)) {
                    map.moveLayer(config.pointsLayers.WS_POINTS.id);
                }
                if (map.getLayer(config.pointsLayers.AR_POINTS.id)) {
                    map.moveLayer(config.pointsLayers.AR_POINTS.id);
                }
                if (map.getLayer(config.pointsLayers.ATTR_POINTS.id)) {
                    map.moveLayer(config.pointsLayers.ATTR_POINTS.id);
                }
            }
        });

        
        instance.stateManager.subscribe("clearNsbBoundary", async d => {
            const { map } = instance;
            if (map && d) {
                $('#btnClearNsbBoundary').addClass('ponderHidden');
                instance.store.nsbId = null;
                $(`.ui.btnSubmit`).click();
                const pointLayer = instance.map.getLayer(config.pointsLayers.WS_POINTS.id);
                if (pointLayer && instance.store.currentZoom >= pointLayer.minzoom && instance.store.currentZoom <= pointLayer.maxzoom) {
                    instance.store.pointLayerVisible = true;
                } else {
                    instance.store.pointLayerVisible = false;
                }    
    
                if (instance.store.pointLayerVisible) {
                    $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants <div class="ui active inline slow primary tiny loader"></div>`);
                    instance.store.updateTenantTableData = getPixelCoords().join('^');
                }
    
            }
        });

        instance.stateManager.subscribe("zipBoundary", async d => {
            const { map } = instance;
            if (map && d) {
                const featureCollection = d;
                zipBoundaryLayer(getLayerProps(), featureCollection);
                const coordinates =
                    featureCollection.features[0].geometry.coordinates;
                const zipBoundary = multiLineString(coordinates);
                const zipBBox = bbox(zipBoundary);
                if (instance.store.inSearchMode) {
                    // await lockBoundary(map);
                }
                if (instance.store.tableRowClicked) {
                    instance.store.fitBoundsForTableRowClick = true;
                }
                map.fitBounds(zipBBox, {
                    padding: { top: 10, bottom: 25, left: 15, right: 5 },
                });
                instance.store.tableRowClicked = false;
            }
        });

        instance.stateManager.subscribe("clearBusinessSearch", async d => {
            const { map } = instance;
            if (map && d) {
                await unlockBusinessSearch(map);
            }
        });

        instance.stateManager.subscribe("resetMapToInitialView", async d => {
            $('#pointLegend').hide();
            const { map } = instance;
            if (map) {
                map.remove();
                instance.map = null;
                instance.renderMap();
                instance.store.mapLayersReady = false;
            }
           /* const { map } = instance;
            if (map && d && !R.is(Array, d)) {
                map.setZoom(2.9);
                map.setCenter(instance.store.mapCoordinates);
                $('.mapboxgl-popup').remove();
            } */
        });

        // triggered by hyperlinks in PSA or Address Layer popups 
        instance.stateManager.subscribe("addPSAFilter", async d => {
            const { map } = instance;
            if (map && d) {
                const { psa, latitude, longitude } = d;
                // show the clear PSA Filter button
                $('#btnClearPSAFilter').removeClass('ponderHidden');
                // update addresLayers tiles, add psa filter
                const addressLayers = Object.values(config.pointsLayers).filter(pointLayer => pointLayer.isAddressLayer == true);
                for (let layer in addressLayers) {
                    const { source, customerCategoryId } = addressLayers[layer];
                    updateAddressVectorTileSource({ source, map, customerCategoryId, psa });
                }
                // remove any open popups
                $('.mapboxgl-popup').remove();
                // zoom to addressLayers                
                instance.store.zoomToPoint = {
                    lat: latitude,
                    lng: longitude,
                    zoom: config.pointsLayers.ATT_FIBER_CUSTOMERS.minZoom,
                    addMarker: false,
                };
                //setActiveTab
                //instance.store.setActiveTab = `${Date.now().toString()}`;
            }
        });

        instance.stateManager.subscribe("clearZipBoundary", async d => {
            const { map } = instance;
            if (map && d) {
                await unlockBoundary(map);
            }
        });

        // triggered by btnClearPSAFilter button in OverlayMenu.js
        instance.stateManager.subscribe("clearPSAFilter", async d => {
            const { map } = instance;
            if (map && d) {
                instance.store.psaFilter = undefined;
                // hide the clear PSA Filter button
                $('#btnClearPSAFilter').addClass('ponderHidden');
                // update addresLayers tiles, remove psa filter
                const addressLayers = Object.values(config.pointsLayers).filter(pointLayer => pointLayer.isAddressLayer == true);
                for (let layer in addressLayers) {
                    const { source, customerCategoryId } = addressLayers[layer];
                    updateAddressVectorTileSource({ source, map, customerCategoryId, psa: instance.store.psaFilter });
                }
            }
        });
    };

    const mapOptions = {
        center: instance.store.mapCoordinates,
        zoom: instance.store.zoom,
        style: `${config.mapboxLightStyle}${$("#hdnMapTilerKey").val()}`,
        attributionControl: false,
        maxZoom: 19,
    };
    const firstUpdated = async () => {
        // await instance.renderMap();
    };

    const createMapLayers = async () => {
        const layerProps = getLayerProps();

        // Map layers
        satelliteLayer(layerProps);
        if (instance.store.config.showNsbLayer) {
            nsbBoundaryLayer(layerProps);
        }
        attrPointLayer(layerProps);
        arPointLayer(layerProps);
        pointLayer(layerProps);
        salesMarketBoundaryLayer(layerProps);
       
        salesMarketLayer(layerProps);
        dmaLayer(layerProps);
        countyLayer(layerProps);
        zipLayer(layerProps);
        censusBlockLayer(layerProps);
        if (loadClusterLayer) {
            clusterLayer(layerProps);
        }
        
        /* futurePSAPointLayer(layerProps);
        top25PSAPointLayer(layerProps);
        top25MDUPointLayer(layerProps);
        fibCustAddressLayer(layerProps);
        fibProsAddressLayer(layerProps);
        fibUpgradeAddressLayer(layerProps);
        mduAllATTFiberCustomerLayer(layerProps);
        mduWithATTFiberProspectLayer(layerProps); */
        instance.store.mapLayersReady = true;
        
        
    };

    const updateMapLayer = ({ name, source, header }) => {
        // short circuit: don't update anything if the layer hasn't changed
        if (instance.store.currentLayerName === name) return;

        // otherwise update the store
        instance.store.currentLayerSource = source;
        instance.store.currentLayerName = name;
        instance.store.mapCardAreaHeader = header;
        instance.store.mapCardAreaInfo = undefined;
    };

    const eventHandlers = {
        popupopen: e => {
            $(".maplibregl-popup-content").off().on("click", async event => {
                if ($(".tenantExportLink").length) {
                    instance.store.exportTenantTableForBuilding = { id: $(".tenantExportLink").attr('id'), censusBlockId: $(".tenantExportLink").attr('censusBlockId') };
                }
                if ($(".censusTenantsExportLink").length) {
                    instance.store.exportTenantTableForBuilding = { id: $(".censusTenantsExportLink").attr('id'), censusBlockId: $(".censusTenantsExportLink").attr('censusBlockId') };
                }
                if ($(".nsbTenantExportLink").length) {
                    $('#btnClearNsbBoundary').removeClass('ponderHidden');
                    instance.store.nsbId = $(".nsbTenantExportLink").attr('id');
                    $(`.ui.btnSubmit`).click();
                    const pointLayer = instance.map.getLayer(config.pointsLayers.WS_POINTS.id);
                    if (pointLayer && instance.store.currentZoom >= pointLayer.minzoom && instance.store.currentZoom <= pointLayer.maxzoom) {
                        instance.store.pointLayerVisible = true;
                    } else {
                        instance.store.pointLayerVisible = false;
                    }    
                    if (instance.store.pointLayerVisible) {
                        $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants <div class="ui active inline slow primary tiny loader"></div>`);
                        instance.store.updateTenantTableData = getPixelCoords().join('^');
                    }    
                }
            });
        },

        error: e => {
            instance.store.isMapLoading = false;
        },
        click: e => {
            setTimeout( () => {
                if ( !instance.store.ignoreNsbBoundaryClick && instance.store.nsbLayerClickInfo) {
                    instance.popup.setLngLat(instance.store.nsbLayerClickInfo.lngLat)
                        .setHTML(
                            instance.store.nsbLayerClickInfo.popupHtml
                        )
                        .addTo(instance.map);
                        instance.store.nsbLayerClickInfo = null;
                        instance.store.ignoreNsbBoundaryClick = false;
                        instance.store.mapClickHandled = false;
                }
            }, 1000);
        },
        moveend: e => {
            // maplibre triggers moveend event for zoomend. Prevent calling moveend 
            // for a zoomend event
            if (instance.store.zoomend) {
                instance.store.zoomend = false;
                return;
            }
            const pointLayer = instance.map.getLayer(config.pointsLayers.WS_POINTS.id);
            if (pointLayer && instance.store.currentZoom >= pointLayer.minzoom && instance.store.currentZoom <= pointLayer.maxzoom) {
                instance.store.pointLayerVisible = true;
            } else {
                instance.store.pointLayerVisible = false;
            }    

            if (instance.store.pointLayerVisible) {
                $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants <div class="ui active inline slow primary tiny loader"></div>`);
                instance.store.updateTenantTableData = getPixelCoords().join('^');
            }
        },
        sourcedataloading: e => {
            instance.store.isMapLoading = true;
        },
        sourcedata: e => {
            const pointLayer = instance.map.getLayer(config.pointsLayers.WS_POINTS.id);
            if (pointLayer && instance.map.getZoom() >= pointLayer.minzoom && instance.map.getZoom() <= pointLayer.maxzoom) {
                instance.store.pointLayerVisible = true;
            } else {
                instance.store.pointLayerVisible = false;
            }    
            if (e.sourceDataType === "visibility" && e.sourceId === "ws-point-source") {
                if (instance.store.pointLayerVisible) {
                    if (loadClusterLayer) {
                        instance.map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "none");
                        instance.map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "none");
                    }
                } else {
                    if (loadClusterLayer) {
                        if (instance.store.clearClusterLayer) {
                            instance.store.clearClusterLayer = false;
                            instance.map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "none");
                            instance.map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "none");
                        } else {
                            instance.map.setLayoutProperty(config.pointsLayers.CLUSTER_POINTS.id, "visibility", "visible");
                            instance.map.setLayoutProperty(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`, "visibility", "visible");
                        }
                    }
                }
            }
            const isSourceVisible =
                e.dataType === "source" &&
                e.isSourceLoaded &&
                e.sourceDataType !== "visibility";

            if (isSourceVisible) {
                instance.store.isMapLoading = false;
            }
            /* if (isSourceVisible) {
                //tenants table
                if (
                    instance.map.getLayer(config.pointsLayers.WS_POINTS.id)  
                    // && e.sourceId === config.pointsLayers.WS_POINTS.source
                ) {
                    if (instance.store.pointLayerVisible) {
                        $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants <div class="ui active inline slow primary tiny loader"></div>`);
                        setTimeout(() => {
                            const buildingFeatures = instance.map.queryRenderedFeatures({
                                layers: [
                                    config.pointsLayers.WS_POINTS.id,
                                ],
                            });
                            const layerProps = R.pluck(
                                "properties",
                                buildingFeatures
                            );
                            const mikeys = R.pluck("id", layerProps);
                            if (!mikeys.length && instance.store.pointLayerVisible) {
                                // updatePointLayer(instance.map);
                                $(".filter-table-panel-menu.menu .item").tab('change tab', 'mainTable');
                                $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants`);
                                $("#tenantTableTab").css('pointer-events','none');
                                return;
                            }
                            if (!instance.store.fetchingTenantData && instance.store.geoEntity === "censusBlocks") {
                                instance.store.fetchingTenantData = true;
                                instance.store.updateTenantTableData = mikeys.join(',');
                                $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants (${new Intl.NumberFormat().format(mikeys.length)})`);
                                $("#tenantTableTab").css('pointer-events','auto');
                            }
                        }, 2000);
                    }
                }
            } */

           /* if (isSourceVisible) {
                //zip layer features
                if (
                    instance.map.getLayer(config.heatmapLayers.ZIP.id)
                ) {
                    const zipFeatures = instance.map.queryRenderedFeatures({
                        layers: [
                            config.heatmapLayers.ZIP.id,
                        ],
                    });
                    const zipData = R.pluck(
                        "properties",
                        zipFeatures
                    );
                    const zips = R.pluck("zip", zipData);
                    instance.store.visibleZips = zips;
                    if (instance.store.visibleZips.length) {
                        updateClusterLayer();
                    }
                }
            } */
        },
        zoomend: e => {
            // maplibre calls moveend as well for a zoomend event. Set the below flag to prevent code in moveend event being triggered
            instance.store.zoomend = true;
            const zoom = instance.map.getZoom();
            instance.store.currentZoom = zoom;

            const pointLayer = instance.map.getLayer(config.pointsLayers.WS_POINTS.id);
            if (pointLayer && zoom >= pointLayer.minzoom && zoom <= pointLayer.maxzoom) {
                instance.store.pointLayerVisible = true;
            } else {
                instance.store.pointLayerVisible = false;
            }    

            if (instance.store.pointLayerVisible) {
                $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants <div class="ui active inline slow primary tiny loader"></div>`);
                instance.store.updateTenantTableData = getPixelCoords().join('^');
            }

            $('.map-section').dimmer({
                on: false
            });

            updateShapeSize(zoom, instance.store);

            const currentGeoEntity = instance.store.geoEntity;


            for (let layer in config.heatmapLayers) {
                const currentLayer = config.heatmapLayers[layer];
                const { minZoom, maxZoom, vectorTileUrl } = currentLayer;


                if (zoom >= minZoom && zoom < maxZoom) {
                    instance.store.geoEntity = vectorTileUrl;
                    /* if (currentGeoEntity !== instance.store.geoEntity && vectorTileUrl !== "censusBlocks") {
                        return updateClusterLayer();
                    } */
                }
            }
            if (zoom < config.pointsLayers.WS_POINTS.minZoom) {
                $(".filter-table-panel-menu.menu .item").tab('change tab', 'mainTable');
                $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants`);
                $("#tenantTableTab").css('pointer-events','none');
            }
            
            if (Math.round(zoom) <= config.heatmapLayers.CENSUS_BLOCK.minZoom) {

                if (loadClusterLayer) {
                    if (instance.store.channelChanged) {
                        clusterLayer(getLayerProps());
                        return;
                    }
                    return updateClusterLayer();
                } 
            } else {

                /* if (instance.map.getLayer(config.pointsLayers.CLUSTER_POINTS.id)) instance.map.removeLayer(config.pointsLayers.CLUSTER_POINTS.id);
                if (instance.map.getLayer(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`)) instance.map.removeLayer(`${config.pointsLayers.CLUSTER_POINTS.id}-labels`);
                if (instance.map.getSource(config.pointsLayers.CLUSTER_POINTS.source)) instance.map.removeSource(config.pointsLayers.CLUSTER_POINTS.source);
                if (instance.map.hasImage('psa-icon')) instance.map.removeImage('psa-icon'); */
                
            }

        },
    };

    return {
        eventHandlers,
        createMapLayers,
        mapOptions,
        firstUpdated,
        initSubscriptions,
    };
};

export default mainMap;
