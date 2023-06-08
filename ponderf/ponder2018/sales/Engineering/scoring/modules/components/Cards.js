import { html } from 'lit-element';
import * as R from 'ramda';
import PonderComponent from './PonderComponent';
import cardsTemplate from '../../templates/components/cards.js';


class Cards extends PonderComponent {

    constructor() {
        super();
        this.id = '';
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'cardsid',
                type: String
            }
        }
    }

    async initSubscriptions() {

        const instance = this;
        instance.stateManager.subscribe("cardsData",
            async d => {
                instance.requestUpdate();
            });

    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {

    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        await this.initSubscriptions();
        await this.attachEventHandlers();
    }

    // updated is called after the html is rendered on the DOM. 
    async updated(changedProperties) {
        await this.attachEventHandlers();
        if (this.store.cardsData.length === 2) {
            $('#btnCompare').removeClass('disabled');
        } else {
            $('#btnCompare').addClass('disabled');
        }
    }

    #showModal() {
        const instance = this;
        $('.compare.modal').modal({
            onDeny: async function () {
                // instance.#clearForm();
            },
            onHide: async function () {
                // instance.#clearForm();
            }
        }).modal('setting', 'transition', 'fade up')
            .modal('show');
    }

    compareCards(e) {
        this.#showModal();
    }

    removeCard(e) {
        this.store.cardsData = R.filter(item => item.id !== $(e.target).attr('data-card-id'), this.store.cardsData);
        this.store.removeCard = $(e.target).attr('data-card-id');
        if (!this.store.cardsData.length) {
            $('.ponderCards.message').removeClass('visible').addClass('hidden');
        }
    }

    removeAllCards() {
        this.store.cardsData = [];
        // generate a randomn id to trigger the publish event
        this.store.removeAllCards = Date.now();
        $('.ponderCards.message').removeClass('visible').addClass('hidden');

    }


    // render the html from the template in the DOM  
    render() {
        return html`${cardsTemplate({
            id: this.id,
            cards: this.store.cardsData,
            removeCard: this.removeCard,
            removeAllCards: this.removeAllCards,
            compareCards: this.compareCards
        })}`;
    }


}

customElements.define('ponder-cards', Cards);

