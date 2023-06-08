import Highcharts from 'highcharts';
import * as R from 'ramda';
import { html } from 'lit-element';
import pieChartTemplate from '../../../templates/components/pieChart.js';
import PonderComponent from '../PonderComponent';


class PieChart extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.groupByProp = '';
        this.aggregateType = 'COUNT';
        this.title = '';
        this.derivation = null;
        this.derivedClass = null;
        this.chartType = 'pie';
        this.seriesName = '';
        this.configHelper = null;
        this.legendDataKey = '';
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'chartid',
                type: String
            },
            title: {
                type: String
            },
            derivation: {
                attribute: 'derivation',
                type: String
            },
            seriesName: {
                attribute: 'seriesname',
                type: String
            },
            groupByProp: {
                attribute: 'groupbyprop',
                type: String
            },
            aggregateType: {
                attribute: 'aggregatetype',
                type: String
            },
            configHelper: {
                attribute: 'confighelper',
                type: String
            },
            legendDataKey: {
                attribute: 'legenddatakey',
                type: String
            }
        }
    }


    async renderChart(seriesData, totalCount) {
        console.log('render chart---------');
        console.log(isNaN(totalCount));
        const instance = this;
        let pieChartConfig = {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: this.chartType,
                marginTop: 35,
                height: '275'
            },
            title: {
                text: this.title,
                style: {
                    fontSize: "16px"
                }
            },
            subtitle: { 
                text: '<p style="font-size:16px; font-weight: bold;">' +  Number(totalCount).toLocaleString('en')  + '</p>',
                align: 'center',
                verticalAlign: 'middle',
                y: 30
            },
            tooltip: {
                enabled: true,
                formatter: function () {
                    return `${this.key}:${this.y}`;
                }
                
            },
            accessibility: {
                point: {
                    valueSuffix: '%'
                }
            },
            credits: { 
                enabled: false
            },
            plotOptions: { 
                pie: {
                    allowPointSelect: false,
                    cursor: 'default',
                    dataLabels: {
                        enabled: true,
                        format: '{point.y:.0f}',
                        distance: '-30%',
                        filter: {
                            property: 'percentage',
                            operator: '>',
                            value: 4
                        }
                    }
                }
            },
        };
        if (instance.derivedClass && instance.derivedClass.pieChartConfig) {
            pieChartConfig = Object.assign(pieChartConfig, instance.derivedClass.pieChartConfig);
        }
        pieChartConfig.series[0].data = seriesData;
        Highcharts.chart(this.id, pieChartConfig);
    }

    // render the html from the template in the DOM  
    render() {
        return html`${pieChartTemplate({ id: this.id })}`
    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

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
        if (this.configHelper) {
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
        // await this.renderChart();
    }
}

customElements.define('ponder-piechart', PieChart);

