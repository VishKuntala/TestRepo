import { html } from 'lit-element';
import PonderComponent from './PonderComponent';


class Pills extends PonderComponent {

    constructor() {
        super();
        this.id = '';
        this.subscriptions = [];
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'pillsid',
                type: String
            },
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            }
        }
    }

    async initSubscriptions() {
        
        const instance = this;
        instance.stateManager.subscribe("pillsData",
            async d => {
                instance.requestUpdate();
            });
    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        const instance = this;
        $('.label .close')
            .off().on('click', function () {
                instance.store.deletedPill = $(this).attr('label');
                //$(this).closest('.label').transition('fade');
            })
            ;
    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties)  {
        await this.initSubscriptions();
        await this.attachEventHandlers();
    }

    // updated is called after the html is rendered on the DOM. 
    async updated(changedProperties) {
        await this.attachEventHandlers();
    }


    // render the html from the template in the DOM  
    render() {
        // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:pillpriority
        // sort by pillspriority
        const sortedPills = R.map(item => R.reverse(item), R.sortBy(R.identity, R.map(item => R.reverse(item), this.store.pillsData)));
        return html`
            <div class="ui basic labels" id = ${this.id}>
                    ${ sortedPills.map(pill => html`
                    <a class="ui label pill" controlid=${pill.split(':')[2]}>
                        ${pill.split(':')[0]}   
                        <div class="detail">${pill.split(':')[1]}</div> 
                    </a>`)}
            </div>`
    }


}

customElements.define('ponder-pills', Pills);

