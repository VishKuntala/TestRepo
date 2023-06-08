import { html } from "lit-element";
import "./filterTablePanel.css";
import { config as tableConfig } from "../../../modules/components/tabulatr/derivations/opportunity/config/config.js";

const template = ({ filterDerivation, config, baseApiUrl, isACCUser, accFilterData }) => {
    const advancedFiltersStyleProperty = isACCUser== "true" ? "display:block" : "display:none";
    const userACCTableStyleProperty = isACCUser && accFilterData == "true" ? "display:block" : "display:none";
    const accTableStyleProperty = isACCUser == "true" ? "display:block" : "display:none";
    return html`
        <div class="ui segment" style = "${advancedFiltersStyleProperty}">
            <h4>Advanced Filters <span class="ui blue tertiary showFilter button">Hide Filter</span></h4>
            <ponder-filter derivation="${filterDerivation}" filterId='filter1'></ponder-filter>
        </div>
        <ponder-heatmap-filters></ponder-heatmap-filters>
        <div class="ui segment">
            <h3>
                ${config.toolName} Locations
                <span id="mapLocationCount"></span>
            </h3>
            <div class='ui input'>
                <label class='hideCard' for="txtTableSearch">Search: </label>
                <input id="txtTableSearch" placeholder='Search...' />
            </div>
            <div class="filter-table-panel-menu ui top attached tabular menu ">
                <a class="item active" data-tab="mainTable" id="mainTableTab">Sales Markets</a>
                <a class="item" data-tab="psaTable" id="psaTableTab">PSAs</a>
                <a class="item" data-tab="addressTable" id="addressTableTab">Addresses</a>
                <a class="item" data-tab="mduTable" id="mduTableTab">MDUs</a>
                <a class="item" data-tab="accTable" id="accTableTab" style = "${accTableStyleProperty}">ACCs</a>
                <a class="item" data-tab="userACCTable" id="userACCTableTab" style = "${userACCTableStyleProperty}">ACCs</a>
            </div>
            <div class="ui bottom attached tab segment active" id="mainTableDiv" data-tab="mainTable">
                <ponder-tabulator
                    tableid="mainTable"
                    derivation="opportunity/mainTable.js"
                    headers=${
                        tableConfig.tables[config.defaultMainTable].headers
                    }
                    dataKeys=${
                        tableConfig.tables[config.defaultMainTable].dataKeys
                    }
                ></ponder-tabulator>
            </div>
            <div class="ui bottom attached tab segment" id="psaTableDiv" data-tab="psaTable">
                <ponder-tabulator
                    tableid="psaTable"
                    derivation="opportunity/psaTable.js"
                ></ponder-tabulator>
            </div>
            <div class="ui bottom attached tab segment" id="addressTableDiv" data-tab="addressTable">
                <ponder-tabulator
                    tableid="addressTable"
                    derivation="opportunity/addressTable.js"
                ></ponder-tabulator>
            </div>
            <div class="ui bottom attached tab segment" id="mduTableDiv" data-tab="mduTable">
                <ponder-tabulator
                    tableid="mduTable"
                    derivation="opportunity/mduTable.js"
                ></ponder-tabulator>
            </div>
            <div class="ui bottom attached tab segment" id="accTableDiv" data-tab="accTable">
                <ponder-tabulator
                    tableid="accTable"
                    derivation="opportunity/accTable.js"
                ></ponder-tabulator>
            </div>
            <div class="ui bottom attached tab segment" id="userACCTableDiv" data-tab="userACCTable">
                <ponder-tabulator
                    tableid="userACCTable"
                    derivation="opportunity/userACCTable.js"
                ></ponder-tabulator>
            </div>
        </div>
        <ponder-psa-events></ponder-psa-events>
    `;
};

export default template;
