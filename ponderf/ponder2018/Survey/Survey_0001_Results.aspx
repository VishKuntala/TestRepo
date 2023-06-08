<%@ Page Title="Survey 0001 Results" Language="C#" MasterPageFile="~/MasterPageSurvey.master" AutoEventWireup="true" CodeFile="Survey_0001_Results.aspx.cs" Inherits="_Survey_0001_Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="http://rudovjan.github.io/highcharts-tooltip-delay/tooltip-delay.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script type="text/javascript" src="/capacity/haccordion.js"></script>
    <script type="text/javascript" src="/capacity/ddaccordion.js"></script>

    <script type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>
    <link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script src="../Content/Bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin="" />
    <link href="../capacity/maps/src/leaflet-search.css" rel="stylesheet" />
    <link href="../capacity/maps/leaflet-beautify-marker-icon.css" rel="stylesheet" />
    <link href="../capacity/maps/L.Control.ZoomBox.css" rel="stylesheet" />
    <%--<link rel="stylesheet" type="text/css" href="https://unpkg.com/leaflet.markercluster@1.4.1/dist/MarkerCluster.Default.css" />--%>
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.Aggregations.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.Default.css" rel="stylesheet" />

    <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js" integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg==" crossorigin=""></script>
    <script src="../capacity/maps/src/leaflet-search.js"></script>
    <script src="../capacity/maps/leaflet-beautify-marker-icon.js"></script>
    <script src="../capacity/maps/L.Control.ZoomBox.js"></script>
    <%--<script type='text/javascript' src='https://unpkg.com/leaflet.markercluster@1.4.1/dist/leaflet.markercluster.js'></script>--%>
    <script src="../capacity/maps/clustermap/dist/leaflet.markercluster-regionbound.min.js"></script>
    <script src="../capacity/maps/clustermap/leaflet.featuregroup.subgroup.js"></script>

    <style>
        .left {
            float: left;
        }

        .box2 {
            height: 2px;
        }

        .titleback {
            background: #87cefa;
        }
    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Survey COVID-19-0001 Results Dashboard
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/Survey/Survey.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/Survey/Survey.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Survey COVID-19-0001 Results
                        </span>
                    </a>
                </li>
            </ul>
        </div>

        <%--Search Function--%>
        <%-- <input type="search" id="txtSearch" value="" style="width: 425px; height: 35px; float: right;" placeholder="Search (FA, USID, Site ID, PACE Number, iPlan Job Number)" spellcheck="false" autocomplete="off" onkeypress="return searchKeyPress(event);" />

        <button type="button" class="btn btn-primary btn-md" id="btnSearch" data-toggle="modal" data-target="#m_modal_search">
            <span>
                <i class="fa flaticon-search"></i>
                <span>Search</span>
            </span>
        </button>--%>
        <%--End Search Function--%>
    </div>


    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="kt-portlet">


            <!--begin::Form-->

            <div class="kt-portlet__body">
                <div class="form-group form-group-last">
                    <div class="alert alert-secondary" role="alert">
                        <div class="alert-icon"><i class="flaticon-warning kt-font-brand"></i></div>
                        <div class="alert-text" style="font-size: 20px; color: black;">
                            Choose your geo dropdown for rollup to populate the results.
													
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="GeoExampleSelect1">Which best descripes your reporting area?</label>
                    <select class="form-control" id="GeoExampleSelect1">
                        <option>ALL</option>
                        <option>National</option>
                        <option>Central Region</option>
                        <option>Northeast Region</option>
                        <option>Southeast Region</option>
                        <option>West Region</option>
                    </select>
                </div>


            </div>

            <div class="col-md-4">
                <input id="btn_Submit" class="btn btn-primary btn-md" type="button" value="Get Results" onclick="submitButton();" />
            </div>

            <div class="row">
                <div class="col-lg-12" id="RecentDiv4">
                    <div style="text-align: center; color: #343a40">
                        <h5>Question 1 Results</h5>
                        <h6><b>What do you think?</b></h6>
                        <div id="LOADING_NSB_Quad1" style='display: none'>
                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                        </div>

                        <div id="Question1_DIV">
                            <div id="Question1_Chart" style="visibility: visible;"></div>
                        </div>

                        <br />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12" id="RecentDiv5">
                    <div style="text-align: center; color: #343a40">
                        <h5>Question 2 Results</h5>
                        <h6><b>How is the plan going?</b></h6>
                        <div id="LOADING_NSB_Quad2" style='display: none'>
                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                        </div>

                        <div id="Question2_DIV">
                            <div id="Question2_Chart" style="visibility: visible;"></div>
                        </div>

                        <br />
                    </div>
                </div>
            </div>

            <!--end::Form-->
        </div>

        <!--end::Portlet-->

    </div>


    <script>

        $(document).ready(function () {
            attachClickHandlers();
            console.log("DocReady");

            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                $('#tabCUR_YR_ALLIN').resize()
            });

            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                $('#tabCUR_YR_PLUS1_ALLIN').resize()
            });

        });

        function attachClickHandlers() {
            console.log("ClickHandler");
            $('#ddlMarket').change(
                function () {
                    var market = $('#ddlMarket option:selected').val();
                    var market_long = $('#ddlMarket option:selected').text();
                    console.log(market_long);
                    console.log(market);
                    Getmarketdata(market);
                    document.getElementById('markettitle').innerHTML = market_long;

                }
            );

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001_Results.aspx/GetCURRYEAR",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadCURRYEAR(data);
                },
                error: function (data) {
                }
            });
        }

        function submitButton() {
            //var admin = $('#hf_User').val();
            //console.log("admin: " + admin);
            geo1 = $('#GeoExampleSelect1').val();
            console.log(geo1);

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001_Results.aspx/GetQuestion1Results",
                data: JSON.stringify({ 'geoVariable': geo1 }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    resultsData = JSON.parse(data.d);
                    loadRESULTS_CHART_CREATOR(resultsData, 'Question1_Chart', '0');
                    //$('#NSB_Quad2').show();
                    //$('#LOADING_NSB_Quad2').hide();
                },
                error: function (data) {
                    
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001_Results.aspx/GetQuestion2Results",
                data: JSON.stringify({ 'geoVariable': geo1 }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    resultsData = JSON.parse(data.d);
                    loadRESULTS_CHART2_CREATOR(resultsData, 'Question2_Chart', '0');
                    //$('#NSB_Quad2').show();
                    //$('#LOADING_NSB_Quad2').hide();
                },
                error: function (data) {

                }
            });

        }

        var chart1;
        var chart2;

        /* Question1 CHART LOADER */
        function loadRESULTS_CHART_CREATOR(ResultsData, container, SVNum) {
            var Results_series_values = [];
            var keys = Object.keys(ResultsData[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < ResultsData.length; j++) {
                    if (k == 0) {
                        a.push(ResultsData[j][0]);
                    } else {
                        a.push(ResultsData[j][keys[k]]);
                    }
                }
                Results_series_values.push(a);
            }

            createResultsChart1(Results_series_values[SVNum], container, '#808080');

            var j = 1
            chart1.addSeries({
                name: 'Question1',
                id: 'Question1',
                data: Results_series_values[j],
                animation: true,
                showInLegend: true
            }, false);

            chart1.redraw();
        }

        /* Question2 CHART LOADER */
        function loadRESULTS_CHART2_CREATOR(ResultsData, container, SVNum) {
            var Results_series_values = [];
            var keys = Object.keys(ResultsData[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < ResultsData.length; j++) {
                    if (k == 0) {
                        a.push(ResultsData[j][0]);
                    } else {
                        a.push(ResultsData[j][keys[k]]);
                    }
                }
                Results_series_values.push(a);
            }

            createResultsChart2(Results_series_values[SVNum], container, '#1E90FF');

            var j = 1
            chart2.addSeries({
                name: 'Question2',
                id: 'Question2',
                data: Results_series_values[j],
                animation: true,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createResultsChart1(chartxaxis, chart_div_name, chart_title, chart_subtitle, chartColor1) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#808080', '#1E90FF']
            });
            chart1 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 5,
                    zoomType: 'xy',
                    height: '300',
                    //width: '540'
                },
                exporting: {
                    enabled: false
                },
                //exporting: {
                //    buttons: {
                //        contextButton: {
                //            menuItems: ['viewFullscreen', 'printChart', 'separator', 'downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG']
                //        }
                //    }
                //},

                legend: {
                    itemStyle: {
                        color: '#000000',
                        fontSize: "10px",
                        fontWeight: 'normal'
                    },
                    symbolRadius: 0
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: null
                    //text: chart_title + " - " + chart_subtitle,
                    //style: {
                    //    fontSize: '14px',
                    //    fontWeight: 'bold'
                    //}
                },
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '14px'
                //    }
                //},
                xAxis: {
                    categories: ['1 - Extremely well', '2 - Very well', '3 - Somewhat well', '4 - Not so well', '5 - Not at all well'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        },
                        point: {
                            events: {
                                click: function () {
                                    var chartCategory = this.category + '';
                                    var chartSeries = this.series.name + '';
                                    console.log(chartCategory);
                                    console.log(chartSeries);
                                    Modal_Click();
                                    updatePC_Modal(chartCategory, "ONAIR");
                                }
                            }
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    title: {
                        text: 'Project Count',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "12px"
                        }
                    }
                }, {//Secondary yAxis
                    title: {
                        text: 'Cumulative',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "12px"
                        }
                    },
                    opposite: true
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    delayForDisplay: 1000,
                    hideDelay: 1,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        function createResultsChart2(chartxaxis, chart_div_name, chart_title, chart_subtitle, chartColor1) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 5,
                    zoomType: 'xy',
                    height: '300',
                    //width: '540'
                },
                exporting: {
                    enabled: false
                },
                //exporting: {
                //    buttons: {
                //        contextButton: {
                //            menuItems: ['viewFullscreen', 'printChart', 'separator', 'downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG']
                //        }
                //    }
                //},

                legend: {
                    itemStyle: {
                        color: '#000000',
                        fontSize: "10px",
                        fontWeight: 'normal'
                    },
                    symbolRadius: 0
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: null
                    //text: chart_title + " - " + chart_subtitle,
                    //style: {
                    //    fontSize: '14px',
                    //    fontWeight: 'bold'
                    //}
                },
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '14px'
                //    }
                //},
                xAxis: {
                    categories: ['1 - Extremely well', '2 - Very well', '3 - Somewhat well', '4 - Not so well', '5 - Not at all well', 'No Answer'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        },
                        point: {
                            events: {
                                click: function () {
                                    var chartCategory = this.category + '';
                                    var chartSeries = this.series.name + '';
                                    console.log(chartCategory);
                                    console.log(chartSeries);
                                    Modal_Click();
                                    updatePC_Modal(chartCategory, "ONAIR");
                                }
                            }
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    title: {
                        text: 'Project Count',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "12px"
                        }
                    }
                }, {//Secondary yAxis
                    title: {
                        text: 'Cumulative',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "12px"
                        }
                    },
                    opposite: true
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    delayForDisplay: 1000,
                    hideDelay: 1,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }


        function Getmarketdata(market) {

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001_Results.aspx/GetDATADATE",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDATADATE(data);
                },
                error: function (data) {
                }
            });
        }

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value;
        }

        function loadCURRYEAR(data) {
            var score = JSON.parse(data.d);
            var value_prevyr = score[0]["PREV_YR"];



            var value_curyr = score[0]["CUR_YR"];
            var curyrx = document.querySelectorAll("#CUR_YRa, #CUR_YRb, #CUR_YRc, #CUR_YRc, #CUR_YRd, #CUR_YRe, #CUR_Yrf");
            var i;
            for (i = 0; i < curyrx.length; i++) {
                curyrx[i].innerHTML = value_curyr;
            }

            var value_curyr_plus1 = score[0]["CUR_YR_PLUS1"];

            var value_curyr_plus2 = score[0]["CUR_YR_PLUS2"];

            var value_curyr_plus3 = score[0]["CUR_YR_PLUS3"];

        }

    </script>


</asp:Content>


