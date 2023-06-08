import { html } from "lit-element";
import "./overlayMenu.css";

const template = ({
    currentZoom,
    closeTools,
    clearZipBoundary,
    clearCountyBoundary,
    clearDMABoundary,
    clearPSAFilter,
    clearMapMarkers,
}) => {
    return html`
        <div class='overlay-menu'>
        <div class="field loading-map">
                <div id="loadingDiv" class="ui blue slow filling indeterminate progress" style="width:250px;visibility:hidden">
                    <div class="bar">
                        <div class="progress">Loading map data ...</div>
                    </div>
                </div>
        </div>
        <div class='ponder-overlay-menu'>
           <div><p>Zoom: ${Number.parseFloat(currentZoom).toFixed(2)}</p></div>
           <div id="btnClearZipBoundary" class='ui ponderHidden button' @click="${clearZipBoundary}">Clear ZIP Boundary</div>
           <div id="btnClearCountyBoundary" class='ui ponderHidden button' @click="${clearCountyBoundary}">Clear COUNTY Boundary</div>
           <div id="btnClearDMABoundary" class='ui ponderHidden button' @click="${clearDMABoundary}">Clear DMA Boundary</div>
           <div id="btnClearPSAFilter" class='ui ponderHidden button' @click="${clearPSAFilter}">Clear PSA Filter</div>
           <div id="btnClearMapMarkers" class='ui ponderHidden button' @click="${clearMapMarkers}">Clear Map Markers</div>
        </div>
        </div>
    `;
};

export default template;
