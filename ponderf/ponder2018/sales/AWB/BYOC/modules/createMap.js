import {  getBaseLayers, getOverlayLayers, getDefaultLayers, showHideLayers, getMapOverlaysData, 
    getOverlayLayer, getOverlays, resetMapOverlaysData,debouncedHideAllLayers,
    rebuildMapOverlaysData, hideAllLayers, debouncedShowHideLayers, addBaseLayer, resetOverlayLayers,
    resetBaseLayers
} from './mapLayers.js';
import { closest, closestByRadius } from './closestLocation.js';
import { psaClickHandler, onAirClickHandler } from './canvasLayerClickHandlers/index.js';
import * as markerTypes from "./markerTypes/index.js";
import { updateOverlaysLabel } from "./helpers/layersControl.js";

const MIN_ZOOM_LEVEL = 0;
const MAX_ZOOM_LEVEL = 99;




const createMap = async (options) => {
    resetBaseLayers();
    resetOverlayLayers();
    resetMapOverlaysData();
    const sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
        id: 'arcgis.sat',
        maxZoom: 19,
        zIndex: 1,
        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
        subdomains: ['a', 'b', 'c']
    });
    
    const streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        id: 'osm.streets',
        maxZoom: 19,
        zIndex: 1,
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
        subdomains: ['a', 'b', 'c']
    });

    addBaseLayer(sat, 'Satellite', 0);
    addBaseLayer(streets, 'Streets', 1);

    
    const map = L.map(options.id,{
        attributionControl: false,
        preferCanvas: true,
        center: [39.73, -104.99],
        zoom: 10,
        minZoom: 3,
        layers: getDefaultLayers(),
        fullscreenControl: true,
        fullscreenControlOptions: {
            position: 'topleft'
        }
    }
    ).setView([37.8, -96], 4);
    
                    

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1Ijoibm11cmxpIiwiYSI6ImNreTA4OTIwcTAxYXYydXBibmNnaXl2c3MifQ.zV5Xi3RHyLfmm2P56UWWZw', {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
    '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
    'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    id: 'mapbox/light-v9',
    tileSize: 512,
    zoomOffset: -1
    }).addTo(map);


    map.on("zoomend", function(e) { 
        showHideLayers(map);
    });

    map.on("zoomstart", function(e) { 
        
    });
    

    map.on('popupopen', function (e) {
        
    });

    map.on('overlayremove', function(e){
        //close open popup
        map.closePopup();
        // reset data needed for the closest function
        rebuildMapOverlaysData(map);
    });

    map.on('overlayadd', function (e) {
        // reset data needed for the closest function
        rebuildMapOverlaysData(map);
        updateOverlaysLabel();
    });

    map.on('click', async function (e) {
        const market = null;
        const groupBy = null;
        const closestLocation = closest(this.getZoom(), e.latlng.lat, e.latlng.lng, getMapOverlaysData());
        if (closestLocation) {
            markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, groupBy);
        }
        
    } );

    return map;
}


export { createMap };
