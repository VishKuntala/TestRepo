import { html } from 'lit-element';
import appHeaderTemplate from '../../templates/components/appHeader.js';
import PonderComponent from './PonderComponent';


class AppHeader extends PonderComponent {

    constructor() {
        super();
    }



    #showScoringDetailsModal() {
        const instance = this;
        $('.coverageScoreHelp.modal').modal({
            onShow: async function () {
                if (!instance.store.methodologyAttributes) {
                    const methodologyResponse = await $.ajax({
                        url: `${$("#hdnBaseSearchApiUrl").val()}/wst-ui-config/configType/methodology/byoc`,
                        headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
                        type: 'get'
                    });
                    instance.store.methodologyAttributes = JSON.parse(methodologyResponse);
                    instance.generateMethodologyAttributesHtml();
                }
                $('#methodologyContent').html(instance.store.methodologyAttributesHtml);
            }}).modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    // render the html from the template in the DOM  
    render() {
        return html`${appHeaderTemplate({ showScoringDetailsModal: this.#showScoringDetailsModal })}`
    }


  }

  customElements.define('ponder-appheader', AppHeader);

