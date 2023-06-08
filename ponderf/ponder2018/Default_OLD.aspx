<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default_OLD.aspx.cs" Inherits="_Default_OLD" %>

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

    <style type="text/css">
        .box1 {
            width: 18px;
            height: 18px;
        }

        .box2 {
            height: 2px;
        }

        .box3 {
            height: 5px;
        }

        .backdarkgreen {
            background: #003300;
            display: inline-block;
        }

        .backmedgreen {
            background: #008000;
            display: inline-block;
        }

        .backlightgreen {
            background: #00cc00;
            display: inline-block;
        }

        .backverydarkblue {
            background: #00008b;
            display: inline-block;
        }

        .backdarkblue {
            background: #0066cc;
            display: inline-block;
        }

        .backmedblue {
            background: #4da6ff;
            display: inline-block;
        }

        .backlightblue {
            background: #87cefa;
            display: inline-block;
        }

        .backlightred {
            background: #ff3333;
            display: inline-block;
        }

        .cata {
            font-size: 12px;
            display: inline-block;
        }

        .titleback {
            background: #87cefa;
        }

        #donutrowlegend {
            text-align: left;
        }

        #donutrowlegend_MCA {
            text-align: left;
        }

        #donutrowlegend_CRAN {
            text-align: left;
        }

        #donutrowlegend_LTE1C {
            text-align: left;
        }

        #donutrowlegend_IB {
            text-align: left;
        }

        #donutrowlegend_BWESW {
            text-align: left;
        }

        #buttonrowcenter {
            text-align: center;
        }

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

        .link2 {
            color: #00008b;
            background-color: transparent;
            text-decoration: none;
        }


        a:link {
            color: #00008b;
            background-color: transparent;
            text-decoration: none;
        }

        a:hover {
            color: royalblue;
            background-color: transparent;
            text-decoration: underline;
        }

        a.menu_show {
            cursor: pointer;
        }

        a.menu_hide {
            cursor: pointer;
        }

        .right {
            float: right;
        }

        .left {
            float: left;
        }

        .highlightGreen {
            background-color: #9fdf9f !important;
        }

        .highlightRed {
            background-color: #ff9999 !important;
        }

        .highlightYellow {
            background-color: #ffff66 !important;
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
            scrolltoheader: true, //scroll to header each time after it's been expanded by the user?
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
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/11/19 - Last data snapshot is 11/8/19, issue is currently under investigation. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">RAN Capital Plan Production
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
                    <a href="/Default.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Dashboard
                        </span>
                    </a>
                </li>
            </ul>

        <%--Search Function--%>
        </div>
        <input type="search" id="txtSearch" value="" style="width: 425px; height: 35px; float: right;" placeholder="Search (FA, USID, Site ID, PACE Number, iPlan Job Number)" spellcheck="false" autocomplete="off" onkeypress="return searchKeyPress(event);" />

        <button type="button" class="btn btn-primary btn-md" id="btnSearch" data-toggle="modal" data-target="#m_modal_search">
            <span>
                <i class="fa flaticon-search"></i>
                <span>Search</span>
            </span>
        </button>

        <%--<input type="button" id="btnSearch" value="Search" class="btn btn-primary btn-md" data-toggle="modal" style="float: right;" data-target="#m_modal_search"/>--%>

        <%--End Search Function--%>
    </div>

    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <%--<div class="m-portlet__head-title">--%>
                    <h5 class="left">Date Of Data: &nbsp; </h5>
                    <h5 class="left" id="DATADATE"></h5>

                    <%--<h4 class="right">Market:</h4>--%>
                    <asp:Label ID="labelMarket" runat="server" Text="Region/Market: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                    <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                        <asp:ListItem Text=""></asp:ListItem>
                    </asp:DropDownList>

                    <%-- </div>--%>
                </div>
            </div>

            <div class="m-portlet__body">
                <%-- SELECTORS --%>

                <%--<div class="row" id="selectorrow" style="width: 99.5%; height: 3%; margin: 0.5%;">

                    <asp:Label ID="labelMarket" runat="server" Text="Market: &nbsp;&nbsp;" Visible="true" Font-Size="12" ForeColor="Black"></asp:Label>
                    <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                        <asp:ListItem Text=""></asp:ListItem>
                    </asp:DropDownList>

                </div>--%>

                <div class="box2 titleback">&nbsp;</div>

                <div id="market2_1" style="text-align: center; vertical-align: middle; color: black">
                    <h3 class="titleback" id="markettitle"></h3>
                </div>

                <div class="m-section">
                    <div class="row">
                        <div class="col-lg-5">
                            <!--begin::Portlet-->

                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon">
                                            <i class="flaticon-clipboard"></i>
                                        </span>
                                        <h3 class="m-portlet__head-text">Plan Numbers</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="m-portlet__body">
                                    <div class="row" id="titlerow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title1col" style="height: 100%;"></div>
                                        <div class="col-md-2" id="title2col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">Jobs</h6>
                                        </div>
                                        <div class="col-md-2" id="title3col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">FA's</h6>
                                        </div>
                                    </div>

                                    <div class="row" id="titlerow1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title11col" style="height: 100%;" title="All iPlan Jobs (Status: Issued, In Progress, Completed in Current Year)">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total Projects Issued</h6>
                                        </div>
                                        <div class="col-md-2" id="ALLIN_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="ALLIN"></h6>
                                        </div>
                                        <div class="col-md-2" id="ALLINFA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="ALLINFA"></h6>
                                        </div>

                                    </div>

                                    <div class="row" id="titlerow21" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title22col" style="height: 100%;" title="All iPlan Jobs (Status: Issued, In Progress, Completed in Current Year) Need By Date Year = Current Year or earlier">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total <span id="CUR_YRa"></span>&nbsp;POD</h6>
                                        </div>
                                        <div class="col-md-2" id="PODTOTAL_CUR_YR_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="PODTOTAL_CUR_YR"></h6>
                                        </div>
                                        <div class="col-md-2" id="PODTOTAL_CUR_YRFA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="PODTOTAL_CUR_YRFA"></h6>
                                        </div>

                                    </div>

                                    <div class="row" id="titlerow31" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title33col" style="height: 100%;" title="PACE Jobs (Status: Active or Complete) Plan Year = Current Year">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total <span id="CUR_YRb"></span>&nbsp;POE</h6>
                                        </div>
                                        <div class="col-md-2" id="POETOTAL_CUR_YR_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="POETOTAL_CUR_YR"></h6>
                                        </div>
                                        <div class="col-md-2" id="POETOTAL_CUR_YRFA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="POETOTAL_CUR_YRFA"></h6>
                                        </div>

                                    </div>

                                    <div class="row" id="titlerow41" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title44col" style="height: 100%;" title="PACE Jobs (Status: Active or Complete) Forecasted Year = Current Year">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total <span id="CUR_YRc"></span>&nbsp;Forecasted</h6>
                                        </div>
                                        <div class="col-md-2" id="FORETOTAL_CUR_YR_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="FORETOTAL_CUR_YR"></h6>
                                        </div>
                                        <div class="col-md-2" id="FORETOTAL_CUR_YRFA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="FORETOTAL_CUR_YRFA"></h6>
                                        </div>

                                    </div>

                                    <div class="row" id="titlerow51" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title55col" style="height: 100%;" title="PACE Jobs (Status: Complete) On-Air Actual Year = Current Year">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">Total <span id="CUR_YRd"></span>&nbsp;On Air</h6>
                                        </div>
                                        <div class="col-md-2" id="COMPTOTAL_CUR_YR_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="COMPTOTAL_CUR_YR"></h6>
                                        </div>
                                        <div class="col-md-2" id="COMPTOTAL_CUR_YRFA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="COMPTOTAL_CUR_YRFA"></h6>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row" id="titlerow61a" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-12" id="title62acol" style="text-align: center">
                                            <h5 class="m-subheader2__title m-subheader2__title--separator">Metrics</h5>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title2a_col" style="height: 100%;"></div>

                                        <div class="col-md-2" id="title5a_col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">#</h6>
                                        </div>
                                        <div class="col-md-2" id="title6a_col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">%</h6>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow61" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title65col" style="height: 100%;" title="PACE Jobs (Current Year Completed) On-Air Actual <= Need by Date">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator"><span id="CUR_YRe"></span>&nbsp;Jobs On Air by NBD</h6>
                                        </div>
                                        <div class="col-md-2" id="NBD_ON_TIME_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="NBD_ON_TIME"></h6>
                                        </div>
                                        <div class="col-md-2" id="NBD_ON_TIME_PERC_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="NBD_ON_TIME_PERC"></h6>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow71" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title75col" style="height: 100%;" title="All PACE Jobs (Not Completed) Current Date is Beyond Need by Date">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">Remaining Total Projects Issued Beyond NBD</h6>
                                        </div>
                                        <div class="col-md-2" id="ALLJOBS_NBD_LATE_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="ALLJOBS_NBD_LATE"></h6>
                                        </div>
                                        <div class="col-md-2" id="ALLJOBS_NBD_LATE_PERC_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="ALLJOBS_NBD_LATE_PERC"></h6>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow81" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-10" id="title85col" style="height: 100%;" title="Compares counts of jobs forecasted for that month on the first day of the month, to what actually got completed that month (1-month buffer on completions to allow for true-up)">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">30 Day Forecast Attainment</h6>
                                        </div>
                                        <div class="col-md-2">Pending</div>
                                        <%--<div class="col-md-2" id="DAY30FOREATTAIN_1" style="text-align: center; color: #00008b">
                                            <a class="menu_show" title="Toggle 30 Day Forecast Attainment History Chart">
                                                <h6 class="m-subheader__title m-subheader__title--separator" onmouseover="style.color='royalblue'" onmouseout="style.color='#00008b'" id="DAY30AVG"></h6>
                                            </a>
                                        </div>--%>
                                    </div>
                                    <div class="row" id="titlerow91" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-10" id="title95col" style="height: 100%;" title="Same as 30 Day Forecast Attainment except looks 90 Days back for forecasted amount">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">90 Day Forecast Attainment</h6>
                                        </div>
                                        <div class="col-md-2">Pending</div>
                                        <%--<div class="col-md-2" id="DAY90FOREATTAIN_1" style="text-align: center; color: #00008b">
                                            <a class="menu_show" title="Toggle 90 Day Forecast Attainment History Chart">
                                                <h6 class="m-subheader__title m-subheader__title--separator" onmouseover="style.color='royalblue'" onmouseout="style.color='#00008b'" id="DAY90AVG"></h6>
                                            </a>
                                        </div>--%>
                                    </div>
                                    <br />
                                    <a class="menu_hide">
                                        <div id="DAY30AVG_HISTORY" style="visibility: visible;"></div>
                                        <div id="DAY90AVG_HISTORY" style="visibility: visible;"></div>
                                    </a>
                                </div>
                            </div>


                        </div>
                        <div class="col-lg-7">
                            <!--begin::Portlet-->

                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon">
                                            <i class="flaticon-line-graph"></i>
                                        </span>
                                        <h3 class="m-portlet__head-text">Production Chart<small><span id="CUR_YRf"></span>&nbsp;Forecasted Jobs</small>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-portlet__body">
                                <div id="PRODUCTION_CHART" style="visibility: visible;"></div>
                            </div>
                        </div>
                    </div>

                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon">
                                    <i class="flaticon-analytics"></i>
                                </span>
                                <h3 class="m-portlet__head-text">Program Status and Market Details</h3>
                            </div>
                        </div>
                    </div>
                    <%--<div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <h3 class="m-portlet__head-text">Icon Tabs
                                </h3>
                            </div>
                        </div>
                    </div>--%>
                    <div class="m-portlet__body">

                        <%--<ul class="nav nav-tabs" role="tablist">
                            <li role="presentation"><a href="#m_tabs_1_1" aria-controls="m_tabs_1_1" role="tab" data-toggle="tab">Tab 1</a></li>
                            <li role="presentation" class="active"><a href="#m_tabs_1_2" aria-controls="m_tabs_1_2" role="tab" data-toggle="tab">Tab 2</a></li>
                            <li role="presentation"><a href="#m_tabs_1_3" aria-controls="m_tabs_1_3" role="tab" data-toggle="tab">Tab 3</a></li>
                            <li role="presentation"><a href="#m_tabs_1_4" aria-controls="m_tabs_1_4" role="tab" data-toggle="tab">Tab 4</a></li>
                            <li role="presentation"><a href="#m_tabs_1_5" aria-controls="m_tabs_1_5" role="tab" data-toggle="tab">Tab 5</a></li>
                        </ul>--%>


                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#m_tabs_1_1">
                                    <i class="flaticon-calendar"></i><span class="m--visible-desktop-inline-block"><span id="PREV_YR"></span>&nbsp;View</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#m_tabs_1_2">
                                    <i class="flaticon-event-calendar-symbol"></i><span class="m--visible-desktop-inline-block"><span id="CUR_YRg"></span>&nbsp;View</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#m_tabs_1_3">
                                    <i class="flaticon-calendar"></i><span class="m--visible-desktop-inline-block"><span id="CUR_YR_PLUS1"></span>&nbsp;View</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#m_tabs_1_4">
                                    <i class="flaticon-calendar"></i><span class="m--visible-desktop-inline-block"><span id="CUR_YR_PLUS2"></span>&nbsp;View</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#m_tabs_1_5">
                                    <i class="flaticon-calendar"></i><span class="m--visible-desktop-inline-block"><span id="CUR_YR_PLUS3"></span>&nbsp;View</span>
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane" id="m_tabs_1_1" role="tabpanel">
                                <div class="row" id="titlerow100prev_yr" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title100colprev_yr" style="text-align: center">
                                        <a title="Go to NSB Drilldown section">
                                            <h4 id="click1prev_yr" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_NSB();" onmouseover="mouseOver_NSBprev_yr();" onmouseout="mouseOut_NSBprev_yr();">New Site Build</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title200colprev_yr" style="text-align: center">
                                        <a title="Go to MCA Drilldown section">
                                            <h4 id="click2prev_yr" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_MCA();" onmouseover="mouseOver_MCAprev_yr();" onmouseout="mouseOut_MCAprev_yr();">MCA</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title300colprev_yr" style="text-align: center">
                                        <a title="Go to CRAN Drilldown section">
                                            <h4 id="click3prev_yr" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_CRAN();" onmouseover="mouseOver_CRANprev_yr();" onmouseout="mouseOut_CRANprev_yr();">CRAN</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title400colprev_yr" style="text-align: center">
                                        <a title="Go to Overlay Drilldown section">
                                            <h4 id="click4prev_yr" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_LTE1C();" onmouseover="mouseOver_LTE1Cprev_yr();" onmouseout="mouseOut_LTE1Cprev_yr();">Overlay</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title500colprev_yr" style="text-align: center">
                                        <a title="Go to In-Building Drilldown section">
                                            <h4 id="click5prev_yr" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_IB();" onmouseover="mouseOver_IBprev_yr();" onmouseout="mouseOut_IBprev_yr();">In-Building</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title600colprev_yr" style="text-align: center">
                                        <a title="Go to BWE SW Drilldown section">
                                            <h4 id="click6prev_yr" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_BWESW();" onmouseover="mouseOver_BWESWprev_yr();" onmouseout="mouseOut_BWESWprev_yr();">BWE SW</h4>
                                        </a>
                                    </div>
                                </div>
                                <%--<div class="row" id="titlerow200prev_yr" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title101colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_NSB_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title201colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_MCA_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title301colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_CRAN_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title401colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_LTE1C_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title501colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_IB_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title601colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_BWESW_PREV_YR"></h6>
                                    </div>
                                </div>
                                <div class="row" id="titlerow300prev_yr" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title102colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_NSB_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title202colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_MCA_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title302colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_CRAN_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title402colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_LTE1C_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title502colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_IB_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title602colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_BWESW_PREV_YR"></h6>
                                    </div>
                                </div>--%>
                                <div class="row" id="titlerow400prev_yr" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title103colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_NSB_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title203colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_MCA_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title303colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_CRAN_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title403colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_LTE1C_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title503colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_IB_PREV_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title603colprev_yr" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_BWESW_PREV_YR"></h6>
                                    </div>
                                </div>
                                <div class="row" id="donutrowprev_yr" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="donut1colprev_yr" style="height: 100%;">
                                        <div id="donut1prev_yr" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="donut2colprev_yr" style="height: 100%;">
                                        <div id="donut2prev_yr" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="donut3colprev_yr" style="height: 100%;">
                                        <div id="donut3prev_yr" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="donut4colprev_yr" style="height: 100%;">
                                        <div id="donut4prev_yr" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="donut5colprev_yr" style="height: 100%;">
                                        <div id="donut5prev_yr" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="donut6colprev_yr" style="height: 100%;">
                                        <div id="donut6prev_yr" style="visibility: visible;"></div>
                                    </div>
                                </div>

                                <div id="donutrowlegendprev_yr">

                                    <div class="box1 backmedgreen">&nbsp;</div>
                                    <div class="cata">&ensp;Completed &emsp;</div>
                                    <%--<div class="box1 backverydarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted 1Q &emsp;</div>
                                    <div class="box1 backdarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted 2Q &emsp;</div>
                                    <div class="box1 backmedblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted 3Q &emsp;</div>
                                    <div class="box1 backlightblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted 4Q &emsp;</div>
                                    <div class="box1 backlightred">&nbsp;</div>
                                    <div class="cata">&ensp;Not <span id="PREV_YRa"></span>&nbsp;Forecasted &emsp;</div>--%>
                                </div>
                                <br />
                                <br />
                                <div class="row" id="market_prev_yr_tablerow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="market_prev_yr_tablecol" style="height: 100%;">
                                        <div id="market-table1_prev_yr" style="visibility: visible;"></div>
                                    </div>
                                </div>
                                <br />
                                <div class="row" id="market_prev_yr_tablerow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="market_prev_yr_tablecol2" style="height: 100%;">
                                        <div id="market-table2_prev_yr" style="visibility: visible;"></div>
                                    </div>
                                </div>
                                <br />

                                <div class="row" id="CLICK_PREV_YR_TITLEROW1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="CLICK_PREV_YR_TITLE1_1" style="text-align: center; color: #00008b">
                                        
                                        <%--<a title="Download CSV for Completed Jobs">
                                            <h4 id="CLICK_PREV_YR" class="m-subheader2__title m-subheader2__title--separator link2" onmouseover="mouseOver_link('CLICK_PREV_YR');" onmouseout="mouseOut_link('CLICK_PREV_YR');">Download CSV ALL&nbsp;<span id="PREV_YRb"></span>&nbsp;Completed Jobs</h4>
                                        </a>
                                        <div id="loading_1" style='display: none'>
                                            <img src="ajax-loader_2.gif" />&nbsp; Loading and Creating CSV...(Please be patient)
                                        </div>--%>

                                        <button runat="server" id="Button2" class="btn btn-primary btn-lg" title="CSV Export" onserverclick="ExportToExcel_prevyr">Download CSV ALL&nbsp;<span id="PREV_YRb"></span>&nbsp;Completed Jobs</button>
                                        <h6>Please be patient with large geographic area exports.</h6>

                                    </div>
                                </div>

                            </div>

                            <div class="tab-pane active" id="m_tabs_1_2" role="tabpanel">
                                <div class="row" id="titlerow100" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title100col" style="text-align: center">
                                        <a title="Go to NSB Drilldown section">
                                            <h4 id="click1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_NSB();" onmouseover="mouseOver_NSB();" onmouseout="mouseOut_NSB();">New Site Build</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title200col" style="text-align: center">
                                        <a title="Go to MCA Drilldown section">
                                            <h4 id="click2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_MCA();" onmouseover="mouseOver_MCA();" onmouseout="mouseOut_MCA();">MCA</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title300col" style="text-align: center">
                                        <a title="Go to CRAN Drilldown section">
                                            <h4 id="click3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_CRAN();" onmouseover="mouseOver_CRAN();" onmouseout="mouseOut_CRAN();">CRAN</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title400col" style="text-align: center">
                                        <a title="Go to Overlay Drilldown section">
                                            <h4 id="click4" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_LTE1C();" onmouseover="mouseOver_LTE1C();" onmouseout="mouseOut_LTE1C();">Overlay</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title500col" style="text-align: center">
                                        <a title="Go to In-Building Drilldown section">
                                            <h4 id="click5" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_IB();" onmouseover="mouseOver_IB();" onmouseout="mouseOut_IB();">In-Building</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title600col" style="text-align: center">
                                        <a title="Go to BWE SW Drilldown section">
                                            <h4 id="click6" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_BWESW();" onmouseover="mouseOver_BWESW();" onmouseout="mouseOut_BWESW();">BWE SW</h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="row" id="titlerow200" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title101col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_NSB_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title201col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_MCA_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title301col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_CRAN_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title401col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_LTE1C_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title501col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_IB_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title601col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="POE_BWESW_CUR_YR"></h6>
                                    </div>
                                </div>
                                <div class="row" id="titlerow300" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title102col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_NSB_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title202col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_MCA_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title302col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_CRAN_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title402col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_LTE1C_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title502col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_IB_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title602col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_BWESW_CUR_YR"></h6>
                                    </div>
                                </div>
                                <div class="row" id="titlerow400" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title103col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_NSB_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title203col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_MCA_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title303col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_CRAN_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title403col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_LTE1C_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title503col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_IB_CUR_YR"></h6>
                                    </div>
                                    <div class="col-md-2" id="title603col" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="COMP_BWESW_CUR_YR"></h6>
                                    </div>
                                </div>
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

                                <div id="donutrowlegend">

                                    <div class="box1 backmedgreen">&nbsp;</div>
                                    <div class="cata">&ensp;Completed &emsp;</div>
                                    <div class="box1 backverydarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Remaining Forecasted 1Q &emsp;</div>
                                    <div class="box1 backdarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Remaining Forecasted 2Q &emsp;</div>
                                    <div class="box1 backmedblue">&nbsp;</div>
                                    <div class="cata">&ensp;Remaining Forecasted 3Q &emsp;</div>
                                    <div class="box1 backlightblue">&nbsp;</div>
                                    <div class="cata">&ensp;Remaining Forecasted 4Q &emsp;</div>
                                    <div class="box1 backlightred">&nbsp;</div>
                                    <div class="cata">&ensp;Not <span id="CUR_YRh"></span>&nbsp;Forecasted &emsp;</div>
                                </div>
                                <br />
                                <br />
                                <div class="row" id="market_tablerow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="market_tablecol" style="height: 100%;">
                                        <div id="market-table1" style="visibility: visible;"></div>
                                    </div>
                                </div>
                                <br />
                                <div class="row" id="market_tablerow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="market_tablecol2" style="height: 100%;">
                                        <div id="market-table2" style="visibility: visible;"></div>
                                    </div>
                                </div>
                                <br />

                                <div class="row" id="CLICK_CURR_YR_TITLEROW1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="CLICK_CURR_YR_TITLE1_1" style="text-align: center; color: #00008b">
                                        
                                        <%--<a title="Download CSV for Forecasted Jobs">
                                            <h4 id="CLICK_CURR_YR" class="m-subheader2__title m-subheader2__title--separator link2" onmouseover="mouseOver_link('CLICK_CURR_YR');" onmouseout="mouseOut_link('CLICK_CURR_YR');">Download CSV ALL&nbsp;<span id="CUR_YRi"></span>&nbsp;Forecasted Jobs</h4>
                                        </a>
                                        <div id="loading" style='display: none'>
                                            <img src="ajax-loader_2.gif" />&nbsp; Loading and Creating CSV...(Please be patient)
                                        </div>--%>

                                        <button runat="server" id="Button1" class="btn btn-primary btn-lg" title="CSV Export" onserverclick="ExportToExcel_curryr">Download CSV ALL&nbsp;<span id="CUR_YRi"></span>&nbsp;Forecasted Jobs</button>                                        
                                        <h6>Please be patient with large geographic area exports.</h6>

                                    </div>
                                </div>

                                <%--<div id="loading">
                                    <img src="Preloader_8.gif" />
                                    Loading...(may take a couple of minutes for table generation)</div>
                                <div id="CUR_YR_ALLIN" style="visibility: visible;"></div>--%>

                                <%--<div class="m-section__content" style="height: 400px; width: 1450px;">
                            <table id="tabCUR_YR_ALLIN" class="table; compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">PACE Number</th>                                        
                                        <th bgcolor="#87CEFA">Status</th>
                                        <th bgcolor="#87CEFA">C&E Program</th>
                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                        <th bgcolor="#87CEFA">RAN Region</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Sub-Market</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Product Group</th>
                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                        <th bgcolor="#87CEFA">National Program</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Current Need By Date</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>PACE Number</th>                                        
                                        <th>Status</th>
                                        <th>C&E Program</th>
                                        <th>iPlan Job</th>
                                        <th>RAN Region</th>
                                        <th>Market</th>
                                        <th>Sub-Market</th>
                                        <th>Latitude</th>
                                        <th>Longitude</th>
                                        <th>Product Group</th>
                                        <th>Product Subgroup</th>
                                        <th>National Program</th>
                                        <th>USID</th>
                                        <th>FA Code</th>
                                        <th>Current Need By Date</th>
                                        <th>On Air Plan</th>
                                        <th>On Air Forecast</th>
                                        <th>On Air Actual</th>
                                        <th>PACE Name</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>--%>
                            </div>

                            <div class="tab-pane" id="m_tabs_1_3" role="tabpanel">
                                <div class="row" id="titlerow100plus1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title100colplus1" style="text-align: center">
                                        <a title="Go to NSB Drilldown section">
                                            <h4 id="click1plus1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_NSB();" onmouseover="mouseOver_NSBplus1();" onmouseout="mouseOut_NSBplus1();">New Site Build</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title200colplus1" style="text-align: center">
                                        <a title="Go to MCA Drilldown section">
                                            <h4 id="click2plus1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_MCA();" onmouseover="mouseOver_MCAplus1();" onmouseout="mouseOut_MCAplus1();">MCA</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title300colplus1" style="text-align: center">
                                        <a title="Go to CRAN Drilldown section">
                                            <h4 id="click3plus1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_CRAN();" onmouseover="mouseOver_CRANplus1();" onmouseout="mouseOut_CRANplus1();">CRAN</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title400colplus1" style="text-align: center">
                                        <a title="Go to Overlay Drilldown section">
                                            <h4 id="click4plus1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_LTE1C();" onmouseover="mouseOver_LTE1Cplus1();" onmouseout="mouseOut_LTE1Cplus1();">Overlay</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title500colplus1" style="text-align: center">
                                        <a title="Go to In-Building Drilldown section">
                                            <h4 id="click5plus1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_IB();" onmouseover="mouseOver_IBplus1();" onmouseout="mouseOut_IBplus1();">In-Building</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title600colplus1" style="text-align: center">
                                        <a title="Go to BWE SW Drilldown section">
                                            <h4 id="click6plus1" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_BWESW();" onmouseover="mouseOver_BWESWplus1();" onmouseout="mouseOut_BWESWplus1();">BWE SW</h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="row" id="titlerow300plus1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title102colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_NSB_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title202colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_MCA_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title302colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_CRAN_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title402colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_LTE1C_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title502colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_IB_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title602colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_BWESW_CUR_YR_PLUS1"></h6>
                                    </div>
                                </div>
                                <div class="row" id="titlerow400plus1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title103colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_NSB_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title203colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_MCA_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title303colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_CRAN_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title403colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_LTE1C_CUR_YR_PLUS1"></h6>
                                    </div>
                                    <div class="col-md-2" id="title503colplus1" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_IB_CUR_YR_PLUS1"></h6>
                                    </div>
                                </div>
                                <div class="row" id="forecastrowplus1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="forecast1colplus1" style="height: 100%;">
                                        <div id="forecast1plus1" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast2colplus1" style="height: 100%;">
                                        <div id="forecast2plus1" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast3colplus1" style="height: 100%;">
                                        <div id="forecast3plus1" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast4colplus1" style="height: 100%;">
                                        <div id="forecast4plus1" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast5colplus1" style="height: 100%;">
                                        <div id="forecast5plus1" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast6colplus1" style="height: 100%;">
                                        <div id="forecast6plus1" style="visibility: visible;"></div>
                                    </div>
                                </div>

                                <div id="forecastrowlegendplus1">
                                    <div class="box1 backmedblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted &emsp;</div>
                                    <div class="box1 backverydarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Site Acq Complete &emsp;</div>
                                </div>
                                <br />

                                <div class="row" id="CLICK_CURR_YR_PLUS1_TITLEROW1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="CLICK_CURR_YR_PLUS1_TITLE1_1" style="text-align: center; color: #00008b">
                                        
                                        <%--<a title="Download CSV for Forecasted Jobs">
                                            <h4 id="CLICK_CURR_YR_PLUS1" class="m-subheader2__title m-subheader2__title--separator link2" onmouseover="mouseOver_link('CLICK_CURR_YR_PLUS1');" onmouseout="mouseOut_link('CLICK_CURR_YR_PLUS1');">Download CSV ALL&nbsp;<span id="CUR_YR_PLUS1a"></span>&nbsp;Forecasted Jobs</h4>
                                        </a>
                                        <div id="loading1" style='display: none'>
                                            <img src="ajax-loader_2.gif" />&nbsp; Loading and Creating CSV...(Please be patient)
                                        </div>--%>

                                        <button runat="server" id="Button3" class="btn btn-primary btn-lg" title="CSV Export" onserverclick="ExportToExcel_curryr_plus1">Download CSV ALL&nbsp;<span id="CUR_YR_PLUS1a"></span>&nbsp;Forecasted Jobs</button>
                                        <h6>Please be patient with large geographic area exports.</h6>

                                    </div>
                                </div>

                                <%--<div id="CUR_YR_PLUS1_ALLIN" style="visibility: visible;"></div>
                        <br />
                        <div class="m-section__content" style="height: 400px; width: 1450px;">
                            <table id="tabCUR_YR_PLUS1_ALLIN" class="table; compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">PACE Number</th>                                        
                                        <th bgcolor="#87CEFA">Status</th>
                                        <th bgcolor="#87CEFA">C&E Program</th>
                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                        <th bgcolor="#87CEFA">RAN Region</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Sub-Market</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Product Group</th>
                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                        <th bgcolor="#87CEFA">National Program</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Current Need By Date</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>PACE Number</th>                                        
                                        <th>Status</th>
                                        <th>C&E Program</th>
                                        <th>iPlan Job</th>
                                        <th>RAN Region</th>
                                        <th>Market</th>
                                        <th>Sub-Market</th>
                                        <th>Latitude</th>
                                        <th>Longitude</th>
                                        <th>Product Group</th>
                                        <th>Product Subgroup</th>
                                        <th>National Program</th>
                                        <th>USID</th>
                                        <th>FA Code</th>
                                        <th>Current Need By Date</th>
                                        <th>On Air Plan</th>
                                        <th>On Air Forecast</th>
                                        <th>On Air Actual</th>
                                        <th>PACE Name</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>--%>
                            </div>
                            <div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
                                <div class="row" id="titlerow100plus2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title100colplus2" style="text-align: center">
                                        <a title="Go to NSB Drilldown section">
                                            <h4 id="click1plus2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_NSB();" onmouseover="mouseOver_NSBplus2();" onmouseout="mouseOut_NSBplus2();">New Site Build</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title200colplus2" style="text-align: center">
                                        <a title="Go to MCA Drilldown section">
                                            <h4 id="click2plus2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_MCA();" onmouseover="mouseOver_MCAplus2();" onmouseout="mouseOut_MCAplus2();">MCA</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title300colplus2" style="text-align: center">
                                        <a title="Go to CRAN Drilldown section">
                                            <h4 id="click3plus2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_CRAN();" onmouseover="mouseOver_CRANplus2();" onmouseout="mouseOut_CRANplus2();">CRAN</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title400colplus2" style="text-align: center">
                                        <a title="Go to Overlay Drilldown section">
                                            <h4 id="click4plus2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_LTE1C();" onmouseover="mouseOver_LTE1Cplus2();" onmouseout="mouseOut_LTE1Cplus2();">Overlay</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title500colplus2" style="text-align: center">
                                        <a title="Go to In-Building Drilldown section">
                                            <h4 id="click5plus2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_IB();" onmouseover="mouseOver_IBplus2();" onmouseout="mouseOut_IBplus2();">In-Building</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title600colplus2" style="text-align: center">
                                        <a title="Go to BWE SW Drilldown section">
                                            <h4 id="click6plus2" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_BWESW();" onmouseover="mouseOver_BWESWplus2();" onmouseout="mouseOut_BWESWplus2();">BWE SW</h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="row" id="titlerow300plus2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title102colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_NSB_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title202colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_MCA_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title302colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_CRAN_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title402colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_LTE1C_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title502colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_IB_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title602colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_BWESW_CUR_YR_PLUS2"></h6>
                                    </div>
                                </div>
                                <div class="row" id="titlerow400plus2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title103colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_NSB_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title203colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_MCA_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title303colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_CRAN_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title403colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_LTE1C_CUR_YR_PLUS2"></h6>
                                    </div>
                                    <div class="col-md-2" id="title503colplus2" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_IB_CUR_YR_PLUS2"></h6>
                                    </div>
                                </div>
                                <div class="row" id="forecastrowplus2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="forecast1colplus2" style="height: 100%;">
                                        <div id="forecast1plus2" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast2colplus2" style="height: 100%;">
                                        <div id="forecast2plus2" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast3colplus2" style="height: 100%;">
                                        <div id="forecast3plus2" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast4colplus2" style="height: 100%;">
                                        <div id="forecast4plus2" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast5colplus2" style="height: 100%;">
                                        <div id="forecast5plus2" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast6colplus2" style="height: 100%;">
                                        <div id="forecast6plus2" style="visibility: visible;"></div>
                                    </div>
                                </div>

                                <div id="forecastrowlegendplus2">
                                    <div class="box1 backmedblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted &emsp;</div>
                                    <div class="box1 backverydarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Site Acq Complete &emsp;</div>
                                </div>
                                <br />

                                <div class="row" id="CLICK_CURR_YR_PLUS2_TITLEROW1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="CLICK_CURR_YR_PLUS2_TITLE1_1" style="text-align: center; color: #00008b">
                                        
                                        <%--<a title="Download CSV for Forecasted Jobs">
                                            <h4 id="CLICK_CURR_YR_PLUS2" class="m-subheader2__title m-subheader2__title--separator link2" onmouseover="mouseOver_link('CLICK_CURR_YR_PLUS2');" onmouseout="mouseOut_link('CLICK_CURR_YR_PLUS2');">Download CSV ALL&nbsp;<span id="CUR_YR_PLUS2a"></span>&nbsp;Forecasted Jobs</h4>
                                        </a>
                                        <div id="ajax-loader_2" style='display: none'>
                                            <img src="ajax-loader_2.gif" />&nbsp; Loading and Creating CSV...(Please be patient)
                                        </div>--%>

                                        <button runat="server" id="Button4" class="btn btn-primary btn-lg" title="CSV Export" onserverclick="ExportToExcel_curryr_plus2">Download CSV ALL&nbsp;<span id="CUR_YR_PLUS2a"></span>&nbsp;Forecasted Jobs</button>
                                        <h6>Please be patient with large geographic area exports.</h6>

                                    </div>
                                </div>

                                <%-- <div id="CUR_YR_PLUS2_ALLIN" style="visibility: visible;"></div>
                        <br />
                        <div class="m-section__content" style="height: 400px; width: 1450px;">
                            <table id="tabCUR_YR_PLUS2_ALLIN" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">PACE Number</th>                                        
                                        <th bgcolor="#87CEFA">Status</th>
                                        <th bgcolor="#87CEFA">C&E Program</th>
                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                        <th bgcolor="#87CEFA">RAN Region</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Sub-Market</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Product Group</th>
                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                        <th bgcolor="#87CEFA">National Program</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Current Need By Date</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>PACE Number</th>                                        
                                        <th>Status</th>
                                        <th>C&E Program</th>
                                        <th>iPlan Job</th>
                                        <th>RAN Region</th>
                                        <th>Market</th>
                                        <th>Sub-Market</th>
                                        <th>Latitude</th>
                                        <th>Longitude</th>
                                        <th>Product Group</th>
                                        <th>Product Subgroup</th>
                                        <th>National Program</th>
                                        <th>USID</th>
                                        <th>FA Code</th>
                                        <th>Current Need By Date</th>
                                        <th>On Air Plan</th>
                                        <th>On Air Forecast</th>
                                        <th>On Air Actual</th>
                                        <th>PACE Name</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>--%>
                            </div>
                            <div class="tab-pane" id="m_tabs_1_5" role="tabpanel">
                                <div class="row" id="titlerow100plus3" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title100colplus3" style="text-align: center">
                                        <a title="Go to NSB Drilldown section">
                                            <h4 id="click1plus3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_NSB();" onmouseover="mouseOver_NSBplus3();" onmouseout="mouseOut_NSBplus3();">New Site Build</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title200colplus3" style="text-align: center">
                                        <a title="Go to MCA Drilldown section">
                                            <h4 id="click2plus3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_MCA();" onmouseover="mouseOver_MCAplus3();" onmouseout="mouseOut_MCAplus3();">MCA</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title300colplus3" style="text-align: center">
                                        <a title="Go to CRAN Drilldown section">
                                            <h4 id="click3plus3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_CRAN();" onmouseover="mouseOver_CRANplus3();" onmouseout="mouseOut_CRANplus3();">CRAN</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title400colplus3" style="text-align: center">
                                        <a title="Go to Overlay Drilldown section">
                                            <h4 id="click4plus3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_LTE1C();" onmouseover="mouseOver_LTE1Cplus3();" onmouseout="mouseOut_LTE1Cplus3();">Overlay</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title500colplus3" style="text-align: center">
                                        <a title="Go to In-Building Drilldown section">
                                            <h4 id="click5plus3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_IB();" onmouseover="mouseOver_IBplus3();" onmouseout="mouseOut_IBplus3();">In-Building</h4>
                                        </a>
                                    </div>
                                    <div class="col-md-2" id="title600colplus3" style="text-align: center">
                                        <a title="Go to BWE SW Drilldown section">
                                            <h4 id="click6plus3" class="m-subheader2__title m-subheader2__title--separator link2" onclick="ClickLink_BWESW();" onmouseover="mouseOver_BWESWplus3();" onmouseout="mouseOut_BWESWplus3();">BWE SW</h4>
                                        </a>
                                    </div>
                                </div>
                                <div class="row" id="titlerow300plus3" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title102colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_NSB_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title202colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_MCA_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title302colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_CRAN_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title402colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_LTE1C_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title502colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_IB_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title602colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="FORE_BWESW_CUR_YR_PLUS3"></h6>
                                    </div>
                                </div>
                                <div class="row" id="titlerow400plus3" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="title103colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_NSB_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title203colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_MCA_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title303colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_CRAN_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title403colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_LTE1C_CUR_YR_PLUS3"></h6>
                                    </div>
                                    <div class="col-md-2" id="title503colplus3" style="text-align: center">
                                        <h6 class="m-portlet__head-text" id="RE020_IB_CUR_YR_PLUS3"></h6>
                                    </div>
                                </div>
                                <div class="row" id="forecastrowplus3" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-2" id="forecast1colplus3" style="height: 100%;">
                                        <div id="forecast1plus3" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast2colplus3" style="height: 100%;">
                                        <div id="forecast2plus3" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast3colplus3" style="height: 100%;">
                                        <div id="forecast3plus3" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast4colplus3" style="height: 100%;">
                                        <div id="forecast4plus3" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast5colplus3" style="height: 100%;">
                                        <div id="forecast5plus3" style="visibility: visible;"></div>
                                    </div>
                                    <div class="col-md-2" id="forecast6colplus3" style="height: 100%;">
                                        <div id="forecast6plus3" style="visibility: visible;"></div>
                                    </div>
                                </div>

                                <div id="forecastrowlegendplus3">
                                    <div class="box1 backmedblue">&nbsp;</div>
                                    <div class="cata">&ensp;Forecasted &emsp;</div>
                                    <div class="box1 backverydarkblue">&nbsp;</div>
                                    <div class="cata">&ensp;Site Acq Complete &emsp;</div>
                                </div>
                                <br />

                                <div class="row" id="CLICK_CURR_YR_PLUS3_TITLEROW1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                    <div class="col-md-12" id="CLICK_CURR_YR_PLUS3_TITLE1_1" style="text-align: center; color: #00008b">
                                        
                                        <%--<a title="Download CSV for Forecasted Jobs">
                                            <h4 id="CLICK_CURR_YR_PLUS3" class="m-subheader2__title m-subheader2__title--separator link2" onmouseover="mouseOver_link('CLICK_CURR_YR_PLUS3');" onmouseout="mouseOut_link('CLICK_CURR_YR_PLUS3');">Download CSV ALL&nbsp;<span id="CUR_YR_PLUS3a"></span>&nbsp;Forecasted Jobs</h4>
                                        </a>
                                        <div id="loading3" style='display: none'>
                                            <img src="ajax-loader_2.gif" />&nbsp; Loading and Creating CSV...(Please be patient)
                                        </div>--%>

                                        <button runat="server" id="Button5" class="btn btn-primary btn-lg" title="CSV Export" onserverclick="ExportToExcel_curryr_plus3">Download CSV ALL&nbsp;<span id="CUR_YR_PLUS3a"></span>&nbsp;Forecasted Jobs</button>
                                        <h6>Please be patient with large geographic area exports.</h6>

                                    </div>
                                </div>

                                <%--                                 <div id="CUR_YR_PLUS3_ALLIN" style="visibility: visible;"></div>
                        <br />
                        <div class="m-section__content" style="height: 400px; width: 1450px;">
                            <table id="tabCUR_YR_PLUS3_ALLIN" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">PACE Number</th>                                        
                                        <th bgcolor="#87CEFA">Status</th>
                                        <th bgcolor="#87CEFA">C&E Program</th>
                                        <th bgcolor="#87CEFA">iPlan Job</th>
                                        <th bgcolor="#87CEFA">RAN Region</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Sub-Market</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Product Group</th>
                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                        <th bgcolor="#87CEFA">National Program</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Current Need By Date</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>PACE Number</th>                                        
                                        <th>Status</th>
                                        <th>C&E Program</th>
                                        <th>iPlan Job</th>
                                        <th>RAN Region</th>
                                        <th>Market</th>
                                        <th>Sub-Market</th>
                                        <th>Latitude</th>
                                        <th>Longitude</th>
                                        <th>Product Group</th>
                                        <th>Product Subgroup</th>
                                        <th>National Program</th>
                                        <th>USID</th>
                                        <th>FA Code</th>
                                        <th>Current Need By Date</th>
                                        <th>On Air Plan</th>
                                        <th>On Air Forecast</th>
                                        <th>On Air Actual</th>
                                        <th>PACE Name</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary" style="display: none;" id="Modal1000" data-toggle="modal" data-target="#MyModal">Launch Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="MyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                            <h4 class="modal-title" id="myModalLabel">Total Projects Issued Details</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Testing data ...
                        <h6 class="m-subheader__title m-subheader__title--separator">Total Projects Issued: <span id="MODAL_ALLIN"></span></h6>
                            <h6 class="m-subheader__title m-subheader__title--separator">Site Acq Complete: <span id="MODAL_BWESW"></span></h6>
                            Line 3 Table
                            <div id="Sunburst1" style="visibility: visible;"></div>
                            <div id="containerdemo" style="visibility: visible;"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

    <!-- Search Modal -->
    <div class="modal fade" id="m_modal_search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Search Results</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_SEARCH_MAP" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH" style='display: none'>No data found, please check input.</div>
                    <div id="ModalDisplay">
                        <div class="row" id="DisplayInfoRow">
                            <div class="col-md-7" id="InfoCol1_1">
                                <div id="mysearchmap" style="width: 700px; height: 400px; border: 1px solid #AAA;"></div>
                            </div>
                            <div class="col-md-5" id="InfoCol1_2" style="text-align: center; color: black">
                                <h3 class="m-subheader2__title m-subheader2__title--separator" id="DisplaySitename"></h3>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayUSID"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFACODE"></h4>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayREGION"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayMARKET"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplaySUBMARKET"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayADDRESS"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCITY"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayZIP"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayLAT"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayLNG"></h5>
                            </div>
                        </div>
                        <br />

                        <div class="m-section__content" style="height: 400px; width: 1200px;">
                            <table id="tabMapSearchTable" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Site Name</th>
                                        <th bgcolor="#87CEFA">Job Number</th>
                                        <th bgcolor="#87CEFA">iPlan Status</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Status</th>                                        
                                        <th bgcolor="#87CEFA">Oracle PTN</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA">Need By Date</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Product Group</th>
                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>  
                                        <th bgcolor="#87CEFA">Project Manager</th>
                                        <th bgcolor="#87CEFA">Civil Vendor</th>
                                        <th bgcolor="#87CEFA">RF Engineer</th>
                                        <th bgcolor="#87CEFA">RFDS ID</th>
                                        <th bgcolor="#87CEFA">RFDS Owner</th>
                                        <th bgcolor="#87CEFA">RFDS State</th>
                                        <th bgcolor="#87CEFA">pRFDS Complete (JI022)</th>
                                        <th bgcolor="#87CEFA">fRFDS Complete (SS020)</th>
                                        <th bgcolor="#87CEFA">SAQ Forecast (RE020)</th>
                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                        <th bgcolor="#87CEFA">Const Start (CI025)</th>
                                        <th bgcolor="#87CEFA">T Top Comp (CI020)</th>
                                        <th bgcolor="#87CEFA">Const Comp (CI050)</th>                                        
                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                        <th bgcolor="#87CEFA">PM ATTUID</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>        
        //ATTACH CLICK HANDLERS
        //$(document).ajaxStart(function() {
        //    $("#loading").show();
        //}).ajaxStop(function() {
        //    $("#loading").hide();
        //});

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
                    var market_long = $('#ddlMarket option:selected').text();
                    console.log(market_long);
                    console.log(market);
                    Getmarketdata(market);


                    document.getElementById('markettitle').innerHTML = market_long;
                    //document.getElementById('CLICK_PREV_YR').onclick = function () { getFORECAST_PREV_YR(market); };
                    //document.getElementById('CLICK_CURR_YR').onclick = function () { getFORECAST_CURR_YR(market); };
                    //document.getElementById('CLICK_CURR_YR_PLUS1').onclick = function () { getFORECAST_CURR_YR_PLUS1(market); };
                    //document.getElementById('CLICK_CURR_YR_PLUS2').onclick = function () { getFORECAST_CURR_YR_PLUS2(market); };
                    //document.getElementById('CLICK_CURR_YR_PLUS3').onclick = function () { getFORECAST_CURR_YR_PLUS3(market); };

                    // Do something with val1 and val2 ...
                }
            );

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCURRYEAR",
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

        function searchKeyPress(e) {
            // look for window.event in case event isn't passed in
            e = e || window.event;
            if (e.keyCode == 13) {
                document.getElementById('btnSearch').click();
                return false;
            }
            return true;
        }

        $(function () {

            $("#btnSearch").click(function () {
                $('#LOADING_SEARCH_MAP').show();
                $('#NODATA_SEARCH').hide();
                $('#ModalDisplay').hide();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/GetSearchAll",
                    data: "{name: '" + $("#txtSearch").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#LOADING_SEARCH_MAP').hide();
                        $('#ModalDisplay').show();
                        loadSearchCheck(data);
                    }
                });
            });
        });

        function loadSearchCheck(data) {
            var json = JSON.parse(data.d);
            if (json.length <= 0) {
                $('#NODATA_SEARCH').show();
                $('#ModalDisplay').hide();
            }
            else {
                loadMapSearchTable(data, "SearchTablePlace");
                loadSearchMap(data);
                loadSearchInfo(data);
            }
        }

        function loadSearchInfo(data) {
            var data = JSON.parse(data.d);
            var sitename = data[0]["SITE_NAME"];
            sitename = sitename || 'no info';
            var DisplaySitename = sitename.toLocaleString();
            document.getElementById('DisplaySitename').innerHTML = 'Site Name: ' + DisplaySitename;
            var USID = data[0]["USID"];
            USID = USID || 'no info';
            var DisplayUSID = USID.toLocaleString();
            document.getElementById('DisplayUSID').innerHTML = 'USID: ' + DisplayUSID;
            var FACODE = data[0]["FA_CODE"];
            FACODE = FACODE || 'no info';
            var DisplayFACODE = FACODE.toLocaleString();
            document.getElementById('DisplayFACODE').innerHTML = 'FA Code: ' + DisplayFACODE;
            var REGION = data[0]["REGION"];
            REGION = REGION || 'no info';
            var DisplayREGION = REGION.toLocaleString();
            document.getElementById('DisplayREGION').innerHTML = 'Region:  ' + DisplayREGION;
            var MARKET = data[0]["MARKET"];
            MARKET = MARKET || 'no info';
            var DisplayMARKET = MARKET.toLocaleString();
            document.getElementById('DisplayMARKET').innerHTML = 'Market:  ' + DisplayMARKET;
            var SUBMARKET = data[0]["SUBMARKET"];
            SUBMARKET = SUBMARKET || 'no info';
            var DisplaySUBMARKET = SUBMARKET.toLocaleString();
            document.getElementById('DisplaySUBMARKET').innerHTML = 'Submarket:  ' + DisplaySUBMARKET;
            var ADDRESS = data[0]["ADDRESS"];
            ADDRESS = ADDRESS || 'no info';
            var DisplayADDRESS = ADDRESS.toLocaleString();
            document.getElementById('DisplayADDRESS').innerHTML = 'Address:  ' + DisplayADDRESS;
            var CITY = data[0]["CITY"];
            CITY = CITY || 'no info';
            var DisplayCITY = CITY.toLocaleString();
            document.getElementById('DisplayCITY').innerHTML = 'City:  ' + DisplayCITY;
            var ZIP = data[0]["ZIP"];
            ZIP = ZIP || 'no info';
            var DisplayZIP = ZIP.toLocaleString();
            document.getElementById('DisplayZIP').innerHTML = 'ZIP:  ' + DisplayZIP;
            var LAT = data[0]["lat"];
            LAT = LAT || 'no info';
            var DisplayLAT = LAT.toLocaleString();
            document.getElementById('DisplayLAT').innerHTML = 'Latitude:  ' + DisplayLAT;
            var LNG = data[0]["lng"];
            LNG = LNG || 'no info';
            var DisplayLNG = LNG.toLocaleString();
            document.getElementById('DisplayLNG').innerHTML = 'Longitude:  ' + DisplayLNG;

        }

        function loadSearchMap(data) {
            var markers = JSON.parse(data.d);

            var loc1 = [markers[0].lat, markers[0].lng];

            var NE_lat = Number(markers[0].lat);
            var NE_lng = Number(markers[0].lng);
            var add1 = .05
            var NE_lat_1 = NE_lat + add1;
            var NE_lng_1 = NE_lng + add1;

            var SW_lat = Number(markers[0].lat);
            var SW_lng = Number(markers[0].lng);
            var add1 = .05
            var SW_lat_1 = SW_lat - add1;
            var SW_lng_1 = SW_lng - add1;

            document.getElementById('mysearchmap').innerHTML = "<div id='searchmap' style='width: 700px; height: 400px; border: 1px solid #AAA;'></div>";

            var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                id: 'osm.grayscale',
                maxZoom: 18,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                    id: 'osm.topo',
                    maxZoom: 17,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 17,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                })
                ;

            var baseLayers = {
                "Streets": streets,
                "<span style='color: gray'>Grayscale</span>": grayscale,
                "Satelite": sat
                //"Topo": topo
            };

            var map = L.map('searchmap', {
                center: [38.5, -95],
                minZoom: 2,
                zoom: 5,
                layers: [streets]
            });

            L.control.layers(baseLayers).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map);

            L.control.scale({ metric: false }).addTo(map);

            var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                bounds = new L.LatLngBounds(southWest, northEast);

            L.marker(loc1)
                .bindPopup(markers[0].SITE_NAME)
                .addTo(map);

            map.fitBounds(bounds, { padding: [10, 10] });

        }

        function loadMapSearchTable(data) {
            var data = JSON.parse(data.d);
            var sitename = data[0]["SITE_NAME"];
            $('#tabMapSearchTable').dataTable().fnDestroy(); //destroy old table
            $('#tabMapSearchTable').DataTable({ //build new table                
                orderCellsTop: true,
                fixedHeader: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                scrollX: true,
                //order: [[3, "asc"]],
                searching: false,
                data: data,
                info: false,
                binfo: true,
                dom: 'Bfrtip',
                buttons: [{ extend: 'csv', title: 'Export: ' + sitename }, { extend: 'excel', title: 'Table title' }],
                columnDefs: [{ visible: false, targets: 28 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'FA_CODE' },
                    { 'data': 'SITE_NAME' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'IPLAN_STATUS' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'PACE_STATUS' },
                    { 'data': 'ORACLE_PTN' },
                    { 'data': 'ORIGINAL_ISSUED_DATE' }, 
                    { 'data': 'CURRENT_NEED_BY_DATE' },
                    { 'data': 'ONAIR_FORECAST' },
                    { 'data': 'PACE_NAME' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'SUB_GROUP' },
                    { 'data': 'SPECTRUM' },               
                    {
                        'data': 'PROJECT_MANAGER'
                        ,
                        'render': function (data, type, JsonResultRow, meta) {
                            if (data === null) { return null; }
                            else {
                                var varattuid = JsonResultRow['PM_ATTUID'];
                                var varpacejob = JsonResultRow['PACE_NUMBER'];
                                return '<a href="mailto:' + varattuid + '@att.com?subject=Inquiry about PACE job ' + varpacejob + '"> ' + data + ' </a>';
                            }
                        }
                    },
                    { 'data': 'CIVIL_VENDOR' },
                    { 'data': 'RF_ENGINEER' },
                    { 'data': 'RFDS_ID' },
                    {
                        'data': 'RFDS_OWNER'
                        ,
                        'render': function (data, type, JsonResultRow, meta) {
                            if (data === null) { return null; }
                            else {
                                var varrfdsjob = JsonResultRow['RFDS_ID'];
                                return '<a href="mailto:' + data + '@att.com?subject=Inquiry about RFDS ID ' + varrfdsjob + '"> ' + data + ' </a>';
                            }
                        }
                    },
                    { 'data': 'RFDS_STATE' },
                    { 'data': 'JI022_ACTUAL' },
                    { 'data': 'SS020_ACTUAL' },
                    { 'data': 'RE020_FORECAST' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },                    
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'PM_ATTUID' }
                ],

                createdRow: function (row, data, index) {
                    if (data["IPLAN_STATUS"] == "Complete") {
                        $(row).addClass('highlightGreen');
                    }
                    if (data["CURRENT_NEED_BY_DATE"] === null) { return '12/31/9999'; }

                    if (data["IPLAN_STATUS"] == "Complete") {
                        $('td', row).eq(8).addClass('highlightGreen');
                    }
                    else {
                        if (new Date(data["CURRENT_NEED_BY_DATE"]) < new Date()) {
                            $('td', row).eq(8).addClass('highlightYellow');
                        }
                    }
                },

                "fnDrawCallback": function () {
                    $('#tabMapSearchTable tr').find('td').each(function () {
                        $(this).on('mouseover', function () {
                            $(this).parent().css('background', 'silver');
                            this.style.cursor = 'pointer';
                        }).on('mouseout', function () {
                            $(this).parent().css('background', 'transparent');
                            this.style.cursor = 'default';
                        });
                    });
                },
            });

            $(window).resize();

        }

        //$(document).ready(function () {
        function Getmarketdata(market) {

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetDATADATE",
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
                url: "Default.aspx/GetProject_AllIn",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadProject_AllIn(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetProject_AllIn_FA",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadProject_AllIn_FA(data);
                },
                error: function (data) {
                }
            });

            if (market == "ALL") {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetPRODUCTION_CHART_ALL",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadPRODUCTION_CHART(data);
                    },
                    error: function (data) {
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetPRODUCTION_CHART",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadPRODUCTION_CHART(data);
                    },
                    error: function (data) {
                    }
                });
            }

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetFORECAST_ATTAIN_ALLIN",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadFORECAST_ATTAIN_ALLIN(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetFORECAST_ATTAIN_ALLIN_30CH",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadFORECAST_ATTAIN_ALLIN_30CH(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetFORECAST_ATTAIN_ALLIN_90CH",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadFORECAST_ATTAIN_ALLIN_90CH(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            if (market == "ALL") {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_ALL",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET(data, market);
                    },
                    error: function (data) {
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET(data, market);
                    },
                    error: function (data) {
                    }
                });
            }

            if (market == "ALL") {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_2_ALL",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET_2(data, market);
                    },
                    error: function (data) {
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_2",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET_2(data, market);
                    },
                    error: function (data) {
                    }
                });
            }

            if (market == "ALL") {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_prev_yr_ALL",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET_prev_yr(data, market);
                    },
                    error: function (data) {
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_prev_yr",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET_prev_yr(data, market);
                    },
                    error: function (data) {
                    }
                });
            }

            if (market == "ALL") {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_2_prev_yr_ALL",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET_2_prev_yr(data, market);
                    },
                    error: function (data) {
                    }
                });
            } else {
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Default.aspx/GetDashboardMARKET_2_prev_yr",
                    data: JSON.stringify({ 'marketVariable': market }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDashboardMARKET_2_prev_yr(data, market);
                    },
                    error: function (data) {
                    }
                });
            }

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut1",
                data: JSON.stringify({ 'marketVariable': market }),
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
                url: "Default.aspx/Getdonut2",
                data: JSON.stringify({ 'marketVariable': market }),
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
                url: "Default.aspx/Getdonut3",
                data: JSON.stringify({ 'marketVariable': market }),
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
                url: "Default.aspx/Getdonut4",
                data: JSON.stringify({ 'marketVariable': market }),
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
                url: "Default.aspx/Getdonut5",
                data: JSON.stringify({ 'marketVariable': market }),
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
                url: "Default.aspx/Getdonut6",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut6(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn1plus1",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn1plus1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn2plus1",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn2plus1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn3plus1",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn3plus1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn4plus1",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn4plus1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn5plus1",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn5plus1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn6plus1",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn6plus1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn1plus2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn1plus2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn2plus2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn2plus2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn3plus2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn3plus2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn4plus2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn4plus2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn5plus2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn5plus2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn6plus2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn6plus2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn1plus3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn1plus3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn2plus3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn2plus3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn3plus3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn3plus3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn4plus3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn4plus3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn5plus3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn5plus3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetColumn6plus3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadColumn6plus3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut1prev_yr",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut1prev_yr(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut2prev_yr",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut2prev_yr(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut3prev_yr",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut3prev_yr(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut4prev_yr",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut4prev_yr(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut5prev_yr",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut5prev_yr(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut6prev_yr",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut6prev_yr(data);
                },
                error: function (data) {
                }
            });

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetCUR_YR_ALLIN",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        RBS1_CUR_YR = data.d;
            //        getRBS2_CUR_YR(market); // call 2nd dataset
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        RBS1 = data.d;
            //        getRBS2(market); // call 2nd dataset
            //    },
            //    error: function (data) {
            //    }
            //});            

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        RBS1_plus2 = data.d;
            //        getRBS2_plus2(market); // call 2nd dataset                    
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN",
            //    data: JSON.stringify({ 'marketVariable': market }),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        RBS1_plus3 = data.d;
            //        getRBS2_plus3(market); // call 2nd dataset                    
            //    },
            //    error: function (data) {
            //    }
            //});

            // Setup - add a text input to each footer cell
            $('#tabCUR_YR_ALLIN tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            });
            $('#tabCUR_YR_PLUS1_ALLIN tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            });
            $('#tabCUR_YR_PLUS2_ALLIN tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            });
            $('#tabCUR_YR_PLUS3_ALLIN tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<input type="text" placeholder="Search ' + title + '" />');
            });

        }

        function getFORECAST_PREV_YR(market) {
            $('#loading_1').show();
            $.when(
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS1_PREV_YR = data.d;
                },
                error: function (data) {
                }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS2_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS3_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
       
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_4",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS4_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
       
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_5",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS5_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_6",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS6_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_7",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS7_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_8",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS8_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_9",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS9_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_10",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS10_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_11",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS11_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_12",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS12_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_13",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS13_PREV_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_14",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS14_PREV_YR = data.d; 
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_15",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS15_PREV_YR = data.d; 
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_16",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS16_PREV_YR = data.d; 
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_17",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS17_PREV_YR = data.d; 
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_18",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS18_PREV_YR = data.d; 
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_19",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS19_PREV_YR = data.d; 
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetPREV_YR_ALLIN_20",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS20_PREV_YR = data.d; 
                },
                error: function (data) { }
            })
            ).then(function () {
                $('#loading_1').hide(); 
                dataConcat(RBS1_PREV_YR, RBS2_PREV_YR, RBS3_PREV_YR, RBS4_PREV_YR, RBS5_PREV_YR, RBS6_PREV_YR, RBS7_PREV_YR, RBS8_PREV_YR, RBS9_PREV_YR, RBS10_PREV_YR, RBS11_PREV_YR, RBS12_PREV_YR, RBS13_PREV_YR, RBS14_PREV_YR, RBS15_PREV_YR, RBS16_PREV_YR, RBS17_PREV_YR, RBS18_PREV_YR, RBS19_PREV_YR, RBS20_PREV_YR);

            });
        }

        function getFORECAST_CURR_YR(market) {
            $('#loading').show();
            $.when(
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS1_CUR_YR = data.d;
                },
                error: function (data) {
                }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS2_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS3_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_4",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS4_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_5",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS5_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_6",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS6_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_7",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS7_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_8",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS8_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_9",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS9_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_10",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS10_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_11",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS11_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_12",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS12_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_13",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS13_CUR_YR = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_14",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS14_CUR_YR = data.d;                    
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_15",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS15_CUR_YR = data.d;                    
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_16",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS16_CUR_YR = data.d;                    
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_17",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS17_CUR_YR = data.d;                    
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_18",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS18_CUR_YR = data.d;                    
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_19",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS19_CUR_YR = data.d;                    
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_ALLIN_20",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS20_CUR_YR = data.d;                    
                },
                error: function (data) { }
            })

            ).then(function () {
                $('#loading').hide();
                dataConcat(RBS1_CUR_YR, RBS2_CUR_YR, RBS3_CUR_YR, RBS4_CUR_YR, RBS5_CUR_YR, RBS6_CUR_YR, RBS7_CUR_YR, RBS8_CUR_YR, RBS9_CUR_YR, RBS10_CUR_YR, RBS11_CUR_YR, RBS12_CUR_YR, RBS13_CUR_YR, RBS14_CUR_YR, RBS15_CUR_YR, RBS16_CUR_YR, RBS17_CUR_YR, RBS18_CUR_YR, RBS19_CUR_YR, RBS20_CUR_YR);

            });

        }

        function getFORECAST_CURR_YR_PLUS1(market) {
            $('#loading1').show();
            $.when(
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS1 = data.d;
                },
                error: function (data) {
                }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS3 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_4",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS4 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_5",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS5 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_6",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS6 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_7",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS7 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_8",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS8 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_9",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS9 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_10",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS10 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_11",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS11 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_12",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS12 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_13",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS13 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_14",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS14 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_15",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS15 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_16",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS16 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_17",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS17 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_18",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS18 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_19",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS19 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS1_ALLIN_20",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS20 = data.d;
                },
                error: function (data) { }
            })


            ).then(function () {
                $('#loading1').hide();
                dataConcatter(RBS1, RBS2, RBS3, RBS4, RBS5, RBS6, RBS7, RBS8, RBS9, RBS10, RBS11, RBS12, RBS13, RBS14, RBS15, RBS16, RBS17, RBS18, RBS19, RBS20);

            });

        }

        function getFORECAST_CURR_YR_PLUS2(market) {
            $('#ajax-loader_2').show();
            $.when(
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS1_plus2 = data.d;      
                },
                error: function (data) {
                }
            }),
       
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS2_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS3_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_4",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS4_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_5",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS5_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_6",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS6_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_7",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS7_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_8",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS8_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_9",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS9_plus2 = data.d;
                },
                error: function (data) { }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_10",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS10_plus2 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_11",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS11_plus2 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_12",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS12_plus2 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_13",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS13_plus2 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_14",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS14_plus2 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS2_ALLIN_15",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS15_plus2 = data.d;
                },
                error: function (data) { }
            })

            ).then(function () {
                $('#ajax-loader_2').hide(); 
                dataConcatter2(RBS1_plus2, RBS2_plus2, RBS3_plus2, RBS4_plus2, RBS5_plus2, RBS6_plus2, RBS7_plus2, RBS8_plus2, RBS9_plus2, RBS10_plus2, RBS11_plus2, RBS12_plus2, RBS13_plus2, RBS14_plus2, RBS15_plus2);

            });
        }

        function getFORECAST_CURR_YR_PLUS3(market) {
            $('#loading3').show();
            $.when(
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS1_plus3 = data.d;              
                },
                error: function (data) {
                }
            }),
        
            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_2",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS2_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_3",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS3_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_4",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS4_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_5",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS5_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_6",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS6_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_7",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS7_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_8",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS8_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_9",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS9_plus3 = data.d;
                },
                error: function (data) { }
            }),

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCUR_YR_PLUS3_ALLIN_10",
                data: JSON.stringify({ 'marketVariable': market }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    RBS10_plus3 = data.d;
                },
                error: function (data) { }
            })


            ).then(function () {
                $('#loading3').hide(); 
                dataConcatter3(RBS1_plus3, RBS2_plus3, RBS3_plus3, RBS4_plus3, RBS5_plus3, RBS6_plus3, RBS7_plus3, RBS8_plus3, RBS9_plus3, RBS10_plus3);

            });
        }

        function dataConcat(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20) // function to concat data strings
        {
            var dataConcat;
            data1 = data1.substring(0, data1.length - 1); // trim last 1 chars
            data2 = data2.substring(1, data2.length - 1); // trim first 1 and last 1 chars
            data3 = data3.substring(1, data3.length - 1); // trim first 1 and last 1 chars
            data4 = data4.substring(1, data4.length - 1); // trim first 1 and last 1 chars
            data5 = data5.substring(1, data5.length - 1); // trim first 1 and last 1 chars
            data6 = data6.substring(1, data6.length - 1); // trim first 1 and last 1 chars
            data7 = data7.substring(1, data7.length - 1); // trim first 1 and last 1 chars
            data8 = data8.substring(1, data8.length - 1); // trim first 1 and last 1 chars
            data9 = data9.substring(1, data9.length - 1); // trim first 1 and last 1 chars
            data10 = data10.substring(1, data10.length - 1); // trim first 1 and last 1 chars
            data11 = data11.substring(1, data11.length - 1); // trim first 1 and last 1 chars
            data12 = data12.substring(1, data12.length - 1); // trim first 1 and last 1 chars
            data13 = data13.substring(1, data13.length - 1); // trim first 1 and last 1 chars
            data14 = data14.substring(1, data14.length - 1); // trim first 1 and last 1 chars
            data15 = data15.substring(1, data15.length - 1); // trim first 1 and last 1 chars
            data16 = data16.substring(1, data16.length - 1); // trim first 1 and last 1 chars
            data17 = data17.substring(1, data17.length - 1); // trim first 1 and last 1 chars
            data18 = data18.substring(1, data18.length - 1); // trim first 1 and last 1 chars
            data19 = data19.substring(1, data19.length - 1); // trim first 1 and last 1 chars
            data20 = data20.substring(1, data20.length); // trim first 1 chars
            dataConcat = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6 + ',' + data7 + ',' + data8 + ',' + data9 + ',' + data10 + ',' + data11 + ',' + data12 + ',' + data13 + ',' + data14 + ',' + data15 + ',' + data16 + ',' + data17 + ',' + data18 + ',' + data19 + ',' + data20; // concat the 2 strings – return this value if you want to store it in a global variable to be concatt’ed in the future; this value would be your new “data1” to concat more than 1 dataset
            loadDownloadCSV_ConcatALL(dataConcat);

            //getKeys(JSON.parse(dataConcat)); // calling getKeys to build header – eliminate this if you just want to use this as a loop
        }

        function dataConcatter(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20) // function to concat data strings
        {
            var dataConcat;
            data1 = data1.substring(0, data1.length - 1); // trim last 1 chars
            data2 = data2.substring(1, data2.length - 1); // trim first 1 and last 1 chars
            data3 = data3.substring(1, data3.length - 1); // trim first 1 and last 1 chars
            data4 = data4.substring(1, data4.length - 1); // trim first 1 and last 1 chars
            data5 = data5.substring(1, data5.length - 1); // trim first 1 and last 1 chars
            data6 = data6.substring(1, data6.length - 1); // trim first 1 and last 1 chars
            data7 = data7.substring(1, data7.length - 1); // trim first 1 and last 1 chars
            data8 = data8.substring(1, data8.length - 1); // trim first 1 and last 1 chars
            data9 = data9.substring(1, data9.length - 1); // trim first 1 and last 1 chars
            data10 = data10.substring(1, data10.length - 1); // trim first 1 and last 1 chars
            data11 = data11.substring(1, data11.length - 1); // trim first 1 and last 1 chars
            data12 = data12.substring(1, data12.length - 1); // trim first 1 and last 1 chars
            data13 = data13.substring(1, data13.length - 1); // trim first 1 and last 1 chars
            data14 = data14.substring(1, data14.length - 1); // trim first 1 and last 1 chars
            data15 = data15.substring(1, data15.length - 1); // trim first 1 and last 1 chars
            data16 = data16.substring(1, data16.length - 1); // trim first 1 and last 1 chars
            data17 = data17.substring(1, data17.length - 1); // trim first 1 and last 1 chars
            data18 = data18.substring(1, data18.length - 1); // trim first 1 and last 1 chars
            data19 = data19.substring(1, data19.length - 1); // trim first 1 and last 1 chars
            data20 = data20.substring(1, data20.length); // trim first 1 chars
            dataConcat = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6 + ',' + data7 + ',' + data8 + ',' + data9 + ',' + data10 + ',' + data11 + ',' + data12 + ',' + data13 + ',' + data14 + ',' + data15 + ',' + data16 + ',' + data17 + ',' + data18 + ',' + data19 + ',' + data20; // concat the 2 strings – return this value if you want to store it in a global variable to be concatt’ed in the future; this value would be your new “data1” to concat more than 1 dataset
            loadDownloadCSV_ConcatALL(dataConcat);

            //getKeys(JSON.parse(dataConcat)); // calling getKeys to build header – eliminate this if you just want to use this as a loop
        }

        function dataConcatter2(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15) // function to concat data strings
        {
            var dataConcat2;
            data1 = data1.substring(0, data1.length - 1); // trim last 1 chars
            data2 = data2.substring(1, data2.length - 1); // trim first 1 and last 1 chars
            data3 = data3.substring(1, data3.length - 1); // trim first 1 and last 1 chars
            data4 = data4.substring(1, data4.length - 1); // trim first 1 and last 1 chars
            data5 = data5.substring(1, data5.length - 1); // trim first 1 and last 1 chars
            data6 = data6.substring(1, data6.length - 1); // trim first 1 and last 1 chars
            data7 = data7.substring(1, data7.length - 1); // trim first 1 and last 1 chars
            data8 = data8.substring(1, data8.length - 1); // trim first 1 and last 1 chars
            data9 = data9.substring(1, data9.length - 1); // trim first 1 and last 1 chars
            data10 = data10.substring(1, data10.length - 1); // trim first 1 and last 1 chars
            data11 = data11.substring(1, data11.length - 1); // trim first 1 and last 1 chars
            data12 = data12.substring(1, data12.length - 1); // trim first 1 and last 1 chars
            data13 = data13.substring(1, data13.length - 1); // trim first 1 and last 1 chars
            data14 = data14.substring(1, data14.length - 1); // trim first 1 and last 1 chars
            data15 = data15.substring(1, data15.length); // trim first 1 chars
            dataConcat2 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6 + ',' + data7 + ',' + data8 + ',' + data9 + ',' + data10 + ',' + data11 + ',' + data12 + ',' + data13 + ',' + data14 + ',' + data15; // concat the 2 strings – return this value if you want to store it in a global variable to be concatt’ed in the future; this value would be your new “data1” to concat more than 1 dataset
            loadDownloadCSV_ConcatALL(dataConcat2);

            //getKeys(JSON.parse(dataConcat)); // calling getKeys to build header – eliminate this if you just want to use this as a loop
        }

        function dataConcatter3(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10) // function to concat data strings
        {
            var dataConcat3;
            data1 = data1.substring(0, data1.length - 1); // trim last 1 chars
            data2 = data2.substring(1, data2.length - 1); // trim first 1 and last 1 chars
            data3 = data3.substring(1, data3.length - 1); // trim first 1 and last 1 chars
            data4 = data4.substring(1, data4.length - 1); // trim first 1 and last 1 chars
            data5 = data5.substring(1, data5.length - 1); // trim first 1 and last 1 chars
            data6 = data6.substring(1, data6.length - 1); // trim first 1 and last 1 chars
            data7 = data7.substring(1, data7.length - 1); // trim first 1 and last 1 chars
            data8 = data8.substring(1, data8.length - 1); // trim first 1 and last 1 chars
            data9 = data9.substring(1, data9.length - 1); // trim first 1 and last 1 chars
            data10 = data10.substring(1, data10.length); // trim first 1 chars
            dataConcat3 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6 + ',' + data7 + ',' + data8 + ',' + data9 + ',' + data10; // concat the 2 strings – return this value if you want to store it in a global variable to be concatt’ed in the future; this value would be your new “data1” to concat more than 1 dataset
            loadDownloadCSV_ConcatALL(dataConcat3);

            //getKeys(JSON.parse(dataConcat)); // calling getKeys to build header – eliminate this if you just want to use this as a loop
        }

        // Start of Export to CSV
        function convertArrayOfObjectsToCSV(args) {
            var result, ctr, keys, columnDelimiter, lineDelimiter, data;

            data = args.data || null;
            if (data == null || !data.length) {
                return null;
            }

            columnDelimiter = args.columnDelimiter || ',';
            lineDelimiter = args.lineDelimiter || '\n';

            keys = Object.keys(data[0]);

            result = '';
            result += keys.join(columnDelimiter);
            result += lineDelimiter;

            data.forEach(function (item) {
                ctr = 0;
                keys.forEach(function (key) {
                    if (ctr > 0) result += columnDelimiter;

                    result += item[key];
                    ctr++;
                });
                result += lineDelimiter;
            });

            return result;
        }

        function loadDownloadCSV_ConcatALL(data) {
            stockData = JSON.parse(data);
            var planyear = stockData[0]["FORECAST_YEAR"];
            var subprog = stockData[0]["SUB_PROGRAM"];
            var program = stockData[0]["PROGRAM"];
            var data, filename, link;
            var csv = convertArrayOfObjectsToCSV({
                data: stockData
            });
            if (csv == null)
                return;

            filename = 'All_Jobs_' + planyear + '.csv';

            var blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });

            if (navigator.msSaveBlob) { // IE 10+
                navigator.msSaveBlob(blob, filename)
            }
            else {
                var link = document.createElement("a");
                if (link.download !== undefined) { // feature detection, Browsers that support HTML5 download attribute
                    var url = URL.createObjectURL(blob);
                    link.setAttribute("href", url);
                    link.setAttribute("download", filename);
                    link.style = "visibility:hidden";
                    document.body.appendChild(link);
                    link.click();
                    document.body.removeChild(link);
                }
            }
        }

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value;
        }

        function loadCURRYEAR(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["PREV_YR"];
            document.getElementById('PREV_YR').innerHTML = value;
            //document.getElementById('PREV_YRa').innerHTML = value;
            document.getElementById('PREV_YRb').innerHTML = value;
            var value = score[0]["CUR_YR"];
            document.getElementById('CUR_YRa').innerHTML = value;
            document.getElementById('CUR_YRb').innerHTML = value;
            document.getElementById('CUR_YRc').innerHTML = value;
            document.getElementById('CUR_YRd').innerHTML = value;
            document.getElementById('CUR_YRe').innerHTML = value;
            document.getElementById('CUR_YRf').innerHTML = value;
            document.getElementById('CUR_YRg').innerHTML = value;
            document.getElementById('CUR_YRh').innerHTML = value;
            document.getElementById('CUR_YRi').innerHTML = value;
            var value = score[0]["CUR_YR_PLUS1"];
            document.getElementById('CUR_YR_PLUS1').innerHTML = value;
            document.getElementById('CUR_YR_PLUS1a').innerHTML = value;
            var value = score[0]["CUR_YR_PLUS2"];
            document.getElementById('CUR_YR_PLUS2').innerHTML = value;
            document.getElementById('CUR_YR_PLUS2a').innerHTML = value;
            var value = score[0]["CUR_YR_PLUS3"];
            document.getElementById('CUR_YR_PLUS3').innerHTML = value;
            document.getElementById('CUR_YR_PLUS3a').innerHTML = value;
        }

        function loadProject_AllIn(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["PODTOTAL_CUR_YR"];
            document.getElementById('PODTOTAL_CUR_YR').innerHTML = value;
            var value = score[0]["POETOTAL_CUR_YR"];
            document.getElementById('POETOTAL_CUR_YR').innerHTML = value;
            var value = score[0]["FORETOTAL_CUR_YR"];
            document.getElementById('FORETOTAL_CUR_YR').innerHTML = value;
            var value = score[0]["COMPTOTAL_CUR_YR"];
            document.getElementById('COMPTOTAL_CUR_YR').innerHTML = value;
            var value = score[0]["NBD_ON_TIME"];
            document.getElementById('NBD_ON_TIME').innerHTML = value;
            var value = score[0]["NBD_ON_TIME_PERC"];
            document.getElementById('NBD_ON_TIME_PERC').innerHTML = value;
            var value = score[0]["ALLJOBS_NBD_LATE"];
            document.getElementById('ALLJOBS_NBD_LATE').innerHTML = value;
            var value = score[0]["ALLJOBS_NBD_LATE_PERC"];
            document.getElementById('ALLJOBS_NBD_LATE_PERC').innerHTML = value;
            var value = score[0]["ALLIN"];
            document.getElementById('ALLIN').innerHTML = value;
        }

        function loadProject_AllIn_FA(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["ALLINFA"];
            document.getElementById('ALLINFA').innerHTML = value;
            var value = score[0]["PODTOTAL_CUR_YRFA"];
            document.getElementById('PODTOTAL_CUR_YRFA').innerHTML = value;
            var value = score[0]["POETOTAL_CUR_YRFA"];
            document.getElementById('POETOTAL_CUR_YRFA').innerHTML = value;
            var value = score[0]["FORETOTAL_CUR_YRFA"];
            document.getElementById('FORETOTAL_CUR_YRFA').innerHTML = value;
            var value = score[0]["COMPTOTAL_CUR_YRFA"];
            document.getElementById('COMPTOTAL_CUR_YRFA').innerHTML = value;
        }

        function loadFORECAST_ATTAIN_ALLIN(data) {
            var score = JSON.parse(data.d);
            var day30avg = (score.length <= 0) ? 0 : score[0]["DAY30AVG"];
            if (
                day30avg == 0
            ) {
                $('#DAY30AVG').hide();
                return;
            }
            else {
                $('#DAY30AVG').show();
                var value = score[11]["DAY30AVG"] + "%";
                document.getElementById('DAY30AVG').innerHTML = value;
                var value = score[11]["DAY90AVG"] + "%";
                document.getElementById('DAY90AVG').innerHTML = value;
            }
        }

        /* SUMMARY TABLE LOADERS */
        function loadCUR_YR_ALLIN(data) {
            var data = JSON.parse(data);
            $('#tabCUR_YR_ALLIN').dataTable().fnDestroy(); //destroy old table
            $('#tabCUR_YR_ALLIN').DataTable({ //build new table
                orderCellsTop: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                scrollX: true,
                order: [[5, "asc"]],
                searching: true,
                data: data,
                info: false,
                binfo: true,
                dom: 'Bfrtip',
                buttons: [{ extend: 'csv', title: '2018 Export ALLIN' }, { extend: 'excel', title: '2018 Export ALLIN' }],
                //columnDefs: [{ width: 220, targets: 2 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'STATUS' },
                    { 'data': 'PROGRAM' },
                    { 'data': 'SOURCE_JOB_NUMBER' },
                    { 'data': 'RAN_REGION' },
                    { 'data': 'MARKET' },
                    { 'data': 'SUBMARKET' },
                    { 'data': 'LATITUDE' },
                    { 'data': 'LONGITUDE' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'PRODUCT_SUBGROUP' },
                    { 'data': 'NATIONAL_PROGRAM' },
                    { 'data': 'USID' },
                    { 'data': 'FA_LOCATION_CODE' },
                    { 'data': 'CURRENT_NEED_BY_DATE' },
                    { 'data': 'ONAIR_PLAN' },
                    { 'data': 'ONAIR_FORECAST' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'PACE_NAME' }

                ],

                "fnDrawCallback": function () {
                    $('#tabCUR_YR_ALLIN tr').find('td').each(function () {
                        $(this).on('mouseover', function () {
                            $(this).parent().css('background', 'silver');
                            this.style.cursor = 'pointer';
                        }).on('mouseout', function () {
                            $(this).parent().css('background', 'transparent');
                            this.style.cursor = 'default';
                        });
                    });
                }
            });

            //$('#tabDEF2019_ALLIN').on('click', 'td', function () {
            //    var jobnum = $(this).parent().find('td:eq(2)').text();
            //    $('#myModal').modal('show');
            //    DeepDive(jobnum);
            //});

            var table = $('#tabCUR_YR_ALLIN').DataTable();
            table.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that
                            .search(this.value)
                            .draw();
                    }
                });
            });


        }

        /* SUMMARY TABLE LOADERS */
        function loadCUR_YR_PLUS1_ALLIN(data) {
            var data = JSON.parse(data);
            $('#tabCUR_YR_PLUS1_ALLIN').dataTable().fnDestroy(); //destroy old table
            $('#tabCUR_YR_PLUS1_ALLIN').DataTable({ //build new table
                orderCellsTop: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                scrollX: true,
                order: [[5, "asc"]],
                searching: true,
                data: data,
                info: false,
                binfo: true,
                dom: 'Bfrtip',
                buttons: [{ extend: 'csv', title: '2019 Export ALLIN' }, { extend: 'excel', title: '2019 Export ALLIN' }],
                //columnDefs: [{ width: 220, targets: 2 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'STATUS' },
                    { 'data': 'PROGRAM' },
                    { 'data': 'SOURCE_JOB_NUMBER' },
                    { 'data': 'RAN_REGION' },
                    { 'data': 'MARKET' },
                    { 'data': 'SUBMARKET' },
                    { 'data': 'LATITUDE' },
                    { 'data': 'LONGITUDE' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'PRODUCT_SUBGROUP' },
                    { 'data': 'NATIONAL_PROGRAM' },
                    { 'data': 'USID' },
                    { 'data': 'FA_LOCATION_CODE' },
                    { 'data': 'CURRENT_NEED_BY_DATE' },
                    { 'data': 'ONAIR_PLAN' },
                    { 'data': 'ONAIR_FORECAST' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'PACE_NAME' }

                ],

                "fnDrawCallback": function () {
                    $('#tabCUR_YR_PLUS1_ALLIN tr').find('td').each(function () {
                        $(this).on('mouseover', function () {
                            $(this).parent().css('background', 'silver');
                            this.style.cursor = 'pointer';
                        }).on('mouseout', function () {
                            $(this).parent().css('background', 'transparent');
                            this.style.cursor = 'default';
                        });
                    });
                }
            });

            //$('#tabDEF2019_ALLIN').on('click', 'td', function () {
            //    var jobnum = $(this).parent().find('td:eq(2)').text();
            //    $('#myModal').modal('show');
            //    DeepDive(jobnum);
            //});

            var table = $('#tabCUR_YR_PLUS1_ALLIN').DataTable();
            table.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that
                            .search(this.value)
                            .draw();
                    }
                });
            });


        }

        /* SUMMARY TABLE LOADERS */
        function loadCUR_YR_PLUS2_ALLIN(data) {
            var data = JSON.parse(data);
            $('#tabCUR_YR_PLUS2_ALLIN').dataTable().fnDestroy(); //destroy old table
            $('#tabCUR_YR_PLUS2_ALLIN').DataTable({ //build new table
                orderCellsTop: true,
                fixedHeader: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                scrollX: true,
                order: [[5, "asc"]],
                searching: true,
                data: data,
                info: false,
                binfo: true,
                dom: 'Bfrtip',
                buttons: [{ extend: 'csv', title: '2020 Export ALLIN' }, { extend: 'excel', title: '2020 Export ALLIN' }],
                //columnDefs: [{ width: 220, targets: 2 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'STATUS' },
                    { 'data': 'PROGRAM' },
                    { 'data': 'SOURCE_JOB_NUMBER' },
                    { 'data': 'RAN_REGION' },
                    { 'data': 'MARKET' },
                    { 'data': 'SUBMARKET' },
                    { 'data': 'LATITUDE' },
                    { 'data': 'LONGITUDE' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'PRODUCT_SUBGROUP' },
                    { 'data': 'NATIONAL_PROGRAM' },
                    { 'data': 'USID' },
                    { 'data': 'FA_LOCATION_CODE' },
                    { 'data': 'CURRENT_NEED_BY_DATE' },
                    { 'data': 'ONAIR_PLAN' },
                    { 'data': 'ONAIR_FORECAST' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'PACE_NAME' }

                ],

                "fnDrawCallback": function () {
                    $('#tabCUR_YR_PLUS2_ALLIN tr').find('td').each(function () {
                        $(this).on('mouseover', function () {
                            $(this).parent().css('background', 'silver');
                            this.style.cursor = 'pointer';
                        }).on('mouseout', function () {
                            $(this).parent().css('background', 'transparent');
                            this.style.cursor = 'default';
                        });
                    });
                }
            });

            $(window).resize();

            //$('#tabDEF2019_ALLIN').on('click', 'td', function () {
            //    var jobnum = $(this).parent().find('td:eq(2)').text();
            //    $('#myModal').modal('show');
            //    DeepDive(jobnum);
            //});

            var table = $('#tabCUR_YR_PLUS2_ALLIN').DataTable();
            table.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that
                            .search(this.value)
                            .draw();
                    }
                });
            });

        }

        /* SUMMARY TABLE LOADERS */
        function loadCUR_YR_PLUS3_ALLIN(data) {
            var data = JSON.parse(data);
            $('#tabCUR_YR_PLUS3_ALLIN').dataTable().fnDestroy(); //destroy old table
            $('#tabCUR_YR_PLUS3_ALLIN').DataTable({ //build new table
                orderCellsTop: true,
                fixedHeader: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                scrollX: true,
                order: [[5, "asc"]],
                searching: true,
                data: data,
                info: false,
                binfo: true,
                dom: 'Bfrtip',
                buttons: [{ extend: 'csv', title: '2021 Export ALLIN' }, { extend: 'excel', title: '2021 Export ALLIN' }],
                //columnDefs: [{ width: 220, targets: 2 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'STATUS' },
                    { 'data': 'PROGRAM' },
                    { 'data': 'SOURCE_JOB_NUMBER' },
                    { 'data': 'RAN_REGION' },
                    { 'data': 'MARKET' },
                    { 'data': 'SUBMARKET' },
                    { 'data': 'LATITUDE' },
                    { 'data': 'LONGITUDE' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'PRODUCT_SUBGROUP' },
                    { 'data': 'NATIONAL_PROGRAM' },
                    { 'data': 'USID' },
                    { 'data': 'FA_LOCATION_CODE' },
                    { 'data': 'CURRENT_NEED_BY_DATE' },
                    { 'data': 'ONAIR_PLAN' },
                    { 'data': 'ONAIR_FORECAST' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'PACE_NAME' }

                ],

                "fnDrawCallback": function () {
                    $('#tabCUR_YR_PLUS3_ALLIN tr').find('td').each(function () {
                        $(this).on('mouseover', function () {
                            $(this).parent().css('background', 'silver');
                            this.style.cursor = 'pointer';
                        }).on('mouseout', function () {
                            $(this).parent().css('background', 'transparent');
                            this.style.cursor = 'default';
                        });
                    });
                }
            });

            $(window).resize();

            //$('#tabDEF2019_ALLIN').on('click', 'td', function () {
            //    var jobnum = $(this).parent().find('td:eq(2)').text();
            //    $('#myModal').modal('show');
            //    DeepDive(jobnum);
            //});

            var table = $('#tabCUR_YR_PLUS3_ALLIN').DataTable();
            table.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that
                            .search(this.value)
                            .draw();
                    }
                });
            });

        }

        var chart2;

        /* HC SUMMARY CHART LOADER */
        function loadPRODUCTION_CHART(data) {
            var marketTitle = $('#ddlMarket option:selected').text();
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

            createNBDColchart(NBD_series_values[0], 'PRODUCTION_CHART', marketTitle, 'Plan/Forecast/Actuals');


            var j = 10
            chart2.addSeries({
                name: 'Plan',
                id: 'Plan',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 11
            chart2.addSeries({
                name: 'Cumulative - Plan',
                id: 'Cumulative - Plan',
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
                colors: ['#808080', '#1E90FF', '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 0,
                    zoomType: 'xy',
                    height: '370',
                    //width: '800'
                },
                exporting: {
                    enabled: true
                },
                legend: {
                    itemStyle: {
                        color: '#000000',
                        fontSize: "12px",
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
                        fontSize: '16px',
                        fontWeight: 'bold'
                    }
                },
                subtitle: {
                    text: chart_subtitle,
                    style: {
                        fontSize: '14px'
                    }
                },
                xAxis: {
                    categories: ['<-PREV', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'NEXT->'],
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
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var chart2;

        /* HC ATTAINMENT SUMMARY CHART LOADER */
        function loadFORECAST_ATTAIN_ALLIN_30CH(data) {
            Attain_30CH = JSON.parse(data.d);
            var day30avg = (Attain_30CH.length <= 0) ? 0 : Attain_30CH[0]["DAY30AVG"];
            if (
                day30avg == 0
            ) {
                $('#DAY30AVG').hide();
                return;
            }
            else {
                $('#DAY30AVG').show();
                var avg30 = Attain_30CH[11]["DAY30AVG"];
                var Att_30CH_series_values = [];
                var keys = Object.keys(Attain_30CH[0]);
                var calcmax = Math.max.apply(Math, Attain_30CH.map(function (o) { return o.DAY30AVG; }));
                var maxaxis = Math.ceil((calcmax + 20) / 100) * 100

                // Parse returned json string into x axis categories and y series values

                for (var k = 0; k < keys.length; k++) {
                    var a = [];
                    for (var j = 0; j < Attain_30CH.length; j++) {
                        if (k == 0) {
                            a.push(Attain_30CH[j][0]);
                        } else {
                            a.push(Attain_30CH[j][keys[k]]);
                        }
                    }
                    Att_30CH_series_values.push(a);
                }

                createAtt_30CHColchart(maxaxis, 'DAY30AVG_HISTORY', '30 Day Forecast Attainment History', 'All Projects', avg30);


                var j = 21
                chart2.addSeries({
                    name: 'Forecast',
                    id: 'Forecast',
                    data: Att_30CH_series_values[j],
                    color: '#1E90FF',
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 20
                chart2.addSeries({
                    name: 'On-Air Actual',
                    id: 'On-Air Actual',
                    data: Att_30CH_series_values[j],
                    color: '#2E8B57',
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 18
                chart2.addSeries({
                    name: '% Monthly Attainment',
                    id: '% Monthly Attainment',
                    type: 'spline',
                    yAxis: 1,
                    lineWidth: 3,
                    color: '#87CEEB',
                    tooltip: {
                        valueSuffix: '%'
                    },
                    marker: {
                        symbol: 'circle'
                    },
                    data: Att_30CH_series_values[j],
                    animation: false,
                    dataLabels: {
                        enabled: true,
                        formatter: function () {
                            return this.y.toFixed(1) + '%';
                        }
                    },
                    showInLegend: true
                }, false);

                chart2.redraw();
            }
        }

        function createAtt_30CHColchart(maxaxis, chart_div_name, chart_title, chart_subtitle, avg30) {            
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#808080', '#1E90FF', '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 0,
                    zoomType: 'xy',
                    height: '370',
                    width: '650'
                },
                exporting: {
                    enabled: true
                },
                legend: {
                    itemStyle: {
                        color: '#000000',
                        fontSize: "12px",
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
                        fontSize: '16px',
                        fontWeight: 'bold'
                    }
                },
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '12px',
                //        fontWeight: 'bold'
                //    }
                //},
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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
                        text: '% Attainment',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    min: 0,
                    max: maxaxis,
                    plotBands: [{
                        label: {
                            text: 'Target > 80%',
                            align: 'right'
                        }, color: '#b3ffb3', // Color value
                        from: 80, // Start of the plot band
                        to: maxaxis // End of the plot band
                    }],
                    plotLines: [{
                        label: {
                            text: '2019 Average ' + avg30 + '%',
                            align: 'right'
                        },
                        color: 'red',
                        value: avg30,
                        width: '1',
                        zIndex: 5
                    }],
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
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var chart2;

        /* HC ATTAINMENT 90 SUMMARY CHART LOADER */
        function loadFORECAST_ATTAIN_ALLIN_90CH(data) {
            Attain_90CH = JSON.parse(data.d);
            var day90avg = (Attain_90CH.length <= 0) ? 0 : Attain_90CH[0]["DAY30AVG"];
            if (
                day90avg == 0
            ) {
                $('#DAY90AVG').hide();
                return;
            }
            else {
                $('#DAY90AVG').show();
                var avg90 = Attain_90CH[11]["DAY90AVG"];
                var Att_90CH_series_values = [];
                var keys = Object.keys(Attain_90CH[0]);

                // Parse returned json string into x axis categories and y series values

                for (var k = 0; k < keys.length; k++) {
                    var a = [];
                    for (var j = 0; j < Attain_90CH.length; j++) {
                        if (k == 0) {
                            a.push(Attain_90CH[j][0]);
                        } else {
                            a.push(Attain_90CH[j][keys[k]]);
                        }
                    }
                    Att_90CH_series_values.push(a);
                }

                createAtt_90CHColchart(Att_90CH_series_values[0], 'DAY90AVG_HISTORY', '90 Day Forecast Attainment History', 'All Projects', avg90);


                var j = 26
                chart2.addSeries({
                    name: 'Forecast',
                    id: 'Forecast',
                    data: Att_90CH_series_values[j],
                    color: '#1E90FF',
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 25
                chart2.addSeries({
                    name: 'On-Air Actual',
                    id: 'On-Air Actual',
                    data: Att_90CH_series_values[j],
                    color: '#2E8B57',
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 19
                chart2.addSeries({
                    name: '% Monthly Attainment',
                    id: '% Monthly Attainment',
                    type: 'spline',
                    yAxis: 1,
                    lineWidth: 3,
                    color: '#87CEEB',
                    tooltip: {
                        valueSuffix: '%'
                    },
                    marker: {
                        symbol: 'circle'
                    },
                    data: Att_90CH_series_values[j],
                    animation: false,
                    dataLabels: {
                        enabled: true,
                        formatter: function () {
                            return this.y.toFixed(1) + '%';
                        }
                    },
                    showInLegend: true
                }, false);

                chart2.redraw();
            }
        }

        function createAtt_90CHColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle, avg90) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#808080', '#1E90FF', '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 0,
                    zoomType: 'xy',
                    height: '370',
                    width: '650'
                },
                exporting: {
                    enabled: true
                },
                legend: {
                    itemStyle: {
                        color: '#000000',
                        fontSize: "12px",
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
                        fontSize: '16px',
                        fontWeight: 'bold'
                    }
                },
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '12px',
                //        fontWeight: 'bold'
                //    }
                //},
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
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
                        text: '% Attainment',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    min: 0,
                    max: 100,
                    plotBands: [{
                        label: {
                            text: 'Target > 70%',
                            align: 'right'
                        }, color: '#b3ffb3', // Color value
                        from: 70, // Start of the plot band
                        to: 100 // End of the plot band
                    }],
                    plotLines: [{
                        label: {
                            text: '2018 Average ' + avg90 + '%',
                            align: 'right'
                        },
                        color: 'red',
                        value: avg90,
                        width: '1',
                        zIndex: 5
                    }],
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
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var chart2;

        /* donut1 chart data */

        function loadDonut1(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'New Site Build'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var planyear = score[0]["PLANYEAR"];

            var POE_NSB_CUR_YR2 = score[0]["POE"];
            var POE_NSB_CUR_YR = POE_NSB_CUR_YR2.toLocaleString();
            document.getElementById('POE_NSB_CUR_YR').innerHTML = 'POE: ' + POE_NSB_CUR_YR;
            var FORE_NSB_CUR_YR2 = score[0]["FORECAST"];
            var FORE_NSB_CUR_YR = FORE_NSB_CUR_YR2.toLocaleString();
            document.getElementById('FORE_NSB_CUR_YR').innerHTML = 'Forecast: ' + FORE_NSB_CUR_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_NSB_CUR_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_NSB_CUR_YR = COMP_NSB_CUR_YR2.toLocaleString();
            document.getElementById('COMP_NSB_CUR_YR').innerHTML = 'Complete: ' + COMP_NSB_CUR_YR + ' (' + perc_comp + '%)';

            donutcharting102('donut1', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
        }

        /* Ajax call to load the donut2 chart data */

        function loadDonut2(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MCA'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var planyear = score[0]["PLANYEAR"];

            var POE_MCA_CUR_YR2 = score[0]["POE"];
            var POE_MCA_CUR_YR = POE_MCA_CUR_YR2.toLocaleString();
            document.getElementById('POE_MCA_CUR_YR').innerHTML = 'POE: ' + POE_MCA_CUR_YR;
            var FORE_MCA_CUR_YR2 = score[0]["FORECAST"];
            var FORE_MCA_CUR_YR = FORE_MCA_CUR_YR2.toLocaleString();
            document.getElementById('FORE_MCA_CUR_YR').innerHTML = 'Forecast: ' + FORE_MCA_CUR_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_MCA_CUR_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_MCA_CUR_YR = COMP_MCA_CUR_YR2.toLocaleString();
            document.getElementById('COMP_MCA_CUR_YR').innerHTML = 'Complete: ' + COMP_MCA_CUR_YR + ' (' + perc_comp + '%)';

            donutcharting102('donut2', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
        }

        /* Ajax call to load the donut3 chart data */

        function loadDonut3(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'CRAN'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var planyear = score[0]["PLANYEAR"];

            var POE_CRAN_CUR_YR2 = score[0]["POE"];
            var POE_CRAN_CUR_YR = POE_CRAN_CUR_YR2.toLocaleString();
            document.getElementById('POE_CRAN_CUR_YR').innerHTML = 'POE: ' + POE_CRAN_CUR_YR;
            var FORE_CRAN_CUR_YR2 = score[0]["FORECAST"];
            var FORE_CRAN_CUR_YR = FORE_CRAN_CUR_YR2.toLocaleString();
            document.getElementById('FORE_CRAN_CUR_YR').innerHTML = 'Forecast: ' + FORE_CRAN_CUR_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_CRAN_CUR_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_CRAN_CUR_YR = COMP_CRAN_CUR_YR2.toLocaleString();
            document.getElementById('COMP_CRAN_CUR_YR').innerHTML = 'Complete: ' + COMP_CRAN_CUR_YR + ' (' + perc_comp + '%)';

            donutcharting102('donut3', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
        }

        /* Ajax call to load the donut4 chart data */

        function loadDonut4(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
            var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title400col').hide();
                $('#title401col').hide();
                $('#title402col').hide();
                $('#title403col').hide();
                $('#donut4col').hide();
                return;
            }
            else {
                $('#title400col').show();
                $('#title401col').show();
                $('#title402col').show();
                $('#title403col').show();
                $('#donut4col').show();
                var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
                var title = 'Overlay'; //put the data into variables to pass to a chart building function
                var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
                var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
                var fore1q = score[0]["FORE1Q"];
                var fore2q = score[0]["FORE2Q"];
                var fore3q = score[0]["FORE3Q"];
                var fore4q = score[0]["FORE4Q"];
                var planvsact = score[0]["PLANVSACT"];
                var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
                var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
                var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
                var planyear = score[0]["PLANYEAR"];

                var POE_LTE1C_CUR_YR2 = score[0]["POE"];
                var POE_LTE1C_CUR_YR = POE_LTE1C_CUR_YR2.toLocaleString();
                document.getElementById('POE_LTE1C_CUR_YR').innerHTML = 'POE: ' + POE_LTE1C_CUR_YR;
                var FORE_LTE1C_CUR_YR2 = score[0]["FORECAST"];
                var FORE_LTE1C_CUR_YR = FORE_LTE1C_CUR_YR2.toLocaleString();
                document.getElementById('FORE_LTE1C_CUR_YR').innerHTML = 'Forecast: ' + FORE_LTE1C_CUR_YR + ' (' + perc_fore_of_plan + '%)';
                var COMP_LTE1C_CUR_YR2 = score[0]["YTD_COMPLETE"];
                var COMP_LTE1C_CUR_YR = COMP_LTE1C_CUR_YR2.toLocaleString();
                document.getElementById('COMP_LTE1C_CUR_YR').innerHTML = 'Complete: ' + COMP_LTE1C_CUR_YR + ' (' + perc_comp + '%)';

                donutcharting102('donut4', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            }
        }

        /* Ajax call to load the donut5 chart data */

        function loadDonut5(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
            var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title500col').hide();
                $('#title501col').hide();
                $('#title502col').hide();
                $('#title503col').hide();
                $('#donut5col').hide();
                return;
            }
            else {
                $('#title500col').show();
                $('#title501col').show();
                $('#title502col').show();
                $('#title503col').show();
                $('#donut5col').show();
                var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
                var title = 'Overlay'; //put the data into variables to pass to a chart building function
                var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
                var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
                var fore1q = score[0]["FORE1Q"];
                var fore2q = score[0]["FORE2Q"];
                var fore3q = score[0]["FORE3Q"];
                var fore4q = score[0]["FORE4Q"];
                var planvsact = score[0]["PLANVSACT"];
                var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
                var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
                var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
                var planyear = score[0]["PLANYEAR"];

                var POE_IB_CUR_YR2 = score[0]["POE"];
                var POE_IB_CUR_YR = POE_IB_CUR_YR2.toLocaleString();
                document.getElementById('POE_IB_CUR_YR').innerHTML = 'POE: ' + POE_IB_CUR_YR;
                var FORE_IB_CUR_YR2 = score[0]["FORECAST"];
                var FORE_IB_CUR_YR = FORE_IB_CUR_YR2.toLocaleString();
                document.getElementById('FORE_IB_CUR_YR').innerHTML = 'Forecast: ' + FORE_IB_CUR_YR + ' (' + perc_fore_of_plan + '%)';
                var COMP_IB_CUR_YR2 = score[0]["YTD_COMPLETE"];
                var COMP_IB_CUR_YR = COMP_IB_CUR_YR2.toLocaleString();
                document.getElementById('COMP_IB_CUR_YR').innerHTML = 'Complete: ' + COMP_IB_CUR_YR + ' (' + perc_comp + '%)';

                donutcharting102('donut5', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            }
        }

        /* Ajax call to load the donut6 chart data */

        function loadDonut6(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
            var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title600col').hide();
                $('#title601col').hide();
                $('#title602col').hide();
                $('#title603col').hide();
                $('#donut6col').hide();
                return;
            }
            else {
                $('#title600col').show();
                $('#title601col').show();
                $('#title602col').show();
                $('#title603col').show();
                $('#donut6col').show();
                var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
                var title = 'BWE SW'; //put the data into variables to pass to a chart building function
                var poe = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
                var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
                var fore1q = score[0]["FORE1Q"];
                var fore2q = score[0]["FORE2Q"];
                var fore3q = score[0]["FORE3Q"];
                var fore4q = score[0]["FORE4Q"];
                var planvsact = planvsact = score[0]["FORECAST"] - score[0]["FORECAST"];
                var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["FORECAST"]).toFixed(1);
                var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["FORECAST"]).toFixed(1);
                var short = score[0]["FORECAST"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
                var planyear = score[0]["PLANYEAR"];

                var POE_BWESW_CUR_YR2 = score[0]["FORECAST"];
                var POE_BWESW_CUR_YR = POE_BWESW_CUR_YR2.toLocaleString();
                document.getElementById('POE_BWESW_CUR_YR').innerHTML = 'POE: ' + POE_BWESW_CUR_YR;
                var FORE_BWESW_CUR_YR2 = score[0]["FORECAST"];
                var FORE_BWESW_CUR_YR = FORE_BWESW_CUR_YR2.toLocaleString();
                document.getElementById('FORE_BWESW_CUR_YR').innerHTML = 'Forecast: ' + FORE_BWESW_CUR_YR + ' (' + perc_fore_of_plan + '%)';
                var COMP_BWESW_CUR_YR2 = score[0]["YTD_COMPLETE"];
                var COMP_BWESW_CUR_YR = COMP_BWESW_CUR_YR2.toLocaleString();
                document.getElementById('COMP_BWESW_CUR_YR').innerHTML = 'Complete: ' + COMP_BWESW_CUR_YR + ' (' + perc_comp + '%)';

                donutcharting102('donut6', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            }
        }

        /* column1plus1 chart data */

        function loadColumn1plus1(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_NSB_CUR_YR_PLUS12 = score[0]["FORECAST"];
            var FORE_NSB_CUR_YR_PLUS1 = FORE_NSB_CUR_YR_PLUS12.toLocaleString();
            document.getElementById('FORE_NSB_CUR_YR_PLUS1').innerHTML = 'Forecast: ' + FORE_NSB_CUR_YR_PLUS1;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_NSB_CUR_YR_PLUS1 = re020compl.toLocaleString();
            document.getElementById('RE020_NSB_CUR_YR_PLUS1').innerHTML = 'Site Acq Comp: ' + RE020_NSB_CUR_YR_PLUS1 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast1plus1', data, re020data, planyear);
        }

        /* column2plus1 chart data */

        function loadColumn2plus1(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_MCA_CUR_YR_PLUS12 = score[0]["FORECAST"];
            var FORE_MCA_CUR_YR_PLUS1 = FORE_MCA_CUR_YR_PLUS12.toLocaleString();
            document.getElementById('FORE_MCA_CUR_YR_PLUS1').innerHTML = 'Forecast: ' + FORE_MCA_CUR_YR_PLUS1;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_MCA_CUR_YR_PLUS1 = re020compl.toLocaleString();
            document.getElementById('RE020_MCA_CUR_YR_PLUS1').innerHTML = 'Site Acq Comp: ' + RE020_MCA_CUR_YR_PLUS1 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast2plus1', data, re020data, planyear);
        }

        /* column3plus1 chart data */

        function loadColumn3plus1(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_CRAN_CUR_YR_PLUS12 = score[0]["FORECAST"];
            var FORE_CRAN_CUR_YR_PLUS1 = FORE_CRAN_CUR_YR_PLUS12.toLocaleString();
            document.getElementById('FORE_CRAN_CUR_YR_PLUS1').innerHTML = 'Forecast: ' + FORE_CRAN_CUR_YR_PLUS1;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_CRAN_CUR_YR_PLUS1 = re020compl.toLocaleString();
            document.getElementById('RE020_CRAN_CUR_YR_PLUS1').innerHTML = 'Site Acq Comp: ' + RE020_CRAN_CUR_YR_PLUS1 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast3plus1', data, re020data, planyear);
        }

        /* column4plus1 chart data */

        function loadColumn4plus1(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
            var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title400colplus1').hide();
                $('#title402colplus1').hide();
                $('#title403colplus1').hide();
                $('#forecast4colplus1').hide();
                return;
            }
            else {
                $('#title400colplus1').show();
                $('#title402colplus1').show();
                $('#title403colplus1').show();
                $('#forecast4colplus1').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_LTE1C_CUR_YR_PLUS12 = score[0]["FORECAST"];
                var FORE_LTE1C_CUR_YR_PLUS1 = FORE_LTE1C_CUR_YR_PLUS12.toLocaleString();
                document.getElementById('FORE_LTE1C_CUR_YR_PLUS1').innerHTML = 'Forecast: ' + FORE_LTE1C_CUR_YR_PLUS1;
                var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
                var RE020_LTE1C_CUR_YR_PLUS1 = re020compl.toLocaleString();
                document.getElementById('RE020_LTE1C_CUR_YR_PLUS1').innerHTML = 'Site Acq Comp: ' + RE020_LTE1C_CUR_YR_PLUS1 + ' (' + perc_comp + '%)';

                columnChartCreator('forecast4plus1', data, re020data, planyear);
            }
        }

        /* column5plus1 chart data */

        function loadColumn5plus1(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_IB_CUR_YR_PLUS12 = score[0]["FORECAST"];
            var FORE_IB_CUR_YR_PLUS1 = FORE_IB_CUR_YR_PLUS12.toLocaleString();
            document.getElementById('FORE_IB_CUR_YR_PLUS1').innerHTML = 'Forecast: ' + FORE_IB_CUR_YR_PLUS1;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_IB_CUR_YR_PLUS1 = re020compl.toLocaleString();
            document.getElementById('RE020_IB_CUR_YR_PLUS1').innerHTML = 'Site Acq Comp: ' + RE020_IB_CUR_YR_PLUS1 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast5plus1', data, re020data, planyear);
        }

        /* column6plus1 chart data */

        function loadColumn6plus1(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_BWESW_CUR_YR_PLUS12 = score[0]["FORECAST"];
            var FORE_BWESW_CUR_YR_PLUS1 = FORE_BWESW_CUR_YR_PLUS12.toLocaleString();
            document.getElementById('FORE_BWESW_CUR_YR_PLUS1').innerHTML = 'Forecast: ' + FORE_BWESW_CUR_YR_PLUS1;

            columnChartCreator('forecast6plus1', data, re020data, planyear);
        }

        /* column1plus2 chart data */

        function loadColumn1plus2(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_NSB_CUR_YR_PLUS22 = score[0]["FORECAST"];
            var FORE_NSB_CUR_YR_PLUS2 = FORE_NSB_CUR_YR_PLUS22.toLocaleString();
            document.getElementById('FORE_NSB_CUR_YR_PLUS2').innerHTML = 'Forecast: ' + FORE_NSB_CUR_YR_PLUS2;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_NSB_CUR_YR_PLUS2 = re020compl.toLocaleString();
            document.getElementById('RE020_NSB_CUR_YR_PLUS2').innerHTML = 'Site Acq Comp: ' + RE020_NSB_CUR_YR_PLUS2 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast1plus2', data, re020data, planyear);
        }

        /* column2plus2 chart data */

        function loadColumn2plus2(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_MCA_CUR_YR_PLUS22 = score[0]["FORECAST"];
            var FORE_MCA_CUR_YR_PLUS2 = FORE_MCA_CUR_YR_PLUS22.toLocaleString();
            document.getElementById('FORE_MCA_CUR_YR_PLUS2').innerHTML = 'Forecast: ' + FORE_MCA_CUR_YR_PLUS2;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_MCA_CUR_YR_PLUS2 = re020compl.toLocaleString();
            document.getElementById('RE020_MCA_CUR_YR_PLUS2').innerHTML = 'Site Acq Comp: ' + RE020_MCA_CUR_YR_PLUS2 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast2plus2', data, re020data, planyear);
        }

        /* column3plus2 chart data */

        function loadColumn3plus2(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_CRAN_CUR_YR_PLUS22 = score[0]["FORECAST"];
            var FORE_CRAN_CUR_YR_PLUS2 = FORE_CRAN_CUR_YR_PLUS22.toLocaleString();
            document.getElementById('FORE_CRAN_CUR_YR_PLUS2').innerHTML = 'Forecast: ' + FORE_CRAN_CUR_YR_PLUS2;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_CRAN_CUR_YR_PLUS2 = re020compl.toLocaleString();
            document.getElementById('RE020_CRAN_CUR_YR_PLUS2').innerHTML = 'Site Acq Comp: ' + RE020_CRAN_CUR_YR_PLUS2 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast3plus2', data, re020data, planyear);
        }

        /* column4plus2 chart data */

        function loadColumn4plus2(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
                    var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title400colplus2').hide();
                $('#title402colplus2').hide();
                $('#title403colplus2').hide();
                $('#forecast4colplus2').hide();
                return;
            }
            else {
                $('#title400colplus2').show();
                $('#title402colplus2').show();
                $('#title403colplus2').show();
                $('#forecast4colplus2').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_LTE1C_CUR_YR_PLUS22 = score[0]["FORECAST"];
                var FORE_LTE1C_CUR_YR_PLUS2 = FORE_LTE1C_CUR_YR_PLUS22.toLocaleString();
                document.getElementById('FORE_LTE1C_CUR_YR_PLUS2').innerHTML = 'Forecast: ' + FORE_LTE1C_CUR_YR_PLUS2;
                var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
                var RE020_LTE1C_CUR_YR_PLUS2 = re020compl.toLocaleString();
                document.getElementById('RE020_LTE1C_CUR_YR_PLUS2').innerHTML = 'Site Acq Comp: ' + RE020_LTE1C_CUR_YR_PLUS2 + ' (' + perc_comp + '%)';
                columnChartCreator('forecast4plus2', data, re020data, planyear);
            }
        }

        /* column5plus2 chart data */

        function loadColumn5plus2(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
                    var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title500colplus2').hide();
                $('#title502colplus2').hide();
                $('#title503colplus2').hide();
                $('#forecast5colplus2').hide();
                return;
            }
            else {
                $('#title500colplus2').show();
                $('#title502colplus2').show();
                $('#title503colplus2').show();
                $('#forecast5colplus2').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_IB_CUR_YR_PLUS22 = score[0]["FORECAST"];
                var FORE_IB_CUR_YR_PLUS2 = FORE_IB_CUR_YR_PLUS22.toLocaleString();
                document.getElementById('FORE_IB_CUR_YR_PLUS2').innerHTML = 'Forecast: ' + FORE_IB_CUR_YR_PLUS2;
                var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
                var RE020_IB_CUR_YR_PLUS2 = re020compl.toLocaleString();
                document.getElementById('RE020_IB_CUR_YR_PLUS2').innerHTML = 'Site Acq Comp: ' + RE020_IB_CUR_YR_PLUS2 + ' (' + perc_comp + '%)';
                columnChartCreator('forecast5plus2', data, re020data, planyear);
            }
        }

        /* column6plus2 chart data */

        function loadColumn6plus2(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
                    var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title600colplus2').hide();
                $('#title602colplus2').hide();
                $('#title603colplus2').hide();
                $('#forecastcol6plus2').hide();
                return;
            }
            else {
                $('#title600colplus2').show();
                $('#title602colplus2').show();
                $('#title603colplus2').show();
                $('#forecastcol6plus2').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_BWESW_CUR_YR_PLUS22 = score[0]["FORECAST"];
                var FORE_BWESW_CUR_YR_PLUS2 = FORE_BWESW_CUR_YR_PLUS22.toLocaleString();
                document.getElementById('FORE_BWESW_CUR_YR_PLUS2').innerHTML = 'Forecast: ' + FORE_BWESW_CUR_YR_PLUS2;
                columnChartCreator('forecast6plus2', data, re020data, planyear);
            }
        }

        /* column1plus3 chart data */

        function loadColumn1plus3(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_NSB_CUR_YR_PLUS32 = score[0]["FORECAST"];
            var FORE_NSB_CUR_YR_PLUS3 = FORE_NSB_CUR_YR_PLUS32.toLocaleString();
            document.getElementById('FORE_NSB_CUR_YR_PLUS3').innerHTML = 'Forecast: ' + FORE_NSB_CUR_YR_PLUS3;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_NSB_CUR_YR_PLUS3 = re020compl.toLocaleString();
            document.getElementById('RE020_NSB_CUR_YR_PLUS3').innerHTML = 'Site Acq Comp: ' + RE020_NSB_CUR_YR_PLUS3 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast1plus3', data, re020data, planyear);
        }

        /* column2plus3 chart data */

        function loadColumn2plus3(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_MCA_CUR_YR_PLUS32 = score[0]["FORECAST"];
            var FORE_MCA_CUR_YR_PLUS3 = FORE_MCA_CUR_YR_PLUS32.toLocaleString();
            document.getElementById('FORE_MCA_CUR_YR_PLUS3').innerHTML = 'Forecast: ' + FORE_MCA_CUR_YR_PLUS3;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_MCA_CUR_YR_PLUS3 = re020compl.toLocaleString();
            document.getElementById('RE020_MCA_CUR_YR_PLUS3').innerHTML = 'Site Acq Comp: ' + RE020_MCA_CUR_YR_PLUS3 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast2plus3', data, re020data, planyear);
        }

        /* column3plus3 chart data */

        function loadColumn3plus3(data) {
            var score = JSON.parse(data.d); //parse your data            
            var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
            score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
            var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
            var planyear = score[0]["PLANYEAR"];

            var FORE_CRAN_CUR_YR_PLUS32 = score[0]["FORECAST"];
            var FORE_CRAN_CUR_YR_PLUS3 = FORE_CRAN_CUR_YR_PLUS32.toLocaleString();
            document.getElementById('FORE_CRAN_CUR_YR_PLUS3').innerHTML = 'Forecast: ' + FORE_CRAN_CUR_YR_PLUS3;
            var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
            var RE020_CRAN_CUR_YR_PLUS3 = re020compl.toLocaleString();
            document.getElementById('RE020_CRAN_CUR_YR_PLUS3').innerHTML = 'Site Acq Comp: ' + RE020_CRAN_CUR_YR_PLUS3 + ' (' + perc_comp + '%)';

            columnChartCreator('forecast3plus3', data, re020data, planyear);
        }

        /* column4plus3 chart data */

        function loadColumn4plus3(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
                    var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title400colplus3').hide();
                $('#title402colplus3').hide();
                $('#title403colplus3').hide();
                $('#forecast4colplus3').hide();
                return;
            }
            else {
                $('#title400colplus3').show();
                $('#title402colplus3').show();
                $('#title403colplus3').show();
                $('#forecast4colplus3').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_LTE1C_CUR_YR_PLUS32 = score[0]["FORECAST"];
                var FORE_LTE1C_CUR_YR_PLUS3 = FORE_LTE1C_CUR_YR_PLUS32.toLocaleString();
                document.getElementById('FORE_LTE1C_CUR_YR_PLUS3').innerHTML = 'Forecast: ' + FORE_LTE1C_CUR_YR_PLUS3;
                var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
                var RE020_LTE1C_CUR_YR_PLUS3 = re020compl.toLocaleString();
                document.getElementById('RE020_LTE1C_CUR_YR_PLUS3').innerHTML = 'Site Acq Comp: ' + RE020_LTE1C_CUR_YR_PLUS3 + ' (' + perc_comp + '%)';
                columnChartCreator('forecast4plus3', data, re020data, planyear);
            }
        }

        /* column5plus3 chart data */

        function loadColumn5plus3(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
                    var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title500colplus3').hide();
                $('#title502colplus3').hide();
                $('#title503colplus3').hide();
                $('#forecast5colplus3').hide();
                return;
            }
            else {
                $('#title500colplus3').show();
                $('#title502colplus3').show();
                $('#title503colplus3').show();
                $('#forecast5colplus3').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_IB_CUR_YR_PLUS32 = score[0]["FORECAST"];
                var FORE_IB_CUR_YR_PLUS3 = FORE_IB_CUR_YR_PLUS32.toLocaleString();
                document.getElementById('FORE_IB_CUR_YR_PLUS3').innerHTML = 'Forecast: ' + FORE_IB_CUR_YR_PLUS3;
                var re020compl = [score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]];
                var RE020_IB_CUR_YR_PLUS3 = re020compl.toLocaleString();
                document.getElementById('RE020_IB_CUR_YR_PLUS3').innerHTML = 'Site Acq Comp: ' + RE020_IB_CUR_YR_PLUS3 + ' (' + perc_comp + '%)';
                columnChartCreator('forecast5plus3', data, re020data, planyear);
            }
        }

        /* column6plus3 chart data */

        function loadColumn6plus3(data) {
            var score = JSON.parse(data.d); //parse your data
            var poe = (score.length <= 0) ? 0 : score[0]["POE"];
                    var forecast = (score.length <= 0) ? 0 : score[0]["FORECAST"];
            if (
                poe == 0 && forecast == 0
            ) {
                $('#title600colplus3').hide();
                $('#title602colplus3').hide();
                $('#title603colplus3').hide();
                $('#forecast6colplus3').hide();
                return;
            }
            else {
                $('#title600colplus3').show();
                $('#title602colplus3').show();
                $('#title603colplus3').show();
                $('#forecast6colplus3').show();
                var data = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
                score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
                var re020data = [score[0]["RE020JAN"], score[0]["RE020FEB"], score[0]["RE020MAR"], score[0]["RE020APR"], score[0]["RE020MAY"], score[0]["RE020JUN"],
                score[0]["RE020JUL"], score[0]["RE020AUG"], score[0]["RE020SEP"], score[0]["RE020OCT"], score[0]["RE020NOV"], score[0]["RE020DEC"]];
                var perc_comp = ([score[0]["RE020JAN"] + score[0]["RE020FEB"] + score[0]["RE020MAR"] + score[0]["RE020APR"] + score[0]["RE020MAY"] + score[0]["RE020JUN"] +
                    score[0]["RE020JUL"] + score[0]["RE020AUG"] + score[0]["RE020SEP"] + score[0]["RE020OCT"] + score[0]["RE020NOV"] + score[0]["RE020DEC"]] * 100 / score[0]["FORECAST"]).toFixed(1);
                var planyear = score[0]["PLANYEAR"];

                var FORE_BWESW_CUR_YR_PLUS32 = score[0]["FORECAST"];
                var FORE_BWESW_CUR_YR_PLUS3 = FORE_BWESW_CUR_YR_PLUS32.toLocaleString();
                document.getElementById('FORE_BWESW_CUR_YR_PLUS3').innerHTML = 'Forecast: ' + FORE_BWESW_CUR_YR_PLUS3;
                columnChartCreator('forecast6plus3', data, re020data, planyear);
            }
        }

        /* BAR CHART CREATER */
        function columnChartCreator(container, data, re020data, planyear) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#4da6ff', '#00008b']
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'column',
                        height: '220',
                        width: '220'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        title: null
                    },
                    yAxis: {
                        title: {
                            text: ''
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key} ' + planyear + '</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y}</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        column: {
                            grouping: false,
                            pointWidth: 10,
                        },
                        series: {
                            dataLabels: {
                                enabled: false,
                                format: '{y}'
                            }
                            //,
                            //point: {
                            //    events: {
                            //        click: function () {
                            //            document.getElementById('Modal1000').click();
                            //        }
                            //    }
                            //}
                        }
                    },
                    series: [{
                        name: 'Forecasted',
                        data: data,
                        colors: '#4da6ff'
                    },
                    {
                        name: 'RE020 Complete',
                        data: re020data,
                        colors: '#00008b'
                    }]
                });
            });
        }        

        /* BAR CHART CREATER */
        function columnChartCreator_prevyr(container, data, ACTUALdata, planyear) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                //colors: ['#008000', '#003300']
            });
            $(function () {
                Highcharts.chart(container, {
                    chart: {
                        type: 'column',
                        height: '220',
                        //width: '220'
                    },
                    title: {
                        text: ''
                    },
                    xAxis: {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        title: {
                            text: planyear + ' Month',
                            style: {
                                fontSize: "12px"
                            }
                        }
                    },
                    yAxis: {
                        title: {
                            text: 'Project Count',
                            style: {
                                fontSize: "12px"
                            }
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:16px">{point.key} ' + planyear + '</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y}</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        column: {
                            grouping: false,
                            pointWidth: 10,
                        },
                        series: {
                            dataLabels: {
                                enabled: false,
                                format: '{y}'
                            }                            
                        }
                    },
                    series: [
                        {
                            name: 'Complete',
                            data: ACTUALdata,
                            color: '#008000'
                        }]
                });
            });
        }

        /* donut1 chart data */

        function loadDonut1prev_yr(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'New Site Build'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var data2 = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var ACTUALdata = [score[0]["ACTUALJAN"], score[0]["ACTUALFEB"], score[0]["ACTUALMAR"], score[0]["ACTUALAPR"], score[0]["ACTUALMAY"], score[0]["ACTUALJUN"],
            score[0]["ACTUALJUL"], score[0]["ACTUALAUG"], score[0]["ACTUALSEP"], score[0]["ACTUALOCT"], score[0]["ACTUALNOV"], score[0]["ACTUALDEC"]];
            var planyear = score[0]["PLANYEAR"];

            var POE_NSB_PREV_YR2 = score[0]["POE"];
            var POE_NSB_PREV_YR = POE_NSB_PREV_YR2.toLocaleString();
            //document.getElementById('POE_NSB_PREV_YR').innerHTML = 'POE: ' + POE_NSB_PREV_YR;
            var FORE_NSB_PREV_YR2 = score[0]["FORECAST"];
            var FORE_NSB_PREV_YR = FORE_NSB_PREV_YR2.toLocaleString();
            //document.getElementById('FORE_NSB_PREV_YR').innerHTML = 'Forecast: ' + FORE_NSB_PREV_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_NSB_PREV_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_NSB_PREV_YR = COMP_NSB_PREV_YR2.toLocaleString();
            document.getElementById('COMP_NSB_PREV_YR').innerHTML = 'Completed: ' + COMP_NSB_PREV_YR;

            //donutcharting103('donut1prev_yr', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
           //     within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function

            columnChartCreator_prevyr('donut1prev_yr', data2, ACTUALdata, planyear)
        }

        /* Ajax call to load the donut2 chart data */

        function loadDonut2prev_yr(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'MCA'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var data2 = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var ACTUALdata = [score[0]["ACTUALJAN"], score[0]["ACTUALFEB"], score[0]["ACTUALMAR"], score[0]["ACTUALAPR"], score[0]["ACTUALMAY"], score[0]["ACTUALJUN"],
            score[0]["ACTUALJUL"], score[0]["ACTUALAUG"], score[0]["ACTUALSEP"], score[0]["ACTUALOCT"], score[0]["ACTUALNOV"], score[0]["ACTUALDEC"]];
            var planyear = score[0]["PLANYEAR"];

            var POE_MCA_PREV_YR2 = score[0]["POE"];
            var POE_MCA_PREV_YR = POE_MCA_PREV_YR2.toLocaleString();
            //document.getElementById('POE_MCA_PREV_YR').innerHTML = 'POE: ' + POE_MCA_PREV_YR;
            var FORE_MCA_PREV_YR2 = score[0]["FORECAST"];
            var FORE_MCA_PREV_YR = FORE_MCA_PREV_YR2.toLocaleString();
            //document.getElementById('FORE_MCA_PREV_YR').innerHTML = 'Forecast: ' + FORE_MCA_PREV_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_MCA_PREV_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_MCA_PREV_YR = COMP_MCA_PREV_YR2.toLocaleString();
            document.getElementById('COMP_MCA_PREV_YR').innerHTML = 'Completed: ' + COMP_MCA_PREV_YR;

           // donutcharting103('donut2prev_yr', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
           //     within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            columnChartCreator_prevyr('donut2prev_yr', data2, ACTUALdata, planyear)
        }

        /* Ajax call to load the donut3 chart data */

        function loadDonut3prev_yr(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'CRAN'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var data2 = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var ACTUALdata = [score[0]["ACTUALJAN"], score[0]["ACTUALFEB"], score[0]["ACTUALMAR"], score[0]["ACTUALAPR"], score[0]["ACTUALMAY"], score[0]["ACTUALJUN"],
            score[0]["ACTUALJUL"], score[0]["ACTUALAUG"], score[0]["ACTUALSEP"], score[0]["ACTUALOCT"], score[0]["ACTUALNOV"], score[0]["ACTUALDEC"]];
            var planyear = score[0]["PLANYEAR"];

            var POE_CRAN_PREV_YR2 = score[0]["POE"];
            var POE_CRAN_PREV_YR = POE_CRAN_PREV_YR2.toLocaleString();
            //document.getElementById('POE_CRAN_PREV_YR').innerHTML = 'POE: ' + POE_CRAN_PREV_YR;
            var FORE_CRAN_PREV_YR2 = score[0]["FORECAST"];
            var FORE_CRAN_PREV_YR = FORE_CRAN_PREV_YR2.toLocaleString();
            //document.getElementById('FORE_CRAN_PREV_YR').innerHTML = 'Forecast: ' + FORE_CRAN_PREV_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_CRAN_PREV_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_CRAN_PREV_YR = COMP_CRAN_PREV_YR2.toLocaleString();
            document.getElementById('COMP_CRAN_PREV_YR').innerHTML = 'Completed: ' + COMP_CRAN_PREV_YR;

            //donutcharting103('donut3prev_yr', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            //    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            columnChartCreator_prevyr('donut3prev_yr', data2, ACTUALdata, planyear)
        }

        /* Ajax call to load the donut4 chart data */

        function loadDonut4prev_yr(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'Overlay'; //put the data into variables to pass to a chart building function
            var poe = score[0]["POE"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(1);
            var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var data2 = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var ACTUALdata = [score[0]["ACTUALJAN"], score[0]["ACTUALFEB"], score[0]["ACTUALMAR"], score[0]["ACTUALAPR"], score[0]["ACTUALMAY"], score[0]["ACTUALJUN"],
            score[0]["ACTUALJUL"], score[0]["ACTUALAUG"], score[0]["ACTUALSEP"], score[0]["ACTUALOCT"], score[0]["ACTUALNOV"], score[0]["ACTUALDEC"]];
            var planyear = score[0]["PLANYEAR"];

            var POE_LTE1C_PREV_YR2 = score[0]["POE"];
            var POE_LTE1C_PREV_YR = POE_LTE1C_PREV_YR2.toLocaleString();
            //document.getElementById('POE_LTE1C_PREV_YR').innerHTML = 'POE: ' + POE_LTE1C_PREV_YR;
            var FORE_LTE1C_PREV_YR2 = score[0]["FORECAST"];
            var FORE_LTE1C_PREV_YR = FORE_LTE1C_PREV_YR2.toLocaleString();
            //document.getElementById('FORE_LTE1C_PREV_YR').innerHTML = 'Forecast: ' + FORE_LTE1C_PREV_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_LTE1C_PREV_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_LTE1C_PREV_YR = COMP_LTE1C_PREV_YR2.toLocaleString();
            document.getElementById('COMP_LTE1C_PREV_YR').innerHTML = 'Completed: ' + COMP_LTE1C_PREV_YR;

            //donutcharting103('donut4prev_yr', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            //    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            columnChartCreator_prevyr('donut4prev_yr', data2, ACTUALdata, planyear)
        }

        /* Ajax call to load the donut5 chart data */

        function loadDonut5prev_yr(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'In-Building'; //put the data into variables to pass to a chart building function
            var poe = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["FORECAST"] - score[0]["FORECAST"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["FORECAST"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["FORECAST"]).toFixed(1);
            var short = score[0]["FORECAST"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var data2 = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var ACTUALdata = [score[0]["ACTUALJAN"], score[0]["ACTUALFEB"], score[0]["ACTUALMAR"], score[0]["ACTUALAPR"], score[0]["ACTUALMAY"], score[0]["ACTUALJUN"],
            score[0]["ACTUALJUL"], score[0]["ACTUALAUG"], score[0]["ACTUALSEP"], score[0]["ACTUALOCT"], score[0]["ACTUALNOV"], score[0]["ACTUALDEC"]];
            var planyear = score[0]["PLANYEAR"];

            var POE_IB_PREV_YR2 = score[0]["FORECAST"];
            var POE_IB_PREV_YR = POE_IB_PREV_YR2.toLocaleString();
            //document.getElementById('POE_IB_PREV_YR').innerHTML = 'POE: ' + POE_IB_PREV_YR;
            var FORE_IB_PREV_YR2 = score[0]["FORECAST"];
            var FORE_IB_PREV_YR = FORE_IB_PREV_YR2.toLocaleString();
            //document.getElementById('FORE_IB_PREV_YR').innerHTML = 'Forecast: ' + FORE_IB_PREV_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_IB_PREV_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_IB_PREV_YR = COMP_IB_PREV_YR2.toLocaleString();
            document.getElementById('COMP_IB_PREV_YR').innerHTML = 'Completed: ' + COMP_IB_PREV_YR;

            //donutcharting103('donut5prev_yr', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            //    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            columnChartCreator_prevyr('donut5prev_yr', data2, ACTUALdata, planyear)
        }

        /* Ajax call to load the donut6 chart data */

        function loadDonut6prev_yr(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'BWE SW'; //put the data into variables to pass to a chart building function
            var poe = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
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
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["FORECAST"] - score[0]["FORECAST"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["FORECAST"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["FORECAST"]).toFixed(1);
            var short = score[0]["FORECAST"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
            var data2 = [score[0]["FOREJAN"], score[0]["FOREFEB"], score[0]["FOREMAR"], score[0]["FOREAPR"], score[0]["FOREMAY"], score[0]["FOREJUN"],
            score[0]["FOREJUL"], score[0]["FOREAUG"], score[0]["FORESEP"], score[0]["FOREOCT"], score[0]["FORENOV"], score[0]["FOREDEC"]];
            var ACTUALdata = [score[0]["ACTUALJAN"], score[0]["ACTUALFEB"], score[0]["ACTUALMAR"], score[0]["ACTUALAPR"], score[0]["ACTUALMAY"], score[0]["ACTUALJUN"],
            score[0]["ACTUALJUL"], score[0]["ACTUALAUG"], score[0]["ACTUALSEP"], score[0]["ACTUALOCT"], score[0]["ACTUALNOV"], score[0]["ACTUALDEC"]];
            var planyear = score[0]["PLANYEAR"];

            var POE_BWESW_PREV_YR2 = score[0]["FORECAST"];
            var POE_BWESW_PREV_YR = POE_BWESW_PREV_YR2.toLocaleString();
            //document.getElementById('POE_BWESW_PREV_YR').innerHTML = 'POE: ' + POE_BWESW_PREV_YR;
            var FORE_BWESW_PREV_YR2 = score[0]["FORECAST"];
            var FORE_BWESW_PREV_YR = FORE_BWESW_PREV_YR2.toLocaleString();
            //document.getElementById('FORE_BWESW_PREV_YR').innerHTML = 'Forecast: ' + FORE_BWESW_PREV_YR + ' (' + perc_fore_of_plan + '%)';
            var COMP_BWESW_PREV_YR2 = score[0]["YTD_COMPLETE"];
            var COMP_BWESW_PREV_YR = COMP_BWESW_PREV_YR2.toLocaleString();
            document.getElementById('COMP_BWESW_PREV_YR').innerHTML = 'Completed: ' + COMP_BWESW_PREV_YR;

            //donutcharting103('donut6prev_yr', Number(value), title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            //    within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
            columnChartCreator_prevyr('donut6prev_yr', data2, ACTUALdata, planyear)
        }

        /* DONUT CHART CREATER */
        function donutcharting102(container, value, title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {
                var color101; //variable for chart color assignments

                if (planvsact >= 0) {
                    color101 = '#008000'; //its green
                } else {
                    color101 = '#ff0000'; //its red
                }

                subtitle = '<p style="font-size:24px; font-weight: bold; color:' + color101 + ';">' + planvsact + '<br><p style="font-size:18px; color:' + color101 + ';">to Plan' + '</p>'; //create the chart subtitle variable

                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        margin: '0',
                        height: '220',
                        //width: '220'

                    },
                    title: {
                        text: null
                    },
                    subtitle: { //chart subtitle assignment and location in the chart area
                        text: subtitle,
                        align: 'center',
                        verticalAlign: 'middle',
                        y: 20
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:12px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content +
                                '<b><center>' + planyear + ' POE (Plan): ' + poe
                                +
                                '<br>' + planyear + ' Forecast: ' + forecast + ' (' + perc_fore_of_plan + '%)'
                                +
                                '<br>' + planyear + ' Complete: ' + ytdcomplete + ' (' + perc_comp + '%)'
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
                            { name: 'Completed', y: ytdcomplete, color: '#008000' },
                            { name: '1Q Forecast', y: fore1q, color: '#00008b' },
                            { name: '2Q Forecast', y: fore2q, color: '#0066cc' },
                            { name: '3Q Forecast', y: fore3q, color: '#4da6ff' },
                            { name: '4Q Forecast', y: fore4q, color: '#87cefa' },
                            { name: 'Not ' + planyear + ' Forecasted', y: short, color: '#ff3333' },

                        ]
                    }]
                });
            });
        }

        /* DONUT CHART CREATER */
        function donutcharting103(container, value, title, poe, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {
                var color101; //variable for chart color assignments

                color101 = '#008000'; //its green                

                subtitle = '<p style="font-size:24px; font-weight: bold; color:' + color101 + ';">' + ytdcomplete + '<br><p style="font-size:16px; color:' + color101 + ';">Complete' + '</p>'; //create the chart subtitle variable


                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        margin: '0',
                        height: '220',
                        //width: '220'

                    },
                    title: {
                        text: null
                    },
                    subtitle: { //chart subtitle assignment and location in the chart area
                        text: subtitle,
                        align: 'center',
                        verticalAlign: 'middle',
                        y: 20
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:12px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content +
                                '<b><center>' + planyear + ' POE (Plan): ' + poe
                                +
                                '<br>' + planyear + ' Forecast: ' + forecast + ' (' + perc_fore_of_plan + '%)'
                                +
                                '<br>' + planyear + ' Complete: ' + ytdcomplete + ' (' + perc_comp + '%)'
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
                                enabled: false,
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
                            { name: 'Completed', y: ytdcomplete, color: '#008000' },
                            { name: '1Q Forecast', y: fore1q, color: '#00008b' },
                            { name: '2Q Forecast', y: fore2q, color: '#0066cc' },
                            { name: '3Q Forecast', y: fore3q, color: '#4da6ff' },
                            { name: '4Q Forecast', y: fore4q, color: '#87cefa' },
                            { name: 'Not ' + planyear + ' Forecasted', y: short, color: '#ff3333' },

                        ]
                    }]
                });
            });
        }

        function loadDashboardMARKET(data, market) {
            var tabdataMARKET_1 = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            var tabCheck = $("#market-table1").hasClass("tabulator")
            if (tabCheck) {
                $("#market-table1").tabulator("destroy");
            }
            $("#market-table1").tabulator({
                rowFormatter: function (row) {
                    //row - row component

                    var data = row.getData();

                    if (data.SUBMARKET2 == market) {
                        row.getElement().css({ "font-weight": "bold" });
                    }
                },
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", visible: false },
                    {
                        title: "Current Year",
                        columns: [
                            { title: "Market / Sub-Market", field: "SUBMARKET2", headerSort: false, align: "center" },
                        ],
                    },
                    {
                        title: "New Site Build", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_NSB", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "MCA", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_MCA", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "CRAN", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_CRAN", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                ],
            });

            $("#market-table1").tabulator("setData", tabdataMARKET_1);

        }

        function loadDashboardMARKET_2(data, market) {
            var tabdataMARKET_2 = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            var tabCheck = $("#market-table2").hasClass("tabulator")
            if (tabCheck) {
                $("#market-table2").tabulator("destroy");
            }
            $("#market-table2").tabulator({
                rowFormatter: function (row) {
                    //row - row component

                    var data = row.getData();

                    if (data.SUBMARKET2 == market) {
                        row.getElement().css({ "font-weight": "bold" });
                    }
                },
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", visible: false },
                    {
                        title: "Current Year",
                        columns: [
                            { title: "Market / Sub-Market", field: "SUBMARKET2", headerSort: false, align: "center" },
                        ],
                    },
                    {
                        title: "Overlay", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_LTE1C", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "In Building", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_IB", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "BWE SW (iPlan Only)", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_BWESW", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                ],
            });

            $("#market-table2").tabulator("setData", tabdataMARKET_2);

        }

        function loadDashboardMARKET_prev_yr(data, market) {
            var tabdataMARKET_1_prev_yr = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            var tabCheck = $("#market-table1_prev_yr").hasClass("tabulator")
            if (tabCheck) {
                $("#market-table1_prev_yr").tabulator("destroy");
            }
            $("#market-table1_prev_yr").tabulator({
                rowFormatter: function (row) {
                    //row - row component

                    var data = row.getData();

                    if (data.SUBMARKET2 == market) {
                        row.getElement().css({ "font-weight": "bold" });
                    }
                },
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", visible: false },
                    {
                        title: "Previous Year",
                        columns: [
                            { title: "Market / Sub-Market", field: "SUBMARKET2", headerSort: false, align: "center" },
                        ],
                    },
                    {
                        title: "New Site Build", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_NSB", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            //{
                            //    title: "YTD vs Plan", field: "PLANVSACT_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                            //    formatter: function (cell, formatterParams) {
                            //        var value = cell.getValue();
                            //        if (value < 0) {
                            //            return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                            //        } else {
                            //            return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                            //        }
                            //    }
                            //},
                        ],
                    },
                    {
                        title: "MCA", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_MCA", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            //{
                            //    title: "YTD vs Plan", field: "PLANVSACT_MCA", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                            //    formatter: function (cell, formatterParams) {
                            //        var value = cell.getValue();
                            //        if (value < 0) {
                            //            return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                            //        } else {
                            //            return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                            //        }
                            //    }
                            //},
                        ],
                    },
                    {
                        title: "CRAN", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_CRAN", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            //{
                            //    title: "YTD vs Plan", field: "PLANVSACT_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                            //    formatter: function (cell, formatterParams) {
                            //        var value = cell.getValue();
                            //        if (value < 0) {
                            //            return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                            //        } else {
                            //            return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                            //        }
                            //    }
                            //},
                        ],
                    },
                ],
            });

            $("#market-table1_prev_yr").tabulator("setData", tabdataMARKET_1_prev_yr);

        }

        function loadDashboardMARKET_2_prev_yr(data, market) {
            var tabdataMARKET_2_prev_yr = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            var tabCheck = $("#market-table2_prev_yr").hasClass("tabulator")
            if (tabCheck) {
                $("#market-table2_prev_yr").tabulator("destroy");
            }
            $("#market-table2_prev_yr").tabulator({
                rowFormatter: function (row) {
                    //row - row component

                    var data = row.getData();

                    if (data.SUBMARKET2 == market) {
                        row.getElement().css({ "font-weight": "bold" });
                    }
                },
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", visible: false },
                    {
                        title: "Previous Year",
                        columns: [
                            { title: "Market / Sub-Market", field: "SUBMARKET2", headerSort: false, align: "center" },
                        ],
                    },
                    {
                        title: "Overlay", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_LTE1C", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            //{
                            //    title: "YTD vs Plan", field: "PLANVSACT_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                            //    formatter: function (cell, formatterParams) {
                            //        var value = cell.getValue();
                            //        if (value < 0) {
                            //            return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                            //        } else {
                            //            return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                            //        }
                            //    }
                            //},
                        ],
                    },
                    {
                        title: "In Building", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_IB", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            //{
                            //    title: "YTD vs Plan", field: "PLANVSACT_IB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                            //    formatter: function (cell, formatterParams) {
                            //        var value = cell.getValue();
                            //        if (value < 0) {
                            //            return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                            //        } else {
                            //            return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                            //        }
                            //    }
                            //},
                        ],
                    },
                    {
                        title: "BWE SW", width: 410,
                        columns: [
                            { title: "POE", field: "POE_CUR_YR_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_BWESW", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            //{
                            //    title: "YTD vs Plan", field: "PLANVSACT_BWESW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                            //    formatter: function (cell, formatterParams) {
                            //        var value = cell.getValue();
                            //        if (value < 0) {
                            //            return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                            //        } else {
                            //            return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                            //        }
                            //    }
                            //},
                        ],
                    },
                ],
            });

            $("#market-table2_prev_yr").tabulator("setData", tabdataMARKET_2_prev_yr);

        }

        function showObjDrill() {

            $('#DAY30AVG').click(function () {
                var clicks = $(this).data('clicks');
                if (clicks) {
                    $('#DAY30AVG').show();
                    $('#DAY30AVG_HISTORY').hide();
                    $('#DAY90AVG_HISTORY').hide();
                } else {
                    $('#DAY30AVG').show();
                    $('#DAY90AVG_HISTORY').hide();
                    $('#DAY30AVG_HISTORY').show();
                }
                $(this).data("clicks", !clicks);
            });

            $('#DAY90AVG').click(function () {
                var clicks2 = $(this).data('clicks2');
                if (clicks2) {
                    $('#DAY90AVG').show();
                    $('#DAY30AVG_HISTORY').hide();
                    $('#DAY90AVG_HISTORY').hide();
                } else {
                    $('#DAY90AVG').show();
                    $('#DAY30AVG_HISTORY').hide();
                    $('#DAY90AVG_HISTORY').show();
                }
                $(this).data("clicks2", !clicks2);
            });

        }

        function ClickLink_NSB() {
            var market = $('#ddlMarket option:selected').val();
            window.open('/capacity/Drilldown.aspx?accordheader=0&market=' + market, '_blank');
        }
        function ClickLink_MCA() {
            var market = $('#ddlMarket option:selected').val();
            window.open('/capacity/Drilldown.aspx?accordheader=1&market=' + market, '_blank');
        }
        function ClickLink_CRAN() {
            var market = $('#ddlMarket option:selected').val();
            window.open('/capacity/Drilldown.aspx?accordheader=2&market=' + market, '_blank');
        }
        function ClickLink_LTE1C() {
            var market = $('#ddlMarket option:selected').val();
            window.open('/capacity/Drilldown.aspx?accordheader=3&market=' + market, '_blank');
        }
        function ClickLink_IB() {
            var market = $('#ddlMarket option:selected').val();
            window.open('/capacity/Drilldown.aspx?accordheader=4&market=' + market, '_blank');
        }
        function ClickLink_BWESW() {
            var market = $('#ddlMarket option:selected').val();
            window.open('/capacity/Drilldown.aspx?accordheader=5&market=' + market, '_blank');
        }

        function mouseOver_NSB() {
            document.getElementById("click1").style.color = "royalblue";
            document.getElementById("click1").style.cursor = 'pointer'
            document.getElementById("click1").style.textDecoration = "underline";
        }
        function mouseOut_NSB() {
            document.getElementById("click1").style.color = "#00008b";
            document.getElementById("click1").style.cursor = 'default'
            document.getElementById("click1").style.textDecoration = "none";
        }

        function mouseOver_MCA() {
            document.getElementById("click2").style.color = "royalblue";
            document.getElementById("click2").style.cursor = 'pointer'
            document.getElementById("click2").style.textDecoration = "underline";
        }
        function mouseOut_MCA() {
            document.getElementById("click2").style.color = "#00008b";
            document.getElementById("click2").style.cursor = 'default'
            document.getElementById("click2").style.textDecoration = "none";
        }

        function mouseOver_CRAN() {
            document.getElementById("click3").style.color = "royalblue";
            document.getElementById("click3").style.cursor = 'pointer'
            document.getElementById("click3").style.textDecoration = "underline";
        }
        function mouseOut_CRAN() {
            document.getElementById("click3").style.color = "#00008b";
            document.getElementById("click3").style.cursor = 'default'
            document.getElementById("click3").style.textDecoration = "none";
        }

        function mouseOver_LTE1C() {
            document.getElementById("click4").style.color = "royalblue";
            document.getElementById("click4").style.cursor = 'pointer'
            document.getElementById("click4").style.textDecoration = "underline";
        }
        function mouseOut_LTE1C() {
            document.getElementById("click4").style.color = "#00008b";
            document.getElementById("click4").style.cursor = 'default'
            document.getElementById("click4").style.textDecoration = "none";
        }

        function mouseOver_IB() {
            document.getElementById("click5").style.color = "royalblue";
            document.getElementById("click5").style.cursor = 'pointer'
            document.getElementById("click5").style.textDecoration = "underline";
        }
        function mouseOut_IB() {
            document.getElementById("click5").style.color = "#00008b";
            document.getElementById("click5").style.cursor = 'default'
            document.getElementById("click5").style.textDecoration = "none";
        }

        function mouseOver_BWESW() {
            document.getElementById("click6").style.color = "royalblue";
            document.getElementById("click6").style.cursor = 'pointer'
            document.getElementById("click6").style.textDecoration = "underline";
        }
        function mouseOut_BWESW() {
            document.getElementById("click6").style.color = "#00008b";
            document.getElementById("click6").style.cursor = 'default'
            document.getElementById("click6").style.textDecoration = "none";
        }

        function mouseOver_NSBprev_yr() {
            document.getElementById("click1prev_yr").style.color = "royalblue";
            document.getElementById("click1prev_yr").style.cursor = 'pointer'
            document.getElementById("click1prev_yr").style.textDecoration = "underline";
        }
        function mouseOut_NSBprev_yr() {
            document.getElementById("click1prev_yr").style.color = "#00008b";
            document.getElementById("click1prev_yr").style.cursor = 'default'
            document.getElementById("click1prev_yr").style.textDecoration = "none";
        }

        function mouseOver_MCAprev_yr() {
            document.getElementById("click2prev_yr").style.color = "royalblue";
            document.getElementById("click2prev_yr").style.cursor = 'pointer'
            document.getElementById("click2prev_yr").style.textDecoration = "underline";
        }
        function mouseOut_MCAprev_yr() {
            document.getElementById("click2prev_yr").style.color = "#00008b";
            document.getElementById("click2prev_yr").style.cursor = 'default'
            document.getElementById("click2prev_yr").style.textDecoration = "none";
        }

        function mouseOver_CRANprev_yr() {
            document.getElementById("click3prev_yr").style.color = "royalblue";
            document.getElementById("click3prev_yr").style.cursor = 'pointer'
            document.getElementById("click3prev_yr").style.textDecoration = "underline";
        }
        function mouseOut_CRANprev_yr() {
            document.getElementById("click3prev_yr").style.color = "#00008b";
            document.getElementById("click3prev_yr").style.cursor = 'default'
            document.getElementById("click3prev_yr").style.textDecoration = "none";
        }

        function mouseOver_LTE1Cprev_yr() {
            document.getElementById("click4prev_yr").style.color = "royalblue";
            document.getElementById("click4prev_yr").style.cursor = 'pointer'
            document.getElementById("click4prev_yr").style.textDecoration = "underline";
        }
        function mouseOut_LTE1Cprev_yr() {
            document.getElementById("click4prev_yr").style.color = "#00008b";
            document.getElementById("click4prev_yr").style.cursor = 'default'
            document.getElementById("click4prev_yr").style.textDecoration = "none";
        }

        function mouseOver_IBprev_yr() {
            document.getElementById("click5prev_yr").style.color = "royalblue";
            document.getElementById("click5prev_yr").style.cursor = 'pointer'
            document.getElementById("click5prev_yr").style.textDecoration = "underline";
        }
        function mouseOut_IBprev_yr() {
            document.getElementById("click5prev_yr").style.color = "#00008b";
            document.getElementById("click5prev_yr").style.cursor = 'default'
            document.getElementById("click5prev_yr").style.textDecoration = "none";
        }

        function mouseOver_BWESWprev_yr() {
            document.getElementById("click6prev_yr").style.color = "royalblue";
            document.getElementById("click6prev_yr").style.cursor = 'pointer'
            document.getElementById("click6prev_yr").style.textDecoration = "underline";
        }
        function mouseOut_BWESWprev_yr() {
            document.getElementById("click6prev_yr").style.color = "#00008b";
            document.getElementById("click6prev_yr").style.cursor = 'default'
            document.getElementById("click6prev_yr").style.textDecoration = "none";
        }

        function mouseOver_NSBplus1() {
            document.getElementById("click1plus1").style.color = "royalblue";
            document.getElementById("click1plus1").style.cursor = 'pointer'
            document.getElementById("click1plus1").style.textDecoration = "underline";
        }
        function mouseOut_NSBplus1() {
            document.getElementById("click1plus1").style.color = "#00008b";
            document.getElementById("click1plus1").style.cursor = 'default'
            document.getElementById("click1plus1").style.textDecoration = "none";
        }

        function mouseOver_MCAplus1() {
            document.getElementById("click2plus1").style.color = "royalblue";
            document.getElementById("click2plus1").style.cursor = 'pointer'
            document.getElementById("click2plus1").style.textDecoration = "underline";
        }
        function mouseOut_MCAplus1() {
            document.getElementById("click2plus1").style.color = "#00008b";
            document.getElementById("click2plus1").style.cursor = 'default'
            document.getElementById("click2plus1").style.textDecoration = "none";
        }

        function mouseOver_CRANplus1() {
            document.getElementById("click3plus1").style.color = "royalblue";
            document.getElementById("click3plus1").style.cursor = 'pointer'
            document.getElementById("click3plus1").style.textDecoration = "underline";
        }
        function mouseOut_CRANplus1() {
            document.getElementById("click3plus1").style.color = "#00008b";
            document.getElementById("click3plus1").style.cursor = 'default'
            document.getElementById("click3plus1").style.textDecoration = "none";
        }

        function mouseOver_LTE1Cplus1() {
            document.getElementById("click4plus1").style.color = "royalblue";
            document.getElementById("click4plus1").style.cursor = 'pointer'
            document.getElementById("click4plus1").style.textDecoration = "underline";
        }
        function mouseOut_LTE1Cplus1() {
            document.getElementById("click4plus1").style.color = "#00008b";
            document.getElementById("click4plus1").style.cursor = 'default'
            document.getElementById("click4plus1").style.textDecoration = "none";
        }

        function mouseOver_IBplus1() {
            document.getElementById("click5plus1").style.color = "royalblue";
            document.getElementById("click5plus1").style.cursor = 'pointer'
            document.getElementById("click5plus1").style.textDecoration = "underline";
        }
        function mouseOut_IBplus1() {
            document.getElementById("click5plus1").style.color = "#00008b";
            document.getElementById("click5plus1").style.cursor = 'default'
            document.getElementById("click5plus1").style.textDecoration = "none";
        }

        function mouseOver_BWESWplus1() {
            document.getElementById("click6plus1").style.color = "royalblue";
            document.getElementById("click6plus1").style.cursor = 'pointer'
            document.getElementById("click6plus1").style.textDecoration = "underline";
        }
        function mouseOut_BWESWplus1() {
            document.getElementById("click6plus1").style.color = "#00008b";
            document.getElementById("click6plus1").style.cursor = 'default'
            document.getElementById("click6plus1").style.textDecoration = "none";
        }

        function mouseOver_NSBplus2() {
            document.getElementById("click1plus2").style.color = "royalblue";
            document.getElementById("click1plus2").style.cursor = 'pointer'
            document.getElementById("click1plus2").style.textDecoration = "underline";
        }
        function mouseOut_NSBplus2() {
            document.getElementById("click1plus2").style.color = "#00008b";
            document.getElementById("click1plus2").style.cursor = 'default'
            document.getElementById("click1plus2").style.textDecoration = "none";
        }

        function mouseOver_MCAplus2() {
            document.getElementById("click2plus2").style.color = "royalblue";
            document.getElementById("click2plus2").style.cursor = 'pointer'
            document.getElementById("click2plus2").style.textDecoration = "underline";
        }
        function mouseOut_MCAplus2() {
            document.getElementById("click2plus2").style.color = "#00008b";
            document.getElementById("click2plus2").style.cursor = 'default'
            document.getElementById("click2plus2").style.textDecoration = "none";
        }

        function mouseOver_CRANplus2() {
            document.getElementById("click3plus2").style.color = "royalblue";
            document.getElementById("click3plus2").style.cursor = 'pointer'
            document.getElementById("click3plus2").style.textDecoration = "underline";
        }
        function mouseOut_CRANplus2() {
            document.getElementById("click3plus2").style.color = "#00008b";
            document.getElementById("click3plus2").style.cursor = 'default'
            document.getElementById("click3plus2").style.textDecoration = "none";
        }

        function mouseOver_LTE1Cplus2() {
            document.getElementById("click4plus2").style.color = "royalblue";
            document.getElementById("click4plus2").style.cursor = 'pointer'
            document.getElementById("click4plus2").style.textDecoration = "underline";
        }
        function mouseOut_LTE1Cplus2() {
            document.getElementById("click4plus2").style.color = "#00008b";
            document.getElementById("click4plus2").style.cursor = 'default'
            document.getElementById("click4plus2").style.textDecoration = "none";
        }

        function mouseOver_IBplus2() {
            document.getElementById("click5plus2").style.color = "royalblue";
            document.getElementById("click5plus2").style.cursor = 'pointer'
            document.getElementById("click5plus2").style.textDecoration = "underline";
        }
        function mouseOut_IBplus2() {
            document.getElementById("click5plus2").style.color = "#00008b";
            document.getElementById("click5plus2").style.cursor = 'default'
            document.getElementById("click5plus2").style.textDecoration = "none";
        }

        function mouseOver_BWESWplus2() {
            document.getElementById("click6plus2").style.color = "royalblue";
            document.getElementById("click6plus2").style.cursor = 'pointer'
            document.getElementById("click6plus2").style.textDecoration = "underline";
        }
        function mouseOut_BWESWplus2() {
            document.getElementById("click6plus2").style.color = "#00008b";
            document.getElementById("click6plus2").style.cursor = 'default'
            document.getElementById("click6plus2").style.textDecoration = "none";
        }

        function mouseOver_NSBplus3() {
            document.getElementById("click1plus3").style.color = "royalblue";
            document.getElementById("click1plus3").style.cursor = 'pointer'
            document.getElementById("click1plus3").style.textDecoration = "underline";
        }
        function mouseOut_NSBplus3() {
            document.getElementById("click1plus3").style.color = "#00008b";
            document.getElementById("click1plus3").style.cursor = 'default'
            document.getElementById("click1plus3").style.textDecoration = "none";
        }

        function mouseOver_MCAplus3() {
            document.getElementById("click2plus3").style.color = "royalblue";
            document.getElementById("click2plus3").style.cursor = 'pointer'
            document.getElementById("click2plus3").style.textDecoration = "underline";
        }
        function mouseOut_MCAplus3() {
            document.getElementById("click2plus3").style.color = "#00008b";
            document.getElementById("click2plus3").style.cursor = 'default'
            document.getElementById("click2plus3").style.textDecoration = "none";
        }

        function mouseOver_CRANplus3() {
            document.getElementById("click3plus3").style.color = "royalblue";
            document.getElementById("click3plus3").style.cursor = 'pointer'
            document.getElementById("click3plus3").style.textDecoration = "underline";
        }
        function mouseOut_CRANplus3() {
            document.getElementById("click3plus3").style.color = "#00008b";
            document.getElementById("click3plus3").style.cursor = 'default'
            document.getElementById("click3plus3").style.textDecoration = "none";
        }

        function mouseOver_LTE1Cplus3() {
            document.getElementById("click4plus3").style.color = "royalblue";
            document.getElementById("click4plus3").style.cursor = 'pointer'
            document.getElementById("click4plus3").style.textDecoration = "underline";
        }
        function mouseOut_LTE1Cplus3() {
            document.getElementById("click4plus3").style.color = "#00008b";
            document.getElementById("click4plus3").style.cursor = 'default'
            document.getElementById("click4plus3").style.textDecoration = "none";
        }

        function mouseOver_IBplus3() {
            document.getElementById("click5plus3").style.color = "royalblue";
            document.getElementById("click5plus3").style.cursor = 'pointer'
            document.getElementById("click5plus3").style.textDecoration = "underline";
        }
        function mouseOut_IBplus3() {
            document.getElementById("click5plus3").style.color = "#00008b";
            document.getElementById("click5plus3").style.cursor = 'default'
            document.getElementById("click5plus3").style.textDecoration = "none";
        }

        function mouseOver_BWESWplus3() {
            document.getElementById("click6plus3").style.color = "royalblue";
            document.getElementById("click6plus3").style.cursor = 'pointer'
            document.getElementById("click6plus3").style.textDecoration = "underline";
        }
        function mouseOut_BWESWplus3() {
            document.getElementById("click6plus3").style.color = "#00008b";
            document.getElementById("click6plus3").style.cursor = 'default'
            document.getElementById("click6plus3").style.textDecoration = "none";
        }

        function mouseOver_link(market_num) {
            document.getElementById(market_num).style.color = "royalblue";
            document.getElementById(market_num).style.cursor = 'pointer'
            document.getElementById(market_num).style.textDecoration = "underline";
        }
        function mouseOut_link(market_num) {
            document.getElementById(market_num).style.color = "#00008b";
            document.getElementById(market_num).style.cursor = 'default'
            document.getElementById(market_num).style.textDecoration = "none";
        }

        $('#DAY30AVG_HISTORY').hide();
        $('#DAY90AVG_HISTORY').hide();

        showObjDrill();

    </script>

</asp:Content>


