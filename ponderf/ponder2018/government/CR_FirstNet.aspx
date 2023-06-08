<%@ Page Title="FirstNet Central Region" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CR_FirstNet.aspx.cs" Inherits="government_CR_FirstNet" %>

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
                        <h3 class="m-portlet__head-text">RAN Central Region - FirstNet 2020 POE
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="m-section">
                    <div class="row" id="table1row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table1col" style="height: 100%;">
                            <div id="FNCARRIERREGION" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <div class="row" id="table2row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table2col" style="height: 100%;">
                            <div id="FNCARRIERREGION_CHART2" style="visibility: visible;"></div>
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
                url: "CR_FirstNet.aspx/GetFNCARRIERREGION",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadFNCARRIERREGION(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "CR_FirstNet.aspx/GetFNCARRIERREGION_CHART2",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadFNCARRIERREGION_CHART2(data);
                },
                error: function (data) {
                }
            });

        });

        /* Forecast vs On-air Overview Chart Data */

        var chart2;

        /* HC SUMMARY CHART LOADER */
        function loadFNCARRIERREGION(data) {
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

            createFNColchart(FN_series_values[0], 'FNCARRIERREGION', 'Central Region FirstNet Carrier Forecast', 'Forecast vs. Actual');

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
                    height: '600'
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
                    text: chart_title + '<br/><span style="font-size:16px;">' + chart_subtitle + '</span>',
                    style: {
                        fontSize: '18px',
                        fontWeight: 'bold'
                    }
                },
                subtitle: {
                    useHTML: true,
                    text: '<a href="https://nckimo1ebisia06.itservices.sbc.com/#/views/FirstNet_Milestone-Final/B14Milestone?Region%20%2F%20Market=CENTRAL" target="_blank">Tableau Workbook Drilldown<a/><br/><a href="https://nckimo1ebisia06.itservices.sbc.com/#/views/FirstNet_Milestone-Map-Published/B14Map?:iid=1" target="_blank">Tableau Workbook B14 Map<a/>',
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
                        dataLabels: {
                            enabled: true
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
        function loadFNCARRIERREGION_CHART2(data) {
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

            createFN2Colchart(FN2_series_values[0], 'FNCARRIERREGION_CHART2', 'Central Region FirstNet Carrier Outlook', 'Milestones');

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
            chart3.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart3.addSeries({
                name: 'SAQ Complete',
                id: 'SAQ Complete',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart3.addSeries({
                name: 'Construction Start Complete',
                id: 'Construction Start Complete',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart3.addSeries({
                name: 'Tower Top Complete',
                id: 'Tower Top Complete',
                data: FN2_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
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
            // cloneToolTip = null;
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
                    height: '600'
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
                    categories: ['ARKANSAS/OKLAHOMA', 'GREATER MIDWEST', 'ILLINOIS/WISONSIN', 'MICHIGAN/INDIANA', 'NORTH TEXAS', 'NORTHERN PLAINS', 'SOUTH TEXAS'],
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

                        //cursor: 'pointer',
                        //point: {
                        //    events: {
                        //        click: function() {
                        //        if (cloneToolTip) {
                        //        chart.container.firstChild.removeChild(cloneToolTip);
                        //        }
                        //    cloneToolTip = this.series.chart.tooltip.label.element.cloneNode(true);
                        //    chart.container.firstChild.appendChild(cloneToolTip);
                        //        }
                        //    }
                        //}

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

                //tooltip: {
                //    formatter: function () {
                //        return this.points.reduce(function (s, point) {
                //            return s + '<br/>' + point.series.name + ': ' +
                //            point.y;
                //        }, '<b>' + this.x + '</b>');
                //    },
                //    shared: true
                //}

                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} </b></td></tr>',                    
                    footerFormat: '<br/><span style="font-size:14px;"><a href="https://nckimo1ebisia06.itservices.sbc.com/#/views/FirstNet_Milestone-Final/B14Milestone?Region%20%2F%20Market={point.key}"  target="_blank">Tableau Workbook Drilldown<a/></span></table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF',
                    positioner: function(width, height, point) {
                        return {
                            x: point.plotX + 50,
                            y: point.plotY,
                        }
                    },
                    style: {
                        pointerEvents: 'auto'
                    }

                }
            });
        }

    </script>

</asp:Content>

