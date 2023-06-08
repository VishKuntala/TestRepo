import { html } from 'lit-element';
import * as R from 'ramda';
import $ from "jquery";
import dashboardTemplate from '../../../templates/components/dashboard.js';
import PonderComponent from '../PonderComponent.js';




class Dashboard extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.subscriptions = [];
        this.mapData = null;
        this.derivation = null;
        this.derivedClass = null;


    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'filterid',
                type: String
            },
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            derivation: {
                attribute: 'derivation',
                type: String
            }
        }
    }

    // render the html from the template in the DOM

    render() {
        return html`${dashboardTemplate({
            id: this.id
        })}`
    }


    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {
        this.derivedClass && this.derivedClass.initSubscriptions ? await this.derivedClass.initSubscriptions() : null;
    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
            $('.dashboard.container').html(this.derivedClass.html({ id: this.id, config: this.store.config }));
        }
        await this.initSubscriptions();
    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
            $('.dashboard.container').html(this.derivedClass.html({ id: this.id, config: this.store.config }));
        }
        await this.attachEventHandlers();
        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;


    }



}


customElements.define('ponder-dashboard', Dashboard);


