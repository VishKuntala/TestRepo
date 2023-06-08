import Highcharts from 'highcharts';
import * as R from 'ramda';
import { html } from 'lit-element';
import chartTemplate from '../../templates/components/chart.js';
import PonderComponent from './PonderComponent';


class PieChart extends PonderComponent {

    #seriesDataConfig

    constructor() {
        super();
        // this.mapData = null;
        this.id = '';
        this.groupByProp = '';
        this.aggregateType = 'COUNT';
        this.subscriptions = [];
        this.chartOptions = {};
        this.#seriesDataConfig = {
            "COUNT": {
                "aggregateFunc": (accumulator, { }) => accumulator + 1,
                "accumulatorInitValue": 0,
                "groupByFunc": prop => R.prop(prop),
            }
        }
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'chartid',
                type: String
            },
            groupByProp: {
                attribute: 'group-by-prop',
                type: String
            },
            aggregateType: {
                attribute: 'aggregate-type',
                type: String
            },
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            chartOptions: {
                attribute: 'chart-options',
                type: Object,
                converter: value =>  value ? JSON.parse(value) : {} 
            }
        }
    }


// private class method (starts with #)
async #getSeriesData() {
    const { aggregateFunc, accumulatorInitValue, groupByFunc } = this.#seriesDataConfig[this.aggregateType];
    const groupedData = R.reduceBy(aggregateFunc, accumulatorInitValue, groupByFunc(this.groupByProp), this.mapData);
    const keys = R.keys(groupedData);
    return R.map(key => { return { name: key, y: groupedData[key] }; }, keys);
}


// private class method (starts with #)
async #renderChart() {
    if (this.mapData && this.mapData.length) {

        const seriesData = await this.#getSeriesData();

        Highcharts.chart(this.id, {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: this.chartOptions.title || ''
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{series.name} {point.name}</b>: {point.percentage:.1f} %'
                    }
                }
            },
            series: [{
                name: this.chartOptions.seriesName || '',
                colorByPoint: true,
                data: seriesData
            }]
        });
    }
}

// render the html from the template in the DOM  
render() {
    return html`${chartTemplate({ id: this.id })}`
}

// updated is called after the html is rendered on the DOM.
async updated(changedProperties) {
    await this.initSubscriptions();
    await this.#renderChart();
}

// Subscribe to Observables (publishers) declared in other components
async initSubscriptions() {
    const instance = this;
    for (let i = 0; i < this.subscriptions.length; i += 1) {
        const subscription = this.subscriptions[i];
        if (subscription === "mapData") {
            instance.stateManager.subscribe(subscription,
                async d => {
                    instance[subscription] = d;
                    console.log(d);
                    await instance.#renderChart();
                });
        }
    }
}


  }

customElements.define('ponder-piechart', PieChart);

export default PieChart;