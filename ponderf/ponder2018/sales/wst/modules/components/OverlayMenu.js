import * as R from 'ramda';
import { html } from "lit-element";
import overlayMenuTemplate from "../../templates/components/overlayMenu/overlayMenu";
import PonderComponent from "./PonderComponent";
import { config } from "./azureMap/derivations/mainMap/config/config";

class OverlayMenu extends PonderComponent {
    constructor() {
        super();
        this.legendTitle = this.appState.userPermissions.pointColorConfig?.[this.store.locationAttribute]?.title || config.pointColorConfig[this.store.locationAttribute].title;
        this.colorRamp = R.map(
            item => {
                return {
                    color: this.appState.userPermissions.pointColorConfig?.[this.store.locationAttribute]?.color?.[item.color] || config.pointColorConfig[this.store.locationAttribute].color[item.color],
                    heading: item.heading
                };
            }, this.appState.userPermissions.pointColorConfig?.[this.store.locationAttribute]?.colorRamp || config.pointColorConfig[this.store.locationAttribute].colorRamp);
    }

    async initSubscriptions() {
        const instance = this;
        this.stateManager.subscribe("currentZoom", async () => {
            this.requestUpdate();
        });
        this.stateManager.subscribe("pointLayerVisible", async d => {
            if(!R.is(Array, d)) {
                $('#pointLegend').show();
                this.requestUpdate();
            }
        });
        this.stateManager.subscribe("tool",
        async d => {
            if (!R.is(Array, d)) {
                instance.requestUpdate();
            }
        });
        this.stateManager.subscribe("locationAttribute", async () => {
            this.colorRamp = R.map(
                item => {
                    return {
                        color: config.pointColorConfig[this.store.locationAttribute].color[item.color],
                        heading: item.heading
                    };
                }, config.pointColorConfig[this.store.locationAttribute].colorRamp);
            this.legendTitle = config.pointColorConfig[this.store.locationAttribute].title;
            this.requestUpdate();
        });
        this.stateManager.subscribe("isMapLoading", async () => {
            if (this.store.isMapLoading) {
                $('#loadingDiv').css('visibility', 'visible');
                return;
            }
            $('#loadingDiv').css('visibility', 'hidden ');
        });



    }

    async clearZipBoundary() {
        this.store.clearZipBoundary = `${Date.now().toString()}`;
    }

    async clearBusinessSearch() {
        this.store.clearBusinessSearch = `${Date.now().toString()}`;
    }

    async clearNsbBoundary() {
        this.store.clearNsbBoundary = `${Date.now().toString()}`;
    }


    async closeTools() {
        $(".ponder-dev-tools").hide();
    }

    async handleOnInfoOpening() {
        $(`.menu.legend-container .title .icon`).attr(
            "class",
            "minus icon"
        );
    }

    async handleOnInfoClosing() {
        $(`.menu.legend-container .title .icon`).attr(
            "class",
            "plus icon"
        );
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated() {
        $(".accordion.menu.legend-container").accordion({
            onOpening: this.handleOnInfoOpening,
            onClosing: this.handleOnInfoClosing,
        });
        await this.initSubscriptions();
    }



    // render the html from the template in the DOM
    render() {
        this.legendTitle = this.appState.userPermissions.pointColorConfig?.[this.store.locationAttribute]?.title || config.pointColorConfig[this.store.locationAttribute].title;
        this.colorRamp = R.map(
            item => {
                return {
                    color: this.appState.userPermissions.pointColorConfig?.[this.store.locationAttribute]?.color?.[item.color] || config.pointColorConfig[this.store.locationAttribute].color[item.color],
                    heading: item.heading
                };
            }, this.appState.userPermissions.pointColorConfig?.[this.store.locationAttribute]?.colorRamp || config.pointColorConfig[this.store.locationAttribute].colorRamp);
        return html`${overlayMenuTemplate({
            currentZoom: this.store.currentZoom,
            closeTools: this.closeTools,
            clearBusinessSearch: this.clearBusinessSearch,
            clearZipBoundary: this.clearZipBoundary,
            clearNsbBoundary: this.clearNsbBoundary,
            colorRamp: this.colorRamp,
            legendTitle: this.legendTitle,
            showLegend: this.store.searchMode === 'businessSearch' || this.store.pointLayerVisible,
            zoomAltText : this.store.pointLayerVisible ? null : `Zoom more for ${ this.store.config.tabs?.[1]?.label || 'Business Locations'}`,
                
        })}`;
    }
}

customElements.define("ponder-overlay-menu", OverlayMenu);
