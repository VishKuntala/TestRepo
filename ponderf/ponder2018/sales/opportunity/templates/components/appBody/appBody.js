import { html } from "lit-element";
import "./appBody.css";

const template = ({ zoomIn, zoomOut, toggleCards, togglePanel }) => {
    return html`
        <div class='ponder-app-body'>
            <section class='map-section panel-open'>
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
                <ponder-overlay-menu></ponder-overlay-menu>
                <div class='heatmap-card-info'>
                    <ponder-map-card></ponder-map-card>
                </div>                
                <ponder-azure-map derivation="mainMap/mainMap.js" mapid='mainMap'></ponder-azure-map>
                <div id="psaFooter" style="text-align: center; color: #343a40; font-size: 12px;">
                    Indoor Coverage Score was generated for each PSA Location
                    <br />
                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                </div>          
            </section>            
            <section class='panel-section panel-open'>
                <ponder-filter-table-panel></ponder-filter-table-panel>
            </section>
        </div>
    `;
};

export default template;
