import { html } from 'lit-element';
import appHeaderTemplate from '../../templates/components/appHeader.js';
import PonderComponent from './PonderComponent';
import { channels } from '../helpers/dropdownData.js'
import grants from '../auth/index.js';

class AppHeader extends PonderComponent {

    constructor() {
        super();
        this.title = "";
        this.initialTool = "";
    }


    // declare properties and map it from attribute values
    static get properties() {
        return {
            title: {
                type: String
            },
            initialTool: {
                attribute: 'initialtool',
                type: String
            },
        }
    }

    // showing modal
    #showAcknowledgeModal() {
        $('.acknowledge.modal').modal({ closable: false }).modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    #shownotAuthorizedModal() {
        $('.notauthorized.modal').modal({ closable: false }).modal('setting', 'transition', 'fade up')
            .modal('show');
    }


    // showing modal
    #showScoringDetailsModal() {
        const instance = this;
        $('.coverageScoreHelp.modal').modal({
            onShow: async function () {
                $('#methodologyContent').html(instance.store.methodologyAttributesHtml);
            }
        }).modal('setting', 'transition', 'fade up')
            .modal('show'); 
    }

    async #sendSupportEmail() {
        document.location = `mailto:g16274@att.com?subject=PONDER%20%2D%20Wireless%20Scoring%20Feedback`;
    }

    async #navigateToByoc() {
        window.open(`/sales/byoc/BYOC.aspx`,'_blank');
    }

    /* async #allowedChannels(accessGroups) {
        return R.pluck('channel',R.map(grp => grants[grp], accessGroups));
    } */

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        // const groupMembership = $('#hdnViewerGroupMembership').val();
        // const allowedChannels = await this.#allowedChannels(groupMembership.split('|'));

        /* if (!this.appState.userGroups) {
            await this.getAssignedUserRoles();
        }
        const allowedChannels = await this.#allowedChannels(this.appState.userGroups);
        let availableChannels = R.contains("*", allowedChannels) ? channels : R.filter(item => R.contains(item.value,allowedChannels), channels);

        // if the app is not running locally, filter channels that are only available for prod
        if (!R.includes(location.hostname,["localhost","127.0.0.1",""])) {
            availableChannels = R.filter(item => item.stage === "prod", availableChannels);
        }
        this.appState.availableChannels = availableChannels; */
        await this.getAvailableChannels();
        const instance = this;
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('channel') && this.appState.availableChannels.length) {
            this.initialTool = R.contains(urlParams.get('channel'), R.pluck('value', this.appState.availableChannels)) ? urlParams.get('channel') : this.appState.availableChannels[0].value;
        } else {
            instance.initialTool = this.appState.availableChannels.length ? this.appState.availableChannels[0].value : null;
        }
        if (!instance.initialTool) {
            this.#shownotAuthorizedModal();
        } else {
            this.#showAcknowledgeModal();
            // get the methodology info for this channel
            const methodologyResponse = await $.ajax({
                url: `${$("#hdnBaseSearchApiUrl").val()}/wst-ui-config/configType/methodology/${instance.initialTool}`,
                headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
                type: 'get'
            });
            instance.store.methodologyAttributes = JSON.parse(methodologyResponse);
            instance.generateMethodologyAttributesHtml();
        }
        $(`.ui.toolSelector.dropdown`).dropdown({
            values: R.map(item => {
                if (item.value === instance.initialTool) {
                    item.selected = true;
                }
                return item;
            }, this.appState.availableChannels),
            clearable: false,
            onChange: (value, text, $choice) => {
                 if (value) {
                    instance.title = text;
                    instance.store.toolName = text;
                    instance.store.tool = { tool: value };
                 }
            }
        });
        $(`.ui.toolSelector.dropdown`).dropdown('set exactly', instance.initialTool);
        await instance.attachEventHandlers();

    }

    // render the html from the template in the DOM  
    render() {
        return html`${appHeaderTemplate({
            title: this.title,
            initialTool: this.initialTool,
            showScoringDetailsModal: this.#showScoringDetailsModal,
            sendSupportEmail: this.#sendSupportEmail,
            navigateToByoc: this.#navigateToByoc
        })}`
    }


}

customElements.define('ponder-appheader', AppHeader);

