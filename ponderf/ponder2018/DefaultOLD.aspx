<%@ Page Title="CR Dashboard Overview" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeFile="DefaultOLD.aspx.cs" Inherits="_DefaultOLD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script	 type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script	 type="text/javascript" src="../Scripts/jquery-ui.min.js"></script> 
    <link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>

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

        .tabulator {
  position: relative;
  border: 1px solid #999;
  background-color: #888;
  font-size: 13px;
  text-align: left;
  overflow: hidden;
  -ms-transform: translatez(0);
  transform: translatez(0);
}

        .tabulator .tabulator-header .tabulator-col {
        display: inline-block;
        position: relative;
        box-sizing: border-box;
        border-right: 1px solid #aaa;
        background: #87cefa;
        text-align: center;
        vertical-align: bottom;
        overflow: hidden;
    }

    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">Dashboard
            </h3>            
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
                        <h3 class="m-portlet__head-text">RAN Central Region 2018 POE - Date Of Data: &nbsp; </h3>
                        <h3 class="m-portlet__head-text" id="DATADATE" style="text-align:right;"></h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="m-section">
                    
                    <h4 class="m-subheader__title m-subheader__title--separator">Job/Plan Completion View</h4>                    
                    <div class="row" id="table1row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table1col" style="height: 100%;">
                            <div id="example-table" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />                    

                    <h4 class="m-subheader__title m-subheader__title--separator">Central Region: LTE Program Progress 2018 YTD</h4>

                    <div class="row" id="donutrow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut1col" style="height: 100%;">
                            <div id="donut1" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut2col" style="height: 100%;">
                            <div id="donut2" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut3col" style="height: 100%;">
                            <div id="donut3" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut4col" style="height: 100%;">
                            <div id="donut4" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut5col" style="height: 100%;">
                            <div id="donut5" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut6col" style="height: 100%;">
                            <div id="donut6" style="visibility: visible;"></div>
                        </div>
                    </div>

                    <div id="donutrowlegend" >
                        <div class="box1 backdarkgreen">&nbsp;</div> 
                        <div class="cata"> &ensp;Completed In Other Months &emsp;</div>
                        <div class="box1 backmedgreen">&nbsp;</div> 
                        <div class="cata"> &ensp;Completed Last Month &emsp;</div>
                        <div class="box1 backlightgreen">&nbsp;</div> 
                        <div class="cata"> &ensp;Completed in Current Month &emsp;</div>                        
                        <div class="box1 backdarkblue">&nbsp;</div> 
                        <div class="cata"> &ensp;Forecasted Current Month Remaining &emsp;</div>
                        <div class="box1 backmedblue">&nbsp;</div> 
                        <div class="cata"> &ensp;Forecasted Next Month &emsp;</div>
                        <div class="box1 backlightblue">&nbsp;</div> 
                        <div class="cata"> &ensp;Forecasted Remaining &emsp;</div>
                    </div>
                    <br />
                    <h2 class="m-subheader__title m-subheader__title--separator">Market Comparisons</h2>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - NSB</h4>
                    <div class="row" id="table4row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table4col" style="height: 100%;">
                            <div id="example-table4" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - LTE 1C</h4>
                    <div class="row" id="table5row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table5col" style="height: 100%;">
                            <div id="example-table5" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - LTE AC</h4>
                    <div class="row" id="table6row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table6col" style="height: 100%;">
                            <div id="example-table6" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - 4T4R</h4>
                    <div class="row" id="table7row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table7col" style="height: 100%;">
                            <div id="example-table7" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - CRAN</h4>
                    <div class="row" id="table8row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table8col" style="height: 100%;">
                            <div id="example-table8" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - BWE HW</h4>
                    <div class="row" id="table9row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table9col" style="height: 100%;">
                            <div id="example-table9" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    

                </div>
            </div>            
            
        </div>
    </div>

    <script>
        ////ATTACH CLICK HANDLERS
        //$(document).ready(function () {
        //    attachClickHandlers();
        //    console.log("DocReady");
        //});
        //// Re-attach click handlers if gridview is changed
        ////var prm = Sys.WebForms.PageRequestManager.getInstance();

        ////prm.add_endRequest(function () {
        ////    attachClickHandlers();
        ////});

        //function attachClickHandlers() {
        //    console.log("ClickHandler");
        //    $('#ddlMarket').change(
        //        function () {
        //            var market = $('#ddlMarket option:selected').val();
        //            console.log(market);
        //            Getmarketdata(market);
        //            // Do something with val1 and val2 ...
        //        }
        //    );
        //}
              
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDATADATE",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDATADATE(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboard1",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboard1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboardMARKETNSB",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKETNSB(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboardMARKETLTE1C",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKETLTE1C(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboardMARKETLTEAC",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKETLTEAC(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboardMARKET4T4R",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKET4T4R(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboardMARKETCRAN",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKETCRAN(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/GetDashboardMARKETBWEHW",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKETBWEHW(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/Getdonut1",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/Getdonut2",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/Getdonut3",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/Getdonut4",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut4(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/Getdonut5",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut5(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "DefaultOLD.aspx/Getdonut6",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut6(data);
                },
                error: function (data) {
                }
            });

            

        });

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value;
        }            

        /* donut1 chart data */

        function loadDonut1(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'New Site Build'; //put the data into variables to pass to a chart building function
            var forecast = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            donutcharting101('donut1', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* Ajax call to load the donut2 chart data */

        function loadDonut2(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'LTE 1C'; //put the data into variables to pass to a chart building function
            var forecast = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            donutcharting101('donut2', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* Ajax call to load the donut3 chart data */

        function loadDonut3(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'LTE AC'; //put the data into variables to pass to a chart building function
            var forecast = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            donutcharting101('donut3', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* Ajax call to load the donut4 chart data */

        function loadDonut4(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = '4T4R'; //put the data into variables to pass to a chart building function
            var forecast = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            donutcharting101('donut4', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* Ajax call to load the donut5 chart data */

        function loadDonut5(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'CRAN'; //put the data into variables to pass to a chart building function
            var forecast = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            donutcharting101('donut5', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* Ajax call to load the donut6 chart data */

        function loadDonut6(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'BWE HW'; //put the data into variables to pass to a chart building function
            var forecast = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            donutcharting101('donut6', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        } 
        
        /* DONUT CHART CREATER */
        function donutcharting101(container, value, title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {
                var color101; //variable for chart color assignments

                subtitle = '<p style="font-size:14px;">Complete: ' + ytdcomplete + '</p>' + '<br><p style="font-size:12px; font-style:italic;">(Forecast: ' + forecast + ')</p>'; //create the chart subtitle variable
                if (value == 101) {
                    color101 = '#00ff00'; //its green
                } else {
                    color101 = '#1e90ff'; //its dark blue
                }


                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '270',
                        width: '230'

                    },
                    title: {
                        text: title
                    },
                    subtitle: { //chart subtitle assignment and location in the chart area
                        text: subtitle,
                        align: 'center',
                        verticalAlign: 'top',
                        y: 32
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' +
                                content +
                                '<b><center>2018 Complete: ' + ytdcomplete + ' (' + value + '%)' +
                                '<br>2018 Forecast Total: ' + this.total.toFixed(0) +
                                '<br/></b></center><p style="font-size:11px;">Cmp Before NBD: ' + beforenbd + ' (' + bnbd_perccomp + '%)' +
                                '<br/>Cmp 1-90 Days of NBD: ' + within90nbd + ' (' + w90nbd_perccomp + '%)' +
                                '<br/>Cmp > 90 Days of NBD: ' + after90nbd + ' (' + a90nbd_perccomp + '%)'
                                ;
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
                            }
                        }
                    },
                    credits: { //gets rid of the highcharts.com link
                        enabled: false
                    },
                    series: [{ //assign your data to the series
                        name: title,
                        colorByPoint: true,
                        size: '100%',
                        innerSize: '50%',
                        data: [
                            { name: 'Comp Other Months', y: prevmonthscomp },
                            { name: 'Complete Last Month', y: lastmonthcomp },
                            { name: 'Complete Curr Month', y: currmonthcomp },
                            { name: 'Curr Month Remaining', y: currentmonth },
                            { name: 'Next Month Forecast', y: nextmonth },
                            { name: 'Remaining Forecast', y: forecast - beforenbd - within90nbd - after90nbd - currentmonth - nextmonth },
                        ]
                    }]
                });
            });
        }

        function loadDashboard1(data) {
            var tabulatordata = JSON.parse(data.d);
            var spark = tabulatordata[1]["POE_2018"];
            /* create Tabulator on DOM element with id "example-table" */

            //generate bar chart
            var barFormatter = function (cell, formatterParams) {
                setTimeout(function () { //give cell enough time to be added to the DOM before calling sparkline formatter
                    cell.getElement().sparkline(cell.getValue(), { width: "100%", type: "bar", barWidth: 14, disableTooltips: true });
                }, 10);
            };

            $("#example-table").tabulator({
                //height: 305, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Program", field: "PROJECT", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                            {
                                title: "After NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                                    { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Before NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                                    { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                            {
                                title: "Already Past NBD", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "NBD Upcoming", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                ],
            });

            //define some sample data
            /* var tabledata = [
                { id: 1, name: "Oli Bob", age: "12", col: "red", dob: "" },
                { id: 2, name: "Mary May", age: "1", col: "blue", dob: "14/05/1982" },
                { id: 3, name: "Christine Lobowski", age: "42", col: "green", dob: "22/05/1982" },
                { id: 4, name: "Brendon Philips", age: "125", col: "orange", dob: "01/08/1980" },
                { id: 5, name: "Margret Marmajuke", age: "16", col: "yellow", dob: "31/01/1999" },
            ];*/

            //load sample data into the table
            $("#example-table").tabulator("setData", tabulatordata);
            
        }

        function loadDashboardMARKETNSB(data) {
            var tabdataMARKETNSB = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#example-table4").tabulator({
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                    {
                        title: "After NBD", width:140,
                        columns: [
                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                        ],
                    },
                    {
                        title: "Before NBD", width: 140,
                        columns: [
                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                        ],
                    },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                    {
                        title: "Already Past NBD", width: 140,
                        columns: [
                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                        ],
                    },
                    {
                        title: "NBD Upcoming", width: 140,
                        columns: [
                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                        ],
                    },

                        ],
                    },
                ],
            });

            $("#example-table4").tabulator("setData", tabdataMARKETNSB);

        }

        function loadDashboardMARKETLTE1C(data) {
            var tabdataMARKETLTE1C = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#example-table5").tabulator({
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                            {
                                title: "After NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                                    { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Before NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                                    { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                            {
                                title: "Already Past NBD", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "NBD Upcoming", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                ],
            });

            $("#example-table5").tabulator("setData", tabdataMARKETLTE1C);

        }

        function loadDashboardMARKETLTEAC(data) {
            var tabdataMARKETLTEAC = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#example-table6").tabulator({
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                            {
                                title: "After NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                                    { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Before NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                                    { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                            {
                                title: "Already Past NBD", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "NBD Upcoming", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                ],
            });

            $("#example-table6").tabulator("setData", tabdataMARKETLTEAC);

        }

        function loadDashboardMARKET4T4R(data) {
            var tabdataMARKET4T4R = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#example-table7").tabulator({
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                            {
                                title: "After NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                                    { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Before NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                                    { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                            {
                                title: "Already Past NBD", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "NBD Upcoming", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                ],
            });

            $("#example-table7").tabulator("setData", tabdataMARKET4T4R);

        }

        function loadDashboardMARKETCRAN(data) {
            var tabdataMARKETCRAN = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#example-table8").tabulator({
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                            {
                                title: "After NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                                    { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Before NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                                    { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                            {
                                title: "Already Past NBD", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "NBD Upcoming", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                ],
            });

            $("#example-table8").tabulator("setData", tabdataMARKETCRAN);

        }
        function loadDashboardMARKETBWEHW(data) {
            var tabdataMARKETBWEHW = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#example-table9").tabulator({
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", align: "center" },
                    { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
                    {
                        title: "Last 30 Days", width: 100,
                        columns: [

                            {
                                title: "Completed", width: 100,
                                columns: [

                                    { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Year To Date", width: 240,
                        columns: [

                            {
                                title: "Completed", width: 120,
                                columns: [
                                    { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Plan", width: 120,
                                columns: [
                                    { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
                                    { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    {
                        title: "Completed Jobs", width: 240,
                        columns: [

                            {
                                title: "After NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_LATE", align: "center", width: 70 },
                                    { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "Before NBD", width: 140,
                                columns: [
                                    { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
                                    { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                    { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
                    {
                        title: "Remaining Jobs", width: 240,
                        columns: [

                            {
                                title: "Already Past NBD", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
                                ],
                            },
                            {
                                title: "NBD Upcoming", width: 140,
                                columns: [
                                    { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
                                    { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
                                ],
                            },

                        ],
                    },
                ],
            });

            $("#example-table9").tabulator("setData", tabdataMARKETBWEHW);

        }

    </script>

</asp:Content>
