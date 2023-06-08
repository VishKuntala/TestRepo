<%@ Page Title="Sales Dashboard" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sales_Dashboard_Blank_Test.aspx.cs" Inherits="_Sales_Dashboard_Blank_Test" %>

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
    <script src="../capacity/maps/leaflet-event-forwarder.js"></script>

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
            <h3 class="m-subheader__title m-subheader__title--separator">Sales Report Dashboard
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/sales/Sales_Dashboard.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/sales/Sales_Dashboard.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Sales Dashboard
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
        <div class="m-portlet">

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <h5 class="left">Date Of Data: &nbsp; </h5>
                    <h5 class="left" id="DATADATE"></h5>
                    <asp:Label ID="labelMarket" runat="server" Text="Region/AVP/Market: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                    <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                        <asp:ListItem Text=""></asp:ListItem>
                    </asp:DropDownList>                    
                </div>
            </div>

            <div class="m-portlet__body">                

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
                                        <div class="col-md-2" id="NBD_ON_TIME_1" style="text-align: center; color: black ">
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
                                        <%--<div class="col-md-2">Pending</div>--%>
                                        <div class="col-md-2" id="DAY30FOREATTAIN_1" style="text-align: center; color: #00008b">
                                            <a class="menu_show" title="Toggle 30 Day Forecast Attainment History Chart">
                                                <h6 class="m-subheader__title m-subheader__title--separator" onmouseover="style.color='royalblue'" onmouseout="style.color='#00008b'" id="DAY30AVG"></h6>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow91" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-10" id="title95col" style="height: 100%;" title="Same as 30 Day Forecast Attainment except looks 90 Days back for forecasted amount">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">90 Day Forecast Attainment</h6>
                                        </div>
                                        <%--<div class="col-md-2">Pending</div>--%>
                                        <div class="col-md-2" id="DAY90FOREATTAIN_1" style="text-align: center; color: #00008b">
                                            <a class="menu_show" title="Toggle 90 Day Forecast Attainment History Chart">
                                                <h6 class="m-subheader__title m-subheader__title--separator" onmouseover="style.color='royalblue'" onmouseout="style.color='#00008b'" id="DAY90AVG"></h6>
                                            </a>
                                        </div>
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
                                <div id="map" style="height: 450px;"></div>
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
                  
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            attachClickHandlers();


            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard_Blank_Test.aspx/Get_Store_Detail_National1",  //use a function from C# , change this for different data return
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data1 = data.d;
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard_Blank_Test.aspx/Get_Store_Detail_National2",  //use a function from C# , change this for different data return
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data2 = data.d;
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard_Blank_Test.aspx/Get_Store_Detail_National3",  //use a function from C# , change this for different data return
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data3 = data.d;
                    },
                    error: function (data) {
                    }
                })
            ).then(function () {
                dataConcat_3strings(Data1, Data2, Data3);
            });

            function dataConcat_3strings(data1, data2, data3) {
                var dataConcat3;
                data1 = data1.substring(0, data1.length - 1);
                data2 = data2.substring(1, data2.length - 1);
                data3 = data3.substring(1, data3.length);
                dataConcat3 = data1 + ',' + data2 + ',' + data3;
                data = JSON.parse(dataConcat3);
                makeMap(data);
            }



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
                url: "Sales_Dashboard_Blank.aspx/GetCURRYEAR",
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

        function Getmarketdata(market) {

            $.ajax({
                type: "POST",
                async: true,
                url: "Sales_Dashboard_Blank.aspx/GetDATADATE",
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

        function makeMap(storeData) {

            var WALMART = storeData.filter(function (el) {
                return el.MASTER_DEALER_NAME.includes("WALMART");
            });
            var TARGET = storeData.filter(function (el) {
                return el.MASTER_DEALER_NAME.includes("TARGET MOBILE/DIRECT");
            });

            //WALMARTstorePoints = L.featureGroup.subGroup(mcg),// use `L.featureGroup.subGroup(parentGroup)` instead of `L.featureGroup()` or `L.layerGroup()`!
            //TARGETstorePoints = L.featureGroup.subGroup(mcg);

            //var WALMARTstorePoints;

            //for (i in WALMART) {
            //    var popup =
            //        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
            //        '<b>Category Name:</b> ' + WALMART[i].MASTER_DEALER_NAME +
            //        '<br/><b>Location ID:</b> ' + WALMART[i].LOCATION_ID +
            //        '<br/><b>Wireless Score:</b> ' + WALMART[i].WIRELESS_SCORE;

            //    var loc = [WALMART[i].LATITUDE, WALMART[i].LONGITUDE];	//position found

            //    var customColor = '#ffffff';
            //    var wirelessscore = WALMART[i].WIRELESS_SCORE;

            //    if (wirelessscore === 5)
            //        customColor = '#003300';
            //    if (wirelessscore === 4)
            //        customColor = '#008000';
            //    if (wirelessscore === 3)
            //        customColor = '#00cc00';
            //    if (wirelessscore === 2)
            //        customColor = '#ffff00';
            //    else if (wirelessscore === 1)
            //        customColor = '#e6b800';

            //    var WALMARTstoreTableoptions = {
            //        //icon: 'store',
            //        iconShape: 'doughnut',
            //        iconSize: [16, 16],
            //        borderWidth: 8,
            //        borderColor: customColor
            //    };

            //    var SALES_REGION = WALMART[i][10];
            //    var SALES_VPGM_MARKET = WALMART[i][11];
            //    var STATE = WALMART[i][8];
            //    //var COUNTY = WALMART[i][22];
            //    var CITY = WALMART[i][7];
            //    var ZIP_CODE = WALMART[i][9];

            //    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
            //    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(WALMARTstoreTableoptions) };
            //    marker = new L.Marker(new L.latLng(loc), markerOptions);
            //    marker.setOpacity(.7);
            //    marker.bindPopup(popup);
            //    //ATTRstorePoints.addLayer(marker);
            //    marker.addTo(WALMARTstorePoints);
            //}

            

            //let aPoints = [[-43.96119063892024, 110.12695312499999], [-43.96119063892024, 160.400390625], [-10.487811882056683, 160.400390625], [-10.487811882056683, 110.12695312499999], [-43.96119063892024, 110.12695312499999]];
            //let bPoints = [[-18.646245142670598, 134.033203125], [-27.215556209029675, 126.474609375], [-27.449790329784214, 140.625], [-18.646245142670598, 134.033203125]];
            //let cPoints = [[-47.93106634750977, 115.48828125000001], [-47.93106634750977, 154.423828125], [-13.838079936422462, 154.423828125], [-13.838079936422462, 115.48828125000001], [-47.93106634750977, 115.48828125000001]];


            const map = L.map("map");

            // prepare a container to hold our z stackable layer panes
            const container = map.createPane('stack-container');

            const myEventForwarder = new L.eventForwarder({
                map: map,
                events: {
                    click: true,
                    mousemove: false
                },
                throttleMs: 100,
                throttleOptions: {
                    leading: true,
                    trailing: false
                }
            });

            myEventForwarder.enable();

            L.tileLayer("http://{s}.tile.osm.org/{z}/{x}/{y}.png").addTo(map);
            map.setView([-25, 133], 4);

            //const aRenderer = L.canvas({ padding: 0.5, pane: 'aPane' });
            //const aPane = map.createPane('aPane', container);
            //const aLayer = L.polygon(aPoints, { color: 'red', renderer: aRenderer }).bindTooltip('I\'m a red tooltip, one the bottom').bindPopup('I\'m a red popup, one the bottom');

            //const bRenderer = L.canvas({ padding: 0.5, pane: 'bPane' });
            //const bPane = map.createPane('bPane', container);
            //const bLayer = L.polygon(bPoints, { color: 'green', renderer: bRenderer }).bindTooltip('I\'m a green tooltip, middle').bindPopup('I\'m a green tooltip, middle');

            //const cRenderer = L.canvas({ padding: 0.5, pane: 'cPane' });
            //const cPane = map.createPane('cPane', container);
            //const cLayer = L.polygon(cPoints, { color: 'blue', renderer: cRenderer }).bindTooltip('I\'m blue, top');

            var myRenderer = L.canvas({ padding: 0.5, pane: 'aPane' });
            var aPane = map.createPane('aPane', container);            

            var myRenderer2 = L.canvas({ padding: 0.5, pane: 'bPane' });
            var bPane = map.createPane('bPane', container);

            for (i in WALMART) {

                var loc = [WALMART[i].LATITUDE, WALMART[i].LONGITUDE];

                var aLayer = L.circleMarker(L.latLng(loc), {
                    renderer: myRenderer,
                    "radius": 8,
                    "fillColor": "#012999",
                    "color": "#012999",
                    "weight": 3,
                    "opacity": 1
                }).addTo(map).bindPopup('<b>Category Name:</b> ' + WALMART[i].MASTER_DEALER_NAME +
                    '<br/><b>Location ID:</b> ' + WALMART[i].LOCATION_ID +
                    '<br/><b>Wireless Score:</b> ' + WALMART[i].WIRELESS_SCORE);
            }

            for (i in TARGET) {

                var loc = [TARGET[i].LATITUDE, TARGET[i].LONGITUDE];

                var bLayer = L.circleMarker(L.latLng(loc), {
                    renderer: myRenderer2,
                    "radius": 8,
                    "fillColor": 'red',
                    "color": 'red',
                    "weight": 3,
                    "opacity": 1
                }).addTo(map).bindPopup('<b>Category Name:</b> ' + TARGET[i].MASTER_DEALER_NAME +
                    '<br/><b>Location ID:</b> ' + TARGET[i].LOCATION_ID +
                    '<br/><b>Wireless Score:</b> ' + TARGET[i].WIRELESS_SCORE);

            }

            

            var baseLayers = {};
            //var overlays = {};
            var overlays = {
                "WALMART": aLayer,
                "TARGET": bLayer
            };
            var layerControl = L.control.layers(baseLayers, overlays, { sortLayers: false }).addTo(map);

            //layerControl.addOverlay(cLayer, "C Canvas (top, blue)");
            //layerControl.addOverlay(bLayer, "B Canvas (middle, green)");
            //layerControl.addOverlay(aLayer, "A Canvas (bottom, red)");
        }

    </script>


</asp:Content>


