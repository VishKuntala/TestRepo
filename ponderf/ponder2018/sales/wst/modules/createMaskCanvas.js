import {  addOverlayLayer } from './mapLayers.js';
import maskCanvas from './L.GridLayer.MaskCanvas.js';

const MIN_ZOOM_LEVEL = 0;
const MAX_ZOOM_LEVEL = 99;

const formatDataForCanvas = (data, markerType) => {
    // if the features property exists, this is a geojson file
    /* if (data.features) {
        return R.map( feature => { 
            return {
                latlng: [feature.geometry.coordinates[1], feature.geometry.coordinates[0]],
                lat: feature.geometry.coordinates[1],
                lng: feature.geometry.coordinates[0],    
                p: R.merge(feature.properties, { markerType })
            }; 
        }, data.features);
    } */
    if (data.features) {
        return R.map(feature => {
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
            latlng: [datarow.LATITUDE || datarow.latitude, datarow.LONGITUDE || datarow.longitude],
            lat: datarow.LATITUDE || datarow.latitude,
            lng: datarow.LONGITUDE || datarow.longitude ,
            p: R.merge(R.omit(['LATITUDE', 'LONGITUDE', 'latitude', 'longitude'], datarow), { markerType })
        }; 
    }, data);

}

const setMaskCanvasData = (canvasLayer, data, markerType) => {
    const canvasData = formatDataForCanvas(data, markerType);
    const latlngSet = R.pluck('latlng', canvasData);
    const propertySet = R.pluck('p', canvasData);
    canvasLayer.setData(latlngSet, propertySet);
}

const createMaskCanvas = (canvasOptions, layerOptions, data) => {
    const canvasLayer = maskCanvas(canvasOptions);
    let canvasData = [];
    if (data && (data.length || data.features)) {
        canvasData = formatDataForCanvas(data, layerOptions.markerType);
        const latlngSet = R.pluck('latlng', canvasData);
        const propertySet = R.pluck('p', canvasData);
        canvasLayer.setData(latlngSet, propertySet);
    }
    addOverlayLayer(canvasLayer, canvasData, 
                    layerOptions.title || '-NA-', 
                    layerOptions.isDefault || 0, 
                    layerOptions.minZoomVisibility,
                    layerOptions.maxZoomVisibility,
                    layerOptions.showHideOnZoom
    );
    return { canvasLayer, canvasData};
}


export { createMaskCanvas, setMaskCanvasData };


