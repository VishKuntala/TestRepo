import { html } from "lit-element";
import "./appBody.css";

const template = ({ zoomIn, zoomOut, toggleCards, togglePanel }) => {
    return html`
        <div class='ponder-app-body'>
            <section class='ui blurring map-section panel-open'>
                <div class="ui inverted dimmer">
                    <div class="content">
                        <h3 class="ui inverted icon header">
                                Please select filter criteria on the right and click submit
                        </h3>
                    </div>
                </div>
                <div class='map-controls'>
                    <points-selection-card ispanelopen="true"></points-selection-card>
                    <div class='map-controls-buttons'>
                        <div class='ui buttons'>
                            <button class='ui compact button' @click="${zoomOut}"><i class="fitted minus icon"></i></button>
                            <button class='ui compact button' @click="${zoomIn}"><i class="fitted plus icon"></i></button>
                        </div>
                        <button class='ui compact button toggle-panels-btn' @click="${toggleCards}"><i class="fitted eye icon"></i></button>
                        <button class='ui compact button panel-toggle-button' @click="${togglePanel}"><i id='panel-toggle-icon' class="fitted expand icon"></i></button>
                    </div>
                </div>
                <div class='overlay-menu'>
                    <ponder-overlay-menu></ponder-overlay-menu>
                </div>
                <div class='heatmap-card-info'>
                    <ponder-map-card></ponder-map-card>
                </div>
                <ponder-azure-map derivation="mainMap/mainMap.js" mapid='mainMap'></ponder-azure-map>               
            </section>
            <section class='panel-section panel-open'>
                <ponder-filter-table-panel></ponder-filter-table-panel>
            </section>
        </div>
    `;
};

export default template;


