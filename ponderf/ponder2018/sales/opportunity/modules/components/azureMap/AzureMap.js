import { html } from "lit-element";
import * as atlas from 'azure-maps-control';
import mapTemplate from "../../../templates/components/azureMap.js";
import PonderComponent from "../PonderComponent";
import { config } from "./derivations/mainMap/config/config.js";
import { clicked as psaClicked } from "../../markerTypes/psa.js";
import { clicked as addressClicked } from "../../markerTypes/address.js";
import { clicked as mduClicked } from "../../markerTypes/mdu.js";

//imgUrl: "assets/images/Ellipse-Outline.png",
    //imgUrl: "assets/images/Rectangle.png",
        //imgUrl: "assets/images/Ellipse.png",
    //        imgUrl: "assets/images/Triangle.png",
    //imgUrl: "assets/images/Rectangle-ACC.png",

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

const triangleSvg = `<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="32px" height="26px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">
<g><path style="opacity:0.936" fill="{color}" d="M 14.5,-0.5 C 15.1667,-0.5 15.8333,-0.5 16.5,-0.5C 21.0135,7.87253 26.0135,15.8725 31.5,23.5C 31.5,24.1667 31.5,24.8333 31.5,25.5C 20.8333,25.5 10.1667,25.5 -0.5,25.5C -0.5,24.8333 -0.5,24.1667 -0.5,23.5C 4.98655,15.8725 9.98655,7.87253 14.5,-0.5 Z"/></g>
</svg>`;

const accRectangleSvg = `<svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="31px" height="31px" style="shape-rendering:geometricPrecision; text-rendering:geometricPrecision; image-rendering:optimizeQuality; fill-rule:evenodd; clip-rule:evenodd" xmlns:xlink="http://www.w3.org/1999/xlink">
<g><path style="opacity:1" fill="{color}" d="M 2.5,2.5 C 10.8333,2.5 19.1667,2.5 27.5,2.5C 27.5,10.8333 27.5,19.1667 27.5,27.5C 19.1667,27.5 10.8333,27.5 2.5,27.5C 2.5,19.1667 2.5,10.8333 2.5,2.5 Z"/></g>
</svg>`;

//Add a custom template for ellipse-outline image to atlas namespace.
atlas.addImageTemplate('ellipse-outline', ellipseOutlineSvg);
// Add a custom template for rectangle image to atlas namespace.
atlas.addImageTemplate('ponder-rectangle', rectangleSvg);
//Add a custom template for ellipse image to atlas namespace.
atlas.addImageTemplate('ponder-ellipse', ellipseSvg);
//Add a custom template for ellipse image to atlas namespace.
atlas.addImageTemplate('ponder-triangle', triangleSvg);
//Add a custom template for ellipse image to atlas namespace.
atlas.addImageTemplate('ponder-acc-rectangle', accRectangleSvg);


