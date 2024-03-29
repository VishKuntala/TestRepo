﻿<%@ Page Title="Sales Dashboard" Language="C#" MasterPageFile="~/MasterPageSales.master" AutoEventWireup="true" CodeFile="Sales_Dashboard.aspx.cs" Inherits="sales_Sales_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://rudovjan.github.io/highcharts-tooltip-delay/tooltip-delay.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script type="text/javascript" src="/capacity/haccordion.js"></script>
    <script type="text/javascript" src="/capacity/ddaccordion.js"></script>

    <script type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>
    <link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script src="../Content/Bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>

    <script src="https://d3js.org/d3.v5.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>

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

    <%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.18/b-1.5.6/b-flash-1.5.6/b-html5-1.5.6/fh-3.1.4/sl-1.3.0/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

    <style>
        .left {
            float: left;
        }

        .right {
            float: right;
            text-align: right;
        }

        .box2 {
            height: 2px;
        }

        .titleback {
            background: #87cefa;
        }

        .legend {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.6;
            }

        .info.legend {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 150px;
        }

        .legend .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_cran {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend_cran i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.6;
            }

        .info.legend_cran {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px; /*change to 64 for 3 items in box*/
            width: 150px;
        }

        .legend_cran .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_ib {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend_ib i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.6;
            }

        .info.legend_ib {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px; /*change to 64 for 3 items in box*/
            width: 150px;
        }

        .legend_ib .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }
    </style>

    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Sales Report Dashboard
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <%--<li class="m-nav__item m-nav__item--home">
                    <a href="/sales/Sales.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>--%>
                
                <li class="m-nav__item">
                    <%--<a href="/Production/Production.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>--%>
                    <a href="/sales/Sales.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Sales Home
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">
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

                    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>

                            <asp:Label ID="labelMarket" runat="server" Text="Sales Region/VPGM: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlMarket"  AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                            </asp:DropDownList>

                            <%--<asp:Label ID="labelTime" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Time Period: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlTime" AutoPostBack="false" runat="server">
                            </asp:DropDownList>--%>

                            <%--<asp:Button ID="Button1" Style="margin: 5px;" runat="server" Text="Submit" OnClientClick="getFilterCriteria();" />--%>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>

            <div class="m-portlet__body">
                <div class="row">
                    <div class="col-lg-12">


                        <%--<div class="box2 titleback">&nbsp;</div>

                        <div id="market2_1" style="text-align: center; vertical-align: middle; color: black">
                            <h3 class="titleback" id="markettitle"></h3>
                        </div>
                        <br />
                        <br />--%>
                        <div class="m-section">


                            <div class="col-lg-12" id="tabs">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#m_tabs_1_1" id="tab1">
                                            <i class="flaticon-pin"></i><span class="m--visible-desktop-inline-block">New Site Build</span>
                                        </a>
                                    </li>
                                    <%--<li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_2" id="tab2">
                                            <i class="flaticon-layers"></i><span class="m--visible-desktop-inline-block">MCA</span>
                                        </a>
                                    </li>--%>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_3" id="tab3">
                                            <i class="flaticon-shapes"></i><span class="m--visible-desktop-inline-block">CRAN Nodes</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_4" id="tab4">
                                            <i class="flaticon-map"></i><span class="m--visible-desktop-inline-block">In Building</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_5" id="tab5">
                                            <i class="flaticon-share"></i><span class="m--visible-desktop-inline-block">C-Band</span>
                                        </a>
                                    </li>
                                    <%--<li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#m_tabs_1_5" id="tab5">
                                        <i class="flaticon-calendar-3"></i><span class="m--visible-desktop-inline-block">Placeholder 5</span>
                                    </a>
                                </li>                                
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#m_tabs_1_6" id="tab6">
                                        <i class="flaticon-share"></i><span class="m--visible-desktop-inline-block">Placeholder 6</span>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#m_tabs_1_7" id="tab7">
                                        <i class="flaticon-graph"></i><span class="m--visible-desktop-inline-block">Placeholder 7</span>
                                    </a>
                                </li>                                
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#m_tabs_1_8" id="tab8">
                                        <i class="flaticon-more-v4"></i><span class="m--visible-desktop-inline-block">Placeholder 8</span>
                                    </a>
                                </li>                       --%>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">

                                        <%--<div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="m-portlet__head-title">
                                                    <span class="m-portlet__head-icon">
                                                        <i class="flaticon-analytics"></i>
                                                    </span>
                                                    <h3 class="m-portlet__head-text"></h3>
                                                </div>
                                            </div>
                                        </div>--%>

                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div id="LOADING_Recent2" style='display: none'>
                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12" id="RecentDiv">
                                                <div class="row">
                                                <div class="col-lg-1" id="RecentDiv1">&nbsp;</div>
                                                <div class="col-lg-10" id="RecentDiv2">
                                                <div id="salesmapShow">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle"></h2>
                                                        <h5 id="mapcountsubtitle2"></h5>
                                                        <h5 id="mapcountsubtitle"></h5>                                                        
                                                        <h6 id="mapcountsubtitle3"></h6>
                                                    </div>

                                                    <div id="salesmapdiv" style="height: 650px;"></div>
                                                    <br />
                                                    <h6><i><b>* Forecast dates are subject to uncertainties and matters beyond our control that could cause actual results to differ materially.  You are cautioned not to place undue reliance on this view, which reflect estimated dates. Forecast dates will be updated, but there is no plan to highlight or publicly state the reasons for any changes.</b></i></h6>
                                                </div>
                                                <br />
                                                <div id="Recent_Sales_Detail" class="m-section__content" style="height: 300px; width: 100%">
                                                    <table id="Sales_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                        <thead>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                                    </div>
                                                <div class="col-lg-1" id="RecentDiv3"></div>
                                                    </div>


                                            </div>
                                        </div>                                        

                                    </div>

                                    <%--<div class="tab-pane" id="m_tabs_1_2" role="tabpanel">
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="row">
                                                    <div class="col-lg-12">

                                                        <div class="row" style="text-align: left">Placeholder2</div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>

                                    <div class="tab-pane" id="m_tabs_1_3" role="tabpanel">


                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div id="LOADING_Recent2_CRAN" style='display: none'>
                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12" id="RecentDiv_CRAN">
                                                <div class="row">
                                                <div class="col-lg-1" id="RecentDiv1_CRAN">&nbsp;</div>
                                                <div class="col-lg-10" id="RecentDiv2_CRAN">



                                                <div id="salesmapShow_CRAN">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle_CRAN"></h2>
                                                        <h5 id="mapcountsubtitle2_CRAN"></h5>
                                                        <h5 id="mapcountsubtitle_CRAN"></h5>                                                        
                                                        <h6 id="mapcountsubtitle3_CRAN"></h6>
                                                    </div>

                                                    <div id="salesmapdiv_CRAN" style="height: 650px;"></div>
                                                    <br />
                                                    <h6><i><b>* Forecast dates are subject to uncertainties and matters beyond our control that could cause actual results to differ materially.  You are cautioned not to place undue reliance on this view, which reflect estimated dates. Forecast dates will be updated, but there is no plan to highlight or publicly state the reasons for any changes.</b></i></h6>
                                                </div>
                                                <br />
                                                <div id="Recent_Sales_Detail_CRAN" class="m-section__content" style="height: 300px; width: 100%">
                                                    <table id="Sales_Detail_CRAN" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                        <thead>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                                    </div>
                                                <div class="col-lg-1" id="RecentDiv3_CRAN"></div>
                                                    </div>

                                            </div>
                                        </div>


                                    </div>

                                    <div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
                                       <div class="m-portlet__head-caption">
                                        </div>
                                        <div id="LOADING_Recent2_IB" style='display: none'>
                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12" id="RecentDiv_IB">
                                                <div class="row">
                                                <div class="col-lg-1" id="RecentDiv1_IB">&nbsp;</div>
                                                <div class="col-lg-10" id="RecentDiv2_IB">



                                                <div id="salesmapShow_IB">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle_IB"></h2>
                                                        <h5 id="mapcountsubtitle2_IB"></h5>
                                                        <h5 id="mapcountsubtitle_IB"></h5>                                                        
                                                        <h6 id="mapcountsubtitle3_IB"></h6>
                                                    </div>

                                                    <div id="salesmapdiv_IB" style="height: 650px;"></div>
                                                    <div style="text-align: center; color: #343a40">                                                                                                           
                                                        <h6 id="mapcountfooter_IB"></h6>
                                                    </div>

                                                    <br />
                                                    <h6><i><b>* Forecast dates are subject to uncertainties and matters beyond our control that could cause actual results to differ materially.  You are cautioned not to place undue reliance on this view, which reflect estimated dates. Forecast dates will be updated, but there is no plan to highlight or publicly state the reasons for any changes.</b></i></h6>


                                                </div>
                                                <br />
                                                <div id="Recent_Sales_Detail_IB" class="m-section__content" style="height: 300px; width: 100%">
                                                    <table id="Sales_Detail_IB" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                        <thead>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                                    </div>
                                                <div class="col-lg-1" id="RecentDiv3_IB"></div>
                                                    </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="m_tabs_1_5" role="tabpanel">


                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div id="LOADING_Recent2_CB" style='display: none'>
                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-12" id="RecentDiv_CB">
                                                <div class="row">
                                                <div class="col-lg-1" id="RecentDiv1_CB">&nbsp;</div>
                                                <div class="col-lg-10" id="RecentDiv2_CB">



                                                <div id="salesmapShow_CB">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle_CB"></h2>
                                                        <h5 id="mapcountsubtitle2_CB"></h5>
                                                        <h5 id="mapcountsubtitle_CB"></h5>                                                        
                                                        <h6 id="mapcountsubtitle3_CB"></h6>
                                                    </div>

                                                    <div id="salesmapdiv_CB" style="height: 650px;"></div>
                                                    <br />
                                                    <h6><i><b>* Forecast dates are subject to uncertainties and matters beyond our control that could cause actual results to differ materially.  You are cautioned not to place undue reliance on this view, which reflect estimated dates. Forecast dates will be updated, but there is no plan to highlight or publicly state the reasons for any changes.</b></i></h6>
                                                </div>
                                                <br />
                                                <div id="Recent_Sales_Detail_CB" class="m-section__content" style="height: 300px; width: 100%">
                                                    <table id="Sales_Detail_CB" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                        <thead>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                <th bgcolor="#87CEFA">Category</th>
                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                <th bgcolor="#87CEFA">State</th>
                                                                <th bgcolor="#87CEFA">County</th>
                                                                <th bgcolor="#87CEFA">CMA Name</th>
                                                                <th bgcolor="#87CEFA">City</th>
                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                <th bgcolor="#87CEFA">On Air Date</th>

                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                                    </div>
                                                <div class="col-lg-1" id="RecentDiv3_CB"></div>
                                                    </div>

                                            </div>
                                        </div>


                                    </div>

                                </div>
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
            console.log("DocReady");
            var market_long = $('#ddlMarket option:selected').text();
            //document.getElementById('markettitle').innerHTML = market_long;
            $('#salesmapShow').hide();
            $('#salesmapShow_CRAN').hide();
            $('#salesmapShow_IB').hide();
            $('#salesmapShow_CB').hide();
            $('#Recent_Sales_Detail').hide();
            $('#Recent_Sales_Detail_CRAN').hide();
            $('#Recent_Sales_Detail_IB').hide();
            $('#Recent_Sales_Detail_CB').hide();

            var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
            var market_long = "National";
            var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            $('#LOADING_Recent2').show();
            Getmarketdata(market, time, market_long);
            mainClickOnceNSB();
            mainClickOnce();
            mainClickOnceIB();
            mainClickOnceCB();
        });

        function attachClickHandlers() {
            console.log("ClickHandler");
            $('#ddlMarket').change(
                function () {
                    getFilterCriteria();
                    mainClickOnceNSB();
                    mainClickOnce();
                    mainClickOnceIB();
                    mainClickOnceCB();
                }
            );           
        }

        $('.nav-tabs li').on('click', function () {
            setTimeout(function () {
                $(window).resize();
            }, 0);
        }); 

        function mainClickOnceNSB() {
            $('#tab1').on('click', function (e) {
                $('#LOADING_Recent2').show();
                $('#salesmapShow').hide();
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
                updateSalesChart(market, time, market_long);
            });
        }

        function mainClickOnce() {
            $('#tab3').on('click', function (e) {
                $('#LOADING_Recent2_CRAN').show();
                $('#salesmapShow_CRAN').hide();
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
                updateSalesChart_CRAN(market, time, market_long);
            });
        }

        function mainClickOnceIB() {
            $('#tab4').on('click', function (e) {
                $('#LOADING_Recent2_IB').show();
                $('#salesmapShow_IB').hide();
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
                updateSalesChart_IB(market, time, market_long);
            });
        }

        function mainClickOnceCB() {
            $('#tab5').on('click', function (e) {
                $('#LOADING_Recent2_CB').show();
                $('#salesmapShow_CB').hide();
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
                updateSalesChart_CB(market, time, market_long);
            });
        }

        function getFilterCriteria() {
            $('#salesmapShow').hide();
            $('#salesmapShow_CRAN').hide();
            $('#Recent_Sales_Detail').hide();
            $('#Recent_Sales_Detail_CRAN').hide();
            $('#LOADING_Recent2').show();
            var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
            console.log(market_long);
            //document.getElementById('markettitle').innerHTML = market_long;
            var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(market);
            var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>            
            console.log(time);

            var tabpane1 = document.getElementById("m_tabs_1_1");
            tabpane1.classList.add("active");
            var tab1 = document.getElementById("tab1");
            tab1.classList.add("active");
            //var tabpane2 = document.getElementById("m_tabs_1_2");
            var tabpane3 = document.getElementById("m_tabs_1_3");
            var tabpane4 = document.getElementById("m_tabs_1_4");
            var tabpane5 = document.getElementById("m_tabs_1_5");
            //var tabpane6 = document.getElementById("m_tabs_1_6");
            //var tabpane7 = document.getElementById("m_tabs_1_7"); 
            //var tabpane8 = document.getElementById("m_tabs_1_8");
            //tabpane2.classList.remove("active");
            tabpane3.classList.remove("active");
            tabpane4.classList.remove("active");
            tabpane5.classList.remove("active");
            //tabpane6.classList.remove("active");
            //tabpane7.classList.remove("active"); 
            //tabpane8.classList.remove("active");
            //var tab2 = document.getElementById("tab2");
            var tab3 = document.getElementById("tab3");
            var tab4 = document.getElementById("tab4");
            var tab5 = document.getElementById("tab5");
            //var tab6 = document.getElementById("tab6");
            //var tab7 = document.getElementById("tab7");
            //var tab8 = document.getElementById("tab8");
            //tab2.classList.remove("active");
            tab3.classList.remove("active");
            tab4.classList.remove("active");
            tab5.classList.remove("active");
            //tab6.classList.remove("active");
            //tab7.classList.remove("active");
            //tab8.classList.remove("active");

            Getmarketdata(market, time, market_long);

        }

        function Getmarketdata(market, time, market_long) {
            //document.getElementById('markettitle').innerHTML = market_long;

            $.ajax({
                type: "POST",
                async: true,
                url: "Sales_Dashboard.aspx/GetDATADATE",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDATADATE(data);
                },
                error: function (data) {
                }
            });
            updateSalesChart(market, time, market_long);
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
            //var curyrx = document.querySelectorAll("#CUR_YRa");
            //var i;
            //for (i = 0; i < curyrx.length; i++) {
            //    curyrx[i].innerHTML = value_curyr;
            //}

            var value_curyr_plus1 = score[0]["CUR_YR_PLUS1"];

            var value_curyr_plus2 = score[0]["CUR_YR_PLUS2"];

            var value_curyr_plus3 = score[0]["CUR_YR_PLUS3"];

        }

        // ********** recents START **********
        /*
        //Recent Upcoming

            1) User selects from pulldown, triggers updateRecentChart()
            2) updateRecentChart runs Get_Recent_Program_Count AJAX, triggers loadRecentData
            3) loadRecentData parses JSON, creates Top Count data table, when user click on a row it triggers updateRecentDetail
            4) updateRecentDetail runs Get_Recent_Detail AJAX, triggers loadRecentDetail
            5) loadRecentDetail parses JSON, creates Bottom detail data table, triggers RecentMap
            6) Recent Map stores the values from the bottom detail table in an array, removes jobs with missing lat longs, assigns jobs to On Air or Upcoming, Creates the map            

        */

        var recent_lat_index = 0; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
        var recent_long_index = 1; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat

        function updateSalesChart(market, time, market_long) {
            console.log('updateSalesChart function start');
            var timeselection = "Last 90 days on air / +45 days forecasted";
            <%--var timeselection = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data1 = data.d;
                        //loadSalesData(data, market, time, market_long); //function in frontpage below, 
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail2",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
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
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail3",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data3 = data.d;
                    },
                    error: function (data) {
                    }
                })
            ).then(function () {
                dataConcat_3strings(Data1, Data2, Data3, market, time, market_long);
            });

        }

        function dataConcat_3strings(data1, data2, data3, market, time, market_long) {
            var dataConcat3;

            data1 = data1.substring(0, data1.length - 1);
            data2 = data2.substring(1, data2.length - 1);
            data3 = data3.substring(1, data3.length);
            dataConcat3 = data1 + ',' + data2 + ',' + data3;
            loadSalesData(dataConcat3, market, time, market_long);
        }

        function updateSalesChart_CRAN(market, time, market_long) {
            console.log('updateSalesChart function start cran');
            var timeselection = "Last 90 days on air / +45 days forecasted";
            <%--var timeselection = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CRAN",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data1 = data.d;
                        //loadSalesData_CRAN(data, market, time, market_long); //function in frontpage below, 
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CRAN2",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
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
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CRAN3",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data3 = data.d;
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CRAN4",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data4 = data.d;
                    },
                    error: function (data) {
                    }
                })
            ).then(function () {
                dataConcat_4strings(Data1, Data2, Data3, Data4, market, time, market_long);
            });


        }

        function updateSalesChart_IB(market, time, market_long) {
            console.log('updateSalesChart function start ib');
            var timeselection = "Last 90 days on air / +45 days forecasted";
            <%--var timeselection = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_IB",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data1 = data.d;
                        //loadSalesData_IB(data, market, time, market_long); //function in frontpage below, 
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_IB2",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
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
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_IB3",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data3 = data.d;
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_IB4",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data4 = data.d;
                    },
                    error: function (data) {
                    }
                })
            ).then(function () {
                dataConcat_IB(Data1, Data2, Data3, Data4, market, time, market_long);
            });


        }

        function updateSalesChart_CB(market, time, market_long) {
            console.log('updateSalesChart function start cb');
            var timeselection = "Last 90 days on air / +45 days forecasted";
            <%--var timeselection = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CB",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data1 = data.d;
                        //loadSalesData_IB(data, market, time, market_long); //function in frontpage below, 
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CB2",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
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
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CB3",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data3 = data.d;
                    },
                    error: function (data) {
                    }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Dashboard.aspx/Get_Recent_Sales_Detail_CB4",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'geoVariable': salesGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data4 = data.d;
                    },
                    error: function (data) {
                    }
                })
            ).then(function () {
                dataConcat_CB(Data1, Data2, Data3, Data4, market, time, market_long);
            });


        }


        function dataConcat_4strings(data1, data2, data3, data4, market, time, market_long) {
            var dataConcat4;
            data1 = data1.substring(0, data1.length - 1);
            data2 = data2.substring(1, data2.length - 1);
            data3 = data3.substring(1, data3.length - 1);
            data4 = data4.substring(1, data4.length);
            dataConcat4 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
            loadSalesData_CRAN(dataConcat4, market, time, market_long);
        }

        function dataConcat_IB(data1, data2, data3, data4, market, time, market_long) {
            var dataConcat4;
            data1 = data1.substring(0, data1.length - 1);
            data2 = data2.substring(1, data2.length - 1);
            data3 = data3.substring(1, data3.length - 1);
            data4 = data4.substring(1, data4.length);
            dataConcat4 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
            loadSalesData_IB(dataConcat4, market, time, market_long);
        }

        function dataConcat_CB(data1, data2, data3, data4, market, time, market_long) {
            var dataConcat4;
            data1 = data1.substring(0, data1.length - 1);
            data2 = data2.substring(1, data2.length - 1);
            data3 = data3.substring(1, data3.length - 1);
            data4 = data4.substring(1, data4.length);
            dataConcat4 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
            loadSalesData_CB(dataConcat4, market, time, market_long);
        }

        function loadSalesData(data, market, time, market_long) {
            
            console.log('loadSalesData function start')
            //$('#Sales_Detail').show();
            data = JSON.parse(data);
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];

            if (data.length <= 0) {
                return;
            }
            else {

                $('#Sales_Detail').dataTable().fnDestroy(); //destroy old table
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#Sales_Detail').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: false,
                    paging: false,
                    sort: true,
                    scrollY: 200,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[11, "asc"]],
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'Sales_Detail_Export' }, { extend: 'excelHtml5', title: 'Sales_Detail_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            salesMap(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
                        }
                    }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ON_AIR_DATE' }

                    ],


                    //Highlight rows that don't have lat longs in the detail table in Red
                    createdRow: function (row, data, index) {
                        if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                            $(row).addClass('highlightRed');
                        }
                    },

                    "fnDrawCallback": function () {
                        $('#Sales_Detail tr').find('td').each(function () {
                            $(this).on('mouseover', function () {
                                $(this).parent().css('background', 'silver');

                                this.style.cursor = 'pointer';
                            }).on('mouseout', function () {
                                $(this).parent().css('background', 'transparent');
                                this.style.cursor = 'default';
                            });

                        });
                    },

                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $('<select><option value=""></option></select>')
                                .appendTo($(column.footer()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );

                                    column
                                        .search(val ? '^' + val + '$' : '', true, false)
                                        .draw();
                                });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }
                });

            }

            $(window).resize();

            $.getJSON("VPGM_Markets_geojson_020121_FME.json", function (data) {
                VpgmData = data;
                prep(VpgmData);
            });

            function prep(VpgmData) {
                salesMap(market, time, market_long, DATE1, DATE2, DATE3, DATE4, VpgmData);
            };
        }

        function salesMap(market, time, market_long, DATE1, DATE2, DATE3, DATE4, VpgmData) {
            var recentSelectedCount = $("#Sales_Detail").get(0).lastChild.childElementCount;
            console.log('recentSelectedCount: ' + recentSelectedCount);
            var recentDetailColCount = $("#Sales_Detail").get(0).lastChild.childNodes[0].childElementCount;
            console.log('recentDetailColCount: ' + recentDetailColCount);            

            var j = 0;
            var i = 0;

            //console.log(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var minlat = parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
            var minlong = parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
                maxlat = 48;
                minlat = 25;
                maxlong = -66;
                minlong = -125;
            }

            var recentFilteredTable = [];
            var recentUpcomingTable = [];
            var recentOnAirTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                concatlatlong[i] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    //console.log($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    recentFilteredTable[i][j] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                //console.log(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));

                if (isNaN(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                //else if ($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                else if ($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'RECENTLY COMPLETED') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        //console.log('recentOnAirTable' + $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML)
                    }

                    onairindex++;
                }
                else {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }


            //console.log(recentUpcomingTable);
            //console.log(recentOnAirTable);

            //var latlongdistinctcount = {};
            //for (var i = 0; i < concatlatlong.length; i++) {
            //    latlongdistinctcount[concatlatlong[i]] = 1 + (latlongdistinctcount[concatlatlong[i]] || 0);
            //}

            latlongdistinctcount = new Set(concatlatlong).size;

            if (NaNcount == 0) {
                NaNcountMessage = '';
            }

            else if (NaNcount == 1) {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped'
            }

            else {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped'
            }

            document.getElementById('mapcounttitle').innerHTML = market_long + " - New Site Build";
            document.getElementById('mapcountsubtitle').innerHTML = 'Recently Completed Count: ' + recentOnAirTable.length + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upcoming Forecasted Count: " + recentUpcomingTable.length;
            document.getElementById('mapcountsubtitle2').innerHTML = 'Last 90 days on air / +45 days forecasted';
            document.getElementById('mapcountsubtitle3').innerHTML = 'Recently Completed (' + DATE1 + ' to ' + DATE2 + ') and Upcoming Forecasted (' + DATE3 + ' to ' + DATE4 + ')';
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;

            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                
    
                        */
                var popup = 
                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>State:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>County:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentOnAirTable[i][11],


                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#008000'
                    };

                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                OApoints.addLayer(marker);
            }

            for (i = 0; i < recentUpcomingTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + recentUpcomingTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentUpcomingTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentUpcomingTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>State:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>County:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentUpcomingTable[i][11],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],	//position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#002280'
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                Uppoints.addLayer(marker);
            }

            $('#LOADING_Recent2').hide();
            $('#salesmapShow').show();

            document.getElementById('salesmapdiv').innerHTML = "<div id='salesmapid' style='height: 650px;'></div>";

            //var map = L.map("mapid").fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);
            // ***********
            //var map = L.map("mapid", {
            //    attributionControl: false,
            //    center: [39.73, -104.99],
            //    zoom: 10,
            //    layers: [OApoints, Uppoints]
            //});
            // ***********

            // ***********
            //var defaultbase = L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            //    attribution: '&copy; <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
            //}).addTo(map);
            // ***********

            //$.getJSON("VPGM_markets_geojson.json", function (data) {

            //    //var myStyle = {
            //    //    //"color": "#ff7800",
            //    //    "weight": 3,
            //    //    "opacity": 0.5,
            //    //    "fill": false
            //    //};

            //    var datalayer2 = L.geoJson(data, {
            //        onEachFeature: function (feature, featureLayer) {
            //            featureLayer.bindPopup(feature.properties.VPGM_Markt);
            //        },
            //        //style: myStyle
            //    }).addTo(map);
            //});

            var grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                id: 'osm.grayscale',
                maxZoom: 18,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                })
                ;

            var baseLayers = {
                "Streets": streets,
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satellite": sat
                //"Topo": topo
            };

            var map = L.map("salesmapid", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets, OApoints, Uppoints]
            });

            //********** new section **********            

            function style(feature) {
                return {
                    //fillColor: "#FCB81E",
                    fillOpacity: 0.01,
                    //color: "#ff7800",
                    weight: 3,
                    opacity: 0.5,
                    //fill: false
                };
            }

            function onEachFeature(feature, featureLayer) {
                featureLayer.bindPopup(feature.properties.VPGM_Markt);
            }

            var VpgmLayer = L.geoJSON(VpgmData, {
                style: style,
                onEachFeature: onEachFeature 
            }).addTo(map);

            //********** new section end **********

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            var overlays = {
                "VPGM Market Borders": VpgmLayer,
                "Recently Completed": OApoints,
                "Upcoming Forecasted": Uppoints                
            };

            L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map);

            map.invalidateSize();
            map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return d === 'Recently Completed' ? "#008000" :
                    d === 'Upcoming Forecasted' ? "#002280" :
                        "#ff7f00";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map) {

                var div = L.DomUtil.create('div', 'info legend');
                categories = ['Recently Completed', 'Upcoming Forecasted'];

                for (var i = 0; i < categories.length; i++) {
                    div.innerHTML +=
                        '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                        (categories[i] ? categories[i] + '<br>' : '+');
                }

                return div;
            };

            legend.addTo(map);

            //console.log(recentFilteredTable);

            //console.log(recentOnAirTable[recentOnAirTable.length - 1]);
            //console.log(concatlatlong);


            //console.log($("#Sales_Detail").get(0).firstChild);
            //console.log($("#Sales_Detail").get(0).firstChild.innerHTML);
        }

        function loadSalesData_CRAN(data, market, time, market_long) {            

            console.log('loadSalesData_CRAN function start')

            data = JSON.parse(data);
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];

            if (data.length <= 0) {
                return;
            }
            else {

                $('#Sales_Detail_CRAN').dataTable().fnDestroy(); //destroy old table
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#Sales_Detail_CRAN').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: false,
                    paging: false,
                    sort: true,
                    scrollY: 200,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[11, "asc"]],
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'Sales_Detail_CRAN_Export' }, { extend: 'excelHtml5', title: 'Sales_Detail_CRAN_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            salesMap(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
                        }
                    }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ON_AIR_DATE' }

                    ],

                    //Highlight rows that don't have lat longs in the detail table in Red
                    createdRow: function (row, data, index) {
                        if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                            $(row).addClass('highlightRed');
                        }
                    },

                    "fnDrawCallback": function () {
                        $('#Sales_Detail_CRAN tr').find('td').each(function () {
                            $(this).on('mouseover', function () {
                                $(this).parent().css('background', 'silver');

                                this.style.cursor = 'pointer';
                            }).on('mouseout', function () {
                                $(this).parent().css('background', 'transparent');
                                this.style.cursor = 'default';
                            });

                        });
                    },

                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $('<select><option value=""></option></select>')
                                .appendTo($(column.footer()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );

                                    column
                                        .search(val ? '^' + val + '$' : '', true, false)
                                        .draw();
                                });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }
                });

                $(window).resize();

            }

            $(window).resize();

            $.getJSON("VPGM_Markets_geojson_020121_FME.json", function (data) {
                VpgmData = data;
                prep(VpgmData);
            });

            function prep(VpgmData) {
                salesMap_CRAN(market, time, market_long, DATE1, DATE2, DATE3, DATE4, VpgmData);
            };

            //salesMap_CRAN(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
        }

        function loadSalesData_IB(data, market, time, market_long) {            

            console.log('loadSalesData_IB function start')

            data = JSON.parse(data);
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];

            if (data.length <= 0) {
                return;
            }
            else {

                $('#Sales_Detail_IB').dataTable().fnDestroy(); //destroy old table
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#Sales_Detail_IB').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: false,
                    paging: false,
                    sort: true,
                    scrollY: 200,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[11, "asc"]],
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'Sales_Detail_IB_Export' }, { extend: 'excelHtml5', title: 'Sales_Detail_IB_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            salesMap(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
                        }
                    }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ON_AIR_DATE' }

                    ],

                    //Highlight rows that don't have lat longs in the detail table in Red
                    createdRow: function (row, data, index) {
                        if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                            $(row).addClass('highlightRed');
                        }
                    },

                    "fnDrawCallback": function () {
                        $('#Sales_Detail_IB tr').find('td').each(function () {
                            $(this).on('mouseover', function () {
                                $(this).parent().css('background', 'silver');

                                this.style.cursor = 'pointer';
                            }).on('mouseout', function () {
                                $(this).parent().css('background', 'transparent');
                                this.style.cursor = 'default';
                            });

                        });
                    },

                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $('<select><option value=""></option></select>')
                                .appendTo($(column.footer()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );

                                    column
                                        .search(val ? '^' + val + '$' : '', true, false)
                                        .draw();
                                });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }
                });

                $(window).resize();

            }

            $(window).resize();

            $.getJSON("VPGM_Markets_geojson_020121_FME.json", function (data) {
                VpgmData = data;
                prep(VpgmData);
            });

            function prep(VpgmData) {
                salesMap_IB(market, time, market_long, DATE1, DATE2, DATE3, DATE4, VpgmData);
            };

            //salesMap_IB(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
        }

        function loadSalesData_CB(data, market, time, market_long) {

            console.log('loadSalesData_CB function start')

            data = JSON.parse(data);
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];

            if (data.length <= 0) {
                return;
            }
            else {

                $('#Sales_Detail_CB').dataTable().fnDestroy(); //destroy old table
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#Sales_Detail_CB').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: false,
                    paging: false,
                    sort: true,
                    scrollY: 200,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[11, "asc"]],
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'Sales_Detail_CB_Export' }, { extend: 'excelHtml5', title: 'Sales_Detail_CB_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            salesMap(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
                        }
                    }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ON_AIR_DATE' }

                    ],

                    //Highlight rows that don't have lat longs in the detail table in Red
                    createdRow: function (row, data, index) {
                        if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                            $(row).addClass('highlightRed');
                        }
                    },

                    "fnDrawCallback": function () {
                        $('#Sales_Detail_CB tr').find('td').each(function () {
                            $(this).on('mouseover', function () {
                                $(this).parent().css('background', 'silver');

                                this.style.cursor = 'pointer';
                            }).on('mouseout', function () {
                                $(this).parent().css('background', 'transparent');
                                this.style.cursor = 'default';
                            });

                        });
                    },

                    initComplete: function () {
                        this.api().columns().every(function () {
                            var column = this;
                            var select = $('<select><option value=""></option></select>')
                                .appendTo($(column.footer()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex(
                                        $(this).val()
                                    );

                                    column
                                        .search(val ? '^' + val + '$' : '', true, false)
                                        .draw();
                                });

                            column.data().unique().sort().each(function (d, j) {
                                select.append('<option value="' + d + '">' + d + '</option>')
                            });
                        });
                    }
                });

                $(window).resize();

            }

            $(window).resize();

            $.getJSON("VPGM_Markets_geojson_020121_FME.json", function (data) {
                VpgmData = data;
                prep(VpgmData);
            });

            function prep(VpgmData) {
                salesMap_CB(market, time, market_long, DATE1, DATE2, DATE3, DATE4, VpgmData);
            };

            //salesMap_IB(market, time, market_long, DATE1, DATE2, DATE3, DATE4);
        }


        function salesMap_CRAN(market, time, market_long, DATE1, DATE2, DATE3, DATE4) {
            var recentSelectedCount = $("#Sales_Detail_CRAN").get(0).lastChild.childElementCount;
            var recentDetailColCount = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childElementCount;

            var j = 0;
            var i = 0;

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var minlat = parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
            var minlong = parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
                maxlat = 48;
                minlat = 25;
                maxlong = -66;
                minlong = -125;
            }

            var recentFilteredTable = [];
            var recentUpcomingTable = [];
            var recentOnAirTable = [];
            //var HistoricalOnAirTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            //var Historicalonairindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                //HistoricalOnAirTable[Historicalonairindex] = [];
                concatlatlong[i] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    recentFilteredTable[i][j] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                if (isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                //else if ($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'ON AIR') {

                //    for (k = 0; k < recentDetailColCount; k++) {
                //        HistoricalOnAirTable[Historicalonairindex][k] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                //    }

                //    Historicalonairindex++;
                //}
                else if ($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'RECENTLY COMPLETED') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                    }

                    onairindex++;
                }
                else {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }

            //if (HistoricalOnAirTable[HistoricalOnAirTable.length - 1].length == 0) {
            //    HistoricalOnAirTable.splice(-1, 1);
            //}

            latlongdistinctcount = new Set(concatlatlong).size;

            if (NaNcount == 0) {
                NaNcountMessage = '';
            }

            else if (NaNcount == 1) {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped'
            }

            else {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped'
            }

            document.getElementById('mapcounttitle_CRAN').innerHTML = market_long + " - CRAN Nodes";
            // add back into mapcountsubtitle_CRAN if needed again     'Previously Completed Count: ' + HistoricalOnAirTable.length + '&nbsp;&nbsp;&nbsp;
            document.getElementById('mapcountsubtitle_CRAN').innerHTML = 'Recently Completed Count: ' + recentOnAirTable.length + "&nbsp;&nbsp;&nbsp;Upcoming Forecasted Count: " + recentUpcomingTable.length;
            document.getElementById('mapcountsubtitle2_CRAN').innerHTML = 'Last 90 days on air / +45 days forecasted';
            // add back into mapcountsubtitle_CRAN if needed again      'Previously Completed (Before ' + DATE1 + ') and 
            document.getElementById('mapcountsubtitle3_CRAN').innerHTML = 'Recently Completed (' + DATE1 + ' to ' + DATE2 + ') and Upcoming Forecasted (' + DATE3 + ' to ' + DATE4 + ')';
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;

            //var HOApoints = new L.layerGroup();
            var OApoints2 = new L.layerGroup();
            var Uppoints2 = new L.layerGroup();
            //for (i in HistoricalOnAirTable) {

            //    var popup = '<b>On Air Category:</b> ' + HistoricalOnAirTable[i][0] +
            //        //'<br/><b>PACE Number:</b> ' + HistoricalOnAirTable[i][1] +
            //        //'<br/><b>PACE Name:</b> ' + HistoricalOnAirTable[i][2] +
            //        //'<br/><b>Subprogram:</b> ' + HistoricalOnAirTable[i][3] +
            //        '<br/><b>Sales Region:</b> ' + HistoricalOnAirTable[i][4] +
            //        '<br/><b>VPGM Market:</b> ' + HistoricalOnAirTable[i][5] +
            //        '<br/><b>State:</b> ' + HistoricalOnAirTable[i][6] +
            //        '<br/><b>County:</b> ' + HistoricalOnAirTable[i][7] +
            //        '<br/><b>CMA Name:</b> ' + HistoricalOnAirTable[i][8] +
            //        '<br/><b>City:</b> ' + HistoricalOnAirTable[i][9] +
            //        '<br/><b>Zip Code:</b> ' + HistoricalOnAirTable[i][10] +
            //        //'<br/><b>Latitude:</b> ' + HistoricalOnAirTable[i][recent_lat_index] +
            //        //'<br/><b>Longitude:</b> ' + HistoricalOnAirTable[i][recent_long_index] +
            //        '<br/><b>On Air Forecast:</b> ' + HistoricalOnAirTable[i][13] +
            //        '<br/><b>On Air Actual:</b> ' + HistoricalOnAirTable[i][14],

            //        loc = [parseFloat(HistoricalOnAirTable[i][recent_lat_index]), parseFloat(HistoricalOnAirTable[i][recent_long_index])],	//position found
            //        HistoricalOnAirTableoptions = {
            //            iconShape: 'doughnut',
            //            iconSize: [12, 12],
            //            borderWidth: 4,
            //            borderColor: '#000000'
            //        };

            //    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(HistoricalOnAirTableoptions) });
            //    marker.setOpacity(.6);
            //    marker.bindPopup(popup);
            //    HOApoints2.addLayer(marker);
            //}

            //for (i in recentOnAirTable) {
            for (i = 0; i < recentOnAirTable.length; i++) {            

                var popup =

                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>State:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>County:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentOnAirTable[i][11],


                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#008000'
                    };

                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                OApoints2.addLayer(marker);
            }

            for (i = 0; i < recentUpcomingTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + recentUpcomingTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentUpcomingTable[i][recent_long_index] +
                    '<b/>On Air Category:</b> ' + recentUpcomingTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>State:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>County:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentUpcomingTable[i][11],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],	//position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#002280'
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                Uppoints2.addLayer(marker);
            }

            $('#LOADING_Recent2_CRAN').hide();
            $('#salesmapShow_CRAN').show();

            document.getElementById('salesmapdiv_CRAN').innerHTML = "<div id='salesmapid_CRAN' style='height: 650px;'></div>";

            var
            //    grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
            //    id: 'osm.grayscale',
            //    maxZoom: 18,
            //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
            //    subdomains: ['a', 'b', 'c']
            //}),
            //    topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
            //        id: 'osm.topo',
            //        maxZoom: 17,
            //        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
            //        subdomains: ['a', 'b', 'c']
            //    }),
                sat2 = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 17,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets2 = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                })
                ;

            var baseLayers2 = {
                "Streets": streets2,
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satellite": sat2
                //"Topo": topo
            };

            var map2 = L.map("salesmapid_CRAN", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets2, OApoints2, Uppoints2] //add back in for past    HOApoints,
            });

            //********** new section **********            

            function style(feature) {
                return {
                    //fillColor: "#FCB81E",
                    fillOpacity: 0.01,
                    //color: "#ff7800",
                    weight: 3,
                    opacity: 0.5,
                    //fill: false
                };
            }

            function onEachFeature(feature, featureLayer) {
                featureLayer.bindPopup(feature.properties.VPGM_Markt);
            }

            var VpgmLayer = L.geoJSON(VpgmData, {
                style: style,
                onEachFeature: onEachFeature
            }).addTo(map2);

            //********** new section end **********

            var options2 = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control2 = L.control.zoomBox(options2);

            map2.addControl(control2);

            L.control.scale({ metric: false }).addTo(map2);

            var overlays2 = {
                "VPGM Market Borders": VpgmLayer,
                //"Previously Completed": HOApoints,
                "Recently Completed": OApoints2,
                "Upcoming Forecasted": Uppoints2
            };

            L.control.layers(baseLayers2, overlays2, { collapsed: false }).addTo(map2);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map2);

            map2.invalidateSize();
            map2.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return  d === 'Recently Completed' ? "#008000" :    //d === 'Previously Completed' ? "#000000" :
                        d === 'Upcoming Forecasted' ? "#002280" :
                            "#ff7f00";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map2) {

                var div = L.DomUtil.create('div', 'info legend_cran');
                categories = ['Recently Completed', 'Upcoming Forecasted']; // add back in      'Previously Completed', 

                for (var i = 0; i < categories.length; i++) {
                    div.innerHTML +=
                        '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                        (categories[i] ? categories[i] + '<br>' : '+');
                }

                return div;
            };

            legend.addTo(map2);
        }

        $('.nav-tabs li').click(function () {
            $(window).resize();
            $(window).resize();
        });

        function salesMap_IB(market, time, market_long, DATE1, DATE2, DATE3, DATE4) {
            var recentSelectedCount = $("#Sales_Detail_IB").get(0).lastChild.childElementCount;
            var recentDetailColCount = $("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childElementCount;

            var j = 0;
            var i = 0;

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var minlat = parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
            var minlong = parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
                maxlat = 48;
                minlat = 25;
                maxlong = -66;
                minlong = -125;
            }

            var recentFilteredTable = [];
            var recentUpcomingTable = [];
            var recentOnAirTable = [];
            //var HistoricalOnAirTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            //var Historicalonairindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                //HistoricalOnAirTable[Historicalonairindex] = [];
                concatlatlong[i] = $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    recentFilteredTable[i][j] = $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                if (isNaN(parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                //else if ($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'ON AIR') {

                //    for (k = 0; k < recentDetailColCount; k++) {
                //        HistoricalOnAirTable[Historicalonairindex][k] = $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                //    }

                //    Historicalonairindex++;
                //}
                else if ($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'RECENTLY COMPLETED') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                    }

                    onairindex++;
                }
                else {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }

            //if (HistoricalOnAirTable[HistoricalOnAirTable.length - 1].length == 0) {
            //    HistoricalOnAirTable.splice(-1, 1);
            //}

            latlongdistinctcount = new Set(concatlatlong).size;

            if (NaNcount == 0) {
                NaNcountMessage = '';
            }

            else if (NaNcount == 1) {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped'
            }

            else {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped'
            }

            document.getElementById('mapcounttitle_IB').innerHTML = market_long + " - In Building Jobs";
            // add back into mapcountsubtitle_IB if needed again     'Previously Completed Count: ' + HistoricalOnAirTable.length + '&nbsp;&nbsp;&nbsp;
            document.getElementById('mapcountsubtitle_IB').innerHTML = 'Recently Completed Count: ' + recentOnAirTable.length + "&nbsp;&nbsp;&nbsp;Upcoming Forecasted Count: " + recentUpcomingTable.length;
            document.getElementById('mapcountsubtitle2_IB').innerHTML = 'Last 90 days on air / +45 days forecasted';
            // add back into mapcountsubtitle_IB if needed again      'Previously Completed (Before ' + DATE1 + ') and 
            document.getElementById('mapcountsubtitle3_IB').innerHTML = 'Recently Completed (' + DATE1 + ' to ' + DATE2 + ') and Upcoming Forecasted (' + DATE3 + ' to ' + DATE4 + ')';
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;
            document.getElementById('mapcountfooter_IB').innerHTML = '**Note - In Building jobs displayed are jobs providing new coverage areas and include IB New Sites, IB Small Cells, IB DAS Modifications.';

            //var HOApoints = new L.layerGroup();
            var OApoints3 = new L.layerGroup();
            var Uppoints3 = new L.layerGroup();
            //for (i in HistoricalOnAirTable) {

            //    var popup = '<b>On Air Category:</b> ' + HistoricalOnAirTable[i][0] +
            //        //'<br/><b>PACE Number:</b> ' + HistoricalOnAirTable[i][1] +
            //        //'<br/><b>PACE Name:</b> ' + HistoricalOnAirTable[i][2] +
            //        //'<br/><b>Subprogram:</b> ' + HistoricalOnAirTable[i][3] +
            //        '<br/><b>Sales Region:</b> ' + HistoricalOnAirTable[i][4] +
            //        '<br/><b>VPGM Market:</b> ' + HistoricalOnAirTable[i][5] +
            //        '<br/><b>State:</b> ' + HistoricalOnAirTable[i][6] +
            //        '<br/><b>County:</b> ' + HistoricalOnAirTable[i][7] +
            //        '<br/><b>CMA Name:</b> ' + HistoricalOnAirTable[i][8] +
            //        '<br/><b>City:</b> ' + HistoricalOnAirTable[i][9] +
            //        '<br/><b>Zip Code:</b> ' + HistoricalOnAirTable[i][10] +
            //        //'<br/><b>Latitude:</b> ' + HistoricalOnAirTable[i][recent_lat_index] +
            //        //'<br/><b>Longitude:</b> ' + HistoricalOnAirTable[i][recent_long_index] +
            //        '<br/><b>On Air Forecast:</b> ' + HistoricalOnAirTable[i][13] +
            //        '<br/><b>On Air Actual:</b> ' + HistoricalOnAirTable[i][14],

            //        loc = [parseFloat(HistoricalOnAirTable[i][recent_lat_index]), parseFloat(HistoricalOnAirTable[i][recent_long_index])],	//position found
            //        HistoricalOnAirTableoptions = {
            //            iconShape: 'doughnut',
            //            iconSize: [12, 12],
            //            borderWidth: 4,
            //            borderColor: '#000000'
            //        };

            //    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(HistoricalOnAirTableoptions) });
            //    marker.setOpacity(.6);
            //    marker.bindPopup(popup);
            //    HOApoints.addLayer(marker);
            //}

            for (i = 0; i < recentOnAirTable.length; i++) {

                var popup =

                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>State:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>County:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentOnAirTable[i][11],


                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#008000'
                    };

                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                OApoints3.addLayer(marker);
            }

            for (i = 0; i < recentUpcomingTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + recentUpcomingTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentUpcomingTable[i][recent_long_index] +
                    '<b/>On Air Category:</b> ' + recentUpcomingTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>State:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>County:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentUpcomingTable[i][11],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],	//position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#002280'
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                Uppoints3.addLayer(marker);
            }

            $('#LOADING_Recent2_IB').hide();
            $('#salesmapShow_IB').show();

            document.getElementById('salesmapdiv_IB').innerHTML = "<div id='salesmapid_IB' style='height: 650px;'></div>";

            var
                //    grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                //    topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                //        id: 'osm.topo',
                //        maxZoom: 17,
                //        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //        subdomains: ['a', 'b', 'c']
                //    }),
                sat3 = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 17,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets3 = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                })
                ;

            var baseLayers3 = {
                "Streets": streets3,
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satellite": sat3
                //"Topo": topo
            };

            var map3 = L.map("salesmapid_IB", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets3, OApoints3, Uppoints3] //add back in for past    HOApoints,
            });

            //********** new section **********            

            function style(feature) {
                return {
                    //fillColor: "#FCB81E",
                    fillOpacity: 0.01,
                    //color: "#ff7800",
                    weight: 3,
                    opacity: 0.5,
                    //fill: false
                };
            }

            function onEachFeature(feature, featureLayer) {
                featureLayer.bindPopup(feature.properties.VPGM_Markt);
            }

            var VpgmLayer = L.geoJSON(VpgmData, {
                style: style,
                onEachFeature: onEachFeature
            }).addTo(map3);

            //********** new section end **********

            var options3 = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control3 = L.control.zoomBox(options3);

            map3.addControl(control3);

            L.control.scale({ metric: false }).addTo(map3);

            var overlays3 = {
                "VPGM Market Borders": VpgmLayer,
                //"Previously Completed": HOApoints,
                "Recently Completed": OApoints3,
                "Upcoming Forecasted": Uppoints3
            };

            L.control.layers(baseLayers3, overlays3, { collapsed: false }).addTo(map3);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map3);

            map3.invalidateSize();
            map3.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return d === 'Recently Completed' ? "#008000" :    //d === 'Previously Completed' ? "#000000" :
                    d === 'Upcoming Forecasted' ? "#002280" :
                        "#ff7f00";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map3) {

                var div = L.DomUtil.create('div', 'info legend_ib');
                categories = ['Recently Completed', 'Upcoming Forecasted']; // add back in      'Previously Completed', 

                for (var i = 0; i < categories.length; i++) {
                    div.innerHTML +=
                        '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                        (categories[i] ? categories[i] + '<br>' : '+');
                }

                return div;
            };

            legend.addTo(map3);
        }

        function salesMap_CB(market, time, market_long, DATE1, DATE2, DATE3, DATE4) {
            console.log('salesMap_CB function start')
            var recentSelectedCount = $("#Sales_Detail_CB").get(0).lastChild.childElementCount;
            var recentDetailColCount = $("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childElementCount;

            var j = 0;
            var i = 0;

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var minlat = parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
            var minlong = parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
                maxlat = 48;
                minlat = 25;
                maxlong = -66;
                minlong = -125;
            }

            var recentFilteredTable = [];
            var recentUpcomingTable = [];
            var recentOnAirTable = [];
            //var HistoricalOnAirTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            //var Historicalonairindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                //HistoricalOnAirTable[Historicalonairindex] = [];
                concatlatlong[i] = $("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    recentFilteredTable[i][j] = $("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                if (isNaN(parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                //else if ($("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'ON AIR') {

                //    for (k = 0; k < recentDetailColCount; k++) {
                //        HistoricalOnAirTable[Historicalonairindex][k] = $("#Sales_Detail_IB").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                //    }

                //    Historicalonairindex++;
                //}
                else if ($("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'RECENTLY COMPLETED') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                    }

                    onairindex++;
                }
                else {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail_CB").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }

            //if (HistoricalOnAirTable[HistoricalOnAirTable.length - 1].length == 0) {
            //    HistoricalOnAirTable.splice(-1, 1);
            //}

            latlongdistinctcount = new Set(concatlatlong).size;

            if (NaNcount == 0) {
                NaNcountMessage = '';
            }

            else if (NaNcount == 1) {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped'
            }

            else {
                NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped'
            }

            document.getElementById('mapcounttitle_CB').innerHTML = market_long + " - C-Band Jobs";
            // add back into mapcountsubtitle_IB if needed again     'Previously Completed Count: ' + HistoricalOnAirTable.length + '&nbsp;&nbsp;&nbsp;
            document.getElementById('mapcountsubtitle_CB').innerHTML = 'Recently Completed Count: ' + recentOnAirTable.length + "&nbsp;&nbsp;&nbsp;Upcoming Forecasted Count: " + recentUpcomingTable.length;
            document.getElementById('mapcountsubtitle2_CB').innerHTML = 'Last 90 days on air / +45 days forecasted';
            // add back into mapcountsubtitle_IB if needed again      'Previously Completed (Before ' + DATE1 + ') and 
            document.getElementById('mapcountsubtitle3_CB').innerHTML = 'Recently Completed (' + DATE1 + ' to ' + DATE2 + ') and Upcoming Forecasted (' + DATE3 + ' to ' + DATE4 + ')';
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;
            // document.getElementById('mapcountfooter_IB').innerHTML = '**Note - In Building jobs displayed are jobs providing new coverage areas and include IB New Sites, IB Small Cells, IB DAS Modifications.';

            //var HOApoints = new L.layerGroup();
            var OApoints3 = new L.layerGroup();
            var Uppoints3 = new L.layerGroup();
            //for (i in HistoricalOnAirTable) {

            //    var popup = '<b>On Air Category:</b> ' + HistoricalOnAirTable[i][0] +
            //        //'<br/><b>PACE Number:</b> ' + HistoricalOnAirTable[i][1] +
            //        //'<br/><b>PACE Name:</b> ' + HistoricalOnAirTable[i][2] +
            //        //'<br/><b>Subprogram:</b> ' + HistoricalOnAirTable[i][3] +
            //        '<br/><b>Sales Region:</b> ' + HistoricalOnAirTable[i][4] +
            //        '<br/><b>VPGM Market:</b> ' + HistoricalOnAirTable[i][5] +
            //        '<br/><b>State:</b> ' + HistoricalOnAirTable[i][6] +
            //        '<br/><b>County:</b> ' + HistoricalOnAirTable[i][7] +
            //        '<br/><b>CMA Name:</b> ' + HistoricalOnAirTable[i][8] +
            //        '<br/><b>City:</b> ' + HistoricalOnAirTable[i][9] +
            //        '<br/><b>Zip Code:</b> ' + HistoricalOnAirTable[i][10] +
            //        //'<br/><b>Latitude:</b> ' + HistoricalOnAirTable[i][recent_lat_index] +
            //        //'<br/><b>Longitude:</b> ' + HistoricalOnAirTable[i][recent_long_index] +
            //        '<br/><b>On Air Forecast:</b> ' + HistoricalOnAirTable[i][13] +
            //        '<br/><b>On Air Actual:</b> ' + HistoricalOnAirTable[i][14],

            //        loc = [parseFloat(HistoricalOnAirTable[i][recent_lat_index]), parseFloat(HistoricalOnAirTable[i][recent_long_index])],	//position found
            //        HistoricalOnAirTableoptions = {
            //            iconShape: 'doughnut',
            //            iconSize: [12, 12],
            //            borderWidth: 4,
            //            borderColor: '#000000'
            //        };

            //    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(HistoricalOnAirTableoptions) });
            //    marker.setOpacity(.6);
            //    marker.bindPopup(popup);
            //    HOApoints.addLayer(marker);
            //}

            for (i = 0; i < recentOnAirTable.length; i++) {

                var popup =

                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>State:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>County:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentOnAirTable[i][11],


                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#008000'
                    };

                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                OApoints3.addLayer(marker);
            }

            for (i = 0; i < recentUpcomingTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + recentUpcomingTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentUpcomingTable[i][recent_long_index] +
                    '<b/>On Air Category:</b> ' + recentUpcomingTable[i][2] +
                    //'<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>State:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>County:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][10] +
                    '<br/><b>On Air Date:</b> ' + recentUpcomingTable[i][11],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],	//position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#002280'
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                Uppoints3.addLayer(marker);
            }

            $('#LOADING_Recent2_CB').hide();
            $('#salesmapShow_CB').show();

            document.getElementById('salesmapdiv_CB').innerHTML = "<div id='salesmapid_CB' style='height: 650px;'></div>";

            var
                //    grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                //    topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                //        id: 'osm.topo',
                //        maxZoom: 17,
                //        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //        subdomains: ['a', 'b', 'c']
                //    }),
                sat3 = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 17,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets3 = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                })
                ;

            var baseLayers3 = {
                "Streets": streets3,
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satellite": sat3
                //"Topo": topo
            };

            var map3 = L.map("salesmapid_CB", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets3, OApoints3, Uppoints3] //add back in for past    HOApoints,
            });

            //********** new section **********            

            function style(feature) {
                return {
                    //fillColor: "#FCB81E",
                    fillOpacity: 0.01,
                    //color: "#ff7800",
                    weight: 3,
                    opacity: 0.5,
                    //fill: false
                };
            }

            function onEachFeature(feature, featureLayer) {
                featureLayer.bindPopup(feature.properties.VPGM_Markt);
            }

            var VpgmLayer = L.geoJSON(VpgmData, {
                style: style,
                onEachFeature: onEachFeature
            }).addTo(map3);

            //********** new section end **********

            var options3 = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control3 = L.control.zoomBox(options3);

            map3.addControl(control3);

            L.control.scale({ metric: false }).addTo(map3);

            var overlays3 = {
                "VPGM Market Borders": VpgmLayer,
                //"Previously Completed": HOApoints,
                "Recently Completed": OApoints3,
                "Upcoming Forecasted": Uppoints3
            };

            L.control.layers(baseLayers3, overlays3, { collapsed: false }).addTo(map3);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map3);

            map3.invalidateSize();
            map3.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return d === 'Recently Completed' ? "#008000" :    //d === 'Previously Completed' ? "#000000" :
                    d === 'Upcoming Forecasted' ? "#002280" :
                        "#ff7f00";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map3) {

                var div = L.DomUtil.create('div', 'info legend_ib');
                categories = ['Recently Completed', 'Upcoming Forecasted']; // add back in      'Previously Completed', 

                for (var i = 0; i < categories.length; i++) {
                    div.innerHTML +=
                        '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                        (categories[i] ? categories[i] + '<br>' : '+');
                }

                return div;
            };

            legend.addTo(map3);
        }

        $('.nav-tabs li').click(function () {
            $(window).resize();
            $(window).resize();
        });

    </script>


</asp:Content>


