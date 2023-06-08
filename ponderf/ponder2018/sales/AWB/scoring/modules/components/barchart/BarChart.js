import { html } from 'lit-element';
import Highcharts from 'highcharts';
import barChartTemplate from '../../../templates/components/barChart.js';
import PonderComponent from '../PonderComponent';


class BarChart extends PonderComponent {

    constructor() {
        super();
        this.title = '';
        this.id = '';
        this.derivation = null;
        this.derivedClass = null;
        this.chartType = 'bar';
        this.categoryLabels = [];
        this.categoryDataKeys = [];
        this.categoryDataValues = [];
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            title: {
                type: String
            },
            id: {
                attribute: 'chartid',
                type: String
            },
            derivation: {
                attribute: 'derivation',
                type: String
            },
            categoryLabels: {
                attribute: 'categorylabels',
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            categoryDataKeys: {
                attribute: 'categorydatakeys',
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            categoryDataValues: {
                attribute: 'categorydatavalues',
                type: Array,
                converter: value => value ? value.split(',') : []
            }
            
        }
    }

    async renderChart(series) {
        const instance = this;
        let barChartConfig = {
            chart: {
                type: this.chartType
            },
            title: {
                text: this.title
            },
            credits: {
                enabled: false
            }
        };
    if (instance.derivedClass && instance.derivedClass.barChartConfig) {
            barChartConfig = Object.assign(barChartConfig, instance.derivedClass.barChartConfig);
        }
        barChartConfig.series = series;
        Highcharts.chart(this.id, barChartConfig);
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
        await this.renderChart();
    }

    // render the html from the template in the DOM  
    render() {
        return html`${barChartTemplate({ id: this.id })}`
    }


}

customElements.define('ponder-barchart', BarChart);

