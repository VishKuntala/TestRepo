import { html } from 'lit-element';
import { until } from 'lit-html/directives/until.js';
import $ from "jquery";
import * as R from 'ramda';
import appTemplate from '../../templates/components/app.js';
import PonderComponent from './PonderComponent';



class App extends PonderComponent {


    constructor() {
        super();
        this.subscriptions = [];
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            }
        }
    }

    async #getData(url) {
        return (await $.ajax({
            url,
            headers: { "Content-Type": "application/json" }
        })).d;
    }

    // set initial data needed for the app components
    async #initializeStore() {
        const adminUser = $('#hdnViewerAttId').val();
        this.store.baseSearchApiUrl = $("#hdnBaseSearchApiUrl").val();
        this.store.rootUrl = $("#hdnRootUrl").val();
        this.store.baseSearchApiUrl = $("#hdnBaseSearchApiUrl").val();
        return true;
    }




    // render the html from the template in the DOM

    render() {
        return html`
                ${until(
            this.#initializeStore()
                .then(response => {
                    return html`${appTemplate({
                        baseSearchApiUrl: this.store.baseSearchApiUrl,
                        hasAccess: $("#hdnViewerGroupMembership").val() === 'ADMIN' || $("#hdnViewerGroupMembership").val() === 'Unlimited'
                    })}`;
                })
                .catch((error) => { console.error('Error:', error); }),
            html`<h4>Loading...</h4>`
        )}`;
    }


    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {
        const instance = this;

    }

    async firstUpdated(changedProperties) {
        $("#divLoader").hide();
        $("#divStatus").hide();
        $("#lblStatus").hide();
      
    }

    async updated(changedProperties) {
        await this.initSubscriptions();

    }

}

customElements.define('ponder-app', App);