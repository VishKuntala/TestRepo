<%@ Page Title="WLL Markets" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Markets_WLL.aspx.cs" Inherits="government_Markets_WLL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>

   <style type="text/css">
        .box1 { width:20px; height:20px; }
        .backdarkgreen { background:#003300; display:inline-block; }
        .backmedgreen { background:#008000; display:inline-block; }
        .backlightgreen { background:#00cc00; display:inline-block; }        
        .backdarkblue { background:#0066cc; display:inline-block; }
        .backmedblue { background:#4da6ff; display:inline-block; }
        .backlightblue { background:#87cefa; display:inline-block; }
        .cata {display:inline-block; }
        #donutrowlegend {text-align:center; }
    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">Government Funded Projects
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
                        <span class="m-nav__link-text">WLL
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">WLL Reporting
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">Market View
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
            <div class="row" id="selectorrow" style="width: 99.5%; height: 3%; margin: 0.5%;">

                <asp:Label ID="labelMarket" runat="server" Text="Market: &nbsp;&nbsp;" Visible="true" font-size=12 ForeColor="Black"></asp:Label>
                <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                    <asp:ListItem Text=""></asp:ListItem>
                </asp:DropDownList>

            </div>

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">2020 WLL Market View
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="m-section">
                    <%--<span class="m-section__heading">Market View: WLL Projects
                    </span>--%>
                    
                    <div class="row" id="table1row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table1col" style="height: 100%;">
                            <div id="WLLCARRIERMARKET" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <div class="row" id="table2row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table2col" style="height: 100%;">
                            <div id="WLLFOREACTMARKET" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <div class="row" id="table3row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table3col" style="height: 100%;">
                            <div id="WLLOUTLOOKMARKET" style="visibility: visible;"></div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>

    <script>
        //ATTACH CLICK HANDLERS
        $(document).ready(function () {
            attachClickHandlers();
            console.log("DocReady");
        });
        // Re-attach click handlers if gridview is changed
        //var prm = Sys.WebForms.PageRequestManager.getInstance();

        //prm.add_endRequest(function () {
        //    attachClickHandlers();
        //});

        function attachClickHandlers() {
            console.log("ClickHandler");
            $('#ddlMarket').change(
                function () {
                    var market = $('#ddlMarket option:selected').val();
                    console.log(market);
                    Getmarketdata(market);
                    // Do something with val1 and val2 ...
                }
            );
        }
        function Getmarketdata(market) {
                       
            $.ajax({
                type: "POST",
                async: true,
                url: "Markets_WLL.aspx/GetWLLCARRIERMARKET",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadWLLCARRIERMARKET(data);
                },
                error: function (data) {
                    alert('there was an arror!');
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Markets_WLL.aspx/GetWLLFOREACTMARKET",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadWLLFOREACTMARKET(data);
                },
                error: function (data) {
                    alert('there was an arror!');
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Markets_WLL.aspx/GetWLLOUTLOOKMARKET",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadWLLOUTLOOKMARKET(data);
                },
                error: function (data) {
                    alert('there was an arror!');
                }
            });
        }
                
        /* Forecast vs On-air Overview Chart Data */

        var chart2;
        /* Ajax call to load the WLLCARRIERMARKET chart data */

        function loadWLLCARRIERMARKET(data) {
            var marketTitle = $('#ddlMarket option:selected').val();
            FNCARMARDATA = JSON.parse(data.d);

            const cats = {}
            FNCARMARDATA.forEach((o) => cats[o.FORECAST_MONTH] = 1)
            const categories = Object.keys(cats)

            // Parse  data
            let series = FNCARMARDATA.reduce((acc, o) => {
                // Check if array already defined
                if (acc[o.LEGEND] && acc[o.LEGEND].data) {
                    // Push new values to array
                    acc[o.LEGEND].data.push({
                        x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_COUNT)})
                } else {
                    // Create new array with first value
                    acc[o.LEGEND] = { data: [{ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_COUNT) }] }
                }
                return acc
            }, {})

            // Convert object to array
            series = Object.keys(series).map((key) => {
                series[key].name = key
                return series[key]
            })

            series = series.map(serie => {
                serie.data.sort((a, b) => a.x - b.x)
                return serie
            })
            console.log(series, categories)


            // Chart options
            const options = {
                xAxis: {
                    gridLineWidth: 1,
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    labels: {
                        style: { fontSize: "14px" }
                    }
                },
                colors: ['#99c2ff', '#0066ff', '#ffd699', '#ff9900', '#00cc00', '#008000', '#ffb3ec', '#ff33cc', '#ffad99' , '#ff3300', '#ffff99', '#ffff00', '#ccffff', '#00ffff' ],
                chart: {
                    type: 'column',
                    height: '500'
                },
                series: series,
                title: {
                    text: marketTitle + ' WLL Carriers by State',
                    style: {
                        fontSize: "18px",
                        fontWeight: 'bold'
                    }
                },
                subtitle: {
                    text: 'Forecast vs. Actual',
                    style: {
                        fontSize: "16px",
                        fontWeight: 'bold'
                    }
                },
                legend: {
                    itemStyle: {
                        color: '#000000',
                        fontSize: "14px",
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
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                },
                plotOptions: {
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        },
                        dataLabels:{
                enabled:true,
                formatter:function(){
                    if(this.y > 0)
                        return this.y;
                }
            }
                    }
                }
            }

            // Create chart
            const chart = Highcharts.chart('WLLCARRIERMARKET', options)
        }

        /* Forecast vs On-air Overview Chart Data */

        var chart2;

        /* HC SUMMARY CHART LOADER */
        function loadWLLFOREACTMARKET(data) {
            var marketTitle = $('#ddlMarket option:selected').val();
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

            createFNColchart(FN_series_values[0], 'WLLFOREACTMARKET', marketTitle + ' WLL Carrier Forecast', 'Forecast vs. Actual');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: FN_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: FN_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createFNColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '500'
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
                    categories: ['<-2019', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2021->'],
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
                        dataLabels:{
                enabled:true,
                formatter:function(){
                    if(this.y > 0)
                        return this.y;
                }
            }
                    }
                },
                yAxis: [{//Primary yAxis
                    title: {
                        text: 'Project Count',
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

        /* Forecast vs On-air Overview Chart Data */

        var chart3;

        /* HC SUMMARY CHART LOADER */
        function loadWLLOUTLOOKMARKET(data) {
            var marketTitle = $('#ddlMarket option:selected').val();
            FN2_Data = JSON.parse(data.d);
            var FN2_series_values = [];
            var keys = Object.keys(FN2_Data[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < FN2_Data.length; j++) {
                    if (k == 0) {
                        a.push(FN2_Data[j][0]);
                    } else {
                        a.push(FN2_Data[j][keys[k]]);
                    }
                }
                FN2_series_values.push(a);
            }

            createFN2Colchart(FN2_series_values[0], 'WLLOUTLOOKMARKET', marketTitle + ' WLL Carrier Outlook', 'Milestones');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: FN_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 1
            chart3.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 2
            chart3.addSeries({
                name: 'SAQ Complete',
                id: 'SAQ Complete',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart3.addSeries({
                name: 'Construction Start Complete',
                id: 'Construction Start Complete',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart3.addSeries({
                name: 'Tower Top Complete',
                id: 'Tower Top Complete',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart3.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart3.redraw();
        }

        function createFN2Colchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            chart3 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '500'
                },
                colors: ['#1E90FF', '#faa43a', '#808080', '#decf3f', '#2E8B57'],
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
                    categories: ['Milestone Counts'],
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
                        dataLabels:{
                enabled:true,
                formatter:function(){
                    if(this.y > 0)
                        return this.y;
                }
            }
                    }
                },
                yAxis: [{//Primary yAxis
                    title: {
                        text: 'Project Count',
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

    </script>

</asp:Content>



