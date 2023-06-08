import { html } from "lit-element";
import * as R from "ramda";
import centroid from "@turf/centroid";
import $ from "jquery";
import ponderSearchTemplate from "../../../templates/components/search/ponderSearch/ponderSearch.js";
import PonderComponent from "../PonderComponent.js";
import { config } from "../azureMap/derivations/mainMap/config/config.js";

class PonderSearch extends PonderComponent {
    constructor() {
        super();
        this.id = "";
        this.defaultText = "";
        this.remoteUrl = null;
        this.derivation = null;
        this.derivedClass = null;
        this.searchMode = "addressSearch";
        this.searchConfig = {
            addressSearch: instance => {
                return {
                    saveRemoteData: false,
                    clearable: true,
                    placeholder: "Type an address...",
                    apiSettings: {
                        cache: false,
                        url: instance.remoteUrl,
                        beforeSend: settings => {
                            if (
                                instance.derivedClass &&
                                instance.derivedClass.buildQueryStringFromStore
                            ) {
                                settings.data = instance.derivedClass.buildQueryStringFromStore(
                                    true
                                );
                            }
                            return settings;
                        },
                        beforeXHR: xhr => {
                            xhr.setRequestHeader(
                                "Content-Type",
                                "application/json"
                            );
                            xhr.setRequestHeader(
                                "Authorization",
                                $("#hdnToken").val()
                            );
                        },
                        onResponse: function(response) {
                            const res = R.map(item => {
                                return {
                                    name: item.address.freeformAddress,
                                    value: `${item.position.lat}|${
                                        item.position.lon
                                    }`,
                                };
                            }, R.values(response));
                            return {
                                success: true,
                                results: res,
                            };
                        },
                    },
                    onChange: (value, text, $choice) => {
                        if (value === "") {
                            return;
                        }
                        instance.store.inSearchMode = true;
                        instance.store.searchMode = 'addressSearch';
                        const position = value.split("|");
                        instance.store.zoomToPoint = {
                            lat: parseFloat(position[0]),
                            lng: parseFloat(position[1]),
                            zoom: config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom,
                            addMarker: true,
                        };
                        
                    },
                    minCharacters: 10,
                };
            },
            psaSearch: instance => {
                return {
                    saveRemoteData: false,
                    clearable: true,
                    placeholder: "Type a PSA...",
                    apiSettings: {
                        cache: false,
                        url: instance.remoteUrl,
                        beforeSend: settings => {
                            if (
                                instance.derivedClass &&
                                instance.derivedClass.buildQueryStringFromStore
                            ) {
                                settings.data = instance.derivedClass.buildQueryStringFromStore(
                                    true
                                );
                            }
                            return settings;
                        },
                        beforeXHR: xhr => {
                            xhr.setRequestHeader(
                                "Content-Type",
                                "application/json"
                            );
                            xhr.setRequestHeader(
                                "Authorization",
                                $("#hdnToken").val()
                            );
                        },
                        onResponse: function(response) {
                            return {
                                success: true,
                                results: R.values(response),
                            };
                        },
                    },
                    onChange: (value, name) => {
                        if (value === "") {
                            return;
                        }
                        instance.store.searchMode = 'psaSearch';
                        instance.store.inSearchMode = true;
                        const position = value.split("|");                        
                        instance.store.zoomToPoint = {
                            lat: parseFloat(position[0]),
                            lng: parseFloat(position[1]),
                            zoom: config.heatmapLayers.CENSUS_BLOCK.minZoom, // zoom to census blocks level i.e 14
                            addMarker: false,
                            markerData: {
                                type: 'psa',
                                id: name,
                                coordinates: [parseFloat(position[1]), parseFloat(position[0])]
                            },
                        };
                    },
                    minCharacters: 5,
                };
            },
            zipSearch: instance => {
                return {
                    saveRemoteData: false,
                    clearable: true,
                    placeholder: "Type a ZIP code...",
                    apiSettings: {
                        cache: false,
                        url: instance.remoteUrl,
                        beforeSend: settings => {
                            if (
                                instance.derivedClass &&
                                instance.derivedClass.buildQueryStringFromStore
                            ) {
                                settings.data = instance.derivedClass.buildQueryStringFromStore(
                                    true
                                );
                            }
                            return settings;
                        },
                        beforeXHR: xhr => {
                            xhr.setRequestHeader(
                                "Content-Type",
                                "application/json"
                            );
                            xhr.setRequestHeader(
                                "Authorization",
                                $("#hdnToken").val()
                            );
                        },
                        onResponse: function(response) {
                            return {
                                success: true,
                                results: R.values(response),
                            };
                        },
                    },
                    onChange: async (value) => {
                        if (value === "" || instance.store.searchedZip === value) {
                            return;
                        }
                        instance.store.searchMode = 'zipSearch';
                        instance.store.inSearchMode = true;
                        instance.store.searchedZip = value;
                        const params = { zip: value };
                        const boundaryData = await instance.getData(
                            `${instance.store.baseApiUrl}/geodata/${instance.store.heatmap}/zipBoundary.geojson`,
                            params
                        );
                        const zipCenter = centroid(boundaryData);
                        instance.store.zoomToPoint = {
                            lat: zipCenter.geometry.coordinates[1],
                            lng: zipCenter.geometry.coordinates[0],
                            zoom: config.heatmapLayers.ZIP.minZoom,
                            addMarker: false,
                        };
                        instance.store.setBoundaryLayer = {
                            layerName: "ZIP_BOUNDARY",
                            featureCollection: boundaryData
                        };
                    },
                    minCharacters: 3,
                };
            },
            accSearch: instance => {
                return {
                    saveRemoteData: false,
                    clearable: true,
                    placeholder: "Type a Property ID or Name...",
                    apiSettings: {
                        cache: false,
                        url: instance.remoteUrl,
                        beforeSend: settings => {
                            if (
                                instance.derivedClass &&
                                instance.derivedClass.buildQueryStringFromStore
                            ) {
                                settings.data = instance.derivedClass.buildQueryStringFromStore(
                                    true
                                );
                            }
                            return settings;
                        },
                        beforeXHR: xhr => {
                            xhr.setRequestHeader(
                                "Content-Type",
                                "application/json"
                            );
                            xhr.setRequestHeader(
                                "Authorization",
                                $("#hdnToken").val()
                            );
                        },
                        onResponse: function (response) {
                            return {
                                success: true,
                                results: R.values(response),
                            };
                        },
                    },
                    onChange: (value) => {                        
                        if (value === "") {
                            return;
                        }
                        instance.store.searchMode = 'accSearch';
                        instance.store.inSearchMode = true;
                        const position = value.split("|");
                        instance.store.zoomToPoint = {
                            lat: parseFloat(position[0]),
                            lng: parseFloat(position[1]),
                            zoom: config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.minZoom,
                            addMarker: true,
                        };
                        setTimeout(() => {
                            //switch to accTableTab when acc property is searched after 2 seconds             
                            instance.store.switchToACCTableTab = `${Date.now().toString()}`;
                        }, 2000);
                    },
                    minCharacters: 1,
                };
            },
        };
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: "searchid",
                type: String,
            },
            defaultText: {
                attribute: "defaulttext",
                type: String,
            },
            searchMode: {
                attribute: "searchmode",
                type: String,
            },
            remoteUrl: {
                attribute: "remoteurl",
                type: String,
            },
            derivation: {
                attribute: "derivation",
                type: String,
            },
        };
    }


    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {
        const instance = this;

        instance.stateManager.subscribe("clearSearch", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            $(`#${instance.id}`).dropdown('clear', true);
        });

        instance.stateManager.subscribe("mapMarkerCount", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            if (instance.store.mapMarkerCount <= 0) {
                $(`#${instance.id}`).dropdown('clear', true);
            }
        });

        instance.derivedClass && instance.derivedClass.initSubscriptions
            ? instance.derivedClass.initSubscriptions()
            : null;
    }

    async firstUpdated() {
        await this.initSubscriptions();
    }

    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers
            ? this.derivedClass.attachEventHandlers()
            : null;
    }

    async updated() {        
        const instance = this;
        
        let dropdownConfig = instance.searchConfig[instance.searchMode](
            instance
        );

        if (instance.derivedClass && instance.derivedClass.dropdownConfig) {
            dropdownConfig = Object.assign(
                dropdownConfig,
                instance.derivedClass.dropdownConfig
            );
        }

        $(`#${instance.id}`).dropdown(dropdownConfig);
        $(`#${instance.id}`).dropdown('clear', true);
        this.store.clearMapMarkers = `${Date.now().toString()}`; // clear all map markers

        await instance.attachEventHandlers();
    }

    render() {
        return html`${ponderSearchTemplate({
            id: this.id,
            defaultText: this.defaultText,
        })}`;
    }

}

customElements.define("ponder-search", PonderSearch);
