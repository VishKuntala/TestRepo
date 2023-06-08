import { html } from 'lit-element';
import appHeaderTemplate from '../../templates/components/appHeader/appHeader.js';
import PonderComponent from './PonderComponent';

class AppHeader extends PonderComponent {
    constructor() {
        super();
    }

    #showAcknowledgeModal() {
        $('.acknowledge.modal').modal({
            closable: false,
            onApprove: async function () {
                const response = await $.ajax({
                    url: `/sales/servicestatus/ServiceStatus.aspx/LogAcknowledge`,
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

    async firstUpdated(changedProperties) {
        if ($("#hdnViewerGroupMembership").val() !== 'ADMIN' && $("#hdnViewerGroupMembership").val() !== 'Unlimited') {
            this.#shownotAuthorizedModal();
        } else {
            this.#showAcknowledgeModal();
        }
    }

    // render the html from the template in the DOM  
    render() {
        return html`${appHeaderTemplate({
            rootUrl: this.store.rootUrl
        })}` ;
    }
}

customElements.define('ponder-appheader', AppHeader);

