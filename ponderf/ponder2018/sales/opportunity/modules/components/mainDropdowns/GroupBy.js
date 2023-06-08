import { html } from "lit-element";
import $ from "jquery";
import groupByTemplate from "../../../templates/components/mainDropdowns/groupBy.js";
import PonderComponent from "../PonderComponent.js";
import { groupBys } from "./config/config.js";
import { getTableType } from "./utils/utils.js";

class GroupBy extends PonderComponent {
    constructor() {
        super();
        this.id = "groupByDropdown";
    }

    async handleOnChange(e) {
        if (e) {
            const selectedValue = $(`#${e.target.id}`)
                .find(":selected")
                .val();
            this.store.groupBy = selectedValue;
           
            if (selectedValue !== "DYNAMIC") {
                this.store.tableType = getTableType(selectedValue);
            }

            // updateMainTable
            this.store.updateMainTable = `${Date.now().toString()}`;
            // updateMainMap
            this.store.updateMainMap = `${Date.now().toString()}`;
        }
    }

    // render the html from the template in the DOM
    render() {
        return html`${groupByTemplate({
            id: this.id,
            dropdownOptions: groupBys,
            handleOnChange: this.handleOnChange,
        })}`;
    }
}

customElements.define("ponder-group-by-dropdown", GroupBy);
