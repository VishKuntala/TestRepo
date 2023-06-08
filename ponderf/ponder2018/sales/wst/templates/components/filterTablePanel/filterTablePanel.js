import { html } from "lit-element";
import "./filterTablePanel.css";

const template = ({ filterDerivation, tableDerivation, config, baseApiUrl }) => {
    return html`
        <div class="ui segment mapAndTable">
            <h4>Advanced Filters <span class="ui blue tertiary showFilter button">Hide Filter</span></h4>
            <ponder-filter derivation="${filterDerivation}" filterId='filter1'></ponder-filter>
        </div>
        <div class="ui segment onlyTable">
            <nav class="container">
                <div class="filterpanel-title">${config.toolName}</div>
                <div class='filterpanel-nav-items'>
                    <div>
                       <div id="addlInfo"></div>
                       <div id="addlInfo1"></div>
                       <div id="addlInfo2"></div>
                    </div>
                    <div class='right-links'>
                        
                    </div>
                </div>
            </nav>
            <div class="filter-table-panel-menu ui top attached tabular menu ">
                <a class="item active" data-tab="mainTable" id="mainTableTab"><i class=${config.tabs?.[0]?.icon || "building icon"}></i> ${ config.tabs?.[0]?.label || 'Building Locations'}</a>
                <a class="item" data-tab="dashboard" id="dashboardTab"><i class="chart bar icon"></i>Dashboard</a>
                <a class="item" data-tab="tenantTable" id="tenantTableTab"><i class=${config.tabs?.[1]?.icon || "address card outline icon"}></i> ${ config.tabs?.[1]?.label || 'Business Tenants'}<div id="tenantTableLoader" class="ui active inline secondary small loader" style="visibility: hidden;"></div></a>
            </div>
            <div class="ui bottom attached tab segment active" data-tab="mainTable">
                <ponder-tabulator
                    tableid="mainTable"
                    derivation="${tableDerivation}"
                ></ponder-tabulator>
            </div>
            <div class="ui bottom attached tab segment" data-tab="dashboard">
                <div class="ui charts segment">
                    <div class="ui active centered inline loader"></div>
                    <ponder-barchart  categorylabels=${config.barchart.categoryLabels}
                        categorydatakeys=${config.barchart.categoryDataKeys}
                        categorydatavalues=${config.barchart.categoryDataValues}
                        derivation="svidBarchart/svidBarchart.js" chartid='barchart1'>
                    </ponder-barchart>
                </div>
            </div>
            <div class="ui bottom attached tab segment" data-tab="tenantTable">
                <ponder-tabulator
                    tableid="tenantTable"
                    derivation="tenant/tenant.js"
                ></ponder-tabulator>
            </div>
        </div>
    `;
};

export default template;
