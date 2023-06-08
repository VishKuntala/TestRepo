import { config } from "./tabulatr/derivations/opportunity/config/config.js";
import { html } from "lit-element";
import filterTablePanelTemplate from "../../templates/components/filterTablePanel/filterTablePanel";
import PonderComponent from "./PonderComponent";
import * as R from 'ramda';

class FilterTablePanel extends PonderComponent {
    constructor() {
        super();
    }

    switchToTab(tabToSwitch) {
        config.tabs.allTabs.map(tab => $('#' + tab).removeClass("active"));
        config.tabs.allTabDivs.map(tabDiv => $('#' + tabDiv).removeClass("active"));
        $('#' + config.tabs[tabToSwitch].tabName).addClass("active");
        $('#' + config.tabs[tabToSwitch].divName).addClass("active");
        this.store.currentTab = config.tabs[tabToSwitch].tableName;
        const ponderDatatable = $($(`ponder-tabulator[tableid='` + config.tabs[tabToSwitch].tableName + `'`)[0])[0];
        ponderDatatable.table.redraw(true);
    }

    async initSubscriptions() {        
        this.stateManager.subscribe("switchToAddressTableTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            this.switchToTab("address"); //switch to addressTable
        });
        this.stateManager.subscribe("switchToACCTableTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            this.switchToTab("acc"); //switch to accTable
        });
        this.stateManager.subscribe("showUserACCTable", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            $('#accTableTab').css('display', 'none'); //hide accTableTab
            $('#userACCTableTab').css('display', 'block'); //show userACCTableTab
            this.switchToTab("userACC");//switch to userACCTable
        });
        this.stateManager.subscribe("hideUserACCTable", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            $('#accTableTab').css('display', 'block'); //show accTableTab
            $('#userACCTableTab').css('display', 'none'); //hide userACCTableTab            
            this.switchToTab("main"); //switch to mainTable
        });
        this.stateManager.subscribe("switchToMainTableTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event            
            this.switchToTab("main"); //switch to mainTable
        });
    }

    async firstUpdated() {
        const instance = this;        
        instance.store.currentTab = 'mainTable';
        $(".filter-table-panel-menu.menu .item").tab({
            onVisible: tabPath => {
                const previousTabPath = instance.store.currentTab;
                instance.store.currentTab = tabPath;
                const ponderDatatable = $($(`ponder-tabulator[tableid='${tabPath}']`)[0])[0];
                ponderDatatable.table.redraw(true);
                // if table search feature is used clear search text box and reload the table data in previous tab
                const searchText = R.trim($("#txtTableSearch").val());
                if (searchText.length > 0) {
                    $("#txtTableSearch").val("");
                    if (previousTabPath == "mainTable")
                        this.store.updateMainTable = `${Date.now().toString()}`;
                    else if (previousTabPath == "psaTable")
                        this.store.updatePSATable = `${Date.now().toString()}`;
                    else if (previousTabPath == "addressTable")
                        this.store.addressTableData = this.store.addressTableData;                        
                    else if (previousTabPath == "mduTable")
                        this.store.mduTableData = this.store.mduTableData;
                    else if (previousTabPath == "accTable")
                        this.store.accMapData = this.store.accMapData;
                    else if (previousTabPath == "userACCTable")
                        this.store.userACCTableData = this.store.userACCTableData;
                } 
            }
        });
        await this.initSubscriptions();
    }

    render() {
        return html`${filterTablePanelTemplate({
            filterDerivation: `${this.store.config.tool}/${
                this.store.config.tool
            }.js`,
            config: this.store.config,
            baseApiUrl: this.store.baseApiUrl,
            isACCUser: this.store.isACCUser,
            accFilterData: this.store.accFilterData
        })}`;
    }
}

customElements.define("ponder-filter-table-panel", FilterTablePanel);
