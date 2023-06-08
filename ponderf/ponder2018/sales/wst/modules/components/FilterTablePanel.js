import { html } from "lit-element";
import filterTablePanelTemplate from "../../templates/components/filterTablePanel/filterTablePanel";
import PonderComponent from "./PonderComponent";
import * as R from 'ramda';

class FilterTablePanel extends PonderComponent {
    constructor() {
        super();
    }

    async initSubscriptions() {
        const instance = this;
        this.stateManager.subscribe("setActiveTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return;
            if (d) {
                document.getElementById("addressTableTab").classList.add("active");
                document.getElementById("mainTableTab").classList.remove("active");
                document.getElementById("psaTableTab").classList.remove("active");
                document.getElementById("mduTableTab").classList.remove("active");
            }
        });

        this.stateManager.subscribe("tool",
            async d => {
                if (!R.is(Array, d)) {
                    if (instance.appState.userGroups.length) {
                        $(".filter-table-panel-menu.menu .item").tab('change tab', 'mainTable');
                        instance.requestUpdate();
                    }
                }
            });
    }

    async firstUpdated() {
        const instance = this;
        instance.store.currentTab = 'mainTable';
        $(".filter-table-panel-menu.menu .item").tab({
            onVisible: tabPath => {
                instance.store.currentTab = tabPath;
                if (tabPath === 'mainTable') {
                    const ponderDatatable = $($(`ponder-tabulator[tableid='${tabPath}']`)[0])[0];
                    ponderDatatable.table.redraw(true);
                }
            }
        });
        await this.initSubscriptions();
    }

    render() {
        return html`${filterTablePanelTemplate({
            filterDerivation: `${this.store.config.tool}/${this.store.config.tool
                }.js`,
            tableDerivation: `${this.store.config.tool}/${this.store.config.tool
                }.js`,
            config: this.store.config,
            baseApiUrl: this.store.baseApiUrl,
        })}`;
    }
}

customElements.define("ponder-filter-table-panel", FilterTablePanel);
