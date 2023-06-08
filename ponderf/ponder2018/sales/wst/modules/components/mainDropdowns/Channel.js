import { html } from "lit-element";
import $ from "jquery";
import * as R from 'ramda';
import channelTemplate from "../../../templates/components/mainDropdowns/channel.js";
import PonderComponent from "../PonderComponent.js";
import { channels } from "./config/config.js";
import toolConfig from '../../helpers/toolConfig/index.js';

class Channel extends PonderComponent {
    constructor() {
        super();
        this.id = "channelDropdown";
        this.initialTool = "";
        this.channels = [];
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
        const url = window.location.pathname;
        const aspxPage = url.substring(url.lastIndexOf('/') + 1).split('?')[0];
        $('.acknowledge.modal').modal({
            closable: false,
            onApprove: async function () {
                const response = await $.ajax({
                    url: `/sales/wst/${aspxPage}/LogAcknowledge`,
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


    async handleOnChange(e) {
        const instance = this;
        const selectedText = $(`#${e.target.id}`).find(":selected").text();
        const selectedValue = $(`#${e.target.id}`).find(":selected").val();
        if (selectedValue) {
            instance.title = selectedText;
            instance.store.toolName = selectedText;
            instance.store.tool = { tool: selectedValue };
            const currentConfig = toolConfig[$('#hdnAppName').val()][selectedValue];
            this.store.locationAttribute = currentConfig.defaultLocationAttribute;
            this.store.heatmap = currentConfig.defaultHeatmap;
            this.store.currentHeatmapFilter = currentConfig.defaultHeatmap;
            // this.store.updateLayers = `${Date.now().toString()}`;
            if (instance.store.isChannelActive) {
               // instance.store.isChannelActive = false;
               // instance.store.clearClusterLayer = true;
            }
            // if (instance.store.isChannelActive) {
               // this.store.channelChanged = true;
                this.store.resetMapToInitialView = `${Date.now().toString()}`;
             // }
            $('.map-section').dimmer({
                on: 'hover'
            });
            $(`.ponder-search-container`).addClass('ponderHidden');
            $(".showFilter.button").html('Hide Filter');
            $(".saveFilter.button").hide();
        }
    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
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
        }
        this.channels = R.map(item => {
            if (item.value === instance.initialTool) {
                item.selected = true;
            }
            return item;
        }, this.appState.availableChannels);

        await instance.attachEventHandlers();

    }

    // render the html from the template in the DOM
    render() {
        return html`${channelTemplate({
            id: this.id,
            dropdownOptions: this.channels,
            handleOnChange: this.handleOnChange,
        })}`;
    }
}

customElements.define("ponder-channel-dropdown", Channel);
