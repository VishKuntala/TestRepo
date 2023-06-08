
import { updateOverlaysLabel } from "./helpers/layersControl.js";

const MIN_ZOOM_LEVEL = 0;
const MAX_ZOOM_LEVEL = 99;

let baseLayers = [];
let overLays = [];
let mapOverlaysData = [];

const addBaseLayer = (layer, title, isDefault, minZoomVisibility, maxZoomVisibility) => 
        baseLayers.push({layer, title, minZoomVisibility, maxZoomVisibility, isDefault});

const getBaseLayers = () => R.zipObj(R.pluck('title', baseLayers), R.pluck('layer', baseLayers));

const addOverlayLayer = (layer, canvasData, title, isDefault, minZoomVisibility, maxZoomVisibility) => {
    overLays = R.filter( l => l.title !== title, overLays);
    overLays.push({layer, canvasData, title, minZoomVisibility, maxZoomVisibility, isDefault});
}
        

const getOverlayLayers = () => R.zipObj(R.pluck('title', overLays), R.pluck('layer', overLays));

const resetOverlayLayers = () => overLays = [];

const resetBaseLayers = () => baseLayers = [];

const resetMapOverlaysData = () => mapOverlaysData = [];

const rebuildMapOverlaysData = map => {
    mapOverlaysData = [];
    const overlays = getOverlays();
    for (let i = 0; i < overlays.length; i += 1){
        if (map.hasLayer(overlays[i].layer)) {
            mapOverlaysData = R.concat(mapOverlaysData,overlays[i].canvasData);
        } 
    }

}

const getOverlays = () => overLays;

const getMapOverlaysData = () => mapOverlaysData;

    
const getDefaultLayers = () => 
    R.compose(
    R.pluck('layer'),    
    R.filter( item => item.isDefault === 1)
    )(R.concat(baseLayers, overLays));

const showHideLayers = map => {
    const zoomLevel = map.getZoom();
    const overlays = getOverlays();
    for (let i = 0; i < overlays.length; i += 1){
            if (
                (overlays[i].minZoomVisibility || MIN_ZOOM_LEVEL ) <= zoomLevel &&
                zoomLevel <= (overlays[i].maxZoomVisibility || MAX_ZOOM_LEVEL)
            ) {
                if (!map.hasLayer(overlays[i].layer)){
                    map.addLayer(overlays[i].layer);
                }
                
            } else {
                if (map.hasLayer(overlays[i].layer)) {
                    map.removeLayer(overlays[i].layer);
                } 
            }
        
    }
    mapOverlaysData = [];
    for (let i = 0; i < overlays.length; i += 1){
        if (map.hasLayer(overlays[i].layer)) {
            mapOverlaysData = R.concat(mapOverlaysData,overlays[i].canvasData);
        } 
    }
    updateOverlaysLabel();
}

const hideAllLayers = map => {
    const overlays = getOverlays();
    for (let i = 0; i < overlays.length; i += 1) {
        map.removeLayer(overlays[i].layer);
                
    }
    mapOverlaysData = [];
} 


export { addBaseLayer, 
        getBaseLayers, 
        addOverlayLayer, 
        getOverlayLayers, 
        getDefaultLayers, 
        getOverlays, 
        showHideLayers, 
        getMapOverlaysData,
        resetOverlayLayers,
        resetBaseLayers,
        resetMapOverlaysData,
        rebuildMapOverlaysData,
        hideAllLayers
     };
