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

    async handleOnChange(e) {
        const selectedText = $(`#${e.target.id}`).find(":selected").text();
        const selectedHeatmap = $(`#${e.target.id}`).find(":selected").val();
        this.store.heatmap = selectedHeatmap;
        this.store.currentHeatmapFilter = selectedHeatmap;
        this.store.currentHeatmapFilterIndex = undefined;
    }

    // render the html from the template in the DOM
    render() {
        return html`${heatMapTemplate({
            id: this.id,
            dropdownOptions: heatMaps,
            handleOnChange: this.handleOnChange,
        })}`;
    }
}

customElements.define("ponder-heatmap-dropdown", HeatMap);
