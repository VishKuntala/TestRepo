import { html } from 'lit-element';
import PonderComponent from '../PonderComponent';
import chartLegendTemplate from '../../../templates/components/chartLegend.js';


class ChartLegend extends PonderComponent {

    constructor() {
        super();
        this.id = '';
        this.derivation = null;
        this.derivedClass = null;
        this.legends = [];
        this.legendDataKey = '';
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'legendid',
                type: String
            },
            derivation: {
                attribute: 'derivation',
                type: String
            },
            legendDataKey: {
                attribute: 'legenddatakey',
                type: String
            }
        }
    }



    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

    async initSubscriptions() {
        const instance = this;
        instance.stateManager.subscribe(instance.legendDataKey,
            async d => {
                if (d) {
                    instance.legends = d;
                    instance.requestUpdate();
                }
            });
        this.derivedClass && this.derivedClass.initSubscriptions ? await this.derivedClass.initSubscriptions() : null;
    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.initSubscriptions();
    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.attachEventHandlers();
        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;
    }


    // render the html from the template in the DOM  
    render() {
        return html`${chartLegendTemplate({
            id: this.id,
            legends: this.legends
        })}`;
    }


}

customElements.define('ponder-chartlegend', ChartLegend);

