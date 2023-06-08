import { html } from "lit-element";
import "./pointsSelectionCard.css";

const template = ({ mapLayerInfo, toggleLayer, toggleSatelliteView, toggleNSBBoundaryLayer, showNsbLayer, config }) => {
    const mapLayers = mapLayerInfo.map(({ id, name, checked, svgIcon, isNameOverridable }) => {
        return html`
            <div class="selection-inputs ${id}">
               <input type="checkbox" id="${id}" name="${id}" @change="${toggleLayer}" .checked=${checked}>
               <label for="${id}">${svgIcon}${isNameOverridable ? config.map.layerNameOverrides?.[id] || name : name}</label>
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
                            </div> ${showNsbLayer ?
                            html`<div class="field">
                                <div class="ui checkbox">
                                    <input type="checkbox" name="nsbBoundary" id='nsbBoundary' @change="${toggleNSBBoundaryLayer}">
                                    <label for='nsbBoundary'>NSBs</label>
                                </div>
                            </div>`: html`<span/>`}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
};

export default template;
