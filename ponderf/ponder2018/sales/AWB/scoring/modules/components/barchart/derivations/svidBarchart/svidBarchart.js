import $ from "jquery";
import * as R from 'ramda';
import config from './configHelper.js';


const svidBarchart = ({ adminUser, instance }) => {

    const barChartConfig = {
        xAxis: {
            categories: instance.categoryLabels,
            labels: {
                style: {
                    color: '#000000',
                    fontSize: '12px'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: ''
            },
            labels: {
                style: {
                    color: '#000000',
                    fontSize: '13px'
                }
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            formatter: function () {
                return `${this.series.name}:${this.y}`;
            },
            backgroundColor : '#ffffff',
            style: {
                fontWeight: 'bold',
                fontSize: '14px'
            }
        },
        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },
        series: []
    };


    const transformData = item => {
        const covScoreMapper = {
            "0": "Unknown",
            "1": "Very Weak",
            "2": "Uneven",
            "3": "Strong",
            "4": "Very Strong",
            "5": "Best"
        };
        const roamTextMapper = {
            "No": "No roaming"
        };
        if (R.has('coverage_score', item)) {
            item['coverage_score'] = covScoreMapper[item['coverage_score']];
        }
        if (R.has('simple_coverage_score', item)) {
            item['simple_coverage_score'] = covScoreMapper[item['simple_coverage_score']];
        }
        if (R.has('roam_text', item)) {
            item['roam_text'] = roamTextMapper[item['roam_text']] || item['roam_text'];
        }
    }

    const initSubscriptions = () => {
        instance.stateManager.subscribe("renderChart",
            async d => {
                if (d && !R.is(Array, d)) {
                    const results = [];

                    for (let i = 0; i < instance.categoryDataKeys.length; i += 1) {
                        results.push($.ajax({
                            url: `${instance.store.config.baseUrl}/ChartData`,
                            headers: { "Content-Type": "application/json" },
                            type: 'post',
                            data: JSON.stringify(Object.assign(d, { attribute: instance.categoryDataKeys[i] })),
                            processData: false
                        }));
                    }

                    await Promise.all(results);
                    const series = R.map(item => { return { name: item, data: [] }; }, instance.categoryDataValues);
                    for (let i = 0; i < results.length; i += 1) {
                        let data = results[i].responseJSON.d;
                        data.forEach(transformData);
                        if (data.length === 0) {
                            for (let j = 0; j < series.length; j += 1) {
                                series[j].data.push(0);
                            }
                        } else {
                            for (let j = 0; j < series.length; j += 1) {
                                const name = series[j].name;
                                const dataItem = R.find(R.propEq(instance.categoryDataKeys[i], name))(data);
                                if (dataItem) {
                                    series[j].data.push(dataItem.count);
                                    // strip the key of spaces and /
                                    const cleanedUpKey = R.replace(/ /g, '', R.replace(/\//g, '', dataItem[instance.categoryDataKeys[i]]));
                                    series[j].color = config[instance.categoryDataKeys[i]][cleanedUpKey] ? config[instance.categoryDataKeys[i]][cleanedUpKey].color : '#000000';
                                    series[j].states = {
                                        inactive: {
                                            enabled: false
                                        }
                                    };
                                } else {
                                    series[j].data.push(0);
                                }
                            }

                        }
                    }
                    await instance.renderChart(series);
                    $(".charts.segment .inline.loader").hide();
                    $(".charts.segment ponder-barchart").show();

                }

            });
    }



    return {
        initSubscriptions,
        barChartConfig
    }
}

export default svidBarchart;
