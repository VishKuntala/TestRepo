import { addOverlayLayer } from './mapLayers.js';
import maskCanvas from './L.GridLayer.MaskCanvas.js';

const MIN_ZOOM_LEVEL = 0;
const MAX_ZOOM_LEVEL = 99;

const formatDataForCanvas = (data, markerType, clickPriority, minZoomVisibility, maxZoomVisibility) => {
    // if the features property exists, this is a geojson file
    if (data.features) {
        return R.map(feature => {
            return {
                latlng: [feature.properties.LATITUDE, feature.properties.LONGITUDE],
                lat: feature.properties.LATITUDE,
                lng: feature.properties.LONGITUDE,
                p: R.merge(feature.properties, { markerType, clickPriority, minZoomVisibility, maxZoomVisibility, 
                    coPsa: R.drop(5,feature.properties.ZIP_CO_PSA || '') })
            };
        }, data.features);
    }
    // else this is a normal dataset with flat rows
    // Assumption: the dataset contains the columns LATITUDE and LONGITUDE
    return R.map(datarow => {
        return {
            latlng: [datarow.LATITUDE, datarow.LONGITUDE],
            lat: datarow.LATITUDE,
            lng: datarow.LONGITUDE,
            p: R.merge(R.omit(['LATITUDE', 'LONGITUDE'], datarow), { markerType, clickPriority, minZoomVisibility, maxZoomVisibility, 
                coPsa: R.drop(5,datarow.ZIP_CO_PSA || '') })
        };
    }, data);

}

const createMaskCanvas = (canvasOptions, layerOptions, data) => {
    const canvasData = formatDataForCanvas(data, layerOptions.markerType, 
        layerOptions.clickPriority || 0, layerOptions.minZoomVisibility || MIN_ZOOM_LEVEL, 
        layerOptions.maxZoomVisibility || MAX_ZOOM_LEVEL);
    const canvasLayer = maskCanvas(canvasOptions);
    const latlngSet = R.pluck('latlng', canvasData);
    const propertySet = R.pluck('p', canvasData);
    canvasLayer.setData(latlngSet, propertySet);
    addOverlayLayer(canvasLayer, canvasData,
        layerOptions.title || '-NA-',
        layerOptions.isDefault || 0,
        layerOptions.minZoomVisibility,
        layerOptions.maxZoomVisibility,
        layerOptions.showHideOnZoom);
    return { canvasLayer, canvasData };
}


export default createMaskCanvas;


