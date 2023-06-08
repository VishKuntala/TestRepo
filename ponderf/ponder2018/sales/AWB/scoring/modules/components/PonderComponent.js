import {LitElement, html} from 'lit-element';
import * as R  from 'ramda';
import StateManager from '../StateManager.js';
import grants from '../auth/index.js';
import { channels } from '../helpers/dropdownData.js'


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


    appendSubscription(subscription) {
        // const subscriptions = R.clone(this.store.subscriptions);
        this.appState.subscriptions.push(subscription);
        // console.log(this.appState.subscriptions);
        // this.store.subscriptions = R.clone(subscriptions);
        // console.log('this.store.subscriptions');
        // console.log(this.store.subscriptions);
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

    async getAssignedUserRoles() {
        const response = await $.ajax({
            url: `/sales/AWB/scoring/Scoring.aspx/AssignedUserRoles`,
            headers: { "Content-Type": "application/json" }
        });
        if (response && response.d && response.d.length) {
            this.appState.userGroups = response.d[0].access_group.split('|');
        } else {
            this.appState.userGroups = [];
        }
        return true;
    }


    async getAvailableChannels() {
        if (!this.appState.userGroups) {
            await this.getAssignedUserRoles();
        }
        const allowedChannels = R.pluck('channel', R.map(grp => grants[grp], this.appState.userGroups));
        let availableChannels = [];
        if (R.includes("*", allowedChannels)) {
            availableChannels = channels;
        } else {
            const idLimitedChannels = R.filter(item => R.head(item) === "@", allowedChannels);
            if (idLimitedChannels.length) {
                const idLimit = parseInt(R.last(idLimitedChannels[0]), 10);
                availableChannels = R.filter(item => item.authid <= idLimit, channels);
            } else {
                availableChannels = R.filter(item => R.includes(item.value, allowedChannels), channels);
            }
        }

        // if the app is not running locally, filter channels that are only available for prod
        if (!R.includes(location.hostname, ["localhost", "127.0.0.1", ""])) {
            availableChannels = R.filter(item => item.stage === "prod", availableChannels);
        }
        this.appState.availableChannels = availableChannels;

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