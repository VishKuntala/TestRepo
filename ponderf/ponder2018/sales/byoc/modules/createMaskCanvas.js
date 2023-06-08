import {  addOverlayLayer } from './mapLayers.js';
import maskCanvas from './L.GridLayer.MaskCanvas.js';

const formatDataForCanvas = (data, markerType) => {
    // if the features property exists, this is a geojson file
    if (data.features) {
        return R.map( feature => { 
            return {
                latlng: [feature.properties.LATITUDE, feature.properties.LONGITUDE],
                lat: feature.properties.LATITUDE,
                lng: feature.properties.LONGITUDE,    
                p: R.merge(feature.properties, { markerType })
            }; 
        }, data.features);
    }
    // else this is a normal dataset with flat rows
    // Assumption: the dataset contains the columns LATITUDE and LONGITUDE
    return R.map( datarow => { 
        return {
            latlng: [datarow.LATITUDE, datarow.LONGITUDE],
            lat: datarow.LATITUDE,
            lng: datarow.LONGITUDE,
            p: R.merge(R.omit(['LATITUDE', 'LONGITUDE'], datarow), { markerType })
        }; 
    }, data);

}

const createMaskCanvas = (canvasOptions, layerOptions, data) => {
    const canvasData = formatDataForCanvas(data, layerOptions.markerType);
    const canvasLayer = maskCanvas(canvasOptions);
    const latlngSet= R.pluck('latlng', canvasData);
    const propertySet = R.pluck('p', canvasData);
    canvasLayer.setData(latlngSet, propertySet);
    addOverlayLayer(canvasLayer, canvasData, 
                    layerOptions.title || '-NA-', 
                    layerOptions.isDefault || 0, 
                    layerOptions.minZoomVisibility,
                    layerOptions.maxZoomVisibility);
    return { canvasLayer, canvasData};
}


export default createMaskCanvas;


