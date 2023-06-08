import { html } from "lit-element";
import maplibregl from "maplibre-gl";

import mapTemplate from "../../../templates/components/mapLibre.js";
import PonderComponent from "../PonderComponent";
import { config } from "./derivations/mainMap/config/config.js";

class MapLibre extends PonderComponent {
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
        this.map = new maplibregl.Map(
            Object.assign(
                {
                    container: `${this.id}`,
                    accessToken: this.mapBoxKey,
                    transformRequest: function (url, resourceType) {
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
                            return { url: urlWithSearchedZip };
                        }
                    }
                },
                mapOptions
            )
        );
        if (!this.popup) {
            this.popup = new maplibregl.Popup({
                maxWidth: "none",
                focusAfterOpen: false,
                closeButton: true,
                
            });
            this.popup.on('open', async function (e) {
                if (eventHandlers && eventHandlers.popupopen) {
                    await eventHandlers.popupopen(e);
                }
            });
        }

        if (!this.marker) {

            this.marker = new maplibregl.Marker({ draggable: true });
        }



        this.map.on("sourcedata", async e => {
            if (eventHandlers && eventHandlers.sourcedata) {
                await eventHandlers.sourcedata(e);
            }
        });

        this.map.on("error", async e => {
            if (eventHandlers && eventHandlers.error) {
                await eventHandlers.error(e);
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
            if (this.derivedClass && this.derivedClass.createMapLayers && this.store.config.loadDataOnChannelInit) {
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
        instance.appendSubscription(
            instance.stateManager.subscribe("zoomToPoint", async d => {
                // d is an object with keys - lat, lng, zoom, addMarker
                if (instance.map) {
                    instance.map.jumpTo({ center: [d.lng, d.lat], zoom: d.zoom || config.pointsLayers.WS_POINTS.minZoom });

                    if (d.addMarker) {
                        this.marker
                            .setLngLat([d.lng, d.lat])
                            .addTo(instance.map);

                        $(".maplibregl-marker").off().on('click', async function () {
                            instance.marker.remove();
                        });
                    }

                    if (d.addPoup) {
                        this.popup
                            .setLngLat([d.lng, d.lat])
                            .setHTML(instance.store.config.map.popupHtml(d))
                            .addTo(instance.map);
                    }

                    /* if (d.addMarker) {
                        new maplibregl.Marker()
                            .setLngLat([d.lng, d.lat])
                            .addTo(instance.map);
                    }
                    // wait for a sec to allow the map to jumpTo specific zoom level
                    setTimeout(() => {
                        instance.store.currentZoom = instance.map.style.z;
                    }, 1000); */
                }
            })
       
        );

        instance.stateManager.subscribe("openPopup", async d => {
            if (instance.map) {
                instance.popup
                    .setLngLat([d.lng, d.lat])
                    .setHTML(instance.store.config.map.popupHtml(d))
                    .addTo(instance.map);
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
        this.store.zoomIn = () => this.map.zoomIn();
        this.store.zoomOut = () => this.map.zoomOut();
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

customElements.define("ponder-maplibre", MapLibre);

export default MapLibre;