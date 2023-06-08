import { html } from 'lit-element';
import * as R from 'ramda';
import { until } from 'lit-html/directives/until.js';
import appTemplate from '../../templates/components/app.js';
import PonderComponent from './PonderComponent';
import { byocAccessTypes } from '../helpers/dropdownData.js'
import toolConfig from '../helpers/toolConfig.js';
import grants from '../auth/index.js';

class App extends PonderComponent {


    constructor() {
        super();
        this.appState.subscriptions = [];
        this.getAvailableChannels();
        if (this.appState.availableChannels.length) {
            this.initialTool = this.appState.availableChannels[0].value;
        }
        // grab query string params (if any)
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('clusterId')) {
            this.store.appInitializedWithQueryParams = true;
            const entries = urlParams.entries();
            for (let pair of entries) {
                this.store[pair[0]] = pair[1];
            }
        }
        if (this.initialTool) {
            this.#initializeStore(this.initialTool);
        }
    }

    // showing modal
    #showAcknowledgeModal() {
        $('.acknowledge.modal').modal({ 
            closable: false,
            onApprove: async function () {
                const response = await $.ajax({
                    url: `/sales/Engineering/scoring/Scoring.aspx/LogAcknowledge`,
                    headers: { "Content-Type": "application/json" },
                    type: 'post',
                    processData: false
                });
                $('.acknowledge.modal')
                    .modal('close');
            }
        }).modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    #shownotAuthorizedModal() {
        $('.notauthorized.modal').modal({ closable: false }).modal('setting', 'transition', 'fade up')
            .modal('show');
    }



    

    async #setUserPermissions(channel) {
        // const userGroups = ($('#hdnViewerGroupMembership').val() || '').split('|');

        /* const userGroups = (await $.ajax({
            url: `/sales/Engineering/scoring/Scoring.aspx/AssignedUserRoles`,
            headers: { "Content-Type": "application/json" }
        })).d[0].access_group.split('|'); */

        if (!this.appState.userGroups) {
            await this.getAssignedUserRoles();
        }
        this.appState.userPermissions = R.mergeAll(R.filter(item => item.channel === channel || item.channel === "*", R.map(grp => grants[grp], this.appState.userGroups)));
    }


    async initSubscriptions() {
        const instance = this;
        this.stateManager.subscribe("tool",
            async d => {
                if (!R.is(Array, d)) {
                    if (!this.appState.userGroups.length) {
                        $(".filter.segment").hide();
                        $(".mapAndTable.segment").hide();
                        $(".charts.segment").hide();
                        // this.#shownotAuthorizedModal();
                    } else {
                        // this.#showAcknowledgeModal();
                        $(".filter.segment").show();
                        await instance.#setUserPermissions(d.tool);
                        this.#initializeStore(d.tool);
                        $(".mapAndTable.segment").hide();
                        $(".charts.segment").hide();
                        await instance.clearSubscriptions();
                        // get the methodology info for this channel
                        const methodologyResponse = await $.ajax({
                            url: `${$("#hdnBaseSearchApiUrl").val()}/wst-ui-config/configType/methodology/${d.tool}`,
                            headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
                            type: 'get'
                        });
                        instance.store.methodologyAttributes = JSON.parse(methodologyResponse);
                        this.generateMethodologyAttributesHtml();

                        instance.requestUpdate();
                    }
                }


            });


    }

    async clearSubscriptions() {
        if (this.appState.subscriptions) {
            for (let i = 0; i < this.appState.subscriptions.length; i += 1) {
                this.appState.subscriptions[i].unsubscribe();
            }
        }
        this.appState.subscriptions = [];

    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        await this.clearSubscriptions();
        await this.initSubscriptions();
        /*$(".filter.segment").hide();
        $(".mapAndTable.segment").hide();
        $(".charts.segment").hide(); */
        $("#tableSortLoader").hide();
        if (!this.appState.availableChannels?.length) {
            this.#shownotAuthorizedModal();
        }
        
    }

    async updated(changedProperties) {
        this.implementAuthRules();
    }


    // set initial data needed for the app components

    #initializeStore(tool) {

        // stop publishing to subscribers during app initialization
        this.appState.publish = false;
        this.store.config = toolConfig[tool];
        this.store.toolName = this.store.config.toolName;
        this.appState.subscriptions = [];
        this.store.pillsData = [];
        this.store.sortCriteriaData = this.store.config.sortCriteriaData;
        this.store.sortCriteria = this.store.config.startingSortCriteria;
        this.store.compareSvids = [];
        this.store.cardsData = [];
        this.store.triggerDropdownValueChangedEvent = true;
        this.store.currentMapBounds = null;
        this.store.startingMapZoom = 4;
        this.store.startingMapCenter = [37.8, -96];
        this.store.currentMapZoom = 4;
        this.store.currentMapCenter = [37.8, -96];
        this.store.byocAccessTypes = byocAccessTypes;
        this.store.isMobile = L.Browser.mobile;
        if (this.store.config.filter.initialValues) {
            const keys = R.keys(this.store.config.filter.initialValues);
            for (let i = 0; i < keys.length; i += 1) {
                const key = keys[i];
                this.store[key] = this.store.config.filter.initialValues[key];
            }
        }
        // resume publishing to subscribers
        this.appState.publish = true;
    }

    // render the html from the template in the DOM

    render() {
            return this.appState.availableChannels?.length ? html`${appTemplate({
                "initialTool": this.initialTool,
                "filterDerivation": `${this.store.config?.tool}/${this.store.config?.tool}.js`,
                "dashboardDerivation": `${this.store.config?.tool}/${this.store.config?.tool}.js`,
                "datatableDerivation": `${this.store.config?.tool}/${this.store.config?.tool}.js`,
                "mapDerivation": `${this.store.config?.tool}/${this.store.config?.tool}.js`,
                "config": this.store.config,
                "toolName": this.store.config?.toolName
            })}` : html`<div/>`;
    }

    /* render() {
        return html`
                ${until(
                    this.#getAssignedUserRoles()
                .then(response => {
                    return html`${appTemplate({
                        "initialTool": this.initialTool,
                        "filterDerivation": `${this.store.config.tool}/${this.store.config.tool}.js`,
                        "dashboardDerivation": `${this.store.config.tool}/${this.store.config.tool}.js`,
                        "datatableDerivation": `${this.store.config.tool}/${this.store.config.tool}.js`,
                        "mapDerivation": `${this.store.config.tool}/${this.store.config.tool}.js`,
                        "config": this.store.config,
                        "toolName": this.store.config.toolName
                    })}`;
                })
                .catch((error) => { console.error('Error:', error); }),
            html`<h4>Loading...</h4>`
        )}`;
    } */






}

customElements.define('ponder-app', App);