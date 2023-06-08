import { html } from "lit-element";
import pointsSelectionCardTemplate from "../../templates/components/pointsSelectionCard/pointsSelectionCard";
import PonderComponent from "./PonderComponent";
import { config } from "../../modules/components/azureMap/derivations/mainMap/config/config.js";

class PointsSelectionCard extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        // TODO: currentZoom event firing too many times
        // show hide layers except ACCPointLayer
        this.stateManager.subscribe("currentZoom", async () => {            
            const showDivs = [];
            const hideDivs = [];
            const pointLayers = Object.values(config.pointsLayers).filter(pointLayer => pointLayer.id != config.pointsLayers.ACC_POINTS.id);
            pointLayers.map((pointLayer) => {
                if (pointLayer.minZoom <= this.store.currentZoom && (pointLayer.maxZoom ? (pointLayer.maxZoom > this.store.currentZoom) : true)) {
                    showDivs.push('.selection-inputs.' + pointLayer.id);
                }
                else {
                    hideDivs.push('.selection-inputs.' + pointLayer.id);
                }
            });
            showDivs.map(showDiv => $(`${showDiv}`).show());
            hideDivs.map(hideDiv => $(`${hideDiv}`).hide());
        });
    }

    async #toggleLayer(e) {
        const layerId = e.target.id;
        const layerVisibilityStatus = $(`#${layerId}`).is(":checked");
        this.store.layerVisibilityChange = { layerId, layerVisibilityStatus };
    }

    async #toggleSatelliteView(e) {
        const layerId = e.target.id;        
        const layerVisibilityStatus = layerId === 'satellite';
        this.store.layerVisibilityChange = { layerId: 'satellite', layerVisibilityStatus };
    }

    async handleOnInfoOpening() {
        $(`.menu.points-selection-container .title .icon`).attr(
            "class",
            "minus icon"
        );
    }

    async handleOnInfoClosing() {
        $(`.menu.points-selection-container .title .icon`).attr(
            "class",
            "plus icon"
        );
    }

    async firstUpdated() {
        $(".accordion.menu.points-selection-container").accordion({
            onOpening: this.handleOnInfoOpening,
            onClosing: this.handleOnInfoClosing,
        });
        $(".basemap-layers .ui.radio").checkbox({
            isRadio: true,
        })
        await this.initSubscriptions();      
        $(`${'.selection-inputs.' + config.pointsLayers.ACC_POINTS.id}`).hide(); //hide ACCPointLayer 
    }

    render() {
        return html`${pointsSelectionCardTemplate({
            toggleLayer: this.#toggleLayer,
            toggleSatelliteView: this.#toggleSatelliteView,
            mapLayerInfo: [
                config.pointsLayers.ATTR_POINTS,
                config.pointsLayers.AR_POINTS,
                config.pointsLayers.TOP_25_PSA_POINTS,
                config.pointsLayers.TOP_25_MDU_POINTS,
                config.pointsLayers.PSA_POINTS,                
                config.pointsLayers.FUTURE_PSA_POINTS,
                config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER,
                config.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CROSS_SELL_OPPORTUNITY,
                config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CUSTOMER,
                config.pointsLayers.COPPER_UPGRADE_AND_WIRELSS_CROSS_SELL_OPPORTUNITY,
                config.pointsLayers.WIRELESS_CUSTOMER_AND_FIBER_CROSS_SELL_OPPORTUNITY,
                config.pointsLayers.OPPORTUNITY_FOR_FIBER_AND_WIRELESS,
                config.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS,
                config.pointsLayers.MDU_WITH_ATT_FIBER_PROSPECTS,
                config.pointsLayers.ACC_POINTS,
            ],
        })}`;
    }
}

customElements.define("points-selection-card", PointsSelectionCard);
