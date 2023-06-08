import { html } from 'lit-element';
import Papa from 'papaparse';
import * as R from 'ramda';
import { saveAs } from 'file-saver';
import mapTemplate from '../../../templates/components/map.js';
import { createMaskCanvas } from '../../createMaskCanvas.js';
import {  getBaseLayers, getOverlayLayers, resetOverlayLayers, resetMapOverlaysData, rebuildMapOverlaysData } from '../../mapLayers.js';
import {  createMap } from '../../createMap.js';
import { updateOverlaysLabel } from "../../helpers/layersControl.js";
import PonderComponent from '../PonderComponent';
import { buildPayloadFromStore } from "../../helpers/remoteData.js";
import { closest, closestByRadius } from '../../closestLocation.js';
import * as markerTypes from "../../markerTypes/index.js";
import { getMapOverlaysData } from '../../mapLayers.js';


class Map extends PonderComponent {


    constructor() {
        super();
        this.map = null;
        this.mapData = null;
        this.storeData = null;
        this.maskCanvasLayer = null;
        this.maskCanvasData = null;
        this.id = '';
        this.derivation = null;
        this.derivedClass = null;
        this.zoomToPointMarker = null;
    }

    // declare properties and map it from attribute values
    static get properties() { 
        return { 
          id: { 
              attribute: 'mapid'
            },
          derivation: {
                attribute: 'derivation',
                type: String
            }
      }
    }



async renderMap() {
    if (this.map) {
        this.map.off();
        this.map.remove();
    }
    const eventHandlers = this.derivedClass && this.derivedClass.eventHandlers ? this.derivedClass.eventHandlers : null;
    this.map = await createMap({
        id: this.id, eventHandlers, toolConfig: this.store.config,
        currentMapZoom: this.store.currentMapZoom,
        currentMapCenter: this.store.currentMapCenter
    });
    if (this.mapData && (this.mapData.length || this.mapData.features) ) {
        if (this.derivedClass && this.derivedClass.createMapLayers) {
            await this.derivedClass.createMapLayers();
        }
    }
    this.map.invalidateSize();
}



    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {
        const instance = this;
        instance.appendSubscription(instance.stateManager.subscribe("exportMapData",
            async d => {
                if (instance.mapData) {
                    if (window.Worker) {
                        $('body')
                            .toast({
                                class: 'success',
                                showIcon: 'arrow circle down',
                                displayTime: 5000,
                                message: 'Your file is being generated and will be downloaded when ready. You can continue to use the application'
                            });
                        const fetchDataWorker = new Worker("modules/components/map/derivations/fetchAllDataWorker.js");
                        fetchDataWorker.postMessage({
                            postData: Object.assign(buildPayloadFromStore(instance), {
                                limit: instance.mapData.length, buildSortColumns: false,
                                sortCriteria: instance.store.config.startingSortCriteria
                            }),
                            baseUrl: instance.store.config.baseUrl
                        });

                        fetchDataWorker.onmessage = function (e) {
                            const csv = Papa.unparse(R.map(item => R.omit(instance.store.config.dataTableExportOmitKeys || [], item), e.data));
                            // const csv = Papa.unparse(e.data);
                            const blob = new Blob([csv], { type: "text/plain;charset=utf-8" });
                            saveAs(blob, "ALL_Exported_Data.csv");
                            $('body')
                                .toast({
                                    class: 'success',
                                    showIcon: 'arrow circle down',
                                    displayTime: 5000,
                                    message: 'Your file has been generated '
                                });
                        }
                    }
                }

            }));
        instance.appendSubscription(instance.stateManager.subscribe("renderMap",
            async d => {
                if (d) {
                    await instance.renderMap();
                }

            }));
        instance.appendSubscription(instance.stateManager.subscribe("zoomToPoint",
            async d => {
                // d is an array [lat, lng, currentdatetimestring]
                if (instance.map) {
                    instance.map.closePopup();
                    if (instance.zoomToPointMarker) {
                        instance.zoomToPointMarker.remove();
                    }
                    const add1 = .01;
                    const nelat = Number(d[0]);
                    const nelng = Number(d[1]);
                    const nelat1 = nelat + add1;
                    const nelng1 = nelng + add1;
                    const swlat = Number(d[0]);
                    const swlng = Number(d[1]);
                    const swlat1 = swlat - add1;
                    const swlng1 = swlng - add1;
                    const southWest = new L.LatLng(swlat1, swlng1);
                    const northEast = new L.LatLng(nelat1, nelng1);
                    const bounds = new L.LatLngBounds(southWest, northEast);
                    instance.map.fitBounds(bounds, { padding: [.05, .05] });
                    let pane = instance.map.getPane('zoomToPointMarkerPane');
                    if (!pane) {
                        pane = instance.map.createPane('zoomToPointMarkerPane');
                        pane.style.zIndex = 500;
                    }
                    instance.zoomToPointMarker = L.circleMarker([d[0], d[1]], { radius: 5, color: '#ff0000', pane }).addTo(instance.map);
                    const closestLocation = closest(instance.map.getZoom(), d[0], d[1], getMapOverlaysData());
                    if (closestLocation) {
                        markerTypes[closestLocation.p.markerType].clicked(instance.map, closestLocation, instance.store.config);
                    }
                    setTimeout(() => instance.zoomToPointMarker.remove(), 3000);
                }
            }
        ));


        instance.derivedClass && instance.derivedClass.initSubscriptions ? await instance.derivedClass.initSubscriptions() : null;
    }



    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.initSubscriptions();

    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.attachEventHandlers();
        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;
    }



    // render the html from the template in the DOM  
    render() {
        return html`${mapTemplate({id: this.id})}`
    }






  }

  customElements.define('ponder-map', Map);

export default Map;