<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cappoeilwi.aspx.cs" Inherits="capacity_cappoeilwi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>


    <!-- <script src="../scripts/jquery-3.3.1.min.js"></script> -->


    <!--end::Base Scripts -->



    <!--begin::Page Vendors -->

    <!--end::Page Resources -->
    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">Capacity
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/ponder.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">RANFT
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">POE
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

    <table id="tblMacro" class="table" style="width: 100%">
        <thead>
            <tr>
                <th>PRODUCT_GROUP</th>
                <th>POE_NAME</th>
                <th>F_2017</th>
                <th>NBD_2017</th>
                <th>A_2017</th>
                <th>F_JAN_18</th>
                <th>NBD_JAN_18</th>
                <th>A_JAN_18</th>
                <th>F_FEB_18</th>
                <th>NBD_FEB_18</th>
                <th>A_FEB_18</th>
                <th>F_MAR_18</th>
                <th>NBD_MAR_18</th>
                <th>A_MAR_18</th>
            </tr>
        </thead>
    </table>

    <!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script> -->

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoeilwi.aspx/GetMacroSummary", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadMacroSummary(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadMacroSummary(data) {
            var data = JSON.parse(data.d);
            $('#tblMacro').dataTable().fnDestroy(); //destroy old table
            $('#tblMacro').DataTable({ //build new table
                paging: false,
                sort: false,
                scrollY: 250,
                scrollCollapse: true,
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'POE_NAME' },
                    { 'data': 'F_2017' },
                    { 'data': 'NBD_2017' },
                    { 'data': 'A_2017' },
                    { 'data': 'F_JAN_18' },
                    { 'data': 'NBD_JAN_18' },
                    { 'data': 'A_JAN_18' },
                    { 'data': 'F_FEB_18' },
                    { 'data': 'NBD_FEB_18' },
                    { 'data': 'A_FEB_18' },
                    { 'data': 'F_MAR_18' },
                    { 'data': 'NBD_MAR_18' },
                    { 'data': 'A_MAR_18' }

                ]/*,
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["project_count"] == data["pace_jobs"]) {
                        $('td', row).eq(2).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["funded"]) {
                        $('td', row).eq(3).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["project_scoped"]) {
                        $('td', row).eq(4).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["site_acq_complete"]) {
                        $('td', row).eq(5).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["design_complete"]) {
                        $('td', row).eq(6).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["equip_ordered"]) {
                        $('td', row).eq(7).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["construction_started"]) {
                        $('td', row).eq(8).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["integration_complete"]) {
                        $('td', row).eq(9).addClass('highlightgreen');
                    }
                    if (data["project_count"] == data["on_air"]) {
                        $('td', row).eq(10).addClass('highlightgreen');
                    }
                }*/
            });

            /*$('#tblMacro tr:gt(0)').on('mouseover', function () { //attach some event handlers for hovering (mouseover, mouseout) or clicking
                this.style.backgroundColor = 'silver';
                this.style.cursor = 'pointer';
            }).on('mouseout', function () {
                this.style.backgroundColor = 'transparent';
                this.style.cursor = 'default';
            }).on('click', function () {
                var subgroup = $(this).find('td:eq(0)').text();
                $('#tblMacro_wrapper').hide();
                if (subgroup == "LTE 3C") {
                    $('#tblMacro3c_wrapper').show();
                } else if (subgroup == "LTE 2C") {
                    $('#tblMacro2c_wrapper').show();
                } else if (subgroup == "LTE Only 1C") {
                    $('#tblMacro1c_wrapper').show();
                } else if (subgroup == "LTE 4C") {
                    $('#tblMacro4c_wrapper').show();
                } else if (subgroup == "LTE 5C") {
                    $('#tblMacro5c_wrapper').show();
                } else if (subgroup == "PRB Expansion") {
                    $('#tblMacroPRBex_wrapper').show();
                } else if (subgroup == "PRB RRH Swap bCEM") {
                    $('#tblMacroPRBrrh_wrapper').show();
                } else if (subgroup == "Cell Site RF Modifications") {
                    $('#tblMacroMod_wrapper').show();
                } else if (subgroup == "2nd RRH Add") {
                    $('#tblMacro6c_wrapper').show();
                } else if (subgroup == "Split Sector - LTE") {
                    $('#tblSplitSector_wrapper').show();
                } else {
                    $('#tblMacro_wrapper').show();
                    alert('Sorry, there is no drill down data available for your selection.');
                }

                $(window).resize();
            });*/
        }


    </script>

    <div class="col-md-3" id="donut5col" style="height:100%;">
        <div id="donut5" style="visibility:visible;">
        </div>  
    </div>
    <script type="text/javascript">

        /* Ajax call to load the donut5 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoeilwi.aspx/Getdonut5",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut5(data);
            },
            error: function (data) {
            }
        });

        function loadDonut5(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["SCORE"]; //put the data into variables to pass to a chart building function
            var title = score[0]["TITLE"]; //put the data into variables to pass to a chart building function
            var duedate = score[0]["DUEDATE"]; //put the data into variables to pass to a chart building function
            donutcharting('donut5', Number(value), title, duedate); //call my chart building function
        }

        /* DONUT CHART CREATER */
        function donutcharting(container, value, title, duedate) {
            $(function () {
                var color1; //variable for chart color assignments

                title = title + '<br><p style="font-size:14px; font-style:italic;">(Due: ' + duedate + ')</p>'; //create the chart title variable
                if (value == 100) {
                    color1 = '#00ff00'; //its green
                } else {
                    color1 = '#ff0000'; //its red
                }


                Highcharts.chart(container, { //define the Highchart
                    colors: [color1, '#ffffff'], //series' colors
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '250',
                        width: '250'

                    },
                    title: { //chart title assignment and location in the chart area
                        text: title,
                        align: 'center',
                        verticalAlign: 'middle',
                        y: -20
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        pointFormat: '<b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: false,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    credits: { //gets rid of the highcharts.com link
                        enabled: false
                    },
                    series: [{ //assign your data to the series
                        name: title,
                        colorByPoint: true,
                        innerSize: 175,
                        data: [{
                            name: 'Percent Done',
                            y: value
                        }, {
                            name: 'Percent Not Done',
                            y: 100 - value
                        }]
                    }]
                });
            });
        }


    </script>

    
</asp:Content>

