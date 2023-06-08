import { html } from "lit-element";
import * as atlas from 'azure-maps-control';

import mapTemplate from "../../../templates/components/azureMap.js";
import PonderComponent from "../PonderComponent";
import { config } from "./derivations/mainMap/config/config.js";

const ellipseSvg = `<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="28px" height="28px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">
<g><path style="opacity:0.961" fill="{color}" d="M 8.5,-0.5 C 11.8333,-0.5 15.1667,-0.5 18.5,-0.5C 22.5,1.5 25.5,4.5 27.5,8.5C 27.5,11.8333 27.5,15.1667 27.5,18.5C 25.5,22.5 22.5,25.5 18.5,27.5C 15.1667,27.5 11.8333,27.5 8.5,27.5C 4.5,25.5 1.5,22.5 -0.5,18.5C -0.5,15.1667 -0.5,11.8333 -0.5,8.5C 1.5,4.5 4.5,1.5 8.5,-0.5 Z"/></g>
</svg>`;

const ellipseOutlineSvg = `<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="32px" height="32px" 
style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" 
xmlns:xlink="http://www.w3.org/1999/xlink">
<g><path style="opacity:0.934" fill="{color}" d="M 9.5,-0.5 C 13.5,-0.5 17.5,-0.5 21.5,-0.5C 25.8333,1.83333 29.1667,5.16667 31.5,9.5C 31.5,13.5 31.5,17.5 31.5,21.5C 29.1667,25.8333 25.8333,29.1667 21.5,31.5C 17.5,31.5 13.5,31.5 9.5,31.5C 5.16667,29.1667 1.83333,25.8333 -0.5,21.5C -0.5,17.5 -0.5,13.5 -0.5,9.5C 1.83333,5.16667 5.16667,1.83333 9.5,-0.5 Z M 12.5,6.5 C 20.9863,6.1514 24.8197,10.1514 24,18.5C 21.6471,23.4264 17.8138,25.2598 12.5,24C 4.5548,18.1697 4.5548,12.3363 12.5,6.5 Z"/></g>
</svg>`;

const rectangleSvg = `<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="28px" height="28px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">
<g><path style="opacity:0.999" fill="{color}" d="M -0.5,-0.5 C 8.83333,-0.5 18.1667,-0.5 27.5,-0.5C 27.5,8.83333 27.5,18.1667 27.5,27.5C 18.1667,27.5 8.83333,27.5 -0.5,27.5C -0.5,18.1667 -0.5,8.83333 -0.5,-0.5 Z"/></g>
</svg>`;

  //Add a custom template for ellipse-outline image to atlas namespace.
  atlas.addImageTemplate('ellipse-outline', ellipseOutlineSvg);
  // Add a custom template for rectangle image to atlas namespace.
  atlas.addImageTemplate('ponder-rectangle', rectangleSvg);
  //Add a custom template for ellipse image to atlas namespace.
  atlas.addImageTemplate('ponder-ellipse', ellipseSvg);

