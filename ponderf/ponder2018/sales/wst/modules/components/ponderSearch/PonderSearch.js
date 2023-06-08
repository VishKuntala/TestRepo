import { html } from "lit-element";
import * as R from "ramda";
import centroid from "@turf/centroid";
import $ from "jquery";
import ponderSearchTemplate from "../../../templates/components/search/ponderSearch/ponderSearch.js";
import PonderComponent from "../PonderComponent.js";
import { config } from "../maplibre/derivations/mainMap/config/config.js";

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
                        onResponse: function (response) {
                            const res = R.map(item => {
                                return {
                                    name: item.address.freeformAddress,
                                    value: `${item.position.lat}|${item.position.lon
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
                            zoom: config.pointsLayers.WS_POINTS.minZoom,
                            addMarker: true,
                        };

                    },
                    minCharacters: 10,
                };
            },
            businessSearch: instance => {
                return {
                    saveRemoteData: false,
                    clearable: true,
                    placeholder: "Type a business name...",
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
                    onChange: async (value) => {
                        const position = value.split("|");
                        if (value === "" || instance.store.searchedBusiness === position[0]) {
                            return;
                        }
                        instance.store.searchMode = 'businessSearch';
                        instance.store.inSearchMode = true;
                        instance.store.searchedBusiness = position[0];
                        const { data } = await instance.getData(
                            `${instance.store.config.baseUrl}/location/${instance.store.searchedBusiness}`,
                        );
                        instance.store.zoomToPoint = Object.assign(data[0], {
                            lat: parseFloat(position[1]),
                            lng: parseFloat(position[2]),
                            zoom: config.pointsLayers.WS_POINTS.minZoom,
                            addMarker: false,
                            addPoup: true,
                        });
                        // instance.store.resetMapToInitialView= config.heatmapLayers.SALES_MARKET.maxZoom - 1;
                        instance.store.updateLayers = `${Date.now().toString()}`;
                        instance.store.updateClusterLayerForBusinessSearch = `${Date.now().toString()}`;
                        instance.store.fetchTableData = `${Date.now().toString()}`;
                        // show the clear Business Search button
                        $('#btnClearBusinessSearch').removeClass('ponderHidden');
                        $('#btnClearZipBoundary').addClass('ponderHidden');

                    },
                    minCharacters: 5,
                };
            },
            zipSearch: instance => {
                return {
                    saveRemoteData: false,
                    clearable: true,
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
                    onChange: async (value) => {
                        if (value === "" || instance.store.searchedZip === value) {
                            return;
                        }
                        instance.store.searchMode = 'zipSearch';
                        instance.store.inSearchMode = true;
                        instance.store.searchedZip = value;
                        const boundaryData = await instance.getData(
                            `${instance.store.baseSearchApiUrl}/geodata/${instance.store.heatmap
                            }/zipBoundary.geojson?zip=${value}`
                        );
                        const zipCenter = centroid(boundaryData.data);
                        instance.store.zoomToPoint = {
                            lat: zipCenter.geometry.coordinates[1],
                            lng: zipCenter.geometry.coordinates[0],
                            zoom: config.heatmapLayers.ZIP.minZoom,
                            addMarker: false,
                        };
                        instance.store.zipBoundary = boundaryData.data;
                        //show the clear zip button
                        $('#btnClearZipBoundary').removeClass('ponderHidden');
                        $('#btnClearBusinessSearch').addClass('ponderHidden');

                    },
                    minCharacters: 3,
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
            $(`#${instance.id}`).dropdown('clear', true);
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
