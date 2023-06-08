

import $ from "jquery";
import * as R from 'ramda';
import { setMaskCanvasData, createMaskCanvas } from '../../../../createMaskCanvas.js';
import { getBaseLayers, getOverlayLayers, resetOverlayLayers, resetMapOverlaysData, rebuildMapOverlaysData } from '../../../../mapLayers.js';
import { updateOverlaysLabel } from "../../../../helpers/layersControl.js";




const wirelessMap = ({ adminUser, instance }) => {

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

    const createWirelessLayer = async (title, lineColor, wirelessDataset) => {
        let pane = instance.map.getPane(title);
        if (!pane) {
            pane = instance.map.createPane(title);
            pane.style.zIndex = 400;
        }
        const response = createMaskCanvas(
            {
                pane,
                markerShape: 'SQUARE',
                heatMapDataKey: 'coverage_score',
                heatMapObject: {
                    "5": "#003300",
                    "4": "#008000",
                    "3": "#00cc00",
                    "2": "#ffff00",
                    "1": "#e6b800"
                },
                heatMapActivationZoomLevel: 10,
                markerSizeOffsetFromZoomValue: -2,
                lineColor,
                lineWidth: 4,
                minZoomBorderVisibility: 12,
                maxZoomBorderVisibility: 20
            }, {
            title,
            isDefault: 1,
            minZoomVisibility: 1,
            maxZoomVisibility: 20,
            markerType: 'wireless'
        },
            wirelessDataset);
        return response;
    }

    const createWirelessLayers = async layerControl => {
        const campaignLayerLineColors = {
            "1-29918786310": "#0000ff",
            "1-29985573337": "#ff0000",
            "1-28585961300": "#87cefa",
            "1-31465898167": "#076cab",
            "1-31465898230": "#990000",
            "1-31465898283": "#032e49",
            "1-31465898296": "#000000",
            "1-31465898369": "#808080",
            "1-31465898442": "#ff7f00",
            "1-31609052529": "#008000",
            "1-31465898141": "#26a26a",
            "1-31465898154": "#a3a3a3",
            "1-31465898068": "#67b67b",
            "1-31465898088": "#3366ff",
            "1-33735165693": "#4363d8", /*start of 2T21*/
            "1-33735165652": "#3cb44b",
            "1-33735165636": "#ffe119",
            "1-33735165719": "#a9a9a9",
            "1-33735165667": "#469990",
            "1-33761622514": "#42d4f4",
            "1-33735165706": "#f032e6",
            "1-35275858218": "#808080" /*end of 2T21*/
        };
        let wirelessOverlays = {};
        const dataGroupedByCampaigns = R.groupBy(R.prop('campaign_id'), instance.mapData);
        const campaigns = R.keys(dataGroupedByCampaigns);
        for (let i = 0; i < campaigns.length; i += 1) {
            const wirelessLayer = (await createWirelessLayer(campaigns[i], campaignLayerLineColors[campaigns[i]], dataGroupedByCampaigns[campaigns[i]])).canvasLayer;
            instance.map.addLayer(wirelessLayer);
            /* layerControl.addOverlay(wirelessLayer, campaigns[i] === "1-29918786310" ? "3T20 Acquire Mobility White Space"
                : campaigns[i] === "1-29985573337" ? "3T20 Acquire Mobility Port Outs"
                    : campaigns[i] === "1-28585961300" ? "Acquire Mobility Whitespace"
                        : campaigns[i] === "1-31465898167" ? "1T21 Grow Mobility Top ARPU"
                            : campaigns[i] === "1-31465898230" ? "1T21 Grow Mobility Top TBR"
                                : campaigns[i] === "1-31465898283" ? "1T21 Grow Mobility Top Integrated subs"
                                    : campaigns[i] === "1-31465898296" ? "1T21 Grow Mobility Top Data subs"
                                        : campaigns[i] === "1-31465898369" ? "1T21 Grow Mobility Top Voice subs"
                                            : campaigns[i] === "1-31465898442" ? "1T21 Grow Mobility Top Potential CRU"
                                                : campaigns[i] === "1-31609052529" ? "1T21 Grow Mobility 3G Shutdown"
                                                    : campaigns[i] === "1-31465898141" ? "1T21 Acquire Mobility existing Wireline"
                                                        : campaigns[i] === "1-31465898154" ? "1T21 Acquire Mobility Port Outs"
                                                            : campaigns[i] === "1-31465898068" ? "1T21 Acquire Mobility New Logo"
                                                                : campaigns[i] === "1-31465898088" ? "1T21 Grow Mobility Post COVID"
                                                                    : campaigns[i] === "1-33735165693" ? "2T21 Grow Mobility Add A Line"
                                                                        : campaigns[i] === "1-33735165652" ? "2T21 Acquire Mobility Existing Wireline"
                                                                            : campaigns[i] === "1-33735165636" ? "2T21 Acquire Mobility Port Outs"
                                                                                : campaigns[i] === "1-33735165719" ? "2T21 Acquire Mobility Fiber Fast Follow"
                                                                                    : campaigns[i] === "1-33735165667" ? "2T21 Acquire Mobility New Logo"
                                                                                        : campaigns[i] === "1-33761622514" ? "2T21 Grow Top Mobility"
                                                                                            : campaigns[i] === "1-33735165706" ? "2T21 Grow FAN Fast Follow"
                                                                                                : "Unknown"); */
            wirelessOverlays[campaigns[i] === "1-29918786310" ? "3T20 Acquire Mobility White Space"
                : campaigns[i] === "1-29985573337" ? "3T20 Acquire Mobility Port Outs"
                    : campaigns[i] === "1-28585961300" ? "Acquire Mobility Whitespace"
                        : campaigns[i] === "1-31465898167" ? "1T21 Grow Mobility Top ARPU"
                            : campaigns[i] === "1-31465898230" ? "1T21 Grow Mobility Top TBR"
                                : campaigns[i] === "1-31465898283" ? "1T21 Grow Mobility Top Integrated subs"
                                    : campaigns[i] === "1-31465898296" ? "1T21 Grow Mobility Top Data subs"
                                        : campaigns[i] === "1-31465898369" ? "1T21 Grow Mobility Top Voice subs"
                                            : campaigns[i] === "1-31465898442" ? "1T21 Grow Mobility Top Potential CRU"
                                                : campaigns[i] === "1-31609052529" ? "1T21 Grow Mobility 3G Shutdown"
                                                    : campaigns[i] === "1-31465898141" ? "1T21 Acquire Mobility existing Wireline"
                                                        : campaigns[i] === "1-31465898154" ? "1T21 Acquire Mobility Port Outs"
                                                            : campaigns[i] === "1-31465898068" ? "1T21 Acquire Mobility New Logo"
                                                                : campaigns[i] === "1-31465898088" ? "1T21 Grow Mobility Post COVID"
                                                                    : campaigns[i] === "1-33735165693" ? "2T21 Grow Mobility Add A Line"
                                                                        : campaigns[i] === "1-33735165652" ? "2T21 Acquire Mobility Existing Wireline"
                                                                            : campaigns[i] === "1-33735165636" ? "2T21 Acquire Mobility Port Outs"
                                                                                : campaigns[i] === "1-33735165719" ? "2T21 Acquire Mobility Fiber Fast Follow"
                                                                                    : campaigns[i] === "1-33735165667" ? "2T21 Acquire Mobility New Logo"
                                                                                        : campaigns[i] === "1-33761622514" ? "2T21 Grow Top Mobility"
                                                                                            : campaigns[i] === "1-33735165706" ? "2T21 Grow FAN Fast Follow"
                                                                                                : campaigns[i] === "1-35275858218" ? "2T21 Grow Mobility Voice"
                                                                                                    : "Unknown"] = wirelessLayer;
        }
        return wirelessOverlays;
    }

    const createMapLayers = async () => {

        const wirelessOverlays = await createWirelessLayers();
        const storeOverlays = await createStoreLayers();

        let overlays = {};
        overlays = Object.assign(storeOverlays, wirelessOverlays);
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

export default wirelessMap;

