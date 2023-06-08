import { html } from "lit-element";
import * as R from "ramda";
import shortid from 'shortid';
import $ from "jquery";
import ponderSearchTemplate from "../../../templates/components/search/ponderSearch/ponderSearch.js";
import PonderComponent from "../PonderComponent.js";

class PonderSearch extends PonderComponent {
    constructor() {
        super();
        this.requestProcessing = false;
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
                    placeholder: "Start typing an address to check service status...",
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
                                    value: `${item.position.lat}|${item.position.lon}`,
                                };
                            }, R.values(response));
                            return {
                                success: true,
                                results: res,
                            };
                        },
                    },
                    onChange: async (value, text, $choice) => {
                        if (value === "") {
                            $("#divStatus").hide();
                            $("#lblStatus").hide();
                            return;
                        }
                        if (this.requestProcessing) {
                            this.requestProcessing = false;
                            return;
                        }
                        this.requestProcessing = true;
                        instance.store.inSearchMode = true;
                        instance.store.searchMode = 'addressSearch';
                        const position = value.split("|");
                        let postData = {
                            id: shortid.generate(),
                            address: text,
                            lat: parseFloat(position[0]),
                            lng: parseFloat(position[1]),
                            serviceType: 'FIBER_AVAILABILITY',
                        };
                        $("#divLoader").show();
                        $("#divStatus").hide();
                        $("#lblStatus").hide();

                        const response = await $.ajax({
                            url: `${instance.store.baseSearchApiUrl}/servicestatus`,
                            headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
                            type: 'post',
                            data: JSON.stringify(postData),
                            processData: false,
                        });
                        $("#divLoader").hide();
                        $("#divStatus").show();
                        $("#lblStatus").show();
                        if (response) {
                            let html = '';
                            // for (let i = 0; i < response.d.length; i += 1) {
                            const row = JSON.parse(response);
                                if (row.match_quality == "unacceptable") {
                                    row.service_status = "grey";
                                    row.service_type = "NO MATCH FOUND";
                                    row.text_status = "white";
                                    row.text = "No address information found.";
                                } else if (row.ics_score == 1) {
                                    row.service_status = "red";
                                    row.service_type = "Indoor Coverage RED";
                                    row.text_status = "white";
                                    row.text = "Red: This location has limited to no indoor coverage. In-building coverage can be impacted by several factors such as proximity to network towers, building materials, foliage and terrain around the property. Customers at this location will likely experience call quality issues, dropped calls or no service. Customers should consider Wi-Fi Calling or a Cell Booster to improve their in-building experience.";
                                } else if (row.ics_score == 2) {
                                    row.service_status = "yellow";
                                    row.service_type = "Indoor Coverage YELLOW";
                                    row.text_status = "white";
                                    row.text = "Yellow: This location has limited indoor coverage. In-building coverage can be impacted by several factors such as proximity to network towers, building materials, foliage and terrain around the property. Customers at this location may experience call quality issues or dropped calls. Customers should consider Wi-Fi Calling or a Cell Booster to improve their in-building experience.";
                                } else {
                                    row.service_status = "green";
                                    row.service_type = "Indoor Coverage GREEN";
                                    row.text_status = "white";
                                    row.text = "Green: This location has been determined to have good indoor coverage. In-building coverage can be impacted by several factors such as building materials, foliage and terrain around the property. For concerns regarding in building service at this location, continue device and network troubleshooting.";
                                }

                            html = `${html}<a id="lblStatus" class="ui ${row.service_status ? row.service_status : "grey"} label">${row.service_type} ${!row.service_status ? "(UNKNOWN)" : ""}</a>
                                        </br></br><a id="lblText" class="ui ${row.text_status ? row.text_status : "grey"} label">${row.text}</a>`;
                                /* $("#lblStatus").text(`${response.d[0].service_type}  ${!response.d[0].service_status ? '(UNKNOWN)' : ''}`);
                                $("#lblStatus").removeClass("red green yellow grey");
                                if (!response.d[0].service_status) {
                                    $("#lblStatus").addClass("grey");
                                } else {
                                    $("#lblStatus").addClass(response.d[0].service_status);
                                } */
                            // }
                            $("#divStatus").html(html);
                        } else {
                            $("#lblStatus").text('NO DATA AVAILABLE');
                            $("#lblStatus").removeClass("red green yellow grey").addClass("grey");
                        }
                    },
                    minCharacters: 10,
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
