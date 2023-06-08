jQuery(document).ready(function() {
  // HIGHCHARTS DEMOS

  	// LINE CHART 1
	$('#highchart_1').highcharts({
        chart : {
            style: {
                fontFamily: 'Open Sans'
            }
        },
        credits: {
            enabled: false
        },
        title: {
			text: 'Monthly Average Temperature',
			x: -20 //center
		},
		subtitle: {
			text: 'Source: WorldClimate.com',
			x: -20
		},
		xAxis: {
			categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
				'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
		},
		yAxis: {
			
            title: {
				text: 'Temperature (°C)'
			},
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}]
		},
		tooltip: {
			valueSuffix: '°C'
		},
		legend: {
			layout: 'vertical',
			align: 'right',
			verticalAlign: 'middle',
			borderWidth: 0
		},
		series: [{
			name: 'Tokyo',
			data: [15.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		}, {
			name: 'New York',
			data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		}, {
			name: 'Berlin',
			data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
		}, {
			name: 'London',
			data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		}]
	});
    // example
    $(function () {
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'testclick'
            },

            series: [{
                data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
            }]
        });

        // The button action


        $('#button').click(function () {
            chart.series[0].setData([129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4, 29.9, 71.5, 106.4]);
        });

        $('#button2').click(function () {
            chart.series[0].setData([20, 30, 20, 30, 20, 30, 20, 30, 20, 30, 20, 30]);
        });
    });

    // working example central region project timeline
    $(function () {
        var CenTotalForecast = [192, 269, 508, 775, 1461, 2115, 2067, 2212, 2699, 2695, 2476, 1547, 184, 2];
        var CenLTEACForecast = [105, 183, 297, 650, 1186, 1745, 1616, 1784, 1848, 1778, 1574, 850, 0, 0];
        var CenNSBForecast = [3, 1, 7, 7, 38, 55, 21, 29, 31, 77, 29, 79, 1, 0];
        var CenCRANForecast = [78, 77, 195, 114, 228, 297, 411, 391, 807, 828, 865, 600, 182, 0];
        var CenLTE1CForecast = [6, 8, 9, 4, 9, 18, 19, 8, 13, 12, 8, 18, 1, 2];

        var CenTotalSAQComplete = [184, 250, 344, 504, 429, 349, 286, 101, 158, 64, 51, 32, 1, 0];
        var CenLTEACSAQComplete = [102, 179, 258, 456, 366, 242, 189, 81, 132, 52, 35, 22, 0, 0];
        var CenNSBSAQComplete = [3, 1, 7, 7, 4, 12, 10, 13, 6, 2, 1, 4, 0, 0];
        var CenCRANSAQComplete = [73, 62, 70, 38, 56, 92, 79, 3, 15, 6, 12, 3, 1, 0];
        var CenLTE1CSAQComplete = [6, 8, 9, 3, 3, 3, 8, 4, 5, 4, 3, 3, 0, 0];

        var CenTotalConstructionStarted = [181, 210, 163, 174, 109, 90, 96, 24, 27, 15, 11, 25, 0, 0];
        var CenLTEACConstructionStarted = [105, 137, 114, 125, 68, 52, 43, 16, 9, 9, 7, 16, 0, 0];
        var CenNSBConstructionStarted = [3, 1, 7, 7, 2, 9, 4, 2, 0, 0, 0, 0, 0, 0];
        var CenCRANConstructionStarted = [67, 64, 34, 40, 38, 27, 42, 3, 16, 2, 4, 8, 0, 0];
        var CenLTE1CConstructionStarted = [6, 8, 8, 2, 1, 2, 7, 3, 2, 4, 0, 1, 0, 0];

        var CenTotalTowerTopComplete = [114, 125, 82, 38, 18, 27, 19, 5, 4, 3, 0, 9, 0, 0];
        var CenLTEACTowerTopComplete = [105, 116, 74, 34, 17, 26, 12, 2, 3, 0, 0, 8, 0, 0];
        var CenNSBTowerTopComplete = [3, 1, 2, 3, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0];
        var CenCRANTowerTopComplete = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenLTE1CTowerTopComplete = [6, 8, 6, 1, 1, 1, 6, 2, 1, 3, 0, 1, 0, 0];

        var CenTotalOnAir = [191, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenLTEACOnAir = [104, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenNSBOnAir = [3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenCRANOnAir = [78, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenLTE1COnAir = [6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

        var categoriesName = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019', '2020'];
        Highcharts.setOptions({
            colors: ['#1E90FF', '#FF8C00', '#00CED1', '#B8860B', '#006400', '#64E572', '#FF9655', '#FFF263', '#6AF9C4']
        });
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'testclick',
                type: 'column',
                plotBorderWidth: "1"
            },
            title: {
                text: ' Central Region Project Progress Timeline',
                style: {
                    fontSize: "24px"
                }                
            },
            legend: {
                itemStyle: {
                    color: '#000000',
                    fontSize: "16px",
                    fontWeight: 'normal'                    
                },
                symbolRadius: 0
            },
            credits: {
                enabled: false
            },
            yAxis: {
                title: {
                    text: 'Project Counts',
                    style: {
                        fontSize: "16px"
                    }
                },
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            },
            xAxis: {               
                gridLineWidth: 1,    
                categories: categoriesName,
                    labels: {
                        style: {
                            fontSize: "16px"
                        }
                    }                
            },
            plotOptions: {
                series: {
                    groupPadding: 0.1,
                    pointPadding: 0.05
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y} </b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true,
                backgroundColor: '#FFFFFF'
            },
        });

        $('.test').change(function () {
            value = this.getAttribute('value');
            while (chart.series.length > 0) {
                chart.series[0].remove(true);
            }
            if (value == 'a') {
                chart.addSeries({
                    name: 'Forecast',
                    data: CenTotalForecast,
                    showInLegend: true
                });

                chart.addSeries({
                    name: 'SAQ Complete',
                    data: CenTotalSAQComplete,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Construction Started',
                    data: CenTotalConstructionStarted,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Tower Top Complete',
                    data: CenTotalTowerTopComplete,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'On Air',
                    data: CenTotalOnAir,
                    showInLegend: true,
                });
                chart.setTitle(null, {
                    text: 'All Projects ', style: {
                        fontSize: "20px"
                    } });
            } else if (value == 'b') {
                chart.addSeries({
                    name: 'Forecast',
                    data: CenLTEACForecast,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'SAQ Complete',
                    data: CenLTEACSAQComplete,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Construction Started',
                    data: CenLTEACConstructionStarted,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Tower Top Complete',
                    data: CenLTEACTowerTopComplete,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'On Air',
                    data: CenLTEACOnAir,
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'LTE Additional Carrier ' });
            } else if (value == 'c') {
            chart.addSeries({
                name: 'Forecast',
                data: CenNSBForecast,
                showInLegend: true
            });
            chart.addSeries({
                name: 'SAQ Complete',
                data: CenNSBSAQComplete,
                showInLegend: true
            });
            chart.addSeries({
                name: 'Construction Started',
                data: CenNSBConstructionStarted,
                showInLegend: true
            });
            chart.addSeries({
                name: 'Tower Top Complete',
                data: CenNSBTowerTopComplete,
                showInLegend: true,
            });
            chart.addSeries({
                name: 'On Air',
                data: CenNSBOnAir,
                showInLegend: true,
            });
            chart.setTitle(null, { text: 'NSB ' });
            } else if (value == 'd') {
                chart.addSeries({
                    name: 'Forecast',
                   data: CenCRANForecast,
                    showInLegend: true
                });
                chart.addSeries({
                   name: 'SAQ Complete',
                   data: CenCRANSAQComplete,
                 showInLegend: true
                });
               chart.addSeries({
                 name: 'Construction Started',
                 data: CenCRANConstructionStarted,
                 showInLegend: true
                });
               chart.addSeries({
                   name: 'Tower Top Complete',
                   data: CenCRANTowerTopComplete,
                   showInLegend: true,
               });
               chart.addSeries({
                   name: 'On Air',
                   data: CenCRANOnAir,
                   showInLegend: true,
               });
               chart.setTitle(null, { text: 'C-RAN ' });
            } else if (value == 'e') {
                chart.addSeries({
                    name: 'Forecast',
                    data: CenLTE1CForecast,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'SAQ Complete',
                    data: CenLTE1CSAQComplete,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Construction Started',
                    data: CenLTE1CConstructionStarted,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Tower Top Complete',
                    data: CenLTE1CTowerTopComplete,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'On Air',
                    data: CenLTE1COnAir,
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'LTE 1C ' });
            }
        });

        $('.test').first().prop('checked', true).trigger('change');
    });

    // working example central region forecast need by date
    $(function () {
        var CenTotalForecast2 = [0, 206, 299, 518, 786, 1490, 2152, 2068, 2212, 2699, 2695, 2476, 1554, 0];
        var CenLTEACForecast2 = [0, 107, 199, 301, 651, 1207, 1775, 1616, 1784, 1848, 1778, 1574, 857, 0];
        var CenNSBForecast2 = [0, 15, 15, 13, 17, 46, 62, 22, 29, 31, 77, 29, 79, 1];
        var CenCRANForecast2 = [0, 78, 77, 195, 114, 228, 297, 411, 391, 807, 828, 865, 600, 182];
        var CenLTE1CForecast2 = [0, 6, 8, 9, 4, 9, 18, 19, 8, 13, 12, 8, 18, 3];

        var CenTotalNBD = [2970, 3780, 2059, 2086, 572, 398, 1829, 1584, 323, 953, 726, 189, 1890, 0];
        var CenLTEACNBD = [568, 2998, 2003, 1986, 484, 108, 669, 1558, 297, 739, 604, 152, 1579, 0];
        var CenNSBNBD = [16, 9, 7, 18, 7, 33, 93, 15, 26, 21, 29, 33, 104, 28];
        var CenCRANNBD = [2339, 750, 48, 19, 81, 257, 1067, 11, 0, 193, 92, 4, 207, 7];
        var CenLTE1CNBD = [47, 23, 1, 63, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];

        var CenTotalOnAir = [0, 205, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenLTEACOnAir = [0, 106, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenNSBOnAir = [0, 15, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenCRANOnAir = [0, 78, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var CenLTE1COnAir = [0, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

        var CenTotalForecastCumul = [0, 206, 505, 1023, 1809, 3299, 5451, 7519, 9731, 12430, 15125, 17601, 19155, 19341];
        var CenLTEACForecastCumul = [0, 107, 306, 607, 1258, 2465, 4240, 5856, 7640, 9488, 11266, 12840, 13697, 13697];
        var CenNSBForecastCumul = [0, 15, 30, 43, 60, 106, 168, 190, 219, 250, 327, 356, 435, 436];
        var CenCRANForecastCumul = [0, 78, 155, 350, 464, 692, 989, 1400, 1791, 2598, 3426, 4291, 4891, 5073];
        var CenLTE1CForecastCumul = [0, 6, 14, 23, 27, 36, 54, 73, 81, 94, 106, 114, 132, 135];

        var CenTotalNBDCumul = [2970, 6750, 8809, 10895, 11467, 11865, 13694, 15278, 15601, 16554, 17280, 17469, 19359, 19394];
        var CenLTEACNBDCumul = [568, 3566, 5569, 7555, 8039, 8147, 8816, 10374, 10671, 11410, 12014, 12166, 13745, 13745];
        var CenNSBNBDCumul = [16, 25, 32, 50, 57, 90, 183, 198, 224, 245, 274, 307, 411, 439];
        var CenCRANNBDCumul = [2339, 3089, 3137, 3156, 3237, 3494, 4561, 4572, 4572, 4765, 4857, 4861, 5068, 5075];
        var CenLTE1CNBDCumul = [47, 70, 71, 134, 134, 134, 134, 134, 134, 134, 135, 135, 135, 135];

        var CenTotalOnAirCumul = [0, 205, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280];
        var CenLTEACOnAirCumul = [0, 106, 137, 137, 137, 137, 137, 137, 137, 137, 137, 137, 137, 137];
        var CenNSBOnAirCumul = [0, 15, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16];
        var CenCRANOnAirCumul = [0, 78, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117, 117];
        var CenLTE1COnAirCumul = [0, 6, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10];

        var categoriesName = ['2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019'];
        Highcharts.setOptions({
            lang: {
                thousandsSep: ','
            },
            colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
        });
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'testclick2',
                zoomType: 'xy',
                plotBorderWidth: "1"
            },
            title: {
                text: ' Central Region Forecast vs Need By Date',
                style: {
                    fontSize: "24px"
                }
            },
            legend: {
                itemStyle: {
                    color: '#000000',
                    fontSize: "16px",
                    fontWeight: 'normal'
                },
                symbolRadius: 0                
            },
            credits: {
                enabled: false
            },
            yAxis: [{//Primary yAxis
                title: {
                    text: null
                },
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            }, {//Secondary yAxis
                title: {
                    text: 'Cumulative',
                    style: {
                        fontSize: "16px"
                    }
                },
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                },
                opposite: true
            }],
            xAxis: {
                gridLineWidth: 1,
                categories: categoriesName,
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            },
            plotOptions: {
                series: {
                    groupPadding: 0.1,
                    pointPadding: 0.05,
                    marker: {
                        enabled: false
                    }
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y} </b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true,
                backgroundColor: '#FFFFFF'
            },
        });

        $('.test2').change(function () {
            value2 = this.getAttribute('value');
            while (chart.series.length > 0) {
                chart.series[0].remove(true);
            }
            if (value2 == 'f') {
                chart.addSeries({
                    name: 'Forecast',
                    type: 'column',
                    data: CenTotalForecast2,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Need By Date',
                    type: 'column',
                    data: CenTotalNBD,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'On Air',
                    type: 'column',
                    data: CenTotalOnAir,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Forecast',
                    type: 'spline',
                    yAxis: 1,
                    data: CenTotalForecastCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - NBD',
                    type: 'spline',
                    yAxis: 1,
                    data: CenTotalNBDCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Actual',
                    type: 'spline',
                    yAxis: 1,
                    data: CenTotalOnAirCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'All Projects ', style: {fontSize: "20px"}
                });
            } else if (value2 == 'g') {
                chart.addSeries({
                    name: 'Forecast',
                    type: 'column',
                    data: CenLTEACForecast2,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Need By Date',
                    type: 'column',
                    data: CenLTEACNBD,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'On Air',
                    type: 'column',
                    data: CenLTEACOnAir,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Forecast',
                    type: 'spline',
                    yAxis: 1,
                    data: CenLTEACForecastCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - NBD',
                    type: 'spline',
                    yAxis: 1,
                    data: CenLTEACNBDCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    symbol: 'circle',
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Actual',
                    type: 'spline',
                    yAxis: 1,
                    data: CenLTEACOnAirCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    symbol: 'circle',
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'LTE Additional Carrier ' });
            } else if (value2 == 'h') {
                chart.addSeries({
                    name: 'Forecast',
                    type: 'column',
                    data: CenNSBForecast2,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Need By Date',
                    type: 'column',
                    data: CenNSBNBD,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'On Air',
                    type: 'column',
                    data: CenNSBOnAir,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Forecast',
                    type: 'spline',
                    yAxis: 1,
                    data: CenNSBForecastCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - NBD',
                    type: 'spline',
                    yAxis: 1,
                    data: CenNSBNBDCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Actual',
                    type: 'spline',
                    yAxis: 1,
                    data: CenNSBOnAirCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'NSB ' });
            } else if (value2 == 'i') {
                chart.addSeries({
                    name: 'Forecast',
                    type: 'column',
                    data: CenCRANForecast2,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Need By Date',
                    type: 'column',
                    data: CenCRANNBD,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'On Air',
                    type: 'column',
                    data: CenCRANOnAir,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Forecast',
                    type: 'spline',
                    yAxis: 1,
                    data: CenCRANForecastCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - NBD',
                    type: 'spline',
                    yAxis: 1,
                    data: CenCRANNBDCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Actual',
                    type: 'spline',
                    yAxis: 1,
                    data: CenCRANOnAirCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'C-RAN ' });
            } else if (value2 == 'j') {
                chart.addSeries({
                    name: 'Forecast',
                    type: 'column',
                    data: CenLTE1CForecast2,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'Need By Date',
                    type: 'column',
                    data: CenLTE1CNBD,
                    showInLegend: true
                });
                chart.addSeries({
                    name: 'On Air',
                    type: 'column',
                    data: CenLTE1COnAir,
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Forecast',
                    type: 'spline',
                    yAxis: 1,
                    data: CenLTE1CForecastCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - NBD',
                    type: 'spline',
                    yAxis: 1,
                    data: CenLTE1CNBDCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.addSeries({
                    name: 'Cumulative - Actual',
                    type: 'spline',
                    yAxis: 1,
                    data: CenLTE1COnAirCumul,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    showInLegend: true,
                });
                chart.setTitle(null, { text: 'LTE 1C ' });
            }
        });

        $('.test2').eq(0).prop('checked', true).trigger('change');
    });

    // New Test

    $(function () {

        $('#cenaging').highcharts({

            chart: {
                type: 'columnrange',
                inverted: true,                
                plotBorderWidth: "1"
            },
            credits: {
                enabled: false
            },
            title: {
                text: 'Issued & POE Job Aging',
                style: {
                    fontSize: "24px"
                }
            },
            xAxis: {
                gridLineWidth: 1,
                categories: ['1Q 2016', '2Q 2016', '3Q 2016', '4Q 2016', '1Q 2017', '2Q 2017',
                    '3Q 2017', '4Q 2017', '1Q 2018', '2Q 2018', '3Q 2018', '4Q 2018'],
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            },
            yAxis: {                
                title: {
                    text: 'Days'
                },
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            },
            tooltip: {
                xDateFormat: '%Y-%m-%d',
                shared: true,
                backgroundColor: '#FFFFFF'
            },
            plotOptions: {
                columnrange: {
                    dataLabels: {
                        enabled: false,
                        formatter: function () {
                            return this.y;
                        }
                    }
                },
                scatter: {
                    color: 'rgba(204,0,0,0.9)',
                    marker: {
                        symbol: 'circle',
                        fillColor: 'rgba(204,0,0,0.9)',
                        radius: 6,
                        lineWidth: 0.5,
                        lineColor: 'rgba(255,255,255,0.75)'
                    }
                }
            },
            legend: {
                enabled: true,
                itemStyle: {
                    color: '#000000',
                    fontSize: "16px",
                    fontWeight: 'normal'
                },
                symbolRadius: 0 
            },
            series: [{
                name: 'Issued',
                data: [
                    [80, 90],
                    [70, 110],
                    [90, 105],
                    [85, 102],
                    [80, 90],
                    [70, 110],
                    [90, 105],
                    [85, 102],
                    [null, null]
                ]
            }, {
                name: 'POE',
                data: [
                    [80, 100],
                    [87, 107],
                    [90, 105],
                    [85, 102],
                    [80, 100],
                    [87, 107],
                    [90, 105],
                    [85, 102],
                    [null, null]
                ]
            }, {
                name: 'Average',
                type: 'scatter',
                data: [
                    [-0.15, 85],
                    [0.15, 90],
                    [0.85, 88],
                    [1.15, 103],
                    [1.85, 91],
                    [2.15, 98],
                    [2.85, 88],
                    [3.15, 98],
                    [3.85, 84],
                    [4.15, 99],
                    [4.85, 92],
                    [5.15, 93],
                    [5.85, 97],
                    [6.15, 100],
                    [6.85, 91],
                    [7.15, 95]
                ]
            }]
        });

    });

    // New Test2

    $(function () {

        $('#cenaging2').highcharts({

            chart: {
                type: 'columnrange',
                inverted: true,
                plotBorderWidth: "1"
            },
            credits: {
                enabled: false
            },
            title: {
                text: 'Issued & POE Job Aging',
                style: {
                    fontSize: "24px"
                }
            },
            xAxis: {
                gridLineWidth: 1,
                categories: ['1Q 2016', '2Q 2016', '3Q 2016', '4Q 2016', '1Q 2017', '2Q 2017',
                    '3Q 2017', '4Q 2017', '1Q 2018', '2Q 2018', '3Q 2018', '4Q 2018'],
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            },
            yAxis: {
                title: {
                    text: 'Days'
                },
                labels: {
                    style: {
                        fontSize: "16px"
                    }
                }
            },
            tooltip: {
                xDateFormat: '%Y-%m-%d',
                shared: true,
                backgroundColor: '#FFFFFF'
            },
            plotOptions: {
                columnrange: {
                    dataLabels: {
                        enabled: false,
                        formatter: function () {
                            return this.y;
                        }
                    }
                },
                scatter: {
                    color: 'rgba(204,0,0,0.9)',
                    marker: {
                        symbol: 'circle',
                        fillColor: 'rgba(204,0,0,0.9)',
                        radius: 6,
                        lineWidth: 0.5,
                        lineColor: 'rgba(255,255,255,0.75)'
                    }
                }
            },
            legend: {
                enabled: true,
                itemStyle: {
                    color: '#000000',
                    fontSize: "16px",
                    fontWeight: 'normal'
                },
                symbolRadius: 0
            },
            series: [{
                name: 'Issued',
                data: [
                    [80, 90],
                    [70, 110],
                    [90, 105],
                    [85, 102],
                    [80, 90],
                    [70, 110],
                    [90, 105],
                    [85, 102],
                    [null, null]
                ]
            }, {
                name: 'POE',
                data: [
                    [80, 100],
                    [87, 107],
                    [90, 105],
                    [85, 102],
                    [80, 100],
                    [87, 107],
                    [90, 105],
                    [85, 102],
                    [null, null]
                ]
            }, {
                name: 'Average',
                type: 'scatter',
                data: [
                    [-0.15, 85],
                    [0.15, 90],
                    [0.85, 88],
                    [1.15, 103],
                    [1.85, 91],
                    [2.15, 98],
                    [2.85, 88],
                    [3.15, 98],
                    [3.85, 84],
                    [4.15, 99],
                    [4.85, 92],
                    [5.15, 93],
                    [5.85, 97],
                    [6.15, 100],
                    [6.85, 91],
                    [7.15, 95]
                ]
            }]
        });

    });


	// LINE CHART 2
	$.getJSON('http://www.highcharts.com/samples/data/jsonp.php?filename=usdeur.json&callback=?', function (data) {
            $('#highchart_2').highcharts({
            chart: {
                zoomType: 'x',
                style: {
                    fontFamily: 'Open Sans'
                }
            },
            title: {
                text: 'USD to EUR exchange rate over time'
            },
            subtitle: {
                text: document.ontouchstart === undefined ?
                        'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
            },
            xAxis: {
                type: 'datetime'
            },
            yAxis: {
                title: {
                    text: 'Exchange rate'
                }
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                area: {
                    fillColor: {
                        linearGradient: {
                            x1: 0,
                            y1: 0,
                            x2: 0,
                            y2: 1
                        },
                        stops: [
                            [0, Highcharts.getOptions().colors[0]],
                            [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                        ]
                    },
                    marker: {
                        radius: 2
                    },
                    lineWidth: 1,
                    states: {
                        hover: {
                            lineWidth: 1
                        }
                    },
                    threshold: null
                }
            },

            series: [{
                type: 'area',
                name: 'USD to EUR',
                data: data
            }]
        });
    });
    
	// AREA CHART
   /* var options = { 
        chart: {
            renderTo: 'container2',
            defaultSeriesType: 'column'
        },
        title: {
            text: 'Fruit Consumption'
        },
        xAxis: {
            categories: []
        },
        yAxis: {
            title: {
                text: 'Units'
            }
        },
        series: []
    }; 

    $.get('data.csv', function (data) {
        // Split the lines
        var lines = data.split('\n');

        // Iterate over the lines and add categories or series
        $.each(lines, function (lineNo, line) {
            var items = line.split(',');

            // header line containes categories
            if (lineNo == 0) {
                $.each(items, function (itemNo, item) {
                    if (itemNo > 0) options.xAxis.categories.push(item);
                });
            }

            // the rest of the lines contain data with their name in the first 
            // position
            else {
                var series = {
                    data: []
                };
                $.each(items, function (itemNo, item) {
                    if (itemNo == 0) {
                        series.name = item;
                    } else {
                        series.data.push(parseFloat(item));
                    }
                });

                options.series.push(series);

            }

        });

        // Create the chart
        var chart = new Highcharts.Chart(options);
    });

    $('#highchart_3').highcharts({
        chart: {
            type: 'area',
            style: {
                fontFamily: 'Open Sans'
            }
        },
        title: {
            text: 'Historic and Estimated Worldwide Population Growth by Region'
        },
        subtitle: {
            text: 'Source: Wikipedia.org'
        },
        xAxis: {
            categories: ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: 'Billions'
            },
            labels: {
                formatter: function () {
                    return this.value / 1000;
                }
            }
        },
        tooltip: {
            shared: true,
            valueSuffix: ' millions'
        },
        plotOptions: {
            area: {
                stacking: 'normal',
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: 'Asia',
            data: [502, 635, 809, 947, 1402, 3634, 5268]
        }, {
            name: 'Africa',
            data: [106, 107, 111, 133, 221, 767, 1766]
        }, {
            name: 'Europe',
            data: [163, 203, 276, 408, 547, 729, 628]
        }, {
            name: 'America',
            data: [18, 31, 54, 156, 339, 818, 1201]
        }, {
            name: 'Oceania',
            data: [2, 2, 2, 6, 13, 30, 46]
        }]
    });*/
 
 	// BAR CHART
 	// Age categories
    var categories = ['0-4', '5-9', '10-14', '15-19',
            '20-24', '25-29', '30-34', '35-39', '40-44',
            '45-49', '50-54', '55-59', '60-64', '65-69',
            '70-74', '75-79', '80-84', '85-89', '90-94',
            '95-99', '100 + '];
   
    $('#highchart_4').highcharts({
        chart: {
            type: 'bar',
            style: {
                fontFamily: 'Open Sans'
            }
        },
        title: {
            text: 'Population pyramid for Germany, 2015'
        },
        subtitle: {
            text: 'Source: <a href="http://populationpyramid.net/germany/2015/">Population Pyramids of the World from 1950 to 2100</a>'
        },
        xAxis: [{
            categories: categories,
            reversed: false,
            labels: {
                step: 1
            }
        }, { // mirror axis on right side
            opposite: true,
            reversed: false,
            categories: categories,
            linkedTo: 0,
            labels: {
                step: 1
            }
        }],
        yAxis: {
            title: {
                text: null
            },
            labels: {
                formatter: function () {
                    return Math.abs(this.value) + '%';
                }
            }
        },

        plotOptions: {
            series: {
                stacking: 'normal'
            }
        },

        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                    'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
            }
        },

        series: [{
            name: 'Male',
            data: [-2.2, -2.2, -2.3, -2.5, -2.7, -3.1, -3.2,
                -3.0, -3.2, -4.3, -4.4, -3.6, -3.1, -2.4,
                -2.5, -2.3, -1.2, -0.6, -0.2, -0.0, -0.0]
        }, {
            name: 'Female',
            data: [2.1, 2.0, 2.2, 2.4, 2.6, 3.0, 3.1, 2.9,
                3.1, 4.1, 4.3, 3.6, 3.4, 2.6, 2.9, 2.9,
                1.8, 1.2, 0.6, 0.1, 0.0]
        }]
    });

	// DONUT CHART
	var colors = Highcharts.getOptions().colors,
        categories = ['MSIE', 'Firefox', 'Chrome', 'Safari', 'Opera'],
        data = [{
            y: 56.33,
            color: colors[0],
            drilldown: {
                name: 'MSIE versions',
                categories: ['MSIE 6.0', 'MSIE 7.0', 'MSIE 8.0', 'MSIE 9.0', 'MSIE 10.0', 'MSIE 11.0'],
                data: [1.06, 0.5, 17.2, 8.11, 5.33, 24.13],
                color: colors[0]
            }
        }, {
            y: 10.38,
            color: colors[1],
            drilldown: {
                name: 'Firefox versions',
                categories: ['Firefox v31', 'Firefox v32', 'Firefox v33', 'Firefox v35', 'Firefox v36', 'Firefox v37', 'Firefox v38'],
                data: [0.33, 0.15, 0.22, 1.27, 2.76, 2.32, 2.31, 1.02],
                color: colors[1]
            }
        }, {
            y: 24.03,
            color: colors[2],
            drilldown: {
                name: 'Chrome versions',
                categories: ['Chrome v30.0', 'Chrome v31.0', 'Chrome v32.0', 'Chrome v33.0', 'Chrome v34.0',
                    'Chrome v35.0', 'Chrome v36.0', 'Chrome v37.0', 'Chrome v38.0', 'Chrome v39.0', 'Chrome v40.0', 'Chrome v41.0', 'Chrome v42.0', 'Chrome v43.0'
                    ],
                data: [0.14, 1.24, 0.55, 0.19, 0.14, 0.85, 2.53, 0.38, 0.6, 2.96, 5, 4.32, 3.68, 1.45],
                color: colors[2]
            }
        }, {
            y: 4.77,
            color: colors[3],
            drilldown: {
                name: 'Safari versions',
                categories: ['Safari v5.0', 'Safari v5.1', 'Safari v6.1', 'Safari v6.2', 'Safari v7.0', 'Safari v7.1', 'Safari v8.0'],
                data: [0.3, 0.42, 0.29, 0.17, 0.26, 0.77, 2.56],
                color: colors[3]
            }
        }, {
            y: 0.91,
            color: colors[4],
            drilldown: {
                name: 'Opera versions',
                categories: ['Opera v12.x', 'Opera v27', 'Opera v28', 'Opera v29'],
                data: [0.34, 0.17, 0.24, 0.16],
                color: colors[4]
            }
        }, {
            y: 0.2,
            color: colors[5],
            drilldown: {
                name: 'Proprietary or Undetectable',
                categories: [],
                data: [],
                color: colors[5]
            }
        }],
        browserData = [],
        versionsData = [],
        i,
        j,
        dataLen = data.length,
        drillDataLen,
        brightness;


    // Build the data arrays
    for (i = 0; i < dataLen; i += 1) {

        // add browser data
        browserData.push({
            name: categories[i],
            y: data[i].y,
            color: data[i].color
        });

        // add version data
        drillDataLen = data[i].drilldown.data.length;
        for (j = 0; j < drillDataLen; j += 1) {
            brightness = 0.2 - (j / drillDataLen) / 5;
            versionsData.push({
                name: data[i].drilldown.categories[j],
                y: data[i].drilldown.data[j],
                color: Highcharts.Color(data[i].color).brighten(brightness).get()
            });
        }
    }

    // Create the chart
    $('#highchart_5').highcharts({
        chart: {
            type: 'pie',
            style: {
                fontFamily: 'Open Sans'
            }
        },
        title: {
            text: 'Browser market share, January, 2015 to May, 2015'
        },
        subtitle: {
            text: 'Source: <a href="http://netmarketshare.com/">netmarketshare.com</a>'
        },
        yAxis: {
            title: {
                text: 'Total percent market share'
            }
        },
        plotOptions: {
            pie: {
                shadow: false,
                center: ['50%', '50%']
            }
        },
        tooltip: {
            valueSuffix: '%'
        },
        series: [{
            name: 'Browsers',
            data: browserData,
            size: '60%',
            dataLabels: {
                formatter: function () {
                    return this.y > 5 ? this.point.name : null;
                },
                color: '#ffffff',
                distance: -30
            }
        }, {
            name: 'Versions',
            data: versionsData,
            size: '80%',
            innerSize: '60%',
            dataLabels: {
                formatter: function () {
                    // display only if larger than 1
                    return this.y > 1 ? '<b>' + this.point.name + ':</b> ' + this.y + '%' : null;
                }
            }
        }]
    });

    // LINE CHART 10
    $('#highchart_10').highcharts({
        chart: {
            type: 'columnrange',
            inverted: true
        },

        title: {
            text: 'Issued & POE Aging'
        },

        subtitle: {
            text: '2018'
        },

        xAxis: {
            categories: ['LTE AC', 'NSB', 'C-RAN', 'LTE 1C', '4T4R']
        },

        yAxis: {
            title: {
                text: 'Min/Max'
            }
        },

        tooltip: {
            valueSuffix: '°C'
        },

        plotOptions: {
            columnrange: {
                dataLabels: {
                    enabled: true,
                    format: '{y}°C'
                }
            }
        },

        legend: {
            enabled: false
        },

        series: [{
            name: 'Min/Max',
            data: [
                [-9.7, 9.4],
                [-8.7, 6.5],
                [-3.5, 9.4],
                [-1.4, 19.9],
                [0.0, 22.6]
            ]
        }]

    });


});
