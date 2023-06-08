import { html } from "lit-element";
import * as R from "ramda";
import appTemplate from "../../templates/components/app.js";
import PonderComponent from "./PonderComponent";
import { salesMarkets, heatMaps, groupBys } from "../helpers/dropdownData.js";
import toolConfig from "../helpers/toolConfig.js";
import { config as mapConfig } from "./azureMap/derivations/mainMap/config/config.js";
import { CONSTANTS } from "../helpers/constants.js";

class App extends PonderComponent {
    constructor() {
        super();
        this.appState.subscriptions = [];
        // grab query string params (if any)
        const urlParams = new URLSearchParams(window.location.search);

        if (urlParams.has("channel")) {
            this.initialTool = urlParams.get("channel");
        } else {
            this.initialTool = "opportunity";
        }
        this.#initializeStore(this.initialTool, urlParams.has("channel"));
    }

    // acknowledge button click event
    async #acknowledgeClick(e) {
        //console.log('acknowledgeClick', e);
        e.preventDefault();
        const params = {
            userID: this.store.userId,
            eventType: "Fiber Sales Opportunity",
        };
        await this.postData(
            `${this.store.baseApiUrl}/log/acknowledgement`,
            params
        );
    }

    // showing modal
    #showAcknowledgeModal() {
        $(".acknowledge.modal")
            .modal({ closable: false })
            .modal("setting", "transition", "fade up")
            .modal("show");
        $("#acknowledgeBtn").focus();
    }

    async clearSubscriptions() {
        if (this.appState.subscriptions) {
            for (let i = 0; i < this.appState.subscriptions.length; i += 1) {
                this.appState.subscriptions[i].unsubscribe();
            }
        }
        this.appState.subscriptions = [];
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated(changedProperties) {
        await this.clearSubscriptions();
        await this.initSubscriptions();
        this.#showAcknowledgeModal();
    }

    // set initial data needed for the app components
    #initializeStore(tool, appInitializedWithQueryParams) {
        // stop publishing to subscribers during app initialization
        this.appState.publish = false;

        this.appState.subscriptions = [];

        this.store.config = toolConfig[tool];

        this.store.appInitializedWithQueryParams =
            appInitializedWithQueryParams;
        if (appInitializedWithQueryParams) {
            const urlParams = new URLSearchParams(window.location.search);
            const entries = urlParams.entries();
            for (let pair of entries) {
                this.store[pair[0]] = pair[1];
            }
        }
        //set dataInfo
        this.store.dataInfo = this.store.config.dataInfo;
        //set psaEventsData
        this.store.psaEventsData = [];
        //set loggedInUserID value
        this.store.userId = $("#hdnUser").val();
        //set isAccUser value
        this.store.isACCUser = $("#hdnIsACCUser").val();
        //set access level and disable right click if accessLevel is not "Unlimited"
        this.store.accessLevel = $("#hdnAccess").val();
        if (this.store.accessLevel !== 'Unlimited') {
            document.addEventListener('contextmenu', event => event.preventDefault());
        }

        // dynamic urls defined in "...sales/opportunity/Opportunity.aspx" and its .cs file
        this.store.baseApiUrl = $("#hdnBaseApiUrl").val();
        this.store.rootUrl = $("#hdnRootUrl").val();

        this.store.pillsData = [];
        this.store.compareSvids = [];
        this.store.cardsData = [];

        //counter to keep track of all map markers
        this.store.mapMarkerCount = 0;

        // map card information (both for heatmap areas and the points)
        this.store.mapCardAreaInfo = undefined;
        this.store.mapCardAreaHeader = undefined;
        this.store.mapCardPointInfo = undefined;
        this.store.mapCardPointHeader = undefined;
        // "ignoreZoomEndEvent" property is used stop reloading of userACCdata table in zoomend event
        // when user click submit button we fetch the data and trigger the userACCTable reload so zoomend event table reload should be ignored
        this.store.ignoreZoomEndEvent = false; 

        // current map layer information (source, name, selected  filter, etc...)
        this.store.currentLayerName = mapConfig.heatmapLayers.SALES_MARKET.name;
        this.store.currentLayerSource = mapConfig.heatmapLayers.SALES_MARKET.source;
        this.store.currentHeatmapFilter = CONSTANTS.HEATMAP_FIBER_PENETRATION;
        this.store.currentHeatmapFilterIndex = undefined;

        this.store.currentZoom = this.store.config.zoomStart;
        this.store.currentMapBounds = undefined;

        // table state
        this.store.currentTable = CONSTANTS.TABLE_DEFAULT;

        // dropdown state
        this.store.triggerDropdownValueChangedEvent = true;
        this.store.salesMarkets = salesMarkets;
        this.store.heatMaps = heatMaps;
        this.store.groupBys = groupBys;
        this.store.groupBy = 'DYNAMIC';
        this.store.market = "%"; // means 'MATIONAL' i think? 
        this.store.marketType = "NATIONAL";
        this.store.tableType = "vpgms";
        this.store.searchedPSA = undefined;
        this.store.isMapLoading = false;
        this.store.layersAddedToMap = [];
        this.store.sourcesAddedToMap = [];

        this.store.accFilterData = {
            generalManager: "undefined",
            areaManager: "undefined",
            preferredPartner: "undefined",
            contractType: "undefined"
        };
        // current points symbol size
        this.store.shapeSize = mapConfig.minShapeSize;

        // tool-based configuration
        this.store.zoom = this.store.config.zoomStart;
        this.store.mapCoordinates = this.store.config.mapCoordsStart;
        this.store.heatmap = this.store.config.heatmapStart;
        this.store.sortCriteriaData = this.store.config.sortCriteriaData;
        this.store.toolName = this.store.config.toolName;
        if (this.store.config.filter.initialValues) {
            const keys = R.keys(this.store.config.filter.initialValues);
            for (let i = 0; i < keys.length; i += 1) {
                const key = keys[i];
                this.store[key] = this.store.config.filter.initialValues[key];
            }
        }
         //resume publishing to subscribers
        this.appState.publish = true;
    }

    // render the html from the template in the DOM
    render() {
        return html`${appTemplate({ acknowledgeClick: this.#acknowledgeClick })}`;
    }
}

customElements.define("ponder-app", App);
