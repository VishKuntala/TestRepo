import { html } from "lit-element";
import $ from "jquery";
import salesMarketTemplate from "../../../templates/components/mainDropdowns/salesMarket.js";
import PonderComponent from "../PonderComponent.js";
import { salesMarkets } from "./config/config.js";
import { getMarketType, getTableType } from "./utils/utils.js";

class SalesMarket extends PonderComponent {
    constructor() {
        super();
        this.id = "salesMarketDropdown";
    }

    async setupGroupByDropdown(marketType) {
        if (marketType == "MARKET") {
            $("#lblGroupBy").text("Group Market By");
            $('#groupByDropdown option[value="SALES_MARKET"]').prop(
                "disabled",
                false
            );
            //$('#groupByDropdown option[value="CMA"]').prop("disabled", false);
            $('#groupByDropdown option[value="DMA"]').prop("disabled", false);
            $('#groupByDropdown option[value="COUNTY"]').prop(
                "disabled",
                false
            );
            $('#groupByDropdown option[value="ZIP"]').prop("disabled", false);
        } else if (marketType == "REGION") {
            $("#lblGroupBy").text("Group Region By");
            $('#groupByDropdown option[value="SALES_MARKET"]').prop(
                "disabled",
                false
            );
            //$('#groupByDropdown option[value="CMA"]').prop("disabled", false);
            $('#groupByDropdown option[value="DMA"]').prop("disabled", false);
            $('#groupByDropdown option[value="COUNTY"]').prop(
                "disabled",
                false
            );
            $('#groupByDropdown option[value="ZIP"]').prop("disabled", true);
        } else {
            $("#lblGroupBy").text("Group Nation By");
            $('#groupByDropdown option[value="SALES_MARKET"]').prop(
                "disabled",
                false
            );
            //$('#groupByDropdown option[value="CMA"]').prop("disabled", false);
            $('#groupByDropdown option[value="DMA"]').prop("disabled", false);
            $('#groupByDropdown option[value="COUNTY"]').prop("disabled", true);
            $('#groupByDropdown option[value="ZIP"]').prop("disabled", true);
        }
    }

    async handleOnChange(e) {
        const selectedValue = $(`#${e.target.id}`)
            .find(":selected")
            .val();
        const updatedMarketType = getMarketType(selectedValue);

        this.setupGroupByDropdown(updatedMarketType);

        // reset the groupBy and table to DMA if not in dynamic groupBy
        if (this.store.groupBy !== "DYNAMIC") {
            $("#groupByDropdown select").val("DMA");

            this.store.groupBy = "DMA";
            this.store.tableType = getTableType("DMA");
        }

        this.store.marketType = updatedMarketType;
        this.store.market = selectedValue;
        this.store.updateMainTable = `${Date.now().toString()}`;
        this.store.updateMainMap = `${Date.now().toString()}`;
        // this.store.updatePSATable = `${Date.now().toString()}`;
    }

    // render the html from the template in the DOM
    render() {
        return html`${salesMarketTemplate({
            id: this.id,
            dropdownOptions: salesMarkets,
            handleOnChange: this.handleOnChange,
        })}`;
    }
}

customElements.define("ponder-sales-market-dropdown", SalesMarket);
