//== Class definition
var amChartsChartsDemo = function () {

    //== Private functions
    var demo1 = function () {
        var chart = AmCharts.makeChart("mnpltecqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 40,
            "marginLeft": 40,
            "autoMarginOffset": 20,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {

            },
            "graphs": [{
                "id": "g1",
                "balloon": {
                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 6,
                "showBalloon": false,
                "balloon": {
                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 6,
                "showBalloon": false,
                "balloon": {
                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {
                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {
                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "graph": "g4",
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 40,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": true,
                "fontSize": 16,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 50,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "dataProvider": [
                { "date": "01/01", "2016": 84.44, "2017 Dark Green": 89.82, "2017 Light Green": 88.34, "2017": 90.15, "2018": 92.43 },
                { "date": "01/08", "2016": 84.68, "2017 Dark Green": 89.75, "2017 Light Green": 88.26, "2017": 90.34, "2018": 91.72 },
                { "date": "01/15", "2016": 85.01, "2017 Dark Green": 89.68, "2017 Light Green": 88.19, "2017": 89.65, "2018": 91.91 },
                { "date": "01/22", "2016": 84.41, "2017 Dark Green": 89.61, "2017 Light Green": 88.11, "2017": 89.39 },
                { "date": "01/29", "2016": 84.40, "2017 Dark Green": 89.54, "2017 Light Green": 88.04, "2017": 89.81 },
                { "date": "02/05", "2016": 84.59, "2017 Dark Green": 89.49, "2017 Light Green": 87.98, "2017": 89.88 },
                { "date": "02/12", "2016": 84.63, "2017 Dark Green": 89.42, "2017 Light Green": 87.91, "2017": 89.44 },
                { "date": "02/19", "2016": 84.53, "2017 Dark Green": 89.33, "2017 Light Green": 87.80, "2017": 89.46 },
                { "date": "02/26", "2016": 85.23, "2017 Dark Green": 89.19, "2017 Light Green": 87.66, "2017": 89.68 },
                { "date": "03/04", "2016": 84.96, "2017 Dark Green": 89.04, "2017 Light Green": 87.50, "2017": 89.52 },
                { "date": "03/11", "2016": 85.00, "2017 Dark Green": 88.87, "2017 Light Green": 87.32, "2017": 89.69 },
                { "date": "03/18", "2016": 84.92, "2017 Dark Green": 88.69, "2017 Light Green": 87.12, "2017": 89.17 },
                { "date": "03/25", "2016": 84.15, "2017 Dark Green": 88.48, "2017 Light Green": 86.90, "2017": 89.36 },
                { "date": "04/01", "2016": 85.89, "2017 Dark Green": 88.27, "2017 Light Green": 86.67, "2017": 89.33 },
                { "date": "04/08", "2016": 85.90, "2017 Dark Green": 88.06, "2017 Light Green": 86.43, "2017": 89.24 },
                { "date": "04/15", "2016": 85.46, "2017 Dark Green": 87.85, "2017 Light Green": 86.20, "2017": 88.99 },
                { "date": "04/22", "2016": 83.61, "2017 Dark Green": 87.64, "2017 Light Green": 85.98, "2017": 89.10 },
                { "date": "04/29", "2016": 85.49, "2017 Dark Green": 87.44, "2017 Light Green": 85.76, "2017": 88.94 },
                { "date": "05/06", "2016": 85.21, "2017 Dark Green": 87.25, "2017 Light Green": 85.55, "2017": 88.93 },
                { "date": "05/13", "2016": 84.84, "2017 Dark Green": 87.08, "2017 Light Green": 85.35, "2017": 88.64 },
                { "date": "05/20", "2016": 84.58, "2017 Dark Green": 86.91, "2017 Light Green": 85.17, "2017": 88.63 },
                { "date": "05/27", "2016": 84.38, "2017 Dark Green": 86.77, "2017 Light Green": 85.01, "2017": 88.46 },
                { "date": "06/03", "2016": 84.65, "2017 Dark Green": 86.64, "2017 Light Green": 84.87, "2017": 88.58 },
                { "date": "06/10", "2016": 84.36, "2017 Dark Green": 86.52, "2017 Light Green": 84.74, "2017": 88.29 },
                { "date": "06/17", "2016": 84.37, "2017 Dark Green": 86.43, "2017 Light Green": 84.64, "2017": 88.28 },
                { "date": "06/24", "2016": 84.38, "2017 Dark Green": 86.36, "2017 Light Green": 84.56, "2017": 88.25 },
                { "date": "07/01", "2016": 83.37, "2017 Dark Green": 86.31, "2017 Light Green": 84.51, "2017": 87.65 },
                { "date": "07/08", "2016": 83.90, "2017 Dark Green": 86.29, "2017 Light Green": 84.48, "2017": 88.29 },
                { "date": "07/15", "2016": 83.92, "2017 Dark Green": 86.28, "2017 Light Green": 84.47, "2017": 88.21 },
                { "date": "07/22", "2016": 84.07, "2017 Dark Green": 86.30, "2017 Light Green": 84.49, "2017": 88.24 },
                { "date": "07/29", "2016": 84.93, "2017 Dark Green": 86.34, "2017 Light Green": 84.53, "2017": 88.33 },
                { "date": "08/05", "2016": 85.05, "2017 Dark Green": 86.40, "2017 Light Green": 84.60, "2017": 88.48 },
                { "date": "08/12", "2016": 84.99, "2017 Dark Green": 86.49, "2017 Light Green": 84.69, "2017": 88.38 },
                { "date": "08/19", "2016": 85.14, "2017 Dark Green": 86.59, "2017 Light Green": 84.81, "2017": 88.38 },
                { "date": "08/26", "2016": 85.59, "2017 Dark Green": 86.72, "2017 Light Green": 84.94, "2017": 88.32 },
                { "date": "09/02", "2016": 85.50, "2017 Dark Green": 86.86, "2017 Light Green": 85.10, "2017": 87.86 },
                { "date": "09/09", "2016": 85.82, "2017 Dark Green": 87.03, "2017 Light Green": 85.28, "2017": 87.87 },
                { "date": "09/16", "2016": 86.03, "2017 Dark Green": 87.21, "2017 Light Green": 85.48, "2017": 87.90 },
                { "date": "09/23", "2016": 86.61, "2017 Dark Green": 87.40, "2017 Light Green": 85.69, "2017": 88.22 },
                { "date": "09/30", "2016": 86.92, "2017 Dark Green": 87.60, "2017 Light Green": 85.91, "2017": 88.61 },
                { "date": "10/07", "2016": 87.25, "2017 Dark Green": 87.82, "2017 Light Green": 86.15, "2017": 88.93 },
                { "date": "10/14", "2016": 87.61, "2017 Dark Green": 88.03, "2017 Light Green": 86.38, "2017": 89.29 },
                { "date": "10/21", "2016": 84.69, "2017 Dark Green": 88.25, "2017 Light Green": 86.62, "2017": 89.61 },
                { "date": "10/28", "2016": 88.05, "2017 Dark Green": 88.47, "2017 Light Green": 86.86, "2017": 90.24 },
                { "date": "11/04", "2016": 87.61, "2017 Dark Green": 88.68, "2017 Light Green": 87.10, "2017": 90.45 },
                { "date": "11/11", "2016": 89.03, "2017 Dark Green": 88.89, "2017 Light Green": 87.33, "2017": 90.40 },
                { "date": "11/18", "2016": 88.78, "2017 Dark Green": 89.09, "2017 Light Green": 87.55, "2017": 90.66 },
                { "date": "11/25", "2016": 88.78, "2017 Dark Green": 89.28, "2017 Light Green": 87.75, "2017": 90.63 },
                { "date": "12/02", "2016": 89.64, "2017 Dark Green": 89.41, "2017 Light Green": 87.90, "2017": 91.23 },
                { "date": "12/09", "2016": 90.20, "2017 Dark Green": 89.55, "2017 Light Green": 88.04, "2017": 91.09 },
                { "date": "12/16", "2016": 89.80, "2017 Dark Green": 89.68, "2017 Light Green": 88.19, "2017": 91.29 },
                { "date": "12/23", "2016": 89.79, "2017 Dark Green": 89.82, "2017 Light Green": 88.34, "2017": 92.11 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo2 = function () {
        var chart = AmCharts.makeChart("mnpvoltecqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 40,
            "marginLeft": 40,
            "autoMarginOffset": 20,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 VoLTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 6,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 6,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 VoLTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 VoLTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "graph": "g4",
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 40,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": true,
                "fontSize": 16,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 50,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "dataProvider": [
                { "date": "01/01", "2016": 81.40, "2017 Dark Green": 90.79, "2017 Light Green": 89.15, "2017": 91.14, "2018": 91.63 },
                { "date": "01/08", "2016": 81.93, "2017 Dark Green": 90.60, "2017 Light Green": 88.95, "2017": 90.71, "2018": 91.07 },
                { "date": "01/15", "2016": 82.47, "2017 Dark Green": 90.42, "2017 Light Green": 88.76, "2017": 90.17, "2018": 91.25 },
                { "date": "01/22", "2016": 82.18, "2017 Dark Green": 90.14, "2017 Light Green": 88.47, "2017": 90.14 },
                { "date": "01/29", "2016": 82.88, "2017 Dark Green": 89.96, "2017 Light Green": 88.28, "2017": 90.83 },
                { "date": "02/05", "2016": 82.86, "2017 Dark Green": 89.77, "2017 Light Green": 88.08, "2017": 91.12 },
                { "date": "02/12", "2016": 82.37, "2017 Dark Green": 89.59, "2017 Light Green": 87.89, "2017": 90.55 },
                { "date": "02/19", "2016": 82.33, "2017 Dark Green": 89.41, "2017 Light Green": 87.70, "2017": 90.62 },
                { "date": "02/26", "2016": 82.67, "2017 Dark Green": 89.23, "2017 Light Green": 87.51, "2017": 90.98 },
                { "date": "03/04", "2016": 82.59, "2017 Dark Green": 89.05, "2017 Light Green": 87.32, "2017": 90.81 },
                { "date": "03/11", "2016": 82.13, "2017 Dark Green": 88.87, "2017 Light Green": 87.13, "2017": 90.59 },
                { "date": "03/18", "2016": 82.42, "2017 Dark Green": 88.69, "2017 Light Green": 86.94, "2017": 90.68 },
                { "date": "03/25", "2016": 81.89, "2017 Dark Green": 88.31, "2017 Light Green": 86.53, "2017": 90.63 },
                { "date": "04/01", "2016": 82.99, "2017 Dark Green": 87.92, "2017 Light Green": 86.12, "2017": 90.59 },
                { "date": "04/08", "2016": 83.16, "2017 Dark Green": 87.52, "2017 Light Green": 85.71, "2017": 90.38 },
                { "date": "04/15", "2016": 82.51, "2017 Dark Green": 87.14, "2017 Light Green": 85.29, "2017": 90.48 },
                { "date": "04/22", "2016": 82.03, "2017 Dark Green": 86.77, "2017 Light Green": 84.88, "2017": 90.45 },
                { "date": "04/29", "2016": 82.27, "2017 Dark Green": 86.42, "2017 Light Green": 84.48, "2017": 90.27 },
                { "date": "05/06", "2016": 81.87, "2017 Dark Green": 86.08, "2017 Light Green": 84.11, "2017": 89.98 },
                { "date": "05/13", "2016": 81.11, "2017 Dark Green": 85.77, "2017 Light Green": 83.76, "2017": 89.63 },
                { "date": "05/20", "2016": 80.64, "2017 Dark Green": 85.49, "2017 Light Green": 83.44, "2017": 89.85 },
                { "date": "05/27", "2016": 80.51, "2017 Dark Green": 85.23, "2017 Light Green": 83.15, "2017": 89.72 },
                { "date": "06/03", "2016": 79.83, "2017 Dark Green": 85.01, "2017 Light Green": 82.90, "2017": 89.47 },
                { "date": "06/10", "2016": 78.68, "2017 Dark Green": 84.82, "2017 Light Green": 82.69, "2017": 89.10 },
                { "date": "06/17", "2016": 79.85, "2017 Dark Green": 84.66, "2017 Light Green": 82.52, "2017": 89.12 },
                { "date": "06/24", "2016": 79.65, "2017 Dark Green": 84.55, "2017 Light Green": 82.39, "2017": 88.81 },
                { "date": "07/01", "2016": 78.67, "2017 Dark Green": 84.47, "2017 Light Green": 82.30, "2017": 88.84 },
                { "date": "07/08", "2016": 79.24, "2017 Dark Green": 84.43, "2017 Light Green": 82.26, "2017": 88.88 },
                { "date": "07/15", "2016": 78.95, "2017 Dark Green": 84.43, "2017 Light Green": 82.26, "2017": 88.73 },
                { "date": "07/22", "2016": 80.77, "2017 Dark Green": 84.47, "2017 Light Green": 82.31, "2017": 88.96 },
                { "date": "07/29", "2016": 83.73, "2017 Dark Green": 84.56, "2017 Light Green": 82.40, "2017": 88.92 },
                { "date": "08/05", "2016": 82.74, "2017 Dark Green": 84.68, "2017 Light Green": 82.54, "2017": 89.16 },
                { "date": "08/12", "2016": 83.01, "2017 Dark Green": 84.83, "2017 Light Green": 82.71, "2017": 89.12 },
                { "date": "08/19", "2016": 84.49, "2017 Dark Green": 85.03, "2017 Light Green": 82.93, "2017": 89.38 },
                { "date": "08/26", "2016": 84.82, "2017 Dark Green": 85.26, "2017 Light Green": 83.19, "2017": 89.47 },
                { "date": "09/02", "2016": 85.18, "2017 Dark Green": 85.52, "2017 Light Green": 83.48, "2017": 89.65 },
                { "date": "09/09", "2016": 85.24, "2017 Dark Green": 85.81, "2017 Light Green": 83.81, "2017": 89.07 },
                { "date": "09/16", "2016": 85.28, "2017 Dark Green": 86.14, "2017 Light Green": 84.17, "2017": 88.90 },
                { "date": "09/23", "2016": 86.07, "2017 Dark Green": 86.48, "2017 Light Green": 84.56, "2017": 88.80 },
                { "date": "09/30", "2016": 86.17, "2017 Dark Green": 86.85, "2017 Light Green": 84.97, "2017": 87.81 },
                { "date": "10/07", "2016": 86.19, "2017 Dark Green": 87.23, "2017 Light Green": 85.40, "2017": 87.77 },
                { "date": "10/14", "2016": 87.20, "2017 Dark Green": 87.57, "2017 Light Green": 85.75, "2017": 87.85 },
                { "date": "10/21", "2016": 79.39, "2017 Dark Green": 87.91, "2017 Light Green": 86.11, "2017": 88.28 },
                { "date": "10/28", "2016": 87.98, "2017 Dark Green": 88.25, "2017 Light Green": 86.48, "2017": 88.78 },
                { "date": "11/04", "2016": 88.05, "2017 Dark Green": 88.59, "2017 Light Green": 86.84, "2017": 89.17 },
                { "date": "11/11", "2016": 88.99, "2017 Dark Green": 88.93, "2017 Light Green": 87.21, "2017": 88.38 },
                { "date": "11/18", "2016": 89.65, "2017 Dark Green": 89.27, "2017 Light Green": 87.56, "2017": 89.61 },
                { "date": "11/25", "2016": 87.74, "2017 Dark Green": 89.59, "2017 Light Green": 87.91, "2017": 89.64 },
                { "date": "12/02", "2016": 89.99, "2017 Dark Green": 89.87, "2017 Light Green": 88.19, "2017": 90.47 },
                { "date": "12/09", "2016": 90.68, "2017 Dark Green": 90.14, "2017 Light Green": 88.48, "2017": 90.78 },
                { "date": "12/16", "2016": 90.36, "2017 Dark Green": 90.41, "2017 Light Green": 88.77, "2017": 90.62 },
                { "date": "12/23", "2016": 90.59, "2017 Dark Green": 90.69, "2017 Light Green": 89.05, "2017": 91.62 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo3 = function () {
        var chart = AmCharts.makeChart("mnp3gcqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 40,
            "marginLeft": 40,
            "autoMarginOffset": 20,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 3G CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 6,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 6,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 3G CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 3G CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "graph": "g4",
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 40,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": true,
                "fontSize": 16,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 50,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "dataProvider": [
                { "date": "01/01", "2016": 85.34, "2017 Dark Green": 85.87, "2017 Light Green": 83.44, "2017": 86.50, "2018": 85.43 },
                { "date": "01/08", "2016": 86.28, "2017 Dark Green": 85.87, "2017 Light Green": 83.43, "2017": 85.95, "2018": 83.87 },
                { "date": "01/15", "2016": 86.47, "2017 Dark Green": 85.87, "2017 Light Green": 83.43, "2017": 83.98, "2018": 84.15 },
                { "date": "01/22", "2016": 85.08, "2017 Dark Green": 85.87, "2017 Light Green": 83.42, "2017": 84.28 },
                { "date": "01/29", "2016": 85.64, "2017 Dark Green": 85.87, "2017 Light Green": 83.41, "2017": 85.10 },
                { "date": "02/05", "2016": 86.17, "2017 Dark Green": 85.87, "2017 Light Green": 83.40, "2017": 85.24 },
                { "date": "02/12", "2016": 85.44, "2017 Dark Green": 85.87, "2017 Light Green": 83.40, "2017": 84.51 },
                { "date": "02/19", "2016": 83.42, "2017 Dark Green": 85.79, "2017 Light Green": 83.30, "2017": 84.77 },
                { "date": "02/26", "2016": 85.60, "2017 Dark Green": 85.64, "2017 Light Green": 83.14, "2017": 85.09 },
                { "date": "03/04", "2016": 84.99, "2017 Dark Green": 85.44, "2017 Light Green": 82.94, "2017": 85.07 },
                { "date": "03/11", "2016": 84.13, "2017 Dark Green": 85.21, "2017 Light Green": 82.68, "2017": 85.35 },
                { "date": "03/18", "2016": 84.36, "2017 Dark Green": 84.95, "2017 Light Green": 82.39, "2017": 84.87 },
                { "date": "03/25", "2016": 84.58, "2017 Dark Green": 84.66, "2017 Light Green": 82.06, "2017": 83.86 },
                { "date": "04/01", "2016": 85.23, "2017 Dark Green": 84.34, "2017 Light Green": 81.69, "2017": 84.76 },
                { "date": "04/08", "2016": 84.82, "2017 Dark Green": 84.00, "2017 Light Green": 81.32, "2017": 84.62 },
                { "date": "04/15", "2016": 84.13, "2017 Dark Green": 83.67, "2017 Light Green": 80.94, "2017": 84.17 },
                { "date": "04/22", "2016": 83.15, "2017 Dark Green": 83.33, "2017 Light Green": 80.56, "2017": 83.33 },
                { "date": "04/29", "2016": 84.11, "2017 Dark Green": 83.00, "2017 Light Green": 80.19, "2017": 83.68 },
                { "date": "05/06", "2016": 83.31, "2017 Dark Green": 82.68, "2017 Light Green": 79.83, "2017": 83.36 },
                { "date": "05/13", "2016": 82.73, "2017 Dark Green": 82.37, "2017 Light Green": 79.48, "2017": 82.24 },
                { "date": "05/20", "2016": 81.57, "2017 Dark Green": 82.08, "2017 Light Green": 79.15, "2017": 82.04 },
                { "date": "05/27", "2016": 81.05, "2017 Dark Green": 81.81, "2017 Light Green": 78.85, "2017": 81.64 },
                { "date": "06/03", "2016": 81.15, "2017 Dark Green": 81.57, "2017 Light Green": 78.58, "2017": 81.49 },
                { "date": "06/10", "2016": 80.34, "2017 Dark Green": 81.35, "2017 Light Green": 78.33, "2017": 80.54 },
                { "date": "06/17", "2016": 81.21, "2017 Dark Green": 81.16, "2017 Light Green": 78.11, "2017": 80.84 },
                { "date": "06/24", "2016": 80.77, "2017 Dark Green": 81.00, "2017 Light Green": 77.92, "2017": 79.62 },
                { "date": "07/01", "2016": 78.05, "2017 Dark Green": 80.88, "2017 Light Green": 77.77, "2017": 79.82 },
                { "date": "07/08", "2016": 79.71, "2017 Dark Green": 80.78, "2017 Light Green": 77.66, "2017": 80.67 },
                { "date": "07/15", "2016": 78.14, "2017 Dark Green": 80.72, "2017 Light Green": 77.58, "2017": 80.12 },
                { "date": "07/22", "2016": 78.83, "2017 Dark Green": 80.70, "2017 Light Green": 77.55, "2017": 79.97 },
                { "date": "07/29", "2016": 79.50, "2017 Dark Green": 80.71, "2017 Light Green": 77.55, "2017": 80.09 },
                { "date": "08/05", "2016": 80.09, "2017 Dark Green": 80.75, "2017 Light Green": 77.59, "2017": 80.42 },
                { "date": "08/12", "2016": 79.06, "2017 Dark Green": 80.83, "2017 Light Green": 77.67, "2017": 80.31 },
                { "date": "08/19", "2016": 80.86, "2017 Dark Green": 80.94, "2017 Light Green": 77.78, "2017": 80.08 },
                { "date": "08/26", "2016": 80.64, "2017 Dark Green": 81.09, "2017 Light Green": 77.93, "2017": 80.01 },
                { "date": "09/02", "2016": 80.45, "2017 Dark Green": 81.26, "2017 Light Green": 78.12, "2017": 80.29 },
                { "date": "09/09", "2016": 81.04, "2017 Dark Green": 81.47, "2017 Light Green": 78.35, "2017": 80.12 },
                { "date": "09/16", "2016": 80.34, "2017 Dark Green": 81.71, "2017 Light Green": 78.60, "2017": 79.27 },
                { "date": "09/23", "2016": 81.42, "2017 Dark Green": 81.97, "2017 Light Green": 78.89, "2017": 79.08 },
                { "date": "09/30", "2016": 81.56, "2017 Dark Green": 82.26, "2017 Light Green": 79.21, "2017": 68.23 },
                { "date": "10/07", "2016": 82.54, "2017 Dark Green": 82.57, "2017 Light Green": 79.55, "2017": 80.39 },
                { "date": "10/14", "2016": 82.67, "2017 Dark Green": 82.90, "2017 Light Green": 79.90, "2017": 81.36 },
                { "date": "10/21", "2016": 83.25, "2017 Dark Green": 83.25, "2017 Light Green": 80.28, "2017": 81.82 },
                { "date": "10/28", "2016": 83.67, "2017 Dark Green": 83.61, "2017 Light Green": 80.67, "2017": 82.26 },
                { "date": "11/04", "2016": 83.13, "2017 Dark Green": 83.97, "2017 Light Green": 81.07, "2017": 82.48 },
                { "date": "11/11", "2016": 83.43, "2017 Dark Green": 84.34, "2017 Light Green": 81.46, "2017": 81.89 },
                { "date": "11/18", "2016": 84.26, "2017 Dark Green": 84.70, "2017 Light Green": 81.86, "2017": 82.74 },
                { "date": "11/25", "2016": 84.09, "2017 Dark Green": 85.05, "2017 Light Green": 82.24, "2017": 82.52 },
                { "date": "12/02", "2016": 85.10, "2017 Dark Green": 85.25, "2017 Light Green": 82.45, "2017": 83.12 },
                { "date": "12/09", "2016": 86.19, "2017 Dark Green": 85.46, "2017 Light Green": 82.65, "2017": 83.35 },
                { "date": "12/16", "2016": 85.30, "2017 Dark Green": 85.67, "2017 Light Green": 82.86, "2017": 83.46 },
                { "date": "12/23", "2016": 85.34, "2017 Dark Green": 85.87, "2017 Light Green": 83.07, "2017": 85.57 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo4 = function () {
        var chart = AmCharts.makeChart("mnplte2cqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 7,
            "marginLeft": 7,
            "marginTop": 5,
            "marginBottom": 5,
            "autoMarginOffset": 5,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 20,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": false,
                "fontSize": 10,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 40,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 14,
                    "text": "MNP LTE CQI"
                }
            ],
            "dataProvider": [
                { "date": "01/01", "2016": 84.44, "2017 Dark Green": 89.82, "2017 Light Green": 88.34, "2017": 90.15, "2018": 92.43 },
                { "date": "01/08", "2016": 84.68, "2017 Dark Green": 89.75, "2017 Light Green": 88.26, "2017": 90.34, "2018": 91.72 },
                { "date": "01/15", "2016": 85.01, "2017 Dark Green": 89.68, "2017 Light Green": 88.19, "2017": 89.65, "2018": 91.91 },
                { "date": "01/22", "2016": 84.41, "2017 Dark Green": 89.61, "2017 Light Green": 88.11, "2017": 89.39 },
                { "date": "01/29", "2016": 84.40, "2017 Dark Green": 89.54, "2017 Light Green": 88.04, "2017": 89.81 },
                { "date": "02/05", "2016": 84.59, "2017 Dark Green": 89.49, "2017 Light Green": 87.98, "2017": 89.88 },
                { "date": "02/12", "2016": 84.63, "2017 Dark Green": 89.42, "2017 Light Green": 87.91, "2017": 89.44 },
                { "date": "02/19", "2016": 84.53, "2017 Dark Green": 89.33, "2017 Light Green": 87.80, "2017": 89.46 },
                { "date": "02/26", "2016": 85.23, "2017 Dark Green": 89.19, "2017 Light Green": 87.66, "2017": 89.68 },
                { "date": "03/04", "2016": 84.96, "2017 Dark Green": 89.04, "2017 Light Green": 87.50, "2017": 89.52 },
                { "date": "03/11", "2016": 85.00, "2017 Dark Green": 88.87, "2017 Light Green": 87.32, "2017": 89.69 },
                { "date": "03/18", "2016": 84.92, "2017 Dark Green": 88.69, "2017 Light Green": 87.12, "2017": 89.17 },
                { "date": "03/25", "2016": 84.15, "2017 Dark Green": 88.48, "2017 Light Green": 86.90, "2017": 89.36 },
                { "date": "04/01", "2016": 85.89, "2017 Dark Green": 88.27, "2017 Light Green": 86.67, "2017": 89.33 },
                { "date": "04/08", "2016": 85.90, "2017 Dark Green": 88.06, "2017 Light Green": 86.43, "2017": 89.24 },
                { "date": "04/15", "2016": 85.46, "2017 Dark Green": 87.85, "2017 Light Green": 86.20, "2017": 88.99 },
                { "date": "04/22", "2016": 83.61, "2017 Dark Green": 87.64, "2017 Light Green": 85.98, "2017": 89.10 },
                { "date": "04/29", "2016": 85.49, "2017 Dark Green": 87.44, "2017 Light Green": 85.76, "2017": 88.94 },
                { "date": "05/06", "2016": 85.21, "2017 Dark Green": 87.25, "2017 Light Green": 85.55, "2017": 88.93 },
                { "date": "05/13", "2016": 84.84, "2017 Dark Green": 87.08, "2017 Light Green": 85.35, "2017": 88.64 },
                { "date": "05/20", "2016": 84.58, "2017 Dark Green": 86.91, "2017 Light Green": 85.17, "2017": 88.63 },
                { "date": "05/27", "2016": 84.38, "2017 Dark Green": 86.77, "2017 Light Green": 85.01, "2017": 88.46 },
                { "date": "06/03", "2016": 84.65, "2017 Dark Green": 86.64, "2017 Light Green": 84.87, "2017": 88.58 },
                { "date": "06/10", "2016": 84.36, "2017 Dark Green": 86.52, "2017 Light Green": 84.74, "2017": 88.29 },
                { "date": "06/17", "2016": 84.37, "2017 Dark Green": 86.43, "2017 Light Green": 84.64, "2017": 88.28 },
                { "date": "06/24", "2016": 84.38, "2017 Dark Green": 86.36, "2017 Light Green": 84.56, "2017": 88.25 },
                { "date": "07/01", "2016": 83.37, "2017 Dark Green": 86.31, "2017 Light Green": 84.51, "2017": 87.65 },
                { "date": "07/08", "2016": 83.90, "2017 Dark Green": 86.29, "2017 Light Green": 84.48, "2017": 88.29 },
                { "date": "07/15", "2016": 83.92, "2017 Dark Green": 86.28, "2017 Light Green": 84.47, "2017": 88.21 },
                { "date": "07/22", "2016": 84.07, "2017 Dark Green": 86.30, "2017 Light Green": 84.49, "2017": 88.24 },
                { "date": "07/29", "2016": 84.93, "2017 Dark Green": 86.34, "2017 Light Green": 84.53, "2017": 88.33 },
                { "date": "08/05", "2016": 85.05, "2017 Dark Green": 86.40, "2017 Light Green": 84.60, "2017": 88.48 },
                { "date": "08/12", "2016": 84.99, "2017 Dark Green": 86.49, "2017 Light Green": 84.69, "2017": 88.38 },
                { "date": "08/19", "2016": 85.14, "2017 Dark Green": 86.59, "2017 Light Green": 84.81, "2017": 88.38 },
                { "date": "08/26", "2016": 85.59, "2017 Dark Green": 86.72, "2017 Light Green": 84.94, "2017": 88.32 },
                { "date": "09/02", "2016": 85.50, "2017 Dark Green": 86.86, "2017 Light Green": 85.10, "2017": 87.86 },
                { "date": "09/09", "2016": 85.82, "2017 Dark Green": 87.03, "2017 Light Green": 85.28, "2017": 87.87 },
                { "date": "09/16", "2016": 86.03, "2017 Dark Green": 87.21, "2017 Light Green": 85.48, "2017": 87.90 },
                { "date": "09/23", "2016": 86.61, "2017 Dark Green": 87.40, "2017 Light Green": 85.69, "2017": 88.22 },
                { "date": "09/30", "2016": 86.92, "2017 Dark Green": 87.60, "2017 Light Green": 85.91, "2017": 88.61 },
                { "date": "10/07", "2016": 87.25, "2017 Dark Green": 87.82, "2017 Light Green": 86.15, "2017": 88.93 },
                { "date": "10/14", "2016": 87.61, "2017 Dark Green": 88.03, "2017 Light Green": 86.38, "2017": 89.29 },
                { "date": "10/21", "2016": 84.69, "2017 Dark Green": 88.25, "2017 Light Green": 86.62, "2017": 89.61 },
                { "date": "10/28", "2016": 88.05, "2017 Dark Green": 88.47, "2017 Light Green": 86.86, "2017": 90.24 },
                { "date": "11/04", "2016": 87.61, "2017 Dark Green": 88.68, "2017 Light Green": 87.10, "2017": 90.45 },
                { "date": "11/11", "2016": 89.03, "2017 Dark Green": 88.89, "2017 Light Green": 87.33, "2017": 90.40 },
                { "date": "11/18", "2016": 88.78, "2017 Dark Green": 89.09, "2017 Light Green": 87.55, "2017": 90.66 },
                { "date": "11/25", "2016": 88.78, "2017 Dark Green": 89.28, "2017 Light Green": 87.75, "2017": 90.63 },
                { "date": "12/02", "2016": 89.64, "2017 Dark Green": 89.41, "2017 Light Green": 87.90, "2017": 91.23 },
                { "date": "12/09", "2016": 90.20, "2017 Dark Green": 89.55, "2017 Light Green": 88.04, "2017": 91.09 },
                { "date": "12/16", "2016": 89.80, "2017 Dark Green": 89.68, "2017 Light Green": 88.19, "2017": 91.29 },
                { "date": "12/23", "2016": 89.79, "2017 Dark Green": 89.82, "2017 Light Green": 88.34, "2017": 92.11 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo5 = function () {
        var chart = AmCharts.makeChart("mnplteretcqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 7,
            "marginLeft": 7,
            "marginTop": 5,
            "marginBottom": 5,
            "autoMarginOffset": 5,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 20,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": false,
                "fontSize": 10,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 40,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 14,
                    "text": "MNP LTE Data Drop Rate"
                }
            ],
            "dataProvider": [
                { "date": "01/01", "2016": 0.29, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.2, "2018": 0.17 },
                { "date": "01/08", "2016": 0.29, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.18, "2018": 0.18 },
                { "date": "01/15", "2016": 0.27, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.19, "2018": 0.18 },
                { "date": "01/22", "2016": 0.28, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.19 },
                { "date": "01/29", "2016": 0.27, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.18 },
                { "date": "02/05", "2016": 0.27, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.18 },
                { "date": "02/12", "2016": 0.27, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.19 },
                { "date": "02/19", "2016": 0.28, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.19 },
                { "date": "02/26", "2016": 0.27, "2017 Dark Green": 0.18, "2017 Light Green": 0.21, "2017": 0.19 },
                { "date": "03/04", "2016": 0.28, "2017 Dark Green": 0.18, "2017 Light Green": 0.21, "2017": 0.19 },
                { "date": "03/11", "2016": 0.29, "2017 Dark Green": 0.19, "2017 Light Green": 0.22, "2017": 0.19 },
                { "date": "03/18", "2016": 0.3, "2017 Dark Green": 0.19, "2017 Light Green": 0.22, "2017": 0.22 },
                { "date": "03/25", "2016": 0.34, "2017 Dark Green": 0.2, "2017 Light Green": 0.23, "2017": 0.18 },
                { "date": "04/01", "2016": 0.28, "2017 Dark Green": 0.2, "2017 Light Green": 0.23, "2017": 0.18 },
                { "date": "04/08", "2016": 0.28, "2017 Dark Green": 0.21, "2017 Light Green": 0.24, "2017": 0.19 },
                { "date": "04/15", "2016": 0.29, "2017 Dark Green": 0.21, "2017 Light Green": 0.24, "2017": 0.19 },
                { "date": "04/22", "2016": 0.52, "2017 Dark Green": 0.22, "2017 Light Green": 0.25, "2017": 0.19 },
                { "date": "04/29", "2016": 0.31, "2017 Dark Green": 0.22, "2017 Light Green": 0.26, "2017": 0.19 },
                { "date": "05/06", "2016": 0.31, "2017 Dark Green": 0.23, "2017 Light Green": 0.26, "2017": 0.18 },
                { "date": "05/13", "2016": 0.35, "2017 Dark Green": 0.23, "2017 Light Green": 0.27, "2017": 0.17 },
                { "date": "05/20", "2016": 0.34, "2017 Dark Green": 0.24, "2017 Light Green": 0.27, "2017": 0.16 },
                { "date": "05/27", "2016": 0.34, "2017 Dark Green": 0.24, "2017 Light Green": 0.28, "2017": 0.16 },
                { "date": "06/03", "2016": 0.34, "2017 Dark Green": 0.24, "2017 Light Green": 0.28, "2017": 0.16 },
                { "date": "06/10", "2016": 0.36, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.17 },
                { "date": "06/17", "2016": 0.35, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.17 },
                { "date": "06/24", "2016": 0.35, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.17 },
                { "date": "07/01", "2016": 0.37, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.18 },
                { "date": "07/08", "2016": 0.36, "2017 Dark Green": 0.25, "2017 Light Green": 0.3, "2017": 0.17 },
                { "date": "07/15", "2016": 0.36, "2017 Dark Green": 0.26, "2017 Light Green": 0.3, "2017": 0.18 },
                { "date": "07/22", "2016": 0.36, "2017 Dark Green": 0.26, "2017 Light Green": 0.3, "2017": 0.17 },
                { "date": "07/29", "2016": 0.35, "2017 Dark Green": 0.25, "2017 Light Green": 0.3, "2017": 0.17 },
                { "date": "08/05", "2016": 0.35, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.17 },
                { "date": "08/12", "2016": 0.36, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.17 },
                { "date": "08/19", "2016": 0.38, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.19 },
                { "date": "08/26", "2016": 0.34, "2017 Dark Green": 0.25, "2017 Light Green": 0.29, "2017": 0.2 },
                { "date": "09/02", "2016": 0.33, "2017 Dark Green": 0.24, "2017 Light Green": 0.28, "2017": 0.24 },
                { "date": "09/09", "2016": 0.33, "2017 Dark Green": 0.24, "2017 Light Green": 0.28, "2017": 0.25 },
                { "date": "09/16", "2016": 0.3, "2017 Dark Green": 0.24, "2017 Light Green": 0.27, "2017": 0.25 },
                { "date": "09/23", "2016": 0.26, "2017 Dark Green": 0.23, "2017 Light Green": 0.27, "2017": 0.24 },
                { "date": "09/30", "2016": 0.26, "2017 Dark Green": 0.23, "2017 Light Green": 0.26, "2017": 0.22 },
                { "date": "10/07", "2016": 0.26, "2017 Dark Green": 0.22, "2017 Light Green": 0.26, "2017": 0.22 },
                { "date": "10/14", "2016": 0.24, "2017 Dark Green": 0.22, "2017 Light Green": 0.25, "2017": 0.22 },
                { "date": "10/21", "2016": 0.28, "2017 Dark Green": 0.21, "2017 Light Green": 0.24, "2017": 0.21 },
                { "date": "10/28", "2016": 0.21, "2017 Dark Green": 0.21, "2017 Light Green": 0.24, "2017": 0.2 },
                { "date": "11/04", "2016": 0.28, "2017 Dark Green": 0.2, "2017 Light Green": 0.23, "2017": 0.2 },
                { "date": "11/11", "2016": 0.19, "2017 Dark Green": 0.19, "2017 Light Green": 0.23, "2017": 0.2 },
                { "date": "11/18", "2016": 0.19, "2017 Dark Green": 0.19, "2017 Light Green": 0.22, "2017": 0.2 },
                { "date": "11/25", "2016": 0.19, "2017 Dark Green": 0.18, "2017 Light Green": 0.21, "2017": 0.21 },
                { "date": "12/02", "2016": 0.18, "2017 Dark Green": 0.18, "2017 Light Green": 0.21, "2017": 0.18 },
                { "date": "12/09", "2016": 0.17, "2017 Dark Green": 0.18, "2017 Light Green": 0.21, "2017": 0.21 },
                { "date": "12/16", "2016": 0.18, "2017 Dark Green": 0.18, "2017 Light Green": 0.21, "2017": 0.18 },
                { "date": "12/23", "2016": 0.18, "2017 Dark Green": 0.17, "2017 Light Green": 0.2, "2017": 0.18 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo6 = function () {
        var chart = AmCharts.makeChart("mnplteacccqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 7,
            "marginLeft": 7,
            "marginTop": 5,
            "marginBottom": 5,
            "autoMarginOffset": 5,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 20,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": false,
                "fontSize": 10,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 40,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 14,
                    "text": "MNP LTE Acc Failure Rate"
                }
            ],
            "dataProvider": [
                { "date": "01/01", "2016": 0.18, "2017 Dark Green": 0.12, "2017 Light Green": 0.14, "2017": 0.13, "2018": 0.12 },
                { "date": "01/08", "2016": 0.19, "2017 Dark Green": 0.12, "2017 Light Green": 0.14, "2017": 0.13, "2018": 0.13 },
                { "date": "01/15", "2016": 0.18, "2017 Dark Green": 0.12, "2017 Light Green": 0.14, "2017": 0.13, "2018": 0.12 },
                { "date": "01/22", "2016": 0.17, "2017 Dark Green": 0.12, "2017 Light Green": 0.14, "2017": 0.14 },
                { "date": "01/29", "2016": 0.18, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.13 },
                { "date": "02/05", "2016": 0.2, "2017 Dark Green": 0.13, "2017 Light Green": 0.14, "2017": 0.13 },
                { "date": "02/12", "2016": 0.19, "2017 Dark Green": 0.13, "2017 Light Green": 0.14, "2017": 0.14 },
                { "date": "02/19", "2016": 0.17, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.14 },
                { "date": "02/26", "2016": 0.16, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.13 },
                { "date": "03/04", "2016": 0.16, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.14 },
                { "date": "03/11", "2016": 0.16, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.13 },
                { "date": "03/18", "2016": 0.2, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.14 },
                { "date": "03/25", "2016": 0.24, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.14 },
                { "date": "04/01", "2016": 0.14, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.14 },
                { "date": "04/08", "2016": 0.14, "2017 Dark Green": 0.13, "2017 Light Green": 0.16, "2017": 0.15 },
                { "date": "04/15", "2016": 0.14, "2017 Dark Green": 0.14, "2017 Light Green": 0.16, "2017": 0.15 },
                { "date": "04/22", "2016": 0.14, "2017 Dark Green": 0.14, "2017 Light Green": 0.16, "2017": 0.15 },
                { "date": "04/29", "2016": 0.14, "2017 Dark Green": 0.14, "2017 Light Green": 0.16, "2017": 0.15 },
                { "date": "05/06", "2016": 0.14, "2017 Dark Green": 0.14, "2017 Light Green": 0.16, "2017": 0.15 },
                { "date": "05/13", "2016": 0.15, "2017 Dark Green": 0.14, "2017 Light Green": 0.17, "2017": 0.15 },
                { "date": "05/20", "2016": 0.15, "2017 Dark Green": 0.15, "2017 Light Green": 0.17, "2017": 0.15 },
                { "date": "05/27", "2016": 0.16, "2017 Dark Green": 0.15, "2017 Light Green": 0.17, "2017": 0.15 },
                { "date": "06/03", "2016": 0.17, "2017 Dark Green": 0.15, "2017 Light Green": 0.17, "2017": 0.15 },
                { "date": "06/10", "2016": 0.17, "2017 Dark Green": 0.15, "2017 Light Green": 0.18, "2017": 0.15 },
                { "date": "06/17", "2016": 0.16, "2017 Dark Green": 0.15, "2017 Light Green": 0.18, "2017": 0.15 },
                { "date": "06/24", "2016": 0.15, "2017 Dark Green": 0.15, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "07/01", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "07/08", "2016": 0.15, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "07/15", "2016": 0.15, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "07/22", "2016": 0.16, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "07/29", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "08/05", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "08/12", "2016": 0.19, "2017 Dark Green": 0.16, "2017 Light Green": 0.19, "2017": 0.16 },
                { "date": "08/19", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.19, "2017": 0.16 },
                { "date": "08/26", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "09/02", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "09/09", "2016": 0.16, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.17 },
                { "date": "09/16", "2016": 0.17, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.17 },
                { "date": "09/23", "2016": 0.15, "2017 Dark Green": 0.16, "2017 Light Green": 0.18, "2017": 0.16 },
                { "date": "09/30", "2016": 0.16, "2017 Dark Green": 0.15, "2017 Light Green": 0.18, "2017": 0.15 },
                { "date": "10/07", "2016": 0.16, "2017 Dark Green": 0.15, "2017 Light Green": 0.18, "2017": 0.15 },
                { "date": "10/14", "2016": 0.15, "2017 Dark Green": 0.15, "2017 Light Green": 0.17, "2017": 0.15 },
                { "date": "10/21", "2016": 0.46, "2017 Dark Green": 0.15, "2017 Light Green": 0.17, "2017": 0.15 },
                { "date": "10/28", "2016": 0.15, "2017 Dark Green": 0.15, "2017 Light Green": 0.17, "2017": 0.13 },
                { "date": "11/04", "2016": 0.14, "2017 Dark Green": 0.14, "2017 Light Green": 0.17, "2017": 0.13 },
                { "date": "11/11", "2016": 0.13, "2017 Dark Green": 0.14, "2017 Light Green": 0.16, "2017": 0.13 },
                { "date": "11/18", "2016": 0.16, "2017 Dark Green": 0.14, "2017 Light Green": 0.16, "2017": 0.13 },
                { "date": "11/25", "2016": 0.16, "2017 Dark Green": 0.13, "2017 Light Green": 0.16, "2017": 0.13 },
                { "date": "12/02", "2016": 0.13, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.12 },
                { "date": "12/09", "2016": 0.12, "2017 Dark Green": 0.13, "2017 Light Green": 0.15, "2017": 0.12 },
                { "date": "12/16", "2016": 0.13, "2017 Dark Green": 0.13, "2017 Light Green": 0.14, "2017": 0.13 },
                { "date": "12/23", "2016": 0.13, "2017 Dark Green": 0.12, "2017 Light Green": 0.14, "2017": 0.12 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo7 = function () {
        var chart = AmCharts.makeChart("mnpdlthrpt", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 7,
            "marginLeft": 7,
            "marginTop": 5,
            "marginBottom": 5,
            "autoMarginOffset": 5,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 20,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": false,
                "fontSize": 10,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 40,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 14,
                    "text": "MNP LTE DL Throughput"
                }
            ],
            "dataProvider": [
                { "date": "01/01", "2016": 4686, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 8115, "2018": 7432 },
                { "date": "01/08", "2016": 4658, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7917, "2018": 7060 },
                { "date": "01/15", "2016": 4626, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7456, "2018": 7089 },
                { "date": "01/22", "2016": 4405, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7218 },
                { "date": "01/29", "2016": 4439, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7252 },
                { "date": "02/05", "2016": 4603, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7313 },
                { "date": "02/12", "2016": 4593, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7156 },
                { "date": "02/19", "2016": 4638, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7181 },
                { "date": "02/26", "2016": 4849, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7166 },
                { "date": "03/04", "2016": 4830, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7039 },
                { "date": "03/11", "2016": 4985, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6991 },
                { "date": "03/18", "2016": 5376, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6794 },
                { "date": "03/25", "2016": 5526, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6739 },
                { "date": "04/01", "2016": 5542, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6649 },
                { "date": "04/08", "2016": 5488, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6575 },
                { "date": "04/15", "2016": 5333, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6485 },
                { "date": "04/22", "2016": 5355, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6459 },
                { "date": "04/29", "2016": 5445, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6336 },
                { "date": "05/06", "2016": 5402, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6274 },
                { "date": "05/13", "2016": 5385, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6065 },
                { "date": "05/20", "2016": 5435, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5968 },
                { "date": "05/27", "2016": 5607, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5987 },
                { "date": "06/03", "2016": 5466, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6011 },
                { "date": "06/10", "2016": 5527, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5784 },
                { "date": "06/17", "2016": 5580, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5822 },
                { "date": "06/24", "2016": 5816, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5845 },
                { "date": "07/01", "2016": 5770, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5663 },
                { "date": "07/08", "2016": 5984, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5940 },
                { "date": "07/15", "2016": 5972, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5909 },
                { "date": "07/22", "2016": 6057, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5916 },
                { "date": "07/29", "2016": 6061, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5917 },
                { "date": "08/05", "2016": 6182, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5883 },
                { "date": "08/12", "2016": 6326, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5845 },
                { "date": "08/19", "2016": 6280, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5881 },
                { "date": "08/26", "2016": 6297, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5891 },
                { "date": "09/02", "2016": 6266, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5858 },
                { "date": "09/09", "2016": 6228, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5828 },
                { "date": "09/16", "2016": 6241, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5852 },
                { "date": "09/23", "2016": 6388, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5841 },
                { "date": "09/30", "2016": 6387, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5885 },
                { "date": "10/07", "2016": 6515, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 5989 },
                { "date": "10/14", "2016": 6620, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6071 },
                { "date": "10/21", "2016": 6811, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6149 },
                { "date": "10/28", "2016": 6933, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6389 },
                { "date": "11/04", "2016": 6823, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6470 },
                { "date": "11/11", "2016": 7241, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6525 },
                { "date": "11/18", "2016": 7239, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6564 },
                { "date": "11/25", "2016": 7239, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6572 },
                { "date": "12/02", "2016": 7408, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6676 },
                { "date": "12/09", "2016": 7622, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6660 },
                { "date": "12/16", "2016": 7536, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 6743 },
                { "date": "12/23", "2016": 7767, "2017 Dark Green": 6812, "2017 Light Green": 5839, "2017": 7332 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo8 = function () {
        var chart = AmCharts.makeChart("mnpltetnolcqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 7,
            "marginLeft": 7,
            "marginTop": 5,
            "marginBottom": 5,
            "autoMarginOffset": 5,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 20,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": false,
                "fontSize": 10,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 40,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 14,
                    "text": "MNP LTE TnoL"
                }
            ],
            "dataProvider": [
                { "date": "01/01", "2016": 12.15, "2017 Dark Green": 7.77, "2017 Light Green": 8.36, "2017": 7.55, "2018": 3.55 },
                { "date": "01/08", "2016": 11.5, "2017 Dark Green": 7.86, "2017 Light Green": 8.47, "2017": 7.35, "2018": 4.01 },
                { "date": "01/15", "2016": 11.35, "2017 Dark Green": 7.96, "2017 Light Green": 8.57, "2017": 7.82, "2018": 3.79 },
                { "date": "01/22", "2016": 12.07, "2017 Dark Green": 8.06, "2017 Light Green": 8.68, "2017": 8.01 },
                { "date": "01/29", "2016": 12.11, "2017 Dark Green": 8.15, "2017 Light Green": 8.78, "2017": 7.62 },
                { "date": "02/05", "2016": 11.71, "2017 Dark Green": 8.23, "2017 Light Green": 8.86, "2017": 7.49 },
                { "date": "02/12", "2016": 11.83, "2017 Dark Green": 8.35, "2017 Light Green": 8.99, "2017": 7.82 },
                { "date": "02/19", "2016": 12.06, "2017 Dark Green": 8.51, "2017 Light Green": 9.16, "2017": 7.78 },
                { "date": "02/26", "2016": 11.61, "2017 Dark Green": 8.7, "2017 Light Green": 9.37, "2017": 7.53 },
                { "date": "03/04", "2016": 11.91, "2017 Dark Green": 8.91, "2017 Light Green": 9.6, "2017": 7.59 },
                { "date": "03/11", "2016": 11.91, "2017 Dark Green": 9.15, "2017 Light Green": 9.85, "2017": 7.3 },
                { "date": "03/18", "2016": 11.64, "2017 Dark Green": 9.4, "2017 Light Green": 10.12, "2017": 7.52 },
                { "date": "03/25", "2016": 11.95, "2017 Dark Green": 9.65, "2017 Light Green": 10.4, "2017": 7.61 },
                { "date": "04/01", "2016": 11.42, "2017 Dark Green": 9.92, "2017 Light Green": 10.68, "2017": 7.59 },
                { "date": "04/08", "2016": 11.37, "2017 Dark Green": 10.18, "2017 Light Green": 10.96, "2017": 7.56 },
                { "date": "04/15", "2016": 11.77, "2017 Dark Green": 10.44, "2017 Light Green": 11.24, "2017": 7.76 },
                { "date": "04/22", "2016": 11.7, "2017 Dark Green": 10.69, "2017 Light Green": 11.51, "2017": 7.6 },
                { "date": "04/29", "2016": 11.54, "2017 Dark Green": 10.93, "2017 Light Green": 11.77, "2017": 7.64 },
                { "date": "05/06", "2016": 11.81, "2017 Dark Green": 11.15, "2017 Light Green": 12.01, "2017": 7.75 },
                { "date": "05/13", "2016": 11.73, "2017 Dark Green": 11.35, "2017 Light Green": 12.23, "2017": 8.07 },
                { "date": "05/20", "2016": 12.28, "2017 Dark Green": 11.54, "2017 Light Green": 12.43, "2017": 8.12 },
                { "date": "05/27", "2016": 12.78, "2017 Dark Green": 11.7, "2017 Light Green": 12.6, "2017": 8.34 },
                { "date": "06/03", "2016": 12.29, "2017 Dark Green": 11.84, "2017 Light Green": 12.75, "2017": 8.22 },
                { "date": "06/10", "2016": 12.75, "2017 Dark Green": 11.95, "2017 Light Green": 12.87, "2017": 8.35 },
                { "date": "06/17", "2016": 12.91, "2017 Dark Green": 12.04, "2017 Light Green": 12.97, "2017": 8.31 },
                { "date": "06/24", "2016": 13.34, "2017 Dark Green": 12.1, "2017 Light Green": 13.03, "2017": 8.32 },
                { "date": "07/01", "2016": 14.63, "2017 Dark Green": 12.12, "2017 Light Green": 13.06, "2017": 8.95 },
                { "date": "07/08", "2016": 14.2, "2017 Dark Green": 12.12, "2017 Light Green": 13.05, "2017": 8.37 },
                { "date": "07/15", "2016": 14.11, "2017 Dark Green": 12.09, "2017 Light Green": 13.02, "2017": 8.42 },
                { "date": "07/22", "2016": 13.7, "2017 Dark Green": 12.03, "2017 Light Green": 12.95, "2017": 8.35 },
                { "date": "07/29", "2016": 11.57, "2017 Dark Green": 11.94, "2017 Light Green": 12.86, "2017": 8.25 },
                { "date": "08/05", "2016": 11.52, "2017 Dark Green": 11.82, "2017 Light Green": 12.73, "2017": 8.16 },
                { "date": "08/12", "2016": 11.33, "2017 Dark Green": 11.68, "2017 Light Green": 12.58, "2017": 8.06 },
                { "date": "08/19", "2016": 10.9, "2017 Dark Green": 11.51, "2017 Light Green": 12.4, "2017": 7.93 },
                { "date": "08/26", "2016": 10.84, "2017 Dark Green": 11.32, "2017 Light Green": 12.19, "2017": 7.9 },
                { "date": "09/02", "2016": 11.13, "2017 Dark Green": 11.11, "2017 Light Green": 11.97, "2017": 7.93 },
                { "date": "09/09", "2016": 10.7, "2017 Dark Green": 10.88, "2017 Light Green": 11.72, "2017": 7.74 },
                { "date": "09/16", "2016": 10.7, "2017 Dark Green": 10.64, "2017 Light Green": 11.45, "2017": 7.6 },
                { "date": "09/23", "2016": 10.5, "2017 Dark Green": 10.38, "2017 Light Green": 11.18, "2017": 7.35 },
                { "date": "09/30", "2016": 10.25, "2017 Dark Green": 10.11, "2017 Light Green": 10.89, "2017": 6.98 },
                { "date": "10/07", "2016": 9.72, "2017 Dark Green": 9.84, "2017 Light Green": 10.6, "2017": 6.62 },
                { "date": "10/14", "2016": 9.66, "2017 Dark Green": 9.57, "2017 Light Green": 10.3, "2017": 6.18 },
                { "date": "10/21", "2016": 9.66, "2017 Dark Green": 9.3, "2017 Light Green": 10.02, "2017": 5.86 },
                { "date": "10/28", "2016": 9.46, "2017 Dark Green": 9.04, "2017 Light Green": 9.74, "2017": 5.42 },
                { "date": "11/04", "2016": 9.35, "2017 Dark Green": 8.79, "2017 Light Green": 9.47, "2017": 5.26 },
                { "date": "11/11", "2016": 8.88, "2017 Dark Green": 8.56, "2017 Light Green": 9.22, "2017": 5.26 },
                { "date": "11/18", "2016": 8.89, "2017 Dark Green": 8.36, "2017 Light Green": 9, "2017": 4.88 },
                { "date": "11/25", "2016": 8.89, "2017 Dark Green": 8.19, "2017 Light Green": 8.82, "2017": 4.87 },
                { "date": "12/02", "2016": 8.32, "2017 Dark Green": 8.08, "2017 Light Green": 8.7, "2017": 4.52 },
                { "date": "12/09", "2016": 7.75, "2017 Dark Green": 7.98, "2017 Light Green": 8.59, "2017": 4.34 },
                { "date": "12/16", "2016": 7.95, "2017 Dark Green": 7.87, "2017 Light Green": 8.48, "2017": 4.34 },
                { "date": "12/23", "2016": 8.13, "2017 Dark Green": 7.77, "2017 Light Green": 8.36, "2017": 3.67 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo9 = function () {
        var chart = AmCharts.makeChart("mnplteiratcqi", {
            "hideCredits": true,
            "type": "serial",
            "theme": "light",
            "marginRight": 7,
            "marginLeft": 7,
            "marginTop": 5,
            "marginBottom": 5,
            "autoMarginOffset": 5,
            "mouseWheelZoomEnabled": true,
            "dataDateFormat": "MM-DD",
            "colors": [
                "#888888",
                "#008000",
                "#89C989",
                "#8FD3E3",
                "#0000FF"
            ],
            "valueAxes": [{
                "id": "v1",
                "axisAlpha": 0,
                "position": "left",
                "ignoreAxisWidth": true
            }],
            "balloon": {
                "borderThickness": 1,
                "shadowAlpha": 0
            },
            "graphs": [{
                "id": "g1",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2016 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2016",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g2",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#00800"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Dark Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Dark Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g3",
                "dashLength": 4,
                "showBalloon": false,
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#89C989"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 Light Green",
                "useLineColorForBulletBorder": true,
                "valueField": "2017 Light Green",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g4",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 3,
                "title": "2017 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2017",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            },
            {
                "id": "g5",
                "balloon": {

                    "adjustBorderColor": false,
                    "color": "#ffffff"
                },
                "hideBulletsCount": 50,
                "lineThickness": 5,
                "title": "2018 LTE CQI",
                "useLineColorForBulletBorder": true,
                "valueField": "2018",
                "balloonText": "<span style='font-size:12px;'>[[value]]</span>"
            }
            ],
            "chartScrollbar": {
                "oppositeAxis": false,
                "offset": 30,
                "scrollbarHeight": 20,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "backgroundAlpha": 0,
                "selectedBackgroundAlpha": 0.1,
                "selectedBackgroundColor": "#888888",
                "graphLineColor": "#8FD3E3",
                "graphFillAlpha": 0,
                "graphLineAlpha": 0.5,
                "selectedGraphFillAlpha": 0,
                "selectedGraphLineAlpha": 1,
                "autoGridCount": true,
                "color": "#AAAAAA"
            },
            "legend": {
                "enabled": false,
                "fontSize": 10,
                "align": "center",
                "equalWidths": false,
                "useGraphSettings": true,
                "switchable": true,
                "useMarkerColorForValues": true
            },
            "chartCursor": {
                "pan": true,
                "valueLineEnabled": true,
                "valueLineBalloonEnabled": true,
                "cursorAlpha": 1,
                "cursorColor": "#258cbb",
                "limitToGraph": "g1",
                "valueLineAlpha": 0.2,
                "valueZoomable": true,
                "categoryBalloonDateFormat": "MMM DD"
            },
            "valueScrollbar": {
                "oppositeAxis": false,
                "offset": 40,
                "dragIconHeight": 25,
                "dragIconWidth": 25,
                "scrollbarHeight": 10
            },
            "categoryField": "date",
            "categoryAxis":
            {
                "parseDates": true,
                "dashLength": 1,
                "minorGridEnabled": true,
                "markPeriodChange": false
            },
            "export": {
                "enabled": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 14,
                    "text": "MNP LTE IRAT"
                }
            ],
            "dataProvider": [
                { "date": "01/01", "2016": 0.46, "2017 Dark Green": 0.4, "2017 Light Green": 0.47, "2017": 0.4, "2018": 0.34 },
                { "date": "01/08", "2016": 0.4, "2017 Dark Green": 0.41, "2017 Light Green": 0.48, "2017": 0.4, "2018": 0.42 },
                { "date": "01/15", "2016": 0.4, "2017 Dark Green": 0.42, "2017 Light Green": 0.49, "2017": 0.48 },
                { "date": "01/22", "2016": 0.46, "2017 Dark Green": 0.43, "2017 Light Green": 0.5, "2017": 0.51 },
                { "date": "01/29", "2016": 0.45, "2017 Dark Green": 0.44, "2017 Light Green": 0.51, "2017": 0.45 },
                { "date": "02/05", "2016": 0.43, "2017 Dark Green": 0.45, "2017 Light Green": 0.52, "2017": 0.45 },
                { "date": "02/12", "2016": 0.45, "2017 Dark Green": 0.46, "2017 Light Green": 0.54, "2017": 0.5 },
                { "date": "02/19", "2016": 0.51, "2017 Dark Green": 0.47, "2017 Light Green": 0.55, "2017": 0.51 },
                { "date": "02/26", "2016": 0.44, "2017 Dark Green": 0.48, "2017 Light Green": 0.56, "2017": 0.48 },
                { "date": "03/04", "2016": 0.47, "2017 Dark Green": 0.49, "2017 Light Green": 0.57, "2017": 0.49 },
                { "date": "03/11", "2016": 0.48, "2017 Dark Green": 0.5, "2017 Light Green": 0.58, "2017": 0.46 },
                { "date": "03/18", "2016": 0.47, "2017 Dark Green": 0.51, "2017 Light Green": 0.59, "2017": 0.5 },
                { "date": "03/25", "2016": 0.49, "2017 Dark Green": 0.53, "2017 Light Green": 0.61, "2017": 0.52 },
                { "date": "04/01", "2016": 0.47, "2017 Dark Green": 0.55, "2017 Light Green": 0.64, "2017": 0.52 },
                { "date": "04/08", "2016": 0.47, "2017 Dark Green": 0.57, "2017 Light Green": 0.66, "2017": 0.53 },
                { "date": "04/15", "2016": 0.5, "2017 Dark Green": 0.59, "2017 Light Green": 0.68, "2017": 0.56 },
                { "date": "04/22", "2016": 0.51, "2017 Dark Green": 0.61, "2017 Light Green": 0.71, "2017": 0.54 },
                { "date": "04/29", "2016": 0.52, "2017 Dark Green": 0.63, "2017 Light Green": 0.73, "2017": 0.55 },
                { "date": "05/06", "2016": 0.55, "2017 Dark Green": 0.65, "2017 Light Green": 0.75, "2017": 0.58 },
                { "date": "05/13", "2016": 0.57, "2017 Dark Green": 0.67, "2017 Light Green": 0.77, "2017": 0.65 },
                { "date": "05/20", "2016": 0.61, "2017 Dark Green": 0.68, "2017 Light Green": 0.79, "2017": 0.67 },
                { "date": "05/27", "2016": 0.67, "2017 Dark Green": 0.7, "2017 Light Green": 0.81, "2017": 0.7 },
                { "date": "06/03", "2016": 0.63, "2017 Dark Green": 0.71, "2017 Light Green": 0.82, "2017": 0.68 },
                { "date": "06/10", "2016": 0.65, "2017 Dark Green": 0.72, "2017 Light Green": 0.84, "2017": 0.7 },
                { "date": "06/17", "2016": 0.69, "2017 Dark Green": 0.73, "2017 Light Green": 0.85, "2017": 0.69 },
                { "date": "06/24", "2016": 0.72, "2017 Dark Green": 0.74, "2017 Light Green": 0.86, "2017": 0.7 },
                { "date": "07/01", "2016": 0.83, "2017 Dark Green": 0.75, "2017 Light Green": 0.86, "2017": 0.76 },
                { "date": "07/08", "2016": 0.81, "2017 Dark Green": 0.75, "2017 Light Green": 0.87, "2017": 0.7 },
                { "date": "07/15", "2016": 0.81, "2017 Dark Green": 0.75, "2017 Light Green": 0.87, "2017": 0.7 },
                { "date": "07/22", "2016": 0.81, "2017 Dark Green": 0.75, "2017 Light Green": 0.87, "2017": 0.72 },
                { "date": "07/29", "2016": 0.79, "2017 Dark Green": 0.75, "2017 Light Green": 0.87, "2017": 0.69 },
                { "date": "08/05", "2016": 0.76, "2017 Dark Green": 0.74, "2017 Light Green": 0.86, "2017": 0.67 },
                { "date": "08/12", "2016": 0.75, "2017 Dark Green": 0.74, "2017 Light Green": 0.85, "2017": 0.68 },
                { "date": "08/19", "2016": 0.73, "2017 Dark Green": 0.73, "2017 Light Green": 0.84, "2017": 0.67 },
                { "date": "08/26", "2016": 0.72, "2017 Dark Green": 0.71, "2017 Light Green": 0.83, "2017": 0.66 },
                { "date": "09/02", "2016": 0.76, "2017 Dark Green": 0.7, "2017 Light Green": 0.81, "2017": 0.67 },
                { "date": "09/09", "2016": 0.71, "2017 Dark Green": 0.69, "2017 Light Green": 0.79, "2017": 0.64 },
                { "date": "09/16", "2016": 0.71, "2017 Dark Green": 0.67, "2017 Light Green": 0.77, "2017": 0.65 },
                { "date": "09/23", "2016": 0.71, "2017 Dark Green": 0.65, "2017 Light Green": 0.75, "2017": 0.63 },
                { "date": "09/30", "2016": 0.66, "2017 Dark Green": 0.63, "2017 Light Green": 0.73, "2017": 0.64 },
                { "date": "10/07", "2016": 0.59, "2017 Dark Green": 0.61, "2017 Light Green": 0.7, "2017": 0.63 },
                { "date": "10/14", "2016": 0.57, "2017 Dark Green": 0.59, "2017 Light Green": 0.68, "2017": 0.6 },
                { "date": "10/21", "2016": 0.57, "2017 Dark Green": 0.57, "2017 Light Green": 0.66, "2017": 0.59 },
                { "date": "10/28", "2016": 0.64, "2017 Dark Green": 0.55, "2017 Light Green": 0.64, "2017": 0.53 },
                { "date": "11/04", "2016": 0.56, "2017 Dark Green": 0.53, "2017 Light Green": 0.62, "2017": 0.5 },
                { "date": "11/11", "2016": 0.51, "2017 Dark Green": 0.51, "2017 Light Green": 0.6, "2017": 0.52 },
                { "date": "11/18", "2016": 0.5, "2017 Dark Green": 0.5, "2017 Light Green": 0.58, "2017": 0.5 },
                { "date": "11/25", "2016": 0.5, "2017 Dark Green": 0.48, "2017 Light Green": 0.55, "2017": 0.49 },
                { "date": "12/02", "2016": 0.43, "2017 Dark Green": 0.46, "2017 Light Green": 0.53, "2017": 0.44 },
                { "date": "12/09", "2016": 0.37, "2017 Dark Green": 0.44, "2017 Light Green": 0.51, "2017": 0.43 },
                { "date": "12/16", "2016": 0.43, "2017 Dark Green": 0.42, "2017 Light Green": 0.49, "2017": 0.45 },
                { "date": "12/23", "2016": 0.46, "2017 Dark Green": 0.4, "2017 Light Green": 0.47, "2017": 0.37 }
            ]
        });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 60, chart.dataProvider.length - 1);
        }
    }

    var demo10 = function () {
        var chart = AmCharts.makeChart("centralpoelteac", {
            "type": "serial",
            "hideCredits": true,
            "balloonDateFormat": "MMM YYYY",
            "categoryField": "date",
            "columnSpacing": 10,
            "dataDateFormat": "YYYY-MM",
            "autoMarginOffset": 5,
            "export": {
                "enabled": true
            },
            "marginRight": 10,
            "marginTop": 10,
            "plotAreaBorderAlpha": 0.5,
            "plotAreaFillColors": "#0000FF",
            "colors": [
                "#5b9bd5",
                "#808080",
                "#228b22",
                "#0066cc",
                "#303030",
                "#006400",
                "#e8d685",
                "#e0ad63",
                "#d48652",
                "#d27362",
                "#495fba",
                "#8881cc"
            ],
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 13,
            "theme": "dark",
            "categoryAxis": {
                "minPeriod": "MM",
                "parseDates": true,
                "markPeriodChange": false
            },
            "chartCursor": {
                "enabled": true,
                "categoryBalloonDateFormat": "MMM",
                "cursorColor": "#258cbb"
            },
            "trendLines": [],
            "graphs": [
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-1",
                    "title": "Forecast",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-1"
                },
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-2",
                    "title": "Need By Date",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-2"
                },
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-3",
                    "title": "Actual",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-3"
                },
                {
                    "id": "AmGraph-4",
                    "lineThickness": 4,
                    "title": "Cumulative - Forecast",
                    "valueAxis": "ValueAxis-2",
                    "showBalloon": false,
                    "valueField": "column-4"
                },
                {
                    "id": "AmGraph-5",
                    "lineThickness": 4,
                    "title": "Cumulative - NBD",
                    "valueAxis": "ValueAxis-2",
                    "showBalloon": false,
                    "valueField": "column-5"
                },
                {
                    "id": "AmGraph-6",
                    "lineThickness": 4,
                    "title": "Cumulative - Actual",
                    "valueAxis": "ValueAxis-2",
                    "showBalloon": false,
                    "valueField": "column-6"
                }
            ],
            "guides": [],
            "valueAxes": [
                {
                    "id": "ValueAxis-1",
                    "minMaxMultiplier": 0,
                    "axisAlpha": 0.5,
                    "axisColor": "#000000",
                    "markPeriodChange": false,
                    "title": ""
                },
                {
                    "id": "ValueAxis-2",
                    "minMaxMultiplier": 0,
                    "position": "right",
                    "axisAlpha": 0.5,
                    "axisColor": "#000000",
                    "gridAlpha": 0.0,
                    "markPeriodChange": false,
                    "minVerticalGap": 36,
                    "title": "Cumulative",
                    "titleBold": false,
                    "titleFontSize": 18,
                    "titleRotation": 90
                }
            ],
            "allLabels": [],
            "balloon": {},
            "legend": {
                "enabled": true,
                "align": "center",
                "color": "#000000",
                "spacing": 2,
                "fontSize": 12,
                "verticalGap": 2,
                "useMarkerColorForValues": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "bold": false,
                    "size": 20,
                    "text": "Central Region: LTE Additional Carrier"
                },
                {
                    "id": "Title-2",
                    "bold": false,
                    "text": "Forecast vs. Need By Date"
                }
            ],
            "dataProvider": [
                {
                    "date": "2017-12",
                    "column-1": 0,
                    "column-2": 562,
                    "column-3": 0,
                    "column-4": 0,
                    "column-5": 562,
                    "column-6": 0
                },
                {
                    "date": "2018-01",
                    "column-1": 122,
                    "column-2": 2998,
                    "column-3": 88,
                    "column-4": 122,
                    "column-5": 3560,
                    "column-6": 88
                },
                {
                    "date": "2018-02",
                    "column-1": 231,
                    "column-2": 2001,
                    "column-3": 0,
                    "column-4": 353,
                    "column-5": 5561,
                    "column-6": 0
                },
                {
                    "date": "2018-03",
                    "column-1": 541,
                    "column-2": 1993,
                    "column-3": 0,
                    "column-4": 894,
                    "column-5": 7554,
                    "column-6": 0
                },
                {
                    "date": "2018-04",
                    "column-1": 942,
                    "column-2": 486,
                    "column-3": 0,
                    "column-4": 1836,
                    "column-5": 8040,
                    "column-6": 0
                },
                {
                    "date": "2018-05",
                    "column-1": 1094,
                    "column-2": 109,
                    "column-3": 0,
                    "column-4": 2930,
                    "column-5": 8149,
                    "column-6": 0
                },
                {
                    "date": "2018-06",
                    "column-1": 1678,
                    "column-2": 675,
                    "column-3": 0,
                    "column-4": 4608,
                    "column-5": 8824,
                    "column-6": 0
                },
                {
                    "date": "2018-07",
                    "column-1": 1670,
                    "column-2": 1565,
                    "column-3": 0,
                    "column-4": 6278,
                    "column-5": 10389,
                    "column-6": 0
                },
                {
                    "date": "2018-08",
                    "column-1": 1526,
                    "column-2": 297,
                    "column-3": 0,
                    "column-4": 7804,
                    "column-5": 10686,
                    "column-6": 0
                },
                {
                    "date": "2018-09",
                    "column-1": 1662,
                    "column-2": 739,
                    "column-3": 0,
                    "column-4": 9466,
                    "column-5": 11425,
                    "column-6": 0
                },
                {
                    "date": "2018-10",
                    "column-1": 1833,
                    "column-2": 604,
                    "column-3": 0,
                    "column-4": 11299,
                    "column-5": 12029,
                    "column-6": 0
                },
                {
                    "date": "2018-11",
                    "column-1": 1479,
                    "column-2": 155,
                    "column-3": 0,
                    "column-4": 12778,
                    "column-5": 12184,
                    "column-6": 0
                },
                {
                    "date": "2018-12",
                    "column-1": 897,
                    "column-2": 1496,
                    "column-3": 0,
                    "column-4": 13675,
                    "column-5": 13680,
                    "column-6": 0
                }
            ]
        }
        );
    }
    var demo11 = function () {
        var gaugeChart = AmCharts.makeChart("centralpoeacgauge", {
            "type": "gauge",
            "hideCredits": true,
            "theme": "light",
            "balloon": { "fontSize": 14 },
            "axes": [{
                "axisAlpha": 0,
                "tickAlpha": 0,
                "labelsEnabled": false,
                "startValue": 0,
                "endValue": 100,
                "startAngle": 0,
                "endAngle": 270,
                "bands": [{
                    "color": "#eee",
                    "startValue": 0,
                    "endValue": 100,
                    "radius": "100%",
                    "innerRadius": "85%"
                }, {
                    "color": "#84b761",
                    "startValue": 0,
                    "endValue": 12.26,
                    "radius": "100%",
                    "innerRadius": "85%",
                    "balloonText": "12.26%"
                }, {
                    "color": "#eee",
                    "startValue": 0,
                    "endValue": 100,
                    "radius": "80%",
                    "innerRadius": "65%"
                }, {
                    "color": "#fdd400",
                    "startValue": 0,
                    "endValue": 3.58,
                    "radius": "80%",
                    "innerRadius": "65%",
                    "balloonText": "3.58%"
                }, {
                    "color": "#eee",
                    "startValue": 0,
                    "endValue": 100,
                    "radius": "60%",
                    "innerRadius": "45%"
                }, {
                    "color": "#cc4748",
                    "startValue": 0,
                    "endValue": 1.89,
                    "radius": "60%",
                    "innerRadius": "45%",
                    "balloonText": "1.89%"
                }, {
                    "color": "#eee",
                    "startValue": 0,
                    "endValue": 100,
                    "radius": "40%",
                    "innerRadius": "25%"
                }, {
                    "color": "#67b7dc",
                    "startValue": 0,
                    "endValue": 0.62,
                    "radius": "40%",
                    "innerRadius": "25%",
                    "balloonText": "0.62%"
                }]
            }],
            "allLabels": [{
                "text": "Site Acq Complete",
                "x": "49%",
                "y": "5%",
                "size": 12,
                "bold": true,
                "color": "#84b761",
                "align": "right"
            }, {
                "text": "Construction Started",
                "x": "49%",
                "y": "15%",
                "size": 12,
                "bold": true,
                "color": "#fdd400",
                "align": "right"
            }, {
                "text": "Tower Work Complete",
                "x": "49%",
                "y": "24%",
                "size": 12,
                "bold": true,
                "color": "#cc4748",
                "align": "right"
            }, {
                "text": "On Air",
                "x": "49%",
                "y": "33%",
                "size": 12,
                "bold": true,
                "color": "#67b7dc",
                "align": "right"
            }],
            "export": {
                "enabled": true
            }
        });
    }

    var demo12 = function () {
        var chart = AmCharts.makeChart("centralpoemileoutv2", {
            "type": "serial",
            "hideCredits": true,
            "theme": "light",
            "colors": [
                "#5b9bd5",
                "#ffa500",
                "#a9a9a9",
                "#98fb98",
                "#006400",
                "#90ee90",
                "#e8d685",
                "#e0ad63",
                "#d48652",
                "#d27362",
                "#495fba",
                "#8881cc"
            ],
            "legend": {
                "horizontalGap": 10,
                "align": "center",
                "position": "bottom",
                "useGraphSettings": true,
                "markerSize": 10,
                "spacing": 10,
                "fontSize": 16,
                "verticalGap": 2,
                "useMarkerColorForValues": true
            },
            "valueAxes": [{
                "axisAlpha": 0.5,
                "gridColor": "#000000",
                "gridAlpha": 0.1
            }],
            "guides": [],
            "graphs": [{
                "valueField": "forecast",
                "fillAlphas": 0.8,
                "lineAlpha": 0.3,
                "title": "Forecast",
                "type": "column",
                "color": "#000000"
            }, {
                "valueField": "sac",
                "fillAlphas": 0.8,
                "lineAlpha": 0.3,
                "title": "Site Acq Complete",
                "type": "column",
                "color": "#000000"
            }, {
                "valueField": "cs",
                "fillAlphas": 0.8,
                "lineAlpha": 0.3,
                "title": "Construction Started",
                "type": "column",
                "color": "#000000"
            }, {
                "valueField": "ttc",
                "fillAlphas": 0.8,
                "lineAlpha": 0.3,
                "title": "Tower Top Complete",
                "type": "column",
                "color": "#000000"
            }, {
                "valueField": "onair",
                "fillAlphas": 0.8,
                "lineAlpha": 0.3,
                "title": "On Air",
                "type": "column",
                "color": "#000000"
            }],
            "categoryField": "category",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0.5,
                "gridAlpha": 0,
                "position": "left",
                "fontSize": 15,
                "guides": [{
                    "category": "2018-Jan",
                    "toCategory": "2018-Dec",
                    "lineAlpha": 0.5,
                    "tickLength": 30,
                    "expand": true,
                    "label": "2018"
                }, {
                    "category": "2019-Jan",
                    "toCategory": "2019-Mar",
                    "lineAlpha": 0.5,
                    "tickLength": 30,
                    "expand": true,
                    "label": "2019"
                }],
                "labelFunction": function (label, item) {
                    return item.dataContext.month;
                }
            },
            "dataProvider": [{
                "category": "2018-Jan",
                "month": "Jan",
                "forecast": 106,
                "sac": 103,
                "cs": 104,
                "ttc": 103,
                "onair": 85
            }, {
                "category": "2018-Feb",
                "month": "Feb",
                "forecast": 195,
                "sac": 187,
                "cs": 123,
                "ttc": 78,
                "onair": 0
            }, {
                "category": "2018-Mar",
                "month": "Mar",
                "forecast": 510,
                "sac": 359,
                "cs": 107,
                "ttc": 31,
                "onair": 0
            }, {
                "category": "2018-Apr",
                "month": "Apr",
                "forecast": 823,
                "sac": 261,
                "cs": 37,
                "ttc": 10,
                "onair": 0
            }, {
                "category": "2018-May",
                "month": "May",
                "forecast": 1181,
                "sac": 247,
                "cs": 21,
                "ttc": 8,
                "onair": 0
            }, {
                "category": "2018-Jun",
                "month": "Jun",
                "forecast": 1767,
                "sac": 167,
                "cs": 35,
                "ttc": 15,
                "onair": 0
            }, {
                "category": "2018-Jul",
                "month": "Jul",
                "forecast": 1703,
                "sac": 149,
                "cs": 17,
                "ttc": 3,
                "onair": 0
            }, {
                "category": "2018-Aug",
                "month": "Aug",
                "forecast": 1624,
                "sac": 62,
                "cs": 7,
                "ttc": 0,
                "onair": 0
            }, {
                "category": "2018-Sep",
                "month": "Sep",
                "forecast": 2004,
                "sac": 70,
                "cs": 12,
                "ttc": 3,
                "onair": 0
            }, {
                "category": "2018-Oct",
                "month": "Oct",
                "forecast": 1710,
                "sac": 35,
                "cs": 5,
                "ttc": 1,
                "onair": 0
            }, {
                "category": "2018-Nov",
                "month": "Nov",
                "forecast": 1322,
                "sac": 18,
                "cs": 4,
                "ttc": 0,
                "onair": 0
            }, {
                "category": "2018-Dec",
                "month": "Dec",
                "forecast": 728,
                "sac": 20,
                "cs": 18,
                "ttc": 7,
                "onair": 0
            }, {
                "category": "2019-Jan",
                "month": "Jan",
                "forecast": 8,
                "sac": 0,
                "cs": 0,
                "ttc": 0,
                "onair": 0
            }, {
                "category": "2019-Feb",
                "month": "Feb",
                "forecast": 0,
                "sac": 0,
                "cs": 0,
                "ttc": 0,
                "onair": 0
            }, {
                "category": "2019-Mar",
                "month": "Mar",
                "forecast": 0,
                "sac": 0,
                "cs": 0,
                "ttc": 0,
                "onair": 0
            }]

        });
    }

    var demo13 = function () {
        var chart = AmCharts.makeChart("centralpoemileout", {
            "type": "serial",
            "hideCredits": true,
            "balloonDateFormat": "MMM YYYY",
            "categoryField": "date",
            "columnSpacing": 10,
            "dataDateFormat": "YYYY-MM",
            "autoMarginOffset": 5,
            "export": {
                "enabled": true
            },
            "marginRight": 10,
            "marginTop": 10,
            "plotAreaBorderAlpha": 0.5,
            "plotAreaFillColors": "#0000FF",
            "colors": [
                "#5b9bd5",
                "#ffa500",
                "#a9a9a9",
                "#98fb98",
                "#006400",
                "#90ee90",
                "#e8d685",
                "#e0ad63",
                "#d48652",
                "#d27362",
                "#495fba",
                "#8881cc"
            ],
            "backgroundColor": "#FFFFFF",
            "color": "#000000",
            "fontSize": 13,
            "theme": "dark",
            "categoryAxis": {
                "minPeriod": "MM",
                "parseDates": true,
                "markPeriodChange": false
            },
            "chartCursor": {
                "enabled": true,
                "categoryBalloonDateFormat": "MMM",
                "cursorColor": "#258cbb"
            },
            "trendLines": [],
            "graphs": [
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-1",
                    "title": "Forecast",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-1"
                },
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-2",
                    "title": "SAQ Complete",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-2"
                },
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-3",
                    "title": "Construction Started",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-3"
                },
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-4",
                    "title": "Tower Top Complete",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-4"
                },
                {
                    "columnWidth": 0.9,
                    "cornerRadiusTop": 2,
                    "dateFormat": "MMM YYYY",
                    "fillAlphas": 1.0,
                    "id": "AmGraph-5",
                    "title": "On Air",
                    "type": "column",
                    "valueAxis": "ValueAxis-1",
                    "valueField": "column-5"
                }
            ],
            "guides": [],
            "valueAxes": [
                {
                    "id": "ValueAxis-1",
                    "minMaxMultiplier": 0,
                    "axisAlpha": 0.5,
                    "axisColor": "#000000",
                    "markPeriodChange": false,
                    "title": ""
                }
            ],
            "allLabels": [],
            "balloon": {},
            "legend": {
                "enabled": true,
                "align": "center",
                "color": "#000000",
                "spacing": 2,
                "fontSize": 12,
                "verticalGap": 2,
                "useMarkerColorForValues": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "bold": false,
                    "size": 20,
                    "text": "Central Region: LTE Additional Carrier"
                },
                {
                    "id": "Title-2",
                    "bold": false,
                    "text": "Progress Timeline"
                }
            ],
            "dataProvider": [
                {
                    "date": "2018-01",
                    "column-1": 106,
                    "column-2": 103,
                    "column-3": 104,
                    "column-4": 103,
                    "column-5": 85
                },
                {
                    "date": "2018-02",
                    "column-1": 195,
                    "column-2": 187,
                    "column-3": 123,
                    "column-4": 78,
                    "column-5": 0
                },
                {
                    "date": "2018-03",
                    "column-1": 510,
                    "column-2": 359,
                    "column-3": 107,
                    "column-4": 31,
                    "column-5": 0
                },
                {
                    "date": "2018-04",
                    "column-1": 823,
                    "column-2": 261,
                    "column-3": 37,
                    "column-4": 10,
                    "column-5": 0
                },
                {
                    "date": "2018-05",
                    "column-1": 1181,
                    "column-2": 247,
                    "column-3": 21,
                    "column-4": 8,
                    "column-5": 0
                },
                {
                    "date": "2018-06",
                    "column-1": 1767,
                    "column-2": 167,
                    "column-3": 35,
                    "column-4": 15,
                    "column-5": 0
                },
                {
                    "date": "2018-07",
                    "column-1": 1703,
                    "column-2": 149,
                    "column-3": 17,
                    "column-4": 3,
                    "column-5": 0
                },
                {
                    "date": "2018-08",
                    "column-1": 1624,
                    "column-2": 62,
                    "column-3": 7,
                    "column-4": 0,
                    "column-5": 0
                },
                {
                    "date": "2018-09",
                    "column-1": 2004,
                    "column-2": 70,
                    "column-3": 12,
                    "column-4": 3,
                    "column-5": 0
                },
                {
                    "date": "2018-10",
                    "column-1": 1710,
                    "column-2": 35,
                    "column-3": 5,
                    "column-4": 1,
                    "column-5": 0
                },
                {
                    "date": "2018-11",
                    "column-1": 1322,
                    "column-2": 18,
                    "column-3": 4,
                    "column-4": 0,
                    "column-5": 0
                },
                {
                    "date": "2018-12",
                    "column-1": 728,
                    "column-2": 20,
                    "column-3": 18,
                    "column-4": 7,
                    "column-5": 0
                },
                {
                    "date": "2019-1",
                    "column-1": 8,
                    "column-2": 0,
                    "column-3": 0,
                    "column-4": 0,
                    "column-5": 0
                }
            ]
        }
        );
    }

    
        var chartData1 = [];
        var chartData2 = [];
        var chartData3 = [];
        var chartData4 = [];

        generateChartData();

        function generateChartData() {
            var firstDate = new Date();
            firstDate.setDate(firstDate.getDate() - 500);
            firstDate.setHours(0, 0, 0, 0);

            var a1 = 1500;
            var b1 = 1500;
            var a2 = 1700;
            var b2 = 1700;
            var a3 = 1600;
            var b3 = 1600;
            var a4 = 1400;
            var b4 = 1400;

            for (var i = 0; i < 500; i++) {
                var newDate = new Date(firstDate);
                newDate.setDate(newDate.getDate() + i);

                a1 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
                b1 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);

                a2 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
                b2 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);

                a3 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
                b3 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);

                a4 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);
                b4 += Math.round((Math.random() < 0.5 ? 1 : -1) * Math.random() * 10);

                chartData1.push({
                    "date": newDate,
                    "value": a1,
                    "volume": b1 + 1500
                });
                chartData2.push({
                    "date": newDate,
                    "value": a2,
                    "volume": b2 + 1500
                });
                chartData3.push({
                    "date": newDate,
                    "value": a3,
                    "volume": b3 + 1500
                });
                chartData4.push({
                    "date": newDate,
                    "value": a4,
                    "volume": b4 + 1500
                });
            }
        }
        
        return {
            // public functions
            init: function () {
                demo1();
                demo2();
                demo3();
                demo4();
                demo5();
                demo6();
                demo7();
                demo8();
                demo9();
                demo10();
                demo11();
                demo12();
                demo13();
                demo14();
            }
        };
    }();

jQuery(document).ready(function() {
    amChartsChartsDemo.init();
});