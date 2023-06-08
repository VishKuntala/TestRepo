import { html } from "lit-element";
import $ from "jquery";
import heatMapTemplate from "../../../templates/components/mainDropdowns/heatMap.js";
import PonderComponent from "../PonderComponent.js";
import { heatMaps } from "./config/config.js";

class HeatMap extends PonderComponent {
    constructor() {
        super();
        this.id = "heatMapDropdown";
    }

    async initSubscriptions() {
        const instance = this;

        this.stateManager.subscribe("tool",
            async d => {
                if (!R.is(Array, d)) {
                    instance.requestUpdate();
                   // this.store.updateLayers = `${Date.now().toString()}`;
                }

            });
    }

    async handleOnChange(e) {
        const selectedText = $(`#${e.target.id}`).find(":selected").text();
        const selectedValue = $(`#${e.target.id}`).find(":selected").val();
        this.store.heatmap = selectedValue;
        this.store.currentHeatmapFilter = selectedValue;
        this.store.updateLayers = `${Date.now().toString()}`;
    }

    async firstUpdated(changedProperties) {
        await this.initSubscriptions();
    }

    //async updated(changedProperties) {
    //    $(`#${this.id}`)
    //        .dropdown();
    //}

    // render the html from the template in the DOM
    render() {
        return html`${heatMapTemplate({
            id: this.id,
            dropdownOptions: this.store.config.heatMaps || heatMaps(this.store.config.defaultHeatmap),
            handleOnChange: this.handleOnChange,
        })}`;
    }
}

customElements.define("ponder-heatmap-dropdown", HeatMap);
