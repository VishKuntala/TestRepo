<%@ Page Title="POE GMW" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cappoegmw.aspx.cs" Inherits="capacity_cappoegmw" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

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

        .box1 { width:20px; height:20px; }
        .backdarkgreen { background:#003300; display:inline-block; }
        .backmedgreen { background:#008000; display:inline-block; }
        .backlightgreen { background:#00cc00; display:inline-block; }        
        .backdarkblue { background:#0066cc; display:inline-block; }
        .backmedblue { background:#4da6ff; display:inline-block; }
        .backlightblue { background:#87cefa; display:inline-block; }
        .cata {display:inline-block; }
        #donutrowlegend {text-align:center; }
        #donutrowlegend2 {text-align:center; }
        #donutrowlegend3 {text-align:center; }
        #donutrowlegend4 {text-align:center; }

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
                    <span class="m-section__heading">Central Region: LTE Project Progress 2018 YTD
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
                    
                    <div class="row" id="donutdrilldown2row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="dd11col" style="height: 100%;">                            
                            <div id="Donut11_Drilldown" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="dd2col" style="height: 100%;">
                            <div id="Donut2_Drilldown" style="visibility: visible;"></div>
                        </div>
                        
                        <div class="col-md-2" id="dd4col" style="height: 100%;">
                            <div id="Donut4_Drilldown" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="dd5col" style="height: 100%;">
                            <div id="Donut5_Drilldown" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="dd6col" style="height: 100%;">
                            <div id="Donut6_Drilldown" style="visibility: visible;"></div>
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
                    <span class="m-section__heading">Project Milestones & Drilldown</span>
                    
                    <h5 id="header1" class="accordheader">Central Region New Site Builds</h5>
                    <div class="accordcontents">
                        <div id="hc1" class="haccordion">
                            <ul>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>NSB Milestone Drilldown</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <table id="tabPOE2018NSBDRILL" class="table table-striped" style="width: 100%; height: 100%; font-size: 10px; text-align: center; color:black;" >
                                                <thead>
                                                    <tr>
                                                        <th bgcolor="#87CEFA">USID</th>
                                                        <th bgcolor="#87CEFA">PACE Number</th>
                                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                                        <th bgcolor="#87CEFA">Market</th>
                                                        <th bgcolor="#87CEFA">Product Group</th>
                                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                                        <th bgcolor="#87CEFA">Construction Start (CI025)</th>
                                                        <th bgcolor="#87CEFA">Tower Top Complete (CI020)</th>
                                                        <th bgcolor="#87CEFA">Construction Complete (CI050)</th>
                                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>NSB Milestone & Breakdown Summary</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="row" id="donutdrilldownrow2" style="height: 100%; width: 100%; overflow: auto; display: flex;">
                                                <div class="col-md-6" id="cen2018nsbmile1col" style="height: 100%;">
                                                    <div id="CEN2018NSBMILE" style="visibility: visible;"></div>
                                                </div>
                                                <div class="col-md-4" id="dd1col" style="height: 100%;">                            
                                                    <div id="Donut1_Drilldown" style="visibility: visible;"></div>
                                                </div>
                                        </div>                                         
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>NSB Forecast vs. Actual vs. NBD Chart</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CENNBD2018POENSB" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" checked />
                                    <div class="haccordion-title">
                                        <span>NSB Forecast vs. Plan with NBD</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <h5 align="center">2018 POE - Monthly</h5>
                                            <table id="tabPOE2018NSBryg" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <h5 align="center">
                                                <br>
                                                2018 POE - Cumulative</h5>
                                            <table id="tabPOE2018NSBrygCUMU" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">

                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h5 class="accordheader">Central Region LTE 1C</h5>
                    <div class="accordcontents">
                        <div id="hc2" class="haccordion">
                            <ul>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE 1C Milestone Drilldown</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <table id="tabPOE2018LTE1CDRILL" class="table table-striped" style="width: 100%; height: 100%; font-size: 10px; text-align: center; color:black;" >
                                                <thead>
                                                    <tr>
                                                        <th bgcolor="#87CEFA">USID</th>
                                                        <th bgcolor="#87CEFA">PACE Number</th>
                                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                                        <th bgcolor="#87CEFA">Market</th>
                                                        <th bgcolor="#87CEFA">Product Group</th>
                                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                                        <th bgcolor="#87CEFA">Construction Start (CI025)</th>
                                                        <th bgcolor="#87CEFA">Tower Top Complete (CI020)</th>
                                                        <th bgcolor="#87CEFA">Construction Complete (CI050)</th>
                                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE 1C Milestone Summary</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CEN2018LTE1CMILE" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE 1C Forecast vs. Actual vs. NBD Chart</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CENNBD2018POELTE1C" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE 1C Forecast vs. Plan with NBD</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <h5 align="center">2018 POE - Monthly</h5>
                                            <table id="tabPOE2018LTE1Cryg" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <h5 align="center">
                                                <br>
                                                2018 POE - Cumulative</h5>
                                            <table id="tabPOE2018LTE1CrygCUMU" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">

                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <h5 class="accordheader">Central Region LTE AC</h5>
                    <div class="accordcontents">
                        <div id="hc3" class="haccordion">
                            <ul>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE AC Milestone Drilldown</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <table id="tabPOE2018LTEACDRILL" class="table table-striped" style="width: 100%; height: 100%; font-size: 10px; text-align: center; color:black;" >
                                                <thead>
                                                    <tr>
                                                        <th bgcolor="#87CEFA">USID</th>
                                                        <th bgcolor="#87CEFA">PACE Number</th>
                                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                                        <th bgcolor="#87CEFA">Market</th>
                                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE AC Milestone & Breakdown Summary</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="row" id="donutdrilldownrow" style="height: 100%; width: 100%; overflow: auto; display: flex;">
                                                <div class="col-md-6" id="cen2018lteacmile1col" style="height: 100%;">
                                                    <div id="CEN2018LTEACMILE" style="visibility: visible;"></div>
                                                </div>
                                                <div class="col-md-4" id="dd3col" style="height: 100%;">                            
                                                    <div id="Donut3_Drilldown" style="visibility: visible;"></div>
                                                </div>
                                        </div>                                         
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE AC Forecast vs. Actual vs. NBD Chart</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CENNBD2018POELTEAC" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>LTE AC Forecast vs. Plan with NBD</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <h5 align="center">2018 POE - Monthly</h5>
                                            <table id="tabPOE2018LTEACryg" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <h5 align="center">
                                                <br>
                                                2018 POE - Cumulative</h5>
                                            <table id="tabPOE2018LTEACrygCUMU" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">

                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <h5 class="accordheader">Central Region 4T4R</h5>
                    <div class="accordcontents">
                        <div id="hc4" class="haccordion">
                            <ul>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>4T4R Milestone Drilldown</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <table id="tabPOE20184T4RDRILL" class="table table-striped" style="width: 100%; height: 100%; font-size: 10px; text-align: center; color:black;" >
                                                <thead>
                                                    <tr>
                                                        <th bgcolor="#87CEFA">USID</th>
                                                        <th bgcolor="#87CEFA">PACE Number</th>
                                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                                        <th bgcolor="#87CEFA">Market</th>                                                        
                                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                                        <th bgcolor="#87CEFA">Construction Start (CI025)</th>
                                                        <th bgcolor="#87CEFA">Tower Top Complete (CI020)</th>
                                                        <th bgcolor="#87CEFA">Construction Complete (CI050)</th>
                                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>4T4R Milestone Summary</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CEN20184T4RMILE" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>4T4R Forecast vs. Actual vs. NBD Chart</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CENNBD2018POE4T4R" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>4T4R Forecast vs. Plan vs. NBD</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <h5 align="center">2018 POE - Monthly</h5>
                                            <table id="tabPOE20184T4Rryg" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <h5 align="center">
                                                <br>
                                                2018 POE - Cumulative</h5>
                                            <table id="tabPOE20184T4RrygCUMU" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">

                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <h5 class="accordheader">Central Region CRAN</h5>
                    <div class="accordcontents">
                        <div id="hc5" class="haccordion">
                            <ul>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>CRAN Milestone Drilldown</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <table id="tabPOE2018CRANDRILL" class="table table-striped" style="width: 100%; height: 100%; font-size: 10px; text-align: center; color:black;" >
                                                <thead>
                                                    <tr>
                                                        <th bgcolor="#87CEFA">USID</th>
                                                        <th bgcolor="#87CEFA">PACE Number</th>
                                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                                        <th bgcolor="#87CEFA">Market</th>                                                        
                                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                                        <th bgcolor="#87CEFA">Construction Start (CI025)</th>
                                                        <th bgcolor="#87CEFA">Tower Top Complete (CI020)</th>
                                                        <th bgcolor="#87CEFA">Construction Complete (CI050)</th>
                                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>CRAN Milestone Summary</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CEN2018CRANMILE" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>CRAN Forecast vs. Actual vs. NBD Chart</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CENNBD2018POECRAN" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>CRAN Forecast vs. Plan with NBD</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <h5 align="center">2018 POE - Monthly</h5>
                                            <table id="tabPOE2018CRANryg" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <h5 align="center">
                                                <br>
                                                2018 POE - Cumulative</h5>
                                            <table id="tabPOE2018CRANrygCUMU" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">

                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <h5 class="accordheader">Central Region BWE HW</h5>
                    <div class="accordcontents">
                        <div id="hc6" class="haccordion">
                            <ul>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>BWE HW Milestone Drilldown</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <table id="tabPOE2018BWEHWDRILL" class="table table-striped" style="width: 100%; height: 100%; font-size: 10px; text-align: center; color:black;" >
                                                <thead>
                                                    <tr>
                                                        <th bgcolor="#87CEFA">USID</th>
                                                        <th bgcolor="#87CEFA">PACE Number</th>
                                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                                        <th bgcolor="#87CEFA">Market</th>                                                        
                                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                                        <th bgcolor="#87CEFA">Construction Start (CI025)</th>
                                                        <th bgcolor="#87CEFA">Tower Top Complete (CI020)</th>
                                                        <th bgcolor="#87CEFA">Construction Complete (CI050)</th>
                                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>BWE HW Milestone Summary</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CEN2018BWEHWMILE" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>BWE HW Forecast vs. Actual vs. NBD Chart</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div id="CENNBD2018POEBWEHW" style="visibility: visible;"></div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                                <li>
                                    <input type="radio" name="select" class="haccordion-select" />
                                    <div class="haccordion-title">
                                        <span>BWE HW Forecast vs. Plan with NBD</span>
                                    </div>
                                    <div class="haccordion-content">
                                        <div class="m-section__content" style="height: 400px; width: 1280px;">
                                            <h5 align="center">2018 POE - Monthly</h5>
                                            <table id="tabPOE2018BWEHWryg" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                            <h5 align="center">
                                                <br>
                                                2018 POE - Cumulative</h5>
                                            <table id="tabPOE2018BWEHWrygCUMU" class="table table-striped table-bordered" style="width: 100%; height: 100%; font-size: 12px; text-align: center;">

                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th bgcolor="#87CEFA"><-2017</th>
                                                        <th bgcolor="#87CEFA">Jan</th>
                                                        <th bgcolor="#87CEFA">Feb</th>
                                                        <th bgcolor="#87CEFA">Mar</th>
                                                        <th bgcolor="#87CEFA">Apr</th>
                                                        <th bgcolor="#87CEFA">May</th>
                                                        <th bgcolor="#87CEFA">Jun</th>
                                                        <th bgcolor="#87CEFA">Jul</th>
                                                        <th bgcolor="#87CEFA">Aug</th>
                                                        <th bgcolor="#87CEFA">Sep</th>
                                                        <th bgcolor="#87CEFA">Oct</th>
                                                        <th bgcolor="#87CEFA">Nov</th>
                                                        <th bgcolor="#87CEFA">Dec</th>
                                                        <th bgcolor="#87CEFA">2019-></th>
                                                        <th bgcolor="#87CEFA">Total</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="haccordion-separator"></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">

            <div class="m-portlet__body">
                <!--begin::Section-->
                <div class="m-section">
                    <span class="m-section__heading">Central Region: 2018 POE NSB - Market Views
                    </span>
                    
                    <div class="row" id="donutrow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut11col" style="height: 100%;">
                            <div id="donut11" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut12col" style="height: 100%;">
                            <div id="donut12" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut13col" style="height: 100%;">
                            <div id="donut13" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut14col" style="height: 100%;">
                            <div id="donut14" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut15col" style="height: 100%;">
                            <div id="donut15" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut16col" style="height: 100%;">
                            <div id="donut16" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <div class="row" id="breakdownrow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="NSB_breakdown_AROKcol" style="height: 100%;">
                            <div id="NSB_breakdown_AROK" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NSB_breakdown_ILWIcol" style="height: 100%;">
                            <div id="NSB_breakdown_ILWI" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NSB_breakdown_MOKScol" style="height: 100%;">
                            <div id="NSB_breakdown_MOKS" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NSB_breakdown_MNPcol" style="height: 100%;">
                            <div id="NSB_breakdown_MNP" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NSB_breakdown_NTXcol" style="height: 100%;">
                            <div id="NSB_breakdown_NTX" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NSB_breakdown_STXcol" style="height: 100%;">
                            <div id="NSB_breakdown_STX" style="visibility: visible;"></div>
                        </div>
                    </div>

                    <div id="donutrowlegend2" >
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
                    <div class="row" id="milestonerow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="AROK2018NSBMILECOL" style="height: 100%;">
                            <div id="AROK2018NSBMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="ILWI2018NSBMILECOL" style="height: 100%;">
                            <div id="ILWI2018NSBMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="MOKS2018NSBMILECOL" style="height: 100%;">
                            <div id="MOKS2018NSBMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="MNP2018NSBMILECOL" style="height: 100%;">
                            <div id="MNP2018NSBMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NTX2018NSBMILECOL" style="height: 100%;">
                            <div id="NTX2018NSBMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="STX2018NSBMILECOL" style="height: 100%;">
                            <div id="STX2018NSBMILE" style="visibility: visible;"></div>
                        </div>
                    </div>
                   
                    <div class="m-section">
                        <div class="m-section__content" style="height: 400px;">
                            <div id="CENFOR2018POENSB" style="height: 430px;" class="row">
                            </div>
                        </div>
                    </div>

                    <div class="m-section__content" style="height: 350px;">
                        <table id="tabPOE2018NSB" class="table table-striped table-bordered table-hover text-center" width="100%">                            
                            <thead>
                                <tr>
                                    <th bgcolor="#87CEFA">2018 NSB</th>
                                    <th bgcolor="#87CEFA">2018 POE</th>
                                    <th bgcolor="#87CEFA">Jan Actual</th>
                                    <th bgcolor="#87CEFA">Feb Actual</th>
                                    <th bgcolor="#87CEFA">Mar Actual</th>
                                    <th bgcolor="#87CEFA">Apr Actual</th>
                                    <th bgcolor="#87CEFA">May Actual</th>
                                    <th bgcolor="#87CEFA">Jun Actual</th>
                                    <th bgcolor="#87CEFA">Jul Actual</th>
                                    <th bgcolor="#87CEFA">Aug Actual</th>
                                    <th bgcolor="#87CEFA">Sep Actual</th>
                                    <th bgcolor="#87CEFA">Oct Actual</th>
                                    <th bgcolor="#87CEFA">Nov Actual</th>
                                    <th bgcolor="#87CEFA">Dec Actual</th>
                                    <th bgcolor="#87CEFA">YTD Complete</th>
                                    <th bgcolor="#87CEFA">% Complete</th>
                                </tr>
                            </thead>
                        </table>
                    </div>

                    
                    <div class="row" id="donutdrilldownrow2000" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="dd1000col" style="height: 100%;">                            
                            <div id="Donut1000_Drilldown" style="visibility: visible;"></div>
                        </div>
                    </div>                                        
                </div>
            </div>
         </div>
    </div>


    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">
            <div class="m-portlet__body">

                <div class="m-section">
                    <span class="m-section__heading">Central Region: 2018 POE LTE 1C - Market Views
                    </span>

                <div class="row" id="donutrow3" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut21col" style="height: 100%;">
                            <div id="donut21" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut22col" style="height: 100%;">
                            <div id="donut22" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut23col" style="height: 100%;">
                            <div id="donut23" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut24col" style="height: 100%;">
                            <div id="donut24" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut25col" style="height: 100%;">
                            <div id="donut25" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut26col" style="height: 100%;">
                            <div id="donut26" style="visibility: visible;"></div>
                        </div>
                    </div>
                <div id="donutrowlegend3" >
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
                    <div class="row" id="milestonerow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="AROK2018LTE1CMILECOL" style="height: 100%;">
                            <div id="AROK2018LTE1CMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="ILWI2018LTE1CMILECOL" style="height: 100%;">
                            <div id="ILWI2018LTE1CMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="MOKS2018LTE1CMILECOL" style="height: 100%;">
                            <div id="MOKS2018LTE1CMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="MNP2018LTE1CMILECOL" style="height: 100%;">
                            <div id="MNP2018LTE1CMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NTX2018LTE1CMILECOL" style="height: 100%;">
                            <div id="NTX2018LTE1CMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="STX2018LTE1CMILECOL" style="height: 100%;">
                            <div id="STX2018LTE1CMILE" style="visibility: visible;"></div>
                        </div>
                    </div>

                <div class="m-section">
                    <div class="m-section__content" style="height: 400px;">
                        <div id="CENFOR2018POELTE1C" style="height: 430px;" class="row">
                        </div>
                    </div>
                </div>

                
                    <div class="m-section__content" style="height: 350px;">
                        <table id="tabPOE2018LTE1C" class="table table-striped table-bordered table-hover text-center" width="100%">
                            <thead>
                                <tr>
                                    <th bgcolor="#87CEFA">2018 LTE 1C</th>
                                    <th bgcolor="#87CEFA">2018 POE</th>
                                    <th bgcolor="#87CEFA">Jan Actual</th>
                                    <th bgcolor="#87CEFA">Feb Actual</th>
                                    <th bgcolor="#87CEFA">Mar Actual</th>
                                    <th bgcolor="#87CEFA">Apr Actual</th>
                                    <th bgcolor="#87CEFA">May Actual</th>
                                    <th bgcolor="#87CEFA">Jun Actual</th>
                                    <th bgcolor="#87CEFA">Jul Actual</th>
                                    <th bgcolor="#87CEFA">Aug Actual</th>
                                    <th bgcolor="#87CEFA">Sep Actual</th>
                                    <th bgcolor="#87CEFA">Oct Actual</th>
                                    <th bgcolor="#87CEFA">Nov Actual</th>
                                    <th bgcolor="#87CEFA">Dec Actual</th>
                                    <th bgcolor="#87CEFA">YTD Complete</th>
                                    <th bgcolor="#87CEFA">% Complete</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
                

                

            </div>
        </div>
    </div>
    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">
            <div class="m-portlet__body">
                <div class="m-section">
                    <span class="m-section__heading">Central Region: 2018 POE LTE AC - Market Views
                    </span>

                <div class="row" id="donutrow4" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut31col" style="height: 100%;">
                            <div id="donut31" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut32col" style="height: 100%;">
                            <div id="donut32" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut33col" style="height: 100%;">
                            <div id="donut33" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut34col" style="height: 100%;">
                            <div id="donut34" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut35col" style="height: 100%;">
                            <div id="donut35" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut36col" style="height: 100%;">
                            <div id="donut36" style="visibility: visible;"></div>
                        </div>
                    </div>

                    <div class="row" id="breakdownrow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="LTEAC_breakdown_AROKcol" style="height: 100%;">
                            <div id="LTEAC_breakdown_AROK" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="LTEAC_breakdown_ILWIcol" style="height: 100%;">
                            <div id="LTEAC_breakdown_ILWI" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="LTEAC_breakdown_MOKScol" style="height: 100%;">
                            <div id="LTEAC_breakdown_MOKS" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="LTEAC_breakdown_MNPcol" style="height: 100%;">
                            <div id="LTEAC_breakdown_MNP" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="LTEAC_breakdown_NTXcol" style="height: 100%;">
                            <div id="LTEAC_breakdown_NTX" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="LTEAC_breakdown_STXcol" style="height: 100%;">
                            <div id="LTEAC_breakdown_STX" style="visibility: visible;"></div>
                        </div>
                    </div>
                <div id="donutrowlegend4" >
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

                    <div class="row" id="milestonerow3" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="AROK2018LTEACMILECOL" style="height: 100%;">
                            <div id="AROK2018LTEACMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="ILWI2018LTEACMILECOL" style="height: 100%;">
                            <div id="ILWI2018LTEACMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="MOKS2018LTEACMILECOL" style="height: 100%;">
                            <div id="MOKS2018LTEACMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="MNP2018LTEACMILECOL" style="height: 100%;">
                            <div id="MNP2018LTEACMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="NTX2018LTEACMILECOL" style="height: 100%;">
                            <div id="NTX2018LTEACMILE" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="STX2018LTEACMILECOL" style="height: 100%;">
                            <div id="STX2018LTEACMILE" style="visibility: visible;"></div>
                        </div>
                    </div>

                <div class="m-section">
                    <div class="m-section__content" style="height: 400px;">
                        <div id="CENFOR2018POELTEAC" style="height: 430px;" class="row">
                        </div>
                    </div>
                </div>

                    <div class="m-section__content" style="height: 315px;">
                        <table id="tabPOE2018LTEAC" class="table table-striped table-bordered table-hover text-center" width="100%">
                            <thead>
                                <tr>
                                    <th bgcolor="#87CEFA">2018 LTE AC</th>
                                    <th bgcolor="#87CEFA">2018 POE</th>
                                    <th bgcolor="#87CEFA">Jan Actual</th>
                                    <th bgcolor="#87CEFA">Feb Actual</th>
                                    <th bgcolor="#87CEFA">Mar Actual</th>
                                    <th bgcolor="#87CEFA">Apr Actual</th>
                                    <th bgcolor="#87CEFA">May Actual</th>
                                    <th bgcolor="#87CEFA">Jun Actual</th>
                                    <th bgcolor="#87CEFA">Jul Actual</th>
                                    <th bgcolor="#87CEFA">Aug Actual</th>
                                    <th bgcolor="#87CEFA">Sep Actual</th>
                                    <th bgcolor="#87CEFA">Oct Actual</th>
                                    <th bgcolor="#87CEFA">Nov Actual</th>
                                    <th bgcolor="#87CEFA">Dec Actual</th>
                                    <th bgcolor="#87CEFA">YTD Complete</th>
                                    <th bgcolor="#87CEFA">% Complete</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>

                <div class="row" id="predonutdrilldownrow000" style="height: 35%; width: 100%; overflow: auto; display: flex;"> </div>
                    <div class="row" id="donutdrilldownrow000" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-7" id="dd3000col" style="height: 100%;">
                            <div id="Donut3000_Drilldown" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-5" id="ddtabcol" style="height: 100%;">
                            <table id="example2" class="m-table table-striped table-bordered table-hover table-condensed text-center" width="100%">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>2017 Actuals</th>
                                            <th>Jan</th>
                                            <th>Feb</th>
                                            <th>Mar</th>
                                            <th>Apr</th>
                                            <th>May</th>
                                            <th>Jun</th>
                                            <th>Jul</th>
                                            <th>Aug</th>
                                            <th>Sep</th>
                                            <th>Oct</th>
                                            <th>Nov</th>
                                            <th>30-day</th>
                                            <th>90-day</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <th>6297</th>
                                            <th>13702</th>
                                            <th>13656</th>
                                            <th>13633</th>
                                            <th>13618</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>Jan</td>
                                            <td bgcolor="#92D050">186</td>
                                            <td bgcolor="#92D050">109</td>
                                            <td bgcolor="#92D050">108</td>
                                            <td bgcolor="#92D050">107</td>
                                            <td bgcolor="#92D050">107</td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Feb</td>
                                            <td bgcolor="#92D050">281</td>
                                            <td>157</td>
                                            <td bgcolor="#92D050">117</td>
                                            <td bgcolor="#92D050">118</td>
                                            <td bgcolor="#92D050">117</td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td>74.5%</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Mar</td>
                                            <td bgcolor="#92D050">498</td>
                                            <td>407</td>
                                            <td>374</td>
                                            <td bgcolor="#92D050">273</td>
                                            <td bgcolor="#92D050">267</td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td>73.0%</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Apr</td>
                                            <td bgcolor="#92D050">510</td>
                                            <td>645</td>
                                            <td>617</td>
                                            <td>551</td>
                                            <td bgcolor="#92D050">411</td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td>74.6%</td>
                                            <td>63.7%</td>
                                        </tr>
                                        <tr>
                                            <td>May</td>
                                            <td bgcolor="#92D050">484</td>
                                            <td>1156</td>
                                            <td>1417</td>
                                            <td>960</td>
                                            <td>1111</td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Jun</td>
                                            <td bgcolor="#92D050">607</td>
                                            <td>1819</td>
                                            <td>2264</td>
                                            <td>1959</td>
                                            <td>1799</td>
                                            <td></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Jul</td>
                                            <td bgcolor="#92D050">623</td>
                                            <td>1621</td>
                                            <td>2136</td>
                                            <td>2617</td>
                                            <td>2282</td>
                                            <td></td>
                                            <td></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Aug</td>
                                            <td bgcolor="#92D050">595</td>
                                            <td>1855</td>
                                            <td>1707</td>
                                            <td>2182</td>
                                            <td>2481</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Sep</td>
                                            <td bgcolor="#92D050">628</td>
                                            <td>1929</td>
                                            <td>1752</td>
                                            <td>1831</td>
                                            <td>2024</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Oct</td>
                                            <td bgcolor="#92D050">683</td>
                                            <td>1737</td>
                                            <td>1245</td>
                                            <td>1277</td>
                                            <td>1358</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td bgcolor="#92D050"></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Nov</td>
                                            <td bgcolor="#92D050">581</td>
                                            <td>1454</td>
                                            <td>1079</td>
                                            <td>938</td>
                                            <td>833</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td bgcolor="#92D050"></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>Dec</td>
                                            <td bgcolor="#92D050">621</td>
                                            <td>813</td>
                                            <td>840</td>
                                            <td>820</td>
                                            <td>828</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td>2019</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                
            </div>
        </div>
    </div>
 
    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018NSB", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018NSB(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018NSB(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018NSB').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018NSB').DataTable({ //build new table
                paging: false,
                sort: false,
                scrollY: 300,
                scrollCollapse: true,
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'MARKET' },
                    { 'data': 'POE_2018' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'YTD_COMPLETE' },
                    { 'data': 'PERCENT_COMPLETE' }

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

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018NSBDRILL", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018NSBDRILL(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018NSBDRILL(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018NSBDRILL').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018NSBDRILL').DataTable({ //build new table
                autoWidth: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,
                order: [[3, "asc"]],
                //order: [[3, "desc"], [0, "asc"]],
                searching: true,
                data: data,
                info: false,
                dom: 'Bfrtip',
                buttons: ['csv', 'excel'],
                columnDefs: [{ width: 220, targets: 2 },
                { width: 210, targets: 5 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'MARKET' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'PRODUCT_SUBGROUP' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'ONAIR_FORECAST' }

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
                }*/

            $(window).resize();
            /*});*/
        }



    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018NSBryg", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018NSBryg(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018NSBryg(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018NSBryg').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018NSBryg').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'AFTER' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_COMPLETE"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_COMPLETE"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_COMPLETE"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_COMPLETE"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_COMPLETE"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_COMPLETE"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_COMPLETE"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_COMPLETE"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_COMPLETE"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_COMPLETE"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_COMPLETE"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_COMPLETE"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018NSBrygCUMU", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018NSBrygCUMU(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018NSBrygCUMU(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018NSBrygCUMU').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018NSBrygCUMU').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE_CUMU' },
                    { 'data': 'JAN_CUMU' },
                    { 'data': 'FEB_CUMU' },
                    { 'data': 'MAR_CUMU' },
                    { 'data': 'APR_CUMU' },
                    { 'data': 'MAY_CUMU' },
                    { 'data': 'JUN_CUMU' },
                    { 'data': 'JUL_CUMU' },
                    { 'data': 'AUG_CUMU' },
                    { 'data': 'SEP_CUMU' },
                    { 'data': 'OCT_CUMU' },
                    { 'data': 'NOV_CUMU' },
                    { 'data': 'DEC_CUMU' },
                    { 'data': 'AFTER_CUMU' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_CUMU"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_CUMU"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_CUMU"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_CUMU"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_CUMU"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_CUMU"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_CUMU"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_CUMU"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_CUMU"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_CUMU"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_CUMU"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_CUMU"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTE1CDRILL", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTE1CDRILL(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTE1CDRILL(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTE1CDRILL').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTE1CDRILL').DataTable({ //build new table
                autoWidth: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,
                order: [[3, "asc"]],
                //order: [[3, "desc"], [0, "asc"]],
                searching: true,
                data: data,
                info: false,
                dom: 'Bfrtip',
                buttons: ['csv', 'excel'],
                columnDefs: [{ width: 220, targets: 2 },
                { width: 210, targets: 5 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'MARKET' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'PRODUCT_SUBGROUP' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'ONAIR_FORECAST' }

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
                }*/

            $(window).resize();
            /*});*/
        }



    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTE1Cryg", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTE1Cryg(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTE1Cryg(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTE1Cryg').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTE1Cryg').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'AFTER' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_COMPLETE"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_COMPLETE"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_COMPLETE"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_COMPLETE"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_COMPLETE"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_COMPLETE"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_COMPLETE"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_COMPLETE"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_COMPLETE"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_COMPLETE"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_COMPLETE"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_COMPLETE"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTE1CrygCUMU", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTE1CrygCUMU(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTE1CrygCUMU(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTE1CrygCUMU').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTE1CrygCUMU').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE_CUMU' },
                    { 'data': 'JAN_CUMU' },
                    { 'data': 'FEB_CUMU' },
                    { 'data': 'MAR_CUMU' },
                    { 'data': 'APR_CUMU' },
                    { 'data': 'MAY_CUMU' },
                    { 'data': 'JUN_CUMU' },
                    { 'data': 'JUL_CUMU' },
                    { 'data': 'AUG_CUMU' },
                    { 'data': 'SEP_CUMU' },
                    { 'data': 'OCT_CUMU' },
                    { 'data': 'NOV_CUMU' },
                    { 'data': 'DEC_CUMU' },
                    { 'data': 'AFTER_CUMU' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_CUMU"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_CUMU"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_CUMU"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_CUMU"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_CUMU"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_CUMU"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_CUMU"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_CUMU"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_CUMU"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_CUMU"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_CUMU"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_CUMU"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                    
                }
                
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTEACDRILL", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTEACDRILL(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTEACDRILL(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTEACDRILL').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTEACDRILL').DataTable({ //build new table
                autoWidth: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,
                order: [[3, "asc"]],
                //order: [[3, "desc"], [0, "asc"]],
                searching: true,
                data: data,
                info: false,
                dom: 'Bfrtip',
                buttons: ['csv', 'excel'],
                columnDefs: [{ width: 220, targets: 2 },
                { width: 210, targets: 5 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'MARKET' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'ONAIR_FORECAST' }

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
                }*/

            $(window).resize();
            /*});*/
        }



    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTEACryg", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTEACryg(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTEACryg(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTEACryg').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTEACryg').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'AFTER' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_COMPLETE"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_COMPLETE"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_COMPLETE"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_COMPLETE"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_COMPLETE"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_COMPLETE"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_COMPLETE"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_COMPLETE"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_COMPLETE"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_COMPLETE"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_COMPLETE"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_COMPLETE"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTEACrygCUMU", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTEACrygCUMU(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTEACrygCUMU(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTEACrygCUMU').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTEACrygCUMU').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE_CUMU' },
                    { 'data': 'JAN_CUMU' },
                    { 'data': 'FEB_CUMU' },
                    { 'data': 'MAR_CUMU' },
                    { 'data': 'APR_CUMU' },
                    { 'data': 'MAY_CUMU' },
                    { 'data': 'JUN_CUMU' },
                    { 'data': 'JUL_CUMU' },
                    { 'data': 'AUG_CUMU' },
                    { 'data': 'SEP_CUMU' },
                    { 'data': 'OCT_CUMU' },
                    { 'data': 'NOV_CUMU' },
                    { 'data': 'DEC_CUMU' },
                    { 'data': 'AFTER_CUMU' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_CUMU"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_CUMU"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_CUMU"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_CUMU"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_CUMU"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_CUMU"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_CUMU"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_CUMU"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_CUMU"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_CUMU"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_CUMU"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_CUMU"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }

                }

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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE20184T4RDRILL", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE20184T4RDRILL(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE20184T4RDRILL(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE20184T4RDRILL').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE20184T4RDRILL').DataTable({ //build new table
                autoWidth: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,
                order: [[3, "asc"]],
                //order: [[3, "desc"], [0, "asc"]],
                searching: true,
                data: data,
                info: false,
                dom: 'Bfrtip',
                buttons: ['csv', 'excel'],
                columnDefs: [{ width: 220, targets: 2 },
                { width: 210, targets: 5 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'MARKET' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'ONAIR_FORECAST' }

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
                }*/

            $(window).resize();
            /*});*/
        }



    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018CRANDRILL", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018CRANDRILL(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018CRANDRILL(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018CRANDRILL').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018CRANDRILL').DataTable({ //build new table
                autoWidth: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,
                order: [[3, "asc"]],
                //order: [[3, "desc"], [0, "asc"]],
                searching: true,
                data: data,
                info: false,
                dom: 'Bfrtip',
                buttons: ['csv', 'excel'],
                columnDefs: [{ width: 220, targets: 2 },
                { width: 210, targets: 5 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'MARKET' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'ONAIR_FORECAST' }

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
                }*/

            $(window).resize();
            /*});*/
        }



    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018BWEHWDRILL", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018BWEHWDRILL(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018BWEHWDRILL(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018BWEHWDRILL').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018BWEHWDRILL').DataTable({ //build new table
                autoWidth: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,
                order: [[3, "asc"]],
                //order: [[3, "desc"], [0, "asc"]],
                searching: true,
                data: data,
                info: false,
                dom: 'Bfrtip',
                buttons: ['csv', 'excel'],
                columnDefs: [{ width: 220, targets: 2 },
                { width: 210, targets: 5 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'MARKET' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'ONAIR_FORECAST' }

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
                }*/

            $(window).resize();
            /*});*/
        }



    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE20184T4Rryg", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE20184T4Rryg(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE20184T4Rryg(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE20184T4Rryg').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE20184T4Rryg').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'AFTER' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_COMPLETE"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_COMPLETE"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_COMPLETE"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_COMPLETE"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_COMPLETE"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_COMPLETE"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_COMPLETE"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_COMPLETE"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_COMPLETE"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_COMPLETE"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_COMPLETE"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_COMPLETE"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE20184T4RrygCUMU", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE20184T4RrygCUMU(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE20184T4RrygCUMU(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE20184T4RrygCUMU').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE20184T4RrygCUMU').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE_CUMU' },
                    { 'data': 'JAN_CUMU' },
                    { 'data': 'FEB_CUMU' },
                    { 'data': 'MAR_CUMU' },
                    { 'data': 'APR_CUMU' },
                    { 'data': 'MAY_CUMU' },
                    { 'data': 'JUN_CUMU' },
                    { 'data': 'JUL_CUMU' },
                    { 'data': 'AUG_CUMU' },
                    { 'data': 'SEP_CUMU' },
                    { 'data': 'OCT_CUMU' },
                    { 'data': 'NOV_CUMU' },
                    { 'data': 'DEC_CUMU' },
                    { 'data': 'AFTER_CUMU' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_CUMU"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_CUMU"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_CUMU"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_CUMU"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_CUMU"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_CUMU"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_CUMU"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_CUMU"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_CUMU"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_CUMU"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_CUMU"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_CUMU"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }

                }

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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018CRANryg", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018CRANryg(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018CRANryg(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018CRANryg').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018CRANryg').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'AFTER' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_COMPLETE"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_COMPLETE"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_COMPLETE"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_COMPLETE"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_COMPLETE"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_COMPLETE"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_COMPLETE"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_COMPLETE"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_COMPLETE"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_COMPLETE"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_COMPLETE"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_COMPLETE"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018CRANrygCUMU", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018CRANrygCUMU(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018CRANrygCUMU(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018CRANrygCUMU').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018CRANrygCUMU').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE_CUMU' },
                    { 'data': 'JAN_CUMU' },
                    { 'data': 'FEB_CUMU' },
                    { 'data': 'MAR_CUMU' },
                    { 'data': 'APR_CUMU' },
                    { 'data': 'MAY_CUMU' },
                    { 'data': 'JUN_CUMU' },
                    { 'data': 'JUL_CUMU' },
                    { 'data': 'AUG_CUMU' },
                    { 'data': 'SEP_CUMU' },
                    { 'data': 'OCT_CUMU' },
                    { 'data': 'NOV_CUMU' },
                    { 'data': 'DEC_CUMU' },
                    { 'data': 'AFTER_CUMU' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_CUMU"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_CUMU"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_CUMU"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_CUMU"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_CUMU"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_CUMU"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_CUMU"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_CUMU"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_CUMU"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_CUMU"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_CUMU"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_CUMU"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }

                }

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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018BWEHWryg", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018BWEHWryg(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018BWEHWryg(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018BWEHWryg').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018BWEHWryg').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'AFTER' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_COMPLETE"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_COMPLETE"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_COMPLETE"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_COMPLETE"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_COMPLETE"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_COMPLETE"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_COMPLETE"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_COMPLETE"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_COMPLETE"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_COMPLETE"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_COMPLETE"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_COMPLETE"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }
                }
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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018BWEHWrygCUMU", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018BWEHWrygCUMU(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018BWEHWrygCUMU(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018BWEHWrygCUMU').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018BWEHWrygCUMU').DataTable({ //build new table
                autoWidth: true,
                paging: false,
                sort: false,
                scrollY: 350,
                scrollCollapse: true,
                //scrollX: 100,                
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                //dom: 'Bfrtip',
                //buttons: ['csv', 'excel'],
                columnDefs: [{ width: 120, targets: 0 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PROJECT' },
                    { 'data': 'BEFORE_CUMU' },
                    { 'data': 'JAN_CUMU' },
                    { 'data': 'FEB_CUMU' },
                    { 'data': 'MAR_CUMU' },
                    { 'data': 'APR_CUMU' },
                    { 'data': 'MAY_CUMU' },
                    { 'data': 'JUN_CUMU' },
                    { 'data': 'JUL_CUMU' },
                    { 'data': 'AUG_CUMU' },
                    { 'data': 'SEP_CUMU' },
                    { 'data': 'OCT_CUMU' },
                    { 'data': 'NOV_CUMU' },
                    { 'data': 'DEC_CUMU' },
                    { 'data': 'AFTER_CUMU' },
                    { 'data': 'YTD_COMPLETE' }
                ],
                createdRow: function (row, data, index) { //add some styling to the table based on rules you define
                    if (data["JAN_CUMU"] < 0) {
                        $('td', row).eq(2).addClass('cered');
                    }
                    if (data["FEB_CUMU"] < 0) {
                        $('td', row).eq(3).addClass('cered');
                    }
                    if (data["MAR_CUMU"] < 0) {
                        $('td', row).eq(4).addClass('cered');
                    }
                    if (data["APR_CUMU"] < 0) {
                        $('td', row).eq(5).addClass('cered');
                    }
                    if (data["MAY_CUMU"] < 0) {
                        $('td', row).eq(6).addClass('cered');
                    }
                    if (data["JUN_CUMU"] < 0) {
                        $('td', row).eq(7).addClass('cered');
                    }
                    if (data["JUL_CUMU"] < 0) {
                        $('td', row).eq(8).addClass('cered');
                    }
                    if (data["AUG_CUMU"] < 0) {
                        $('td', row).eq(9).addClass('cered');
                    }
                    if (data["SEP_CUMU"] < 0) {
                        $('td', row).eq(10).addClass('cered');
                    }
                    if (data["OCT_CUMU"] < 0) {
                        $('td', row).eq(11).addClass('cered');
                    }
                    if (data["NOV_CUMU"] < 0) {
                        $('td', row).eq(12).addClass('cered');
                    }
                    if (data["DEC_CUMU"] < 0) {
                        $('td', row).eq(13).addClass('cered');
                    }
                    if (data["YTD_COMPLETE"] < 0) {
                        $('td', row).eq(15).addClass('cered');
                    }

                }

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
                }*/

            $(window).resize();
            /*});*/
        }

    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTE1C", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTE1C(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTE1C(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTE1C').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTE1C').DataTable({ //build new table
                paging: false,
                sort: false,
                scrollY: 300,
                scrollCollapse: true,
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'MARKET' },
                    { 'data': 'POE_2018' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'YTD_COMPLETE' },
                    { 'data': 'PERCENT_COMPLETE' }

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
    <script type="text/javascript">
        $(document).ready(function () {
            /* Ajax call to load the Macro summary table */
            $.ajax({
                type: "POST",
                async: true,
                url: "cappoegmw.aspx/GetPOE2018LTEAC", /* .aspx filename/[WebMethod] */
                data: JSON.stringify({}), /* Pass variables to the [WebMethod] in your .aspx.cs file */
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) { /* what to do when data is returned */
                    loadPOE2018LTEAC(data);
                },
                error: function (data) { /* what to do wif an error occurs */
                    alert('there was an error!');
                }
            });
        });
        /* SUMMARY TABLE LOADERS */
        function loadPOE2018LTEAC(data) {
            var data = JSON.parse(data.d);
            $('#tabPOE2018LTEAC').dataTable().fnDestroy(); //destroy old table
            $('#tabPOE2018LTEAC').DataTable({ //build new table
                paging: false,
                sort: false,
                scrollY: 300,
                scrollCollapse: true,
                //order: [[3, "desc"], [0, "asc"]],
                searching: false,
                data: data,
                info: false,
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'MARKET' },
                    { 'data': 'POE_2018' },
                    { 'data': 'JAN_COMPLETE' },
                    { 'data': 'FEB_COMPLETE' },
                    { 'data': 'MAR_COMPLETE' },
                    { 'data': 'APR_COMPLETE' },
                    { 'data': 'MAY_COMPLETE' },
                    { 'data': 'JUN_COMPLETE' },
                    { 'data': 'JUL_COMPLETE' },
                    { 'data': 'AUG_COMPLETE' },
                    { 'data': 'SEP_COMPLETE' },
                    { 'data': 'OCT_COMPLETE' },
                    { 'data': 'NOV_COMPLETE' },
                    { 'data': 'DEC_COMPLETE' },
                    { 'data': 'YTD_COMPLETE' },
                    { 'data': 'PERCENT_COMPLETE' }

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

    <script type="text/javascript">
        var chart2;
        /* Ajax call to load the CENFOR2018POENSB chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENFOR2018POENSB",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENFOR2018POENSB(data);
            },
            error: function (data) {
            }
        });

        function loadCENFOR2018POENSB(data) {

            FOR2018POENSB = JSON.parse(data.d);

            const cats = {}
            FOR2018POENSB.forEach((o) => cats[o.FORECAST_MONTH] = 1)
            const categories = Object.keys(cats)

            // Parse  data
            let series = FOR2018POENSB.reduce((acc, o) => {
                // Check if array already defined
                if (acc[o.MARKET] && acc[o.MARKET].data) {
                    // Push new values to array
                    acc[o.MARKET].data.push({ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) })
                } else {
                    // Create new array with first value
                    acc[o.MARKET] = { data: [{ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) }] }
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
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019'],
                    labels: {
                        style: { fontSize: "14px" }
                    }
                },
                chart: { type: 'column' },
                series: series,
                colors: ['#60bd68', '#faa43a', '#5da5da', '#f15854', '#decf3f', '#4d4d4d'],
                title: {
                    text: ' Central Region 2018 NSB POE Forecast Dates',
                    style: {
                        fontSize: "18px"
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
                        pointPadding: 0.05
                    }
                }
            }

            // Create chart
            const chart = Highcharts.chart('CENFOR2018POENSB', options)
        }
    </script>

    <script type="text/javascript">
        var chart2;
        /* Ajax call to load the CENNBD2018POENSB chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POENSB",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POENSB(data);
            },
            error: function (data) {
            }
        });

        function loadCENNBD2018POENSB(data) {

            FOR2018POENSB = JSON.parse(data.d);

            const cats = {}
            FOR2018POENSB.forEach((o) => cats[o.FORECAST_MONTH] = 1)
            const categories = Object.keys(cats)

            // Parse  data
            let series = FOR2018POENSB.reduce((acc, o) => {
                // Check if array already defined
                if (acc[o.MARKET] && acc[o.MARKET].data) {
                    // Push new values to array
                    acc[o.MARKET].data.push({ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) })
                } else {
                    // Create new array with first value
                    acc[o.MARKET] = { data: [{ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) }] }
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
                    categories: categories,
                    labels: {
                        style: { fontSize: "14px" }
                    }
                },
                chart: { type: 'column' },
                series: series,
                title: {
                    text: ' Central Region 2018 NSB POE Cumulative NBD',
                    style: {
                        fontSize: "18px"
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
                        pointPadding: 0.05
                    }
                }
            }

            // Create chart
            const chart = Highcharts.chart('CENNBD2018POENSB', options)
        }
    </script>

    <script type="text/javascript">
        var chart3;
        /* Ajax call to load the CENFOR2018POELTE1C chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENFOR2018POELTE1C",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENFOR2018POELTE1C(data);
            },
            error: function (data) {
            }
        });

        function loadCENFOR2018POELTE1C(data) {

            FOR2018POELTE1C = JSON.parse(data.d);

            const cats = {}
            FOR2018POELTE1C.forEach((o) => cats[o.FORECAST_MONTH] = 1)
            const categories = Object.keys(cats)

            // Parse  data
            let series = FOR2018POELTE1C.reduce((acc, o) => {
                // Check if array already defined
                if (acc[o.MARKET] && acc[o.MARKET].data) {
                    // Push new values to array
                    acc[o.MARKET].data.push({ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) })
                } else {
                    // Create new array with first value
                    acc[o.MARKET] = { data: [{ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) }] }
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
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019'],
                    labels: {
                        style: { fontSize: "14px" }
                    }
                },
                chart: { type: 'column' },
                series: series,
                colors: ['#60bd68', '#faa43a', '#5da5da', '#f15854', '#decf3f', '#4d4d4d'],
                title: {
                    text: ' Central Region 2018 LTE 1C POE Forecast Dates',
                    style: {
                        fontSize: "18px"
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
                        pointPadding: 0.05
                    }
                }
            }

            // Create chart
            const chart = Highcharts.chart('CENFOR2018POELTE1C', options)
        }
    </script>

    <script type="text/javascript">
        var chart4;
        /* Ajax call to load the CENFOR2018POELTEAC chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENFOR2018POELTEAC",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENFOR2018POELTEAC(data);
            },
            error: function (data) {
            }
        });

        function loadCENFOR2018POELTEAC(data) {

            FOR2018POELTEAC = JSON.parse(data.d);

            const cats = {}
            FOR2018POELTEAC.forEach((o) => cats[o.FORECAST_MONTH] = 1)
            const categories = Object.keys(cats)

            // Parse  data
            let series = FOR2018POELTEAC.reduce((acc, o) => {
                // Check if array already defined
                if (acc[o.MARKET] && acc[o.MARKET].data) {
                    // Push new values to array
                    acc[o.MARKET].data.push({ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) })
                } else {
                    // Create new array with first value
                    acc[o.MARKET] = { data: [{ x: categories.indexOf(o.FORECAST_MONTH), y: Number(o.PROJECTS_FCST_ONAIR) }] }
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
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019'],
                    labels: {
                        style: { fontSize: "14px" }
                    }
                },
                chart: { type: 'column' },
                series: series,
                colors: ['#60bd68', '#faa43a', '#5da5da', '#f15854', '#decf3f', '#4d4d4d'],
                title: {
                    text: ' Central Region 2018 LTE AC POE Forecast Dates',
                    style: {
                        fontSize: "18px"
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
                        pointPadding: 0.05
                    }
                }
            }

            // Create chart
            const chart = Highcharts.chart('CENFOR2018POELTEAC', options)
        }
    </script>

    <script type="text/javascript">

        /* Ajax call to load the donut1 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut1",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut1(data);
            },
            error: function (data) {
            }
        });

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

        /* DONUT CHART CREATER */




        /* Ajax call to load the donut2 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut2",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut2(data);
            },
            error: function (data) {
            }
        });

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

        /* DONUT CHART CREATER */

        /* Ajax call to load the donut3 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut3",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut3(data);
            },
            error: function (data) {
            }
        });

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

        /* DONUT CHART CREATER */

        /* Ajax call to load the donut4 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut4",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut4(data);
            },
            error: function (data) {
            }
        });

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

        /* DONUT CHART CREATER */

        /* Ajax call to load the donut5 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut5",
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

        /* DONUT CHART CREATER */

        /* Ajax call to load the donut6 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut6",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut6(data);
            },
            error: function (data) {
            }
        });

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
        function donutcharting(container, value, title, forecast, ytdcomplete) {
            $(function () {
                var color16; //variable for chart color assignments

                subtitle = '<p style="font-size:14px;">Complete: ' + ytdcomplete + '</p>' + '<br><p style="font-size:12px; font-style:italic;">(Forecast: ' + forecast + ')</p>'; //create the chart subtitle variable
                if (value == 100) {
                    color16 = '#00ff00'; //its green
                } else {
                    color16 = '#1e90ff'; //its light blue
                }


                Highcharts.chart(container, { //define the Highchart
                    colors: [color16, '#87cefa'], //series' colors
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '230',
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
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br><b>{point.percentage:.1f}%</b>',
                        backgroundColor: '#FFFFFF'
                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: false,
                                format: '<b>{point.name}</b>: {point.percentage:.2f} %',
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
                        size: '100%',
                        innerSize: '60%',
                        data: [{
                            name: 'Percent Complete',
                            y: value
                        }, {
                            name: 'Percent Not Complete',
                            y: 100 - value
                        }]
                    }]
                });
            });
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
                            { name: 'Complete Last Month', y: lastmonthcomp},
                            { name: 'Complete Curr Month', y: currmonthcomp },
                            { name: 'Curr Month Remaining', y: currentmonth },
                            { name: 'Next Month Forecast', y: nextmonth },
                            { name: 'Remaining Forecast', y: forecast - beforenbd - within90nbd - after90nbd - currentmonth - nextmonth },
                        ]
                    }]
                });
            });
        }

        /* DONUT CHART CREATER */
        function donutcharting100(container, value, title, forecast, ytdcomplete, beforenbd, within90nbd, after90nbd, currentmonth, nextmonth) {
            ;

            $(function () {
                var color100; //variable for chart color assignments
                
                subtitle = '<p style="font-size:14px;">Complete: ' + ytdcomplete + '</p>' + '<br><p style="font-size:12px; font-style:italic;">(Forecast: ' + forecast + ')</p>'; //create the chart subtitle variable
                if (value == 100) {
                    color100 = '#00ff00'; //its green
                } else {
                    color100 = '#1e90ff'; //its dark blue
                }

                Highcharts.setOptions({
                    lang: {
                        thousandsSep: ','
                    }
                });

                Highcharts.chart(container, { //define the Highchart
                    colors: ['#006600', '#ff9999', '#ff0000', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '250',
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
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content + '<br/><b>2018 Completed: ' + ytdcomplete + ' (' + value + '%)' + '<br/>2018 Forecast Total: ' + this.total.toFixed(0);
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF'

                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: false,
                                format: '<b>{point.name}</b>: {point.percentage:.2f} %',
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
                        size: '100%',
                        innerSize: '60%',
                        data: [
                            { name: 'Cmp Before NBD', y: beforenbd },
                            { name: 'Cmp 1-90 Days of NBD', y: within90nbd },
                            { name: 'Cmp > 90 Days of NBD', y: after90nbd },
                            { name: 'Curr Month Remaining', y: currentmonth },
                            { name: 'Next Month Forecast', y: nextmonth },
                            { name: 'Remaining Forecast', y: forecast - beforenbd - within90nbd - after90nbd - currentmonth - nextmonth },
                        ]
                    }]
                });
            });
        }

    </script>


    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCEN2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCEN2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */ 
        function loadCEN2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator20('CEN2018NSBMILE', data, '2018 NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator20(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa']
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'bar',
                        height: '470',
                        width: '675'
                    },
                    title: {
                        text: title,
                        align: 'center'
                    },
                    xAxis: {
                        categories: ['p-RFDS Issued', 'f-RFDS Issued', 'SAQ Complete', 'Construction Start', 'Tower Top Complete', 'Construction Complete', 'On-Air Actual'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }

        /* HC SUMMARY CHART LOADER 
        function loadCEN2018NSBMILE(data) {
            var values = JSON.parse(data.d);
            var data_forecast = [values[0]["POE_2018"]];
            var data_complete = [values[0]["JI012_COMPLETE"], values[0]["SS010_COMPLETE"], values[0]["SS010_90_COMPLETE"], values[0]["JI022_COMPLETE"], values[0]["SS007_COMPLETE"], values[0]["SS020_COMPLETE"]]
            var data_overall_remaining = [values[0]["JI012_OVERALL_REMAINING"], values[0]["SS010_OVERALL_REMAINING"], values[0]["SS010_90_OVERALL_REMAINING"], values[0]["JI022_OVERALL_REMAINING"], values[0]["SS007_OVERALL_REMAINING"], values[0]["SS020_OVERALL_REMAINING"]];            
            var data_before = [values[0]["JI012_BEFORE"], values[0]["SS010_BEFORE"], values[0]["SS010_90_BEFORE"], values[0]["JI022_BEFORE"], values[0]["SS007_BEFORE"], values[0]["SS020_BEFORE"]];
            var data_current = [values[0]["JI012_CURRENT"], values[0]["SS010_CURRENT"], values[0]["SS010_90_CURRENT"], values[0]["JI022_CURRENT"], values[0]["SS007_CURRENT"], values[0]["SS020_CURRENT"]];
            var data_after = [values[0]["JI012_AFTER"], values[0]["SS010_AFTER"], values[0]["SS010_90_AFTER"], values[0]["JI022_AFTER"], values[0]["SS007_AFTER"], values[0]["SS020_AFTER"]];
            var data_thismonth = [values[0]["JI012_THISMONTH"], values[0]["SS010_THISMONTH"], values[0]["SS010_90_THISMONTH"], values[0]["JI022_THISMONTH"], values[0]["SS007_THISMONTH"], values[0]["SS020_THISMONTH"]];
            var data_nextmonth = [values[0]["JI012_NEXTMONTH"], values[0]["SS010_NEXTMONTH"], values[0]["SS010_90_NEXTMONTH"], values[0]["JI022_NEXTMONTH"], values[0]["SS007_NEXTMONTH"], values[0]["SS020_NEXTMONTH"]];
            var data_future_remaining = [values[0]["JI012_FUTURE_REMAINING"], values[0]["SS010_FUTURE_REMAINING"], values[0]["SS010_90_FUTURE_REMAINING"], values[0]["JI022_FUTURE_REMAINING"], values[0]["SS007_FUTURE_REMAINING"], values[0]["SS020_FUTURE_REMAINING"]];
            var data_past_forecast = [values[0]["JI012_PAST_FORECAST"], values[0]["SS010_PAST_FORECAST"], values[0]["SS010_90_PAST_FORECAST"], values[0]["JI022_PAST_FORECAST"], values[0]["SS007_PAST_FORECAST"], values[0]["SS020_PAST_FORECAST"]];
            barChartCreator100('CEN2018NSBMILE', data_forecast, data_complete, data_overall_remaining, data_before, data_current, data_after, data_thismonth, data_nextmonth, data_future_remaining, data_past_forecast, '2018 NSB Milestones');
        }

        /* BAR CHART CREATER 
        function barChartCreator100(container, data_forecast, data_complete, data_overall_remaining, data_before, data_current, data_after, data_thismonth, data_nextmonth, data_future_remaining, data_past_forecast, title) {            
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'bar',
                        height: '520',
                        width: '1200'
                    },
                    title: {
                        text: title,
                        align: 'center'
                    },
                    xAxis: {
                        categories: ['Search Ring Issued', 'Primary Candidate Selected', 'Primary Candidate NS (90 days)', 'Preliminary RFDS', 'Structurals Ordered', 'Final RFDS'],
                        title: null
                    },
                    yAxis: {
                        title: {
                            min: 0,
                            text: 'Milestone Counts',
                            align: 'middle'
                        }
                    },
                    legend: {
                        reversed: true,
                        align: 'right',
                        verticalAlign: 'top',
                        layout: 'vertical',
                        x: 0,
                        y: 200
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} </b></td></tr>' ,
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    /* tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content + '<br/><b>2018 Completed: ' + ytdcomplete + ' (' + value + '%)' + '<br/>2018 Forecast Total: ' + this.total.toFixed(0);
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF' 
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            stacking: true,
                            dataLabels: {
                                useHTML: true,
                                enabled: true,
                                style: {
                                    fontWeight: 'bold'
                                }
                            }
                        }
                    },
                    series: [
                        { name: 'Complete Before SLA', color: '#006600', index: 6, data: data_before },
                        { name: 'Complete On SLA', color: '#00b300', index: 5, data: data_current },
                        { name: 'Complete After SLA', color: '#ff9999', index: 4, data: data_after },
                        { name: 'Forecasted Complete This Month', color: '#0066cc', index: 3, data: data_thismonth },
                        { name: 'Forecasted Complete Next Month', color: '#4da6ff', index: 2, data: data_nextmonth },
                        { name: 'Forecasted Rest of Year', color: '#87cefa', index: 1, data: data_future_remaining },
                        { name: 'Past Forecasted Date', color: '#ffC266', index: 0, data: data_past_forecast }
                    ]
                });
            });
        } */

    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCEN2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCEN2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */ 
        function loadCEN2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator20('CEN2018LTE1CMILE', data, '2018 LTE 1C Milestones');
        }

        /* HC SUMMARY CHART LOADER 
        function loadCEN2018LTE1CMILE(data) {
            var values = JSON.parse(data.d);
            var data_forecast = [values[0]["POE_2018"]];
            var data_complete = [values[0]["JI022_COMPLETE"], values[0]["SS007_COMPLETE"], values[0]["SS020_COMPLETE"]];
            var data_overall_remaining = [values[0]["JI022_OVERALL_REMAINING"], values[0]["SS007_OVERALL_REMAINING"], values[0]["SS020_OVERALL_REMAINING"]];
            var data_before = [values[0]["JI022_BEFORE"], values[0]["SS007_BEFORE"], values[0]["SS020_BEFORE"]];            
            var data_after = [values[0]["JI022_AFTER"], values[0]["SS007_AFTER"], values[0]["SS020_AFTER"]];
            var data_remaining = [values[0]["JI022_REMAINING"], values[0]["SS007_REMAINING"], values[0]["SS020_REMAINING"]];
            var data_thismonth = [values[0]["JI022_THISMONTH"], values[0]["SS007_THISMONTH"], values[0]["SS020_THISMONTH"]];
            var data_nextmonth = [values[0]["JI022_NEXTMONTH"], values[0]["SS007_NEXTMONTH"], values[0]["SS020_NEXTMONTH"]];
            var data_future_remaining = [values[0]["JI022_FUTURE_REMAINING"], values[0]["SS007_FUTURE_REMAINING"], values[0]["SS020_FUTURE_REMAINING"]];
            var data_past_forecast = [values[0]["JI022_PAST_FORECAST"], values[0]["SS007_PAST_FORECAST"], values[0]["SS020_PAST_FORECAST"]];
            barChartCreator200('CEN2018LTE1CMILE', data_forecast, data_complete, data_overall_remaining, data_before, data_after, data_remaining, data_thismonth, data_nextmonth, data_future_remaining, data_past_forecast, '2018 LTE 1C Milestones');
        } */

        /* BAR CHART CREATER 
        function barChartCreator200(container, data_forecast, data_complete, data_overall_remaining, data_before, data_after, data_remaining, data_thismonth, data_nextmonth, data_future_remaining, data_past_forecast, title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'bar',
                        height: '520',
                        width: '1200'
                    },
                    title: {
                        text: title,
                        align: 'center'
                    },
                    xAxis: {
                        categories: ['Preliminary RFDS (RAN Design)', 'Structurals Ordered (C&E)', 'Final RFDS (RAN Design)'],
                        title: null
                    },
                    yAxis: {
                        title: {
                            min: 0,
                            text: 'Milestone Percentage Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        reversed: true,
                        align: 'right',
                        verticalAlign: 'top',
                        layout: 'vertical',
                        x: 0,
                        y: 200
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} </b> ({point.percentage:.0f}%) </td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    /*
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content + '<br/><b>2018 Completed: ' + ytdcomplete + ' (' + value + '%)' + '<br/>2018 Forecast Total: ' + this.total.toFixed(0);
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content + '<br/><b>2018 Completed: ' + data_complete + ' (' + data_complete + '%)' + '<br/>2018 Forecast Total: ' + this.total.toFixed(0);
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            stacking: 'percent',
                            dataLabels: {
                                useHTML: true,
                                enabled: true,
                                style: {
                                    fontWeight: 'bold'
                                }
                            }
                        }
                    },
                    series: [
                        { name: 'Completed', color: '#006600', index: 2, data: data_complete },
                        { name: 'Past Forecast', color: '#ffC266', index: 0, data: data_remaining },
                        { name: 'Forecasted Remaining', color: '#4da6ff', index: 1, data: data_past_forecast }
                    ]
                });
            });
        }*/
        /* BAR CHART CREATER */
        function barChartCreator200(container, data_forecast, data_complete, data_overall_remaining, data_before, data_after, data_remaining, data_thismonth, data_nextmonth, data_future_remaining, data_past_forecast, title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        
                        height: '520',
                        width: '1200'
                    },
                    title: {
                        text: title,
                        align: 'center'
                    },
                    xAxis: {
                        categories: ['Preliminary RFDS (RAN Design)', 'Structurals Ordered (C&E)', 'Final RFDS (RAN Design)'],
                        title: null,                        
                    },
                    yAxis: {
                        title: {
                            min: 0,
                            text: 'Milestone Percentage Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        reversed: true,
                        align: 'right',
                        verticalAlign: 'top',
                        layout: 'vertical',
                        x: 0,
                        y: 200
                    },
                    
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            stacking: 'stacking',
                            dataLabels: {
                                enabled: true,
                                inside: true,
                                rotation: 0,
                                style: {
                                    color: "contrast",
                                    fontSize: "11px",
                                    fontWeight: "bold",
                                    textOutline: "none", //"1px contrast",
                                }                                
                            },
                            pointPadding: 0.1,
                            groupPadding: 0
                        }
                    },
                    tooltip: {
                        //            positioner: function (labelWidth, labelHeight, point) {
                        //                var tooltipX = point.plotX;
                        //                var tooltipY = point.plotY;
                        //                return { x: tooltipX, y: tooltipY };
                        //                var chart = this;
                        //           }
                        //comma above and more tool tip stuff below
                        
                        formatter: function () {
                            var text = '';
                            if (this.series.name == 'Completed') {
                                text = '<b>' + this.x + '</b> <br>' + this.series.name + ': ' + this.y + '<br>' + data_before.y + '<br>' + this.point.data_after;
                            }
                            if (this.series.name == 'Past Forecast') {
                                text = '<b>' + this.x + '</b> <br>' + this.series.name + ': ' + this.y + '<br>';
                            }
                            if (this.series.name == 'Forecasted Remaining') {
                                text = '<b>' + this.x + '</b> <br>' + this.series.name + ': ' + this.y + '<br>';
                            }
                            return text;
                        }
                    },
                    series: [
                        { type: 'bar', name: 'Completed', color: '#006600', index: 2, data: data_complete },
                        { type: 'bar', name: 'Past Forecast', color: '#ffC266', index: 0, data: data_remaining },
                        { type: 'bar', name: 'Forecasted Remaining', color: '#4da6ff', index: 1, data: data_past_forecast }
                    ]
                });
            });
        }


    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCEN2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCEN2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCEN2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator20('CEN2018LTEACMILE', data, '2018 LTE AC Milestones');
        }

        /* BAR CHART CREATER */

    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCEN20184T4RMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCEN20184T4RMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCEN20184T4RMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["SS076_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator2('CEN20184T4RMILE', data, '2018 4T4R Milestones');
        }

          /* BAR CHART CREATER */

    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCEN2018CRANMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCEN2018CRANMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCEN2018CRANMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["SS076_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator2('CEN2018CRANMILE', data, '2018 CRAN Milestones');
        }

          /* BAR CHART CREATER */

    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCEN2018BWEHWMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCEN2018BWEHWMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCEN2018BWEHWMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["SS076_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator2('CEN2018BWEHWMILE', data, 'BWE HW Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa']
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'bar',
                        height: '520',
                        width: '800'
                    },
                    title: {
                        text: title,
                        align: 'center'
                    },
                    xAxis: {
                        categories: ['Primary Candidate Selected', 'Final RFDS Complete', 'SAQ Complete', 'Construction Start', 'Tower Top Complete', 'Construction Complete', 'On-Air Actual'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }

        

        /* BAR CHART CREATER */
        function barChartCreator2(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa']
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'bar',
                        height: '470',
                        width: '800'
                    },
                    title: {
                        text: title,
                        align: 'center'
                    },
                    xAxis: {
                        categories: ['Project Started', 'SAQ Complete', 'Construction Start', 'Tower Top Complete', 'Construction Complete', 'On-Air Actual'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>

    <script type="text/javascript">

          /* Ajax call to load the donut11 chart data */
          $.ajax({
              type: "POST",
              async: true,
              url: "cappoegmw.aspx/Getdonut11",
              data: JSON.stringify({}),
              dataType: "json",
              contentType: "application/json; charset=utf-8",
              success: function (data) {
                  loadDonut11(data);
              },
              error: function (data) {
              }
          });

          function loadDonut11(data) {
              var score = JSON.parse(data.d); //parse your data
              var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
              var title = 'AROK NSB'; //put the data into variables to pass to a chart building function
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
              donutcharting101('donut11', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                  within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
          }
        
        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

          /* Ajax call to load the donut12 chart data */
          $.ajax({
              type: "POST",
              async: true,
              url: "cappoegmw.aspx/Getdonut12",
              data: JSON.stringify({}),
              dataType: "json",
              contentType: "application/json; charset=utf-8",
              success: function (data) {
                  loadDonut12(data);
              },
              error: function (data) {
              }
          });

          function loadDonut12(data) {
              var score = JSON.parse(data.d); //parse your data
              var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
              var title = 'ILWI NSB'; //put the data into variables to pass to a chart building function
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
              donutcharting101('donut12', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                  within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
          }

        /* DONUT CHART CREATER */


    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut13 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut13",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut13(data);
            },
            error: function (data) {
            }
        });

        function loadDonut13(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MOKS NSB'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut13', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */


    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut14 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut14",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut14(data);
            },
            error: function (data) {
            }
        });

        function loadDonut14(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MNP NSB'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut14', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */


    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut15 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut15",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut15(data);
            },
            error: function (data) {
            }
        });

        function loadDonut15(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'NTX NSB'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut15', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */


    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut16 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut16",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut16(data);
            },
            error: function (data) {
            }
        });

        function loadDonut16(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'STX NSB'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut16', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */
        function donutcharting11(container, value, title, forecast, ytdcomplete) {
            $(function () {
                var color16; //variable for chart color assignments

                subtitle = '<p style="font-size:14px;">Complete: ' + ytdcomplete + '</p>' + '<br><p style="font-size:12px; font-style:italic;">(Forecast: ' + forecast + ')</p>'; //create the chart subtitle variable
                if (value == 100) {
                    color16 = '#00ff00'; //its green
                } else {
                    color16 = '#1e90ff'; //its light blue
                }


                Highcharts.chart(container, { //define the Highchart
                    colors: [color16, '#87cefa'], //series' colors
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '230',
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
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br><b>{point.percentage:.1f}%</b>',
                        backgroundColor: '#FFFFFF'
                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: false,
                                format: '<b>{point.name}</b>: {point.percentage:.2f} %',
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
                        size: '100%',
                        innerSize: '60%',
                        data: [{
                            name: 'Percent Complete',
                            y: value
                        }, {
                            name: 'Percent Not Complete',
                            y: 100 - value
                        }]
                    }]
                });
            });
        }


    </script>

    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetAROK2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadAROK2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadAROK2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator11('AROK2018NSBMILE', data, 'AROK NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator11(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('AROK2018NSBMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetILWI2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadILWI2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadILWI2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator12('ILWI2018NSBMILE', data, 'ILWI NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator12(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('ILWI2018NSBMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetMOKS2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadMOKS2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadMOKS2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator13('MOKS2018NSBMILE', data, 'MOKS NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator13(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('MOKS2018NSBMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetMNP2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadMNP2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadMNP2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator14('MNP2018NSBMILE', data, 'MNP NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator14(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('MNP2018NSBMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNTX2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNTX2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadNTX2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator15('NTX2018NSBMILE', data, 'NTX NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator15(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('NTX2018NSBMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetSTX2018NSBMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadSTX2018NSBMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadSTX2018NSBMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator16('STX2018NSBMILE', data, 'STX NSB Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator16(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('STX2018NSBMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">

        var chart2;

        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POENSB",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POENSB(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCENNBD2018POENSB(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CENNBD2018POENSB', 'Central Region Forecast vs Need By Date', 'New Site Builds');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: NBD_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Need By Date',
                id: 'Need By Date',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 7
            chart2.addSeries({
                name: 'Cumulative - NBD',
                id: 'Cumulative - NBD',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '520',
                    width: '1200'
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
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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

    <script type="text/javascript">

        var chart2;

        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POELTE1C",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POELTE1C(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCENNBD2018POELTE1C(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CENNBD2018POELTE1C', 'Central Region Forecast vs Need By Date', 'LTE 1C');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: NBD_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Need By Date',
                id: 'Need By Date',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 7
            chart2.addSeries({
                name: 'Cumulative - NBD',
                id: 'Cumulative - NBD',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '520',
                    width: '1200'
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
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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

    <script type="text/javascript">

        var chart2;

        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POELTEAC",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POELTEAC(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCENNBD2018POELTEAC(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CENNBD2018POELTEAC', 'Central Region Forecast vs Need By Date', 'LTE Additional Carriers');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: NBD_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Need By Date',
                id: 'Need By Date',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 7
            chart2.addSeries({
                name: 'Cumulative - NBD',
                id: 'Cumulative - NBD',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '520',
                    width: '1200'
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
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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
    <script type="text/javascript">

        var chart2;

        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POE4T4R",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POE4T4R(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCENNBD2018POE4T4R(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CENNBD2018POE4T4R', 'Central Region Forecast vs Need By Date', '4T4R');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: NBD_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Need By Date',
                id: 'Need By Date',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 7
            chart2.addSeries({
                name: 'Cumulative - NBD',
                id: 'Cumulative - NBD',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '520',
                    width: '1200'
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
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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
    <script type="text/javascript">

        var chart2;

        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POECRAN",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POECRAN(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCENNBD2018POECRAN(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CENNBD2018POECRAN', 'Central Region Forecast vs Need By Date', 'CRAN');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: NBD_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Need By Date',
                id: 'Need By Date',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 7
            chart2.addSeries({
                name: 'Cumulative - NBD',
                id: 'Cumulative - NBD',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '520',
                    width: '1200'
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
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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
    <script type="text/javascript">

        var chart2;

        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetCENNBD2018POEBWEHW",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadCENNBD2018POEBWEHW(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadCENNBD2018POEBWEHW(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CENNBD2018POEBWEHW', 'Central Region Forecast vs Need By Date', 'Bandwidth Expansions - Hardware');

            /*for (var j = 2; j < keys.length; j++) {
                 chart2.addSeries({
                     name: keys[j].replace("_", " "),
                     id: keys[j].replace("_", " "),
                     data: NBD_series_values[j],
                     animation: false,
                     showInLegend: true
                 }, false);
             }*/

            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'Need By Date',
                id: 'Need By Date',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 7
            chart2.addSeries({
                name: 'Cumulative - NBD',
                id: 'Cumulative - NBD',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#808080', '#2E8B57', '#87CEEB', '#A9A9A9', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 40,
                    zoomType: 'xy',
                    height: '520',
                    width: '1200'
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
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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

    <script type="text/javascript">

        /* Ajax call to load the donut1_drilldown chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut1_Drilldown",
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

            createDD1Colchart(DD1_series_values[0], 'Donut1_Drilldown', 'Central Region NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'RemainingForecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'NextMonthForecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'CurrMonthRemaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'CompleteCurrMonth',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'CompleteLastMonth',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'CompOtherMonths',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createDD1Colchart(chartxaxis, Donut1_Drilldown, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: Donut1_Drilldown,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 10,
                    zoomType: 'xy',
                    height: '470',
                    width: '600'
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    /*tooltip: { //define the tooltip - information shown on mouse hover over the chart
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
                        },*/
                    /*formatter: function () {
                        return '<b>' + this.x + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            'Total: ' + this.point.stackTotal;
                    },
                    formatter: function () {
                        var s = '<b>' + this.x + '</b>', sum = 0;
                        $.each(this.points, function (i, point) {
                            s += '<br/>' + point.series.name + ': ' + '<b>' +
                                point.y ;
                            sum += point.y;
                        });

                        s += '<br/>2018 Forecasted Total: ' + sum

                        return s;
                    }, */
                    headerFormat: '<span style="font-size:16px;" align="center";>{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script> 

    <script type="text/javascript">

        /* Ajax call to load the donut3_drilldown chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut3_Drilldown",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut3_Drilldown(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadDonut3_Drilldown(data) {
            DD3 = JSON.parse(data.d);
            var DD3_series_values = [];
            var keys = Object.keys(DD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < DD3.length; j++) {
                    if (k == 0) {
                        a.push(DD3[j][0]);
                    } else {
                        a.push(DD3[j][keys[k]]);
                    }
                }
                DD3_series_values.push(a);
            }

            createDD3Colchart(DD3_series_values[0], 'Donut3_Drilldown', 'Central Region LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createDD3Colchart(chartxaxis, Donut3_Drilldown, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: Donut3_Drilldown,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 10,
                    zoomType: 'xy',
                    height: '470',
                    width: '600'
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>

    <script type="text/javascript">

        /* Ajax call to load the NSB_breakdown_AROK chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNSB_breakdown_AROK",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNSB_breakdown_AROK(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadNSB_breakdown_AROK(data) {
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

            createAROKBD1Colchart(DD1_series_values[0], 'NSB_breakdown_AROK', 'AROK NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createAROKBD1Colchart(chartxaxis, NSB_breakdown_AROK, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: NSB_breakdown_AROK,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the NSB_breakdown_ILWI chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNSB_breakdown_ILWI",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNSB_breakdown_ILWI(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadNSB_breakdown_ILWI(data) {
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

            createILWIBD1Colchart(DD1_series_values[0], 'NSB_breakdown_ILWI', 'ILWI NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createILWIBD1Colchart(chartxaxis, NSB_breakdown_ILWI, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: NSB_breakdown_ILWI,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the NSB_breakdown_MOKS chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNSB_breakdown_MOKS",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNSB_breakdown_MOKS(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadNSB_breakdown_MOKS(data) {
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

            createMOKSBD1Colchart(DD1_series_values[0], 'NSB_breakdown_MOKS', 'MOKS NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createMOKSBD1Colchart(chartxaxis, NSB_breakdown_MOKS, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: NSB_breakdown_MOKS,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the NSB_breakdown_MNP chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNSB_breakdown_MNP",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNSB_breakdown_MNP(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadNSB_breakdown_MNP(data) {
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

            createMNPBD1Colchart(DD1_series_values[0], 'NSB_breakdown_MNP', 'MNP NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createMNPBD1Colchart(chartxaxis, NSB_breakdown_MNP, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: NSB_breakdown_MNP,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the NSB_breakdown_NTX chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNSB_breakdown_NTX",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNSB_breakdown_NTX(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadNSB_breakdown_NTX(data) {
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

            createNTXBD1Colchart(DD1_series_values[0], 'NSB_breakdown_NTX', 'NTX NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createNTXBD1Colchart(chartxaxis, NSB_breakdown_NTX, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: NSB_breakdown_NTX,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the NSB_breakdown_STX chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNSB_breakdown_STX",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNSB_breakdown_STX(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadNSB_breakdown_STX(data) {
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

            createSTXBD1Colchart(DD1_series_values[0], 'NSB_breakdown_STX', 'STX NSB Breakdown');

            var j = 17
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 16
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 8
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 7
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 6
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: DD1_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createSTXBD1Colchart(chartxaxis, NSB_breakdown_STX, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: NSB_breakdown_STX,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['WLL', 'BAU Cap', 'HRR', 'FNET', 'BAU Cov', 'BAU Spc'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
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
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut21 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut21",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut21(data);
            },
            error: function (data) {
            }
        });

        function loadDonut21(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'AROK LTE 1C'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut21', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut22 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut22",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut22(data);
            },
            error: function (data) {
            }
        });

        function loadDonut22(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'ILWI LTE 1C'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut22', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut23 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut23",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut23(data);
            },
            error: function (data) {
            }
        });

        function loadDonut23(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MOKS LTE 1C'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut23', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut24 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut24",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut24(data);
            },
            error: function (data) {
            }
        });

        function loadDonut24(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MNP LTE 1C'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut24', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut25 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut25",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut25(data);
            },
            error: function (data) {
            }
        });

        function loadDonut25(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'NTX LTE 1C'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut25', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut26 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut26",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut26(data);
            },
            error: function (data) {
            }
        });

        function loadDonut26(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'STX LTE 1C'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut26', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut31 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut31",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut31(data);
            },
            error: function (data) {
            }
        });

        function loadDonut31(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'AROK LTE AC'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut31', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut32 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut32",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut32(data);
            },
            error: function (data) {
            }
        });

        function loadDonut32(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'ILWI LTE AC'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut32', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut33 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut33",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut33(data);
            },
            error: function (data) {
            }
        });

        function loadDonut33(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MOKS LTE AC'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut33', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut34 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut34",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut34(data);
            },
            error: function (data) {
            }
        });

        function loadDonut34(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MNP LTE AC'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut34', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut35 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut35",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut35(data);
            },
            error: function (data) {
            }
        });

        function loadDonut35(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'NTX LTE AC'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut35', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">

        /* Ajax call to load the donut36 chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/Getdonut36",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadDonut36(data);
            },
            error: function (data) {
            }
        });

        function loadDonut36(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'STX LTE AC'; //put the data into variables to pass to a chart building function
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
            donutcharting101('donut36', Number(value), title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth); //call my chart building function
        }

        /* DONUT CHART CREATER */

    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetAROK2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadAROK2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadAROK2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator21('AROK2018LTE1CMILE', data, 'AROK LTE 1C Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator21(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('AROK2018LTE1CMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetILWI2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadILWI2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadILWI2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator22('ILWI2018LTE1CMILE', data, 'ILWI LTE 1C Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator22(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('ILWI2018LTE1CMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetMOKS2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadMOKS2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadMOKS2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator23('MOKS2018LTE1CMILE', data, 'MOKS LTE 1C Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator23(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('MOKS2018LTE1CMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetMNP2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadMNP2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadMNP2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator24('MNP2018LTE1CMILE', data, 'MNP LTE 1C Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator24(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('MNP2018LTE1CMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNTX2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNTX2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadNTX2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator25('NTX2018LTE1CMILE', data, 'NTX LTE 1C Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator25(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('NTX2018LTE1CMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetSTX2018LTE1CMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadSTX2018LTE1CMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadSTX2018LTE1CMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator26('STX2018LTE1CMILE', data, 'STX LTE 1C Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator26(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('STX2018LTE1CMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetAROK2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadAROK2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadAROK2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator31('AROK2018LTEACMILE', data, 'AROK LTE AC Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator31(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('AROK2018LTEACMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetILWI2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadILWI2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadILWI2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator32('ILWI2018LTEACMILE', data, 'ILWI LTE AC Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator32(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('ILWI2018LTEACMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetMOKS2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadMOKS2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadMOKS2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator33('MOKS2018LTEACMILE', data, 'MOKS LTE AC Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator33(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('MOKS2018LTEACMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetMNP2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadMNP2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadMNP2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator34('MNP2018LTEACMILE', data, 'MNP LTE AC Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator34(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('MNP2018LTEACMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetNTX2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadNTX2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadNTX2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator35('NTX2018LTEACMILE', data, 'NTX LTE AC Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator35(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('NTX2018LTEACMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>
    <script type="text/javascript">
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetSTX2018LTEACMILE",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadSTX2018LTEACMILE(data);
            },
            error: function (data) {
            }
        });

        /* HC SUMMARY CHART LOADER */
        function loadSTX2018LTEACMILE(data) {
            var percents = JSON.parse(data.d);
            var data = [percents[0]["JI022_PERCENT_COMPLETE"], percents[0]["SS020_PERCENT_COMPLETE"], percents[0]["RE020_PERCENT_COMPLETE"], percents[0]["CI025_PERCENT_COMPLETE"], percents[0]["CI020_PERCENT_COMPLETE"], percents[0]["CI050_PERCENT_COMPLETE"], percents[0]["PERCENT_COMPLETE"]]
            barChartCreator36('STX2018LTEACMILE', data, 'STX LTE AC Milestones');
        }

        /* BAR CHART CREATER */
        function barChartCreator36(container, data, title) {
            console.log(data);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });
            $(function () {
                Highcharts.chart('STX2018LTEACMILE', {
                    chart: {
                        type: 'bar',
                        height: '280',
                        width: '230'
                    },
                    colors: ['#87cefa'],
                    title: {
                        text: title,
                        align: 'center',
                        fontSize: '12px'
                    },
                    xAxis: {
                        categories: ['p-RFDS', 'f-RFDS', 'SAQ Cmp', 'Const Start', 'T Top Cmp', 'Const Cmp', 'On-Air Act'],
                        title: null
                    },
                    yAxis: {
                        min: 0,
                        max: 100,
                        title: {
                            text: 'Percent Complete',
                            align: 'middle'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                        pointFormat: '<br>{point.y}%</br>',
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            dataLabels: {
                                enabled: true,
                                format: '{y}%'
                            }
                        }
                    },
                    series: [{
                        name: '',
                        data: data
                    }]
                });
            });
        }
    </script>

    <script type="text/javascript">

        /* Ajax call to load the LTEAC_breakdown_AROK chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetLTEAC_breakdown_AROK",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadLTEAC_breakdown_AROK(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadLTEAC_breakdown_AROK(data) {
            LTEACAROKDD3 = JSON.parse(data.d);
            var LTEACAROKDD3_series_values = [];
            var keys = Object.keys(LTEACAROKDD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < LTEACAROKDD3.length; j++) {
                    if (k == 0) {
                        a.push(LTEACAROKDD3[j][0]);
                    } else {
                        a.push(LTEACAROKDD3[j][keys[k]]);
                    }
                }
                LTEACAROKDD3_series_values.push(a);
            }

            createLTEACAROKDD3Colchart(LTEACAROKDD3_series_values[0], 'LTEAC_breakdown_AROK', 'AROK LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: LTEACAROKDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: LTEACAROKDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: LTEACAROKDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: LTEACAROKDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: LTEACAROKDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: LTEACAROKDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createLTEACAROKDD3Colchart(chartxaxis, LTEAC_breakdown_AROK, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: LTEAC_breakdown_AROK,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    visible: true,
                    title: {
                        text: 'Project Counts',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            //fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the LTEAC_breakdown_ILWI chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetLTEAC_breakdown_ILWI",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadLTEAC_breakdown_ILWI(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadLTEAC_breakdown_ILWI(data) {
            LTEACILWIDD3 = JSON.parse(data.d);
            var LTEACILWIDD3_series_values = [];
            var keys = Object.keys(LTEACILWIDD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < LTEACILWIDD3.length; j++) {
                    if (k == 0) {
                        a.push(LTEACILWIDD3[j][0]);
                    } else {
                        a.push(LTEACILWIDD3[j][keys[k]]);
                    }
                }
                LTEACILWIDD3_series_values.push(a);
            }

            createLTEACILWIDD3Colchart(LTEACILWIDD3_series_values[0], 'LTEAC_breakdown_ILWI', 'ILWI LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: LTEACILWIDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: LTEACILWIDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: LTEACILWIDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: LTEACILWIDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: LTEACILWIDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: LTEACILWIDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createLTEACILWIDD3Colchart(chartxaxis, LTEAC_breakdown_ILWI, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: LTEAC_breakdown_ILWI,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    visible: true,
                    title: {
                        text: 'Project Counts',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            //fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the LTEAC_breakdown_MOKS chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetLTEAC_breakdown_MOKS",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadLTEAC_breakdown_MOKS(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadLTEAC_breakdown_MOKS(data) {
            LTEACMOKSDD3 = JSON.parse(data.d);
            var LTEACMOKSDD3_series_values = [];
            var keys = Object.keys(LTEACMOKSDD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < LTEACMOKSDD3.length; j++) {
                    if (k == 0) {
                        a.push(LTEACMOKSDD3[j][0]);
                    } else {
                        a.push(LTEACMOKSDD3[j][keys[k]]);
                    }
                }
                LTEACMOKSDD3_series_values.push(a);
            }

            createLTEACMOKSDD3Colchart(LTEACMOKSDD3_series_values[0], 'LTEAC_breakdown_MOKS', 'MOKS LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: LTEACMOKSDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: LTEACMOKSDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: LTEACMOKSDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: LTEACMOKSDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: LTEACMOKSDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: LTEACMOKSDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createLTEACMOKSDD3Colchart(chartxaxis, LTEAC_breakdown_MOKS, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: LTEAC_breakdown_MOKS,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    visible: true,
                    title: {
                        text: 'Project Counts',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            //fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the LTEAC_breakdown_MNP chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetLTEAC_breakdown_MNP",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadLTEAC_breakdown_MNP(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadLTEAC_breakdown_MNP(data) {
            LTEACMNPDD3 = JSON.parse(data.d);
            var LTEACMNPDD3_series_values = [];
            var keys = Object.keys(LTEACMNPDD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < LTEACMNPDD3.length; j++) {
                    if (k == 0) {
                        a.push(LTEACMNPDD3[j][0]);
                    } else {
                        a.push(LTEACMNPDD3[j][keys[k]]);
                    }
                }
                LTEACMNPDD3_series_values.push(a);
            }

            createLTEACMNPDD3Colchart(LTEACMNPDD3_series_values[0], 'LTEAC_breakdown_MNP', 'MNP LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: LTEACMNPDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: LTEACMNPDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: LTEACMNPDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: LTEACMNPDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: LTEACMNPDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: LTEACMNPDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createLTEACMNPDD3Colchart(chartxaxis, LTEAC_breakdown_MNP, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: LTEAC_breakdown_MNP,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    visible: true,
                    title: {
                        text: 'Project Counts',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            //fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the LTEAC_breakdown_NTX chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetLTEAC_breakdown_NTX",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadLTEAC_breakdown_NTX(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadLTEAC_breakdown_NTX(data) {
            LTEACNTXDD3 = JSON.parse(data.d);
            var LTEACNTXDD3_series_values = [];
            var keys = Object.keys(LTEACNTXDD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < LTEACNTXDD3.length; j++) {
                    if (k == 0) {
                        a.push(LTEACNTXDD3[j][0]);
                    } else {
                        a.push(LTEACNTXDD3[j][keys[k]]);
                    }
                }
                LTEACNTXDD3_series_values.push(a);
            }

            createLTEACNTXDD3Colchart(LTEACNTXDD3_series_values[0], 'LTEAC_breakdown_NTX', 'NTX LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: LTEACNTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: LTEACNTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: LTEACNTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: LTEACNTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: LTEACNTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: LTEACNTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createLTEACNTXDD3Colchart(chartxaxis, LTEAC_breakdown_NTX, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: LTEAC_breakdown_NTX,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    visible: true,
                    title: {
                        text: 'Project Counts',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            //fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>
    <script type="text/javascript">

        /* Ajax call to load the LTEAC_breakdown_STX chart data */
        $.ajax({
            type: "POST",
            async: true,
            url: "cappoegmw.aspx/GetLTEAC_breakdown_STX",
            data: JSON.stringify({}),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                loadLTEAC_breakdown_STX(data);
            },
            error: function (data) {
            }
        });

        /* DONUT DRILLDOWN CHART CREATER */
        function loadLTEAC_breakdown_STX(data) {
            LTEACSTXDD3 = JSON.parse(data.d);
            var LTEACSTXDD3_series_values = [];
            var keys = Object.keys(LTEACSTXDD3[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < LTEACSTXDD3.length; j++) {
                    if (k == 0) {
                        a.push(LTEACSTXDD3[j][0]);
                    } else {
                        a.push(LTEACSTXDD3[j][keys[k]]);
                    }
                }
                LTEACSTXDD3_series_values.push(a);
            }

            createLTEACSTXDD3Colchart(LTEACSTXDD3_series_values[0], 'LTEAC_breakdown_STX', 'STX LTE AC Breakdown');

            var j = 3
            chartmodcode.addSeries({
                name: 'Remaining Forecast',
                id: 'Remaining Forecast',
                data: LTEACSTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: 'Next Month Forecast',
                id: 'Next Month Forecast',
                data: LTEACSTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 9
            chartmodcode.addSeries({
                name: 'Curr Month Remaining',
                id: 'Curr Month Remaining',
                data: LTEACSTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: 'Complete Curr Month',
                id: 'Complete Curr Month',
                data: LTEACSTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 12
            chartmodcode.addSeries({
                name: 'Complete Last Month',
                id: 'Complete Last Month',
                data: LTEACSTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);
            var j = 11
            chartmodcode.addSeries({
                name: 'Comp Other Months',
                id: 'Comp Other Months',
                data: LTEACSTXDD3_series_values[j],
                animation: false,
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createLTEACSTXDD3Colchart(chartxaxis, LTEAC_breakdown_STX, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#87cefa', '#4da6ff', '#0066cc', '#00cc00', '#008000', '#003300']
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: LTEAC_breakdown_STX,
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
                        fontSize: '18px'
                    }
                },
                xAxis: {
                    categories: ['700 B-14', '700 B-17', '700 B-29', '850', 'AWS-1', 'AWS-1 & 3', 'AWS-3', 'PCS', 'WCS'],
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    column: { stacking: 'normal' },
                    series: {
                        groupPadding: 0.1,
                        pointPadding: 0.05,
                        marker: {
                            enabled: false
                        }
                    }
                },
                yAxis: [{//Primary yAxis
                    visible: true,
                    title: {
                        text: 'Project Counts',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            //fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

    </script>


</asp:Content>

