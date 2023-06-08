import { html } from "lit-element";
import pointsSelectionCardTemplate from "../../templates/components/pointsSelectionCard/pointsSelectionCard";
import PonderComponent from "./PonderComponent";
import { config } from "../../modules/components/azureMap/derivations/mainMap/config/config.js";

class PointsSelectionCard extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        const instance = this;
        this.stateManager.subscribe("currentZoom", async () => {
            const showDivs = [];
            const hideDivs = [];
            const pointLayers = Object.values(config.pointsLayers);
            pointLayers.map((pointLayer) => {
                if (this.store.searchMode === 'businessSearch' ||
                    (pointLayer.minZoom <= Math.round(this.store.currentZoom) && (pointLayer.maxZoom ? (pointLayer.maxZoom > this.store.currentZoom) : true))) {
                    showDivs.push('.selection-inputs.' + pointLayer.id);
                }
                else {
                    hideDivs.push('.selection-inputs.' + pointLayer.id);
                }
            });
            showDivs.map(showDiv => $(`${showDiv}`).show());
            hideDivs.map(hideDiv => $(`${hideDiv}`).hide());
        });

        this.stateManager.subscribe("tool",
        async d => {
            if (!R.is(Array, d)) {
                $( "#nsbBoundary" ).prop( "checked", false );
                instance.requestUpdate();
            }
        });
    }

    async #toggleLayer(e) {
        const layerId = e.target.id;
        const layerVisibilityStatus = $(`#${layerId}`).is(":checked");
        this.store.layerVisibilityChange = { layerId, layerVisibilityStatus };
        this.store.movePointLayers = Date.now().toString();
    }

    async #toggleSatelliteView(e) {
        const layerId = e.target.id;
        const layerVisibilityStatus = layerId === 'satellite';
        this.store.layerVisibilityChange = { layerId: 'satellite', layerVisibilityStatus };
        this.store.movePointLayers = Date.now().toString();
    }

    async #toggleNSBBoundaryLayer(e) {
        const layerId = e.target.id;
        const layerVisibilityStatus = $('#nsbBoundary').prop('checked');
        this.store.layerVisibilityChange = { layerId: 'nsb-boundary', layerVisibilityStatus };
        this.store.movePointLayers = Date.now().toString();
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
    }

    render() {
        return html`${pointsSelectionCardTemplate({
            toggleLayer: this.#toggleLayer,
            toggleSatelliteView: this.#toggleSatelliteView,
            toggleNSBBoundaryLayer: this.#toggleNSBBoundaryLayer,
            showNsbLayer: this.store.config.showNsbLayer,
            config: this.store.config,
            mapLayerInfo: [
                config.pointsLayers.ATTR_POINTS,
                config.pointsLayers.AR_POINTS,
                config.pointsLayers.WS_POINTS
            ].concat(this.store.config.showPsaLayer ? [config.pointsLayers.PSA_POINTS] : [] ),
        })}`;
    }
}

customElements.define("points-selection-card", PointsSelectionCard);
