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
        const fiveGIdMapper = {
            "0": "Unknown",
            "1": "No",
            "2": "Partial",
            "3": "Yes",
        };
        const fivegPlusMMWaveIdMapper = {
            "0": "Unknown",
            "1": "No",
            "2": "Yes"
        };
        const band14IdMapper = {
            "0": "Unknown",
            "1": "No",
            "2": "Partial",
            "3": "Yes"
        };
        const speedExperienceIdMapper = {
            "0": "Unknown",
            "1": "Low Speed",
            "2": "Medium Speed",
            "3": "High Speed"
        };
        const firstNetIdMapper = {
            "0": "Unknown",
            "1": "No",
            "2": "Partial",
            "3": "Yes"
        };
        const fivegPlusCBandIdMapper = {
            "0": "Unknown",
            "1": "No",
            "2": "Indoor",
            "3": "Outdoor Only"
        };
        const salesHighSpeedSuitabilityIdMapper = {
            "0": "Unknown",
            "1": "No WBB - Check with RAN",
            "2": "Feasible",
            "3": "Good",
            "4": "Very Good",
            "5": "Excellent"
        };
        const fiberStatusReportRowsIdMapper = {
            "1": "EMT",
            "2": "MULTI CUSTOMER NTE",
            "3": "SINGLE CUSTOMER NTE/CELL/LEGACY",
            "4": "GPON LIT",
            "5": "FIBER THERE (Not Lit)",
            "6": "GPON SERVING AREA (Not Lit)",
            "7": "NEAR FIBER 1000ft (Not Lit)",
            "99": "NONE"
        };
        const futureFiberStatusIdMapper = {
            "1": "T-30",
            "2": "T-60",
            "3": "Currently EMT",
            "4": "Currently GPON Lit",
            "5": "Currently Not Lit",
            "6": "Other"
        };
        const ranSuitabilityCauseIdMapper = {
            "0": "Unknown"
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
        if (R.has('ics_score_id', item)) {
            item['ics_score_id'] = covScoreMapper[item['ics_score_id']];
        }
        if (R.has('roam_text', item)) {
            item['roam_text'] = roamTextMapper[item['roam_text']] || item['roam_text'];
        }
        if (R.has('fiveg_id', item)) {
            item['fiveg_id'] = fiveGIdMapper[item['fiveg_id']] || item['fiveg_id'];
        }
        if (R.has('fiveg_plus_mmwave_id', item)) {
            item['fiveg_plus_mmwave_id'] = fivegPlusMMWaveIdMapper[item['fiveg_plus_mmwave_id']] || item['fiveg_plus_mmwave_id'];
        }
        if (R.has('ran_suitability_cause_id', item)) {
            item['ran_suitability_cause_id'] = ranSuitabilityCauseIdMapper[item['ran_suitability_cause_id']] || item['ran_suitability_cause_id'];
        }
        if (R.has('fiveg_plus_cband_ics_id', item)) {
            item['fiveg_plus_cband_ics_id'] = fivegPlusCBandIdMapper[item['fiveg_plus_cband_ics_id']] || item['fiveg_plus_cband_ics_id'];
        }
        if (R.has('wireless_broadband_suitability_ics_id', item)) {
            item['wireless_broadband_suitability_ics_id'] = salesHighSpeedSuitabilityIdMapper[item['wireless_broadband_suitability_ics_id']] || item['wireless_broadband_suitability_ics_id'];
        }
        if (R.has('band_14_id', item)) {
            item['band_14_id'] = band14IdMapper[item['band_14_id']] || item['band_14_id'];
        }
        if (R.has('speed_experience_ics_id', item)) {
            item['speed_experience_ics_id'] = speedExperienceIdMapper[item['speed_experience_ics_id']] || item['speed_experience_ics_id'];
        }
        if (R.has('first_net_id', item)) {
            item['first_net_id'] = firstNetIdMapper[item['first_net_id']] || item['first_net_id'];
        }
        if (R.has('fiber_status_report_rows_id', item)) {
            item['fiber_status_report_rows_id'] = fiberStatusReportRowsIdMapper[item['fiber_status_report_rows_id']] || item['fiber_status_report_rows_id'];
        }
        if (R.has('future_fiber_status_id', item)) {
            item['future_fiber_status_id'] = futureFiberStatusIdMapper[item['future_fiber_status_id']] || item['future_fiber_status_id'];
        }


        
    }

    const initSubscriptions = () => {
        instance.stateManager.subscribe("renderChart",
            async d => {
                if (d && !R.is(Array, d)) {
                    // const results = [];

                   /* for (let i = 0; i < instance.categoryDataKeys.length; i += 1) {
                        results.push($.ajax({
                            url: `${instance.store.config.baseUrl}/chart`,
                            headers: { "Content-Type": "application/json" },
                            type: 'post',
                            data: JSON.stringify(Object.assign(d, { chartKeys: instance.categoryDataKeys.join(','), attribute: instance.categoryDataKeys[i] })),
                            processData: false
                        }));
                    }

                    await Promise.all(results); */

                    const response = await $.ajax({
                        url: `${instance.store.config.baseUrl}/chart`,
                        headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
                        type: 'post',
                        data: JSON.stringify(Object.assign(d, { chartKeys: instance.categoryDataKeys.join(',') })),
                        processData: false
                    });

                    const results = JSON.parse(response).d;
                    if (results.addlInfo && results.addlInfo.length) {
                        const addlInfo = results.addlInfo[0];
                        $("#addlInfo").html(`${addlInfo.label}: ${new Intl.NumberFormat().format(addlInfo.count)}`);
                    }
                    const series = R.map(item => { return { name: item, data: [] }; }, instance.categoryDataValues);
                    for (let i = 0; i < instance.categoryDataKeys.length; i += 1) {
                        // let data = JSON.parse(results[i].responseText).d;
                        let data = results[instance.categoryDataKeys[i]];
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
                                    series[j].data.push(parseInt(dataItem.count,10));
                                    // strip the key of spaces, comma and /
                                    const cleanedUpKey = R.replace(/,/g, '', R.replace(/ /g, '', R.replace(/\//g, '', dataItem[instance.categoryDataKeys[i]])));
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
