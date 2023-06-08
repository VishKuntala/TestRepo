import { html } from "lit-element";
import * as R from "ramda";
import $ from "jquery";
import searchSelectorTemplate from "../../../templates/components/search/searchSelector/searchSelector.js";
import PonderComponent from "../PonderComponent.js";

class SearchSelector extends PonderComponent {
    constructor() {
        super();
        this.id = "";
        this.name = "";
        this.ddValues = [
            {
                name: "Address Search",
                value: "addressSearch",
                selected: true,
                defaultText: "Type an address...",
                remoteUrl: `${
                    this.store.baseApiUrl
                }/search/addresses?query={query}`,
            },
            {
                name: "PSA Search",
                value: "psaSearch",
                defaultText: "Type a PSA...",
                remoteUrl: `${this.store.baseApiUrl}/point/psas?searchId={query}`,
            },
            {
                name: "ZIP Search",
                value: "zipSearch",
                defaultText: "Type a ZIP code...",
                remoteUrl: `${
                    this.store.baseApiUrl
                }/boundary/zips?searchId={query}`,
            },
            {
                name: "ACC Search",
                value: "accSearch",
                defaultText: "Type a Property ID or Name...",
                remoteUrl: `${this.store.baseApiUrl}/point/accs?searchId={query}`,
            },
        ];
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: "selectorid",
                type: String,
            },
        };
    }

    async updated() {
        const instance = this;
        const dropdownConfig = {
            values: instance.store.isACCUser == "true" ? instance.ddValues : instance.ddValues.filter(ddlValue => ddlValue.value !== "accSearch"),
            onChange: value => {
                const selectedItem = R.head(
                    R.filter(v => v.value === value, instance.ddValues)
                );

                if (selectedItem) {
                    $("ponder-search").attr(
                        "remoteurl",
                        selectedItem.remoteUrl
                    );

                    $("ponder-search").attr(
                        "defaulttext",
                        selectedItem.defaultText
                    );
                    $("ponder-search").attr("searchmode", value);

                    instance.store.searchMode = value;
                }
            },
        };
        $(".search.dropdown").dropdown(dropdownConfig);

        await this.attachEventHandlers();
    }

    render() {
        return html`${searchSelectorTemplate({
            id: this.id,
        })}`;
    }
}

customElements.define("ponder-search-selector", SearchSelector);
