<%@ Page Title="Production Insights 2020" Language="C#" MasterPageFile="~/MasterPageProduction.master" AutoEventWireup="true" CodeFile="Production_Insights_2020.aspx.cs" Inherits="Production_Production_Insights_2020" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <%--<link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />--%>

    <script src="https://code.highcharts.com/stock/highstock.js"></script>
    <script src="https://code.highcharts.com/modules/bullet.js"></script>
    <%--<script src="https://code.highcharts.com/highcharts.js"></script>--%>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>

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

    <link href="fullscreen/Control.FullScreen.css" rel="stylesheet" />
    <script src="fullscreen/Control.FullScreen.js"></script>

    
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
                opacity: 0.7;
            }

        .info.legend {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 45px;
            width: 160px;
        }

        .legend .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }        

        .legend_PC {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend_PC i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.7;
            }

        .info.legend_PC {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 150px;
        }

        .legend_PC .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_RYG {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend_RYG i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.7;
            }

        .info.legend_RYG {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 150px;
        }

        .legend_RYG .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_RYG_PushPull {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend_RYG_PushPull i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.7;
            }

        .info.legend_RYG_PushPull {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 120px;
        }

        .legend_RYG_PushPull .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .DT_pointer {
            cursor: pointer;
        }

        .DT_highlight {
            background-color: #87CEFA !important;
        }

        .bold_Table {
            font-weight: bold;
        }

        .legend_RYG_PLAN {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG_PLAN i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.7;
        }

        .info.legend_RYG_PLAN {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 124px;
            width: 185px;
        }

        .legend_RYG_PLAN .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_RYG_FCST .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .info.legend_RYG_FCST {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 135px;
        }

        .legend_RYG_FCST {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG_FCST i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.7;
        }

        .info.legend_RYG_ACT {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 24px;
            width: 130px;
        }

        .legend_RYG_ACT {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG_ACT i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.7;
        }

        .legend_RYG_ACT .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_RYG2_PLAN {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG2_PLAN i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.7;
        }

        .info.legend_RYG2_PLAN {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 190px;
            width: 180px;
        }

        .legend_RYG2_PLAN .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_RYG2_FCST .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .info.legend_RYG2_FCST {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 144px;
            width: 180px;
        }

        .legend_RYG2_FCST {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG2_FCST i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.7;
        }

        .info.legend_RYG2_ACT {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 180px;
        }

        .legend_RYG2_ACT {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG2_ACT i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.7;
        }

        .legend_RYG2_ACT .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legend_RYG_PushPull {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legend_RYG_PushPull i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.7;
        }

        .info.legend_RYG_PushPull {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 65px;
            width: 200px;
        }

        .legend_RYG_PushPull .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .highlightRed {
            background-color: #FF3333 !important;
        }

        .bold_Table {
            font-weight: bold;
        }

    </style>

    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />

    <%--<div class="d-flex align-items-center">
        <div class="mr-auto">--%>
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Production Insights
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item">
                    <%--<a href="/Production/Production.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>--%>
                    <a href="/Production/Production.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Production Home
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">
                </li>
                <li class="m-nav__item">
                    <a href="/Production/Production_Overview.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Production Overview
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">
                </li>
                <li class="m-nav__item">
                    <a href="/Production/Production_Insights_2020.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Production Insights
                        </span>
                    </a>
                </li>
            </ul>

            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline" style="float:right;">
                <li class="m-nav__item m-nav__link-text">   
                    <%--color: #6f727d;
                    font-weight: 400;--%>
                    <span style="color: #6f727d; font-weight: 400; font-size:20px;" id="DATADATE"></span>               
                </li>
            </ul>
        <%--</div>
    </div>--%>

    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">
            
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <%--<h5 class="left">Data Data: &nbsp; </h5>
                    <h5 class="left" id="DATADATE"></h5>--%>

                    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>

                            <asp:Label ID="labelGeo" runat="server" Text="Org: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlGeo" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlGeo_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:Label ID="labelMarket" runat="server" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                            </asp:DropDownList>

                            <asp:Label ID="labelMonth" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Month: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlMonth" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                            </asp:DropDownList>

                            <asp:HiddenField ID="hf_FCCategory" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_TPMilestone" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_TPSeries" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_TPProgram" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_pptpCustomOne" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_pptpCustomTwo" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_pptpCustomThree" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_pptpCustomFour" runat="server" ClientIDMode="Static" />
                            <asp:HiddenField ID="hf_pptpCustomFive" runat="server" ClientIDMode="Static" />
                            

                            <div style="display: none;">
                                <asp:Button runat="server" ID="ButtonFC" OnClick="GetddlMonth" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal" data-toggle="modal" data-target="#m_modal_general" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal_HistDetail" data-toggle="modal" data-target="#m_modal_HistDetail" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal_HistAllMarkets" data-toggle="modal" data-target="#m_modal_HistAllMarkets" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal_RYG" data-toggle="modal" data-target="#m_modal_RYG" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal2_RYG" data-toggle="modal" data-target="#m_modal2_RYG" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal3_RYG" data-toggle="modal" data-target="#m_modal3_RYG" />
                            </div>

                            <%--<asp:Button ID="Button1" Style="margin: 5px;" runat="server" Text="Submit" OnClientClick="SubmitButtonClick();" />--%>

                        </ContentTemplate>
                        
                    </asp:UpdatePanel>

                    <div style="display: none;">
                        <asp:Button runat="server" ID="ButtonTP" OnClick="ExportToExcel_TP2" />
                    </div>   

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
                                            <i class="flaticon-map"></i><span class="m--visible-desktop-inline-block">5G mmWave Nodes</span>
                                        </a>
                                    </li>
                                    <%--<li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#m_tabs_1_5" id="tab5">
                                        <i class="flaticon-calendar-3"></i><span class="m--visible-desktop-inline-block">Placeholder 5</span>
                                    </a>
                                    </li>--%>                          
                                    <%--<li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_6" id="tab6">
                                            <i class="flaticon-share"></i><span class="m--visible-desktop-inline-block">Placeholder 6</span>
                                        </a>
                                    </li>--%>
                                    <%--<li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_7" id="tab7">
                                            <i class="flaticon-graph"></i><span class="m--visible-desktop-inline-block">Placeholder 7</span>
                                        </a>
                                    </li>--%>                                
                                    <%--<li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_8" id="tab8">
                                            <i class="flaticon-more-v4"></i><span class="m--visible-desktop-inline-block">Placeholder 8</span>
                                        </a>
                                    </li>--%>                       
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">

                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv_tab1">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv2_tab1">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                            <div id="LOADING_Quad1_tab1" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad1_tab1" class="m-section__content" style="height: 200px; width: 100%;">

                                                                <br />

                                                                <div class="row">
                                                                    <div class="col-lg-6" id="ActVsPlanSection_tab1" style="text-align: center;">
                                                                        <h3><span id="ACTvsPLAN_tab1"></span>&nbsp;<span id="AheadBehind_tab1"></span></h3>
                                                                        <div style="text-align: center; color: black">
                                                                            <h5><span id="ACT_tab1"></span> Actual / <span id="YTDPLAN_tab1"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab1"></span>%)</h5>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6" id="ActVsPlanSection2_tab1" style="text-align: center;">
                                                                        <div id="ForecastBar_tab1" style="visibility: visible; height: 90px"></div>
                                                                    </div>
                                                                </div>

                                                                <br />

                                                                <table id="PlanFcstActTable_tab1" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA" title=""></th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs with On Air Actual date in Current Month">Actual</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Actual / NSB POE">Actual % of POE</th>
                                                                        </tr>
                                                                    </thead>

                                                                </table>                                                                

                                                                <br />

                                                                <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                    <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab1" onclick="ShowPushPullMap_tab1()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab1"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab1"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab1"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab1"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                                    <%--<button type="button" class="btn btn-outline-brand btn-pill" id="Pulls_btn_tab1" onclick="ShowPushPullMap_tab1()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull In Details (<span id="btn_CY_PULL_tab1"></span> jobs,&nbsp;<span id="btn_CY_PULL_perc_POE_tab1"></span>% of POE) and <br /><span class="current_year"></span> Push Out Details (<span id="btn_CY_PUSH_tab1"></span> jobs,&nbsp;<span id="btn_CY_PUSH_perc_POE_tab1"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i></button>&nbsp;--%>
                                                                </div>

                                                                <br />                                                                
                                                                <br />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv3_tab1">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv4_tab1">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                            <div id="LOADING_Quad2_tab1" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad2_tab1">
                                                                <div id="PRODUCTION_CHART_tab1" style="visibility: visible;"></div>

                                                                <div id="ProductionChartTable_tab1" style="overflow-x:auto;">
                                                                    <table id="PRODUCTION_CHART_TABLE_tab1" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                        <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA"></th>
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

                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>

                                                                <button type="button" class="btn btn-primary" id="HidePCTableButton_tab1" onclick="HidePC_Table_tab1()">Hide Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab1" onclick="ShowPC_Table_tab1()">Show Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab1" onclick="ShowPC_Map_tab1()">Show Map of All</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv5_tab1">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv6_tab1">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                            <div id="LOADING_Quad3_tab1" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="NoData_tab1">
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <h5>No data for Mapping</h5>
                                                                <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                            </div>
                                                            <div id="Quad3_tab1">                                                            
                                                                                                                                
                                                                <h6 id="mapcountsubtitle_tab1"></h6>
                                                                <div id="salesmapdiv_tab1" style="height: 350px; text-align: left;"></div>
                                                                <br />
                                                                <div id="Recent_Sales_Detail_tab1" class="m-section__content" style="height: 100%; width: 100%">
                                                                    <table id="Sales_Detail_tab1" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                        <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                    </table>
                                                                </div>

                                                                <%--<button type="button" class="btn btn-primary" id="HideMapTableButton_tab1" onclick="HideMap_Table_tab1()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab1" onclick="ShowMap_Table_tab1()">Show Job Details</button>--%>

                                                            </div>

                                                        </div>                                                        
                                                    </div>                                                   
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv7_tab1">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv8_tab1">

                                                        <div id="buttonrowcenterTP_tab1" style="visibility: visible;">
                                                            <div style="text-align: center; color: #343a40">
                                                                <h5>NSB - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                                <div id="LOADING_Quad4_tab1" style='display: none'>
                                                                    <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                                </div>
                                                                <div id="Quad4_tab1">
                                                                    <div id="TaskProductionChart1_tab1" style="visibility: visible;"></div>
                                                                    
                                                                    <div id="TaskProductionChart2_tab1" style="visibility: visible;"></div>
                                                                    <%--<button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab1" onclick="HideTP_Chart2_tab1()">Hide Status of Not Completed MS Chart</button>
                                                                    <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab1" onclick="ShowTP_Chart2_tab1()">Show Status of Not Completed MS Chart</button>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                   <%-- <div class="tab-pane" id="m_tabs_1_2" role="tabpanel">
                                        
                                    <div class="m-portlet__head-caption">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv_tab2">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv2_tab2">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>MCA - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                        <div id="LOADING_Quad1_tab2" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad1_tab2" class="m-section__content" style="height: 200px; width: 100%;">
                                                            <br />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-lg-6" id="ActVsPlanSection_tab2" style="text-align: center;">
                                                                    <h3><span id="ACTvsPLAN_tab2"></span>&nbsp;<span id="AheadBehind_tab2"></span></h3>
                                                                    <div style="text-align: center; color: black">
                                                                        <h5><span id="ACT_tab2"></span> Actual / <span id="YTDPLAN_tab2"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab2"></span>%)</h5>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" id="ActVsPlanSection2_tab2" style="text-align: center;">
                                                                    <div id="ForecastBar_tab2" style="visibility: visible; height: 90px"></div>
                                                                </div>
                                                            </div>

                                                            <br />                                                            

                                                            <table id="PlanFcstActTable_tab2" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA" title=""></th>
                                                                        <th bgcolor="#87CEFA" title="MCA Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                        <th bgcolor="#87CEFA" title="MCA Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                        <th bgcolor="#87CEFA" title="MCA Jobs with On Air Actual date in Current Month">Actual</th>
                                                                        <th bgcolor="#87CEFA" title="MCA Actual / NSB POE">Actual % of POE</th>
                                                                    </tr>
                                                                </thead>

                                                            </table>                                                                

                                                            <br />

                                                            <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab2" onclick="ShowPushPullMap_tab2()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab2"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab2"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab2"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab2"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                            </div>

                                                            <br />                                                                
                                                            <br />
                                                                
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv3_tab2">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv4_tab2">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>MCA - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                        <div id="LOADING_Quad2_tab2" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad2_tab2">
                                                            <div id="PRODUCTION_CHART_tab2" style="visibility: visible;"></div>

                                                            <div id="ProductionChartTable_tab2" style="overflow-x:auto;">
                                                                <table id="PRODUCTION_CHART_TABLE_tab2" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA"></th>
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

                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>

                                                            <button type="button" class="btn btn-primary" id="HidePCTableButton_tab2" onclick="HidePC_Table_tab2()">Hide Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab2" onclick="ShowPC_Table_tab2()">Show Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab2" onclick="ShowPC_Map_tab2()">Show Map of All</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> 
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv5_tab2">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv6_tab2">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>MCA - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                        <div id="LOADING_Quad3_tab2" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="NoData_tab2">
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <h5>No data for Mapping</h5>
                                                            <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                        </div>
                                                        <div id="Quad3_tab2">                                                           
                                                                                                                                
                                                            <h6 id="mapcountsubtitle_tab2"></h6>
                                                            <div id="salesmapdiv_tab2" style="height: 350px; text-align: left;"></div>
                                                            <br />
                                                            <div id="Recent_Sales_Detail_tab2" class="m-section__content" style="height: 100%; width: 100%">
                                                                <table id="Sales_Detail_tab2" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                </table>
                                                            </div>

                                                                <button type="button" class="btn btn-primary" id="HideMapTableButton_tab2" onclick="HideMap_Table_tab2()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab2" onclick="ShowMap_Table_tab2()">Show Job Details</button>

                                                        </div>

                                                    </div>                                                        
                                                </div>                                                   
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv7_tab2">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv8_tab2">

                                                    <div id="buttonrowcenterTP_tab2" style="visibility: visible;">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>MCA - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                            <div id="LOADING_Quad4_tab2" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad4_tab2">
                                                                <div id="TaskProductionChart1_tab2" style="visibility: visible;"></div>
                                                                    
                                                                <div id="TaskProductionChart2_tab2" style="visibility: visible;"></div>
                                                                <button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab2" onclick="HideTP_Chart2_tab2()">Hide Status of Not Completed MS Chart</button>
                                                                <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab2" onclick="ShowTP_Chart2_tab2()">Show Status of Not Completed MS Chart</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>--%>

                                    <div class="tab-pane" id="m_tabs_1_3" role="tabpanel">

                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv_tab3">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv2_tab3">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>CRAN - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                            <div id="LOADING_Quad1_tab3" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad1_tab3" class="m-section__content" style="height: 200px; width: 100%;">
                                                                <br />
                                                                <br />
                                                                <div class="row">
                                                                    <div class="col-lg-6" id="ActVsPlanSection_tab3" style="text-align: center;">
                                                                        <h3><span id="ACTvsPLAN_tab3"></span>&nbsp;<span id="AheadBehind_tab3"></span></h3>
                                                                        <div style="text-align: center; color: black">
                                                                            <h5><span id="ACT_tab3"></span> Actual / <span id="YTDPLAN_tab3"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab3"></span>%)</h5>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6" id="ActVsPlanSection2_tab3" style="text-align: center;">
                                                                        <div id="ForecastBar_tab3" style="visibility: visible; height: 90px"></div>
                                                                    </div>
                                                                </div>

                                                                <br />

                                                                <table id="PlanFcstActTable_tab3" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA" title=""></th>
                                                                            <th bgcolor="#87CEFA" title="CRAN Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                            <th bgcolor="#87CEFA" title="CRAN Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                            <th bgcolor="#87CEFA" title="CRAN Jobs with On Air Actual date in Current Month">Actual</th>
                                                                            <th bgcolor="#87CEFA" title="CRAN Actual / NSB POE">Actual % of POE</th>
                                                                        </tr>
                                                                    </thead>

                                                                </table>                                                                

                                                                <br />

                                                                <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                    <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab3" onclick="ShowPushPullMap_tab3()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab3"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab3"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab3"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab3"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                                </div>

                                                                <br />                                                                
                                                                <br />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv3_tab3">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv4_tab3">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>CRAN - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                            <div id="LOADING_Quad2_tab3" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad2_tab3">
                                                                <div id="PRODUCTION_CHART_tab3" style="visibility: visible;"></div>

                                                                <div id="ProductionChartTable_tab3" style="overflow-x:auto;">
                                                                    <table id="PRODUCTION_CHART_TABLE_tab3" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                        <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA"></th>
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

                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>

                                                                <button type="button" class="btn btn-primary" id="HidePCTableButton_tab3" onclick="HidePC_Table_tab3()">Hide Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab3" onclick="ShowPC_Table_tab3()">Show Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab3" onclick="ShowPC_Map_tab3()">Show Map of All</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div> 
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv5_tab3">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv6_tab3">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>CRAN - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                            <div id="LOADING_Quad3_tab3" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="NoData_tab3">
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <h5>No data for Mapping</h5>
                                                                <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                            </div>
                                                            <div id="Quad3_tab3">                                                            
                                                                                                                                
                                                                <h6 id="mapcountsubtitle_tab3"></h6>
                                                                <div id="salesmapdiv_tab3" style="height: 350px; text-align: left;"></div>
                                                                <br />
                                                                <div id="Recent_Sales_Detail_tab3" class="m-section__content" style="height: 100%; width: 100%">
                                                                    <table id="Sales_Detail_tab3" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                        <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                    </table>
                                                                </div>

                                                                <%--<button type="button" class="btn btn-primary" id="HideMapTableButton_tab3" onclick="HideMap_Table_tab3()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab3" onclick="ShowMap_Table_tab3()">Show Job Details</button>--%>

                                                            </div>

                                                        </div>                                                        
                                                    </div>                                                   
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv7_tab3">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv8_tab3">

                                                        <div id="buttonrowcenterTP_tab3" style="visibility: visible;">
                                                            <div style="text-align: center; color: #343a40">
                                                                <h5>CRAN - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                                <div id="LOADING_Quad4_tab3" style='display: none'>
                                                                    <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                                </div>
                                                                <div id="Quad4_tab3">
                                                                    <div id="TaskProductionChart1_tab3" style="visibility: visible;"></div>
                                                                    
                                                                    <div id="TaskProductionChart2_tab3" style="visibility: visible;"></div>
                                                                    <%--<button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab3" onclick="HideTP_Chart2_tab3()">Hide Status of Not Completed MS Chart</button>
                                                                    <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab3" onclick="ShowTP_Chart2_tab3()">Show Status of Not Completed MS Chart</button>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
                                        
                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv_tab4">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv2_tab4">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                            <div id="LOADING_Quad1_tab4" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad1_tab4" class="m-section__content" style="height: 200px; width: 100%;">
                                                                <br />
                                                                <br />
                                                                <div class="row">
                                                                    <div class="col-lg-6" id="ActVsPlanSection_tab4" style="text-align: center;">
                                                                        <h3><span id="ACTvsPLAN_tab4"></span>&nbsp;<span id="AheadBehind_tab4"></span></h3>
                                                                        <div style="text-align: center; color: black">
                                                                            <h5><span id="ACT_tab4"></span> Actual / <span id="YTDPLAN_tab4"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab4"></span>%)</h5>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6" id="ActVsPlanSection2_tab4" style="text-align: center;">
                                                                        <div id="ForecastBar_tab4" style="visibility: visible; height: 90px"></div>
                                                                    </div>
                                                                </div>

                                                                <br />

                                                                <table id="PlanFcstActTable_tab4" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA" title=""></th>
                                                                            <th bgcolor="#87CEFA" title="5GmmWave Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                            <th bgcolor="#87CEFA" title="5GmmWave Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                            <th bgcolor="#87CEFA" title="5GmmWave Jobs with On Air Actual date in Current Month">Actual</th>
                                                                            <th bgcolor="#87CEFA" title="5GmmWave Actual / NSB POE">Actual % of POE</th>
                                                                        </tr>
                                                                    </thead>

                                                                </table>                                                                

                                                                <br />

                                                                <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                    <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab4" onclick="ShowPushPullMap_tab4()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab4"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab4"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab4"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab4"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                                </div>

                                                                <br />                                                                
                                                                <br />
                                                                
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv3_tab4">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv4_tab4">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                            <div id="LOADING_Quad2_tab4" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad2_tab4">
                                                                <div id="PRODUCTION_CHART_tab4" style="visibility: visible;"></div>

                                                                <div id="ProductionChartTable_tab4" style="overflow-x:auto;">
                                                                    <table id="PRODUCTION_CHART_TABLE_tab4" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                        <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA"></th>
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

                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>

                                                                <button type="button" class="btn btn-primary" id="HidePCTableButton_tab4" onclick="HidePC_Table_tab4()">Hide Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab4" onclick="ShowPC_Table_tab4()">Show Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab4" onclick="ShowPC_Map_tab4()">Show Map of All</button>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div> 
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv5_tab4">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv6_tab4">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                            <div id="LOADING_Quad3_tab4" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="NoData_tab4">
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <h5>No data for Mapping</h5>
                                                                <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                            </div>
                                                            <div id="Quad3_tab4">                                                               
                                                                                                                                
                                                                <h6 id="mapcountsubtitle_tab4"></h6>
                                                                <div id="salesmapdiv_tab4" style="height: 350px; text-align: left;"></div>
                                                                <br />
                                                                <div id="Recent_Sales_Detail_tab4" class="m-section__content" style="height: 100%; width: 100%">
                                                                    <table id="Sales_Detail_tab4" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                        <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                    </table>
                                                                </div>

                                                                <%--<button type="button" class="btn btn-primary" id="HideMapTableButton_tab4" onclick="HideMap_Table_tab4()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab4" onclick="ShowMap_Table_tab4()">Show Job Details</button>--%>

                                                            </div>

                                                        </div>                                                        
                                                    </div>                                                   
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv7_tab4">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv8_tab4">

                                                        <div id="buttonrowcenterTP_tab4" style="visibility: visible;">
                                                            <div style="text-align: center; color: #343a40">
                                                                <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                                <div id="LOADING_Quad4_tab4" style='display: none'>
                                                                    <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                                </div>
                                                                <div id="Quad4_tab4">
                                                                    <div id="TaskProductionChart1_tab4" style="visibility: visible;"></div>
                                                                    
                                                                    <div id="TaskProductionChart2_tab4" style="visibility: visible;"></div>
                                                                    <%--<button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab4" onclick="HideTP_Chart2_tab4()">Hide Status of Not Completed MS Chart</button>
                                                                    <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab4" onclick="ShowTP_Chart2_tab4()">Show Status of Not Completed MS Chart</button>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                    </div>

                                  <%-- <div class="tab-pane" id="m_tabs_1_5" role="tabpanel">
                                        
                                    <div class="m-portlet__head-caption">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv_tab5">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv2_tab5">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                        <div id="LOADING_Quad1_tab5" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad1_tab5" class="m-section__content" style="height: 200px; width: 100%;">
                                                            <br />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-lg-6" id="ActVsPlanSection_tab5" style="text-align: center;">
                                                                    <h3><span id="ACTvsPLAN_tab5"></span>&nbsp;<span id="AheadBehind_tab5"></span></h3>
                                                                    <div style="text-align: center; color: black">
                                                                        <h5><span id="ACT_tab5"></span> Actual / <span id="YTDPLAN_tab5"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab5"></span>%)</h5>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" id="ActVsPlanSection2_tab5" style="text-align: center;">
                                                                    <div id="ForecastBar_tab5" style="visibility: visible; height: 90px"></div>
                                                                </div>
                                                            </div>

                                                            <br />

                                                            <table id="PlanFcstActTable_tab5" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA" title=""></th>
                                                                        <th bgcolor="#87CEFA" title="tab5 Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                        <th bgcolor="#87CEFA" title="tab5 Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                        <th bgcolor="#87CEFA" title="tab5 Jobs with On Air Actual date in Current Month">Actual</th>
                                                                        <th bgcolor="#87CEFA" title="tab5 Actual / NSB POE">Actual % of POE</th>
                                                                    </tr>
                                                                </thead>

                                                            </table>                                                                

                                                            <br />

                                                            <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab5" onclick="ShowPushPullMap_tab5()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab5"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab5"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab5"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab5"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                            </div>

                                                            <br />                                                                
                                                            <br />
                                                                
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv3_tab5">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv4_tab5">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                        <div id="LOADING_Quad2_tab5" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad2_tab5">
                                                            <div id="PRODUCTION_CHART_tab5" style="visibility: visible;"></div>

                                                            <div id="ProductionChartTable_tab5" style="overflow-x:auto;">
                                                                <table id="PRODUCTION_CHART_TABLE_tab5" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA"></th>
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

                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>

                                                            <button type="button" class="btn btn-primary" id="HidePCTableButton_tab5" onclick="HidePC_Table_tab5()">Hide Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab5" onclick="ShowPC_Table_tab5()">Show Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab5" onclick="ShowPC_Map_tab5()">Show Map of All</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> 
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv5_tab5">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv6_tab5">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                        <div id="LOADING_Quad3_tab5" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                            <div id="NoData_tab5">
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <h5>No data for Mapping</h5>
                                                                <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                            </div>
                                                        <div id="Quad3_tab5">
                                                                                                                                                                                            
                                                            <h6 id="mapcountsubtitle_tab5"></h6>
                                                            <div id="salesmapdiv_tab5" style="height: 350px; text-align: left;"></div>
                                                            <br />
                                                            <div id="Recent_Sales_Detail_tab5" class="m-section__content" style="height: 100%; width: 100%">
                                                                <table id="Sales_Detail_tab5" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                </table>
                                                            </div>

                                                        <button type="button" class="btn btn-primary" id="HideMapTableButton_tab5" onclick="HideMap_Table_tab5()">Hide Job Details</button>
                                                        <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab5" onclick="ShowMap_Table_tab5()">Show Job Details</button>

                                                        </div>

                                                    </div>                                                        
                                                </div>                                                   
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv7_tab5">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv8_tab5">

                                                    <div id="buttonrowcenterTP_tab5" style="visibility: visible;">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                            <div id="LOADING_Quad4_tab5" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad4_tab5">
                                                                <div id="TaskProductionChart1_tab5" style="visibility: visible;"></div>
                                                                    
                                                                <div id="TaskProductionChart2_tab5" style="visibility: visible;"></div>
                                                                <button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab5" onclick="HideTP_Chart2_tab5()">Hide Status of Not Completed MS Chart</button>
                                                                <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab5" onclick="ShowTP_Chart2_tab5()">Show Status of Not Completed MS Chart</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>--%>

                                   <%-- <div class="tab-pane" id="m_tabs_1_6" role="tabpanel">
                                        
                                    <div class="m-portlet__head-caption">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv_tab6">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv2_tab6">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                        <div id="LOADING_Quad1_tab6" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad1_tab6" class="m-section__content" style="height: 200px; width: 100%;">
                                                            <br />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-lg-6" id="ActVsPlanSection_tab6" style="text-align: center;">
                                                                    <h3><span id="ACTvsPLAN_tab6"></span>&nbsp;<span id="AheadBehind_tab6"></span></h3>
                                                                    <div style="text-align: center; color: black">
                                                                        <h5><span id="ACT_tab6"></span> Actual / <span id="YTDPLAN_tab6"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab6"></span>%)</h5>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" id="ActVsPlanSection2_tab6" style="text-align: center;">
                                                                    <div id="ForecastBar_tab6" style="visibility: visible; height: 90px"></div>
                                                                </div>
                                                            </div>

                                                            <br />

                                                            <table id="PlanFcstActTable_tab6" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA" title=""></th>
                                                                        <th bgcolor="#87CEFA" title="tab6 Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                        <th bgcolor="#87CEFA" title="tab6 Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                        <th bgcolor="#87CEFA" title="tab6 Jobs with On Air Actual date in Current Month">Actual</th>
                                                                        <th bgcolor="#87CEFA" title="tab6 Actual / NSB POE">Actual % of POE</th>
                                                                    </tr>
                                                                </thead>

                                                            </table>                                                                

                                                            <br />

                                                            <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab6" onclick="ShowPushPullMap_tab6()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab6"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab6"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab6"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab6"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                            </div>

                                                            <br />                                                                
                                                            <br />
                                                                
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv3_tab6">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv4_tab6">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                        <div id="LOADING_Quad2_tab6" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad2_tab6">
                                                            <div id="PRODUCTION_CHART_tab6" style="visibility: visible;"></div>

                                                            <div id="ProductionChartTable_tab6" style="overflow-x:auto;">
                                                                <table id="PRODUCTION_CHART_TABLE_tab6" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA"></th>
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

                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>

                                                            <button type="button" class="btn btn-primary" id="HidePCTableButton_tab6" onclick="HidePC_Table_tab6()">Hide Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab6" onclick="ShowPC_Table_tab6()">Show Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab6" onclick="ShowPC_Map_tab6()">Show Map of All</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> 
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv5_tab6">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv6_tab6">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                        <div id="LOADING_Quad3_tab6" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="NoData_tab6">
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <h5>No data for Mapping</h5>
                                                            <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                        </div>
                                                        <div id="Quad3_tab6">                                                            
                                                                                                                                
                                                            <h6 id="mapcountsubtitle_tab6"></h6>
                                                            <div id="salesmapdiv_tab6" style="height: 350px; text-align: left;"></div>
                                                            <br />
                                                            <div id="Recent_Sales_Detail_tab6" class="m-section__content" style="height: 100%; width: 100%">
                                                                <table id="Sales_Detail_tab6" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                </table>
                                                            </div>

                                                                <button type="button" class="btn btn-primary" id="HideMapTableButton_tab6" onclick="HideMap_Table_tab6()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab6" onclick="ShowMap_Table_tab6()">Show Job Details</button>

                                                        </div>

                                                    </div>                                                        
                                                </div>                                                   
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv7_tab6">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv8_tab6">

                                                    <div id="buttonrowcenterTP_tab6" style="visibility: visible;">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                            <div id="LOADING_Quad4_tab6" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad4_tab6">
                                                                <div id="TaskProductionChart1_tab6" style="visibility: visible;"></div>
                                                                    
                                                                <div id="TaskProductionChart2_tab6" style="visibility: visible;"></div>
                                                                <button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab6" onclick="HideTP_Chart2_tab6()">Hide Status of Not Completed MS Chart</button>
                                                                <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab6" onclick="ShowTP_Chart2_tab6()">Show Status of Not Completed MS Chart</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>--%>

                                   <%-- <div class="tab-pane" id="m_tabs_1_7" role="tabpanel">
                                        
                                    <div class="m-portlet__head-caption">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv_tab7">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv2_tab7">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                        <div id="LOADING_Quad1_tab7" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad1_tab7" class="m-section__content" style="height: 200px; width: 100%;">
                                                            <br />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-lg-6" id="ActVsPlanSection_tab7" style="text-align: center;">
                                                                    <h3><span id="ACTvsPLAN_tab7"></span>&nbsp;<span id="AheadBehind_tab7"></span></h3>
                                                                    <div style="text-align: center; color: black">
                                                                        <h5><span id="ACT_tab7"></span> Actual / <span id="YTDPLAN_tab7"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab7"></span>%)</h5>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" id="ActVsPlanSection2_tab7" style="text-align: center;">
                                                                    <div id="ForecastBar_tab7" style="visibility: visible; height: 90px"></div>
                                                                </div>
                                                            </div>

                                                            <br />

                                                            <table id="PlanFcstActTable_tab7" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA" title=""></th>
                                                                        <th bgcolor="#87CEFA" title="tab7 Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                        <th bgcolor="#87CEFA" title="tab7 Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                        <th bgcolor="#87CEFA" title="tab7 Jobs with On Air Actual date in Current Month">Actual</th>
                                                                        <th bgcolor="#87CEFA" title="tab7 Actual / NSB POE">Actual % of POE</th>
                                                                    </tr>
                                                                </thead>

                                                            </table>                                                                

                                                            <br />

                                                            <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab7" onclick="ShowPushPullMap_tab7()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab7"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab7"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab7"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab7"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                            </div>

                                                            <br />                                                                
                                                            <br />
                                                                
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv3_tab7">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv4_tab7">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                        <div id="LOADING_Quad2_tab7" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad2_tab7">
                                                            <div id="PRODUCTION_CHART_tab7" style="visibility: visible;"></div>

                                                            <div id="ProductionChartTable_tab7" style="overflow-x:auto;">
                                                                <table id="PRODUCTION_CHART_TABLE_tab7" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA"></th>
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

                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>

                                                            <button type="button" class="btn btn-primary" id="HidePCTableButton_tab7" onclick="HidePC_Table_tab7()">Hide Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab7" onclick="ShowPC_Table_tab7()">Show Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab7" onclick="ShowPC_Map_tab7()">Show Map of All</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> 
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv5_tab7">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv6_tab7">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                        <div id="LOADING_Quad3_tab7" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="NoData_tab7">
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <h5>No data for Mapping</h5>
                                                            <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                        </div>
                                                        <div id="Quad3_tab7">
                                                                                                                       
                                                            <h6 id="mapcountsubtitle_tab7"></h6>
                                                            <div id="salesmapdiv_tab7" style="height: 350px; text-align: left;"></div>
                                                            <br />
                                                            <div id="Recent_Sales_Detail_tab7" class="m-section__content" style="height: 100%; width: 100%">
                                                                <table id="Sales_Detail_tab7" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                </table>
                                                            </div>

                                                                <button type="button" class="btn btn-primary" id="HideMapTableButton_tab7" onclick="HideMap_Table_tab7()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab7" onclick="ShowMap_Table_tab7()">Show Job Details</button>

                                                        </div>

                                                    </div>                                                        
                                                </div>                                                   
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv7_tab7">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv8_tab7">

                                                    <div id="buttonrowcenterTP_tab7" style="visibility: visible;">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                            <div id="LOADING_Quad4_tab7" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad4_tab7">
                                                                <div id="TaskProductionChart1_tab7" style="visibility: visible;"></div>
                                                                    
                                                                <div id="TaskProductionChart2_tab7" style="visibility: visible;"></div>
                                                                <button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab7" onclick="HideTP_Chart2_tab7()">Hide Status of Not Completed MS Chart</button>
                                                                <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab7" onclick="ShowTP_Chart2_tab7()">Show Status of Not Completed MS Chart</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>--%>

                                  <%--  <div class="tab-pane" id="m_tabs_1_8" role="tabpanel">
                                        
                                    <div class="m-portlet__head-caption">
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv_tab8">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv2_tab8">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Numbers</h5>
                                                        <div id="LOADING_Quad1_tab8" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad1_tab8" class="m-section__content" style="height: 200px; width: 100%;">
                                                            <br />
                                                            <br />
                                                            <div class="row">
                                                                <div class="col-lg-6" id="ActVsPlanSection_tab8" style="text-align: center;">
                                                                    <h3><span id="ACTvsPLAN_tab8"></span>&nbsp;<span id="AheadBehind_tab8"></span></h3>
                                                                    <div style="text-align: center; color: black">
                                                                        <h5><span id="ACT_tab8"></span> Actual / <span id="YTDPLAN_tab8"></span> YTD Planned (<span id="ACTvsPLAN_Perc_tab8"></span>%)</h5>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6" id="ActVsPlanSection2_tab8" style="text-align: center;">
                                                                    <div id="ForecastBar_tab8" style="visibility: visible; height: 90px"></div>
                                                                </div>
                                                            </div>

                                                            <br />

                                                            <table id="PlanFcstActTable_tab8" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA" title=""></th>
                                                                        <th bgcolor="#87CEFA" title="tab8 Jobs in POE with On Air Plan date in Current Month">POE</th>
                                                                        <th bgcolor="#87CEFA" title="tab8 Jobs with On Air Forecast date in Current Month">Forecast</th>
                                                                        <th bgcolor="#87CEFA" title="tab8 Jobs with On Air Actual date in Current Month">Actual</th>
                                                                        <th bgcolor="#87CEFA" title="tab8 Actual / NSB POE">Actual % of POE</th>
                                                                    </tr>
                                                                </thead>

                                                            </table>                                                                

                                                            <br />

                                                            <div class="m-demo__preview m-demo__preview--btn">                                                                    
                                                                <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn_tab8" onclick="ShowPushPullMap_tab8()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull Ins: <span id="btn_CY_PULL_tab8"></span> jobs (<span id="btn_CY_PULL_perc_POE_tab8"></span>% of POE) <br /><span class="current_year"></span> Push Outs: <span id="btn_CY_PUSH_tab8"></span> jobs (<span id="btn_CY_PUSH_perc_POE_tab8"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i><br />Click to Show Details</button>&nbsp;
                                                            </div>

                                                            <br />                                                                
                                                            <br />
                                                                
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv3_tab8">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv4_tab8">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Production Curve</h5>
                                                        <div id="LOADING_Quad2_tab8" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="Quad2_tab8">
                                                            <div id="PRODUCTION_CHART_tab8" style="visibility: visible;"></div>

                                                            <div id="ProductionChartTable_tab8" style="overflow-x:auto;">
                                                                <table id="PRODUCTION_CHART_TABLE_tab8" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA"></th>
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

                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>

                                                            <button type="button" class="btn btn-primary" id="HidePCTableButton_tab8" onclick="HidePC_Table_tab8()">Hide Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCTableButton_tab8" onclick="ShowPC_Table_tab8()">Show Table</button>
                                                            <button type="button" class="btn btn-primary" id="ShowPCMapButton_tab8" onclick="ShowPC_Map_tab8()">Show Map of All</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> 
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6" id="RecentDiv5_tab8">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv6_tab8">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="selected_month"></span> Forecast and Actual Map</h5>
                                                        <div id="LOADING_Quad3_tab8" style='display: none'>
                                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                        </div>
                                                        <div id="NoData_tab8">
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <h5>No data for Mapping</h5>
                                                            <h6>(No On-Air Actuals or On-Air Forecasts in <span class="selected_month_long"></span>)</h6>
                                                        </div>
                                                        <div id="Quad3_tab8">                                                            
                                                                                                                                
                                                            <h6 id="mapcountsubtitle_tab8"></h6>
                                                            <div id="salesmapdiv_tab8" style="height: 350px; text-align: left;"></div>
                                                            <br />
                                                            <div id="Recent_Sales_Detail_tab8" class="m-section__content" style="height: 100%; width: 100%">
                                                                <table id="Sales_Detail_tab8" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tfoot>
                                                                            <tr>
                                                                                <th bgcolor="#87CEFA">Category</th>
                                                                                <th bgcolor="#87CEFA">PACE Number</th>
                                                                                <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                                                                <th bgcolor="#87CEFA">Program</th>
                                                                                <th bgcolor="#87CEFA">Subprogram</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 2</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 3</th>
                                                                                <th bgcolor="#87CEFA">Subprogram 4</th>
                                                                                <th bgcolor="#87CEFA">Sales Region</th>
                                                                                <th bgcolor="#87CEFA">VPGM Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Region</th>
                                                                                <th bgcolor="#87CEFA">ACE AVP</th>
                                                                                <th bgcolor="#87CEFA">ACE Market</th>
                                                                                <th bgcolor="#87CEFA">ACE Submarket</th>
                                                                                <th bgcolor="#87CEFA">State</th>
                                                                                <th bgcolor="#87CEFA">County</th>
                                                                                <th bgcolor="#87CEFA">City</th>
                                                                                <th bgcolor="#87CEFA">Zip Code</th>
                                                                                <th bgcolor="#87CEFA">RAN Initiative</th>
                                                                                <th bgcolor="#87CEFA">Spectrum</th>
                                                                                <th bgcolor="#87CEFA">Issued Date</th>
                                                                                <th bgcolor="#87CEFA">span 1</th>
                                                                                <th bgcolor="#87CEFA">span 2</th>
                                                                                <th bgcolor="#87CEFA">span 3</th>
                                                                                <th bgcolor="#87CEFA">USID</th>
                                                                                <th bgcolor="#87CEFA">FA Code</th>
                                                                                <th bgcolor="#87CEFA">Latitude</th>
                                                                                <th bgcolor="#87CEFA">Longitude</th>
                                                                                <th bgcolor="#87CEFA">Full PACE Name</th>
                                                                            </tr>
                                                                        </tfoot>
                                                                </table>
                                                            </div>

                                                                <button type="button" class="btn btn-primary" id="HideMapTableButton_tab8" onclick="HideMap_Table_tab8()">Hide Job Details</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMapTableButton_tab8" onclick="ShowMap_Table_tab8()">Show Job Details</button>

                                                        </div>

                                                    </div>                                                        
                                                </div>                                                   
                                            </div>
                                        </div>

                                        <div class="col-lg-6" id="RecentDiv7_tab8">
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv8_tab8">

                                                    <div id="buttonrowcenterTP_tab8" style="visibility: visible;">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>5GmmWave - <span class="current_geo"></span>: <span class="current_market"></span> - <span class="current_year"></span> Task Progression</h5>
                                                            <div id="LOADING_Quad4_tab8" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="Quad4_tab8">
                                                                <div id="TaskProductionChart1_tab8" style="visibility: visible;"></div>
                                                                    
                                                                <div id="TaskProductionChart2_tab8" style="visibility: visible;"></div>
                                                                <button type="button" class="btn btn-primary" id="HideTaskProgressionChart2Button_tab8" onclick="HideTP_Chart2_tab8()">Hide Status of Not Completed MS Chart</button>
                                                                <button type="button" class="btn btn-primary" id="ShowTaskProgressionChart2Button_tab8" onclick="ShowTP_Chart2_tab8()">Show Status of Not Completed MS Chart</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>--%>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>



    <!-- General Modal -->
    <div class="modal fade" id="m_modal_general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Production Chart Details</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_PC_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH" style='display: none'>No data found, please check input.</div>


                    <div id="ModalDisplay">
                        <div class="row" id="DisplayInfoRow">
                            <div class="col-md-2" id="InfoCol1_1" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-12" id="InfoCol1_2">
                                <div id="recentPC_ModalDetailSection1">
                                    <div style="text-align: center; color: #343a40">
                                        <h4 id="PC_Modal_mapcounttitle"></h4>
                                        <h5 id="PC_Modal_mapcountsubtitle"></h5>
                                        <%--<h6 id="PC_Modal_mapcountsubtitle2"></h6>--%>
                                    </div>
                                    <div id="PC_Modal_mapdiv" style="height: 435px;"></div>
                                    <h5 id="PC_Modal_mapcountfooter"></h5>
                                    <h6 id="PC_Modal_mapcountfooter2"></h6>
                                </div>
                            </div>
                            <div class="col-md-2" id="InfoCol1_3" style="text-align: center; color: black">
                                <%--Text Area2--%>
                            </div>
                        </div>
                        <br />

                        <div class="m-section__content" id="recentPC_ModalDetailSection2" style="height: 100%; width: 1200px;">
                            <table id="PC_Modal_Recent_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Header"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Header"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Header"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">Sales VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Footer"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Footer"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Footer"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>
                                    </tr>
                                </tfoot>
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
    
    <!-- Red Yellow Green RYG Modal -->
    <div class="modal fade" id="m_modal_RYG" tabindex="-1" role="dialog" aria-labelledby="myRYGModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Monthly Details<span id="Modal_Month_Title"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_RYG_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="RYG_Modal_NoData" style='display: none'>No Data for Mapping.</div>


                    <div id="ModalDisplay_RYG">
                        <div class="row" id="DisplayInfoRow_RYG">
                            <div class="col-md-2" id="RYG_InfoCol1_1" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-12" id="RYG_InfoCol1_2">
                                <div id="recentRYG_ModalDetailSection1">
                                    <div style="text-align: center; color: #343a40">
                                        <h4 id="RYG_Modal_mapcounttitle"></h4>
                                        <h5 id="RYG_Modal_mapcountsubtitle"></h5>
                                        <%--<h6 id="PC_Modal_mapcountsubtitle2"></h6>--%>
                                    </div>
                                    <div id="RYG_Modal_mapdiv" style="height: 450px;"></div>
                                    <h5 id="RYG_Modal_mapcountfooter"></h5>
                                    <h6 id="RYG_Modal_mapcountfooter2"></h6>
                                </div>
                            </div>
                            <div class="col-md-2" id="RYG_InfoCol1_3" style="text-align: center; color: black">
                                <%--Text Area2--%>
                            </div>
                        </div>
                        <br />

                        <div class="m-section__content" id="recentRYG_ModalDetailSection2" style="height: 100%; width: 1200px;">
                            <table id="RYG_Modal_Recent_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Header_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Header_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Header_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Footer_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Footer_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Footer_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>
                                    </tr>
                                </tfoot>
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
    <!-- Red Yellow Green RYG Modal End --> 

    <!-- Red Yellow Green RYG Modal2 -->
    <div class="modal fade" id="m_modal2_RYG" tabindex="-1" role="dialog" aria-labelledby="myRYGModal2Label">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Yearly Details<span id="Modal_Year_Title"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_RYG_Modal2" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="RYG_Modal2_NoData" style='display: none'>No Data for Mapping.</div>


                    <div id="ModalDisplay_RYG2">
                        <div class="row" id="DisplayInfoRow_RYG2">
                            <%--<div class="col-md-2" id="RYG2_InfoCol1_1" style="text-align: center; color: black">
                                
                            </div>--%>
                            <div class="col-md-12" id="RYG2_InfoCol1_2">
                                <div id="recentRYG_Modal2DetailSection1">
                                    <div style="text-align: center; color: #343a40">
                                        <h4 id="RYG_Modal2_mapcounttitle"></h4>
                                        <h5 id="RYG_Modal2_mapcountsubtitle"></h5>
                                        <%--<h6 id="PC_Modal2_mapcountsubtitle2"></h6>--%>
                                    </div>
                                    <div id="RYG_Modal2_mapdiv" style="height: 450px;"></div>
                                    <h5 id="RYG_Modal2_mapcountfooter"></h5>
                                    <h6 id="RYG_Modal2_mapcountfooter2"></h6>
                                   <%-- <h6 id="RYG_Modal2_mapcountfooter1"></h6>--%>
                                    
                                </div>
                            </div>
                            <%--<div class="col-md-2" id="RYG2_InfoCol1_3" style="text-align: center; color: black">
                                
                            </div>--%>
                        </div>
                                              

                        <div class="m-section__content" id="recentRYG_Modal2DetailSection2" style="height: 100%; width: 1200px;">
                            <table id="RYG_Modal2_Recent_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Header_RYGModal2"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Header_RYGModal2"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Header_RYGModal2"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Footer_RYGModal2"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Footer_RYGModal2"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Footer_RYGModal2"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>
                                    </tr>
                                </tfoot>
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

    <!-- Red Yellow Green RYG Modal2 End -->

    <!-- Red Yellow Green RYG Modal3 -->
    <div class="modal fade" id="m_modal3_RYG" tabindex="-1" role="dialog" aria-labelledby="myRYGModal3Label">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Push/Pull Details</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_RYG_Modal3" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH_RYG3" style='display: none'>No Push/Pull data with current selections.</div>


                    <div id="ModalDisplay_RYG3">
                        <div class="row" id="DisplayInfoRow_RYG3">
                            <div class="col-md-2" id="RYG3_InfoCol1_1" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-12" id="RYG3_InfoCol1_2">
                                <div id="recentRYG_Modal3DetailSection1">
                                    <div style="text-align: center; color: #343a40">
                                        <h4 id="RYG_Modal3_mapcounttitle"></h4>
                                        <h5 id="RYG_Modal3_mapcountsubtitle"></h5>
                                        <%--<h6 id="PC_Modal3_mapcountsubtitle2"></h6>--%>
                                    </div>
                                    <div id="RYG_Modal3_mapdiv" style="height: 450px;"></div>
                                    <h5 id="RYG_Modal3_mapcountfooter"></h5>
                                    <h6 id="RYG_Modal3_mapcountfooter2"></h6>
                                </div>
                            </div>
                            <div class="col-md-2" id="RYG3_InfoCol1_3" style="text-align: center; color: black">
                                <%--Text Area2--%>
                            </div>
                        </div>
                        <br />

                        <div class="m-section__content" id="recentRYG_Modal3DetailSection2" style="height: 100%; width: 1200px;">
                            <table id="RYG_Modal3_Recent_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Header_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Header_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Header_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name (Shortened)</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subprogram 2</th>
                                        <th bgcolor="#87CEFA">Subprogram 3</th>
                                        <th bgcolor="#87CEFA">Subprogram 4</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">Sales Region</th>
                                        <th bgcolor="#87CEFA">VPGM Market</th>
                                        <th bgcolor="#87CEFA">ACE Region</th>
                                        <th bgcolor="#87CEFA">ACE AVP</th>
                                        <th bgcolor="#87CEFA">ACE Market</th>
                                        <th bgcolor="#87CEFA">ACE Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Footer_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Footer_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Footer_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">Full PACE Name</th>
                                    </tr>
                                </tfoot>
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

    <!-- Red Yellow Green RYG Modal3 End -->

    <script>

        var IEDetected;
        IEdetection();

        //detects if user uses Internet Explorer 
        //returns version of IE or false, if browser is not IE 
        //Function to detect IE or not 
        function IEdetection() {
            var ua = window.navigator.userAgent;
            var trident = ua.indexOf('Trident/');
            var edge = ua.indexOf('Edge/');
            var msie = ua.indexOf('MSIE ');
            if (msie > 0) {
                // IE 10 or older, return version number 
                alert('We noticed you are using Internet Explorer - This tool was developed for use in Firefox, Safari and Chrome Only. Please use one of these supported browsers. We apoligize for the inconvenience.');
            }
            else if (trident > 0) {
                // IE 11, return version number 
                alert('We noticed you are using Internet Explorer - This tool was developed for use in Firefox, Safari and Chrome Only. Please use one of these supported browsers. We apoligize for the inconvenience.');
            }
            else if (edge > 0) {
                //Edge (IE 12+), return version number 
                alert('We noticed you are using Internet Explorer - This tool was developed for use in Firefox, Safari and Chrome Only. Please use one of these supported browsers. We apoligize for the inconvenience.');
            } else {
                IEDetected = 'No';
            }
        }

        if (IEDetected == 'No') {

            var curmonthspan = 'Jan';       // give curmonthspan global scope and default to Jan
            var curyearspan = '2023';       // give curyearspan global scope and default to 2020
            var showcolumn = true;          // give showcolumn global scope and default to true
            var executedon = '2023-01-01';  // give curyearspan global scope and default to 1/1/2020
            var geoTypeStored = '';         // these will be populated after submit button click. Note that initial load calls a submit button click without user clicking
            var marketStored = '';
            var monthStored = '';

            var submitButtonActiveTab = 1;  // global variable that stores the active tab number when submit button is clicked

            var tab1Loaded = 0;             // variable if tab has data loaded (1) or not loaded (0) , gets reset after submit button
            var tab2Loaded = 0;
            var tab3Loaded = 0;
            var tab4Loaded = 0;

            $(document).ready(function () {
                //attachClickHandlers();
                console.log("DocReady");

                // set up the active tabs
                var tabpane1 = document.getElementById("m_tabs_1_1");           //make tabpanel-1 (m_tabs_1_1) active 
                tabpane1.classList.add("active");
                var tab1 = document.getElementById("tab1");
                tab1.classList.add("active");
                //var tabpane2 = document.getElementById("m_tabs_1_2");
                var tabpane3 = document.getElementById("m_tabs_1_3");
                var tabpane4 = document.getElementById("m_tabs_1_4");
                //var tabpane5 = document.getElementById("m_tabs_1_5");
                //var tabpane6 = document.getElementById("m_tabs_1_6");
                //var tabpane7 = document.getElementById("m_tabs_1_7"); 
                //var tabpane8 = document.getElementById("m_tabs_1_8");
                //tabpane2.classList.remove("active");
                tabpane3.classList.remove("active");
                tabpane4.classList.remove("active");
                //tabpane5.classList.remove("active");
                //tabpane6.classList.remove("active");
                //tabpane7.classList.remove("active"); 
                //tabpane8.classList.remove("active");
                //var tab2 = document.getElementById("tab2");
                var tab3 = document.getElementById("tab3");
                var tab4 = document.getElementById("tab4");
                //var tab5 = document.getElementById("tab5");
                //var tab6 = document.getElementById("tab6");
                //var tab7 = document.getElementById("tab7");
                //var tab8 = document.getElementById("tab8");
                //tab2.classList.remove("active");
                tab3.classList.remove("active"); //turn off
                tab4.classList.remove("active"); //turn off
                //tab5.classList.remove("active");
                //tab6.classList.remove("active");
                //tab7.classList.remove("active");
                //tab8.classList.remove("active");

                $('#ShowPCMapButton_tab1').hide();  // temp hide of button
                $('#ShowTaskProgressionChart2Button_tab1').hide();  // temp hide of button
                $('#ShowPCMapButton_tab3').hide();  // temp hide of button
                $('#ShowTaskProgressionChart2Button_tab3').hide();  // temp hide of button
                $('#ShowPCMapButton_tab4').hide();  // temp hide of button
                $('#ShowTaskProgressionChart2Button_tab4').hide();  // temp hide of button

                $('#Quad1_tab1').hide();
                $('#Quad2_tab1').hide();
                $('#Quad3_tab1').hide();
                $('#Quad4_tab1').hide();
                $('#Recent_Sales_Detail_tab1').hide();
                $('#HidePCTableButton_tab1').hide();
                $('#HideMapTableButton_tab1').hide();
                $('#ShowMapTableButton_tab1').hide();  //take out when wanting to show table button
                $('#HideTaskProgressionChart2Button_tab1').hide();
                $('#ProductionChartTable_tab1').hide();
                $('#TaskProductionChart2_tab1').hide();
                //$('#Quad1_tab2').hide();
                //$('#Quad2_tab2').hide();
                //$('#Quad3_tab2').hide();
                //$('#Quad4_tab2').hide();
                //$('#Recent_Sales_Detail_tab2').hide();
                //$('#HidePCTableButton_tab2').hide();
                //$('#HideMapTableButton_tab2').hide();
                //$('#HideTaskProgressionChart2Button_tab2').hide();
                //$('#ProductionChartTable_tab2').hide();
                //$('#TaskProductionChart2_tab2').hide();
                $('#Quad1_tab3').hide();
                $('#Quad2_tab3').hide();
                $('#Quad3_tab3').hide();
                $('#Quad4_tab3').hide();
                $('#Recent_Sales_Detail_tab3').hide();
                $('#HidePCTableButton_tab3').hide();
                $('#HideMapTableButton_tab3').hide();
                $('#ShowMapTableButton_tab3').hide();  //take out when wanting to show table button
                $('#HideTaskProgressionChart2Button_tab3').hide();
                $('#ProductionChartTable_tab3').hide();
                $('#TaskProductionChart2_tab3').hide();
                $('#Quad1_tab4').hide();
                $('#Quad2_tab4').hide();
                $('#Quad3_tab4').hide();
                $('#Quad4_tab4').hide();
                $('#NoData_tab4').hide();
                $('#Recent_Sales_Detail_tab4').hide();
                $('#HidePCTableButton_tab4').hide();
                $('#HideMapTableButton_tab4').hide();
                $('#ShowMapTableButton_tab4').hide();  //take out when wanting to show table button
                $('#HideTaskProgressionChart2Button_tab4').hide();
                $('#ProductionChartTable_tab4').hide();
                $('#TaskProductionChart2_tab4').hide();

                //$('#Quad1_tab5').hide();
                //$('#Quad2_tab5').hide();
                //$('#Quad3_tab5').hide();
                //$('#Quad4_tab5').hide();
                //$('#Recent_Sales_Detail_tab5').hide();
                //$('#HidePCTableButton_tab5').hide();
                //$('#HideMapTableButton_tab5').hide();
                //$('#HideTaskProgressionChart2Button_tab5').hide();
                //$('#ProductionChartTable_tab5').hide();
                //$('#TaskProductionChart2_tab5').hide();
                //$('#Quad1_tab6').hide();
                //$('#Quad2_tab6').hide();
                //$('#Quad3_tab6').hide();
                //$('#Quad4_tab6').hide();
                //$('#Recent_Sales_Detail_tab6').hide();
                //$('#HidePCTableButton_tab6').hide();
                //$('#HideMapTableButton_tab6').hide();
                //$('#HideTaskProgressionChart2Button_tab6').hide();
                //$('#ProductionChartTable_tab6').hide();
                //$('#TaskProductionChart2_tab6').hide();
                //$('#Quad1_tab7').hide();
                //$('#Quad2_tab7').hide();
                //$('#Quad3_tab7').hide();
                //$('#Quad4_tab7').hide();
                //$('#Recent_Sales_Detail_tab7').hide();
                //$('#HidePCTableButton_tab7').hide();
                //$('#HideMapTableButton_tab7').hide();
                //$('#HideTaskProgressionChart2Button_tab7').hide();
                //$('#ProductionChartTable_tab7').hide();
                //$('#TaskProductionChart2_tab7').hide();
                //$('#Quad1_tab8').hide();
                //$('#Quad2_tab8').hide();
                //$('#Quad3_tab8').hide();
                //$('#Quad4_tab8').hide();
                //$('#Recent_Sales_Detail_tab8').hide();
                //$('#HidePCTableButton_tab8').hide();
                //$('#HideMapTableButton_tab8').hide();
                //$('#HideTaskProgressionChart2Button_tab8').hide();
                //$('#ProductionChartTable_tab8').hide();
                //$('#TaskProductionChart2_tab8').hide();

                $('#RYG_Modal_NoData').hide();
                $('#RYG_Modal2_NoData').hide();

                $('#LOADING_Quad1_tab1').show();
                $('#LOADING_Quad2_tab1').show();
                $('#LOADING_Quad3_tab1').show();
                $('#LOADING_Quad4_tab1').show();

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetDATADATE",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDATADATE(data);
                    },
                    error: function (data) {
                    }
                });

                mainClickOnce_tab1();
                //mainClickOnce_tab2();
                mainClickOnce_tab3();
                mainClickOnce_tab4();
                //mainClickOnce_tab5();
                //mainClickOnce_tab6();
                //mainClickOnce_tab7();
                //mainClickOnce_tab8();

            });

            //function attachClickHandlers() {
            //    console.log("ClickHandler");
            //    $('#ddlMarket').change(
            //        function () {
            //            SubmitButtonClick();
            //        }
            //    );
            //    $('#ddlMonth').change(
            //        function () {
            //            SubmitButtonClick();
            //        }
            //    );
            //}

            function SubmitButtonClick() {
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
                console.log("SubmitButtonClick function: " + market);
                console.log("SubmitButtonClick function: " + pulldown_month);

                //check if anything has changed since last submitbuttonclick
                if (geoTypeStored == $('#<%= ddlGeo.ClientID %> option:selected').text()
                    && marketStored == $('#<%= ddlMarket.ClientID %> option:selected').text()
                    && monthStored == $('#<%= ddlMonth.ClientID %> option:selected').text()) {
                    console.log('Button Click without Pulldown Change');
                }

                else {

                    var geo = $('#<%= ddlGeo.ClientID %> option:selected').text();
                    var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                    var time = "Last 90 days on air / +45 days forecasted";

                    console.log("getFilterCriteria function: " + geo);
                    console.log("getFilterCriteria function: " + market_long);
                    console.log("getFilterCriteria function: " + market);
                    console.log("getFilterCriteria function: " + time);

                    var geoSpan = $('#<%= ddlGeo.ClientID %> option:selected').text();
                    var geoClasses = document.getElementsByClassName('current_geo');
                    for (var i = 0; i < geoClasses.length; i++) {
                        geoClasses[i].innerHTML = geoSpan;
                    }

                    var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var marketClasses = document.getElementsByClassName('current_market');
                    for (var i = 0; i < marketClasses.length; i++) {
                        marketClasses[i].innerHTML = marketspan;
                    }

                    //update stored pulldown values
                    geoTypeStored = $('#<%= ddlGeo.ClientID %> option:selected').text();
                    marketStored = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    monthStored = $('#<%= ddlMonth.ClientID %> option:selected').text();

                    //reset tabloaded variables
                    tab1Loaded = 0;
                    tab2Loaded = 0;
                    tab3Loaded = 0;
                    tab4Loaded = 0;
                    tab5Loaded = 0;
                    tab6Loaded = 0;
                    tab7Loaded = 0;
                    tab8Loaded = 0;

                    //figure out which tab is active
                    if (document.getElementById("m_tabs_1_1").classList == 'tab-pane show active') {
                        submitButtonActiveTab = 1;
                    }

                    //else if (document.getElementById("m_tabs_1_2").classList == 'tab-pane show active') {
                    //    submitButtonActiveTab = 2;
                    //}

                    else if (document.getElementById("m_tabs_1_3").classList == 'tab-pane show active') {
                        submitButtonActiveTab = 3;
                    }

                    else if (document.getElementById("m_tabs_1_4").classList == 'tab-pane show active') {
                        submitButtonActiveTab = 4;
                    }

                    //else if (document.getElementById("m_tabs_1_5").classList == 'tab-pane show active') {
                    //    submitButtonActiveTab = 5;
                    //}

                    //else if (document.getElementById("m_tabs_1_6").classList == 'tab-pane show active') {
                    //    submitButtonActiveTab = 6;
                    //}

                    //else if (document.getElementById("m_tabs_1_7").classList == 'tab-pane show active') {
                    //    submitButtonActiveTab = 7;
                    //}

                    //else if (document.getElementById("m_tabs_1_8").classList == 'tab-pane show active') {
                    //    submitButtonActiveTab = 8;
                    //}

                    console.log('Active Tab: ' + submitButtonActiveTab);

                    //logic mapping tabs to pptp hierarhcy and other variables

                    //set defaults
                    var pptp1Submit = '';
                    var pptp2Submit = '';
                    var pptp3Submit = '';
                    var pptp4Submit = '';
                    var pptp5Submit = '';
                    var pptpType = '';

                    //logic table for lookups

                    if (submitButtonActiveTab == 1) {
                        pptp1Submit = 'NSB ALL';
                        pptp2Submit = 'NSB All In Market';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'NSB';
                    }

                    else if (submitButtonActiveTab == 2) {
                        pptp1Submit = 'MCA';
                        pptp2Submit = 'ALL';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'MCA';
                    }

                    else if (submitButtonActiveTab == 3) {
                        pptp1Submit = 'CRAN ALL';
                        pptp2Submit = 'CRAN Combined';
                        pptp3Submit = 'CRAN 1C Node';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'CRAN';
                    }

                    else if (submitButtonActiveTab == 4) {
                        pptp1Submit = '5G mmWave ALL';
                        pptp2Submit = '5G mmWave All Nodes';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = '5GmmWave';
                    }

                    if (submitButtonActiveTab == 5) {
                        pptp1Submit = 'NSB ALL';
                        pptp2Submit = 'NSB All In Market';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'NSB';
                    }

                    if (submitButtonActiveTab == 6) {
                        pptp1Submit = 'NSB ALL';
                        pptp2Submit = 'NSB All In Market';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'NSB';
                    }

                    if (submitButtonActiveTab == 7) {
                        pptp1Submit = 'NSB ALL';
                        pptp2Submit = 'NSB All In Market';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'NSB';
                    }

                    if (submitButtonActiveTab == 8) {
                        pptp1Submit = 'NSB ALL';
                        pptp2Submit = 'NSB All In Market';
                        pptp3Submit = 'ALL';
                        pptp4Submit = 'ALL';
                        pptp5Submit = 'ALL';
                        pptpType = 'NSB';
                    }

                    var selected_d = new Date(pulldown_month);

                    var month = new Array();
                    month[0] = "Jan";
                    month[1] = "Feb";
                    month[2] = "Mar";
                    month[3] = "Apr";
                    month[4] = "May";
                    month[5] = "Jun";
                    month[6] = "Jul";
                    month[7] = "Aug";
                    month[8] = "Sep";
                    month[9] = "Oct";
                    month[10] = "Nov";
                    month[11] = "Dec";

                    var selected_month = month[(selected_d.getMonth() + 13) % 12];

                    var selectedMonthClasses = document.getElementsByClassName('selected_month');
                    for (var i = 0; i < selectedMonthClasses.length; i++) {
                        selectedMonthClasses[i].innerHTML = selected_month;
                    }

                    var selected_month_long = $('#<%= ddlMonth.ClientID %> option:selected').text();

                    var selectedMonthLongClasses = document.getElementsByClassName('selected_month_long');
                    for (var i = 0; i < selectedMonthLongClasses.length; i++) {
                        selectedMonthLongClasses[i].innerHTML = selected_month_long;
                    }

                    getFilterCriteria(submitButtonActiveTab, pptp1Submit, pptp2Submit, pptp3Submit, pptp4Submit, pptp5Submit, pptpType, market, time, market_long);

                }

            }

            //show and hide divs, kick off correct get data function
            function getFilterCriteria(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType, market, time, market_long) {
                //Hide tabs
                $('#Quad1_tab' + activeTabNumber).hide();
                $('#Quad2_tab' + activeTabNumber).hide();
                $('#Quad3_tab' + activeTabNumber).hide();
                $('#Quad4_tab' + activeTabNumber).hide();
                $('#Recent_Sales_Detail_tab' + activeTabNumber).hide();
                $('#HideTaskProgressionChart2Button_tab' + activeTabNumber).hide();
                $('#HidePCTableButton_tab' + activeTabNumber).hide();
                $('#HideMapTableButton_tab' + activeTabNumber).hide();
                $('#ProductionChartTable_tab' + activeTabNumber).hide();
                $('#TaskProductionChart2_tab' + activeTabNumber).hide();
                $('#NoData_tab' + activeTabNumber).hide();
                $('#RYG_Modal_NoData').hide();
                $('#RYG_Modal2_NoData').hide();

                //Show tabs
                $('#LOADING_Quad1_tab' + activeTabNumber).show();
                $('#LOADING_Quad2_tab' + activeTabNumber).show();
                $('#LOADING_Quad3_tab' + activeTabNumber).show();
                $('#LOADING_Quad4_tab' + activeTabNumber).show();

                var activeTabLoaded = 0; // initailize variable which stores if active tab has been loaded already

                if (activeTabNumber == 1) { activeTabLoaded = tab1Loaded; }
                else if (activeTabNumber == 2) { activeTabLoaded = tab2Loaded; }
                else if (activeTabNumber == 3) { activeTabLoaded = tab3Loaded; }
                else if (activeTabNumber == 4) { activeTabLoaded = tab4Loaded; }
                else if (activeTabNumber == 5) { activeTabLoaded = tab5Loaded; }
                else if (activeTabNumber == 6) { activeTabLoaded = tab6Loaded; }
                else if (activeTabNumber == 7) { activeTabLoaded = tab7Loaded; }
                else if (activeTabNumber == 8) { activeTabLoaded = tab8Loaded; }

                console.log('tab1Loaded: ' + tab1Loaded);
                console.log('tab2Loaded: ' + tab2Loaded);
                console.log('tab3Loaded: ' + tab3Loaded);
                console.log('tab4Loaded: ' + tab4Loaded);
                console.log('tab5Loaded: ' + tab5Loaded);
                console.log('tab6Loaded: ' + tab6Loaded);
                console.log('tab7Loaded: ' + tab7Loaded);
                console.log('tab8Loaded: ' + tab8Loaded);

                //only trigger data updates if the active tab is not already loaded
                if (activeTabLoaded == 0) {

                    //update tabloading
                    if (activeTabNumber == 1) { tab1Loaded = 1; }
                    else if (activeTabNumber == 2) { tab2Loaded = 1; }
                    else if (activeTabNumber == 3) { tab3Loaded = 1; }
                    else if (activeTabNumber == 4) { tab4Loaded = 1; }
                    else if (activeTabNumber == 5) { tab4Loaded = 1; }
                    else if (activeTabNumber == 6) { tab4Loaded = 1; }
                    else if (activeTabNumber == 7) { tab4Loaded = 1; }
                    else if (activeTabNumber == 8) { tab4Loaded = 1; }

                    //trigger chain of functions to get data
                    Getmarketdata(market, time, market_long, activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType);
                }

                //if data is already loaded, dont trigger chain of functions, just hide loading divs and show data divs
                else {

                    $('#LOADING_Quad1_tab' + activeTabNumber).hide();
                    $('#LOADING_Quad2_tab' + activeTabNumber).hide();
                    $('#LOADING_Quad3_tab' + activeTabNumber).hide();
                    $('#LOADING_Quad4_tab' + activeTabNumber).hide();

                    $('#Quad1_tab' + activeTabNumber).show();
                    $('#Quad2_tab' + activeTabNumber).show();
                    $('#Quad3_tab' + activeTabNumber).show();
                    $('#Quad4_tab' + activeTabNumber).show();
                    $('#Recent_Sales_Detail_tab' + activeTabNumber).hide();
                    $('#ShowPCTableButton_tab' + activeTabNumber).show();
                    $('#HidePCTableButton_tab' + activeTabNumber).hide();
                    $('#ShowMapTableButton_tab' + activeTabNumber).show();
                    $('#HideMapTableButton_tab' + activeTabNumber).hide();
                    $('#ShowTaskProgressionChart2Button_tab' + activeTabNumber).show();
                    $('#HideTaskProgressionChart2Button_tab' + activeTabNumber).hide();
                    $('#ProductionChartTable_tab' + activeTabNumber).hide();
                    $('#TaskProductionChart2_tab' + activeTabNumber).hide();

                }

            }

            function Getmarketdata(market, time, market_long, activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType) {
                updateProductionCurve(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType, 'PRODUCTION_CHART', '', 'Plan/Forecast/Actuals', '0');
                updateProductionNumbers(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType);
                updateSalesChart(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType, market, time, market_long);
                updateTaskProgression(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, pptpType, 'TaskProductionChart1', 'TaskProductionChart2');
            }

            function mainClickOnce_tab1() {
                $('#tab1').on('click', function (e) {
                    console.log('mainClickOnce_tab1 Triggered');
                    getFilterCriteria(1, 'NSB ALL', 'NSB All In Market', 'ALL', 'ALL', 'ALL', "NSB");
                });
            }

            function mainClickOnce_tab2() {
                $('#tab1').on('click', function (e) {
                    console.log('mainClickOnce_tab2 Triggered');
                    getFilterCriteria(2, 'MCA', 'ALL', 'ALL', 'ALL', 'ALL', "MCA");
                });
            }

            function mainClickOnce_tab3() {
                $('#tab3').on('click', function (e) {
                    console.log('mainClickOnce_tab3 Triggered');
                    getFilterCriteria(3, 'CRAN ALL', 'CRAN Combined', 'CRAN 1C Node', 'ALL', 'ALL', "CRAN");
                });
            }

            function mainClickOnce_tab4() {
                $('#tab4').on('click', function (e) {
                    console.log('mainClickOnce_tab4 Triggered');
                    getFilterCriteria(4, '5G mmWave ALL', '5G mmWave All Nodes', 'ALL', 'ALL', 'ALL', "5GmmWave");
                });
            }

            function mainClickOnce_tab5() {
                $('#tab1').on('click', function (e) {
                    console.log('mainClickOnce_tab5 Triggered');
                    getFilterCriteria(5, 'NSB ALL', 'NSB All In Market', 'ALL', 'ALL', 'ALL', "NSB");
                });
            }

            function mainClickOnce_tab6() {
                $('#tab1').on('click', function (e) {
                    console.log('mainClickOnce_tab6 Triggered');
                    getFilterCriteria(6, 'NSB ALL', 'NSB All In Market', 'ALL', 'ALL', 'ALL', "NSB");
                });
            }

            function mainClickOnce_tab7() {
                $('#tab1').on('click', function (e) {
                    console.log('mainClickOnce_tab7 Triggered');
                    getFilterCriteria(7, 'NSB ALL', 'NSB All In Market', 'ALL', 'ALL', 'ALL', "NSB");
                });
            }

            function mainClickOnce_tab8() {
                $('#tab1').on('click', function (e) {
                    console.log('mainClickOnce_tab8 Triggered');
                    getFilterCriteria(8, 'NSB ALL', 'NSB All In Market', 'ALL', 'ALL', 'ALL', "NSB");
                });
            }

            $('.nav-tabs li').on('click', function () {
                setTimeout(function () {
                    $(window).resize();
                }, 0);
            });

            function Modal_Click(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnModal.ClientID %>");
                clickButton.click();
            }

            function Modal_Click_HistDetail(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnModal_HistDetail.ClientID %>");
                clickButton.click();
            }

            function Modal_Click_HistAllMarkets(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnModal_HistAllMarkets.ClientID %>");
                clickButton.click();
            }

            function Modal_Click_RYG(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnModal_RYG.ClientID %>");
                clickButton.click();
            }

            function Modal2_Click_RYG(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnModal2_RYG.ClientID %>");
                clickButton.click();
            }

            function Modal3_Click_RYG(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnModal3_RYG.ClientID %>");
                clickButton.click();
            }

            function HidePC_Table_tab1() {
                $('#HidePCTableButton_tab1').hide();
                $('#ShowPCTableButton_tab1').show();
                $('#ProductionChartTable_tab1').hide();
            }

            //function HidePC_Table_tab2() {
            //    $('#HidePCTableButton_tab2').hide();
            //    $('#ShowPCTableButton_tab2').show();
            //    $('#ProductionChartTable_tab2').hide();
            //}

            function HidePC_Table_tab3() {
                $('#HidePCTableButton_tab3').hide();
                $('#ShowPCTableButton_tab3').show();
                $('#ProductionChartTable_tab3').hide();
            }

            function HidePC_Table_tab4() {
                $('#HidePCTableButton_tab4').hide();
                $('#ShowPCTableButton_tab4').show();
                $('#ProductionChartTable_tab4').hide();
            }

            //function HidePC_Table_tab5() {
            //    $('#HidePCTableButton_tab5').hide();
            //    $('#ShowPCTableButton_tab5').show();
            //    $('#ProductionChartTable_tab5').hide();
            //}

            //function HidePC_Table_tab6() {
            //    $('#HidePCTableButton_tab6').hide();
            //    $('#ShowPCTableButton_tab6').show();
            //    $('#ProductionChartTable_tab6').hide();
            //}

            //function HidePC_Table_tab7() {
            //    $('#HidePCTableButton_tab7').hide();
            //    $('#ShowPCTableButton_tab7').show();
            //    $('#ProductionChartTable_tab7').hide();
            //}

            //function HidePC_Table_tab8() {
            //    $('#HidePCTableButton_tab8').hide();
            //    $('#ShowPCTableButton_tab8').show();
            //    $('#ProductionChartTable_tab8').hide();
            //}

            function ShowPC_Table_tab1() {
                $('#HidePCTableButton_tab1').show();
                $('#ShowPCTableButton_tab1').hide();
                $('#ProductionChartTable_tab1').show();
            }

            //function ShowPC_Table_tab2() {
            //    $('#HidePCTableButton_tab2').show();
            //    $('#ShowPCTableButton_tab2').hide();
            //    $('#ProductionChartTable_tab2').show();
            //}

            function ShowPC_Table_tab3() {
                $('#HidePCTableButton_tab3').show();
                $('#ShowPCTableButton_tab3').hide();
                $('#ProductionChartTable_tab3').show();
            }

            function ShowPC_Table_tab4() {
                $('#HidePCTableButton_tab4').show();
                $('#ShowPCTableButton_tab4').hide();
                $('#ProductionChartTable_tab4').show();
            }

            //function ShowPC_Table_tab5() {
            //    $('#HidePCTableButton_tab5').show();
            //    $('#ShowPCTableButton_tab5').hide();
            //    $('#ProductionChartTable_tab5').show();
            //}

            //function ShowPC_Table_tab6() {
            //    $('#HidePCTableButton_tab6').show();
            //    $('#ShowPCTableButton_tab6').hide();
            //    $('#ProductionChartTable_tab6').show();
            //}

            //function ShowPC_Table_tab7() {
            //    $('#HidePCTableButton_tab7').show();
            //    $('#ShowPCTableButton_tab7').hide();
            //    $('#ProductionChartTable_tab7').show();
            //}

            //function ShowPC_Table_tab8() {
            //    $('#HidePCTableButton_tab8').show();
            //    $('#ShowPCTableButton_tab8').hide();
            //    $('#ProductionChartTable_tab8').show();
            //}

            function HideMap_Table_tab1() {
                $('#HideMapTableButton_tab1').hide();
                $('#ShowMapTableButton_tab1').show();
                $('#Recent_Sales_Detail_tab1').hide();
            }

            function ShowMap_Table_tab1() {
                $('#HideMapTableButton_tab1').show();
                $('#ShowMapTableButton_tab1').hide();
                $('#Recent_Sales_Detail_tab1').show();
                $(window).resize();
            }

            //function HideMap_Table_tab2() {
            //    $('#HideMapTableButton_tab2').hide();
            //    $('#ShowMapTableButton_tab2').show();
            //    $('#Recent_Sales_Detail_tab2').hide();
            //}

            //function ShowMap_Table_tab2() {
            //    $('#HideMapTableButton_tab2').show();
            //    $('#ShowMapTableButton_tab2').hide();
            //    $('#Recent_Sales_Detail_tab2').show();
            //    $(window).resize();
            //}

            function HideMap_Table_tab3() {
                $('#HideMapTableButton_tab3').hide();
                $('#ShowMapTableButton_tab3').show();
                $('#Recent_Sales_Detail_tab3').hide();
            }

            function ShowMap_Table_tab3() {
                $('#HideMapTableButton_tab3').show();
                $('#ShowMapTableButton_tab3').hide();
                $('#Recent_Sales_Detail_tab3').show();
                $(window).resize();
            }

            function HideMap_Table_tab4() {
                $('#HideMapTableButton_tab4').hide();
                $('#ShowMapTableButton_tab4').show();
                $('#Recent_Sales_Detail_tab4').hide();
            }

            function ShowMap_Table_tab4() {
                $('#HideMapTableButton_tab4').show();
                $('#ShowMapTableButton_tab4').hide();
                $('#Recent_Sales_Detail_tab4').show();
                $(window).resize();
            }

            function HideMap_Table_tab5() {
                $('#HideMapTableButton_tab5').hide();
                $('#ShowMapTableButton_tab5').show();
                $('#Recent_Sales_Detail_tab5').hide();
            }

            function ShowMap_Table_tab5() {
                $('#HideMapTableButton_tab5').show();
                $('#ShowMapTableButton_tab5').hide();
                $('#Recent_Sales_Detail_tab5').show();
                $(window).resize();
            }

            function HideMap_Table_tab6() {
                $('#HideMapTableButton_tab6').hide();
                $('#ShowMapTableButton_tab6').show();
                $('#Recent_Sales_Detail_tab6').hide();
            }

            function ShowMap_Table_tab6() {
                $('#HideMapTableButton_tab6').show();
                $('#ShowMapTableButton_tab6').hide();
                $('#Recent_Sales_Detail_tab6').show();
                $(window).resize();
            }

            function HideMap_Table_tab7() {
                $('#HideMapTableButton_tab7').hide();
                $('#ShowMapTableButton_tab7').show();
                $('#Recent_Sales_Detail_tab7').hide();
            }

            function ShowMap_Table_tab7() {
                $('#HideMapTableButton_tab7').show();
                $('#ShowMapTableButton_tab7').hide();
                $('#Recent_Sales_Detail_tab7').show();
                $(window).resize();
            }

            function HideMap_Table_tab8() {
                $('#HideMapTableButton_tab8').hide();
                $('#ShowMapTableButton_tab8').show();
                $('#Recent_Sales_Detail_tab8').hide();
            }

            function ShowMap_Table_tab8() {
                $('#HideMapTableButton_tab8').show();
                $('#ShowMapTableButton_tab8').hide();
                $('#Recent_Sales_Detail_tab8').show();
                $(window).resize();
            }

            //function HideTP_Chart2_tab1() {
            //    $('#HideTaskProgressionChart2Button_tab1').hide();
            //    $('#ShowTaskProgressionChart2Button_tab1').show();
            //    $('#TaskProductionChart2_tab1').hide();
            //}

            //function HideTP_Chart2_tab2() {
            //    $('#HideTaskProgressionChart2Button_tab2').hide();
            //    $('#ShowTaskProgressionChart2Button_tab2').show();
            //    $('#TaskProductionChart2_tab2').hide();
            //}

            //function HideTP_Chart2_tab3() {
            //    $('#HideTaskProgressionChart2Button_tab3').hide();
            //    $('#ShowTaskProgressionChart2Button_tab3').show();
            //    $('#TaskProductionChart2_tab3').hide();
            //}

            //function HideTP_Chart2_tab4() {
            //    $('#HideTaskProgressionChart2Button_tab4').hide();
            //    $('#ShowTaskProgressionChart2Button_tab4').show();
            //    $('#TaskProductionChart2_tab4').hide();
            //}

            //function HideTP_Chart2_tab5() {
            //    $('#HideTaskProgressionChart2Button_tab5').hide();
            //    $('#ShowTaskProgressionChart2Button_tab5').show();
            //    $('#TaskProductionChart2_tab5').hide();
            //}

            //function HideTP_Chart2_tab6() {
            //    $('#HideTaskProgressionChart2Button_tab6').hide();
            //    $('#ShowTaskProgressionChart2Button_tab6').show();
            //    $('#TaskProductionChart2_tab6').hide();
            //}

            //function HideTP_Chart2_tab7() {
            //    $('#HideTaskProgressionChart2Button_tab7').hide();
            //    $('#ShowTaskProgressionChart2Button_tab7').show();
            //    $('#TaskProductionChart2_tab7').hide();
            //}

            //function HideTP_Chart2_tab8() {
            //    $('#HideTaskProgressionChart2Button_tab8').hide();
            //    $('#ShowTaskProgressionChart2Button_tab8').show();
            //    $('#TaskProductionChart2_tab8').hide();
            //}

            //function ShowTP_Chart2_tab1() {
            //    $('#HideTaskProgressionChart2Button_tab1').show();
            //    $('#ShowTaskProgressionChart2Button_tab1').hide();
            //    $('#TaskProductionChart2_tab1').show();
            //}

            //function ShowTP_Chart2_tab2() {
            //    $('#HideTaskProgressionChart2Button_tab2').show();
            //    $('#ShowTaskProgressionChart2Button_tab2').hide();
            //    $('#TaskProductionChart2_tab2').show();
            //}

            //function ShowTP_Chart2_tab3() {
            //    $('#HideTaskProgressionChart2Button_tab3').show();
            //    $('#ShowTaskProgressionChart2Button_tab3').hide();
            //    $('#TaskProductionChart2_tab3').show();
            //}

            //function ShowTP_Chart2_tab4() {
            //    $('#HideTaskProgressionChart2Button_tab4').show();
            //    $('#ShowTaskProgressionChart2Button_tab4').hide();
            //    $('#TaskProductionChart2_tab4').show();
            //}

            //function ShowTP_Chart2_tab5() {
            //    $('#HideTaskProgressionChart2Button_tab5').show();
            //    $('#ShowTaskProgressionChart2Button_tab5').hide();
            //    $('#TaskProductionChart2_tab5').show();
            //}

            //function ShowTP_Chart2_tab6() {
            //    $('#HideTaskProgressionChart2Button_tab6').show();
            //    $('#ShowTaskProgressionChart2Button_tab6').hide();
            //    $('#TaskProductionChart2_tab6').show();
            //}

            //function ShowTP_Chart2_tab7() {
            //    $('#HideTaskProgressionChart2Button_tab7').show();
            //    $('#ShowTaskProgressionChart2Button_tab7').hide();
            //    $('#TaskProductionChart2_tab7').show();
            //}

            //function ShowTP_Chart2_tab8() {
            //    $('#HideTaskProgressionChart2Button_tab8').show();
            //    $('#ShowTaskProgressionChart2Button_tab8').hide();
            //    $('#TaskProductionChart2_tab8').show();
            //}

            function ShowPC_Map_tab1() {
                Modal_Click();
                updatePC_Modal('NSB ALL', 'NSB All In Market', '%', '%', '%', "%", "ONAIR", "NSB");
            }

            //function ShowPC_Map_tab2() {
            //    Modal_Click();
            //    updatePC_Modal('MCA', '%', '%', '%', '%', "%", "ONAIR", "MCA");
            //}

            function ShowPC_Map_tab3() {
                Modal_Click();
                updatePC_Modal('CRAN ALL', 'CRAN Combined', 'CRAN 1C Node', '%', '%', "%", "ONAIR", "CRAN");
            }

            function ShowPC_Map_tab4() {
                Modal_Click();
                updatePC_Modal('5G mmWave ALL', '5G mmWave All Nodes', '%', '%', '%', "%", "ONAIR", "5GmmWave");
            }

            //function ShowPC_Map_tab5() {
            //    Modal_Click();
            //    updatePC_Modal('NSB ALL', 'NSB All In Market', '%', '%', '%', "%", "ONAIR", "NSB");
            //}

            //function ShowPC_Map_tab6() {
            //    Modal_Click();
            //    updatePC_Modal('NSB ALL', 'NSB All In Market', '%', '%', '%', "%", "ONAIR", "NSB");
            //}

            //function ShowPC_Map_tab7() {
            //    Modal_Click();
            //    updatePC_Modal('NSB ALL', 'NSB All In Market', '%', '%', '%', "%", "ONAIR", "NSB");
            //}

            //function ShowPC_Map_tab8() {
            //    Modal_Click();
            //    updatePC_Modal('NSB ALL', 'NSB All In Market', '%', '%', '%', "%", "ONAIR", "NSB");
            //}

            function ShowPushPullMap_tab1() {
                Modal3_Click_RYG();
                updateRYG_Modal3("Month", "ONAIR", "PULL", 'NSB ALL', 'NSB All In Market', '%', '%', '%', "_tab1", 'NSB');
            }

            //function ShowPushPullMap_tab2() {
            //    Modal3_Click_RYG();
            //    updateRYG_Modal3("Month", "ONAIR", "PULL", 'MCA', '%', '%', '%', '%', "_tab2");
            //} 

            function ShowPushPullMap_tab3() {
                Modal3_Click_RYG();
                updateRYG_Modal3("Month", "ONAIR", "PULL", 'CRAN ALL', 'CRAN Combined', 'CRAN 1C Node', '%', '%', "_tab3", 'CRAN Node');
            }

            function ShowPushPullMap_tab4() {
                Modal3_Click_RYG();
                updateRYG_Modal3("Month", "ONAIR", "PULL", '5G mmWave ALL', '5G mmWave All Nodes', '%', '%', '%', "_tab4", '5G mmWave');
            }

            //function ShowPushPullMap_tab5() {
            //    Modal3_Click_RYG();
            //    updateRYG_Modal3("Month", "ONAIR", "PULL", 'NSB ALL', 'NSB All In Market', '%', '%', '%', "_tab1");
            //} 

            //function ShowPushPullMap_tab6() {
            //    Modal3_Click_RYG();
            //    updateRYG_Modal3("Month", "ONAIR", "PULL", 'NSB ALL', 'NSB All In Market', '%', '%', '%', "_tab1");
            //}

            //function ShowPushPullMap_tab7() {
            //    Modal3_Click_RYG();
            //    updateRYG_Modal3("Month", "ONAIR", "PULL", 'NSB ALL', 'NSB All In Market', '%', '%', '%', "_tab1");
            //}

            //function ShowPushPullMap_tab8() {
            //    Modal3_Click_RYG();
            //    updateRYG_Modal3("Month", "ONAIR", "PULL", 'NSB ALL', 'NSB All In Market', '%', '%', '%', "_tab1");
            //}

            function loadDATADATE(data) {
                var score = JSON.parse(data.d);
                var value = score[0]["DATADATE"];
                document.getElementById('DATADATE').innerHTML = "Date of Data: " + value;

                executedon = value.substring(6, 10) + '-' + value.substring(0, 2) + value.substring(2, 5);
                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
                
                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var selected_d = new Date(pulldown_month);

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var selected_month = month[(selected_d.getMonth() + 13) % 12];

                value = new Date(value.replace("-", " ", "g"));
                var d = new Date(value);

                var curyear = d.getFullYear();

                curmonthspan = month[d.getMonth()];
                //alert("curmonthspan: " + curmonthspan);

                if (curmonthspan == "Jan") {
                    showcolumn = false; //showcolumn is a global variable used to hide cumulative columns if the data date is in January
                }

                var curyearClasses = document.getElementsByClassName('current_year');
                for (var i = 0; i < curyearClasses.length; i++) {
                    curyearClasses[i].innerHTML = curyearspan;
                }

                var curmonthClasses = document.getElementsByClassName('current_month');
                for (var i = 0; i < curmonthClasses.length; i++) {
                    curmonthClasses[i].innerHTML = curmonthspan;
                }                

                var selectedMonthClasses = document.getElementsByClassName('selected_month');
                for (var i = 0; i < selectedMonthClasses.length; i++) {
                    selectedMonthClasses[i].innerHTML = selected_month;
                }

                var marketClasses = document.getElementsByClassName('current_market');
                for (var i = 0; i < marketClasses.length; i++) {
                    marketClasses[i].innerHTML = marketspan;
                }

                var monthnum = d.getMonth() + 1; //Add 1 so that January = 1

                document.getElementById('<%= hf_FCCategory.ClientID %>').value = monthnum; //hidden value

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var time = "Last 90 days on air / +45 days forecasted";
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();

                console.log("loadDataDate function: " + pulldown_month);

                //Month_Fake_Click();

                SubmitButtonClick();

            }

        <%--function Month_Fake_Click(source, eventArgs) {
            var clickButton = document.getElementById("<%= ButtonFC.ClientID %>");
            clickButton.click();

            var delayInMilliseconds = 500; //500 ms

            setTimeout(function () {
                var pulldown_month_test = $('#<%= ddlMonth.ClientID %> option:selected').val();
                console.log("setTimeout Month Selected: " + pulldown_month_test);
                SubmitButtonClick();
            }, delayInMilliseconds);

        }--%>

            //Counts and GYR Section

            function updateProductionNumbers(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory) {

                var tabName = '_tab' + activeTabNumber;
                console.log('updateProductionNumber tabName: ' + tabName);

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();

                console.log('ProductionNumbers function start');
                console.log("ProductionNumbers_groupGeo: " + groupGeo);
                console.log("ProductionNumbers_marketGeo: " + marketGeo);
                console.log("ProductionNumbers_monthSelected: " + monthSelected);
                console.log("ProductionNumbers_pptp_custom_one: " + pptp_custom_one);
                console.log("ProductionNumbers_pptp_custom_two: " + pptp_custom_two);
                console.log("ProductionNumbers_pptp_custom_three: " + pptp_custom_three);
                console.log("ProductionNumbers_pptp_custom_four: " + pptp_custom_four);
                console.log("ProductionNumbers_pptp_custom_five: " + pptp_custom_five);

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetProductionNumbers",
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadProductionNumbers(data, marketGeo, monthSelected, tabName, tabCategory);
                        $('#LOADING_Quad1' + tabName).hide();
                        $('#Quad1' + tabName).show();
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetForecastBar",
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadForecastBar(data, tabName, tabCategory);
                    },
                    error: function (data) {
                    }
                });

            }

            function loadProductionNumbers(data, pulldown_region, pulldown_month, tabName, tabCategory) {

                console.log('loadProductionNumbers function start');

                data = JSON.parse(data.d);

                if (data.length <= 0) {
                    return;
                }
                else {
                    var PLAN = data[0]["CY_POE"];
                    var ACT = data[0]["CY_ACT"];
                    var FCST = data[0]["CY_FCST"];
                    var YTDPLAN = data[0]["YTD_PLAN"];
                    var ACTvsPLAN = ACT - YTDPLAN;
                    if (YTDPLAN == 0) {
                        var AVTvsPLAN_Perc = "-";
                    } else {
                        var AVTvsPLAN_Perc = ((ACT / YTDPLAN) * 100).toFixed(0);
                    }

                    var textcolor1; //variable for chart color assignments

                    if (ACTvsPLAN > 0) {
                        textcolor1 = '#008000'; //its green
                    } else if (ACTvsPLAN < 0) {
                        textcolor1 = '#ff0000'; //its red
                    } else {
                        textcolor1 = '#000000'; //its black
                    };

                    if (ACTvsPLAN > 0) {
                        var ACTvsPLANCheck = ACTvsPLAN;
                    }
                    else if (ACTvsPLAN < 0) {
                        var ACTvsPLANCheck = Math.abs(ACTvsPLAN);
                    }
                    else if (ACTvsPLAN == 0) {
                        var ACTvsPLANCheck = "";
                    };

                    document.getElementById('ACTvsPLAN' + tabName).innerHTML = ACTvsPLANCheck;
                    document.getElementById('ACT' + tabName).innerHTML = ACT;
                    document.getElementById('YTDPLAN' + tabName).innerHTML = YTDPLAN;
                    document.getElementById('ACTvsPLAN_Perc' + tabName).innerHTML = AVTvsPLAN_Perc;

                    if (ACTvsPLAN > 0) {
                        var AheadBehindCheck = "Ahead of Plan YTD";
                    }
                    else if (ACTvsPLAN < 0) {
                        var AheadBehindCheck = "Behind Plan YTD";
                    }
                    else if (ACTvsPLAN == 0) {
                        var AheadBehindCheck = "Exactly On Plan YTD";
                    };

                    document.getElementById('AheadBehind' + tabName).innerHTML = AheadBehindCheck;

                    if (PLAN == 0) {
                        var ACT_PER_OF_POE = "-";
                    } else {
                        var ACT_PER_OF_POE = ((ACT / PLAN) * 100).toFixed(0);
                    }

                    document.getElementById('ActVsPlanSection' + tabName).style.color = textcolor1;

                    data[0].ACT_PER_OF_POE = ACT_PER_OF_POE + "%"

                    document.getElementById('btn_CY_PUSH' + tabName).innerHTML = data[0]["CY_PUSH"];
                    document.getElementById('btn_CY_PULL' + tabName).innerHTML = data[0]["CY_PULL"];
                    var CY_PUSH_PERC = ((data[0]["CY_PUSH"] / PLAN) * 100).toFixed(1);
                    var CY_PULL_PERC = ((data[0]["CY_PULL"] / PLAN) * 100).toFixed(1);
                    document.getElementById('btn_CY_PUSH_perc_POE' + tabName).innerHTML = CY_PUSH_PERC;
                    document.getElementById('btn_CY_PULL_perc_POE' + tabName).innerHTML = CY_PULL_PERC;

                }

                //$(window).resize();

            }

            function loadForecastBar(data, tabName, tabCategory) {
                var score = JSON.parse(data.d); //parse your data
                var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
                var title = 'New Site Build';
                var poe = score[0]["POE"];
                var forecast = score[0]["FORECAST"];
                var ytdcomplete = score[0]["YTD_COMPLETE"];
                var fore1q = score[0]["FORE1Q"];
                var fore2q = score[0]["FORE2Q"];
                var fore3q = score[0]["FORE3Q"];
                var fore4q = score[0]["FORE4Q"];
                var planvsact = score[0]["PLANVSACT"];
                var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE"]).toFixed(0);
                var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE"]).toFixed(0);
                var short = score[0]["POE"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
                var planyear = score[0]["PLANYEAR"];

                createForecastBarChart('ForecastBar' + tabName, Number(value), title, poe, forecast, ytdcomplete, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear, tabName, tabCategory); //call my chart building function
            }

            /* FORECAST BAR CHART CREATER */
            function createForecastBarChart(container, value, title, poe, forecast, ytdcomplete, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear, tabName, tabCategory) {
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

                    var short2; //variable for chart color assignments

                    if (short <= 0) {
                        short2 = 0; //its green
                    } else {
                        short2 = short; //its red
                    }

                    subtitle = '<p style="font-size:22px; font-weight: bold; color:' + color101 + ';">' + planvsact + '<br><p style="font-size:16px; color:' + color101 + ';">to Plan' + '</p>'; //create the chart subtitle variable

                    Highcharts.chart(container, { //define the Highchart
                        colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                        chart: {
                            type: 'bar',
                            marginTop: 22,
                            //marginBottom: 0,
                            //pacingTop: 0,
                            //spacingBottom: 0
                        },
                        title: {
                            text: planyear + " Forecast",
                            style: {
                                fontSize: '12px',
                                fontWeight: 'bold'
                            }
                        },

                        tooltip: {
                            borderColor: '#000000',
                            headerFormat: '<span style="font-size:16px; font-weight: bold;">{point.key}</span><table>',
                            pointFormat: '<tr><td style="font-size:14px; color:{series.color}; padding:0;">{series.name}: </td>' +
                                '<td style="font-size:14px; font-weight: bold; padding:0; "><b>&nbsp;{point.y}</b></td>' +
                                '<td style="font-size:14px; font-weight: bold; padding:0; "><b>&nbsp;({point.percentage:.0f}%)</b></td></tr>',
                            footerFormat: '</table>',
                            shared: true,
                            outside: true,
                            useHTML: true,
                            backgroundColor: '#FFFFFF'
                        },

                        xAxis: {
                            categories: [tabCategory]
                        },
                        yAxis: {
                            title: {
                                text: null
                            },
                            endOnTick: false
                        },

                        legend: {
                            enabled: false
                        },
                        exporting: false,
                        plotOptions: {
                            series: {
                                stacking: 'normal',
                                pointWidth: 25,
                                dataLabels: {
                                    formatter: function () {

                                        if (this.series.name == 'Not ' + planyear + ' Forecasted') { return; }
                                        if (this.series.name == 'Actual') { return "A"; }
                                        else {
                                            return this.series.name.substring(0, 2);
                                        }

                                    },
                                    filter: {
                                        property: 'y',
                                        operator: '>',
                                        value: 0
                                    },
                                    enabled: true,
                                    align: 'center',
                                    inside: true,
                                    color: '#294469',
                                    shadow: false,
                                    style: { "fontSize": "10px", "textShadow": "0px" }
                                },
                            },
                        },
                        credits: { //gets rid of the highcharts.com link
                            enabled: false
                        },
                        series: [
                            {
                                name: 'Actual',
                                data: [ytdcomplete],
                                color: '#008000',
                                index: 5,
                                //zIndex: 5
                            }, {
                                name: '1Q Remaining Forecast',
                                data: [fore1q],
                                color: '#00008b',
                                index: 4,
                                //zIndex: 4
                            }, {
                                name: '2Q Remaining Forecast',
                                data: [fore2q],
                                color: '#0066cc',
                                index: 3,
                                //zIndex: 3
                            }, {
                                name: '3Q Remaining Forecast',
                                data: [fore3q],
                                color: '#4da6ff',
                                index: 2,
                                //zIndex: 2
                            }, {
                                name: '4Q Remaining Forecast',
                                data: [fore4q],
                                color: '#87cefa',
                                index: 1,
                                //zIndex: 1
                            },
                            {
                                name: 'Not ' + planyear + ' Forecasted',
                                data: [short2],
                                color: '#ff3333',
                                index: 0,
                                //zIndex: 0
                            }]

                    });
                });
            }

            // ********** recents START **********
            /*
            // Recent Upcoming
    
                1) User selects from pulldown, triggers updateRecentChart()
                2) updateRecentChart runs Get_Recent_Program_Count AJAX, triggers loadRecentData
                3) loadRecentData parses JSON, creates Top Count data table, when user click on a row it triggers updateRecentDetail
                4) updateRecentDetail runs Get_Recent_Detail AJAX, triggers loadRecentDetail
                5) loadRecentDetail parses JSON, creates Bottom detail data table, triggers RecentMap
                6) Recent Map stores the values from the bottom detail table in an array, removes jobs with missing lat longs, assigns jobs to On Air or Upcoming, Creates the map
            */

            var recent_lat_index = 26; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var recent_long_index = 27; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat

            function updateSalesChart(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory, market, time, market_long) {
                console.log('updateSalesChart function start');

                var tabName = '_tab' + activeTabNumber;

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();
                var month = monthSelected.substring(0, 7);
                var RecentMS = 'ONAIR';

                console.log('Map function start');
                console.log("Map_groupGeo: " + groupGeo);
                console.log("Map_marketGeo: " + marketGeo);
                console.log("Map_monthSelected: " + monthSelected);
                console.log("Map_month: " + month);
                console.log("Map_RecentMS: " + RecentMS);
                console.log("Map_pptp_custom_one: " + pptp_custom_one);
                console.log("Map_pptp_custom_two: " + pptp_custom_two);
                console.log("Map_pptp_custom_three: " + pptp_custom_three);
                console.log("Map_pptp_custom_four: " + pptp_custom_four);
                console.log("Map_pptp_custom_five: " + pptp_custom_five);

                //var geturl1 = "Production_Insights_2020.aspx/Get_Recent_Sales_Detail";
                //var times = 6;
                //var async_request = [];
                //var responses = [];
                //for (var i = 1; i <= times; i++) {
                //    async_request.push(
                //        $.ajax({
                //            type: "POST",
                //            async: true,
                //            url: geturl1 + "_" + i,
                //            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                //            dataType: "json",
                //            contentType: "application/json; charset=utf-8",
                //            success: function (data) {
                //                console.log('success of ajax response Get_Recent_Sales_Detail')
                //                responses.push(data.d);
                //            }
                //        })
                //    );
                //}

                //$.when.apply(undefined, async_request).done(function () {
                //    dataConcat_6string_map(responses[0], responses[1], responses[2], responses[3], responses[4], responses[5], market, time, market_long, RecentMS, tabName, tabCategory);
                //    console.log('all request completed')
                //});

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_Recent_Sales_Detail_1",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data1 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_Recent_Sales_Detail_2",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data2 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_Recent_Sales_Detail_3",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data3 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_Recent_Sales_Detail_4",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data4 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_Recent_Sales_Detail_5",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data5 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_Recent_Sales_Detail_6",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'timeVariable': monthSelected, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data6 = data.d
                        }
                    }),

                ).then(function () {
                    dataConcat_6string_map(data1, data2, data3, data4, data5, data6, market, time, market_long, RecentMS, tabName, tabCategory);
                    console.log('all request completed')
                });

            }

            function dataConcat_6string_map(data1, data2, data3, data4, data5, data6, market, time, market_long, RecentMS, tabName, tabCategory) {
                var dataConcat6;

                if (data2 == '[]') {  // if only 1 job
                    dataConcat6 = data1;
                }
                else if (data3 == '[]') {  // if only 2 jobs
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length);
                    dataConcat6 = data1 + ',' + data2;
                }
                else if (data4 == '[]') {  // if only 3 jobs
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length - 1);
                    data3 = data3.substring(1, data3.length);
                    dataConcat6 = data1 + ',' + data2 + ',' + data3;
                }
                else if (data5 == '[]') {  // if only 4 jobs
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length - 1);
                    data3 = data3.substring(1, data3.length - 1);
                    data4 = data4.substring(1, data4.length);
                    dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
                }
                else if (data6 == '[]') {  // if only 5 jobs
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length - 1);
                    data3 = data3.substring(1, data3.length - 1);
                    data4 = data4.substring(1, data4.length - 1);
                    data5 = data5.substring(1, data5.length);
                    dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5;
                }
                else {  // 6 or more jobs
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length - 1);
                    data3 = data3.substring(1, data3.length - 1);
                    data4 = data4.substring(1, data4.length - 1);
                    data5 = data5.substring(1, data5.length - 1);
                    data6 = data6.substring(1, data6.length);
                    dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6;
                }

                console.log('Quad 3 Data:');
                console.log(dataConcat6.length);

                loadSalesData(dataConcat6, market, time, market_long, RecentMS, tabName, tabCategory);

            }

            function loadSalesData(data, market, time, market_long, RecentMS, tabName, tabCategory) {

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').text();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').text();
                var exportVariableTitle = tabCategory + '_' + monthSelected + '_' + groupGeo + '_' + marketGeo;
               

                console.log('loadSalesData function start');

                if (data == '[]') {
                    $('#LOADING_Quad3' + tabName).hide();
                    $('#Quad3' + tabName).hide();
                    $('#NoData' + tabName).show();
                    //$('#salesmapdiv' + tabName).hide();

                } else {

                    data = JSON.parse(data);

                    if (data.length <= 0) {
                        return;
                    }
                    else {

                        $('#Sales_Detail' + tabName).dataTable().fnDestroy(); //destroy old table
                        $.fn.dataTable.moment('MM-DD-YYYY');
                        $('#Sales_Detail' + tabName).DataTable({ //build new table
                            orderCellsTop: false,
                            fixedHeader: false,
                            paging: false,
                            sort: true,
                            scrollY: 200,
                            scrollCollapse: true,
                            scrollX: true,
                            order: [[0, "asc"]],
                            searching: true,
                            data: data,
                            info: false,
                            binfo: true,
                            dom: 'Bfrtip',
                            buttons: [{ extend: 'csv', title: exportVariableTitle, text: 'Export to Excel', titleAttr: 'Export job detail data table to Excel' }, {
                                text: 'Update Map',
                                titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                                action: function (e, dt, node, config) {
                                    MapOverlay(market, time, market_long, RecentMS, tabName);
                                }
                            }
                                //,
                                //{
                                //    text: 'Clear Filters',
                                //    titleAttr: 'Clear filters from the bottom of the table below',
                                //    action: function (e, dt, node, config) {                                        

                                //        var table = $('#Sales_Detail' + tabName).DataTable();
                                //        table
                                //            .search('')
                                //            .columns().search('')                                            
                                //            .draw();

                                //        //$('#Sales_Detail_tab1 tfoot input').val('').change();

                                //        //$.fn.dataTable.ext.search = [];
                                //        //$.fn.dataTable.ext.search.pop();
                                //        //table.draw();

                                //        //$('#Sales_Detail' + tabName).DataTable().columns().appendTo($(column.footer()).empty());
                                        
                                //        //function () {
                                //        //    this.api().columns().every(function () {
                                //        //        var column = this;
                                //        //        var select = $('<select><option value=""></option></select>')
                                //        //            .appendTo($(column.footer()).empty())
                                //        //            .on('change', function () {
                                //        //                var val = $.fn.dataTable.util.escapeRegex(
                                //        //                    $(this).val()
                                //        //                );

                                //        //                column
                                //        //                    .search(val ? '^' + val + '$' : '', true, false)
                                //        //                    .draw();
                                //        //            });

                                //        //        column.data().unique().sort().each(function (d, j) {
                                //        //            select.append('<option value="' + d + '">' + d + '</option>')
                                //        //        });
                                //        //    });
                                //        //}
                                        
                                //        MapOverlay(market, time, market_long, RecentMS, tabName);
                                //    }
                                //}
                            ],
                            //columnDefs: [{ visible: false, targets: 8 }],
                            columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                                { 'data': 'CATEGORY' },
                                { 'data': 'PACE_NUMBER' },
                                { 'data': 'PACE_NAME_SHORT' },
                                { 'data': 'PROGRAM' },
                                { 'data': 'SUBPROGRAM' },
                                { 'data': 'SUBPROGRAM2' },
                                { 'data': 'SUBPROGRAM3' },
                                { 'data': 'SUBPROGRAM4' },
                                //{ 'data': 'SUBGROUP' },
                                { 'data': 'SALES_REGION' },
                                { 'data': 'SALES_VPGM_MARKET' },
                                { 'data': 'RAN_REGION' },
                                { 'data': 'RAN_AVP' },
                                { 'data': 'RAN_MARKET' },
                                { 'data': 'RAN_SUBMARKET' },
                                { 'data': 'STATE' },
                                { 'data': 'COUNTY' },
                                { 'data': 'CITY' },
                                { 'data': 'ZIP_CODE' },
                                { 'data': 'RAN_INITIATIVE' },
                                { 'data': 'SPECTRUM' },
                                { 'data': 'ISSUED_DATE' },
                                { 'data': RecentMS + '_PLAN' },
                                { 'data': RecentMS + '_FORECAST' },
                                { 'data': RecentMS + '_ACTUAL' },
                                { 'data': 'USID' },
                                { 'data': 'FA_CODE' },
                                { 'data': 'LATITUDE' },
                                { 'data': 'LONGITUDE' },
                                { 'data': 'PACE_NAME_LONG' }

                            ],

                            //Highlight rows that don't have lat longs in the detail table in Red
                            createdRow: function (row, data, index) {
                                if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                                    $(row).addClass('highlightRed');
                                }
                            },

                            "fnDrawCallback": function () {
                                $('#Sales_Detail' + tabName + ' tr').find('td').each(function () {
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

                    

                    MapOverlay(market, time, market_long, RecentMS, tabName, tabCategory);

                    function MapOverlay() {
                        var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                        var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                        if (groupGeo == "ACE") {
                            if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                                $.getJSON("RAN_Regions_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    console.log('MarketBoundaryData: ' + MarketBoundaryData);
                                    prep(MarketBoundaryData);
                                });
                            } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                                | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                                $.getJSON("RAN_AVP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            } else {
                                $.getJSON("RAN_Markets_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            }
                        }
                        else {
                            $.getJSON("VPGM_Markets_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        }

                        function prep(MarketBoundaryData) {
                            console.log('prep: ' + MarketBoundaryData);
                            salesMap(market, time, market_long, RecentMS, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory);
                        };

                    }
                }
            }

            function salesMap(market, time, market_long, RecentMS, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory) {

                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();

                var d = new Date(pulldown_month);

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var month_current = month[(d.getMonth() + 13) % 12];
                var month_minus_one = month[(d.getMonth() + 12) % 12];
                var month_minus_two = month[(d.getMonth() + 11) % 12];

                var selectedMonthName = $('#<%= ddlMonth.ClientID %> option:selected').text();

                var recentSelectedCount = $('#Sales_Detail' + tabName).get(0).lastChild.childElementCount;
                console.log('recentSelectedCount: ' + recentSelectedCount);
                var recentDetailColCount = $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childElementCount;
                console.log('recentDetailColCount: ' + recentDetailColCount);

                var j = 0;
                var i = 0;

                //console.log(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

                //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                var maxlat = parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
                var minlat = parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
                var maxlong = parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
                var minlong = parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

                if (isNaN(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
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
                    concatlatlong[i] = $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                    if (isNaN(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                        //dont adjust max min based on NaN
                        NaNcount++;
                    }

                    else {
                        maxlat = Math.max(maxlat, parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                        minlat = Math.min(minlat, parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                        maxlong = Math.max(maxlong, parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                        minlong = Math.min(minlong, parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                    }


                    for (j = 0; j < recentDetailColCount; j++) {
                        //console.log($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                        recentFilteredTable[i][j] = $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                    }

                    //console.log(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));

                    if (isNaN(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                        //dont map if lat or long is NaN
                        ;
                    }

                    //else if ($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                    else if ($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'ACTUAL') {

                        for (k = 0; k < recentDetailColCount; k++) {
                            recentOnAirTable[onairindex][k] = $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            //console.log('recentOnAirTable' + $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[k].innerHTML)
                        }

                        onairindex++;
                    }
                    else if ($('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'REMAINING FORECASTED') {

                        for (l = 0; l < recentDetailColCount; l++) {
                            recentUpcomingTable[upcomingindex][l] = $('#Sales_Detail' + tabName).get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
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

                //document.getElementById('mapcounttitle').innerHTML = market_long + " - New Site Build";                
                //document.getElementById('mapcountsubtitle2').innerHTML = selectedMonthName + ' Remaining Forecasted: ' + recentUpcomingTable.length;
                //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;
                var series1name = month_current + ' Actual (' + recentOnAirTable.length + ')';
                var series2name = month_current + ' Remaining (' + recentUpcomingTable.length + ')';                

                var OApoints = new L.layerGroup();
                var Uppoints = new L.layerGroup();
                for (i in recentOnAirTable) {

                    var popup = '<b>On-Air Date:</b> ' + recentOnAirTable[i][23] + ' (Actual)' +
                        '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + recentOnAirTable[i][28] +
                        '<br/><b>Program:</b> ' + recentOnAirTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                        '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][8] + 
                        '<br/><b>Sales VPGM Market:</b> ' + recentOnAirTable[i][9] +
                        '<br/><b>ACE Region - AVP:</b> ' + recentOnAirTable[i][11] +
                        '<br/><b>ACE Market:</b> ' + recentOnAirTable[i][12] +
                        '<br/><b>ACE Submarket:</b> ' + recentOnAirTable[i][13] +
                        '<br/><b>City, State:</b> ' + recentOnAirTable[i][16] + ', ' + recentOnAirTable[i][14] +
                        '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][17] +
                        '<br/><b>County:</b> ' + recentOnAirTable[i][15] +
                        '<br/><b>Issued Date:</b> ' + recentOnAirTable[i][20] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + recentOnAirTable[i][21] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + recentOnAirTable[i][22] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + recentOnAirTable[i][23] +
                        '<br/><b>USID:</b> ' + recentOnAirTable[i][24] + 
                        '<br/><b>FA Code:</b> ' + recentOnAirTable[i][25] +
                        '<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +  
                        '<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index],

                        loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],     //position found
                        recentOnAirTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#008000'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup, { 'maxWidth': '250', 'maxHeight': '120' });
                    OApoints.addLayer(marker);
                }

                for (i = 0; i < recentUpcomingTable.length; i++) {

                    var popup = '<b>On-Air Date:</b> ' + recentUpcomingTable[i][22] + ' (Forecast)' +
                        '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + recentUpcomingTable[i][28] +
                        '<br/><b>Program:</b> ' + recentUpcomingTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                        '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][8] +
                        '<br/><b>Sales VPGM Market:</b> ' + recentUpcomingTable[i][9] +
                        '<br/><b>ACE Region - AVP:</b> ' + recentUpcomingTable[i][11] +
                        '<br/><b>ACE Market:</b> ' + recentUpcomingTable[i][12] +
                        '<br/><b>ACE Submarket:</b> ' + recentUpcomingTable[i][13] +
                        '<br/><b>City, State:</b> ' + recentUpcomingTable[i][16] + ', ' + recentUpcomingTable[i][14] +
                        '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][17] +
                        '<br/><b>County:</b> ' + recentUpcomingTable[i][15] +
                        '<br/><b>Issued Date:</b> ' + recentUpcomingTable[i][20] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + recentUpcomingTable[i][21] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + recentUpcomingTable[i][22] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + recentUpcomingTable[i][23] +
                        '<br/><b>USID:</b> ' + recentUpcomingTable[i][24] +
                        '<br/><b>FA Code:</b> ' + recentUpcomingTable[i][25] +
                        '<br/><b>Latitude:</b> ' + recentUpcomingTable[i][recent_lat_index] +
                        '<br/><b>Longitude:</b> ' + recentUpcomingTable[i][recent_long_index],

                        loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],            //position found
                        recentUpcomingTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#002280'
                        };
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup, { 'maxWidth': '250', 'maxHeight': '120' });
                    Uppoints.addLayer(marker);
                }                

                $('#LOADING_Quad3' + tabName).hide();
                $('#NoData' + tabName).hide();
                $('#Quad3' + tabName).show();

                document.getElementById('salesmapdiv' + tabName).innerHTML = "<div id='salesmapid" + tabName + "' style='height: 350px;'></div>";

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
                        //streets = L.tileLayer('https://a.tile.openstreetmap.org/${z}/${x}/${y}.png', {
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

                var map = L.map('salesmapid' + tabName, {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, OApoints, Uppoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                //********** new add geojson layer section **********            

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
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            featureLayer.bindPopup(feature.properties.Region);
                        }
                        else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            featureLayer.bindPopup(feature.properties.AVP);
                        }
                        else {
                            featureLayer.bindPopup(feature.properties.Market_Lon);
                        }
                    } else {
                        featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: style,
                    onEachFeature: onEachFeature
                }).addTo(map);

                //********** new add geojson layer section end **********

                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };
                var control = L.control.zoomBox(options);

                map.addControl(control);

                L.control.scale({ position: 'bottomright', metric: false }).addTo(map);

                if (groupGeo == "ACE") {
                    if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                        var overlays = {
                            "ACE Region Borders": MarketBoundaryLayer
                        };
                    } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                        | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                        var overlays = {
                            "ACE AVP Borders": MarketBoundaryLayer
                        };
                    }
                    else {
                        var overlays = {
                            "ACE Market Borders": MarketBoundaryLayer
                        };
                    }
                } else {
                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer
                    };
                }

                overlays[series1name] = OApoints;
                overlays[series2name] = Uppoints;

                L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                map.invalidateSize();
                map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                function getColor(d) {
                    return d === series1name ? "#008000" :
                        d === series2name ? "#002280" :
                            "#6bd16b";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'info legend');


                    categories = [series1name, series2name];
                    
                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);
            }

            $('.nav-tabs li').click(function () {
                $(window).resize();
                $(window).resize();
            });

            // ********** PRODUCTION CURVE MODAL START **********

            var PC_recent_lat_index = 23; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var PC_recent_long_index = 24; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long        

            function updatePC_Modal(pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, monthSelected, RecentMS, tabCategory) {
                console.log('updatePC_Modal Start');
                $('#LOADING_PC_Modal').show();
                $('#recentPC_ModalDetailSection1').hide();
                $('#recentPC_ModalDetailSection2').hide();

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                var monthSelected = monthSelected;
                var RecentMS = RecentMS;
                var RecentMStext = RecentMS;
                var RecentGroup = RecentMS;
                var rowSelected = RecentMS;
                var days = RecentMS;

                document.getElementById('Recent_PlanMS_Header').innerHTML = RecentMS + ' Plan';
                document.getElementById('Recent_ForecastMS_Header').innerHTML = RecentMS + ' Forecast';
                document.getElementById('Recent_ActualMS_Header').innerHTML = RecentMS + ' Actual';

                console.log("PC_Modal groupVariable: " + groupGeo);
                console.log("PC_Modal marketVariable: " + marketGeo);
                console.log("PC_Modal monthVariable: " + monthSelected);
                console.log("PC_Modal pptpOneVariable: " + pptp_custom_one);
                console.log("PC_Modal pptpTwoVariable: " + pptp_custom_two);
                console.log("PC_Modal pptpThreeVariable: " + pptp_custom_three);
                console.log("PC_Modal pptpFourVariable: " + pptp_custom_four);
                console.log("PC_Modal pptpFiveVariable: " + pptp_custom_five);
                console.log("PC_Modal RecentMSVariable: " + RecentMS);

                //var geturl1 = "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL";
                //var times = 6;
                //var async_request = [];
                //var responses = [];
                //for (var i = 1; i <= times; i++) {
                //    async_request.push(
                //        $.ajax({
                //            type: "POST",
                //            async: true,
                //            url: geturl1 + "_" + i,
                //            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                //            dataType: "json",
                //            contentType: "application/json; charset=utf-8",
                //            success: function (data) {
                //                console.log('success of ajax response')
                //                responses.push(data.d);
                //            }
                //        })
                //    );
                //}

                //$.when.apply(undefined, async_request).done(function () {
                //    dataConcat_6string_map(responses[0], responses[1], responses[2], responses[3], responses[4], responses[5], RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory);
                //    console.log('all request completed')
                //});

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL_1",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data1 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL_2",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data2 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL_3",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data3 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL_4",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data4 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL_5",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data5 = data.d
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/GetPRODUCTION_CURVE_MODAL_6",
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five, 'RecentMSVariable': RecentMS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            console.log('success of ajax response Get_Recent_Sales_Detail')
                            data6 = data.d
                        }
                    }),

                )
                    .then(function () {
                        dataConcat_6string_map(data1, data2, data3, data4, data5, data6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory);
                        console.log('all request completed')
                    });

                function dataConcat_6string_map(data1, data2, data3, data4, data5, data6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory) {
                    var dataConcat6;

                    if (data2 == '[]') {  // if only 1 job
                        dataConcat6 = data1;
                    }
                    else if (data3 == '[]') {  // if only 2 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length);
                        dataConcat6 = data1 + ',' + data2;
                    }
                    else if (data4 == '[]') {  // if only 3 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3;
                    }
                    else if (data5 == '[]') {  // if only 4 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length - 1);
                        data4 = data4.substring(1, data4.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
                    }
                    else if (data6 == '[]') {  // if only 5 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length - 1);
                        data4 = data4.substring(1, data4.length - 1);
                        data5 = data5.substring(1, data5.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5;
                    }
                    else {  // 6 or more jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length - 1);
                        data4 = data4.substring(1, data4.length - 1);
                        data5 = data5.substring(1, data5.length - 1);
                        data6 = data6.substring(1, data6.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6;
                    }

                    load_PC_Modal_Detail(dataConcat6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory); //function in frontpage below, 
                }

            }

            function load_PC_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory) {  // Recent and Upcoming Detail after user clicks on a row

                data = JSON.parse(data);
                // $.fn.dataTable.moment('MM-DD-YYYY');            
                //$('#footer2').show();

                if (data.length <= 0) {
                    return;
                }
                else {
                    //var sitename = data[0]["SITE_NAME"];
                    $('#PC_Modal_Recent_Detail').dataTable().fnDestroy(); //destroy old table
                    $.fn.dataTable.moment('MM-DD-YYYY');
                    $('#PC_Modal_Recent_Detail').DataTable({ //build new table                
                        orderCellsTop: false,
                        fixedHeader: false,
                        paging: false,
                        sort: true,
                        scrollY: 200,
                        scrollCollapse: true,
                        scrollX: true,
                        order: [[23, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                        searching: true,
                        data: data,
                        info: false,
                        binfo: true,
                        dom: 'Bfrtip',
                        buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                            text: 'Update Map',
                            titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                            action: function (e, dt, node, config) {
                                MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory);
                            }
                        }],
                        //columnDefs: [{ visible: false, targets: 8 }],
                        columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                            { 'data': 'CATEGORY' },
                            { 'data': 'PACE_NUMBER' },
                            { 'data': 'PACE_NAME_SHORT' },
                            { 'data': 'PROGRAM' },
                            { 'data': 'SUBPROGRAM' },
                            { 'data': 'SUBPROGRAM2' },
                            { 'data': 'SUBPROGRAM3' },
                            { 'data': 'SUBPROGRAM4' },
                            { 'data': 'SUBGROUP' },
                            { 'data': 'SALES_REGION' },
                            { 'data': 'SALES_VPGM_MARKET' },
                            { 'data': 'RAN_REGION' },
                            { 'data': 'RAN_AVP' },
                            { 'data': 'RAN_MARKET' },
                            { 'data': 'RAN_SUBMARKET' },
                            { 'data': 'STATE' },
                            { 'data': 'COUNTY' },
                            { 'data': 'CITY' },
                            { 'data': 'ZIP_CODE' },
                            { 'data': 'RAN_INITIATIVE' },
                            { 'data': 'SPECTRUM' },
                            { 'data': 'ISSUED_DATE' },
                            { 'data': RecentMS + '_PLAN' },
                            { 'data': RecentMS + '_FORECAST' },
                            { 'data': RecentMS + '_ACTUAL' },
                            { 'data': 'USID' },
                            { 'data': 'FA_CODE' },
                            { 'data': 'LATITUDE' },
                            { 'data': 'LONGITUDE' },
                            { 'data': 'PACE_NAME_LONG' }

                        ],


                        //Highlight rows that don't have lat longs in the detail table in Red
                        createdRow: function (row, data, index) {
                            if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                                $(row).addClass('highlightRed');
                            }
                        },

                        "fnDrawCallback": function () {
                            $('#PC_Modal_Recent_Detail tr').find('td').each(function () {
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

                $('#recentPC_ModalDetailSection2').show();
                
                $(window).resize();

                MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory);

                function MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory) {
                    var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                    var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            $.getJSON("RAN_Regions_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            $.getJSON("RAN_AVP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        } else {
                            $.getJSON("RAN_Markets_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        }
                    }
                    else {
                        $.getJSON("VPGM_Markets_geojson_042720_FME.json", function (data) {
                            MarketBoundaryData = data;
                            prep(MarketBoundaryData);
                        });
                    }

                    function prep(MarketBoundaryData) {
                        console.log(MarketBoundaryData);
                        recent_PC_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory, MarketBoundaryData, groupGeo, marketGeo);
                    };
                }

            }

            function recent_PC_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, tabCategory, MarketBoundaryData, groupGeo, marketGeo) {

                var PC_recent_lat_index = 27; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
                var PC_recent_long_index = 28; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

                var MSSelected = "RECENT " + RecentMS;
                var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var selectedMonthName = $('#<%= ddlMonth.ClientID %> option:selected').text();

                var recentSelectedCount = $("#PC_Modal_Recent_Detail").get(0).lastChild.childElementCount;
                var recentDetailColCount = $("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childElementCount;

                console.log('Testpoint');
                console.log(recentSelectedCount);
                console.log(recentDetailColCount);

                var j = 0;
                var i = 0;

                //console.log(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

                //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                var maxlat = parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[PC_recent_lat_index].innerHTML);
                var minlat = parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[PC_recent_lat_index].innerHTML);
                var maxlong = parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[PC_recent_long_index].innerHTML);
                var minlong = parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[PC_recent_long_index].innerHTML);

                if (isNaN(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[PC_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[PC_recent_long_index].innerHTML))) {
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
                var NancountMessage = '';

                //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
                for (i = 0; i < recentSelectedCount; i++) {
                    recentFilteredTable[i] = [];
                    recentUpcomingTable[upcomingindex] = [];
                    recentOnAirTable[onairindex] = [];
                    concatlatlong[i] = $("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_lat_index].innerHTML + $("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_long_index].innerHTML;

                    if (isNaN(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_long_index].innerHTML))) {
                        //dont adjust max min based on NaN
                        NaNcount++;
                    }

                    else {
                        maxlat = Math.max(maxlat, parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_lat_index].innerHTML));
                        minlat = Math.min(minlat, parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_lat_index].innerHTML));
                        maxlong = Math.max(maxlong, parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_long_index].innerHTML));
                        minlong = Math.min(minlong, parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_long_index].innerHTML));
                    }


                    for (j = 0; j < recentDetailColCount; j++) {
                        //console.log($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                        recentFilteredTable[i][j] = $("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                    }

                    //console.log(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_lat_index].innerHTML));

                    if (isNaN(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[PC_recent_long_index].innerHTML))) {
                        //dont map if lat or long is NaN
                        ;
                    }

                    else if ($("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                        for (k = 0; k < recentDetailColCount; k++) {
                            recentOnAirTable[onairindex][k] = $("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        }

                        onairindex++;
                    }
                    else {
                        for (l = 0; l < recentDetailColCount; l++) {
                            recentUpcomingTable[upcomingindex][l] = $("#PC_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
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

                if (monthSelected == '%') {
                    monthSelectedtext = 'Current Year'
                }
                else {
                    monthSelectedtext = monthSelected
                }

                var modal_title = salesGeo + ' ' + tabCategory + ' Map - ' + monthSelectedtext + ' Forecast (' + (recentFilteredTable.length + NaNcount) + ')';
                var modal_subtitle = ' Completed (' + recentOnAirTable.length + ') , Remaining Forecasted (' + recentUpcomingTable.length + ')';
                if (NaNcount > 0) { modal_subtitle += ' , Missing Lat/Long (' + NaNCount + ')'; }

                document.getElementById('PC_Modal_mapcounttitle').innerHTML = modal_title;
                document.getElementById('PC_Modal_mapcountsubtitle').innerHTML = modal_subtitle;
                //document.getElementById('PC_Modal_mapcounttitle').innerHTML = salesGeo + ' Production Curve ' + tabCategory + ' Map';
                //document.getElementById('PC_Modal_mapcountsubtitle').innerHTML = monthSelectedtext + ' Actual and Remaining Forecasted';

                //document.getElementById('PC_Modal_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
                document.getElementById('PC_Modal_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                document.getElementById('PC_Modal_mapcountfooter2').innerHTML = NaNcountMessage;

                var OApoints = new L.layerGroup();
                var Uppoints = new L.layerGroup();

                console.log('test 1');
                console.log(recentOnAirTable);
                for (i in recentOnAirTable) {

                    var popup = '<b>Category:</b> ' + recentOnAirTable[i][0] +
                        '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + recentOnAirTable[i][26] +
                        '<br/><b>Program:</b> ' + recentOnAirTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + recentOnAirTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + recentOnAirTable[i][9] + '- ' + recentOnAirTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + recentOnAirTable[i][12] +
                        '<br/><b>Market:</b> ' + recentOnAirTable[i][13] +
                        '<br/><b>Submarket:</b> ' + recentOnAirTable[i][14] +
                        '<br/><b>City, State:</b> ' + recentOnAirTable[i][17] + ', ' + recentOnAirTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + recentOnAirTable[i][16] + ', ' + recentOnAirTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + recentOnAirTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + recentOnAirTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + recentOnAirTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + recentOnAirTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + recentOnAirTable[i][25] + ', ' + recentOnAirTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + recentOnAirTable[i][PC_recent_lat_index] + ', ' + recentOnAirTable[i][PC_recent_long_index],

                        loc = [parseFloat(recentOnAirTable[i][PC_recent_lat_index]), parseFloat(recentOnAirTable[i][PC_recent_long_index])],	//position found
                        recentOnAirTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            //borderColor: '#008000'
                            borderColor: '#2E8B57'
                        };

                    console.log('test2');
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    OApoints.addLayer(marker);
                }

                console.log('test3');

                for (i = 0; i < recentUpcomingTable.length; i++) {

                    var popup = '<b>Category:</b> ' + recentUpcomingTable[i][0] +
                        '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + recentUpcomingTable[i][26] +
                        '<br/><b>Program:</b> ' + recentUpcomingTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + recentUpcomingTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + recentUpcomingTable[i][9] + '- ' + recentUpcomingTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + recentUpcomingTable[i][12] +
                        '<br/><b>Market:</b> ' + recentUpcomingTable[i][13] +
                        '<br/><b>Submarket:</b> ' + recentUpcomingTable[i][14] +
                        '<br/><b>City, State:</b> ' + recentUpcomingTable[i][17] + ', ' + recentUpcomingTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + recentUpcomingTable[i][16] + ', ' + recentUpcomingTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + recentUpcomingTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + recentUpcomingTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + recentUpcomingTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + recentUpcomingTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + recentUpcomingTable[i][25] + ', ' + recentUpcomingTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + recentUpcomingTable[i][PC_recent_lat_index] + ', ' + recentUpcomingTable[i][PC_recent_long_index],

                        loc = [parseFloat(recentUpcomingTable[i][PC_recent_lat_index]), parseFloat(recentUpcomingTable[i][PC_recent_long_index])],	//position found
                        recentUpcomingTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            //borderColor: '#002280'
                            borderColor: '#1E90FF'
                        };
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    Uppoints.addLayer(marker);
                }

                $('#LOADING_PC_Modal').hide();
                //$('#Recent_Top_Section').show();
                $('#recentPC_ModalDetailSection1').show();

                document.getElementById('PC_Modal_mapdiv').innerHTML = "<div id='PC_Modal_mapid' style='height: 435px;'></div>";

                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    "Satelite": sat
                    //"Topo": topo
                };

                var map = L.map("PC_Modal_mapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, OApoints, Uppoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                //********** new add geojson layer section **********

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
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            featureLayer.bindPopup(feature.properties.Region);
                        }
                        else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            featureLayer.bindPopup(feature.properties.AVP);
                        }
                        else {
                            featureLayer.bindPopup(feature.properties.Market_Lon);
                        }
                    } else {
                        featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: style,
                    onEachFeature: onEachFeature
                }).addTo(map);

                //********** new add geojson layer section **********

                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };
                var control = L.control.zoomBox(options);

                map.addControl(control);

                L.control.scale({ position: 'bottomright', metric: false }).addTo(map);

                if (groupGeo == "ACE") {
                    if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                        var overlays = {
                            "ACE Region Borders": MarketBoundaryLayer,
                            "Recently Completed": OApoints,
                            "Upcoming Forecasted": Uppoints
                        };
                    } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                        | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                        var overlays = {
                            "ACE AVP Borders": MarketBoundaryLayer,
                            "Recently Completed": OApoints,
                            "Upcoming Forecasted": Uppoints
                        };
                    } else {
                        var overlays = {
                            "ACE Market Borders": MarketBoundaryLayer,
                            "Recently Completed": OApoints,
                            "Upcoming Forecasted": Uppoints
                        };
                    }
                } else {
                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer,
                        "Recently Completed": OApoints,
                        "Upcoming Forecasted": Uppoints
                    };
                }

                L.control.layers(baseLayers, overlays).addTo(map);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                map.invalidateSize();
                map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                function getColor(d) {
                    return d === 'Recently Completed' ? "#2E8B57" :
                        d === 'Upcoming Forecasted' ? "#1E90FF" :
                            "#ffffff";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'info legend_PC');
                    categories = ['Recently Completed', 'Upcoming Forecasted'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

            }

            // ********** PRODUCTION CURVE MODAL END **********

            // ********** RYG MODAL START **********

            var RYG_recent_lat_index = 24; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var RYG_recent_long_index = 25; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

            function updateRYG_Modal(monthSelected, RecentMS, cellSelected, PlanFcst, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory) {

                console.log("updateRYG_Modal Start");
                $('#LOADING_RYG_Modal').show();
                $('#RYG_Modal_NoData').hide();
                $('#recentRYG_ModalDetailSection1').hide();
                $('#recentRYG_ModalDetailSection2').hide();

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();

                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
                console.log('histcount pulldown month: ' + pulldown_month);

                var stringyearnum = pulldown_month.substring(0, 4);

                if (pulldown_month.substring(5, 6) == 0) {
                    stringmonthnum = pulldown_month.substring(6, 7);
                }

                else {
                    stringmonthnum = pulldown_month.substring(5, 7);
                }

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var monthSelected = month[stringmonthnum - 1];

                var RecentMS = RecentMS;
                var RecentMStext = RecentMS;
                var RecentGroup = RecentMS;
                var rowSelected = RecentMS;
                var days = RecentMS;

                document.getElementById('Recent_PlanMS_Header_RYGModal').innerHTML = RecentMS + ' Plan';
                document.getElementById('Recent_ForecastMS_Header_RYGModal').innerHTML = RecentMS + ' Forecast';
                document.getElementById('Recent_ActualMS_Header_RYGModal').innerHTML = RecentMS + ' Actual';

                console.log('RYG_Modal function start');
                console.log("RYG_groupGeo: " + groupGeo);
                console.log("RYG_marketGeo: " + marketGeo);
                console.log("RYG_monthSelected: " + monthSelected);
                console.log("RYG_month: " + month);
                console.log("RYG_pptp_custom_one: " + pptp_custom_one);
                console.log("RYG_pptp_custom_two: " + pptp_custom_two);
                console.log("RYG_pptp_custom_three: " + pptp_custom_three);
                console.log("RYG_pptp_custom_four: " + pptp_custom_four);
                console.log("RYG_pptp_custom_five: " + pptp_custom_five);
                console.log('stringmonthnumVariable: ' + stringmonthnum);
                console.log('RecentMSVariable: ' + RecentMS);
                console.log('PlanFcstVariable: ' + PlanFcst);

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_RYG_Modal",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'colSelected': cellSelected,
                            'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            Data1 = data.d
                            //load_RYG_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, PlanFcst); //function in frontpage below, 
                        },
                        error: function (data) {
                            alert('Currently unable to load map, please try again later');
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Production_Insights_2020.aspx/Get_RYG_Modal_2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'colSelected': cellSelected,
                            'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            Data2 = data.d
                            //load_RYG_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, PlanFcst); //function in frontpage below, 
                        },
                        error: function (data) {
                            alert('Currently unable to load map, please try again later');
                        }
                    })
                ).then(function () {
                    dataConcat_2strings(Data1, Data2, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);
                });
            }

            function dataConcat_2strings(data1, data2, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory) {

                var dataConcat2;

                if (data2 == '[]') {  // if only 1 job
                    dataConcat2 = data1;
                    console.log('if statement');
                } else {  // 2 or more jobs
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length);
                    dataConcat2 = data1 + ',' + data2;
                    console.log('else statement');
                }

                load_RYG_Modal_Detail(dataConcat2, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);

            }

            function load_RYG_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory) {  // Recent and Upcoming Detail after user clicks on a row

                if (data == '[]') {
                    $('#LOADING_RYG_Modal').hide();
                    $('#RYG_Modal_NoData').show();
                } else {

                    data = JSON.parse(data);

                    if (data.length <= 0) {
                        return;
                    }
                    else {
                        //var sitename = data[0]["SITE_NAME"];
                        $('#RYG_Modal_Recent_Detail').dataTable().fnDestroy(); //destroy old table
                        $.fn.dataTable.moment('MM-DD-YYYY');
                        $('#RYG_Modal_Recent_Detail').DataTable({ //build new table                
                            orderCellsTop: false,
                            fixedHeader: false,
                            paging: false,
                            sort: true,
                            scrollY: 200,
                            scrollCollapse: true,
                            scrollX: true,
                            order: [[23, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                            searching: true,
                            data: data,
                            info: false,
                            binfo: true,
                            dom: 'Bfrtip',
                            buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                                text: 'Update Map',
                                titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                                action: function (e, dt, node, config) {
                                    MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, PlanFcst);
                                }
                            }],
                            //columnDefs: [{ visible: false, targets: 8 }],
                            columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                                { 'data': 'CATEGORY' },
                                { 'data': 'PACE_NUMBER' },
                                { 'data': 'PACE_NAME_SHORT' },
                                { 'data': 'PROGRAM' },
                                { 'data': 'SUBPROGRAM' },
                                { 'data': 'SUBPROGRAM2' },
                                { 'data': 'SUBPROGRAM3' },
                                { 'data': 'SUBPROGRAM4' },
                                { 'data': 'SUBGROUP' },
                                { 'data': 'SALES_REGION' },
                                { 'data': 'SALES_VPGM_MARKET' },
                                { 'data': 'RAN_REGION' },
                                { 'data': 'RAN_AVP' },
                                { 'data': 'RAN_MARKET' },
                                { 'data': 'RAN_SUBMARKET' },
                                { 'data': 'STATE' },
                                { 'data': 'COUNTY' },
                                { 'data': 'CITY' },
                                { 'data': 'ZIP_CODE' },
                                { 'data': 'RAN_INITIATIVE' },
                                { 'data': 'SPECTRUM' },
                                { 'data': 'ISSUED_DATE' },
                                { 'data': RecentMS + '_PLAN' },
                                { 'data': RecentMS + '_FORECAST' },
                                { 'data': RecentMS + '_ACTUAL' },
                                { 'data': 'USID' },
                                { 'data': 'FA_CODE' },
                                { 'data': 'LATITUDE' },
                                { 'data': 'LONGITUDE' },
                                { 'data': 'PACE_NAME_LONG' }

                            ],

                            //Highlight rows that don't have lat longs in the detail table in Red
                            createdRow: function (row, data, index) {
                                if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                                    $(row).addClass('highlightRed');
                                }
                            },

                            "fnDrawCallback": function () {
                                $('#RYG_Modal_Recent_Detail tr').find('td').each(function () {
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

                    $('#recentRYG_ModalDetailSection2').show();

                    $(window).resize();

                    MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst);

                    function MapOverlay() {
                        var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                        var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                        if (groupGeo == "ACE") {
                            if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                                $.getJSON("RAN_Regions_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                                | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                                $.getJSON("RAN_AVP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            } else {
                                $.getJSON("RAN_Markets_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            }
                        }
                        else {
                            $.getJSON("VPGM_Markets_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        }

                        function prep(MarketBoundaryData) {
                            console.log(MarketBoundaryData);
                            recent_RYG_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory);
                        };
                    }
                }

            }

            function recent_RYG_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory) {

                var RYG_recent_lat_index = 27; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
                var RYG_recent_long_index = 28; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

                var MSSelected = "RECENT " + RecentMS;
                var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var selectedMonthName = $('#<%= ddlMonth.ClientID %> option:selected').text();

                var recentSelectedCount = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childElementCount;
                var recentDetailColCount = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childElementCount;

                console.log("RYG_Modal_Map_Testpoint_Start");
                console.log(recentSelectedCount);
                console.log(recentDetailColCount);

                var j = 0;
                var i = 0;

                //console.log(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

                //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                var maxlat = parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML);
                var minlat = parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML);
                var maxlong = parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML);
                var minlong = parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML);

                if (isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML))) {
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
                var NancountMessage = '';

                var ActualCurrentTable = [];
                var ActualPreviousTable = [];
                var ActualFutureTable = [];
                var ForecastCurrentTable = [];
                var ForecastFutureTable = [];
                var PushTable = [];

                var ActualCurrentIndex = 0;
                var ActualPreviousIndex = 0;
                var ActualFutureIndex = 0;
                var ForecastCurrentIndex = 0;
                var ForecastFutureIndex = 0;
                var PushIndex = 0;

                //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
                for (i = 0; i < recentSelectedCount; i++) {
                    recentFilteredTable[i] = [];
                    recentUpcomingTable[upcomingindex] = [];
                    recentOnAirTable[onairindex] = [];
                    concatlatlong[i] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML + $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML;

                    console.log(RYG_recent_lat_index);

                    ActualCurrentTable[ActualCurrentIndex] = [];
                    ActualPreviousTable[ActualPreviousIndex] = [];
                    ActualFutureTable[ActualFutureIndex] = [];
                    ForecastCurrentTable[ForecastCurrentIndex] = [];
                    ForecastFutureTable[ForecastFutureIndex] = [];
                    PushTable[PushIndex] = [];

                    if (isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                        //dont adjust max min based on NaN
                        NaNcount++;
                    }

                    else {
                        maxlat = Math.max(maxlat, parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));
                        minlat = Math.min(minlat, parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));
                        maxlong = Math.max(maxlong, parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML));
                        minlong = Math.min(minlong, parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML));
                    }


                    //for (j = 0; j < recentDetailColCount; j++) {
                    //    //console.log($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    //    recentFilteredTable[i][j] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                    //}

                    //console.log(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));

                    if (isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                        //dont map if lat or long is NaN
                        ;
                    }

                    //below puts into groups

                    else {

                        if (cellSelected == 'PLAN') {


                            if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "ACTUAL DURING PLAN " + RecentMS) {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ActualCurrentTable[ActualCurrentIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ActualCurrentIndex++;
                            }


                            else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "FORECAST DURING PLAN " + RecentMS) {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ForecastCurrentTable[ForecastCurrentIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ForecastCurrentIndex++;
                            }



                            else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "ACTUAL BEFORE PLAN " + RecentMS) {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ActualPreviousTable[ActualPreviousIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ActualPreviousIndex++;
                            }


                            else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "ACTUAL AFTER PLAN " + RecentMS) {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ActualFutureTable[ActualFutureIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ActualFutureIndex++;
                            }

                            else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "FORECAST AFTER PLAN " + RecentMS) {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ForecastFutureTable[ForecastFutureIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ForecastFutureIndex++;
                            }


                            else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PUSH " + RecentMS) {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    PushTable[PushIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                PushIndex++;
                            }

                        }


                        else if (cellSelected == 'FCST') {

                            if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "ACTUAL") {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ActualCurrentTable[ActualCurrentIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ActualCurrentIndex++;
                            }


                            else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "REMAINING FORECAST") {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ForecastCurrentTable[ForecastCurrentIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ForecastCurrentIndex++;
                            }

                        }

                        else if (cellSelected == 'ACT') {

                            if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "ACTUAL") {

                                for (k = 0; k < recentDetailColCount; k++) {
                                    ActualCurrentTable[ActualCurrentIndex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                }

                                ActualCurrentIndex++;
                            }

                        }

                    }

                }
                //check to see if an empty row exists in the last row of the table and remove it if so
                if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                    recentUpcomingTable.splice(-1, 1);
                }

                if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                    recentOnAirTable.splice(-1, 1);
                }

                if (ActualCurrentTable[ActualCurrentTable.length - 1].length == 0) {
                    ActualCurrentTable.splice(-1, 1);
                }

                if (ActualPreviousTable[ActualPreviousTable.length - 1].length == 0) {
                    ActualPreviousTable.splice(-1, 1);
                }

                if (ActualFutureTable[ActualFutureTable.length - 1].length == 0) {
                    ActualFutureTable.splice(-1, 1);
                }

                if (PushTable[PushTable.length - 1].length == 0) {
                    PushTable.splice(-1, 1);
                }

                if (ForecastCurrentTable[ForecastCurrentTable.length - 1].length == 0) {
                    ForecastCurrentTable.splice(-1, 1);
                }

                if (ForecastFutureTable[ForecastFutureTable.length - 1].length == 0) {
                    ForecastFutureTable.splice(-1, 1);
                }

                latlongdistinctcount = new Set(concatlatlong).size;

                if (NaNcount == 0) {
                    NaNcountMessage = '';
                }

                else if (NaNcount == 1) {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped - Highlighted Red in Table Below'
                }

                else {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped - Highlighted Red in Table Below'
                }

                if (monthSelected == '%') {
                    monthSelectedtext = 'Current Year'
                }
                else {
                    monthSelectedtext = monthSelected
                }

                if (PlanFcst == "PLAN") {
                    var PlanOrFcst = "POE";
                } else {
                    var PlanOrFcst = "Forecasted";
                }

                if (PlanFcst == "PLAN") {
                    var dotColor = "#808080"; //grey
                } else {
                    var dotColor = "#1E90FF"; //blue
                }

                var modal_title = '';
                var modal_subtitle = '';
                var modal_allcounts = '';

                if (cellSelected == "PLAN") {
                    modal_title = salesGeo + ' ' + tabCategory + ' Map - ' + selectedMonthName + ' POE (' + (recentFilteredTable.length + NaNcount) + ')';
                    modal_subtitle = ' Completed (' + (ActualPreviousTable.length + ActualCurrentTable.length + ActualFutureTable.length) + ') , Remaining Forecasted (' + (ForecastCurrentTable.length + ForecastFutureTable.length) + ')';

                    if (PushTable.length > 0) { modal_subtitle += ' , Push (' + PushTable.length + ')'; }

                    if (NaNcount > 0) { modal_subtitle += ' , Missing Lat/Long (' + NaNCount + ')'; }
                }

                if (cellSelected == "FCST") {
                    modal_title = salesGeo + ' ' + tabCategory + ' Map - ' + selectedMonthName + ' Forecast (' + (recentFilteredTable.length + NaNcount) + ')';
                    modal_subtitle = ' Completed (' + ActualCurrentTable.length + ') , Remaining Forecasted (' + ForecastCurrentTable.length + ')';

                    if (NaNcount > 0) { modal_subtitle += ' , Missing Lat/Long (' + NaNCount + ')'; }
                }

                if (cellSelected == "ACT") {
                    modal_title = salesGeo + ' ' + tabCategory + ' Map - ' + selectedMonthName + ' Actual (' + (recentFilteredTable.length + NaNcount) + ')';
                    modal_subtitle = '';

                    if (NaNcount > 0) { modal_subtitle += ' , Missing Lat/Long (' + NaNCount + ')'; }
                }

                document.getElementById('Modal_Month_Title').innerHTML = " - " + selectedMonthName;
                document.getElementById('RYG_Modal_mapcounttitle').innerHTML = modal_title;
                //document.getElementById('RYG_Modal_mapcountsubtitle').innerHTML = selectedMonthName + ' Actual and Remaining ' + PlanOrFcst;
                document.getElementById('RYG_Modal_mapcountsubtitle').innerHTML = modal_subtitle;
                //document.getElementById('RYG_Modal_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
                document.getElementById('RYG_Modal_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                document.getElementById('RYG_Modal_mapcountfooter2').innerHTML = NaNcountMessage;

                var OApoints = new L.layerGroup();
                var Uppoints = new L.layerGroup();

                var ActualCurrentPoints = new L.layerGroup();
                var ActualPreviousPoints = new L.layerGroup();
                var ActualFuturePoints = new L.layerGroup();
                var ForecastCurrentPoints = new L.layerGroup();
                var ForecastFuturePoints = new L.layerGroup();
                var PushPoints = new L.layerGroup();

                for (i in ActualCurrentTable) {

                    var popup = '<b>Category:</b> ' + monthSelected + ' Actual' +
                        '<br/><b>PACE Number:</b> ' + ActualCurrentTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + ActualCurrentTable[i][26] +
                        '<br/><b>Program:</b> ' + ActualCurrentTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + ActualCurrentTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + ActualCurrentTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + ActualCurrentTable[i][9] + '- ' + ActualCurrentTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + ActualCurrentTable[i][12] +
                        '<br/><b>Market:</b> ' + ActualCurrentTable[i][13] +
                        '<br/><b>Submarket:</b> ' + ActualCurrentTable[i][14] +
                        '<br/><b>City, State:</b> ' + ActualCurrentTable[i][17] + ', ' + ActualCurrentTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + ActualCurrentTable[i][16] + ', ' + ActualCurrentTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + ActualCurrentTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + ActualCurrentTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + ActualCurrentTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + ActualCurrentTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + ActualCurrentTable[i][25] + ', ' + ActualCurrentTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + ActualCurrentTable[i][RYG_recent_lat_index] + ', ' + ActualCurrentTable[i][RYG_recent_long_index],

                        loc = [parseFloat(ActualCurrentTable[i][RYG_recent_lat_index]), parseFloat(ActualCurrentTable[i][RYG_recent_long_index])],	//position found
                        ActualCurrentTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#008000'
                        };

                    //console.log('test2');
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ActualCurrentTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    ActualCurrentPoints.addLayer(marker);
                }


                if (cellSelected != 'ACT') {  //For Actual selection we only show actuals for the month

                    for (i in ForecastCurrentTable) {

                        var popup = '<b>Category:</b> ' + monthSelected + ' Remaining Forecast' +
                            '<br/><b>PACE Number:</b> ' + ForecastCurrentTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + ForecastCurrentTable[i][26] +
                            '<br/><b>Program:</b> ' + ForecastCurrentTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + ForecastCurrentTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + ForecastCurrentTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + ForecastCurrentTable[i][9] + '- ' + ForecastCurrentTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + ForecastCurrentTable[i][12] +
                            '<br/><b>Market:</b> ' + ForecastCurrentTable[i][13] +
                            '<br/><b>Submarket:</b> ' + ForecastCurrentTable[i][14] +
                            '<br/><b>City, State:</b> ' + ForecastCurrentTable[i][17] + ', ' + ForecastCurrentTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + ForecastCurrentTable[i][16] + ', ' + ForecastCurrentTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + ForecastCurrentTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + ForecastCurrentTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + ForecastCurrentTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + ForecastCurrentTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + ForecastCurrentTable[i][25] + ', ' + ForecastCurrentTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + ForecastCurrentTable[i][RYG_recent_lat_index] + ', ' + ForecastCurrentTable[i][RYG_recent_long_index],

                            loc = [parseFloat(ForecastCurrentTable[i][RYG_recent_lat_index]), parseFloat(ForecastCurrentTable[i][RYG_recent_long_index])],	//position found
                            ForecastCurrentTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#00008b'
                            };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ForecastCurrentTableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        ForecastCurrentPoints.addLayer(marker);
                    }

                    if (cellSelected == 'PLAN') {  //For PLAN we show additional layers for the month

                        for (i in ActualPreviousTable) {

                            var popup = '<b>Category:</b> ' + 'Completed Before ' + monthSelected +
                                '<br/><b>PACE Number:</b> ' + ActualPreviousTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + ActualPreviousTable[i][26] +
                                '<br/><b>Program:</b> ' + ActualPreviousTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + ActualPreviousTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + ActualPreviousTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + ActualPreviousTable[i][9] + '- ' + ActualPreviousTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + ActualPreviousTable[i][12] +
                                '<br/><b>Market:</b> ' + ActualPreviousTable[i][13] +
                                '<br/><b>Submarket:</b> ' + ActualPreviousTable[i][14] +
                                '<br/><b>City, State:</b> ' + ActualPreviousTable[i][17] + ', ' + ActualPreviousTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + ActualPreviousTable[i][16] + ', ' + ActualPreviousTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + ActualPreviousTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + ActualPreviousTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + ActualPreviousTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + ActualPreviousTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + ActualPreviousTable[i][25] + ', ' + ActualPreviousTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + ActualPreviousTable[i][RYG_recent_lat_index] + ', ' + ActualPreviousTable[i][RYG_recent_long_index],

                                loc = [parseFloat(ActualPreviousTable[i][RYG_recent_lat_index]), parseFloat(ActualPreviousTable[i][RYG_recent_long_index])],	//position found
                                ActualPreviousTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#00cc00'
                                };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ActualPreviousTableoptions) });
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            ActualPreviousPoints.addLayer(marker);
                        }

                        console.log('length actual future table ' + ActualFutureTable.length);
                        //if (ActualFutureTable.length > 0) {

                        for (i in ActualFutureTable) {

                            var popup = '<b>Category:</b> ' + 'Completed After ' + monthSelected +
                                '<br/><b>PACE Number:</b> ' + ActualFutureTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + ActualFutureTable[i][26] +
                                '<br/><b>Program:</b> ' + ActualFutureTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + ActualFutureTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + ActualFutureTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + ActualFutureTable[i][9] + '- ' + ActualFutureTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + ActualFutureTable[i][12] +
                                '<br/><b>Market:</b> ' + ActualFutureTable[i][13] +
                                '<br/><b>Submarket:</b> ' + ActualFutureTable[i][14] +
                                '<br/><b>City, State:</b> ' + ActualFutureTable[i][17] + ', ' + ActualFutureTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + ActualFutureTable[i][16] + ', ' + ActualFutureTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + ActualFutureTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + ActualFutureTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + ActualFutureTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + ActualFutureTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + ActualFutureTable[i][25] + ', ' + ActualFutureTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + ActualFutureTable[i][RYG_recent_lat_index] + ', ' + ActualFutureTable[i][RYG_recent_long_index],

                                loc = [parseFloat(ActualFutureTable[i][RYG_recent_lat_index]), parseFloat(ActualFutureTable[i][RYG_recent_long_index])],	//position found
                                ActualFutureTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#003300'
                                };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ActualFutureTableoptions) });
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            ActualFuturePoints.addLayer(marker);
                        }
                        //}

                        for (i in ForecastFutureTable) {

                            var popup = '<b>Category:</b> ' + 'Forecast After ' + monthSelected +
                                '<br/><b>PACE Number:</b> ' + ForecastFutureTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + ForecastFutureTable[i][26] +
                                '<br/><b>Program:</b> ' + ForecastFutureTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + ForecastFutureTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + ForecastFutureTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + ForecastFutureTable[i][9] + '- ' + ForecastFutureTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + ForecastFutureTable[i][12] +
                                '<br/><b>Market:</b> ' + ForecastFutureTable[i][13] +
                                '<br/><b>Submarket:</b> ' + ForecastFutureTable[i][14] +
                                '<br/><b>City, State:</b> ' + ForecastFutureTable[i][17] + ', ' + ForecastFutureTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + ForecastFutureTable[i][16] + ', ' + ForecastFutureTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + ForecastFutureTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + ForecastFutureTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + ForecastFutureTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + ForecastFutureTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + ForecastFutureTable[i][25] + ', ' + ForecastFutureTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + ForecastFutureTable[i][RYG_recent_lat_index] + ', ' + ForecastFutureTable[i][RYG_recent_long_index],

                                loc = [parseFloat(ForecastFutureTable[i][RYG_recent_lat_index]), parseFloat(ForecastFutureTable[i][RYG_recent_long_index])],	//position found
                                ForecastFutureTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#4da6ff'
                                };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ForecastFutureTableoptions) });
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            ForecastFuturePoints.addLayer(marker);
                        }

                        for (i in PushTable) {

                            var popup = '<b>Category:</b> ' + 'Push' +
                                '<br/><b>PACE Number:</b> ' + PushTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + PushTable[i][26] +
                                '<br/><b>Program:</b> ' + PushTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + PushTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + PushTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + PushTable[i][9] + '- ' + PushTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + PushTable[i][12] +
                                '<br/><b>Market:</b> ' + PushTable[i][13] +
                                '<br/><b>Submarket:</b> ' + PushTable[i][14] +
                                '<br/><b>City, State:</b> ' + PushTable[i][17] + ', ' + PushTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + PushTable[i][16] + ', ' + PushTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + PushTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + PushTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + PushTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + PushTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + PushTable[i][25] + ', ' + PushTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + PushTable[i][RYG_recent_lat_index] + ', ' + PushTable[i][RYG_recent_long_index],

                                loc = [parseFloat(PushTable[i][RYG_recent_lat_index]), parseFloat(PushTable[i][RYG_recent_long_index])],	//position found
                                PushTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#ffb366'
                                };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PushTableoptions) });
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            PushPoints.addLayer(marker);
                        }

                    }
                }

                $('#LOADING_RYG_Modal').hide();
                $('#recentRYG_ModalDetailSection1').show();

                document.getElementById('RYG_Modal_mapdiv').innerHTML = "<div id='RYG_Modal_mapid' style='height: 450px;'></div>";

                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    "Satelite": sat
                    //"Topo": topo
                };

                var ActCurrentLegend = '';
                var FcstCurrentLegend = '';

                if (cellSelected == 'ACT') {

                    ActCurrentLegend = monthSelected + ' Actual';
                    FcstCurrentLegend = monthSelected + ' Forecast';

                    var map = L.map("RYG_Modal_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, ActualCurrentPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                else if (cellSelected == 'FCST') {

                    ActCurrentLegend = monthSelected + ' Actual';
                    FcstCurrentLegend = monthSelected + ' Forecast';

                    var map = L.map("RYG_Modal_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, ActualCurrentPoints, ForecastCurrentPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                else {

                    ActCurrentLegend = 'Completed During ' + monthSelected;
                    FcstCurrentLegend = 'Forecasted During ' + monthSelected;

                    var map = L.map("RYG_Modal_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, ActualPreviousPoints, ActualCurrentPoints, ActualFuturePoints, ForecastCurrentPoints, ForecastFuturePoints, PushPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                //********** new add geojson layer section **********

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
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            featureLayer.bindPopup(feature.properties.Region);
                        }
                        else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            featureLayer.bindPopup(feature.properties.AVP);
                        }
                        else {
                            featureLayer.bindPopup(feature.properties.Market_Lon);
                        }
                    } else {
                        featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: style,
                    onEachFeature: onEachFeature
                }).addTo(map);

                //********** new add geojson layer section end **********

                console.log('overlay selection ' + cellSelected);

                if (cellSelected == 'PLAN') {

                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Completed Before Plan": ActualPreviousPoints,
                                "Completed During Plan Month": ActualCurrentPoints,
                                "Completed After Plan": ActualFuturePoints,
                                "Forecast During Plan Month": ForecastCurrentPoints,
                                "Forecast After Plan": ForecastFuturePoints,
                                "Push": PushPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Completed Before Plan": ActualPreviousPoints,
                                "Completed During Plan Month": ActualCurrentPoints,
                                "Completed After Plan": ActualFuturePoints,
                                "Forecast During Plan Month": ForecastCurrentPoints,
                                "Forecast After Plan": ForecastFuturePoints,
                                "Push": PushPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Completed Before Plan": ActualPreviousPoints,
                                "Completed During Plan Month": ActualCurrentPoints,
                                "Completed After Plan": ActualFuturePoints,
                                "Forecast During Plan Month": ForecastCurrentPoints,
                                "Forecast After Plan": ForecastFuturePoints,
                                "Push": PushPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Completed Before Plan": ActualPreviousPoints,
                            "Completed During Plan Month": ActualCurrentPoints,
                            "Completed After Plan": ActualFuturePoints,
                            "Forecast During Plan Month": ForecastCurrentPoints,
                            "Forecast After Plan": ForecastFuturePoints,
                            "Push": PushPoints
                        };
                    }
                } else if (cellSelected == 'FCST') {
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Completed": ActualCurrentPoints,
                                "Remaining Forecast": ForecastCurrentPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Completed": ActualCurrentPoints,
                                "Remaining Forecast": ForecastCurrentPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Completed": ActualCurrentPoints,
                                "Remaining Forecast": ForecastCurrentPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Completed": ActualCurrentPoints,
                            "Remaining Forecast": ForecastCurrentPoints
                        };
                    }
                } else {
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Completed": ActualCurrentPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Completed": ActualCurrentPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Completed": ActualCurrentPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Completed": ActualCurrentPoints
                        };
                    }
                }


                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };
                var control = L.control.zoomBox(options);

                map.addControl(control);

                L.control.scale({ position: 'bottomright', metric: false }).addTo(map);

                L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                map.invalidateSize();
                map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);


                function getColor(d) {
                    return d === "Completed Before " + monthSelected + ' (' + ActualPreviousTable.length + ')' ? "#00cc00" :
                        d === ActCurrentLegend + ' (' + ActualCurrentTable.length + ')' ? "#008000" :
                            d === "Completed After " + monthSelected + ' (' + ActualFutureTable.length + ')' ? "#003300" :
                                d === FcstCurrentLegend + ' (' + ForecastCurrentTable.length + ')' ? "#00008b" :
                                    d === "Forecast After " + monthSelected + ' (' + ForecastFutureTable.length + ')' ? "#4da6ff" :
                                        d === 'Push (' + PushTable.length + ')' ? "#ffb366" :
                                            "#fffff";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    //var div = L.DomUtil.create('div', 'info legend_RYG2_PLAN');
                    var div = '';
                    var categories = [];
                    if (cellSelected == "PLAN") {
                        categories = ["Completed Before " + monthSelected + ' (' + ActualPreviousTable.length + ')', ActCurrentLegend + ' (' + ActualCurrentTable.length + ')',
                        "Completed After " + monthSelected + ' (' + ActualFutureTable.length + ')', FcstCurrentLegend + ' (' + ForecastCurrentTable.length + ')',
                        "Forecast After " + monthSelected + ' (' + ForecastFutureTable.length + ')', 'Push (' + PushTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG_PLAN');
                    }
                    else if (cellSelected == "FCST") {
                        categories = [ActCurrentLegend + ' (' + ActualCurrentTable.length + ')',
                        FcstCurrentLegend + ' (' + ForecastCurrentTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG_FCST');
                    }

                    else {
                        categories = categories = [ActCurrentLegend + ' (' + ActualCurrentTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG_ACT');
                    }

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                console.log("RYG_Modal_Map_Testpoint_Finished");

            }

            // ********** RYG MODAL END **********

            // ********** RYG MODAL2 START **********


            //function updateRYG_Modal2(rowSelected, RecentMS) {
            function updateRYG_Modal2(monthSelected, RecentMS, cellSelected, PlanFcst, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory) {

                console.log("updateRYG_Modal2 Start");
                $('#LOADING_RYG_Modal2').show();
                $('#recentRYG_Modal2DetailSection1').hide();
                $('#recentRYG_Modal2DetailSection2').hide();

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();

                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
                console.log('histcount pulldown month: ' + pulldown_month);

                var stringyearnum = pulldown_month.substring(0, 4);

                if (pulldown_month.substring(5, 6) == 0) {
                    stringmonthnum = pulldown_month.substring(6, 7);
                }

                else {
                    stringmonthnum = pulldown_month.substring(5, 7);
                }

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var monthSelected = month[stringmonthnum - 1];

                //var monthSelected = monthSelected;            
                var RecentMS = RecentMS;
                var RecentMStext = RecentMS;
                var RecentGroup = RecentMS;
                var rowSelected = RecentMS;
                var days = RecentMS;

                document.getElementById('Recent_PlanMS_Header_RYGModal2').innerHTML = RecentMS + ' Plan';
                document.getElementById('Recent_ForecastMS_Header_RYGModal2').innerHTML = RecentMS + ' Forecast';
                document.getElementById('Recent_ActualMS_Header_RYGModal2').innerHTML = RecentMS + ' Actual';

                console.log('RYG_Modal2 function start');
                console.log("RYG2_groupGeo: " + groupGeo);
                console.log("RYG2_marketGeo: " + marketGeo);
                console.log("RYG2_monthSelected: " + monthSelected);
                console.log("RYG2_month: " + month);
                console.log("RYG2_pptp_custom_one: " + pptp_custom_one);
                console.log("RYG2_pptp_custom_two: " + pptp_custom_two);
                console.log("RYG2_pptp_custom_three: " + pptp_custom_three);
                console.log("RYG2_pptp_custom_four: " + pptp_custom_four);
                console.log("RYG2_pptp_custom_five: " + pptp_custom_five);
                console.log('stringmonthnumVariable: ' + stringmonthnum);
                console.log('RecentMSVariable: ' + RecentMS);
                console.log('PlanFcstVariable: ' + PlanFcst);

                if (cellSelected == 'ACT') {

                    //var geturl1 = "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT";
                    //var times = 6;
                    //var async_request = [];
                    //var responses = [];
                    //for (var i = 1; i <= times; i++) {
                    //    async_request.push(
                    //        $.ajax({
                    //            type: "POST",
                    //            async: true,
                    //            url: geturl1 + "_" + i,
                    //            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    //            dataType: "json",
                    //            contentType: "application/json; charset=utf-8",
                    //            success: function (data) {
                    //                console.log('success of ajax response')
                    //                responses.push(data.d);
                    //            }
                    //        })
                    //    );
                    //}

                    //$.when.apply(undefined, async_request).done(function () {
                    //    dataConcat_6string_modal2(responses[0], responses[1], responses[2], responses[3], responses[4], responses[5], RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);
                    //    console.log('all request completed')
                    //});

                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT_1",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data1 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT_2",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data2 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT_3",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data3 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT_4",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data4 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT_5",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data5 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_ACT_6",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data6 = data.d
                            }
                        }),
                    )
                        .then(function () {
                            dataConcat_6string_modal2(data1, data2, data3, data4, data5, data6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);
                            console.log('all request completed')
                        });

                }
                else {

                    //var geturl1 = "Production_Insights_2020.aspx/Get_RYG_Modal2";
                    //var times = 6;
                    //var async_request = [];
                    //var responses = [];
                    //for (var i = 1; i <= times; i++) {
                    //    async_request.push(
                    //        $.ajax({
                    //            type: "POST",
                    //            async: true,
                    //            url: geturl1 + "_" + i,
                    //            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    //            dataType: "json",
                    //            contentType: "application/json; charset=utf-8",
                    //            success: function (data) {
                    //                console.log('success of ajax response')
                    //                responses.push(data.d);
                    //            }
                    //        })
                    //    );
                    //}

                    //$.when.apply(null, async_request).done(function () {
                    //    dataConcat_6string_modal2(responses[0], responses[1], responses[2], responses[3], responses[4], responses[5], RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);
                    //    console.log('all request completed')
                    //});

                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_1",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data1 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_2",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data2 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_3",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data3 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_4",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data4 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_5",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data5 = data.d
                            }
                        }),

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Production_Insights_2020.aspx/Get_RYG_Modal2_6",
                            data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'MonthNumber': stringmonthnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                console.log('success of ajax response Get_Recent_Sales_Detail')
                                data6 = data.d
                            }
                        }),
                    )
                        .then(function () {
                            dataConcat_6string_modal2(data1, data2, data3, data4, data5, data6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);
                            console.log('all request completed')
                        });

                }

                function dataConcat_6string_modal2(data1, data2, data3, data4, data5, data6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory) {
                    var dataConcat6;

                    if (data2 == '[]') {  // if only 1 job
                        dataConcat6 = data1;
                    }
                    else if (data3 == '[]') {  // if only 2 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length);
                        dataConcat6 = data1 + ',' + data2;
                    }
                    else if (data4 == '[]') {  // if only 3 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3;
                    }
                    else if (data5 == '[]') {  // if only 4 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length - 1);
                        data4 = data4.substring(1, data4.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
                    }
                    else if (data6 == '[]') {  // if only 5 jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length - 1);
                        data4 = data4.substring(1, data4.length - 1);
                        data5 = data5.substring(1, data5.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5;
                    }
                    else {  // 6 or more jobs
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length - 1);
                        data3 = data3.substring(1, data3.length - 1);
                        data4 = data4.substring(1, data4.length - 1);
                        data5 = data5.substring(1, data5.length - 1);
                        data6 = data6.substring(1, data6.length);
                        dataConcat6 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6;
                    }

                    load_RYG_Modal2_Detail(dataConcat6, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory);

                }

            }

            function load_RYG_Modal2_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, tabName, tabCategory) {  // Recent and Upcoming Detail after user clicks on a row

                if (data == '[]') {
                    $('#LOADING_RYG_Modal2').hide();
                    $('#RYG_Modal2_NoData').show();
                } else {

                    data = JSON.parse(data);
                    // $.fn.dataTable.moment('MM-DD-YYYY');
                    //$('#footer2').show();

                    if (data.length <= 0) {
                        return;
                    }
                    else {
                        //var sitename = data[0]["SITE_NAME"];

                        $('#RYG_Modal2_Recent_Detail').dataTable().fnDestroy(); //destroy old table
                        $.fn.dataTable.moment('MM-DD-YYYY');
                        $('#RYG_Modal2_Recent_Detail').DataTable({ //build new table                
                            orderCellsTop: false,
                            fixedHeader: false,
                            paging: false,
                            sort: true,
                            scrollY: 200,
                            scrollCollapse: true,
                            scrollX: true,
                            order: [[20, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                            searching: true,
                            data: data,
                            info: false,
                            binfo: true,
                            dom: 'Bfrtip',
                            buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                                text: 'Update Map',
                                titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                                action: function (e, dt, node, config) {
                                    MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst);
                                }
                            }],
                            //columnDefs: [{ visible: false, targets: 8 }],
                            columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                                { 'data': 'CATEGORY' },
                                { 'data': 'PACE_NUMBER' },
                                { 'data': 'PACE_NAME_SHORT' },
                                { 'data': 'PROGRAM' },
                                { 'data': 'SUBPROGRAM' },
                                { 'data': 'SUBPROGRAM2' },
                                { 'data': 'SUBPROGRAM3' },
                                { 'data': 'SUBPROGRAM4' },
                                { 'data': 'SUBGROUP' },
                                { 'data': 'SALES_REGION' },
                                { 'data': 'SALES_VPGM_MARKET' },
                                { 'data': 'RAN_REGION' },
                                { 'data': 'RAN_AVP' },
                                { 'data': 'RAN_MARKET' },
                                { 'data': 'RAN_SUBMARKET' },
                                { 'data': 'STATE' },
                                { 'data': 'COUNTY' },
                                { 'data': 'CITY' },
                                { 'data': 'ZIP_CODE' },
                                { 'data': 'RAN_INITIATIVE' },
                                { 'data': 'SPECTRUM' },
                                { 'data': 'ISSUED_DATE' },
                                { 'data': RecentMS + '_PLAN' },
                                { 'data': RecentMS + '_FORECAST' },
                                { 'data': RecentMS + '_ACTUAL' },
                                { 'data': 'USID' },
                                { 'data': 'FA_CODE' },
                                { 'data': 'LATITUDE' },
                                { 'data': 'LONGITUDE' },
                                { 'data': 'PACE_NAME_LONG' }

                            ],


                            //Highlight rows that don't have lat longs in the detail table in Red
                            createdRow: function (row, data, index) {
                                if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"])) || data["LATITUDE"] == '' || data["LONGITUDE"] == '') {
                                    $(row).addClass('highlightRed');
                                    console.log('no lat long in a row');
                                }
                            },

                            "fnDrawCallback": function () {
                                $('#RYG_Modal2_Recent_Detail tr').find('td').each(function () {
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

                    $('#recentRYG_Modal2DetailSection2').show();

                    $(window).resize();

                    MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst);

                    function MapOverlay() {
                        var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                        var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                        if (groupGeo == "ACE") {
                            if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                                $.getJSON("RAN_Regions_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                                | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                                $.getJSON("RAN_AVP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            } else {
                                $.getJSON("RAN_Markets_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    prep(MarketBoundaryData);
                                });
                            }
                        }
                        else {
                            $.getJSON("VPGM_Markets_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        }

                        function prep(MarketBoundaryData) {
                            console.log(MarketBoundaryData);
                            recent_RYG_Modal2_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory);
                        };
                    }
                }

            }

            function recent_RYG_Modal2_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory) {

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var monthSelectedPrevious = '';

                if (stringmonthnum > 1) {
                    monthSelectedPrevious = month[stringmonthnum - 2];
                }

                var previousActualName = '';

                if (stringmonthnum == 1) { previousActualName = 'POE Pulled Last Year'; }
                else if (stringmonthnum == 2) { previousActualName = 'Jan Actual'; }
                else { previousActualName = 'Jan - ' + monthSelectedPrevious + ' Actual'; }

                var recentActualName = '';

                if (curmonthspan == monthSelected) { recentActualName = curmonthspan + ' Actual'; }

                else { recentActualName = monthSelected + ' - ' + curmonthspan + ' Actual'; }

                console.log('previousActualName: ' + previousActualName);
                console.log('recentActualName: ' + recentActualName);

                //code which applies regardless of plan, forecast, actual selection:

                var RYG2_recent_lat_index = 27; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
                var RYG2_recent_long_index = 28; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long


                var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
                var stringyearnum = pulldown_month.substring(0, 4);

                document.getElementById('Modal_Year_Title').innerHTML = " - " + stringyearnum;

                var recentSelectedCount = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childElementCount;
                var recentDetailColCount = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childElementCount;


                console.log("RYG_Modal2_Map_Testpoint_Start");
                console.log(recentSelectedCount);
                console.log(recentDetailColCount);

                var j = 0;
                var i = 0;

                //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                var maxlat = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_lat_index].innerHTML);
                var minlat = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_lat_index].innerHTML);
                var maxlong = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_long_index].innerHTML);
                var minlong = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_long_index].innerHTML);

                if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_long_index].innerHTML))) {
                    maxlat = 48;
                    minlat = 25;
                    maxlong = -66;
                    minlong = -125;
                }

                var recentFilteredTable = []; //entire filtered table with all series, including hidden ones - Note that Actual table will include ONLY the Actuals

                var recentUpcomingTable = [];
                var upcomingindex = 0;
                var recentOnAirTable = [];
                var onairindex = 0;


                var previousActualTable = [];
                var previousActualIndex = 0;
                var recentActualTable = [];
                var recentActualIndex = 0;
                var q1FcstTable = [];
                var q1FcstIndex = 0;
                var q2FcstTable = [];
                var q2FcstIndex = 0;
                var q3FcstTable = [];
                var q3FcstIndex = 0;
                var q4FcstTable = [];
                var q4FcstIndex = 0;
                var pushTable = [];
                var pushIndex = 0;
                var pullActualTable = [];
                var pullActualIndex = 0;
                var pullFcstTable = [];
                var pullFcstIndex = 0;


                var concatlatlong = [];
                var NaNTable = [];
                var NaNcount = 0;
                var POENaNCount = 0;
                var FCSTNaNCount = 0;
                var ACTNaNCount = 0;
                var NancountMessage = '';

                //loop through the visible (filtered) rows of the detail table and grab the data. Store the rows in different tables for the different layers
                for (i = 0; i < recentSelectedCount; i++) {
                    recentFilteredTable[i] = [];
                    recentUpcomingTable[upcomingindex] = [];
                    recentOnAirTable[onairindex] = [];

                    previousActualTable[previousActualIndex] = [];
                    recentActualTable[recentActualIndex] = [];
                    q1FcstTable[q1FcstIndex] = [];
                    q2FcstTable[q2FcstIndex] = [];
                    q3FcstTable[q3FcstIndex] = [];
                    q4FcstTable[q4FcstIndex] = [];
                    pushTable[pushIndex] = [];
                    pullActualTable[pullActualIndex] = [];
                    pullFcstTable[pullFcstIndex] = [];

                    concatlatlong[i] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML + $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML;

                    if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML))) {
                        //dont adjust max min based on NaN
                        NaNcount++;
                        ACTNaNCount++; //ACT table is already filtered on Actuals, so nay NaN for missing lat longs in that table will apply

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML.substring(0, 4) != 'PULL') {
                            POENaNCount++;
                        }

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML.substring(0, 4) != 'PUSH') {
                            FCSTNaNCount++;
                        }

                    }

                    else {
                        maxlat = Math.max(maxlat, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML));
                        minlat = Math.min(minlat, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML));
                        maxlong = Math.max(maxlong, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML));
                        minlong = Math.min(minlong, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML));
                    }


                    for (j = 0; j < recentDetailColCount; j++) {
                        //console.log($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                        recentFilteredTable[i][j] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                    }

                    //console.log(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML));

                    if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML))) {
                        //dont map if lat or long is NaN
                        ;
                    }

                    //below puts into groups

                    else if (cellSelected == "PLAN") {

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                previousActualTable[previousActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            previousActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "RECENT " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                recentActualTable[recentActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            recentActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q1F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q1FcstTable[q1FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q1FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q2F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q2FcstTable[q2FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q2FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q3F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q3FcstTable[q3FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q3FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q4F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q4FcstTable[q4FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q4FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PUSH " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pushTable[pushIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pushIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL RECENT " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pullActualTable[pullActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pullActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q1F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q2F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q3F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q4F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pullFcstTable[pullFcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pullFcstIndex++;
                        }

                    }

                    // FCST button clicked
                    else if (cellSelected == "FCST") {

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PREVIOUS " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                previousActualTable[previousActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            previousActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "RECENT " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL RECENT " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                recentActualTable[recentActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            recentActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q1F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q1F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q1FcstTable[q1FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q1FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q2F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q2F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q2FcstTable[q2FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q2FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q3F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q3F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q3FcstTable[q3FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q3FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q4F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q4F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q4FcstTable[q4FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q4FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PUSH " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pushTable[pushIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pushIndex++;
                        }

                    }

                    //ONAIR button clicked
                    else {


                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PREVIOUS " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                previousActualTable[previousActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            previousActualIndex++;
                        }


                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "RECENT " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL RECENT " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                recentActualTable[recentActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            recentActualIndex++;
                        }

                    }
                }

                //check to see if an empty row exists in the last row of the table and remove it if so

                if (previousActualTable[previousActualTable.length - 1].length == 0) {
                    previousActualTable.splice(-1, 1);
                }

                if (recentActualTable[recentActualTable.length - 1].length == 0) {
                    recentActualTable.splice(-1, 1);
                }

                if (cellSelected != "ACT") {

                    if (q1FcstTable[q1FcstTable.length - 1].length == 0) {
                        q1FcstTable.splice(-1, 1);
                    }

                    if (q2FcstTable[q2FcstTable.length - 1].length == 0) {
                        q2FcstTable.splice(-1, 1);
                    }

                    if (q3FcstTable[q3FcstTable.length - 1].length == 0) {
                        q3FcstTable.splice(-1, 1);
                    }

                    if (q4FcstTable[q4FcstTable.length - 1].length == 0) {
                        q4FcstTable.splice(-1, 1);
                    }

                    if (pushTable[pushTable.length - 1].length == 0) {
                        pushTable.splice(-1, 1);
                    }

                    if (cellSelected == "PLAN") {

                        if (pullActualTable[pullActualTable.length - 1].length == 0) {
                            pullActualTable.splice(-1, 1);
                        }

                        if (pullFcstTable[pullFcstTable.length - 1].length == 0) {
                            pullFcstTable.splice(-1, 1);
                        }

                    }
                }

                latlongdistinctcount = new Set(concatlatlong).size;

                if (NaNcount == 0) {
                    NaNcountMessage = '';
                }

                else if (NaNcount == 1) {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped - Highlighted Red in Table Below'
                }

                else {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped - Highlighted Red in Table Below'
                }

                if (monthSelected == '%') {
                    monthSelectedtext = 'Current Year'
                }
                else {
                    monthSelectedtext = monthSelected
                }

                if (PlanFcst == "PLAN") {
                    var PlanOrFcst = "POE";
                } else {
                    var PlanOrFcst = "Forecasted";
                }

                if (PlanFcst == "PLAN") {
                    var dotColor = "#808080"; //grey
                } else {
                    var dotColor = "#1E90FF"; //blue
                }

                var modal2_title = '';
                var modal2_subtitle = '';
                var modal2_allcounts = '';

                console.log(previousActualTable.length + recentActualTable.length
                    + q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length + pushTable.length);

                if (cellSelected == "PLAN") {
                    modal2_title = salesGeo + ' ' + tabCategory + ' Map - ' + stringyearnum + ' POE (' + (previousActualTable.length + recentActualTable.length
                        + q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length + pushTable.length + POENaNCount) + ')';
                    modal2_subtitle = ' Completed (' + (recentActualTable.length + previousActualTable.length) + ') , Remaining Forecasted (' + (q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length) + ')';

                    if (pushTable.length > 0) { modal2_subtitle += ' , Push (' + pushTable.length + ')'; }

                    if (POENaNCount > 0) { modal2_subtitle += ' , Missing Lat/Long (' + POENaNCount + ')'; }

                    modal2_allcounts = ' Previously Completed: ' + previousActualTable.length + ', Recently Completed: ' + recentActualTable.length + ', Q1 Forecast: ' + q1FcstTable.length + ', Q2 Forecast: ' + q2FcstTable.length
                        + ', Q3 Forecast: ' + q3FcstTable.length + ', Q4 Forecast: ' + q4FcstTable.length + ', Push: ' + pushTable.length + ', Pull Completed: ' + pullActualTable.length + ', Pull Forecast: ' + pullFcstTable.length;


                    if (NaNcount > 0) { modal2_allcounts += ', No Lat/Long: ' + NaNcount; }
                }


                if (cellSelected == "FCST") {
                    modal2_title = salesGeo + ' ' + tabCategory + ' Map - ' + stringyearnum + ' Forecast (' + (previousActualTable.length + recentActualTable.length
                        + q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length + FCSTNaNCount) + ')';
                    modal2_subtitle = ' Completed (' + (recentActualTable.length + previousActualTable.length) + ') , Remaining Forecasted (' + (q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length) + ')';

                    if (FCSTNaNCount > 0) { modal2_subtitle += ' , Missing Lat/Long (' + FCSTNaNCount + ')'; }


                    modal2_allcounts = ' Previously Completed: ' + previousActualTable.length + ', Recently Completed: ' + recentActualTable.length + ', Q1 Forecast: ' + q1FcstTable.length + ', Q2 Forecast: ' + q2FcstTable.length
                        + ', Q3 Forecast: ' + q3FcstTable.length + ', Q4 Forecast: ' + q4FcstTable.length + ', Push: ' + pushTable.length;


                    if (NaNcount > 0) { modal2_allcounts += ', No Lat/Long: ' + NaNcount; }
                }

                if (cellSelected == "ACT") {
                    modal2_title = salesGeo + ' ' + tabCategory + ' Map - ' + stringyearnum + ' Actuals (' + (previousActualTable.length + recentActualTable.length + ACTNaNCount) + ')';
                    modal2_subtitle = 'Previously Completed (' + previousActualTable.length + ') , Recently Completed (' + recentActualTable.length + ')';

                    if (ACTNaNCount > 0) { modal2_subtitle += ' , Missing Lat/Long (' + ACTNaNCount + ')'; }

                    modal2_allcounts = ' Previously Completed: ' + previousActualTable.length + ', Recently Completed: ' + recentActualTable.length;


                    if (NaNcount > 0) { modal2_allcounts += ', No Lat/Long: ' + NaNcount; }
                }

                document.getElementById('RYG_Modal2_mapcounttitle').innerHTML = modal2_title;
                document.getElementById('RYG_Modal2_mapcountsubtitle').innerHTML = modal2_subtitle;
                document.getElementById('RYG_Modal2_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                //document.getElementById('RYG_Modal2_mapcountfooter1').innerHTML = modal2_allcounts;
                document.getElementById('RYG_Modal2_mapcountfooter2').innerHTML = NaNcountMessage;

                var OApoints = new L.layerGroup();
                var Uppoints = new L.layerGroup();


                var previousActualPoints = new L.layerGroup();
                var recentActualPoints = new L.layerGroup();
                var q1FcstPoints = new L.layerGroup();
                var q2FcstPoints = new L.layerGroup();
                var q3FcstPoints = new L.layerGroup();
                var q4FcstPoints = new L.layerGroup();
                var pushPoints = new L.layerGroup();
                var pullActualPoints = new L.layerGroup();
                var pullFcstPoints = new L.layerGroup();


                for (i in previousActualTable) {

                    var popup = '<b>Category:</b> ' + previousActualName +
                        '<br/><b>PACE Number:</b> ' + previousActualTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + previousActualTable[i][26] +
                        '<br/><b>Program:</b> ' + previousActualTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + previousActualTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + previousActualTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + previousActualTable[i][9] + '- ' + previousActualTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + previousActualTable[i][12] +
                        '<br/><b>Market:</b> ' + previousActualTable[i][13] +
                        '<br/><b>Submarket:</b> ' + previousActualTable[i][14] +
                        '<br/><b>City, State:</b> ' + previousActualTable[i][17] + ', ' + previousActualTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + previousActualTable[i][16] + ', ' + previousActualTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + previousActualTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + previousActualTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + previousActualTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + previousActualTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + previousActualTable[i][25] + ', ' + previousActualTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + previousActualTable[i][RYG2_recent_lat_index] + ', ' + previousActualTable[i][RYG2_recent_long_index],

                        loc = [parseFloat(previousActualTable[i][RYG2_recent_lat_index]), parseFloat(previousActualTable[i][RYG2_recent_long_index])],	//position found
                        previousActualTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#00cc00'
                        };

                    //console.log('test2');
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(previousActualTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    previousActualPoints.addLayer(marker);
                }

                for (i in recentActualTable) {

                    var popup = '<b>Category:</b> ' + recentActualName +
                        '<br/><b>PACE Number:</b> ' + recentActualTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + recentActualTable[i][26] +
                        '<br/><b>Program:</b> ' + recentActualTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + recentActualTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + recentActualTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + recentActualTable[i][9] + '- ' + recentActualTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + recentActualTable[i][12] +
                        '<br/><b>Market:</b> ' + recentActualTable[i][13] +
                        '<br/><b>Submarket:</b> ' + recentActualTable[i][14] +
                        '<br/><b>City, State:</b> ' + recentActualTable[i][17] + ', ' + recentActualTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + recentActualTable[i][16] + ', ' + recentActualTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + recentActualTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + recentActualTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + recentActualTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + recentActualTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + recentActualTable[i][25] + ', ' + recentActualTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + recentActualTable[i][RYG2_recent_lat_index] + ', ' + recentActualTable[i][RYG2_recent_long_index],

                        loc = [parseFloat(recentActualTable[i][RYG2_recent_lat_index]), parseFloat(recentActualTable[i][RYG2_recent_long_index])],	//position found
                        recentActualTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#003300'
                        };

                    //console.log('test2');
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentActualTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    recentActualPoints.addLayer(marker);
                }

                if (cellSelected != 'ACT') {  //For Actual selection we do not hsow the forecast, push, or pull series. (we already rolled pull actuals into actual series)

                    for (i in q1FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q1 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q1FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q1FcstTable[i][26] +
                            '<br/><b>Program:</b> ' + q1FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q1FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q1FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q1FcstTable[i][9] + '- ' + q1FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q1FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q1FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q1FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q1FcstTable[i][17] + ', ' + q1FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q1FcstTable[i][16] + ', ' + q1FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q1FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q1FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q1FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q1FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q1FcstTable[i][25] + ', ' + q1FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q1FcstTable[i][RYG2_recent_lat_index] + ', ' + q1FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q1FcstTable[i][RYG2_recent_lat_index]), parseFloat(q1FcstTable[i][RYG2_recent_long_index])],	//position found
                            q1FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#00008b'
                            };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(q1FcstTableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q1FcstPoints.addLayer(marker);
                    }

                    for (i in q2FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q2 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q2FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q2FcstTable[i][26] +
                            '<br/><b>Program:</b> ' + q2FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q2FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q2FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q2FcstTable[i][9] + '- ' + q2FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q2FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q2FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q2FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q2FcstTable[i][17] + ', ' + q2FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q2FcstTable[i][16] + ', ' + q2FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q2FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q2FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q2FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q2FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q2FcstTable[i][25] + ', ' + q2FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q2FcstTable[i][RYG2_recent_lat_index] + ', ' + q2FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q2FcstTable[i][RYG2_recent_lat_index]), parseFloat(q2FcstTable[i][RYG2_recent_long_index])],	//position found
                            q2FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#0066cc'
                            };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(q2FcstTableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q2FcstPoints.addLayer(marker);
                    }

                    for (i in q3FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q3 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q3FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q3FcstTable[i][26] +
                            '<br/><b>Program:</b> ' + q3FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q3FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q3FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q3FcstTable[i][9] + '- ' + q3FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q3FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q3FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q3FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q3FcstTable[i][17] + ', ' + q3FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q3FcstTable[i][16] + ', ' + q3FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q3FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q3FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q3FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q3FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q3FcstTable[i][25] + ', ' + q3FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q3FcstTable[i][RYG2_recent_lat_index] + ', ' + q3FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q3FcstTable[i][RYG2_recent_lat_index]), parseFloat(q3FcstTable[i][RYG2_recent_long_index])],	//position found
                            q3FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#4da6ff'
                            };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(q3FcstTableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q3FcstPoints.addLayer(marker);
                    }

                    for (i in q4FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q4 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q4FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q4FcstTable[i][26] +
                            '<br/><b>Program:</b> ' + q4FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q4FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q4FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q4FcstTable[i][9] + '- ' + q4FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q4FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q4FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q4FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q4FcstTable[i][17] + ', ' + q4FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q4FcstTable[i][16] + ', ' + q4FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q4FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q4FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q4FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q4FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q4FcstTable[i][25] + ', ' + q4FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q4FcstTable[i][RYG2_recent_lat_index] + ', ' + q4FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q4FcstTable[i][RYG2_recent_lat_index]), parseFloat(q4FcstTable[i][RYG2_recent_long_index])],	//position found
                            q4FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#87cefa'
                            };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(q4FcstTableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q4FcstPoints.addLayer(marker);
                    }

                    for (i in pushTable) {

                        var popup = '<b>Category:</b> ' + 'Push' +
                            '<br/><b>PACE Number:</b> ' + pushTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + pushTable[i][26] +
                            '<br/><b>Program:</b> ' + pushTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + pushTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + pushTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + pushTable[i][9] + '- ' + pushTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + pushTable[i][12] +
                            '<br/><b>Market:</b> ' + pushTable[i][13] +
                            '<br/><b>Submarket:</b> ' + pushTable[i][14] +
                            '<br/><b>City, State:</b> ' + pushTable[i][17] + ', ' + pushTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + pushTable[i][16] + ', ' + pushTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + pushTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + pushTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + pushTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + pushTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + pushTable[i][25] + ', ' + pushTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + pushTable[i][RYG2_recent_lat_index] + ', ' + pushTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(pushTable[i][RYG2_recent_lat_index]), parseFloat(pushTable[i][RYG2_recent_long_index])],	//position found
                            pushTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#ffb366'
                            };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(pushTableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        pushPoints.addLayer(marker);
                    }

                    //pull series arent in forecast, they are rolled into actuals and quarterly forecasts
                    if (cellSelected == "PLAN") {

                        for (i in pullActualTable) {

                            var popup = '<b>Category:</b> ' + 'Pull Completed' +
                                '<br/><b>PACE Number:</b> ' + pullActualTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + pullActualTable[i][26] +
                                '<br/><b>Program:</b> ' + pullActualTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + pullActualTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + pullActualTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + pullActualTable[i][9] + '- ' + pullActualTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + pullActualTable[i][12] +
                                '<br/><b>Market:</b> ' + pullActualTable[i][13] +
                                '<br/><b>Submarket:</b> ' + pullActualTable[i][14] +
                                '<br/><b>City, State:</b> ' + pullActualTable[i][17] + ', ' + pullActualTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + pullActualTable[i][16] + ', ' + pullActualTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + pullActualTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + pullActualTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + pullActualTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + pullActualTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + pullActualTable[i][25] + ', ' + pullActualTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + pullActualTable[i][RYG2_recent_lat_index] + ', ' + pullActualTable[i][RYG2_recent_long_index],

                                loc = [parseFloat(pullActualTable[i][RYG2_recent_lat_index]), parseFloat(pullActualTable[i][RYG2_recent_long_index])],	//position found
                                pullActualTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#aa00ff'
                                };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(pullActualTableoptions) });
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            pullActualPoints.addLayer(marker);
                        }


                        for (i in pullFcstTable) {

                            var popup = '<b>Category:</b> ' + 'Pull Forecasted' +
                                '<br/><b>PACE Number:</b> ' + pullFcstTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + pullFcstTable[i][26] +
                                '<br/><b>Program:</b> ' + pullFcstTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + pullFcstTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + pullFcstTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + pullFcstTable[i][9] + '- ' + pullFcstTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + pullFcstTable[i][11] +
                                '<br/><b>Market:</b> ' + pullFcstTable[i][13] +
                                '<br/><b>Submarket:</b> ' + pullFcstTable[i][14] +
                                '<br/><b>City, State:</b> ' + pullFcstTable[i][17] + ', ' + pullFcstTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + pullFcstTable[i][16] + ', ' + pullFcstTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + pullFcstTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + pullFcstTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + pullFcstTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + pullFcstTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + pullFcstTable[i][25] + ', ' + pullFcstTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + pullFcstTable[i][RYG2_recent_lat_index] + ', ' + pullFcstTable[i][RYG2_recent_long_index],

                                loc = [parseFloat(pullFcstTable[i][RYG2_recent_lat_index]), parseFloat(pullFcstTable[i][RYG2_recent_long_index])],	//position found
                                pullFcstTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#cc66ff'
                                };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(pullFcstTableoptions) });
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            pullFcstPoints.addLayer(marker);
                        }
                    }
                }

                $('#LOADING_RYG_Modal2').hide();
                $('#recentRYG_Modal2DetailSection1').show();

                document.getElementById('RYG_Modal2_mapdiv').innerHTML = "<div id='RYG_Modal2_mapid' style='height: 450px;'></div>";

                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    "Satelite": sat
                    //"Topo": topo
                };

                if (cellSelected == "ACT") {
                    var map = L.map("RYG_Modal2_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, previousActualPoints, recentActualPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else if (cellSelected == 'FCST') {
                    var map = L.map("RYG_Modal2_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, previousActualPoints, recentActualPoints, q1FcstPoints, q2FcstPoints, q3FcstPoints, q4FcstPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                else {
                    var map = L.map("RYG_Modal2_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, previousActualPoints, recentActualPoints, q1FcstPoints, q2FcstPoints, q3FcstPoints, q4FcstPoints, pushPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                //********** new add geojson layer section **********

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
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            featureLayer.bindPopup(feature.properties.Region);
                        }
                        else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            featureLayer.bindPopup(feature.properties.AVP);
                        }
                        else {
                            featureLayer.bindPopup(feature.properties.Market_Lon);
                        }
                    } else {
                        featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: style,
                    onEachFeature: onEachFeature
                }).addTo(map);

                //********** new add geojson layer section end **********

                var previousActualOverlay = "Previously Completed (" + previousActualTable.length + ")"; //doesnt seem like you can use a variable within the overlay list as a layer name

                if (cellSelected == "PLAN") {

                    //document.getElementById().style.height = '190px';

                    //document.getElementsByClassName("info.legend_RYG").style.height= '190px'
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints,
                                "Pull Completed": pullActualPoints,
                                "Pull Forecast": pullFcstPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints,
                                "Pull Completed": pullActualPoints,
                                "Pull Forecast": pullFcstPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints,
                                "Pull Completed": pullActualPoints,
                                "Pull Forecast": pullFcstPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Previously Completed": previousActualPoints,
                            "Recently Completed": recentActualPoints,
                            "Q1 Forecast": q1FcstPoints,
                            "Q2 Forecast": q2FcstPoints,
                            "Q3 Forecast": q3FcstPoints,
                            "Q4 Forecast": q4FcstPoints,
                            "Push": pushPoints,
                            "Pull Completed": pullActualPoints,
                            "Pull Forecast": pullFcstPoints
                        };
                    }
                } else if (cellSelected == "FCST") {
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints
                            };

                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Previously Completed": previousActualPoints,
                            "Recently Completed": recentActualPoints,
                            "Q1 Forecast": q1FcstPoints,
                            "Q2 Forecast": q2FcstPoints,
                            "Q3 Forecast": q3FcstPoints,
                            "Q4 Forecast": q4FcstPoints,
                            "Push": pushPoints
                        };
                    }
                }

                else {
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Previously Completed": previousActualPoints,
                            "Recently Completed": recentActualPoints
                        };
                    }
                }

                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };
                var control = L.control.zoomBox(options);

                map.addControl(control);

                L.control.scale({ position: 'bottomright', metric: false }).addTo(map);

                L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                map.invalidateSize();
                map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                function getColor(d) {
                    return d === previousActualName + ' (' + previousActualTable.length + ')' ? "#00cc00" :
                        d === recentActualName + ' (' + recentActualTable.length + ')' ? "#003300" :
                            d === 'Q1 Forecast (' + q1FcstTable.length + ')' ? "#00008b" :
                                d === 'Q2 Forecast (' + q2FcstTable.length + ')' ? "#0066cc" :
                                    d === 'Q3 Forecast (' + q3FcstTable.length + ')' ? "#4da6ff" :
                                        d === 'Q4 Forecast (' + q4FcstTable.length + ')' ? "#87cefa" :
                                            d === 'Push (' + pushTable.length + ')' ? "#ffb366" :
                                                d === 'Pull Completed (' + pullActualTable.length + ')' ? "#aa00ff" :
                                                    d === 'Pull Forecast (' + pullFcstTable.length + ')' ? "#cc66ff" :
                                                        "#fffff";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    //var div = L.DomUtil.create('div', 'info legend_RYG2_PLAN');
                    var div = '';
                    var categories = [];
                    if (cellSelected == "PLAN") {
                        categories = [previousActualName + ' (' + previousActualTable.length + ')', recentActualName + ' (' + recentActualTable.length + ')',
                        'Q1 Forecast (' + q1FcstTable.length + ')', 'Q2 Forecast (' + q2FcstTable.length + ')', 'Q3 Forecast (' + q3FcstTable.length + ')',
                        'Q4 Forecast (' + q4FcstTable.length + ')', 'Push (' + pushTable.length + ')', 'Pull Completed (' + pullActualTable.length + ')',
                        'Pull Forecast (' + pullFcstTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG2_PLAN');
                    }
                    else if (cellSelected == "FCST") {
                        categories = [previousActualName + ' (' + previousActualTable.length + ')', recentActualName + ' (' + recentActualTable.length + ')',
                        'Q1 Forecast (' + q1FcstTable.length + ')', 'Q2 Forecast (' + q2FcstTable.length + ')', 'Q3 Forecast (' + q3FcstTable.length + ')',
                        'Q4 Forecast (' + q4FcstTable.length + ')', 'Push (' + pushTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG2_FCST');
                    }

                    else {
                        categories = [previousActualName + ' (' + previousActualTable.length + ')', recentActualName + ' (' + recentActualTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG2_ACT');
                    }

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                console.log("RYG_Modal2_Map_Testpoint_Finished");

            }

            // ********** RYG MODAL2 END **********

            function recent_RYG_Modal2_Map2(RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, stringmonthnum, cellSelected, PlanFcst, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory) {

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var monthSelectedPrevious = '';

                if (stringmonthnum > 1) {
                    monthSelectedPrevious = month[stringmonthnum - 2];
                }

                var previousActualName = '';

                if (stringmonthnum == 1) { previousActualName = ''; }
                else if (stringmonthnum == 2) { previousActualName = 'Jan Actual'; }
                else { previousActualName = 'Jan - ' + monthSelectedPrevious + ' Actual'; }

                var recentActualName = '';

                if (curmonthspan == monthSelected) { recentActualName = curmonthspan + ' Actual'; }

                else { recentActualName = monthSelected + ' - ' + curmonthspan + ' Actual'; }

                console.log('previousActualName: ' + previousActualName);
                console.log('recentActualName: ' + recentActualName);

                //code which applies regardless of plan, forecast, actual selection:

                var RYG2_recent_lat_index = 27; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
                var RYG2_recent_long_index = 28; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long


                var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
                var stringyearnum = pulldown_month.substring(0, 4);

                document.getElementById('Modal_Year_Title').innerHTML = " - " + stringyearnum;

                var recentSelectedCount = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childElementCount;
                var recentDetailColCount = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childElementCount;


                console.log("RYG_Modal2_Map_Testpoint_Start");
                console.log(recentSelectedCount);
                console.log(recentDetailColCount);

                var j = 0;
                var i = 0;

                //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                var maxlat = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_lat_index].innerHTML);
                var minlat = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_lat_index].innerHTML);
                var maxlong = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_long_index].innerHTML);
                var minlong = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_long_index].innerHTML);

                if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG2_recent_long_index].innerHTML))) {
                    maxlat = 48;
                    minlat = 25;
                    maxlong = -66;
                    minlong = -125;
                }

                var recentFilteredTable = []; //entire filtered table with all series, including hidden ones - Note that Actual table will include ONLY the Actuals

                var recentUpcomingTable = [];
                var upcomingindex = 0;
                var recentOnAirTable = [];
                var onairindex = 0;


                var previousActualTable = [];
                var previousActualIndex = 0;
                var recentActualTable = [];
                var recentActualIndex = 0;
                var q1FcstTable = [];
                var q1FcstIndex = 0;
                var q2FcstTable = [];
                var q2FcstIndex = 0;
                var q3FcstTable = [];
                var q3FcstIndex = 0;
                var q4FcstTable = [];
                var q4FcstIndex = 0;
                var pushTable = [];
                var pushIndex = 0;
                var pullActualTable = [];
                var pullActualIndex = 0;
                var pullFcstTable = [];
                var pullFcstIndex = 0;


                var concatlatlong = [];
                var NaNTable = [];
                var NaNcount = 0;
                var POENaNCount = 0;
                var FCSTNaNCount = 0;
                var ACTNaNCount = 0;
                var NancountMessage = '';

                //loop through the visible (filtered) rows of the detail table and grab the data. Store the rows in different tables for the different layers
                for (i = 0; i < recentSelectedCount; i++) {
                    recentFilteredTable[i] = [];
                    recentUpcomingTable[upcomingindex] = [];
                    recentOnAirTable[onairindex] = [];

                    previousActualTable[previousActualIndex] = [];
                    recentActualTable[recentActualIndex] = [];
                    q1FcstTable[q1FcstIndex] = [];
                    q2FcstTable[q2FcstIndex] = [];
                    q3FcstTable[q3FcstIndex] = [];
                    q4FcstTable[q4FcstIndex] = [];
                    pushTable[pushIndex] = [];
                    pullActualTable[pullActualIndex] = [];
                    pullFcstTable[pullFcstIndex] = [];

                    concatlatlong[i] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML + $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML;

                    if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML))) {
                        //dont adjust max min based on NaN
                        NaNcount++;
                        ACTNaNCount++; //ACT table is already filtered on Actuals, so nay NaN for missing lat longs in that table will apply

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML.substring(0, 4) != 'PULL') {
                            POENaNCount++;
                        }

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML.substring(0, 4) != 'PUSH') {
                            FCSTNaNCount++;
                        }

                    }

                    else {
                        maxlat = Math.max(maxlat, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML));
                        minlat = Math.min(minlat, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML));
                        maxlong = Math.max(maxlong, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML));
                        minlong = Math.min(minlong, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML));
                    }


                    for (j = 0; j < recentDetailColCount; j++) {
                        //console.log($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                        recentFilteredTable[i][j] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                    }

                    //console.log(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML));

                    if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG2_recent_long_index].innerHTML))) {
                        //dont map if lat or long is NaN
                        ;
                    }

                    //below puts into groups

                    else if (cellSelected == "PLAN") {

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                previousActualTable[previousActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            previousActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "RECENT " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                recentActualTable[recentActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            recentActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q1F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q1FcstTable[q1FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q1FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q2F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q2FcstTable[q2FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q2FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q3F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q3FcstTable[q3FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q3FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q4F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q4FcstTable[q4FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q4FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PUSH " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pushTable[pushIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pushIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL RECENT " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pullActualTable[pullActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pullActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q1F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q2F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q3F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q4F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pullFcstTable[pullFcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pullFcstIndex++;
                        }

                    }

                    // FCST button clicked
                    else if (cellSelected == "FCST") {

                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PREVIOUS " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                previousActualTable[previousActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            previousActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "RECENT " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL RECENT " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                recentActualTable[recentActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            recentActualIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q1F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q1F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q1FcstTable[q1FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q1FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q2F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q2F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q2FcstTable[q2FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q2FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q3F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q3F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q3FcstTable[q3FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q3FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "Q4F " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL Q4F " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                q4FcstTable[q4FcstIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            q4FcstIndex++;
                        }

                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PUSH " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                pushTable[pushIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            pushIndex++;
                        }

                    }

                    //ONAIR button clicked
                    else {


                        if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PREVIOUS " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL PREVIOUS " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                previousActualTable[previousActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            previousActualIndex++;
                        }


                        else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "RECENT " + RecentMS ||
                            $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == "PULL RECENT " + RecentMS) {

                            for (k = 0; k < recentDetailColCount; k++) {
                                recentActualTable[recentActualIndex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                            }

                            recentActualIndex++;
                        }

                    }
                }

                //check to see if an empty row exists in the last row of the table and remove it if so

                if (previousActualTable[previousActualTable.length - 1].length == 0) {
                    previousActualTable.splice(-1, 1);
                }

                if (recentActualTable[recentActualTable.length - 1].length == 0) {
                    recentActualTable.splice(-1, 1);
                }

                if (cellSelected != "ACT") {

                    if (q1FcstTable[q1FcstTable.length - 1].length == 0) {
                        q1FcstTable.splice(-1, 1);
                    }

                    if (q2FcstTable[q2FcstTable.length - 1].length == 0) {
                        q2FcstTable.splice(-1, 1);
                    }

                    if (q3FcstTable[q3FcstTable.length - 1].length == 0) {
                        q3FcstTable.splice(-1, 1);
                    }

                    if (q4FcstTable[q4FcstTable.length - 1].length == 0) {
                        q4FcstTable.splice(-1, 1);
                    }

                    if (pushTable[pushTable.length - 1].length == 0) {
                        pushTable.splice(-1, 1);
                    }

                    if (cellSelected == "PLAN") {

                        if (pullActualTable[pullActualTable.length - 1].length == 0) {
                            pullActualTable.splice(-1, 1);
                        }

                        if (pullFcstTable[pullFcstTable.length - 1].length == 0) {
                            pullFcstTable.splice(-1, 1);
                        }

                    }
                }

                latlongdistinctcount = new Set(concatlatlong).size;

                if (NaNcount == 0) {
                    NaNcountMessage = '';
                }

                else if (NaNcount == 1) {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped - Highlighted Red in Table Below'
                }

                else {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped - Highlighted Red in Table Below'
                }

                if (monthSelected == '%') {
                    monthSelectedtext = 'Current Year'
                }
                else {
                    monthSelectedtext = monthSelected
                }

                if (PlanFcst == "PLAN") {
                    var PlanOrFcst = "POE";
                } else {
                    var PlanOrFcst = "Forecasted";
                }

                if (PlanFcst == "PLAN") {
                    var dotColor = "#808080"; //grey
                } else {
                    var dotColor = "#1E90FF"; //blue
                }

                var modal2_title = '';
                var modal2_subtitle = '';
                var modal2_allcounts = '';

                console.log(previousActualTable.length + recentActualTable.length
                    + q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length + pushTable.length);

                if (cellSelected == "PLAN") {
                    modal2_title = salesGeo + ' ' + tabCategory + ' Map - ' + stringyearnum + ' POE (' + (previousActualTable.length + recentActualTable.length
                        + q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length + pushTable.length + POENaNCount) + ')';
                    modal2_subtitle = ' Completed (' + (recentActualTable.length + previousActualTable.length) + ') , Remaining Forecasted (' + (q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length) + ')';

                    if (pushTable.length > 0) { modal2_subtitle += ' , Push (' + pushTable.length + ')'; }

                    if (POENaNCount > 0) { modal2_subtitle += ' , Missing Lat/Long (' + POENaNCount + ')'; }

                    modal2_allcounts = ' Previously Completed: ' + previousActualTable.length + ', Recently Completed: ' + recentActualTable.length + ', Q1 Forecast: ' + q1FcstTable.length + ', Q2 Forecast: ' + q2FcstTable.length
                        + ', Q3 Forecast: ' + q3FcstTable.length + ', Q4 Forecast: ' + q4FcstTable.length + ', Push: ' + pushTable.length + ', Pull Completed: ' + pullActualTable.length + ', Pull Forecast: ' + pullFcstTable.length;


                    if (NaNcount > 0) { modal2_allcounts += ', No Lat/Long: ' + NaNcount; }
                }


                if (cellSelected == "FCST") {
                    modal2_title = salesGeo + ' ' + tabCategory + ' Map - ' + stringyearnum + ' Forecast (' + (previousActualTable.length + recentActualTable.length
                        + q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length + FCSTNaNCount) + ')';
                    modal2_subtitle = ' Completed (' + (recentActualTable.length + previousActualTable.length) + ') , Remaining Forecasted (' + (q1FcstTable.length + q2FcstTable.length + q3FcstTable.length + q4FcstTable.length) + ')';

                    if (FCSTNaNCount > 0) { modal2_subtitle += ' , Missing Lat/Long (' + FCSTNaNCount + ')'; }


                    modal2_allcounts = ' Previously Completed: ' + previousActualTable.length + ', Recently Completed: ' + recentActualTable.length + ', Q1 Forecast: ' + q1FcstTable.length + ', Q2 Forecast: ' + q2FcstTable.length
                        + ', Q3 Forecast: ' + q3FcstTable.length + ', Q4 Forecast: ' + q4FcstTable.length + ', Push: ' + pushTable.length;


                    if (NaNcount > 0) { modal2_allcounts += ', No Lat/Long: ' + NaNcount; }
                }

                if (cellSelected == "ACT") {
                    modal2_title = salesGeo + ' ' + tabCategory + ' Map - ' + stringyearnum + ' Actuals (' + (previousActualTable.length + recentActualTable.length + ACTNaNCount) + ')';
                    modal2_subtitle = 'Previously Completed (' + previousActualTable.length + ') , Recently Completed (' + recentActualTable.length + ')';

                    if (ACTNaNCount > 0) { modal2_subtitle += ' , Missing Lat/Long (' + ACTNaNCount + ')'; }

                    modal2_allcounts = ' Previously Completed: ' + previousActualTable.length + ', Recently Completed: ' + recentActualTable.length;


                    if (NaNcount > 0) { modal2_allcounts += ', No Lat/Long: ' + NaNcount; }
                }

                document.getElementById('RYG_Modal2_mapcounttitle').innerHTML = modal2_title;
                document.getElementById('RYG_Modal2_mapcountsubtitle').innerHTML = modal2_subtitle;
                document.getElementById('RYG_Modal2_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                //document.getElementById('RYG_Modal2_mapcountfooter1').innerHTML = modal2_allcounts;
                document.getElementById('RYG_Modal2_mapcountfooter2').innerHTML = NaNcountMessage;

                var OApoints = new L.layerGroup();
                var Uppoints = new L.layerGroup();

                var regionLevels = [
                    0,  //REGION
                    0,
                    0,
                    0,
                    0,
                    1,  //AVP
                    2,  //MARKET
                    3,
                    3,  //SUBMARKET
                    4,  //COUNTY
                    4,
                    5,  //CITY
                    5,
                    5,
                    5,
                    5,
                    5,
                    5,
                    5
                ];

                var clusterOptions = {
                    regionLevels: regionLevels,
                    maxClusterRadius: 999,
                    addRegionToolTips: true,
                    allowClustersOfOne: false,
                    hullHugFactor: 'auto',
                    polygonOptions: {
                        color: 'blue', // default: '#0033ff'
                        weight: 4, // default: 5
                        opacity: 0.6, // default: 0.5
                        fill: true,
                        fillColor: 'white', // default: same as color
                        fillOpacity: 0.4, // default: 0.2
                        lineCap: 'round',
                        lineJoin: 'round'
                    }
                };

                var previousActualPoints = new L.MarkerClusterGroup(clusterOptions);
                var recentActualPoints = new L.MarkerClusterGroup(clusterOptions);
                var q1FcstPoints = new L.MarkerClusterGroup(clusterOptions);
                var q2FcstPoints = new L.MarkerClusterGroup(clusterOptions);
                var q3FcstPoints = new L.MarkerClusterGroup(clusterOptions);
                var q4FcstPoints = new L.MarkerClusterGroup(clusterOptions);
                var pushPoints = new L.MarkerClusterGroup(clusterOptions);
                var pullActualPoints = new L.MarkerClusterGroup(clusterOptions);
                var pullFcstPoints = new L.MarkerClusterGroup(clusterOptions);

                //var previousActualPoints = new L.layerGroup();
                //var recentActualPoints = new L.layerGroup();
                //var q1FcstPoints = new L.layerGroup();
                //var q2FcstPoints = new L.layerGroup();
                //var q3FcstPoints = new L.layerGroup();
                //var q4FcstPoints = new L.layerGroup();
                //var pushPoints = new L.layerGroup();
                //var pullActualPoints = new L.layerGroup();
                //var pullFcstPoints = new L.layerGroup();


                for (i in previousActualTable) {

                    var popup = '<b>Category:</b> ' + previousActualName +
                        '<br/><b>PACE Number:</b> ' + previousActualTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + previousActualTable[i][2] +
                        '<br/><b>Program:</b> ' + previousActualTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + previousActualTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + previousActualTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + previousActualTable[i][9] + '- ' + previousActualTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + previousActualTable[i][12] +
                        '<br/><b>Market:</b> ' + previousActualTable[i][13] +
                        '<br/><b>Submarket:</b> ' + previousActualTable[i][14] +
                        '<br/><b>City, State:</b> ' + previousActualTable[i][17] + ', ' + previousActualTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + previousActualTable[i][16] + ', ' + previousActualTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + previousActualTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + previousActualTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + previousActualTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + previousActualTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + previousActualTable[i][25] + ', ' + previousActualTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + previousActualTable[i][RYG2_recent_lat_index] + ', ' + previousActualTable[i][RYG2_recent_long_index],

                        loc = [parseFloat(previousActualTable[i][RYG2_recent_lat_index]), parseFloat(previousActualTable[i][RYG2_recent_long_index])],	//position found
                        previousActualTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#00cc00'
                        };

                    var RAN_REGION = previousActualTable[i][11];
                    var RAN_AVP = previousActualTable[i][12];
                    var RAN_MARKET = previousActualTable[i][13];
                    var RAN_SUBMARKET = previousActualTable[i][14];
                    var COUNTY = previousActualTable[i][16];
                    var CITY = previousActualTable[i][17];
                    var ZIPCODE = previousActualTable[i][18];

                    markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(previousActualTableoptions) };

                    //console.log('test2');
                    marker = new L.Marker(new L.latLng(loc), markerOptions );
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    previousActualPoints.addLayer(marker);
                }                
                
                for (i in recentActualTable) {

                    var popup = '<b>Category:</b> ' + recentActualName +
                        '<br/><b>PACE Number:</b> ' + recentActualTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + recentActualTable[i][2] +
                        '<br/><b>Program:</b> ' + recentActualTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + recentActualTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + recentActualTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + recentActualTable[i][9] + '- ' + recentActualTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + recentActualTable[i][12] +
                        '<br/><b>Market:</b> ' + recentActualTable[i][13] +
                        '<br/><b>Submarket:</b> ' + recentActualTable[i][14] +
                        '<br/><b>City, State:</b> ' + recentActualTable[i][17] + ', ' + recentActualTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + recentActualTable[i][16] + ', ' + recentActualTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + recentActualTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + recentActualTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + recentActualTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + recentActualTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + recentActualTable[i][25] + ', ' + recentActualTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + recentActualTable[i][RYG2_recent_lat_index] + ', ' + recentActualTable[i][RYG2_recent_long_index],

                        loc = [parseFloat(recentActualTable[i][RYG2_recent_lat_index]), parseFloat(recentActualTable[i][RYG2_recent_long_index])],	//position found
                        recentActualTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#003300'
                        };

                    var RAN_REGION = recentActualTable[i][11];
                    var RAN_AVP = recentActualTable[i][12];
                    var RAN_MARKET = recentActualTable[i][13];
                    var RAN_SUBMARKET = recentActualTable[i][14];
                    var COUNTY = recentActualTable[i][16];
                    var CITY = recentActualTable[i][17];
                    var ZIPCODE = recentActualTable[i][18];

                    markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(recentActualTableoptions) };

                    //console.log('test2');
                    marker = new L.Marker(new L.latLng(loc), markerOptions );
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    recentActualPoints.addLayer(marker);
                }

                if (cellSelected != 'ACT') {  //For Actual selection we do not hsow the forecast, push, or pull series. (we already rolled pull actuals into actual series)

                    for (i in q1FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q1 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q1FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q1FcstTable[i][2] +
                            '<br/><b>Program:</b> ' + q1FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q1FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q1FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q1FcstTable[i][9] + '- ' + q1FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q1FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q1FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q1FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q1FcstTable[i][17] + ', ' + q1FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q1FcstTable[i][16] + ', ' + q1FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q1FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q1FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q1FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q1FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q1FcstTable[i][25] + ', ' + q1FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q1FcstTable[i][RYG2_recent_lat_index] + ', ' + q1FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q1FcstTable[i][RYG2_recent_lat_index]), parseFloat(q1FcstTable[i][RYG2_recent_long_index])],	//position found
                            q1FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#00008b'
                            };

                        var RAN_REGION = q1FcstTable[i][11];
                        var RAN_AVP = q1FcstTable[i][12];
                        var RAN_MARKET = q1FcstTable[i][13];
                        var RAN_SUBMARKET = q1FcstTable[i][14];
                        var COUNTY = q1FcstTable[i][16];
                        var CITY = q1FcstTable[i][17];
                        var ZIPCODE = q1FcstTable[i][18];

                        markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(q1FcstTableoptions) };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), markerOptions );
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q1FcstPoints.addLayer(marker);
                    }

                    for (i in q2FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q2 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q2FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q2FcstTable[i][2] +
                            '<br/><b>Program:</b> ' + q2FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q2FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q2FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q2FcstTable[i][9] + '- ' + q2FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q2FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q2FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q2FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q2FcstTable[i][17] + ', ' + q2FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q2FcstTable[i][16] + ', ' + q2FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q2FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q2FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q2FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q2FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q2FcstTable[i][25] + ', ' + q2FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q2FcstTable[i][RYG2_recent_lat_index] + ', ' + q2FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q2FcstTable[i][RYG2_recent_lat_index]), parseFloat(q2FcstTable[i][RYG2_recent_long_index])],	//position found
                            q2FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#0066cc'
                            };

                        var RAN_REGION = q2FcstTable[i][11];
                        var RAN_AVP = q2FcstTable[i][12];
                        var RAN_MARKET = q2FcstTable[i][13];
                        var RAN_SUBMARKET = q2FcstTable[i][14];
                        var COUNTY = q2FcstTable[i][16];
                        var CITY = q2FcstTable[i][17];
                        var ZIPCODE = q2FcstTable[i][18];

                        markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(q2FcstTableoptions) };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q2FcstPoints.addLayer(marker);
                    }

                    for (i in q3FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q3 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q3FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q3FcstTable[i][2] +
                            '<br/><b>Program:</b> ' + q3FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q3FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q3FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q3FcstTable[i][9] + '- ' + q3FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q3FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q3FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q3FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q3FcstTable[i][17] + ', ' + q3FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q3FcstTable[i][16] + ', ' + q3FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q3FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q3FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q3FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q3FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q3FcstTable[i][25] + ', ' + q3FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q3FcstTable[i][RYG2_recent_lat_index] + ', ' + q3FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q3FcstTable[i][RYG2_recent_lat_index]), parseFloat(q3FcstTable[i][RYG2_recent_long_index])],	//position found
                            q3FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#4da6ff'
                            };

                        var RAN_REGION = q3FcstTable[i][11];
                        var RAN_AVP = q3FcstTable[i][12];
                        var RAN_MARKET = q3FcstTable[i][13];
                        var RAN_SUBMARKET = q3FcstTable[i][14];
                        var COUNTY = q3FcstTable[i][16];
                        var CITY = q3FcstTable[i][17];
                        var ZIPCODE = q3FcstTable[i][18];

                        markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(q3FcstTableoptions) };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q3FcstPoints.addLayer(marker);
                    }

                    for (i in q4FcstTable) {

                        var popup = '<b>Category:</b> ' + 'Q4 Forecast' +
                            '<br/><b>PACE Number:</b> ' + q4FcstTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + q4FcstTable[i][2] +
                            '<br/><b>Program:</b> ' + q4FcstTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + q4FcstTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + q4FcstTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + q4FcstTable[i][9] + '- ' + q4FcstTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + q4FcstTable[i][12] +
                            '<br/><b>Market:</b> ' + q4FcstTable[i][13] +
                            '<br/><b>Submarket:</b> ' + q4FcstTable[i][14] +
                            '<br/><b>City, State:</b> ' + q4FcstTable[i][17] + ', ' + q4FcstTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + q4FcstTable[i][16] + ', ' + q4FcstTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + q4FcstTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + q4FcstTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + q4FcstTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + q4FcstTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + q4FcstTable[i][25] + ', ' + q4FcstTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + q4FcstTable[i][RYG2_recent_lat_index] + ', ' + q4FcstTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(q4FcstTable[i][RYG2_recent_lat_index]), parseFloat(q4FcstTable[i][RYG2_recent_long_index])],	//position found
                            q4FcstTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#87cefa'
                            };

                        var RAN_REGION = q4FcstTable[i][11];
                        var RAN_AVP = q4FcstTable[i][12];
                        var RAN_MARKET = q4FcstTable[i][13];
                        var RAN_SUBMARKET = q4FcstTable[i][14];
                        var COUNTY = q4FcstTable[i][16];
                        var CITY = q4FcstTable[i][17];
                        var ZIPCODE = q4FcstTable[i][18];

                        markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(q4FcstTableoptions) };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        q4FcstPoints.addLayer(marker);
                    }

                    for (i in pushTable) {

                        var popup = '<b>Category:</b> ' + 'Push' +
                            '<br/><b>PACE Number:</b> ' + pushTable[i][1] +
                            '<br/><b>PACE Name:</b> ' + pushTable[i][2] +
                            '<br/><b>Program:</b> ' + pushTable[i][3] +
                            '<br/><b>Subprogram:</b> ' + pushTable[i][4] +
                            '<br/><b>Subgroup:</b> ' + pushTable[i][8] +
                            '<br/><b>Sales Region - VPGM Market:</b> ' + pushTable[i][9] + '- ' + pushTable[i][10] +
                            '<br/><b>ACE Region - AVP:</b> ' + pushTable[i][12] +
                            '<br/><b>Market:</b> ' + pushTable[i][13] +
                            '<br/><b>Submarket:</b> ' + pushTable[i][14] +
                            '<br/><b>City, State:</b> ' + pushTable[i][17] + ', ' + pushTable[i][15] +
                            '<br/><b>County, Zip Code:</b> ' + pushTable[i][16] + ', ' + pushTable[i][18] +
                            '<br/><b>Issued Date:</b> ' + pushTable[i][21] +
                            '<br/><b>' + RecentMS + ' Plan:</b> ' + pushTable[i][22] +
                            '<br/><b>' + RecentMS + ' Forecast:</b> ' + pushTable[i][23] +
                            '<br/><b>' + RecentMS + ' Actual:</b> ' + pushTable[i][24] +
                            '<br/><b>USID, FA Code:</b> ' + pushTable[i][25] + ', ' + pushTable[i][26] +
                            '<br/><b>Latitude, Longitude:</b> ' + pushTable[i][RYG2_recent_lat_index] + ', ' + pushTable[i][RYG2_recent_long_index],

                            loc = [parseFloat(pushTable[i][RYG2_recent_lat_index]), parseFloat(pushTable[i][RYG2_recent_long_index])],	//position found
                            pushTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#ffb366'
                            };

                        var RAN_REGION = pushTable[i][11];
                        var RAN_AVP = pushTable[i][12];
                        var RAN_MARKET = pushTable[i][13];
                        var RAN_SUBMARKET = pushTable[i][14];
                        var COUNTY = pushTable[i][16];
                        var CITY = pushTable[i][17];
                        var ZIPCODE = pushTable[i][18];

                        markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(pushTableoptions) };

                        //console.log('test2');
                        marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        pushPoints.addLayer(marker);
                    }

                    //pull series arent in forecast, they are rolled into actuals and quarterly forecasts
                    if (cellSelected == "PLAN") {

                        for (i in pullActualTable) {

                            var popup = '<b>Category:</b> ' + 'Pull Completed' +
                                '<br/><b>PACE Number:</b> ' + pullActualTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + pullActualTable[i][2] +
                                '<br/><b>Program:</b> ' + pullActualTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + pullActualTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + pullActualTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + pullActualTable[i][9] + '- ' + pullActualTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + pullActualTable[i][12] +
                                '<br/><b>Market:</b> ' + pullActualTable[i][13] +
                                '<br/><b>Submarket:</b> ' + pullActualTable[i][14] +
                                '<br/><b>City, State:</b> ' + pullActualTable[i][17] + ', ' + pullActualTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + pullActualTable[i][16] + ', ' + pullActualTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + pullActualTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + pullActualTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + pullActualTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + pullActualTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + pullActualTable[i][25] + ', ' + pullActualTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + pullActualTable[i][RYG2_recent_lat_index] + ', ' + pullActualTable[i][RYG2_recent_long_index],

                                loc = [parseFloat(pullActualTable[i][RYG2_recent_lat_index]), parseFloat(pullActualTable[i][RYG2_recent_long_index])],	//position found
                                pullActualTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#aa00ff'
                                };

                            var RAN_REGION = pullActualTable[i][11];
                            var RAN_AVP = pullActualTable[i][12];
                            var RAN_MARKET = pullActualTable[i][13];
                            var RAN_SUBMARKET = pullActualTable[i][14];
                            var COUNTY = pullActualTable[i][16];
                            var CITY = pullActualTable[i][17];
                            var ZIPCODE = pullActualTable[i][18];

                            markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(pullActualTableoptions) };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), markerOptions);
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            pullActualPoints.addLayer(marker);
                        }


                        for (i in pullFcstTable) {

                            var popup = '<b>Category:</b> ' + 'Pull Forecasted' +
                                '<br/><b>PACE Number:</b> ' + pullFcstTable[i][1] +
                                '<br/><b>PACE Name:</b> ' + pullFcstTable[i][2] +
                                '<br/><b>Program:</b> ' + pullFcstTable[i][3] +
                                '<br/><b>Subprogram:</b> ' + pullFcstTable[i][4] +
                                '<br/><b>Subgroup:</b> ' + pullFcstTable[i][8] +
                                '<br/><b>Sales Region - VPGM Market:</b> ' + pullFcstTable[i][9] + '- ' + pullFcstTable[i][10] +
                                '<br/><b>ACE Region - AVP:</b> ' + pullFcstTable[i][11] +
                                '<br/><b>Market:</b> ' + pullFcstTable[i][13] +
                                '<br/><b>Submarket:</b> ' + pullFcstTable[i][14] +
                                '<br/><b>City, State:</b> ' + pullFcstTable[i][17] + ', ' + pullFcstTable[i][15] +
                                '<br/><b>County, Zip Code:</b> ' + pullFcstTable[i][16] + ', ' + pullFcstTable[i][18] +
                                '<br/><b>Issued Date:</b> ' + pullFcstTable[i][21] +
                                '<br/><b>' + RecentMS + ' Plan:</b> ' + pullFcstTable[i][22] +
                                '<br/><b>' + RecentMS + ' Forecast:</b> ' + pullFcstTable[i][23] +
                                '<br/><b>' + RecentMS + ' Actual:</b> ' + pullFcstTable[i][24] +
                                '<br/><b>USID, FA Code:</b> ' + pullFcstTable[i][25] + ', ' + pullFcstTable[i][26] +
                                '<br/><b>Latitude, Longitude:</b> ' + pullFcstTable[i][RYG2_recent_lat_index] + ', ' + pullFcstTable[i][RYG2_recent_long_index],

                                loc = [parseFloat(pullFcstTable[i][RYG2_recent_lat_index]), parseFloat(pullFcstTable[i][RYG2_recent_long_index])],	//position found
                                pullFcstTableoptions = {
                                    iconShape: 'doughnut',
                                    iconSize: [12, 12],
                                    borderWidth: 4,
                                    borderColor: '#cc66ff'
                                };

                            var RAN_REGION = pullFcstTable[i][11];
                            var RAN_AVP = pullFcstTable[i][12];
                            var RAN_MARKET = pullFcstTable[i][13];
                            var RAN_SUBMARKET = pullFcstTable[i][14];
                            var COUNTY = pullFcstTable[i][16];
                            var CITY = pullFcstTable[i][17];
                            var ZIPCODE = pullFcstTable[i][18];

                            markerOptions = { regions: [RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, COUNTY, CITY], icon: L.BeautifyIcon.icon(pullFcstTableoptions) };

                            //console.log('test2');
                            marker = new L.Marker(new L.latLng(loc), markerOptions);
                            marker.setOpacity(.7);
                            marker.bindPopup(popup);
                            pullFcstPoints.addLayer(marker);
                        }
                    }
                }

                $('#LOADING_RYG_Modal2').hide();
                $('#recentRYG_Modal2DetailSection1').show();

                document.getElementById('RYG_Modal2_mapdiv').innerHTML = "<div id='RYG_Modal2_mapid' style='height: 450px;'></div>";

                

                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    "Satelite": sat
                    //"Topo": topo
                };

                if (cellSelected == "ACT") {
                    var map = L.map("RYG_Modal2_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, previousActualPoints, recentActualPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else if (cellSelected == 'FCST') {
                    var map = L.map("RYG_Modal2_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, previousActualPoints, recentActualPoints, q1FcstPoints, q2FcstPoints, q3FcstPoints, q4FcstPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                else {
                    var map = L.map("RYG_Modal2_mapid", {
                        attributionControl: false,
                        center: [39.73, -104.99],
                        zoom: 10,
                        layers: [streets, previousActualPoints, recentActualPoints, q1FcstPoints, q2FcstPoints, q3FcstPoints, q4FcstPoints, pushPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

                

                //********** new add geojson layer section **********

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
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            featureLayer.bindPopup(feature.properties.Region);
                        }
                        else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            featureLayer.bindPopup(feature.properties.AVP);
                        }
                        else {
                            featureLayer.bindPopup(feature.properties.Market_Lon);
                        }
                    } else {
                        featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: style,
                    onEachFeature: onEachFeature
                }).addTo(map);

                //********** new add geojson layer section end **********

                var previousActualOverlay = "Previously Completed (" + previousActualTable.length + ")"; //doesnt seem like you can use a variable within the overlay list as a layer name

                if (cellSelected == "PLAN") {

                    //document.getElementById().style.height = '190px';

                    //document.getElementsByClassName("info.legend_RYG").style.height= '190px'
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints,
                                "Pull Completed": pullActualPoints,
                                "Pull Forecast": pullFcstPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints,
                                "Pull Completed": pullActualPoints,
                                "Pull Forecast": pullFcstPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints,
                                "Pull Completed": pullActualPoints,
                                "Pull Forecast": pullFcstPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Previously Completed": previousActualPoints,
                            "Recently Completed": recentActualPoints,
                            "Q1 Forecast": q1FcstPoints,
                            "Q2 Forecast": q2FcstPoints,
                            "Q3 Forecast": q3FcstPoints,
                            "Q4 Forecast": q4FcstPoints,
                            "Push": pushPoints,
                            "Pull Completed": pullActualPoints,
                            "Pull Forecast": pullFcstPoints
                        };
                    }
                } else if (cellSelected == "FCST") {
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints,
                                "Q1 Forecast": q1FcstPoints,
                                "Q2 Forecast": q2FcstPoints,
                                "Q3 Forecast": q3FcstPoints,
                                "Q4 Forecast": q4FcstPoints,
                                "Push": pushPoints
                            };

                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Previously Completed": previousActualPoints,
                            "Recently Completed": recentActualPoints,
                            "Q1 Forecast": q1FcstPoints,
                            "Q2 Forecast": q2FcstPoints,
                            "Q3 Forecast": q3FcstPoints,
                            "Q4 Forecast": q4FcstPoints,
                            "Push": pushPoints
                        };
                    }
                }

                else {
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            var overlays = {
                                "ACE Region Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints
                            };
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            var overlays = {
                                "ACE AVP Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints
                            };
                        } else {
                            var overlays = {
                                "ACE Market Borders": MarketBoundaryLayer,
                                "Previously Completed": previousActualPoints,
                                "Recently Completed": recentActualPoints
                            };
                        }
                    } else {
                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer,
                            "Previously Completed": previousActualPoints,
                            "Recently Completed": recentActualPoints
                        };
                    }
                }

                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };
                var control = L.control.zoomBox(options);

                map.addControl(control);

                

                L.control.scale({ position: 'bottomright', metric: false }).addTo(map);

                L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                map.invalidateSize();
                map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                function getColor(d) {
                    return d === previousActualName + ' (' + previousActualTable.length + ')' ? "#00cc00" :
                        d === recentActualName + ' (' + recentActualTable.length + ')' ? "#003300" :
                            d === 'Q1 Forecast (' + q1FcstTable.length + ')' ? "#00008b" :
                                d === 'Q2 Forecast (' + q2FcstTable.length + ')' ? "#0066cc" :
                                    d === 'Q3 Forecast (' + q3FcstTable.length + ')' ? "#4da6ff" :
                                        d === 'Q4 Forecast (' + q4FcstTable.length + ')' ? "#87cefa" :
                                            d === 'Push (' + pushTable.length + ')' ? "#ffb366" :
                                                d === 'Pull Completed (' + pullActualTable.length + ')' ? "#aa00ff" :
                                                    d === 'Pull Forecast (' + pullFcstTable.length + ')' ? "#cc66ff" :
                                                        "#fffff";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    //var div = L.DomUtil.create('div', 'info legend_RYG2_PLAN');
                    var div = '';
                    var categories = [];
                    if (cellSelected == "PLAN") {
                        categories = [previousActualName + ' (' + previousActualTable.length + ')', recentActualName + ' (' + recentActualTable.length + ')',
                        'Q1 Forecast (' + q1FcstTable.length + ')', 'Q2 Forecast (' + q2FcstTable.length + ')', 'Q3 Forecast (' + q3FcstTable.length + ')',
                        'Q4 Forecast (' + q4FcstTable.length + ')', 'Push (' + pushTable.length + ')', 'Pull Completed (' + pullActualTable.length + ')',
                        'Pull Forecast (' + pullFcstTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG2_PLAN');
                    }
                    else if (cellSelected == "FCST") {
                        categories = [previousActualName + ' (' + previousActualTable.length + ')', recentActualName + ' (' + recentActualTable.length + ')',
                        'Q1 Forecast (' + q1FcstTable.length + ')', 'Q2 Forecast (' + q2FcstTable.length + ')', 'Q3 Forecast (' + q3FcstTable.length + ')',
                        'Q4 Forecast (' + q4FcstTable.length + ')', 'Push (' + pushTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG2_FCST');
                    }

                    else {
                        categories = [previousActualName + ' (' + previousActualTable.length + ')', recentActualName + ' (' + recentActualTable.length + ')'];
                        div = L.DomUtil.create('div', 'info legend_RYG2_ACT');
                    }

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                console.log("RYG_Modal2_Map_Testpoint_Finished");

            }

            // ********** RYG MODAL3 START **********

            var RYG3_recent_lat_index = 24; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var RYG3_recent_long_index = 25; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

            //function updateRYG_MODAL3(rowSelected, RecentMS) {
            function updateRYG_Modal3(monthSelected, RecentMS, cellSelected, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory) {

                console.log("updateRYG_Modal3 Start");
                $('#LOADING_RYG_Modal3').show();
                $('#recentRYG_Modal3DetailSection1').hide();
                $('#recentRYG_Modal3DetailSection2').hide();

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();

                var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();

                var stringyearnum = pulldown_month.substring(0, 4);

                if (pulldown_month.substring(5, 6) == 0) {
                    stringmonthnum = pulldown_month.substring(6, 7);
                }

                else {
                    stringmonthnum = pulldown_month.substring(5, 7);
                }

                var month = new Array();
                month[0] = "Jan";
                month[1] = "Feb";
                month[2] = "Mar";
                month[3] = "Apr";
                month[4] = "May";
                month[5] = "Jun";
                month[6] = "Jul";
                month[7] = "Aug";
                month[8] = "Sep";
                month[9] = "Oct";
                month[10] = "Nov";
                month[11] = "Dec";

                var monthSelected = month[stringmonthnum - 1];

                //var monthSelected = monthSelected;            
                var RecentMS = RecentMS;
                var RecentMStext = RecentMS;
                var RecentGroup = RecentMS;
                var rowSelected = RecentMS;

                document.getElementById('Recent_PlanMS_Header_RYGModal3').innerHTML = RecentMS + ' Plan';
                document.getElementById('Recent_ForecastMS_Header_RYGModal3').innerHTML = RecentMS + ' Forecast';
                document.getElementById('Recent_ActualMS_Header_RYGModal3').innerHTML = RecentMS + ' Actual';

                console.log('RYG_Modal3 function start');
                console.log("RYG3_groupGeo: " + groupGeo);
                console.log("RYG3_marketGeo: " + marketGeo);
                console.log("RYG3_monthSelected: " + monthSelected);
                console.log("RYG3_month: " + month);
                console.log("RYG3_pptp_custom_one: " + pptp_custom_one);
                console.log("RYG3_pptp_custom_two: " + pptp_custom_two);
                console.log("RYG3_pptp_custom_three: " + pptp_custom_three);
                console.log("RYG3_pptp_custom_four: " + pptp_custom_four);
                console.log("RYG3_pptp_custom_five: " + pptp_custom_five);
                console.log('RYG3_stringmonthnumVariable: ' + stringmonthnum);
                console.log('RYG3_RecentMSVariable: ' + RecentMS);

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/Get_RYG_Modal3",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'yearVariable': stringyearnum, 'RecentMSVariable': RecentMS, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        console.log('RYG3 Ajax Success');
                        loadPushPullCheck(data, RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, tabName, tabCategory);
                    },
                    error: function (data) {

                        alert('Currently unable to load map, please try again later');

                    }
                });
            }

            function loadPushPullCheck(data, RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, tabName, tabCategory) {
                var json = JSON.parse(data.d);
                if (json.length <= 0) {
                    $('#NODATA_SEARCH_RYG3').show();
                    $('#LOADING_RYG_Modal3').hide();
                    $('#ModalDisplay_RYG3').hide();
                }
                else {
                    load_RYG_Modal3_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, tabName, tabCategory);
                }
            }



            function load_RYG_Modal3_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected, tabName, tabCategory) {  // Recent and Upcoming Detail after user clicks on a row

                data = JSON.parse(data.d);
                // $.fn.dataTable.moment('MM-DD-YYYY');

                //$('#footer2').show();

                if (data.length <= 0) {
                    return;
                }
                else {
                    //var sitename = data[0]["SITE_NAME"];
                    $('#RYG_Modal3_Recent_Detail').dataTable().fnDestroy(); //destroy old table
                    $.fn.dataTable.moment('MM-DD-YYYY');
                    $('#RYG_Modal3_Recent_Detail').DataTable({ //build new table                
                        orderCellsTop: false,
                        fixedHeader: false,
                        paging: false,
                        sort: true,
                        scrollY: 200,
                        scrollCollapse: true,
                        scrollX: true,
                        order: [[0, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                        searching: true,
                        data: data,
                        info: false,
                        binfo: true,
                        dom: 'Bfrtip',
                        buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                            text: 'Update Map',
                            titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                            action: function (e, dt, node, config) {
                                MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected);
                            }
                        }],
                        //columnDefs: [{ visible: false, targets: 8 }],
                        columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                            { 'data': 'CATEGORY' },
                            { 'data': 'PACE_NUMBER' },
                            { 'data': 'PACE_NAME_SHORT' },
                            { 'data': 'PROGRAM' },
                            { 'data': 'SUBPROGRAM' },
                            { 'data': 'SUBPROGRAM2' },
                            { 'data': 'SUBPROGRAM3' },
                            { 'data': 'SUBPROGRAM4' },
                            { 'data': 'SUBGROUP' },
                            { 'data': 'SALES_REGION' },
                            { 'data': 'SALES_VPGM_MARKET' },
                            { 'data': 'RAN_REGION' },
                            { 'data': 'RAN_AVP' },
                            { 'data': 'RAN_MARKET' },
                            { 'data': 'RAN_SUBMARKET' },
                            { 'data': 'STATE' },
                            { 'data': 'COUNTY' },
                            { 'data': 'CITY' },
                            { 'data': 'ZIP_CODE' },
                            { 'data': 'RAN_INITIATIVE' },
                            { 'data': 'SPECTRUM' },
                            { 'data': 'ISSUED_DATE' },
                            { 'data': RecentMS + '_PLAN' },
                            { 'data': RecentMS + '_FORECAST' },
                            { 'data': RecentMS + '_ACTUAL' },
                            { 'data': 'USID' },
                            { 'data': 'FA_CODE' },
                            { 'data': 'LATITUDE' },
                            { 'data': 'LONGITUDE' },
                            { 'data': 'PACE_NAME_LONG' }

                        ],


                        //Highlight rows that don't have lat longs in the detail table in Red
                        createdRow: function (row, data, index) {
                            if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                                $(row).addClass('highlightRed');
                            }
                        },

                        "fnDrawCallback": function () {
                            $('#RYG_Modal3_Recent_Detail tr').find('td').each(function () {
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

                $('#recentRYG_Modal3DetailSection2').show();

                $(window).resize();

                MapOverlay(RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, cellSelected);

                function MapOverlay() {
                    var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                    var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            $.getJSON("RAN_Regions_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            $.getJSON("RAN_AVP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        } else {
                            $.getJSON("RAN_Markets_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                                prep(MarketBoundaryData);
                            });
                        }
                    }
                    else {
                        $.getJSON("VPGM_Markets_geojson_042720_FME.json", function (data) {
                            MarketBoundaryData = data;
                            prep(MarketBoundaryData);
                        });
                    }

                    function prep(MarketBoundaryData) {
                        console.log(MarketBoundaryData);
                        recent_RYG_Modal3_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, stringmonthnum, cellSelected, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory);
                    };
                }

            }

            function recent_RYG_Modal3_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, monthSelected, stringmonthnum, cellSelected, MarketBoundaryData, groupGeo, marketGeo, tabName, tabCategory) {

                var recentSelectedCount = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childElementCount;
                var recentDetailColCount = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childElementCount;
                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').text();
                console.log("RYG_Modal3_Map_Testpoint_Start");
                console.log(recentSelectedCount);
                console.log(recentDetailColCount);

                var j = 0;
                var i = 0;

                var RYG3_recent_lat_index = 27; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
                var RYG3_recent_long_index = 28; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long


                //console.log(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

                //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                var maxlat = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG3_recent_lat_index].innerHTML);
                var minlat = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG3_recent_lat_index].innerHTML);
                var maxlong = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG3_recent_long_index].innerHTML);
                var minlong = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG3_recent_long_index].innerHTML);

                if (isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG3_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG3_recent_long_index].innerHTML))) {
                    maxlat = 48;
                    minlat = 25;
                    maxlong = -66;
                    minlong = -125;
                }

                var recentFilteredTable = [];

                var RYG3PushTable = [];
                var RYG3PushIndex = 0;

                var RYG3PullActTable = [];
                var RYG3PullActIndex = 0;

                var RYG3PullFcstTable = [];
                var RYG3PullFcstIndex = 0;

                var concatlatlong = [];
                var NaNcount = 0;
                var RYG3PushNaNcount = 0;
                var RYG3PullNaNcount = 0;
                var NancountMessage = '';

                //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
                for (i = 0; i < recentSelectedCount; i++) {
                    recentFilteredTable[i] = [];
                    RYG3PushTable[RYG3PushIndex] = [];
                    RYG3PullActTable[RYG3PullActIndex] = [];
                    RYG3PullFcstTable[RYG3PullFcstIndex] = [];
                    concatlatlong[i] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_lat_index].innerHTML + $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_long_index].innerHTML;

                    if (isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_long_index].innerHTML))) {
                        //dont adjust max min based on NaN
                        NaNcount++;

                        if ($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'PUSH') {
                            RYG3PushNaNcount++;
                        }

                        else {
                            RYG3PullNaNcount++;
                        }
                    }

                    else {
                        maxlat = Math.max(maxlat, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_lat_index].innerHTML));
                        minlat = Math.min(minlat, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_lat_index].innerHTML));
                        maxlong = Math.max(maxlong, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_long_index].innerHTML));
                        minlong = Math.min(minlong, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_long_index].innerHTML));
                    }


                    for (j = 0; j < recentDetailColCount; j++) {
                        //console.log($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                        recentFilteredTable[i][j] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                    }

                    //console.log(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_lat_index].innerHTML));

                    if (isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG3_recent_long_index].innerHTML))) {
                        //dont map if lat or long is NaN
                        ;
                    }

                    // put into groups/layers

                    else if ($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'PUSH') {

                        for (k = 0; k < recentDetailColCount; k++) {
                            RYG3PushTable[RYG3PushIndex][k] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        }

                        RYG3PushIndex++;
                    }
                    else if ($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'PULL COMPLETE') {
                        for (l = 0; l < recentDetailColCount; l++) {
                            RYG3PullActTable[RYG3PullActIndex][l] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                        }

                        RYG3PullActIndex++;
                    }

                    else {

                        for (k = 0; k < recentDetailColCount; k++) {
                            RYG3PullFcstTable[RYG3PullFcstIndex][k] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        }

                        RYG3PullFcstIndex++;
                    }

                }

                //check to see if an empty row exists in the last row of the table and remove it if so
                if (RYG3PushTable[RYG3PushTable.length - 1].length == 0) {
                    RYG3PushTable.splice(-1, 1);
                }

                if (RYG3PullActTable[RYG3PullActTable.length - 1].length == 0) {
                    RYG3PullActTable.splice(-1, 1);
                }

                if (RYG3PullFcstTable[RYG3PullFcstTable.length - 1].length == 0) {
                    RYG3PullFcstTable.splice(-1, 1);
                }

                latlongdistinctcount = new Set(concatlatlong).size;

                if (NaNcount == 0) {
                    NaNcountMessage = '';
                }

                else if (NaNcount == 1) {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' job does NOT have a Lat/Long and cannot be mapped - Highlighted in Red below'
                }

                else {
                    NaNcountMessage = ' NOTE: ' + NaNcount + ' jobs do NOT have a Lat/Long and cannot be mapped - Highlighted in Red below'
                }

                if (monthSelected == '%') {
                    monthSelectedtext = 'Current Year'
                }
                else {
                    monthSelectedtext = monthSelected
                }

                document.getElementById('RYG_Modal3_mapcounttitle').innerHTML = marketGeoText + ' ' + tabCategory + ' Push/Pull Details Map';
                document.getElementById('RYG_Modal3_mapcountsubtitle').innerHTML = 'Pull (' + (RYG3PullActTable.length + RYG3PullFcstTable.length + RYG3PullNaNcount) + ') and Push (' + (RYG3PushTable.length + RYG3PushNaNcount) + ') Jobs';
                //document.getElementById('RYG_Modal3_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
                document.getElementById('RYG_Modal3_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                document.getElementById('RYG_Modal3_mapcountfooter2').innerHTML = NaNcountMessage;

                var RYG3PushPoints = new L.layerGroup();
                var RYG3PullActPoints = new L.layerGroup();
                var RYG3PullFcstPoints = new L.layerGroup();


                for (i in RYG3PushTable) {

                    var popup = '<b>Category:</b> ' + RYG3PushTable[i][0] +
                        '<br/><b>PACE Number:</b> ' + RYG3PushTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + RYG3PushTable[i][26] +
                        '<br/><b>Program:</b> ' + RYG3PushTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + RYG3PushTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + RYG3PushTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + RYG3PushTable[i][9] + '- ' + RYG3PushTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + RYG3PushTable[i][12] +
                        '<br/><b>Market:</b> ' + RYG3PushTable[i][13] +
                        '<br/><b>Submarket:</b> ' + RYG3PushTable[i][14] +
                        '<br/><b>City, State:</b> ' + RYG3PushTable[i][17] + ', ' + RYG3PushTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + RYG3PushTable[i][16] + ', ' + RYG3PushTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + RYG3PushTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + RYG3PushTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + RYG3PushTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + RYG3PushTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + RYG3PushTable[i][25] + ', ' + RYG3PushTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + RYG3PushTable[i][RYG3_recent_lat_index] + ', ' + RYG3PushTable[i][RYG3_recent_long_index],

                        loc = [parseFloat(RYG3PushTable[i][RYG3_recent_lat_index]), parseFloat(RYG3PushTable[i][RYG3_recent_long_index])],	//position found
                        RYG3PushTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#ffb366'
                        };


                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(RYG3PushTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    RYG3PushPoints.addLayer(marker);
                }


                for (i in RYG3PullActTable) {

                    var popup = '<b>Category:</b> ' + RYG3PullActTable[i][0] +
                        '<br/><b>PACE Number:</b> ' + RYG3PullActTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + RYG3PullActTable[i][26] +
                        '<br/><b>Program:</b> ' + RYG3PullActTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + RYG3PullActTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + RYG3PullActTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + RYG3PullActTable[i][9] + '- ' + RYG3PullActTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + RYG3PullActTable[i][12] +
                        '<br/><b>Market:</b> ' + RYG3PullActTable[i][13] +
                        '<br/><b>Submarket:</b> ' + RYG3PullActTable[i][14] +
                        '<br/><b>City, State:</b> ' + RYG3PullActTable[i][17] + ', ' + RYG3PullActTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + RYG3PullActTable[i][16] + ', ' + RYG3PullActTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + RYG3PullActTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + RYG3PullActTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + RYG3PullActTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + RYG3PullActTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + RYG3PullActTable[i][25] + ', ' + RYG3PullActTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + RYG3PullActTable[i][RYG3_recent_lat_index] + ', ' + RYG3PullActTable[i][RYG3_recent_long_index],

                        loc = [parseFloat(RYG3PullActTable[i][RYG3_recent_lat_index]), parseFloat(RYG3PullActTable[i][RYG3_recent_long_index])],	//position found
                        RYG3PullActTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#aa00ff'
                        };


                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(RYG3PullActTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    RYG3PullActPoints.addLayer(marker);
                }

                for (i in RYG3PullFcstTable) {

                    var popup = '<b>Category:</b> ' + RYG3PullFcstTable[i][0] +
                        '<br/><b>PACE Number:</b> ' + RYG3PullFcstTable[i][1] +
                        '<br/><b>PACE Name:</b> ' + RYG3PullFcstTable[i][26] +
                        '<br/><b>Program:</b> ' + RYG3PullFcstTable[i][3] +
                        '<br/><b>Subprogram:</b> ' + RYG3PullFcstTable[i][4] +
                        '<br/><b>Subgroup:</b> ' + RYG3PullFcstTable[i][8] +
                        '<br/><b>Sales Region - VPGM Market:</b> ' + RYG3PullFcstTable[i][9] + '- ' + RYG3PullFcstTable[i][10] +
                        '<br/><b>ACE Region - AVP:</b> ' + RYG3PullFcstTable[i][12] +
                        '<br/><b>Market:</b> ' + RYG3PullFcstTable[i][13] +
                        '<br/><b>Submarket:</b> ' + RYG3PullFcstTable[i][14] +
                        '<br/><b>City, State:</b> ' + RYG3PullFcstTable[i][17] + ', ' + RYG3PullFcstTable[i][15] +
                        '<br/><b>County, Zip Code:</b> ' + RYG3PullFcstTable[i][16] + ', ' + RYG3PullFcstTable[i][18] +
                        '<br/><b>Issued Date:</b> ' + RYG3PullFcstTable[i][21] +
                        '<br/><b>' + RecentMS + ' Plan:</b> ' + RYG3PullFcstTable[i][22] +
                        '<br/><b>' + RecentMS + ' Forecast:</b> ' + RYG3PullFcstTable[i][23] +
                        '<br/><b>' + RecentMS + ' Actual:</b> ' + RYG3PullFcstTable[i][24] +
                        '<br/><b>USID, FA Code:</b> ' + RYG3PullFcstTable[i][25] + ', ' + RYG3PullFcstTable[i][26] +
                        '<br/><b>Latitude, Longitude:</b> ' + RYG3PullFcstTable[i][RYG3_recent_lat_index] + ', ' + RYG3PullFcstTable[i][RYG3_recent_long_index],

                        loc = [parseFloat(RYG3PullFcstTable[i][RYG3_recent_lat_index]), parseFloat(RYG3PullFcstTable[i][RYG3_recent_long_index])],	//position found
                        RYG3PullFcstTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#cc66ff'
                        };


                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(RYG3PullFcstTableoptions) });
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    RYG3PullFcstPoints.addLayer(marker);
                }

                $('#LOADING_RYG_Modal3').hide();
                $('#recentRYG_Modal3DetailSection1').show();

                document.getElementById('RYG_Modal3_mapdiv').innerHTML = "<div id='RYG_Modal3_mapid' style='height: 450px;'></div>";

                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    "Satelite": sat
                    //"Topo": topo
                };

                var map = L.map("RYG_Modal3_mapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, RYG3PullActPoints, RYG3PullFcstPoints, RYG3PushPoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                //********** new add geojson layer section **********

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
                    if (groupGeo == "ACE") {
                        if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                            featureLayer.bindPopup(feature.properties.Region);
                        }
                        else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                            | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                            featureLayer.bindPopup(feature.properties.AVP);
                        }
                        else {
                            featureLayer.bindPopup(feature.properties.Market_Lon);
                        }
                    } else {
                        featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: style,
                    onEachFeature: onEachFeature
                }).addTo(map);

                //********** new add geojson layer section end **********

                if (groupGeo == "ACE") {
                    if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                        var overlays = {
                            "ACE Region Borders": MarketBoundaryLayer,
                            "2020 Pull Ins Complete": RYG3PullActPoints,
                            "2020 Pull Ins Forecast": RYG3PullFcstPoints,
                            "2020 Push Outs": RYG3PushPoints
                        };
                    } else if (marketGeo == "WEST-CARROLL" | marketGeo == "WEST-LABOY" | marketGeo == "WEST-COOKE" | marketGeo == "CENTRAL-SALEK" | marketGeo == "CENTRAL-MCNAMARA" | marketGeo == "CENTRAL-DREON" | marketGeo == "CENTRAL-CASEY"
                        | marketGeo == "SOUTHEAST-FLANNIGAN" | marketGeo == "SOUTHEAST-DUA" | marketGeo == "SOUTHEAST-COLE" | marketGeo == "NORTHEAST-WOEHR" | marketGeo == "NORTHEAST-SORICE" | marketGeo == "NORTHEAST-HORMANN" | marketGeo == "NORTHEAST-BARONE") {
                        var overlays = {
                            "ACE AVP Borders": MarketBoundaryLayer,
                            "2020 Pull Ins Complete": RYG3PullActPoints,
                            "2020 Pull Ins Forecast": RYG3PullFcstPoints,
                            "2020 Push Outs": RYG3PushPoints
                        };
                    } else {
                        var overlays = {
                            "ACE Market Borders": MarketBoundaryLayer,
                            "2020 Pull Ins Complete": RYG3PullActPoints,
                            "2020 Pull Ins Forecast": RYG3PullFcstPoints,
                            "2020 Push Outs": RYG3PushPoints
                        };
                    }
                } else {
                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer,
                        "2020 Pull Ins Complete": RYG3PullActPoints,
                        "2020 Pull Ins Forecast": RYG3PullFcstPoints,
                        "2020 Push Outs": RYG3PushPoints
                    };
                }

                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };
                var control = L.control.zoomBox(options);

                map.addControl(control);

                L.control.scale({ position: 'bottomright', metric: false }).addTo(map);

                L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                map.invalidateSize();
                map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                function getColor(d) {
                    return d === '2023 Pull Ins Complete (' + RYG3PullActTable.length + ')' ? "#aa00ff" :
                        d === '2023 Pull Ins Forecast (' + RYG3PullFcstTable.length + ')' ? "#cc66ff" :
                            d === '2023 Push Outs (' + RYG3PushTable.length + ')' ? "#ffb366" :
                                "#ff7f00";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'info legend_RYG_PushPull');
                    categories = ['2023 Pull Ins Complete (' + RYG3PullActTable.length + ')', '2023 Pull Ins Forecast (' + RYG3PullFcstTable.length + ')', '2023 Push Outs (' + RYG3PushTable.length + ')'];


                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                console.log("RYG_Modal3_Map_Testpoint_Finished");

            }

            // ********** RYG MODAL3 END **********

            // ****** TASK PROGRESSION TP Start ******

            function updateTaskProgression(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory, chartDiv, chartDiv2) {

                var tabName = '_tab' + activeTabNumber;

                $('#LOADING_Quad4' + tabName).show();
            <%--var Geo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            var salesGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
            var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();--%>

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetTASK_PRODUCTION_CHART",
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        TPdata = data;
                        TP_data_filter(TPdata, chartDiv + tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                        TP_data_filter2(TPdata, chartDiv2 + tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                        $('#LOADING_Quad4' + tabName).hide();
                        $('#Quad4' + tabName).show();
                    },
                    error: function (data) {
                    }
                });

            }

            var GlobalTPChart;

            function TP_data_filter(TPdata, chartDiv, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory) {
                var score = JSON.parse(TPdata.d);
                seriesData = [];
                categories = [];
                for (var i = 0; i < score.length; i++) {
                    var ceone = score[i]["PPTP_CUSTOM_ONE"];
                    var moddata = score[i]["PPTP_CUSTOM_ONE"];
                    //var startcategorylist = ["this", "is the", "start", "categorylist", "this", "is the", "start", "categorylist", "this", "is the", "start"];

                    if (score[i].PPTP_CUSTOM_ONE === "NSB ALL") {
                        for (var j = 0; j <= 2; j++) {
                            if (j == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["JI012_FORECAST"] - score[i]["JI012_COMPLETE"]), (score[i]["JI022_FORECAST"] - score[i]["JI022_COMPLETE"]), (score[i]["SS010_FORECAST"] - score[i]["SS010_COMPLETE"]),
                                    (score[i]["RE030_FORECAST"] - score[i]["RE030_COMPLETE"]), (score[i]["SS020_FORECAST"] - score[i]["SS020_COMPLETE"]), (score[i]["SS007_FORECAST"] - score[i]["SS007_COMPLETE"]),
                                    (score[i]["RE015_FORECAST"] - score[i]["RE015_COMPLETE"]), (score[i]["RE020_FORECAST"] - score[i]["RE020_COMPLETE"]),
                                    (score[i]["CI152_FORECAST"] - score[i]["CI152_COMPLETE"]), (score[i]["CI153_FORECAST"] - score[i]["CI153_COMPLETE"]),
                                    (score[i]["CI001_FORECAST"] - score[i]["CI001_COMPLETE"]), (score[i]["CI025_FORECAST"] - score[i]["CI025_COMPLETE"]),
                                    (score[i]["CI128_FORECAST"] - score[i]["CI128_COMPLETE"]), (score[i]["CI042_FORECAST"] - score[i]["CI042_COMPLETE"]),
                                    (score[i]["CI020_FORECAST"] - score[i]["CI020_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["YTD_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ji012perc = (score[i]["JI012_COMPLETE"] * 100 / score[i]["JI012_FORECAST"]).toFixed(1);
                                var ji022perc = (score[i]["JI022_COMPLETE"] * 100 / score[i]["JI022_FORECAST"]).toFixed(1);
                                var ss010perc = (score[i]["SS010_COMPLETE"] * 100 / score[i]["SS010_FORECAST"]).toFixed(1);
                                var re030perc = (score[i]["RE030_COMPLETE"] * 100 / score[i]["RE030_FORECAST"]).toFixed(1);
                                var ss020perc = (score[i]["SS020_COMPLETE"] * 100 / score[i]["SS020_FORECAST"]).toFixed(1);
                                var ss007perc = (score[i]["SS007_COMPLETE"] * 100 / score[i]["SS007_FORECAST"]).toFixed(1);
                                var re015perc = (score[i]["RE015_COMPLETE"] * 100 / score[i]["RE015_FORECAST"]).toFixed(1);
                                var re020perc = (score[i]["RE020_COMPLETE"] * 100 / score[i]["RE020_FORECAST"]).toFixed(1);
                                var ci152perc = (score[i]["CI152_COMPLETE"] * 100 / score[i]["CI152_FORECAST"]).toFixed(1);
                                var ci153perc = (score[i]["CI153_COMPLETE"] * 100 / score[i]["CI153_FORECAST"]).toFixed(1);
                                var ci001perc = (score[i]["CI001_COMPLETE"] * 100 / score[i]["CI001_FORECAST"]).toFixed(1);
                                var ci025perc = (score[i]["CI025_COMPLETE"] * 100 / score[i]["CI025_FORECAST"]).toFixed(1);
                                var ci128perc = (score[i]["CI128_COMPLETE"] * 100 / score[i]["CI128_FORECAST"]).toFixed(1);
                                var ci042perc = (score[i]["CI042_COMPLETE"] * 100 / score[i]["CI042_FORECAST"]).toFixed(1);
                                var ci020perc = (score[i]["CI020_COMPLETE"] * 100 / score[i]["CI020_FORECAST"]).toFixed(1);
                                var onairperc = (score[i]["YTD_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Search Ring Issued - SARF (JI012)  <b>' + ji012perc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Site Candidate Approved (SS010)  <b>' + ss010perc + '% ', 'Zoning Approved (RE030)  <b>' + re030perc + '%', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020perc + '% ',
                                'Structural Analysis Ordered (SS007)  <b>' + ss007perc + '% ', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%',
                                '3rd Party New Tower Construction Start (CI152) <b>' + ci152perc + '% ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153perc + '% ',
                                'Site Ready for Transport Delivery (CI001)  <b>' + ci001perc + '%', 'Construction Start (CI025)  <b>' + ci025perc + '%', 'Tower Work Start (CI128)  <b>' + ci128perc + '%',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (j == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["JI012_COMPLETE"], score[i]["JI022_COMPLETE"], score[i]["SS010_COMPLETE"], score[i]["RE030_COMPLETE"], score[i]["SS020_COMPLETE"], score[i]["SS007_COMPLETE"],
                                score[i]["RE015_COMPLETE"], score[i]["RE020_COMPLETE"], score[i]["CI152_COMPLETE"], score[i]["CI153_COMPLETE"], score[i]["CI001_COMPLETE"], score[i]["CI025_COMPLETE"], score[i]["CI128_COMPLETE"], score[i]["CI042_COMPLETE"], score[i]["CI020_COMPLETE"], score[i]["YTD_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Search Ring Issued - SARF (JI012)  <b>' + ji012perc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Site Candidate Approved (SS010)  <b>' + ss010perc + '% ', 'Zoning Approved (RE030)  <b>' + re030perc + '%', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020perc + '% ',
                                'Structural Analysis Ordered (SS007)  <b>' + ss007perc + '% ', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%',
                                '3rd Party New Tower Construction Start (CI152) <b>' + ci152perc + '% ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153perc + '% ',
                                'Site Ready for Transport Delivery (CI001)  <b>' + ci001perc + '%', 'Construction Start (CI025)  <b>' + ci025perc + '%', 'Tower Work Start (CI128)  <b>' + ci128perc + '%',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (j == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["JI012_NA"], score[i]["JI022_NA"], score[i]["SS010_NA"], score[i]["RE030_NA"], score[i]["SS020_NA"], score[i]["SS007_NA"],
                                    score[i]["RE015_NA"], score[i]["RE020_NA"], score[i]["CI152_NA"], score[i]["CI153_NA"], score[i]["CI001_NA"], score[i]["CI025_NA"], score[i]["CI128_NA"], score[i]["CI042_NA"], score[i]["CI020_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Search Ring Issued - SARF (JI012)  <b>' + ji012perc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Site Candidate Approved (SS010)  <b>' + ss010perc + '% ', 'Zoning Approved (RE030)  <b>' + re030perc + '%', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020perc + '% ',
                                'Structural Analysis Ordered (SS007)  <b>' + ss007perc + '% ', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%',
                                '3rd Party New Tower Construction Start (CI152) <b>' + ci152perc + '% ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153perc + '% ',
                                'Site Ready for Transport Delivery (CI001)  <b>' + ci001perc + '%', 'Construction Start (CI025)  <b>' + ci025perc + '%', 'Tower Work Start (CI128)  <b>' + ci128perc + '%',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }
                    else if (score[i].PPTP_CUSTOM_ONE === "MCA") {
                        for (var k = 0; k <= 2; k++) {
                            if (k == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["RE007_FORECAST"] - score[i]["RE007_COMPLETE"]), (score[i]["RE015_FORECAST"] - score[i]["RE015_COMPLETE"]), (score[i]["RE020_FORECAST"] - score[i]["RE020_COMPLETE"]),
                                    (score[i]["CI025_FORECAST"] - score[i]["CI025_COMPLETE"]), (score[i]["CI020_FORECAST"] - score[i]["CI020_COMPLETE"]), (score[i]["CI035_FORECAST"] - score[i]["CI035_COMPLETE"]),
                                    (score[i]["FORECASTED_COUNT"] - score[i]["YTD_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var re007perc = (score[i]["RE007_COMPLETE"] * 100 / score[i]["RE007_FORECAST"]).toFixed(1);
                                var re015perc = (score[i]["RE015_COMPLETE"] * 100 / score[i]["RE015_FORECAST"]).toFixed(1);
                                var re020perc = (score[i]["RE020_COMPLETE"] * 100 / score[i]["RE020_FORECAST"]).toFixed(1);
                                var ci025perc = (score[i]["CI025_COMPLETE"] * 100 / score[i]["CI025_FORECAST"]).toFixed(1);
                                var ci020perc = (score[i]["CI020_COMPLETE"] * 100 / score[i]["CI020_FORECAST"]).toFixed(1);
                                var ci035perc = (score[i]["CI035_COMPLETE"] * 100 / score[i]["CI035_FORECAST"]).toFixed(1);
                                var onairperc = (score[i]["YTD_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Tower Application Submitted (RE007)  <b>' + re007perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ',
                                'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Construction Started (CI025)  <b>' + ci025perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (k == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["RE007_COMPLETE"], score[i]["RE015_COMPLETE"], score[i]["RE020_COMPLETE"], score[i]["CI025_COMPLETE"],
                                score[i]["CI020_COMPLETE"], score[i]["CI035_COMPLETE"], score[i]["YTD_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Tower Application Submitted (RE007)  <b>' + re007perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ',
                                'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Construction Started (CI025)  <b>' + ci025perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (k == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["RE007_NA"], score[i]["RE015_NA"], score[i]["RE020_NA"], score[i]["CI025_NA"], score[i]["CI020_NA"],
                                    score[i]["CI035_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Tower Application Submitted (RE007)  <b>' + re007perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ',
                                'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Construction Started (CI025)  <b>' + ci025perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "CRAN ALL" | score[i].PPTP_CUSTOM_ONE === "5G mmWave ALL") {
                        for (var m = 0; m <= 2; m++) {
                            if (m == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["SS010_FORECAST"] - score[i]["SS010_COMPLETE"]), (score[i]["SS095_FORECAST"] - score[i]["SS095_COMPLETE"]),
                                    (score[i]["SS096_FORECAST"] - score[i]["SS096_COMPLETE"]), (score[i]["RE007_FORECAST"] - score[i]["RE007_COMPLETE"]),
                                    (score[i]["RE056_FORECAST"] - score[i]["RE056_COMPLETE"]), (score[i]["RE015_FORECAST"] - score[i]["RE015_COMPLETE"]), (score[i]["RE001_FORECAST"] - score[i]["RE001_COMPLETE"]),
                                    (score[i]["RE030_FORECAST"] - score[i]["RE030_COMPLETE"]), (score[i]["RE031_FORECAST"] - score[i]["RE031_COMPLETE"]), (score[i]["RE020_FORECAST"] - score[i]["RE020_COMPLETE"]),
                                    (score[i]["RE032_FORECAST"] - score[i]["RE032_COMPLETE"]), (score[i]["CI025_FORECAST"] - score[i]["CI025_COMPLETE"]), (score[i]["CI119_FORECAST"] - score[i]["CI119_COMPLETE"]),
                                    (score[i]["CI099_FORECAST"] - score[i]["CI099_COMPLETE"]), (score[i]["CI042_FORECAST"] - score[i]["CI042_COMPLETE"]),
                                    (score[i]["CI050_FORECAST"] - score[i]["CI050_COMPLETE"]), (score[i]["CI035_FORECAST"] - score[i]["CI035_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["YTD_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ss010perc = (score[i]["SS010_COMPLETE"] * 100 / score[i]["SS010_FORECAST"]).toFixed(1);
                                var ss095perc = (score[i]["SS095_COMPLETE"] * 100 / score[i]["SS095_FORECAST"]).toFixed(1);
                                var ss096perc = (score[i]["SS096_COMPLETE"] * 100 / score[i]["SS096_FORECAST"]).toFixed(1);
                                var re007perc = (score[i]["RE007_COMPLETE"] * 100 / score[i]["RE007_FORECAST"]).toFixed(1);
                                var re056perc = (score[i]["RE056_COMPLETE"] * 100 / score[i]["RE056_FORECAST"]).toFixed(1);
                                var re015perc = (score[i]["RE015_COMPLETE"] * 100 / score[i]["RE015_FORECAST"]).toFixed(1);
                                var re001perc = (score[i]["RE001_COMPLETE"] * 100 / score[i]["RE001_FORECAST"]).toFixed(1);
                                var re030perc = (score[i]["RE030_COMPLETE"] * 100 / score[i]["RE030_FORECAST"]).toFixed(1);
                                var re031perc = (score[i]["RE031_COMPLETE"] * 100 / score[i]["RE031_FORECAST"]).toFixed(1);
                                var re020perc = (score[i]["RE020_COMPLETE"] * 100 / score[i]["RE020_FORECAST"]).toFixed(1);
                                var re032perc = (score[i]["RE032_COMPLETE"] * 100 / score[i]["RE032_FORECAST"]).toFixed(1);
                                var ci025perc = (score[i]["CI025_COMPLETE"] * 100 / score[i]["CI025_FORECAST"]).toFixed(1);
                                var ci119perc = (score[i]["CI119_COMPLETE"] * 100 / score[i]["CI119_FORECAST"]).toFixed(1);
                                var ci099perc = (score[i]["CI099_COMPLETE"] * 100 / score[i]["CI099_FORECAST"]).toFixed(1);
                                var ci042perc = (score[i]["CI042_COMPLETE"] * 100 / score[i]["CI042_FORECAST"]).toFixed(1);
                                var ci050perc = (score[i]["CI050_COMPLETE"] * 100 / score[i]["CI050_FORECAST"]).toFixed(1);
                                var ci035perc = (score[i]["CI035_COMPLETE"] * 100 / score[i]["CI035_FORECAST"]).toFixed(1);
                                var onairperc = (score[i]["YTD_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Site Candidate Approved (SS010)  <b>' + ss010perc + '%', 'Structure Owner Engagement (SS095)  <b>' + ss095perc + '%',
                                'Attachment Agreement Completed (SS096)  <b>' + ss096perc + '% ',
                                'Tower Application Submitted (RE007)  <b>' + re007perc + '% ', 'Greensheet Requested (RE056)  <b>' + re056perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '%', 'Permit Submitted (RE001)  <b>' + re001perc + '%', 'Zoning Approved (RE030)  <b>' + re030perc + '% ',
                                'Building Permit Received (RE031)  <b>' + re031perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Compliance NTP Approved (RE032)  <b>' + re032perc + '% ',
                                'Construction Started (CI025)  <b>' + ci025perc + '% ', 'Equipment Installed (CI119)  <b>' + ci119perc + '% ', 'Permanent Power Received (CI099)  <b>' + ci099perc + '% ', 'Transport Delivered (CI042)  <b>' + ci042perc + '% ',
                                'Construction Complete (CI050)  <b>' + ci050perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["SS010_COMPLETE"], score[i]["SS095_COMPLETE"], score[i]["SS096_COMPLETE"], score[i]["RE007_COMPLETE"], score[i]["RE056_COMPLETE"], score[i]["RE015_COMPLETE"], score[i]["RE001_COMPLETE"], score[i]["RE030_COMPLETE"],
                                score[i]["RE031_COMPLETE"], score[i]["RE020_COMPLETE"], score[i]["RE032_COMPLETE"], score[i]["CI025_COMPLETE"], score[i]["CI119_COMPLETE"], score[i]["CI099_COMPLETE"], score[i]["CI042_COMPLETE"], score[i]["CI050_COMPLETE"], score[i]["CI035_COMPLETE"],
                                score[i]["YTD_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Site Candidate Approved (SS010)  <b>' + ss010perc + '%', 'Structure Owner Engagement (SS095)  <b>' + ss095perc + '%',
                                'Attachment Agreement Completed (SS096)  <b>' + ss096perc + '% ',
                                'Tower Application Submitted (RE007)  <b>' + re007perc + '% ', 'Greensheet Requested (RE056)  <b>' + re056perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '%', 'Permit Submitted (RE001)  <b>' + re001perc + '%', 'Zoning Approved (RE030)  <b>' + re030perc + '% ',
                                'Building Permit Received (RE031)  <b>' + re031perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Compliance NTP Approved (RE032)  <b>' + re032perc + '% ',
                                'Construction Started (CI025)  <b>' + ci025perc + '% ', 'Equipment Installed (CI119)  <b>' + ci119perc + '% ', 'Permanent Power Received (CI099)  <b>' + ci099perc + '% ', 'Transport Delivered (CI042)  <b>' + ci042perc + '% ',
                                'Construction Complete (CI050)  <b>' + ci050perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["SS010_NA"], score[i]["SS095_NA"], score[i]["SS096_NA"], score[i]["RE007_NA"], score[i]["RE056_NA"], score[i]["RE015_NA"], score[i]["RE001_NA"], score[i]["RE030_NA"],
                                    score[i]["RE031_NA"], score[i]["RE020_NA"], score[i]["RE032_NA"], score[i]["CI025_NA"], score[i]["CI119_NA"], score[i]["CI099_NA"], score[i]["CI042_NA"], score[i]["CI050_NA"], score[i]["CI035_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Site Candidate Approved (SS010)  <b>' + ss010perc + '%', 'Structure Owner Engagement (SS095)  <b>' + ss095perc + '%',
                                'Attachment Agreement Completed (SS096)  <b>' + ss096perc + '% ',
                                'Tower Application Submitted (RE007)  <b>' + re007perc + '% ', 'Greensheet Requested (RE056)  <b>' + re056perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '%', 'Permit Submitted (RE001)  <b>' + re001perc + '%', 'Zoning Approved (RE030)  <b>' + re030perc + '% ',
                                'Building Permit Received (RE031)  <b>' + re031perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Compliance NTP Approved (RE032)  <b>' + re032perc + '% ',
                                'Construction Started (CI025)  <b>' + ci025perc + '% ', 'Equipment Installed (CI119)  <b>' + ci119perc + '% ', 'Permanent Power Received (CI099)  <b>' + ci099perc + '% ', 'Transport Delivered (CI042)  <b>' + ci042perc + '% ',
                                'Construction Complete (CI050)  <b>' + ci050perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "5G mmWave ALL") {
                        for (var m = 0; m <= 2; m++) {
                            if (m == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["SS010_FORECAST"] - score[i]["SS010_COMPLETE"]), (score[i]["RE015_FORECAST"] - score[i]["RE015_COMPLETE"]), (score[i]["RE001_FORECAST"] - score[i]["RE001_COMPLETE"]),
                                    (score[i]["RE030_FORECAST"] - score[i]["RE030_COMPLETE"]), (score[i]["RE031_FORECAST"] - score[i]["RE031_COMPLETE"]),
                                    (score[i]["RE020_FORECAST"] - score[i]["RE020_COMPLETE"]), (score[i]["CI099_FORECAST"] - score[i]["CI099_COMPLETE"]),
                                    (score[i]["CI042_FORECAST"] - score[i]["CI042_COMPLETE"]),
                                    (score[i]["CI025_FORECAST"] - score[i]["CI025_COMPLETE"]), (score[i]["CI119_FORECAST"] - score[i]["CI119_COMPLETE"]), (score[i]["CI035_FORECAST"] - score[i]["CI035_COMPLETE"]),
                                    (score[i]["FORECASTED_COUNT"] - score[i]["YTD_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ss010perc = (score[i]["SS010_COMPLETE"] * 100 / score[i]["SS010_FORECAST"]).toFixed(1);
                                var re015perc = (score[i]["RE015_COMPLETE"] * 100 / score[i]["RE015_FORECAST"]).toFixed(1);
                                var re001perc = (score[i]["RE001_COMPLETE"] * 100 / score[i]["RE001_FORECAST"]).toFixed(1);
                                var re030perc = (score[i]["RE030_COMPLETE"] * 100 / score[i]["RE030_FORECAST"]).toFixed(1);
                                var re031perc = (score[i]["RE031_COMPLETE"] * 100 / score[i]["RE031_FORECAST"]).toFixed(1);
                                var re020perc = (score[i]["RE020_COMPLETE"] * 100 / score[i]["RE020_FORECAST"]).toFixed(1);
                                var ci099perc = (score[i]["CI099_COMPLETE"] * 100 / score[i]["CI099_FORECAST"]).toFixed(1);
                                var ci042perc = (score[i]["CI042_COMPLETE"] * 100 / score[i]["CI042_FORECAST"]).toFixed(1);
                                var ci025perc = (score[i]["CI025_COMPLETE"] * 100 / score[i]["CI025_FORECAST"]).toFixed(1);
                                var ci119perc = (score[i]["CI119_COMPLETE"] * 100 / score[i]["CI119_FORECAST"]).toFixed(1);
                                var ci035perc = (score[i]["CI035_COMPLETE"] * 100 / score[i]["CI035_FORECAST"]).toFixed(1);
                                var onairperc = (score[i]["YTD_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Site Candidate Approved (SS010)  <b>' + ss010perc + '%',
                                'Leasing Agreement Signed (RE015)  <b>' + re015perc + '%', 'Permit Submitted (RE001)  <b>' + re001perc + '%', 'Zoning Approved (RE030)  <b>' + re030perc + '% ', 'Building Permit Received (RE031)  <b>' + re031perc + '% ',
                                'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Permanent Power Received (CI099)  <b>' + ci099perc + '% ', 'Transport Delivered (CI042)  <b>' + ci042perc + '% ',
                                'Construction Started (CI025)  <b>' + ci025perc + '% ', 'Equipment Installed (CI119)  <b>' + ci119perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["SS010_COMPLETE"], score[i]["RE015_COMPLETE"], score[i]["RE001_COMPLETE"], score[i]["RE030_COMPLETE"], score[i]["RE031_COMPLETE"],
                                score[i]["RE020_COMPLETE"], score[i]["CI099_COMPLETE"], score[i]["CI042_COMPLETE"], score[i]["CI025_COMPLETE"], score[i]["CI119_COMPLETE"], score[i]["CI035_COMPLETE"],
                                score[i]["YTD_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Site Candidate Approved (SS010)  <b>' + ss010perc + '%',
                                'Leasing Agreement Signed (RE015)  <b>' + re015perc + '%', 'Permit Submitted (RE001)  <b>' + re001perc + '%', 'Zoning Approved (RE030)  <b>' + re030perc + '% ', 'Building Permit Received (RE031)  <b>' + re031perc + '% ',
                                'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Permanent Power Received (CI099)  <b>' + ci099perc + '% ', 'Transport Delivered (CI042)  <b>' + ci042perc + '% ',
                                'Construction Started (CI025)  <b>' + ci025perc + '% ', 'Equipment Installed (CI119)  <b>' + ci119perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["SS010_NA"], score[i]["RE015_NA"], score[i]["RE001_NA"], score[i]["RE030_NA"], score[i]["RE031_NA"],
                                    score[i]["RE020_NA"], score[i]["CI099_NA"], score[i]["CI042_NA"], score[i]["CI025_NA"], score[i]["CI119_NA"], score[i]["CI035_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Site Candidate Approved (SS010)  <b>' + ss010perc + '%',
                                'Leasing Agreement Signed (RE015)  <b>' + re015perc + '%', 'Permit Submitted (RE001)  <b>' + re001perc + '%', 'Zoning Approved (RE030)  <b>' + re030perc + '% ', 'Building Permit Received (RE031)  <b>' + re031perc + '% ',
                                'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Permanent Power Received (CI099)  <b>' + ci099perc + '% ', 'Transport Delivered (CI042)  <b>' + ci042perc + '% ',
                                'Construction Started (CI025)  <b>' + ci025perc + '% ', 'Equipment Installed (CI119)  <b>' + ci119perc + '% ',
                                'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (ONAIR)  <b>' + onairperc + '% '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "LTE 1C ALL") {
                        for (var l = 0; l <= 2; l++) {
                            if (l == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["FORECASTED_COUNT"] - score[i]["JI022_COMPLETE"]),
                                    (score[i]["FORECASTED_COUNT"] - score[i]["RE030_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["SS020_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["SS007_COMPLETE"]),
                                    (score[i]["FORECASTED_COUNT"] - score[i]["RE015_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["RE020_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["CI042_COMPLETE"]),
                                    (score[i]["FORECASTED_COUNT"] - score[i]["CI020_COMPLETE"]), (score[i]["FORECASTED_COUNT"] - score[i]["YTD_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ji022perc = (score[i]["JI022_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var re030perc = (score[i]["RE030_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ss020perc = (score[i]["SS020_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ss007perc = (score[i]["SS007_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var re015perc = (score[i]["RE015_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var re020perc = (score[i]["RE020_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ci042perc = (score[i]["CI042_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ci020perc = (score[i]["CI020_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var onairperc = (score[i]["YTD_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Zoning Approved (RE030)  <b>' + re030perc + '%', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020perc + '% ',
                                'Structural Analysis Ordered (SS007)  <b>' + ss007perc + '% ', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (l == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["JI022_COMPLETE"], score[i]["RE030_COMPLETE"], score[i]["SS020_COMPLETE"], score[i]["SS007_COMPLETE"],
                                score[i]["RE015_COMPLETE"], score[i]["RE020_COMPLETE"], score[i]["CI042_COMPLETE"], score[i]["CI020_COMPLETE"], score[i]["YTD_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Zoning Approved (RE030)  <b>' + re030perc + '%', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020perc + '% ',
                                'Structural Analysis Ordered (SS007)  <b>' + ss007perc + '% ', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (l == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["JI022_NA"], score[i]["RE030_NA"], score[i]["SS020_NA"], score[i]["SS007_NA"], score[i]["RE015_NA"],
                                    score[i]["RE020_NA"], score[i]["CI042_NA"], score[i]["CI020_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Zoning Approved (RE030)  <b>' + re030perc + '%', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020perc + '% ',
                                'Structural Analysis Ordered (SS007)  <b>' + ss007perc + '% ', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "IB ALL") {
                        for (var p = 0; p <= 2; p++) {
                            if (p == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["CI171_FORECAST"] - score[i]["CI171_COMPLETE"]), (score[i]["CI170_FORECAST"] - score[i]["CI170_COMPLETE"]), (score[i]["RE015_FORECAST"] - score[i]["RE015_COMPLETE"]),
                                    (score[i]["RE081_FORECAST"] - score[i]["RE081_COMPLETE"]), (score[i]["CI025_FORECAST"] - score[i]["CI025_COMPLETE"]), (score[i]["CI042_FORECAST"] - score[i]["CI042_COMPLETE"]),
                                    (score[i]["CI050_FORECAST"] - score[i]["CI050_COMPLETE"]), (score[i]["CI212_FORECAST"] - score[i]["CI212_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ci171perc = (score[i]["CI171_COMPLETE"] * 100 / score[i]["CI171_FORECAST"]).toFixed(1);
                                var ci170perc = (score[i]["CI170_COMPLETE"] * 100 / score[i]["CI170_FORECAST"]).toFixed(1);
                                var re015perc = (score[i]["RE015_COMPLETE"] * 100 / score[i]["RE015_FORECAST"]).toFixed(1);
                                var re081perc = (score[i]["RE081_COMPLETE"] * 100 / score[i]["RE081_FORECAST"]).toFixed(1);
                                var ci025perc = (score[i]["CI025_COMPLETE"] * 100 / score[i]["CI025_FORECAST"]).toFixed(1);
                                var ci042perc = (score[i]["CI042_COMPLETE"] * 100 / score[i]["CI042_FORECAST"]).toFixed(1);
                                var ci050perc = (score[i]["CI050_COMPLETE"] * 100 / score[i]["CI050_FORECAST"]).toFixed(1);
                                var ci212perc = (score[i]["CI212_COMPLETE"] * 100 / score[i]["CI212_FORECAST"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Final RFDS and Design Approved (CI171)  <b>' + ci171perc + '%', 'Design Phase Complete (CI170)  <b>' + ci170perc + '% ',
                                'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Contract Complete (RE081)  <b>' + re081perc + '%', 'Construction Started (CI025)  <b>' + ci025perc + '% ',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '% ', 'Construction Complete (CI050)  <b>' + ci050perc + '% ', 'On-Air Complete (CI212)  <b>' + ci212perc + '%'];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (p == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["CI171_COMPLETE"], score[i]["CI170_COMPLETE"], score[i]["RE015_COMPLETE"], score[i]["RE081_COMPLETE"],
                                score[i]["CI025_COMPLETE"], score[i]["CI042_COMPLETE"], score[i]["CI050_COMPLETE"], score[i]["CI212_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Final RFDS and Design Approved (CI171)  <b>' + ci171perc + '%', 'Design Phase Complete (CI170)  <b>' + ci170perc + '% ',
                                'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Contract Complete (RE081)  <b>' + re081perc + '%', 'Construction Started (CI025)  <b>' + ci025perc + '% ',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '% ', 'Construction Complete (CI050)  <b>' + ci050perc + '% ', 'On-Air Complete (CI212)  <b>' + ci212perc + '%'];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (p == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["CI171_NA"], score[i]["CI170_NA"], score[i]["RE015_NA"], score[i]["RE081_NA"], score[i]["CI025_NA"],
                                    score[i]["CI042_NA"], score[i]["CI050_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Final RFDS and Design Approved (CI171)  <b>' + ci171perc + '%', 'Design Phase Complete (CI170)  <b>' + ci170perc + '% ',
                                'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ', 'Contract Complete (RE081)  <b>' + re081perc + '%', 'Construction Started (CI025)  <b>' + ci025perc + '% ',
                                'Transport Delivered (CI042)  <b>' + ci042perc + '% ', 'Construction Complete (CI050)  <b>' + ci050perc + '% ', 'On-Air Complete (CI212)  <b>' + ci212perc + '%'];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else {
                        for (var n = 0; n <= 2; n++) {
                            if (n == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var allindata = [null, (score[i]["JI022_FORECAST"] - score[i]["JI022_COMPLETE"]), (score[i]["SS020_FORECAST"] - score[i]["SS020_COMPLETE"]), (score[i]["RE020_FORECAST"] - score[i]["RE020_COMPLETE"]),
                                    (score[i]["CI025_FORECAST"] - score[i]["CI025_COMPLETE"]), (score[i]["CI020_FORECAST"] - score[i]["CI020_COMPLETE"]), (score[i]["CI050_FORECAST"] - score[i]["CI050_COMPLETE"]),
                                    (score[i]["FORECASTED_COUNT"] - score[i]["YTD_COMPLETE"])];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var foreperc = (score[i]["FORECASTED_COUNT"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var ji022perc = (score[i]["JI022_COMPLETE"] * 100 / score[i]["JI022_FORECAST"]).toFixed(1);
                                var ss020perc = (score[i]["SS020_COMPLETE"] * 100 / score[i]["SS020_FORECAST"]).toFixed(1);
                                var re020perc = (score[i]["RE020_COMPLETE"] * 100 / score[i]["RE020_FORECAST"]).toFixed(1);
                                var ci025perc = (score[i]["CI025_COMPLETE"] * 100 / score[i]["CI025_FORECAST"]).toFixed(1);
                                var ci020perc = (score[i]["CI020_COMPLETE"] * 100 / score[i]["CI020_FORECAST"]).toFixed(1);
                                var ci050perc = (score[i]["CI050_COMPLETE"] * 100 / score[i]["CI050_FORECAST"]).toFixed(1);
                                var onairperc = (score[i]["YTD_COMPLETE"] * 100 / score[i]["FORECASTED_COUNT"]).toFixed(1);
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020perc + '%', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%', 'Construction Start (CI025)  <b>' + ci025perc + '%',
                                'Tower Top Complete (CI020)  <b>' + ci020perc + '%', 'Construction Complete (CI050)  <b>' + ci050perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Not Completed',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: allindata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#959595',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (n == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var MSdata = [score[i]["FORECASTED_COUNT"], score[i]["JI022_COMPLETE"], score[i]["SS020_COMPLETE"], score[i]["RE020_COMPLETE"], score[i]["CI025_COMPLETE"], score[i]["CI020_COMPLETE"],
                                score[i]["CI050_COMPLETE"], score[i]["YTD_COMPLETE"]];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020perc + '%', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%', 'Construction Start (CI025)  <b>' + ci025perc + '%',
                                'Tower Top Complete (CI020)  <b>' + ci020perc + '%', 'Construction Complete (CI050)  <b>' + ci050perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Complete',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#4da6ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (n == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var MS_NAdata = [null, score[i]["JI022_NA"], score[i]["SS020_NA"], score[i]["RE020_NA"], score[i]["CI025_NA"], score[i]["CI020_NA"],
                                    score[i]["CI050_NA"], null];
                                var visibledata = true;
                                var categorylist = ['<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022perc + '% ',
                                'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020perc + '%', 'Site Acquisition Complete (RE020)  <b>' + re020perc + '%', 'Construction Start (CI025)  <b>' + ci025perc + '%',
                                'Tower Top Complete (CI020)  <b>' + ci020perc + '%', 'Construction Complete (CI050)  <b>' + ci050perc + '%', 'On-Air Complete (ONAIR)  <b>' + onairperc + '%'];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Milestone Not Applicable',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: MS_NAdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    maxarray: max_of_array,
                                    color: '#e6e6e6',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }

                        }
                    }
                }

                console.log("Check: " + score[0]["PPTP_CUSTOM_ONE"]);

                if (score[0]["PPTP_CUSTOM_ONE"] == "CRAN ALL" | score[0]["PPTP_CUSTOM_ONE"] == "5G mmWave ALL") {
                    var TPchartheight = '400';
                }
                else if (score[0]["PPTP_CUSTOM_ONE"] == "NSB ALL") {
                    var TPchartheight = '370';
                }
                else {
                    var TPchartheight = '350';
                }
                console.log("Chart Height: " + TPchartheight);

                runTPchartbuilder(chartDiv, seriesData, categorylist, TPchartheight, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five);

                function runTPchartbuilder(container, seriesData, categorylist, chartheight, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five) {

                    var seriesData = seriesData,
                        len = seriesData.length, r;

                    for (r = 0; r < len; r++)
                        seriesData[r] && seriesData.push(seriesData[r]);  // copy non-empty values to the end of the array

                    seriesData.splice(0, len);  // cut the array and leave only the non-empty values

                    Highcharts.setOptions({
                        lang: {
                            thousandsSep: ','
                        }

                    });

                    $(function () {

                        GlobalTPChart = Highcharts.chart(container, {

                            colors: ['#4da6ff', '#959595', '#e6e6e6'],
                            chart: {
                                type: 'bar',
                                height: chartheight,
                                spacingBottom: 5,
                                marginLeft: 350,
                                marginRight: 0,
                                //width: '430'
                            },
                            exporting: {
                                enabled: false
                            },
                            title: {
                                text: ''
                                //text: 'Task Progression of ' + program + ' Forecasted Jobs'
                            },

                            plotOptions: {
                                series: {
                                    stacking: 'normal',
                                    cursor: 'pointer',
                                    pointWidth: 18,
                                    animation: false,
                                    point: {
                                        events: {
                                            click: function () {
                                                var MSstring = this.category + '';
                                                var MSstringSplit = MSstring.split(' ');
                                                var MSstringWord1 = MSstringSplit[1];
                                                if (MSstringWord1 == 'Forecasted') { var TPMilestone = 'ONAIR_FORECAST'; }
                                                else { var TPMilestone = MSstring.split('(').pop().split(')')[0] + '_ACTUAL'; }
                                                var TPMilestoneF = MSstring.split('(').pop().split(')')[0] + '_FORECAST';
                                                var MSseries = this.series.name + '';
                                                if (MSseries == 'Milestone Complete') { var TPSeries = '( ' + TPMilestone + ' IS NOT NULL AND EXTRACT( YEAR FROM ' + TPMilestone + ') != 1950 )'; }
                                                else if (MSseries == 'Not Completed') { var TPSeries = '( ' + TPMilestone + ' IS NULL AND (' + TPMilestoneF + ' IS NOT NULL OR EXTRACT ( YEAR FROM ' + TPMilestoneF + ') != 1950 ) ) '; }
                                                else { var TPSeries = '(( EXTRACT( YEAR FROM ' + TPMilestone + ') = 1950 OR ' + TPMilestoneF + ' IS NULL) AND (' + TPMilestone + ' IS NULL OR EXTRACT( YEAR FROM ' + TPMilestone + ') = 1950))'; };

                                                var TPProgramHC = pptp_custom_one;
                                                //var TPProgramHC = 'NSB ALL';
                                                if (TPProgramHC == 'NSB ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(JI012_PLAN, 'MM-DD-YYYY') AS JI012_PLAN, " +
                                                        "TO_CHAR(JI012_FORECAST, 'MM-DD-YYYY') AS JI012_FORECAST, " +
                                                        "TO_CHAR(JI012_ACTUAL, 'MM-DD-YYYY') AS JI012_ACTUAL, " +
                                                        "TO_CHAR(JI022_PLAN, 'MM-DD-YYYY') AS JI022_PLAN, " +
                                                        "TO_CHAR(JI022_FORECAST, 'MM-DD-YYYY') AS JI022_FORECAST, " +
                                                        "TO_CHAR(JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL, " +
                                                        "TO_CHAR(SS010_PLAN, 'MM-DD-YYYY') AS SS010_PLAN, " +
                                                        "TO_CHAR(SS010_FORECAST, 'MM-DD-YYYY') AS SS010_FORECAST, " +
                                                        "TO_CHAR(SS010_ACTUAL, 'MM-DD-YYYY') AS SS010_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(SS020_PLAN, 'MM-DD-YYYY') AS SS020_PLAN, " +
                                                        "TO_CHAR(SS020_FORECAST, 'MM-DD-YYYY') AS SS020_FORECAST, " +
                                                        "TO_CHAR(SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL, " +
                                                        "TO_CHAR(SS007_PLAN, 'MM-DD-YYYY') AS SS007_PLAN, " +
                                                        "TO_CHAR(SS007_FORECAST, 'MM-DD-YYYY') AS SS007_FORECAST, " +
                                                        "TO_CHAR(SS007_ACTUAL, 'MM-DD-YYYY') AS SS007_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI152_PLAN, 'MM-DD-YYYY') AS CI152_PLAN, " +
                                                        "TO_CHAR(CI152_FORECAST, 'MM-DD-YYYY') AS CI152_FORECAST, " +
                                                        "TO_CHAR(CI152_ACTUAL, 'MM-DD-YYYY') AS CI152_ACTUAL, " +
                                                        "TO_CHAR(CI153_PLAN, 'MM-DD-YYYY') AS CI153_PLAN, " +
                                                        "TO_CHAR(CI153_FORECAST, 'MM-DD-YYYY') AS CI153_FORECAST, " +
                                                        "TO_CHAR(CI153_ACTUAL, 'MM-DD-YYYY') AS CI153_ACTUAL, " +
                                                        "TO_CHAR(CI001_PLAN, 'MM-DD-YYYY') AS CI001_PLAN, " +
                                                        "TO_CHAR(CI001_FORECAST, 'MM-DD-YYYY') AS CI001_FORECAST, " +
                                                        "TO_CHAR(CI001_ACTUAL, 'MM-DD-YYYY') AS CI001_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI128_PLAN, 'MM-DD-YYYY') AS CI128_PLAN, " +
                                                        "TO_CHAR(CI128_FORECAST, 'MM-DD-YYYY') AS CI128_FORECAST, " +
                                                        "TO_CHAR(CI128_ACTUAL, 'MM-DD-YYYY') AS CI128_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'MCA') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(RE007_PLAN, 'MM-DD-YYYY') AS RE007_PLAN, " +
                                                        "TO_CHAR(RE007_FORECAST, 'MM-DD-YYYY') AS RE007_FORECAST, " +
                                                        "TO_CHAR(RE007_ACTUAL, 'MM-DD-YYYY') AS RE007_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, " +
                                                        "TO_CHAR(CI035_PLAN, 'MM-DD-YYYY') AS CI035_PLAN, " +
                                                        "TO_CHAR(CI035_FORECAST, 'MM-DD-YYYY') AS CI035_FORECAST, " +
                                                        "TO_CHAR(CI035_ACTUAL, 'MM-DD-YYYY') AS CI035_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'CRAN ALL' | TPProgramHC == "5G mmWave ALL") {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(SS010_PLAN, 'MM-DD-YYYY') AS SS010_PLAN, " +
                                                        "TO_CHAR(SS010_FORECAST, 'MM-DD-YYYY') AS SS010_FORECAST, " +
                                                        "TO_CHAR(SS010_ACTUAL, 'MM-DD-YYYY') AS SS010_ACTUAL, " +
                                                        "TO_CHAR(SS095_PLAN, 'MM-DD-YYYY') AS SS095_PLAN, " +
                                                        "TO_CHAR(SS095_FORECAST, 'MM-DD-YYYY') AS SS095_FORECAST, " +
                                                        "TO_CHAR(SS095_ACTUAL, 'MM-DD-YYYY') AS SS095_ACTUAL, " +
                                                        "TO_CHAR(SS096_PLAN, 'MM-DD-YYYY') AS SS096_PLAN, " +
                                                        "TO_CHAR(SS096_FORECAST, 'MM-DD-YYYY') AS SS096_FORECAST, " +
                                                        "TO_CHAR(SS096_ACTUAL, 'MM-DD-YYYY') AS SS096_ACTUAL, " +
                                                        "TO_CHAR(RE007_PLAN, 'MM-DD-YYYY') AS RE007_PLAN, " +
                                                        "TO_CHAR(RE007_FORECAST, 'MM-DD-YYYY') AS RE007_FORECAST, " +
                                                        "TO_CHAR(RE007_ACTUAL, 'MM-DD-YYYY') AS RE007_ACTUAL, " +
                                                        "TO_CHAR(RE056_PLAN, 'MM-DD-YYYY') AS RE056_PLAN, " +
                                                        "TO_CHAR(RE056_FORECAST, 'MM-DD-YYYY') AS RE056_FORECAST, " +
                                                        "TO_CHAR(RE056_ACTUAL, 'MM-DD-YYYY') AS RE056_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE001_PLAN, 'MM-DD-YYYY') AS RE001_PLAN, " +
                                                        "TO_CHAR(RE001_FORECAST, 'MM-DD-YYYY') AS RE001_FORECAST, " +
                                                        "TO_CHAR(RE001_ACTUAL, 'MM-DD-YYYY') AS RE001_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(RE031_PLAN, 'MM-DD-YYYY') AS RE031_PLAN, " +
                                                        "TO_CHAR(RE031_FORECAST, 'MM-DD-YYYY') AS RE031_FORECAST, " +
                                                        "TO_CHAR(RE031_ACTUAL, 'MM-DD-YYYY') AS RE031_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(RE032_PLAN, 'MM-DD-YYYY') AS RE032_PLAN, " +
                                                        "TO_CHAR(RE032_FORECAST, 'MM-DD-YYYY') AS RE032_FORECAST, " +
                                                        "TO_CHAR(RE032_ACTUAL, 'MM-DD-YYYY') AS RE032_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI119_PLAN, 'MM-DD-YYYY') AS CI119_PLAN, " +
                                                        "TO_CHAR(CI119_FORECAST, 'MM-DD-YYYY') AS CI119_FORECAST, " +
                                                        "TO_CHAR(CI119_ACTUAL, 'MM-DD-YYYY') AS CI119_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI099_PLAN, 'MM-DD-YYYY') AS CI099_PLAN, " +
                                                        "TO_CHAR(CI099_FORECAST, 'MM-DD-YYYY') AS CI099_FORECAST, " +
                                                        "TO_CHAR(CI099_ACTUAL, 'MM-DD-YYYY') AS CI099_ACTUAL, " +
                                                        "TO_CHAR(CI050_PLAN, 'MM-DD-YYYY') AS CI050_PLAN, " +
                                                        "TO_CHAR(CI050_FORECAST, 'MM-DD-YYYY') AS CI050_FORECAST, " +
                                                        "TO_CHAR(CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL, " +
                                                        "TO_CHAR(CI035_PLAN, 'MM-DD-YYYY') AS CI035_PLAN, " +
                                                        "TO_CHAR(CI035_FORECAST, 'MM-DD-YYYY') AS CI035_FORECAST, " +
                                                        "TO_CHAR(CI035_ACTUAL, 'MM-DD-YYYY') AS CI035_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == '5G mmWave ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(SS010_PLAN, 'MM-DD-YYYY') AS SS010_PLAN, " +
                                                        "TO_CHAR(SS010_FORECAST, 'MM-DD-YYYY') AS SS010_FORECAST, " +
                                                        "TO_CHAR(SS010_ACTUAL, 'MM-DD-YYYY') AS SS010_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE001_PLAN, 'MM-DD-YYYY') AS RE001_PLAN, " +
                                                        "TO_CHAR(RE001_FORECAST, 'MM-DD-YYYY') AS RE001_FORECAST, " +
                                                        "TO_CHAR(RE001_ACTUAL, 'MM-DD-YYYY') AS RE001_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(RE031_PLAN, 'MM-DD-YYYY') AS RE031_PLAN, " +
                                                        "TO_CHAR(RE031_FORECAST, 'MM-DD-YYYY') AS RE031_FORECAST, " +
                                                        "TO_CHAR(RE031_ACTUAL, 'MM-DD-YYYY') AS RE031_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI099_PLAN, 'MM-DD-YYYY') AS CI099_PLAN, " +
                                                        "TO_CHAR(CI099_FORECAST, 'MM-DD-YYYY') AS CI099_FORECAST, " +
                                                        "TO_CHAR(CI099_ACTUAL, 'MM-DD-YYYY') AS CI099_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI119_PLAN, 'MM-DD-YYYY') AS CI119_PLAN, " +
                                                        "TO_CHAR(CI119_FORECAST, 'MM-DD-YYYY') AS CI119_FORECAST, " +
                                                        "TO_CHAR(CI119_ACTUAL, 'MM-DD-YYYY') AS CI119_ACTUAL, " +
                                                        "TO_CHAR(CI035_PLAN, 'MM-DD-YYYY') AS CI035_PLAN, " +
                                                        "TO_CHAR(CI035_FORECAST, 'MM-DD-YYYY') AS CI035_FORECAST, " +
                                                        "TO_CHAR(CI035_ACTUAL, 'MM-DD-YYYY') AS CI035_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'LTE') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(JI022_PLAN, 'MM-DD-YYYY') AS JI022_PLAN, " +
                                                        "TO_CHAR(JI022_FORECAST, 'MM-DD-YYYY') AS JI022_FORECAST, " +
                                                        "TO_CHAR(JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(SS020_PLAN, 'MM-DD-YYYY') AS SS020_PLAN, " +
                                                        "TO_CHAR(SS020_FORECAST, 'MM-DD-YYYY') AS SS020_FORECAST, " +
                                                        "TO_CHAR(SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL, " +
                                                        "TO_CHAR(SS007_PLAN, 'MM-DD-YYYY') AS SS007_PLAN, " +
                                                        "TO_CHAR(SS007_FORECAST, 'MM-DD-YYYY') AS SS007_FORECAST, " +
                                                        "TO_CHAR(SS007_ACTUAL, 'MM-DD-YYYY') AS SS007_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'IB ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(CI171_PLAN, 'MM-DD-YYYY') AS CI171_PLAN, " +
                                                        "TO_CHAR(CI171_FORECAST, 'MM-DD-YYYY') AS CI171_FORECAST, " +
                                                        "TO_CHAR(CI171_ACTUAL, 'MM-DD-YYYY') AS CI171_ACTUAL, " +
                                                        "TO_CHAR(CI170_PLAN, 'MM-DD-YYYY') AS CI170_PLAN, " +
                                                        "TO_CHAR(CI170_FORECAST, 'MM-DD-YYYY') AS CI170_FORECAST, " +
                                                        "TO_CHAR(CI170_ACTUAL, 'MM-DD-YYYY') AS CI170_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE081_PLAN, 'MM-DD-YYYY') AS RE081_PLAN, " +
                                                        "TO_CHAR(RE081_FORECAST, 'MM-DD-YYYY') AS RE081_FORECAST, " +
                                                        "TO_CHAR(RE081_ACTUAL, 'MM-DD-YYYY') AS RE081_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI050_PLAN, 'MM-DD-YYYY') AS CI050_PLAN, " +
                                                        "TO_CHAR(CI050_FORECAST, 'MM-DD-YYYY') AS CI050_FORECAST, " +
                                                        "TO_CHAR(CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL, " +
                                                        "TO_CHAR(CI212_PLAN, 'MM-DD-YYYY') AS CI212_PLAN, " +
                                                        "TO_CHAR(CI212_FORECAST, 'MM-DD-YYYY') AS CI212_FORECAST, " +
                                                        "TO_CHAR(CI212_ACTUAL, 'MM-DD-YYYY') AS CI212_ACTUAL, ";
                                                }
                                                else {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(JI022_PLAN, 'MM-DD-YYYY') AS JI022_PLAN, " +
                                                        "TO_CHAR(JI022_FORECAST, 'MM-DD-YYYY') AS JI022_FORECAST, " +
                                                        "TO_CHAR(JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL, " +
                                                        "TO_CHAR(SS020_PLAN, 'MM-DD-YYYY') AS SS020_PLAN, " +
                                                        "TO_CHAR(SS020_FORECAST, 'MM-DD-YYYY') AS SS020_FORECAST, " +
                                                        "TO_CHAR(SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, " +
                                                        "TO_CHAR(CI050_PLAN, 'MM-DD-YYYY') AS CI050_PLAN, " +
                                                        "TO_CHAR(CI050_FORECAST, 'MM-DD-YYYY') AS CI050_FORECAST, " +
                                                        "TO_CHAR(CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL, ";
                                                }

                                                document.getElementById('<%= hf_TPMilestone.ClientID %>').value = TPMilestone;
                                                document.getElementById('<%= hf_TPSeries.ClientID %>').value = TPSeries;
                                                document.getElementById('<%= hf_TPProgram.ClientID %>').value = sqlTPProgram;

                                                document.getElementById('<%= hf_pptpCustomOne.ClientID %>').value = pptp_custom_one;
                                                document.getElementById('<%= hf_pptpCustomTwo.ClientID %>').value = pptp_custom_two;
                                                document.getElementById('<%= hf_pptpCustomThree.ClientID %>').value = pptp_custom_three;
                                                document.getElementById('<%= hf_pptpCustomFour.ClientID %>').value = pptp_custom_four;
                                                document.getElementById('<%= hf_pptpCustomFive.ClientID %>').value = pptp_custom_five;

                                                ExportToExcel_TP(TPMilestone, TPSeries);

                                                //alert('Milestone: ' + TPMilestone + ', Series Name: ' + this.series.name + ', Value: ' + this.y);

                                                //alert('Milestone: ' + TPMilestone + ', sqlTPProgram: ' + sqlTPProgram);

                                            }
                                        }
                                    }
                                }
                            },

                            xAxis: {
                                categories: categorylist,
                                labels: {
                                    style: {
                                        fontSize: '11px',
                                        color: 'black'
                                    }
                                },
                                title: {
                                    text: ''
                                }
                            },

                            yAxis: {
                                max: max_of_array,
                                labels: {
                                    enabled: false
                                },
                                title: {
                                    text: 'Project Count',
                                    style: {
                                        fontSize: "11px"
                                    }
                                },
                                reversedStacks: false
                            },

                            legend: {
                                itemStyle: {
                                    color: '#000000',
                                    fontSize: "11px",
                                    fontWeight: 'normal'
                                },
                                symbolRadius: 0
                            },

                            tooltip: {
                                headerFormat: '<span style="font-size:16px; font-weight: bold;">{point.key}</span><table>',
                                pointFormat: '<tr><td style="font-size:14px; color:{series.color}; padding:0;">{series.name}: </td>' +
                                    '<td style="font-size:14px; font-weight: bold; padding:0; "><b>&nbsp;{point.y}</b></td>' +
                                    '<td style="font-size:14px; font-weight: bold; padding:0; "><b>&nbsp;({point.percentage:.1f}%)</b></td></tr>',
                                footerFormat: '</table>',
                                shared: true,
                                useHTML: true,
                                backgroundColor: '#FFFFFF'
                            },

                            credits: {
                                enabled: false
                            },

                            series: seriesData

                        });

                        window.setTimeout(function () { GlobalTPChart.reflow(); });
                        $(window).resize();

                    });

                }
            }

            function ExportToExcel_TP(source, eventArgs) {
                var clickButton = document.getElementById("<%= ButtonTP.ClientID %>");
                clickButton.click();
            }

            var GlobalTPChart2;

            function TP_data_filter2(TPdata, chartDiv2, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory) {
                var score = JSON.parse(TPdata.d);
                seriesData = [];
                categories = [];
                for (var i = 0; i < score.length; i++) {
                    var ceone = score[i]["PPTP_CUSTOM_ONE"];
                    var moddata = score[i]["PPTP_CUSTOM_ONE"];
                    //var startcategorylist = ["this", "is the", "start", "categorylist", "this", "is the", "start", "categorylist", "this", "is the", "start"];
                    if (score[i].PPTP_CUSTOM_ONE === "NSB ALL") {
                        for (var j = 0; j <= 3; j++) {
                            if (j == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var GREEN_MSdata = [score[i]["JI012_FORECAST_GREEN"], score[i]["JI022_FORECAST_GREEN"], score[i]["SS010_FORECAST_GREEN"],
                                score[i]["RE030_FORECAST_GREEN"], score[i]["SS020_FORECAST_GREEN"], score[i]["SS007_FORECAST_GREEN"],
                                score[i]["RE015_FORECAST_GREEN"], score[i]["RE020_FORECAST_GREEN"],
                                score[i]["CI152_FORECAST_GREEN"], score[i]["CI153_FORECAST_GREEN"],
                                score[i]["CI001_FORECAST_GREEN"], score[i]["CI025_FORECAST_GREEN"],
                                score[i]["CI128_FORECAST_GREEN"], score[i]["CI042_FORECAST_GREEN"],
                                score[i]["CI020_FORECAST_GREEN"], score[i]["ONAIR_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                var ji012count = (score[i]["JI012_FORECAST_RED"] + score[i]["JI012_FORECAST_YELLOW"] + score[i]["JI012_FORECAST_GREEN"]).toFixed(0);
                                var ji022count = (score[i]["JI022_FORECAST_RED"] + score[i]["JI022_FORECAST_YELLOW"] + score[i]["JI022_FORECAST_GREEN"]).toFixed(0);
                                var ss010count = (score[i]["SS010_FORECAST_RED"] + score[i]["SS010_FORECAST_YELLOW"] + score[i]["SS010_FORECAST_GREEN"]).toFixed(0);
                                var re030count = (score[i]["RE030_FORECAST_RED"] + score[i]["RE030_FORECAST_YELLOW"] + score[i]["RE030_FORECAST_GREEN"]).toFixed(0);
                                var ss020count = (score[i]["SS020_FORECAST_RED"] + score[i]["SS020_FORECAST_YELLOW"] + score[i]["SS020_FORECAST_GREEN"]).toFixed(0);
                                var ss007count = (score[i]["SS007_FORECAST_RED"] + score[i]["SS007_FORECAST_YELLOW"] + score[i]["SS007_FORECAST_GREEN"]).toFixed(0);
                                var re015count = (score[i]["RE015_FORECAST_RED"] + score[i]["RE015_FORECAST_YELLOW"] + score[i]["RE015_FORECAST_GREEN"]).toFixed(0);
                                var re020count = (score[i]["RE020_FORECAST_RED"] + score[i]["RE020_FORECAST_YELLOW"] + score[i]["RE020_FORECAST_GREEN"]).toFixed(0);
                                var ci152count = (score[i]["CI152_FORECAST_RED"] + score[i]["CI152_FORECAST_YELLOW"] + score[i]["CI152_FORECAST_GREEN"]).toFixed(0);
                                var ci153count = (score[i]["CI153_FORECAST_RED"] + score[i]["CI153_FORECAST_YELLOW"] + score[i]["CI153_FORECAST_GREEN"]).toFixed(0);
                                var ci001count = (score[i]["CI001_FORECAST_RED"] + score[i]["CI001_FORECAST_YELLOW"] + score[i]["CI001_FORECAST_GREEN"]).toFixed(0);
                                var ci025count = (score[i]["CI025_FORECAST_RED"] + score[i]["CI025_FORECAST_YELLOW"] + score[i]["CI025_FORECAST_GREEN"]).toFixed(0);
                                var ci128count = (score[i]["CI128_FORECAST_RED"] + score[i]["CI128_FORECAST_YELLOW"] + score[i]["CI128_FORECAST_GREEN"]).toFixed(0);
                                var ci042count = (score[i]["CI042_FORECAST_RED"] + score[i]["CI042_FORECAST_YELLOW"] + score[i]["CI042_FORECAST_GREEN"]).toFixed(0);
                                var ci020count = (score[i]["CI020_FORECAST_RED"] + score[i]["CI020_FORECAST_YELLOW"] + score[i]["CI020_FORECAST_GREEN"]).toFixed(0);
                                var onaircount = (score[i]["ONAIR_FORECAST_RED"] + score[i]["ONAIR_FORECAST_YELLOW"] + score[i]["ONAIR_FORECAST_GREEN"]).toFixed(0);
                                var categorylist = ['(JI012)  <b>' + ji012count + ' ', '(JI022)  <b>' + ji022count + ' ',
                                '(SS010)  <b>' + ss010count + ' ', '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI152) <b>' + ci152count + ' ', '(CI153) <b>' + ci153count + ' ',
                                '(CI001)  <b>' + ci001count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI128)  <b>' + ci128count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Search Ring Issued - SARF (JI012)  <b>' + ji012count + ' ', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Site Candidate Approved (SS010)  <b>' + ss010count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'3rd Party New Tower Construction Start (CI152) <b>' + ci152count + ' ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153count + ' ',
                                //'Site Ready for Transport Delivery (CI001)  <b>' + ci001count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ', 'Tower Work Start (CI128)  <b>' + ci128count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (j == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var RED_MSdata = [score[i]["JI012_FORECAST_RED"], score[i]["JI022_FORECAST_RED"], score[i]["SS010_FORECAST_RED"], score[i]["RE030_FORECAST_RED"], score[i]["SS020_FORECAST_RED"], score[i]["SS007_FORECAST_RED"],
                                score[i]["RE015_FORECAST_RED"], score[i]["RE020_FORECAST_RED"], score[i]["CI152_FORECAST_RED"], score[i]["CI153_FORECAST_RED"], score[i]["CI001_FORECAST_RED"], score[i]["CI025_FORECAST_RED"], score[i]["CI128_FORECAST_RED"],
                                score[i]["CI042_FORECAST_RED"], score[i]["CI020_FORECAST_RED"], score[i]["ONAIR_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(JI012)  <b>' + ji012count + ' ', '(JI022)  <b>' + ji022count + ' ',
                                '(SS010)  <b>' + ss010count + ' ', '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI152) <b>' + ci152count + ' ', '(CI153) <b>' + ci153count + ' ',
                                '(CI001)  <b>' + ci001count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI128)  <b>' + ci128count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Search Ring Issued - SARF (JI012)  <b>' + ji012count + ' ', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Site Candidate Approved (SS010)  <b>' + ss010count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'3rd Party New Tower Construction Start (CI152) <b>' + ci152count + ' ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153count + ' ',
                                //'Site Ready for Transport Delivery (CI001)  <b>' + ci001count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ', 'Tower Work Start (CI128)  <b>' + ci128count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (j == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["JI012_FORECAST_YELLOW"], score[i]["JI022_FORECAST_YELLOW"], score[i]["SS010_FORECAST_YELLOW"], score[i]["RE030_FORECAST_YELLOW"], score[i]["SS020_FORECAST_YELLOW"], score[i]["SS007_FORECAST_YELLOW"],
                                score[i]["RE015_FORECAST_YELLOW"], score[i]["RE020_FORECAST_YELLOW"], score[i]["CI152_FORECAST_YELLOW"], score[i]["CI153_FORECAST_YELLOW"], score[i]["CI001_FORECAST_YELLOW"], score[i]["CI025_FORECAST_YELLOW"], score[i]["CI128_FORECAST_YELLOW"],
                                score[i]["CI042_FORECAST_YELLOW"], score[i]["CI020_FORECAST_YELLOW"], score[i]["ONAIR_FORECAST_YELLOW"]];
                                var visibledata = true;
                                var categorylist = ['(JI012)  <b>' + ji012count + ' ', '(JI022)  <b>' + ji022count + ' ',
                                '(SS010)  <b>' + ss010count + ' ', '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI152) <b>' + ci152count + ' ', '(CI153) <b>' + ci153count + ' ',
                                '(CI001)  <b>' + ci001count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI128)  <b>' + ci128count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Search Ring Issued - SARF (JI012)  <b>' + ji012count + ' ', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Site Candidate Approved (SS010)  <b>' + ss010count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'3rd Party New Tower Construction Start (CI152) <b>' + ci152count + ' ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153count + ' ',
                                //'Site Ready for Transport Delivery (CI001)  <b>' + ci001count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ', 'Tower Work Start (CI128)  <b>' + ci128count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (j == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["JI012_FORECAST_PURPLE"], score[i]["JI022_FORECAST_PURPLE"], score[i]["SS010_FORECAST_PURPLE"], score[i]["RE030_FORECAST_PURPLE"], score[i]["SS020_FORECAST_PURPLE"], score[i]["SS007_FORECAST_PURPLE"],
                                score[i]["RE015_FORECAST_PURPLE"], score[i]["RE020_FORECAST_PURPLE"], score[i]["CI152_FORECAST_PURPLE"], score[i]["CI153_FORECAST_PURPLE"], score[i]["CI001_FORECAST_PURPLE"], score[i]["CI025_FORECAST_PURPLE"], score[i]["CI128_FORECAST_PURPLE"],
                                score[i]["CI042_FORECAST_PURPLE"], score[i]["CI020_FORECAST_PURPLE"], score[i]["ONAIR_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(JI012)  <b>' + ji012count + ' ', '(JI022)  <b>' + ji022count + ' ',
                                '(SS010)  <b>' + ss010count + ' ', '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI152) <b>' + ci152count + ' ', '(CI153) <b>' + ci153count + ' ',
                                '(CI001)  <b>' + ci001count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI128)  <b>' + ci128count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Search Ring Issued - SARF (JI012)  <b>' + ji012count + ' ', 'Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Site Candidate Approved (SS010)  <b>' + ss010count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'3rd Party New Tower Construction Start (CI152) <b>' + ci152count + ' ', '3rd Party New Tower Construction Complete (CI153) <b>' + ci153count + ' ',
                                //'Site Ready for Transport Delivery (CI001)  <b>' + ci001count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ', 'Tower Work Start (CI128)  <b>' + ci128count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + j;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }
                    else if (score[i].PPTP_CUSTOM_ONE === "MCA") {
                        for (var k = 0; k <= 3; k++) {
                            if (k == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var GREEN_MSdata = [score[i]["RE007_FORECAST_GREEN"], score[i]["RE015_FORECAST_GREEN"], score[i]["RE020_FORECAST_GREEN"], score[i]["CI025_FORECAST_GREEN"], score[i]["CI020_FORECAST_GREEN"],
                                score[i]["CI035_FORECAST_GREEN"], score[i]["ONAIR_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                //var poeperc = (score[i]["POE"] * 100 / score[i]["POE"]).toFixed(1);
                                var re007count = (score[i]["RE007_FORECAST_RED"] + score[i]["RE007_FORECAST_YELLOW"] + score[i]["RE007_FORECAST_GREEN"] + score[i]["RE007_FORECAST_PURPLE"]).toFixed(0);
                                var re015count = (score[i]["RE015_FORECAST_RED"] + score[i]["RE015_FORECAST_YELLOW"] + score[i]["RE015_FORECAST_GREEN"] + score[i]["RE015_FORECAST_PURPLE"]).toFixed(0);
                                var re020count = (score[i]["RE020_FORECAST_RED"] + score[i]["RE020_FORECAST_YELLOW"] + score[i]["RE020_FORECAST_GREEN"] + score[i]["RE020_FORECAST_PURPLE"]).toFixed(0);
                                var ci025count = (score[i]["CI025_FORECAST_RED"] + score[i]["CI025_FORECAST_YELLOW"] + score[i]["CI025_FORECAST_GREEN"] + score[i]["CI025_FORECAST_PURPLE"]).toFixed(0);
                                var ci020count = (score[i]["CI020_FORECAST_RED"] + score[i]["CI020_FORECAST_YELLOW"] + score[i]["CI020_FORECAST_GREEN"] + score[i]["CI020_FORECAST_PURPLE"]).toFixed(0);
                                var ci035count = (score[i]["CI035_FORECAST_RED"] + score[i]["CI035_FORECAST_YELLOW"] + score[i]["CI035_FORECAST_GREEN"] + score[i]["CI035_FORECAST_PURPLE"]).toFixed(0);
                                var onaircount = (score[i]["ONAIR_FORECAST_RED"] + score[i]["ONAIR_FORECAST_YELLOW"] + score[i]["ONAIR_FORECAST_GREEN"] + score[i]["ONAIR_FORECAST_PURPLE"]).toFixed(0);
                                var categorylist = ['(RE007)  <b>' + re007count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI020)  <b>' + ci020count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //    'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ',
                                //    'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (k == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var RED_MSdata = [score[i]["RE007_FORECAST_RED"], score[i]["RE015_FORECAST_RED"], score[i]["RE020_FORECAST_RED"], score[i]["CI025_FORECAST_RED"],
                                score[i]["CI020_FORECAST_RED"], score[i]["CI035_FORECAST_RED"], score[i]["ONAIR_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(RE007)  <b>' + re007count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI020)  <b>' + ci020count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //    'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ',
                                //    'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (k == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["RE007_FORECAST_YELLOW"], score[i]["RE015_FORECAST_YELLOW"], score[i]["RE020_FORECAST_YELLOW"], score[i]["CI025_FORECAST_YELLOW"], score[i]["CI020_FORECAST_YELLOW"],
                                score[i]["CI035_FORECAST_YELLOW"], score[i]["ONAIR_FORECAST_YELLOW"]];
                                var visibledata = true;
                                var categorylist = ['(RE007)  <b>' + re007count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI020)  <b>' + ci020count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //    'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ',
                                //    'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (k == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["RE007_FORECAST_PURPLE"], score[i]["RE015_FORECAST_PURPLE"], score[i]["RE020_FORECAST_PURPLE"], score[i]["CI025_FORECAST_PURPLE"], score[i]["CI020_FORECAST_PURPLE"],
                                score[i]["CI035_FORECAST_PURPLE"], score[i]["ONAIR_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(RE007)  <b>' + re007count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI020)  <b>' + ci020count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //    'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ',
                                //    'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + k;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "CRAN ALL" | score[i].PPTP_CUSTOM_ONE === "5G mmWave ALL") {
                        for (var m = 0; m <= 3; m++) {
                            if (m == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var GREEN_MSdata = [score[i]["SS010_FORECAST_GREEN"], score[i]["SS095_FORECAST_GREEN"], score[i]["SS096_FORECAST_GREEN"], score[i]["RE007_FORECAST_GREEN"],
                                score[i]["RE056_FORECAST_GREEN"], score[i]["RE015_FORECAST_GREEN"], score[i]["RE001_FORECAST_GREEN"],
                                score[i]["RE030_FORECAST_GREEN"], score[i]["RE031_FORECAST_GREEN"], score[i]["RE020_FORECAST_GREEN"],
                                score[i]["RE032_FORECAST_GREEN"], score[i]["CI025_FORECAST_GREEN"], score[i]["CI119_FORECAST_GREEN"], score[i]["CI099_FORECAST_GREEN"],
                                score[i]["CI042_FORECAST_GREEN"],
                                score[i]["CI050_FORECAST_GREEN"], score[i]["CI035_FORECAST_GREEN"], score[i]["ONAIR_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                var ss010count = (score[i]["SS010_FORECAST_RED"] + score[i]["SS010_FORECAST_YELLOW"] + score[i]["SS010_FORECAST_GREEN"] + score[i]["SS010_FORECAST_PURPLE"]).toFixed(0);
                                var ss095count = (score[i]["SS095_FORECAST_RED"] + score[i]["SS095_FORECAST_YELLOW"] + score[i]["SS095_FORECAST_GREEN"] + score[i]["SS095_FORECAST_PURPLE"]).toFixed(0);
                                var ss096count = (score[i]["SS096_FORECAST_RED"] + score[i]["SS096_FORECAST_YELLOW"] + score[i]["SS096_FORECAST_GREEN"] + score[i]["SS096_FORECAST_PURPLE"]).toFixed(0);
                                var re007count = (score[i]["RE007_FORECAST_RED"] + score[i]["RE007_FORECAST_YELLOW"] + score[i]["RE007_FORECAST_GREEN"] + score[i]["RE007_FORECAST_PURPLE"]).toFixed(0);
                                var re056count = (score[i]["RE056_FORECAST_RED"] + score[i]["RE056_FORECAST_YELLOW"] + score[i]["RE056_FORECAST_GREEN"] + score[i]["RE056_FORECAST_PURPLE"]).toFixed(0);
                                var re015count = (score[i]["RE015_FORECAST_RED"] + score[i]["RE015_FORECAST_YELLOW"] + score[i]["RE015_FORECAST_GREEN"] + score[i]["RE015_FORECAST_PURPLE"]).toFixed(0);
                                var re001count = (score[i]["RE001_FORECAST_RED"] + score[i]["RE001_FORECAST_YELLOW"] + score[i]["RE001_FORECAST_GREEN"] + score[i]["RE001_FORECAST_PURPLE"]).toFixed(0);
                                var re030count = (score[i]["RE030_FORECAST_RED"] + score[i]["RE030_FORECAST_YELLOW"] + score[i]["RE030_FORECAST_GREEN"] + score[i]["RE030_FORECAST_PURPLE"]).toFixed(0);
                                var re031count = (score[i]["RE031_FORECAST_RED"] + score[i]["RE031_FORECAST_YELLOW"] + score[i]["RE031_FORECAST_GREEN"] + score[i]["RE031_FORECAST_PURPLE"]).toFixed(0);
                                var re020count = (score[i]["RE020_FORECAST_RED"] + score[i]["RE020_FORECAST_YELLOW"] + score[i]["RE020_FORECAST_GREEN"] + score[i]["RE020_FORECAST_PURPLE"]).toFixed(0);
                                var re032count = (score[i]["RE032_FORECAST_RED"] + score[i]["RE032_FORECAST_YELLOW"] + score[i]["RE032_FORECAST_GREEN"] + score[i]["RE032_FORECAST_PURPLE"]).toFixed(0);
                                var ci025count = (score[i]["CI025_FORECAST_RED"] + score[i]["CI025_FORECAST_YELLOW"] + score[i]["CI025_FORECAST_GREEN"] + score[i]["CI025_FORECAST_PURPLE"]).toFixed(0);
                                var ci119count = (score[i]["CI119_FORECAST_RED"] + score[i]["CI119_FORECAST_YELLOW"] + score[i]["CI119_FORECAST_GREEN"] + score[i]["CI119_FORECAST_PURPLE"]).toFixed(0);
                                var ci099count = (score[i]["CI099_FORECAST_RED"] + score[i]["CI099_FORECAST_YELLOW"] + score[i]["CI099_FORECAST_GREEN"] + score[i]["CI099_FORECAST_PURPLE"]).toFixed(0);
                                var ci042count = (score[i]["CI042_FORECAST_RED"] + score[i]["CI042_FORECAST_YELLOW"] + score[i]["CI042_FORECAST_GREEN"] + score[i]["CI042_FORECAST_PURPLE"]).toFixed(0);
                                var ci050count = (score[i]["CI050_FORECAST_RED"] + score[i]["CI050_FORECAST_YELLOW"] + score[i]["CI050_FORECAST_GREEN"] + score[i]["CI050_FORECAST_PURPLE"]).toFixed(0);
                                var ci035count = (score[i]["CI035_FORECAST_RED"] + score[i]["CI035_FORECAST_YELLOW"] + score[i]["CI035_FORECAST_GREEN"] + score[i]["CI035_FORECAST_PURPLE"]).toFixed(0);
                                var onaircount = (score[i]["ONAIR_FORECAST_RED"] + score[i]["ONAIR_FORECAST_YELLOW"] + score[i]["ONAIR_FORECAST_GREEN"] + score[i]["ONAIR_FORECAST_PURPLE"]).toFixed(0);
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(SS095)  <b>' + ss095count + ' ', '(SS096)  <b>' + ss096count + ' ',
                                '(RE007)  <b>' + re007count + ' ', '(RE056)  <b>' + re056count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(RE032)  <b>' + re032count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI119)  <b>' + ci119count + ' ',
                                '(CI099) <b>' + ci099count + ' ', '(CI042) <b>' + ci042count + ' ', '(CI050) <b>' + ci050count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Structure Owner Engagement (SS095)  <b>' + ss095count + ' ', 'Attachment Agreement Completed (SS096)  <b>' + ss096count + ' ',
                                //'Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Greensheet Requested (RE056)  <b>' + re056count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //'Permit Submitted (RE001)  <b>' + re001count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Building Permit Received (RE031)  <b>' + re031count + ' ',
                                //'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Compliance NTP Approved (RE032)  <b>' + re032count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Permanent Power Received(CI099) <b>' + ci099count + ' ', 'Transport Delivered(CI042) <b>' + ci042count + ' ', 'Construction Complete(CI050) <b>' + ci050count + ' ',
                                //'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var RED_MSdata = [score[i]["SS010_FORECAST_RED"], score[i]["SS095_FORECAST_RED"], score[i]["SS096_FORECAST_RED"], score[i]["RE007_FORECAST_RED"], score[i]["RE056_FORECAST_RED"], score[i]["RE015_FORECAST_RED"], score[i]["RE001_FORECAST_RED"],
                                score[i]["RE030_FORECAST_RED"], score[i]["RE031_FORECAST_RED"], score[i]["RE020_FORECAST_RED"], score[i]["RE032_FORECAST_RED"], score[i]["CI025_FORECAST_RED"], score[i]["CI119_FORECAST_RED"], score[i]["CI099_FORECAST_RED"],
                                score[i]["CI042_FORECAST_RED"], score[i]["CI050_FORECAST_RED"], score[i]["CI035_FORECAST_RED"], score[i]["ONAIR_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(SS095)  <b>' + ss095count + ' ', '(SS096)  <b>' + ss096count + ' ',
                                '(RE007)  <b>' + re007count + ' ', '(RE056)  <b>' + re056count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(RE032)  <b>' + re032count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI119)  <b>' + ci119count + ' ',
                                '(CI099) <b>' + ci099count + ' ', '(CI042) <b>' + ci042count + ' ', '(CI050) <b>' + ci050count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Structure Owner Engagement (SS095)  <b>' + ss095count + ' ', 'Attachment Agreement Completed (SS096)  <b>' + ss096count + ' ',
                                //'Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Greensheet Requested (RE056)  <b>' + re056count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //'Permit Submitted (RE001)  <b>' + re001count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Building Permit Received (RE031)  <b>' + re031count + ' ',
                                //'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Compliance NTP Approved (RE032)  <b>' + re032count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Permanent Power Received(CI099) <b>' + ci099count + ' ', 'Transport Delivered(CI042) <b>' + ci042count + ' ', 'Construction Complete(CI050) <b>' + ci050count + ' ',
                                //'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["SS010_FORECAST_YELLOW"], score[i]["SS095_FORECAST_YELLOW"], score[i]["SS096_FORECAST_YELLOW"], score[i]["RE007_FORECAST_YELLOW"], score[i]["RE056_FORECAST_YELLOW"], score[i]["RE015_FORECAST_YELLOW"],
                                score[i]["RE001_FORECAST_YELLOW"], score[i]["RE030_FORECAST_YELLOW"], score[i]["RE031_FORECAST_YELLOW"], score[i]["RE020_FORECAST_YELLOW"], score[i]["RE032_FORECAST_YELLOW"],
                                score[i]["CI025_FORECAST_YELLOW"], score[i]["CI119_FORECAST_YELLOW"], score[i]["CI099_FORECAST_YELLOW"], score[i]["CI042_FORECAST_YELLOW"], score[i]["CI050_FORECAST_YELLOW"], score[i]["CI035_FORECAST_YELLOW"],
                                score[i]["ONAIR_FORECAST_YELLOW"]];
                                var visibledata = true;
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(SS095)  <b>' + ss095count + ' ', '(SS096)  <b>' + ss096count + ' ',
                                '(RE007)  <b>' + re007count + ' ', '(RE056)  <b>' + re056count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(RE032)  <b>' + re032count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI119)  <b>' + ci119count + ' ',
                                '(CI099) <b>' + ci099count + ' ', '(CI042) <b>' + ci042count + ' ', '(CI050) <b>' + ci050count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Structure Owner Engagement (SS095)  <b>' + ss095count + ' ', 'Attachment Agreement Completed (SS096)  <b>' + ss096count + ' ',
                                //'Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Greensheet Requested (RE056)  <b>' + re056count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //'Permit Submitted (RE001)  <b>' + re001count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Building Permit Received (RE031)  <b>' + re031count + ' ',
                                //'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Compliance NTP Approved (RE032)  <b>' + re032count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Permanent Power Received(CI099) <b>' + ci099count + ' ', 'Transport Delivered(CI042) <b>' + ci042count + ' ', 'Construction Complete(CI050) <b>' + ci050count + ' ',
                                //'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["SS010_FORECAST_PURPLE"], score[i]["SS095_FORECAST_PURPLE"], score[i]["SS096_FORECAST_PURPLE"], score[i]["RE007_FORECAST_PURPLE"], score[i]["RE056_FORECAST_PURPLE"], score[i]["RE015_FORECAST_PURPLE"],
                                score[i]["RE001_FORECAST_PURPLE"], score[i]["RE030_FORECAST_PURPLE"], score[i]["RE031_FORECAST_PURPLE"], score[i]["RE020_FORECAST_PURPLE"], score[i]["RE032_FORECAST_PURPLE"],
                                score[i]["CI025_FORECAST_PURPLE"], score[i]["CI119_FORECAST_PURPLE"], score[i]["CI099_FORECAST_PURPLE"], score[i]["CI042_FORECAST_PURPLE"], score[i]["CI050_FORECAST_PURPLE"], score[i]["CI035_FORECAST_PURPLE"],
                                score[i]["ONAIR_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(SS095)  <b>' + ss095count + ' ', '(SS096)  <b>' + ss096count + ' ',
                                '(RE007)  <b>' + re007count + ' ', '(RE056)  <b>' + re056count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ',
                                '(RE020)  <b>' + re020count + ' ', '(RE032)  <b>' + re032count + ' ', '(CI025)  <b>' + ci025count + ' ', '(CI119)  <b>' + ci119count + ' ',
                                '(CI099) <b>' + ci099count + ' ', '(CI042) <b>' + ci042count + ' ', '(CI050) <b>' + ci050count + ' ',
                                '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Structure Owner Engagement (SS095)  <b>' + ss095count + ' ', 'Attachment Agreement Completed (SS096)  <b>' + ss096count + ' ',
                                //'Tower Application Submitted (RE007)  <b>' + re007count + ' ', 'Greensheet Requested (RE056)  <b>' + re056count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ',
                                //'Permit Submitted (RE001)  <b>' + re001count + ' ', 'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Building Permit Received (RE031)  <b>' + re031count + ' ',
                                //'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Compliance NTP Approved (RE032)  <b>' + re032count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Permanent Power Received(CI099) <b>' + ci099count + ' ', 'Transport Delivered(CI042) <b>' + ci042count + ' ', 'Construction Complete(CI050) <b>' + ci050count + ' ',
                                //'Integration Complete (CI035)  <b>' + ci035count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "5G mmWave ALL") {
                        for (var m = 0; m <= 3; m++) {
                            if (m == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var GREEN_MSdata = [score[i]["SS010_FORECAST_GREEN"], score[i]["RE015_FORECAST_GREEN"], score[i]["RE001_FORECAST_GREEN"],
                                score[i]["RE030_FORECAST_GREEN"], score[i]["RE031_FORECAST_GREEN"], score[i]["RE020_FORECAST_GREEN"], score[i]["CI099_FORECAST_GREEN"],
                                score[i]["CI042_FORECAST_GREEN"],
                                score[i]["CI025_FORECAST_GREEN"], score[i]["CI119_FORECAST_GREEN"], score[i]["CI035_FORECAST_GREEN"], score[i]["ONAIR_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                var ss010count = (score[i]["SS010_FORECAST_RED"] + score[i]["SS010_FORECAST_YELLOW"] + score[i]["SS010_FORECAST_GREEN"] + score[i]["SS010_FORECAST_PURPLE"]).toFixed(0);
                                var re015count = (score[i]["RE015_FORECAST_RED"] + score[i]["RE015_FORECAST_YELLOW"] + score[i]["RE015_FORECAST_GREEN"] + score[i]["RE015_FORECAST_PURPLE"]).toFixed(0);
                                var re001count = (score[i]["RE001_FORECAST_RED"] + score[i]["RE001_FORECAST_YELLOW"] + score[i]["RE001_FORECAST_GREEN"] + score[i]["RE001_FORECAST_PURPLE"]).toFixed(0);
                                var re030count = (score[i]["RE030_FORECAST_RED"] + score[i]["RE030_FORECAST_YELLOW"] + score[i]["RE030_FORECAST_GREEN"] + score[i]["RE030_FORECAST_PURPLE"]).toFixed(0);
                                var re031count = (score[i]["RE031_FORECAST_RED"] + score[i]["RE031_FORECAST_YELLOW"] + score[i]["RE031_FORECAST_GREEN"] + score[i]["RE031_FORECAST_PURPLE"]).toFixed(0);
                                var re020count = (score[i]["RE020_FORECAST_RED"] + score[i]["RE020_FORECAST_YELLOW"] + score[i]["RE020_FORECAST_GREEN"] + score[i]["RE020_FORECAST_PURPLE"]).toFixed(0);
                                var ci099count = (score[i]["CI099_FORECAST_RED"] + score[i]["CI099_FORECAST_YELLOW"] + score[i]["CI099_FORECAST_GREEN"] + score[i]["CI099_FORECAST_PURPLE"]).toFixed(0);
                                var ci042count = (score[i]["CI042_FORECAST_RED"] + score[i]["CI042_FORECAST_YELLOW"] + score[i]["CI042_FORECAST_GREEN"] + score[i]["CI042_FORECAST_PURPLE"]).toFixed(0);
                                var ci025count = (score[i]["CI025_FORECAST_RED"] + score[i]["CI025_FORECAST_YELLOW"] + score[i]["CI025_FORECAST_GREEN"] + score[i]["CI025_FORECAST_PURPLE"]).toFixed(0);
                                var ci119count = (score[i]["CI119_FORECAST_RED"] + score[i]["CI119_FORECAST_YELLOW"] + score[i]["CI119_FORECAST_GREEN"] + score[i]["CI119_FORECAST_PURPLE"]).toFixed(0);
                                var ci035count = (score[i]["CI035_FORECAST_RED"] + score[i]["CI035_FORECAST_YELLOW"] + score[i]["CI035_FORECAST_GREEN"] + score[i]["CI035_FORECAST_PURPLE"]).toFixed(0);
                                var onaircount = (score[i]["ONAIR_FORECAST_RED"] + score[i]["ONAIR_FORECAST_YELLOW"] + score[i]["ONAIR_FORECAST_GREEN"] + score[i]["ONAIR_FORECAST_PURPLE"]).toFixed(0);
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI099)  <b>' + ci099count + ' ', '(CI042)  <b>' + ci042count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI119)  <b>' + ci119count + ' ', '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var RED_MSdata = [score[i]["SS010_FORECAST_RED"], score[i]["RE015_FORECAST_RED"], score[i]["RE001_FORECAST_RED"],
                                score[i]["RE030_FORECAST_RED"], score[i]["RE031_FORECAST_RED"], score[i]["RE020_FORECAST_RED"], score[i]["CI099_FORECAST_RED"],
                                score[i]["CI042_FORECAST_RED"], score[i]["CI025_FORECAST_RED"], score[i]["CI119_FORECAST_RED"], score[i]["CI035_FORECAST_RED"], score[i]["ONAIR_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI099)  <b>' + ci099count + ' ', '(CI042)  <b>' + ci042count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI119)  <b>' + ci119count + ' ', '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["SS010_FORECAST_YELLOW"], score[i]["RE015_FORECAST_YELLOW"], score[i]["RE001_FORECAST_YELLOW"],
                                score[i]["RE030_FORECAST_YELLOW"], score[i]["RE031_FORECAST_YELLOW"], score[i]["RE020_FORECAST_YELLOW"], score[i]["CI099_FORECAST_YELLOW"],
                                score[i]["CI042_FORECAST_YELLOW"], score[i]["CI025_FORECAST_YELLOW"], score[i]["CI119_FORECAST_YELLOW"], score[i]["CI035_FORECAST_YELLOW"], score[i]["ONAIR_FORECAST_YELLOW"]];
                                var visibledata = true;
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI099)  <b>' + ci099count + ' ', '(CI042)  <b>' + ci042count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI119)  <b>' + ci119count + ' ', '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (m == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["SS010_FORECAST_PURPLE"], score[i]["RE015_FORECAST_PURPLE"], score[i]["RE001_FORECAST_PURPLE"],
                                score[i]["RE030_FORECAST_PURPLE"], score[i]["RE031_FORECAST_PURPLE"], score[i]["RE020_FORECAST_PURPLE"], score[i]["CI099_FORECAST_PURPLE"],
                                score[i]["CI042_FORECAST_PURPLE"], score[i]["CI025_FORECAST_PURPLE"], score[i]["CI119_FORECAST_PURPLE"], score[i]["CI035_FORECAST_PURPLE"], score[i]["ONAIR_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(SS010)  <b>' + ss010count + ' ', '(RE015)  <b>' + re015count + ' ',
                                '(RE001)  <b>' + re001count + ' ', '(RE030)  <b>' + re030count + ' ', '(RE031)  <b>' + re031count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI099)  <b>' + ci099count + ' ', '(CI042)  <b>' + ci042count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI119)  <b>' + ci119count + ' ', '(CI035)  <b>' + ci035count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + m;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "LTE") {
                        for (var l = 0; l <= 3; l++) {
                            if (l == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var GREEN_MSdata = [score[i]["JI022_FORECAST_GREEN"],
                                score[i]["RE030_FORECAST_GREEN"], score[i]["SS020_FORECAST_GREEN"], score[i]["SS007_FORECAST_GREEN"],
                                score[i]["RE015_FORECAST_GREEN"], score[i]["RE020_FORECAST_GREEN"], score[i]["CI042_FORECAST_GREEN"],
                                score[i]["CI020_FORECAST_GREEN"], score[i]["ONAIR_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                var ji022count = (score[i]["JI022_FORECAST_RED"] + score[i]["JI022_FORECAST_YELLOW"] + score[i]["JI022_FORECAST_GREEN"] + score[i]["JI022_FORECAST_PURPLE"]).toFixed(0);
                                var re030count = (score[i]["RE030_FORECAST_RED"] + score[i]["RE030_FORECAST_YELLOW"] + score[i]["RE030_FORECAST_GREEN"] + score[i]["RE030_FORECAST_PURPLE"]).toFixed(0);
                                var ss020count = (score[i]["SS020_FORECAST_RED"] + score[i]["SS020_FORECAST_YELLOW"] + score[i]["SS020_FORECAST_GREEN"] + score[i]["SS020_FORECAST_PURPLE"]).toFixed(0);
                                var ss007count = (score[i]["SS007_FORECAST_RED"] + score[i]["SS007_FORECAST_YELLOW"] + score[i]["SS007_FORECAST_GREEN"] + score[i]["SS007_FORECAST_PURPLE"]).toFixed(0);
                                var re015count = (score[i]["RE015_FORECAST_RED"] + score[i]["RE015_FORECAST_YELLOW"] + score[i]["RE015_FORECAST_GREEN"] + score[i]["RE015_FORECAST_PURPLE"]).toFixed(0);
                                var re020count = (score[i]["RE020_FORECAST_RED"] + score[i]["RE020_FORECAST_YELLOW"] + score[i]["RE020_FORECAST_GREEN"] + score[i]["RE020_FORECAST_PURPLE"]).toFixed(0);
                                var ci042count = (score[i]["CI042_FORECAST_RED"] + score[i]["CI042_FORECAST_YELLOW"] + score[i]["CI042_FORECAST_GREEN"] + score[i]["CI042_FORECAST_PURPLE"]).toFixed(0);
                                var ci020count = (score[i]["CI020_FORECAST_RED"] + score[i]["CI020_FORECAST_YELLOW"] + score[i]["CI020_FORECAST_GREEN"] + score[i]["CI020_FORECAST_PURPLE"]).toFixed(0);
                                var onaircount = (score[i]["ONAIR_FORECAST_RED"] + score[i]["ONAIR_FORECAST_YELLOW"] + score[i]["ONAIR_FORECAST_GREEN"] + score[i]["ONAIR_FORECAST_PURPLE"]).toFixed(0);
                                var categorylist = ['(JI022)  <b>' + ji022count + '  ',
                                '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + '  ',
                                //'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (l == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var RED_MSdata = [score[i]["JI022_FORECAST_RED"], score[i]["RE030_FORECAST_RED"], score[i]["SS020_FORECAST_RED"], score[i]["SS007_FORECAST_RED"],
                                score[i]["RE015_FORECAST_RED"], score[i]["RE020_FORECAST_RED"], score[i]["CI042_FORECAST_RED"], score[i]["CI020_FORECAST_RED"], score[i]["ONAIR_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(JI022)  <b>' + ji022count + '  ',
                                '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + '  ',
                                //'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (l == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["JI022_FORECAST_YELLOW"], score[i]["RE030_FORECAST_YELLOW"], score[i]["SS020_FORECAST_YELLOW"], score[i]["SS007_FORECAST_YELLOW"], score[i]["RE015_FORECAST_YELLOW"],
                                score[i]["RE020_FORECAST_YELLOW"], score[i]["CI042_FORECAST_YELLOW"], score[i]["CI020_FORECAST_YELLOW"], score[i]["ONAIR_FORECAST_YELLOW"]];
                                var visibledata = true;
                                var categorylist = ['(JI022)  <b>' + ji022count + '  ',
                                '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + '  ',
                                //'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (l == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["JI022_FORECAST_PURPLE"], score[i]["RE030_FORECAST_PURPLE"], score[i]["SS020_FORECAST_PURPLE"], score[i]["SS007_FORECAST_PURPLE"], score[i]["RE015_FORECAST_PURPLE"],
                                score[i]["RE020_FORECAST_PURPLE"], score[i]["CI042_FORECAST_PURPLE"], score[i]["CI020_FORECAST_PURPLE"], score[i]["ONAIR_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(JI022)  <b>' + ji022count + '  ',
                                '(RE030)  <b>' + re030count + ' ', '(SS020)  <b>' + ss020count + ' ',
                                '(SS007)  <b>' + ss007count + ' ', '(RE015)  <b>' + re015count + ' ', '(RE020)  <b>' + re020count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI020)  <b>' + ci020count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + '  ',
                                //'Zoning Approved (RE030)  <b>' + re030count + ' ', 'Construction Ready RFDS Complete (SS020)  <b>' + ss020count + ' ',
                                //'Structural Analysis Ordered (SS007)  <b>' + ss007count + ' ', 'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Tower Work Complete (CI020)  <b>' + ci020count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + l;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else if (score[i].PPTP_CUSTOM_ONE === "IB ALL") {
                        for (var p = 0; p <= 3; p++) {
                            if (p == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var GREEN_MSdata = [score[i]["CI171_FORECAST_GREEN"], score[i]["CI170_FORECAST_GREEN"], score[i]["RE015_FORECAST_GREEN"],
                                score[i]["RE081_FORECAST_GREEN"], score[i]["CI025_FORECAST_GREEN"], score[i]["CI042_FORECAST_GREEN"],
                                score[i]["CI050_FORECAST_GREEN"], score[i]["CI212_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                var ci171count = (score[i]["CI171_FORECAST_RED"] + score[i]["CI171_FORECAST_YELLOW"] + score[i]["CI171_FORECAST_GREEN"] + score[i]["CI171_FORECAST_PURPLE"]).toFixed(0);
                                var ci170count = (score[i]["CI170_FORECAST_RED"] + score[i]["CI170_FORECAST_YELLOW"] + score[i]["CI170_FORECAST_GREEN"] + score[i]["CI170_FORECAST_PURPLE"]).toFixed(0);
                                var re015count = (score[i]["RE015_FORECAST_RED"] + score[i]["RE015_FORECAST_YELLOW"] + score[i]["RE015_FORECAST_GREEN"] + score[i]["RE015_FORECAST_PURPLE"]).toFixed(0);
                                var re081count = (score[i]["RE081_FORECAST_RED"] + score[i]["RE081_FORECAST_YELLOW"] + score[i]["RE081_FORECAST_GREEN"] + score[i]["RE081_FORECAST_PURPLE"]).toFixed(0);
                                var ci025count = (score[i]["CI025_FORECAST_RED"] + score[i]["CI025_FORECAST_YELLOW"] + score[i]["CI025_FORECAST_GREEN"] + score[i]["CI025_FORECAST_PURPLE"]).toFixed(0);
                                var ci042count = (score[i]["CI042_FORECAST_RED"] + score[i]["CI042_FORECAST_YELLOW"] + score[i]["CI042_FORECAST_GREEN"] + score[i]["CI042_FORECAST_PURPLE"]).toFixed(0);
                                var ci050count = (score[i]["CI050_FORECAST_RED"] + score[i]["CI050_FORECAST_YELLOW"] + score[i]["CI050_FORECAST_GREEN"] + score[i]["CI050_FORECAST_PURPLE"]).toFixed(0);
                                var ci212count = (score[i]["CI212_FORECAST_RED"] + score[i]["CI212_FORECAST_YELLOW"] + score[i]["CI212_FORECAST_GREEN"] + score[i]["CI212_FORECAST_PURPLE"]).toFixed(0);
                                var categorylist = ['(CI171)  <b>' + ci171count + ' ', '(CI170)  <b>' + ci170count + ' ',
                                '(RE015)  <b>' + re015count + ' ', '(RE081)  <b>' + re081count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI050)  <b>' + ci050count + ' ', '(CI212)  <b>' + ci212count + ' '];
                                //var categorylist = ['Final RFDS and Design Approved (CI171)  <b>' + ci171count + ' ', 'Design Phase Complete (CI170)  <b>' + ci170count + ' ',
                                //'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Contract Complete (RE081)  <b>' + re081count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (CI212)  <b>' + ci212count + ' '];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (p == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var RED_MSdata = [score[i]["CI171_FORECAST_RED"], score[i]["CI170_FORECAST_RED"], score[i]["RE015_FORECAST_RED"], score[i]["RE081_FORECAST_RED"],
                                score[i]["CI025_FORECAST_RED"], score[i]["CI042_FORECAST_RED"], score[i]["CI050_FORECAST_RED"], score[i]["CI212_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(CI171)  <b>' + ci171count + ' ', '(CI170)  <b>' + ci170count + ' ',
                                '(RE015)  <b>' + re015count + ' ', '(RE081)  <b>' + re081count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI050)  <b>' + ci050count + ' ', '(CI212)  <b>' + ci212count + ' '];
                                //var categorylist = ['Final RFDS and Design Approved (CI171)  <b>' + ci171count + ' ', 'Design Phase Complete (CI170)  <b>' + ci170count + ' ',
                                //'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Contract Complete (RE081)  <b>' + re081count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (CI212)  <b>' + ci212count + ' '];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (p == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["CI171_FORECAST_YELLOW"], score[i]["CI170_FORECAST_YELLOW"], score[i]["RE015_FORECAST_YELLOW"], score[i]["RE081_FORECAST_YELLOW"], score[i]["CI025_FORECAST_YELLOW"],
                                score[i]["CI042_FORECAST_YELLOW"], score[i]["CI050_FORECAST_YELLOW"], score[i]["CI212_FORECAST_YELLOE"]];
                                var visibledata = true;
                                var categorylist = ['(CI171)  <b>' + ci171count + ' ', '(CI170)  <b>' + ci170count + ' ',
                                '(RE015)  <b>' + re015count + ' ', '(RE081)  <b>' + re081count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI050)  <b>' + ci050count + ' ', '(CI212)  <b>' + ci212count + ' '];
                                //var categorylist = ['Final RFDS and Design Approved (CI171)  <b>' + ci171count + ' ', 'Design Phase Complete (CI170)  <b>' + ci170count + ' ',
                                //'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Contract Complete (RE081)  <b>' + re081count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (CI212)  <b>' + ci212count + ' '];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (p == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["CI171_FORECAST_PURPLE"], score[i]["CI170_FORECAST_PURPLE"], score[i]["RE015_FORECAST_PURPLE"], score[i]["RE081_FORECAST_PURPLE"], score[i]["CI025_FORECAST_PURPLE"],
                                score[i]["CI042_FORECAST_PURPLE"], score[i]["CI050_FORECAST_PURPLE"], score[i]["CI212_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(CI171)  <b>' + ci171count + ' ', '(CI170)  <b>' + ci170count + ' ',
                                '(RE015)  <b>' + re015count + ' ', '(RE081)  <b>' + re081count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI042)  <b>' + ci042count + ' ', '(CI050)  <b>' + ci050count + ' ', '(CI212)  <b>' + ci212count + ' '];
                                //var categorylist = ['Final RFDS and Design Approved (CI171)  <b>' + ci171count + ' ', 'Design Phase Complete (CI170)  <b>' + ci170count + ' ',
                                //'Leasing Agreement Signed (RE015)  <b>' + re015count + ' ', 'Contract Complete (RE081)  <b>' + re081count + ' ', 'Construction Started (CI025)  <b>' + ci025count + ' ',
                                //'Transport Delivered (CI042)  <b>' + ci042count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (CI212)  <b>' + ci212count + ' '];
                                var test = i * 10 + p;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                        }
                    }

                    else {
                        for (var n = 0; n <= 3; n++) {
                            if (n == 0) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var GREEN_MSdata = [score[i]["JI022_FORECAST_GREEN"], score[i]["SS020_FORECAST_GREEN"], score[i]["RE020_FORECAST_GREEN"],
                                score[i]["CI025_FORECAST_GREEN"], score[i]["CI020_FORECAST_GREEN"], score[i]["CI050_FORECAST_GREEN"],
                                score[i]["ONAIR_FORECAST_GREEN"]];
                                var visibledata = true;
                                var planyear = score[i]["FORECAST_YEAR"];
                                var ji022count = (score[i]["JI022_FORECAST_RED"] + score[i]["JI022_FORECAST_YELLOW"] + score[i]["JI022_FORECAST_GREEN"] + score[i]["JI022_FORECAST_PURPLE"]).toFixed(0);
                                var ss020count = (score[i]["SS020_FORECAST_RED"] + score[i]["SS020_FORECAST_YELLOW"] + score[i]["SS020_FORECAST_GREEN"] + score[i]["SS020_FORECAST_PURPLE"]).toFixed(0);
                                var re020count = (score[i]["RE020_FORECAST_RED"] + score[i]["RE020_FORECAST_YELLOW"] + score[i]["RE020_FORECAST_GREEN"] + score[i]["RE020_FORECAST_PURPLE"]).toFixed(0);
                                var ci025count = (score[i]["CI025_FORECAST_RED"] + score[i]["CI025_FORECAST_YELLOW"] + score[i]["CI025_FORECAST_GREEN"] + score[i]["CI025_FORECAST_PURPLE"]).toFixed(0);
                                var ci020count = (score[i]["CI020_FORECAST_RED"] + score[i]["CI020_FORECAST_YELLOW"] + score[i]["CI020_FORECAST_GREEN"] + score[i]["CI020_FORECAST_PURPLE"]).toFixed(0);
                                var ci050count = (score[i]["CI050_FORECAST_RED"] + score[i]["CI050_FORECAST_YELLOW"] + score[i]["CI050_FORECAST_GREEN"] + score[i]["CI050_FORECAST_PURPLE"]).toFixed(0);
                                var onaircount = (score[i]["ONAIR_FORECAST_RED"] + score[i]["ONAIR_FORECAST_YELLOW"] + score[i]["ONAIR_FORECAST_GREEN"] + score[i]["ONAIR_FORECAST_PURPLE"]).toFixed(0);
                                var categorylist = ['(JI022)  <b>' + ji022count + ' ',
                                '(SS020)  <b>' + ss020count + ' ', '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI020)  <b>' + ci020count + ' ', '(CI050)  <b>' + ci050count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ',
                                //'Tower Top Complete (CI020)  <b>' + ci020count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast < Plan Date -5 Days',
                                    index: 0,
                                    legendIndex: 0,
                                    mod: moddata,
                                    data: GREEN_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#00cc00',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (n == 1) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                //var poe = score[i]["POE"];
                                var RED_MSdata = [score[i]["JI022_FORECAST_RED"], score[i]["SS020_FORECAST_RED"], score[i]["RE020_FORECAST_RED"], score[i]["CI025_FORECAST_RED"], score[i]["CI020_FORECAST_RED"],
                                score[i]["CI050_FORECAST_RED"], score[i]["YTD_FORECAST_RED"]];
                                var visibledata = true;
                                var categorylist = ['(JI022)  <b>' + ji022count + ' ',
                                '(SS020)  <b>' + ss020count + ' ', '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI020)  <b>' + ci020count + ' ', '(CI050)  <b>' + ci050count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ',
                                //'Tower Top Complete (CI020)  <b>' + ci020count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast > Plan Date',
                                    index: 2,
                                    legendIndex: 2,
                                    mod: moddata,
                                    data: RED_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff3333',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (n == 2) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var YELLOW_MSdata = [score[i]["JI022_FORECAST_YELLOW"], score[i]["SS020_FORECAST_YELLOW"], score[i]["RE020_FORECAST_YELLOW"], score[i]["CI025_FORECAST_YELLOW"], score[i]["CI020_FORECAST_YELLOW"],
                                score[i]["CI050_FORECAST_YELLOW"], score[i]["ONAIR_FORECAST_YELLOW"]];
                                var visibledata = true;
                                var categorylist = ['(JI022)  <b>' + ji022count + ' ',
                                '(SS020)  <b>' + ss020count + ' ', '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI020)  <b>' + ci020count + ' ', '(CI050)  <b>' + ci050count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ',
                                //'Tower Top Complete (CI020)  <b>' + ci020count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast Within 5 Days of Plan Date',
                                    index: 1,
                                    legendIndex: 1,
                                    mod: moddata,
                                    data: YELLOW_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ffff33',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }
                            else if (n == 3) {
                                var forecast = score[i]["FORECASTED_COUNT"];
                                var PURPLE_MSdata = [score[i]["JI022_FORECAST_PURPLE"], score[i]["SS020_FORECAST_PURPLE"], score[i]["RE020_FORECAST_PURPLE"], score[i]["CI025_FORECAST_PURPLE"], score[i]["CI020_FORECAST_PURPLE"],
                                score[i]["CI050_FORECAST_PURPLE"], score[i]["ONAIR_FORECAST_PURPLE"]];
                                var visibledata = true;
                                var categorylist = ['(JI022)  <b>' + ji022count + ' ',
                                '(SS020)  <b>' + ss020count + ' ', '(RE020)  <b>' + re020count + ' ', '(CI025)  <b>' + ci025count + ' ',
                                '(CI020)  <b>' + ci020count + ' ', '(CI050)  <b>' + ci050count + ' ', '(ONAIR)  <b>' + onaircount + ' '];
                                //var categorylist = ['Preliminary RFDS Issued to C&E (JI022)  <b>' + ji022count + ' ',
                                //'Construction Ready Final RFDS Complete (SS020)  <b>' + ss020count + ' ', 'Site Acquisition Complete (RE020)  <b>' + re020count + ' ', 'Construction Start (CI025)  <b>' + ci025count + ' ',
                                //'Tower Top Complete (CI020)  <b>' + ci020count + ' ', 'Construction Complete (CI050)  <b>' + ci050count + ' ', 'On-Air Complete (ONAIR)  <b>' + onaircount + ' '];
                                var test = i * 10 + n;
                                var max_of_array = Math.max(forecast);
                                seriesData[test] = {
                                    name: 'Forecast but NO Plan Date',
                                    index: 3,
                                    legendIndex: 3,
                                    mod: moddata,
                                    data: PURPLE_MSdata,
                                    showInLegend: true,
                                    visible: visibledata,
                                    cat: categorylist,
                                    //maxarray: max_of_array,
                                    color: '#ff66ff',
                                    dataLabels: {
                                        enabled: true,
                                        color: '#000',
                                        style: {
                                            textOutline: false,
                                            fontWeight: 'bold'
                                        }
                                    }
                                };
                            }

                        }
                    }
                }

                runTPchartbuilder2(chartDiv2, seriesData, categorylist, '360', pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five);

                function runTPchartbuilder2(chartDiv2, seriesData, categorylist, chartheight, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five) {

                    var seriesData = seriesData,
                        len = seriesData.length, r;

                    for (r = 0; r < len; r++)
                        seriesData[r] && seriesData.push(seriesData[r]);  // copy non-empty values to the end of the array

                    seriesData.splice(0, len);  // cut the array and leave only the non-empty values

                    Highcharts.setOptions({
                        lang: {
                            thousandsSep: ','
                        }

                    });

                    $(function () {

                        GlobalTPChart2 = Highcharts.chart(chartDiv2, {

                            colors: ['#00cc00', '#ff3333', '#ffff33', '#ff66ff'],
                            chart: {
                                type: 'column',
                                height: chartheight,
                                spacingBottom: 5,
                                //width: '430'
                            },
                            title: {
                                text: 'Status of Not Completed Milestone Tasks'
                            },
                            exporting: {
                                enabled: false
                            },
                            plotOptions: {
                                series: {
                                    //stacking: 'normal',
                                    cursor: 'pointer',
                                    //pointWidth: 15,
                                    animation: false,
                                    point: {
                                        events: {
                                            click: function () {
                                                var MSstring = this.category + '';
                                                var MSstringSplit = MSstring.split(' ');
                                                var MSstringWord1 = MSstringSplit[1];
                                                if (MSstringWord1 == 'Forecasted') { var TPMilestone = 'ONAIR_FORECAST'; }
                                                else { var TPMilestone = MSstring.split('(').pop().split(')')[0] + '_ACTUAL'; }
                                                var TPMilestoneF = MSstring.split('(').pop().split(')')[0] + '_FORECAST';
                                                var TPMilestoneP = MSstring.split('(').pop().split(')')[0] + '_PLAN';
                                                var MSseries = this.series.name + '';
                                                if (MSseries == 'Forecast > Plan Date') { var TPSeries = '( ' + TPMilestone + ' IS NOT NULL AND EXTRACT( YEAR FROM ' + TPMilestone + ') != 1950 )'; }
                                                if (MSseries == 'Forecast > Plan Date') { var TPSeries = '( (' + TPMilestoneF + ' IS NOT NULL OR EXTRACT( YEAR FROM ' + TPMilestoneF + ') != 1950) AND (' + TPMilestoneF + ' > ' + TPMilestoneP + ') AND (' + TPMilestone + ' IS NULL) ) '; }
                                                else if (MSseries == 'Forecast Within 5 Days of Plan Date') { var TPSeries = '( (' + TPMilestoneF + ' IS NOT NULL OR EXTRACT( YEAR FROM ' + TPMilestoneF + ') != 1950) AND (' + TPMilestoneF + ' <= ' + TPMilestoneP + ' AND ' + TPMilestoneF + ' >= ' + TPMilestoneP + ' -5) AND (' + TPMilestone + ' IS NULL) ) '; }
                                                else if (MSseries == 'Forecast < Plan Date -5 Days') { var TPSeries = '( (' + TPMilestoneF + ' IS NOT NULL OR EXTRACT( YEAR FROM ' + TPMilestoneF + ') != 1950) AND (' + TPMilestoneF + ' < ' + TPMilestoneP + ' -5) AND (' + TPMilestone + ' IS NULL) ) '; }
                                                else if (MSseries == 'Forecast but NO Plan Date') { var TPSeries = '( (' + TPMilestoneF + ' IS NOT NULL OR EXTRACT( YEAR FROM ' + TPMilestoneF + ') != 1950) AND (' + TPMilestoneP + ' IS NULL AND ' + TPMilestone + ' IS NULL) ) '; };

                                                var TPProgramHC = 'NSB ALL';
                                                if (TPProgramHC == 'NSB ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(JI012_PLAN, 'MM-DD-YYYY') AS JI012_PLAN, " +
                                                        "TO_CHAR(JI012_FORECAST, 'MM-DD-YYYY') AS JI012_FORECAST, " +
                                                        "TO_CHAR(JI012_ACTUAL, 'MM-DD-YYYY') AS JI012_ACTUAL, " +
                                                        "TO_CHAR(JI022_PLAN, 'MM-DD-YYYY') AS JI022_PLAN, " +
                                                        "TO_CHAR(JI022_FORECAST, 'MM-DD-YYYY') AS JI022_FORECAST, " +
                                                        "TO_CHAR(JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL, " +
                                                        "TO_CHAR(SS010_PLAN, 'MM-DD-YYYY') AS SS010_PLAN, " +
                                                        "TO_CHAR(SS010_FORECAST, 'MM-DD-YYYY') AS SS010_FORECAST, " +
                                                        "TO_CHAR(SS010_ACTUAL, 'MM-DD-YYYY') AS SS010_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(SS020_PLAN, 'MM-DD-YYYY') AS SS020_PLAN, " +
                                                        "TO_CHAR(SS020_FORECAST, 'MM-DD-YYYY') AS SS020_FORECAST, " +
                                                        "TO_CHAR(SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL, " +
                                                        "TO_CHAR(SS007_PLAN, 'MM-DD-YYYY') AS SS007_PLAN, " +
                                                        "TO_CHAR(SS007_FORECAST, 'MM-DD-YYYY') AS SS007_FORECAST, " +
                                                        "TO_CHAR(SS007_ACTUAL, 'MM-DD-YYYY') AS SS007_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI152_PLAN, 'MM-DD-YYYY') AS CI152_PLAN, " +
                                                        "TO_CHAR(CI152_FORECAST, 'MM-DD-YYYY') AS CI152_FORECAST, " +
                                                        "TO_CHAR(CI152_ACTUAL, 'MM-DD-YYYY') AS CI152_ACTUAL, " +
                                                        "TO_CHAR(CI153_PLAN, 'MM-DD-YYYY') AS CI153_PLAN, " +
                                                        "TO_CHAR(CI153_FORECAST, 'MM-DD-YYYY') AS CI153_FORECAST, " +
                                                        "TO_CHAR(CI153_ACTUAL, 'MM-DD-YYYY') AS CI153_ACTUAL, " +
                                                        "TO_CHAR(CI001_PLAN, 'MM-DD-YYYY') AS CI001_PLAN, " +
                                                        "TO_CHAR(CI001_FORECAST, 'MM-DD-YYYY') AS CI001_FORECAST, " +
                                                        "TO_CHAR(CI001_ACTUAL, 'MM-DD-YYYY') AS CI001_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI128_PLAN, 'MM-DD-YYYY') AS CI128_PLAN, " +
                                                        "TO_CHAR(CI128_FORECAST, 'MM-DD-YYYY') AS CI128_FORECAST, " +
                                                        "TO_CHAR(CI128_ACTUAL, 'MM-DD-YYYY') AS CI128_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'MCA') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(RE007_PLAN, 'MM-DD-YYYY') AS RE007_PLAN, " +
                                                        "TO_CHAR(RE007_FORECAST, 'MM-DD-YYYY') AS RE007_FORECAST, " +
                                                        "TO_CHAR(RE007_ACTUAL, 'MM-DD-YYYY') AS RE007_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, " +
                                                        "TO_CHAR(CI035_PLAN, 'MM-DD-YYYY') AS CI035_PLAN, " +
                                                        "TO_CHAR(CI035_FORECAST, 'MM-DD-YYYY') AS CI035_FORECAST, " +
                                                        "TO_CHAR(CI035_ACTUAL, 'MM-DD-YYYY') AS CI035_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'CRAN ALL' | TPProgramHC == '5G mmWave ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(SS010_PLAN, 'MM-DD-YYYY') AS SS010_PLAN, " +
                                                        "TO_CHAR(SS010_FORECAST, 'MM-DD-YYYY') AS SS010_FORECAST, " +
                                                        "TO_CHAR(SS010_ACTUAL, 'MM-DD-YYYY') AS SS010_ACTUAL, " +
                                                        "TO_CHAR(SS095_PLAN, 'MM-DD-YYYY') AS SS095_PLAN, " +
                                                        "TO_CHAR(SS095_FORECAST, 'MM-DD-YYYY') AS SS095_FORECAST, " +
                                                        "TO_CHAR(SS095_ACTUAL, 'MM-DD-YYYY') AS SS095_ACTUAL, " +
                                                        "TO_CHAR(SS096_PLAN, 'MM-DD-YYYY') AS SS096_PLAN, " +
                                                        "TO_CHAR(SS096_FORECAST, 'MM-DD-YYYY') AS SS096_FORECAST, " +
                                                        "TO_CHAR(SS096_ACTUAL, 'MM-DD-YYYY') AS SS096_ACTUAL, " +
                                                        "TO_CHAR(RE007_PLAN, 'MM-DD-YYYY') AS RE007_PLAN, " +
                                                        "TO_CHAR(RE007_FORECAST, 'MM-DD-YYYY') AS RE007_FORECAST, " +
                                                        "TO_CHAR(RE007_ACTUAL, 'MM-DD-YYYY') AS RE007_ACTUAL, " +
                                                        "TO_CHAR(RE056_PLAN, 'MM-DD-YYYY') AS RE056_PLAN, " +
                                                        "TO_CHAR(RE056_FORECAST, 'MM-DD-YYYY') AS RE056_FORECAST, " +
                                                        "TO_CHAR(RE056_ACTUAL, 'MM-DD-YYYY') AS RE056_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE001_PLAN, 'MM-DD-YYYY') AS RE001_PLAN, " +
                                                        "TO_CHAR(RE001_FORECAST, 'MM-DD-YYYY') AS RE001_FORECAST, " +
                                                        "TO_CHAR(RE001_ACTUAL, 'MM-DD-YYYY') AS RE001_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(RE031_PLAN, 'MM-DD-YYYY') AS RE031_PLAN, " +
                                                        "TO_CHAR(RE031_FORECAST, 'MM-DD-YYYY') AS RE031_FORECAST, " +
                                                        "TO_CHAR(RE031_ACTUAL, 'MM-DD-YYYY') AS RE031_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(RE032_PLAN, 'MM-DD-YYYY') AS RE032_PLAN, " +
                                                        "TO_CHAR(RE032_FORECAST, 'MM-DD-YYYY') AS RE032_FORECAST, " +
                                                        "TO_CHAR(RE032_ACTUAL, 'MM-DD-YYYY') AS RE032_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI119_PLAN, 'MM-DD-YYYY') AS CI119_PLAN, " +
                                                        "TO_CHAR(CI119_FORECAST, 'MM-DD-YYYY') AS CI119_FORECAST, " +
                                                        "TO_CHAR(CI119_ACTUAL, 'MM-DD-YYYY') AS CI119_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI099_PLAN, 'MM-DD-YYYY') AS CI099_PLAN, " +
                                                        "TO_CHAR(CI099_FORECAST, 'MM-DD-YYYY') AS CI099_FORECAST, " +
                                                        "TO_CHAR(CI099_ACTUAL, 'MM-DD-YYYY') AS CI099_ACTUAL, " +
                                                        "TO_CHAR(CI050_PLAN, 'MM-DD-YYYY') AS CI050_PLAN, " +
                                                        "TO_CHAR(CI050_FORECAST, 'MM-DD-YYYY') AS CI050_FORECAST, " +
                                                        "TO_CHAR(CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL, " +
                                                        "TO_CHAR(CI035_PLAN, 'MM-DD-YYYY') AS CI035_PLAN, " +
                                                        "TO_CHAR(CI035_FORECAST, 'MM-DD-YYYY') AS CI035_FORECAST, " +
                                                        "TO_CHAR(CI035_ACTUAL, 'MM-DD-YYYY') AS CI035_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == '5G mmWave ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(SS010_PLAN, 'MM-DD-YYYY') AS SS010_PLAN, " +
                                                        "TO_CHAR(SS010_FORECAST, 'MM-DD-YYYY') AS SS010_FORECAST, " +
                                                        "TO_CHAR(SS010_ACTUAL, 'MM-DD-YYYY') AS SS010_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE001_PLAN, 'MM-DD-YYYY') AS RE001_PLAN, " +
                                                        "TO_CHAR(RE001_FORECAST, 'MM-DD-YYYY') AS RE001_FORECAST, " +
                                                        "TO_CHAR(RE001_ACTUAL, 'MM-DD-YYYY') AS RE001_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(RE031_PLAN, 'MM-DD-YYYY') AS RE031_PLAN, " +
                                                        "TO_CHAR(RE031_FORECAST, 'MM-DD-YYYY') AS RE031_FORECAST, " +
                                                        "TO_CHAR(RE031_ACTUAL, 'MM-DD-YYYY') AS RE031_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI099_PLAN, 'MM-DD-YYYY') AS CI099_PLAN, " +
                                                        "TO_CHAR(CI099_FORECAST, 'MM-DD-YYYY') AS CI099_FORECAST, " +
                                                        "TO_CHAR(CI099_ACTUAL, 'MM-DD-YYYY') AS CI099_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI119_PLAN, 'MM-DD-YYYY') AS CI119_PLAN, " +
                                                        "TO_CHAR(CI119_FORECAST, 'MM-DD-YYYY') AS CI119_FORECAST, " +
                                                        "TO_CHAR(CI119_ACTUAL, 'MM-DD-YYYY') AS CI119_ACTUAL, " +
                                                        "TO_CHAR(CI035_PLAN, 'MM-DD-YYYY') AS CI035_PLAN, " +
                                                        "TO_CHAR(CI035_FORECAST, 'MM-DD-YYYY') AS CI035_FORECAST, " +
                                                        "TO_CHAR(CI035_ACTUAL, 'MM-DD-YYYY') AS CI035_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'LTE') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(JI022_PLAN, 'MM-DD-YYYY') AS JI022_PLAN, " +
                                                        "TO_CHAR(JI022_FORECAST, 'MM-DD-YYYY') AS JI022_FORECAST, " +
                                                        "TO_CHAR(JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL, " +
                                                        "TO_CHAR(RE030_PLAN, 'MM-DD-YYYY') AS RE030_PLAN, " +
                                                        "TO_CHAR(RE030_FORECAST, 'MM-DD-YYYY') AS RE030_FORECAST, " +
                                                        "TO_CHAR(RE030_ACTUAL, 'MM-DD-YYYY') AS RE030_ACTUAL, " +
                                                        "TO_CHAR(SS020_PLAN, 'MM-DD-YYYY') AS SS020_PLAN, " +
                                                        "TO_CHAR(SS020_FORECAST, 'MM-DD-YYYY') AS SS020_FORECAST, " +
                                                        "TO_CHAR(SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL, " +
                                                        "TO_CHAR(SS007_PLAN, 'MM-DD-YYYY') AS SS007_PLAN, " +
                                                        "TO_CHAR(SS007_FORECAST, 'MM-DD-YYYY') AS SS007_FORECAST, " +
                                                        "TO_CHAR(SS007_ACTUAL, 'MM-DD-YYYY') AS SS007_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, ";
                                                }
                                                else if (TPProgramHC == 'IB ALL') {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(CI171_PLAN, 'MM-DD-YYYY') AS CI171_PLAN, " +
                                                        "TO_CHAR(CI171_FORECAST, 'MM-DD-YYYY') AS CI171_FORECAST, " +
                                                        "TO_CHAR(CI171_ACTUAL, 'MM-DD-YYYY') AS CI171_ACTUAL, " +
                                                        "TO_CHAR(CI170_PLAN, 'MM-DD-YYYY') AS CI170_PLAN, " +
                                                        "TO_CHAR(CI170_FORECAST, 'MM-DD-YYYY') AS CI170_FORECAST, " +
                                                        "TO_CHAR(CI170_ACTUAL, 'MM-DD-YYYY') AS CI170_ACTUAL, " +
                                                        "TO_CHAR(RE015_PLAN, 'MM-DD-YYYY') AS RE015_PLAN, " +
                                                        "TO_CHAR(RE015_FORECAST, 'MM-DD-YYYY') AS RE015_FORECAST, " +
                                                        "TO_CHAR(RE015_ACTUAL, 'MM-DD-YYYY') AS RE015_ACTUAL, " +
                                                        "TO_CHAR(RE081_PLAN, 'MM-DD-YYYY') AS RE081_PLAN, " +
                                                        "TO_CHAR(RE081_FORECAST, 'MM-DD-YYYY') AS RE081_FORECAST, " +
                                                        "TO_CHAR(RE081_ACTUAL, 'MM-DD-YYYY') AS RE081_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI042_PLAN, 'MM-DD-YYYY') AS CI042_PLAN, " +
                                                        "TO_CHAR(CI042_FORECAST, 'MM-DD-YYYY') AS CI042_FORECAST, " +
                                                        "TO_CHAR(CI042_ACTUAL, 'MM-DD-YYYY') AS CI042_ACTUAL, " +
                                                        "TO_CHAR(CI050_PLAN, 'MM-DD-YYYY') AS CI050_PLAN, " +
                                                        "TO_CHAR(CI050_FORECAST, 'MM-DD-YYYY') AS CI050_FORECAST, " +
                                                        "TO_CHAR(CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL, " +
                                                        "TO_CHAR(CI212_PLAN, 'MM-DD-YYYY') AS CI212_PLAN, " +
                                                        "TO_CHAR(CI212_FORECAST, 'MM-DD-YYYY') AS CI212_FORECAST, " +
                                                        "TO_CHAR(CI212_ACTUAL, 'MM-DD-YYYY') AS CI212_ACTUAL, ";
                                                }
                                                else {
                                                    var sqlTPProgram =
                                                        "TO_CHAR(JI022_PLAN, 'MM-DD-YYYY') AS JI022_PLAN, " +
                                                        "TO_CHAR(JI022_FORECAST, 'MM-DD-YYYY') AS JI022_FORECAST, " +
                                                        "TO_CHAR(JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL, " +
                                                        "TO_CHAR(SS020_PLAN, 'MM-DD-YYYY') AS SS020_PLAN, " +
                                                        "TO_CHAR(SS020_FORECAST, 'MM-DD-YYYY') AS SS020_FORECAST, " +
                                                        "TO_CHAR(SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL, " +
                                                        "TO_CHAR(RE020_PLAN, 'MM-DD-YYYY') AS RE020_PLAN, " +
                                                        "TO_CHAR(RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST, " +
                                                        "TO_CHAR(RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL, " +
                                                        "TO_CHAR(CI025_PLAN, 'MM-DD-YYYY') AS CI025_PLAN, " +
                                                        "TO_CHAR(CI025_FORECAST, 'MM-DD-YYYY') AS CI025_FORECAST, " +
                                                        "TO_CHAR(CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL, " +
                                                        "TO_CHAR(CI020_PLAN, 'MM-DD-YYYY') AS CI020_PLAN, " +
                                                        "TO_CHAR(CI020_FORECAST, 'MM-DD-YYYY') AS CI020_FORECAST, " +
                                                        "TO_CHAR(CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL, " +
                                                        "TO_CHAR(CI050_PLAN, 'MM-DD-YYYY') AS CI050_PLAN, " +
                                                        "TO_CHAR(CI050_FORECAST, 'MM-DD-YYYY') AS CI050_FORECAST, " +
                                                        "TO_CHAR(CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL, ";
                                                }

                                                document.getElementById('<%= hf_TPMilestone.ClientID %>').value = TPMilestone;
                                                document.getElementById('<%= hf_TPSeries.ClientID %>').value = TPSeries;
                                                document.getElementById('<%= hf_TPProgram.ClientID %>').value = sqlTPProgram;

                                                document.getElementById('<%= hf_pptpCustomOne.ClientID %>').value = pptp_custom_one;
                                                document.getElementById('<%= hf_pptpCustomTwo.ClientID %>').value = pptp_custom_two;
                                                document.getElementById('<%= hf_pptpCustomThree.ClientID %>').value = pptp_custom_three;
                                                document.getElementById('<%= hf_pptpCustomFour.ClientID %>').value = pptp_custom_four;
                                                document.getElementById('<%= hf_pptpCustomFive.ClientID %>').value = pptp_custom_five;

                                                ExportToExcel_TP(TPMilestone, TPSeries);

                                                //alert('Milestone: ' + TPMilestone + ', Series Name: ' + this.series.name + ', Value: ' + this.y);
                                            }
                                        }
                                    }
                                }
                            },

                            xAxis: {
                                categories: categorylist,
                                labels: {
                                    style: {
                                        fontSize: '11px',
                                        color: 'black'
                                    }
                                },
                                title: {
                                    text: ''
                                }
                            },

                            yAxis: {
                                //max: max_of_array,
                                labels: {
                                    enabled: false
                                },
                                title: {
                                    text: 'Project Count',
                                    style: {
                                        fontSize: "14px"
                                    }
                                },
                                reversedStacks: false
                            },

                            legend: {
                                itemStyle: {
                                    color: '#000000',
                                    fontSize: "11px",
                                    fontWeight: 'normal'
                                },
                                symbolRadius: 0
                            },

                            tooltip: {
                                headerFormat: '<span style="font-size:16px; font-weight: bold;">{point.key}</span><table>',
                                pointFormat: '<tr><td style="font-size:14px; padding:0;">{series.name}: </td>' +
                                    '<td style="font-size:14px; font-weight: bold; padding:0; "><b>&nbsp;{point.y}</b></td>' +
                                    '<td style="font-size:14px; font-weight: bold; padding:0; "><b>&nbsp;({point.percentage:.1f}%)</b></td></tr>',
                                footerFormat: '</table>',
                                shared: true,
                                useHTML: true,
                                backgroundColor: '#FFFFFF'
                            },

                            credits: {
                                enabled: false
                            },

                            series: seriesData

                        });

                        window.setTimeout(function () { GlobalTPChart2.reflow(); });
                        $(window).resize();

                    });

                }

            }

            // ****** Task Prgression TP End ******

            // ********** PRODUCTION CURVE START **********

            function updateProductionCurve(activeTabNumber, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory, chartDiv, chartTitle, chartSubtitle, SVNum) {

                var tabName = '_tab' + activeTabNumber;

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var monthSelected = $('#<%= ddlMonth.ClientID %> option:selected').val();
                var month = monthSelected.substring(0, 7);

                console.log('updateProductionCurve function start');
                console.log("PC_groupGeo: " + groupGeo);
                console.log("PC_marketGeo: " + marketGeo);
                console.log("PC_monthSelected: " + monthSelected);
                console.log("PC_month: " + month);
                console.log("PC_pptp_custom_one: " + pptp_custom_one);
                console.log("PC_pptp_custom_two: " + pptp_custom_two);
                console.log("PC_pptp_custom_three: " + pptp_custom_three);
                console.log("PC_pptp_custom_four: " + pptp_custom_four);
                console.log("PC_pptp_custom_five: " + pptp_custom_five);

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetPRODUCTION_CHART",
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var marketTitle = $('#ddlMarket option:selected').text();
                        PC_data = JSON.parse(data.d);
                        loadProductionChartCreator(PC_data, chartDiv + tabName, chartTitle, chartSubtitle, SVNum, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory);
                        $('#Quad2' + tabName).show();
                        $('#LOADING_Quad2' + tabName).hide();
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetPRODUCTION_CHART_TABLE", //v5 updated
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': monthSelected, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        PCT_data = JSON.parse(data.d);
                        loadProductionChartTableCreator(PCT_data, tabName, tabCategory)
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights_2020.aspx/GetQuad1", //v5 updated
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'monthVariable': month, 'pptpOneVariable': pptp_custom_one, 'pptpTwoVariable': pptp_custom_two, 'pptpThreeVariable': pptp_custom_three, 'pptpFourVariable': pptp_custom_four, 'pptpFiveVariable': pptp_custom_five }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').text();
                        Quad1_data = JSON.parse(data.d);
                        loadQuad1_Month(Quad1_data, pulldown_month, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                    },
                    error: function (data) {
                    }
                });

            }

            function loadQuad1_Month(PC_data, month, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory) {

                var MONTH_FORE = PC_data[0]["TABLE_FORECAST"];
                var MONTH_PLAN = PC_data[0]["TABLE_PLAN"];
                var MONTH_ACT = PC_data[0]["TABLE_ACTUAL"];

                var MONTH_FORE_PER_OF_POE = ((MONTH_FORE / MONTH_PLAN) * 100).toFixed(0);

                if (MONTH_PLAN == "0") {
                    var MONTH_ACT_PER_OF_POE = "-";
                } else {
                    var MONTH_ACT_PER_OF_POE = ((MONTH_ACT / MONTH_PLAN) * 100).toFixed(0);
                }

                PC_data[0].FORE_PER_OF_POE = MONTH_FORE_PER_OF_POE + "%"
                PC_data[0].ACT_PER_OF_POE = MONTH_ACT_PER_OF_POE + "%"
                PC_data[0].MONTHYEAR = month;

                var YEAR_FORE = PC_data[1]["TABLE_FORECAST"];
                var YEAR_PLAN = PC_data[1]["TABLE_PLAN"];
                var YEAR_ACT = PC_data[1]["TABLE_ACTUAL"];

                var YEAR_FORE_PER_OF_POE = ((YEAR_FORE / YEAR_PLAN) * 100).toFixed(0);
                var YEAR_ACT_PER_OF_POE = ((YEAR_ACT / YEAR_PLAN) * 100).toFixed(0);

                PC_data[1].FORE_PER_OF_POE = YEAR_FORE_PER_OF_POE + "%"
                PC_data[1].ACT_PER_OF_POE = YEAR_ACT_PER_OF_POE + "%"
                PC_data[1].MONTHYEAR = curyearspan;

                console.log(PC_data);

                $('#PlanFcstActTable' + tabName).dataTable().fnDestroy();
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#PlanFcstActTable' + tabName).DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: false,
                    paging: false,
                    sort: false,
                    scrollY: 375,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[0, "asc"]],
                    searching: false,
                    data: PC_data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [],
                    columnDefs: [{ width: '20%', targets: [0, 1, 2, 3, 4] }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                        { 'data': 'MONTHYEAR' },
                        { 'data': 'TABLE_PLAN' },
                        { 'data': 'TABLE_FORECAST' },
                        { 'data': 'TABLE_ACTUAL' },
                        { 'data': 'ACT_PER_OF_POE' }

                    ],

                    rowCallback: function (column, data, index) {

                        $(column).find('td:eq(0)').addClass('bold_Table');
                        $(column).find('td:eq(0)').css('background', "#87CEFA");

                    },

                    //rowCallback: function (row, data, index) {

                    //    if (data['TABLE_FORECAST'] / data['TABLE_PLAN'] >= 1) {
                    //        $(row).find('td:eq(2)').css('background', 'LightGreen');
                    //    }
                    //    else if (data['TABLE_FORECAST'] / data['TABLE_PLAN'] < .8) {
                    //        $(row).find('td:eq(2)').css('background', 'LightCoral');
                    //    }
                    //    else {
                    //        $(row).find('td:eq(2)').css('background', 'Khaki');
                    //    }                    

                    //},

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

                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                    }
                });

                $('#PlanFcstActTable' + tabName + ' tr td:eq(1)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR", "PLAN", "PLAN", pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                });
                $('#PlanFcstActTable' + tabName + ' tr td:eq(2)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR", "FCST", "FORECAST", pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                });
                $('#PlanFcstActTable' + tabName + ' tr td:eq(3)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR", "ACT", "FORECAST", pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                });
                $('#PlanFcstActTable' + tabName + ' tr td:eq(6)').off().on('click', function () {
                    Modal2_Click_RYG();
                    updateRYG_Modal2("Month", "ONAIR", "PLAN", "PLAN", pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                });
                $('#PlanFcstActTable' + tabName + ' tr td:eq(7)').off().on('click', function () {
                    Modal2_Click_RYG();
                    updateRYG_Modal2("Month", "ONAIR", "FCST", "FORECAST", pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                });
                $('#PlanFcstActTable' + tabName + ' tr td:eq(8)').off().on('click', function () {
                    Modal2_Click_RYG();
                    updateRYG_Modal2("Month", "ONAIR", "ACT", "FORECAST", pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabName, tabCategory);
                });

                $('#PlanFcstActTable' + tabName + ' tr td:eq(1)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );
                $('#PlanFcstActTable' + tabName + ' tr td:eq(2)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );
                $('#PlanFcstActTable' + tabName + ' tr td:eq(3)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );
                $('#PlanFcstActTable' + tabName + ' tr td:eq(6)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );
                $('#PlanFcstActTable' + tabName + ' tr td:eq(7)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );
                $('#PlanFcstActTable' + tabName + ' tr td:eq(8)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );

                $(window).resize();

            };

            /****** PLAN/FORECAST/ACTUAL PRODUCTION CHART LOADER ******/
            var chart2;

            function loadProductionChartCreator(PC_data, chart_div_name, marketTitle, marketSubTitle, SVNum, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory) {
                var PC_series_values = [];
                var keys = Object.keys(PC_data[0]);

                for (var k = 0; k < keys.length; k++) {
                    var a = [];
                    for (var j = 0; j < PC_data.length; j++) {
                        if (k == 0) {
                            a.push(PC_data[j][0]);
                        } else {
                            a.push(PC_data[j][keys[k]]);
                        }
                    }
                    PC_series_values.push(a);
                }

                createProductionChart(PC_series_values[SVNum], chart_div_name, marketTitle, marketSubTitle, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory);

                var j = 17
                chart2.addSeries({
                    name: 'Plan',
                    id: 'Plan',
                    data: PC_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 13
                chart2.addSeries({
                    name: 'Forecast',
                    id: 'Forecast',
                    data: PC_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 15
                chart2.addSeries({
                    name: 'On-Air Actual',
                    id: 'On-Air Actual',
                    data: PC_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 18
                chart2.addSeries({
                    name: 'Cumulative - Plan',
                    id: 'Cumulative - Plan',
                    type: 'spline',
                    yAxis: 1,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    data: PC_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 14
                chart2.addSeries({
                    name: 'Cumulative - Forecast',
                    id: 'Cumulative - Forecast',
                    type: 'spline',
                    yAxis: 1,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    data: PC_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 16
                chart2.addSeries({
                    name: 'Cumulative - On-Air',
                    id: 'Cumulative - On-Air',
                    type: 'spline',
                    yAxis: 1,
                    lineWidth: 3,
                    marker: {
                        symbol: 'circle'
                    },
                    data: PC_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);

                chart2.redraw();
            }

            function createProductionChart(chartxaxis, chart_div_name, chart_title, chart_subtitle, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory) {
                Highcharts.setOptions({
                    lang: {
                        thousandsSep: ','
                    },
                    colors: ['#808080', '#1E90FF', '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
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
                            },
                            point: {
                                events: {
                                    click: function () {
                                        var chartCategory = this.category + '';
                                        var chartSeries = this.series.name + '';
                                        console.log(chartCategory);
                                        console.log(chartSeries);
                                        Modal_Click();
                                        updatePC_Modal(pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, chartCategory, "ONAIR", tabCategory);
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
                window.setTimeout(function () { chart2.reflow(); });
                $(window).resize();
            }

            function loadProductionChartTableCreator(data, tabName, tabCategory) {  //Aging/Audit table to display data           

                if (data.length <= 0) {
                    return;
                }
                else {
                    var sitename = data[0]["SITE_NAME"];
                    $('#PRODUCTION_CHART_TABLE' + tabName).dataTable().fnDestroy(); //destroy old table
                    $('#PRODUCTION_CHART_TABLE' + tabName).DataTable({ //build new table

                        bSort: false,
                        ordering: false,
                        //scrollY: 350,
                        //scrollCollapse: true,
                        //scrollX: true,
                        //order: [[1, "asc"]],
                        //searching: false,
                        data: data,
                        info: false,
                        //binfo: true,
                        dom: 't',
                        //buttons: [{ extend: 'csv', title: 'Aging Export' }, { extend: 'excel', title: 'Aging Export' }],
                        //columnDefs: [{ visible: false, targets: 0 }],
                        columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                            { 'data': 'COLUMN_NAME' },
                            { 'data': 'JAN' },
                            { 'data': 'FEB' },
                            { 'data': 'MAR' },
                            { 'data': 'APR' },
                            { 'data': 'MAY' },
                            { 'data': 'JUN' },
                            { 'data': 'JUL' },
                            { 'data': 'AUG' },
                            { 'data': 'SEP' },
                            { 'data': 'OCT' },
                            { 'data': 'NOV' },
                            { 'data': 'DEC' }
                        ],

                        /*createdRow: function (row, data, index) {
                            if (data["DATE_COMPLETE"] != "01-01-1950") {
                                $(row).addClass('highlightGreen');
                            }
                        }, */

                        "fnDrawCallback": function () {
                            $('#AgingTable tr').find('td').each(function () {
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

                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        }

                    });

                    $(window).resize();
                }

            }

            // ********** PRODUCTION CURVE 2 END **********
        }

    </script>


</asp:Content>

