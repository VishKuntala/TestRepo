import * as R from "ramda";
import * as atlas from 'azure-maps-control';
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
import psaPointLayer from "./layers/psaPointLayer.js";
import fiberCustomerandWirelessCustomerLayer from "./layers/fiberCustomerandWirelessCustomerLayer.js";
import fiberCustomerandWirelessCrossSellOpportunityLayer from "./layers/fiberCustomerandWirelessCrossSellOpportunityLayer.js";
import copperUpgradeandWirelessCustomerLayer from "./layers/copperUpgradeandWirelessCustomerLayer.js";
import copperUpgradeandWirelessCrossSellOpportunityLayer from "./layers/copperUpgradeandWirelessCrossSellOpportunityLayer.js";
import wirelessCustomerandFiberCrossSellOpportunityLayer from "./layers/wirelessCustomerandFiberCrossSellOpportunityLayer.js";
import opportunityforFiberandWirelessLayer from "./layers/opportunityforFiberandWirelessLayer.js";
import mduAllATTFiberCustomerLayer from "./layers/mduAllATTFiberCustomerLayer.js";
import mduWithATTFiberProspectLayer from "./layers/mduWithATTFiberProspectLayer.js";
import accPointLayer from "./layers/accPointLayer";
import salesMarketBoundaryLayer from "./layers/salesMarketBoundaryLayer.js";
import boundaryLayer from "./layers/boundaryLayer.js";
import satelliteLayer from "./layers/satelliteLayer.js";
import { config } from "./config/config.js";
import { config as tableConfig } from "../../../tabulatr/derivations/opportunity/config/config.js";
import { updateShapeSize, getPaintFill } from "./utils/utils.js";
import centroid from "@turf/centroid";
import maplibregl from "maplibre-gl";


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
        const zoom = instance.map.getCamera().zoom;
        const mapBounds = instance.map.getCamera().bounds;
        const ne = atlas.data.BoundingBox.getNorthEast(mapBounds);
        const sw = atlas.data.BoundingBox.getSouthWest(mapBounds);
        const tileSize = 256;
        const tilesAcross = Math.pow(2, zoom);
        const worldSize = tileSize * tilesAcross;
        const swWorldPixelCoords = lonLatToWorldPixelCoords([sw[0], sw[1]], worldSize);
        const neWorldPixelCoords = lonLatToWorldPixelCoords([ne[0], ne[1]], worldSize);
        for (let i = Math.min(Math.floor(swWorldPixelCoords[0] / tileSize), Math.floor(neWorldPixelCoords[0] / tileSize)); i <= Math.max(Math.floor(swWorldPixelCoords[0] / tileSize), Math.floor(neWorldPixelCoords[0] / tileSize)); i += 1) {
            for (let j = Math.min(Math.floor(swWorldPixelCoords[1] / tileSize), Math.floor(neWorldPixelCoords[1] / tileSize)); j <= Math.max(Math.floor(swWorldPixelCoords[1] / tileSize), Math.floor(neWorldPixelCoords[1] / tileSize)); j += 1) {
                pixelCoords.push(`${zoom},${i},${j}`);
            }
        }
        return pixelCoords;
    }

    const getLayerProps = () => {
        const { map } = instance;
        let beforeLayerId = 1;
        const layers = map.getStyle().layers;
        return {
            instance, beforeLayerId,
            //pointMinShapeSize: instance.store.config.map.pointMinShapeSize
        };
    };

    //const updateVectorTileSource = ({ source, vectorTileUrl, map }) => {
    //    const { baseApiUrl, heatmap, marketType, market } = instance.store;
    //    //const vectorTileSource = map.getSource(source);
    //    const vectorTileSource = map.sources.getById(source);

    //    vectorTileSource.tiles = [
    //        `${baseApiUrl}/tiles/${heatmap}/${vectorTileUrl}/{z}/{x}/{y}.mvt?marketType=${marketType}&market=${market}`,
    //    ];

    //    // Clear the tiles for a particular source
    //    map.style.sourceCaches[source].clearTiles();        

    //    // Reload the new tiles for the current viewport (map.transform ==> viewport)
    //    map.style.sourceCaches[source].update(map.transform);

    //    // Force a repaint, so that the map will be repainted without you having to touch the map
    //    map.triggerRepaint();
    //};

    //const updateAddressVectorTileSource = ({ source, map, customerCategoryId, psa }) => {
    //    const { baseApiUrl, heatmap } = instance.store;
    //    /*const vectorTileSource = map.getSource(source);*/
    //    const vectorTileSource = map.sources.getById(source);

    //    //set tiles
    //    const tileURL = psa ? `${baseApiUrl}/tiles/${heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=${customerCategoryId}&psa=${psa}` : `${baseApiUrl}/tiles/${heatmap}/addresses/{z}/{x}/{y}.mvt?customerCategoryId=${customerCategoryId}`
    //    vectorTileSource.tiles = [tileURL];

    //    // Clear the tiles for a particular source
    //    map.style.sourceCaches[source].clearTiles();

    //    // Reload the new tiles for the current viewport (map.transform ==> viewport)
    //    map.style.sourceCaches[source].update(map.transform);

    //    // Force a repaint, so that the map will be repainted without you having to touch the map
    //    map.triggerRepaint();
    //};

    const unlockBoundary = async (map, layerName) => {        
        let parentLayerIds = [];
        instance.store.inSearchMode = false;
        instance.store.searchMode = null;
        instance.store.searchedZip = null;        

        // clear search
        instance.store.clearSearch = `${Date.now().toString()}`;
        
        if (layerName == "DMA_BOUNDARY") {
            // show Clear DMA Boundary button
            $('#btnClearDMABoundary').addClass('ponderHidden');
            parentLayerIds = config.heatmapLayers.DMA.parentLayerIds;
        }
        else if (layerName == "COUNTY_BOUNDARY") {
            // show Clear DMA Boundary button
            $('#btnClearCountyBoundary').addClass('ponderHidden');
            parentLayerIds = config.heatmapLayers.COUNTY.parentLayerIds;
        }
        else if (layerName == "ZIP_BOUNDARY") {
            // show Clear DMA Boundary button
            $('#btnClearZipBoundary').addClass('ponderHidden');
            parentLayerIds = config.heatmapLayers.ZIP.parentLayerIds;
        }
        // clear the specific boundary using layerName
        const { source, id } = config.boundaryLayers[layerName];
        //if (map.layers.getLayerById(id)) map.removeLayer(id);
        /*if (map.getSource(source)) map.removeSource(source);*/
        if (map.layers.getLayerById(id)) {
            map.layers.remove(id);
            //instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
        }

        if (map.sources.getById(source)) {
            map.sources.remove(source);
            //instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
        }

        //switch on all layers above passed in layerName 
        parentLayerIds.forEach(layerId => {
            const layer = map.layers.getLayerById(layerId);
            layer.setOptions({ visible: true });
            //map.setLayoutProperty(layerId, "visibility", "visible")
        });

        //// clear the tiles for the PSA layer
        //if (map.sources.getById(config.pointsLayers.PSA_POINTS.source)) {
        //    map.style.sourceCaches[config.pointsLayers.PSA_POINTS.source].clearTiles();
        //}        
        psaPointLayer(getLayerProps());
        // update Main table
        instance.store.updateMainTable = `${Date.now().toString()}`;
        // update PSA table
        instance.store.updatePSATable = `${Date.now().toString()}`;
        // reload geojson layers
    //    map.getSource(config.pointsLayers.AR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=AR&randomize=${Date.now().toString()}`);
    //    map.getSource(config.pointsLayers.ATTR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=ATTR&randomize=${Date.now().toString()}`);
    //    map.getSource(config.pointsLayers.FUTURE_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/futurepsas?randomize=${Date.now().toString()}`);
    //    map.getSource(config.pointsLayers.TOP_25_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/top25psas?randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.AR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=AR&randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.ATTR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=ATTR&randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.FUTURE_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/futurepsas?randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.TOP_25_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/top25psas?randomize=${Date.now().toString()}`);
        arPointLayer(getLayerProps());
        attrPointLayer(getLayerProps());
        futurePSAPointLayer(getLayerProps());
        top25PSAPointLayer(getLayerProps());
        top25MDUPointLayer(getLayerProps());
    }

    const lockBoundary = async (map, layerName) => {        
        let parentLayerIds = [];
        if (layerName == "DMA_BOUNDARY") {
            // show Clear DMA Boundary button
            $('#btnClearDMABoundary').removeClass('ponderHidden');
            parentLayerIds = config.heatmapLayers.DMA.parentLayerIds;
        }
        else if (layerName == "COUNTY_BOUNDARY") {
            // show Clear DMA Boundary button
            $('#btnClearCountyBoundary').removeClass('ponderHidden');
            parentLayerIds = config.heatmapLayers.COUNTY.parentLayerIds;
        }
        else if (layerName == "ZIP_BOUNDARY") {
            // show Clear DMA Boundary button
            $('#btnClearZipBoundary').removeClass('ponderHidden');
            parentLayerIds = config.heatmapLayers.ZIP.parentLayerIds;
        }
        //switch off all layers above layerName 
        parentLayerIds.forEach(layerId => {
            //map.setLayoutProperty(layerId, "visibility", "none")
            const layer = map.layers.getLayerById(layerId);
            layer.setOptions({ visible: false });
        });
        //// clear the tiles for the PSA layer
        //if (map.getSource(config.pointsLayers.PSA_POINTS.source)) {
        //    map.style.sourceCaches[config.pointsLayers.PSA_POINTS.source].clearTiles();
        //}
        psaPointLayer(getLayerProps());
        // update Main table
        instance.store.updateMainTable = `${Date.now().toString()}`;
        // update PSA table
        instance.store.updatePSATable = `${Date.now().toString()}`;
        // reload geojson layers
    //    map.getSource(config.pointsLayers.AR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=AR&randomize=${Date.now().toString()}`);
    //    map.getSource(config.pointsLayers.ATTR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=ATTR&randomize=${Date.now().toString()}`);
    //    map.getSource(config.pointsLayers.FUTURE_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/futurepsas?randomize=${Date.now().toString()}`);
    //    map.getSource(config.pointsLayers.TOP_25_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/top25psas?randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.AR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=AR&randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.ATTR_POINTS.source).setData(`${instance.store.baseApiUrl}/point/stores?category=ATTR&randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.FUTURE_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/futurepsas?randomize=${Date.now().toString()}`);
        //map.sources.getById(config.pointsLayers.TOP_25_PSA_POINTS.source).setData(`${instance.store.baseApiUrl}/point/top25psas?randomize=${Date.now().toString()}`);
        arPointLayer(getLayerProps());
        attrPointLayer(getLayerProps());
        futurePSAPointLayer(getLayerProps());
        top25PSAPointLayer(getLayerProps());
        top25MDUPointLayer(getLayerProps());
    }

    const updateHeatMapLayers = async map => {
        
        // if groupBy is set to dynamic, turn the layers on and restore their zoom levels
        if (instance.store.groupBy === "DYNAMIC") {
            salesMarketLayer(getLayerProps());
            dmaLayer(getLayerProps());
            countyLayer(getLayerProps());
            zipLayer(getLayerProps());
            censusBlockLayer(getLayerProps());
            //for (let layer in config.heatmapLayers) {
            //    console.log('layer', layer);
            //    console.log('config.heatmapLayers[layer]', config.heatmapLayers[layer]);
            //    const {
            //        id,
            //        minZoom,
            //        maxZoom,
            //        source,
            //        vectorTileUrl,
            //    } = config.heatmapLayers[layer];

            //    //updateVectorTileSource({ source, vectorTileUrl, map });
            //    //reset layers visibility and zoom levels
            //    //map.setLayoutProperty(id, "visibility", "visible");
            //    //map.setLayerZoomRange(id, minZoom, maxZoom);
            //    const layer = map.layers.getLayerById(id);
            //    layer.setOptions({ visible: true, minZoom, maxZoom });
            //    layer = map.layers.getLayerById(`${id}-line`);
            //    layer.setOptions({ visible: true, minZoom, maxZoom });
            //    //if (id !== config.heatmapLayers.SALES_MARKET.id) { //sales market boundary layer always visibile
            //    //    //map.setLayoutProperty(`${id}-line`, "visibility", "visible");
            //    //    //map.setLayerZoomRange(`${id}-line`, minZoom, maxZoom);
            //    //    const layer = map.layers.getLayerById(`${id}-line`);
            //    //    layer.setOptions({ visible: true, minZoom, maxZoom });
            //    //}
            //}
        } else {
            for (let layer in config.heatmapLayers) {               
                const { id, source, vectorTileUrl } = config.heatmapLayers[layer];
                if (layer === instance.store.groupBy) {
                    if (instance.store.groupBy === "SALES_MARKET")
                        salesMarketLayer(getLayerProps());
                    else if (instance.store.groupBy === "DMA")
                        dmaLayer(getLayerProps());
                    else if (instance.store.groupBy === "COUNTY")
                        countyLayer(getLayerProps());
                    else if (instance.store.groupBy === "ZIP")
                        zipLayer(getLayerProps());
                    //updateVectorTileSource({ source, vectorTileUrl, map });
                    //map.setLayoutProperty(id, "visibility", "visible");
                    //map.setLayerZoomRange(id, 1, 17);


                    //let getLayer = map.layers.getLayerById(id);
                    //getLayer.setOptions({ visible: true, minZoom: 1, maxZoom: 17 });
                    //getLayer = map.layers.getLayerById(`${id}-line`);
                    //getLayer.setOptions({ visible: true, minZoom: 1, maxZoom: 17 });
                    //getLayer = map.layers.getLayerById(`${id}-hover`);
                    //getLayer.setOptions({ visible: true, minZoom: 1, maxZoom: 17 });
                    //getLayer = map.layers.getLayerById(`${id}-linehover`);
                    //getLayer.setOptions({ visible: true, minZoom: 1, maxZoom: 17 });


                    //if (id !== config.heatmapLayers.SALES_MARKET.id) { // exclude sales market boundary layer as its always visibile
                    //    //map.setLayoutProperty(`${id}-line`, "visibility", "visible");
                    //    //map.setLayerZoomRange(`${id}-line`, 1, 17);
                    //    const layer = map.layers.getLayerById(`${id}-line`);
                    //    layer.setOptions({ visible: true, minZoom: 1, maxZoom: 17 });
                    //}
                } else {
                    let getLayer = map.layers.getLayerById(id);
                    getLayer.setOptions({ visible: false });
                    //map.setLayoutProperty(id, "visibility", "none");
                    getLayer = map.layers.getLayerById(`${id}-line`);
                    getLayer.setOptions({ visible: false });
                    getLayer = map.layers.getLayerById(`${id}-hover`);
                    getLayer.setOptions({ visible: false });
                    getLayer = map.layers.getLayerById(`${id}-linehover`);
                    getLayer.setOptions({ visible: false });

                    //if (id !== config.heatmapLayers.SALES_MARKET.id) { // exclude sales market boundary layer as its always visibile
                    //    //map.setLayoutProperty(`${id}-line`, "visibility", "none");
                    //    const layer = map.layers.getLayerById(`${id}-line`);
                    //    layer.setOptions({ visible: false });
                    //}
                }
            }
        }
    }

    const updatePointLayers = async map => {
        //update pointsLayers
        for (let layer in config.pointsLayers) {
            const { name, source, updateSourceData } = config.pointsLayers[
                layer
            ];
            if (updateSourceData) {
                const { baseApiUrl, marketType, market } = instance.store;
                //const vectorTileSource = map.getSource(source);
                const vectorTileSource = map.sources.getById(source);
                if (name === "Market Top 25 PSAs") {
                    //const { data } = await instance.getData(
                    //    `${baseApiUrl}/point/top25psas?marketType=${marketType}&market=${market}`
                    //);
                    //vectorTileSource.setData(data);
                    top25PSAPointLayer(getLayerProps());
                } else if (name === "Market Top 25 MDUs") {
                    //const { data } = await instance.getData(
                    //    `${baseApiUrl}/point/top25mdus?marketType=${marketType}&market=${market}`
                    //);
                    //vectorTileSource.setData(data);
                    top25MDUPointLayer(getLayerProps());
                } else if (name === "AT&T Retail Store") {
                    //const { data } = await instance.getData(
                    //    `${baseApiUrl}/point/stores?category=ATTR&marketType=${marketType}&market=${market}`
                    //);
                    //vectorTileSource.setData(data);
                    attrPointLayer(getLayerProps());
                } else if (name === "Authorized Reseller Store") {
                    //const { data } = await instance.getData(
                    //    `${baseApiUrl}/point/stores?category=AR&marketType=${marketType}&market=${market}`
                    //);
                    //vectorTileSource.setData(data);
                    arPointLayer(getLayerProps());
                } else if (name === "Future PSA Locations") {
                    //const { data } = await instance.getData(
                    //    `${baseApiUrl}/point/futurepsas?marketType=${marketType}&market=${market}`
                    //);
                    //vectorTileSource.setData(data);
                    futurePSAPointLayer(getLayerProps());
                }
            }
        }
    }

    const updateLayers = async map => {
        await updateHeatMapLayers(map);
        await updatePointLayers(map);
    };

    const zoomToBoundary = async () => {
        const { marketType, market } = instance.store;
        const params = {
            marketType,
            market
        };
        const boundaryData = await instance.getData(            
            `${instance.store.baseApiUrl}/geodata/fiberPenetration/boundary.geojson`, //boundary data same all heatmaps
            params
        );
        const boundaryCenter = centroid(boundaryData);
        const zoom = (marketType == "MARKET") ? config.heatmapLayers.ZIP.minZoom : config.heatmapLayers.SALES_MARKET.maxZoom;
        instance.store.zoomToPoint = {
            lat: boundaryCenter.geometry.coordinates[1],
            lng: boundaryCenter.geometry.coordinates[0],
            zoom: zoom,
            addMarker: false,
        };
        //instance.store.dropdownBoundary = boundaryData.data;
        instance.store.setBoundaryLayer = {
            layerName: "DROPDOWN_BOUNDARY",
            featureCollection: boundaryData
        };
    }

    const initSubscriptions = async () => {

        //instance.stateManager.subscribe(
        //    "currentHeatmapFilter",
        //    async currentFilter => {                
        //        if (currentFilter && R.is(Array, currentFilter) && currentFilter.length == 0) return; // app intial load event                
        //        const { map } = instance;
        //        if (map) {
        //            // update visible layer's paint properties based on heatmap filter
        //            for (let layer in config.heatmapLayers) {
        //                map.setPaintProperty(
        //                    config.heatmapLayers[layer].id,
        //                    "fill-color",
        //                    heatmapConfig[currentFilter].fillColorExpression
        //                );
        //            }
        //        }
        //    }
        //);

        instance.stateManager.subscribe(
            "currentHeatmapFilterIndex",
            async filterIndex => {
                if (filterIndex && R.is(Array, filterIndex) && filterIndex.length == 0) return; // app intial load event
                const { map, store } = instance;
                if (map) {
                    const fillColor = getPaintFill(
                        filterIndex,
                        store.currentHeatmapFilter
                    );

                    // loops over the layers and updates the colors based on the selected filter
                    for (let layer in config.heatmapLayers) {
                        const heatmapLayer = map.layers.getLayerById(config.heatmapLayers[layer].id);
                        if (heatmapLayer) {
                            heatmapLayer.setOptions({ fillColor });
                        }
                        //map.setPaintProperty(
                        //    config.heatmapLayers[layer].id,
                        //    "fill-color",
                        //    fillCollor
                        //);
                    }
                }
            }
        );

        //instance.stateManager.subscribe(" ibilityChange", async d => {
        //    if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
        //    const { map } = instance;
        //    if (map) {
        //        //show or hide specific layer on the map
        //        const { layerId } = d;
        //        const visibility = map.getLayoutProperty(layerId, "visibility");
        //        if (map.layers.getLayerById(layerId)) {
        //            if (visibility === "visible") {
        //                map.setLayoutProperty(layerId, "visibility", "none");
        //            } else {
        //                map.setLayoutProperty(layerId, "visibility", "visible");
        //                if (layerId !== 'satellite') {
        //                    map.moveLayer("satellite", layerId);
        //                }
        //            }
        //        }
        //    }
        //});

        //instance.stateManager.subscribe("layerVisibilityChange", async d => {
        //    const { map } = instance;
        //    if (map) {
        //        //show or hide specific layer on the map 
        //        const { layerId, layerVisibilityStatus } = d;
        //        //const visibility = map.getLayoutProperty(layerId, "visibility");
        //        const layer = map.layers.getLayerById(layerId);
        //        const visibility = layer.getOptions().visible;
        //        if (layer) {
        //            if (visibility === true || !layerVisibilityStatus) {
        //                //map.setLayoutProperty(layerId, "visibility", "none");
        //                layer.setOptions({ visible: false });
        //            }
        //            else {
        //                //map.setLayoutProperty(layerId, "visibility", "visible");
        //                layer.setOptions({ visible: true });
        //                if (layerId !== 'satellite') {
        //                    map.moveLayer("satellite", layerId);
        //                }
        //            }
        //        }
        //    }
        //});

        instance.stateManager.subscribe("layerVisibilityChange", async d => {
            const { map } = instance;
            if (map) {

                //show or hide specific layer on the map
                const { layerId, layerVisibilityStatus } = d;
                if (layerId === 'satellite') {
                    if (layerVisibilityStatus) {
                        map.setStyle({ style: 'satellite_road_labels', showLabels: true });
                    } else {
                        map.setStyle({ style: 'road', showLabels: true });
                    }
                }
                //else if (layerId === 'nsb-boundary') {
                //    const layer = map.layers.getLayerById(layerId);
                //    const lineLayer = map.layers.getLayerById(`${layerId}-line`);
                //    const lineHoverLayer = map.layers.getLayerById(`${layerId}-linehover`);
                //    if (layer) {
                //        layer.setOptions({ visible: layerVisibilityStatus });
                //        lineLayer.setOptions({ visible: layerVisibilityStatus });
                //        lineHoverLayer.setOptions({ visible: layerVisibilityStatus });
                //    }
                //}
                //else if (layerId === 'psa-point-layer-id') {
                //    const layer = map.layers.getLayerById(layerId);
                //    if (layer) {
                //        layer.setOptions({ visible: layerVisibilityStatus });
                //    }
                //}
                else {
                    const layer = map.layers.getLayerById(layerId);
                    if (layer) {
                        const visibility = layer.getOptions().visible;
                        if (visibility === "visible" || !layerVisibilityStatus) {
                            layer.setOptions({ visible: false });
                            //set mduOutlineLayer visible property
                            if (layerId == config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id || layerId == config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.id) {
                                const mduOutlineLayer = map.layers.getLayerById(`${layerId}-mduoutline`);
                                mduOutlineLayer.setOptions({ visible: false });
                            }
                            // map.setLayoutProperty(layerId, "visibility", "none");
                        } else {
                            layer.setOptions({ visible: true });
                            //set mduOutlineLayer visible property
                            if (layerId == config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id || layerId == config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.id) {
                                const mduOutlineLayer = map.layers.getLayerById(`${layerId}-mduoutline`);
                                mduOutlineLayer.setOptions({ visible: true });
                            }
                            // map.setLayoutProperty(layerId, "visibility", "visible");
                        }
                    }
                }
            }
        });



        instance.stateManager.subscribe("shapeSizes", async shapeSizes => {
            if (shapeSizes && R.is(Array, shapeSizes) && shapeSizes.length == 0) return; // app intial load event
            const { map } = instance;
            if (map) {
                for (const key in config.pointsLayers) {
                    const layerId = config.pointsLayers[key].id;
                    const shapeSizeValue = shapeSizes.find(
                        shapeSize => shapeSize.layerId == layerId
                    )?.shapeSize;
                    if (shapeSizeValue) {
                        const layer = map.layers.getLayerById(layerId);
                        if (layer) {
                            //mduOutlineLayer icon size should be little greater than MDU layer
                            if (layerId == config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id || layerId == config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.id) {
                                const mduOutlineLayer = map.layers.getLayerById(`${layerId}-mduoutline`);
                                mduOutlineLayer.setOptions({ iconOptions: { size: shapeSizeValue + 0.1 } }); //mduOutlineLayer icon size should be little greater than MDU layer
                            }
                            layer.setOptions({ iconOptions: { size: shapeSizeValue } });
                        }
                    }
                }
            }
        });

        instance.stateManager.subscribe("updateMainMap", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            const { map } = instance;
            if (map) {
                if (instance.store.marketType == "MARKET") {
                    await zoomToBoundary();
                }
                await updateLayers(map);
            }
        });
        
        instance.stateManager.subscribe("showACCPointLayer", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event  
            const { map } = instance;
            if (map) {
                const pointLayers = Object.values(config.pointsLayers);                
                pointLayers.map((pointLayer) => {
                    // show and check ACCPointLayer in overLayMenu panel
                    if (pointLayer.id === config.pointsLayers.ACC_POINTS.id) {
                        $(`${'.selection-inputs.' + pointLayer.id}`).show(); // show ACCPointLayer in Panel selection
                        $(`#${pointLayer.id}`).prop("checked", true); //check ACCPointLayer
                    }
                    //uncheck and hide all other PointLayers
                    else {
                        $(`#${pointLayer.id}`).prop("checked", false);
                        const layer = map.layers.getLayerById(pointLayer.id);
                        if (layer) {                            
                            layer.setOptions({ visible: false });
                        }
                        const layerId = pointLayer.id;
                        //set mduOutlineLayer visible property
                        if (layerId == config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id || layerId == config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.id) {
                            const mduOutlineLayer = map.layers.getLayerById(`${layerId}-mduoutline`);
                            mduOutlineLayer.setOptions({ visible: false });
                        }
                    }
                });
                // add accPointLayer to map
                accPointLayer(getLayerProps());
            }
        });

        instance.stateManager.subscribe("hideACCPointLayer", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event            
            const { map, store } = instance;
            const { baseApiUrl } = store;
            if (map) {
                //check and show all show all PointLayers on the map except ACCPointLayer
                const pointLayers = Object.values(config.pointsLayers).filter(pointLayer => pointLayer.id != config.pointsLayers.ACC_POINTS.id && pointLayer.id != config.pointsLayers.AR_POINTS.id && pointLayer.id != config.pointsLayers.ATTR_POINTS.id);
                pointLayers.map((pointLayer) => {
                    $(`#${pointLayer.id}`).prop("checked", true);
                    const layer = map.layers.getLayerById(pointLayer.id);                    
                    if (layer) {
                        //map.setLayoutProperty(pointLayer.id, "visibility", "visible");
                        layer.setOptions({ visible: true });
                    }
                    const layerId = pointLayer.id;
                    //set mduOutlineLayer visible property
                    if (layerId == config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id || layerId == config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.id) {
                        const mduOutlineLayer = map.layers.getLayerById(`${layerId}-mduoutline`);
                        mduOutlineLayer.setOptions({ visible: true });
                    }
                });
                //uncheck and hide ACCPointLayer
                const { source, id } = config.pointsLayers.ACC_POINTS;
                $(`#${id}`).prop("checked", false); //uncheck ACCPointLayer 
                $(`${'.selection-inputs.' + id}`).hide(); // hide ACCPointLayer in Panel selection
                //remove accpointLayer and its source from map
                if (map.layers.getLayerById(id)) {
                    map.layers.remove(id);
                    instance.store.layersAddedToMap = instance.store.layersAddedToMap.filter(layerId => layerId !== id);
                }
                if (map.sources.getById(source)) {
                    map.sources.remove(source);
                    instance.store.sourcesAddedToMap = instance.store.sourcesAddedToMap.filter(sourceId => sourceId !== source);
                }
            }
        });

        // triggered when currentHeatmapFilter is changed
        instance.stateManager.subscribe("currentHeatmapFilter", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            const { map } = instance;
            if (map) {
                await updateHeatMapLayers(map);
            }
        });

        // This subscription is used to create boundary layers for - DMA, County, Zip, CensusBlocks and SalesMarket dropdown value chnage events
        instance.stateManager.subscribe("setBoundaryLayer", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            const { map } = instance;
            if (map && d) {
                const { featureCollection, layerName } = d;                
                boundaryLayer(getLayerProps(), featureCollection, layerName);
                const coordinates =
                    featureCollection.features[0].geometry.coordinates;                
                const boundary = multiLineString(coordinates);
                const _bbox = bbox(boundary);
                if (instance.store.inSearchMode) {
                    await lockBoundary(map, layerName); 
                }
                //map.fitBounds(_bbox, {
                //    padding: { top: 10, bottom: 25, left: 15, right: 5 },
                //});
                map.setCamera({ bounds: _bbox, padding: { top: 10, bottom: 25, left: 15, right: 5 } });
                if (layerName != "DROPDOWN_BOUNDARY") {
                    if (instance.store.tableRowClicked) {
                        instance.store.fitBoundsForTableRowClick = true;
                    }
                    instance.store.tableRowClicked = false;
                }
            }
        });

        // triggered by hyperlinks in PSA or Address Layer popups 
        instance.stateManager.subscribe("addPSAFilter", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event            
            const { map } = instance;
            if (map && d) {
                const { psa, latitude, longitude } = d;
                // show the clear PSA Filter button
                $('#btnClearPSAFilter').removeClass('ponderHidden');
                //// update addresLayers tiles, add psa filter
                //const addressLayers = Object.values(config.pointsLayers).filter(pointLayer => pointLayer.isAddressLayer == true);
                //for (let layer in addressLayers) {
                //    const { source, customerCategoryId } = addressLayers[layer];
                //    updateAddressVectorTileSource({ source, map, customerCategoryId, psa });
                //}
                //update all addreessLayers on the map
                fiberCustomerandWirelessCustomerLayer(getLayerProps());
                fiberCustomerandWirelessCrossSellOpportunityLayer(getLayerProps());
                copperUpgradeandWirelessCustomerLayer(getLayerProps());
                copperUpgradeandWirelessCrossSellOpportunityLayer(getLayerProps());
                wirelessCustomerandFiberCrossSellOpportunityLayer(getLayerProps());
                opportunityforFiberandWirelessLayer(getLayerProps());
                mduAllATTFiberCustomerLayer(getLayerProps());
                mduWithATTFiberProspectLayer(getLayerProps());
                // remove any open popups
                /*$('.mapboxgl-popup').remove();*/
                if (instance.popup.isOpen()) {
                    instance.popup.close();
                }
                // zoom to addressLayers                
                instance.store.zoomToPoint = {
                    lat: latitude,
                    lng: longitude,
                    zoom: config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom,
                    addMarker: false,
                };
                //switch to addressTableTab                
                instance.store.switchToAddressTableTab = `${Date.now().toString()}`;
            }
        });

        instance.stateManager.subscribe("clearBoundary", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            const { map } = instance;
            if (map && d) {
                await unlockBoundary(map,d);
            }
        });

        // triggered by btnClearPSAFilter button in OverlayMenu.js
        instance.stateManager.subscribe("clearPSAFilter", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event            
            const { map } = instance;
            if (map && d) {
                /*instance.store.psaFilter = undefined;*/              

                // hide the clear PSA Filter button
                $('#btnClearPSAFilter').addClass('ponderHidden');
                //// update addresLayers tiles, remove psa filter
                //const addressLayers = Object.values(config.pointsLayers).filter(pointLayer => pointLayer.isAddressLayer == true);
                //for (let layer in addressLayers) {
                //    const { source, customerCategoryId } = addressLayers[layer];
                //    updateAddressVectorTileSource({ source, map, customerCategoryId, psa: instance.store.psaFilter });
                //}
                //update all addressLayers
                fiberCustomerandWirelessCustomerLayer(getLayerProps());
                fiberCustomerandWirelessCrossSellOpportunityLayer(getLayerProps());
                copperUpgradeandWirelessCustomerLayer(getLayerProps());
                copperUpgradeandWirelessCrossSellOpportunityLayer(getLayerProps());
                wirelessCustomerandFiberCrossSellOpportunityLayer(getLayerProps());
                opportunityforFiberandWirelessLayer(getLayerProps());
                mduAllATTFiberCustomerLayer(getLayerProps());
                mduWithATTFiberProspectLayer(getLayerProps());
            }
        });
    };

    const mapOptions = {
        center: instance.store.mapCoordinates,
        zoom: instance.store.zoom,
        style: `${config.mapboxLightStyle}${$("#hdnMapTilerKey").val()}`,
        attributionControl: false,
    };

    const firstUpdated = async () => {
        await instance.renderMap();
    };

    const createMapLayers = async () => {
        const layerProps = getLayerProps();

        // Map layers
        //satelliteLayer(layerProps);
        salesMarketBoundaryLayer(layerProps); //default salesMarket Boundary layer
        salesMarketLayer(layerProps);
        dmaLayer(layerProps);
        countyLayer(layerProps);
        zipLayer(layerProps);
        censusBlockLayer(layerProps);
        attrPointLayer(layerProps);
        arPointLayer(layerProps);
        futurePSAPointLayer(layerProps);
        top25PSAPointLayer(layerProps);
        top25MDUPointLayer(layerProps);
        psaPointLayer(layerProps);
        fiberCustomerandWirelessCustomerLayer(layerProps);
        fiberCustomerandWirelessCrossSellOpportunityLayer(layerProps);
        copperUpgradeandWirelessCustomerLayer(layerProps);
        copperUpgradeandWirelessCrossSellOpportunityLayer(layerProps);
        wirelessCustomerandFiberCrossSellOpportunityLayer(layerProps);
        opportunityforFiberandWirelessLayer(layerProps);
        mduAllATTFiberCustomerLayer(layerProps);
        mduWithATTFiberProspectLayer(layerProps);
        //accPointLayer(layerProps);
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

    const refreshCensusBlocksTable = async () => {
        const zoomLevel = instance.map.getCamera().zoom;
        //load censusblocks table ONLY when zoom level is greater than CENSUS_BLOCK.minZoom (zoom level - 14) and group by is not DYNAMIC
        if (zoomLevel >= config.heatmapLayers.CENSUS_BLOCK.minZoom && instance.store.groupBy === "DYNAMIC") {
            const coords = getPixelCoords().join('^');
            const response = await instance.postData(`${instance.store.baseApiUrl}/table/censusblocks`, { coords });            
            instance.store.censusBlockTableData = {
                censusBlockFeatures: response,
                zoomLevel
            };
        }
    }

    const refreshAddressTables = async () => {
        const zoomLevel = instance.map.getCamera().zoom;
        //load addresses, mdus and acc tables ONLY when zoom level is greater than FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom (zoom level - 15)
        if (zoomLevel >= config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom) {
            const coords = getPixelCoords().join('^');
            let params = { coords, customerCategoryId: 1 };
            const nonMDUResults = await instance.postData(`${instance.store.baseApiUrl}/table/addresses`, params); //gets all addresses except MDUs
            params = { coords, customerCategoryId: 7 };
            const mduResults = await instance.postData(`${instance.store.baseApiUrl}/table/addresses`, params);//gets only MDUs
            const visibileLayers = [];
            let layer = instance.map.layers.getLayerById(config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.id);            
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CROSS_SELL_OPPORTUNITY.id);            
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CROSS_SELL_OPPORTUNITY.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CUSTOMER.id);
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CUSTOMER.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CROSS_SELL_OPPORTUNITY.id);
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CROSS_SELL_OPPORTUNITY.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.WIRELESS_CUSTOMER_AND_FIBER_CROSS_SELL_OPPORTUNITY.id);
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.WIRELESS_CUSTOMER_AND_FIBER_CROSS_SELL_OPPORTUNITY.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.OPPORTUNITY_FOR_FIBER_AND_WIRELESS.id);
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.OPPORTUNITY_FOR_FIBER_AND_WIRELESS.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.id);
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.customerCategoryId)
            }
            layer = instance.map.layers.getLayerById(config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.id);
            if (layer.getOptions().visible) {
                visibileLayers.push(config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.customerCategoryId)
            }
            const isVisibleAddress = x => visibileLayers.includes(x.customer_category_id);
            const allResults = R.concat(nonMDUResults, mduResults); // addressTable should display all addresses inclduing MDUs with unit numbers
            const filteredAllResults = R.filter(isVisibleAddress, allResults);
            const filteredMDUResults = R.filter(isVisibleAddress, mduResults); // mduTable should ONLY display MDUs without unit numbers, filter this data further while loading table
            instance.store.addressTableData = filteredAllResults; //reloads addressTable
            instance.store.mduTableData = filteredMDUResults; //reloads mduTable
            instance.store.accMapData = filteredMDUResults; //reloads accTable
        }
    }

    const refreshUserACCTable = async () => {
        const zoomLevel = instance.map.getCamera().zoom;
        //load userACCTable
        if (instance.map.layers.getLayerById(config.pointsLayers.ACC_POINTS.id)) {
            if (!instance.store.ignoreZoomEndEvent) {
                const accLayerRenderedShapes = instance.map.layers.getRenderedShapes(null, [config.pointsLayers.ACC_POINTS.id], null);  // getRenderedShapes              
                const data = R.pluck("data", accLayerRenderedShapes); // pluck data                                
                instance.store.userACCTableData = R.pluck("properties", data);
            }
            else {
                instance.store.ignoreZoomEndEvent = false; //set this to false so that table gets reloaded during zoomend next time
            }
        }
    }

    const eventHandlers = {
        ready: e => {
            instance.map.imageSprite.createFromTemplate(`accIcon`, 'ponder-rectangle', config.pointsLayers.ACC_POINTS.color);
            instance.map.imageSprite.createFromTemplate(`arIcon`, 'ellipse-outline', config.pointsLayers.AR_POINTS.color);
            instance.map.imageSprite.createFromTemplate(`attrIcon`, 'ellipse-outline', config.pointsLayers.ATTR_POINTS.color);
            instance.map.imageSprite.createFromTemplate(`copperUpgradeandWirelessCrossSellOpportunityIcon`, 'ponder-ellipse', config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CROSS_SELL_OPPORTUNITY.color);
            instance.map.imageSprite.createFromTemplate(`copperUpgradeandWirelessCustomerIcon`, 'ponder-ellipse', config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CUSTOMER.color);
            instance.map.imageSprite.createFromTemplate(`fiberCustomerandWirelessCrossSellOpportunityIcon`, 'ponder-ellipse', config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CROSS_SELL_OPPORTUNITY.color);
            instance.map.imageSprite.createFromTemplate(`fiberCustomerandWirelessCustomerIcon`, 'ponder-ellipse', config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.color);
            instance.map.imageSprite.createFromTemplate(`future-psa-triangle-icon-1`, 'ponder-triangle', config.pointsLayers.FUTURE_PSA_POINTS.color.WIRELESS_SCORE_1);
            instance.map.imageSprite.createFromTemplate(`future-psa-triangle-icon-2`, 'ponder-triangle', config.pointsLayers.FUTURE_PSA_POINTS.color.WIRELESS_SCORE_2);
            instance.map.imageSprite.createFromTemplate(`future-psa-triangle-icon-3`, 'ponder-triangle', config.pointsLayers.FUTURE_PSA_POINTS.color.WIRELESS_SCORE_3);
            instance.map.imageSprite.createFromTemplate(`future-psa-triangle-icon-4`, 'ponder-triangle', config.pointsLayers.FUTURE_PSA_POINTS.color.WIRELESS_SCORE_4);
            instance.map.imageSprite.createFromTemplate(`future-psa-triangle-icon-5`, 'ponder-triangle', config.pointsLayers.FUTURE_PSA_POINTS.color.WIRELESS_SCORE_5);
            //instance.map.imageSprite.createFromTemplate(`mduAllATTFiberCustomerIcon`, 'ponder-acc-rectangle', config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.color);
            //instance.map.imageSprite.createFromTemplate(`mduWithATTFiberProspectIcon`, 'ponder-acc-rectangle', config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.color);
            instance.map.imageSprite.createFromTemplate(`mduAllATTFiberCustomerIcon`, 'ponder-rectangle', config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.color);
            instance.map.imageSprite.createFromTemplate(`mduWithATTFiberProspectIcon`, 'ponder-rectangle', config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS.color);
            instance.map.imageSprite.createFromTemplate(`redRectangleIcon`, 'ponder-rectangle', '#FF0000');
            instance.map.imageSprite.createFromTemplate(`opportunityforFiberandWirelessIcon`, 'ponder-ellipse', config.pointsLayers.OPPORTUNITY_FOR_FIBER_AND_WIRELESS.color);
            instance.map.imageSprite.createFromTemplate(`psa-point-icon-1`, 'ponder-ellipse', config.pointsLayers.PSA_POINTS.color.WIRELESS_SCORE_1);
            instance.map.imageSprite.createFromTemplate(`psa-point-icon-2`, 'ponder-ellipse', config.pointsLayers.PSA_POINTS.color.WIRELESS_SCORE_2);
            instance.map.imageSprite.createFromTemplate(`psa-point-icon-3`, 'ponder-ellipse', config.pointsLayers.PSA_POINTS.color.WIRELESS_SCORE_3);
            instance.map.imageSprite.createFromTemplate(`psa-point-icon-4`, 'ponder-ellipse', config.pointsLayers.PSA_POINTS.color.WIRELESS_SCORE_4);
            instance.map.imageSprite.createFromTemplate(`psa-point-icon-5`, 'ponder-ellipse', config.pointsLayers.PSA_POINTS.color.WIRELESS_SCORE_5);
            instance.map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-1`, 'ponder-rectangle', config.pointsLayers.TOP_25_MDU_POINTS.color.WIRELESS_SCORE_1);
            instance.map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-2`, 'ponder-rectangle', config.pointsLayers.TOP_25_MDU_POINTS.color.WIRELESS_SCORE_2);
            instance.map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-3`, 'ponder-rectangle', config.pointsLayers.TOP_25_MDU_POINTS.color.WIRELESS_SCORE_3);
            instance.map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-4`, 'ponder-rectangle', config.pointsLayers.TOP_25_MDU_POINTS.color.WIRELESS_SCORE_4);
            instance.map.imageSprite.createFromTemplate(`top25MDU-rectangle-icon-5`, 'ponder-rectangle', config.pointsLayers.TOP_25_MDU_POINTS.color.WIRELESS_SCORE_5);
            instance.map.imageSprite.createFromTemplate(`top25-psa-point-icon-1`, 'ponder-ellipse', config.pointsLayers.TOP_25_PSA_POINTS.color.WIRELESS_SCORE_1);
            instance.map.imageSprite.createFromTemplate(`top25-psa-point-icon-2`, 'ponder-ellipse', config.pointsLayers.TOP_25_PSA_POINTS.color.WIRELESS_SCORE_2);
            instance.map.imageSprite.createFromTemplate(`top25-psa-point-icon-3`, 'ponder-ellipse', config.pointsLayers.TOP_25_PSA_POINTS.color.WIRELESS_SCORE_3);
            instance.map.imageSprite.createFromTemplate(`top25-psa-point-icon-4`, 'ponder-ellipse', config.pointsLayers.TOP_25_PSA_POINTS.color.WIRELESS_SCORE_4);
            instance.map.imageSprite.createFromTemplate(`top25-psa-point-icon-5`, 'ponder-ellipse', config.pointsLayers.TOP_25_PSA_POINTS.color.WIRELESS_SCORE_5);
            instance.map.imageSprite.createFromTemplate(`wirelessCustomerandFiberCrossSellOpportunityIcon`, 'ponder-ellipse', config.pointsLayers.WIRELESS_CUSTOMER_AND_FIBER_CROSS_SELL_OPPORTUNITY.color);
        },
        moveend: async e => {
            console.log('A moveend event occurred.');
            // maplibre triggers moveend event for zoomend. Prevent calling moveend for a zoomend event
            if (instance.store.zoomend) {
                /*console.log('A moveend event occurred from zoomend.');*/
                instance.store.zoomend = false;
                return;
            }            
            await refreshCensusBlocksTable();
            await refreshAddressTables();
            await refreshUserACCTable();
        },
        sourcedataloading: e => {
            instance.store.isMapLoading = true;
        },
        sourcedata: e => {
            const isSourceVisible =
                e.dataType === "source" &&
                e.isSourceLoaded &&
                e.sourceDataType !== "visibility";

            if (isSourceVisible)
                instance.store.isMapLoading = false;
        },
        zoomend: async e => {           

            const zoomLevel = instance.map.getCamera().zoom;            
            instance.store.currentZoom = zoomLevel;                        
            // maplibre calls moveend as well for a zoomend event. Set the below flag to prevent code in moveend event being triggered
            instance.store.zoomend = true;            
            
            await refreshCensusBlocksTable();
            updateShapeSize(zoomLevel, instance.store); //update icon size
            await refreshAddressTables();            
            await refreshUserACCTable();

            //reset addresses, mdus and acc tables when zoom level is less than FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom (zoom level < 15)
            if (zoomLevel < config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom) {
                if (instance.store.currentTab != "userACCTable") {
                    instance.store.switchToMainTableTab = `${Date.now().toString()}`;//switch to mainTableTab
                }
            }

            //if zoom value is less than application's zoomStart value return and do nothing
            if (instance.map.getCamera().zoom < instance.store.config.zoomStart && instance.store.tableType == tableConfig.tables.vpgms.type )
                return;
            const currentTableType = instance.store.tableType;
            if (instance.store.tableRowClicked) {
                return;
            }
            if (instance.store.fitBoundsForTableRowClick) {
                instance.store.fitBoundsForTableRowClick = false;
            }

            for (let layer in config.heatmapLayers) {
                const currentLayer = config.heatmapLayers[layer];
                const { minZoom, maxZoom, tableType } = currentLayer;

                if (zoomLevel >= minZoom && zoomLevel < maxZoom) {
                    if (instance.store.groupBy === "DYNAMIC") {
                        instance.store.tableType = tableType;
                    }
                    if (currentTableType !== instance.store.tableType) {                        
                        instance.store.updateMainTable = `${Date.now().toString()}`; //relaods mainTable
                        return updateMapLayer(currentLayer);
                    }
                }
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