class AzureMap extends PonderComponent {
    constructor() {
        super();
        this.map = null;
        this.mapData = null;
        this.hexGrid = null;
        this.pointData = null;
        //this.postData = {};
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
            this.map.remove();
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
                    if (url.includes('microsoft.com')) {
                        return {
                            url
                        };
                    }
                    instance.store.isMapLoading = true;
                    let urlWithSearchedParams = url;
                    if (instance.store.searchMode === 'zipSearch') {
                        urlWithSearchedParams = `${urlWithSearchedParams}${urlWithSearchedParams.includes('?') ? '&' : '?'}searchedZip=${instance.store.searchedZip}`;
                    }
                    if (instance.store.searchMode === 'countySearch') {
                        urlWithSearchedParams = `${urlWithSearchedParams}${urlWithSearchedParams.includes('?') ? '&' : '?'}searchedCounty=${instance.store.searchedCounty}`;
                    }
                    if (instance.store.searchMode === 'dmaSearch') {
                        urlWithSearchedParams = `${urlWithSearchedParams}${urlWithSearchedParams.includes('?') ? '&' : '?'}searchedDMA=${instance.store.searchedDMA}`;
                    }
                    if (!urlWithSearchedParams.includes('mapbox.com') && !urlWithSearchedParams.includes('maptiler.com')) {
                        return {
                            url: urlWithSearchedParams,
                            headers: { 'Authorization': $('#hdnToken').val() }
                        };
                    }
                    else {
                        return {
                            url: urlWithSearchedParams,
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

        this.map.events.add("ready", async e => {
            if (eventHandlers && eventHandlers.ready) {
                await eventHandlers.ready(e);
            }
        });

        this.map.events.add("sourcedata", async e => {
            if (eventHandlers && eventHandlers.sourcedata) {
                await eventHandlers.sourcedata(e);
            }
        });

        this.map.events.add("sourcedataloading", async e => {
            if (eventHandlers && eventHandlers.sourcedataloading) {
                await eventHandlers.sourcedataloading(e);
            }
        });

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
            this.store.currentZoom = this.map.getCamera().zoom;
        });

        this.map.events.add("click", async e => {
            if (eventHandlers && eventHandlers.click) {
                //await eventHandlers.click(e);
            }
        });

        this.map.events.add("load", async () => {
            if (this.derivedClass && this.derivedClass.createMapLayers) {
                await this.derivedClass.createMapLayers();
            }
            // map resize when panel opens/closes ... map needs to calculate height of parent
            $(".panel-toggle-button").on('click', () => this.map.resize())
        });
    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        $(document).off().on('click', '.message .mapPopup.close', function () {
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
            instance.stateManager.subscribe("renderMap", async d => {
                if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
                await instance.renderMap();
            })
        );
        instance.appendSubscription(
            instance.stateManager.subscribe("zoomToPoint", async d => {                
                if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
                // d is an object with keys - lat, lng, zoom, addMarker
                if (instance.map) {
                    /*instance.map.jumpTo({ center: [d.lng, d.lat], zoom: d.zoom });*/
                    instance.map.setCamera({
                        center: [parseFloat(d.lng), parseFloat(d.lat)],
                        zoom: d.zoom,
                        type: 'jump'
                    });

                    if (d.addMarker) {
                        //const marker = new maplibregl.Marker()
                        //    .setLngLat([d.lng, d.lat])
                        //    .addTo(instance.map);                        
                        const marker = new atlas.HtmlMarker({
                            color: 'DodgerBlue',
                            position: [parseFloat(d.lng), parseFloat(d.lat)]
                        });
                        instance.map.markers.add(marker);

                        // remove added marker on click
                        instance.map.events.add('click', marker, () => {                            
                            instance.map.markers.remove(marker);
                            // decrement mapMarkerCount
                            instance.store.mapMarkerCount = instance.store.mapMarkerCount - 1;
                            // if no markers hide the clearMapMarkers button
                            if (instance.store.mapMarkerCount <= 0) {
                                // hide the clearMapMarkers button
                                $('#btnClearMapMarkers').addClass('ponderHidden');
                            }
                        });
                        // increment mapMarkerCount
                        instance.store.mapMarkerCount = instance.store.mapMarkerCount + 1;
                        // show the clearMapMarkers button 
                        $('#btnClearMapMarkers').removeClass('ponderHidden');
                    }
                    // wait for a sec to allow the map to jumpTo specific zoom level
                    setTimeout(async () => {
                        //instance.store.currentZoom = instance.map.style.z;
                        instance.store.currentZoom = instance.map.getCamera().zoom;
                        if (d.markerData) {
                            const { type, id, coordinates } = d.markerData;
                            if (type == 'psa')
                                await psaClicked(instance, coordinates, id);
                            else if (type == 'address')
                                await addressClicked(instance, coordinates, id);
                            else if (type == 'mdu')
                                await mduClicked(instance, coordinates, id);
                            else
                                return;
                        }
                    }, 1000);
                }
            })
        );

        instance.stateManager.subscribe("clearMapMarkers", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            // remove all map markers
            $('.mapboxgl-marker').remove();
            // reset mapMarkerCount to zero
            instance.store.mapMarkerCount = 0;
            // hide the clearMapMarkers button
            $('#btnClearMapMarkers').addClass('ponderHidden');
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
        this.store.zoomIn = () => this.map.setCamera({ zoom: this.map.getCamera().zoom + 1 });
        this.store.zoomOut = () => this.map.setCamera({ zoom: this.map.getCamera().zoom - 1 });
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