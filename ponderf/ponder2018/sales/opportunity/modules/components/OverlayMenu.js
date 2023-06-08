import { html } from "lit-element";
import overlayMenuTemplate from "../../templates/components/overlayMenu/overlayMenu";
import PonderComponent from "./PonderComponent";

class OverlayMenu extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        this.stateManager.subscribe("currentZoom", async () => {
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
        this.store.clearBoundary = "ZIP_BOUNDARY";
    }

    async clearCountyBoundary() {
        this.store.clearBoundary = "COUNTY_BOUNDARY";
    }

    async clearDMABoundary() {
        this.store.clearBoundary = "DMA_BOUNDARY";
    }

    async clearPSAFilter() {
        this.store.searchedPSA = undefined; //update state before triggering subscriptions
        this.store.clearPSAFilter = `${Date.now().toString()}`;        
    }

    async clearMapMarkers() {
        this.store.clearMapMarkers = `${Date.now().toString()}`;
    }

    async closeTools() {
        $(".ponder-dev-tools").hide();
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated() {
        await this.initSubscriptions();
    }

    // render the html from the template in the DOM
    render() {
        return html`${overlayMenuTemplate({
            currentZoom: this.store.currentZoom,
            closeTools: this.closeTools,
            clearZipBoundary: this.clearZipBoundary,
            clearCountyBoundary: this.clearCountyBoundary,
            clearDMABoundary: this.clearDMABoundary,
            clearPSAFilter: this.clearPSAFilter,
            clearMapMarkers: this.clearMapMarkers,
        })}`;
    }
}

customElements.define("ponder-overlay-menu", OverlayMenu);
