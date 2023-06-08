import { html } from 'lit-element';
import mapTemplate from '../../templates/components/map.js';
import createMaskCanvas from '../createMaskCanvas.js';
import {  getBaseLayers, getOverlayLayers, resetOverlayLayers, resetMapOverlaysData, rebuildMapOverlaysData } from '../mapLayers.js';
import {  createMap } from '../createMap.js';
import { updateOverlaysLabel } from "../helpers/layersControl.js";
import PonderComponent from './PonderComponent';


class Map extends PonderComponent {


    constructor() {
        super();
        this.map = null;
        this.mapData = null;
        this.id = '';
        this.subscriptions = [];
        this.canvasOptions = {};
        this.layerOptions = {};
    }

    // declare properties and map it from attribute values
    static get properties() { 
        return { 
          id: { 
              attribute: 'mapid'
          },
          subscriptions: {
              type: Array,
              converter:  value =>  value ? value.split(',') : []
          },
          layerOptions: {
            attribute: 'layer-options',
            type: Object,
            converter:  value =>  value ? JSON.parse(value) : {}
         },
         canvasOptions: {
            attribute: 'canvas-options',
            type: Object,
            converter: value => { console.log(value); return value ? JSON.parse(value) : {}}
         }
      }
    }

    // private class method (starts with #)
    async #createMaskLayer (layerData) {
        const { title } = this.layerOptions;
        let pane = this.map.getPane(title);
        if (!pane) {
            pane = this.map.createPane(title);
            pane.style.zIndex = 400;
        }
        const response = createMaskCanvas( 
            Object.assign(this.canvasOptions, { pane }),
            this.layerOptions,
            layerData);
            return response;
    }


    // private class method (starts with #)
    async #renderMap() {
        if (this.map){
            this.map.off();
            this.map.remove();
        }
        this.map = await createMap({id:this.id});
        if (this.mapData && this.mapData.length) {
            const response = await this.#createMaskLayer(this.mapData);
            const maskLayer = response.canvasLayer;
            this.map.addLayer(maskLayer);
            rebuildMapOverlaysData(this.map);
            updateOverlaysLabel();
        }
        L.control.layers(getBaseLayers(), getOverlayLayers(), { collapsed: false }).addTo(this.map);
    }

    // render the html from the template in the DOM  
    render() {
        return html`${mapTemplate({id: this.id})}`
    }

    // updated is called after the html is rendered on the DOM. 
    async updated(changedProperties) {
        await this.initSubscriptions();
        await this.#renderMap();
    }

    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {
        const instance = this;
        for (let i = 0; i < this.subscriptions.length; i += 1) {
            const subscription = this.subscriptions[i];
            if (subscription === "mapData") {
                instance.stateManager.subscribe(subscription, 
                    async d => {
                    instance[subscription] = d;
                    await instance.#renderMap();
                });
            }
        }
    }


  }

  customElements.define('ponder-map', Map);

export default Map;