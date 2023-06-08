import { html } from "lit-element";
import "./overlayMenu.css";

const template = ({
    currentZoom,
    closeTools,
    clearBusinessSearch,
    clearZipBoundary,
    colorRamp,
    legendTitle,
    showLegend,
    zoomAltText,
    clearNsbBoundary,
}) => {

    const pointLegend = colorRamp.map(({ color, heading }) => {
        return html`
             <div class="selection-inputs">
                <rectangle-icon width="8" height="8" color="${color}"></rectangle-icon>&nbsp;${heading}
             </div>
        `;
    });

    return html`
        <div id="btnClearZipBoundary" class='ui ponderHidden button' @click="${clearZipBoundary}">Clear ZIP Boundary</div>
        <div id="btnClearBusinessSearch" class='ui ponderHidden button' @click="${clearBusinessSearch}">Clear Business Search</div>
        <div id="btnClearNsbBoundary" class='ui ponderHidden button' @click="${clearNsbBoundary}">Clear NSB Boundary</div>
        <br/><br/>
        <div class='ponder-overlay-menu'>        
            <div><a id="zoomAltText" class="ui ${!zoomAltText ? 'hidden' : ''} blue ribbon label">${zoomAltText || ``}</a></div>
            <div id="pointLegend" class='ui raised vertical accordion menu legend-container ${showLegend ? '' : 'ponderHidden'}'>
                <div class='item'>
                    <a class='active title'>
                        <h5>${legendTitle}</h5>
                        <i class="minus icon"></i>
                    </a>
                    <div class='active content'>
                        <div class='points-selection-list'>
                            ${pointLegend}
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    `;
};

export default template;
