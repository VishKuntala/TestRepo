﻿

import $ from "jquery";
import * as R from 'ramda';
import { setMaskCanvasData, createMaskCanvas } from '../../../../createMaskCanvas.js';
import { getBaseLayers, getOverlayLayers, resetOverlayLayers, resetMapOverlaysData, rebuildMapOverlaysData } from '../../../../mapLayers.js';
import { updateOverlaysLabel } from "../../../../helpers/layersControl.js";



const omniMap = ({ adminUser, instance }) => {


    const createStoreLayer = async (title, lineColor, storeDataset) => {
        let pane = instance.map.getPane(title);
        if (!pane) {
            pane = instance.map.createPane(title);
            pane.style.zIndex = 400;
        }
        const response = createMaskCanvas(
            {
                pane,
                markerShape: 'STOREDOUGHNUT',
                heatMapDataKey: 'store_category',
                heatMapObject: {
                    "ATTR": "#002280",
                    "AR": "#21b2ff"
                },
                heatMapActivationZoomLevel: 1,
                markerSizeOffsetFromZoomValue: 2,
                lineColor,
                lineWidth: 7,
                minZoomBorderVisibility: 12,
                maxZoomBorderVisibility: 20
            }, {
            title,
            isDefault: 0,
            minZoomVisibility: 1,
            maxZoomVisibility: 20,
            showHideOnZoom: false,
            markerType: 'store'
        },
            storeDataset);
        return response;
    }


    const createStoreLayers = async () => {
        const storeLayerLineColors = {
            "ATTR": "#002280",
            "AR": "#21b2ff"
        };
        let storeOverlays = {};
        const dataGroupedByStoreCategory = R.groupBy(R.prop('store_category'), instance.storeData);
        const storeCategory = R.keys(dataGroupedByStoreCategory);
        for (let i = 0; i < storeCategory.length; i += 1) {
            const storeLayer = (await createStoreLayer(storeCategory[i], storeLayerLineColors[storeCategory[i]], dataGroupedByStoreCategory[storeCategory[i]])).canvasLayer;
            //instance.map.addLayer(storeLayer);
            storeOverlays[storeCategory[i] === "AR" ? "Authorized Reseller Store" : "AT&T Retail Store"] = storeLayer;
        }
        return storeOverlays;
    }

    const createOmniLayer = async title => {
        let pane = instance.map.getPane(title);
        if (!pane) {
            pane = instance.map.createPane(title);
            pane.style.zIndex = 400;
        }
        const response = createMaskCanvas(
            {
                pane,
                markerShape: 'SQUARE',
                heatMapDataKey: 'indoor_coverage_score',
                heatMapObject: {
                    "5": "#003300",
                    "4": "#008000",
                    "3": "#00cc00",
                    "2": "#ffff00",
                    "1": "#e6b800"
                },
                heatMapActivationZoomLevel: 10,
                markerSizeOffsetFromZoomValue: -2,
                lineColor: '#ff6633',
                lineWidth: 4,
                minZoomBorderVisibility: 12,
                maxZoomBorderVisibility: 20
            }, {
            title,
            isDefault: 1,
            minZoomVisibility: 1,
            maxZoomVisibility: 20,
            markerType: 'omni'
        },
            instance.mapData);
        return response;
    }




    const createMapLayers = async () => {

        const omniLayer = (await createOmniLayer('Omni Locations')).canvasLayer;
        const storeOverlays = await createStoreLayers();
        instance.map.addLayer(omniLayer);
        let omniOverlays = {};
        omniOverlays["Omni Locations"] = omniLayer;
        let overlays = {};
        overlays = Object.assign(storeOverlays, omniOverlays);
        L.control.layers(getBaseLayers(), overlays, { collapsed: false }).addTo(instance.map);

        rebuildMapOverlaysData(instance.map);
        updateOverlaysLabel();
    }

    const eventHandlers = {
        moveend: (e) => {
            instance.store.currentMapBounds = instance.map.getBounds();
            instance.store.currentMapZoom = instance.map.getZoom();
            instance.store.currentMapCenter = instance.map.getCenter();
        },
        zoomend: (e) => {
            instance.store.currentMapBounds = instance.map.getBounds();
            instance.store.currentMapZoom = instance.map.getZoom();
            instance.store.currentMapCenter = instance.map.getCenter();
        }

    }



    return {
        eventHandlers,
        createMapLayers
    }
}

export default omniMap;
