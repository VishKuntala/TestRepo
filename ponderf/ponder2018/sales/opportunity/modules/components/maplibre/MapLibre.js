import { html } from "lit-element";
import maplibregl from "maplibre-gl";
import mapTemplate from "../../../templates/components/mapLibre.js";
import PonderComponent from "../PonderComponent";
import { config } from "./derivations/mainMap/config/config.js";
import { clicked as psaClicked } from "../../markerTypes/psa.js";
import { clicked as addressClicked } from "../../markerTypes/address.js";
import { clicked as mduClicked } from "../../markerTypes/mdu.js";

class MapLibre extends PonderComponent {
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
        this.map = new maplibregl.Map(
            Object.assign(
                {
                    container: `${this.id}`,
                    accessToken: this.mapBoxKey,
                    transformRequest: function (url, resourceType) {
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
                            return { url: urlWithSearchedParams };
                        }
                    }
                },
                mapOptions
            )
        );

        this.map.on("sourcedata", async e => {
            if (eventHandlers && eventHandlers.sourcedata) {
                await eventHandlers.sourcedata(e);
            }
        });

        this.map.on("sourcedataloading", async e => {
            if (eventHandlers && eventHandlers.sourcedataloading) {
                await eventHandlers.sourcedataloading(e);
            }
        });

        this.map.on("zoomend", async e => {
            if (eventHandlers && eventHandlers.zoomend) {
                await eventHandlers.zoomend(e);
            }
        });

        this.map.on("moveend", async e => {
            if (eventHandlers && eventHandlers.moveend) {
                await eventHandlers.moveend(e);
            }
        });

        this.map.on("zoom", async e => {
            this.store.currentZoom = this.map.style.z
            
        });

        this.map.on("click", async e => {
            if (eventHandlers && eventHandlers.click) {
                await eventHandlers.click(e);
            }
        });

        this.map.on("load", async () => {
            if (this.derivedClass && this.derivedClass.createMapLayers) {
                await this.derivedClass.createMapLayers();
            }
            // map resize when panel opens/closes ... map needs to calculate height of parent
            $(".panel-toggle-button").on('click', () => this.map.resize())
        });
    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
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
                    instance.map.jumpTo({ center: [d.lng, d.lat], zoom: d.zoom });
                    if (d.addMarker) {
                        const marker = new maplibregl.Marker()
                            .setLngLat([d.lng, d.lat])
                            .addTo(instance.map);
                        // remove added marker on click
                        marker.getElement().addEventListener("click", () => {
                            marker.remove();
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
                        instance.store.currentZoom = instance.map.style.z;
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
        this.store.zoomIn = () => this.map.zoomIn();
        this.store.zoomOut = () => this.map.zoomOut();
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

customElements.define("ponder-maplibre", MapLibre);

export default MapLibre;