<%@ Page Title="FirstNet PIM Mitigation" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fnet_pim_module.aspx.cs" Inherits="government_fnet_pim_module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>


    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">
                FirstNet Module
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/Default.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">FirstNet
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">FirstNet Reporting
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">Central Region
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">

            <%-- SELECTORS --%>
            <br />
            <%--<div class="row" id="selectorrow" style="width: 99.5%; height: 3%; margin: 0.5%;">

                <asp:Label ID="labelMarket" runat="server" Text="Market: &nbsp;&nbsp;" Visible="true" font-size=12 ForeColor="Black"></asp:Label>
                <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                    <asp:ListItem Text=""></asp:ListItem>
                </asp:DropDownList>

            </div>--%>

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">RAN Central Region - FirstNet 2018 POE
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="m-section">
                    <div class="row" id="table1row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table1col" style="height: 100%;">
                            <div id="dropdown_submarket">
                                <select>
                                    <option value="central region view">Central Region View</option>
                                    <option value="0_2">Arkansas/Oklahoma</option>
                                    <option value="3_4">Greater Midwest</option>
                                    <option value="5_7">Illinois/Wisconsin</option>
                                    <option value="12_15">Michigan/Indiana</option>
                                    <option value="12_15">North Texas</option>
                                    <option value="16_20">Northern Plains</option>
                                    <option value="21_23">South Texas</option>                                    
                                </select>
                            </div>
                            <div id="FNPIMMITIGATION" style="visibility: visible; overflow: hidden;">Loading</div>
                            <div id="FNPIMMITIGATION_SUBMARKET" style="visibility: visible; overflow: hidden;">Loading</div>
                        </div>
                    </div>
                    <br/>
                    <div class="row" id="donutrow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut1col" style="height: 100%; width: 100%;">
                            <div id="donut_arok" style="visibility: visible;"></div>
                            <div id="donut_submarket1" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut2col" style="height: 100%;">
                            <div id="donut_gmr" style="visibility: visible;"></div>
                            <div id="donut_submarket2" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut3col" style="height: 100%;">
                            <div id="donut_ilwi" style="visibility: visible;"></div>
                            <div id="donut_submarket3" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut4col" style="height: 100%;">
                            <div id="donut_miin" style="visibility: visible;"></div>
                            <div id="donut_submarket4" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut5col" style="height: 100%;">
                            <div id="donut_ntx" style="visibility: visible;"></div>
                            <div id="donut_submarket5" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut6col" style="height: 100%;">
                            <div id="donut_np" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <div class="row" id="donutrow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut7col" style="height: 100%;">
                            <div id="donut_stx" style="visibility: visible;"></div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>            
            
        </div>

     <script>
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                async: true,
                url: "fnet_pim_module.aspx/GetFNPIMMITIGATION",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadFNPIMMITIGATION(data);
                    loadDonut1(data);
                },
                error: function (data) {
                }
            });

            showRegionalElements();
        
            $("#dropdown_submarket").on("change", function () {
                var selected_submarket = $('#dropdown_submarket').find(":selected").text();
                var submarket_id = $("#dropdown_submarket option:selected").val();

                if (submarket_id == 'central region view') {
                    showRegionalElements();
                    return;
                }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "fnet_pim_module.aspx/GetFNPIMMITIGATION_SUBMARKET",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        hideRegionalElements();
                        loadFNPIMMITIGATION_SUBMARKET(data, selected_submarket, submarket_id);
                        loadDonut_submarket(data, selected_submarket, submarket_id);
                    },
                    error: function (data) {
                    }
                });
            });

            function hideRegionalElements() {
                $("#FNPIMMITIGATION").hide();
                $("#FNPIMMITIGATION_SUBMARKET").show();
                $("#donut_arok").hide();
                $("#donut_gmr").hide();
                $("#donut_ilwi").hide();
                $("#donut_miin").hide();
                $("#donut_ntx").hide();
                $("#donut_np").hide();
                $("#donut_stx").hide();
                $("#donut_submarket1").show();
                $("#donut_submarket2").show();
                $("#donut_submarket3").show();
                $("#donut_submarket4").show();
                $("#donut_submarket5").show();
            }
            function showRegionalElements() {
                $("#FNPIMMITIGATION").show();
                $("#FNPIMMITIGATION_SUBMARKET").hide();
                $("#donut_arok").show();
                $("#donut_gmr").show();
                $("#donut_ilwi").show();
                $("#donut_miin").show();
                $("#donut_ntx").show();
                $("#donut_np").show();
                $("#donut_stx").show();
                $("#donut_submarket1").hide();
                $("#donut_submarket2").hide();
                $("#donut_submarket3").hide();
                $("#donut_submarket4").hide();
                $("#donut_submarket5").hide();
            }



        });
        /* FN PIM MITIGATION Chart */

        var chart2;

        function loadFNPIMMITIGATION(data) {
            FN_Data = JSON.parse(data.d);
            var FN_series_values = [];
            var keys = Object.keys(FN_Data[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < FN_Data.length; j++) {
                    if (k == 0) {
                        a.push(FN_Data[j][0]);
                    } else {
                        a.push(FN_Data[j][keys[k]]);
                    }
                }
                FN_series_values.push(a);
            }

            createFNColchart(FN_series_values[0], 'FNPIMMITIGATION', 'FirstNet PIM Mitigation', 'Central Region');


            var j = 2
            chart2.addSeries({
                name: 'First Net POE2018',
                id: 'FNPOE2018',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'POE2018'
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'CI035 - Integration Complete',
                id: 'CI035',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'CI035'
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'CI032 - Actualized',
                id: 'CI032',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'CI032'
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Pending Triage',
                id: 'PENDINGTRIAGE',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'PENDINGTRIAGE'
            }, false);
            var j = 6
            chart2.addSeries({
                name: '3E Triage Complete',
                id: 'EVENT3E',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '3e+6a'
            }, false);
            var j = 7
            chart2.addSeries({
                name: '6A PIM Hunting Complete',
                id: 'EVENT6A',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '3e+6a'
            }, false);
            var j = 8
            chart2.addSeries({
                name: '9A PIM Mitigation Exited after Mitigation Steps',
                id: 'EVENT9A',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '2e+9a'
            }, false);
            var j = 9
            chart2.addSeries({
                name: '2E PIM Mitigtion Exited at Full Power with no Mitigation Required',
                id: 'EVENT2E',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '2e+9a'
            }, false);

            chart2.redraw();
        }

        function createFNColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#00b3b3', '#87CEEB', '#A9A9A9', '#FF9655', '#FFF263', '#2D862D', '#23f6a8']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '600',
                },
                exporting: {
                    enabled: true
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
                title: {
                    text: chart_title,
                    style: {
                        fontSize: '18px',
                        fontWeight: 'bold'
                    }
                },
                subtitle: {
                    text: chart_subtitle,
                    style: {
                        fontSize: '16px',
                        fontWeight: 'bold'
                    }
                },
                xAxis: {
                    categories: ['ARKANSAS/OKLAHOMA','GREATER MIDWEST',  'ILLINOIS/WISCONSIN', 'MICHIGAN/INDIANA', 'NORTH TEXAS', 'NORTHERN PLAINS', 'SOUTH TEXAS'],
                    title: {
                        enabled: false
                    },
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
                        },
                        dataLabels: {
                            enabled: true
                        }
                    },
                    column: {
                        stacking: 'normal'
                    }
                },
                yAxis: [{//Primary yAxis
                    title: {
                        text: 'Count',
                        style: {
                            fontSize: "16px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "16px"
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        /* FN PIM MITIGATION Chart Data */

         /* Pie Chart Data */

        function loadDonut1(data) {
            var row = JSON.parse(data.d); //parse your data
            var str = row[0]["MARKET"];
            var arok_market = str.replace("/", "/ "); //put the data into variables to pass to a chart building function. row[0] = first row
            var arok_fnpoe2018 = row[0]["FNPOE2018"];
            var arok_ci032 = row[0]["CI032"];
            var arok_pending = row[0]["PENDINGTRIAGE"];
            var arok_3e = row[0]["EVENT3E"];
            var arok_6a = row[0]["EVENT6A"];
            var arok_9a = row[0]["EVENT9A"];
            var arok_2e = row[0]["EVENT2E"];

            var gmr_market = row[1]["MARKET"];
            var gmr_fnpoe2018 = row[1]["FNPOE2018"];
            var gmr_ci032 = row[1]["CI032"];
            var gmr_pending = row[1]["PENDINGTRIAGE"];
            var gmr_3e = row[1]["EVENT3E"];
            var gmr_6a = row[1]["EVENT6A"];
            var gmr_9a = row[1]["EVENT9A"];
            var gmr_2e = row[1]["EVENT2E"];

            var str = row[2]["MARKET"];
            var ilwi_market = str.replace("/", "/ ");
            var ilwi_fnpoe2018 = row[2]["FNPOE2018"];
            var ilwi_ci032 = row[2]["CI032"];
            var ilwi_pending = row[2]["PENDINGTRIAGE"];
            var ilwi_3e = row[2]["EVENT3E"];
            var ilwi_6a = row[2]["EVENT6A"];
            var ilwi_9a = row[2]["EVENT9A"];
            var ilwi_2e = row[2]["EVENT2E"];

            var str = row[3]["MARKET"];
            var miin_market = str.replace("/", "/ ");
            var miin_fnpoe2018 = row[3]["FNPOE2018"];
            var miin_ci032 = row[3]["CI032"];
            var miin_pending = row[3]["PENDINGTRIAGE"];
            var miin_3e = row[3]["EVENT3E"];
            var miin_6a = row[3]["EVENT6A"];
            var miin_9a = row[3]["EVENT9A"];
            var miin_2e = row[3]["EVENT2E"];

            var ntx_market = row[4]["MARKET"];
            var ntx_fnpoe2018 = row[4]["FNPOE2018"];
            var ntx_ci032 = row[4]["CI032"];
            var ntx_pending = row[4]["PENDINGTRIAGE"];
            var ntx_3e = row[4]["EVENT3E"];
            var ntx_6a = row[4]["EVENT6A"];
            var ntx_9a = row[4]["EVENT9A"];
            var ntx_2e = row[4]["EVENT2E"];


            var np_market = row[5]["MARKET"];
            var np_fnpoe2018 = row[5]["FNPOE2018"];
            var np_ci032 = row[5]["CI032"];
            var np_pending = row[5]["PENDINGTRIAGE"];
            var np_3e = row[5]["EVENT3E"];
            var np_6a = row[5]["EVENT6A"];
            var np_9a = row[5]["EVENT9A"];
            var np_2e = row[5]["EVENT2E"];

            var stx_market = row[6]["MARKET"];
            var stx_fnpoe2018 = row[6]["FNPOE2018"];
            var stx_ci032 = row[6]["CI032"];
            var stx_pending = row[6]["PENDINGTRIAGE"];
            var stx_3e = row[6]["EVENT3E"];
            var stx_6a = row[6]["EVENT6A"];
            var stx_9a = row[6]["EVENT9A"];
            var stx_2e = row[6]["EVENT2E"];

            donutcharting102('donut_arok', arok_market, arok_fnpoe2018, arok_ci032, arok_pending, arok_3e, arok_6a, arok_9a, arok_2e); //chart building function
            donutcharting102('donut_gmr', gmr_market, gmr_fnpoe2018, gmr_ci032, gmr_pending, gmr_3e, gmr_6a, gmr_9a, gmr_2e);
            donutcharting102('donut_ilwi', ilwi_market, ilwi_fnpoe2018, ilwi_ci032, ilwi_pending, ilwi_3e, ilwi_6a, ilwi_9a, ilwi_2e);
            donutcharting102('donut_miin', miin_market, miin_fnpoe2018, miin_ci032, miin_pending, miin_3e, miin_6a, miin_9a, miin_2e);
            donutcharting102('donut_ntx', ntx_market, ntx_fnpoe2018, ntx_ci032, ntx_pending, ntx_3e, ntx_6a, ntx_9a, ntx_2e);
            donutcharting102('donut_np', np_market, np_fnpoe2018, np_ci032, np_pending, np_3e, np_6a, np_9a, np_2e);
            donutcharting102('donut_stx', stx_market, stx_fnpoe2018, stx_ci032, stx_pending, stx_3e, stx_6a, stx_9a, stx_2e);
        }

         /* Pie Chart Data */
         /* DONUT CHART CREATER */
        function donutcharting102(container, market, fnpoe2018, ci032, pending, event3e, event6a, event9a, event2e) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {

                subtitle = '<p style="font-size:1.2vw; font-weight: bold; color: #1E90FF;">' + ci032 + '<br><p style="font-size:0.9vw; color: #1E90FF;"> TOTAL CI032' + '</p>'; //create the chart subtitle variable

                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '300'

                    },
                    title: {
                        text: market,
                        style: {
                            "color": "#333333",
                            "fontSize": "16px"
                        }
                    },
                    subtitle: { //chart subtitle assignment and location in the chart area
                        text: subtitle,
                        align: 'center',
                        verticalAlign: 'middle',
                        y: 40
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + market + '</b></br><p style="font-size:11px;">' + content;
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF'

                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: true,
                                format: '{point.y:.0f}',
                                distance: -25,
                                filter: {
                                    property: 'percentage',
                                    operator: '>',
                                    value: 4
                                }
                            },
                            startAngle: -90,
                            endAngle: 90
                        }
                    },
                    credits: { //gets rid of the highcharts.com link
                        enabled: false
                    },
                    series: [{ //assign your data to the series
                        name: 'title',
                        colorByPoint: true,
                        size: '100%',
                        innerSize: '50%',
                        data:[ 
                            { name: 'Event2E', y: event2e, color: '#23f6a8' },
                            { name: 'Event9A', y: event9a, color: '#2d862d' },
                            { name: 'Event6A', y: event6a, color: '#fff263' },
                            { name: 'Event3E', y: event3e, color: '#ff9655' },
                            { name: 'Pending Triage', y: pending, color: '#e6e6e6'},
                        ]
                    }]
                });
            });
         }

         /* FN_PIM_MITIGATION_SUBMARKET CHART GENERATION */
        function loadFNPIMMITIGATION_SUBMARKET(data, selected_submarket, submarket_id) {
            FN_Data = JSON.parse(data.d);
            var FN_series_values = [];
            var keys = Object.keys(FN_Data[0]);

            rows = submarket_id.split('_');
            row_start = rows[0];
            row_end = rows[1];

            // subtract 4 from MIIN for some reason won't load if the number is set before
            if (selected_submarket == 'Michigan/Indiana') {
                row_start = row_start - 4;
                row_end = row_end - 4;
            }

            if (selected_submarket == 'Arkansas/Oklahoma') {
                category_values = ['Arkansas', 'Oklahoma City', 'Tulsa OK'];
            } else if (selected_submarket == 'Greater Midwest') {
                category_values = ['Kansas City', 'St. Louis'];
            } else if (selected_submarket == 'Illinois/Wisconsin') {
                category_values = ['Central Illinois', 'Chicago', 'Wisconsin'];
            } else if (selected_submarket == 'Michigan/Indiana') {
                category_values = ['Detroit', 'Indianapolis', 'Northern MI', 'Outstate MI'];
            } else if (selected_submarket == 'North Texas') {
                category_values = ['Central Texas', 'Dallas Ft. Worth', 'El Paso', 'West Texas'];
            } else if (selected_submarket == 'Northern Plains') {
                category_values = ['Iowa', 'Minnesota', 'Nebraska', 'North Dakota', 'South Dakota'];
            } else if (selected_submarket == 'South Texas') {
                category_values = ['Austin', 'Houston', 'San Antonio'];
            }


            // Parse returned json string into x axis categories and y series values
            //console.log(FN_Data[8]["FNPOE2018"]);

            for (var k = 0; k < keys.length; k++) { 
                var a = [];
                for (var j = row_start; j <= row_end; j++) {
                    if (k == 0) {
                        a.push(FN_Data[j][0]);
                    } else {
                        a.push(FN_Data[j][keys[k]]);        // keys[k] is each column
                    }
                }
                FN_series_values.push(a);
            }

            createFNColchart2(FN_series_values[0], 'FNPIMMITIGATION_SUBMARKET', 'FirstNet PIM Mitigation', 'Central Region - ' + selected_submarket);


            var j = 3
            chart2.addSeries({
                name: 'First Net POE2018',
                id: 'FNPOE2018',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'POE2018'
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'CI035 - Integration Complete',
                id: 'CI035',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'CI035'
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'CI032 - Actualized',
                id: 'CI032',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'CI032'
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Pending Triage',
                id: 'PENDINGTRIAGE',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: 'PENDINGTRIAGE'
            }, false);
            var j = 7
            chart2.addSeries({
                name: '3E Triage Complete',
                id: 'EVENT3E',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '3e+6a'
            }, false);
            var j = 8
            chart2.addSeries({
                name: '6A PIM Hunting Complete',
                id: 'EVENT6A',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '3e+6a'
            }, false);
            var j = 9
            chart2.addSeries({
                name: '9A PIM Mitigation Exited after Mitigation Steps',
                id: 'EVENT9A',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '2e+9a'
            }, false);
            var j = 10
            chart2.addSeries({
                name: '2E PIM Mitigtion Exited at Full Power with no Mitigation Required',
                id: 'EVENT2E',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true,
                stack: '2e+9a'
            }, false);

            chart2.redraw();
        }

        function createFNColchart2(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#00b3b3', '#87CEEB', '#A9A9A9', '#FF9655', '#FFF263', '#2D862D', '#23f6a8']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '600',
                },
                exporting: {
                    enabled: true
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
                title: {
                    text: chart_title,
                    style: {
                        fontSize: '18px',
                        fontWeight: 'bold'
                    }
                },
                subtitle: {
                    text: chart_subtitle,
                    style: {
                        fontSize: '16px',
                        fontWeight: 'bold'
                    }
                },
                xAxis: {
                    lineWidth: 1,
                    ticklength: 3,
                    categories: category_values,
                    title: {
                        enabled: false
                    },
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
                        },
                        dataLabels: {
                            enabled: true
                        }
                    },
                    column: {
                        stacking: 'normal'
                    }
                },
                yAxis: [{//Primary yAxis
                    title: {
                        text: 'Count',
                        style: {
                            fontSize: "16px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "16px"
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }


         /* FN_PIM_MITIGATION_SUBMARKET CHART END */

 /* FN PIM MITIGATION Chart Data */

         /* Pie Chart Data */

        function loadDonut_submarket(data, selected_submarket, submarket_id) {
            var row = JSON.parse(data.d); //parse your data

            if (selected_submarket == 'Arkansas/Oklahoma') {

                var sub1_name = row[0]["SUBMARKET"];
                var sub1_fnpoe2018 = row[0]["FNPOE2018"];
                var sub1_ci032 = row[0]["CI032"];
                var sub1_pending = row[0]["PENDINGTRIAGE"];
                var sub1_3e = row[0]["EVENT3E"];
                var sub1_6a = row[0]["EVENT6A"];
                var sub1_9a = row[0]["EVENT9A"];
                var sub1_2e = row[0]["EVENT2E"];

                var sub2_name = row[1]["SUBMARKET"];
                var sub2_fnpoe2018 = row[1]["FNPOE2018"];
                var sub2_ci032 = row[1]["CI032"];
                var sub2_pending = row[1]["PENDINGTRIAGE"];
                var sub2_3e = row[1]["EVENT3E"];
                var sub2_6a = row[1]["EVENT6A"];
                var sub2_9a = row[1]["EVENT9A"];
                var sub2_2e = row[1]["EVENT2E"];

                var sub3_name = row[2]["SUBMARKET"];
                var sub3_fnpoe2018 = row[2]["FNPOE2018"];
                var sub3_ci032 = row[2]["CI032"];
                var sub3_pending = row[2]["PENDINGTRIAGE"];
                var sub3_3e = row[2]["EVENT3E"];
                var sub3_6a = row[2]["EVENT6A"];
                var sub3_9a = row[2]["EVENT9A"];
                var sub3_2e = row[2]["EVENT2E"];

                
                donutcharting_submarket('donut_submarket2', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket3', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                donutcharting_submarket('donut_submarket4', sub3_name, sub3_fnpoe2018, sub3_ci032, sub3_pending, sub3_3e, sub3_6a, sub3_9a, sub3_2e);
                $("#donut_submarket1").hide();
                $("#donut_submarket5").hide();

            } else if (selected_submarket == 'Greater Midwest') {
                var sub1_name = row[3]["SUBMARKET"];
                var sub1_fnpoe2018 = row[3]["FNPOE2018"];
                var sub1_ci032 = row[3]["CI032"];
                var sub1_pending = row[3]["PENDINGTRIAGE"];
                var sub1_3e = row[3]["EVENT3E"];
                var sub1_6a = row[3]["EVENT6A"];
                var sub1_9a = row[3]["EVENT9A"];
                var sub1_2e = row[3]["EVENT2E"];

                var sub2_name = row[4]["SUBMARKET"];
                var sub2_fnpoe2018 = row[4]["FNPOE2018"];
                var sub2_ci032 = row[4]["CI032"];
                var sub2_pending = row[4]["PENDINGTRIAGE"];
                var sub2_3e = row[4]["EVENT3E"];
                var sub2_6a = row[4]["EVENT6A"];
                var sub2_9a = row[4]["EVENT9A"];
                var sub2_2e = row[4]["EVENT2E"];

                
                donutcharting_submarket('donut_submarket3', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket4', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                $("#donut_submarket1").hide();
                $("#donut_submarket2").hide();
                $("#donut_submarket5").hide();

            } else if (selected_submarket == 'Illinois/Wisconsin') {

                var sub1_name = row[5]["SUBMARKET"];
                var sub1_fnpoe2018 = row[5]["FNPOE2018"];
                var sub1_ci032 = row[5]["CI032"];
                var sub1_pending = row[5]["PENDINGTRIAGE"];
                var sub1_3e = row[5]["EVENT3E"];
                var sub1_6a = row[5]["EVENT6A"];
                var sub1_9a = row[5]["EVENT9A"];
                var sub1_2e = row[5]["EVENT2E"];

                var sub2_name = row[6]["SUBMARKET"];
                var sub2_fnpoe2018 = row[6]["FNPOE2018"];
                var sub2_ci032 = row[6]["CI032"];
                var sub2_pending = row[6]["PENDINGTRIAGE"];
                var sub2_3e = row[6]["EVENT3E"];
                var sub2_6a = row[6]["EVENT6A"];
                var sub2_9a = row[6]["EVENT9A"];
                var sub2_2e = row[6]["EVENT2E"];

                var sub3_name = row[7]["SUBMARKET"];
                var sub3_fnpoe2018 = row[7]["FNPOE2018"];
                var sub3_ci032 = row[7]["CI032"];
                var sub3_pending = row[7]["PENDINGTRIAGE"];
                var sub3_3e = row[7]["EVENT3E"];
                var sub3_6a = row[7]["EVENT6A"];
                var sub3_9a = row[7]["EVENT9A"];
                var sub3_2e = row[7]["EVENT2E"];

                
                donutcharting_submarket('donut_submarket2', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket3', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                donutcharting_submarket('donut_submarket4', sub3_name, sub3_fnpoe2018, sub3_ci032, sub3_pending, sub3_3e, sub3_6a, sub3_9a, sub3_2e);
                $("#donut_submarket1").hide();
                $("#donut_submarket5").hide();

            } else if (selected_submarket == 'Michigan/Indiana') {
                var sub1_name = row[8]["SUBMARKET"];
                var sub1_fnpoe2018 = row[8]["FNPOE2018"];
                var sub1_ci032 = row[8]["CI032"];
                var sub1_pending = row[8]["PENDINGTRIAGE"];
                var sub1_3e = row[8]["EVENT3E"];
                var sub1_6a = row[8]["EVENT6A"];
                var sub1_9a = row[8]["EVENT9A"];
                var sub1_2e = row[8]["EVENT2E"];

                var sub2_name = row[9]["SUBMARKET"];
                var sub2_fnpoe2018 = row[9]["FNPOE2018"];
                var sub2_ci032 = row[9]["CI032"];
                var sub2_pending = row[9]["PENDINGTRIAGE"];
                var sub2_3e = row[9]["EVENT3E"];
                var sub2_6a = row[9]["EVENT6A"];
                var sub2_9a = row[9]["EVENT9A"];
                var sub2_2e = row[9]["EVENT2E"];

                var sub3_name = row[10]["SUBMARKET"];
                var sub3_fnpoe2018 = row[10]["FNPOE2018"];
                var sub3_ci032 = row[10]["CI032"];
                var sub3_pending = row[10]["PENDINGTRIAGE"];
                var sub3_3e = row[10]["EVENT3E"];
                var sub3_6a = row[10]["EVENT6A"];
                var sub3_9a = row[10]["EVENT9A"];
                var sub3_2e = row[10]["EVENT2E"];

                var sub4_name = row[11]["SUBMARKET"];
                var sub4_fnpoe2018 = row[11]["FNPOE2018"];
                var sub4_ci032 = row[11]["CI032"];
                var sub4_pending = row[11]["PENDINGTRIAGE"];
                var sub4_3e = row[11]["EVENT3E"];
                var sub4_6a = row[11]["EVENT6A"];
                var sub4_9a = row[11]["EVENT9A"];
                var sub4_2e = row[11]["EVENT2E"];

                donutcharting_submarket('donut_submarket2', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket3', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                donutcharting_submarket('donut_submarket4', sub3_name, sub3_fnpoe2018, sub3_ci032, sub3_pending, sub3_3e, sub3_6a, sub3_9a, sub3_2e);
                donutcharting_submarket('donut_submarket5', sub4_name, sub4_fnpoe2018, sub4_ci032, sub4_pending, sub4_3e, sub4_6a, sub4_9a, sub4_2e);
                $("#donut_submarket1").hide();

            } else if (selected_submarket == 'North Texas') {

                var sub1_name = row[12]["SUBMARKET"];
                var sub1_fnpoe2018 = row[12]["FNPOE2018"];
                var sub1_ci032 = row[12]["CI032"];
                var sub1_pending = row[12]["PENDINGTRIAGE"];
                var sub1_3e = row[12]["EVENT3E"];
                var sub1_6a = row[12]["EVENT6A"];
                var sub1_9a = row[12]["EVENT9A"];
                var sub1_2e = row[12]["EVENT2E"];

                var sub2_name = row[13]["SUBMARKET"];
                var sub2_fnpoe2018 = row[13]["FNPOE2018"];
                var sub2_ci032 = row[13]["CI032"];
                var sub2_pending = row[13]["PENDINGTRIAGE"];
                var sub2_3e = row[13]["EVENT3E"];
                var sub2_6a = row[13]["EVENT6A"];
                var sub2_9a = row[13]["EVENT9A"];
                var sub2_2e = row[13]["EVENT2E"];

                var sub3_name = row[14]["SUBMARKET"];
                var sub3_fnpoe2018 = row[14]["FNPOE2018"];
                var sub3_ci032 = row[14]["CI032"];
                var sub3_pending = row[10]["PENDINGTRIAGE"];
                var sub3_3e = row[14]["EVENT3E"];
                var sub3_6a = row[14]["EVENT6A"];
                var sub3_9a = row[14]["EVENT9A"];
                var sub3_2e = row[14]["EVENT2E"];

                var sub4_name = row[15]["SUBMARKET"];
                var sub4_fnpoe2018 = row[15]["FNPOE2018"];
                var sub4_ci032 = row[15]["CI032"];
                var sub4_pending = row[15]["PENDINGTRIAGE"];
                var sub4_3e = row[15]["EVENT3E"];
                var sub4_6a = row[15]["EVENT6A"];
                var sub4_9a = row[15]["EVENT9A"];
                var sub4_2e = row[15]["EVENT2E"];

                donutcharting_submarket('donut_submarket2', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket3', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                donutcharting_submarket('donut_submarket4', sub3_name, sub3_fnpoe2018, sub3_ci032, sub3_pending, sub3_3e, sub3_6a, sub3_9a, sub3_2e);
                donutcharting_submarket('donut_submarket5', sub4_name, sub4_fnpoe2018, sub4_ci032, sub4_pending, sub4_3e, sub4_6a, sub4_9a, sub4_2e);
                $("#donut_submarket1").hide();
            } else if (selected_submarket == 'Northern Plains') {

                var sub1_name = row[16]["SUBMARKET"];
                var sub1_fnpoe2018 = row[16]["FNPOE2018"];
                var sub1_ci032 = row[16]["CI032"];
                var sub1_pending = row[16]["PENDINGTRIAGE"];
                var sub1_3e = row[16]["EVENT3E"];
                var sub1_6a = row[16]["EVENT6A"];
                var sub1_9a = row[16]["EVENT9A"];
                var sub1_2e = row[16]["EVENT2E"];

                var sub2_name = row[17]["SUBMARKET"];
                var sub2_fnpoe2018 = row[17]["FNPOE2018"];
                var sub2_ci032 = row[17]["CI032"];
                var sub2_pending = row[17]["PENDINGTRIAGE"];
                var sub2_3e = row[17]["EVENT3E"];
                var sub2_6a = row[17]["EVENT6A"];
                var sub2_9a = row[17]["EVENT9A"];
                var sub2_2e = row[17]["EVENT2E"];

                var sub3_name = row[18]["SUBMARKET"];
                var sub3_fnpoe2018 = row[18]["FNPOE2018"];
                var sub3_ci032 = row[18]["CI032"];
                var sub3_pending = row[18]["PENDINGTRIAGE"];
                var sub3_3e = row[18]["EVENT3E"];
                var sub3_6a = row[18]["EVENT6A"];
                var sub3_9a = row[18]["EVENT9A"];
                var sub3_2e = row[18]["EVENT2E"];

                var sub4_name = row[19]["SUBMARKET"];
                var sub4_fnpoe2018 = row[19]["FNPOE2018"];
                var sub4_ci032 = row[19]["CI032"];
                var sub4_pending = row[19]["PENDINGTRIAGE"];
                var sub4_3e = row[19]["EVENT3E"];
                var sub4_6a = row[19]["EVENT6A"];
                var sub4_9a = row[19]["EVENT9A"];
                var sub4_2e = row[19]["EVENT2E"];

                var sub5_name = row[20]["SUBMARKET"];
                var sub5_fnpoe2018 = row[20]["FNPOE2018"];
                var sub5_ci032 = row[20]["CI032"];
                var sub5_pending = row[20]["PENDINGTRIAGE"];
                var sub5_3e = row[20]["EVENT3E"];
                var sub5_6a = row[20]["EVENT6A"];
                var sub5_9a = row[20]["EVENT9A"];
                var sub5_2e = row[20]["EVENT2E"];

                donutcharting_submarket('donut_submarket1', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket2', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                donutcharting_submarket('donut_submarket3', sub3_name, sub3_fnpoe2018, sub3_ci032, sub3_pending, sub3_3e, sub3_6a, sub3_9a, sub3_2e);
                donutcharting_submarket('donut_submarket4', sub4_name, sub4_fnpoe2018, sub4_ci032, sub4_pending, sub4_3e, sub4_6a, sub4_9a, sub4_2e);
                donutcharting_submarket('donut_submarket5', sub5_name, sub5_fnpoe2018, sub5_ci032, sub5_pending, sub5_3e, sub5_6a, sub5_9a, sub5_2e);

            } else if (selected_submarket == 'South Texas') {

                var sub1_name = row[21]["SUBMARKET"];
                var sub1_fnpoe2018 = row[21]["FNPOE2018"];
                var sub1_ci032 = row[21]["CI032"];
                var sub1_pending = row[21]["PENDINGTRIAGE"];
                var sub1_3e = row[21]["EVENT3E"];
                var sub1_6a = row[21]["EVENT6A"];
                var sub1_9a = row[21]["EVENT9A"];
                var sub1_2e = row[21]["EVENT2E"];

                var sub2_name = row[22]["SUBMARKET"];
                var sub2_fnpoe2018 = row[22]["FNPOE2018"];
                var sub2_ci032 = row[22]["CI032"];
                var sub2_pending = row[22]["PENDINGTRIAGE"];
                var sub2_3e = row[22]["EVENT3E"];
                var sub2_6a = row[22]["EVENT6A"];
                var sub2_9a = row[22]["EVENT9A"];
                var sub2_2e = row[22]["EVENT2E"];

                var sub3_name = row[23]["SUBMARKET"];
                var sub3_fnpoe2018 = row[23]["FNPOE2018"];
                var sub3_ci032 = row[23]["CI032"];
                var sub3_pending = row[23]["PENDINGTRIAGE"];
                var sub3_3e = row[23]["EVENT3E"];
                var sub3_6a = row[23]["EVENT6A"];
                var sub3_9a = row[23]["EVENT9A"];
                var sub3_2e = row[23]["EVENT2E"];
                donutcharting_submarket('donut_submarket2', sub1_name, sub1_fnpoe2018, sub1_ci032, sub1_pending, sub1_3e, sub1_6a, sub1_9a, sub1_2e);
                donutcharting_submarket('donut_submarket3', sub2_name, sub2_fnpoe2018, sub2_ci032, sub2_pending, sub2_3e, sub2_6a, sub2_9a, sub2_2e);
                donutcharting_submarket('donut_submarket4', sub3_name, sub3_fnpoe2018, sub3_ci032, sub3_pending, sub3_3e, sub3_6a, sub3_9a, sub3_2e);
                $("#donut_submarket1").hide();
                $("#donut_submarket5").hide();

            }
            
        }

         /* Pie Chart Data */
         /* DONUT CHART CREATER */
        function donutcharting_submarket(container, market, fnpoe2018, ci032, pending, event3e, event6a, event9a, event2e) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {

                subtitle = '<p style="font-size:1.2vw; font-weight: bold; color: #1E90FF;">' + ci032 + '<br><p style="font-size:0.9vw; color: #1E90FF;"> TOTAL CI032' + '</p>'; //create the chart subtitle variable

                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '300'

                    },
                    title: {
                        text: market,
                        style: {
                            "color": "#333333",
                            "fontSize": "16px"
                        }
                    },
                    subtitle: { //chart subtitle assignment and location in the chart area
                        text: subtitle,
                        align: 'center',
                        verticalAlign: 'middle',
                        y: 40
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + market + '</b></br><p style="font-size:11px;">' + content;
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF'

                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: true,
                                format: '{point.y:.0f}',
                                distance: -25,
                                filter: {
                                    property: 'percentage',
                                    operator: '>',
                                    value: 4
                                }
                            },
                            startAngle: -90,
                            endAngle: 90
                        }
                    },
                    credits: { //gets rid of the highcharts.com link
                        enabled: false
                    },
                    series: [{ //assign your data to the series
                        name: 'title',
                        colorByPoint: true,
                        size: '100%',
                        innerSize: '50%',
                        data:[ 
                            { name: 'Event2E', y: event2e, color: '#23f6a8' },
                            { name: 'Event9A', y: event9a, color: '#2d862d' },
                            { name: 'Event6A', y: event6a, color: '#fff263' },
                            { name: 'Event3E', y: event3e, color: '#ff9655' },
                            { name: 'Pending Triage', y: pending, color: '#e6e6e6'},
                        ]
                    }]
                });
            });
         }


    </script>
</asp:Content>
