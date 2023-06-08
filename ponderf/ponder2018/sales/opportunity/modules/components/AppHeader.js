import { html } from 'lit-element';
import appHeaderTemplate from '../../templates/components/appHeader/appHeader.js';
import PonderComponent from './PonderComponent';

class AppHeader extends PonderComponent {
    constructor() {
        super();        
    }

    // showing modal
    async #showScoringDetailsModal() {
        const result = await this.postData(`${this.store.baseApiUrl}/table/datainfo`);
        this.store.dataInfo = result.data;
        $('.coverageScoreHelp.modal').modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    async initSubscriptions() {
        const instance = this;
        instance.stateManager.subscribe("dataInfo",
            async d => {
                if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
                instance.requestUpdate(); //dataInfo is updated re render the component
            });
    }

    async firstUpdated() {
        await this.attachEventHandlers();
        await this.initSubscriptions();
    }

    // render the html from the template in the DOM  
    render() {        
        return html`${appHeaderTemplate({
            rootUrl: this.store.rootUrl,
            baseApiUrl: this.store.baseApiUrl,
            showScoringDetailsModal: this.#showScoringDetailsModal,
            dataInfo: this.store.dataInfo
        })}`
    }
}

customElements.define('ponder-appheader', AppHeader);

