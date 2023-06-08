import { html } from "lit-element";
import mapCardTemplate from "../../templates/components/mapCard/mapCard";
import PonderComponent from "./PonderComponent";

class MapCard extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        this.stateManager.subscribe("mapCardAreaInfo", async d =>
            this.requestUpdate()
        );
        this.stateManager.subscribe("mapCardAreaHeader", async d =>
            this.requestUpdate()
        );
        this.stateManager.subscribe("mapCardPointInfo", async d =>
            this.requestUpdate()
        );
        this.stateManager.subscribe("mapCardPointHeader", async d =>
            this.requestUpdate()
        );
        this.stateManager.subscribe("currentHeatmapFilter", async d =>
            this.requestUpdate()
        );

        
    }

    async handleOnInfoOpening(cardType) {
        $(
            `.menu.areas
             .title .icon`
        ).attr("class", "minus icon");
        $(
            `.menu.points
             .title .icon`
        ).attr("class", "minus icon");
    }

    async handleOnInfoClosing(cardType) {
        $(
            `.menu.areas
             .title .icon`
        ).attr("class", "plus icon");
        $(
            `.menu.points
             .title .icon`
        ).attr("class", "plus icon");
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated() {
        await this.initSubscriptions();

        $(".ponder-ui-layer-container .accordion.areas").accordion({
            onOpening: () => this.handleOnInfoOpening("area"),
            onClosing: () => this.handleOnInfoClosing("area"),
        });
        $(".ponder-ui-layer-container .accordion.points").accordion({
            onOpening: this.handleOnInfoOpening,
            onClosing: this.handleOnInfoClosing,
        });
    }

    // render the html from the template in the DOM
    render() {
        return html`${mapCardTemplate({
            mapCardAreaInfo: this.store.mapCardAreaInfo,
            mapCardAreaHeader: this.store.mapCardAreaHeader,
            mapCardPointInfo: this.store.mapCardPointInfo,
            mapCardPointHeader: this.store.mapCardPointHeader,
            currentHeatmapFilter: this.store.currentHeatmapFilter,
        })}`;
    }
}

customElements.define("ponder-map-card", MapCard);
