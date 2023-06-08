

import $ from "jquery";
import * as R from 'ramda';
import { setMaskCanvasData, createMaskCanvas } from '../../../../createMaskCanvas.js';
import { getBaseLayers, getOverlayLayers, resetOverlayLayers, resetMapOverlaysData, rebuildMapOverlaysData } from '../../../../mapLayers.js';
import { updateOverlaysLabel } from "../../../../helpers/layersControl.js";



const nationalLUsMap = ({ adminUser, instance }) => {

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

    const createNationalLUsLayer = async title => {
        let pane = instance.map.getPane(title);
        if (!pane) {
            pane = instance.map.createPane(title);
            pane.style.zIndex = 400;
        }
        const response = createMaskCanvas(
            {
                pane,
                markerShape: 'SQUARELUS',
                heatMapDataKey: 'network_build_type_cd',
                heatMapObject: {
                    "FTTB-F": "#003300", //DARK GREEN
                    "FTTP-GPON": "#006600", //DARK GREEN
                    "FTTN-BP": "#00cc00", //LT GREEN
                    "FTTN": "#00ff00", //LT GREEN
                    "FTTPIP": "#33ff33", //LT GREEN
                    "IP-CO-BP": "#ffff00", // YELLOW
                    "IP-RT-BP": "#ffff33", // YELLOW
                    "IP-RT": "#ffff66", // YELLOW
                    "IP-CO": "#ffff99", // YELLOW
                    "ATM CO": "#808080",  //GREY
                    "ATM RT": "#999999",  //GREY
                    "NA": "#b3b3b3",  //GREY
                },
                heatMapActivationZoomLevel: 1,
                markerSizeOffsetFromZoomValue: -2,
                lineColor: '#3366ff',
                lineWidth: 1,
                minZoomBorderVisibility: 16,
                maxZoomBorderVisibility: 20
            }, {
            title,
            isDefault: 1,
            minZoomVisibility: 1,
            maxZoomVisibility: 20,
            markerType: 'nationalLUs'
        },
            instance.mapData);
        return response;
    }




    const createMapLayers = async () => {

        const nationalLUsLayer = (await createNationalLUsLayer('National Living Unit Locations')).canvasLayer;
        const storeOverlays = await createStoreLayers();
        instance.map.addLayer(nationalLUsLayer);
        let nationalLUsOverlays = {};
        nationalLUsOverlays["National Living Unit Locations"] = nationalLUsLayer;
        let overlays = {};
        overlays = Object.assign(storeOverlays, nationalLUsOverlays);
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

export default nationalLUsMap;

