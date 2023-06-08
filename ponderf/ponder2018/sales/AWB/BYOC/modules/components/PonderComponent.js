import {LitElement, html} from 'lit-element';
import * as R  from 'ramda';
import StateManager from '../StateManager.js';


// the parent class for all components in the app. Usually it is not required to do any edits to this class.
// New UI components need to extend this class and add any implementation details

class PonderComponent extends LitElement {

    #store
    #stateManager


    constructor() {
        super();
        this.#stateManager = new StateManager();
        this.#store = this.#stateManager.store;
    }

    get store() {
        return this.#store;
      }

      get stateManager() {
        return this.#stateManager;
      }

    // render the html from the template in the DOM  
    render() {

    }

    createRenderRoot() {
        /**
         * Render template without shadow DOM. Note that shadow DOM features like
         * encapsulated CSS and slots are unavailable.
         */
          return this;
    }

    async connectedCallback() {
        super.connectedCallback();
        console.log(this);
        this.store[this.localName] = this;
    }

    disconnectedCallback() {
        super.disconnectedCallback();
        console.log(this);
    }

     /* attributeChangedCallback(name, oldValue, newValue) {
        console.log('attributeChangedCallback');
        console.log(name);
        console.log(oldValue);
        console.log(newValue);
        this[name] = newValue;
       
    } */


    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        
    }

    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {

    }


  }

export default PonderComponent;