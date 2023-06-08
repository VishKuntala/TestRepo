import { html } from "lit-element";
import $ from "jquery";
import locationAttributeTemplate from "../../../templates/components/mainDropdowns/locationAttribute.js";
import PonderComponent from "../PonderComponent.js";
import { locationAttributes } from "./config/config.js";

class LocationAttribute extends PonderComponent {
    constructor() {
        super();
        this.id = "locationAttributeDropdown";
    }

    async initSubscriptions() {
        const instance = this;

        this.stateManager.subscribe("tool",
            async d => {
                if (!R.is(Array, d)) {
                    instance.requestUpdate();
                    //instance.store.updateLayers = `${Date.now().toString()}`;
                }

            });
    }

    async handleOnChange(e) {
        const selectedText = $(`#${e.target.id}`).find(":selected").text();
        const selectedValue = $(`#${e.target.id}`).find(":selected").val();
        this.store.locationAttribute = selectedValue;
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
        return html`${locationAttributeTemplate({
            id: this.id,
            dropdownOptions: this.store.config.locationAttributes || locationAttributes(this.store.config.defaultLocationAttribute),
            handleOnChange: this.handleOnChange,
        })}`;
    }
}

customElements.define("ponder-location-attribute-dropdown", LocationAttribute);
