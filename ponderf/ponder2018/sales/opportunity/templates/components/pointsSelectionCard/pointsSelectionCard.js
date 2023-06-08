import { html } from "lit-element";
import "./pointsSelectionCard.css";

const template = ({ mapLayerInfo, toggleLayer, toggleSatelliteView }) => {
    const mapLayers = mapLayerInfo.map(({ id, name, checked, svgIcon }) => {
        return html`
            <div class="selection-inputs ${id}">
               <input type="checkbox" id="${id}" name="${id}" @change="${toggleLayer}" .checked=${checked}>
               <label for="${id}">${svgIcon}${name}</label>
            </div>
        `;
    });

    return html`
        <div class='ui raised vertical accordion menu points-selection-container'>
            <div class='item'>
                <a class='active title'>
                    <h5>Overlay Selection</h5>
                    <i class="minus icon"></i>
                </a>
                <div class='active content'>
                    <div class='points-selection-list'>
                        ${mapLayers}
                    </div>
                    <div class="ui form basemap-layers">
                        <div class='grouped fields'>
                            <label>Layers</label>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input type="radio" name="basemaps" id='street' checked="checked" @change="${toggleSatelliteView}">
                                    <label for='street'>Street</label>
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input type="radio" name="basemaps" id='satellite' @change="${toggleSatelliteView}">
                                    <label for='satellite'>Satellite</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
};

export default template;
