import { html } from 'lit-element';
import appHeaderTemplate from '../../templates/components/appHeader.js';
import PonderComponent from './PonderComponent';


class AppHeader extends PonderComponent {

    constructor() {
        super();
    }

    #showScoringDetailsModal() {
        $('.coverageScoreHelp.modal').modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    // render the html from the template in the DOM  
    render() {
        return html`${appHeaderTemplate({ showScoringDetailsModal: this.#showScoringDetailsModal })}`
    }


  }

  customElements.define('ponder-appheader', AppHeader);