class AzureMap extends PonderComponent {
    constructor() {
        super();
        this.map = null;
        this.popup = null;
        this.marker = null;
        this.mapData = null;
        this.hexGrid = null;
        this.pointData = null;
        this.postData = {};
        this.storeData = null;
        this.maskCanvasLayer = null;
        this.maskCanvasData = null;
        this.id = "";
        this.derivation = null;
        this.derivedClass = null;
        this.zoomToPointMarker = null;
        this.mapBoxKey = $("#hdnMapBoxKey").val();
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: "mapid",
            },
            derivation: {
                attribute: "derivation",
                type: String,
            },
        };
    }

    async renderMap() {
        if (this.map) {
            //this.map.remove();
            return;
        }
        const instance = this;
        const eventHandlers = this.derivedClass && this.derivedClass.eventHandlers ? this.derivedClass.eventHandlers : null;

        const mapOptions =
            this.derivedClass && this.derivedClass.mapOptions
                ? this.derivedClass.mapOptions
                : null;
        this.map = new atlas.Map(`${this.id}`, Object.assign(
            {
                language: 'en-US',
                authOptions: {
                    authType: 'subscriptionKey',
                    subscriptionKey: $("#hdnAzureMapKey").val()
                },        
                transformRequest: function (url, resourceType) {
                    instance.store.isMapLoading = true;
                    let urlWithSearchedZip = url;
                    if (instance.store.searchMode === 'zipSearch') {
                        urlWithSearchedZip = `${urlWithSearchedZip}${urlWithSearchedZip.includes('?') ? '&' : '?'}searchedZip=${instance.store.searchedZip}`;
                    }
                    if (!urlWithSearchedZip.includes('mapbox.com') && !urlWithSearchedZip.includes('maptiler.com')) {
                        return {
                            url: urlWithSearchedZip,
                            headers: { 'Authorization': $('#hdnToken').val() }
                        };
                    }
                    else {
                        return { 
                            url: urlWithSearchedZip,
                            headers: { 'Authorization': $('#hdnToken').val() }
                        };
                    }
                }
            },
            mapOptions
        ));      
        


        if (!this.popup) {
            this.popup = new atlas.Popup({
                closeButton: true
              });
              this.map.events.add('open', this.popup, 
                async function (e) {
                    if (eventHandlers && eventHandlers.popupopen) {
                        await eventHandlers.popupopen(e);
                    }
                });
        }

        if (!this.marker) {

            this.marker = new atlas.HtmlMarker({
                color: 'DodgerBlue',
            });
        }

        // this.map.events.add('ready', function () {

            //Add a custom template for ellipse-outline image to atlas namespace.
           // atlas.addImageTemplate('ellipse-outline', ellipseOutlineSvg);
            // Add a custom template for rectnagle image to atlas namespace.
           // atlas.addImageTemplate('ponder-rectangle', rectangleSvg);

        // });

        this.map.events.add("sourcedata", async e => {
            if (eventHandlers && eventHandlers.sourcedata) {
               await eventHandlers.sourcedata(e);
            }
        });

        this.map.events.add("error", async e => {
            if (eventHandlers && eventHandlers.error) {
                await eventHandlers.error(e);
            }
        });

        /* this.map.events.add("sourcedataloading", async e => {
            if (eventHandlers && eventHandlers.sourcedataloading) {
                await eventHandlers.sourcedataloading(e);
            }
        }); */

        this.map.events.add("zoomend", async e => {
            if (eventHandlers && eventHandlers.zoomend) {
                await eventHandlers.zoomend(e);
            }
        });

        this.map.events.add("moveend", async e => {
            if (eventHandlers && eventHandlers.moveend) {
                await eventHandlers.moveend(e);
            }
        });

        this.map.events.add("zoom", async e => {
            // this.store.currentZoom = this.map.style.z

        });

        this.map.events.add("click", async e => {
            if (eventHandlers && eventHandlers.click) {
                // await eventHandlers.click(e);
            }
        });

        this.map.events.add("load", async () => {
            if (this.derivedClass && this.derivedClass.createMapLayers && this.store.config.loadDataOnChannelInit) {
                await this.derivedClass.createMapLayers();
            }
            // map resize when panel opens/closes ... map needs to calculate height of parent
            $(".panel-toggle-button").on('click', () => this.map.resize())
        });
    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        $(document).off().on('click', '.message .mapPopup.close', function() {
            $(this)
              .closest('.message')
              .transition('fade')
            ;
          });
        this.derivedClass && this.derivedClass.attachEventHandlers
            ? await this.derivedClass.attachEventHandlers()
            : null;
    }

    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {
        const instance = this;
        instance.appendSubscription(
            instance.stateManager.subscribe("exportMapData", async d => { })
        );
        instance.appendSubscription(
            instance.stateManager.subscribe("renderMap", async d => {
                if (d && !R.is(Array, d)) {
                    instance.postData = d;
                    await instance.renderMap();
                }
            })
        );

            instance.stateManager.subscribe("zoomToPointLayer", async d => {
              if (instance.map) {
                    if (instance.popup.isOpen()) {
                        instance.popup.close();
                    }        
                    instance.map.setCamera( {
                            zoom : config.pointsLayers.WS_POINTS.minZoom
                        });
                }
            });
            instance.stateManager.subscribe("zoomToPoint", async d => {
                // d is an object with keys - lat, lng, zoom, addMarker
                if (instance.map) {
                    instance.map.setCamera( {center: [parseFloat(d.lng), parseFloat(d.lat)], 
                        zoom : d.zoom || config.pointsLayers.WS_POINTS.minZoom, 
                        type: 'jump'});
                    // instance.map.jumpTo({ center: [d.lng, d.lat], zoom: d.zoom || config.pointsLayers.WS_POINTS.minZoom });

                    if (d.addMarker) {
                        instance.map.markers.clear();
                        instance.map.markers.add(instance.marker, [parseFloat(d.lng), parseFloat(d.lat)]);
                        /*this.marker
                            .setLngLat([d.lng, d.lat])
                            .addTo(instance.map); */

                        instance.map.events.add('click', instance.marker, async function () {
                            instance.map.markers.clear();
                        });
                       /* $(".maplibregl-marker").off().on('click', async function () {
                            instance.marker.remove();
                        }); */
                    }

                    if (d.addPoup) {
                        if (this.popup.isOpen()) {
                            this.popup.close();
                        }
                        this.popup.setOptions({
                            content : `<div class="ui compact message">${instance.store.config.map.popupHtml(d)}</div>`,
                            position: [parseFloat(d.lng), parseFloat(d.lat)]
                        });
                        instance.popup.open(instance.map);
                        /* this.popup
                            .setLngLat([d.lng, d.lat])
                            .setHTML(instance.store.config.map.popupHtml(d))
                            .addTo(instance.map); */
                    }

                }
            });
       
        

        instance.stateManager.subscribe("openPopup", async d => {
            if (instance.map) {
                if (instance.popup.isOpen()) {
                    instance.popup.close();
                }
                instance.popup.setOptions({
                    content : `<div class="ui compact message">${instance.store.config.map.popupHtml(d)}</div>`,
                    position: [d.lng, d.lat]
                });
                instance.popup.open(instance.map);
            }

        });

        instance.derivedClass && instance.derivedClass.initSubscriptions
            ? await instance.derivedClass.initSubscriptions()
            : null;
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated(changedProperties) {
        const adminUser = $("#hdnViewerAttId").val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation
                }`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.initSubscriptions();
        this.derivedClass && this.derivedClass.firstUpdated
            ? await this.derivedClass.firstUpdated(changedProperties)
            : null;
        this.store.zoomIn = () => this.map.setCamera( {zoom : this.map.getCamera().zoom + 1});
        this.store.zoomOut = () => this.map.setCamera( {zoom : this.map.getCamera().zoom - 1});
        await this.renderMap();
    }

    // updated is called after the html is rendered on the DOM.
    async updated(changedProperties) {
        const adminUser = $("#hdnViewerAttId").val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation
                }`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.attachEventHandlers();
        this.derivedClass && this.derivedClass.updated
            ? await this.derivedClass.updated(changedProperties)
            : null;
    }

    // render the html from the template in the DOM
    render() {
        return html`${mapTemplate({ id: this.id })}`;
    }
}

customElements.define("ponder-azure-map", AzureMap);

export default AzureMap;