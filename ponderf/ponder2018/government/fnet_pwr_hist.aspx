<%@ Page Title="FirstNet Pwr Hist" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="fnet_pwr_hist.aspx.cs" Inherits="government_fnet_pwr_hist" %>

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
                        <h3 class="m-portlet__head-text">RAN Central Region - FirstNet 2018 Power Settings
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="m-section">
                    <div class="row" id="table1row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table1col" style="height: 100%;">
                            <div id="dropdown_market">
                                <select>
                                    <option value="central region view">Central Region View</option>
                                    <option value="0_0">Arkansas/Oklahoma</option>
                                    <option value="1_1">Greater Midwest</option>
                                    <option value="2_2">Illinois/Wisconsin</option>
                                    <option value="3_3">Michigan/Indiana</option>
                                    <option value="4_4">North Texas</option>
                                    <option value="5_5">Northern Plains</option>
                                    <option value="6_6">South Texas</option>                                    
                                </select>
                            </div>
                            <div id="FN_PWR_HIST" style="visibility: visible; overflow: hidden;">Loading</div>
                            <div id="FN_PWR_HIST_MARKET" style="visibility: visible; overflow: hidden;">Loading</div>
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
                            <div id="donut_submarket6" style="visibility: visible;"></div>
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
    </div>

     <script>
        $(document).ready(function () {

            $.ajax({
                 type: "POST",
                 async: true,
                 url: "fnet_pwr_hist.aspx/GetPWRHIST",
                 data: JSON.stringify({}),
                 dataType: "json",
                 contentType: "application/json; charset=utf-8",
                 success: function (data) {
                     loadFNPWRHIST(data);
                 },
                 error: function (data) {
                 }
            });

            $.ajax({
                 type: "POST",
                 async: true,
                 url: "fnet_pwr_hist.aspx/GetPWRHIST_MARKETPIE",
                 data: JSON.stringify({}),
                 dataType: "json",
                 contentType: "application/json; charset=utf-8",
                success: function (data) {
                     loadDonutRegion(data);
                 },
                 error: function (data) {
                 }
            });

            showRegionalElements();

            $("#dropdown_market").on("change", function () {
                var selected_market = $('#dropdown_market').find(":selected").text();
                var market_id = $("#dropdown_market option:selected").val();

                if (market_id == 'central region view') {
                    showRegionalElements();
                    return;
                }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "fnet_pwr_hist.aspx/GetPWRHIST_MARKET",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        hideRegionalElements();
                        loadFNPWRHIST_MARKET(data, selected_market, market_id);
                    },
                    error: function (data) {
                    }
                });
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "fnet_pwr_hist.aspx/GetPWRHIST_SUBMARKETPIE",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        hideRegionalElements();
                        loadDonut_submarket(data, selected_market, market_id);
                    },
                    error: function (data) {
                    }
                });

            });

            function hideRegionalElements() {
                $("#FN_PWR_HIST").hide();
                $("#FN_PWR_HIST_MARKET").show();
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
                $("#donut_submarket6").show();
            }
            function showRegionalElements() {
                $("#FN_PWR_HIST").show();
                $("#FN_PWR_HIST_MARKET").hide();
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
                $("#donut_submarket6").hide();
            }
        });

        /* FN PIM MITIGATION Chart */

        var chart2;

        function loadFNPWRHIST(data) {
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

            

            createFNColchart(FN_Data[0], 'FN_PWR_HIST', 'FirstNet Power Settings', 'Central Region');

            
            var j = 1
            chart2.addSeries({
                name: 'FN Power Settings',
                id: 'FN_PWR_SETTINGS',
                data: [FN_series_values[1], FN_series_values[2], FN_series_values[3], FN_series_values[4], FN_series_values[5], FN_series_values[6], FN_series_values[7], FN_series_values[8], FN_series_values[9], FN_series_values[10],
                        FN_series_values[11], FN_series_values[12], FN_series_values[13], FN_series_values[14]],
                animation: false,
                showInLegend: true,
                stack: 'LOCKED'
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
                    height: '500',
                },
                exporting: {
                    enabled: true
                },
                legend: {
                    enabled: false
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
                    categories: ['Locked', '>46', '46', '45', '44', '43', '42', '41', '40', '39', '36to38', '33to35', '29to32', '<=28'],
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
        /* -----------------FN PWR HIST MARKET Chart Data-------------------- */
        
        function loadFNPWRHIST_MARKET(data, selected_market, market_id) {
            FN_Data = JSON.parse(data.d);

            
            var FN_series_values = [];
            var keys = Object.keys(FN_Data[0]);

            var rows = market_id.split('_');
            var row_start = rows[0];
            var row_end = rows[1];



            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = row_start; j <= row_end; j++) {
                    if (k == 0) {
                        a.push(FN_Data[j][0]);
                    } else {
                        a.push(FN_Data[j][keys[k]]);
                    }
                }
                FN_series_values.push(a);
            }



            createFNColchart_market(FN_Data[0], 'FN_PWR_HIST_MARKET', 'FirstNet Power Settings', 'Central Region - ' + selected_market);

            
            var j = 1
            chart2.addSeries({
                name: 'FN Power Settings',
                id: 'FN_PWR_SETTINGS',
                data: [FN_series_values[2], FN_series_values[3], FN_series_values[4], FN_series_values[5], FN_series_values[6], FN_series_values[7], FN_series_values[8], FN_series_values[9], FN_series_values[10],
                        FN_series_values[11], FN_series_values[12], FN_series_values[13], FN_series_values[14], FN_series_values[15]],
                animation: false,
                showInLegend: true,
                stack: 'LOCKED'
            }, false);
           
            chart2.redraw();
        }

        function createFNColchart_market(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
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
                    height: '500',
                },
                exporting: {
                    enabled: true
                },
                legend: {
                    enabled: false
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
                    categories: ['Locked', '>46', '46', '45', '44', '43', '42', '41', '40', '39', '36to38', '33to35', '29to32', '<=28'],
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
        /*-------------- FN PWR HIST MARKET Data---------------- */



          /* FN PWR HIST REGIONAL Pie Chart Data */

        function loadDonutRegion(data) {
            var row = JSON.parse(data.d); //parse your data
            var str = row[0]["MARKET"];
            var mkt1_name = str.replace("/", "/ "); //put the data into variables to pass to a chart building function. row[0] = first row
            var mkt1_great46 = row[0]["PWR>46"];
            var mkt1_less46 = row[0]["PWR<46"];
            var mkt1_locked = row[0]["LOCKED"];
            var mkt1_pmoss = row[0]["PMOSS_DATA_MISSING"];

            var mkt2_name = row[1]["MARKET"];
            var mkt2_great46 = row[1]["PWR>46"];
            var mkt2_less46 = row[1]["PWR<46"];
            var mkt2_locked = row[1]["LOCKED"];
            var mkt2_pmoss = row[1]["PMOSS_DATA_MISSING"];

            var str = row[2]["MARKET"];
            var mkt3_name = str.replace("/", "/ ");
            var mkt3_great46 = row[2]["PWR>46"];
            var mkt3_less46 = row[2]["PWR<46"];
            var mkt3_locked = row[2]["LOCKED"];
            var mkt3_pmoss = row[2]["PMOSS_DATA_MISSING"];

            var str = row[3]["MARKET"];
            var mkt4_name = str.replace("/", "/ ");
            var mkt4_great46 = row[3]["PWR>46"];
            var mkt4_less46 = row[3]["PWR<46"];
            var mkt4_locked = row[3]["LOCKED"];
            var mkt4_pmoss = row[3]["PMOSS_DATA_MISSING"];

            var mkt5_name = row[4]["MARKET"];
            var mkt5_great46 = row[4]["PWR>46"];
            var mkt5_less46 = row[4]["PWR<46"];
            var mkt5_locked = row[4]["LOCKED"];
            var mkt5_pmoss = row[4]["PMOSS_DATA_MISSING"];

            var mkt6_name = row[5]["MARKET"];
            var mkt6_great46 = row[5]["PWR>46"];
            var mkt6_less46 = row[5]["PWR<46"];
            var mkt6_locked = row[5]["LOCKED"];
            var mkt6_pmoss = row[5]["PMOSS_DATA_MISSING"];

            var mkt7_name = row[6]["MARKET"];
            var mkt7_great46 = row[6]["PWR>46"];
            var mkt7_less46 = row[6]["PWR<46"];
            var mkt7_locked = row[6]["LOCKED"];
            var mkt7_pmoss = row[6]["PMOSS_DATA_MISSING"];


            donutcharting102('donut_arok', mkt1_name, mkt1_great46, mkt1_less46, mkt1_locked, mkt1_pmoss);
            donutcharting102('donut_gmr', mkt2_name, mkt2_great46, mkt2_less46, mkt2_locked, mkt2_pmoss);
            donutcharting102('donut_ilwi', mkt3_name, mkt3_great46, mkt3_less46, mkt3_locked, mkt3_pmoss);
            donutcharting102('donut_miin', mkt4_name, mkt4_great46, mkt4_less46, mkt4_locked, mkt4_pmoss);
            donutcharting102('donut_ntx', mkt5_name, mkt5_great46, mkt5_less46, mkt5_locked, mkt5_pmoss);
            donutcharting102('donut_np', mkt6_name, mkt6_great46, mkt6_less46, mkt6_locked, mkt6_pmoss);
            donutcharting102('donut_stx', mkt7_name, mkt7_great46, mkt7_less46, mkt7_locked, mkt7_pmoss);
        }

         /* Pie Chart Data */
         /* DONUT CHART CREATER */
        function donutcharting102(container, market, great46, less46, locked, pmoss) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {

                subtitle = '<p style="font-size:1.2vw; font-weight: bold; color: #1E90FF;">'+'<br><p style="font-size:0.9vw; color: #1E90FF;"> Power</p>' + '<br><p style="font-size:0.9vw; color: #1E90FF;"> Settings</p>'; //create the chart subtitle variable

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
                            { name: 'Percent >=46', y: great46, color: '#009933' },
                            { name: 'Percent <46', y: less46, color: '#ffff33' },
                            { name: 'Percent Locked', y: locked, color: '#e60000' },
                            { name: 'Percent Missing Data', y: pmoss, color: '#cccccc' },
                        ]
                    }]
                });
            });
         }

   /* -------------------END OF MARKET PIE----------------  */



                   /* FN PWR HIST SUBMARKET Pie Chart Data */

        function loadDonut_submarket(data, selected_market, market_id) {
            var row = JSON.parse(data.d); //parse your data


            if (selected_market == 'Arkansas/Oklahoma') {

                var sub1_name = row[0]["SUBMARKET"];
                var sub1_great46 = row[0]["PWR>46"];
                var sub1_less46 = row[0]["PWR<46"];
                var sub1_locked = row[0]["LOCKED"];
                var sub1_pmoss = row[0]["PMOSS_DATA_MISSING"];

                var sub2_name = row[1]["SUBMARKET"];
                var sub2_great46 = row[1]["PWR>46"];
                var sub2_less46 = row[1]["PWR<46"];
                var sub2_locked = row[1]["LOCKED"];
                var sub2_pmoss = row[1]["PMOSS_DATA_MISSING"];

                var sub3_name = row[2]["SUBMARKET"];
                var sub3_great46 = row[2]["PWR>46"];
                var sub3_less46 = row[2]["PWR<46"];
                var sub3_locked = row[2]["LOCKED"];
                var sub3_pmoss = row[2]["PMOSS_DATA_MISSING"];


                donutcharting_sub('donut_submarket2', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket3', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);
                donutcharting_sub('donut_submarket4', sub3_name, sub3_great46, sub3_less46, sub3_locked, sub3_pmoss);  
                $("#donut_submarket1").empty();
                $("#donut_submarket5").empty();

            } else if (selected_market == 'Greater Midwest') {

                var sub1_name = row[3]["SUBMARKET"];
                var sub1_great46 = row[3]["PWR>46"];
                var sub1_less46 = row[3]["PWR<46"];
                var sub1_locked = row[3]["LOCKED"];
                var sub1_pmoss = row[3]["PMOSS_DATA_MISSING"];

                var sub2_name = row[4]["SUBMARKET"];
                var sub2_great46 = row[4]["PWR>46"];
                var sub2_less46 = row[4]["PWR<46"];
                var sub2_locked = row[4]["LOCKED"];
                var sub2_pmoss = row[4]["PMOSS_DATA_MISSING"];

                donutcharting_sub('donut_submarket3', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket4', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);

                $("#donut_submarket1").empty();
                $("#donut_submarket2").empty();
                $("#donut_submarket5").empty();

            } else if (selected_market == 'Illinois/Wisconsin') {

                var sub1_name = row[5]["SUBMARKET"];
                var sub1_great46 = row[5]["PWR>46"];
                var sub1_less46 = row[5]["PWR<46"];
                var sub1_locked = row[5]["LOCKED"];
                var sub1_pmoss = row[5]["PMOSS_DATA_MISSING"];

                var sub2_name = row[6]["SUBMARKET"];
                var sub2_great46 = row[6]["PWR>46"];
                var sub2_less46 = row[6]["PWR<46"];
                var sub2_locked = row[6]["LOCKED"];
                var sub2_pmoss = row[6]["PMOSS_DATA_MISSING"];

                var sub3_name = row[7]["SUBMARKET"];
                var sub3_great46 = row[7]["PWR>46"];
                var sub3_less46 = row[7]["PWR<46"];
                var sub3_locked = row[7]["LOCKED"];
                var sub3_pmoss = row[7]["PMOSS_DATA_MISSING"];

                donutcharting_sub('donut_submarket2', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket3', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);
                donutcharting_sub('donut_submarket4', sub3_name, sub3_great46, sub3_less46, sub3_locked, sub3_pmoss);

                $("#donut_submarket1").empty();
                $("#donut_submarket5").empty();

            } else if (selected_market == 'Michigan/Indiana') {

                var sub1_name = row[8]["SUBMARKET"];
                var sub1_great46 = row[8]["PWR>46"];
                var sub1_less46 = row[8]["PWR<46"];
                var sub1_locked = row[8]["LOCKED"];
                var sub1_pmoss = row[8]["PMOSS_DATA_MISSING"];

                var sub2_name = row[9]["SUBMARKET"];
                var sub2_great46 = row[9]["PWR>46"];
                var sub2_less46 = row[9]["PWR<46"];
                var sub2_locked = row[9]["LOCKED"];
                var sub2_pmoss = row[9]["PMOSS_DATA_MISSING"];

                var sub3_name = row[10]["SUBMARKET"];
                var sub3_great46 = row[10]["PWR>46"];
                var sub3_less46 = row[10]["PWR<46"];
                var sub3_locked = row[10]["LOCKED"];
                var sub3_pmoss = row[10]["PMOSS_DATA_MISSING"];

                var sub4_name = row[11]["SUBMARKET"];
                var sub4_great46 = row[11]["PWR>46"];
                var sub4_less46 = row[11]["PWR<46"];
                var sub4_locked = row[11]["LOCKED"];
                var sub4_pmoss = row[11]["PMOSS_DATA_MISSING"];

                donutcharting_sub('donut_submarket2', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket3', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);
                donutcharting_sub('donut_submarket4', sub3_name, sub3_great46, sub3_less46, sub3_locked, sub3_pmoss);
                donutcharting_sub('donut_submarket5', sub4_name, sub4_great46, sub4_less46, sub4_locked, sub4_pmoss);



                $("#donut_submarket1").empty();

            } else if (selected_market == 'North Texas') {

                var sub1_name = row[12]["SUBMARKET"];
                var sub1_great46 = row[12]["PWR>46"];
                var sub1_less46 = row[12]["PWR<46"];
                var sub1_locked = row[12]["LOCKED"];
                var sub1_pmoss = row[12]["PMOSS_DATA_MISSING"];

                var sub2_name = row[13]["SUBMARKET"];
                var sub2_great46 = row[13]["PWR>46"];
                var sub2_less46 = row[13]["PWR<46"];
                var sub2_locked = row[13]["LOCKED"];
                var sub2_pmoss = row[13]["PMOSS_DATA_MISSING"];

                var sub3_name = row[14]["SUBMARKET"];
                var sub3_great46 = row[14]["PWR>46"];
                var sub3_less46 = row[14]["PWR<46"];
                var sub3_locked = row[14]["LOCKED"];
                var sub3_pmoss = row[14]["PMOSS_DATA_MISSING"];

                var sub4_name = row[15]["SUBMARKET"];
                var sub4_great46 = row[15]["PWR>46"];
                var sub4_less46 = row[15]["PWR<46"];
                var sub4_locked = row[15]["LOCKED"];
                var sub4_pmoss = row[15]["PMOSS_DATA_MISSING"];

                donutcharting_sub('donut_submarket2', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket3', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);
                donutcharting_sub('donut_submarket4', sub3_name, sub3_great46, sub3_less46, sub3_locked, sub3_pmoss);
                donutcharting_sub('donut_submarket5', sub4_name, sub4_great46, sub4_less46, sub4_locked, sub4_pmoss);

                $("#donut_submarket1").empty();

            } else if (selected_market == 'Northern Plains') {

                var sub1_name = row[16]["SUBMARKET"];
                var sub1_great46 = row[16]["PWR>46"];
                var sub1_less46 = row[16]["PWR<46"];
                var sub1_locked = row[16]["LOCKED"];
                var sub1_pmoss = row[16]["PMOSS_DATA_MISSING"];

                var sub2_name = row[17]["SUBMARKET"];
                var sub2_great46 = row[17]["PWR>46"];
                var sub2_less46 = row[17]["PWR<46"];
                var sub2_locked = row[17]["LOCKED"];
                var sub2_pmoss = row[17]["PMOSS_DATA_MISSING"];

                var sub3_name = row[18]["SUBMARKET"];
                var sub3_great46 = row[18]["PWR>46"];
                var sub3_less46 = row[18]["PWR<46"];
                var sub3_locked = row[18]["LOCKED"];
                var sub3_pmoss = row[18]["PMOSS_DATA_MISSING"];

                var sub4_name = row[19]["SUBMARKET"];
                var sub4_great46 = row[19]["PWR>46"];
                var sub4_less46 = row[19]["PWR<46"];
                var sub4_locked = row[19]["LOCKED"];
                var sub4_pmoss = row[19]["PMOSS_DATA_MISSING"];

                var sub5_name = row[20]["SUBMARKET"];
                var sub5_great46 = row[20]["PWR>46"];
                var sub5_less46 = row[20]["PWR<46"];
                var sub5_locked = row[20]["LOCKED"];
                var sub5_pmoss = row[20]["PMOSS_DATA_MISSING"];

                donutcharting_sub('donut_submarket1', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket2', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);
                donutcharting_sub('donut_submarket3', sub3_name, sub3_great46, sub3_less46, sub3_locked, sub3_pmoss);
                donutcharting_sub('donut_submarket4', sub4_name, sub4_great46, sub4_less46, sub4_locked, sub4_pmoss);
                donutcharting_sub('donut_submarket5', sub5_name, sub5_great46, sub5_less46, sub5_locked, sub5_pmoss);



            } else if (selected_market == 'South Texas') {

                var sub1_name = row[21]["SUBMARKET"];
                var sub1_great46 = row[21]["PWR>46"];
                var sub1_less46 = row[21]["PWR<46"];
                var sub1_locked = row[21]["LOCKED"];
                var sub1_pmoss = row[21]["PMOSS_DATA_MISSING"];

                var sub2_name = row[22]["SUBMARKET"];
                var sub2_great46 = row[22]["PWR>46"];
                var sub2_less46 = row[22]["PWR<46"];
                var sub2_locked = row[22]["LOCKED"];
                var sub2_pmoss = row[22]["PMOSS_DATA_MISSING"];

                var sub3_name = row[23]["SUBMARKET"];
                var sub3_great46 = row[23]["PWR>46"];
                var sub3_less46 = row[23]["PWR<46"];
                var sub3_locked = row[23]["LOCKED"];
                var sub3_pmoss = row[23]["PMOSS_DATA_MISSING"];

                donutcharting_sub('donut_submarket2', sub1_name, sub1_great46, sub1_less46, sub1_locked, sub1_pmoss);
                donutcharting_sub('donut_submarket3', sub2_name, sub2_great46, sub2_less46, sub2_locked, sub2_pmoss);
                donutcharting_sub('donut_submarket4', sub3_name, sub3_great46, sub3_less46, sub3_locked, sub3_pmoss);


                $("#donut_submarket1").empty();
                $("#donut_submarket5").empty();

            }


        }


         /* DONUT CHART CREATER FOR PWR HIST SUBMARKET */
        function donutcharting_sub(container, market, great46, less46, locked, pmoss) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {

                subtitle = '<p style="font-size:1.2vw; font-weight: bold; color: #1E90FF;">'+'<br><p style="font-size:0.9vw; color: #1E90FF;"> Power</p>' + '<br><p style="font-size:0.9vw; color: #1E90FF;"> Settings</p>'; //create the chart subtitle variable

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
                            { name: 'Percent >=46', y: great46, color: '#009933' },
                            { name: 'Percent <46', y: less46, color: '#ffff33' },
                            { name: 'Percent Locked', y: locked, color: '#e60000' },
                            { name: 'Percent Missing Data', y: pmoss, color: '#cccccc' },
                        ]
                    }]
                });
            });
         }
    </script>
</asp:Content>
