<%@ Page Title="POE NTX" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cappoentx.aspx.cs" Inherits="capacity_cappoentx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script	 type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script	 type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>    

    <link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>

    <script type="text/javascript" src="haccordion.js"></script>
    <script type="text/javascript" src="ddaccordion.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>



    <style type="text/css">
        .highlightred {
            font-weight: bold;
            color: #ff3333;
        }

        .highlightgreen {
            font-weight: bold;
            color: limegreen;
        }

        .cered {
            font-weight: bold;
            color: black;
            background-color: #ff3333 !important;
        }

        .accordheader { /*header of 1st demo*/
            cursor: hand;
            cursor: pointer;
            padding: 2px 5px;
            border: 1px solid gray;
            background: #E1E1E1;
        }

        .accordcontents {
            padding-top: 2px;
            padding-bottom: 15px;
        }

        .openclass { /*class added to contents of 1st demo when they are open*/
            background: #87cefa;
        }

        .openlanguage { /*class added to contents of 2nd demo when they are open*/
            color: green;
        }

        .closedlanguage { /*class added to contents of 2nd demo when they are closed*/
            color: red;
        }

        .haccordion {
            -webkit-box-shadow: 0px 75px 35px -55px rgba(10, 30, 65, 0.6);
            -moz-box-shadow: 0px 75px 35px -55px rgba(10, 30, 65, 0.6);
            box-shadow: 0px 75px 35px -55px rgba(10, 30, 65, 0.6);
            font-family: Arial, Helvetica, sans-serif;
            border-color: #505050;
            border-style: solid;
            border-width: 0px;
            border-radius: 12px;
            margin: 0 auto;
            height: 550px;
            width: 1490px; /*1483px,1556px overall width  */
        }

            .haccordion > ul > li,
            .haccordion-title,
            .haccordion-content,
            .haccordion-separator {
                float: left;
            }

            .haccordion > ul > li {
                background-color: #d3d3d3; /*color behind everything*/
                margin-right: -1412px;
                margin-bottom: -0px;
            }

        .haccordion-select:checked ~ .haccordion-separator {
            margin-right: 1320px; /*move tab over px amount*/
            margin-bottom: 0px;
        }

        .haccordion-title,
        .haccordion-select {
            background-color: #606060; /*color of unselected tab*/
            color: #ffffff;
            width: 40px;
            height: 550px;
            font-size: 24px; /*font size of tabs*/
        }

            .haccordion-title span {
                margin-bottom: 20px;
                margin-left: 20px;
            }

            .haccordion-select:hover ~ .haccordion-title,
            .haccordion-select:checked ~ .haccordion-title {
                background-color: #87cefa; /*Background color of highlighted tab*/
            }

            .haccordion-title span {
                transform: rotate(-90deg);
                -o-transform: rotate(-90deg);
                -moz-transform: rotate(-90deg);
                -webkit-transform: rotate(-90deg);
                -ms-writing-mode: lr-bt;
                filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
                margin-left: 0px;
                line-height: 40px;
            }

        .haccordion-content {
            background-color: #d3d3d3; /*#3e3e3e*/
            color: #f5f2f0;
            height: 550px;
            width: 1412px;
            padding: 15px;
        }

        .haccordion-title,
        .haccordion-select:checked ~ .haccordion-content {
            margin-right: 2px;
            margin-bottom: 2px;
        }

        /* Do not change following properties, they aren't 
                generated automatically and are common for each slider. */
        .haccordion {
            overflow: hidden;
        }

            .haccordion > ul {
                margin: 0;
                padding: 0;
                list-style: none;
                width: 100%;
            }

                .haccordion > ul > li,
                .haccordion-title {
                    position: relative;
                }

        .haccordion-select {
            cursor: pointer;
            position: absolute;
            opacity: 0;
            top: 0;
            left: 0;
            margin: 0;
            z-index: 1;
        }

        .haccordion-title span {
            display: block;
            position: absolute;
            bottom: 0px;
            width: 100%;
            white-space: nowrap;
        }

        .haccordion-content {
            position: relative;
            overflow: auto;
        }

        .haccordion-separator {
            transition: margin 0.3s ease 0.1s;
            -o-transition: margin 0.3s ease 0.1s;
            -moz-transition: margin 0.3s ease 0.1s;
            -webkit-transition: margin 0.3s ease 0.1s;
        }
    </style>

    <script type="text/javascript">

        //Initialize first demo:
        ddaccordion.init({
            headerclass: "accordheader", //Shared CSS class name of headers group
            contentclass: "accordcontents", //Shared CSS class name of contents group
            revealtype: "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
            mouseoverdelay: 200, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
            collapseprev: true, //Collapse previous content (so only one open at any time)? true/false 
            defaultexpanded: [0], //index of content(s) open by default [index1, index2, etc]. [] denotes no content.
            onemustopen: false, //Specify whether at least one header should be open always (so never all headers closed)
            animatedefault: false, //Should contents open by default be animated into view?
            scrolltoheader: false, //scroll to header each time after it's been expanded by the user?
            persiststate: false, //persist state of opened contents within browser session?
            toggleclass: ["", "openclass"], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
            togglehtml: ["none", "", ""], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)
            animatespeed: "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
            oninit: function (expandedindices) { //custom code to run when headers have initalized
                //do nothing
            },
            onopenclose: function (header, index, state, isuseractivated) { //custom code to run whenever a header is opened or closed
                $(window).resize();  //do nothing
            }
        })
    </script>

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
                        <span class="m-nav__link-text">Central Region Market View
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
            <div class="row" id="selectorrow" style="width: 99.5%; height: 3%; margin: 0.5%;"></div>

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">POE Milestones
                        </h3>
                    </div>
                </div>
            </div>
            <div class="m-portlet__body">
                <div class="m-section">
                    <span class="m-section__heading">Market View: LTE Project Progress 2018 YTD
                    </span>

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
                </div>
            </div>

                    
    
    <script type="text/javascript">

        /* Ajax call to load the donut1_drilldown chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoentx.aspx/Getdonut1_Drilldown",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut1_Drilldown(data);
            },
            error: function (data) {
            }
        });
        
        /* DONUT DRILLDOWN CHART CREATER */
        function loadDonut1_Drilldown(data) {
            DD1 = JSON.parse(data.d);
            var DD1_series_values = [];
            var keys = Object.keys(DD1[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < DD1.length; j++) {
                    if (k == 0) {
                        a.push(DD1[j][0]);
                    } else {
                        a.push(DD1[j][keys[k]]);
                    }
                }
                DD1_series_values.push(a);
            }

            createDD1Colchart(DD1_series_values[0], 'Donut1_Drilldown', 'NSB Drilldown');

            var j = 11
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 3
            chartmodcode.addSeries({
                name: 'YTD Complete',
                id: 'YTD Complete',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);                 

            chartmodcode.redraw();
        }

        function createDD1Colchart(chartxaxis, chart_div_name, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#006600']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 10,
                    zoomType: 'xy',
                    height: '250',
                    width: '230'
                },
                exporting: {
                    enabled: true
                },
                credits: {
                    enabled: false
                },
                title: {
                    text: chart_title,
                    style: {
                        fontSize: '14px',
                        fontWeight: 'bold'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: {stacking: 'normal'},
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
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
                            fontSize: "10px"
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0">({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <div id="Donut1_Drilldown" style="visibility: visible;"></div>
    <div class="table-controls-legend"></div>
    <div class="buttoncontainer">
        <button id="download-csv" title="Download CSV File">Download CSV</button>
    </div>

    <div id="Test1_Tab"></div>
    <script>
        /* Ajax call to load the Test1_Tab chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoentx.aspx/Test1_Tab",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadTest1_Tab(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadTest1_Tab(data) {
            Test1_Tab = JSON.parse(data.d)

            $("#Test1_Tab").tabulator({
    height:205, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
        layout: "fitColumns", //fit columns to width of table (optional)
        pagination: "local",
        paginationSize: 2,
    columns:[ //Define Table Columns
        {title:"Name", field:"PRODUCT_GROUP", width:150},
        {title:"Age", field:"PERCENT_COMPLETE", align:"left", formatter:"progress"},
        {title:"Favourite Color", field:"YTD_COMPLETE"}
    ],
    rowClick:function(e, row){ //trigger an alert message when the row is clicked
        alert("Row " + row.getData().id + " Clicked!!!!");
    },
});
        //trigger download of data.csv file
        $("#download-csv").click(function () {
            $("#Test1_Tab").tabulator("download", "csv", "data.csv");
        });
        
    //define some sample data
        var tabledata = Test1_Tab; 

//load sample data into the table
            $("#Test1_Tab").tabulator(tabledata);

        </script>

//DARTH//
<html>
<head>
<!--  For character encoding.  -->
	<meta content="text/html;charset=utf-8" http-equiv="Content-Type">
	
<!--
      Rodney McDonald rx057m@att.com 
	  
v6 - move to Tabulator and JSON for BAU reports.
		Notes: 
			FirstNet NSB and Carriers - font is not changing to red on the Header < seems to work now.
			FirstNet NSB and Carriers - find a way to change only on the report 
			FirstNetNSBCarrier has an issue with hiding market info
v12 - add showing Grand Total to hide markets, clear filter	
v13 - 03/05 - Add 3 Donut processing
v14 - 03/09 - update to use custom bullet details file from json cfg; added error catches on missing bullet/bullet detail names.
v15 - 03/11 - hide elements when error detected
              revamp query string and add options via parseQuery   https://stackoverflow.com/questions/2090551/parse-query-string-in-javascript#comment16458011_2091331
			  don't show title and control divs until sure options say that it's wanted.
			  added space between email names on support button (iOS test)
			  
			---Recognized query parms--- (case sensitive)
			usage: Reporter.html?report=NSB&date=20180305 
			advusage: Reporter.html?report=NSB&date=20180305&noheader&nocontrols&avp=Carroll
			Parm					Description     *=required
			----------------------------------------------
			*report 					report name (to be validated later)
			*date					date (YYYYMMDD)
			noheaders				turn header off
			nocontrols 				turn controls off
			nocharts				turn charts off  (for NSB classifications on avp reports)
			national				national view (no markets)
			avp = avpname 			filter on AVP Name (uses Like, so case doesn't matter)
			
			Usage notes:
				avp=barone&national    Will only show AVP filter name
v16 20180426 Added 'redbg' formatter for the NSBAllocation report; added 2nd detail for hiding; CSS updated; add JSON Error message if invalid. Fixed Commas in progress
			
Production Version

	"http://zlp27950.vci.att.com/"
	"http://zlt18360.vci.att.com:8085/

Wants:
	If no ?search= defined, then redirect to a different page.
	If wrong info in ?search= then redirect to a different page.
	reduce code with functions
	move code to js file
	Identify AJAX, JQuery,Javascript,MooTools code.
	Work to one jquery library - need to use MooTools?
	Improve Button Toggle
	Move Button Toggle to empty cell in Table (?)
-->
<title>HQ RAN GNG Reporting</title>
<script type="text/javascript" src="vendor/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="vendor/jquery-ui.min.js"></script>
<script type="text/javascript" src="vendor/papaparse.min.js"></script>
<!-- <script type="text/javascript" src="../../../SheetJS/js-xlsx-master/js-xlsx-master/dist/xlsx.full.min.js"></script> -->
<script type="text/javascript" src="vendor/xlsx.full.min.js"></script>
<script type="text/javascript" src="vendor/dist/js/3.4/tabulator.min.js"></script>
<script type="text/javascript" src="vendor/d3.min.js"></script>
<script src="Donuts.js"></script>
<!-- used for moment function for date format conversion -->
	<script src="vendor/moment.js"></script>
<link href="vendor/dist/css/3.4/tabulator.min.css" rel="stylesheet"> 

<link href="Reporter.css" rel="stylesheet"> 
<!-- <link href="dist/css/bootstrap/tabulator_bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript" >

            //Parse Query String from URL
            var hasError = false;
            var noheaders = false;
            var nocharts = false;
            var nocontrols = false;
            var national = false;
            var qParms = parseQuery(document.location.search);
            console.log(document.location.search);
            console.log(qParms);

            //parses the ?search=
            //var queryString = url.substring( url.indexOf('?') + 1 );
            //var queryString = document.location.search;   //get address 
            //alert(queryString);
            //?search=NSB+20171023
            //var htmlelements = queryString.split("+");
            //var querynametemp = htmlelements[0].split("=");

            reportname = qParms.report;
            reportdate = qParms.date;

            if (typeof reportname == "undefined") {
                hasError = true;
                alert("No Report Name Given");
            };

            if (typeof reportdate == "undefined") {
                hasError = true;
                alert("No Date Given");
            };
            var datepatt = new RegExp("[2][01][0-9][0-9][01][0-9][0-3][0-9]");


            if (!datepatt.test(reportdate)) {
                alert("Date " + reportdate + " is Not Valid");
                hasError = true;
            }

            ///check options
            if (qParms.hasOwnProperty('national')) {
                national = true;
            }

            if (qParms.hasOwnProperty('noheaders')) {
                noheaders = true;
            }

            if (qParms.hasOwnProperty('nocharts')) {
                nocharts = true;
            }

            if (qParms.hasOwnProperty('nocontrols')) {
                nocontrols = true;
            }

            //avp var is being used elsewhere...
            var avpq = qParms.avp;

            //var avp_ary=["Barone","Carroll", "Cole", "Cooke","Flannigan", "Hormann", "Salek"];

            //if(!avp_ary.includes(avp)){
            //alert("AVP: " + avp +" Not Valid");
            //}

            //var reportname = querynametemp[1]
            //var reportdate = htmlelements[1];

            var bulletpath = reportdate + "/Bullets/"
            var cfgpath = reportdate + "/cfg/"


            function parseQuery(str) {
                if (typeof str != "string" || str.length == 0) return {};
                var s = str.substring(str.indexOf('?') + 1).split("&");
                var s_length = s.length;
                var bit, query = {}, first, second;
                for (var i = 0; i < s_length; i++) {
                    bit = s[i].split("=");
                    first = decodeURIComponent(bit[0]);
                    if (first.length == 0) continue;
                    second = decodeURIComponent(bit[1]);
                    if (typeof query[first] == "undefined") query[first] = second;
                    else if (query[first] instanceof Array) query[first].push(second);
                    else query[first] = [query[first], second];
                }
                return query;
            }
</script>
<div class="container bottomLeftShadow" id="header" style="display: none;">
		<h1>HQ RAN GNG Reporting</h1>
	</div>
</head>

<body>
<div> <h1 id="titleheader"> <span id="reportname"></span><span id="irft_date"></span></h1> </div>
<div class='container bottomLeftShadow' id="charts" style="display: none;">
	
	<div class="chart" id='chart1' ></div>
	<div class="chart" id='chart2' ></div>
	<div class="chart" id='chart3' ></div>
</div>
	<div class="container bottomLeftShadow table-controls" style="display: none;">
		<div class="table-controls-legend">Controls</div>
		<div class="buttoncontainer">
			<button title="Go back to Home Page" id="home">Home</button>
			<button title="Hide Market Rows" id="hide-markets">Hide Markets</button>
			<button title="Show Market Rows" id="show-markets">Show Markets</button>
			<button title="Show Detail Columns (where applicable)" id="show-details">Show Details</button>
			<button title="Hide Detail Columns (where applicable)" id="hide-details">Hide Details</button>
			<button title="Clear All Custom Header Filters" id="clear-customfilt">Clear Filters</button>
			<button title="Download table as CSV File" id="download-csv">Download CSV</button>
			<button title="Download table as JSON File" id="download-json">Download JSON</button>
			<button title="Download table as Excel File" id="download-xlsx">Download XLSX</button>
			<button title="Open iPlan in a different window" id="iplan">iPlan</button>
			<button title="Open PACE in a different window" id="pace">PACE</button>
			<button title="eMail GNG Reporting Suppoort about this report" id="support">Support</button>
			<!-- <button id="print" onclick="javascript:window.print()" target="_blank">Print</button> -->
			<!-- <button id="print" onclick="javascript:printDiv('report')" target="_blank">Print</button> -->
		</div>
	</div>

	<div class="container" id="report">
		
		<div  class ="bottomLeftShadow" id="example-table">
		<div class="spinner">
			<h3>Loading...</h3>
			<div class="rect1"></div>
			<div class="rect2"></div>
			<div class="rect3"></div>
			<div class="rect4"></div>
			<div class="rect5"></div>
		</div>
		</div>
		<div class="bottomLeftShadow" id="bullets"></div>
	</div>
<script>
    Tabulator.extendExtension("format", "formatters", {
        detailslink: function (cell, formatterParms) {
            var myRow = cell.getRow();
            var myCol = cell.getColumn();
            //console.log("InDetailsLink");
            //console.log(myRow);
            //console.log(myCol);
            var myheader = myCol.column.field;
            //console.log(myheader);
            var mkt = myRow.row.data.MARKET_RPA; //.MARKET_RPA.getValue();
            var avp = myRow.row.data.AVP;
            //console.log ("AVP: " + avp);
            //console.log ("MKT: " + mkt);
            //assumes YYYY_Issued to get header year...
            yr = left(myheader, 4);
            //console.log(mkt);

            num = cell.getValue();
            var tmpnum = formatNum(num);
            //console.log(tmpnum);

            var mylink2 = "";

            if (tmpnum != "") {
                if (mkt == "Subtotal") {
                    //skip subtotal (AVP)
                    mylink2 = tmpnum;
                }
                else if (mkt == "") {
                    //skip grandtotal (All)
                    mylink2 = tmpnum;
                }
                else {
                    mylink2 = "<a href=\"Details.html?search=" +
                        reportname + "+" + reportdate + "+" + avp + "+" + mkt + "+" + yr + "\">" +
                        tmpnum + "</a>";

                }
                //console.log(mylink2);
            }

            return (mylink2);
        },
        iplanlink: function (cell, formatterParams) {
            // iPlan
            var mylink = "<a href=\"http://iplan.netops.att.com/iplan/job_detail_url.htm?jobNumber=" +
                cell.getValue() +
                "&ip_src=job_search.htm\"" +
                ">" + cell.getValue() +
                "</a>";
        },
        numberfmt: function (cell, formatterParams) {
            //format numbers with commas or red for < 0, or blank if 0
            var num = cell.getValue();
            tempnum = formatNum(num);
            return (tempnum);
        },
        redbg: function (cell, formatterParams) {
            var num = cell.getValue();
            tempnum = formatNum(num);
            if (tempnum == "") {
                return (tempnum)
            }
            else {
                newbgcolor = "#FFC7CE"  //rgb 255,199,206
                return ("<div style='background-color:" + newbgcolor + ";'>" + tempnum + "</div>");
            }
        },
        //progress bar
        progressmaxpp: function (cell, formatterParams) { //progress bar
            var value = this.sanitizeHTML(cell.getValue()) || 0,
                element = cell.getElement(),
                max = formatterParams && formatterParams.max ? formatterParams.max : 100,
                min = formatterParams && formatterParams.min ? formatterParams.min : 0,
                percent, percentValue, color, legend, legendColor;

            if (formatterParams.labelField) {
                data = cell.getData();
                max = data[formatterParams.labelField];
                //console.log(formatterParams);
                //console.log(max);
            }

            //make sure value is in range
            percentValue = parseFloat(value) <= max ? parseFloat(value) : max;
            percentValue = parseFloat(percentValue) >= min ? parseFloat(percentValue) : min;

            //workout percentage
            percent = (max - min) / 100;
            percentValue = 100 - Math.round((percentValue - min) / percent);

            //set bar color
            switch (typeof formatterParams.color) {
                case "string":
                    color = formatterParams.color;
                    break;
                case "function":
                    color = formatterParams.color(value);
                    break;
                case "object":
                    if (Array.isArray(formatterParams.color)) {
                        var unit = 100 / formatterParams.color.length;
                        var index = Math.floor(percentValue / unit);

                        index = Math.min(index, formatterParams.color.length - 1);
                        color = formatterParams.color[formatterParams.color.length - 1 - index];
                        break;
                    }
                default:
                    color = "#2DC214";
            }

            //generate legend
            switch (typeof formatterParams.legend) {
                case "string":
                    legend = formatterParams.legend;
                    break;
                case "function":
                    legend = formatterParams.legend(value);
                    break;
                case "boolean":
                    legend = value;
                    break;
                default:
                    legend = false;
            }

            //set legend color
            switch (typeof formatterParams.legendColor) {
                case "string":
                    legendColor = formatterParams.legendColor;
                    break;
                case "function":
                    legendColor = formatterParams.legendColor(value);
                    break;
                case "object":
                    if (Array.isArray(formatterParams.legendColor)) {
                        var unit = 100 / formatterParams.legendColor.length;
                        var index = Math.floor(percentValue / unit);

                        index = Math.min(index, formatterParams.legendColor.length - 1);
                        legendColor = formatterParams.legendColor[formatterParams.legendColor.length - 1 - index];
                        break;
                    }
                default:
                    legendColor = "#000";
            }

            element.css({
                "min-width": "30px",
                "position": "relative",
            });

            element.attr("aria-label", percentValue);

            return "<div style='position:absolute; top:8px; bottom:8px; left:4px; right:" + percentValue + "%; margin-right:4px; background-color:" + color + "; display:inline-block;' data-max='" + max + "' data-min='" + min + "'></div>" + (legend ? "<div style='position:absolute; top:4px; left:0; text-align:center; width:100%; color:" + legendColor + ";'>" + formatNum(legend) + "</div>" : "");
        }
    });

    //var report ="NSB";
    //var tabledata;
    var report_name;
    var mycolumns;
    var inputfile;
    var bullet_file;
    var bullet_id;
    var bullet_file_details;
    var bullet_id_details;
    var hasChart;

    //var inputfile  = "data/" + reportdate + "/CPR_" + reportdate + "_v17_NSB.csv";
    console.log("Config Path for JSON file:");
    console.log(cfgpath + "ReportCFG.json");

    if (hasError) {
        $(".spinner").hide();
        $("#irft_date").hide();
    }



    $.getJSON(cfgpath + "ReportCFG.json", function (json) {
        console.log("______________________________");
        console.log("ReportName: " + reportname);
        if (json.hasOwnProperty(reportname)) {
            report_name = json[reportname].title;
            header_color = json[reportname].headerColor;
            header_font_color = json[reportname].headerFontColor;
            bullet_file = json[reportname].bulletFile;
            bullet_id = json[reportname].bulletID;
            bullet_file_details = json[reportname].bulletFileDetails;
            bullet_id_details = json[reportname].bulletIDDetails;
            console.log("Bullet File: " + bullet_file);
            console.log("Bullet ID:" + bullet_id);
            console.log("Bullet Details File: " + bullet_file_details);
            console.log("Bullet ID Details:" + bullet_id_details);
            hasChart = json[reportname].chart;
            chartFile = reportdate + "/Chart" + json[reportname].chartcsvprefix + reportdate + json[reportname].chartcsvsuffix;
            console.log("Chart: " + hasChart);
            console.log("Chart File: " + chartFile);


            //for (var i in bullet_id_details) {
            //	console.log(bullet_id_details[i]);
            //}		

            if (jQuery.isEmptyObject(header_font_color)) {
                //header_font_color = "black";
            }
            else {
                header_font_color = json[reportname].headerFontColor;
                //console.log(header_font_color);
            }
            mycolumns = json[reportname].columns;
            //console.log(json[reportname].sumcsvprefix);
            //console.log(json[reportname].sumcsvsuffix);
            inputfile = reportdate + "/Summary" + json[reportname].sumcsvprefix + reportdate + json[reportname].sumcsvsuffix;

            console.log(report_name);
            console.log(inputfile);
            $("#reportname").html(report_name);
            //console.log(json.NSB.columns);
            //mycolumns = json.NSB.columns;
            //report_name = json.NSB.title;
            //console.log(mycolumns);

            //this is for the bullets
            //var bullhtml = bullet_file; //"bullets.html";
            ///var bullettype = bullet_id; "#bullets_nsbplan";
            console.log("Bullet File");
            console.log(bulletpath + bullet_file);



            if (typeof (bullet_file) === 'undefined') {
                //hack to not show bullet if file is not defined...
            }
            else {
                //bullet_file_details
                //"bulletsdetail.html"
                $("#bullets").load(bulletpath + bullet_file + " " + bullet_id, function (responseText, textStatus, req) {
                    console.log(bulletpath + bullet_file_details);
                    console.log(textStatus);
                    if (textStatus == "error") {
                        alert("Error: Bullet File: " + bullet_file + " Not Defined for report: " + report_name);
                    }

                    for (var i in bullet_id_details) {
                        console.log(bullet_id_details[i]);
                        $(bullet_id_details[i]).load(bulletpath + bullet_file_details + " " + bullet_id_details[i], function (responseText, textStatus, req) {
                            if (textStatus == "error") {
                                alert("Error: Bullet Details File" + bullet_file_details + " Not Found for report: " + report_name);
                            }
                        });
                    }
                });
                $("#bullets").fadeIn();
            }
            // Call functions
            if (hasChart) {
                if (!nocharts) {
                    $("#charts").show();
                    readChartData(chartFile);
                }
            }
            parseData(inputfile, doStuff);
        }
        else {
            $(".spinner").hide();
            $("#irft_date").hide();
            $("#example-table").hide();
            $("#bullets").hide();

            //restate if erportname is not avaiable
            if (typeof (value) === 'undefined') {
                alert("Report Name or Date not correct or specifed in URL.");
                hasError = true;
                $(".spinner").hide();
            }
            else {
                alert("Report " + reportname + " not defined");
            }
        }
    }).fail(function () {
        alert("JSON Query Failed for Reports - check JSON structure or file availablity");
        console.log("JSON Query Failed for Reports - check JSON structure or file availablity");
    });;

    function parseData(url, callBack) {
        Papa.parse(url, {
            download: true,
            header: true,
            dynamicTyping: true,
            skipEmptyLines: true,
            before: function (url, inputElem) {
                //console.log("Before");
                //console.log(file);
            },
            error: function (err, file, inputElem, reason) {
                //console.log(inputElem);
                //console.log(reason);
                $(".spinner").hide();
                alert("Parsing Error: Check source file name with expected: \n\n" + url);
                hasError = true;
                $(".spinner").hide();
            },
            complete: function (results) {
                //console.log(results.data);
                callBack(results.data);
            }
        });
    }
    function doStuff(tabledata) {
        //console.log(tabledata);
        //create Tabulator on DOM element with id "example-table"
        $("#example-table").tabulator({
            height: 600, // set height of table, this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
            columnVertAlign: "bottom", //align header contents to bottom of cell
            rowFormatter: subTotalCheck,
            tooltipsHeader: true,
            columns: mycolumns
        });

        ///Tabulator		
        //load sample data into the table

        $("#example-table").tabulator("setData", tabledata);
        $(".spinner").hide();
        $('.tabulator .tabulator-header .tabulator-col').css({
            'background-color': header_color,
            'color': header_font_color

        });

        //filterout markets 
        if (national) {
            $("#example-table").tabulator("setFilter", mktgtFilter);
            //mktgtFilter
            //hide/show buttons
            $("#hide-markets").hide();
            $("#show-markets").show();
        };


        if (typeof avpq == "string") {
            $("#example-table").tabulator("setFilter", "AVP", "like", avpq);
        }

        //For FirstNet NSB and Carriers only
        $(".tabulator-col-title:contains('FNP Negotiated Funding Approved')").css({
            'background-color': 'orange',
            'color': 'white'
            // 'font-size' : '16px',
            // 'font-weight' : 'bold'
        });
        $(".tabulator-col-title:contains('Market Response Dir Approved Counts')").css({
            'background-color': 'Green',
            'color': 'white'
            // 'font-size' : '16px',
            // 'font-weight' : 'bold'
        });
        $(".redFont").css({
            //'color': 'rgb(182,63,0)'
            'color': 'rgb(255,0,0)'
        });
    }
    //trigger download of data.csv file
    $("#download-csv").click(function () {
        $("#example-table").tabulator("download", "csv", "GNGReporting_" + reportname + "_" + reportdate + ".csv");
    });

    //trigger download of data.json file
    $("#download-json").click(function () {
        $("#example-table").tabulator("download", "json", "GNGReporting_" + reportname + "_" + reportdate + ".json");
    });

    //trigger download of data.xlsx file
    $("#download-xlsx").click(function () {
        //$("#example-table-download").tabulator("download", "xlsx", "data.xlsx");
        $("#example-table").tabulator("download", "xlsx", "GNGReporting_" + reportname + "_" + reportdate + ".xlsx");
    });


    $("#hide-details").click(function () {
        //$('.tabulator-col:contains("2016Q4 AC")').hide();
        $(".breakout").hide();   //2017 Issued RANFT jobs
        $(".nsballochidedetail").hide()   //2019 NSB Allocations 
        $("#hide-details").hide();
        $("#show-details").show();
    });


    $("#clear-customfilt").click(function () {
        $("#example-table").tabulator("clearHeaderFilter");
    });

    $("#show-details").click(function () {
        //$('.tabulator-col:contains("2016Q4 AC")').show();
        $(".breakout").show(); 				//2017 Issued RANFT jobs
        $(".nsballochidedetail").show()   //2019 NSB Allocations 
        $("#hide-details").show();
        $("#show-details").hide();
    });

    $("#home").click(function () {
        window.location.href = "http://zlp27950.vci.att.com/";
    });

    $("#iplan").click(function () {
        window.open("http://iplan.netops.att.com/iplan/login.htm");
    });

    $("#pace").click(function () {
        window.open("http://ce.lno.att.com/p/#/ProjectQueryTool/index.cfm");
    });

    $("#header").click(function () {
        window.location.href = "http://zlp27950.vci.att.com/";
    });

    $("#support").click(function () {
        //alert("Sending Email");
        var email = 'rx057m@att.com; tg9249@att.com';
        var subject = 'GNG Reporting: ' + reportname + " for " + reportdate;
        var emailBody = 'Rodney and Tara, I have a question regarding this report...%0D%0A%0D%0A%0D%0A%0D%0A%0D%0AThanks!';
        window.location = 'mailto:' + email + '?subject=' + subject + '&body=' + emailBody;
    });
    //Hide Markets
    $("#hide-markets").click(function () {
        // $("#example-table").tabulator("download", "json", "data.json");
        //$("#example-table").tabulator("setFilter","MARKET_RPA", "in", ["Subtotal",""]);
        $("#example-table").tabulator("setFilter", mktgtFilter);
        //mktgtFilter
        //hide/show buttons
        $("#hide-markets").hide();
        $("#show-markets").show();
    });


    $("#show-markets").click(function () {
        // $("#example-table").tabulator("download", "json", "data.json");
        //$("#example-table").tabulator("removeFilter", "MARKET_RPA", "=", "Subtotal");
        //$("#example-table").tabulator("removeFilter", "AVP", "=", "Grand Total");
        //var filters = $("#example-table").tabulator("getFilters");
        //console.log(filters);
        //$("#example-table").tabulator("removeFilter","MARKET_RPA", "in", ["Subtotal",""]);
        $("#example-table").tabulator("removeFilter", mktgtFilter);

        //hide/show buttons
        $("#hide-markets").show();
        $("#show-markets").hide();
    });




</script>
<script>
    $(document).ready(function () {

        if (!noheaders) {
            $('#header').show();
        }
        if (!nocontrols) {
            $('.table-controls').show();
        }

        //Default Viewing = Show Markets - Show Hide Button
        $("#show-markets").hide();
        $("#hide-markets").show();

        //Default Viewing = Show Details - Show Hide Button
        $("#show-details").hide();
        $("#hide-details").show();

        //$("#reportname").html(report_name);

        // this updates the date in to a nicer format in the title.
        //$("#irft_date").html(" for " + moment(reportdate,"YYYYMMDD").format("MMMM Do, YYYY (ddd)"))
        var date_daynamemonth = moment(reportdate, "YYYYMMDD").format("dddd, MMMM ");
        var date_dayord = moment(reportdate, "YYYYMMDD").format("Do");
        //console.log(date_dayord);
        var date_ord = right(date_dayord, 2);
        var date_day = date_dayord.replace(date_ord, "");
        //var date_dayord = right(moment(reportdate,"YYYYMMDD").format("Do"),2);
        var date_year = ", " + moment(reportdate, "YYYYMMDD").format("YYYY");
        //$("#irft_date").html(" as of " + moment(reportdate,"YYYYMMDD").format("dddd, MMMM Do, YYYY"))
        $("#irft_date").html(" as of " + date_daynamemonth + date_day + "<sup>" + date_ord + "</sup>" + date_year);
        //$('.tabulator-row:not(contains("Subtotal"))').css('background-color', 'blue');

    });

    //Test JSON objects
    function isEmpty(obj) {
        //returns true if empty
        for (var x in obj) { return false; }
        return true;
    }

    // Basic Left/Right string functions
    function right(str, chr) {
        return newstr = str.substr(str.length - chr, str.length)
    }

    function left(str, chr) {
        return newstr = str.substr(0, chr)
    }

    // For Tabulator add commas or make 0's blanks, and < 0  numbers red
    function formatNum(n) {
        var tnum = "";
        if (n == "0") {
            tnum = "";
        }
        else if (n == "") {
            tnum = "";
        }
        else if (isNaN(n)) {
            tnum = "";
        }
        else if (n < 0) {
            tnum = "<span style='color:red; font-weight:bold;'>" + n + "</span>";
        }
        else {
            tnum = Number(n).toLocaleString();
        }
        return (tnum);
    }

    function mktgtFilter(data) {
        // special filter for SubTotal and Grand Total
        //data - the data for the row being filtered
        //filterParams - params object passed to the filter
        return data.AVP == "Grand Total" || data.MARKET_RPA == "Subtotal"; //must return a boolean, true if it passes the filter.
    }

    //For Tabulator - check to see if subtotal exist and add a class for CSS to make the AVP's dark.
    function subTotalCheck(r) {
        // row - row component for the row
        // data - data object for row
        var data = r.getData();

        //check on data object for the "Subtitle" word
        if (data.hasOwnProperty('MARKET_RPA')) {
            if (data.MARKET_RPA == "Subtotal") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }
        else if (data.hasOwnProperty('MARKET')) {
            if (data.MARKET == "Subtotal") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }
        else if (data.hasOwnProperty('market')) {
            if (data.Market == "Subtotal") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }
        else if (data.hasOwnProperty('Market')) {
            if (data.Market == "Subtotal") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }
        else if (data.hasOwnProperty('Market_RPA')) {
            if (data.Market_RPA == "Subtotal") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }

        if (data.hasOwnProperty('Programs')) {
            if (data.Market_RPA == "Subtotal") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }

        if (data.hasOwnProperty('AVP')) {
            if (data.AVP == "Grand Total") {
                //add style
                r.getElement().addClass("subtotal");
            }
        }
    }


</script>
<!--</div>-->
</body>
</html>



</asp:Content>

