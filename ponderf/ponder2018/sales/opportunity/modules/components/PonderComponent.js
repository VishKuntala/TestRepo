import {LitElement, html} from 'lit-element';
import * as R from 'ramda';
import axios from "axios";
import StateManager from '../StateManager.js';


// the parent class for all components in the app. Usually it is not required to do any edits to this class.
// New UI components need to extend this class and add any implementation details

class PonderComponent extends LitElement {

    #store
    #stateManager
    #appState


    constructor() {
        super();
        this.#stateManager = new StateManager();
        this.#store = this.#stateManager.store;
        this.#appState = this.#stateManager.appState;
    }

    get appState() {
        return this.#appState;
    }

    get store() {
        return this.#store;
      }

    get stateManager() {
        return this.#stateManager;
    }

    async getData(url, params) {
        const buildQueryString = (params) => {
            const queryString = Object.keys(params)
                .map(key => `${encodeURIComponent(key)}=${encodeURIComponent(params[key])}`)
                .join('&');
            return queryString;
        }
        params = Object.assign({
            searchedZip: this.store.searchMode === 'zipSearch' ? this.store.searchedZip : null,
            searchedCounty: this.store.searchMode === 'countySearch' ? this.store.searchedCounty : null,
            searchedDMA: this.store.searchMode === 'dmaSearch' ? this.store.searchedDMA : null,
        }, params);
        const updatedURL = url + `?${buildQueryString(params)}`;
        const result = await $.ajax({
            url: updatedURL,
            async: false,
            headers: { "Content-Type": "application/json", Authorization: $("#hdnToken").val() },
            //error: function (jqXHR, textStatus, errorThrown) {
            //    console.log('error from ajax call');
            //    console.log(jqXHR);
            //    for (const key in jqXHR) {
            //        if (key == "statusText")
            //            alert('getData ' + `${key}: ${jqXHR[key]}`);
            //    }
            //    alert('textStatus: ' + textStatus);
            //    alert('errorThrown: ' + errorThrown);
            //}
        });
        return JSON.parse(result);
    }

    async postData(url, params) {
        const postData = Object.assign({
            searchedZip: this.store.searchMode === 'zipSearch' ? this.store.searchedZip : null,
            searchedCounty: this.store.searchMode === 'countySearch' ? this.store.searchedCounty : null,
            searchedDMA: this.store.searchMode === 'dmaSearch' ? this.store.searchedDMA : null,
            searchedPSA: this.store.searchedPSA ? this.store.searchedPSA : null,
        }, params);
        const response = await $.ajax({
            url,
            headers: { "Content-Type": "application/json", Authorization: $("#hdnToken").val() },
            type: 'post',
            async: false,
            data: JSON.stringify(postData),
            contentType: "application/json; charset=utf-8",
            error: function (jqXHR, textStatus, errorThrown) {
                console.log('error from ajax call');
                console.log(jqXHR);
                for (const key in jqXHR) {
                    errorMessage = errorMessage + `${key}: ${error[key]}` + '\n';
                    if (key == "statusText")
                        alert('postData ' +  `${key}: ${jqXHR[key]}`);
                }
                alert('textStatus: ' + textStatus);
                alert('errorThrown: ' + errorThrown);
            }
        });
        return JSON.parse(response);
    }

    appendSubscription(subscription) {
        // const subscriptions = R.clone(this.store.subscriptions);
        this.appState.subscriptions.push(subscription);
        // console.log(this.appState.subscriptions);
        // this.store.subscriptions = R.clone(subscriptions);
        // console.log('this.store.subscriptions');
        // console.log(this.store.subscriptions);
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

    /* async connectedCallback() {
        super.connectedCallback();
    } */

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