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


    getData(url, params) {
        return axios.get(
            url,
            {
                params: Object.assign({ searchedZip: this.store.searchMode === 'zipSearch' ? this.store.searchedZip : null }, params),
                headers: {
                    Authorization: $("#hdnToken").val(),
                },
            }
        )
    }

    postData(url, data) {
        return axios.post(
            url,
            Object.assign({ searchedZip: this.store.searchMode === 'zipSearch' ? this.store.searchedZip : null }, data),
            {
                headers: {
                    Authorization: $("#hdnToken").val(),
                },
            }
        )
    }

    appendSubscription(subscription) {
        // const subscriptions = R.clone(this.store.subscriptions);
        this.appState.subscriptions.push(subscription);
        // this.store.subscriptions = R.clone(subscriptions);
    }

    implementAuthRules(channel) {
        for (let i = 0; i < $("[data-auth-keys]").length; i += 1) {
            const component = $($("[data-auth-keys]")[i]);
            const authKeys = component.attr("data-auth-keys") ? component.attr("data-auth-keys").split(',') : [];
            const authEvals = R.props(authKeys, this.appState.userPermissions);
            const authCondition = R.reduce(R.and, true, authEvals);
            if (authCondition) {
                component.show();
             } else {
                component.hide();
             }
        }

    }

     getAssignedUserRoles() {
        /* const response = await $.ajax({
             url: `/sales/wst/Scoring.aspx/AssignedUserRoles`,
             headers: { "Content-Type": "application/json" }
         });
         if (response && response.d && response.d.length) {
             this.appState.userGroups = response.d[0].access_group.split('|');
         } else {
             this.appState.userGroups = [];
         } */
        this.appState.userGroups = $("#hdnViewerGroupMembership").val().split('|');
        return true;
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