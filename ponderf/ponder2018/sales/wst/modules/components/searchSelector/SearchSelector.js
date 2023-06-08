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
                remoteUrl: `${this.store.baseSearchApiUrl
                    }/search/addresses?query={query}`,
            },
            {
                name: "ZIP Search",
                value: "zipSearch",
                defaultText: "Type a ZIP code...",
                remoteUrl: `${this.store.baseSearchApiUrl
                    }/boundary/zips?searchId={query}`,
            }
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

    async initSubscriptions() {
        const instance = this;
        this.stateManager.subscribe("updateSearchSelector", async (d) => {
            if (!R.is(Array, d))  {
                instance.requestUpdate();
            }
        });


    }

    async firstUpdated() {
        await this.initSubscriptions();
    }

    async updated() {
        const instance = this;
        const ddValues = R.concat(instance.ddValues, instance.store.config.searchSelector?.values || []);
        const dropdownConfig = {
            values: ddValues,
            onChange: value => {
                const selectedItem = R.head(
                    R.filter(v => v.value === value, ddValues)
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

                    $("ponder-search div.default.text").text(selectedItem.defaultText);
                    instance.store.searchMode = value;
                }
            },
        };
        $(".searchselector.dropdown").dropdown(dropdownConfig);

        await this.attachEventHandlers();
    }

    render() {
        return html`${searchSelectorTemplate({
            id: this.id,
        })}`;
    }
}

customElements.define("ponder-search-selector", SearchSelector);
