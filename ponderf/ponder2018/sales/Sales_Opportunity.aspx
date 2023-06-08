<%@ Page Title="Sales Opportunity" Language="C#" MasterPageFile="~/MasterPageSalesOpportunity.master" AutoEventWireup="true" CodeFile="Sales_Opportunity.aspx.cs" Inherits="sales_Sales_Opportunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />

    <%--<link href="../assets_v7_0_0/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" />--%>

    <link href="../assets_v7_0_0/plugins/global/plugins.bundle.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/css/style.bundle.css" rel="stylesheet" />

    <link href="../assets_v7_0_0/css/themes/layout/header/base/light.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/css/themes/layout/header/menu/light.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/css/themes/layout/brand/light.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/css/themes/layout/aside/light.css" rel="stylesheet" />

    <script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#6993FF", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#E1E9FF", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>

    <script type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ramda/0.27.1/ramda.min.js" integrity="sha512-rZHvUXcc1zWKsxm7rJ8lVQuIr1oOmm7cShlvpV0gWf0RvbcJN6x96al/Rp2L2BI4a4ZkT2/YfVe/8YvB2UHzQw==" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/idb-keyval@3/dist/idb-keyval-iife.min.js"></script>
    <%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>--%>

    <script src="../assets_v7_0_0/plugins/global/plugins.bundle.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/prismjs/prismjs.bundle.js"></script>
    <script src="../assets_v7_0_0/js/scripts.bundle.js"></script>

    <%--<script src="../assets_v7_0_0/plugins/custom/datatables/datatables.bundle.js"></script>--%>

    <%--<script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>--%>

    <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">--%>
    <link href="../capacity/css_fontawesome/all.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>--%>
    <link href="../capacity/maps/leaflet_1_6_0/leaflet.css" rel="stylesheet" />
    <link href="../capacity/maps/src/leaflet-search.css" rel="stylesheet" />
    <link href="../capacity/maps/leaflet-search.mobile.src.css" rel="stylesheet" />
    <link href="../capacity/maps/leaflet-beautify-marker-icon.css" rel="stylesheet" />
    <link href="../capacity/maps/L.Control.ZoomBox.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.Aggregations.css" rel="stylesheet" />
    <%--<link href="../capacity/maps/clustermap/dist/MarkerCluster.Default.css" rel="stylesheet" />--%>
    <link href="MarkerCluster.Default.css" rel="stylesheet" />
    <link href="../capacity/maps/leaflet.groupedlayercontrol.css" rel="stylesheet" />

    <%--<script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>--%>
    <script src="../capacity/maps/leaflet_1_6_0/leaflet.js"></script>
    <script src="../capacity/maps/src/leaflet-search.js"></script>
    <script src="../capacity/maps/leaflet-beautify-marker-icon.js"></script>
    <script src="../capacity/maps/L.Control.ZoomBox.js"></script>
    <script src="../capacity/maps/clustermap/dist/leaflet.markercluster-regionbound.min.js"></script>
    <script src="../capacity/maps/clustermap/leaflet.featuregroup.subgroup.js"></script>
    <script src="../capacity/maps/leaflet.groupedlayercontrol.js"></script>
    <script src="https://unpkg.com/leaflet.vectorgrid@latest/dist/Leaflet.VectorGrid.bundled.js"></script>
    <%-- <script src="../capacity/maps/wise-leaflet-pip.js"></script>--%>
    <script src="../capacity/maps/subgroup.js"></script>
    <%--<script src="../capacity/maps/leaflet-event-forwarder.js"></script>--%>

    <link href="fullscreen/Control.FullScreen.css" rel="stylesheet" />
    <script src="fullscreen/Control.FullScreen.js"></script>
    <link href="../capacity/maps/leaflet-search.min.css" rel="stylesheet" />
    <script src="modules/L.Control.Search.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/main.css" />
    <link rel="stylesheet" type="text/css" href="assets/css/salesopportunity.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
    <script src="../capacity/maps/Control.TouchHover.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.18/b-1.5.6/b-flash-1.5.6/b-html5-1.5.6/fh-3.1.4/sl-1.3.0/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/PapaParse/5.3.1/papaparse.min.js"></script>
    <script src="modules/helpers/FileSaver.js"></script>

    <%--<script src="../assets_v7_0_0/js/pages/crud/datatables/extensions/scroller.js"></script>--%>

    <style>
        .triangle-label {
            display: inline-flex;
            line-height: 20px;
        }

            .triangle-label i {
                width: 0;
                height: 0;
                border-left: 5px solid transparent;
                border-right: 5px solid transparent;
                margin-top: 5px;
                margin-left: 4px;
                margin-right: 4px;
            }

        .modal {
            overflow: auto !important;
        }

        .info {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 2px solid #868e96;
        }

        .info1 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #ff9933;
        }

        .info2 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #ffff00;
        }

        .info3 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #4da6ff;
        }

        .info4 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #009900;
        }

        .info h4 {
            margin: 0 0 5px;
            color: #777;
        }

        .info1 h4 {
            margin: 0 0 5px;
            color: #777;
        }

        .info2 h4 {
            margin: 0 0 5px;
            color: #777;
        }

        .info3 h4 {
            margin: 0 0 5px;
            color: #777;
        }

        .info4 h4 {
            margin: 0 0 5px;
            color: #777;
        }

        .leaflet-touch .leaflet-bar {
            box-shadow: none;
            border: 2px solid rgba(0,0,0,0.3);
        }

        .leaflet-bar a.leaflet-control-touchhover-toggled {
            background: #888;
        }

        .leaflet-bar .leaflet-control-touchhover-toggle:before {
            content: "Hov";
        }

        /*.leaflet-bar .leaflet-control-touchhover-toggle {
            background: #ff0000;
		}*/

        #buttonrowcenter {
            text-align: center;
        }

        .left {
            float: left;
        }

        .right {
            float: right;
        }

        .highlightGreen {
            background-color: #9fdf9f !important;
        }

        .DT_highlight {
            background-color: silver !important;
        }

        .DT_pointer {
            cursor: pointer;
        }

        #filter_box {
            border-color: #87cefa;
            border-style: solid;
            border-width: 2px;
        }

        #buttonrowcenterSearch {
            text-align: center;
        }

        #buttonrowcenterSearch2 {
            text-align: center;
        }
    </style>
    <asp:Literal ID="ltlModulesJsTag" runat="server"></asp:Literal>
    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_Access" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_ArAccess" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_AceAccess" runat="server" ClientIDMode="Static" />
    <asp:Literal id="ltlAcknowledgeConfidentialityFlag" runat="server"></asp:Literal>
    <div id="alreadyAcknowledged"></div>


    <div class="modal fade" data-keyboard="false" data-backdrop="static" id="confidentialInfoAcknowledge">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        AT&T Proprietary and Confidential Information</h4>
                </div>
                <div class="modal-body" style="text-align: center;">
                    Not for use or disclosure outside the AT&T companies <br/> except under written agreement
                    <br />
                    <br />
                    Data to be used with the exclusive purpose of information gathering directly linked to your job responsibilities. 
                    <br />
                    <br />
                    Phone numbers are subject to existing No Call Lists and associated internal processes. It is mandatory to apply all existing rules and restrictions associated with your role and position.
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnAcknowledge" class="btn btn-primary" onclick="acknowledgeClicked()">
                        Acknowledge</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->  



    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <%--        <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">--%>
        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap" style="background-color: white">
            <!--begin::Info-->
            <div class="d-flex align-items-center flex-wrap mr-1">
                <!--begin::Page Heading-->
                <%--<div class="d-flex align-items-baseline mr-5">
                            <div class="m-stack__item m-stack__item--middle m-brand__logo">
                                    <a href="/sales/Sales.aspx" class="m-brand__logo-wrapper">
                                        <img alt="logo" src="/sales/assets/demo/default/media/img/logo/ponder_logo.jpg" runat="server" />
                                    </a>
                            </div>--%>
                <div class="header-logo">
                    <a id="logoLink" href="link">
                        <img alt="Logo" src="../assets/demo/default/media/img/logo/ponder_logo.jpg" />
                    </a>
                </div>
                <!--begin::Page Title-->
                <h5 class="text-dark font-weight-bold my-2 mr-5">&nbsp; &nbsp; Current Fiber Sales Opportunity v4.3</h5>
                <!--end::Page Title-->
                <!--begin::Breadcrumb-->
                <div id="breadcrumb" style="display: none;">
                <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                    <li class="breadcrumb-item">
                        <a href="/sales/Sales.aspx" class="text-muted">Sales Home Page</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="/sales/Sales_Dashboard.aspx" class="text-muted">Sales Dashboard</a>
                    </li>
                    <%--<li class="breadcrumb-item">
                                <a href="/sales/Sales_Opportunity.aspx" class="text-muted">Current Fiber Sales Opportunity v3.1</a>
                            </li>--%>
                    <%--<li class="breadcrumb-item">
                                <a href="" class="text-muted">Scroller</a>
                            </li>--%>
                </ul>
                    </div>
                <!--end::Breadcrumb-->

                <!--end::Page Heading-->
            </div>
            <div style="text-align: right; float: right;" class="m-demo__preview m-demo__preview--btn">
                <%--<div  id="classificationButton">--%>
                <button type="button" class="btn btn-primaryClassification btn-sm" id="ClassificationMethodologyBtn" onclick="ShowClassificationMethodology()">
                    User Guide
               
                </button>
                <%--</div>--%>
                <%--Search Function--%>
                <%--<div style="text-align: right; float: right;" class="m-demo__preview m-demo__preview--btn">--%>
                <button type="button" class="btn btn-primaryClassification btn-sm" id="btnSearch" data-toggle="modal" data-target="#m_modal_search" onclick="hideOldSearchInfo()">
                    <span>
                        <i class="fa flaticon-search"></i>
                        <span>Search for Address</span>
                    </span>
                </button>
                <%--</div>--%>
            </div>
        </div>
        <%--End Search Function--%>
        <!--end::Info-->
        <%--         </div>--%>
    </div>



    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom">
                <div class="card-body p-0">

                    <div class="alert alert-custom alert-white fade show" role="alert" style="background-color: #b3d9ff">

                        <div class="alert-text">
                            <%--<div class="left" id="left_subs">
                                <h5 class="left">Date Of Data: &nbsp;</h5>
                                <h5 class="left" id="DATADATE"></h5>
                            </div>--%>
                            <div id="right_subs">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                                </asp:ScriptManager>
                                <h5>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                        <ContentTemplate>

                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div id="ShowHideMarket" style="text-align: center">
                                                        <asp:Label ID="labelMarket" runat="server" Text="Sales Market: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();" Enabled="True">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div id="divHeatThemeList" style="text-align: center">
                                                        <asp:Label ID="labelHeatTheme" runat="server" Text="Heatmap: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlHeatTheme" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="heatThemeChange();"></asp:DropDownList><br />
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div id="showHideGroupBy" style="text-align: center;">
                                                        <asp:Label ID="lblGroupBy" runat="server" Text="Group By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();" Enabled="True">
                                                        </asp:DropDownList>
                                                    </div>    
                                                    <div id="ShowHideRegionGroupBy" style="text-align: center; display: none;">
                                                        <asp:Label ID="labelRegionGroupBy" runat="server" Text="Group Region By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlRegionGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();" Enabled="True">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div id="ShowHideMarketGroupBy" style="text-align: center; display: none;">
                                                        <asp:Label ID="labelMarketGroupBy" runat="server" Text="Group Market By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlMarketGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();" Enabled="True">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--<div ID="ShowHideRegionGroupBy" style="display:none">
                                                <asp:Label ID="labelRegionGroupBy" runat="server" Text="Group Region By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlRegionGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                </asp:DropDownList>
                                            </div>

                                            <div ID="ShowHideMarketGroupBy" style="display:none">
                                                <asp:Label ID="labelMarketGroupBy" runat="server" Text="Group Market By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlMarketGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                </asp:DropDownList>
                                            </div>--%>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnZipModal" data-toggle="modal" data-target="#m_modal_zip" />
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnCMAModal" data-toggle="modal" data-target="#m_modal_cma" />
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnCountyModal" data-toggle="modal" data-target="#m_modal_county" />
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnshowDataModal" data-toggle="modal" data-target="#m_modal_showData" />
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="ButtonSelectedMDUShowAddresses" data-toggle="modal" data-target="#m_modal_showData" />
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnShowFuturePSAData" data-toggle="modal" data-target="#m_modal_showFuturePSAData" />
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="ClassificationMethodology" data-toggle="modal" data-target="#ClassificationModal" />
                                            </div>

                                        </ContentTemplate>

                                    </asp:UpdatePanel>
                                </h5>
                            </div>

                        </div>
                    </div>


                    <div class="row justify-content-center my-10 px-8 my-lg-4 px-lg-10">

                        <div class="col-xl-12 col-xxl-12">

                            <div class="m-section">

                                <div class="col-lg-12" id="tabs">
                                    <%--<ul class="nav nav-tabs" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#m_tabs_1_1" id="tab1">
                                                <i class="flaticon-pin"></i><span class="m--visible-desktop-inline-block">&nbsp;Sales Opportunity</span>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#m_tabs_1_2" id="tab2">
                                                <i class="flaticon-layers"></i><span class="m--visible-desktop-inline-block">&nbsp;Sales Opportunity 2</span>
                                            </a>
                                        </li>

                                    </ul>--%>
                                    <div id="LOADING1" style='text-align: center; display: none'>
                                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Map and Table Data...
                                   
                                    </div>
                                    <div class="tab-content" id="MapDiv" style='display: none'>
                                        <%--<div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">  --%>


                                        <div class="row">
                                            <%--<div class="col-lg-1" id="Placeholder_tab1"></div>--%>

                                            <div class="col-lg-6" id="Placeholder_tab2">
                                                <div style="text-align: center; color: red">
                                                    <h3 id="mapcountwarning"></h3>
                                                </div>
                                                <div style="text-align: center; color: #343a40">
                                                    <h3 id="mapcounttitle"></h3>
                                                    <%--<asp:UpdatePanel ID="UpdatePanelGroup" runat="server" ChildrenAsTriggers="true">
                                                                <ContentTemplate>
                                                                    <div ID="ShowHideRegionGroupBy" style="display:none">
                                                                        <asp:Label ID="labelRegionGroupBy" runat="server" Text="Group Region By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                        <asp:DropDownList ID="ddlRegionGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                                        </asp:DropDownList>
                                                                        </div>

                                                                        <div ID="ShowHideMarketGroupBy" style="display:none">
                                                                        <asp:Label ID="labelMarketGroupBy" runat="server" Text="Group Market By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                        <asp:DropDownList ID="ddlMarketGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>--%>
                                                    <h4 id="mapcountsubtitle"></h4>
                                                </div>
                                                <div id="storemapdiv" style="height: 450px; text-align: left;"></div>
                                                <div id="psaFooterUnlimited" style="text-align: center; color: #343a40; font-size: 12px;">
                                                    An Indoor Coverage Score was generated for each PSA Location
                                                       
                                                    <br />
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                               
                                                </div>
                                                <div id="psaFooterLimited" style="text-align: center; color: #343a40; font-size: 12px;">
                                                    An Indoor Coverage Score was generated for each PSA Location 
                                                       
                                                    <br />
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                                           
                                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                               
                                                </div>

                                            </div>

                                            <div class="col-lg-6" id="divHomeTable">
                                                <%--<div class="row">--%>
                                                <div id="RecentDiv5_tab1">
                                                    <%--<div class="row">--%>

                                                    <div <%--class="content d-flex flex-column flex-column-fluid"--%> id="kt_content20">
                                                        <%-- <div class="d-flex flex-column-fluid">--%>
                                                        <%--  <div class="container" id="ddlCard">--%>
                                                        <%--<div class="card card-custom">
                                                                <div class="card-header">
                                                                    <div class="card-title">--%>

                                                        <div style="text-align: center;">
                                                            <h3><span id="TableSubtitle1"></span><span id="TableSubtitle3"></span><span id="TableSubtitle2"></span></h3>
                                                        </div>

                                                        <%--</div>--%>
                                                        <%--<div class="card-toolbar">--%>
                                                        <div style="text-align: center;" id="right_orderSortddl">

                                                            <h5>
                                                                <asp:UpdatePanel ID="UpdatePanelGroupandSort" runat="server" ChildrenAsTriggers="true">
                                                                    <ContentTemplate>

                                                                        <%--<div ID="ShowHideRegionGroupBy" style="display:none">
                                                                                                        <asp:Label ID="labelRegionGroupBy" runat="server" Text="Group Region By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlRegionGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                                                                        </asp:DropDownList>
                                                                                                        </div>

                                                                                                        <div ID="ShowHideMarketGroupBy" style="display:none">
                                                                                                        <asp:Label ID="labelMarketGroupBy" runat="server" Text="Group Market By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlMarketGroupBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                                                                        </asp:DropDownList>
                                                                                                        </div>--%>


                                                                        <asp:Label ID="labelSortBy" runat="server" Text="Sort By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                        <asp:DropDownList ID="ddlSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SortHomeTable();"></asp:DropDownList>


                                                                    </ContentTemplate>

                                                                </asp:UpdatePanel>
                                                            </h5>
                                                        </div>
                                                        <%--</div>
                                                                </div>
                                                            </div>--%>
                                                        <%--</div>--%>
                                                        <%--</div>--%>
                                                    </div>


                                                    <%--<div class="col-lg-1" id="Placeholder_tab3">
                                                        </div>--%>
                                                    <div id="RecentDiv6_tab1">

                                                        <div <%--class="content d-flex flex-column flex-column-fluid"--%> id="kt_content2">
                                                            <div <%--class="d-flex flex-column-fluid"--%>>
                                                                <div class="container" id="zipTableDiv">
                                                                    <%--<div class="card card-custom">--%>



                                                                    <%--<div class="card-toolbar">--%>

                                                                    <%--<!--begin::Dropdown-->
                                                                                        <div class="dropdown dropdown-inline mr-2">
                                                                                            <button type="button" class="btn btn-light-primary font-weight-bolder dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                <span class="svg-icon svg-icon-md">
                                                                                                    <!--begin::Svg Icon | path:assets_v7_0_0/media/svg/icons/Design/PenAndRuller.svg-->
                                                                                                    <svg xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                                            <rect x="0" y="0" width="24" height="24" />
                                                                                                            <path d="M3,16 L5,16 C5.55228475,16 6,15.5522847 6,15 C6,14.4477153 5.55228475,14 5,14 L3,14 L3,12 L5,12 C5.55228475,12 6,11.5522847 6,11 C6,10.4477153 5.55228475,10 5,10 L3,10 L3,8 L5,8 C5.55228475,8 6,7.55228475 6,7 C6,6.44771525 5.55228475,6 5,6 L3,6 L3,4 C3,3.44771525 3.44771525,3 4,3 L10,3 C10.5522847,3 11,3.44771525 11,4 L11,19 C11,19.5522847 10.5522847,20 10,20 L4,20 C3.44771525,20 3,19.5522847 3,19 L3,16 Z" fill="#000000" opacity="0.3" />
                                                                                                            <path d="M16,3 L19,3 C20.1045695,3 21,3.8954305 21,5 L21,15.2485298 C21,15.7329761 20.8241635,16.200956 20.5051534,16.565539 L17.8762883,19.5699562 C17.6944473,19.7777745 17.378566,19.7988332 17.1707477,19.6169922 C17.1540423,19.602375 17.1383289,19.5866616 17.1237117,19.5699562 L14.4948466,16.565539 C14.1758365,16.200956 14,15.7329761 14,15.2485298 L14,5 C14,3.8954305 14.8954305,3 16,3 Z" fill="#000000" />
                                                                                                        </g>
                                                                                                    </svg>
                                                                                                    <!--end::Svg Icon-->
                                                                                                </span>Export</button>
                                                                                            <!--begin::Dropdown Menu-->
                                                                                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                                                                <!--begin::Navigation-->
                                                                                                <ul class="navi flex-column navi-hover py-2">
                                                                                                    <li class="navi-header font-weight-bolder text-uppercase font-size-sm text-primary pb-2">Choose an option:</li>
                                                                                                    <li class="navi-item">
                                                                                                        <a href="#" class="navi-link">
                                                                                                            <span class="navi-icon">
                                                                                                                <i class="la la-file-excel-o"></i>
                                                                                                            </span>
                                                                                                            <span class="navi-text">Excel</span>
                                                                                                        </a>
                                                                                                    </li>
                                                                                                    <li class="navi-item">
                                                                                                        <a href="#" class="navi-link">
                                                                                                            <span class="navi-icon">
                                                                                                                <i class="la la-file-text-o"></i>
                                                                                                            </span>
                                                                                                            <span class="navi-text">CSV</span>
                                                                                                        </a>
                                                                                                    </li>

                                                                                                </ul>
                                                                                                <!--end::Navigation-->
                                                                                            </div>
                                                                                            <!--end::Dropdown Menu-->
                                                                                        </div>
                                                                                        <!--end::Dropdown-->--%>
                                                                    <%--</div>--%>

                                                                    <%-- <div class="card-body">--%>
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="zipCode_datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th>Rank</th>--%>
                                                                                <th>Zip Code</th>
                                                                                <th>Overall Category</th>
                                                                                <th>Elderly Percentage</th>
                                                                                <th>Fiber Penetration</th>
                                                                                <th>Fiber Available Sort Value</th>
                                                                                <th>Wireless</th>
                                                                                <th>Fiber Availabile</th>
                                                                                <th>Fiber Customers</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Copper Upgrade</th>
                                                                                <th>Data Date</th>
                                                                                <%--<th>Total Area</th>--%>

                                                                                <%-- <th>Total Pops</th>--%>
                                                                                <%--<th title="Pops per Sq Mile">Pop Density</th>--%>
                                                                                <%--<th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>--%>


                                                                                <%--<th>Total Stores</th>--%>
                                                                            </tr>
                                                                        </thead>
                                                                        <%--<tfoot>
                                                                                            <tr>
                                                                                                <th>Zip Code</th>
                                                                                                <th>Category</th>
                                                                                                <th>Total Area</th>
                                                                                                <th>Total Pops</th>
                                                                                                <th>Pop Density</th>
                                                                                                <th>Indoor Coverage Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>
                                                                                                <th>Current Fiber Customers</th>
                                                                                                <th>Fiber % Customers</th>
                                                                                            </tr>
                                                                                        </tfoot>--%>
                                                                    </table>
                                                                    <!--end: Datatable-->
                                                                    <%--  </div>--%>

                                                                    <%-- </div>--%>
                                                                </div>
                                                                <div class="container" id="countyTableDiv">
                                                                    <%--<div class="card card-custom">--%>



                                                                    <%--<div class="card-toolbar">--%>
                                                                    <%-- <div class="right" id="right_orderSortCounty">

                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortCounty" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        <asp:Label ID="labelGroupRegion" runat="server" Text="Group By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlGroupRegion" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="RegionGroupChange()">
                                                                                                        </asp:DropDownList>

                                                                                                        


                                                                                                    </ContentTemplate>

                                                                                                </asp:UpdatePanel>
                                                                                            </h5>
                                                                                        </div>--%>


                                                                    <%--<!--begin::Dropdown-->
                                                                                        <div class="dropdown dropdown-inline mr-2">
                                                                                            <button type="button" class="btn btn-light-primary font-weight-bolder dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                <span class="svg-icon svg-icon-md">
                                                                                                    <!--begin::Svg Icon | path:assets_v7_0_0/media/svg/icons/Design/PenAndRuller.svg-->
                                                                                                    <svg xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                                            <rect x="0" y="0" width="24" height="24" />
                                                                                                            <path d="M3,16 L5,16 C5.55228475,16 6,15.5522847 6,15 C6,14.4477153 5.55228475,14 5,14 L3,14 L3,12 L5,12 C5.55228475,12 6,11.5522847 6,11 C6,10.4477153 5.55228475,10 5,10 L3,10 L3,8 L5,8 C5.55228475,8 6,7.55228475 6,7 C6,6.44771525 5.55228475,6 5,6 L3,6 L3,4 C3,3.44771525 3.44771525,3 4,3 L10,3 C10.5522847,3 11,3.44771525 11,4 L11,19 C11,19.5522847 10.5522847,20 10,20 L4,20 C3.44771525,20 3,19.5522847 3,19 L3,16 Z" fill="#000000" opacity="0.3" />
                                                                                                            <path d="M16,3 L19,3 C20.1045695,3 21,3.8954305 21,5 L21,15.2485298 C21,15.7329761 20.8241635,16.200956 20.5051534,16.565539 L17.8762883,19.5699562 C17.6944473,19.7777745 17.378566,19.7988332 17.1707477,19.6169922 C17.1540423,19.602375 17.1383289,19.5866616 17.1237117,19.5699562 L14.4948466,16.565539 C14.1758365,16.200956 14,15.7329761 14,15.2485298 L14,5 C14,3.8954305 14.8954305,3 16,3 Z" fill="#000000" />
                                                                                                        </g>
                                                                                                    </svg>
                                                                                                    <!--end::Svg Icon-->
                                                                                                </span>Export</button>
                                                                                            <!--begin::Dropdown Menu-->
                                                                                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                                                                <!--begin::Navigation-->
                                                                                                <ul class="navi flex-column navi-hover py-2">
                                                                                                    <li class="navi-header font-weight-bolder text-uppercase font-size-sm text-primary pb-2">Choose an option:</li>
                                                                                                    <li class="navi-item">
                                                                                                        <a href="#" class="navi-link">
                                                                                                            <span class="navi-icon">
                                                                                                                <i class="la la-file-excel-o"></i>
                                                                                                            </span>
                                                                                                            <span class="navi-text">Excel</span>
                                                                                                        </a>
                                                                                                    </li>
                                                                                                    <li class="navi-item">
                                                                                                        <a href="#" class="navi-link">
                                                                                                            <span class="navi-icon">
                                                                                                                <i class="la la-file-text-o"></i>
                                                                                                            </span>
                                                                                                            <span class="navi-text">CSV</span>
                                                                                                        </a>
                                                                                                    </li>

                                                                                                </ul>
                                                                                                <!--end::Navigation-->
                                                                                            </div>
                                                                                            <!--end::Dropdown Menu-->
                                                                                        </div>
                                                                                        <!--end::Dropdown-->--%>
                                                                    <%-- </div>--%>

                                                                    <%--<div class="card-body">--%>
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="county_datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th>Rank</th>--%>
                                                                                <th>County</th>
                                                                                <th>Wireless Category</th>
                                                                                <th>Elderly Percentage</th>
                                                                                <th>Fiber Penetration</th>
                                                                                <th>Fiber Available Sort Value</th>
                                                                                <th>Wireless</th>
                                                                                <th>Fiber Available</th>
                                                                                <th>Fiber Customers</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Copper Upgrade</th>
                                                                                <th>Data Date</th>
                                                                                <%--<th>Total Area</th>--%>
                                                                                <%--<th>Total Pops</th>--%>
                                                                                <%-- <th title="Pops per Sq Mile">Pop Density</th>--%>
                                                                                <%--<th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>--%>

                                                                                <%--<th>Total Stores</th>--%>
                                                                            </tr>
                                                                        </thead>
                                                                        <%--<tfoot>
                                                                                            <tr>
                                                                                                <th>County</th>
                                                                                                <th>Category</th>
                                                                                                <th>Total Area</th>
                                                                                                <th>Total Pops</th>
                                                                                                <th>Pop Density</th>
                                                                                                <th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>
                                                                                                <th>Current Fiber Customers</th>
                                                                                                <th>Fiber % Customers</th>
                                                                                            </tr>
                                                                                        </tfoot>--%>
                                                                    </table>
                                                                    <!--end: Datatable-->
                                                                    <%-- </div>--%>

                                                                    <%--</div>--%>
                                                                </div>

                                                                <div class="container" id="cmaTableDiv" style="padding: 0px;">
                                                                    <%-- <div class="card card-custom">--%>



                                                                    <%--<div class="card-toolbar">--%>



                                                                    <%--<!--begin::Dropdown-->
                                                                                        <div class="dropdown dropdown-inline mr-2">
                                                                                            <button type="button" class="btn btn-light-primary font-weight-bolder dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                <span class="svg-icon svg-icon-md">
                                                                                                    <!--begin::Svg Icon | path:assets_v7_0_0/media/svg/icons/Design/PenAndRuller.svg-->
                                                                                                    <svg xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                                                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                                                                            <rect x="0" y="0" width="24" height="24" />
                                                                                                            <path d="M3,16 L5,16 C5.55228475,16 6,15.5522847 6,15 C6,14.4477153 5.55228475,14 5,14 L3,14 L3,12 L5,12 C5.55228475,12 6,11.5522847 6,11 C6,10.4477153 5.55228475,10 5,10 L3,10 L3,8 L5,8 C5.55228475,8 6,7.55228475 6,7 C6,6.44771525 5.55228475,6 5,6 L3,6 L3,4 C3,3.44771525 3.44771525,3 4,3 L10,3 C10.5522847,3 11,3.44771525 11,4 L11,19 C11,19.5522847 10.5522847,20 10,20 L4,20 C3.44771525,20 3,19.5522847 3,19 L3,16 Z" fill="#000000" opacity="0.3" />
                                                                                                            <path d="M16,3 L19,3 C20.1045695,3 21,3.8954305 21,5 L21,15.2485298 C21,15.7329761 20.8241635,16.200956 20.5051534,16.565539 L17.8762883,19.5699562 C17.6944473,19.7777745 17.378566,19.7988332 17.1707477,19.6169922 C17.1540423,19.602375 17.1383289,19.5866616 17.1237117,19.5699562 L14.4948466,16.565539 C14.1758365,16.200956 14,15.7329761 14,15.2485298 L14,5 C14,3.8954305 14.8954305,3 16,3 Z" fill="#000000" />
                                                                                                        </g>
                                                                                                    </svg>
                                                                                                    <!--end::Svg Icon-->
                                                                                                </span>Export</button>
                                                                                            <!--begin::Dropdown Menu-->
                                                                                            <div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
                                                                                                <!--begin::Navigation-->
                                                                                                <ul class="navi flex-column navi-hover py-2">
                                                                                                    <li class="navi-header font-weight-bolder text-uppercase font-size-sm text-primary pb-2">Choose an option:</li>
                                                                                                    <li class="navi-item">
                                                                                                        <a href="#" class="navi-link">
                                                                                                            <span class="navi-icon">
                                                                                                                <i class="la la-file-excel-o"></i>
                                                                                                            </span>
                                                                                                            <span class="navi-text">Excel</span>
                                                                                                        </a>
                                                                                                    </li>
                                                                                                    <li class="navi-item">
                                                                                                        <a href="#" class="navi-link">
                                                                                                            <span class="navi-icon">
                                                                                                                <i class="la la-file-text-o"></i>
                                                                                                            </span>
                                                                                                            <span class="navi-text">CSV</span>
                                                                                                        </a>
                                                                                                    </li>
                                                                                                </ul>
                                                                                                <!--end::Navigation-->
                                                                                            </div>
                                                                                            <!--end::Dropdown Menu-->
                                                                                        </div>
                                                                                        <!--end::Dropdown-->--%>
                                                                    <%--  </div>--%>

                                                                    <%--<div class="card-body">--%>
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="cma_datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th>Rank</th>--%>
                                                                                <th>CMA Name</th>
                                                                                <th>CMA</th>
                                                                                <th>Wireless Category</th>
                                                                                <th>Elderly Percentage</th>
                                                                                <th>Fiber Penetration</th>
                                                                                <th>Fiber Available Sort Value</th>
                                                                                <th>Wireless</th>
                                                                                <th>Fiber Available</th>
                                                                                <th>Fiber Customers</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Copper Upgrade</th>
                                                                                <th>Data Date</th>
                                                                                <%--<th>Total Area</th>--%>
                                                                                <%--<th>Total Pops</th>--%>
                                                                                <%--<th title="Pops per Sq Mile">Pop Density</th>--%>
                                                                                <%--<th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>--%>

                                                                                <%--   <th>Total Stores</th>--%>
                                                                            </tr>
                                                                        </thead>
                                                                        <%--<tfoot>
                                                                                            <tr>
                                                                                                <th>CMA</th>
                                                                                                <th>CMA Name</th>
                                                                                                <th>Category</th>
                                                                                                <th>Total Area</th>
                                                                                                <th>Total Pops</th>
                                                                                                <th>Pop Density</th>
                                                                                                <th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>
                                                                                                <th>Current Fiber Customers</th>
                                                                                                <th>Fiber % Customers</th>
                                                                                            </tr>
                                                                                        </tfoot>--%>
                                                                    </table>
                                                                    <!--end: Datatable-->
                                                                    <%--</div>--%>


                                                                    <%--<br />
                                                                            <div class="card-body">
                                                                                <!--begin: Datatable-->
                                                                                <table class="table compact" id="zip_table">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Zip Code</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tfoot>
                                                                                        <tr>
                                                                                            <th>Zip Code</th>
                                                                                        </tr>
                                                                                    </tfoot>
                                                                                </table>
                                                                                <!--end: Datatable-->
                                                                            </div>--%>
                                                                    <%--<div id="Recent_Store_Detail" class="m-section__content" style="height: 300px; width: 100%">
                                                                                <table id="Store_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th bgcolor="#87CEFA">Store Category</th>
                                                                                            <th bgcolor="#87CEFA">Location ID</th>
                                                                                            <th bgcolor="#87CEFA">Location Name</th>
                                                                                            <th bgcolor="#87CEFA">Master Dealer</th>
                                                                                            <th bgcolor="#87CEFA">Address 1</th>
                                                                                            <th bgcolor="#87CEFA">Address 2</th>
                                                                                            <th bgcolor="#87CEFA">City</th>
                                                                                            <th bgcolor="#87CEFA">State</th>
                                                                                            <th bgcolor="#87CEFA">Zip Code</th>
                                                                                            <th bgcolor="#87CEFA">County</th>
                                                                                            <th bgcolor="#87CEFA">Latitude</th>
                                                                                            <th bgcolor="#87CEFA">Longitude</th>
                                                                                            <th bgcolor="#87CEFA">Sales Region</th>
                                                                                            <th bgcolor="#87CEFA">Sales VPGM Market</th>

                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tfoot>
                                                                                        <tr>
                                                                                            <th bgcolor="#87CEFA">Store Category</th>
                                                                                            <th bgcolor="#87CEFA">Location ID</th>
                                                                                            <th bgcolor="#87CEFA">Location Name</th>
                                                                                            <th bgcolor="#87CEFA">Master Dealer</th>
                                                                                            <th bgcolor="#87CEFA">Address 1</th>
                                                                                            <th bgcolor="#87CEFA">Address 2</th>
                                                                                            <th bgcolor="#87CEFA">City</th>
                                                                                            <th bgcolor="#87CEFA">State</th>
                                                                                            <th bgcolor="#87CEFA">Zip Code</th>
                                                                                            <th bgcolor="#87CEFA">County</th>
                                                                                            <th bgcolor="#87CEFA">Latitude</th>
                                                                                            <th bgcolor="#87CEFA">Longitude</th>
                                                                                            <th bgcolor="#87CEFA">Sales Region</th>
                                                                                            <th bgcolor="#87CEFA">Sales VPGM Market</th>

                                                                                        </tr>
                                                                                    </tfoot>
                                                                                </table>
                                                                            </div>--%>
                                                                    <%-- </div>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                                <%--</div>--%>
                                            </div>




                                        </div>
                                        <div class="row">

                                            <div class="col-lg-12" id="buttonrowcenter">
                                                <br>
                                                <div id="buttonrowzip" style="display: none">
                                                    <button id="btnZip0" type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0ZipOn()">
                                                        <br>
                                                        Clear All Highlights<br>
                                                        <br>
                                                    </button>
                                                    <button id="btnZip1" type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1ZipOn()">
                                                        <span id="spanZipButtonText1"></span>
                                                        <br>
                                                        <span id="spanZipButton1Summary1"></span>&nbspZips<br>
                                                        <span id="spanZipButton1Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnZip2" type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2ZipOn()">
                                                        <span id="spanZipButtonText2"></span>
                                                        <br>
                                                        <span id="spanZipButton2Summary1"></span>&nbspZips<br>
                                                        <span id="spanZipButton2Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnZip3" type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3ZipOn()">
                                                        <span id="spanZipButtonText3"></span>
                                                        <br>
                                                        <span id="spanZipButton3Summary1"></span>&nbspZips<br>
                                                        <span id="spanZipButton3Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnZip4" type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4ZipOn()">
                                                        <span id="spanZipButtonText4"></span>
                                                        <br>
                                                        <span id="spanZipButton4Summary1"></span>&nbspZips<br>
                                                        <span id="spanZipButton4Summary2"></span>&nbspOpportunities</button>
                                                </div>
                                                <div id="buttonrowcounty" style="display: none">
                                                    <button id="btnCounty0" type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0CountyOn()">
                                                        <br>
                                                        Clear All Highlights<br>
                                                        <br>
                                                    </button>
                                                    <button id="btnCounty1" type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1CountyOn()">
                                                        <span id="spanCountyButtonText1"></span>
                                                        <br>
                                                        <span id="spanCountyButton1Summary1"></span>&nbspCounties<br>
                                                        <span id="spanCountyButton1Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnCounty2" type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2CountyOn()">
                                                        <span id="spanCountyButtonText2"></span>
                                                        <br>
                                                        <span id="spanCountyButton2Summary1"></span>&nbspCounties<br>
                                                        <span id="spanCountyButton2Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnCounty3" type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3CountyOn()">
                                                        <span id="spanCountyButtonText3"></span>
                                                        <br>
                                                        <span id="spanCountyButton3Summary1"></span>&nbspCounties<br>
                                                        <span id="spanCountyButton3Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnCounty4" type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4CountyOn()">
                                                        <span id="spanCountyButtonText4"></span>
                                                        <br>
                                                        <span id="spanCountyButton4Summary1"></span>&nbspCounties<br>
                                                        <span id="spanCountyButton4Summary2"></span>&nbspOpportunities</button>
                                                </div>
                                                <div id="buttonrowcma" style="display: none">
                                                    <button id="btnCMA0" type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0CMAOn()">
                                                        <br>
                                                        Clear All Highlights<br>
                                                        <br>
                                                    </button>
                                                    <button id="btnCMA1" type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1CMAOn()">
                                                        <span id="spanCMAButtonText1"></span>
                                                        <br>
                                                        <span id="spanCMAButton1Summary1"></span>&nbspCMAs<br>
                                                        <span id="spanCMAButton1Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnCMA2" type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2CMAOn()">
                                                        <span id="spanCMAButtonText2"></span>
                                                        <br>
                                                        <span id="spanCMAButton2Summary1"></span>&nbspCMAs<br>
                                                        <span id="spanCMAButton2Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnCMA3" type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3CMAOn()">
                                                        <span id="spanCMAButtonText3"></span>
                                                        <br>
                                                        <span id="spanCMAButton3Summary1"></span>&nbspCMAs<br>
                                                        <span id="spanCMAButton3Summary2"></span>&nbspOpportunities</button>
                                                    <button id="btnCMA4" type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4CMAOn()">
                                                        <span id="spanCMAButtonText4"></span>
                                                        <br>
                                                        <span id="spanCMAButton4Summary1"></span>&nbspCMAs<br>
                                                        <span id="spanCMAButton4Summary2"></span>&nbspOpportunities</button>
                                                </div>
                                                <br>
                                            </div>
                                        </div>

                                        <div id="zipfooter" style="text-align: center; color: #343a40; font-size: 12px; display: none;">
                                            <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                            <div id="footerMain" style="text-align: center; color: #343a40; font-size: 14px;">
                                                <b>* Wireless coverage is exclusively assessed around population centers.</b><br />
                                                <b>Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b>
                                            </div>
                                        </div>


                                    </div>

                                    <%-- </div>--%>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>


    <!-- Classification Modal Start - improvement needed to automatically update the data dates. Don't want to manually update the modal -->
    <div class="modal fade" id="ClassificationModal" tabindex="-1" role="dialog" aria-labelledby="myRYGModal3Label">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>User Guide</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">


                        <h4>The purpose of this tool is to find specific residential areas, down to the exact address, to answer <b>"Where can we Sell Fiber Today?"</b>
                        </h4>
                        <br />

                        <div class="kt-iconbox__desc" style="text-align: center;">
                            <h3 class="kt-iconbox__title">
                                <a class="kt-link" id="ackLink" href="link" target="_blank"></a>
                            </h3>
                            <h6>User Guide with full walkthrough and screenshots</h6>
                        </div>
                        <br />

                        <%--<h3>Data Dates</h3>--%>
                        <h4>OVALS Fiber Location Data: <span id="dateOVALSFiberLocation"></span></h4>
                        <h4>OVALS In-Service Customer Data: <span id="dateOVALSActiveFiber"></span></h4>
                        <h4>Future PSAs Based on T-30 Files: <span id="dateT30Files"></span></h4>
                        <h4>Indoor Coverage Score Based on: <span id="dateIQIData"></span></h4>
                        <h4>Store Data: <span id="dateStoreData"></span></h4>
                        <br />

                        <%--<hr style="height: 2px; border-width: 0; color: #595959; background-color: #595959">
                        
                        <h3>Indoor Coverage Score</h3>

                        

                        <h6>The coverage score is built to reflect the way the customer experiences coverage when being indoor. <br />
                            It is accurate and considers the PSA location and its immediate surroundings. <br />
                            Please note that it is still less accurate than a local engineering assessment, so please refer to your market for 100% certainty. <br />
                            The score ranges from 1–Very Weak to 5-Best correspond to the following experience: <br />

                        <br />
                        <br />
                            
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): Excellent experience in indoor and outdoor conditions.<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Score 4 (Very Strong): Very good experience. Excellent coverage outdoor and at strong coverage everywhere indoor.<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Score 3 (Strong):  Seamless network experience, typical of any cellular network. Good coverage outdoor and in most areas indoor.<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Score 2 (Uneven): Good experience outdoor and partially indoor. Some areas may not be adequately covered indoor. Typical situation where enabling Voice over Wi-Fi would be recommended for a seamless experience. In dense urban areas with tall buildings, coverage scores can be very different between floors.<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Score 1 (Very Weak): Weak outdoor experience, partial indoor coverage is possible but poor experience overall<br />
                            
                        <br />
                        </h6>--%>

                        <%--<h6>The Wireless Strength of addresses are determined by IQI data within 3/4 mile of their associated PSA location.<br />
                            The PSAs are then subdivided into five smaller categories to allow for more granular classification:
                        <br />
                        <br />
                            

                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Score 1 (Very Weak): NoServiceRate > 5% OR Bottom 25% of samples have RSRP < -120 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Score 2 (Uneven): 5% > NoServiceRate > 1% OR Bottom 25% of samples have RSRP < -115 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Score 3 (Strong): 1% > NoServiceRate > 0.02% OR Bottom 25% of samples have RSRP < -110 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Score 4 (Very Strong): 0.02% > NoServiceRate OR Bottom 25% of samples have RSRP < -100 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): 0% = NoServiceRate AND Bottom 25% of samples have RSRP >= -100 dBm<br />
                            <br />
                        </h6>--%>
                    </div>


                    <div id="AceClassificationInfo">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

    <!-- Classification Modal End -->


    <!-- Zip Modal -->

    <asp:HiddenField ID="hf_PSALocation" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_PSALocationZip" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_ZIP" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_ZIP_Street" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_ZIP_House" runat="server" ClientIDMode="Static" />

    <div class="modal fade" id="m_modal_zip" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Fiber Opportunities - Zip Code <span id="ZipModalZip"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_ZIP_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                   
                    </div>
                    <div id="NODATA_SEARCH" style='display: none'>No fiber opportunities found, please check input.</div>


                    <div id="ModalDisplay">
                        <div class="row" id="DisplayInfoRow">
                            <div class="col-md-4" id="ZipInfoCol1_2" style="text-align: center; color: black">
                                <br />
                                <br />
                                <br />
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayZipCode"></h5>
                                <%-- <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayZipPop"></h5>--%>
                                <%--  <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayWirelessCat"></h5>--%>
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCat"></h6>--%>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberAvail"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCurrent"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberPen"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberOpp"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCopperUpgrade"></h5>                                
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayATTRStore"></h6>--%>
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayARStore"></h6>--%>
                                <%-- <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayALLStore"></h6>--%>
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSACount"></h6>--%>
                            </div>
                            <div class="col-md-7" id="ZipInfoCol1_1">
                                <div id="myZipModalMap" style="width: 100%; height: 300px; border: 1px solid #AAA;"></div>
                                <div id="myZipModalCopperUpgradeMap" style="width: 100%; height: 300px; border: 1px solid #AAA;">
                                    <div id='zipModalCopperUpgradeMap' style='height: 300px;'></div>
                                </div>
                                <div class="col-md-12" id="ZipInfoCol1_3" style="text-align: center; color: black">
                                    <div id="zipfooterMapModal" style="text-align: center; color: #343a40; font-size: 12px;">
                                        <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                        <br />
                                        <b>* Wireless coverage and capacity is subject to change.</b><br />
                                        <%--<b>Questions should be directed to the market RAN director.</b> <br />--%>
                                        <%--A Wireless Score was generated for each PSA Location, utilizing IQI data within a 3/4 mile radius of each Exact PSA Location. --%>
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                       
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                       
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                       
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                       
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                               
                                    </div>
                                    <div id="zipfooterMapModal3" style="text-align: center; color: #343a40; font-size: 12px;">
                                        <div id="zipfooterMapModal3content" style="text-align: center; color: #343a40; font-size: 12px;">
                                            <br />
                                            <b>* Wireless coverage and capacity is subject to change.</b><br />
                                            <%--<b>Questions should be directed to the market RAN director.</b> <br />--%
                                        <%--<b>PSA scoring: &nbsp;&nbsp;&nbsp; </b>--%>
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>
                        <div class="row" id="DisplayInfoRow2">
                        </div>
                        <br />

                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="zipModalTableDiv">
                                                <ul class="nav nav-tabs" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" data-toggle="tab" href="#zipPSATabLink" id="zipPSATab">
                                                            <h6>PSAs</h6>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" href="#zipMDUTabLink" id="zipMDUTab">
                                                            <h6>High Opportunity MDUs</h6>
                                                        </a>
                                                    </li>
                                                </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="zipPSATabLink" role="tabpanel">
                                                            <div style="text-align: right;" id="zipCopperUpgradeSortByDiv">
                                                                <h5>
                                                                    <asp:UpdatePanel ID="zipCopperUpgradeUpdatePanel" runat="server" ChildrenAsTriggers="true">
                                                                        <ContentTemplate>
                                                                            <asp:Label ID="zipCopperUpgradeSortBy" runat="server" Text="Sort By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlZipCopperUpgradeSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SortCopperUpgradeTable(this.id);"></asp:DropDownList>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </h5>
                                                            </div>
                                                    <div>
                                                            <!--begin: Datatable-->
                                                            <table class="table compact" id="zipModalCopperUpgrade_datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>ZIP CO PSA</th>                                                                        
																		<th>Map Addresses</th>
                                                                        <th>Indoor Coverage Score</th>
                                                                        <th>MDU Density</th>
                                                                        <th>Fiber Locations</th>
                                                                        <th>Fiber Customers</th>
                                                                        <th>Fiber Opportunity</th>
                                                                        <th>Fiber Penetration</th>
                                                                        <th>Copper Upgrade</th>
                                                                        <th>Market Rank</th>
                                                                        <th>Latitude</th>
                                                                        <th>Longitude</th>
                                                                        <th>Data Date</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                            <!--end: Datatable-->
                                                    </div>
                                                </div>
                                                <div class="tab-pane" id="zipMDUTabLink" role="tabpanel">
                                                    <div class="card card-custom">
                                                        <div class="card-body">
                                                            <table class="table compact" id="ZIPModal_MDUtable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Export Addresses</th>
                                                                        <th>Zip Rank</th>
                                                                        <th>House Number</th>
                                                                        <th>Prefix</th>
                                                                        <th>Street Name</th>
                                                                        <th>Zip</th>
                                                                        <th>City</th>
                                                                        <th>State</th>
                                                                        <th>Indoor Coverage Score</th>
                                                                        <th>Fiber Available</th>
                                                                        <th>Fiber Opportunity</th>
                                                                        <th>Fiber Penetration</th>
                                                                        <th>Market Rank</th>
                                                                        <th>Data Date</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
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

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- County Modal -->

    <asp:HiddenField ID="hf_PSALocationCounty" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_County" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_County_Street" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_County_House" runat="server" ClientIDMode="Static" />

    <div class="modal fade" id="m_modal_county" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Fiber Sales Opportunities - <span id="CountyModalTitle"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_County_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                   
                    </div>
                    <div id="NODATA_SEARCH_County" style='display: none'>No fiber opportunities found, please check input.</div>


                    <div id="ModalDisplay_County">
                        <div class="row" id="DisplayInfoRow_County">
                            <div class="col-md-4" id="ZipInfoCol1_2_County" style="text-align: center; color: black">
                                <br />
                                <br />
                                <br />
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCounty"></h4>
                                <%--<h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCountyPop"></h5>--%>
                                <%--<h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayWirelessCat_County"></h5>--%>
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCat_County"></h6>--%>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberAvail_County"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCurrent_County"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberPen_County"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberOpp_County"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCopperUpgrade_County"></h4>
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSANumber_County"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayATTRStore_County"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayARStore_County"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayALLStore_County"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSACount_County"></h6>--%>
                            </div>
                            <div class="col-md-7" id="ZipInfoCol1_1_County">
                                <div id="myCountyModalMap" style="width: 100%; height: 300px; border: 1px solid #AAA;"></div>
                                <div id="myCountyModalCopperUpgradeMap" style="width: 100%; height: 300px; border: 1px solid #AAA;">
                                    <div id='countyModalCopperUpgradeMap' style='height: 300px;'></div>
                                </div>
                                <div class="row" id="DisplayInfoRow2_County">
                                    <div class="col-md-12" id="ZipInfoCol1_3_County" style="text-align: center; color: black">
                                        <div id="CountyfooterMapModal" style="text-align: center; color: #343a40; font-size: 11px;">
                                            <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                            <b>* Wireless coverage and capacity is subject to change. </b>
                                            <br />
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                           
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                           
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                           
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                           
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best

                               
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>

                        <br />

                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1_County">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2_County">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="CountyModalTableDiv">

                                            <div class="card card-custom">
                                                <%--<div class="card-header">

                                                        <div class="card-toolbar">
                                                            <div class="right" id="right_orderSortCountyModal">

                                                                <h5>
                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true">
                                                                        <ContentTemplate>

                                                                            <asp:Label ID="SortCountyModalLabel" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlSortCountyModal" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="ZipModalTableUpdate();">
                                                                            </asp:DropDownList>


                                                                        </ContentTemplate>

                                                                    </asp:UpdatePanel>
                                                                </h5>
                                                            </div>


                                                        </div>
                                                    </div>--%>
                                                <div class="card-body">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-toggle="tab" href="#countyPSATabLink" id="countyPSATab">
                                                                <h6>PSAs</h6>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#countyMDUTabLink" id="countyMDUTab">
                                                                <h6>High Opportunity MDUs</h6>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <%--<br />--%>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="countyPSATabLink" role="tabpanel">
                                                            <div style="text-align: right;" id="countyCopperUpgradeSortByDiv">
                                                                <h5>
                                                                    <asp:UpdatePanel ID="countyCopperUpgradeUpdatePanel" runat="server" ChildrenAsTriggers="true">
                                                                        <ContentTemplate>
                                                                            <asp:Label ID="countyCopperUpgradeSortBy" runat="server" Text="Sort By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlCountyCopperUpgradeSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SortCopperUpgradeTable(this.id);"></asp:DropDownList>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </h5>
                                                            </div>
                                                            <div>
                                                                <!--begin: Datatable-->
                                                                <table class="table compact" id="countyModalCopperUpgrade_datatable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>ZIP CO PSA</th>                                                                        
																		    <th>Map Addresses</th>
                                                                            <th>Indoor Coverage Score</th>
                                                                            <th>MDU Density</th>
                                                                            <th>Fiber Locations</th>
                                                                            <th>Fiber Customers</th>
                                                                            <th>Fiber Opportunity</th>
                                                                            <th>Fiber Penetration</th>
                                                                            <th>Copper Upgrade</th>
                                                                            <th>Market Rank</th>
                                                                            <th>Latitude</th>
                                                                            <th>Longitude</th>
                                                                            <th>Data Date</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                                <!--end: Datatable-->
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane active" id="countyMDUTabLink" role="tabpanel">
                                                            <!--begin: Datatable-->
                                                            <table class="table compact" id="CountyModal_MDUtable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Export Addresses</th>
                                                                        <th>County Rank</th>
                                                                        <th>House Number</th>
                                                                        <th>Prefix</th>
                                                                        <th>Street Name</th>
                                                                        <th>Zip</th>
                                                                        <th>City</th>
                                                                        <th>State</th>
                                                                        <th>Indoor Coverage Score</th>
                                                                        <th>Fiber Available</th>
                                                                        <th>Fiber Opportunity</th>
                                                                        <th>Fiber Penetration</th>
                                                                        <th>Market Rank</th>
                                                                        <th>Data Date</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                            <!--end: Datatable-->
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

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <!-- CMA Modal -->

    <asp:HiddenField ID="hf_PSALocationCMA" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_CMA" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_CMA_Street" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_CMA_House" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_CMAExportGIF" runat="server" ClientIDMode="Static" />


    <div class="modal fade" id="m_modal_cma" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Fiber Sales Opportunities - <span id="CMAModalTitle"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_CMA_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                   
                    </div>
                    <div id="NODATA_SEARCH_CMA" style='display: none'>No fiber opportunities found, please check input.</div>


                    <div id="ModalDisplay_CMA">
                        <div class="row" id="DisplayInfoRow_CMA">
                            <div class="col-md-4" id="ZipInfoCol1_2_CMA" style="text-align: center; color: black">
                                <br />
                                <br />
                                <br />
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCMA"></h4>
                                <%--<h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCMAPop"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayWirelessCat_CMA"></h5>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCat_CMA"></h6>--%>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberAvail_CMA"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCurrent_CMA"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberPen_CMA"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberOpp_CMA"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCopperUpgrade_CMA"></h4>
                                <%--<h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSANumber_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayATTRStore_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayARStore_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayALLStore_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSACount_CMA"></h6>--%>
                            </div>
                            <div class="col-md-7" id="ZipInfoCol1_1_CMA">
                                <div id="myCMAModalMap" style="width: 100%; height: 300px; border: 1px solid #AAA;"></div>
                                <div id="myCMAModalCopperUpgradeMap" style="width: 100%; height: 300px; border: 1px solid #AAA;">
                                    <div id='CMAModalCopperUpgradeMap' style='height: 300px;'></div>
                                </div>
                                <div class="row" id="DisplayInfoRow2_CMA">
                                    <div class="col-md-12" id="ZipInfoCol1_3_CMA" style="text-align: center; color: black">
                                        <div id="CMAfooterMapModal" style="text-align: center; color: #343a40; font-size: 11px;">
                                            <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                            <b>* Wireless coverage and capacity subject to change. Questions about specific areas should be directed to the market RAN director.</b><br />
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                       
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                               
                                        </div>
                                        <div id="CMAfooterMapModal3" style="text-align: center; color: #343a40; font-size: 12px;">
                                            <div id="CMAfooterMapModal3content" style="text-align: center; color: #343a40; font-size: 12px;">
                                                <b>* Wireless coverage and capacity subject to change. Questions about specific areas should be directed to the market RAN director.</b><br />
                                                <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                       
                                                <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                       
                                                <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                       
                                                <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                       
                                                <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                        </div>

                        <br />

                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1_CMA">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2_CMA">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="CMAModalTableDiv">

                                            <div class="card card-custom">
                                                <%--<div class="card-header">

                                                    <div class="card-toolbar">
                                                        <div class="right" id="right_orderSortCMAModal">

                                                            <h5>
                                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" ChildrenAsTriggers="true">
                                                                    <ContentTemplate>

                                                                        <asp:Label ID="SortCMAModalLabel" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                        <asp:DropDownList ID="ddlSortCMAModal" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="ZipModalTableUpdate();">
                                                                        </asp:DropDownList>


                                                                    </ContentTemplate>

                                                                </asp:UpdatePanel>
                                                            </h5>
                                                        </div>


                                                    </div>
                                                </div>--%>
                                                <div class="card-body">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-toggle="tab" href="#cmaPSATabLink" id="cmaPSATab">
                                                                <h6>PSAs</h6>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#cmaMDUTabLink" id="cmaMDUTab">
                                                                <h6>High Opportunity MDUs</h6>
                                                            </a>
                                                        </li>
                                                    </ul>

                                                    <%--<br />--%>
                                                    <div class="tab-content">
                                                         <div class="tab-pane active" id="cmaPSATabLink" role="tabpanel">
                                                            <div style="text-align: right;" id="cmaCopperUpgradeSortByDiv">
                                                                <h5>
                                                                    <asp:UpdatePanel ID="cmaCopperUpgradeUpdatePanel" runat="server" ChildrenAsTriggers="true">
                                                                        <ContentTemplate>
                                                                            <asp:Label ID="cmaCopperUpgradeSortBy" runat="server" Text="Sort By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlCMACopperUpgradeSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SortCopperUpgradeTable(this.id);"></asp:DropDownList>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </h5>
                                                            </div>
                                                            <div>                                                           
                                                                <!--begin: Datatable-->
                                                                <table class="table compact" id="CMAModalCopperUpgrade_datatable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>ZIP CO PSA</th>                                                                        
																		    <th>Map Addresses</th>
                                                                            <th>Indoor Coverage Score</th>
                                                                            <th>MDU Density</th>
                                                                            <th>Fiber Locations</th>
                                                                            <th>Fiber Customers</th>
                                                                            <th>Fiber Opportunity</th>
                                                                            <th>Fiber Penetration</th>
                                                                            <th>Copper Upgrade</th>
                                                                            <th>Market Rank</th>
                                                                            <th>Latitude</th>
                                                                            <th>Longitude</th>
                                                                            <th>Data Date</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                                <!--end: Datatable-->
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane" id="cmaMDUTabLink" role="tabpanel">
                                                            <!--begin: Datatable-->
                                                            <table class="table compact" id="CMAModal_MDUtable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Export Addresses</th>
                                                                        <th>CMA Rank</th>
                                                                        <th>House Number</th>
                                                                        <th>Prefix</th>
                                                                        <th>Street Name</th>
                                                                        <th>Zip</th>
                                                                        <th>City</th>
                                                                        <th>State</th>
                                                                        <th>Indoor Coverage Score</th>
                                                                        <th>Fiber Available</th>
                                                                        <th>Fiber Opportunity</th>
                                                                        <th>Fiber Penetration</th>
                                                                        <th>Market Rank</th>
                                                                        <th>Data Date</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                            <!--end: Datatable-->
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

        <%--************** showFuturePSAData Modal Start **************--%>
    <div class="modal fade" id="m_modal_showFuturePSAData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content2">
                <div class="modal-header">
                    <h2>Future (T-30) Fiber Oppportunity - <span id="showFuturePSADataModalTitle"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_showFutuePSAData_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                   
                    </div>
                    <div id="NODATA_SEARCH_showFuturePSAData" style='display: none'>No fiber opportunities found, please check input.</div>


                    <div id="ModalDisplay_showFuturePSAData">


                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1_showFuturePSAData">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2_showFuturePSAData">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="showFuturePSADataModalTableDiv">

                                            <div class="card card-custom">
                                                <div id="futurePSADataCommonDiv" class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-4" style="text-align: center; color: black">
                                                            <div id="futurePSADetailsDiv">
                                                                <br />
                                                                <br />
                                                                <br />
                                                                <br />                                            
                                                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="displayFuturePSA"></h4>
                                                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="displayFuturePSAWirelessScore"></h4>
                                                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="displayFuturePSAFiberAvailableCount"></h4>
                                                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="displayFutureGreen30DayDate"></h4>
                                                                <br />
                                                                <h6>Addresses are estimated to be ready for service within next 30 days.</h6>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8" style="text-align: center; color: black">
                                                            <div id="searchaddressmapFuturePSA" style="height: 400px; text-align: left;"></div>
                                                            <div id="footNoteFuturePSA"></div>
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <br />
                                                    </div>
                                                    <!--begin: Datatable-->
                                                    <table class="table compact" id="showFuturePSADataModal_MDUtable">
                                                        <thead>
                                                            <tr>
                                                                <th>T-30 File Date</th>
                                                                <th>House Number</th>
                                                                <th>Prefix</th>
                                                                <th>Unit Number</th>
                                                                <th>Street Name</th>
                                                                <th>City</th>
                                                                <th>State</th>
                                                                <th>Zip</th>
                                                                <th>Indoor Coverage Score</th>
                                                                <th>Latitude</th>
                                                                <th>Longitude</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <!--end: Datatable-->
                                                   
                                                    <div id="futurefooter" style="text-align: center; color: #343a40; font-size: 12px;">
                                                        <div id="futurefooterMain" style="text-align: center; color: #343a40; font-size: 14px;">
                                                            <b>* Forecasts are subject to uncertainties and matters beyond our control that could cause actual results to differ materially.</b><br />
                                                            <b> You are cautioned not to place undue reliance on this view.</b>
                                                        </div>
                                                     </div>
                                                </div>
                                                <div id="futurePSADataLimitedUserDiv" style='display: none' class="card-body">
                                                    <!--begin: Datatable-->
                                                    <table class="table compact" id="showFuturePSADataModal_MDUtable_limitedUser">
                                                        <thead>
                                                            <tr>
                                                                <th>House Number</th>
                                                                <th>Prefix</th>
                                                                <th>Street Name</th>
                                                                <th>Unit Number</th>
                                                                <th>City</th>
                                                                <th>State</th>
                                                                <th>Zip</th>
                                                                <th>Wireless Score</th>
                                                                <th>Service Status</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <!--end: Datatable-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>

            </div>


        </div>
    </div>

    <%--************** showFuturePSAData Modal End **************--%>

    <%--************** showData Modal **************--%>
    <div class="modal fade" id="m_modal_showData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content2">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Show List of Sales Opportunities - <span id="showDataModalTitle"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_showData_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                   
                    </div>
                    <div id="NODATA_SEARCH_showData" style='display: none'>No fiber opportunities found, please check input.</div>


                    <div id="ModalDisplay_showData">


                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1_showData">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2_showData">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="showDataModalTableDiv">

                                            <div class="card card-custom">
                                                <div id="commonDiv" class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6" style="height: 400px;">
                                                            <div id="psaDetailsDiv" style="text-align: center; color: black">
                                                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="displayPSA"></h5>
                                                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="displayWirelessScore"></h5>
                                                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="displayFiberAvailable"></h5>
                                                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="displayFiberCustomers"></h5>
                                                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="displayFiberOpportunity"></h5>
                                                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="displayCopperUpgrade"></h5>
                                                                <br />
                                                                <h5><u>PSA Events</u></h5>
                                                                <p>Go to <a href="https://inmotion.att.com" target="_blank">inMotion Tool</a> to Add or View Event Details.</p>
                                                            </div>
                                                            <div id="divPSAEventTable" style="display: none;">
                                                                <!--begin: psaEvent Datatable-->
                                                                <table class="table compact" id="showDataModal_PSAEventTable">
                                                                    <thead>
                                                                        <tr>
                                                                            <%--<th>+</th>--%>
                                                                            <th>Event ID</th>
                                                                            <th>Event Name</th>
                                                                            <th>Fiber Channels</th>
                                                                            <th>Start Date</th>
                                                                            <th>Status</th>
                                                                            <th>Event Activity</th>
                                                                            <th>Actual New Fiber Sales</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                                <!--end: psaEvent Datatable-->
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" style="text-align: center; color: black">
                                                            <div id="searchaddressmap" style="height: 450px; text-align: left;"></div>
                                                            <div id="footNote"></div>
                                                        </div>
                                                        <%--<div class="col-md-1" style="text-align: center; color: black">
                                                    </div>--%>
                                                    </div>
                                                    <div>
                                                        <br />
                                                    </div>
                                                    <!--begin: Datatable-->
                                                    <table class="table compact" id="showDataModal_MDUtable">
                                                        <thead>
                                                            <tr>
                                                                <th>House Number</th>
                                                                <th>Prefix</th>
                                                                <th>Unit Number</th>
                                                                <th>Street Name</th>
                                                                <th>City</th>
                                                                <th>State</th>
                                                                <th>Zip</th>
                                                                <th>HyperGig</th>
                                                                <th>Regreen</th>
                                                                <th>ADSL Customer</th>
                                                                <th>CSI Eligible</th>
                                                                <th>Indoor Coverage Score</th>
                                                                <th>Customer</th>
                                                                <th>Dwelling Type</th>
                                                                <th>Latitude</th>
                                                                <th>Longitude</th>
                                                                <th>DataDate</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <!--end: Datatable-->

                                                </div>
                                                <div id="limitedUserDiv" style='display: none' class="card-body">
                                                    <!--begin: Datatable-->
                                                    <table class="table compact" id="showDataModal_MDUtable_limitedUser">
                                                        <thead>
                                                            <tr>
                                                                <th>House Number</th>
                                                                <th>Prefix</th>
                                                                <th>Street Name</th>
                                                                <th>Unit Number</th>
                                                                <th>City</th>
                                                                <th>State</th>
                                                                <th>Zip</th>                                                                
                                                                <th>HyperGig</th>
                                                                <th>Regreen</th>
                                                                <th>ADSL Customer</th>
                                                                <th>CSI Eligible</th>
                                                                <th>Wireless Score</th>
                                                                <th>Service Status</th>
                                                                <th>Dwelling Type</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <!--end: Datatable-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>

            </div>


        </div>
    </div>

    <%--************** showData Modal End **************--%>

    <!--************** Search Modal **************-->
    <div class="modal fade" id="m_modal_search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Search for Address - Fiber Availability</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">

                    <div id="ModalDisplay_MODAL">
                        <div class="row" id="DisplayInfoRow_MODAL">
                            <%--<div class="col-md-1" id="InfoCol1_0">
                            </div>--%>
                            <div class="col-md-5" id="InfoCol1_1">
                                <div id="filter_box">
                                    <div class="card-body">
                                        <%--<div id="buttonrowcenterSearch">--%>

                                        <div>

                                            <asp:Label ID="label8" runat="server" Style="width: 160px; height: 35px; float: left;" Text="House Number: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                            <input type="search" id="txtSearchHouseNumber" value="" style="width: 215px; height: 35px;" placeholder="Ex: 5210" spellcheck="false" autocomplete="off" />

                                        </div>
                                        <br />
                                        <div>

                                            <asp:Label ID="label1" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* Street Name: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                            <input type="search" id="txtSearchStreetName" value="" style="width: 215px; height: 35px;" placeholder="Ex: Goodwin" spellcheck="false" autocomplete="off" />

                                        </div>
                                        <br />
                                        <div>

                                            <asp:Label ID="label2" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* City: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                            <input type="search" id="txtSearchCity" value="" style="width: 215px; height: 35px;" placeholder="Ex: Dallas" spellcheck="false" autocomplete="off" />

                                        </div>
                                        <br />
                                        <div>

                                            <asp:Label ID="label3" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* State: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                            <asp:DropDownList ID="ddlState" Style="width: 215px; height: 35px;" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" Enabled="True">
                                            </asp:DropDownList>

                                        </div>
                                        <br />
                                        <div>

                                            <asp:Label ID="label4" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* Zip: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                            <input type="search" id="txtSearchZip" value="" style="width: 215px; height: 35px;" placeholder="Ex: 75206" spellcheck="false" autocomplete="off" />

                                        </div>
                                        <br />
                                        <asp:UpdatePanel ID="UpdatePanel_SearchInputs" runat="server" ChildrenAsTriggers="true">
                                            <ContentTemplate>

                                                <div id="buttonrowcenterSearch">
                                                    <%--<asp:Button ID="ClearSearchButton" runat="server" Text="Clear" OnClientClick="reset();" />--%>
                                                    <asp:Button ID="SearchButton" runat="server" Text="Search" OnClientClick="checkForm();" />
                                                    <%--<asp:Button ID="Button1" runat="server" Text="Search" OnClick="btnSearch_Click" OnClientClick="UpdateHomeTable();" />--%>
                                                    <br />
                                                    <div>* Required fields (Street Name, Zip) or (Street Name, City, State)</div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <br />
                                        <div id="buttonrowcenterSearch2">
                                            <div id="LOADING_SEARCH_MAP" style='display: none'>
                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading data, please be patient...
                                           
                                            </div>
                                            <div id="NODATA_SEARCH_SEARCH" style="display: none; font-size: 22px;">No availability of fiber in the search area.</div>
                                            <div id="checkFailed" style="display: none; font-size: 18px;">* Please input all required fields.</div>
                                        </div>

                                        <%--<div class="form-group row">
														<label for="example-search-input" class="col-3 col-form-label">House Number:</label>
														<div class="col-9">
															<input class="form-control" type="search" value="" id="example-text-input" />
														</div>
													</div>
													<div class="form-group row">
														<label for="example-search-input" class="col-3 col-form-label">Stret Name:</label>
														<div class="col-9">
															<input class="form-control" type="search" value="" id="example-search-input" />
														</div>
													</div>
													<div class="form-group row">
														<label for="example-search-input" class="col-3 col-form-label">City:</label>
														<div class="col-9">
															<input class="form-control" type="search" value="" id="example-email-input" />
														</div>
													</div>
													<div class="form-group row">
														<label for="example-search-input" class="col-3 col-form-label">State:</label>
														<div class="col-9">
															<input class="form-control" type="search" value="" id="example-url-input" />
														</div>
													</div>
													<div class="form-group row">
														<label for="example-search-input" class="col-3 col-form-label">Zip:</label>
														<div class="col-9">
															<input class="form-control" type="search" value="" id="example-tel-input" />
														</div>
													</div>--%>

                                        <%--</div>--%>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-7" id="searchDivMap" style="text-align: left; color: black; display: none;">
                                <div id="mySearchMap" style="height: 400px; border: 1px solid #AAA;"></div>
                                <div id="mySearchMapFootNote" style="text-align: center;"></div>
                            </div>

                        </div>
                        <br />

                        <div class="card-body" id="showSearchtable" style="display: none;">

                            <!--begin: Datatable-->
                            <table class="table compact" id="showDataModal_Searchtable">
                                <thead>
                                    <tr>
                                        <th>House Number</th>
                                        <th>Prefix</th>
                                        <th>Unit Number</th>
                                        <th>Street Name</th>
                                        <th>City</th>
                                        <th>State</th>
                                        <th>Zip</th>
                                        <th>HyperGig</th>
                                        <th>Regreen</th>
                                        <th>ADSL Customer</th>
                                        <th>CSI Eligible</th>
                                        <th>Indoor Coverage Score</th>
                                        <th>Customer</th>
                                        <th>Dwelling Type</th>
                                        <th>Latitude</th>
                                        <th>Longitude</th>
                                    </tr>
                                </thead>
                            </table>
                            <!--end: Datatable-->

                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!--************** Search Modal End **************-->
    <script>
        const acknowledgeClicked = async () => {
            //log acknowledge click event
            let myParamsObject = {
                logTableName: "PONDER_LOG_ACKNOWLEDGE",
                userID: "<%=hf_User.Value%>",
                eventType: "Fiber Sales Opportunity",
            };
            await ponderApp.logAcknowledge(JSON.stringify({ myParamsObject }), 'Sales_Opportunity.aspx/LogAcknowledge');
        }

        const ShowHideHomeTableColumns = (dataTable, groupBy) => {
            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                        const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                        let wirelessCoverageAndFiberColumn;
                        let elderlyPercentageColumn;
                        let colorCodeColumnIndex;
                        if (groupBy == 'CMA') {
                            wirelessCoverageAndFiberColumn = dataTable.column(2);
                            elderlyPercentageColumn = dataTable.column(3);
                            colorCodeColumnIndex = 2; // color code this column
                        }
                        else if (groupBy == "COUNTY" || groupBy == "ZIP") {
                            wirelessCoverageAndFiberColumn = dataTable.column(1);
                            elderlyPercentageColumn = dataTable.column(2);
                            colorCodeColumnIndex = 1;
                        }
                        if (heatTheme == "fiberPenetration") {
                            //color code cells
                            dataTable.rows().every(function () {
                                const color = heatMapConfig.getCellColor(this.data().FIBER_PERCENTAGE, parseInt(this.data().FIBER_AVAILABLE.replace(/,/g, ''), 10));
                                var row = $(this.node());
                                $('td', row).eq(colorCodeColumnIndex).css('background', color);
                            })
                        }
                        else if (heatTheme == "wirelessCoverageAndFiber") {
                            wirelessCoverageAndFiberColumn.visible(true);
                            elderlyPercentageColumn.visible(false);
                            //color code cells
                            dataTable.rows().every(function () {
                                const color = heatMapConfig.getCellColor(this.data().WIRELESS_CATEGORY, parseInt(this.data().FIBER_AVAILABLE.replace(/,/g, ''), 10));
                                var row = $(this.node());
                                $('td', row).eq(colorCodeColumnIndex).css('background', color);
                            })
                        }
                        else if (heatTheme == "elderlyPercentage") {
                            elderlyPercentageColumn.visible(true);
                            wirelessCoverageAndFiberColumn.visible(false);
                            //color code cells
                            dataTable.rows().every(function () {
                                const color = heatMapConfig.getCellColor(this.data().ELDERLY_PERCENT, parseInt(this.data().FIBER_AVAILABLE.replace(/,/g, ''), 10));
                                var row = $(this.node());
                                $('td', row).eq(colorCodeColumnIndex).css('background', color);
                            })
                        }
        }

        const getExportDate = () => {
            const date = new Date(document.getElementById('dateOVALSFiberLocation').innerHTML);
            let year = date.getFullYear();
            let month = (1 + date.getMonth()).toString().padStart(2, '0');
            let day = date.getDate().toString().padStart(2, '0');
            return month + '_' + day + '_' + year;
        }

        const exportAsCSV = (dataTableName , fileName) => {
            const dataTable = $(dataTableName).DataTable();
            const dataToExport = dataTable.rows().data().toArray();
            const exportData = R.map(item => R.pick(['DATA_DATE', 'ZIP_CO_PSA', 'SIMPLE_COVERAGE_SCORE', 'MDU_DENSITY_TEXT', 'FIBER_AVAILABLE', 'FIBER_CUSTOMERS', 'FIBER_OPPORTUNITY', 'FIBER_PENETRATION', 'COPPER_UPGRADE', 'MARKET_RANK'], item), dataToExport);
            LocationDataCsv = Papa.unparse(exportData);
            const csvBlob = new Blob([LocationDataCsv], { type: 'text/csv;charset=utf-8;' });
            saveAs(csvBlob, fileName);
        }

        const getExportColumns = (dataTableName) => {
            const fiberPenetartionExportColumnsCMA = [11, 0, 1, 4, 7, 8, 9, 10];
            const fiberPenetartionExportColumnsCountyZip = [10, 0, 3, 6, 7, 8, 9];
            const elderlyPercentageExportColumnsCMA = [11, 0, 1, 3, 4, 7, 8, 9, 10];
            const elderlyPercentageExportColumnsCountyZip = [10, 0, 2, 3, 6, 7, 8, 9];
            const wirelessScoreExportColumnsCMA = [11, 0, 1, 2, 4, 7, 8, 9, 10];
            const wirelessScoreExportColumnsCountyZip = [10, 0, 1, 3, 6, 7, 8, 9];
            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
            if (heatTheme == "fiberPenetration") {
                if (dataTableName == "cma_datatable")
                    return dataTableExportColumnsCMA = fiberPenetartionExportColumnsCMA;
                else
                    return dataTableExportColumnsCountyZip = fiberPenetartionExportColumnsCountyZip;
            }
            else if (heatTheme == "wirelessCoverageAndFiber") {
                if (dataTableName == "cma_datatable")
                    return dataTableExportColumnsCMA = wirelessScoreExportColumnsCMA;
                else
                    return dataTableExportColumnsCountyZip = dataTableExportColumnsCountyZip = wirelessScoreExportColumnsCountyZip;
            }
            else if (heatTheme == "elderlyPercentage") {
                if (dataTableName == "cma_datatable")
                    return dataTableExportColumnsCMA = elderlyPercentageExportColumnsCMA;
                else
                    return dataTableExportColumnsCountyZip = dataTableExportColumnsCountyZip = elderlyPercentageExportColumnsCountyZip;
            }
        }

        const appState = {
            storeDataSet: { national: null, region: null, market: null },
            marketType: null
        }
        var psaDataForMaskCanvas = [];
        var ZipLayerState = 0; //global layer state for zip layer, default to one so that initial clear will run, that will set it to zero, then updates on zip button clicks by user
        var CMALayerState = 0;
        var CountyLayerState = 0;
        var CMALayerGroup;
        var VpgmLayerTest;
        var Vpgm2LayerTest;
        var Vpgm3LayerTest;
        var infoDatatable;
        var infoDatatableCounty;
        var infoDatatableZip;
        var info;
        var infoCounty;
        var infoCountyZip;
        var PSALayer;
        var PSALayerCma;
        var PSALayerCounty;
        var PSALayerZip;
        var FuturePSALayerCma;
        var FuturePSALayerCounty;
        var FuturePSALayerZip;
        var ZipCodeModalSelected;
        var SelectedPSA;
        var PSALocationPoints;
        var MDUPoints;
        var CountyMDUPoints;
        var ZipMDUPoints;
        var ZipPoints;
        var ZipModalLayerGroup;
        var CMAModalLayerGroup;
        var CountyModalLayerGroup;
        var mapModal;
        var CountymapModal;
        var VpgmDataLayer;
        var VpgmData2Layer;
        var VpgmData3Layer;
        var ZipFullScreenState = 0; // 0 means not fullscreen, 1 means fullscreen. Only care about maps that can lead to modals being hidden behind their fullscreen
        var CMAFullScreenState = 0; // 0 means not fullscreen, 1 means fullscreen. Only care about maps that can lead to modals being hidden behind their fullscreen
        var CountyFullScreenState = 0;
        var SpecificMDUHouse;
        var SpecificMDUStreet;
        var SpecificMDUHouse_ZIP;
        var SpecificMDUStreet_ZIP;
        var SelectCMALat = 30;
        var SelectCMALng = -95;
        var SelectCountyLat = 30;
        var SelectCountyLng = -95;
        //var Access = "Limited";
        var Access = "<%=hf_Access.Value%>";
        var ArAccess = "<%=hf_ArAccess.Value%>";
        var AceAccess = "<%=hf_AceAccess.Value%>";
        console.log('Access: ' + Access);
        console.log('ArAccess: ' + ArAccess);
        var CountyStateModalText;
        var SearchModalLayerGroup;
        var currentZoom = 4;
        var currentCenter = [39.73, -104.99];
        var addressMap;
        var addressFieldsMap;
        var zipCopperUpgradeMapLayerGroup;
        var zipModalCopperUpgradeMap;
        var countyCopperUpgradeMapLayerGroup;
        var countyModalCopperUpgradeMap;
        var CMACopperUpgradeMapLayerGroup;
        var CMAModalCopperUpgradeMap;
        const MDUIconOptions1 = {
            iconShape: 'rectangle-dot',
            iconSize: [16, 16],
            borderWidth: 4,
            borderColor: '#e6b800',
            iconStyle: 'background-color:#e6b800; color:#e6b800; border-color:#e6b800;'
        }
        const MDUIconOptions2 = {
            iconShape: 'rectangle-dot',
            iconSize: [16, 16],
            borderWidth: 4,
            borderColor: '#ffff00',
            iconStyle: 'background-color:#ffff00; color:#ffff00; border-color:#ffff00;'
        }
        const MDUIconOptions3 = {
            iconShape: 'rectangle-dot',
            iconSize: [16, 16],
            borderWidth: 4,
            borderColor: '#00cc00',
            iconStyle: 'background-color:#00cc00; color:#00cc00; border-color:#00cc00;'
        }
        const MDUIconOptions4 = {
            iconShape: 'rectangle-dot',
            iconSize: [16, 16],
            borderWidth: 4,
            borderColor: '#008000',
            iconStyle: 'background-color:#008000; color:#008000; border-color:#008000;'
        }
        const MDUIconOptions5 = {
            iconShape: 'rectangle-dot',
            iconSize: [16, 16],
            borderWidth: 4,
            borderColor: '#003300',
            iconStyle: 'background-color:#003300; color:#003300; border-color:#003300;'
        }
        const getMarketType = () => {
            const marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            if (marketGeo == '%') {
                return 'NATIONAL';
            } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                return 'REGION';
            }
            return 'MARKET';
        }
        const sortedOverLays = ['AT&T Retail Store', 'Authorized Reseller Store', 'Market Top 25 PSAs', 'Market Top 25 MDUs', 'PSA Locations', 'Future PSA Locations', 'Future Fiber Opportunity', 'Top PSA Locations', 'High Opportunity MDUs', 'AT&T Fiber Customer', 'AT&T Fiber Upgrade', 'AT&T Fiber Prospect', 'MDU All AT&T Fiber Customers', 'MDU with AT&T Fiber Prospects'];
        const sorter = (a, b) => {
            return sortedOverLays.indexOf(a) - sortedOverLays.indexOf(b);
        };

        if (ArAccess == "AR") {            
            var link = "AR_PONDER_Fiber_Sales_Opportunity_User_Guide.pdf";
            document.getElementById('ackLink').setAttribute("href", link);
            document.getElementById('ackLink').innerHTML = "Click for User Guide";
            var logolink = "/sales/Sales_Opportunity.aspx";
            document.getElementById('logoLink').setAttribute("href", logolink);
            $('#breadcrumb').hide();
        } else {            
            var link = "PONDER_Fiber_Sales_Opportunity_User_Guide.pdf";
            document.getElementById('ackLink').setAttribute("href", link);
            document.getElementById('ackLink').innerHTML = "Click for User Guide";
            var logolink = "/sales/Sales.aspx";
            document.getElementById('logoLink').setAttribute("href", logolink);
            $('#breadcrumb').show();
        }

        $('#m_modal_showData').on('hidden.bs.modal', function () {
            ponderApp.rebuildMapOverlaysData(map);
            if (CMAModalCopperUpgradeMap)
                ponderApp.rebuildMapOverlaysData(CMAModalCopperUpgradeMap);
            if (zipModalCopperUpgradeMap)
                ponderApp.rebuildMapOverlaysData(zipModalCopperUpgradeMap);
            if (countyModalCopperUpgradeMap)
                ponderApp.rebuildMapOverlaysData(countyModalCopperUpgradeMap);
        });

        $('#m_modal_cma').on('hidden.bs.modal', function () {
            if (MDUPoints) {
                MDUPoints.clearLayers();
            }
            if (PSALocationPoints) {
                PSALocationPoints.clearLayers();
            }
            if (mapModal !== undefined && mapModal !== null) {
                mapModal.off();
                mapModal.remove(); // should remove the map from UI and clean the inner children of DOM element
                console.log('mapModal*********' + mapModal); // nothing should actually happen to the value of CMAModalCopperUpgradeMap
            }
            ponderApp.rebuildMapOverlaysData(map);
        });

        $('#m_modal_county').on('hidden.bs.modal', function () {
            if (CountyMDUPoints) {
                CountyMDUPoints.clearLayers();
            }
            if (PSALocationPoints) {
                PSALocationPoints.clearLayers();
            }
            if (CountymapModal !== undefined && CountymapModal !== null) {
                CountymapModal.off();
                CountymapModal.remove(); // should remove the map from UI and clean the inner children of DOM element
            }
            ponderApp.rebuildMapOverlaysData(map);
        });

        $('#m_modal_zip').on('hidden.bs.modal', function () {
            if (ZipMDUPoints) {
                ZipMDUPoints.clearLayers();
            }
            if (PSALocationPoints) {
                PSALocationPoints.clearLayers();
            }
            if (mapModal !== undefined && mapModal !== null) {
                mapModal.off();
                mapModal.remove(); // should remove the map from UI and clean the inner children of DOM element
            }
            ponderApp.rebuildMapOverlaysData(map);
        });

        $('#m_modal_showFuturePSAData').on('hidden.bs.modal', function () {
            ponderApp.rebuildMapOverlaysData(map);
        });

        let homePageData = {};
        let top25PSAsDataset;
        let top25MDUsDataset;

        const createFuturePSAsLayer = async (map, title, futurePSADataset) => {
            let pane = map.getPane(title);
            if (!pane) {
                pane = map.createPane(title);
                pane.style.zIndex = 400;
            }
            const response = ponderApp.createMaskCanvas(
                {
                    pane,
                    markerShape: 'TRIANGLE',
                    heatMapDataKey: 'WIRELESS_SCORE',
                    heatMapObject: {
                        "5": "#003300",
                        "4": "#008000",
                        "3": "#00cc00",
                        "2": "#ffff00",
                        "1": "#e6b800"
                    },
                    heatMapActivationZoomLevel: 1,
                    markerSizeOffsetFromZoomValue: 2,
                    minZoomBorderVisibility: 12,
                    maxZoomBorderVisibility: 20,
                    markerScaleFactor: 2.5
                }, {
                title,
                /*isDefault: 0,*/
                minZoomVisibility: 7,
                maxZoomVisibility: 20,
                showHideOnZoom: false,
                markerType: 'futurepsa'
            },
                futurePSADataset);
            return response;
        }

        const createTop25Layers = async (nationalMap, psaDataset, mduDataset) => {
            const createTop25PSAsLayer = async (map, title, psaDataset) => {
                let pane = map.getPane(title);
                if (!pane) {
                    pane = map.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        heatMapDataKey: 'WIRELESS_SCORE',
                        heatMapObject: {
                            "5": "#003300",
                            "4": "#008000",
                            "3": "#00cc00",
                            "2": "#ffff00",
                            "1": "#e6b800"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20
                    }, {
                    title,
                    isDefault: 0,
                    minZoomVisibility: 7,
                    maxZoomVisibility: 20,
                    showHideOnZoom: false,
                    markerType: 'top25psa',
                    clickPriority: 1
                },
                    psaDataset);
                return response;
            }

            const createTop25MDUsLayer = async (map, title, mduDataset) => {
                let pane = map.getPane(title);
                if (!pane) {
                    pane = map.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        markerShape: 'MDUSQUARE',
                        heatMapDataKey: 'WIRELESS_SCORE',
                        heatMapObject: {
                            "5": "#003300",
                            "4": "#008000",
                            "3": "#00cc00",
                            "2": "#ffff00",
                            "1": "#e6b800"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20
                    }, {
                    title,
                    isDefault: 0,
                    minZoomVisibility: 7,
                    maxZoomVisibility: 20,
                    showHideOnZoom: false,
                    markerType: 'top25mdu',
                    clickPriority: 1
                },
                    mduDataset);
                return response;
            }

            let top25Overlays = {};
            const top25PSAsLayer = (await createTop25PSAsLayer(nationalMap, 'Market Top 25 PSAs', psaDataset)).canvasLayer;
            nationalMap.addLayer(top25PSAsLayer);
            top25Overlays["Market Top 25 PSAs"] = top25PSAsLayer;
            const top25MDUsLayer = (await createTop25MDUsLayer(nationalMap, 'Market Top 25 MDUs', mduDataset)).canvasLayer;
            nationalMap.addLayer(top25MDUsLayer);
            top25Overlays["Market Top 25 MDUs"] = top25MDUsLayer;
            return top25Overlays;
        }

        const createCopperUpgradeLayers = async (zipModalCopperUpgradeMap, copperUpgradeDataset) => {
            const createCopperUpgradeLayer = async (map, title, copperUpgradeDataset) => {
                let pane = map.getPane(title);
                if (!pane) {
                    pane = map.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        heatMapDataKey: 'WIRELESS_SCORE',
                        heatMapObject: {
                            "5": "#003300",
                            "4": "#008000",
                            "3": "#00cc00",
                            "2": "#ffff00",
                            "1": "#e6b800"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20,
                        markerScaleFactor: 0.5
                    }, {
                    title,
                    isDefault: 0,
                    minZoomVisibility: 7,
                    maxZoomVisibility: 20,
                    showHideOnZoom: false,
                    markerType: 'psa'
                },
                    copperUpgradeDataset);
                return response;
            }

            let copperUpgradeOverlays = {};
            const copperUpgradeLayer = (await createCopperUpgradeLayer(zipModalCopperUpgradeMap, 'Copper Upgrade PSA Locations', copperUpgradeDataset)).canvasLayer;
            zipModalCopperUpgradeMap.addLayer(copperUpgradeLayer);
            copperUpgradeOverlays["PSA Locations"] = copperUpgradeLayer;
            return copperUpgradeOverlays;
        }

        const CMATop25MDUClickHandler = async (closestLocation) => {
            const mdu = closestLocation.p;
            const mapHouseValue = mdu.HOUSE_NUMBER;
            const mapPrefixValue = mdu.PREFIX;
            const mapStreetValue = mdu.STREET_NAME;
            const mapZipValue = mdu.ZIP;
            if (Access == "Unlimited") {
                $('.top25mdulink-button').attr("disabled", "disabled");
                $('.top25mdulink-spinner').show();
                //log event
                let myParamsObject = {
                    userID: "<%=hf_User.Value%>",
                        eventType: "CMA_MDU_TOP25_SINGLE_EXPORT",
                    logData: mdu.CMA,
                    logJsonPayload: JSON.stringify({
                        "HouseNumber": mapHouseValue,
                        "Prefix": mapPrefixValue,
                        "Street Name": mapStreetValue,
                        "Zip": mapZipValue
                    })
                };
                await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                //download data
                ponderApp.startDownloadChecker("top25mdulink-button", "top25mdulink-spinner", 1200);
                document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = mapHouseValue;
                document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = mapStreetValue;
                myParamsObject = {
                    type: "ExportToExcel_SelectedMDUAddressesCMA",
                    houseValue: mapHouseValue,
                    prefixValue: mapPrefixValue,
                    streetValue: mapStreetValue,
                    zipValue: mapZipValue,
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
            } else {
                document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = mapHouseValue;
                document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = mapStreetValue;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();
                document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + mdu.CMA_NAME + ' - ' + mapHouseValue + ' ' + mapStreetValue;
                const myParamsObject = {
                    type: "showData_MDUAddressesCMAFromMap",
                    houseValue: mapHouseValue,
                    prefixValue: mapPrefixValue,
                    streetValue: mapStreetValue,
                    zipValue: mapZipValue,
                };
                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                unitNumbersData = JSON.parse(data.d);
                ponderApp.showLimitedUserData(unitNumbersData);
            }
        }

        const CountyTop25MDUClickHandler = async (closestLocation) => {
            const mdu = closestLocation.p;
            const mapHouseValue = mdu.HOUSE_NUMBER;
            const mapPrefixValue = mdu.PREFIX;
            const mapStreetValue = mdu.STREET_NAME;
            const mapZipValue = mdu.ZIP;
            if (Access == "Unlimited") {
                $('.top25mdulink-button').attr("disabled", "disabled");
                $('.top25mdulink-spinner').show();
                //log event
                let myParamsObject = {
                    userID: "<%=hf_User.Value%>",
                    eventType: "COUNTY_MDU_TOP25_SINGLE_EXPORT",
                    logData: mdu.COUNTY_FIPS,
                    logJsonPayload: JSON.stringify({
                        "HouseNumber": mapHouseValue,
                        "Prefix": mapPrefixValue,
                        "Street Name": mapStreetValue,
                        "Zip": mapZipValue
                    })
                };
                await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                //download data
                ponderApp.startDownloadChecker("top25mdulink-button", "top25mdulink-spinner", 1200);
                document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = mapHouseValue;
                document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = mapStreetValue;
                myParamsObject = {
                    type: "ExportToExcel_SelectedMDUAddressesCounty",
                    houseValue: mapHouseValue,
                    prefixValue: mapPrefixValue,
                    streetValue: mapStreetValue,
                    zipValue: mapZipValue,
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
            } else {
                document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = mapHouseValue;
                document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = mapStreetValue;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();
                document.getElementById('showDataModalTitle').innerHTML = 'County: ' + mdu.COUNTY_FIPS + ' - ' + mapHouseValue + ' ' + mapStreetValue;
                const myParamsObject = {
                    type: "showData_MDUAddressesCountyFromMap",
                    houseValue: mapHouseValue,
                    prefixValue: mapPrefixValue,
                    streetValue: mapStreetValue,
                    zipValue: mapZipValue,
                };
                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                unitNumbersData = JSON.parse(data.d);
                ponderApp.showLimitedUserData(unitNumbersData);
            }
        }

        const ZipTop25MDUClickHandler = async (closestLocation) => {
            const mdu = closestLocation.p;
            const mapHouseValue = mdu.HOUSE_NUMBER;
            const mapPrefixValue = mdu.PREFIX;
            const mapStreetValue = mdu.STREET_NAME;
            const mapZipValue = mdu.ZIP;
            if (Access == "Unlimited") {
                $('.top25mdulink-button').attr("disabled", "disabled");
                $('.top25mdulink-spinner').show();
                //log event
                let myParamsObject = {
                    userID: "<%=hf_User.Value%>",
                    eventType: "ZIP_MDU_TOP25_SINGLE_EXPORT",
                    logData: mdu.ZIP,
                    logJsonPayload: JSON.stringify({
                        "HouseNumber": mapHouseValue,
                        "Prefix": mapPrefixValue,
                        "Street Name": mapStreetValue,
                        "Zip": mapZipValue
                    })
                };
                await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                //download data
                ponderApp.startDownloadChecker("top25mdulink-button", "top25mdulink-spinner", 1200);
                document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = mapHouseValue;
                document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = mapStreetValue;
                myParamsObject = {
                    type: "ExportToExcel_SelectedMDUAddressesZIP",
                    houseValue: mapHouseValue,
                    prefixValue: mapPrefixValue,
                    streetValue: mapStreetValue,
                    zipValue: mapZipValue,

                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
            } else {
                document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = mapHouseValue;
                document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = mapStreetValue;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                $('#commonDiv').hide();
                $('#limitedUserDiv').hide();
                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();
                document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + mdu.ZIP + ' - ' + mapHouseValue + ' ' + mapStreetValue;
                const myParamsObject = {
                    type: "showData_MDUAddressesZipFromMap",
                    houseValue: mapHouseValue,
                    prefixValue: mapPrefixValue,
                    streetValue: mapStreetValue,
                    zipValue: mapZipValue,
                };
                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                unitNumbersData = JSON.parse(data.d);
                ponderApp.showLimitedUserData(unitNumbersData);
            }
        }

        const createStoreLayer = async (map, title, lineColor, storeDataset) => {
            let pane = map.getPane(title);
            if (!pane) {
                pane = map.createPane(title);
                pane.style.zIndex = 400;
            }
            const response = ponderApp.createMaskCanvas(
                {
                    pane,
                    markerShape: 'STOREDOUGHNUT',
                    heatMapDataKey: 'STORE_CATEGORY',
                    heatMapObject: {
                        "ATTR": "#002280",
                        "AR": "#21b2ff"
                    },
                    heatMapActivationZoomLevel: 1,
                    markerSizeOffsetFromZoomValue: 2,
                    lineColor,
                    lineWidth: 7,
                    minZoomBorderVisibility: 12,
                    maxZoomBorderVisibility: 20
                }, {
                title,
                isDefault: 0,
                minZoomVisibility: 7,
                maxZoomVisibility: 20,
                showHideOnZoom: false,
                markerType: 'store'
            },
                storeDataset);
            return response;
        }

        const createStoreLayers = async (map, storeDataset) => {
            const storeLayerLineColors = {
                "ATTR": "#002280",
                "AR": "#21b2ff"
            };
            let storeOverlays = {};
            const dataGroupedByStoreCategory = R.groupBy(R.prop('STORE_CATEGORY'), storeDataset);
            let storeCategory = R.keys(dataGroupedByStoreCategory);
            storeCategory = R.sort((a, b) => a.localeCompare(b), storeCategory);
            for (let i = 0; i < storeCategory.length; i += 1) {
                const storeLayer = (await createStoreLayer(map, storeCategory[i], storeLayerLineColors[storeCategory[i]], dataGroupedByStoreCategory[storeCategory[i]])).canvasLayer;
                //map.addLayer(storeLayer);
                storeOverlays[storeCategory[i] === "AR" ? "Authorized Reseller Store" : "AT&T Retail Store"] = storeLayer;
            }
            return storeOverlays;
        }

        const ZipModalCopperUpgradeTab = async (copperUpgradeData, ZipstoreData, VpgmData, MarketBoundaryData, ZipVariable) => {
            if (zipModalCopperUpgradeMap !== undefined && zipModalCopperUpgradeMap !== null) {
                zipModalCopperUpgradeMap.remove(); // should remove the map from UI and clean the inner children of DOM element
                console.log('zipModalCopperUpgradeMap*********' + zipModalCopperUpgradeMap); // nothing should actually happen to the value of zipModalCopperUpgradeMap
            }
            $('#zipModalCopperUpgrade_datatable').dataTable().fnDestroy(); //destroy old table
            var table = $('#zipModalCopperUpgrade_datatable');
            document.getElementById('<%= hf_PSALocationZip.ClientID %>').value = ZipVariable;
            var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                id: 'osm.topo',
                maxZoom: 17,
                zIndex: 1,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                });

            var baseLayers = {
                "Streets": streets,
                "Satellite": sat
            };
            currentZoom = 4;
            currentCenter = [39.73, -104.99];
            zipModalCopperUpgradeMap = L.map("zipModalCopperUpgradeMap", {
                attributionControl: false,
                preferCanvas: true,
                center: currentCenter,
                zoom: currentZoom,
                minZoom: 3,
                layers: [streets],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            zipModalCopperUpgradeMap.on('zoomend', function (e) {
                currentZoom = zipModalCopperUpgradeMap.getZoom();
                currentBounds = zipModalCopperUpgradeMap.getBounds();
                currentCenter = zipModalCopperUpgradeMap.getCenter();
            });

            zipModalCopperUpgradeMap.on('overlayremove', function () {
                //close open popup
                zipModalCopperUpgradeMap.closePopup();
                // reset data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(zipModalCopperUpgradeMap);
            });

            zipModalCopperUpgradeMap.on('overlayadd', function () {
                // rebuild data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(zipModalCopperUpgradeMap);
            });

            const storeOverlays = await createStoreLayers(zipModalCopperUpgradeMap, ZipstoreData);
            for (const [key, value] of Object.entries(storeOverlays)) {
                //console.log(`${key}: ${value}`);
                zipModalCopperUpgradeMap.addLayer(value);
            }
            const copperUpgradeOverlays = await createCopperUpgradeLayers(zipModalCopperUpgradeMap, copperUpgradeData);
            var overlays = {};
            var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(zipModalCopperUpgradeMap);
            overlays = Object.assign(storeOverlays, copperUpgradeOverlays);
            overlaysNames = Object.keys(overlays);
            overlaysNames.sort(sorter);
            overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));
            ponderApp.rebuildMapOverlaysData(zipModalCopperUpgradeMap);
            ponderApp.updateOverlaysLabel({ psaLocationsIconType: 'big' });

            zipModalCopperUpgradeMap.on('dragend', function () {
                currentCenter = zipModalCopperUpgradeMap.getCenter();
            });

            zipModalCopperUpgradeMap.on('click', async function (e) {
                const closestLocation = ponderApp.closest(zipModalCopperUpgradeMap.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                if (closestLocation && closestLocation.p.minZoomVisibility <= zipModalCopperUpgradeMap.getZoom() 
                                && zipModalCopperUpgradeMap.getZoom() <= closestLocation.p.maxZoomVisibility) {
                    const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                    ponderApp.markerTypes[closestLocation.p.markerType].clicked(zipModalCopperUpgradeMap, closestLocation, market, null);
                }
            });
            //set bounds
            //let allCopperUpgradePoints = new L.featureGroup();
            //for (i in copperUpgradeData) {
            //    const loc = [copperUpgradeData[i].LATITUDE, copperUpgradeData[i].LONGITUDE];
            //    marker = new L.Marker(new L.latLng(loc));
            //    allCopperUpgradePoints.addLayer(marker);
            //}
            //const bounds = allCopperUpgradePoints.getBounds();
            //zipModalCopperUpgradeMap.fitBounds(bounds);
            var zipModalCopperUpgradeMapLayerGroup = L.layerGroup().addTo(zipModalCopperUpgradeMap);
            var zipModalCopperUpgradeMapStyle = {
                weight: 5,
                color: '#000000',
                opacity: 0.5,
                fillOpacity: 0.05
            };
            function zipModalCopperUpgradeMapFilter(feature) {
                if (feature.properties.ZIP == ZipVariable) return true;
            }
            VpgmModalLayerTest = L.geoJSON(VpgmData, {
                style: zipModalCopperUpgradeMapStyle,
                filter: zipModalCopperUpgradeMapFilter,
            }).addTo(zipModalCopperUpgradeMapLayerGroup);
            zipModalCopperUpgradeMap.fitBounds(VpgmModalLayerTest.getBounds());

            zipModalCopperUpgradeMap.on('popupopen', function (e) {
                $('.ZipModalDetailLink').click(function (e) {
                    const psaData = {
                        ZIP_CO_PSA: this.dataset['psa'],
                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                        FIBER_AVAILABLE: this.dataset['fiberavailable'],
                        FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                        FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                        COPPER_UPGRADE: this.dataset['copperupgrade']
                    }
                    ponderApp.exitFullScreen();
                    selectedPSAGetExport(psaData);
                });
            });

            async function selectedPSAGetExport(psaData) {
                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                PSAZipShowAddressesFromMapClick(SelectedPSA, ZipstoreData, psaData);
            }
            
            // begin first table
            table.DataTable({
                data: copperUpgradeData,
                paging: true,
                lengthChange: false,
                pageLength: 5,
                //scrollY: '200px',
                scrollCollapse: true,
                scrollX: true,
                //sort: false,
                dom: 'Brtlifp',
                buttons: [
                    {
                        extend: 'csv',
                        className: 'btn btn-primary export-addresses-to-csv-1'
                    },
                    {
                        text: 'Export Table',
                        className: 'btn btn-primary export-addresses', titleAttr: 'Export Table To Excel', title: 'Export Table',
                        action: async function (e, dt, node, config) {
                            // return if limited users able to access the "Export To Excel" button
                            if (Access != "Unlimited") {
                                return;
                            }
                            $(".export-addresses").attr("disabled", "disabled");
                            $(".export-addresses-spinner").show();
                            //$('.buttons-csv.export-addresses-to-csv-1').click();
                            const fileName = "PONDER_" + getExportDate() + "_Zip_" + ZipVariable + ".csv";
                            exportAsCSV("#zipModalCopperUpgrade_datatable", fileName);
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                    eventType: "ZIP_PSA_LIST_EXPORT",
                                    logData: ZipVariable
                                };
                                await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                                setTimeout(() => {
                                    $(".export-addresses-spinner").hide();
                                    $(".export-addresses").removeAttr("disabled");
                                }, 2000);
                            }
                        },
                        {
                            className: 'export-addresses-spinner',
                            text: '<img src="../ajax-loader_2.gif" />',
                        },
                    ],
                    columnDefs: [
                        //{ className: 'text-left', targets: [1, 2, 3, 4] },
                        //{ className: 'text-center', targets: [0, 5, 6, 7, 8, 9] },
                        { className: "text-center", targets: [3] },
                        { width: 100, targets: [3] },
                        { className: "dt-center", targets: '_all' },
                        { orderable: false, targets: '_all' },
                    ],
                    columns: [
                        { 'data': 'ZIP_CO_PSA' },
                        {
                            'defaultContent': "<button class='btn btn-primary btn-xsm export-zip-fiber-addresses-row'>Map</button>",
                            'className': "text-center",
                        },
                        { 'data': 'SIMPLE_COVERAGE_SCORE' },
                        { 'data': 'MDU_DENSITY_TEXT' },
                        { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'FIBER_PENETRATION' },
                        { 'data': 'COPPER_UPGRADE' },
                        { 'data': 'MARKET_RANK', visible: false },
                        { 'data': 'LATITUDE', visible: false },
                        { 'data': 'LONGITUDE', visible: false },
                        { 'data': 'DATA_DATE', visible: false }
                    ],
                    order: [],

                    initComplete: function () {
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        // hide "Export To Excel" button for limited users
                        if (Access != "Unlimited") {
                            $(".export-addresses").hide();
                        }
                        $(".export-addresses-to-csv-1").hide();
                        $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-addresses-spinner").hide();
                    },

                });

            $('#zipModalCopperUpgrade_datatable tbody').off().on('click', 'button', function () {
                const tr = $(this).closest('tr');
                const clickedRowPSAValue = $(tr).find('td').eq(0)[0].innerHTML;

                document.getElementById('<%= hf_PSALocation.ClientID %>').value = clickedRowPSAValue;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();

                const psaData = {
                    ZIP_CO_PSA: $(tr).find('td').eq(0)[0].innerHTML,
                    WIRELESS_SCORE_TEXT: $(tr).find('td').eq(2)[0].innerHTML,
                    FIBER_AVAILABLE: $(tr).find('td').eq(4)[0].innerHTML,
                    FIBER_CUSTOMERS: $(tr).find('td').eq(5)[0].innerHTML + " (" + $(tr).find('td').eq(7)[0].innerHTML + ")",
                    FIBER_OPPORTUNITY: $(tr).find('td').eq(6)[0].innerHTML,
                    COPPER_UPGRADE: $(tr).find('td').eq(8)[0].innerHTML
                }
                ponderApp.exitFullScreen();
                PSAZipShowAddressesFromMapClick(clickedRowPSAValue, ZipstoreData, psaData);
                return false;
            });

            $('#zipModalCopperUpgrade_datatable').off().on('draw.dt', function () {
                console.log('***pagination event trigger');

                //re add row click event listener for pagination - copy and paste of main event listener
                $('#zipModalCopperUpgrade_datatable tr').off().on('click', function () {
                    zipModalCopperUpgradeMap.closePopup();
                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#zipModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#zipModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    if (latitudeClicked == "0" || longitudeClicked == "0") {
                        return;
                    }
                    var loc = [latitudeClicked, longitudeClicked];

                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    let pane = zipModalCopperUpgradeMap.getPane("marker title");
                    if (!pane) {
                        pane = zipModalCopperUpgradeMap.createPane("marker title");
                        pane.style.zIndex = 800;
                    }

                    if (zipCopperUpgradeMapLayerGroup) {
                        zipCopperUpgradeMapLayerGroup.removeFrom(zipModalCopperUpgradeMap);
                    }

                    zipCopperUpgradeMapLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                    zipCopperUpgradeMapLayerGroup.addLayer(marker);
                    zipCopperUpgradeMapLayerGroup.addTo(zipModalCopperUpgradeMap);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                        bounds = new L.LatLngBounds(southWest, northEast);
                    zipModalCopperUpgradeMap.fitBounds(bounds, { padding: [.00, .00] });
                    zipModalCopperUpgradeMap.setZoom(zipModalCopperUpgradeMap.getZoom() - 5);
                    setTimeout(function () {
                        zipCopperUpgradeMapLayerGroup.removeFrom(zipModalCopperUpgradeMap);
                    }, 2000);
                });

                //re add hover event listener for pagination - copy and paste of main event listener
                $('#zipModalCopperUpgrade_datatable tr').hover(function () {
                    console.log('paginiation hover');
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );

            });
            async function selectedFiberGetExport(value) {
                document.getElementById('<%= hf_PSALocation.ClientID %>').value = value;
                const myParamsObject = {
                    type: "ExportToExcel_PSALocations",
                    psaLocationValue: document.getElementById('<%= hf_PSALocation.ClientID %>').value,
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
            }

            function selectedFiberShowAddresses(PSAValue) {
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    PSAShowAddressesFromTableClick(PSAValue)
                }

            async function PSAShowAddressesFromTableClick(PSAValue) {
                var PSAVariable = PSAValue;
                $('#commonDiv').hide();
                $('#limitedUserDiv').hide();
                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();
                document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipVariable + ' - ' + 'ZIP CO PSA: ' + PSAValue;
                const myParamsObject = {
                    type: "showData_PSAAddressesFromTable",
                    'PSAVariable': PSAVariable
                };
                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                unitNumbersData = JSON.parse(data.d);
                ponderApp.showLimitedUserData(unitNumbersData);
            }

            $('#zipModalCopperUpgrade_datatable tr').off().on('click', function () {
                zipModalCopperUpgradeMap.closePopup();
                var row_clicked = $(this).closest('tr');
                var latitudeClicked = $('#zipModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                var longitudeClicked = $('#zipModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                if (latitudeClicked == "0" || longitudeClicked == "0") {
                    return;
                }
                var loc = [latitudeClicked, longitudeClicked];

                markerOptions = {
                    iconShape: 'doughnut',
                    iconSize: [20, 20],
                    borderWidth: 3,
                    borderColor: '#ff0000'
                };

                let pane = zipModalCopperUpgradeMap.getPane("marker title");
                if (!pane) {
                    pane = zipModalCopperUpgradeMap.createPane("marker title");
                    pane.style.zIndex = 800;
                }

                if (zipCopperUpgradeMapLayerGroup) {
                    zipCopperUpgradeMapLayerGroup.removeFrom(zipModalCopperUpgradeMap);
                }

                zipCopperUpgradeMapLayerGroup = L.layerGroup();
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                zipCopperUpgradeMapLayerGroup.addLayer(marker);
                zipCopperUpgradeMapLayerGroup.addTo(zipModalCopperUpgradeMap);

                var NE_lat = Number(latitudeClicked);
                var NE_lng = Number(longitudeClicked);
                var add1 = .0001
                var NE_lat_1 = NE_lat + add1;
                var NE_lng_1 = NE_lng + add1;

                var SW_lat = Number(latitudeClicked);
                var SW_lng = Number(longitudeClicked);
                var add1 = .0001
                var SW_lat_1 = SW_lat - add1;
                var SW_lng_1 = SW_lng - add1;

                var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                    northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                    bounds = new L.LatLngBounds(southWest, northEast);
                zipModalCopperUpgradeMap.fitBounds(bounds, { padding: [.00, .00] });
                zipModalCopperUpgradeMap.setZoom(zipModalCopperUpgradeMap.getZoom() - 5);
                setTimeout(function () {
                    zipCopperUpgradeMapLayerGroup.removeFrom(zipModalCopperUpgradeMap);
                }, 2000);
            });

            $('#zipModalCopperUpgrade_datatable tr').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );

            zipModalCopperUpgradeMap.invalidateSize();
        }

        const CountyModalCopperUpgradeTab = async (copperUpgradeData, CountystoreData, VpgmData2, MarketBoundaryData, CountyVariable) => {
            if (countyModalCopperUpgradeMap !== undefined && countyModalCopperUpgradeMap !== null) {
                countyModalCopperUpgradeMap.remove(); // should remove the map from UI and clean the inner children of DOM element
                console.log('countyModalCopperUpgradeMap*********' + countyModalCopperUpgradeMap); // nothing should actually happen to the value of countyModalCopperUpgradeMap
            }
            $('#countyModalCopperUpgrade_datatable').dataTable().fnDestroy(); //destroy old table
            var table = $('#countyModalCopperUpgrade_datatable');
            document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value = CountyVariable;
            var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                id: 'osm.topo',
                maxZoom: 17,
                zIndex: 1,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                });

            var baseLayers = {
                "Streets": streets,
                "Satellite": sat
            };
            currentZoom = 4;
            currentCenter = [39.73, -104.99];
            countyModalCopperUpgradeMap = L.map("countyModalCopperUpgradeMap", {
                attributionControl: false,
                preferCanvas: true,
                center: currentCenter,
                zoom: currentZoom,
                minZoom: 3,
                layers: [streets],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            countyModalCopperUpgradeMap.on('zoomend', function (e) {
                currentZoom = countyModalCopperUpgradeMap.getZoom();
                currentBounds = countyModalCopperUpgradeMap.getBounds();
                currentCenter = countyModalCopperUpgradeMap.getCenter();
            });

            countyModalCopperUpgradeMap.on('overlayremove', function () {
                //close open popup
                countyModalCopperUpgradeMap.closePopup();
                // reset data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(countyModalCopperUpgradeMap);
            });

            countyModalCopperUpgradeMap.on('overlayadd', function () {
                // rebuild data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(countyModalCopperUpgradeMap);
            });

            const storeOverlays = await createStoreLayers(countyModalCopperUpgradeMap, CountystoreData);
            for (const [key, value] of Object.entries(storeOverlays)) {
                //console.log(`${key}: ${value}`);
                countyModalCopperUpgradeMap.addLayer(value);
            }
            const copperUpgradeOverlays = await createCopperUpgradeLayers(countyModalCopperUpgradeMap, copperUpgradeData);
            var overlays = {};
            var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(countyModalCopperUpgradeMap);
            overlays = Object.assign(storeOverlays, copperUpgradeOverlays);
            overlaysNames = Object.keys(overlays);
            overlaysNames.sort(sorter);
            overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));
            ponderApp.rebuildMapOverlaysData(countyModalCopperUpgradeMap);
            ponderApp.updateOverlaysLabel({ psaLocationsIconType: 'big' });

            countyModalCopperUpgradeMap.on('dragend', function () {
                currentCenter = countyModalCopperUpgradeMap.getCenter();
            });

            countyModalCopperUpgradeMap.on('click', async function (e) {
                const closestLocation = ponderApp.closest(countyModalCopperUpgradeMap.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                if (closestLocation && closestLocation.p.minZoomVisibility <= countyModalCopperUpgradeMap.getZoom() 
                                && countyModalCopperUpgradeMap.getZoom() <= closestLocation.p.maxZoomVisibility) {
                    const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                    ponderApp.markerTypes[closestLocation.p.markerType].clicked(countyModalCopperUpgradeMap, closestLocation, market, null);
                }
            });
            //set bounds
            //let allCopperUpgradePoints = new L.featureGroup();
            //for (i in copperUpgradeData) {
            //    const loc = [copperUpgradeData[i].LATITUDE, copperUpgradeData[i].LONGITUDE];
            //    marker = new L.Marker(new L.latLng(loc));
            //    allCopperUpgradePoints.addLayer(marker);
            //}
            //const bounds = allCopperUpgradePoints.getBounds();
            //countyModalCopperUpgradeMap.fitBounds(bounds);
            function styleBoundary(feature) {
                return {
                    //fillColor: "#FCB81E",
                    fillOpacity: 0.01,
                    //color: "#ff7800",
                    weight: 3,
                    opacity: 0.5,
                    //fill: false
                };
            }
            var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                style: styleBoundary,
                zIndex: 5,
                //onEachFeature: onEachFeatureBoundary
            }).addTo(countyModalCopperUpgradeMap);

            //function onEachFeatureCounty(feature, featureLayer) {
            //    //featureLayer.bindPopup(feature.properties.ZIP);                    
            //}

            var CountyModalLayerGroup = L.layerGroup().addTo(countyModalCopperUpgradeMap);

            var myCountyModalStyle = {
                weight: 5,
                color: '#000000',
                opacity: 0.5,
                fillOpacity: 0.05
            };

            CountyModalLayerTest = L.geoJSON(VpgmData2, {
                style: myCountyModalStyle,
                filter: CountyModalFilter,
                //onEachFeature: onEachFeatureCounty
            }).addTo(CountyModalLayerGroup);

            function CountyModalFilter(feature) {
                if (feature.properties.Cnty_FIPS == CountyVariable) return true;
            }

            countyModalCopperUpgradeMap.fitBounds(CountyModalLayerTest.getBounds());

            countyModalCopperUpgradeMap.on('popupopen', function (e) {
                $('.ZipModalDetailLink').click(function (e) {
                    const psaData = {
                        ZIP_CO_PSA: this.dataset['psa'],
                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                        FIBER_AVAILABLE: this.dataset['fiberavailable'],
                        FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                        FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                        COPPER_UPGRADE: this.dataset['copperupgrade']
                    }
                    ponderApp.exitFullScreen();
                    selectedPSAGetExport(psaData);
                });
            });

            async function selectedPSAGetExport(psaData) {
                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                PSAZipShowAddressesFromMapClick(SelectedPSA, CountystoreData, psaData);
            }

            // begin first table
            table.DataTable({
                data: copperUpgradeData,
                paging: true,
                lengthChange: false,
                pageLength: 5,
                //scrollY: '200px',
                scrollCollapse: true,
                scrollX: true,
                //sort: false,
                dom: 'Brtlifp',
                buttons: [
                    {
                        extend: 'csv',
                        className: 'btn btn-primary export-addresses-to-csv-2'
                    },
                    {
                        text: 'Export Table',
                        className: 'btn btn-primary export-addresses', titleAttr: 'Export Table To Excel', title: 'Export To Excel',
                        action: async function (e, dt, node, config) {
                            // return if limited users able to access the "Export To Excel" button
                            if (Access != "Unlimited") {
                                return;
                            }
                            $(".export-addresses").attr("disabled", "disabled");
                            $(".export-addresses-spinner").show();
                            //$('.buttons-csv.export-addresses-to-csv-2').click();
                            const fileName = "PONDER_" + getExportDate() + "_County_" + CountyVariable + ".csv";
                            exportAsCSV("#countyModalCopperUpgrade_datatable", fileName);
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                    eventType: "COUNTY_PSA_LIST_EXPORT",
                                    logData: CountyVariable
                                };
                                await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                                setTimeout(() => {
                                    $(".export-addresses-spinner").hide();
                                    $(".export-addresses").removeAttr("disabled");
                                }, 2000);
                            }
                        },
                        {
                            className: 'export-addresses-spinner',
                            text: '<img src="../ajax-loader_2.gif" />',
                        },
                    ],
                    columnDefs: [
                        //{ className: 'text-left', targets: [1, 2, 3, 4] },
                        //{ className: 'text-center', targets: [0, 5, 6, 7, 8, 9] },
                        { className: "text-center", targets: [3] },
                        { width: 100, targets: [3] },
                        { className: "dt-center", targets: '_all' },
                        { orderable: false, targets: '_all' },
                    ],
                    columns: [
                        { 'data': 'ZIP_CO_PSA' },
                        {
                            'defaultContent': "<button class='btn btn-primary btn-xsm export-county-fiber-addresses-row'>Map</button>",
                            'className': "text-center",
                        },
                        { 'data': 'SIMPLE_COVERAGE_SCORE' },
                        { 'data': 'MDU_DENSITY_TEXT' },
                        { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'FIBER_PENETRATION' },
                        { 'data': 'COPPER_UPGRADE' },
                        { 'data': 'MARKET_RANK', visible: false },
                        { 'data': 'LATITUDE', visible: false },
                        { 'data': 'LONGITUDE', visible: false },
                        { 'data': 'DATA_DATE', visible: false }
                    ],
                    order: [],

                    initComplete: function () {
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        // hide "Export To Excel" button for limited users
                        if (Access != "Unlimited") {
                            $(".export-addresses").hide();
                        }
                        $(".export-addresses-to-csv-2").hide();
                        $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-addresses-spinner").hide();
                    },

                });

            $('#countyModalCopperUpgrade_datatable tbody').off().on('click', 'button', function () {
                const tr = $(this).closest('tr');
                const clickedRowPSAValue = $(tr).find('td').eq(0)[0].innerHTML;

                document.getElementById('<%= hf_PSALocation.ClientID %>').value = clickedRowPSAValue;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();

                const psaData = {
                    ZIP_CO_PSA: $(tr).find('td').eq(0)[0].innerHTML,
                    WIRELESS_SCORE_TEXT: $(tr).find('td').eq(2)[0].innerHTML,
                    FIBER_AVAILABLE: $(tr).find('td').eq(4)[0].innerHTML,
                    FIBER_CUSTOMERS: $(tr).find('td').eq(5)[0].innerHTML + " (" + $(tr).find('td').eq(7)[0].innerHTML + ")",
                    FIBER_OPPORTUNITY: $(tr).find('td').eq(6)[0].innerHTML,
                    COPPER_UPGRADE: $(tr).find('td').eq(8)[0].innerHTML
                }
                ponderApp.exitFullScreen();
                PSAZipShowAddressesFromMapClick(clickedRowPSAValue, CountystoreData, psaData);
                return false;
            });

            $('#countyModalCopperUpgrade_datatable').off().on('draw.dt', function () {
                console.log('***pagination event trigger');

                //re add row click event listener for pagination - copy and paste of main event listener
                $('#countyModalCopperUpgrade_datatable tr').off().on('click', function () {
                    countyModalCopperUpgradeMap.closePopup();
                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#countyModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#countyModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    if (latitudeClicked == "0" || longitudeClicked == "0") {
                        return;
                    }
                    var loc = [latitudeClicked, longitudeClicked];

                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    let pane = countyModalCopperUpgradeMap.getPane("marker title");
                    if (!pane) {
                        pane = countyModalCopperUpgradeMap.createPane("marker title");
                        pane.style.zIndex = 800;
                    }

                    if (countyCopperUpgradeMapLayerGroup) {
                        countyCopperUpgradeMapLayerGroup.removeFrom(countyModalCopperUpgradeMap);
                    }

                    countyCopperUpgradeMapLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                    countyCopperUpgradeMapLayerGroup.addLayer(marker);
                    countyCopperUpgradeMapLayerGroup.addTo(countyModalCopperUpgradeMap);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                        bounds = new L.LatLngBounds(southWest, northEast);
                    countyModalCopperUpgradeMap.fitBounds(bounds, { padding: [.00, .00] });
                    countyModalCopperUpgradeMap.setZoom(countyModalCopperUpgradeMap.getZoom() - 5);
                    setTimeout(function () {
                        countyCopperUpgradeMapLayerGroup.removeFrom(countyModalCopperUpgradeMap);
                    }, 2000);
                });

                $('#countyModalCopperUpgrade_datatable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );
            });


            async function selectedFiberGetExport(value) {
                document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value = value;
                    const myParamsObject = {
                        type: "ExportToExcel_PSALocations_County",
                        psaLocationValue: document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value,
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
            }

                function selectedFiberShowAddresses(PSAValue) {
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                PSACountyShowAddressesFromTableClick(PSAValue)
            }

            async function PSACountyShowAddressesFromTableClick(PSAValue) {
                var PSAVariable = PSAValue;
                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();
                document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyVariable + ' - ' + 'ZIP CO PSA: ' + PSAVariable;
                const myParamsObject = {
                    type: "showData_PSAAddressesCountyFromTable",
                    'PSAVariable': PSAVariable
                };
                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                unitNumbersData = JSON.parse(data.d);
                ponderApp.showLimitedUserData(unitNumbersData);
            }

            $('#countyModalCopperUpgrade_datatable tr').off().on('click', function () {
                countyModalCopperUpgradeMap.closePopup();
                var row_clicked = $(this).closest('tr');
                var latitudeClicked = $('#countyModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                var longitudeClicked = $('#countyModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                if (latitudeClicked == "0" || longitudeClicked == "0") {
                    return;
                }
                var loc = [latitudeClicked, longitudeClicked];

                markerOptions = {
                    iconShape: 'doughnut',
                    iconSize: [20, 20],
                    borderWidth: 3,
                    borderColor: '#ff0000'
                };

                let pane = countyModalCopperUpgradeMap.getPane("marker title");
                if (!pane) {
                    pane = countyModalCopperUpgradeMap.createPane("marker title");
                    pane.style.zIndex = 800;
                }

                if (countyCopperUpgradeMapLayerGroup) {
                    countyCopperUpgradeMapLayerGroup.removeFrom(countyModalCopperUpgradeMap);
                }

                countyCopperUpgradeMapLayerGroup = L.layerGroup();
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                countyCopperUpgradeMapLayerGroup.addLayer(marker);
                countyCopperUpgradeMapLayerGroup.addTo(countyModalCopperUpgradeMap);

                var NE_lat = Number(latitudeClicked);
                var NE_lng = Number(longitudeClicked);
                var add1 = .0001
                var NE_lat_1 = NE_lat + add1;
                var NE_lng_1 = NE_lng + add1;

                var SW_lat = Number(latitudeClicked);
                var SW_lng = Number(longitudeClicked);
                var add1 = .0001
                var SW_lat_1 = SW_lat - add1;
                var SW_lng_1 = SW_lng - add1;

                var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                    northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                    bounds = new L.LatLngBounds(southWest, northEast);
                countyModalCopperUpgradeMap.fitBounds(bounds, { padding: [.00, .00] });
                countyModalCopperUpgradeMap.setZoom(countyModalCopperUpgradeMap.getZoom() - 5);
                setTimeout(function () {
                    countyCopperUpgradeMapLayerGroup.removeFrom(countyModalCopperUpgradeMap);
                }, 2000);
            });

            $('#countyModalCopperUpgrade_datatable tr').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            countyModalCopperUpgradeMap.invalidateSize();
        }

        const CMAModalCopperUpgradeTab = async (copperUpgradeData, CMAstoreData, VpgmData3, MarketBoundaryData, CMAVariable) => {
            if (CMAModalCopperUpgradeMap !== undefined && CMAModalCopperUpgradeMap !== null) {
                CMAModalCopperUpgradeMap.remove(); // should remove the map from UI and clean the inner children of DOM element
                console.log('CMAModalCopperUpgradeMap*********' + CMAModalCopperUpgradeMap); // nothing should actually happen to the value of CMAModalCopperUpgradeMap
            }
            $('#CMAModalCopperUpgrade_datatable').dataTable().fnDestroy(); //destroy old table
            var table = $('#CMAModalCopperUpgrade_datatable');
            document.getElementById('<%= hf_PSALocationCMA.ClientID %>').value = CMAVariable;
            var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                id: 'osm.topo',
                maxZoom: 17,
                zIndex: 1,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                });

            var baseLayers = {
                "Streets": streets,
                "Satellite": sat
            };
            currentZoom = 4;
            currentCenter = [39.73, -104.99];
            CMAModalCopperUpgradeMap = L.map("CMAModalCopperUpgradeMap", {
                attributionControl: false,
                preferCanvas: true,
                center: currentCenter,
                zoom: currentZoom,
                minZoom: 3,
                layers: [streets],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            CMAModalCopperUpgradeMap.on('zoomend', function (e) {
                currentZoom = CMAModalCopperUpgradeMap.getZoom();
                currentBounds = CMAModalCopperUpgradeMap.getBounds();
                currentCenter = CMAModalCopperUpgradeMap.getCenter();
            });

            CMAModalCopperUpgradeMap.on('overlayremove', function () {
                //close open popup
                CMAModalCopperUpgradeMap.closePopup();
                // reset data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(CMAModalCopperUpgradeMap);
            });

            CMAModalCopperUpgradeMap.on('overlayadd', function () {
                // rebuild data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(CMAModalCopperUpgradeMap);
            });

            const storeOverlays = await createStoreLayers(CMAModalCopperUpgradeMap, CMAstoreData);
            for (const [key, value] of Object.entries(storeOverlays)) {
                //console.log(`${key}: ${value}`);
                CMAModalCopperUpgradeMap.addLayer(value);
            }
            const copperUpgradeOverlays = await createCopperUpgradeLayers(CMAModalCopperUpgradeMap, copperUpgradeData);
            var overlays = {};
            var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(CMAModalCopperUpgradeMap);
            overlays = Object.assign(storeOverlays, copperUpgradeOverlays);
            overlaysNames = Object.keys(overlays);
            overlaysNames.sort(sorter);
            overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));
            ponderApp.rebuildMapOverlaysData(CMAModalCopperUpgradeMap);
            ponderApp.updateOverlaysLabel({ psaLocationsIconType: 'big' });

            CMAModalCopperUpgradeMap.on('dragend', function () {
                currentCenter = CMAModalCopperUpgradeMap.getCenter();
            });

            CMAModalCopperUpgradeMap.on('click', async function (e) {
                const closestLocation = ponderApp.closest(CMAModalCopperUpgradeMap.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                if (closestLocation  && closestLocation.p.minZoomVisibility <= CMAModalCopperUpgradeMap.getZoom() 
                                && CMAModalCopperUpgradeMap.getZoom() <= closestLocation.p.maxZoomVisibility) {
                    const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                    ponderApp.markerTypes[closestLocation.p.markerType].clicked(CMAModalCopperUpgradeMap, closestLocation, market, null);
                }
            });
            //set bounds
            //let allCopperUpgradePoints = new L.featureGroup();
            //for (i in copperUpgradeData) {
            //    const loc = [copperUpgradeData[i].LATITUDE, copperUpgradeData[i].LONGITUDE];
            //    marker = new L.Marker(new L.latLng(loc));
            //    allCopperUpgradePoints.addLayer(marker);
            //}
            //const bounds = allCopperUpgradePoints.getBounds();
            //CMAModalCopperUpgradeMap.fitBounds(bounds);
            function styleBoundary(feature) {
                return {
                    //fillColor: "#FCB81E",
                    fillOpacity: 0.01,
                    //color: "#ff7800",
                    weight: 3,
                    opacity: 0.5,
                    //fill: false
                };
            }

            var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                style: styleBoundary,
                zIndex: 5
            }).addTo(CMAModalCopperUpgradeMap);

            var CMAModalLayerGroup = L.layerGroup().addTo(CMAModalCopperUpgradeMap);

            var myCMAModalStyle = {
                weight: 5,
                color: '#000000',
                opacity: 0.5,
                fillOpacity: 0.05
            };

            CMAModalLayerTest = L.geoJSON(VpgmData3, {
                style: myCMAModalStyle,
                filter: CMAModalFilter
            }).addTo(CMAModalLayerGroup);

            function CMAModalFilter(feature) {
                if (feature.properties.cma == CMAVariable) return true
            }

            CMAModalCopperUpgradeMap.fitBounds(CMAModalLayerTest.getBounds());

            CMAModalCopperUpgradeMap.on('popupopen', function (e) {
                $('.ZipModalDetailLink').click(function (e) {
                    const psaData = {
                        ZIP_CO_PSA: this.dataset['psa'],
                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                        FIBER_AVAILABLE: this.dataset['fiberavailable'],
                        FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                        FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                        COPPER_UPGRADE: this.dataset['copperupgrade']
                    }
                    ponderApp.exitFullScreen();
                    selectedPSAGetExport(psaData);
                });
            });

            async function selectedPSAGetExport(psaData) {
                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();
                PSAZipShowAddressesFromMapClick(SelectedPSA, CMAstoreData, psaData);
            }

            // begin first table
            table.DataTable({
                data: copperUpgradeData,
                paging: true,
                lengthChange: false,
                pageLength: 5,
                //scrollY: '200px',
                scrollCollapse: true,
                scrollX: true,
                // sort: false,
                dom: 'Brtlifp',
                buttons: [
                    {
                        extend: 'csv',
                        className: 'btn btn-primary export-addresses-to-csv-3'
                    },
                    {
                        text: 'Export Table',
                        className: 'btn btn-primary export-addresses', titleAttr: 'Export Table To Excel', title: 'Export To Excel',
                        action: async function (e, dt, node, config) {
                            // return if limited users able to access the "Export To Excel" button
                            if (Access != "Unlimited") {
                                return;
                            }
                            $(".export-addresses").attr("disabled", "disabled");
                            $(".export-addresses-spinner").show();
                            const fileName = "PONDER_" + getExportDate() + "_CMA_" + CMAVariable + ".csv";
                            exportAsCSV("#CMAModalCopperUpgrade_datatable", fileName);
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                    eventType: "CMA_PSA_LIST_EXPORT",
                                    logData: CMAVariable
                                };
                                await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                                setTimeout(() => {
                                    $(".export-addresses-spinner").hide();
                                    $(".export-addresses").removeAttr("disabled");
                                }, 2000);
                            }
                        },
                        {
                            className: 'export-addresses-spinner',
                            text: '<img src="../ajax-loader_2.gif" />',
                        },
                    ],
                    columnDefs: [
                        //{ className: 'text-left', targets: [1, 2, 3, 4] },
                        //{ className: 'text-center', targets: [0, 5, 6, 7, 8, 9] },
                        { className: "text-center", targets: [3] },
                        { width: 100, targets: [3] },
                        { className: "dt-center", targets: '_all' },

                        { orderable: false, targets: '_all' },
                    ],
                    columns: [
                        { 'data': 'ZIP_CO_PSA' },
                        {
                            'defaultContent': "<button class='btn btn-primary btn-xsm export-cma-fiber-addresses-row'>Map</button>",
                            'className': "text-center",
                        },
                        { 'data': 'SIMPLE_COVERAGE_SCORE' },
                        { 'data': 'MDU_DENSITY_TEXT' },
                        { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'FIBER_PENETRATION' },
                        { 'data': 'COPPER_UPGRADE' },
                        { 'data': 'MARKET_RANK', visible: false },
                        { 'data': 'LATITUDE', visible: false },
                        { 'data': 'LONGITUDE', visible: false },
                        { 'data': 'DATA_DATE', visible: false }
                    ],
                    order: [],

                    initComplete: function () {
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        // hide "Export To Excel" button for limited users
                        if (Access != "Unlimited") {
                            $(".export-addresses").hide();
                        }
                        $(".export-addresses-to-csv-3").hide();
                        $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-addresses-spinner").hide();
                    },
                });

            $('#CMAModalCopperUpgrade_datatable tbody').off().on('click', 'button', function () {

                const tr = $(this).closest('tr');
                const clickedRowPSAValue = $(tr).find('td').eq(0)[0].innerHTML;

                document.getElementById('<%= hf_PSALocation.ClientID %>').value = clickedRowPSAValue;
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                clickButton.click();

                const psaData = {
                    ZIP_CO_PSA: $(tr).find('td').eq(0)[0].innerHTML,
                    WIRELESS_SCORE_TEXT: $(tr).find('td').eq(2)[0].innerHTML,
                    FIBER_AVAILABLE: $(tr).find('td').eq(4)[0].innerHTML,
                    FIBER_CUSTOMERS: $(tr).find('td').eq(5)[0].innerHTML + " (" + $(tr).find('td').eq(7)[0].innerHTML + ")",
                    FIBER_OPPORTUNITY: $(tr).find('td').eq(6)[0].innerHTML,
                    COPPER_UPGRADE: $(tr).find('td').eq(8)[0].innerHTML
                }
                
                ponderApp.exitFullScreen();
                PSAZipShowAddressesFromMapClick(clickedRowPSAValue, CMAstoreData, psaData);
                return false;
            });

            $('#CMAModalCopperUpgrade_datatable').off().on('draw.dt', function () {
                console.log('***pagination event trigger');

                //re add row click event listener for pagination - copy and paste of main event listener
                $('#CMAModalCopperUpgrade_datatable tr').off().on('click', function () {
                    CMAModalCopperUpgradeMap.closePopup();
                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CMAModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CMAModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    if (latitudeClicked == "0" || longitudeClicked == "0") {
                        return;
                    }
                    var loc = [latitudeClicked, longitudeClicked];

                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    let pane = CMAModalCopperUpgradeMap.getPane("marker title");
                    if (!pane) {
                        pane = CMAModalCopperUpgradeMap.createPane("marker title");
                        pane.style.zIndex = 800;
                    }

                    if (CMACopperUpgradeMapLayerGroup) {
                        CMACopperUpgradeMapLayerGroup.removeFrom(CMAModalCopperUpgradeMap);
                    }

                    CMACopperUpgradeMapLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                    CMACopperUpgradeMapLayerGroup.addLayer(marker);
                    CMACopperUpgradeMapLayerGroup.addTo(CMAModalCopperUpgradeMap);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                        bounds = new L.LatLngBounds(southWest, northEast);
                    CMAModalCopperUpgradeMap.fitBounds(bounds, { padding: [.00, .00] });
                    CMAModalCopperUpgradeMap.setZoom(CMAModalCopperUpgradeMap.getZoom() - 5);
                    setTimeout(function () {
                        CMACopperUpgradeMapLayerGroup.removeFrom(CMAModalCopperUpgradeMap);
                    }, 2000);
                });

                $('#CMAModalCopperUpgrade_datatable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );

               
            });

            async function selectedFiberGetExport(value) {
                document.getElementById('<%= hf_PSALocationCMA.ClientID %>').value = value;
                const myParamsObject = {
                    type: "ExportToExcel_PSALocations_CMA",
                    psaLocationValue: document.getElementById('<%= hf_PSALocationCMA.ClientID %>').value,
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
            }

            function selectedFiberShowAddresses(PSAValue) {
                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
               clickButton.click();
               PSACMAShowAddressesFromTableClick(PSAValue)
           }

            async function PSACMAShowAddressesFromTableClick(PSAValue) {
                var PSAVariable = PSAValue;
                $('#commonDiv').hide();
                $('#limitedUserDiv').hide();
                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();
                document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAVariable + ' - ' + 'ZIP CO PSA: ' + PSAVariable;
                const myParamsObject = {
                    type: "showData_PSAAddressesCMAFromTable",
                    'PSAVariable': PSAVariable
                };
                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                unitNumbersData = JSON.parse(data.d);
                ponderApp.showLimitedUserData(unitNumbersData);
            }

            $('#CMAModalCopperUpgrade_datatable tr').off().on('click', function () {
                CMAModalCopperUpgradeMap.closePopup();
                var row_clicked = $(this).closest('tr');
                var latitudeClicked = $('#CMAModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                var longitudeClicked = $('#CMAModalCopperUpgrade_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                if (latitudeClicked == "0" || longitudeClicked == "0") {
                    return;
                }
                var loc = [latitudeClicked, longitudeClicked];

                markerOptions = {
                    iconShape: 'doughnut',
                    iconSize: [20, 20],
                    borderWidth: 3,
                    borderColor: '#ff0000'
                };

                let pane = CMAModalCopperUpgradeMap.getPane("marker title");
                if (!pane) {
                    pane = CMAModalCopperUpgradeMap.createPane("marker title");
                    pane.style.zIndex = 800;
                }

                if (CMACopperUpgradeMapLayerGroup) {
                    CMACopperUpgradeMapLayerGroup.removeFrom(CMAModalCopperUpgradeMap);
                }

                CMACopperUpgradeMapLayerGroup = L.layerGroup();
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                CMACopperUpgradeMapLayerGroup.addLayer(marker);
                CMACopperUpgradeMapLayerGroup.addTo(CMAModalCopperUpgradeMap);

                var NE_lat = Number(latitudeClicked);
                var NE_lng = Number(longitudeClicked);
                var add1 = .0001
                var NE_lat_1 = NE_lat + add1;
                var NE_lng_1 = NE_lng + add1;

                var SW_lat = Number(latitudeClicked);
                var SW_lng = Number(longitudeClicked);
                var add1 = .0001
                var SW_lat_1 = SW_lat - add1;
                var SW_lng_1 = SW_lng - add1;

                var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                    northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                    bounds = new L.LatLngBounds(southWest, northEast);
                CMAModalCopperUpgradeMap.fitBounds(bounds, { padding: [.00, .00] });
                CMAModalCopperUpgradeMap.setZoom(CMAModalCopperUpgradeMap.getZoom() - 5);
                setTimeout(function () {
                    CMACopperUpgradeMapLayerGroup.removeFrom(CMAModalCopperUpgradeMap);
                }, 2000);
            });

            $('#CMAModalCopperUpgrade_datatable tr').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            CMAModalCopperUpgradeMap.invalidateSize();
        }

        const AddRemoveOptionsFromSortByDropdown = () => {
            if ($('#<%= ddlHeatTheme.ClientID %> option:selected').val() == 'elderlyPercentage') {
                var myOptions = {
                    "Highest Elderly Percentage": 'Highest Elderly Percentage',
                    "Lowest Elderly Percentage": 'Lowest Elderly Percentage'
                };
                var _select = $('<select>');
                $.each(myOptions, function (val, text) {
                    _select.append(
                        $('<option></option>').val(val).html(text)
                    );
                });
                $('#ddlSortBy').append(_select.html());
            }
            else {
                $("#ddlSortBy option[value='Highest Elderly Percentage']").remove();
                $("#ddlSortBy option[value='Lowest Elderly Percentage']").remove();
            }
        }

        const heatThemeChange = () => {
            AddRemoveOptionsFromSortByDropdown();
            $('.oneButton').removeClass('active'); //clear button clicked borders
            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
            const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
           
            const score = ponderApp.getHeatMapSummary();
            console.log(score);
            //need to determine if we are grouped by CMA, County or Zip. Instead of using the multiple group by ddls, use the category from the score
            let selectedGroupBy; //this value must match the span names to update the button texts
            if (score[0]['CATEGORY'] === 'CMA_SUMMARY') {
                selectedGroupBy = 'CMA';
                document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " CMAs colored by " + $('#<%= ddlHeatTheme.ClientID %> option:selected').text();
                turnLayer0CMAOn(); // removes highlight from map, but still need to make buttons look unclicked
            }
            else if (score[0]['CATEGORY'] === 'COUNTY_SUMMARY') {
                selectedGroupBy = 'County';
                document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " Counties colored by " + $('#<%= ddlHeatTheme.ClientID %> option:selected').text();
                turnLayer0CountyOn();
            }
            else {
                selectedGroupBy = 'Zip';
                document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " Zips colored by " + $('#<%= ddlHeatTheme.ClientID %> option:selected').text();
                turnLayer0ZipOn();
            }
            //console.log('heatThemeChange: ' + heatTheme + ' grouped by ' + selectedGroupBy);
            //update button text spans, including summary stats from getHeatMapSummary, using selectedGroupBy within Id
            document.getElementById('span' + selectedGroupBy + 'ButtonText1').innerHTML = heatMapConfig.button1.buttonText;
            document.getElementById('span' + selectedGroupBy + 'ButtonText2').innerHTML = heatMapConfig.button2.buttonText;
            document.getElementById('span' + selectedGroupBy + 'ButtonText3').innerHTML = heatMapConfig.button3.buttonText;
            document.getElementById('span' + selectedGroupBy + 'ButtonText4').innerHTML = heatMapConfig.button4.buttonText;
            document.getElementById('span' + selectedGroupBy + 'Button1Summary1').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol1]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button1Summary2').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol2]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button2Summary1').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol1]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button2Summary2').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol2]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button3Summary1').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol1]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button3Summary2').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol2]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button4Summary1').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol1]).toLocaleString('en');
            document.getElementById('span' + selectedGroupBy + 'Button4Summary2').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol2]).toLocaleString('en');
            //update buttons to reflect colors of the new theme - currently set in style.bundle.css            
            //$('#btn' + selectedGroupBy + '1').css("background-color", heatMapConfig.button1.color);
            //$('#btn' + selectedGroupBy + '2').css("background-color", heatMapConfig.button2.color);
            //$('#btn' + selectedGroupBy + '3').css("background-color", heatMapConfig.button3.color);
            //$('#btn' + selectedGroupBy + '4').css("background-color", heatMapConfig.button4.color);
            //clear any previous filters or buttons
            //baseball card color (info1 info2) is dynamic in the info update functions from hover and table click, however the color values of info1 are hardcoded
            //text above table is dynamic to show what filters are applied - turnLayer1CMAOn , turnLayer2CMAOn etc
            //table itself needs to be dynamic to filter for top 50
            SortHomeTable();
        }

        function groupByFilter() {
            var groupGeo = 'SALES';
            var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            if (groupGeo == 'SALES') {
                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                } else {
                    marketType = 'MARKET';
                }
            }

            //console.log('groupByFilter / marketType: ' + marketType);

            if (marketType == 'MARKET') {
                console.log('***** MarketType MARKET *****');
                //$('#ShowHideRegionGroupBy').hide();
                //$('#ShowHideMarketGroupBy').show();                
                $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                $('#ddlGroupBy option[value="ZIP"]').prop('disabled', false)
            }
            else if (marketType == 'REGION') {
                console.log('***** MarketType REGION *****');
                //$('#ShowHideRegionGroupBy').show();
                //$('#ShowHideMarketGroupBy').hide();
                $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)
            }
            else { //National
                console.log('***** MarketType NATIONAL *****');
                //$('#ShowHideRegionGroupBy').hide();
                //$('#ShowHideMarketGroupBy').hide();
                $('#ddlGroupBy option[value="CMA"]').prop('disabled', true)
                $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', true)
                $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)
            }
            ponderApp.disableMarketDropdownOptions();
        }

        async function showDataZipUnitNumbers(addressData, storeData, psaData, psaEventData) {
            const myParamsObject = {
                userID: "<%=hf_User.Value%>",
                eventType: "PSA_ADDRESS_MAP",
                logData: psaData.ZIP_CO_PSA
            };
            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
            $('#limitedUserDiv').hide();
            $('#commonDiv').show();
            addressData = addressData.map(obj => ({ ...obj, CUSTOMER: obj.SERVICE_STATUS == "InService" ? "Customer" : (obj.SERVICE_STATUS == null && obj.BB_ALL == 1 && obj.BB_FIBR == 0 ? "Upgrade" : "Prospect") }))
            const filteredAddressDataForMap = addressData.filter(address => address.SHOW_MAP == "SHOW" && address.LATITUDE != 0 && address.LONGITUDE != 0);
            if (addressMap !== undefined && addressMap !== null) {
                addressMap.remove(); // should remove the map from UI and clean the inner children of DOM element
                console.log('addressMap*********' + addressMap); // nothing should actually happen to the value of addressMap
            }

            const footNoteCount = addressData.filter(address => address.LATITUDE == 0 || address.LONGITUDE == 0).length;
            //console.log(footNoteCount);
            if (footNoteCount > 0) {
                if (footNoteCount == 1) {
                    document.getElementById('footNote').innerHTML = 'NOTE: ' + footNoteCount + ' Living Unit is missing lat / long and cannot be mapped';
                }
                else {
                    document.getElementById('footNote').innerHTML = 'NOTE: ' + footNoteCount + ' Living Units are missing lat / long and cannot be mapped';
                }
            }
            else {
                document.getElementById('footNote').innerHTML = '';
            }


            const createStoreLayer = async (addressMap, title, lineColor, storeDataset) => {
                let pane = addressMap.getPane(title);
                if (!pane) {
                    pane = addressMap.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        markerShape: 'STOREDOUGHNUT',
                        heatMapDataKey: 'STORE_CATEGORY',
                        heatMapObject: {
                            "ATTR": "#002280",
                            "AR": "#21b2ff"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        lineColor,
                        lineWidth: 7,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20
                    }, {
                    title,
                    isDefault: 1,
                    minZoomVisibility: 1,
                    maxZoomVisibility: 20,
                    markerType: 'store'
                },
                    storeDataset);
                return response;
            }

            const createStoreLayers = async (addressMap, storeDataset) => {
                const storeLayerLineColors = {
                    "ATTR": "#002280",
                    "AR": "#21b2ff"
                };
                let storeOverlays = {};
                const dataGroupedByStoreCategory = R.groupBy(R.prop('STORE_CATEGORY'), storeDataset);
                let storeCategory = R.keys(dataGroupedByStoreCategory);
                storeCategory = R.sort((a, b) => a.localeCompare(b), storeCategory);
                for (let i = 0; i < storeCategory.length; i += 1) {
                    const storeLayer = (await createStoreLayer(addressMap, storeCategory[i] + 'addressMapZip', storeLayerLineColors[storeCategory[i]], dataGroupedByStoreCategory[storeCategory[i]])).canvasLayer;
                    addressMap.addLayer(storeLayer);
                    storeOverlays[storeCategory[i] === "AR" ? "Authorized Reseller Store" : "AT&T Retail Store"] = storeLayer;
                }
                return storeOverlays;
            }

            const createAddressLayer = async (addressMap, title, lineColor, addressDataset, markerShape, noFill) => {
                let pane = addressMap.getPane(title);
                if (!pane) {
                    pane = addressMap.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        markerShape,
                        heatMapDataKey: 'CUSTOMER_CATEGORY',
                        heatMapObject: {
                            "AT&T Fiber Customer": "#00cc00",
                            "AT&T Fiber Upgrade": "#dcb137",
                            "AT&T Fiber Prospect": "#236B8E",
                            "MDU All AT&T Fiber Customers": "#00cc00",
                            "MDU with AT&T Fiber Prospects": "#236B8E"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        lineColor,
                        lineWidth: 3,
                        noFill,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20,
                        markerSizeOffsetFromZoomValue: 8,
                        markerScaleFactor: 0.5
                    }, {
                    title,
                    isDefault: 1,
                    minZoomVisibility: 1,
                    maxZoomVisibility: 20,
                    markerType: 'address'
                },
                    addressDataset);
                return response;
            }

            const createAddressLayers = async (addressMap, addressDataset) => {
                addressDataset.forEach(function (el) {
                    if (el.SHOW_SERVICE_STATUS == "InService" && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW")
                        el.CUSTOMER_CATEGORY = "AT&T Fiber Customer";
                    else if (el.SHOW_SERVICE_STATUS == null && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW" && el.BB_ALL == 1 && el.BB_FIBR == 0)
                        el.CUSTOMER_CATEGORY = "AT&T Fiber Upgrade";
                    else if (el.SHOW_SERVICE_STATUS == null && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW")
                        el.CUSTOMER_CATEGORY = "AT&T Fiber Prospect";
                    else if (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW" && el.OPPORTUNITY_COUNT == 0)
                        el.CUSTOMER_CATEGORY = "MDU All AT&T Fiber Customers";
                    else if (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW" && el.OPPORTUNITY_COUNT > 0)
                        el.CUSTOMER_CATEGORY = "MDU with AT&T Fiber Prospects";
                });
                const ATT_FiberCustomer_Dataset = addressDataset.filter(function (el) {
                    return (el.CUSTOMER_CATEGORY == "AT&T Fiber Customer");
                });
                const ATT_FiberUpgrade_Dataset = addressDataset.filter(function (el) {
                    return (el.CUSTOMER_CATEGORY == "AT&T Fiber Upgrade");
                });
                const ATT_Fiber_Dataset = addressDataset.filter(function (el) {
                    return (el.CUSTOMER_CATEGORY == "AT&T Fiber Prospect");
                });
                const MDU_FiberCustomer_Dataset = addressDataset.filter(function (el) {
                    return (el.CUSTOMER_CATEGORY == "MDU All AT&T Fiber Customers");
                });
                const MDU_Fiber_Dataset = addressDataset.filter(function (el) {
                    return (el.CUSTOMER_CATEGORY == "MDU with AT&T Fiber Prospects");
                });
                const addressLayerLineColors = {
                    "AT&T Fiber Customer": "#00cc00",
                    "AT&T Fiber Upgrade": "#dcb137",
                    "AT&T Fiber Prospect": "#236B8E",
                    "MDU All AT&T Fiber Customers": "#00cc00",
                    "MDU with AT&T Fiber Prospects": "#236B8E"
                };
                let addressOverlays = {};
                if (ATT_FiberCustomer_Dataset.length > 0) {
                    const ATT_FiberCustomer_Layer = (await createAddressLayer(addressMap, 'AT&T Fiber Customer', addressLayerLineColors["AT&T Fiber Customer"], ATT_FiberCustomer_Dataset, 'CIRCLE', false)).canvasLayer;
                    addressOverlays["AT&T Fiber Customer"] = ATT_FiberCustomer_Layer;
                    addressMap.addLayer(ATT_FiberCustomer_Layer);
                }
                if (ATT_FiberUpgrade_Dataset.length > 0) {
                    const ATT_FiberUpgrade_Layer = (await createAddressLayer(addressMap, 'AT&T Fiber Upgrade', addressLayerLineColors["AT&T Fiber Upgrade"], ATT_FiberUpgrade_Dataset, 'CIRCLE', false)).canvasLayer;
                    addressOverlays["AT&T Fiber Upgrade"] = ATT_FiberUpgrade_Layer;
                    addressMap.addLayer(ATT_FiberUpgrade_Layer);
                }
                if (ATT_Fiber_Dataset.length > 0) {
                    const ATT_Fiber_Layer = (await createAddressLayer(addressMap, 'AT&T Fiber Prospect', addressLayerLineColors["AT&T Fiber Prospect"], ATT_Fiber_Dataset, 'CIRCLE', false)).canvasLayer;
                    addressOverlays["AT&T Fiber Prospect"] = ATT_Fiber_Layer;
                    addressMap.addLayer(ATT_Fiber_Layer);
                }
                if (MDU_FiberCustomer_Dataset.length > 0) {
                    const MDU_FiberCustomer_Layer = (await createAddressLayer(addressMap, 'MDU All AT&T Fiber Customers', addressLayerLineColors["MDU All AT&T Fiber Customers"], MDU_FiberCustomer_Dataset, 'MDUSQUARE', false)).canvasLayer;
                    addressOverlays["MDU All AT&T Fiber Customers"] = MDU_FiberCustomer_Layer;
                    addressMap.addLayer(MDU_FiberCustomer_Layer);
                }
                if (MDU_Fiber_Dataset.length > 0) {
                    const MDU_Fiber_Layer = (await createAddressLayer(addressMap, 'MDU with AT&T Fiber Prospects', addressLayerLineColors["MDU with AT&T Fiber Prospects"], MDU_Fiber_Dataset, 'MDUSQUARE', false)).canvasLayer;
                    addressOverlays["MDU with AT&T Fiber Prospects"] = MDU_Fiber_Layer;
                    addressMap.addLayer(MDU_Fiber_Layer);
                }
                return addressOverlays;
            }

            console.log('showDataModal_MDUtable');
            $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table
            $('#LOADING_showData_Modal').hide();
            $('#showDataModalTableDiv').show();
            groupByFilter();
            ponderApp.displayPSAData(psaData);

            var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                id: 'osm.topo',
                maxZoom: 17,
                zIndex: 1,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                });

            var baseLayers = {
                "Streets": streets,
                "Satellite": sat
            };

            addressMap = L.map("searchaddressmap", {
                attributionControl: false,
                preferCanvas: true,
                center: currentCenter,
                zoom: currentZoom,
                minZoom: 3,
                layers: [streets],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            addressMap.on('zoomend', function (e) {
                currentZoom = addressMap.getZoom();
                currentBounds = addressMap.getBounds();
                currentCenter = addressMap.getCenter();
                console.log('current zoom level: ' + currentZoom);
                console.log('current bounds: ' + currentBounds);
                console.log('current center: ' + currentCenter);
                var iconSize = [currentZoom * (8 / 2), currentZoom * (8 / 2)];
            });

            addressMap.on('overlayremove', function () {
                //close open popup
                addressMap.closePopup();
                // reset data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(addressMap);
            });

            addressMap.on('overlayadd', function () {
                // rebuild data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(addressMap);
            });

            const storeOverlays = await createStoreLayers(addressMap, storeData);
            const addressOverlays = await createAddressLayers(addressMap, filteredAddressDataForMap);
            var overlays = {};
            var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(addressMap);
            overlays = Object.assign(storeOverlays, addressOverlays);
            overlaysNames = Object.keys(overlays);
            overlaysNames.sort(sorter);
            overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));
            //ponderApp.showHideLayers(addressMap)
            //ponderApp.updateOverlaysLabel();
            ponderApp.rebuildMapOverlaysData(addressMap);
            ponderApp.updateOverlaysLabel();

            addressMap.on('dragend', function () {
                currentCenter = addressMap.getCenter();
            });

            addressMap.on('click', async function (e) {
                const closestLocation = ponderApp.closest(addressMap.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                if (closestLocation && closestLocation.p.minZoomVisibility <= addressMap.getZoom() 
                                && addressMap.getZoom() <= closestLocation.p.maxZoomVisibility) {
                    ponderApp.markerTypes[closestLocation.p.markerType].clicked(addressMap, closestLocation);
                }
            });

            //set bounds
            const allAddresses = filteredAddressDataForMap;
            let allAddressPoints = new L.featureGroup();
            for (i in allAddresses) {
                const loc = [allAddresses[i].LATITUDE, allAddresses[i].LONGITUDE];
                marker = new L.Marker(new L.latLng(loc));
                allAddressPoints.addLayer(marker);
            }
            const bounds = allAddressPoints.getBounds().pad(0.1);
            addressMap.fitBounds(bounds);

            //var table = $('#showDataModal_MDUtable');

            // begin first table
            var table = $('#showDataModal_MDUtable').DataTable({
                data: addressData,
                paging: true,
                lengthChange: false,
                pageLength: 5,
                //scrollY: '200px',
                scrollCollapse: true,
                scrollX: true,
                sort: false,
                dom: 'Brtlifp',                
                buttons: [
                    {
                        extend: 'csv',
                        className: 'btn btn-primary export-addresses-to-csv-4',
                        exportOptions: {
                            columns: [16, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
                        },
                        filename: "PONDER_" + getExportDate() + "_" + psaData.ZIP_CO_PSA
                    },
                    {
                        text: 'Export To Excel',
                        className: 'btn btn-primary export-addresses', titleAttr: 'Export To Excel', title: 'Export To Excel',
                        action: async function (e, dt, node, config) {
                            // return if limited users able to access the "Export To Excel" button
                            if (Access != "Unlimited") {
                                return;
                            }
                            $(".export-addresses").attr("disabled", "disabled");
                            $(".export-addresses-spinner").show();
                            $('.buttons-csv.export-addresses-to-csv-4').click();
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                eventType: "PSA_ADDRESS_EXPORT",
                                logData: psaData.ZIP_CO_PSA
                            };
                            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                            setTimeout(() => {
                                $(".export-addresses-spinner").hide();
                                $(".export-addresses").removeAttr("disabled");
                            }, 2000);
                        }
                    },
                    {
                        className: 'export-addresses-spinner',
                        text: '<img src="../ajax-loader_2.gif" />',
                    },
                ],
                columnDefs: [
                    { className: 'text-left', targets: [1, 2, 3, 4] },
                    { className: 'text-center', targets: [0, 5, 6, 7, 8, 9, 10] },
                ],
                columns: [
                    { 'data': 'HOUSE_NUMBER' },
                    { 'data': 'PREFIX' },
                    { 'data': 'UNIT_NUMBER' },
                    { 'data': 'STREET_NAME' },
                    { 'data': 'CITY' },
                    { 'data': 'STATE' },
                    { 'data': 'ZIP' },
                    { 'data': 'HYPERGIG' },
                    { 'data': 'REGREEN' },
                    { 'data': 'ADSL' },
                    { 'data': 'CSI_ELIGIBLE' },
                    { 'data': 'WIRELESS_SCORE' },
                    { 'data': 'CUSTOMER' },
                    { 'data': 'ADJUSTED_DWELLING_TYPE' },
                    { 'data': 'LATITUDE' },
                    { 'data': 'LONGITUDE' },
                    { 'data': 'DATA_DATE', name: 'DATA_DATE', visible: false },
                ],
                initComplete: function () {
                    this.api().columns().header().each(function (th) {
                        $(th).removeClass("sorting_asc");
                        $(th).removeClass("sorting");
                    });
                    // hide "Export To Excel" button for limited users
                    if (Access != "Unlimited") {
                        $(".export-addresses").hide();
                    }
                    $(".export-addresses-to-csv-4").hide();
                    $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                    $(".export-addresses-spinner").hide();
                },
                "createdRow": function (row, data, dataIndex) {
                    if (data["LATITUDE"] == "0" || data["LONGITUDE"] == "0") {
                        $(row).addClass('highlightDataTableRow');
                    }
                },
            });

            // var table = $('#example').DataTable({});

            $('#showDataModal_MDUtable tbody').off().on('click', 'tr', function () {
                addressMap.closePopup();

                var row_clicked = table.row(this);

                //var row_clicked = $(this).closest('tr');


                //var alert_data = table.row( this ).data();
                //console.log(alert_data);
                //alert( 'You clicked on '+ alert_data[0]+'\'s row' );



                //$('#example tbody').on('click', 'tr', function () {
                //    var data = table.row(this).data();
                //    alert('You clicked on ' + data[0] + '\'s row');
                //});




                var latitudeClicked = $('#showDataModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                var longitudeClicked = $('#showDataModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                if (latitudeClicked == "0" || longitudeClicked == "0") {
                    return;
                }
                var loc = [latitudeClicked, longitudeClicked];

                markerOptions = {
                    iconShape: 'doughnut',
                    iconSize: [20, 20],
                    borderWidth: 3,
                    borderColor: '#ff0000'
                };

                let pane = addressMap.getPane("marker title");
                if (!pane) {
                    pane = addressMap.createPane("marker title");
                    pane.style.zIndex = 800;
                }

                if (SearchModalLayerGroup) {
                    SearchModalLayerGroup.removeFrom(addressMap);
                }

                SearchModalLayerGroup = L.layerGroup();
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                SearchModalLayerGroup.addLayer(marker);
                SearchModalLayerGroup.addTo(addressMap);

                var NE_lat = Number(latitudeClicked);
                var NE_lng = Number(longitudeClicked);
                var add1 = .0001
                var NE_lat_1 = NE_lat + add1;
                var NE_lng_1 = NE_lng + add1;

                var SW_lat = Number(latitudeClicked);
                var SW_lng = Number(longitudeClicked);
                var add1 = .0001
                var SW_lat_1 = SW_lat - add1;
                var SW_lng_1 = SW_lng - add1;

                var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                    northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                    bounds = new L.LatLngBounds(southWest, northEast);
                addressMap.fitBounds(bounds, { padding: [.00, .00] });
                setTimeout(function () {
                    SearchModalLayerGroup.removeFrom(addressMap);
                }, 2000);
            });

            //$('#showDataModal_MDUtable tr').hover(function () {
            //    $(this).addClass('DT_highlight DT_pointer');
            //}, function () {
            //    $(this).removeClass('DT_highlight DT_pointer');
            //}
            //);

            $('#showDataModal_MDUtable tbody').on('mouseenter mouseleave', 'tr', function (e) {
                if (e.type === 'mouseenter') {
                    var row_highlight = table.row(this);
                    $(this).addClass('DT_highlight DT_pointer');
                    console.log('highlight row event fired');
                }
                else {
                    var row_highlight = table.row(this);
                    $(this).removeClass('DT_highlight DT_pointer');
                }
            });

            //show psaEvent Table
            if (psaEventData.length>0)
                $('#divPSAEventTable').show();
            else
                $('#divPSAEventTable').hide();
            $('#showDataModal_PSAEventTable').dataTable().fnDestroy(); //destroy old table

            //function format(d) {
            //    // `d` is the original data object for the row
            //    return (
            //        '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
            //        '<tr>' +
            //        '<td>Forecast New Fiber Sales:</td>' +
            //        '<td>' +
            //        d.FORECAST_NEW_FIBER_SALES +
            //        '</td>' +
            //        '<td>Actual New Fiber Sales:</td>' +
            //        '<td>' +
            //        d.ACTUAL_NEW_FIBER_SALES +
            //        '</td>' +
            //        '</tr>' +
            //        '<tr>' +
            //        '<td>Forecast Fiber Migrations:</td>' +
            //        '<td>' +
            //        d.FORECAST_FIBER_MIGRATIONS +
            //        '</td>' +
            //        '<td>Actual Fiber Migrations:</td>' +
            //        '<td>' +
            //        d.ACTUAL_FIBER_MIGRATIONS +
            //        '</td>' +
            //        '</tr>' +                    
            //        '</table>'
            //    );
            //}
            
            var table = $('#showDataModal_PSAEventTable').DataTable({
                data: psaEventData,
                paging: true,
                lengthChange: false,
                pageLength: 1,
                //scrollY: '200px',
                scrollCollapse: true,
                scrollX: true,
                sort: false,                
                dom: 'Brtlifp',
                "bFilter": false, //hide Datatable search box
                buttons: [],
<%--                buttons: [
                    {
                        extend: 'csv',
                        className: 'btn btn-primary export-psaEvents-to-csv',
                        exportOptions: {
                            columns: [0, 1, 2, 3, 4, 5, 6]
                        },
                        filename: "PONDER_PSA_EVENTS_" + getExportDate() + "_" + psaData.ZIP_CO_PSA
                    },
                    {
                        text: 'Export To Excel',
                        className: 'btn btn-primary export-psaEvents', titleAttr: 'Export To Excel', title: 'Export To Excel',
                        action: async function (e, dt, node, config) {
                            // return if limited users able to access the "Export To Excel" button
                            if (Access != "Unlimited") {
                                return;
                            }
                            $(".export-psaEvents").attr("disabled", "disabled");
                            $(".export-psaEvents-spinner").show();
                            $('.buttons-csv.export-psaEvents-to-csv').click();
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                eventType: "PSA_EVENT_EXPORT",
                                logData: psaData.ZIP_CO_PSA
                            };
                            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                            setTimeout(() => {
                                $(".export-psaEvents-spinner").hide();
                                $(".export-psaEvents").removeAttr("disabled");
                            }, 2000);
                        }
                    },
                    {
                        className: 'export-psaEvents-spinner',
                        text: '<img src="../ajax-loader_2.gif" />',
                    },
                ],--%>
                columnDefs: [
                    //{ className: 'text-left', targets: [1] },
                    //{ className: 'text-center', targets: [0, 2, 3, 4, 5, 6] },
                    { className: 'text-center', targets: [6] },
                    //{ width: 500, targets: 1 },
                    //{ width: 200, targets: 5 }
                ],
                columns: [
                    //{
                    //    className: 'dt-control',
                    //    orderable: false,
                    //    data: null,
                    //    defaultContent: '',
                    //},
                    { 'data': 'EVENT_ID' },
                    { 'data': 'EVENT_NAME' },
                    { 'data': 'FIBER_CHANNELS' },
                    { 'data': 'START_DT' },
                    { 'data': 'STATUS' },
                    { 'data': 'EVENT_ACTIVITY' },
                    { 'data': 'ACTUAL_NEW_FIBER_SALES' }
                ],
                initComplete: function () {
                    //hide Datatable search box
                    //$(".dataTables_filter").hide();
                    this.api().columns().header().each(function (th) {
                        $(th).removeClass("sorting_asc");
                        $(th).removeClass("sorting");
                    });
                    //// hide "Export To Excel" button for limited users
                    //if (Access != "Unlimited") {
                    //    $(".export-psaEvents").hide();
                    //}
                    //$(".export-psaEvents-to-csv").hide();
                    //$(".export-psaEvents-spinner").css({ "background-color": "white", "border-style": "none" });
                    //$(".export-psaEvents-spinner").hide();
                },
            });

            //$('#showDataModal_PSAEventTable tbody').on('click', 'td.dt-control', function () {
            //    var tr = $(this).closest('tr');
            //    var row = table.row(tr);

            //    if (row.child.isShown()) {
            //        // This row is already open - close it
            //        row.child.hide();
            //        tr.removeClass('shown');
            //    } else {
            //        // Open this row
            //        row.child(format(row.data())).show();
            //        tr.addClass('shown');
            //    }
            //});
        }

        async function showFuturePSADataZipUnitNumbers(addressData, storeData, psaData) {
            const myParamsObject = {
                userID: "<%=hf_User.Value%>",
                eventType: "FUTURE_PSA_ADDRESS_MAP",
                logData: psaData.ZIP_CO_PSA
            };
            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
            $('#futurePSADataLimitedUserDiv').hide();
            $('#futurePSADataCommonDiv').show();
            const filteredAddressDataForMap = addressData.filter(address => address.LATITUDE != 0 && address.LONGITUDE != 0);
            if (addressMap !== undefined && addressMap !== null) {
                addressMap.remove(); // should remove the map from UI and clean the inner children of DOM element
                console.log('addressMap*********' + addressMap); // nothing should actually happen to the value of addressMap
            }

            const footNoteCount = addressData.filter(address => address.LATITUDE == 0 || address.LONGITUDE == 0).length;
            if (footNoteCount > 0) {
                if (footNoteCount == 1) {
                    document.getElementById('footNoteFuturePSA').innerHTML = 'NOTE: ' + footNoteCount + ' Living Unit is missing lat / long and cannot be mapped';
                }
                else {
                    document.getElementById('footNoteFuturePSA').innerHTML = 'NOTE: ' + footNoteCount + ' Living Units are missing lat / long and cannot be mapped';
                }
            }
            else {
                document.getElementById('footNoteFuturePSA').innerHTML = '';
            }

            const createStoreLayer = async (addressMap, title, lineColor, storeDataset) => {
                let pane = addressMap.getPane(title);
                if (!pane) {
                    pane = addressMap.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        markerShape: 'STOREDOUGHNUT',
                        heatMapDataKey: 'STORE_CATEGORY',
                        heatMapObject: {
                            "ATTR": "#002280",
                            "AR": "#21b2ff"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        lineColor,
                        lineWidth: 7,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20
                    }, {
                    title,
                    isDefault: 1,
                    minZoomVisibility: 1,
                    maxZoomVisibility: 20,
                    markerType: 'store'
                },
                    storeDataset);
                return response;
            }

            const createStoreLayers = async (addressMap, storeDataset) => {
                const storeLayerLineColors = {
                    "ATTR": "#002280",
                    "AR": "#21b2ff"
                };
                let storeOverlays = {};
                const dataGroupedByStoreCategory = R.groupBy(R.prop('STORE_CATEGORY'), storeDataset);
                let storeCategory = R.keys(dataGroupedByStoreCategory);
                storeCategory = R.sort((a, b) => a.localeCompare(b), storeCategory);
                for (let i = 0; i < storeCategory.length; i += 1) {
                    const storeLayer = (await createStoreLayer(addressMap, storeCategory[i] + 'addressMapZip', storeLayerLineColors[storeCategory[i]], dataGroupedByStoreCategory[storeCategory[i]])).canvasLayer;
                    addressMap.addLayer(storeLayer);
                    storeOverlays[storeCategory[i] === "AR" ? "Authorized Reseller Store" : "AT&T Retail Store"] = storeLayer;
                }
                return storeOverlays;
            }

            const createAddressLayer = async (addressMap, title, lineColor, addressDataset, markerShape, noFill) => {
                let pane = addressMap.getPane(title);
                if (!pane) {
                    pane = addressMap.createPane(title);
                    pane.style.zIndex = 400;
                }
                const response = ponderApp.createMaskCanvas(
                    {
                        pane,
                        markerShape,
                        heatMapDataKey: 'WIRELESS_SCORE',
                        heatMapObject: {
                            "Future Fiber Opportunity": "#00cc00"
                        },
                        heatMapActivationZoomLevel: 1,
                        markerSizeOffsetFromZoomValue: 2,
                        lineColor,
                        lineWidth: 3,
                        noFill,
                        minZoomBorderVisibility: 12,
                        maxZoomBorderVisibility: 20,
                        markerSizeOffsetFromZoomValue: 8,
                        markerScaleFactor: 0.5
                    }, {
                    title,
                    isDefault: 1,
                    minZoomVisibility: 1,
                    maxZoomVisibility: 20,
                    markerType: 'futurepsaaddress'
                },
                    addressDataset);
                return response;
            }

            const createAddressLayers = async (addressMap, addressDataset) => {
                const addressLayerLineColors = {
                    "Future Fiber Opportunity": "#00cc00"
                };
                let addressOverlays = {};
                if (addressDataset.length > 0) {
                    const addressDataset_Layer = (await createAddressLayer(addressMap, 'Future Fiber Opportunity', addressLayerLineColors["Future Fiber Opportunity"], addressDataset, 'CIRCLE', false)).canvasLayer;
                    addressOverlays["Future Fiber Opportunity"] = addressDataset_Layer;
                    addressMap.addLayer(addressDataset_Layer);
                }
                return addressOverlays;
            }

            console.log('showFuturePSADataModal_MDUtable');
            $('#showFuturePSADataModal_MDUtable').dataTable().fnDestroy(); //destroy old table
            $('#LOADING_showFutuePSAData_Modal').hide();
            $('#showFuturePSADataModalTableDiv').show();
            groupByFilter();
            ponderApp.displayFuturePSAData(psaData);

            var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                id: 'osm.topo',
                maxZoom: 17,
                zIndex: 1,
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }),
                sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    id: 'osm.streets',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                });

            var baseLayers = {
                "Streets": streets,
                "Satellite": sat
            };

            addressMap = L.map("searchaddressmapFuturePSA", {
                attributionControl: false,
                preferCanvas: true,
                center: currentCenter,
                zoom: currentZoom,
                minZoom: 3,
                layers: [streets],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            addressMap.on('zoomend', function (e) {
                currentZoom = addressMap.getZoom();
                currentBounds = addressMap.getBounds();
                currentCenter = addressMap.getCenter();
                console.log('current zoom level: ' + currentZoom);
                console.log('current bounds: ' + currentBounds);
                console.log('current center: ' + currentCenter);
                var iconSize = [currentZoom * (8 / 2), currentZoom * (8 / 2)];
            });

            addressMap.on('overlayremove', function () {
                //close open popup
                addressMap.closePopup();
                // reset data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(addressMap);
            });

            addressMap.on('overlayadd', function () {
                // rebuild data needed for the ponderApp.closest function
                ponderApp.rebuildMapOverlaysData(addressMap);
            });

            const storeOverlays = await createStoreLayers(addressMap, storeData);
            const addressOverlays = await createAddressLayers(addressMap, filteredAddressDataForMap);
            var overlays = {};
            var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(addressMap);
            overlays = Object.assign(storeOverlays, addressOverlays);
            overlaysNames = Object.keys(overlays);
            overlaysNames.sort(sorter);
            overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));
            ponderApp.rebuildMapOverlaysData(addressMap);
            ponderApp.updateOverlaysLabel();

            addressMap.on('dragend', function () {
                currentCenter = addressMap.getCenter();
            });

            addressMap.on('click', async function (e) {
                const closestLocation = ponderApp.closest(addressMap.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                if (closestLocation && closestLocation.p.minZoomVisibility <= addressMap.getZoom() 
                                && addressMap.getZoom() <= closestLocation.p.maxZoomVisibility) {
                    ponderApp.markerTypes[closestLocation.p.markerType].clicked(addressMap, closestLocation);
                }
            });

            //set bounds
            const allAddresses = filteredAddressDataForMap;
            let allAddressPoints = new L.featureGroup();
            for (i in allAddresses) {
                const loc = [allAddresses[i].LATITUDE, allAddresses[i].LONGITUDE];
                marker = new L.Marker(new L.latLng(loc));
                allAddressPoints.addLayer(marker);
            }
            const bounds = allAddressPoints.getBounds().pad(0.1);
            addressMap.fitBounds(bounds);

            // begin first table
            var table = $('#showFuturePSADataModal_MDUtable').DataTable({
                data: addressData,
                paging: true,
                lengthChange: false,
                pageLength: 5,
                //scrollY: '200px',
                scrollCollapse: true,
                scrollX: true,
                sort: false,
                dom: 'Brtlifp',
                buttons: [
                    {
                        extend: 'csv',
                        className: 'btn btn-primary export-addresses-to-csv-40',
                        filename: "PONDER_T-30_" + getExportDate() + "_" + psaData.ZIP_CO_PSA
                    },
                    {
                        text: 'Export To Excel',
                        className: 'btn btn-primary export-addresses', titleAttr: 'Export To Excel', title: 'Export To Excel',
                        action: async function (e, dt, node, config) {
                            // return if limited users able to access the "Export To Excel" button
                            if (Access != "Unlimited") {
                                return;
                            }
                            $(".export-addresses").attr("disabled", "disabled");
                            $(".export-addresses-spinner").show();
                            $('.buttons-csv.export-addresses-to-csv-40').click();
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                eventType: "FUTURE_PSA_ADDRESS_EXPORT",
                                logData: psaData.ZIP_CO_PSA
                            };
                            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                            setTimeout(() => {
                                $(".export-addresses-spinner").hide();
                                $(".export-addresses").removeAttr("disabled");
                            }, 2000);
                        }
                    },
                    {
                        className: 'export-addresses-spinner',
                        text: '<img src="../ajax-loader_2.gif" />',
                    },
                ],
                columnDefs: [
                    { className: 'text-left', targets: [2, 3, 4, 5] },
                    { className: 'text-center', targets: [1, 6, 7, 8, 9, 10] },
                ],
                columns: [
                    { 'data': 'GRN_30DAY_DT_TEXT', visible: false },
                    { 'data': 'HOUSE_NUMBER' },
                    { 'data': 'PREFIX' },
                    { 'data': 'UNIT_NUMBER' },
                    { 'data': 'STREET_NAME' },
                    { 'data': 'CITY' },
                    { 'data': 'STATE' },
                    { 'data': 'ZIP' },
                    { 'data': 'WIRELESS_SCORE' },
                    { 'data': 'LATITUDE' },
                    { 'data': 'LONGITUDE' }
                ],
                initComplete: function () {
                    this.api().columns().header().each(function (th) {
                        $(th).removeClass("sorting_asc");
                        $(th).removeClass("sorting");
                    });
                    // hide "Export To Excel" button for limited users
                    if (Access != "Unlimited") {
                        $(".export-addresses").hide();
                    }
                    $(".export-addresses-to-csv-40").hide();
                    $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                    $(".export-addresses-spinner").hide();
                },
                "createdRow": function (row, data, dataIndex) {
                    if (data["LATITUDE"] == "0" || data["LONGITUDE"] == "0") {
                        $(row).addClass('highlightDataTableRow');
                    }
                },
            });

            // var table = $('#example').DataTable({});

            $('#showFuturePSADataModal_MDUtable tbody').off().on('click', 'tr', function () {
                addressMap.closePopup();

                var row_clicked = table.row(this);

                var latitudeClicked = $('#showFuturePSADataModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                var longitudeClicked = $('#showFuturePSADataModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                if (latitudeClicked == "0" || longitudeClicked == "0") {
                    return;
                }
                var loc = [latitudeClicked, longitudeClicked];

                markerOptions = {
                    iconShape: 'doughnut',
                    iconSize: [20, 20],
                    borderWidth: 3,
                    borderColor: '#ff0000'
                };

                let pane = addressMap.getPane("marker title");
                if (!pane) {
                    pane = addressMap.createPane("marker title");
                    pane.style.zIndex = 800;
                }

                if (SearchModalLayerGroup) {
                    SearchModalLayerGroup.removeFrom(addressMap);
                }

                SearchModalLayerGroup = L.layerGroup();
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                SearchModalLayerGroup.addLayer(marker);
                SearchModalLayerGroup.addTo(addressMap);

                var NE_lat = Number(latitudeClicked);
                var NE_lng = Number(longitudeClicked);
                var add1 = .0001
                var NE_lat_1 = NE_lat + add1;
                var NE_lng_1 = NE_lng + add1;

                var SW_lat = Number(latitudeClicked);
                var SW_lng = Number(longitudeClicked);
                var add1 = .0001
                var SW_lat_1 = SW_lat - add1;
                var SW_lng_1 = SW_lng - add1;

                var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                    northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                    bounds = new L.LatLngBounds(southWest, northEast);
                addressMap.fitBounds(bounds, { padding: [.00, .00] });
                setTimeout(function () {
                    SearchModalLayerGroup.removeFrom(addressMap);
                }, 2000);
            });

            $('#showFuturePSADataModal_MDUtable tbody').on('mouseenter mouseleave', 'tr', function (e) {
                if (e.type === 'mouseenter') {
                    var row_highlight = table.row(this);
                    $(this).addClass('DT_highlight DT_pointer');
                    console.log('highlight row event fired');
                }
                else {
                    var row_highlight = table.row(this);
                    $(this).removeClass('DT_highlight DT_pointer');
                }
            });
        }

        async function PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData) {
            var PSAVariable = SelectedPSA;
            $('#showDataModalTableDiv').hide();
            $('#LOADING_showData_Modal').show();
            document.getElementById('showDataModalTitle').innerHTML = 'ZIP CO PSA: ' + PSAVariable;
            let myParamsObject = {
                type: "GetSearchModalData",
                PSAVariable: PSAVariable
            };
            let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
            addressData = JSON.parse(data.d);
            //get PSA event data
            myParamsObject = {
                type: "GetPSAEventData",
                PSAVariable: PSAVariable
            };
            data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
            const psaEventData = JSON.parse(data.d);
            await showDataZipUnitNumbers(addressData, storeData, psaData, psaEventData);
        }

        async function FuturePSAZipShowAddressesFromMapClick(SelectedFuturePSA, storeData, psaData) {
            var FuturePSAVariable = SelectedFuturePSA;
            $('#showFuturePSADataModalTableDiv').hide();
            $('#LOADING_showFutuePSAData_Modal').show();
            document.getElementById('showFuturePSADataModalTitle').innerHTML = 'ZIP CO PSA: ' + FuturePSAVariable;
            const myParamsObject = {
                type: "Get_Future_PSAs_Data",
                zipVariable: SelectedFuturePSA
            };
            let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
            addressData = JSON.parse(data.d);
            await showFuturePSADataZipUnitNumbers(addressData, storeData, psaData);
        }

        function ZipModal_Click(source, eventArgs) {
            var clickButton = document.getElementById("<%= btnZipModal.ClientID %>");
            $('#LOADING_ZIP_Modal').show();
            $('#ModalDisplay').hide();
            if (Access == "Unlimited") {
                $('#zipfooterMapModal3').hide();
                $('#zipfooterMapModal').show();
            } else {
                $('#zipfooterMapModal').hide();
                $('#zipfooterMapModal3').show();
            }
            clickButton.click();
        }

        function showZipModal(props) {
            ZipModal_Click();
            updateZipModal(props); // function for getting data for modal
        }

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
                $('#zipfooter').hide();
                //$('#zipfooter2').hide();
                //$('#zipfooter3').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#cmaTableDiv').hide();
                $('#MapDiv').hide();
            }
            else if (trident > 0) {
                // IE 11, return version number 
                alert('We noticed you are using Internet Explorer - This tool was developed for use in Firefox, Safari and Chrome Only. Please use one of these supported browsers. We apoligize for the inconvenience.');
                $('#zipfooter').hide();
                //$('#zipfooter2').hide();
                //$('#zipfooter3').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#cmaTableDiv').hide();
                $('#MapDiv').hide();
            }
            else if (edge > 0) {
                //Edge (IE 12+), return version number 
                alert('We noticed you are using Internet Explorer - This tool was developed for use in Firefox, Safari and Chrome Only. Please use one of these supported browsers. We apoligize for the inconvenience.');
                $('#zipfooter').hide();
                //$('#zipfooter2').hide();
                //$('#zipfooter3').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#cmaTableDiv').hide();
                $('#MapDiv').hide();
            } else {
                IEDetected = 'No';
            }
        }

        if (IEDetected == 'No') {
            var geoTypeStored = '';         // these will be populated after submit button click. Note that initial load calls a submit button click without user clicking
            var marketStored = '';
            $(document).keypress(function (e) { if (e.keyCode === 13) { e.preventDefault(); return false; } });
            $(document).ready(function () {
                if ($('#txtAcknowledgeConfidentialityFlag').val() === "1") {
                    $('#confidentialInfoAcknowledge').modal({backdrop: 'static',keyboard: false}).modal('show');
                    $('#btnAcknowledge').off().on('click', function () {
                        $('#confidentialInfoAcknowledge').modal('toggle');
                    });
                }
                $('#LOADING1').show();
                $('#ddlMarket').attr("disabled", "disabled");
                $('#ddlGroupBy').attr("disabled", "disabled");
                //$('#ddlRegionGroupBy').attr("disabled", "disabled");
                //$('#ddlMarketGroupBy').attr("disabled", "disabled");
                if (Access == "Limited") {
                    $('body').bind('cut copy paste', function (e) {
                        e.preventDefault();
                    });
                    //Disable mouse right click
                    $("body").on("contextmenu", function (e) {
                        return false;
                    });
                }
                $('#classificationButton').show();
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity.aspx/GetDATADATE",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDATADATE(data);
                    },
                    error: function (data) {
                    }
                });
                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
                SubmitButtonClick();
            });

            function loadDATADATE(data) {
                var score = JSON.parse(data.d);
                var dateIQIData = score[0]["DATA_DATE"];
                var dateOVALSFiberLocation = score[1]["DATA_DATE"];
                var dateOVALSActiveFiber = score[2]["DATA_DATE"];
                var dateStoreData = score[3]["DATA_DATE"];
                var dateT30Files = score[4]["DATA_DATE"];
                document.getElementById('dateIQIData').innerHTML = dateIQIData;
                document.getElementById('dateOVALSFiberLocation').innerHTML = dateOVALSFiberLocation;
                document.getElementById('dateOVALSActiveFiber').innerHTML = dateOVALSActiveFiber;
                document.getElementById('dateStoreData').innerHTML = dateStoreData;
                document.getElementById('dateT30Files').innerHTML = dateT30Files;
            }

            function ShowClassificationMethodology(source, eventArgs) {
                $('#AceClassificationInfo').hide();
                if (AceAccess === "ACE") {
                    $('#AceClassificationInfo').show();
                }
                var clickButton = document.getElementById("<%= ClassificationMethodology.ClientID %>");
                clickButton.click();

                var delayInMilliseconds = 1000; //500 ms

                setTimeout(function () {
                    groupByFilter();
                }, delayInMilliseconds);

            }

            function hideOldSearchInfo(source, eventArgs) {
                $('#NODATA_SEARCH_SEARCH').hide();
                $('#checkFailed').hide();
                $('#searchDivMap').hide();
                $('#showSearchtable').hide();
                reset();
            }

            function reset() {
                //console.log("1111111111");
                //var delayInMilliseconds = 2000; //500 ms
                //console.log("2222222222");
                //setTimeout(function () {
                //    resetDisplay();
                //}, delayInMilliseconds);
                //console.log("3333333333");

                var resetButton1 = document.getElementById("txtSearchHouseNumber");
                var resetButton2 = document.getElementById("txtSearchStreetName");
                var resetButton3 = document.getElementById("txtSearchCity");
                //var resetButton4 = document.getElementById("txtSearchState");
                var resetButton5 = document.getElementById("txtSearchZip");
                if (resetButton1) {
                    resetButton1.value = "";
                }
                if (resetButton2) {
                    resetButton2.value = "";
                }
                if (resetButton3) {
                    resetButton3.value = "";
                }
                //if (resetButton4) {
                //    resetButton4.value = "";
                //}
                $("select#ddlState").val('SELECT'); //reset to first item in ddlState
                if (resetButton5) {
                    resetButton5.value = "";
                }

            }

            function resetDisplay() {
                //console.log("reset display *****");
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                } else {
                    marketType = 'MARKET';
                }

                if (marketType == 'MARKET') {
                    //console.log('***** MarketType MARKET *****');
                    //$('#ShowHideRegionGroupBy').hide();
                    //$('#ShowHideMarketGroupBy').show();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', false)
                }
                else if (marketType == 'REGION') {
                    //console.log('***** MarketType REGION *****');
                    //$('#ShowHideRegionGroupBy').show();
                    //$('#ShowHideMarketGroupBy').hide();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)
                }
                else { //National
                    // console.log('***** MarketType NATIONAL *****');
                    //$('#ShowHideRegionGroupBy').hide();
                    //$('#ShowHideMarketGroupBy').hide();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', true)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', true)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)
                }
            }

            function checkForm() {
                var checkField1 = document.getElementById("txtSearchHouseNumber");
                var checkField2 = document.getElementById("txtSearchStreetName");
                var checkField3 = document.getElementById("txtSearchCity");
                //var checkField4 = document.getElementById("txtSearchState");
                var checkField5 = document.getElementById("txtSearchZip");
                //var check1 = 0;
                //if (checkField1.value == '') {
                //    check1 = 1;
                //    console.log('checkField1 FAILED')
                //}
                var check2 = 0;
                if (checkField2.value == '') {
                    check2 = 1;
                    //console.log('checkField2 FAILED')
                }
                var check3 = 0;
                if (checkField3.value == '') {
                    check3 = 1;
                    //console.log('checkField3 FAILED')
                }
                var check4 = 0;
                if ($("#ddlState option:selected").index() == 0) {
                    check4 = 1;
                    //console.log('checkField4 FAILED')
                }
                var check5 = 0;
                if (checkField5.value == '') {
                    check5 = 1;
                    //console.log('checkField5 FAILED')
                }

                var check;
                check = check2 + check3 + check4;
                checkZip = check2 + check5;

                if (check == 0) {
                    //console.log('checkFields PASSED')
                    SearchButtonClick();
                } else if (checkZip == 0) {
                    //console.log('checkFields Zip PASSED')
                    SearchButtonClick();
                } else {
                    $('#NODATA_SEARCH_SEARCH').hide();
                    $('#checkFailed').show();
                    $('#searchDivMap').hide();
                    $('#showSearchtable').hide();
                    var delayInMilliseconds = 1000; //500 ms

                    setTimeout(function () {
                        groupByFilter();
                    }, delayInMilliseconds);
                }

            }

            async function SearchButtonClick() {
                $('#LOADING_SEARCH_MAP').show();
                $('#NODATA_SEARCH_SEARCH').hide();
                $('#checkFailed').hide();
                $('#ModalDisplay').hide();
                $('#searchDivMap').hide();
                $('#showSearchtable').hide();



                var houseNumberVariable = $("#txtSearchHouseNumber").val();
                var streetNameVariable = $("#txtSearchStreetName").val();
                var cityVariable = $("#txtSearchCity").val();
                var zipVariable = $("#txtSearchZip").val();
                //var stateVariable = $("#txtSearchState").val();
                var stateVariable = $('#<%= ddlState.ClientID %> option:selected').val();
                if (stateVariable == 'SELECT') {
                    stateVariable = '';
                }

                console.log("HouseNumber: " + houseNumberVariable);
                console.log("StreetName: " + streetNameVariable);
                console.log("City: " + cityVariable);
                console.log("State: " + stateVariable);
                console.log("Zip: " + zipVariable);


                let myParamsObject = {
                    type: "GetSearchAll",
                    'HouseNumber': houseNumberVariable,
                    'StreetName': streetNameVariable,
                    'City': cityVariable,
                    'StateVariable': stateVariable,
                    'Zip': zipVariable
                };
                let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                const addressData = JSON.parse(data.d);
                myParamsObject = {
                    type: "Get_Store_Detail_National",
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                const storeData = JSON.parse(data.d);
                $('#LOADING_SEARCH_MAP').hide();
                $('#ModalDisplay').show();
                await loadSearchCheck(addressData, storeData);
            }

            async function loadSearchCheck(addressData, storeData) {

                //$('#searchDivMap').show();
                //$('#showSearchtable').show();

                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                } else {
                    marketType = 'MARKET';
                }

                if (marketType == 'MARKET') {
                    //console.log('***** MarketType MARKET *****');
                    //$('#ShowHideRegionGroupBy').hide();
                    //$('#ShowHideMarketGroupBy').show();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', false)
                }
                else if (marketType == 'REGION') {
                    //console.log('***** MarketType REGION *****');
                    //$('#ShowHideRegionGroupBy').show();
                    //$('#ShowHideMarketGroupBy').hide();                    
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)
                }
                else { //National
                    //console.log('***** MarketType NATIONAL *****');
                    //$('#ShowHideRegionGroupBy').hide();
                    //$('#ShowHideMarketGroupBy').hide();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', true)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', true)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)
                }

                if (addressData.length <= 0) {
                    $('#NODATA_SEARCH_SEARCH').show();
                    $('#checkFailed').hide();
                    $('#searchDivMap').hide();
                    $('#showSearchtable').hide();
                }
                else {
                    //console.log("Search Results");
                    //console.log("json Search Results: " + json);
                    $('#searchDivMap').show();
                    $('#showSearchtable').show();
                    //loadMapSearchTable(addressData);
                    //searchMap(addressData);
                    //loadSearchInfo(data);
                    await showSearchData(addressData, storeData);
                }
            }

            async function showSearchData(addressData, storeData) {
                addressData = addressData.map(obj => ({ ...obj, CUSTOMER: obj.SERVICE_STATUS == "InService" ? "Customer" : (obj.SERVICE_STATUS == null && obj.BB_ALL == 1 && obj.BB_FIBR == 0 ? "Upgrade" : "Prospect") }))
                const filteredAddressDataForMap = addressData.filter(address => address.SHOW_MAP == "SHOW" && address.LATITUDE != 0 && address.LONGITUDE != 0);

                document.getElementById('mySearchMap').innerHTML = "<div id='searchaddressfieldsmap' style='height: 400px;'></div>";

                if (addressFieldsMap !== undefined && addressFieldsMap !== null) {
                    addressFieldsMap.remove();
                    console.log('addressFieldsMap*********' + addressFieldsMap);
                }
                //const footNoteCount = addressData.length - addressData.filter(address => address.LATITUDE != 0 && address.LONGITUDE != 0).length;
                //if (footNoteCount > 0)
                //    document.getElementById('mySearchMapFootNote').innerHTML = 'NOTE: ' + footNoteCount + ' Living Units are missing lat longs and cannot be mapped';

                const footNoteCount = addressData.filter(address => address.LATITUDE == 0 || address.LONGITUDE == 0).length;
                if (footNoteCount > 0) {
                    if (footNoteCount == 1) {
                        document.getElementById('mySearchMapFootNote').innerHTML = 'NOTE: ' + footNoteCount + ' Living Unit is missing lat / long and cannot be mapped';
                    }
                    else {
                        document.getElementById('mySearchMapFootNote').innerHTML = 'NOTE: ' + footNoteCount + ' Living Units are missing lat / long and cannot be mapped';
                    }
                }
                else {
                    document.getElementById('mySearchMapFootNote').innerHTML = '';
                }


                const createStoreLayer = async (addressFieldsMap, title, lineColor, storeDataset) => {
                    let pane = addressFieldsMap.getPane(title);
                    if (!pane) {
                        pane = addressFieldsMap.createPane(title);
                        pane.style.zIndex = 400;
                    }
                    const response = ponderApp.createMaskCanvas(
                        {
                            pane,
                            markerShape: 'STOREDOUGHNUT',
                            heatMapDataKey: 'STORE_CATEGORY',
                            heatMapObject: {
                                "ATTR": "#002280",
                                "AR": "#21b2ff"
                            },
                            heatMapActivationZoomLevel: 1,
                            markerSizeOffsetFromZoomValue: 2,
                            lineColor,
                            lineWidth: 7,
                            minZoomBorderVisibility: 12,
                            maxZoomBorderVisibility: 20
                        }, {
                        title,
                        isDefault: 1,
                        minZoomVisibility: 1,
                        maxZoomVisibility: 20,
                        markerType: 'store'
                    },
                        storeDataset);
                    return response;
                }

                const createStoreLayers = async (addressFieldsMap, storeDataset) => {
                    const storeLayerLineColors = {
                        "ATTR": "#002280",
                        "AR": "#21b2ff"
                    };
                    let storeOverlays = {};
                    const dataGroupedByStoreCategory = R.groupBy(R.prop('STORE_CATEGORY'), storeDataset);
                    let storeCategory = R.keys(dataGroupedByStoreCategory);
                    storeCategory = R.sort((a, b) => a.localeCompare(b), storeCategory);
                    for (let i = 0; i < storeCategory.length; i += 1) {
                        const storeLayer = (await createStoreLayer(addressFieldsMap, storeCategory[i] + 'addressFieldsMapSearch', storeLayerLineColors[storeCategory[i]], dataGroupedByStoreCategory[storeCategory[i]])).canvasLayer;
                        addressFieldsMap.addLayer(storeLayer);
                        storeOverlays[storeCategory[i] === "AR" ? "Authorized Reseller Store" : "AT&T Retail Store"] = storeLayer;
                    }
                    return storeOverlays;
                }

                const createAddressLayer = async (addressFieldsMap, title, lineColor, addressDataset, markerShape, noFill) => {
                    let pane = addressFieldsMap.getPane(title);
                    if (!pane) {
                        pane = addressFieldsMap.createPane(title);
                        pane.style.zIndex = 400;
                    }
                    const response = ponderApp.createMaskCanvas(
                        {
                            pane,
                            markerShape,
                            heatMapDataKey: 'CUSTOMER_CATEGORY',
                            heatMapObject: {
                                "AT&T Fiber Customer": "#00cc00",
                                "AT&T Fiber Upgrade": "#dcb137",
                                "AT&T Fiber Prospect": "#236B8E",
                                "MDU All AT&T Fiber Customers": "#00cc00",
                                "MDU with AT&T Fiber Prospects": "#236B8E"
                            },
                            heatMapActivationZoomLevel: 1,
                            markerSizeOffsetFromZoomValue: 2,
                            lineColor,
                            lineWidth: 3,
                            noFill,
                            minZoomBorderVisibility: 12,
                            maxZoomBorderVisibility: 20,
                            markerSizeOffsetFromZoomValue: 8,
                            markerScaleFactor: 0.5
                        }, {
                        title,
                        isDefault: 1,
                        minZoomVisibility: 1,
                        maxZoomVisibility: 20,
                        markerType: 'address'
                    },
                        addressDataset);
                    return response;
                }

                const createAddressLayers = async (addressFieldsMap, addressDataset) => {
                    addressDataset.forEach(function (el) {
                        if (el.SHOW_SERVICE_STATUS == "InService" && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW")
                            el.CUSTOMER_CATEGORY = "AT&T Fiber Customer";
                        else if (el.SHOW_SERVICE_STATUS == null && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW" && el.BB_ALL == 1 && el.BB_FIBR == 0)
                            el.CUSTOMER_CATEGORY = "AT&T Fiber Upgrade";
                        else if (el.SHOW_SERVICE_STATUS == null && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW")
                            el.CUSTOMER_CATEGORY = "AT&T Fiber Prospect";
                        else if (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW" && el.OPPORTUNITY_COUNT == 0)
                            el.CUSTOMER_CATEGORY = "MDU All AT&T Fiber Customers";
                        else if (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW" && el.OPPORTUNITY_COUNT > 0)
                            el.CUSTOMER_CATEGORY = "MDU with AT&T Fiber Prospects";
                    });
                    const ATT_FiberCustomer_Dataset = addressDataset.filter(function (el) {
                        return (el.CUSTOMER_CATEGORY == "AT&T Fiber Customer");
                    });
                    const ATT_FiberUpgrade_Dataset = addressDataset.filter(function (el) {
                        return (el.CUSTOMER_CATEGORY == "AT&T Fiber Upgrade");
                    });
                    const ATT_Fiber_Dataset = addressDataset.filter(function (el) {
                        return (el.CUSTOMER_CATEGORY == "AT&T Fiber Prospect");
                    });
                    const MDU_FiberCustomer_Dataset = addressDataset.filter(function (el) {
                        return (el.CUSTOMER_CATEGORY == "MDU All AT&T Fiber Customers");
                    });
                    const MDU_Fiber_Dataset = addressDataset.filter(function (el) {
                        return (el.CUSTOMER_CATEGORY == "MDU with AT&T Fiber Prospects");
                    });
                    const addressLayerLineColors = {
                        "AT&T Fiber Customer": "#00cc00",
                        "AT&T Fiber Upgrade": "#dcb137",
                        "AT&T Fiber Prospect": "#236B8E",
                        "MDU All AT&T Fiber Customers": "#00cc00",
                        "MDU with AT&T Fiber Prospects": "#236B8E"
                    };
                    let addressOverlays = {};
                    if (ATT_FiberCustomer_Dataset.length > 0) {
                        const ATT_FiberCustomer_Layer = (await createAddressLayer(addressFieldsMap, 'AT&T Fiber Customer', addressLayerLineColors["AT&T Fiber Customer"], ATT_FiberCustomer_Dataset, 'CIRCLE', false)).canvasLayer;
                        addressOverlays["AT&T Fiber Customer"] = ATT_FiberCustomer_Layer;
                        addressFieldsMap.addLayer(ATT_FiberCustomer_Layer);
                    }
                    if (ATT_FiberUpgrade_Dataset.length > 0) {
                        const ATT_FiberUpgrade_Layer = (await createAddressLayer(addressFieldsMap, 'AT&T Fiber Upgrade', addressLayerLineColors["AT&T Fiber Upgrade"], ATT_FiberUpgrade_Dataset, 'CIRCLE', false)).canvasLayer;
                        addressOverlays["AT&T Fiber Upgrade"] = ATT_FiberUpgrade_Layer;
                        addressFieldsMap.addLayer(ATT_FiberUpgrade_Layer);
                    }
                    if (ATT_Fiber_Dataset.length > 0) {
                        const ATT_Fiber_Layer = (await createAddressLayer(addressFieldsMap, 'AT&T Fiber Prospect', addressLayerLineColors["AT&T Fiber Prospect"], ATT_Fiber_Dataset, 'CIRCLE', false)).canvasLayer;
                        addressOverlays["AT&T Fiber Prospect"] = ATT_Fiber_Layer;
                        addressFieldsMap.addLayer(ATT_Fiber_Layer);
                    }
                    if (MDU_FiberCustomer_Dataset.length > 0) {
                        const MDU_FiberCustomer_Layer = (await createAddressLayer(addressFieldsMap, 'MDU All AT&T Fiber Customers', addressLayerLineColors["MDU All AT&T Fiber Customers"], MDU_FiberCustomer_Dataset, 'MDUSQUARE', false)).canvasLayer;
                        addressOverlays["MDU All AT&T Fiber Customers"] = MDU_FiberCustomer_Layer;
                        addressFieldsMap.addLayer(MDU_FiberCustomer_Layer);
                    }
                    if (MDU_Fiber_Dataset.length > 0) {
                        const MDU_Fiber_Layer = (await createAddressLayer(addressFieldsMap, 'MDU with AT&T Fiber Prospects', addressLayerLineColors["MDU with AT&T Fiber Prospects"], MDU_Fiber_Dataset, 'MDUSQUARE', false)).canvasLayer;
                        addressOverlays["MDU with AT&T Fiber Prospects"] = MDU_Fiber_Layer;
                        addressFieldsMap.addLayer(MDU_Fiber_Layer);
                    }
                    return addressOverlays;
                }

                //console.log('showDataModal_Searchtable');
                //$('#showDataModal_Searchtable').dataTable().fnDestroy(); //destroy old table
                //$('#LOADING_showData_Modal').hide();
                //$('#showDataModalTableDiv').show();
                //groupByFilter();

                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                    id: 'osm.topo',
                    maxZoom: 17,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                    sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                        id: 'arcgis.sat',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                        subdomains: ['a', 'b', 'c']
                    }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                        subdomains: ['a', 'b', 'c']
                    });

                var baseLayers = {
                    "Streets": streets,
                    "Satellite": sat
                };

                addressFieldsMap = L.map("searchaddressfieldsmap", {
                    attributionControl: false,
                    preferCanvas: true,
                    center: currentCenter,
                    zoom: currentZoom,
                    minZoom: 3,
                    layers: [streets],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                addressFieldsMap.on('zoomend', function (e) {
                    currentZoom = addressFieldsMap.getZoom();
                    currentBounds = addressFieldsMap.getBounds();
                    currentCenter = addressFieldsMap.getCenter();
                    console.log('current zoom level: ' + currentZoom);
                    console.log('current bounds: ' + currentBounds);
                    console.log('current center: ' + currentCenter);
                    var iconSize = [currentZoom * (8 / 2), currentZoom * (8 / 2)];
                });

                addressFieldsMap.on('overlayremove', function () {
                    //close open popup
                    addressFieldsMap.closePopup();
                    // reset data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(addressFieldsMap);
                });

                addressFieldsMap.on('overlayadd', function () {
                    // rebuild data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(addressFieldsMap);
                });

                const storeOverlays = await createStoreLayers(addressFieldsMap, storeData);
                const addressOverlays = await createAddressLayers(addressFieldsMap, filteredAddressDataForMap);
                var overlays = {};
                var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(addressFieldsMap);
                overlays = Object.assign(storeOverlays, addressOverlays);
                overlaysNames = Object.keys(overlays);
                overlaysNames.sort(sorter);
                overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));
                //ponderApp.showHideLayers(addressFieldsMap)
                //ponderApp.updateOverlaysLabel();
                ponderApp.rebuildMapOverlaysData(addressFieldsMap);
                ponderApp.updateOverlaysLabel();

                addressFieldsMap.on('dragend', function () {
                    currentCenter = addressFieldsMap.getCenter();
                });

                addressFieldsMap.on('click', async function (e) {
                    const closestLocation = ponderApp.closest(addressFieldsMap.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                    if (closestLocation && closestLocation.p.minZoomVisibility <= addressFieldsMap.getZoom() 
                                && addressFieldsMap.getZoom() <= closestLocation.p.maxZoomVisibility) {
                        ponderApp.markerTypes[closestLocation.p.markerType].clicked(addressFieldsMap, closestLocation);
                    }
                });

                //set bounds
                const allAddresses = filteredAddressDataForMap;
                let allAddressPoints = new L.featureGroup();
                for (i in allAddresses) {
                    const loc = [allAddresses[i].LATITUDE, allAddresses[i].LONGITUDE];
                    marker = new L.Marker(new L.latLng(loc));
                    allAddressPoints.addLayer(marker);
                }
                const bounds = allAddressPoints.getBounds().pad(0.1);
                addressFieldsMap.fitBounds(bounds);

                $('#showDataModal_Searchtable').dataTable().fnDestroy();
                //var table = $('#showDataModal_Searchtable');

                // begin first table
                var table = $('#showDataModal_Searchtable').DataTable({
                    data: addressData,
                    paging: true,
                    lengthChange: false,
                    pageLength: 5,
                    //scrollY: '200px',
                    scrollCollapse: true,
                    scrollX: true,
                    sort: false,
                    dom: 'Brtlifp',
                    buttons: [
                        {
                            extend: 'csv',
                            className: 'btn btn-primary search-export-addresses-to-csv-5',
                        },
                        {
                            text: 'Export To Excel',
                            className: 'btn btn-primary search-export-addresses', titleAttr: 'Export To Excel', title: 'Export To Excel',
                            action: function (e, dt, node, config) {
                                // return if limited users able to access the "Export To Excel" button
                                if (Access != "Unlimited") {
                                    return;
                                }
                                $(".search-export-addresses").attr("disabled", "disabled");
                                $(".search-export-addresses-spinner").show();
                                $('.buttons-csv.search-export-addresses-to-csv-5').click();
                                setTimeout(() => {
                                    $(".search-export-addresses-spinner").hide();
                                    $(".search-export-addresses").removeAttr("disabled");
                                }, 2000);
                            }
                        },
                        {
                            className: 'search-export-addresses-spinner',
                            text: '<img src="../ajax-loader_2.gif" />',
                        },
                    ],
                    columnDefs: [
                        { className: 'text-left', targets: [1, 2, 3, 4] },
                        { className: 'text-center', targets: [0, 5, 6, 7, 8, 9, 10] },
                    ],
                    columns: [
                        { 'data': 'HOUSE_NUMBER' },
                        { 'data': 'PREFIX' },
                        { 'data': 'UNIT_NUMBER' },
                        { 'data': 'STREET_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'STATE' },
                        { 'data': 'ZIP' },
                        { 'data': 'HYPERGIG' },
                        { 'data': 'REGREEN' },
                        { 'data': 'ADSL' },
                        { 'data': 'CSI_ELIGIBLE' },
                        { 'data': 'WIRELESS_SCORE' },
                        { 'data': 'CUSTOMER' },
                        { 'data': 'ADJUSTED_DWELLING_TYPE' },
                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' }

                    ],
                    initComplete: function () {
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        // hide "Export To Excel" button for limited users
                        if (Access != "Unlimited") {
                            $(".search-export-addresses").hide();
                        }
                        $(".search-export-addresses-to-csv-5").hide();
                        $(".search-export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".search-export-addresses-spinner").hide();
                    },
                    "createdRow": function (row, data, dataIndex) {
                        if (data["LATITUDE"] == "0" || data["LONGITUDE"] == "0") {
                            $(row).addClass('highlightDataTableRow');
                        }
                    },
                });

                //$('#showDataModal_Searchtable tr').off().on('click', function () {
                //    addressFieldsMap.closePopup();

                $('#showDataModal_Searchtable tbody').off().on('click', 'tr', function () {
                    addressFieldsMap.closePopup();

                    var row_clicked = table.row(this);
                    //var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#showDataModal_Searchtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#showDataModal_Searchtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    if (latitudeClicked == "0" || longitudeClicked == "0") {
                        return;
                    }
                    var loc = [latitudeClicked, longitudeClicked];

                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    let pane = addressFieldsMap.getPane("marker title");
                    if (!pane) {
                        pane = addressFieldsMap.createPane("marker title");
                        pane.style.zIndex = 800;
                    }

                    if (SearchModalLayerGroup) {
                        SearchModalLayerGroup.removeFrom(addressFieldsMap);
                    }

                    SearchModalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions), pane });
                    SearchModalLayerGroup.addLayer(marker);
                    SearchModalLayerGroup.addTo(addressFieldsMap);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .0001
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),
                        bounds = new L.LatLngBounds(southWest, northEast);
                    addressFieldsMap.fitBounds(bounds, { padding: [.00, .00] });
                    setTimeout(function () {
                        SearchModalLayerGroup.removeFrom(addressFieldsMap);
                    }, 2000);
                });

                //$('#showDataModal_Searchtable tr').hover(function () {
                //    $(this).addClass('DT_highlight DT_pointer');
                //}, function () {
                //    $(this).removeClass('DT_highlight DT_pointer');
                //}
                //);

                $('#showDataModal_Searchtable tbody').on('mouseenter mouseleave', 'tr', function (e) {
                    if (e.type === 'mouseenter') {
                        var row_highlight = table.row(this);
                        $(this).addClass('DT_highlight DT_pointer');
                        console.log('highlight row event fired');
                    }
                    else {
                        var row_highlight = table.row(this);
                        $(this).removeClass('DT_highlight DT_pointer');
                    }
                });

            }

            //function loadMapSearchTable(dataInput) {
            //    //console.log('loadMapSearchTable Start');
            //    //console.log('dataInput: ' + dataInput);

            //    var data = dataInput.filter(function (el) {
            //        return (el.SHOW_MAP == "SHOW");
            //    });

            //    //console.log('data: ' + data);

            //    $('#showDataModal_Searchtable').dataTable().fnDestroy(); //destroy old table

            //    var table = $('#showDataModal_Searchtable');

            //    // begin first table
            //    table.DataTable({
            //        //responsive: true,
            //        data: data,
            //        paging: false,
            //        //deferRender: true,
            //        scrollY: '300px',
            //        scrollCollapse: true,
            //        scrollX: true,
            //        //scroller: true,
            //        sort: false,
            //        //order: [[4, "desc"]],
            //        dom: 'frtip',
            //        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
            //        columnDefs: [
            //            { className: 'text-left', targets: [1, 2, 3, 4] },
            //            { className: 'text-center', targets: [0, 5, 6, 7, 8, 9] },
            //        ],
            //        columns: [
            //            { 'data': 'HOUSE_NUMBER' },
            //            { 'data': 'PREFIX' },
            //            { 'data': 'STREET_NAME' },
            //            { 'data': 'CITY' },
            //            { 'data': 'STATE' },
            //            { 'data': 'ZIP' },
            //            { 'data': 'WIRELESS_SCORE' },
            //            { 'data': 'CUSTOMER_COUNT' },
            //            { 'data': 'OPPORTUNITY_COUNT' },
            //            //{ 'data': 'SHOW_SERVICE_STATUS' },
            //            { 'data': 'ADJUSTED_DWELLING_TYPE' },
            //            { 'data': 'LATITUDE', visible: false },
            //            { 'data': 'LONGITUDE', visible: false }

            //        ],

            //        initComplete: function () {
            //            this.api().columns().header().each(function (th) {
            //                $(th).removeClass("sorting_asc");
            //                $(th).removeClass("sorting");
            //            });
            //        },

            //    });

            //    $('#showDataModal_Searchtable tr').off().on('click', function () {

            //        mapModal.closePopup();

            //        var row_clicked = $(this).closest('tr');
            //        var latitudeClicked = $('#showDataModal_Searchtable').DataTable().row(row_clicked).data()['LATITUDE'];
            //        var longitudeClicked = $('#showDataModal_Searchtable').DataTable().row(row_clicked).data()['LONGITUDE'];
            //        console.log("latitudeClicked: " + latitudeClicked);
            //        console.log("longitudeClicked: " + longitudeClicked);

            //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
            //        var loc = [latitudeClicked, longitudeClicked];
            //        markerOptions = {
            //            iconShape: 'doughnut',
            //            iconSize: [20, 20],
            //            borderWidth: 3,
            //            borderColor: '#ff0000'
            //        };

            //        if (SearchModalLayerGroup) {
            //            SearchModalLayerGroup.removeFrom(mapModal);
            //        }

            //        SearchModalLayerGroup = L.layerGroup();
            //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
            //        SearchModalLayerGroup.addLayer(marker);
            //        SearchModalLayerGroup.addTo(mapModal);

            //        var NE_lat = Number(latitudeClicked);
            //        var NE_lng = Number(longitudeClicked);
            //        var add1 = .0001
            //        var NE_lat_1 = NE_lat + add1;
            //        var NE_lng_1 = NE_lng + add1;

            //        var SW_lat = Number(latitudeClicked);
            //        var SW_lng = Number(longitudeClicked);
            //        var add1 = .0001
            //        var SW_lat_1 = SW_lat - add1;
            //        var SW_lng_1 = SW_lng - add1;

            //        var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
            //            northEast = new L.LatLng(NE_lat_1, NE_lng_1),

            //            bounds = new L.LatLngBounds(southWest, northEast);

            //        mapModal.fitBounds(bounds, { padding: [.00, .00] });

            //        setTimeout(function () {
            //            SearchModalLayerGroup.removeFrom(mapModal);
            //        }, 2000);
            //        //}
            //    });

            //    $('#showDataModal_Searchtable tr').hover(function () {
            //        $(this).addClass('DT_highlight DT_pointer');
            //    }, function () {
            //        $(this).removeClass('DT_highlight DT_pointer');
            //    }
            //    );

            //}

            //function searchMap(searchResults) {

            //    var All_Locations = searchResults;

            //    var ATT_FiberCustomer = searchResults.filter(function (el) {
            //        return (el.SHOW_SERVICE_STATUS == "InService" && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW");
            //    });
            //    var ATT_Fiber = searchResults.filter(function (el) {
            //        return (el.SHOW_SERVICE_STATUS == null && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW");
            //    });
            //    var MDU_FiberCustomer = searchResults.filter(function (el) {
            //        return (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW" && el.OPPORTUNITY_COUNT == 0);
            //    });
            //    var MDU_Fiber = searchResults.filter(function (el) {
            //        return (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW" && el.OPPORTUNITY_COUNT > 0);
            //    });

            //    var ATT_FiberCustomerPoints = new L.featureGroup();
            //    var ATT_FiberPoints = new L.featureGroup();
            //    var MDU_FiberCustomerPoints = new L.featureGroup();
            //    var MDU_FiberPoints = new L.featureGroup();
            //    var All_LocationsPoints = new L.featureGroup();

            //    for (i in ATT_FiberCustomer) {
            //        var popup =
            //            //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +                        
            //            '<b>Address:</b> ' + ATT_FiberCustomer[i].HOUSE_NUMBER + ' ' + ATT_FiberCustomer[i].PREFIX + ' ' + ATT_FiberCustomer[i].STREET_NAME +
            //            '<br/><b>City, State Zip:</b> ' + ATT_FiberCustomer[i].CITY + ', ' + ATT_FiberCustomer[i].STATE + ' ' + ATT_FiberCustomer[i].ZIP +
            //            '<br/><b>PSA Wireless Score:</b> ' + ATT_FiberCustomer[i].WIRELESS_SCORE +
            //            '<br/><b>Customer Category:</b> ' + 'AT&T Fiber Customer',

            //            loc = [ATT_FiberCustomer[i].LATITUDE, ATT_FiberCustomer[i].LONGITUDE],	//position found
            //            ATT_FiberCustomerTableoptions = {
            //                iconShape: 'doughnut',
            //                iconSize: [12, 12],
            //                borderWidth: 4,
            //                borderColor: '#00cc00'
            //            };

            //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberCustomerTableoptions) });
            //        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
            //        //marker = new L.Marker(new L.latLng(loc), markerOptions);
            //        marker.setOpacity(.7);
            //        marker.bindPopup(popup, { maxWidth: 500 });
            //        ATT_FiberCustomerPoints.addLayer(marker);
            //    }

            //    for (i in ATT_Fiber) {
            //        var popup =
            //            //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +

            //            '<b>Address:</b> ' + ATT_Fiber[i].HOUSE_NUMBER + ' ' + ATT_Fiber[i].PREFIX + ' ' + ATT_Fiber[i].STREET_NAME +
            //            '<br/><b>City, State Zip:</b> ' + ATT_Fiber[i].CITY + ', ' + ATT_Fiber[i].STATE + ' ' + ATT_Fiber[i].ZIP +
            //            '<br/><b>PSA Wireless Score:</b> ' + ATT_Fiber[i].WIRELESS_SCORE +
            //            '<br/><b>Customer Category:</b> ' + 'AT&T Fiber Prospect',

            //            loc = [ATT_Fiber[i].LATITUDE, ATT_Fiber[i].LONGITUDE],	//position found
            //            ATT_FiberTableoptions = {
            //                iconShape: 'doughnut',
            //                iconSize: [12, 12],
            //                borderWidth: 4,
            //                borderColor: '#21b2ff'
            //            };

            //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberTableoptions) });
            //        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
            //        //marker = new L.Marker(new L.latLng(loc), markerOptions);
            //        marker.setOpacity(.7);
            //        marker.bindPopup(popup, { maxWidth: 500 });
            //        ATT_FiberPoints.addLayer(marker);
            //    }

            //    for (i in MDU_FiberCustomer) {
            //        var popup =
            //            //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +

            //            '<b>Address:</b> ' + MDU_FiberCustomer[i].HOUSE_NUMBER + ' ' + MDU_FiberCustomer[i].PREFIX + ' ' + MDU_FiberCustomer[i].STREET_NAME +
            //            '<br/><b>City, State Zip:</b> ' + MDU_FiberCustomer[i].CITY + ', ' + MDU_FiberCustomer[i].STATE + ' ' + MDU_FiberCustomer[i].ZIP +
            //            '<br/><b>PSA Wireless Score:</b> ' + MDU_FiberCustomer[i].WIRELESS_SCORE +
            //            '<br/>' + MDU_FiberCustomer[i].CUSTOMER_COUNT + ' AT&T Fiber Customers at this MDU' +
            //            '<br/><b>No AT&T Fiber Prospects at this MDU</b>',

            //            loc = [MDU_FiberCustomer[i].LATITUDE, MDU_FiberCustomer[i].LONGITUDE],	//position found
            //            ATT_FiberTableoptions = {
            //                iconShape: 'rectangle-dot',
            //                iconSize: [16, 16],
            //                borderWidth: 4,
            //                borderColor: '#00cc00'
            //            };

            //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberTableoptions) });
            //        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
            //        //marker = new L.Marker(new L.latLng(loc), markerOptions);
            //        marker.setOpacity(.7);
            //        marker.bindPopup(popup, { maxWidth: 500 });
            //        MDU_FiberCustomerPoints.addLayer(marker);
            //    }

            //    for (i in MDU_Fiber) {
            //        var prospectWording = 'Prospects';
            //        if (MDU_Fiber[i].OPPORTUNITY_COUNT == 1) {
            //            prospectWording = 'Prospect';
            //        }
            //        var customerWording = 'Customers';
            //        if (MDU_Fiber[i].CUSTOMER_COUNT == 1) {
            //            customerWording = 'Customer';
            //        }
            //        var popup =
            //            //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +

            //            '<b>Address:</b> ' + MDU_Fiber[i].HOUSE_NUMBER + ' ' + MDU_Fiber[i].PREFIX + ' ' + MDU_Fiber[i].STREET_NAME +
            //            '<br/><b>City, State Zip:</b> ' + MDU_Fiber[i].CITY + ', ' + MDU_Fiber[i].STATE + ' ' + MDU_Fiber[i].ZIP +
            //            '<br/><b>PSA Wireless Score:</b> ' + MDU_Fiber[i].WIRELESS_SCORE +
            //            '<br/>' + MDU_Fiber[i].CUSTOMER_COUNT + ' AT&T Fiber ' + customerWording + ' at this MDU' +
            //            '<br/><b>' + MDU_Fiber[i].OPPORTUNITY_COUNT + ' AT&T Fiber ' + prospectWording + ' at this MDU</b>' ,

            //            loc = [MDU_Fiber[i].LATITUDE, MDU_Fiber[i].LONGITUDE],	//position found
            //            ATT_FiberTableoptions = {
            //                iconShape: 'rectangle-dot',
            //                iconSize: [16, 16],
            //                borderWidth: 4,
            //                borderColor: '#21b2ff'
            //            };

            //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberTableoptions) });
            //        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
            //        //marker = new L.Marker(new L.latLng(loc), markerOptions);
            //        marker.setOpacity(.7);
            //        marker.bindPopup(popup, { maxWidth: 500 });
            //        MDU_FiberPoints.addLayer(marker);
            //    }

            //    for (i in All_Locations) {
            //        var loc = [All_Locations[i].LATITUDE, All_Locations[i].LONGITUDE];	//position found                        

            //        marker = new L.Marker(new L.latLng(loc));
            //        All_LocationsPoints.addLayer(marker);
            //    }

            //    document.getElementById('mySearchMap').innerHTML = "<div id='searchMap' style='height: 400px;'></div>";

            //    var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
            //        id: 'arcgis.sat',
            //        maxZoom: 19,
            //        zIndex: 1,
            //        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
            //        subdomains: ['a', 'b', 'c']
            //    }),
            //        streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            //            id: 'osm.streets',
            //            maxZoom: 19,
            //            zIndex: 1,
            //            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
            //            subdomains: ['a', 'b', 'c']
            //        });

            //    var baseLayers = {
            //        "Streets": streets,
            //        "Satellite": sat
            //    };

            //    mapModalOptions = {
            //        attributionControl: false,
            //        preferCanvas: true,
            //        center: [39.73, -104.99],
            //        zoom: 10,
            //        minZoom: 3,
            //        //zoomControl: false,
            //        layers: [],
            //        fullscreenControl: true,
            //        fullscreenControlOptions: {
            //            position: 'topleft'
            //        }
            //    };

            //    mapModalOptions.layers.push(streets);
            //    if (ATT_FiberCustomer.length > 0) { mapModalOptions.layers.push(ATT_FiberCustomerPoints); }
            //    if (ATT_Fiber.length > 0) { mapModalOptions.layers.push(ATT_FiberPoints); }
            //    if (MDU_FiberCustomer.length > 0) { mapModalOptions.layers.push(MDU_FiberCustomerPoints); }
            //    if (MDU_Fiber.length > 0) { mapModalOptions.layers.push(MDU_FiberPoints); }

            //    mapModal = L.map("searchMap", mapModalOptions);

            //    L.control.scale({ metric: false, position: 'bottomright' }).addTo(mapModal);

            //    var overlays = {};

            //    if (ATT_FiberCustomer.length > 0) { overlays["AT&T Fiber Customer"] = ATT_FiberCustomerPoints; }
            //    if (ATT_Fiber.length > 0) { overlays["AT&T Fiber Prospect"] = ATT_FiberPoints; }
            //    if (MDU_FiberCustomer.length > 0) { overlays["MDU All AT&T Fiber Customers"] = MDU_FiberCustomerPoints; }
            //    if (MDU_Fiber.length > 0) { overlays["MDU with AT&T Fiber Prospects"] = MDU_FiberPoints; }

            //    L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);

            //    //var featureGroup = L.featureGroup(ATT_FiberPoints).addTo(map);

            //    var bounds = All_LocationsPoints.getBounds().pad(0.1);
            //    mapModal.fitBounds(bounds);

            //    //mapModal.fitBounds(ATT_FiberPoints.getBounds(), { padding: [50, 50] });
            //    //var bounds = L.latLngBounds(ATT_FiberPoints);
            //    //mapModal.fitBounds(bounds);//works!
            //    //mapModal.fitBounds(ATT_FiberPoints.getBounds());
            //    ponderApp.updateOverlaysLabel();
            //    mapModal.invalidateSize();

            //}

            function AlertAddressExport() {
                alert('Exporting Addresses and Unit Numbers can take up to 15 seconds. Thank you for your patience. <br> Please respect the sensitivity of this data.');
            }

            function SubmitButtonClick() {
                //clear any filters from previous button clicks
                CMALayerState = 0;
                CountyLayerState = 0;
                ZipLayerState = 0;
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();

                //console.log("SubmitButtonClick function: " + market);

                //check if anything has changed since last submitbuttonclick
                if (
                    <%--geoTypeStored == $('#<%= ddlGeo.ClientID %> option:selected').text()--%>
                    //&&
                    marketStored == $('#<%= ddlMarket.ClientID %> option:selected').text()) {
                    //console.log('Button Click without Pulldown Change');
                }

                else {
                    var groupByLabel = document.getElementById("<%= lblGroupBy.ClientID %>");
                    const ddlMarketSelectedItemValue = $('#<%= ddlMarket.ClientID %> option:selected').val();
                    let marketTypeValue;
                    if (ddlMarketSelectedItemValue == '%') {
                        marketType = 'NATIONAL';
                        groupByLabel.innerHTML = "Group Nation By: &nbsp;&nbsp;";
                        $("#ddlGroupBy").val('CMA');
                    } else if (ddlMarketSelectedItemValue == 'EAST' | ddlMarketSelectedItemValue == 'WEST') {
                        marketType = 'REGION';
                        groupByLabel.innerHTML = "Group Region By: &nbsp;&nbsp;";
                        $("#ddlGroupBy").val('CMA');
                    } else {
                        marketType = 'MARKET';
                        groupByLabel.innerHTML = "Group Market By: &nbsp;&nbsp;";
                    }

                    if (marketType == 'MARKET') {
                        // set top25PSAsDataset and top25MDUsDataset values whenever market is updated
                        setTimeout(async function () {
                            let myParamsObject = {
                                type: "Get_Top25_PSAs",
                                marketVariable: market
                            };
                            let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                            top25PSAsDataset = JSON.parse(data.d);
                            myParamsObject = {
                                type: "Get_Top25_MDUs",
                                marketVariable: market
                            };
                            data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                            top25MDUsDataset = JSON.parse(data.d);
                        });
                    }

                    <%--var geo = $('#<%= ddlGeo.ClientID %> option:selected').text();--%>
                    //var geo = "SALES";
                    var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var market = $('#<%= ddlMarket.ClientID %> option:selected').val();

                    //console.log("getFilterCriteria function: " + geo);
                    //console.log("getFilterCriteria function: " + market_long);
                    //console.log("getFilterCriteria function: " + market);

                    <%--var geoSpan = $('#<%= ddlGeo.ClientID %> option:selected').text();--%>
                    //var geoSpan = "SALES";
                    //var geoClasses = document.getElementsByClassName('current_geo');
                    //for (var i = 0; i < geoClasses.length; i++) {
                    //    geoClasses[i].innerHTML = geoSpan;
                    //}

                    var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var marketClasses = document.getElementsByClassName('current_market');
                    for (var i = 0; i < marketClasses.length; i++) {
                        marketClasses[i].innerHTML = marketspan;
                    }

                    //update stored pulldown values
                    <%--geoTypeStored = $('#<%= ddlGeo.ClientID %> option:selected').text();--%>
                    //geoTypeStored = "SALES";
                    marketStored = $('#<%= ddlMarket.ClientID %> option:selected').text();

                    getFilterCriteria();

                }

            }

            //show and hide divs, grab variable info, trigger the UpdateHomePage function
            function getFilterCriteria() {
                //console.log('start2');
                //Hide tabs
                $('.oneButton').removeClass('active');
                $('#zipfooter').hide();
                //$('#zipfooter2').hide();
                //$('#zipfooter3').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#cmaTableDiv').hide();
                $('#MapDiv').hide();
                $('#LOADING1').show();
                $('#ddlMarket').attr("disabled", "disabled");
                $('#ddlGroupBy').attr("disabled", "disabled");
                //$('#ddlRegionGroupBy').attr("disabled", "disabled");
                //$('#ddlMarketGroupBy').attr("disabled", "disabled");
                $('#ddlHeatTheme').attr("disabled", "disabled");

                //Show tabs
                //$('#LOADING_Quad1_tab' + activeTabNumber).show();

                //trigger chain of functions to get data
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var marketGeoStore = marketGeo; //This will handle when the market names are different in the store file
                var marketGeoJSONName = marketGeo; //This will handle when market names are different in the geo Json files
                var marketType = '';
                var GroupBy = '';

                if (groupGeo == 'SALES') {
                    if (marketGeo == '%') {
                        marketType = 'NATIONAL';
                        GroupBy = 'CMA';
                    } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                        marketType = 'REGION';
                        //GroupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                        GroupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();
                    } else {
                        marketType = 'MARKET';
                        //GroupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();
                        GroupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();

                        if (marketGeo == 'GEORGIA / SOUTH CAROLINA') {
                            marketGeoStore = 'GEORGIA SOUTH CAROLINA';
                        } if (marketGeo == 'NTX') {
                            marketGeoStore = 'NORTH TEXAS';
                        } if (marketGeo == 'STX') {
                            marketGeoStore = 'SOUTH TEXAS';
                        } if (marketGeo == 'NEW YORK / NEW JERSEY') {
                            marketGeoStore = 'NEW YORK NEW JERSEY';
                        } if (marketGeo == 'PR/VI') {
                            marketGeoStore = 'PUERTO RICO VIRGIN ISLAND';
                        } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                            marketGeoStore = 'OHIO/PENNSYLVANIA';
                        } if (marketGeo == 'MID-ATLANTIC') {
                            marketGeoStore = 'MID-ATLANTIC STATES';
                        } if (marketGeo == 'ROCKY MOUNTAIN') {
                            marketGeoStore = 'ROCKY MOUNTAINS';
                        }

                        if (marketGeo == 'GEORGIA / SOUTH CAROLINA') {
                            marketGeoJSONName = 'GEORGIA SOUTH CAROLINA';
                        } if (marketGeo == 'PR/VI') {
                            marketGeoJSONName = 'PR VI';
                        } if (marketGeo == 'NEW YORK / NEW JERSEY') {
                            marketGeoJSONName = 'NEW YORK NEW JERSEY';
                        } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                            marketGeoJSONName = 'OHIOPENNSYLVANIA';
                        }




                    }
                }

                UpdateHomePage(marketGeo, marketGeoStore, marketGeoJSONName, marketType, GroupBy);


            }

            //The Group By pulldown has been changed by the user - This changes everything, the map, the tables, the summary boxes. In theory could keep same store data?
            function GroupByChange() {
                // var GroupBySelection = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                //console.log('GroupBySelection' + GroupBySelection);
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                    GroupBy = 'CMA';
                } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                    //GroupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                    GroupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();
                } else {
                    marketType = 'MARKET';
                    //GroupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();
                    GroupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();
                }

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == '%') {
                    marketGeoText = "National";
                } if (marketGeoText == 'EAST' | marketGeoText == 'WEST') {
                    marketGeoText = marketGeoText + " REGION";
                } if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }

                if (GroupBy == 'CMA') {
                    document.getElementById('TableSubtitle3').innerHTML = ' CMAs';
                } else if (GroupBy == 'COUNTY') {
                    document.getElementById('TableSubtitle3').innerHTML = ' Counties';
                } else if (GroupBy == 'ZIP') {
                    document.getElementById('TableSubtitle3').innerHTML = ' Zips';
                }

                document.getElementById('TableSubtitle1').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text();
                getFilterCriteria();
            }

            function SortHomeTable() {
                const ddlMarketValue = $("#ddlMarket :selected").val();
                let groupBy;
                //let marketType;
                let dataTableName;
                if (ddlMarketValue == '%') {
                    //marketType = 'NATIONAL';
                    groupBy = 'CMA';
                } else if (ddlMarketValue == 'EAST' || ddlMarketValue == 'WEST') {
                    //marketType = 'REGION';
                    //groupBy = $("#ddlRegionGroupBy :selected").val();
                    groupBy = $("#ddlGroupBy :selected").val();
                } else {
                    //marketType = 'MARKET';
                    //groupBy = $("#ddlMarketGroupBy :selected").val();
                    groupBy = $("#ddlGroupBy :selected").val();
                }
                if (groupBy == "ZIP")
                    dataTableName = "#zipCode_datatable";
                else if (groupBy == "COUNTY")
                    dataTableName = "#county_datatable";
                else
                    dataTableName = "#cma_datatable";
                let columnIndex;
                let sortBy = 'desc';
                const ddlSortByText = $("#ddlSortBy :selected").text();
                const dataTable = $(dataTableName).DataTable();

                ShowHideHomeTableColumns(dataTable, groupBy);
                if (ddlSortByText == "Highest Fiber Penetration") {
                    if (groupBy == 'CMA')
                        columnIndex = 4;
                    else if (groupBy == "COUNTY" || groupBy == "ZIP")
                        columnIndex = 3;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                else if (ddlSortByText == "Lowest Fiber Penetration") {
                    sortBy = 'asc';
                    if (groupBy == 'CMA') {
                        columnIndex = 4;
                        dataTable.order([[5, 'desc'], [columnIndex, sortBy]]).draw();
                    }
                    else if (groupBy == "COUNTY" || groupBy == "ZIP") {
                        columnIndex = 3;
                        dataTable.order([[4, 'desc'], [columnIndex, sortBy]]).draw();
                    }
                }
                else if (ddlSortByText == "Highest Fiber Customers") {
                    if (groupBy == 'CMA')
                        columnIndex = 8;
                    else if (groupBy == "COUNTY" || groupBy == "ZIP")
                        columnIndex = 7;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                else if (ddlSortByText == "Highest Fiber Opportunity") {
                    if (groupBy == 'CMA')
                        columnIndex = 9;
                    else if (groupBy == "COUNTY" || groupBy == "ZIP")
                        columnIndex = 8;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                else if (ddlSortByText == "Highest Copper Upgrade") {
                    if (groupBy == 'CMA')
                        columnIndex = 10;
                    else if (groupBy == "COUNTY" || groupBy == "ZIP")
                        columnIndex = 9;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                else if (ddlSortByText == "Highest Elderly Percentage") {
                    if (groupBy == 'CMA')
                        columnIndex = 3;
                    else if (groupBy == "COUNTY" || groupBy == "ZIP")
                        columnIndex = 2;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                else if (ddlSortByText == "Lowest Elderly Percentage") {
                    sortBy = 'asc';
                    if (groupBy == 'CMA')
                        columnIndex = 3;
                    else if (groupBy == "COUNTY" || groupBy == "ZIP")
                        columnIndex = 2;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                // Remove a class from columns with .sorting_desc class
                dataTable.columns('.sorting_desc').header().to$().removeClass('sorting_desc');
                dataTable.columns('.sorting_asc').header().to$().removeClass('sorting_asc');
            }

            function SortCopperUpgradeTable(dropDownListID) {
                let dataTableName;
                if (dropDownListID == "ddlCMACopperUpgradeSortBy")
                    dataTableName = "#CMAModalCopperUpgrade_datatable";
                else if (dropDownListID == "ddlCountyCopperUpgradeSortBy")
                    dataTableName = "#countyModalCopperUpgrade_datatable";
                else
                    dataTableName = "#zipModalCopperUpgrade_datatable";
                let columnIndex;
                let sortBy = 'desc';
                const ddlSortByText = $("#" + dropDownListID + " option:selected").text();
                const dataTable = $(dataTableName).DataTable();
                if (ddlSortByText == "Highest Fiber Opportunity") {
                    columnIndex = 6;
                    //dataTable.order([columnIndex, sortBy]).draw();
                    dataTable.order([[columnIndex, sortBy], [9, 'asc']]).draw();
                }
                else if (ddlSortByText == "Highest Fiber Customers") {
                    columnIndex = 5;
                    //dataTable.order([columnIndex, sortBy]).draw();                    
                    dataTable.order([[columnIndex, sortBy], [9, 'asc']]).draw();
                }
                else if (ddlSortByText == "Highest Fiber Penetration") {
                    columnIndex = 7;
                    //dataTable.order([columnIndex, sortBy]).draw();
                    dataTable.order([[columnIndex, sortBy], [9, 'asc']]).draw();
                }
                else if (ddlSortByText == "Lowest Fiber Penetration") {
                    sortBy = 'asc';
                    columnIndex = 7;
                    //dataTable.order([columnIndex, sortBy]).draw();
                    dataTable.order([[columnIndex, sortBy], [9, 'asc']]).draw();
                }
                else if (ddlSortByText == "Highest Copper Upgrade") {
                    columnIndex = 8;
                    //dataTable.order([columnIndex, sortBy]).draw();
                    dataTable.order([[columnIndex, sortBy], [9, 'asc']]).draw();
                }
                else if (ddlSortByText == "Market Rank") {
                    sortBy = 'asc';
                    columnIndex = 9;
                    dataTable.order([columnIndex, sortBy]).draw();
                }
                // Remove a class from columns with .sorting_desc class
                dataTable.columns('.sorting_desc').header().to$().removeClass('sorting_desc');
                dataTable.columns('.sorting_asc').header().to$().removeClass('sorting_asc');
            }

            function FilterHomeTable() {
                const ddlMarketValue = $("#ddlMarket :selected").val();
                let groupBy;
                let dataTableName;
                let dataTable;
                if (ddlMarketValue == '%') {
                    groupBy = 'CMA';
                } else if (ddlMarketValue == 'EAST' || ddlMarketValue == 'WEST') {
                    //groupBy = $("#ddlRegionGroupBy :selected").val();
                    groupBy = $("#ddlGroupBy :selected").val();
                } else {
                    //groupBy = $("#ddlMarketGroupBy :selected").val();
                    groupBy = $("#ddlGroupBy :selected").val();
                }

                const ddlHeatThemeValue = $("#ddlHeatTheme :selected").val();
                const heatMapConfig = ponderApp.heatMapConfig()[ddlHeatThemeValue]
                if (groupBy == 'ZIP') {
                    const tableData = homePageData.zipCodeTable;
                    let filteredTableData;
                    if (ZipLayerState == 0) { filteredTableData = tableData; }
                    else if (ZipLayerState == 1) { filteredTableData = heatMapConfig.button1.filter(tableData); }
                    else if (ZipLayerState == 2) { filteredTableData = heatMapConfig.button2.filter(tableData); }
                    else if (ZipLayerState == 3) { filteredTableData = heatMapConfig.button3.filter(tableData); }
                    else if (ZipLayerState == 4) { filteredTableData = heatMapConfig.button4.filter(tableData); }
                    zipCodeTable(filteredTableData, null, null, null, null);
                    dataTableName = "#zipCode_datatable";
                    dataTable = $(dataTableName).DataTable();
                    ShowHideHomeTableColumns(dataTable, groupBy);
                }
                else if (groupBy == 'COUNTY') {
                    const tableData = homePageData.countyTable;
                    let filteredTableData;
                    if (CountyLayerState == 0) { filteredTableData = tableData; }
                    else if (CountyLayerState == 1) { filteredTableData = heatMapConfig.button1.filter(tableData); }
                    else if (CountyLayerState == 2) { filteredTableData = heatMapConfig.button2.filter(tableData); }
                    else if (CountyLayerState == 3) { filteredTableData = heatMapConfig.button3.filter(tableData); }
                    else if (CountyLayerState == 4) { filteredTableData = heatMapConfig.button4.filter(tableData); }
                    countyTable(filteredTableData, null, null, null, null);
                    dataTableName = "#county_datatable";
                    dataTable = $(dataTableName).DataTable();
                    ShowHideHomeTableColumns(dataTable, groupBy);
                }
                else {
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                    const tableData = homePageData.cmaTable;
                    let filteredTableData;
                    if (CMALayerState == 0) { filteredTableData = tableData; }
                    else if (CMALayerState == 1) { filteredTableData = heatMapConfig.button1.filter(tableData); }
                    else if (CMALayerState == 2) { filteredTableData = heatMapConfig.button2.filter(tableData); }
                    else if (CMALayerState == 3) { filteredTableData = heatMapConfig.button3.filter(tableData); }
                    else if (CMALayerState == 4) { filteredTableData = heatMapConfig.button4.filter(tableData); }
                    cmaTable(filteredTableData, null, null, null, null);
                    dataTableName = "#cma_datatable";
                    dataTable = $(dataTableName).DataTable();
                    ShowHideHomeTableColumns(dataTable, groupBy);
                }
            }

<%--            function UpdateHomeTable() {
                //User changed the Sort Order By of the table, which doesnt affect the map, the themes, or any of the show hides.
                //Grab the required variables and rerun the ajax call for table creation, which is based on the Group By
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var marketType = '';''
                var GroupBy = '';
                var CategoryFilter = '%';
                var CategoryLayerState = 0;

                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                    GroupBy = 'CMA';

                } else if (marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                    GroupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();

                } else {
                    marketType = 'MARKET';
                    GroupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();
                }
                var SortByVariable = $('#<%= ddlSortBy.ClientID %> option:selected').val();

                if (GroupBy == 'ZIP') {

                    //Top 50 data is pulled by dynamically grabbing a section of the where clause from heatMapConfig object
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                    var sqlWhereClause = '';
                    if (ZipLayerState == 0) { sqlWhereClause = ''; }
                    else if (ZipLayerState == 1) { sqlWhereClause = heatMapConfig.button1.sqlWhereClause; }
                    else if (ZipLayerState == 2) { sqlWhereClause = heatMapConfig.button2.sqlWhereClause; }
                    else if (ZipLayerState == 3) { sqlWhereClause = heatMapConfig.button3.sqlWhereClause; }
                    else if (ZipLayerState == 4) { sqlWhereClause = heatMapConfig.button4.sqlWhereClause; }

                    //add extra logic so that Lowest Fiber Penetration doesn't show no fiber areas
                    if ($('#<%= ddlSortBy.ClientID %> option:selected').text() === "Lowest Fiber Penetration") {
                        console.log("Lowest Fiber Penetartion - extra filter for fiber available");
                        //sqlWhereClause = sqlWhereClause + ' AND FIBER_AVAILABLE > 0 ';
                    }

                    //CategoryLayerState = ZipLayerState;
                    //if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    //else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    //else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    //else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    //else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    const myParamsObject = {
                        type: "Get_ZipTable_Data",
                        marketVariable: marketGeo,
                        overallCatVariable: sqlWhereClause,
                        orderVariable: SortByVariable
                    };
                    //let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    //data = JSON.parse(data.d)
                    //zipCodeTable(data);

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity.aspx/GetJsonData",
                        data: JSON.stringify({ myParamsObject }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d)
                            zipCodeTable(data, marketGeo, sqlWhereClause, SortByVariable)
                        }
                    });

                }

                else if (GroupBy == 'COUNTY') {

                    //Top 50 data is pulled by dynamically grabbing a section of the where clause from heatMapConfig object
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                    var sqlWhereClause = '';
                    if (CountyLayerState == 0) { sqlWhereClause = ''; }
                    else if (CountyLayerState == 1) { sqlWhereClause = heatMapConfig.button1.sqlWhereClause; }
                    else if (CountyLayerState == 2) { sqlWhereClause = heatMapConfig.button2.sqlWhereClause; }
                    else if (CountyLayerState == 3) { sqlWhereClause = heatMapConfig.button3.sqlWhereClause; }
                    else if (CountyLayerState == 4) { sqlWhereClause = heatMapConfig.button4.sqlWhereClause; }

                    //add extra logic so that Lowest Fiber Penetration doesn't show no fiber areas
                    if ($('#<%= ddlSortBy.ClientID %> option:selected').text() === "Lowest Fiber Penetration") {
                        console.log("Lowest Fiber Penetartion - extra filter for fiber available");
                        //sqlWhereClause = sqlWhereClause + ' AND FIBER_AVAILABLE > 0 ';
                    }

                    //CategoryLayerState = CountyLayerState;
                    //if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    //else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    //else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    //else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    //else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    const myParamsObject = {
                        type: "Get_CountyTable_Data",
                        marketVariable: marketGeo,
                        marketTypeVariable: marketType,
                        overallCatVariable: sqlWhereClause,
                        orderVariable: SortByVariable
                    };


                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity.aspx/GetJsonData",
                        data: JSON.stringify({ myParamsObject }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d)
                            countyTable(data, marketGeo, marketType, sqlWhereClause, SortByVariable);
                        }
                    });
                }

                else { //CMA

                    //CategoryLayerState = CMALayerState;
                    //if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    //else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    //else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    //else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    //else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }


                    //Top 50 data is pulled by dynamically grabbing a section of the where clause from heatMapConfig object
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                    var sqlWhereClause = '';
                    if (CMALayerState == 0) { sqlWhereClause = ''; }
                    else if (CMALayerState == 1) { sqlWhereClause = heatMapConfig.button1.sqlWhereClause; }
                    else if (CMALayerState == 2) { sqlWhereClause = heatMapConfig.button2.sqlWhereClause; }
                    else if (CMALayerState == 3) { sqlWhereClause = heatMapConfig.button3.sqlWhereClause; }
                    else if (CMALayerState == 4) { sqlWhereClause = heatMapConfig.button4.sqlWhereClause; }

                    //add extra logic so that Lowest Fiber Penetration doesn't show no fiber areas
                    if ($('#<%= ddlSortBy.ClientID %> option:selected').text() === "Lowest Fiber Penetration") {
                        console.log("Lowest Fiber Penetartion - extra filter for fiber available");
                        //sqlWhereClause = sqlWhereClause + ' AND FIBER_AVAILABLE > 0 ';
                    }

                    //console.log('UpdateHomeTable CMA Category Filter: ' + CategoryFilter);                    
                    const myParamsObject = {
                        type: "Get_CMATable_Data",
                        marketVariable: marketGeo,
                        marketTypeVariable: marketType,
                        overallCatVariable: sqlWhereClause,
                        orderVariable: SortByVariable
                    };
                    //let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    //data = JSON.parse(data.d);
                    //cmaTable(data);

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity.aspx/GetJsonData",
                        data: JSON.stringify({ myParamsObject }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d)
                            cmaTable(data, marketGeo, marketType, sqlWhereClause, SortByVariable);
                        }
                    });

                }
            }--%>

            //*** NEW UPDATE SALES OPPORTUNITY FUNCTION - TAKES IN PARAMETERS - SAME FUNCTION FOR ALL GEOGRAPHY TYPES



            async function UpdateHomePage(marketGeo, marketGeoStore, marketGeoJSONName, marketType, GroupBy) {
                //console.log('marketGeo' + marketGeo);
                //console.log('marketGeoStore' + marketGeoStore);
                //console.log('marketType' + marketType);
                //console.log('GroupBy' + GroupBy);

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == '%') {
                    marketGeoText = "National";
                } if (marketGeoText == 'EAST' | marketGeoText == 'WEST') {
                    marketGeoText = marketGeoText + " REGION";
                } if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }

                if (GroupBy == 'CMA') {
                    document.getElementById('TableSubtitle3').innerHTML = ' CMAs';
                } else if (GroupBy == 'COUNTY') {
                    document.getElementById('TableSubtitle3').innerHTML = ' Counties';
                } else if (GroupBy == 'ZIP') {
                    document.getElementById('TableSubtitle3').innerHTML = ' Zips';
                }

                document.getElementById('TableSubtitle1').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text();

                //First use Market Type to hide and show the correct Group By ddl, select the correct ajax to grab store data, and trigger GET_MAP_THEME
                //console.log('UpdateHomePage / marketType: ' + marketType);

                if (marketType == 'MARKET') {
                    //$('#ShowHideRegionGroupBy').hide();
                    //$('#ShowHideMarketGroupBy').show();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', false)

                    if (marketGeoStore == 'OHIO PENNSYLVANIA') { marketGeoStore = 'OHIO/PENNSYLVANIA'; }

                    let myParamsObject = {
                        type: "Get_Store_Detail_Market",
                        marketVariable: marketGeoStore,
                    };
                    let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    data = JSON.parse(data.d);
                    appState.storeDataSet.market = data;
                    // Get_Future_PSAs data
                    myParamsObject = {
                        type: "Get_Future_PSAs",
                        marketVariable: marketGeoStore,
                    };
                    let futurePSAData = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    futurePSAData = JSON.parse(futurePSAData.d);
                    console.log('*******futurePSAData*********');
                    console.log(futurePSAData);
                    GET_MAP_THEME_DATA(data, marketType, GroupBy, marketGeoJSONName, futurePSAData);
                }

                else if (marketType == 'REGION') {
                    //$('#ShowHideRegionGroupBy').show();
                    //$('#ShowHideMarketGroupBy').hide();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', false)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)

                    const myParamsObject = {
                        type: "Get_Store_Detail_Region",
                        marketVariable: marketGeoStore,
                    };
                    let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    data = JSON.parse(data.d);
                    appState.storeDataSet.region = data;
                    GET_MAP_THEME_DATA(data, marketType, GroupBy, marketGeoJSONName);
                }

                else { //National
                    //$('#ShowHideRegionGroupBy').hide();
                    //$('#ShowHideMarketGroupBy').hide();
                    $('#ddlGroupBy option[value="CMA"]').prop('disabled', true)
                    $('#ddlGroupBy option[value="COUNTY"]').prop('disabled', true)
                    $('#ddlGroupBy option[value="ZIP"]').prop('disabled', true)

                    const myParamsObject = {
                        type: "Get_Store_Detail_National",
                    };
                    let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    data = JSON.parse(data.d);
                    appState.storeDataSet.national = data;
                    GET_MAP_THEME_DATA(data, marketType, GroupBy, marketGeoJSONName);
                }

                //Use Group by to show hide the appropriate table div, call the ajax to build the table, and to populate the summary stats that show up in the filter buttons
                $("select#ddlSortBy")[0].selectedIndex = 0;
                var SortByVariable = $('#<%= ddlSortBy.ClientID %> option:selected').val();
                var CategoryFilter = '%';
                var CategoryLayerState = 0;

                if (GroupBy == 'ZIP') {

                    $('#zipTableDiv').show();
                    $('#countyTableDiv').hide();
                    $('#cmaTableDiv').hide();


                    //Top 50 data is pulled by dynamically grabbing a section of the where clause from heatMapConfig object
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                    var sqlWhereClause = '';
                    if (ZipLayerState == 0) { sqlWhereClause = ''; }
                    else if (ZipLayerState == 1) { sqlWhereClause = heatMapConfig.button1.sqlWhereClause; }
                    else if (ZipLayerState == 2) { sqlWhereClause = heatMapConfig.button2.sqlWhereClause; }
                    else if (ZipLayerState == 3) { sqlWhereClause = heatMapConfig.button3.sqlWhereClause; }
                    else if (ZipLayerState == 4) { sqlWhereClause = heatMapConfig.button4.sqlWhereClause; }


                    //add extra logic so that Lowest Fiber Penetration doesn't show no fiber areas
                    if ($('#<%= ddlSortBy.ClientID %> option:selected').text() === "Lowest Fiber Penetration") {
                        console.log("Lowest Fiber Penetartion - extra filter for fiber available");
                        sqlWhereClause = sqlWhereClause + ' AND FIBER_AVAILABLE > 0 ';
                    }
                    //CategoryLayerState = ZipLayerState;
                    //if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    //else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    //else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    //else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    //else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    let myParamsObject = {
                        type: "Get_Zip_Summary_Info",
                        marketVariable: marketGeo,
                    };
                    let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    ZIP_SUMMARY_DATA(data);

                    myParamsObject = {
                        type: "Get_ZipTable_Data",
                        marketVariable: marketGeo,
                        overallCatVariable: sqlWhereClause,
                        orderVariable: SortByVariable
                    };
                    data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    data = JSON.parse(data.d);
                    homePageData.zipCodeTable = data;
                    zipCodeTable(data, marketGeo, sqlWhereClause, SortByVariable);
                }

                else if (GroupBy == 'COUNTY') {

                    $('#zipTableDiv').hide();
                    $('#countyTableDiv').show();
                    $('#cmaTableDiv').hide();

                    //Top 50 data is pulled by dynamically grabbing a section of the where clause from heatMapConfig object
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                    var sqlWhereClause = '';
                    if (CountyLayerState == 0) { sqlWhereClause = ''; }
                    else if (CountyLayerState == 1) { sqlWhereClause = heatMapConfig.button1.sqlWhereClause; }
                    else if (CountyLayerState == 2) { sqlWhereClause = heatMapConfig.button2.sqlWhereClause; }
                    else if (CountyLayerState == 3) { sqlWhereClause = heatMapConfig.button3.sqlWhereClause; }
                    else if (CountyLayerState == 4) { sqlWhereClause = heatMapConfig.button4.sqlWhereClause; }


                    //add extra logic so that Lowest Fiber Penetration doesn't show no fiber areas
                    if ($('#<%= ddlSortBy.ClientID %> option:selected').text() === "Lowest Fiber Penetration") {
                        console.log("Lowest Fiber Penetartion - extra filter for fiber available");
                        sqlWhereClause = sqlWhereClause + ' AND FIBER_AVAILABLE > 0 ';
                    }

                    //CategoryLayerState = CountyLayerState;
                    //if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    //else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    //else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    //else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    //else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    let myParamsObject = {
                        type: "Get_County_Summary_Info",
                        marketVariable: marketGeo,
                        marketTypeVariable: marketType,
                    };
                    let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    COUNTY_SUMMARY_DATA(data);

                    myParamsObject = {
                        type: "Get_CountyTable_Data",
                        marketVariable: marketGeo,
                        marketTypeVariable: marketType,
                        overallCatVariable: sqlWhereClause,
                        orderVariable: SortByVariable
                    };
                    data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    data = JSON.parse(data.d);
                    homePageData.countyTable = data;
                    countyTable(data, marketGeo, marketType, sqlWhereClause, SortByVariable);
                }

                else { //CMA
                    $('#zipTableDiv').hide();
                    $('#countyTableDiv').hide();
                    $('#cmaTableDiv').show();

                    //Top 50 data is pulled by dynamically grabbing a section of the where clause from heatMapConfig object
                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                    var sqlWhereClause = '';
                    if (CMALayerState == 0) { sqlWhereClause = ''; }
                    else if (CMALayerState == 1) { sqlWhereClause = heatMapConfig.button1.sqlWhereClause; }
                    else if (CMALayerState == 2) { sqlWhereClause = heatMapConfig.button2.sqlWhereClause; }
                    else if (CMALayerState == 3) { sqlWhereClause = heatMapConfig.button3.sqlWhereClause; }
                    else if (CMALayerState == 4) { sqlWhereClause = heatMapConfig.button4.sqlWhereClause; }


                    //add extra logic so that Lowest Fiber Penetration doesn't show no fiber areas
                    if ($('#<%= ddlSortBy.ClientID %> option:selected').text() === "Lowest Fiber Penetration") {
                        console.log("Lowest Fiber Penetartion - extra filter for fiber available");
                        sqlWhereClause = sqlWhereClause + ' AND FIBER_AVAILABLE > 0 ';
                    }

                    //CategoryLayerState = CMALayerState;
                    //if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    //else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    //else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    //else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    //else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    //console.log('Get_CMA_Summary_Info :' + marketGeo + ' - ' + marketType);

                    let myParamsObject = {
                        type: "Get_CMA_Summary_Info",
                        marketVariable: marketGeo,
                        marketTypeVariable: marketType,
                    };
                    //console.log('CMA Summary Params Object:');
                    //console.log(myParamsObject);
                    let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    CMA_SUMMARY_DATA(data);
                    myParamsObject = {
                        type: "Get_CMATable_Data",
                        marketVariable: marketGeo,
                        marketTypeVariable: marketType,
                        overallCatVariable: sqlWhereClause,
                        orderVariable: SortByVariable
                    };
                    data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    data = JSON.parse(data.d);
                    homePageData.cmaTable = data;
                    cmaTable(data, marketGeo, marketType, sqlWhereClause, SortByVariable);
                }
                AddRemoveOptionsFromSortByDropdown();
                SortHomeTable()
            }

            function ZIP_SUMMARY_DATA(data) {
                score = JSON.parse(data.d);

                ponderApp.setHeatMapSummary(score); //set the summary score so that we can access later if heat map theme is changed without re querying
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('spanZipButtonText1').innerHTML = heatMapConfig.button1.buttonText;
                document.getElementById('spanZipButtonText2').innerHTML = heatMapConfig.button2.buttonText;
                document.getElementById('spanZipButtonText3').innerHTML = heatMapConfig.button3.buttonText;
                document.getElementById('spanZipButtonText4').innerHTML = heatMapConfig.button4.buttonText;
                document.getElementById('spanZipButton1Summary1').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol1]).toLocaleString('en');
                document.getElementById('spanZipButton1Summary2').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol2]).toLocaleString('en');
                document.getElementById('spanZipButton2Summary1').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol1]).toLocaleString('en');
                document.getElementById('spanZipButton2Summary2').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol2]).toLocaleString('en');
                document.getElementById('spanZipButton3Summary1').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol1]).toLocaleString('en');
                document.getElementById('spanZipButton3Summary2').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol2]).toLocaleString('en');
                document.getElementById('spanZipButton4Summary1').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol1]).toLocaleString('en');
                document.getElementById('spanZipButton4Summary2').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol2]).toLocaleString('en');

                //var PWNF_COUNT = score[0]["PWNF_COUNT"];
                //var PWNF_COUNT_comma = Number(PWNF_COUNT).toLocaleString('en');
                //document.getElementById('ZIP_PWNF_COUNT').innerHTML = PWNF_COUNT_comma;
                //var PWNF_POPS = score[0]["PWNF_POPS"];
                //var PWNF_POPS_comma = Number(PWNF_POPS).toLocaleString('en');
                //document.getElementById('ZIP_PWNF_POPS').innerHTML = PWNF_POPS_comma;

                //var PWGF_COUNT = score[0]["PWGF_COUNT"];
                //var PWGF_COUNT_comma = Number(PWGF_COUNT).toLocaleString('en');
                //document.getElementById('ZIP_PWGF_COUNT').innerHTML = PWGF_COUNT_comma;
                //var PWGF_POPS = score[0]["PWGF_POPS"];
                //var PWGF_POPS_comma = Number(PWGF_POPS).toLocaleString('en');
                //document.getElementById('ZIP_PWGF_POPS').innerHTML = PWGF_POPS_comma;

                //var GWNF_COUNT = score[0]["GWNF_COUNT"];
                //var GWNF_COUNT_comma = Number(GWNF_COUNT).toLocaleString('en');
                //document.getElementById('ZIP_GWNF_COUNT').innerHTML = GWNF_COUNT_comma;
                //var GWNF_POPS = score[0]["GWNF_POPS"];
                //var GWNF_POPS_comma = Number(GWNF_POPS).toLocaleString('en');
                //document.getElementById('ZIP_GWNF_POPS').innerHTML = GWNF_POPS_comma;

                //var GWGF_COUNT = score[0]["GWGF_COUNT"];
                //var GWGF_COUNT_comma = Number(GWGF_COUNT).toLocaleString('en');
                //document.getElementById('ZIP_GWGF_COUNT').innerHTML = GWGF_COUNT_comma;
                //var GWGF_POPS = score[0]["GWGF_POPS"];
                //var GWGF_POPS_comma = Number(GWGF_POPS).toLocaleString('en');
                //document.getElementById('ZIP_GWGF_POPS').innerHTML = GWGF_POPS_comma;

            }

            function COUNTY_SUMMARY_DATA(data) {
                score = JSON.parse(data.d);

                ponderApp.setHeatMapSummary(score); //set the summary score so that we can access later if heat map theme is changed without re querying
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('spanCountyButtonText1').innerHTML = heatMapConfig.button1.buttonText;
                document.getElementById('spanCountyButtonText2').innerHTML = heatMapConfig.button2.buttonText;
                document.getElementById('spanCountyButtonText3').innerHTML = heatMapConfig.button3.buttonText;
                document.getElementById('spanCountyButtonText4').innerHTML = heatMapConfig.button4.buttonText;
                document.getElementById('spanCountyButton1Summary1').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCountyButton1Summary2').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol2]).toLocaleString('en');
                document.getElementById('spanCountyButton2Summary1').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCountyButton2Summary2').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol2]).toLocaleString('en');
                document.getElementById('spanCountyButton3Summary1').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCountyButton3Summary2').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol2]).toLocaleString('en');
                document.getElementById('spanCountyButton4Summary1').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCountyButton4Summary2').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol2]).toLocaleString('en');

                //var PWNF_COUNT = score[0]["PWNF_COUNT"];
                //var PWNF_COUNT_comma = Number(PWNF_COUNT).toLocaleString('en');
                //document.getElementById('COUNTY_PWNF_COUNT').innerHTML = PWNF_COUNT_comma;
                //var PWNF_POPS = score[0]["PWNF_POPS"];
                //var PWNF_POPS_comma = Number(PWNF_POPS).toLocaleString('en');
                //document.getElementById('COUNTY_PWNF_POPS').innerHTML = PWNF_POPS_comma;

                //var PWGF_COUNT = score[0]["PWGF_COUNT"];
                //var PWGF_COUNT_comma = Number(PWGF_COUNT).toLocaleString('en');
                //document.getElementById('COUNTY_PWGF_COUNT').innerHTML = PWGF_COUNT_comma;
                //var PWGF_POPS = score[0]["PWGF_POPS"];
                //var PWGF_POPS_comma = Number(PWGF_POPS).toLocaleString('en');
                //document.getElementById('COUNTY_PWGF_POPS').innerHTML = PWGF_POPS_comma;

                //var GWNF_COUNT = score[0]["GWNF_COUNT"];
                //var GWNF_COUNT_comma = Number(GWNF_COUNT).toLocaleString('en');
                //document.getElementById('COUNTY_GWNF_COUNT').innerHTML = GWNF_COUNT_comma;
                //var GWNF_POPS = score[0]["GWNF_POPS"];
                //var GWNF_POPS_comma = Number(GWNF_POPS).toLocaleString('en');
                //document.getElementById('COUNTY_GWNF_POPS').innerHTML = GWNF_POPS_comma;

                //var GWGF_COUNT = score[0]["GWGF_COUNT"];
                //var GWGF_COUNT_comma = Number(GWGF_COUNT).toLocaleString('en');
                //document.getElementById('COUNTY_GWGF_COUNT').innerHTML = GWGF_COUNT_comma;
                //var GWGF_POPS = score[0]["GWGF_POPS"];
                //var GWGF_POPS_comma = Number(GWGF_POPS).toLocaleString('en');
                //document.getElementById('COUNTY_GWGF_POPS').innerHTML = GWGF_POPS_comma;

            }

            function CMA_SUMMARY_DATA(data) {
                score = JSON.parse(data.d); //how to save this score to access on heat map change without requerying?
                //console.log('CMA SUMMARY DATA');
                //console.log(score);
                ponderApp.setHeatMapSummary(score); //set the summary score so that we can access later if heat map theme is changed without re querying
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('spanCMAButtonText1').innerHTML = heatMapConfig.button1.buttonText;
                document.getElementById('spanCMAButtonText2').innerHTML = heatMapConfig.button2.buttonText;
                document.getElementById('spanCMAButtonText3').innerHTML = heatMapConfig.button3.buttonText;
                document.getElementById('spanCMAButtonText4').innerHTML = heatMapConfig.button4.buttonText;
                document.getElementById('spanCMAButton1Summary1').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCMAButton1Summary2').innerHTML = Number(score[0][heatMapConfig.button1.summaryCol2]).toLocaleString('en');
                document.getElementById('spanCMAButton2Summary1').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCMAButton2Summary2').innerHTML = Number(score[0][heatMapConfig.button2.summaryCol2]).toLocaleString('en');
                document.getElementById('spanCMAButton3Summary1').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCMAButton3Summary2').innerHTML = Number(score[0][heatMapConfig.button3.summaryCol2]).toLocaleString('en');
                document.getElementById('spanCMAButton4Summary1').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol1]).toLocaleString('en');
                document.getElementById('spanCMAButton4Summary2').innerHTML = Number(score[0][heatMapConfig.button4.summaryCol2]).toLocaleString('en');


            }



            async function zipCodeTable(data, marketGeo, sqlWhereClause, SortByVariable) {
                $('#zipCode_datatable').dataTable().fnDestroy(); //destroy old table
                ////$.fn.dataTable.moment('MM-DD-YYYY');
                //$('#zipCode_datatable').DataTable({ //build new table

                var table = $('#zipCode_datatable');
                //console.log('KTDataTables begin');

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }
                //document.getElementById('ZipTableSubtitle1').innerHTML = marketGeoText;

                var ExportZipOrder = 'Total_Pops';
                //console.log($('#<%= ddlSortBy.ClientID %> option:selected').text());
                if ($('#<%= ddlSortBy.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportZipOrder = 'Pop_Density';
                }

                var ExportZipFilter = '';
                //if (ZipLayerState == 1) { ExportZipFilter = 'With_WeakWireless_NoFiber_'; }
                //else if (ZipLayerState == 2) { ExportZipFilter = 'With_WeakWireless_FiberAvailable_'; }
                //else if (ZipLayerState == 3) { ExportZipFilter = 'With_StrongWireless_NoFiber_'; }
                //else if (ZipLayerState == 4) { ExportZipFilter = 'With_StrongWireless_FiberAvailable_'; }

                //console.log('SelectedSortZip: ' + SelectedSortZip)
                if (ArAccess == "AR") {
                    var domVar = "'prtlif'";
                } else {
                    var domVar = "'pBrtlif'";
                }

                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: true,
                    lengthChange: false,
                    pageLength: 10,
                    //deferRender: true,
                    //scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    //sort: false,
                    //order: [[4, "desc"]],
                    columnDefs: [{ className: "dt-nowrap", targets: [0] }, { className: "dt-center", targets: '_all' }, { orderable: false, targets: '_all' }],
                    //dom: 'pBrtlif',
                    dom: domVar,
                    buttons: [
                    //    {
                    //    text: 'Export All (Unfiltered)',
                    //    titleAttr: 'Exports All Zips Ignoring Filters',
                    //    className: 'btn btn-primary export-all-zips',
                    //    action: function (e, dt, node, config) {
                    //        $(".export-all-zips").attr("disabled", "disabled");
                    //        $(".export-all-zips-spinner").show();
                    //        ponderApp.startDownloadChecker("export-all-zips", "export-all-zips-spinner", 1200);
                    //        ExportAll_Zips(marketGeo, sqlWhereClause, SortByVariable);
                    //    }
                    //},
                    //{
                    //    className: 'export-all-zips-spinner',
                    //    text: '<img src="../ajax-loader_2.gif" />',
                    //},
                    {
                        extend: 'csv',
                            className: 'btn btn-primary export-top50-zips-to-csv', title: 'Zips',
                            exportOptions: {
                                columns: getExportColumns('zipCode_datatable')
                            },
                            filename: "PONDER_" + getExportDate() + "_" + $('#<%= ddlMarket.ClientID %> option:selected').text().replace(/\s/g, "") + "_Zip"
                    },
                    {
                        text: 'Export Zips',
                        className: 'btn btn-primary export-top50-zips', titleAttr: 'Export Zips to Excel', title: 'Zips',
                        action: async function (e, dt, node, config) {
                            $(".export-top50-zips").attr("disabled", "disabled");
                            $(".export-top50-zips-spinner").show();
                            $('.buttons-csv.export-top50-zips-to-csv').click();
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                eventType: "MARKET_ZIP_EXPORT",
                                logData: $('#<%= ddlMarket.ClientID %> option:selected').text()
                            };
                            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                            setTimeout(() => {
                                $(".export-top50-zips-spinner").hide();
                                $(".export-top50-zips").removeAttr("disabled");
                            }, 1000);
                        }
                    },
                    {
                        className: 'export-top50-zips-spinner',
                        text: '<img src="../ajax-loader_2.gif" />',
                    },
                    ],
                    columns: [
                       // { 'data': 'ROWNUM' },
                        { 'data': 'ZIP' },
                        { 'data': 'WIRELESS_CATEGORY', visible: false },
                        { 'data': 'ELDERLY_PERCENT_TEXT', visible: false },
                        { 'data': 'FIBER_PERCENTAGE_TEXT' },
                        { 'data': 'FIBER_AVAILABLE_SORT_VALUE', visible: false },
                        { 'data': 'WIRELESS_CATEGORY', visible: false },
                        { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'COPPER_UPGRADE' },
                        { 'data': 'DATA_DATE', visible: false}
                        // { 'data': 'TOTALAREA' },
                        // { 'data': 'TOTALPOPS' },
                        //{ 'data': 'POP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        //{ 'data': 'ALL_STORE_COUNT' },
                    ],
                    order: [],

                    "fnDrawCallback": function () {
                        $('#zipCode_datatable tr').find('td').each(function () {
                            $(this).on('mouseover', function () {
                                $(this).parent().css('background', 'silver');

                                this.style.cursor = 'pointer';
                            }).on('mouseout', function () {
                                $(this).parent().css('background', 'transparent');
                                this.style.cursor = 'default';
                            });

                        });
                    },

                    //headerCallback: function (thead, data, start, end, display, SelectedSortZip) {
                    //    console.log('SelectedSortZip headerCallback:' + SelectedSortZip);

                    //    if (SelectedSortZip == "TOTALPOPS") {
                    //        $(thead).find('th').eq(1).addClass('highlightGreen');
                    //    }
                    //},

                    initComplete: function () {
                        //this.api().columns().every(function () {
                        //    var column = this;
                        //    var select = $('<select><option value=""></option></select>')
                        //        .appendTo($(column.footer()).empty())
                        //        .on('change', function () {
                        //            var val = $.fn.dataTable.util.escapeRegex(
                        //                $(this).val()
                        //            );

                        //            column
                        //                .search(val ? '^' + val + '$' : '', true, false)
                        //                .draw();
                        //        });

                        //    column.data().unique().sort().each(function (d, j) {
                        //        select.append('<option value="' + d + '">' + d + '</option>')
                        //    });
                        //});
                        //hide Export Button for limited Users
                        if (Access == "Limited") {
                            $(".export-top50-zips").hide();
                        }
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        $(".export-all-zips-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-all-zips-spinner").hide();
                        $(".export-top50-zips-to-csv").hide();
                        $(".export-top50-zips-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-top50-zips-spinner").hide();
                    },

                });


                $('#zipCode_datatable tbody').off('click').on('click', 'tr', function () {
                    var data = $('#zipCode_datatable').DataTable().row(this).data();
                    //console.log(data);
                    //alert('You clicked on ZIP CODE: ' + data.ZIP_CODE + '.');
                    //map.addLayer(VpgmLayer4);
                    //map.setZoom(map.getZoom() + 1)

                    if (map.hasLayer(VpgmLayerTest)) {
                        VpgmLayerTest.clearLayers();
                    };

                    VpgmDataLayer.resetStyle();

                    var ZipLayerGroup = L.layerGroup().addTo(map);

                    var myStyle = {
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                    };

                    VpgmLayerTest = L.geoJSON(VpgmData, {
                        style: myStyle,
                        filter: zipFilter,
                        onEachFeature: onEachFeature
                    }).addTo(ZipLayerGroup);

                    function zipFilter(feature) {
                        if (feature.properties.ZIP == data.ZIP) return true
                    }
                    map.fitBounds(VpgmLayerTest.getBounds());
                    //VpgmLayerTest.setStyle({
                    //    //fillColor: '#3f0',
                    //    //color: '#0f0'
                    //    weight: 8,
                    //    color: '#008000',
                    //    dashArray: '',
                    //    dashArray: '',
                    //    fillOpacity: 0.7
                    //}).addTo(map);

                    //VpgmLayerTest.addTo(map);

                    //var delayInMilliseconds = 2000; //500 ms

                    //setTimeout(function () {
                    //    VpgmLayerTest.clearLayers();
                    //    map.removeLayer(VpgmLayerTest);
                    //}, delayInMilliseconds);

                    infoDatatableZip = L.control({ position: 'bottomleft' });

                    infoDatatableZip.onAdd = function (map) {
                        this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                        this.update();
                        return this._div;
                    };

                    // method that we will use to update the control based on feature properties passed
                    infoDatatableZip.update = function (props) {
                        //console.log(props);

                        var TOTALPOPSCOMMA = "";
                        var COPPER_UPGRADECOMMA = "";
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";

                        if (props) {
                            TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                            COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                            FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                            FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                            FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        }

                        if (L.Browser.touch) {
                            //alert("props.NUMBER_OF_PSAS: " + props.NUMBER_OF_PSAS);
                            //if (props.NUMBER_OF_PSAS == 0) {
                            zipTouchLink = '<br /><a href="#" class="ZipTouchDetailLink">Click to Show PSA Location Details</a>';
                            //zipTouchLink = '';
                            //} else {
                            //   zipTouchLink = '';
                            //}
                        } else {
                            zipTouchLink = '';
                        }

                        const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                        let heatMapConfig = ponderApp.heatMapConfig(props)[heatTheme];

                        //Baseball Card Info for Zip Map triggered from clicking on a zip in the table
                        this._div.innerHTML = '<h4><b>Zip Code Information</h4></b>' + (props ?
                            '<b>Zip Code: ' + props.ZIP + ', ' + props.STATE + '</b>'
                            + heatMapConfig.baseBallCardInfo.description
                            + '<br />' + '<b>Wireless Category: ' + props.WIRELESS_CATEGORY + '</b>'
                            + '<br />' + '<b>Fiber Addresses Available: ' + FIBER_AVAILABLECOMMA + '</b>'
                            + '<br />' + '<b>Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + ' (' + props.FIBER_PERCENTAGE + '%)' + '</b>'
                            + '<br />' + '<b>Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA + '</b>'
                            + '<br />' + '<b>Copper Upgrade: ' + COPPER_UPGRADECOMMA + '</b>'
                            + zipTouchLink
                            : 'Hover over a zip code');

                        $('.ZipTouchDetailLink').click(function () {
                            showZipTouchModal(props);
                        });

                        var showZipTouchModal = (props) => {
                            ZipTouchModal_Click();
                            updateZipModal(props); // function for getting data for modal
                        }

                        var ZipTouchModal_Click = (source, eventArgs) => {
                            var clickButton = document.getElementById("<%= btnZipModal.ClientID %>");
                            $('#LOADING_ZIP_Modal').show();
                            $('#ModalDisplay').hide();
                            if (Access == "Unlimited") {
                                $('#zipfooterMapModal3').hide();
                                $('#zipfooterMapModal').show();
                            } else {
                                $('#zipfooterMapModal').hide();
                                $('#zipfooterMapModal3').show();
                            }
                            clickButton.click();
                        }

                        //var cssinfo = "info";
                        //if (props) {
                        //    if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                        //        cssinfo = "info1";
                        //    } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                        //        cssinfo = "info2";
                        //    } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                        //        cssinfo = "info3";
                        //    } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                        //        cssinfo = "info4";
                        //    } else {
                        //        cssinfo = "info";
                        //    };

                        //    this._div.classList.remove("info");
                        //    this._div.classList.remove("info1");
                        //    this._div.classList.remove("info2");
                        //    this._div.classList.remove("info3");
                        //    this._div.classList.remove("info4");
                        //    this._div.classList.add(cssinfo);
                        //} else {
                        //    this._div.classList.remove("info");
                        //    this._div.classList.remove("info1");
                        //    this._div.classList.remove("info2");
                        //    this._div.classList.remove("info3");
                        //    this._div.classList.remove("info4");
                        //    this._div.classList.add(cssinfo);
                        //}

                        let cssinfo = "info";
                        let borderColor;

                        if (props) {
                            if (heatMapConfig.button1.criteria) {
                                cssinfo = "info1";
                                borderColor = heatMapConfig.button1.color;
                            }
                            else if (heatMapConfig.button2.criteria) {
                                cssinfo = "info2";
                                borderColor = heatMapConfig.button2.color;
                            }
                            else if (heatMapConfig.button3.criteria) {
                                cssinfo = "info3";
                                borderColor = heatMapConfig.button3.color;
                            }
                            else if (heatMapConfig.button4.criteria) {
                                cssinfo = "info4";
                                borderColor = heatMapConfig.button4.color;
                            }
                        }

                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                        // Can use below line to dynamically adjust border Color of baseball card
                        // $("." + cssinfo).css("border-color", borderColor);

                    };

                    infoDatatableZip.addTo(map);

                    function onEachFeature(feature, layer) {

                        map.removeControl(infoZip);
                        if (infoDatatableZip) {
                            map.removeControl(infoDatatableZip);
                        };

                        setTimeout(function () {
                            infoDatatableZip.update(layer.feature.properties);
                        }, 1000);

                        //infoDatatable.update(layer.feature.properties);
                    }

                    //remove and add layer to "refresh" map after clicking on row in table. iPad can't click on psa locations without it.
                    if (PSALayerZip) {
                        map.removeLayer(PSALayerZip);
                        map.addLayer(PSALayerZip);
                    }
                });

                $(window).resize();

                //console.log('KTDataTables end');

            };



            async function countyTable(data, marketGeo, marketType, sqlWhereClause, SortByVariable) {
                $('#county_datatable').dataTable().fnDestroy(); //destroy old table
                ////$.fn.dataTable.moment('MM-DD-YYYY');
                //$('#county_datatable').DataTable({ //build new table

                var table = $('#county_datatable');
                //console.log('KTDataTables begin');

                var ExportCountyOrder = 'Total_Pops';
                //console.log($('#<%= ddlSortBy.ClientID %> option:selected').text());
                if ($('#<%= ddlSortBy.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportCountyOrder = 'Pop_Density';
                }

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                marketGeoText = marketGeoText + " REGION";
                //document.getElementById('CountyTableSubtitle1').innerHTML = marketGeoText;

                var ExportCountyFilter = '';
                //if (CountyLayerState == 0) { ExportCountyFilter = ''; }
                //else if (CountyLayerState == 1) { ExportCountyFilter = 'With_WeakWireless_NoFiber_'; }
                //else if (CountyLayerState == 2) { ExportCountyFilter = 'With_WeakWireless_FiberAvailable_'; }
                //else if (CountyLayerState == 3) { ExportCountyFilter = 'With_StrongWireless_NoFiber_'; }
                //else if (CountyLayerState == 4) { ExportCountyFilter = 'With_StrongWireless_FiberAvailable_'; }
                if (ArAccess == "AR") {
                    var domVar = "'prtlif'";
                } else {
                    var domVar = "'pBrtlif'";
                }
                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: true,
                    lengthChange: false,
                    pageLength: 10,
                    //deferRender: true,
                    //scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    //sort: false,
                    columnDefs: [{ className: "dt-nowrap", targets: [0] }, { className: "dt-center", targets: '_all' }, { orderable: false, targets: '_all' }],
                    //order: [[4, "desc"]],
                    //dom: 'pBrtlif',
                    dom: domVar,
                    buttons: [
                    //    {
                    //    text: 'Export All (Unfiltered)',
                    //    titleAttr: 'Exports All Counties Ignoring Filters',
                    //    className: 'btn btn-primary export-all-counties',
                    //    action: function (e, dt, node, config) {
                    //        $(".export-all-counties").attr("disabled", "disabled");
                    //        $(".export-all-counties-spinner").show();
                    //        ponderApp.startDownloadChecker("export-all-counties", "export-all-counties-spinner", 1200);
                    //        ExportAll_Counties(marketGeo, marketType, sqlWhereClause, SortByVariable);
                    //    }
                    //},
                    //{
                    //    className: 'export-all-counties-spinner',
                    //    text: '<img src="../ajax-loader_2.gif" />',
                    //},
                    {
                        extend: 'csv',
                            className: 'btn btn-primary export-top50-counties-to-csv',
                            exportOptions: {
                                columns: getExportColumns('county_datatable')
                            },
                            filename: "PONDER_" + getExportDate() + "_" + $('#<%= ddlMarket.ClientID %> option:selected').text().replace(/\s/g, "") + "_County"
                    },
                    {
                        text: 'Export Counties',
                        className: 'btn btn-primary export-top50-counties', titleAttr: 'Export Counties to Excel', title: 'County_List', //this title isnt used?
                        action: async function (e, dt, node, config) {
                            $(".export-top50-counties").attr("disabled", "disabled");
                            $(".export-top50-counties-spinner").show();
                            $('.buttons-csv.export-top50-counties-to-csv').click();
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                eventType: "MARKET_COUNTY_EXPORT",
                                logData: $('#<%= ddlMarket.ClientID %> option:selected').text()
                            };
                            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                            setTimeout(() => {
                                $(".export-top50-counties-spinner").hide();
                                $(".export-top50-counties").removeAttr("disabled");
                            }, 1000);
                        }
                    },
                    {
                        className: 'export-top50-counties-spinner',
                        text: '<img src="../ajax-loader_2.gif" />',
                    },
                    ],
                    columns: [
                       // { 'data': 'ROWNUM' },
                        { 'data': 'COUNTY_STATE' },
                        { 'data': 'WIRELESS_CATEGORY', visible: false },
                        { 'data': 'ELDERLY_PERCENT_TEXT', visible: false },
                        { 'data': 'FIBER_PERCENTAGE_TEXT' },
                        { 'data': 'FIBER_AVAILABLE_SORT_VALUE', visible: false },
                        { 'data': 'WIRELESS_CATEGORY', visible: false },
                        { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'COPPER_UPGRADE' },
                        { 'data': 'DATA_DATE', visible: false },
                        // { 'data': 'TOTALAREA' },
                        //{ 'data': 'TOTALPOPS' },
                        //{ 'data': 'POP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        //{ 'data': 'ALL_STORE_COUNT' },
                        // { 'data': 'FIBER_PERCENTAGE' }
                    ],
                    order: [],

                    "fnDrawCallback": function () {
                        $('#county_datatable tr').find('td').each(function () {
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
                        //this.api().columns().every(function () {
                        //    var column = this;
                        //    var select = $('<select><option value=""></option></select>')
                        //        .appendTo($(column.footer()).empty())
                        //        .on('change', function () {
                        //            var val = $.fn.dataTable.util.escapeRegex(
                        //                $(this).val()
                        //            );

                        //            column
                        //                .search(val ? '^' + val + '$' : '', true, false)
                        //                .draw();
                        //        });

                        //    column.data().unique().sort().each(function (d, j) {
                        //        select.append('<option value="' + d + '">' + d + '</option>')
                        //    });
                        //});
                        //hide Export Button for limited Users
                        if (Access == "Limited") {
                            $(".export-top50-counties").hide();
                        }
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        $(".export-all-counties-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-all-counties-spinner").hide();
                        $(".export-top50-counties-to-csv").hide();
                        $(".export-top50-counties-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-top50-counties-spinner").hide();
                    },

                });

                $('#county_datatable tbody').off('click').on('click', 'tr', function () {
                    var data = $('#county_datatable').DataTable().row(this).data();

                    if (map.hasLayer(Vpgm2LayerTest)) {
                        Vpgm2LayerTest.clearLayers();
                    };

                    VpgmData2Layer.resetStyle();

                    map.closePopup();

                    var CountyLayerGroup = L.layerGroup().addTo(map);

                    var myStyle = {
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                    };

                    Vpgm2LayerTest = L.geoJSON(VpgmData2, {
                        style: myStyle,
                        filter: countyFilter,
                        onEachFeature: onEachFeature
                    }).addTo(CountyLayerGroup);

                    function countyFilter(feature) {
                        if (feature.properties.COUNTY_STATE == data.COUNTY_STATE) return true
                    }
                    map.fitBounds(Vpgm2LayerTest.getBounds());

                    infoDatatableCounty = L.control({ position: 'bottomleft' });

                    infoDatatableCounty.onAdd = function (map) {
                        this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                        this.update();
                        return this._div;
                    };

                    // method that we will use to update the control based on feature properties passed
                    infoDatatableCounty.update = function (props) {
                        //console.log(props);

                        var TotalPOPsCOMMA = "";
                        var COPPER_UPGRADECOMMA = "";
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";
                        var NUMBER_OF_PSASCOMMA = "";

                        if (props) {
                            TotalPOPsCOMMA = Number(props.TotalPOPs).toLocaleString('en');
                            COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                            FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                            FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                            FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                            NUMBER_OF_PSASCOMMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                        }

                        if (props) {
                            if (L.Browser.touch) {
                                //alert("props.NUMBER_OF_PSAS: " + props.NUMBER_OF_PSAS);
                                if (NUMBER_OF_PSASCOMMA == '0') {
                                    CountyTouchLink = '';
                                } else {
                                    CountyTouchLink = '<br /><a href="#" class="CountyTouchDetailLink">Click to Show Fiber Opportunities</a>';
                                }
                            } else {
                                CountyTouchLink = '';
                            }
                        } else {
                            CountyTouchLink = '';
                        }

                        const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                        let heatMapConfig = ponderApp.heatMapConfig(props)[heatTheme];

                        //Baseball Card for County from Table below Map
                        this._div.innerHTML = '<h4>County Information</h4>' + (props ?
                            '<b>County: ' + props.COUNTY_STATE + '</b>'
                            + heatMapConfig.baseBallCardInfo.description
                            + '<br />' + '<b>Wireless Category: ' + props.WIRELESS_CATEGORY + '</b>'
                            + '<br />' + '<b>Fiber Addresses Available: ' + FIBER_AVAILABLECOMMA + '</b>'
                            + '<br />' + '<b>Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + ' (' + props.FIBER_PERCENTAGE + '%)' + '</b>'
                            + '<br />' + '<b>Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA + '</b>'
                            + '<br />' + '<b>Copper Upgrade: ' + COPPER_UPGRADECOMMA + '</b>'
                            + CountyTouchLink
                            : 'Hover over a County');


                        $('.CountyTouchDetailLink').click(function () {
                            showCountyModal(props, SelectCountyLat, SelectCountyLng);
                        });

                        //var cssinfo = "info";
                        //if (props) {
                        //    if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                        //        cssinfo = "info1";
                        //    } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                        //        cssinfo = "info2";
                        //    } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                        //        cssinfo = "info3";
                        //    } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                        //        cssinfo = "info4";
                        //    } else {
                        //        cssinfo = "info";
                        //    };

                        //    this._div.classList.remove("info");
                        //    this._div.classList.remove("info1");
                        //    this._div.classList.remove("info2");
                        //    this._div.classList.remove("info3");
                        //    this._div.classList.remove("info4");
                        //    this._div.classList.add(cssinfo);
                        //} else {
                        //    this._div.classList.remove("info");
                        //    this._div.classList.remove("info1");
                        //    this._div.classList.remove("info2");
                        //    this._div.classList.remove("info3");
                        //    this._div.classList.remove("info4");
                        //    this._div.classList.add(cssinfo);
                        //}

                        let cssinfo = "info";
                        let borderColor;

                        if (props) {
                            if (heatMapConfig.button1.criteria) {
                                cssinfo = "info1";
                                borderColor = heatMapConfig.button1.color;
                            }
                            else if (heatMapConfig.button2.criteria) {
                                cssinfo = "info2";
                                borderColor = heatMapConfig.button2.color;
                            }
                            else if (heatMapConfig.button3.criteria) {
                                cssinfo = "info3";
                                borderColor = heatMapConfig.button3.color;
                            }
                            else if (heatMapConfig.button4.criteria) {
                                cssinfo = "info4";
                                borderColor = heatMapConfig.button4.color;
                            }
                        }

                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                        // Can use below line to dynamically adjust border Color of baseball card
                        // $("." + cssinfo).css("border-color", borderColor);
                    };

                    infoDatatableCounty.addTo(map);

                    function onEachFeature(feature, layer) {

                        map.removeControl(infoCounty);
                        if (infoDatatableCounty) {
                            map.removeControl(infoDatatableCounty);
                        };

                        setTimeout(function () {
                            infoDatatableCounty.update(layer.feature.properties);
                        }, 1000);

                        //infoDatatable.update(layer.feature.properties);
                    }

                    //remove and add layer to "refresh" map after clicking on row in table. iPad can't click on psa locations without it.
                    if (PSALayerCounty) {
                        map.removeLayer(PSALayerCounty);
                        map.addLayer(PSALayerCounty);
                    }
                });

                $(window).resize();

                //console.log('KTDataTables end');

            };

            async function cmaTable(data, marketGeo, marketType, sqlWhereClause, SortByVariable) {
                $('#cma_datatable').dataTable().fnDestroy(); //destroy old table

                var table = $('#cma_datatable');
                //console.log('KTDataTables begin');

                var ExportCMAOrder = 'Total_Pops';
                //console.log($('#<%= ddlSortBy.ClientID %> option:selected').text());
                if ($('#<%= ddlSortBy.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportCMAOrder = 'Pop_Density';
                }

                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];

                var ExportCMAFilter = '';
                if (CMALayerState == 0) { ExportCMAFilter = ''; }
                else if (CMALayerState == 1) { ExportCMAFilter = heatMapConfig.button1.exportText; }
                else if (CMALayerState == 2) { ExportCMAFilter = heatMapConfig.button2.exportText; }
                else if (CMALayerState == 3) { ExportCMAFilter = heatMapConfig.button3.exportText; }
                else if (CMALayerState == 4) { ExportCMAFilter = heatMapConfig.button4.exportText; }

                if (ArAccess == "AR") {
                    var domVar = "'prtlif'";                    
                } else {
                    var domVar = "'pBrtlif'";
                }

                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: true,
                    lengthChange: false,
                    pageLength: 10,
                    //deferRender: true,
                    //scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    //sort: false,
                    //order: [[5, "desc"]],
                    //dom: 'pBrtlif',
                    dom: domVar,
                    buttons: [
                    //    {
                    //    text: 'Export All (Unfiltered)',
                    //    className: 'btn btn-primary export-all-cmas',
                    //    titleAttr: 'Exports All CMAs Ignoring Filters',
                    //    action: function (e, dt, node, config) {
                    //        $(".export-all-cmas").attr("disabled", "disabled");
                    //        $(".export-all-cmas-spinner").show();
                    //        ponderApp.startDownloadChecker("export-all-cmas", "export-all-cmas-spinner", 1200);
                    //        ExportAll_CMAs(marketGeo, marketType, sqlWhereClause, SortByVariable);
                    //    }
                    //},
                    //{
                    //    className: 'export-all-cmas-spinner',
                    //    text: '<img src="../ajax-loader_2.gif" />',
                    //},
                    {
                        extend: 'csv',
                            className: 'btn btn-primary export-top50-cmas-to-csv',
                            exportOptions: {
                                columns: getExportColumns('cma_datatable') 
                            },
                            filename: "PONDER_" + getExportDate() + "_" + $('#<%= ddlMarket.ClientID %> option:selected').text().replace(/\s/g, "") + "_CMA"
                    },
                    {
                        text: 'Export CMAs',
                        className: 'btn btn-primary export-top50-cmas', titleAttr: 'Export CMAs to Excel', title: 'CMAs',
                        action: async function (e, dt, node, config) {
                            //console.log("export top 50 layer state: " + CMALayerState);
                            //console.log("export top 50 filter: " + ExportCMAFilter);
                            $(".export-top50-cmas").attr("disabled", "disabled");
                            $(".export-top50-cmas-spinner").show();
                            $('.buttons-csv.export-top50-cmas-to-csv').click();
                            const myParamsObject = {
                                userID: "<%=hf_User.Value%>",
                                eventType: "MARKET_CMA_EXPORT",
                                logData: $('#<%= ddlMarket.ClientID %> option:selected').text()
                            };
                            await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                            setTimeout(() => {
                                $(".export-top50-cmas-spinner").hide();
                                $(".export-top50-cmas").removeAttr("disabled");
                            }, 1000);
                        }
                    },
                    {
                        className: 'export-top50-cmas-spinner',
                        text: '<img src="../ajax-loader_2.gif" />',
                    },
                    ],
                    columnDefs: [{ className: "dt-nowrap", targets: [0] }, { className: "dt-center", targets: '_all' }, { orderable: false, targets: '_all' }],
                    columns: [
                        //{ 'data': 'ROWNUM' },                        
                        { 'data': 'CMA_NAME', name: 'CMA_NAME' },
                        { 'data': 'CMA', name: 'CMA' },
                        { 'data': 'WIRELESS_CATEGORY', name: 'WIRELESS_CATEGORY', visible: false },
                        { 'data': 'ELDERLY_PERCENT_TEXT', name: 'ELDERLY_PERCENT_TEXT', visible: false },
                        { 'data': 'FIBER_PERCENTAGE_TEXT', name: 'FIBER_PERCENTAGE_TEXT' },
                        { 'data': 'FIBER_AVAILABLE_SORT_VALUE', name: 'FIBER_AVAILABLE_SORT_VALUE', visible: false },
                        { 'data': 'WIRELESS_CATEGORY', name: 'WIRELESS_CATEGORY', visible: false },
                        { 'data': 'FIBER_AVAILABLE', name: 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS', name: 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY', name: 'FIBER_OPPORTUNITY' },
                        { 'data': 'COPPER_UPGRADE', name: 'COPPER_UPGRADE' },
                        { 'data': 'DATA_DATE', name: 'DATA_DATE', visible: false  },
                        // { 'data': 'TOTALAREA' },
                        //{ 'data': 'TOTALPOPS' },
                        //{ 'data': 'POP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        //{ 'data': 'ALL_STORE_COUNT' },
                        // { 'data': 'FIBER_PERCENTAGE' }
                    ],
                    order: [],
                    //"rowCallback": function (row, data, index) {
                    //    console.log('data.ELDERLY_PERCENT', data.ELDERLY_PERCENT);
                    //    if (data.ELDERLY_PERCENT > 10) {
                    //        $(row).find('td:eq(3)').css('background', 'red');
                    //    }
                    //},

                    "fnDrawCallback": function () {
                        $('#cma_datatable tr').find('td').each(function () {
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
                        //this.api().columns().every(function () {
                        //    var column = this;
                        //    var select = $('<select><option value=""></option></select>')
                        //        .appendTo($(column.footer()).empty())
                        //        .on('change', function () {
                        //            var val = $.fn.dataTable.util.escapeRegex(
                        //                $(this).val()
                        //            );

                        //            column
                        //                .search(val ? '^' + val + '$' : '', true, false)
                        //                .draw();
                        //        });

                        //    column.data().unique().sort().each(function (d, j) {
                        //        select.append('<option value="' + d + '">' + d + '</option>')
                        //    });
                        //});
                        //hide Export Button for limited Users
                        if (Access == "Limited") {
                            $(".export-top50-cmas").hide();
                        }
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                        $(".export-all-cmas-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-all-cmas-spinner").hide();
                        $(".export-top50-cmas-to-csv").hide();
                        $(".export-top50-cmas-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-top50-cmas-spinner").hide();
                    },

                });

                $('#cma_datatable tbody').off('click').on('click', 'tr', function () {
                    var data = $('#cma_datatable').DataTable().row(this).data();

                    if (map.hasLayer(Vpgm3LayerTest)) {
                        Vpgm3LayerTest.clearLayers();
                    };

                    VpgmData3Layer.resetStyle();

                    var CMALayerGroup = L.layerGroup().addTo(map);

                    var myStyle = {
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                    };

                    Vpgm3LayerTest = L.geoJSON(VpgmData3, {
                        style: myStyle,
                        filter: cmaFilter,
                        onEachFeature: onEachFeature
                    }).addTo(CMALayerGroup);

                    function cmaFilter(feature) {
                        if (feature.properties.cma == data.CMA) return true
                    }
                    map.fitBounds(Vpgm3LayerTest.getBounds());

                    SelectCMALat = (Vpgm3LayerTest.getBounds()._northEast.lat + Vpgm3LayerTest.getBounds()._southWest.lat) / 2;
                    SelectCMALng = (Vpgm3LayerTest.getBounds()._northEast.lng + Vpgm3LayerTest.getBounds()._southWest.lng) / 2;

                    //console.log('vpgm3layertest: ');
                    //console.log(Vpgm3LayerTest.getBounds());
                    //console.log(Vpgm3LayerTest.getBounds()._northEast);
                    //console.log(Vpgm3LayerTest.getBounds()._northEast.lat);
                    //console.log(SelectCMALat);
                    //console.log(SelectCMALng);

                    infoDatatable = L.control({ position: 'bottomleft' });

                    infoDatatable.onAdd = function (map) {
                        this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                        this.update();
                        return this._div;
                    };

                    // method that we will use to update the control based on feature properties passed
                    infoDatatable.update = function (props) {
                        //console.log(props);

                        var TOTALPOPSCOMMA = "";
                        var COPPER_UPGRADECOMMA = "";
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";
                        var NUMBER_OF_PSASCOMMA = "";

                        if (props) {
                            TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                            COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                            FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                            FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                            FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                            NUMBER_OF_PSASCOMMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                        }

                        if (props) {
                            if (L.Browser.touch) {
                                //alert("props.NUMBER_OF_PSAS: " + props.NUMBER_OF_PSAS);
                                if (NUMBER_OF_PSASCOMMA == '0') {
                                    CMATouchLink = '';
                                } else {
                                    CMATouchLink = '<br /><a href="#" class="CMATouchDetailLink">Click to Show Fiber Opportunities</a>';
                                }
                            } else {
                                CMATouchLink = '';
                            }
                        } else {
                            CMATouchLink = '';
                        }

                        const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                        const heatMapConfig = ponderApp.heatMapConfig(props)[heatTheme];

                        //Baseball Card for CMA from clicking on Table below Map
                        this._div.innerHTML = '<h4>CMA Information</h4>' + (props ?
                            '<b>CMA: ' + props.cma + '<br />' + 'CMA Name: ' + props.Name + '</b>'
                            + heatMapConfig.baseBallCardInfo.description
                            + '<br />' + '<b>Wireless Category: ' + props.WIRELESS_CATEGORY + '</b>'
                            + '<br />' + '<b>Fiber Addresses Available: ' + FIBER_AVAILABLECOMMA + '</b>'
                            + '<br />' + '<b>Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + ' (' + props.FIBER_PERCENTAGE + '%)' + '</b>'
                            + '<br />' + '<b>Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA
                            + '<br />' + '<b>Copper Upgrade: ' + COPPER_UPGRADECOMMA + '</b>'
                            + '</b>' + CMATouchLink
                            : 'Hover over a CMA');


                        $('.CMATouchDetailLink').click(function () {
                            showCMAModal(props, SelectCMALat, SelectCMALng);
                        });

                        <%--function showCMATouchModal(props) {
                            CMATouchModal_Click();
                            updateCMAModal(props); // function for getting data for modal
                        }

                        function CMATouchModal_Click(source, eventArgs) {
                            var clickButton = document.getElementById("<%= btnCMAModal.ClientID %>");
                            $('#LOADING_CMA_Modal').show();
                            $('#ModalDisplay').hide();
                            clickButton.click();
                        }--%>



                        //change the baseball card border (after table click) based on heat map theme criteria
                        var cssinfo = "info";
                        if (props) {
                            if (heatMapConfig.button1.criteria) {
                                cssinfo = "info1";
                                //need to get rid of hard coded info1 css and instead dynamically change css of this.div
                                //$('#btnCMA1').css( "background-color", heatMapConfig.button1.color );
                                // border: 6px solid #ff9933;

                            }
                            else if (heatMapConfig.button2.criteria) {
                                cssinfo = "info2";
                            }
                            else if (heatMapConfig.button3.criteria) {
                                cssinfo = "info3";
                            }
                            else if (heatMapConfig.button4.criteria) {
                                cssinfo = "info4";
                            }
                        }

                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    };

                    infoDatatable.addTo(map);

                    function onEachFeature(feature, layer) {

                        map.removeControl(info);
                        if (infoDatatable) {
                            map.removeControl(infoDatatable);
                        };

                        setTimeout(function () {
                            infoDatatable.update(layer.feature.properties);
                        }, 1000);

                        //infoDatatable.update(layer.feature.properties);

                    }

                    //remove and add layer to "refresh" map after clicking on row in table. iPad can't click on psa locations without it.
                    if (PSALayerCma) {
                        map.removeLayer(PSALayerCma);
                        map.addLayer(PSALayerCma);
                    }
                });

                $(window).resize();

                //console.log('KTDataTables end');

            };            

            var ZIPMDUTable = (data, ZipCodeModalSelected) => {

                var MDUCount = data.length;
                var MDUOpportunitySum = 0;

                for (var i = 0; i < data.length; i++) {
                    MDUOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }
                MDUOpportunitySumCOMMA = MDUOpportunitySum.toLocaleString('en');

                //document.getElementById('ZIPModalSubtitleMDU').innerHTML = MDUOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today at these ' + MDUCount + ' Single Address MDUs';

                $('#ZIPModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                var table = $('#ZIPModal_MDUtable');
                document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value = ZipCodeModalSelected;

                let tableRowButtonText;
                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export High Opportunity MDUs (Single Address) to Excel';
                    var buttonTitleAttr2 = 'Export Unit Numbers from High Opportunity MDUs to Excel';
                    tableRowButtonText = "<button class='btn btn-primary btn-xsm export-zip-mdus-row'>Excel</button><button class='export-zip-mdus-row-spinner'><img src='../ajax-loader_2.gif' /></button>";
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)';
                    var buttonTitleAttr = 'Show High Opportunity MDUs (Single Address) in Table (limit 3000 rows)';
                    var buttonTitleAttr2 = 'Show Unit Numbers from High Opportunity MDUs in Table (limit 3000 rows)';
                    tableRowButtonText = "<button class='btn btn-primary btn-xsm'>Show List</button>";
                }

                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '200px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[4, "desc"]],
                    dom: 'Brtlifp',
                    buttons: [
                        {
                            extend: 'csv',
                            className: 'btn btn-primary export-addresses-to-csv-13',
                            exportOptions: {
                                columns: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
                            }
                        },
                        {
                            text: 'Export Table',
                            className: 'btn btn-primary export-addresses', titleAttr: 'Export Table To Excel', title: 'Export Table',
                            action: async function (e, dt, node, config) {
                                // return if limited users able to access the "Export To Excel" button
                                if (Access != "Unlimited") {
                                    return;
                                }
                                $(".export-addresses").attr("disabled", "disabled");
                                $(".export-addresses-spinner").show();
                                $('.buttons-csv.export-addresses-to-csv-13').click();
                                const myParamsObject = {
                                    userID: "<%=hf_User.Value%>",
                                        eventType: "ZIP_MDU_LIST_EXPORT",
                                        logData: ZipCodeModalSelected
                                    };
                                    await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                                    setTimeout(() => {
                                        $(".export-addresses-spinner").hide();
                                        $(".export-addresses").removeAttr("disabled");
                                    }, 2000);
                                }
                            },
                            {
                                className: 'export-addresses-spinner',
                                text: '<img src="../ajax-loader_2.gif" />',
                            },
                            // {
                            //    text: buttonText + ' High Opportunity MDUs' + buttonText2,
                            //    titleAttr: buttonTitleAttr,
                            //    className: 'btn btn-primary export-high-opportunity-mdus-zip',
                            //    action: function (e, dt, node, config) {
                            //        $(".export-high-opportunity-mdus-zip").attr("disabled", "disabled");
                            //        $(".export-high-opportunity-mdus-zip-spinner").show();
                            //        ponderApp.startDownloadChecker("export-high-opportunity-mdus-zip", "export-high-opportunity-mdus-zip-spinner", 1200);
                            //        TopMDUsExport_Zip();
                            //    }
                            //    //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            //},
                            //{
                            //    className: 'export-high-opportunity-mdus-zip-spinner',
                            //    text: '<img src="../ajax-loader_2.gif" />',
                            //},
                            {
                                text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                                titleAttr: buttonTitleAttr2,
                                className: 'btn btn-primary  export-unit-numbers-from-mdus-zip',
                                action: function (e, dt, node, config) {
                                    $(".export-unit-numbers-from-mdus-zip").attr("disabled", "disabled");
                                    $(".export-unit-numbers-from-mdus-zip-spinner").show();
                                    ponderApp.startDownloadChecker("export-unit-numbers-from-mdus-zip", "export-unit-numbers-from-mdus-zip-spinner", 1200);
                                    TopMDUAddressesExport_Zip();
                                }
                                //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            },
                            {
                                className: 'export-unit-numbers-from-mdus-zip-spinner',
                                text: '<img src="../ajax-loader_2.gif" />',
                            },
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': tableRowButtonText,
                                'className': "text-center",
                            },
                            { 'data': 'ZIP_RANK' },
                            { 'data': 'HOUSE_NUMBER', 'className': "text-center" },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'ZIP' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT', 'className': "text-center" },
                            { 'data': 'FIBER_AVAILABLE', 'className': "text-center" },
                            { 'data': 'FIBER_OPPORTUNITY', 'className': "text-center" },
                            { 'data': 'FIBER_PENETRATION_RATE', 'className': "text-center" },
                            { 'data': 'MARKET_RANK' },
                            { 'data': 'DATA_DATE', visible: false }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                            $(".export-addresses-to-csv-13").hide();
                            $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-addresses-spinner").hide();
                            //$(".export-high-opportunity-mdus-zip-spinner").css({ "background-color": "white", "border-style": "none" });
                            //$(".export-high-opportunity-mdus-zip-spinner").hide();
                            $(".export-unit-numbers-from-mdus-zip-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-unit-numbers-from-mdus-zip-spinner").hide();
                            $(".export-zip-mdus-row-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-zip-mdus-row-spinner").hide();
                        },
                    });

                function ExportSpecificPSAAddress() {
                    //console.log('ExportSpecificPSAAddress');
                }


                $('#ZIPModal_MDUtable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var housenumber = $(tr).find('td').eq(2)[0].innerHTML;
                    var prefix = $(tr).find('td').eq(3)[0].innerHTML;
                    var streetname = $(tr).find('td').eq(4)[0].innerHTML;
                    var zip = $(tr).find('td').eq(5)[0].innerHTML;
                    if (Access == "Unlimited") {
                        $(tr).find(".export-zip-mdus-row").attr("disabled", "disabled");
                        $(tr).find(".export-zip-mdus-row-spinner").show();
                        $(tr).addClass('active');
                        ponderApp.startRowDownloadChecker("ZIPModal_MDUtable", "export-zip-mdus-row", "export-zip-mdus-row-spinner", 1200);
                        selectedMDUGetAddresses_Zip(housenumber, prefix, streetname, zip);
                    } else {
                        selectedMDUShowAddresses_Zip(housenumber, prefix, streetname, zip);
                    }
                    return false;
                });

                async function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = value;
                    //console.log("Clicked PSA from table: " + value);
                    const myParamsObject = {
                        type: "ExportToExcel_PSALocationsAllZip",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                }

                async function selectedFiberGetExportAllZIP() {
                    const myParamsObject = {
                        type: "ExportToExcel_PSALocationsAllZip",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                }

                async function selectedMDUGetAddresses_Zip(housenumber, prefix, streetname, zip) {
                    //log event
                    let myParamsObject = {
                        userID: "<%=hf_User.Value%>",
                        eventType: "ZIP_MDU_SINGLE_EXPORT",
                        logData: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                        logJsonPayload: JSON.stringify({
                            "HouseNumber": housenumber,
                            "Prefix": prefix,
                            "Street Name": streetname,
                            "Zip": zip
                        })
                    };
                    await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                    //download data
                    document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = housenumber;
                    document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = streetname;
                    myParamsObject = {
                        type: "ExportToExcel_SelectedMDUAddressesZIP",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                        houseValue: housenumber,
                        prefixValue: prefix,
                        streetValue: streetname,
                        zipValue: zip,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
                }

                function selectedMDUShowAddresses_Zip(housenumber, prefix, streetname, zip) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    MDUShowAddressesFromTableClick(housenumber, prefix, streetname, zip)
                }

                async function MDUShowAddressesFromTableClick(housenumber, prefix, streetname, zip) {
                    var houseNumberVariable = housenumber;
                    var streetNameVariable = streetname;
                    $('#commonDiv').hide();
                    $('#limitedUserDiv').hide();
                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - ' + houseNumberVariable + ' ' + streetNameVariable;
                    const myParamsObject = {
                        type: "showData_MDUAddressesZipFromTable",
                        ZipVariable: ZipCodeModalSelected,
                        houseValue: housenumber,
                        prefixValue: prefix,
                        streetValue: streetname,
                        zipValue: zip,
                    };
                    const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    unitNumbersData = JSON.parse(data.d);
                    //showDataMDUUnitNumbers(unitNumbersData);
                    ponderApp.showLimitedUserData(unitNumbersData);
                }

                async function TopMDUsExport_Zip() {
                    //console.log('Top MDU Zip Export Triggered');
                    const myParamsObject = {
                        type: "ExportToExcel_TopMDUsZIP",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'High_Opportunity_MDUs.csv');
                }

                async function TopMDUAddressesExport_Zip() {
                    if (Access == "Unlimited") {
                        //log event
                        let myParamsObject = {
                            userID: "<%=hf_User.Value%>",
                            eventType: "ZIP_MDU_ALL_EXPORT",
                            logData: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value
                        };
                        await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                        //download data
                        myParamsObject = {
                            type: "ExportToExcel_MDUAddressesZIP",
                            mduValue: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                        };
                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                        ponderApp.downloadFile(data, 'MDU_Addresses_UnitNumbers.csv');
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");
                        clickButton.click();
                        $('#commonDiv').hide();
                        $('#limitedUserDiv').hide();
                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();
                        document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - MDUs';
                        const myParamsObject = {
                            type: "showData_MDUAddressesZip",
                            ZipVariable: ZipCodeModalSelected
                        };
                        let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                        unitNumbersData = JSON.parse(data.d);
                        //showDataMDUUnitNumbers(unitNumbersData);
                        ponderApp.showLimitedUserData(unitNumbersData);
                    }
                }

                //function showDataMDUUnitNumbers(data) {
                //    console.log('showDataModal_MDUtable_limitedUser');
                //    $('#showDataModal_MDUtable_limitedUser').dataTable().fnDestroy(); //destroy old table

                //    $('#LOADING_showData_Modal').hide();
                //    $('#showDataModalTableDiv').show();
                //    $('#commonDiv').hide();
                //    $('#limitedUserDiv').show();
                //    groupByFilter();

                //    var table = $('#showDataModal_MDUtable_limitedUser');

                //    // begin first table
                //    table.DataTable({
                //        //responsive: true,
                //        data: data,
                //        paging: false,
                //        //deferRender: true,
                //        scrollY: '200px',
                //        scrollCollapse: true,
                //        scrollX: true,
                //        //scroller: true,
                //        sort: false,
                //        //order: [[4, "desc"]],
                //        dom: 'frtip',
                //        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                //        columns: [
                //            { 'data': 'HOUSE_NUMBER' },
                //            { 'data': 'PREFIX' },
                //            { 'data': 'STREET_NAME' },
                //            { 'data': 'UNIT_NUMBER' },
                //            { 'data': 'CITY' },
                //            { 'data': 'STATE' },
                //            { 'data': 'ZIP' },
                //            { 'data': 'WIRELESS_SCORE' },
                //            { 'data': 'SERVICE_STATUS' },
                //            { 'data': 'DWELLING_TYPE' }
                //        ],

                //        initComplete: function () {
                //            this.api().columns().every(function () {
                //                var column = this;
                //                var select = $('<select><option value=""></option></select>')
                //                    .appendTo($(column.footer()).empty())
                //                    .on('change', function () {
                //                        var val = $.fn.dataTable.util.escapeRegex(
                //                            $(this).val()
                //                        );

                //                        column
                //                            .search(val ? '^' + val + '$' : '', true, false)
                //                            .draw();
                //                    });

                //                column.data().unique().sort().each(function (d, j) {
                //                    select.append('<option value="' + d + '">' + d + '</option>')
                //                });
                //            });
                //            this.api().columns().header().each(function (th) {
                //                $(th).removeClass("sorting_asc");
                //                $(th).removeClass("sorting");
                //            });
                //        },
                //    });

                //}


                $('#ZIPModal_MDUtable tr').off().on('click', function () {

                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#ZIPModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#ZIPModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    //console.log("latitudeClicked: " + latitudeClicked);
                    //console.log("longitudeClicked: " + longitudeClicked);

                    //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                    var loc = [latitudeClicked, longitudeClicked];
                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    if (ZipModalLayerGroup) {
                        ZipModalLayerGroup.removeFrom(mapModal);
                    }

                    ZipModalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                    ZipModalLayerGroup.addLayer(marker);
                    ZipModalLayerGroup.addTo(mapModal);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .01
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .01
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                        bounds = new L.LatLngBounds(southWest, northEast);

                    mapModal.fitBounds(bounds, { padding: [.05, .05] });

                    setTimeout(function () {
                        ZipModalLayerGroup.removeFrom(mapModal);
                        console.log('removed highlight');
                    }, 2000);
                    //}
                });

                $('#ZIPModal_MDUtable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );


                $(window).resize();

                //console.log('KTDataTables zip modal3 end');
                // groupByFilter();

            };

            var CountyMDUTable = (data, CountyModalSelected) => {

                var MDUCount = data.length;
                var MDUOpportunitySum = 0;

                for (var i = 0; i < data.length; i++) {
                    MDUOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }
                MDUOpportunitySumCOMMA = MDUOpportunitySum.toLocaleString('en');

                //document.getElementById('CountyModalSubtitleMDU').innerHTML = MDUCount + ' High Opportunity MDUs combine for ' + MDUOpportunitySum + ' Addresses to Sell Fiber Today';
                //document.getElementById('CountyModalSubtitleMDU').innerHTML = MDUOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today at these ' + MDUCount + ' Single Address MDUs';

                $('#CountyModal_MDUtable').dataTable().fnDestroy(); //destroy old table                

                var table = $('#CountyModal_MDUtable');
                document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value = CountyModalSelected;

                //document.getElementById('CountyModalTableSubtitle1').innerHTML = CountyModalSelected;

                let tableRowButtonText;
                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export High Opportunity MDUs (Single Address) to Excel';
                    var buttonTitleAttr2 = 'Export Unit Numbers from High Opportunity MDUs to Excel';
                    tableRowButtonText = "<button class='btn btn-primary btn-xsm export-county-mdus-row'>Excel</button><button class='export-county-mdus-row-spinner'><img src='../ajax-loader_2.gif' /></button>";
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)';
                    var buttonTitleAttr = 'Show High Opportunity MDUs (Single Address) in Table (limit 3000 rows)';
                    var buttonTitleAttr2 = 'Show Unit Numbers from High Opportunity MDUs in Table (limit 3000 rows)';
                    tableRowButtonText = "<button class='btn btn-primary btn-xsm'>Show List</button>";
                }

                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '200px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[4, "desc"]],
                    dom: 'Brtlifp',
                    buttons: [
                        {
                            extend: 'csv',
                            className: 'btn btn-primary export-addresses-to-csv-14',
                            exportOptions: {
                                columns: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
                            }
                        },
                        {
                            text: 'Export Table',
                            className: 'btn btn-primary export-addresses', titleAttr: 'Export Table To Excel', title: 'Export Table',
                            action: async function (e, dt, node, config) {
                                // return if limited users able to access the "Export To Excel" button
                                if (Access != "Unlimited") {
                                    return;
                                }
                                $(".export-addresses").attr("disabled", "disabled");
                                $(".export-addresses-spinner").show();
                                $('.buttons-csv.export-addresses-to-csv-14').click();
                                const myParamsObject = {
                                    userID: "<%=hf_User.Value%>",
                                        eventType: "COUNTY_MDU_LIST_EXPORT",
                                        logData: CountyModalSelected
                                    };
                                    await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                                    setTimeout(() => {
                                        $(".export-addresses-spinner").hide();
                                        $(".export-addresses").removeAttr("disabled");
                                    }, 2000);
                                }
                            },
                            {
                                className: 'export-addresses-spinner',
                                text: '<img src="../ajax-loader_2.gif" />',
                            },
                            //{
                            //    text: buttonText + ' High Opportunity MDUs' + buttonText2,
                            //    titleAttr: buttonTitleAttr,
                            //    className: 'btn btn-primary export-high-opportunity-mdus-county',
                            //    action: function (e, dt, node, config) {
                            //        $(".export-high-opportunity-mdus-county").attr("disabled", "disabled");
                            //        $(".export-high-opportunity-mdus-county-spinner").show();
                            //        ponderApp.startDownloadChecker("export-high-opportunity-mdus-county", "export-high-opportunity-mdus-county-spinner", 1200);
                            //        TopMDUsExport_County();
                            //    }
                            //    //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            //},
                            //{
                            //    className: 'export-high-opportunity-mdus-county-spinner',
                            //    text: '<img src="../ajax-loader_2.gif" />',
                            //},
                            {
                                text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                                titleAttr: buttonTitleAttr2,
                                className: 'btn btn-primary export-unit-numbers-from-mdus-county',
                                action: function (e, dt, node, config) {
                                    $(".export-unit-numbers-from-mdus-county").attr("disabled", "disabled");
                                    $(".export-unit-numbers-from-mdus-county-spinner").show();
                                    ponderApp.startDownloadChecker("export-unit-numbers-from-mdus-county", "export-unit-numbers-from-mdus-county-spinner", 1200);
                                    TopMDUAddressesExport_County();
                                }
                                //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            },
                            {
                                className: 'export-unit-numbers-from-mdus-county-spinner',
                                text: '<img src="../ajax-loader_2.gif" />',
                            },
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            //{ 'data': 'ROWNUM' },
                            //{ 'data': 'ZIP' },
                            //{ 'data': 'ZIP_CO_PSA' },
                            //{
                            //    'data': null,
                            //    'className': "text-center",
                            //    'render': function(data, type, full) {
                            //        return '<a class="btn btn-primary btn-xsm" href=#/' + full[1] + '>' + 'Excel' + '</a>';

                            //    },
                            //    'action': function (e, dt, node, config) {
                            //        ExportSpecificPSAAddress();
                            //    }
                            //},
                            {
                                'defaultContent': tableRowButtonText,
                                'className': "text-center",
                            },
                            { 'data': 'COUNTY_RANK' },
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'ZIP' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' },
                            { 'data': 'MARKET_RANK' },
                            { 'data': 'DATA_DATE', visible: false }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                            $(".export-addresses-to-csv-14").hide();
                            $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-addresses-spinner").hide();
                            //$(".export-high-opportunity-mdus-county-spinner").css({ "background-color": "white", "border-style": "none" });
                            //$(".export-high-opportunity-mdus-county-spinner").hide();
                            $(".export-unit-numbers-from-mdus-county-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-unit-numbers-from-mdus-county-spinner").hide();
                            $(".export-county-mdus-row-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-county-mdus-row-spinner").hide();

                        },

                    });



                //fnDrawCallback: function () {
                //    $('#zipCodeModal_datatable tr').find('td').each(function () {
                //        $(this).on('mouseover', function () {
                //            $(this).parent().css('background', 'silver');
                //            this.style.cursor = 'pointer';
                //        }).on('mouseout', function () {
                //            $(this).parent().css('background', 'transparent');
                //            this.style.cursor = 'default';
                //        });                            

                //    });
                //},                                                



                function ExportSpecificPSAAddress() {
                    //console.log('ExportSpecificPSAAddress');
                }


                $('#CountyModal_MDUtable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var housenumber = $(tr).find('td').eq(2)[0].innerHTML;
                    var prefix = $(tr).find('td').eq(3)[0].innerHTML;
                    var streetname = $(tr).find('td').eq(4)[0].innerHTML;
                    var zip = $(tr).find('td').eq(5)[0].innerHTML;
                    if (Access == "Unlimited") {
                        $(tr).find(".export-county-mdus-row").attr("disabled", "disabled");
                        $(tr).find(".export-county-mdus-row-spinner").show();
                        $(tr).addClass('active');
                        ponderApp.startRowDownloadChecker("CountyModal_MDUtable", "export-county-mdus-row", "export-county-mdus-row-spinner", 1200);
                        selectedMDUGetAddresses(housenumber, prefix, streetname, zip);
                    } else {
                        selectedMDUShowAddresses(housenumber, prefix, streetname, zip);
                    }
                    return false;
                });

                async function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value = value;
                    const myParamsObject = {
                        type: "ExportToExcel_PSALocations_County",
                        psaLocationValue: document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                }

                async function selectedFiberGetExportAllCounty() {
                    const myParamsObject = {
                        type: "ExportToExcel_PSALocationsAllCounty",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                }

                async function selectedMDUGetAddresses(housenumber, prefix, streetname, zip) {
                    //log event
                    let myParamsObject = {
                        userID: "<%=hf_User.Value%>",
                        eventType: "COUNTY_MDU_SINGLE_EXPORT",
                        logData: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                        logJsonPayload: JSON.stringify({
                            "HouseNumber": housenumber,
                            "Prefix": prefix,
                            "Street Name": streetname,
                            "Zip": zip
                        })
                    };
                    await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                    //download data
                    document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = housenumber;
                    document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = streetname;
                    myParamsObject = {
                        type: "ExportToExcel_SelectedMDUAddressesCounty",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                        houseValue: housenumber,
                        prefixValue: prefix,
                        streetValue: streetname,
                        zipValue: zip,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
                }

                async function TopMDUsExport_County() {
                    const myParamsObject = {
                        type: "ExportToExcel_TopMDUsCounty",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'High_Opportunity_MDUs.csv');
                }

                async function TopMDUAddressesExport_County() {
                    if (Access == "Unlimited") {
                        //log event
                        let myParamsObject = {
                            userID: "<%=hf_User.Value%>",
                            eventType: "COUNTY_MDU_ALL_EXPORT",
                            logData: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value
                        };
                        await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                        //download data
                        myParamsObject = {
                            type: "ExportToExcel_MDUAddressesCounty",
                            mduValue: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                        };
                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                        ponderApp.downloadFile(data, 'MDU_Addresses_UnitNumbers.csv');
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");
                        clickButton.click();
                        $('#commonDiv').hide();
                        $('#limitedUserDiv').hide();
                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();
                        document.getElementById('showDataModalTitle').innerHTML = 'County FIPS: ' + CountyModalSelected + ' - MDUs';
                        const myParamsObject = {
                            type: "showData_MDUAddressesCounty",
                            CountyVariable: CountyModalSelected
                        };
                        const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                        unitNumbersData = JSON.parse(data.d);
                        // showDataMDUUnitNumbers(unitNumbersData);
                        ponderApp.showLimitedUserData(unitNumbersData);
                    }
                }

                function selectedMDUShowAddresses(housenumber, prefix, streetname, zip) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    MDUShowAddressesFromTableClick(housenumber, prefix, streetname, zip)
                }

                async function MDUShowAddressesFromTableClick(housenumber, prefix, streetname, zip) {
                    var houseNumberVariable = housenumber;
                    var streetNameVariable = streetname;
                    $('#commonDiv').hide();
                    $('#limitedUserDiv').hide();
                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText + ' - ' + houseNumberVariable + ' ' + streetNameVariable;
                    const myParamsObject = {
                        type: "showData_MDUAddressesCountyFromTable",
                        CountyVariable: CountyModalSelected,
                        houseValue: housenumber,
                        prefixValue: prefix,
                        streetValue: streetname,
                        zipValue: zip,
                    };
                    const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    unitNumbersData = JSON.parse(data.d);
                    // showDataMDUUnitNumbers(unitNumbersData);
                    ponderApp.showLimitedUserData(unitNumbersData);
                }

                //function showDataMDUUnitNumbers(data) {
                //    console.log('showDataModal_MDUtable_limitedUser');
                //    $('#showDataModal_MDUtable_limitedUser').dataTable().fnDestroy(); //destroy old table

                //    $('#LOADING_showData_Modal').hide();
                //    $('#showDataModalTableDiv').show();
                //    $('#commonDiv').hide();
                //    $('#limitedUserDiv').show();
                //    groupByFilter();

                //    var table = $('#showDataModal_MDUtable_limitedUser');

                //    // begin first table
                //    table.DataTable({
                //        //responsive: true,
                //        data: data,
                //        paging: false,
                //        //deferRender: true,
                //        scrollY: '200px',
                //        scrollCollapse: true,
                //        scrollX: true,
                //        //scroller: true,
                //        sort: false,
                //        //order: [[4, "desc"]],
                //        dom: 'frtip',
                //        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                //        columns: [
                //            { 'data': 'HOUSE_NUMBER' },
                //            { 'data': 'PREFIX' },
                //            { 'data': 'STREET_NAME' },
                //            { 'data': 'UNIT_NUMBER' },
                //            { 'data': 'CITY' },
                //            { 'data': 'STATE' },
                //            { 'data': 'ZIP' },
                //            { 'data': 'WIRELESS_SCORE' },
                //            { 'data': 'SERVICE_STATUS' },
                //            { 'data': 'DWELLING_TYPE' }
                //        ],

                //        initComplete: function () {
                //            this.api().columns().every(function () {
                //                var column = this;
                //                var select = $('<select><option value=""></option></select>')
                //                    .appendTo($(column.footer()).empty())
                //                    .on('change', function () {
                //                        var val = $.fn.dataTable.util.escapeRegex(
                //                            $(this).val()
                //                        );

                //                        column
                //                            .search(val ? '^' + val + '$' : '', true, false)
                //                            .draw();
                //                    });

                //                column.data().unique().sort().each(function (d, j) {
                //                    select.append('<option value="' + d + '">' + d + '</option>')
                //                });
                //            });
                //            this.api().columns().header().each(function (th) {
                //                $(th).removeClass("sorting_asc");
                //                $(th).removeClass("sorting");
                //            });
                //        },
                //    });

                //}




                $('#CountyModal_MDUtable tr').off().on('click', function () {


                    CountymapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CountyModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CountyModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    //console.log("latitudeClicked: " + latitudeClicked);
                    //console.log("longitudeClicked: " + longitudeClicked);

                    //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                    var loc = [latitudeClicked, longitudeClicked];
                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    if (CountyModalLayerGroup) {
                        CountyModalLayerGroup.removeFrom(CountymapModal);
                    }

                    CountyModalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                    CountyModalLayerGroup.addLayer(marker);
                    CountyModalLayerGroup.addTo(CountymapModal);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .01
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .01
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                        bounds = new L.LatLngBounds(southWest, northEast);

                    CountymapModal.fitBounds(bounds, { padding: [.05, .05] });

                    setTimeout(function () {
                        CountyModalLayerGroup.removeFrom(CountymapModal);
                    }, 2000);
                    //}
                });

                $('#CountyModal_MDUtable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );


                $(window).resize();

                //console.log('KTDataTables CountyMDUTable modal end');

            };

            var CMAMDUTable = (data, CMAModalSelected) => {


                var MDUCount = data.length;
                var MDUOpportunitySum = 0;


                for (var i = 0; i < data.length; i++) {
                    MDUOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }
                MDUOpportunitySumCOMMA = MDUOpportunitySum.toLocaleString('en');

                //document.getElementById('CMAModalSubtitleMDU').innerHTML = MDUCount + ' High Opportunity MDUs combine for ' + MDUOpportunitySum + ' Addresses to Sell Fiber Today';
                //document.getElementById('CMAModalSubtitleMDU').innerHTML = MDUOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today at these ' + MDUCount + ' Single Address MDUs';

                $('#CMAModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                var table = $('#CMAModal_MDUtable');
                document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value = CMAModalSelected;

                //document.getElementById('CMAModalTableSubtitle1').innerHTML = CMAModalSelected;

                let tableRowButtonText;
                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export High Opportunity MDUs (Single Address) to Excel';
                    var buttonTitleAttr2 = 'Export Unit Numbers from High Opportunity MDUs to Excel';
                    tableRowButtonText = "<button class='btn btn-primary btn-xsm export-cma-mdus-row'>Excel</button><button class='export-cma-mdus-row-spinner'><img src='../ajax-loader_2.gif' /></button>";
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)';
                    var buttonTitleAttr = 'Show High Opportunity MDUs (Single Address) in Table (limit 3000 rows)';
                    var buttonTitleAttr2 = 'Show Unit Numbers from High Opportunity MDUs in Table (limit 3000 rows)';
                    tableRowButtonText = "<button class='btn btn-primary btn-xsm'>Show List</button>";
                }

                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '200px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[4, "desc"]],
                    dom: 'Brtlifp',
                    buttons: [
                        {
                            extend: 'csv',
                            className: 'btn btn-primary export-addresses-to-csv-15',
                            exportOptions: {
                                columns: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
                            }
                        },
                        {
                            text: 'Export Table',
                            className: 'btn btn-primary export-addresses', titleAttr: 'Export Table To Excel', title: 'Export Table',
                            action: async function (e, dt, node, config) {
                                // return if limited users able to access the "Export To Excel" button
                                if (Access != "Unlimited") {
                                    return;
                                }
                                $(".export-addresses").attr("disabled", "disabled");
                                $(".export-addresses-spinner").show();
                                $('.buttons-csv.export-addresses-to-csv-15').click();
                                const myParamsObject = {
                                    userID: "<%=hf_User.Value%>",
                                        eventType: "CMA_MDU_LIST_EXPORT",
                                        logData: CMAModalSelected
                                    };
                                    await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                                    setTimeout(() => {
                                        $(".export-addresses-spinner").hide();
                                        $(".export-addresses").removeAttr("disabled");
                                    }, 2000);
                                }
                            },
                            {
                                className: 'export-addresses-spinner',
                                text: '<img src="../ajax-loader_2.gif" />',
                            },
                            //{
                            //    text: buttonText + ' High Opportunity MDUs' + buttonText2,
                            //    titleAttr: buttonTitleAttr,
                            //    className: 'btn btn-primary export-high-opportunity-mdus-cma',
                            //    action: function (e, dt, node, config) {
                            //        $(".export-high-opportunity-mdus-cma").attr("disabled", "disabled");
                            //        $(".export-high-opportunity-mdus-cma-spinner").show();
                            //        ponderApp.startDownloadChecker("export-high-opportunity-mdus-cma", "export-high-opportunity-mdus-cma-spinner", 1200);
                            //        TopMDUsExport();
                            //    }
                            //},
                            //{
                            //    className: 'export-high-opportunity-mdus-cma-spinner',
                            //    text: '<img src="../ajax-loader_2.gif" />',
                            //},
                            {
                                text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                                titleAttr: buttonTitleAttr2,
                                className: 'btn btn-primary export-unit-numbers-from-mdus-cma',
                                action: function (e, dt, node, config) {
                                    $(".export-unit-numbers-from-mdus-cma").attr("disabled", "disabled");
                                    $(".export-unit-numbers-from-mdus-cma-spinner").show();
                                    ponderApp.startDownloadChecker("export-unit-numbers-from-mdus-cma", "export-unit-numbers-from-mdus-cma-spinner", 1200);
                                    TopMDUAddressesExport();
                                }
                            },
                            {
                                className: 'export-unit-numbers-from-mdus-cma-spinner',
                                text: '<img src="../ajax-loader_2.gif" />',
                            },
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected                        
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': tableRowButtonText,
                                'className': "text-center",
                            },
                            { 'data': 'CMA_RANK' },
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'ZIP' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' },
                            { 'data': 'MARKET_RANK' },
                            { 'data': 'DATA_DATE', visible: false }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                            $(".export-addresses-to-csv-15").hide();
                            $(".export-addresses-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-addresses-spinner").hide();
                            //$(".export-high-opportunity-mdus-cma-spinner").css({ "background-color": "white", "border-style": "none" });
                            //$(".export-high-opportunity-mdus-cma-spinner").hide();
                            $(".export-unit-numbers-from-mdus-cma-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-unit-numbers-from-mdus-cma-spinner").hide();
                            $(".export-cma-mdus-row-spinner").css({ "background-color": "white", "border-style": "none" });
                            $(".export-cma-mdus-row-spinner").hide();
                        },

                    });

                function ExportSpecificPSAAddress() {
                    //console.log('ExportSpecificPSAAddress');
                }


                $('#CMAModal_MDUtable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var housenumber = $(tr).find('td').eq(2)[0].innerHTML;
                    var prefix = $(tr).find('td').eq(3)[0].innerHTML;
                    var streetname = $(tr).find('td').eq(4)[0].innerHTML;
                    var zip = $(tr).find('td').eq(5)[0].innerHTML;
                    if (Access == "Unlimited") {
                        $(tr).find(".export-cma-mdus-row").attr("disabled", "disabled");
                        $(tr).find(".export-cma-mdus-row-spinner").show();
                        $(tr).addClass('active');
                        ponderApp.startRowDownloadChecker("CMAModal_MDUtable", "export-cma-mdus-row", "export-cma-mdus-row-spinner", 1200);
                        selectedMDUGetAddresses(housenumber, prefix, streetname, zip);
                    } else {
                        selectedMDUShowAddresses(housenumber, prefix, streetname, zip);
                    }
                    return false;
                });

                async function selectedMDUGetAddresses(housenumber, prefix, streetname, zip) {
                    //log event
                    let myParamsObject = {
                        userID: "<%=hf_User.Value%>",
                        eventType: "CMA_MDU_SINGLE_EXPORT",
                        logData: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value,
                        logJsonPayload: JSON.stringify({
                            "HouseNumber": housenumber,
                            "Prefix": prefix,
                            "Street Name": streetname,
                            "Zip": zip
                        })
                    };
                    await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                    //download data
                    document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = housenumber;
                    document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = streetname;
                    myParamsObject = {
                        type: "ExportToExcel_SelectedMDUAddressesCMA",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value,
                        houseValue: housenumber,
                        prefixValue: prefix,
                        streetValue: streetname,
                        zipValue: zip,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
                }

                async function TopMDUsExport() {
                    //console.log('Top MDU Export Triggered');
                    const myParamsObject = {
                        type: "ExportToExcel_TopMDUsCMA",
                        mduValue: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value,
                    };
                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                    ponderApp.downloadFile(data, 'High_Opportunity_MDUs.csv');
                }

                async function TopMDUAddressesExport() {
                    if (Access == "Unlimited") {
                        //log event
                        let myParamsObject = {
                            userID: "<%=hf_User.Value%>",
                            eventType: "CMA_MDU_ALL_EXPORT",
                            logData: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value
                        };
                        await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                        //download data
                        myParamsObject = {
                            type: "ExportToExcel_MDUAddressesCMA",
                            mduValue: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value,
                        };
                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                        ponderApp.downloadFile(data, 'MDU_Addresses_UnitNumbers.csv');
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");
                        clickButton.click();
                        $('#commonDiv').hide();
                        $('#limitedUserDiv').hide();
                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();
                        document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - MDUs';
                        const myParamsObject = {
                            type: "showData_MDUAddressesCMA",
                            CMAVariable: CMAModalSelected,
                        };
                        const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                        unitNumbersData = JSON.parse(data.d);
                        //showDataMDUUnitNumbers(unitNumbersData);
                        ponderApp.showLimitedUserData(unitNumbersData);
                    }
                }

                function selectedMDUShowAddresses(housenumber, prefix, streetname, zip) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    MDUShowAddressesFromTableClick(housenumber, prefix, streetname, zip)
                }

                async function MDUShowAddressesFromTableClick(housenumber, prefix, streetname, zip) {
                    var houseNumberVariable = housenumber;
                    var streetNameVariable = streetname;
                    $('#commonDiv').hide();
                    $('#limitedUserDiv').hide();
                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - ' + houseNumberVariable + ' ' + streetNameVariable;
                    const myParamsObject = {
                        type: "showData_MDUAddressesCMAFromTable",
                        CMAVariable: CMAModalSelected,
                        houseValue: housenumber,
                        prefixValue: prefix,
                        streetValue: streetname,
                        zipValue: zip,
                    };
                    const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    unitNumbersData = JSON.parse(data.d);
                    //showDataMDUUnitNumbers(unitNumbersData);
                    ponderApp.showLimitedUserData(unitNumbersData);
                }

                //function showDataMDUUnitNumbers(data) {
                //    console.log('showDataModal_MDUtable_limitedUser');
                //    $('#showDataModal_MDUtable_limitedUser').dataTable().fnDestroy(); //destroy old table

                //    $('#LOADING_showData_Modal').hide();
                //    $('#showDataModalTableDiv').show();
                //    $('#commonDiv').hide();
                //    $('#limitedUserDiv').show();
                //    groupByFilter();

                //    var table = $('#showDataModal_MDUtable_limitedUser');

                //    // begin first table
                //    table.DataTable({
                //        //responsive: true,
                //        data: data,
                //        paging: false,
                //        //deferRender: true,
                //        scrollY: '200px',
                //        scrollCollapse: true,
                //        scrollX: true,
                //        //scroller: true,
                //        sort: false,
                //        //order: [[4, "desc"]],
                //        dom: 'frtip',
                //        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                //        columns: [
                //            { 'data': 'HOUSE_NUMBER' },
                //            { 'data': 'PREFIX' },
                //            { 'data': 'STREET_NAME' },
                //            { 'data': 'UNIT_NUMBER' },
                //            { 'data': 'CITY' },
                //            { 'data': 'STATE' },
                //            { 'data': 'ZIP' },
                //            { 'data': 'WIRELESS_SCORE' },
                //            { 'data': 'SERVICE_STATUS' },
                //            { 'data': 'DWELLING_TYPE' }
                //        ],

                //        initComplete: function () {
                //            this.api().columns().every(function () {
                //                var column = this;
                //                var select = $('<select><option value=""></option></select>')
                //                    .appendTo($(column.footer()).empty())
                //                    .on('change', function () {
                //                        var val = $.fn.dataTable.util.escapeRegex(
                //                            $(this).val()
                //                        );

                //                        column
                //                            .search(val ? '^' + val + '$' : '', true, false)
                //                            .draw();
                //                    });

                //                column.data().unique().sort().each(function (d, j) {
                //                    select.append('<option value="' + d + '">' + d + '</option>')
                //                });
                //            });
                //            this.api().columns().header().each(function (th) {
                //                $(th).removeClass("sorting_asc");
                //                $(th).removeClass("sorting");
                //            });
                //        },
                //    });

                //}


                $('#CMAModal_MDUtable tr').off().on('click', function () {


                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CMAModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CMAModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    //console.log("latitudeClicked: " + latitudeClicked);
                    //console.log("longitudeClicked: " + longitudeClicked);

                    //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                    var loc = [latitudeClicked, longitudeClicked];
                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    if (CMAModalLayerGroup) {
                        CMAModalLayerGroup.removeFrom(mapModal);
                    }

                    CMAModalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                    CMAModalLayerGroup.addLayer(marker);
                    CMAModalLayerGroup.addTo(mapModal);

                    var NE_lat = Number(latitudeClicked);
                    var NE_lng = Number(longitudeClicked);
                    var add1 = .01
                    var NE_lat_1 = NE_lat + add1;
                    var NE_lng_1 = NE_lng + add1;

                    var SW_lat = Number(latitudeClicked);
                    var SW_lng = Number(longitudeClicked);
                    var add1 = .01
                    var SW_lat_1 = SW_lat - add1;
                    var SW_lng_1 = SW_lng - add1;

                    var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                        northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                        bounds = new L.LatLngBounds(southWest, northEast);

                    mapModal.fitBounds(bounds, { padding: [.05, .05] });

                    setTimeout(function () {
                        CMAModalLayerGroup.removeFrom(mapModal);
                    }, 2000);
                    //}
                });

                $('#CMAModal_MDUtable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );


                $(window).resize();

                //console.log('KTDataTables zip modal4 end');


            };

            async function ExportAll_CMAs(marketGeo, marketType, sqlWhereClause, SortByVariable) {
                //CMAs can overlap markets and regions, so need to check Region 1, Region 2, and Market 1, Market 2, Market3
                if (marketType === 'REGION') {
                    marketType = 'SALES_REGION';
                }
                else {
                    marketType = 'SALES_MARKET';
                }
                const myParamsObject = {
                    type: "ExportToExcel_AllCMAs",
                    sortByValue: SortByVariable,
                    marketValue: marketGeo,
                    marketTypeValue: marketType,

                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, marketGeo + '_CMAs.csv');
            }

            async function ExportAll_Counties(marketGeo, marketType, sqlWhereClause, SortByVariable) {
                //console.log('ExportAll_Counties');
                if (marketType === 'REGION') {
                    marketType = 'SALES_REGION';
                }
                else {
                    marketType = 'SALES_MARKET';
                }
                const myParamsObject = {
                    type: "ExportToExcel_AllCounties",
                    sortByValue: SortByVariable,
                    marketValue: marketGeo,
                    marketTypeValue: marketType
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, $('#<%= ddlMarket.ClientID %> option:selected').val() + '_Counties.csv');
            }

            async function ExportAll_Zips(marketGeo, sqlWhereClause, SortByVariable) {
                //console.log('ExportAll_Zips');
                const myParamsObject = {
                    type: "ExportToExcel_AllZips",
                    sortByValue: SortByVariable,
                    marketValue: marketGeo
                };
                const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                ponderApp.downloadFile(data, marketGeo + '_Zips.csv');
            }


            //function getGeometry(VpgmData, idProperty) {

            //        VpgmLayerTest = L.geoJSON(VpgmData, { filter: zipFilter });
            //        function zipFilter(feature) {
            //            if (feature.properties.ZIP == idProperty) return true
            //        }
            //        map.fitBounds(VpgmLayerTest.getBounds());

            //    };

            async function GET_MAP_THEME_DATA(storeData, marketType, GroupBy, marketGeoJSONName, futurePSAData) {
                //console.log('GET_MAP_THEME_DATA function start');
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var countyGeo;
                if (groupGeo == 'SALES') {
                    if (marketType == 'NATIONAL') {
                        //National can only be CMA level
                        const myParamsObject = {
                            type: "Get_cma_theme_data",
                            marketVariable: marketGeo,
                            marketTypeVariable: marketType
                        };
                        let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                        const Data1 = data.d;
                        theme_data = JSON.parse(Data1);
                        $.when(
                            //improvement_needed - is there ever a benefit of automatically refreshing geojsons? Probably just manually update whenever needed?
                            $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_020121.json", function (data) {
                                VpgmData3 = data;
                            }),
                            $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                MarketBoundaryData = data;
                            }),
                        ).then(function () {
                            VpgmData3.features.forEach(function (element) {
                                theme_data.find(function (newElement) {
                                    if (element.properties.cma == newElement.CMA) {
                                        element.properties.TOTALAREA = newElement.TOTALAREA;
                                        element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                        element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                        element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                        element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                        element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                        element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                        element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                        element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                        element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                        element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                        element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                        element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                        element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                        element.properties.FIBER_PERCENTAGE = newElement.FIBER_PERCENTAGE;
                                        element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                        element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;

                                    }
                                });
                            });
                            storeMapV3_National(storeData, VpgmData3, MarketBoundaryData, marketType);
                        });
                    } else if (marketType == 'REGION') {
                        //Regional can be shown by County or CMA
                        if (GroupBy == 'COUNTY') {
                            countyGeo = marketGeo;
                            const myParamsObject = {
                                type: "Get_county_theme_data",
                                marketVariable: marketGeo,
                                marketTypeVariable: marketType
                            };
                            const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                            const Data1 = data.d;
                            theme_data = JSON.parse(Data1);
                            $.when(
                                $.getJSON("SalesVpgmCounties/" + countyGeo + "_COUNTY_GEOJSON_MAPSHAPER_1_FME_020121.json", function (data) {
                                    VpgmData2 = data;
                                }),
                                $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                }),
                            ).then(function () {
                                VpgmData2.features.forEach(function (element) {
                                    theme_data.find(function (newElement) {
                                        if (element.properties.Cnty_FIPS == newElement.CNTY_FIPS) {
                                            element.properties.Cnty_FIPS = newElement.CNTY_FIPS;
                                            element.properties.TOTALAREA = newElement.TOTALAREA;
                                            element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                            element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                            element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                            element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                            element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                            element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                            element.properties.STATE_ABBR = newElement.STATE_ABBR;
                                            element.properties.COUNTY_STATE = newElement.COUNTY_STATE;
                                            element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                            element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                            element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                            element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                            element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                            element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                            element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                            element.properties.FIBER_PERCENTAGE = newElement.FIBER_PERCENTAGE;
                                            element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                            element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;
                                        }
                                    });
                                });
                                storeMapV3_Region(storeData, VpgmData2, MarketBoundaryData);
                            });
                        }
                        else if (GroupBy == 'CMA') {
                            countyGeo = marketGeo;
                            const myParamsObject = {
                                type: "Get_cma_theme_data",
                                marketVariable: marketGeo,
                                marketTypeVariable: marketType
                            };
                            let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                            const Data1 = data.d;
                            theme_data = JSON.parse(Data1);

                            $.when(
                                $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_020121.json", function (data) {
                                    VpgmData3 = data;
                                }),
                                $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                }),
                            ).then(function () {

                                for (var i = 0; i < VpgmData3.features.length; i++) {
                                    if (VpgmData3.features[i].properties.SALES_REGION1 != countyGeo && VpgmData3.features[i].properties.SALES_REGION2 != countyGeo) {
                                        VpgmData3.features.splice(i, 1);
                                        i--; //otherwise it will skip the next element after removing an index. Ex: After removing index at i = 2, need to check the new i = 2 which was previously i = 3
                                    }
                                }
                                VpgmData3.features.forEach(function (element) {
                                    theme_data.find(function (newElement) {
                                        if (element.properties.cma == newElement.CMA) {
                                            element.properties.TOTALAREA = newElement.TOTALAREA;
                                            element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                            element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                            element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                            element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                            element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                            element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                            element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                            element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                            element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                            element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                            element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                            element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                            element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                            element.properties.FIBER_PERCENTAGE = newElement.FIBER_PERCENTAGE;
                                            element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                            element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;

                                        }
                                    });
                                });
                                //improvement_needed - is it possible to filter to show just the selected Region's CMAs here? 
                                //How do we get Region info from the CMA properties ? Is it better to filter later, in leaflet?
                                //console.log('VpgmData3');
                                //console.log(VpgmData3);
                                //console.log('VpgmData3.features');
                                //console.log(VpgmData3.features);
                                storeMapV3_National(storeData, VpgmData3, MarketBoundaryData, marketType);
                            });
                        }
                    } else if (marketType == 'MARKET') {
                        //Market can be shown by Zip, County, or CMA
                        //improvement_needed - how do we more automatically check to see if we have fiber for the given market?
                        if (marketGeoJSONName == 'FLORIDA' | marketGeoJSONName == 'GREATER LAKES' | marketGeoJSONName == 'GULF STATES' | marketGeoJSONName == 'SOUTHEAST STATES' | marketGeoJSONName == 'KAMO' |
                            marketGeoJSONName == 'MID-ATLANTIC' | marketGeoJSONName == 'NORTHERN CALIFORNIA' | marketGeoJSONName == 'NTX' | marketGeoJSONName == 'OHIO PENNSYLVANIA' | marketGeoJSONName == 'SOUTHERN CALIFORNIA' | marketGeoJSONName == 'STX') {
                            document.getElementById('mapcountwarning').innerHTML = "";
                            // document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " by " + GroupBy;
                            document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                            if (GroupBy == 'ZIP') {
                                //zip can only be shown for markets, dont need market type variable
                                //console.log('marketGeo' + marketGeo);
                                const myParamsObject = {
                                    type: "Get_zip_theme_data",
                                    marketVariable: marketGeo,
                                };
                                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                                Data1 = data.d;
                                theme_data = JSON.parse(Data1);
                                $.when(
                                    $.getJSON("salesVPGMZipsTest/" + marketGeoJSONName + "_ZIP_GEOJSON_MS2_FME_020121.json", function (data) {
                                        VpgmData = data;
                                    }),
                                    $.getJSON("PSALocationsProd/" + marketGeoJSONName + "_PSA_GEOJSON.json", function (data) {
                                        PSAData = data;
                                    }),
                                    //$.getJSON("PSALocationsProd/" + marketGeoJSONName + "_PSA_GEOJSON.json", function (data) {
                                    //    PSAData2 = data;
                                    //}),
                                    $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                        MarketBoundaryData = data;
                                        //prep(MarketBoundaryData);
                                    }),
                                ).then(function () {
                                    //console.log('GET_MAP_THEME_DATA function check1');
                                    VpgmData.features.forEach(function (element) {
                                        theme_data.find(function (newElement) {
                                            if (element.properties.ZIP == newElement.ZIP) {
                                                element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                                element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                                element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                                element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                                element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                                element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                                element.properties.STATE = newElement.STATE;
                                                element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                                element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                                element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                                element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                                element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                                element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                                element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                                element.properties.FIBER_PERCENTAGE = newElement.FIBER_PERCENTAGE;
                                                element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                                element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;
                                            }
                                        });
                                    });
                                    //PSAData.features.forEach(function (element) {
                                    //    PSAData2.find(function (newElement) {
                                    //        if (element.properties.Zip_CO_PSA == newElement.Zip_CO_PSA) {
                                    //            element.properties.Wireless_score = newElement.Wireless_score;
                                    //        }
                                    //    });
                                    //});
                                    //console.log('GET_MAP_THEME_DATA function check2');
                                    //storeMap(VpgmData, theme_data);
                                    storeMapV3_Market(VpgmData, storeData, MarketBoundaryData, PSAData, futurePSAData);
                                });
                            }
                            //improvement_needed - how do we assign markets to regions in a better way than listing them here? Listing requires maintenance.
                            else if (GroupBy == 'COUNTY') {
                                countyGeo = "WEST";
                                if (marketGeoJSONName == 'FLORIDA' | marketGeoJSONName == 'GREATER LAKES' | marketGeoJSONName == 'GULF STATES' | marketGeoJSONName == 'MID-ATLANTIC' | marketGeoJSONName == 'OHIO PENNSYLVANIA' | marketGeoJSONName == 'SOUTHEAST STATES') {
                                    countyGeo = "EAST";
                                }
                                const myParamsObject = {
                                    type: "Get_county_theme_data",
                                    marketVariable: marketGeo,
                                    marketTypeVariable: marketType
                                };
                                const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                                const Data1 = data.d;
                                theme_data = JSON.parse(Data1);
                                $.when(
                                    $.getJSON("SalesVpgmCounties/" + countyGeo + "_COUNTY_GEOJSON_MAPSHAPER_1_FME_020121.json", function (data) {
                                        VpgmData2 = data;
                                    }),
                                    $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                        MarketBoundaryData = data;
                                    }),
                                    $.getJSON("PSALocationsProd/" + marketGeoJSONName + "_PSA_GEOJSON.json", function (data) {
                                        PSAData = data;
                                    }),
                                ).then(function () {
                                    for (var i = 0; i < VpgmData2.features.length; i++) {
                                        //improvement_needed - update regional county geojson to have property name of SALES_MARKET, make sure market names are consistant
                                        if (VpgmData2.features[i].properties.Sales_Mark != marketGeo) {
                                            VpgmData2.features.splice(i, 1);
                                            i--; //otherwise it will skip the next element after removing an index. Ex: After removing index at i = 2, need to check the new i = 2 which was previously i = 3
                                        }
                                    }
                                    VpgmData2.features.forEach(function (element) {
                                        theme_data.find(function (newElement) {
                                            if (element.properties.Cnty_FIPS == newElement.CNTY_FIPS) {
                                                element.properties.Cnty_FIPS = newElement.CNTY_FIPS;
                                                element.properties.TOTALAREA = newElement.TOTALAREA;
                                                element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                                element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                                element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                                element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                                element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                                element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                                element.properties.STATE_ABBR = newElement.STATE_ABBR;
                                                element.properties.COUNTY_STATE = newElement.COUNTY_STATE;
                                                element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                                element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                                element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                                element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                                element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                                element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                                element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                                element.properties.FIBER_PERCENTAGE = newElement.FIBER_PERCENTAGE;
                                                element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                                element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;
                                            }
                                        });
                                    });
                                    storeMapV3_Region(storeData, VpgmData2, MarketBoundaryData, PSAData, futurePSAData);
                                });
                            }
                            else if (GroupBy == 'CMA') {
                                const myParamsObject = {
                                    type: "Get_cma_theme_data",
                                    marketVariable: marketGeo,
                                    marketTypeVariable: marketType
                                };
                                let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                                const Data1 = data.d;
                                theme_data = JSON.parse(Data1);
                                $.when(
                                    $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_020121.json", function (data) {
                                        VpgmData3 = data;
                                    }),
                                    $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                        MarketBoundaryData = data;
                                    }),
                                    $.getJSON("PSALocationsProd/" + marketGeoJSONName + "_PSA_GEOJSON.json", function (data) {
                                        PSAData = data;
                                    }),
                                ).then(function () {
                                    //console.log(VpgmData3.features[0].properties);
                                    for (var i = 0; i < VpgmData3.features.length; i++) {
                                        if (VpgmData3.features[i].properties.SALES_MARKET1 != marketGeo && VpgmData3.features[i].properties.SALES_MARKET2 != marketGeo
                                            && VpgmData3.features[i].properties.SALES_MARKET3 != marketGeo) {
                                            VpgmData3.features.splice(i, 1);
                                            i--; //otherwise it will skip the next element after removing an index. Ex: After removing index at i = 2, need to check the new i = 2 which was previously i = 3
                                        }
                                    }
                                    VpgmData3.features.forEach(function (element) {
                                        theme_data.find(function (newElement) {
                                            if (element.properties.cma == newElement.CMA) {
                                                element.properties.TOTALAREA = newElement.TOTALAREA;
                                                element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                                element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                                element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                                element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                                element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                                element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                                element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                                element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                                element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                                element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                                element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                                element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                                element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                                element.properties.FIBER_PERCENTAGE = newElement.FIBER_PERCENTAGE;
                                                element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                                element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;
                                            }
                                        });
                                    });

                                    storeMapV3_National(storeData, VpgmData3, MarketBoundaryData, marketType, PSAData, futurePSAData);
                                });
                            }
                        } else {
                            document.getElementById('mapcountwarning').innerHTML = "No fiber found in this market - No current fiber sales opportunities exist.";
                            document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text();
                            document.getElementById('mapcountsubtitle').innerHTML = "";
                            const myParamsObject = {
                                type: "Get_zip_theme_data",
                                marketVariable: marketGeo,
                            };
                            const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                            Data1 = data.d;
                            theme_data = JSON.parse(Data1);
                            $.when(
                                $.getJSON("salesVPGMZipsTest/" + marketGeo + "_ZIP_GEOJSON_MS2_FME_020121.json", function (data) {
                                    VpgmData = data;
                                }),
                                //$.getJSON("PSALocationsProd/" + marketGeo + "_PSA_GEOJSON.json", function (data) {
                                //    PSAData = data;
                                //}),
                                $.getJSON("SalesGeo/VPGM_Markets_geojson_020121_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    //prep(MarketBoundaryData);
                                }),
                            ).then(function () {
                                //console.log('GET_MAP_THEME_DATA function check1 alt');
                                VpgmData.features.forEach(function (element) {
                                    theme_data.find(function (newElement) {
                                        if (element.properties.ZIP == newElement.ZIP) {
                                            element.properties.TOTALPOPS = newElement.TOTALPOPS;
                                            element.properties.POP_DENSITY = newElement.POP_DENSITY;
                                            element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                                            element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                                            element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                                            element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                                            element.properties.STATE = newElement.STATE;
                                            element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                                            element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                                            element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                                            element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                                            element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                                            element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;
                                            element.properties.NUMBER_OF_PSAS = newElement.NUMBER_OF_PSAS;
                                            element.properties.COPPER_UPGRADE = newElement.COPPER_UPGRADE;
                                            element.properties.ELDERLY_PERCENT = newElement.ELDERLY_PERCENT;
                                        }
                                    });
                                });
                                //console.log('GET_MAP_THEME_DATA function check2 alt');
                                //storeMap(VpgmData, theme_data);
                                var PSAData = 'NoPSAData';
                                storeMapV3_Market(VpgmData, storeData, MarketBoundaryData, PSAData);
                            });
                        }
                    }
                }
            }

            <%--function updateSalesOpportunityChart() {
                console.log('updateStoreChart function start');

                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                console.log('Get_Store_Detail groupGeo: ' + groupGeo);
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('Get_Store_Detail marketGeo: ' + marketGeo);

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'GEORGIA / SOUTH CAROLINA') {
                        marketGeo = 'GEORGIA SOUTH CAROLINA'
                    } if (marketGeo == 'NTX') {
                        marketGeo = 'NORTH TEXAS'
                    } if (marketGeo == 'STX') {
                        marketGeo = 'SOUTH TEXAS'
                    } if (marketGeo == 'NEW YORK / NEW JERSEY') {
                        marketGeo = 'NEW YORK NEW JERSEY'
                    } if (marketGeo == 'PR/VI') {
                        marketGeo = 'PUERTO RICO VIRGIN ISLAND'
                    }
                    else { marketGeo = marketGeo }
                }

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity.aspx/Get_Store_Detail",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
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
                        url: "Sales_Opportunity.aspx/Get_Store_Detail2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
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
                        url: "Sales_Opportunity.aspx/Get_Store_Detail3",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
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

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_Opportunity.aspx/Get_Master_Data",  //use a function from C# , change this for different data return
                //    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                //    dataType: "json",
                //    contentType: "application/json; charset=utf-8",
                //    success: function (data) {
                //        //data = JSON.parse(data.d);
                //        loadMasterData(data);
                //    },
                //    error: function (data, market, time, market_long) {
                //    }
                //})

            }--%>

            //function dataConcat_3strings(data1, data2, data3) {
            //    var dataConcat3;

            //    data1 = data1.substring(0, data1.length - 1);
            //    data2 = data2.substring(1, data2.length - 1);
            //    data3 = data3.substring(1, data3.length);
            //    dataConcat3 = data1 + ',' + data2 + ',' + data3;
            //    loadStoreData(dataConcat3);
            //}

            //function loadStoreData(data) {
            //    $('#LOADING_Recent2').hide();
            //    $('#storemapShow').show();

            //    console.log('loadStoreData function start')

            //    data = JSON.parse(data);

            //    if (data.length <= 0) {
            //        return;
            //    }
            //    else {

            //        $('#Store_Detail').dataTable().fnDestroy(); //destroy old table
            //        //$.fn.dataTable.moment('MM-DD-YYYY');
            //        $('#Store_Detail').DataTable({ //build new table
            //            orderCellsTop: false,
            //            fixedHeader: false,
            //            paging: false,
            //            sort: true,
            //            scrollY: 200,
            //            scrollCollapse: true,
            //            scrollX: true,
            //            order: [[11, "asc"]],
            //            searching: true,
            //            data: data,
            //            info: false,
            //            binfo: true,
            //            dom: 'Bfrtip',
            //            buttons: [{ extend: 'csv', title: 'Store_Detail_Export' }, { extend: 'excelHtml5', title: 'Store_Detail_Export' }, {
            //                text: 'Update Map',
            //                titleAttr: 'Update Map to apply the filters from the bottom of the table below',
            //                action: function (e, dt, node, config) {
            //                    GET_MAP_THEME_DATA();
            //                    //storeMap();
            //                }
            //            }],
            //            //columnDefs: [{ visible: false, targets: 8 }],
            //            columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

            //                { 'data': 'STORE_CATEGORY' },
            //                { 'data': 'LOCATION_ID' },
            //                { 'data': 'LOCATION_NAME' },
            //                { 'data': 'MASTER_DEALER' },
            //                { 'data': 'ADDRESS_1' },
            //                { 'data': 'ADDRESS_2' },
            //                { 'data': 'CITY' },
            //                { 'data': 'STATE' },
            //                { 'data': 'ZIP_CODE' },
            //                { 'data': 'COUNTY' },
            //                { 'data': 'LATITUDE' },
            //                { 'data': 'LONGITUDE' },
            //                { 'data': 'SALES_REGION' },
            //                { 'data': 'SALES_VPGM_MARKET' }

            //            ],


            //            //Highlight rows that don't have lat longs in the detail table in Red
            //            createdRow: function (row, data, index) {
            //                if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
            //                    $(row).addClass('highlightRed');
            //                }
            //            },

            //            "fnDrawCallback": function () {
            //                $('#Store_Detail tr').find('td').each(function () {
            //                    $(this).on('mouseover', function () {
            //                        $(this).parent().css('background', 'silver');

            //                        this.style.cursor = 'pointer';
            //                    }).on('mouseout', function () {
            //                        $(this).parent().css('background', 'transparent');
            //                        this.style.cursor = 'default';
            //                    });

            //                });
            //            },

            //            initComplete: function () {
            //                this.api().columns().every(function () {
            //                    var column = this;
            //                    var select = $('<select><option value=""></option></select>')
            //                        .appendTo($(column.footer()).empty())
            //                        .on('change', function () {
            //                            var val = $.fn.dataTable.util.escapeRegex(
            //                                $(this).val()
            //                            );

            //                            column
            //                                .search(val ? '^' + val + '$' : '', true, false)
            //                                .draw();
            //                        });

            //                    column.data().unique().sort().each(function (d, j) {
            //                        select.append('<option value="' + d + '">' + d + '</option>')
            //                    });
            //                });
            //            }
            //        });

            //    }

            //    $(window).resize();

            //    GET_MAP_THEME_DATA(data);
            //}

            var map;

            var vectorGridZip0;
            var vectorGridZip1;
            var vectorGridZip2;
            var vectorGridZip3;
            var vectorGridZip4;
            var vectorGridCounty;
            var vectorGridCMA;




            var storeMapV3_Market = async function (VpgmData, storeData, MarketBoundaryData, PSAData, futurePSAData) {

                $('#buttonrowzip').show();
                $('#MapDiv').show();
                $('#zipTableDiv').show();
                $('#LOADING1').hide();
                $('#ddlMarket').removeAttr('disabled');
                $('#ddlGroupBy').removeAttr('disabled');
                //$('#ddlRegionGroupBy').removeAttr('disabled');
                //$('#ddlMarketGroupBy').removeAttr('disabled');
                $('#ddlHeatTheme').removeAttr('disabled');

                if (PSAData == 'NoPSAData') {
                    $('#zipfooter').hide();
                    //$('#zipfooter2').show();
                } else {

                    $('#zipfooter').show();

                    if (marketType == 'MARKET') {

                        if (Access == "Unlimited") {
                            $('#psaFooterLimited').hide();
                            $('#psaFooterUnlimited').show();
                        } else {
                            $('#psaFooterLimited').show();
                            $('#psaFooterUnlimited').hide();
                        }
                    }

                    else {
                        $('#psaFooterLimited').hide();
                        $('#psaFooterUnlimited').hide();
                    }

                }

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                //var ATTR = storeData.filter(function (el) {
                //    return el.STORE_CATEGORY.includes("ATTR");
                //});
                //var AR = storeData.filter(function (el) {
                //    return el.STORE_CATEGORY.includes("AR");
                //});

                //var ATTRstorePoints = new L.layerGroup();
                //var ARstorePoints = new L.layerGroup();

                //for (i in ATTR) {
                //    var popup =
                //        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                //        '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                //        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                //        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                //        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                //        ATTRstoreTableoptions = {
                //            iconShape: 'doughnut',
                //            iconSize: [12, 12],
                //            borderWidth: 4,
                //            borderColor: '#002280'
                //        };

                //    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                //    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                //    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.7);
                //    marker.bindPopup(popup);
                //    ATTRstorePoints.addLayer(marker);
                //}

                //for (i in AR) {
                //    var popup =
                //        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                //        '<b>Store Category:</b> ' + 'Authorized Reseller' +
                //        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                //        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                //        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                //        ARstoreTableoptions = {
                //            iconShape: 'doughnut',
                //            iconSize: [12, 12],
                //            borderWidth: 4,
                //            borderColor: '#21b2ff'
                //        };

                //    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                //    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                //    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.7);
                //    marker.bindPopup(popup);
                //    ARstorePoints.addLayer(marker);
                //}

                document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " Zips colored by " + $('#<%= ddlHeatTheme.ClientID %> option:selected').text();
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //    }),
                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                    id: 'osm.topo',
                    maxZoom: 17,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                    sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                        id: 'arcgis.sat',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                        subdomains: ['a', 'b', 'c']
                    }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
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

                //var tileOptions = {
                //    maxZoom: 18,
                //    tolerance: 5,
                //    extent: 4096,
                //    buffer: 64,
                //    debug: 0,
                //    indexMaxZoom: 0,
                //    indexMaxPoints: 100000,
                //};
                //var tileIndex = geojsonvt(PSAData, tileOptions);

                console.log('psa data: ' + PSAData)

                var PSAIconOptions = {
                    iconShape: 'doughnut',
                    iconSize: [24, 24],
                    borderWidth: 4,
                    borderColor: '#002280'
                };

                if (PSAData == 'NoPSAData') {
                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        layers: [streets],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else {
                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        layers: [streets],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });

                    if (PSAData) {
                        const title = "PSA Locations";
                        let pane = map.getPane(title);
                        if (!pane) {
                            pane = map.createPane(title);
                            pane.style.zIndex = 400;
                        }
                        const response = ponderApp.createMaskCanvas(
                            {
                                pane,
                                heatMapDataKey: 'WIRELESS_SCORE',
                                heatMapObject: {
                                    "5": "#003300",
                                    "4": "#008000",
                                    "3": "#00cc00",
                                    "2": "#ffff00",
                                    "1": "#e6b800"
                                },
                            }, {
                            title,
                            isDefault: 0,
                            minZoomVisibility: 10,
                            maxZoomVisibility: 20,
                            markerType: 'psa'
                        },
                            PSAData);
                        PSALayerZip = response.canvasLayer;
                        psaDataForMaskCanvas = response.psaData;
                        map.addLayer(PSALayerZip);
                    }

                    if (futurePSAData) {
                        FuturePSALayerZip = (await createFuturePSAsLayer(map, 'Future PSA Locations', futurePSAData)).canvasLayer;
                        map.addLayer(FuturePSALayerZip);
                    }

                    map.on('enterFullscreen', function () {
                        //console.log('enter Fullscreen');
                        ZipFullScreenState = 1;
                    });

                    map.on('exitFullscreen', function () {
                        //console.log('exit Fullscreen');
                        ZipFullScreenState = 0;
                    });

                    map.on("zoomend", function (e) {
                        ponderApp.showHideLayers(this);
                    });

                    //const myEventForwarder = new L.eventForwarder({
                    //    map: map,
                    //    // events to forward
                    //    events: { click: true, mousemove: false }
                    //});

                    //// enable event forwarding
                    //myEventForwarder.enable();
                }


                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    //if (groupGeo == "ACE") {
                    //    if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                    //        featureLayer.bindPopup(feature.properties.Region);
                    //    }
                    //    else {
                    //        featureLayer.bindPopup(feature.properties.Market_Lon);
                    //    }
                    //} else {
                    //featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    //}
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(map);

                //L.control.touchHover().addTo(map);

                //if (L.Browser.touch) {
                //    L.control.touchHover().addTo(map);
                //}

                infoZip = L.control({ position: 'bottomleft' });

                infoZip.onAdd = function (map) {
                    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                    this.update();
                    return this._div;
                };

                // method that we will use to update the control based on feature properties passed
                infoZip.update = function (props) {

                    console.log("props: " + props);

                    var TOTALPOPSCOMMA = "";
                    var COPPER_UPGRADECOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var zipTouchLink;

                    if (props) {
                        TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                        COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    }


                    if (props) {
                        if (L.Browser.touch) {
                            if (props.NUMBER_OF_PSAS == 0) {
                                zipTouchLink = '';
                            } else {
                                zipTouchLink = '<br /><a href="#" class="ZipTouchDetailLink">Click to Show PSA Location Details</a>';
                            }
                        } else {
                            zipTouchLink = '';
                        }
                    }

                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    let heatMapConfig = ponderApp.heatMapConfig(props)[heatTheme];

                    //Baseball Card for Zip Map from hovering
                    this._div.innerHTML = '<h4>Zip Code Information</h4>' + (props ?
                        '<b>Zip Code: ' + props.ZIP + ', ' + props.STATE + '</b>'
                        + heatMapConfig.baseBallCardInfo.description
                        + '<br />' + '<b>Wireless Category: ' + props.WIRELESS_CATEGORY + '</b>'
                        + '<br />' + '<b>Fiber Addresses Available: ' + FIBER_AVAILABLECOMMA + '</b>'
                        + '<br />' + '<b>Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + ' (' + props.FIBER_PERCENTAGE + '%)' + '</b>'
                        + '<br />' + '<b>Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA + '</b>'
                        + '<br />' + '<b>Copper Upgrade: ' + COPPER_UPGRADECOMMA + '</b>'
                        + zipTouchLink
                        : 'Hover over a zip code');

                    $('.ZipTouchDetailLink').click(function () {
                        showZipTouchModal(props);
                    });

                    var showZipTouchModal = (props) => {
                        ZipTouchModal_Click();
                        updateZipModal(props); // function for getting data for modal
                    }

                    var ZipTouchModal_Click = (source, eventArgs) => {
                        var clickButton = document.getElementById("<%= btnZipModal.ClientID %>");
                        $('#LOADING_ZIP_Modal').show();
                        $('#ModalDisplay').hide();
                        if (Access == "Unlimited") {
                            $('#zipfooterMapModal3').hide();
                            $('#zipfooterMapModal').show();
                        } else {
                            $('#zipfooterMapModal').hide();
                            $('#zipfooterMapModal3').show();
                        }
                        clickButton.click();
                    }

                    //var cssinfo = "info";
                    //if (props) {
                    //    if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                    //        cssinfo = "info1";
                    //    } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                    //        cssinfo = "info2";
                    //    } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                    //        cssinfo = "info3";
                    //    } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                    //        cssinfo = "info4";
                    //    } else {
                    //        cssinfo = "info";
                    //    };

                    //    this._div.classList.remove("info");
                    //    this._div.classList.remove("info1");
                    //    this._div.classList.remove("info2");
                    //    this._div.classList.remove("info3");
                    //    this._div.classList.remove("info4");
                    //    this._div.classList.add(cssinfo);
                    //} else {
                    //    this._div.classList.remove("info");
                    //    this._div.classList.remove("info1");
                    //    this._div.classList.remove("info2");
                    //    this._div.classList.remove("info3");
                    //    this._div.classList.remove("info4");
                    //    this._div.classList.add(cssinfo);
                    //}

                    let cssinfo = "info";
                    let borderColor;

                    if (props) {
                        if (heatMapConfig.button1.criteria) {
                            cssinfo = "info1";
                            borderColor = heatMapConfig.button1.color;
                        }
                        else if (heatMapConfig.button2.criteria) {
                            cssinfo = "info2";
                            borderColor = heatMapConfig.button2.color;
                        }
                        else if (heatMapConfig.button3.criteria) {
                            cssinfo = "info3";
                            borderColor = heatMapConfig.button3.color;
                        }
                        else if (heatMapConfig.button4.criteria) {
                            cssinfo = "info4";
                            borderColor = heatMapConfig.button4.color;
                        }
                    }

                    this._div.classList.remove("info");
                    this._div.classList.remove("info1");
                    this._div.classList.remove("info2");
                    this._div.classList.remove("info3");
                    this._div.classList.remove("info4");
                    this._div.classList.add(cssinfo);
                    // Can use below line to dynamically adjust border Color of baseball card
                    // $("." + cssinfo).css("border-color", borderColor);

                };

                infoZip.addTo(map);



                var highlight;
                var highlight0;
                var highlight1;
                var highlight2;
                var highlight3;
                var highlight4;

                var clearHighlight = function (e) {                    
                    if (highlight) {
                        vectorGridZip.resetFeatureStyle(highlight);
                        infoZip.update();
                    }
                    highlight = null;
                    ClickToZip(e);
                };

                var clearHighlight0 = function () {
                    if (highlight0) {
                        vectorGridZip0.resetFeatureStyle(highlight0);
                        infoZip.update();
                    }
                    highlight0 = null;
                };

                var clearHighlight1 = function () {
                    if (highlight1) {
                        vectorGridZip1.resetFeatureStyle(highlight1);
                        infoZip.update();
                    }
                    highlight1 = null;
                };

                var clearHighlight2 = function () {
                    if (highlight2) {
                        vectorGridZip2.resetFeatureStyle(highlight2);
                        infoZip.update();
                    }
                    highlight2 = null;
                };

                var clearHighlight3 = function () {
                    if (highlight3) {
                        vectorGridZip3.resetFeatureStyle(highlight3);
                        infoZip.update();
                    }
                    highlight3 = null;
                };

                var clearHighlight4 = function () {
                    if (highlight4) {
                        vectorGridZip4.resetFeatureStyle(highlight4);
                        infoZip.update();
                    }
                    highlight4 = null;
                };

                //function getGeometry(VpgmData, idProperty) {

                //    VpgmLayerTest = L.geoJSON(VpgmData, { filter: zipFilter });
                //    function zipFilter(feature) {
                //        if (feature.properties.ZIP == idProperty) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());

                //};

                vectorGridZip0 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                            const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                            return {
                                fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                    heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                        heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                            heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                '#ffffff',

                                //var p = properties.OVERALL_CAT;
                                //return {
                                //    fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                //        p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                //            p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                //                p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                                //                    '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    },

                })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    //clearHighlight0();
                    //    //highlight0 = properties.ZIP;

                    //    var p = properties.OVERALL_CAT;
                    //    var style = {
                    //        //fillColor: p > 5000 ? '#b3ffb3' :
                    //        //    p > 4000 ? '#b3d9ff' :
                    //        //        p > 3000 ? '#ffff99' :
                    //        //            p > 1000 ? '#ffe6cc' :
                    //        //                '#ffffff',
                    //        //fillOpacity: 0.5,
                    //        //fillOpacity: 1,
                    //        stroke: true,
                    //        //fill: true,
                    //        color: '#008000',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    infoZip.update(properties);

                    //    vectorGridZip0.setFeatureStyle(properties.ZIP, style);
                    //})

                    //.on('mouseout', function (e) {
                    //    var properties = e.layer.properties;
                    //    clearHighlight0();
                    //    highlight0 = properties.ZIP;

                    //    //infoZip.update(properties);

                    //})

                    //.on('click', function (e) {

                    //    var properties = e.layer.properties;
                    //    getGeometry(VpgmData, properties.ZIP);

                    //})

                    .addTo(map);

                vectorGridZip1 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                            const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                            return {
                                fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.highlightColor :
                                    heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                        heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                            heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                '#ffffff',
                                //var p = properties.OVERALL_CAT;
                                //return {
                                //    fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                //        p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                //            p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                //                p == 'WeakWirelessNoFiber' ? '#ff9933' :
                                //                    '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP || properties.type)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    clearHighlight1();
                    //    highlight1 = properties.ZIP;

                    //    var p = properties.OVERALL_CAT;
                    //    var style = {
                    //        fillColor: p > 5000 ? '#b3ffb3' :
                    //            p > 4000 ? '#b3d9ff' :
                    //                p > 3000 ? '#ffff99' :
                    //                    p > 1000 ? '#ffe6cc' :
                    //                        '#ffffff',
                    //        fillOpacity: 0.5,
                    //        fillOpacity: 1,
                    //        stroke: true,
                    //        fill: true,
                    //        color: 'red',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    infoZip.update(properties);

                    //    vectorGridZip1.setFeatureStyle(properties.ZIP, style);
                    //})
                    //.on('click', function (e) {
                    //    zoomToFeature(e.layer.properties);

                    //})

                    .addTo(map);

                vectorGridZip2 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                            const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                            return {
                                fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                    heatMapConfig.button2.criteria ? heatMapConfig.button2.highlightColor :
                                        heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                            heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                '#ffffff',
                                //var p = properties.OVERALL_CAT;
                                //return {
                                //    fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                //        p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                //            p == 'WeakWirelessFiberAvailable' ? '#ffff00' :
                                //                p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                                //                    '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP || properties.type)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    clearHighlight2();
                    //    highlight2 = properties.ZIP;

                    //    var p = properties.OVERALL_CAT;
                    //    var style = {
                    //        fillColor: p > 5000 ? '#b3ffb3' :
                    //            p > 4000 ? '#b3d9ff' :
                    //                p > 3000 ? '#ffff99' :
                    //                    p > 1000 ? '#ffe6cc' :
                    //                        '#ffffff',
                    //        fillOpacity: 0.5,
                    //        fillOpacity: 1,
                    //        stroke: true,
                    //        fill: true,
                    //        color: 'red',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    infoZip.update(properties);

                    //    vectorGridZip2.setFeatureStyle(properties.ZIP, style);
                    //})
                    //.on('click', function (e) {
                    //    zoomToFeature(e.layer.properties);

                    //})

                    .addTo(map);

                vectorGridZip3 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                            const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                            return {
                                fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                    heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                        heatMapConfig.button3.criteria ? heatMapConfig.button3.highlightColor :
                                            heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP || properties.type)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    clearHighlight3();
                    //    highlight3 = properties.ZIP;

                    //    var p = properties.OVERALL_CAT;
                    //    var style = {
                    //        fillColor: p > 5000 ? '#b3ffb3' :
                    //            p > 4000 ? '#b3d9ff' :
                    //                p > 3000 ? '#ffff99' :
                    //                    p > 1000 ? '#ffe6cc' :
                    //                        '#ffffff',
                    //        fillOpacity: 0.5,
                    //        fillOpacity: 1,
                    //        stroke: true,
                    //        fill: true,
                    //        color: 'red',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    infoZip.update(properties);

                    //    vectorGridZip3.setFeatureStyle(properties.ZIP, style);
                    //})
                    //.on('click', function (e) {
                    //    zoomToFeature(e.layer.properties);

                    //})

                    .addTo(map);

                vectorGridZip4 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                            const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                            return {
                                fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                    heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                        heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                            heatMapConfig.button4.criteria ? heatMapConfig.button4.highlightColor :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP || properties.type)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    clearHighlight4();
                    //    highlight4 = properties.ZIP;

                    //    var p = properties.OVERALL_CAT;
                    //    var style = {
                    //        fillColor: p > 5000 ? '#b3ffb3' :
                    //            p > 4000 ? '#b3d9ff' :
                    //                p > 3000 ? '#ffff99' :
                    //                    p > 1000 ? '#ffe6cc' :
                    //                        '#ffffff',
                    //        fillOpacity: 0.5,
                    //        fillOpacity: 1,
                    //        stroke: true,
                    //        fill: true,
                    //        color: 'red',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    infoZip.update(properties);

                    //    vectorGridZip4.setFeatureStyle(properties.ZIP, style);
                    //})
                    //.on('click', function (e) {
                    //    zoomToFeature(e.layer.properties);

                    //})

                    .addTo(map);

                map.on('click', clearHighlight);

                map.on('baselayerchange', function () {
                    if (map.hasLayer(vectorGridZip0)) {
                        vectorGridZip0.bringToFront();
                        /* if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        } */
                    }
                    if (map.hasLayer(vectorGridZip1)) {
                        vectorGridZip1.bringToFront();
                        /* if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        } */
                    }
                    if (map.hasLayer(vectorGridZip2)) {
                        vectorGridZip2.bringToFront();
                        /* if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        } */
                    }
                    if (map.hasLayer(vectorGridZip3)) {
                        vectorGridZip3.bringToFront();
                        /* if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        } */
                    }
                    if (map.hasLayer(vectorGridZip4)) {
                        vectorGridZip4.bringToFront();
                        /* if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        } */
                    }
                    if (map.hasLayer(VpgmDataLayer)) {
                        console.log('bring VpgmDataLayer to front');
                        VpgmDataLayer.bringToFront();
                        /* if (map.hasLayer(PSALayer)) {
                            console.log('bring PSALayer to front');
                            PSALayer.bringToFront();
                        } */
                    }
                });

                /////////////////////////////

                function highlightFeature(e) {
                    //this.openPopup();
                    //this.closePopup();
                    map.closePopup();
                    if (map.hasLayer(VpgmLayerTest)) {
                        VpgmLayerTest.clearLayers();
                        map.removeControl(infoDatatableZip);
                        map.addControl(infoZip);
                    };

                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        //fillOpacity: 1
                        fillOpacity: 0.001
                    });

                    //var bounds = e.target.getBounds().pad(0.5);
                    //map.fitBounds(bounds);

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    infoZip.update(layer.feature.properties);
                }

                function highlightFeatureTouch(e) {
                    //this.openPopup();
                    if (map.hasLayer(VpgmLayerTest)) {
                        VpgmLayerTest.clearLayers();
                        map.removeControl(infoDatatableZip);
                        map.addControl(infoZip);
                    };

                    VpgmDataLayer.resetStyle();

                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                        //stroke: true,
                        //color: '#008000',
                        //opacity: 1,
                        //weight: 5,
                    });

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    infoZip.update(layer.feature.properties);



                    //console.log(layer.feature.properties.NUMBER_OF_PSAS);
                    if (layer.feature.properties.NUMBER_OF_PSAS > 0) { //Only Give Zip Modal Link Popup if the Zip has PSA Locations to Show in the modal.
                        const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                        if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom() 
                                && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                            map.on('popupopen', function (e) {
                                $('.FuturePSAZipModalDetailLink').prop("onclick", null).off("click");
                                $('.ZipModalDetailLink').prop("onclick", null).off("click");
                                $('.ZipTouchDetailLink').prop("onclick", null).off("click");
                                $('.ZipModalDetailLink').click(async function (e) {
                                    const psaData = {
                                        ZIP_CO_PSA: this.dataset['psa'],
                                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                        FIBER_AVAILABLE: this.dataset['fiberavailable'],
                                        FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                                        FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                                        COPPER_UPGRADE: this.dataset['copperupgrade']
                                    }
                                    ponderApp.exitFullScreen();
<%--                                    $('.zipmodaldetaillink-button').attr("disabled", "disabled");
                                    $('.zipmodaldetaillink-spinner').show();
                                    if (Access == "Unlimited") {
                                        ponderApp.startDownloadChecker("zipmodaldetaillink-button", "zipmodaldetaillink-spinner", 1200);
                                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                        console.log("Clicked PSA2: " + SelectedPSA);
                                        const myParamsObject = {
                                            type: "ExportToExcel_PSALocations",
                                            psaLocationValue: document.getElementById('<%= hf_PSALocation.ClientID %>').value,
                                        };
                                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                                        ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                                    } else {
                                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                        clickButton.click();
                                        PSAZipShowAddressesFromMapClick(SelectedPSA);
                                        console.log("Clicked PSA2: " + SelectedPSA);
                                    }--%>
                                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                    clickButton.click();
                                    PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData);
                                    console.log("Clicked PSA2: " + SelectedPSA);
                                });
                                $('.FuturePSAZipModalDetailLink').click(async function (e) {
                                    const psaData = {
                                        ZIP_CO_PSA: this.dataset['psa'],
                                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                        FUTURE_FIBER_OPPORTUNITY: this.dataset['futurefiberopportunity'],
                                        GRN_30DAY_DT: this.dataset['green30daydate']
                                    }
                                    ponderApp.exitFullScreen();
                                    var clickButton = document.getElementById("<%= btnShowFuturePSAData.ClientID %>");
                                                                    clickButton.click();
                                                                    const selectedFuturePSA = this.dataset['psa'];
                                                                    console.log("Clicked Future PSA: " + selectedFuturePSA);
                                                                    FuturePSAZipShowAddressesFromMapClick(selectedFuturePSA, storeData, psaData);
                                                                });
                                $('.ZipTouchDetailLink').click(function () {
                                    ponderApp.exitFullScreen();
                                    showZipTouchModal(layer.feature.properties);
                                });
                                var showZipTouchModal = (props) => {
                                    ZipTouchModal_Click();
                                    updateZipModal(props); // function for getting data for modal
                                }
                                var ZipTouchModal_Click = (source, eventArgs) => {
                                    var clickButton = document.getElementById("<%= btnZipModal.ClientID %>");
                                    $('#LOADING_ZIP_Modal').show();
                                    $('#ModalDisplay').hide();
                                    if (Access == "Unlimited") {
                                        $('#zipfooterMapModal3').hide();
                                        $('#zipfooterMapModal').show();
                                    } else {
                                        $('#zipfooterMapModal').hide();
                                        $('#zipfooterMapModal3').show();
                                    }
                                    clickButton.click();
                                }
                            });
                            const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                            <%--const groupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();--%>
                            const groupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();
                            ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, `${groupBy}-TOUCH`);
                            $('.top25mdulink').click(async function () {
                                ZipTop25MDUClickHandler(closestLocation);
                            });
                        }
                    }
                }

                function resetHighlight(e) {
                    //this.closePopup();
                    //map.closePopup();
                    if (map.hasLayer(VpgmLayerTest)) {
                        VpgmLayerTest.clearLayers();
                        map.removeControl(infoDatatableZip);
                        map.addControl(infoZip);
                    };

                    VpgmDataLayer.resetStyle(e.target);
                    infoZip.update();
                }

                function zoomToFeature(e) {
                    //this.openPopup();

                    var zoomlevel = map.getZoom();
                    if (zoomlevel <= 10) {

                        if (map.hasLayer(VpgmLayerTest)) {
                            VpgmLayerTest.clearLayers();
                            map.removeControl(infoDatatableZip);
                            map.addControl(infoZip);
                        };

                        var bounds = e.target.getBounds().pad(0.5);
                        //console.log('bound of click:' + bounds);
                        map.fitBounds(bounds);
                    }
                }

                async function ClickToZip(e) {
                    L.DomEvent.stopPropagation(e);
                    // 08/16/2022 - check if layer.feature is not undefined where ever applicable to show and hide second link from PSA popup
                    if (this.closePopup) {
                        this.closePopup();
                    }
                    var layer = e.target;
                    if (layer.feature && layer.feature.properties.NUMBER_OF_PSAS > 0) { //Only Give Zip Modal Link Popup if the Zip has PSA Locations to Show in the modal.
                        const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                        if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom()
                            && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                            map.on('popupopen', function (e) {
                                $('.FuturePSAZipModalDetailLink').prop("onclick", null).off("click");
                                $('.ZipModalDetailLink').prop("onclick", null).off("click");
                                $('.ZipDetailLink').prop("onclick", null).off("click");
                                $('.ZipModalDetailLink').click(async function (e) {
                                    const psaData = {
                                        ZIP_CO_PSA: this.dataset['psa'],
                                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                        FIBER_AVAILABLE: this.dataset['fiberavailable'],
                                        FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                                        FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                                        COPPER_UPGRADE: this.dataset['copperupgrade']
                                    }
                                    ponderApp.exitFullScreen();
<%--                                $('.zipmodaldetaillink-button').attr("disabled", "disabled");
                                    $('.zipmodaldetaillink-spinner').show();
                                    if (Access == "Unlimited") {
                                        ponderApp.startDownloadChecker("zipmodaldetaillink-button", "zipmodaldetaillink-spinner", 1200);
                                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                        console.log("Clicked PSA2: " + SelectedPSA);
                                        const myParamsObject = {
                                            type: "ExportToExcel_PSALocations",
                                            psaLocationValue: document.getElementById('<%= hf_PSALocation.ClientID %>').value,
                                        };
                                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                                        ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                                    } else {
                                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                        clickButton.click();
                                        PSAZipShowAddressesFromMapClick(SelectedPSA);
                                        console.log("Clicked PSA2: " + SelectedPSA);
                                    }--%>
                                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                    clickButton.click();
                                    PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData);
                                    console.log("Clicked PSA2: " + SelectedPSA);
                                });
                                $('.FuturePSAZipModalDetailLink').click(async function (e) {
                                    const psaData = {
                                        ZIP_CO_PSA: this.dataset['psa'],
                                        WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                        FUTURE_FIBER_OPPORTUNITY: this.dataset['futurefiberopportunity'],
                                        GRN_30DAY_DT: this.dataset['green30daydate']
                                    }
                                    ponderApp.exitFullScreen();
                                    var clickButton = document.getElementById("<%= btnShowFuturePSAData.ClientID %>");
                                    clickButton.click();
                                    const selectedFuturePSA = this.dataset['psa'];
                                    console.log("Clicked Future PSA: " + selectedFuturePSA);
                                    FuturePSAZipShowAddressesFromMapClick(selectedFuturePSA, storeData, psaData);
                                });
                                $('.ZipDetailLink').click(function () {
                                    ponderApp.exitFullScreen();
                                    if (ZipFullScreenState == 1) {
                                        ZipFullScreenState = 0; // set full screen state to 0 (not full screen)
                                        map.fullscreenControl.toggleFullScreen(); //exit full screen
                                    }
                                    map.eachLayer(function (layer) {
                                        layer.closePopup();
                                    });
                                    showZipModal(layer.feature.properties);
                                });
                            });
                            const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                            <%--const groupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();--%>
                            const groupBy = layer.feature ? $('#<%= ddlGroupBy.ClientID %> option:selected').val() : null;
                            ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, groupBy);
                        }
                        else {
                            this.openPopup(e.latlng);
                        }
                        $('.ZipDetailLink').prop("onclick", null).off("click");
                        $('.ZipDetailLink').click(function () {
                            ponderApp.exitFullScreen();
                            if (ZipFullScreenState == 1) {
                                ZipFullScreenState = 0; // set full screen state to 0 (not full screen)
                                map.fullscreenControl.toggleFullScreen(); //exit full screen
                            }
                            map.eachLayer(function (layer) {
                                layer.closePopup();
                            });
                            showZipModal(layer.feature.properties);
                        });
                        $('.top25mdulink').click(async function () {
                            ZipTop25MDUClickHandler(closestLocation);
                        });
                    }
                    else {
                        // 08/16/2022 - check if layer.feature is not undefined where ever applicable to show and hide second link from PSA popup
                        const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                        if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom()
                            && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                            const market = $('#<%= ddlMarket.ClientID %> option:selected').val();                            
                            const groupBy = layer.feature ? $('#<%= ddlGroupBy.ClientID %> option:selected').val() : null;
                            ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, groupBy);
                        }
                    }
                }

                function modalAlert(props) {
                    alert('Clicked Zip: ' + props.ZIP);
                }

                //<button type="button" class="btn btn-primary" id="ShowZipButton" onclick="ShowZipModal()">Show Zip Details</button>

                function onEachFeature(feature, layer) {


                    if (navigator.userAgent.indexOf("Firefox") > 0) {

                        layer.bindPopup(feature.properties.ZIP + ", " + feature.properties.STATE + '<br><a href="#" class="ZipDetailLink">Click to Show Fiber Opportunities in this Zip</a>', {
                            closeButton: true,
                            autoPan: false,
                            maxWidth: 350
                        });

                        layer.on({
                            mouseover: highlightFeature,
                            mouseout: resetHighlight,
                            click: ClickToZip,
                            //click: zoomToFeature
                        });
                    } else {
                        if (L.Browser.touch) {
                            layer.on({
                                click: highlightFeatureTouch,
                                //click: ClickToZip,
                            });
                        } else {
                            layer.bindPopup(feature.properties.ZIP + ", " + feature.properties.STATE + '<br><a href="#" class="ZipDetailLink">Click to Show Fiber Opportunities in this Zip</a>', {
                                closeButton: true,
                                autoPan: false,
                                maxWidth: 350
                            });

                            layer.on({
                                mouseover: highlightFeature,
                                mouseout: resetHighlight,
                                click: ClickToZip,
                                //click: zoomToFeature
                            });
                        }
                    }
                }




                //////////////////////////////

                var myStyle = {
                    "color": "#ffffff",
                    "weight": 0,
                    "opacity": 0.00
                };

                VpgmDataLayer = L.geoJSON(VpgmData, {
                    zindex: 200,
                    onEachFeature: onEachFeature,
                    style: myStyle
                });
                map.fitBounds(VpgmDataLayer.getBounds());

                //map.on('zoomend', function () {
                //    var zoomlevel = map.getZoom();
                //    if (zoomlevel < 5) {
                //        if (map.hasLayer(vectorGridCounty)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCounty);
                //            map.addLayer(vectorGridCMA);
                //        } else {
                //            console.log("no point layer active");
                //        }
                //    }
                //    if (zoomlevel >= 5 & zoomlevel < 6) {
                //        if (map.hasLayer(vectorGridZip0)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridCounty);
                //        } else {
                //            console.log("no point layer active");
                //        }
                //        if (map.hasLayer(vectorGridCMA)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridCounty);
                //        } else {
                //            console.log("no point layer active");
                //        }
                //    }
                //    if (zoomlevel >= 6) {
                //        if (map.hasLayer(vectorGridZip0)) {
                //            console.log("layer already added");
                //        } else {
                //            map.removeLayer(vectorGridCounty);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridZip0);
                //        }
                //        if (map.hasLayer(vectorGridCounty)) {
                //            console.log("layer already added");
                //        } else {
                //            map.removeLayer(vectorGridCounty);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridZip0);
                //        }
                //    }
                //    console.log("Current Zoom Level =" + zoomlevel)
                //});

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                // add the search bar to the map
                var searchControl = new L.Control.Search({
                    //container: 'findbox',
                    collapsed: true,
                    autoCollapse: true,
                    position: 'topleft',
                    layer: PSALayerZip,
                    overlayLayer: VpgmDataLayer,
                    propertyName: 'ZIP_CO_PSA',
                    propertyLoc: ['LATITUDE','LONGITUDE'],
                    marker: false,
                    moveToLocation: function (latlng, title, map) {
                        map.setView(latlng, 18); // access the zoom
                        //const zipFeature = VpgmData.features.filter((feature) => feature.properties.ZIP == R.take(5, title));
                        //const feature = zipFeature[0];
                        //const e = { target: { feature }, latlng};
                        //ClickToZip(e);
                    },
                    textPlaceholder: 'Type in PSA to Search...' // placeholder while nothing is searched
                });

                searchControl.on('search:locationfound', function (e) {
                    /* e.layer.setStyle({
                        //fillColor: '#3f0',
                        //color: '#0f0'
                        weight: 8,
                        color: '#008000',
                        dashArray: '',
                        dashArray: '',
                        fillOpacity: 0.7
                    }); */
                    //if (e.layer._popup)
                    //    e.layer.openPopup();

                }).on('search:expanded', function () {
                    $('.leaflet-control-search .search-button').hide();
                }).on('search:collapsed', function (e) {
                    $('.leaflet-control-search .search-button').show();
                    VpgmDataLayer.eachLayer(function (layer) {	//restore feature color
                        VpgmDataLayer.resetStyle(layer);
                    });
                });
                if (marketType === 'MARKET') {
                    map.addControl(searchControl);
                }

                else {
                    VpgmDataLayer.addTo(map);
                }

                //var overlays = { "VPGM Market Borders": MarketBoundaryLayer };
                var overlays = {};
                var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);
                const storeOverlays = await createStoreLayers(map, storeData);
                const top25Overlays = await createTop25Layers(map, top25PSAsDataset, top25MDUsDataset);
                overlays = Object.assign(overlays, storeOverlays, top25Overlays);
                if (PSAData == 'NoPSAData') {
                    overlays = Object.assign(overlays, storeOverlays);
                }
                else 
                {
                    psaOverlay = { "PSA Locations": PSALayerZip };
                    overlays = Object.assign(overlays, storeOverlays, psaOverlay);
                }
                if (futurePSAData)
                {
                    futurePSAOverlay = { "Future PSA Locations": FuturePSALayerZip };
                    overlays = Object.assign(overlays, futurePSAOverlay);
                }
                overlaysNames = Object.keys(overlays);
                overlaysNames.sort(sorter);
                overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));

                map.on('overlayremove', function () {
                    //close open popup
                    map.closePopup();
                    // reset data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(map);
                });

                map.on('overlayadd', function () {
                    // rebuild data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(map);
                    if (map.hasLayer(vectorGridZip0)) {
                        vectorGridZip0.bringToFront();
                        if (map.hasLayer(PSALayerZip)) {
                            PSALayerZip.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip1)) {
                        vectorGridZip1.bringToFront();
                        if (map.hasLayer(PSALayerZip)) {
                            PSALayerZip.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip2)) {
                        vectorGridZip2.bringToFront();
                        if (map.hasLayer(PSALayerZip)) {
                            PSALayerZip.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip3)) {
                        vectorGridZip3.bringToFront();
                        if (map.hasLayer(PSALayerZip)) {
                            PSALayerZip.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip4)) {
                        vectorGridZip4.bringToFront();
                        if (map.hasLayer(PSALayerZip)) {
                            PSALayerZip.bringToFront();
                        }
                    }
                    if (map.hasLayer(VpgmDataLayer)) {
                        VpgmDataLayer.bringToFront();
                        if (map.hasLayer(PSALayerZip)) {
                            PSALayerZip.bringToFront();
                        }
                    }
                });
                ponderApp.updateOverlaysLabel();
                startZip();

            }


            var updateZipModal = async (props) => {
                console.log('updateZipModal Start');

                var marketGeoStore;
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var groupGeo = 'SALES';

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'GEORGIA / SOUTH CAROLINA') {
                        marketGeo = 'GEORGIA SOUTH CAROLINA'
                    } if (marketGeo == 'NTX') {
                        marketGeo = 'NORTH TEXAS'
                    } if (marketGeo == 'STX') {
                        marketGeo = 'SOUTH TEXAS'
                    } if (marketGeo == 'NEW YORK / NEW JERSEY') {
                        marketGeo = 'NEW YORK NEW JERSEY'
                    } if (marketGeo == 'PR/VI') {
                        marketGeo = 'PUERTO RICO VIRGIN ISLAND'
                    } if (marketGeo == 'OHIOPENNSYLVANIA') {
                        marketGeo = 'OHIO PENNSYLVANIA'
                    } if (marketGeo == 'MID-ATLANTIC') {
                        marketGeo = 'MID-ATLANTIC STATES'
                    } if (marketGeo == 'ROCKY MOUNTAIN') {
                        marketGeo = 'ROCKY MOUNTAINS'
                    }
                    else { marketGeo = marketGeo }
                }

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'OHIO PENNSYLVANIA') {
                        marketGeoStore = 'OHIO/PENNSYLVANIA'
                    }
                    else { marketGeoStore = marketGeo }
                }

                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();

                ZipCodeModalSelected = props.ZIP;

                var TOTALPOPSCOMMA = "";
                var FIBER_AVAILABLECOMMA = "";
                var FIBER_CUSTOMERSCOMMA = "";
                var FIBER_OPPORTUNITYCOMMA = "";
                var COPPER_UPGRADECOMMA = "";
                if (props) {
                    TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                    FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                    FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                    FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                }
                document.getElementById('ZipModalZip').innerHTML = props.ZIP;
                document.getElementById('DisplayZipCode').innerHTML = 'Zip Code: ' + props.ZIP + ', ' + props.STATE;
                document.getElementById('DisplayFiberAvail').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA;
                document.getElementById('DisplayFiberCurrent').innerHTML = 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA;
                document.getElementById('DisplayFiberPen').innerHTML = 'Fiber Penetration Rate: ' + props.FIBER_PERCENTAGE + "%";
                document.getElementById('DisplayFiberOpp').innerHTML = 'Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA;
                document.getElementById('DisplayCopperUpgrade').innerHTML = 'Copper Upgrade: ' + COPPER_UPGRADECOMMA;

                let myParamsObject = {
                    type: "Get_Zip_Store_Detail_Market",
                    marketVariable: marketGeoStore,
                };
                let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                ZipstoreData = JSON.parse(data.d);

                if (ZipstoreData.length == 0) {
                    const marketType = getMarketType();
                    marketType == 'MARKET' ? ZipstoreData = appState.storeDataSet.market : (marketType == 'REGION' ? ZipstoreData = appState.storeDataSet.region : ZipstoreData = appState.storeDataSet.national)
                }

                myParamsObject = {
                    type: "Get_ZipModalTable_Data",
                    zipVariable: props.ZIP,
                    orderVariable: 'FIBER_OPPORTUNITY',
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                $('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                zipCodeModalTabledata = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_Zip_PSA_Detail_Market",
                    zipVariable: props.ZIP
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                ZipPSAData = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_ZIP_MDU",
                    zipVariable: props.ZIP
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                ZIPMDUData = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_CopperUpgrade_Data",
                    zipVariable: props.ZIP
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                ZIPCopperUpgradeData = JSON.parse(data.d);

                var ZipVariable = props.ZIP;
                // show both Divs before loading map data
                $('#myZipModalCopperUpgradeMap').show();
                $('#myZipModalMap').show();
                ZipModalCopperUpgradeTab(ZIPCopperUpgradeData, ZipstoreData, VpgmData, MarketBoundaryData, ZipVariable); 
                ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipVariable, ZIPMDUData, ZIPCopperUpgradeData);
                ZIPMDUTable(ZIPMDUData, ZipVariable);
            }

            var ShowZipModalMap = (VpgmData, ZipstoreData, MarketBoundaryData, ZipVariable, ZipMDUData, copperUpgradeData) => {

                const ResetZipModalTabs = () => {
                    document.getElementById('ddlZipCopperUpgradeSortBy').selectedIndex = 0;
                    const zipPSATab = document.getElementById("zipPSATab");
                    const zipPSATabPane = document.getElementById("zipPSATabLink");
                    zipPSATab.classList.add("active");
                    zipPSATabPane.classList.add("active");

                    var zipMDUTab = document.getElementById("zipMDUTab");
                    var zipMDUTabPane = document.getElementById("zipMDUTabLink");
                    zipMDUTab.classList.remove("active");
                    zipMDUTabPane.classList.remove("active");
                }
                ResetZipModalTabs();

                $('#LOADING_ZIP_Modal').hide();
                $('#ModalDisplay').show();

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var ATTR = ZipstoreData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = ZipstoreData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });

                var ATTRstorePoints = new L.layerGroup();
                var ARstorePoints = new L.layerGroup();

                for (i in ATTR) {
                    var popup =
                        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                        '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                        ATTRstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#002280'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    ATTRstorePoints.addLayer(marker);
                }

                for (i in AR) {
                    var popup =
                        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                        '<b>Store Category:</b> ' + 'Authorized Reseller' +
                        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                        ARstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#21b2ff'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    ARstorePoints.addLayer(marker);
                }

                if (ZipMDUData.length > 0) {
                    $('#zipMDUTab').show();
                    var MDU1 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 1; });
                    var MDU2 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 2; });
                    var MDU3 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var MDU4 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var MDU5 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 5; });

                    ZipMDUPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><button class="zipmodalmdulink-button" style="background-color: white; border-style: none;"><a href="#" class="ZipModalMDULink">Click to Export Unit Numbers</a></button><br><button class="zipmodalmdulink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>';

                    } else {
                        var unitExportText = '<br><a href="#" class="ZipModalMDULink">Click to Show Unit Numbers</a>';
                    }

                    for (i in MDU1) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU1[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU1[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU1[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU1[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU1[i].HOUSE_NUMBER + ' ' + MDU1[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU1[i].CITY + ', ' + MDU1[i].STATE +
                            unitExportText,
                            loc = [MDU1[i].LATITUDE, MDU1[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions1) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU1[i].HOUSE_NUMBER, MDU1[i].PREFIX, MDU1[i].STREET_NAME, MDU1[i].ZIP]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU2) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU2[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU2[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU2[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU2[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU2[i].HOUSE_NUMBER + ' ' + MDU2[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU2[i].CITY + ', ' + MDU2[i].STATE +
                            unitExportText,

                            loc = [MDU2[i].LATITUDE, MDU2[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions2) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU2[i].HOUSE_NUMBER, MDU2[i].PREFIX, MDU2[i].STREET_NAME, MDU2[i].ZIP]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU3) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU3[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU3[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU3[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU3[i].HOUSE_NUMBER + ' ' + MDU3[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU3[i].CITY + ', ' + MDU3[i].STATE +
                            unitExportText,
                            loc = [MDU3[i].LATITUDE, MDU3[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions3) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU3[i].HOUSE_NUMBER, MDU3[i].PREFIX, MDU3[i].STREET_NAME, MDU3[i].ZIP]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU4) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU4[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU4[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU4[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU4[i].HOUSE_NUMBER + ' ' + MDU4[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU4[i].CITY + ', ' + MDU4[i].STATE +
                            unitExportText,
                            loc = [MDU4[i].LATITUDE, MDU4[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions4) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU4[i].HOUSE_NUMBER, MDU4[i].PREFIX, MDU4[i].STREET_NAME, MDU4[i].ZIP]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU5) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU5[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU5[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU5[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU5[i].HOUSE_NUMBER + ' ' + MDU5[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU5[i].CITY + ', ' + MDU5[i].STATE +
                            unitExportText,
                            loc = [MDU5[i].LATITUDE, MDU5[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions5) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU5[i].HOUSE_NUMBER, MDU5[i].PREFIX, MDU5[i].STREET_NAME, MDU5[i].ZIP]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }
                }
                else {
                    $('#zipMDUTab').hide();
                }

                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v4.3 - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('myZipModalMap').innerHTML = "<div id='ZipModalMap' style='height: 300px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                        subdomains: ['a', 'b', 'c']
                    });

                var baseLayers = {
                    "Streets": streets,
                    "Satellite": sat
                };

                mapModalOptions = {
                    attributionControl: false,
                    preferCanvas: true,
                    center: [39.73, -104.99],
                    zoom: 10,
                    minZoom: 3,
                    //zoomControl: false,
                    layers: [],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                };

                mapModalOptions.layers.push(streets);
                if (ATTR.length > 0) { mapModalOptions.layers.push(ATTRstorePoints); }
                if (AR.length > 0) { mapModalOptions.layers.push(ARstorePoints); }
                if (ZipMDUData.length > 0) { mapModalOptions.layers.push(ZipMDUPoints); }

                mapModal = L.map("ZipModalMap", mapModalOptions);

                mapModal.on('popupopen', function (e) {
                    $('.ZipModalDetailLink').click(function (e) {
                        const psaData = {
                            ZIP_CO_PSA: this.dataset['psa'],
                            WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                            FIBER_AVAILABLE: this.dataset['fiberavailable'],
                            FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                            FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                            COPPER_UPGRADE: this.dataset['copperupgrade']
                        }
                        ponderApp.exitFullScreen();
                        selectedPSAGetExport(psaData);
                    });
                });

                async function selectedPSAGetExport(psaData) {
                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    PSAZipShowAddressesFromMapClick(SelectedPSA, ZipstoreData, psaData);
                    console.log("Clicked PSA2: " + SelectedPSA);
                }

                function MDULinkClick(e) {
                    console.log(this.key);
                    mapHouseValue = this.key[0];
                    mapPrefixValue = this.key[1];
                    mapStreetValue = this.key[2];
                    mapZipValue = this.key[3];
                    //on popup open collapse layercontrol
                    $(".leaflet-control-layers")
                        .each(function () {
                            $(this).removeClass("leaflet-control-layers-expanded");
                        });
                    var popup = e.target.getPopup();
                    //on popup close collapse layercontrol
                    popup.on('remove', function () {
                        $(".leaflet-control-layers")
                            .each(function () {
                                $(this).addClass("leaflet-control-layers-expanded");
                            });
                    });
                }

                mapModal.on('popupopen', function (e) {
                    $('.ZipModalMDULink').click(function (e) {
                        ZipSpecificMDUGetAddresses(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue);
                    });
                });

                async function ZipSpecificMDUGetAddresses(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue) {
                    if (Access == "Unlimited") {
                        $('.zipmodalmdulink-button').attr("disabled", "disabled");
                        $('.zipmodalmdulink-spinner').show();
                        //log event
                        let myParamsObject = {
                            userID: "<%=hf_User.Value%>",
                        eventType: "ZIP_MDU_SINGLE_EXPORT",
                            logData: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                            logJsonPayload: JSON.stringify({
                                "HouseNumber": mapHouseValue,
                                "Prefix": mapPrefixValue,
                                "Street Name": mapStreetValue,
                                "Zip": mapZipValue
                            })
                        };
                        await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                        ponderApp.startDownloadChecker("zipmodalmdulink-button", "zipmodalmdulink-spinner", 1200);
                        document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = mapHouseValue;
                        document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = mapStreetValue;
                        myParamsObject = {
                            type: "ExportToExcel_SelectedMDUAddressesZIP",
                            mduValue: document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value,
                            houseValue: mapHouseValue,
                            prefixValue: mapPrefixValue,
                            streetValue: mapStreetValue,
                            zipValue: mapZipValue,

                        };
                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                        ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
                    } else {
                        document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = mapHouseValue;
                        document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = mapStreetValue;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        MDUZipShowAddressesFromMapClick(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue);
                    }
                }

                async function MDUZipShowAddressesFromMapClick(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue) {
                    var houseVariable = mapHouseValue;
                    var streetVariable = mapStreetValue;
                    $('#commonDiv').hide();
                    $('#limitedUserDiv').hide();
                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - ' + houseVariable + ' ' + streetVariable;
                    const myParamsObject = {
                        type: "showData_MDUAddressesZipFromMap",
                        ZipVariable: ZipCodeModalSelected,
                        houseValue: mapHouseValue,
                        prefixValue: mapPrefixValue,
                        streetValue: mapStreetValue,
                        zipValue: mapZipValue,
                    };
                    const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    unitNumbersData = JSON.parse(data.d);
                    ponderApp.showLimitedUserData(unitNumbersData);
                }

                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    //featureLayer.bindPopup(feature.properties.VPGM_Markt);
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(mapModal);

                function onEachFeatureZip(feature, featureLayer) {
                    //featureLayer.bindPopup(feature.properties.ZIP);
                }

                var ZipModalLayerGroup = L.layerGroup().addTo(mapModal);

                var myZipModalStyle = {
                    weight: 5,
                    color: '#000000',
                    opacity: 0.5,
                    fillOpacity: 0.05
                };

                VpgmModalLayerTest = L.geoJSON(VpgmData, {
                    style: myZipModalStyle,
                    filter: zipModalFilter,
                    onEachFeature: onEachFeatureZip
                }).addTo(ZipModalLayerGroup);

                function zipModalFilter(feature) {
                    if (feature.properties.ZIP == ZipVariable) return true
                }

                mapModal.fitBounds(VpgmModalLayerTest.getBounds());

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(mapModal);

                var overlays = {};
                if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                if (ZipMDUData.length > 0) { overlays["High Opportunity MDUs"] = ZipMDUPoints; }

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);

                const ZipPSATabClickHandler = () => {
                    $('#myZipModalMap').hide();
                    $('#myZipModalCopperUpgradeMap').show();
                    zipModalCopperUpgradeMap.invalidateSize();
                    //set bounds
                    let allCopperUpgradePoints = new L.featureGroup();
                    for (i in copperUpgradeData) {
                        const loc = [copperUpgradeData[i].LATITUDE, copperUpgradeData[i].LONGITUDE];
                        marker = new L.Marker(new L.latLng(loc));
                        allCopperUpgradePoints.addLayer(marker);
                    }
                    const bounds = allCopperUpgradePoints.getBounds();
                    zipModalCopperUpgradeMap.fitBounds(bounds);
                }
                const ZipMDUTabClickHandler = () => {
                    $('#myZipModalMap').show();
                    $('#myZipModalCopperUpgradeMap').hide();
                    mapModal.invalidateSize();
                    //set bounds
                    let allMDUPoints = new L.featureGroup();
                    for (i in ZipMDUData) {
                        const loc = [ZipMDUData[i].LATITUDE, ZipMDUData[i].LONGITUDE];
                        marker = new L.Marker(new L.latLng(loc));
                        allMDUPoints.addLayer(marker);
                    }
                    const bounds = allMDUPoints.getBounds();
                    mapModal.fitBounds(bounds);
                }

                // hide and show layers based on different tab clicks
                $('#zipPSATab').click(function (e) {
                    ZipPSATabClickHandler();
                });
                $('#zipMDUTab').click(function (e) {
                    ZipMDUTabClickHandler();
                });
                ponderApp.updateOverlaysLabel();
                if (copperUpgradeData.length == 0) {
                    $('#zipPSATab').hide();
                    $('#myZipModalCopperUpgradeMap').hide();
                }
                else {
                    ZipPSATabClickHandler();
                }
            }

            var storeMapV3_Region = async function (storeData, VpgmData2, MarketBoundaryData, PSAData, futurePSAData) {

                $('#buttonrowcounty').show();
                $('#MapDiv').show();
                $('#countyTableDiv').show();
                $('#zipfooter').hide();
                //$('#zipfooter3').hide();
                //$('#zipfooter2').show();
                $('#LOADING1').hide();
                $('#ddlMarket').removeAttr('disabled');
                $('#ddlGroupBy').removeAttr('disabled');
                //$('#ddlRegionGroupBy').removeAttr('disabled');
                //$('#ddlMarketGroupBy').removeAttr('disabled');
                $('#ddlHeatTheme').removeAttr('disabled');


                if (PSAData == 'NoPSAData') {
                    $('#zipfooter').hide();
                    //$('#zipfooter2').show();
                } else {

                    $('#zipfooter').show();

                    if (marketType == 'MARKET') {

                        if (Access == "Unlimited") {
                            $('#psaFooterLimited').hide();
                            $('#psaFooterUnlimited').show();
                        } else {
                            $('#psaFooterLimited').show();
                            $('#psaFooterUnlimited').hide();
                        }
                    }

                    else {
                        $('#psaFooterLimited').hide();
                        $('#psaFooterUnlimited').hide();
                    }

                }


                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                //var ATTR = storeData.filter(function (el) {
                //    return el.STORE_CATEGORY.includes("ATTR");
                //});
                //var AR = storeData.filter(function (el) {
                //    return el.STORE_CATEGORY.includes("AR");
                //});

                //var ATTRstorePoints = new L.layerGroup();
                //var ARstorePoints = new L.layerGroup();

                var regionLevels = [
                    0,  //REGION
                    0,
                    1,  //MARKET_GROUP
                    1,
                    2,  //STATE
                    2,
                    3,  //COUNTY
                    3,
                    4,  //CITY
                    4,
                    5,  //ZIP
                    5,
                    5,
                    5,
                    5,
                    5,
                    5,
                    5,
                    5
                ];

                //var clusterOptions = {
                //    regionLevels: regionLevels,
                //    maxClusterRadius: 50,
                //    addRegionToolTips: true,
                //    allowClustersOfOne: false,
                //    hullHugFactor: 'auto',
                //    polygonOptions: {
                //        color: 'blue', // default: '#0033ff'
                //        weight: 4, // default: 5
                //        opacity: 0.6, // default: 0.5
                //        fill: true,
                //        fillColor: 'white', // default: same as color
                //        fillOpacity: 0.4, // default: 0.2
                //        lineCap: 'round',
                //        lineJoin: 'round'
                //    }
                //};

                //var ATTRstorePoints = new L.MarkerClusterGroup(clusterOptions);
                //var ARstorePoints = new L.MarkerClusterGroup(clusterOptions);


                //mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 8, spiderfyOnMaxZoom: false, maxClusterRadius: 120 }),
                //    ATTRstorePoints = L.featureGroup.subGroup(mcg),// use `L.featureGroup.subGroup(parentGroup)` instead of `L.featureGroup()` or `L.layerGroup()`!
                //    ARstorePoints = L.featureGroup.subGroup(mcg);

                //for (i in ATTR) {
                //    var popup =
                //        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                //        '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                //        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                //        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                //        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                //        ATTRstoreTableoptions = {
                //            iconShape: 'doughnut',
                //            iconSize: [12, 12],
                //            borderWidth: 4,
                //            borderColor: '#002280'
                //        };

                //    var SALES_REGION = ATTR[i][12];
                //    var SALES_VPGM_MARKET = ATTR[i][13];
                //    var STATE = ATTR[i][7];
                //    var COUNTY = ATTR[i][9];
                //    var CITY = ATTR[i][6];
                //    var ZIP_CODE = ATTR[i][8];

                //    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                //    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                //    marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.7);
                //    marker.bindPopup(popup);
                //    //ATTRstorePoints.addLayer(marker);
                //    marker.addTo(ATTRstorePoints);
                //}

                //for (i in AR) {
                //    var popup =
                //        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                //        '<b>Store Category:</b> ' + 'Authorized Reseller' +
                //        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                //        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                //        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                //        ARstoreTableoptions = {
                //            iconShape: 'doughnut',
                //            iconSize: [12, 12],
                //            borderWidth: 4,
                //            borderColor: '#21b2ff'
                //        };

                //    var SALES_REGION = AR[i][12];
                //    var SALES_VPGM_MARKET = AR[i][13];
                //    var STATE = AR[i][7];
                //    var COUNTY = AR[i][9];
                //    var CITY = AR[i][6];
                //    var ZIP_CODE = AR[i][8];

                //    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                //    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                //    marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.7);
                //    marker.bindPopup(popup);
                //    //ARstorePoints.addLayer(marker);
                //    marker.addTo(ARstorePoints);
                //}

                //console.log(VpgmData2);

                //document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v3.1 - " + market_long
                document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " Counties colored by " + $('#<%= ddlHeatTheme.ClientID %> option:selected').text();
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                    id: 'osm.topo',
                    maxZoom: 17,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                    sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                        id: 'arcgis.sat',
                        maxZoom: 17,
                        zIndex: 1,
                        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                        subdomains: ['a', 'b', 'c']
                    }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
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


                if (PSAData == 'NoPSAData') {
                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        //layers: [streets, ATTRstorePoints, ARstorePoints],
                        layers: [streets],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else {
                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        layers: [streets],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });

                    if (PSAData) {
                        const title = "PSA Locations";
                        let pane = map.getPane(title);
                        if (!pane) {
                            pane = map.createPane(title);
                            pane.style.zIndex = 400;
                        }
                        const response = ponderApp.createMaskCanvas(
                            {
                                pane,
                                heatMapDataKey: 'WIRELESS_SCORE',
                                heatMapObject: {
                                    "5": "#003300",
                                    "4": "#008000",
                                    "3": "#00cc00",
                                    "2": "#ffff00",
                                    "1": "#e6b800"
                                },
                            }, {
                            title,
                            isDefault: 0,
                            minZoomVisibility: 10,
                            maxZoomVisibility: 20,
                            markerType: 'psa'
                        },
                            PSAData);
                        PSALayerCounty = response.canvasLayer;
                        psaDataForMaskCanvas = response.psaData;
                        map.addLayer(PSALayerCounty);
                    }

                    if (futurePSAData) {
                        FuturePSALayerCounty = (await createFuturePSAsLayer(map, 'Future PSA Locations', futurePSAData)).canvasLayer;
                        map.addLayer(FuturePSALayerCounty);
                    }

                    map.on("zoomend", function (e) {
                        ponderApp.showHideLayers(this);
                    });

                }

                /*  map = L.map("storemapid", {
                      attributionControl: false,
                      preferCanvas: true,
                      center: [39.73, -104.99],
                      zoom: 10,
                      minZoom: 3,
                      layers: [streets, ATTRstorePoints, ARstorePoints],
                      fullscreenControl: true,
                      fullscreenControlOptions: {
                          position: 'topleft'
                      }
                  }); */

                //mcg.addTo(map);

                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    //if (groupGeo == "ACE") {
                    //    if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                    //        featureLayer.bindPopup(feature.properties.Region);
                    //    }
                    //    else {
                    //        featureLayer.bindPopup(feature.properties.Market_Lon);
                    //    }
                    //} else {
                    // featureLayer.bindPopup(feature.properties.Region);
                    //}
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(map);

                infoCounty = L.control({ position: 'bottomleft' });

                infoCounty.onAdd = function (map) {
                    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                    this.update();
                    return this._div;
                };

                // method that we will use to update the control based on feature properties passed
                infoCounty.update = function (props) {
                    //console.log('***** props: **** ' + props);

                    var TotalPOPsCOMMA = "";
                    var COPPER_UPGRADECOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var NUMBER_OF_PSASCOMMA = "";

                    if (props) {
                        TotalPOPsCOMMA = Number(props.TotalPOPs).toLocaleString('en');
                        COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        NUMBER_OF_PSASCOMMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                    }

                    if (props) {
                        if (L.Browser.touch) {
                            //alert("props.NUMBER_OF_PSAS: " + props.NUMBER_OF_PSAS);
                            if (NUMBER_OF_PSASCOMMA == '0') {
                                CountyTouchLink = '';
                            } else {
                                CountyTouchLink = '<br /><a href="#" class="CountyTouchDetailLink">Click to Show Fiber Opportunities</a>';
                            }
                        } else {
                            CountyTouchLink = '';
                        }
                    } else {
                        CountyTouchLink = '';
                    }

                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    let heatMapConfig = ponderApp.heatMapConfig(props)[heatTheme];

                    //Baseball Card for County from Map
                    this._div.innerHTML = '<h4>County Information</h4>' + (props ?
                        '<b>County: ' + props.COUNTY_STATE + '</b>'
                        + heatMapConfig.baseBallCardInfo.description
                        + '<br />' + '<b>Wireless Category: ' + props.WIRELESS_CATEGORY + '</b>'
                        + '<br />' + '<b>Fiber Addresses Available: ' + FIBER_AVAILABLECOMMA + '</b>'
                        + '<br />' + '<b>Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + ' (' + props.FIBER_PERCENTAGE + '%)' + '</b>'
                        + '<br />' + '<b>Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA + '</b>'
                        + '<br />' + '<b>Copper Upgrade: ' + COPPER_UPGRADECOMMA + '</b>'
                        + CountyTouchLink
                        : 'Hover over a County');

                    $('.CountyTouchDetailLink').click(function () {
                        showCountyModal(props, SelectCountyLat, SelectCountyLng);
                    });

                    //var cssinfo = "info";
                    //if (props) {
                    //    if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                    //        cssinfo = "info1";
                    //    } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                    //        cssinfo = "info2";
                    //    } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                    //        cssinfo = "info3";
                    //    } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                    //        cssinfo = "info4";
                    //    } else {
                    //        cssinfo = "info";
                    //    };

                    //    this._div.classList.remove("info");
                    //    this._div.classList.remove("info1");
                    //    this._div.classList.remove("info2");
                    //    this._div.classList.remove("info3");
                    //    this._div.classList.remove("info4");
                    //    this._div.classList.add(cssinfo);
                    //} else {
                    //    this._div.classList.remove("info");
                    //    this._div.classList.remove("info1");
                    //    this._div.classList.remove("info2");
                    //    this._div.classList.remove("info3");
                    //    this._div.classList.remove("info4");
                    //    this._div.classList.add(cssinfo);
                    //}

                    let cssinfo = "info";
                    let borderColor;

                    if (props) {
                        if (heatMapConfig.button1.criteria) {
                            cssinfo = "info1";
                            borderColor = heatMapConfig.button1.color;
                        }
                        else if (heatMapConfig.button2.criteria) {
                            cssinfo = "info2";
                            borderColor = heatMapConfig.button2.color;
                        }
                        else if (heatMapConfig.button3.criteria) {
                            cssinfo = "info3";
                            borderColor = heatMapConfig.button3.color;
                        }
                        else if (heatMapConfig.button4.criteria) {
                            cssinfo = "info4";
                            borderColor = heatMapConfig.button4.color;
                        }
                    }

                    this._div.classList.remove("info");
                    this._div.classList.remove("info1");
                    this._div.classList.remove("info2");
                    this._div.classList.remove("info3");
                    this._div.classList.remove("info4");
                    this._div.classList.add(cssinfo);
                    // Can use below line to dynamically adjust border Color of baseball card
                    // $("." + cssinfo).css("border-color", borderColor);

                };

                infoCounty.addTo(map);



                var highlight;
                var highlight0;
                var highlight1;
                var highlight2;
                var highlight3;
                var highlight4;
                var zoom0;
                var clearHighlight = function (e) {                    
                    if (highlight) {
                        vectorGridCounty.resetFeatureStyle(highlight);
                        infoCounty.update();
                    }
                    highlight = null;
                    ClickToCounty(e);
                };

                var clearHighlight0 = function () {
                    if (highlight0) {
                        vectorGridCounty0.resetFeatureStyle(highlight0);
                        infoCounty.update();
                    }
                    highlight0 = null;
                };

                var clearHighlight1 = function () {
                    if (highlight1) {
                        vectorGridCounty1.resetFeatureStyle(highlight1);
                        infoCounty.update();
                    }
                    highlight1 = null;
                };

                var clearHighlight2 = function () {
                    if (highlight2) {
                        vectorGridCounty2.resetFeatureStyle(highlight2);
                        infoCounty.update();
                    }
                    highlight2 = null;
                };

                var clearHighlight3 = function () {
                    if (highlight3) {
                        vectorGridCounty3.resetFeatureStyle(highlight3);
                        infoCounty.update();
                    }
                    highlight3 = null;
                };

                var clearHighlight4 = function () {
                    if (highlight4) {
                        vectorGridCounty4.resetFeatureStyle(highlight4);
                        infoCounty.update();
                    }
                    highlight4 = null;
                };

                //function getGeometry(VpgmData2, idProperty) {

                //    VpgmLayerTest = L.geoJSON(VpgmData2, { filter: countyFilter });
                //    function countyFilter(feature) {
                //        if (feature.properties.COUNTY == idProperty) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());

                //};

                vectorGridCounty0 = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    //var p = properties.OVERALL_CAT;
                                    //return {
                                    //    fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    //        p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                    //            p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                    //                p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                                    //                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.Cnty_FIPS;
                        },

                    })

                    .addTo(map);

                vectorGridCounty1 = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.highlightColor :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.Cnty_FIPS;
                        }
                    })

                    .addTo(map);

                vectorGridCounty2 = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.highlightColor :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.Cnty_FIPS;
                        }
                    })

                    .addTo(map);

                vectorGridCounty3 = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.highlightColor :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.Cnty_FIPS;
                        }
                    })

                    .addTo(map);

                vectorGridCounty4 = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.highlightColor :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.Cnty_FIPS;
                        }
                    })

                    .addTo(map);

                map.on('click', clearHighlight);

                map.on('baselayerchange', function () {
                    if (map.hasLayer(vectorGridCounty0)) {
                        vectorGridCounty0.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCounty1)) {
                        vectorGridCounty1.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCounty2)) {
                        vectorGridCounty2.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCounty3)) {
                        vectorGridCounty3.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCounty4)) {
                        vectorGridCounty4.bringToFront();
                    }
                    if (map.hasLayer(VpgmData2Layer)) {
                        VpgmData2Layer.bringToFront();
                    }
                });

                /////////////////////////////

                function highlightFeature(e) {
                    SelectCountyLat = (e.target.getBounds()._northEast.lat + e.target.getBounds()._southWest.lat) / 2;
                    SelectCountyLng = (e.target.getBounds()._northEast.lng + e.target.getBounds()._southWest.lng) / 2;

                    //this.openPopup();
                    if (map.hasLayer(Vpgm2LayerTest)) {
                        Vpgm2LayerTest.clearLayers();
                        map.removeControl(infoDatatableCounty);
                        map.addControl(infoCounty);
                    };

                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                    });

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    infoCounty.update(layer.feature.properties);
                }

                function highlightFeatureTouch(e) {
                    SelectCountyLat = (e.target.getBounds()._northEast.lat + e.target.getBounds()._southWest.lat) / 2;
                    SelectCountyLng = (e.target.getBounds()._northEast.lng + e.target.getBounds()._southWest.lng) / 2;

                    //this.openPopup();
                    if (map.hasLayer(Vpgm2LayerTest)) {
                        Vpgm2LayerTest.clearLayers();
                        map.removeControl(infoDatatableCounty);
                        map.addControl(infoCounty);
                    };

                    VpgmData2Layer.resetStyle();

                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                    });

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    infoCounty.update(layer.feature.properties);

                    const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                    if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom() 
                                && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                        map.on('popupopen', function (e) {
                            $('.FuturePSAZipModalDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').prop("onclick", null).off("click");
                            $('.CountyTouchDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').click(async function (e) {
<%--                                $('.zipmodaldetaillink-button').attr("disabled", "disabled");
                                $('.zipmodaldetaillink-spinner').show();
                                if (Access == "Unlimited") {
                                    ponderApp.startDownloadChecker("zipmodaldetaillink-button", "zipmodaldetaillink-spinner", 1200);
                                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                   //console.log("Clicked PSA2: " + SelectedPSA);
                                    const myParamsObject = {
                                        type: "ExportToExcel_PSALocations",
                                        psaLocationValue: document.getElementById('<%= hf_PSALocation.ClientID %>').value,
                                    };
                                    const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                                    ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                                } else {
                                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                    clickButton.click();
                                    PSAZipShowAddressesFromMapClick(SelectedPSA);
                                    console.log("Clicked PSA2: " + SelectedPSA);
                                }--%>
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FIBER_AVAILABLE: this.dataset['fiberavailable'],
                                    FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                                    FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                                    COPPER_UPGRADE: this.dataset['copperupgrade']
                                }
                                ponderApp.exitFullScreen();
                                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                clickButton.click();
                                PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData);
                                console.log("Clicked PSA2: " + SelectedPSA);
                            });
                            $('.FuturePSAZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FUTURE_FIBER_OPPORTUNITY: this.dataset['futurefiberopportunity'],
                                    GRN_30DAY_DT: this.dataset['green30daydate']
                                }
                                ponderApp.exitFullScreen();
                                var clickButton = document.getElementById("<%= btnShowFuturePSAData.ClientID %>");
                                                            clickButton.click();
                                                            const selectedFuturePSA = this.dataset['psa'];
                                                            console.log("Clicked Future PSA: " + selectedFuturePSA);
                                                            FuturePSAZipShowAddressesFromMapClick(selectedFuturePSA, storeData, psaData);
                                                        });
                            $('.CountyTouchDetailLink').click(function () {
                                ponderApp.exitFullScreen();
                                showCountyModal(layer.feature.properties, SelectCountyLat, SelectCountyLng);
                            });
                        });
                        const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                        <%--const groupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();--%>
                        const groupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();
                        ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, `${groupBy}-TOUCH`);
                        $('.top25mdulink').click(async function () {
                            CountyTop25MDUClickHandler(closestLocation);
                        });
                    }
                }

                function resetHighlight(e) {
                    //this.closePopup();
                    if (map.hasLayer(Vpgm2LayerTest)) {
                        Vpgm2LayerTest.clearLayers();
                        map.removeControl(infoDatatableCounty);
                        map.addControl(infoCounty);
                    };
                    VpgmData2Layer.resetStyle(e.target);
                    infoCounty.update();
                }

                function zoomToFeature(e) {
                    var zoomlevel = map.getZoom();
                    if (zoomlevel <= 9) {

                        if (map.hasLayer(Vpgm2LayerTest)) {
                            Vpgm2LayerTest.clearLayers();
                            map.removeControl(infoDatatableCounty);
                            map.addControl(infoCounty);
                        };
                        var bounds = e.target.getBounds().pad(0.5);
                        map.fitBounds(bounds);
                    }

                }

                function ClickToCounty(e) {
                    L.DomEvent.stopPropagation(e);
                    // 08/16/2022 - check if layer.feature is not undefined where ever applicable to show and hide second link from PSA popup

                    //include the zoom in on click functionality
                    var zoomlevel = map.getZoom();
                    if (zoomlevel <= 9) {
                        if (map.hasLayer(Vpgm2LayerTest)) {
                            Vpgm2LayerTest.clearLayers();
                            map.removeControl(infoDatatableCounty);
                            map.addControl(infoCounty);
                        }
                        if (e.target.getBounds) {
                            var bounds = e.target.getBounds().pad(0.5);
                            map.fitBounds(bounds);
                        }
                    }

                    if (this.closePopup) {
                        this.closePopup();
                    }
                    var layer = e.target;

                    if (layer.feature && layer.feature.properties.FIBER_AVAILABLE > 0) { //Only Give Zip Modal Link Popup if the Zip has Fiber Available.
                        map.on('popupopen', function (e) {
                            $('.FuturePSAZipModalDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').prop("onclick", null).off("click");
                            $('.CountyDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FIBER_AVAILABLE: this.dataset['fiberavailable'],
                                    FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                                    FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                                    COPPER_UPGRADE: this.dataset['copperupgrade']
                                }
                                ponderApp.exitFullScreen();
<%--                                    $('.zipmodaldetaillink-button').attr("disabled", "disabled");
                                    $('.zipmodaldetaillink-spinner').show();
                                    if (Access == "Unlimited") {
                                        ponderApp.startDownloadChecker("zipmodaldetaillink-button", "zipmodaldetaillink-spinner", 1200);
                                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                       //console.log("Clicked PSA2: " + SelectedPSA);
                                        const myParamsObject = {
                                            type: "ExportToExcel_PSALocations",
                                            psaLocationValue: document.getElementById('<%= hf_PSALocation.ClientID %>').value,
                                        };
                                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                                        ponderApp.downloadFile(data, 'FiberLocations_Exported_Data.csv');
                                    } else {
                                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                        clickButton.click();
                                        PSAZipShowAddressesFromMapClick(SelectedPSA);
                                        console.log("Clicked PSA2: " + SelectedPSA);
                                    }--%>
                                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                clickButton.click();
                                PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData);
                                console.log("Clicked PSA2: " + SelectedPSA);
                            });
                            $('.FuturePSAZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FUTURE_FIBER_OPPORTUNITY: this.dataset['futurefiberopportunity'],
                                    GRN_30DAY_DT: this.dataset['green30daydate']
                                }
                                ponderApp.exitFullScreen();
                                var clickButton = document.getElementById("<%= btnShowFuturePSAData.ClientID %>");
                                clickButton.click();
                                const selectedFuturePSA = this.dataset['psa'];
                                console.log("Clicked Future PSA: " + selectedFuturePSA);
                                FuturePSAZipShowAddressesFromMapClick(selectedFuturePSA, storeData, psaData);
                            });
                            $('.CountyDetailLink').click(function () {
                                ponderApp.exitFullScreen();
                                if (CountyFullScreenState == 1) {
                                    CountyFullScreenState = 0; // set full screen state to 0 (not full screen)
                                    map.fullscreenControl.toggleFullScreen(); //exit full screen
                                }
                                //console.log(layer);
                                map.eachLayer(function (layer) {
                                    layer.closePopup();
                                });
                                showCountyModal(layer.feature.properties, SelectCountyLat, SelectCountyLng);
                            });
                        });
                        $('.CountyDetailLink').prop("onclick", null).off("click");
                        $('.CountyDetailLink').click(function () {
                            ponderApp.exitFullScreen();
                            if (CountyFullScreenState == 1) {
                                CountyFullScreenState = 0; // set full screen state to 0 (not full screen)
                                map.fullscreenControl.toggleFullScreen(); //exit full screen
                            }
                            map.eachLayer(function (layer) {
                                layer.closePopup();
                            });
                            showCountyModal(layer.feature.properties, SelectCountyLat, SelectCountyLng);
                        });
                        $('.top25mdulink').click(async function () {
                            CountyTop25MDUClickHandler(closestLocation);
                        });
                    }
                    const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                    if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom()
                        && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                        const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                        let groupBy;
                        if ((($('#<%= ddlMarket.ClientID %> option:selected').val() == "EAST" || $('#<%= ddlMarket.ClientID %> option:selected').val() == "WEST")) && closestLocation.p.markerType === "top25mdu") {
                            //groupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                            groupBy = layer.feature ? $('#<%= ddlGroupBy.ClientID %> option:selected').val() : null;
                            ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, groupBy);
                        }
                        else {
                            //groupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();
                            groupBy = layer.feature ? $('#<%= ddlGroupBy.ClientID %> option:selected').val() : null;
                            ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, groupBy);
                        }
                    }
                    else if (layer.feature && layer.feature.properties.FIBER_AVAILABLE > 0) {
                        this.openPopup(e.latlng);
                    }
                }

                function onEachFeature(feature, layer) {

                    if (navigator.userAgent.indexOf("Firefox") > 0) {
                        layer.bindPopup('County: ' + feature.properties.Name + ', ' + feature.properties.State_Abbr + '<br><a href="#" class="CountyDetailLink">Click to Show Fiber Opportunities in this County</a>', {
                            closeButton: true,
                            autoPan: false,
                            maxWidth: 350
                        });

                        layer.on({
                            mouseover: highlightFeature,
                            mouseout: resetHighlight,
                            //click: zoomToFeature
                            click: ClickToCounty
                        });
                    } else {
                        if (L.Browser.touch) {
                            layer.on({
                                click: highlightFeatureTouch
                            });
                        } else {
                            layer.bindPopup('County: ' + feature.properties.Name + ', ' + feature.properties.State_Abbr + '<br><a href="#" class="CountyDetailLink">Click to Show Fiber Opportunities in this County</a>', {
                                closeButton: true,
                                autoPan: false,
                                maxWidth: 350
                            });

                            layer.on({
                                mouseover: highlightFeature,
                                mouseout: resetHighlight,
                                //click: zoomToFeature
                                click: ClickToCounty
                            });
                        }
                    }

                }

                //////////////////////////////

                var myStyle = {
                    "color": "#ffffff",
                    "weight": 0,
                    "opacity": 0.00
                };

                VpgmData2Layer = L.geoJSON(VpgmData2, {
                    onEachFeature: onEachFeature,
                    style: myStyle
                });

                if (marketType == 'REGION') {
                    map.setView({ lat: 37.0902405, lng: -95.7128906 }, 4);
                } else {
                    map.fitBounds(VpgmData2Layer.getBounds());
                }

                //map.on('zoomend', function () {
                //    var zoomlevel = map.getZoom();
                //    if (zoomlevel < 5) {
                //        if (map.hasLayer(vectorGridCounty)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCounty);
                //            map.addLayer(vectorGridCMA);
                //        } else {
                //            console.log("no point layer active");
                //        }
                //    }
                //    if (zoomlevel >= 5 & zoomlevel < 6) {
                //        if (map.hasLayer(vectorGridZip0)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridCounty);
                //        } else {
                //            console.log("no point layer active");
                //        }
                //        if (map.hasLayer(vectorGridCMA)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridCounty);
                //        } else {
                //            console.log("no point layer active");
                //        }
                //    }
                //    if (zoomlevel >= 6) {
                //        if (map.hasLayer(vectorGridZip0)) {
                //            console.log("layer already added");
                //        } else {
                //            map.removeLayer(vectorGridCounty);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridZip0);
                //        }
                //        if (map.hasLayer(vectorGridCounty)) {
                //            console.log("layer already added");
                //        } else {
                //            map.removeLayer(vectorGridCounty);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridZip0);
                //        }
                //    }
                //    console.log("Current Zoom Level =" + zoomlevel)
                //});

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                // add the search bar to the map
                var searchControl = new L.Control.Search({
                    //container: 'findbox',
                    collapsed: true,
                    autoCollapse: true,
                    position: 'topleft',
                    layer: PSALayerCounty,
                    overlayLayer: VpgmData2Layer,
                    propertyName: 'ZIP_CO_PSA',
                    propertyLoc: ['LATITUDE','LONGITUDE'],
                    marker: false,
                    moveToLocation: function (latlng, title, map) {
                        map.setView(latlng, 18); // access the zoom
                        //const countyFeature = VpgmData2.features.filter((feature) => feature.properties.ZIP == R.take(5, title));
                        //const feature = countyFeature[0];
                        //const e = { target: { feature }, latlng};
                        //ClickToCounty(e);
                    },
                    textPlaceholder: 'Type in PSA to Search' // placeholder while nothing is searched
                });

                searchControl.on('search:locationfound', function (e) {

                    /* e.layer.setStyle({
                        //fillColor: '#3f0',
                        //color: '#0f0'
                        weight: 8,
                        color: '#008000',
                        dashArray: '',
                        dashArray: '',
                        fillOpacity: 0.7
                    }); */
                    //if (e.layer._popup)
                    //    e.layer.openPopup();

                }).on('search:expanded', function () {
                    $('.leaflet-control-search .search-button').hide();
                }).on('search:collapsed', function (e) {
                    $('.leaflet-control-search .search-button').show();
                    VpgmData2Layer.eachLayer(function (layer) {	//restore feature color
                        VpgmData2Layer.resetStyle(layer);
                    });
                });
                if (marketType === 'MARKET') {
                    map.addControl(searchControl);
                }

                else {
                    VpgmData2Layer.addTo(map);
                }

                var overlays = {};
                var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);
                const storeOverlays = await createStoreLayers(map, storeData);
                if (marketType == 'MARKET') {
                    const top25Overlays = await createTop25Layers(map, top25PSAsDataset, top25MDUsDataset);
                    overlays = Object.assign(overlays, storeOverlays, top25Overlays);
                }
                else {
                    overlays = Object.assign(overlays, storeOverlays);
                }
                if (PSAData) {
                    overlays = Object.assign(overlays, { 'PSA Locations': PSALayerCounty });
                }
                if (futurePSAData) {
                    overlays = Object.assign(overlays, { 'Future PSA Locations': FuturePSALayerCounty });
                }
                overlaysNames = Object.keys(overlays);
                overlaysNames.sort(sorter);
                overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));

                map.on('overlayremove', function () {
                    //close open popup
                    map.closePopup();
                    // reset data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(map);
                });


                map.on('overlayadd', function () {
                    // rebuild data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(map);

                    if (map.hasLayer(vectorGridCounty0)) {
                        vectorGridCounty0.bringToFront();
                        if (map.hasLayer(PSALayerCounty)) {
                            PSALayerCounty.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCounty1)) {
                        vectorGridCounty1.bringToFront();
                        if (map.hasLayer(PSALayerCounty)) {
                            PSALayerCounty.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCounty2)) {
                        vectorGridCounty2.bringToFront();
                        if (map.hasLayer(PSALayerCounty)) {
                            PSALayerCounty.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCounty3)) {
                        vectorGridCounty3.bringToFront();
                        if (map.hasLayer(PSALayerCounty)) {
                            PSALayerCounty.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCounty4)) {
                        vectorGridCounty4.bringToFront();
                        if (map.hasLayer(PSALayerCounty)) {
                            PSALayerCounty.bringToFront();
                        }
                    }
                    if (map.hasLayer(VpgmData2Layer)) {
                        VpgmData2Layer.bringToFront();
                        if (map.hasLayer(PSALayerCounty)) {
                            PSALayerCounty.bringToFront();
                        }
                    }
                });

                ponderApp.updateOverlaysLabel();
                startCounty();


            }

            var showCountyModal = (props, clickedlat, clickedlong) => {
                CountyModal_Click();
                updateCountyModal(props, clickedlat, clickedlong); // function for getting data for modal
            }

            var CountyModal_Click = (source, eventArgs) => {
                var clickButton = document.getElementById("<%= btnCountyModal.ClientID %>");
                $('#LOADING_County_Modal').show();
                $('#CountyModalTitle').hide();
                $('#ModalDisplay_County').hide();
                clickButton.click();
            }

            var updateCountyModal = async (props, clickedlat, clickedlong) => {
                console.log('updateCountyModal Start');
                var CountyTOTALPOPSCOMMA = "";
                var FIBER_AVAILABLECOMMA_County = "";
                var FIBER_CUSTOMERSCOMMA_County = "";
                var FIBER_OPPORTUNITYCOMMA_County = "";
                var NUMBER_OF_PSASCOMMA_County = "";
                var COPPER_UPGRADE_County = "";
                if (props) {
                    CountyTOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                    FIBER_AVAILABLECOMMA_County = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                    FIBER_CUSTOMERSCOMMA_County = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                    FIBER_OPPORTUNITYCOMMA_County = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    NUMBER_OF_PSASCOMMA_County = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                    COPPER_UPGRADE_County = Number(props.COPPER_UPGRADE).toLocaleString('en');
                }
                CountyStateModalText = props.COUNTY_STATE;
                document.getElementById('CountyModalTitle').innerHTML = 'County - ' + props.COUNTY_STATE;
                document.getElementById('DisplayCounty').innerHTML = props.COUNTY_STATE;
                document.getElementById('DisplayFiberAvail_County').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA_County;
                document.getElementById('DisplayFiberCurrent_County').innerHTML = 'Fiber Customers: ' + FIBER_CUSTOMERSCOMMA_County;
                document.getElementById('DisplayFiberPen_County').innerHTML = 'Fiber Penetration Rate: ' + props.FIBER_PERCENTAGE + "%";
                document.getElementById('DisplayFiberOpp_County').innerHTML = 'Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA_County;
                document.getElementById('DisplayCopperUpgrade_County').innerHTML = 'Copper Upgrade: ' + COPPER_UPGRADE_County;

                CountyModalSelected = props.Cnty_FIPS;

                let myParamsObject = {
                    type: "Get_CountyModalTable_Data",
                    CountyVariable: props.Cnty_FIPS,
                };
                let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                $('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                CountyModalTabledata = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_County_PSA_Detail_Market",
                    CountyVariable: props.Cnty_FIPS,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                CountyPSAData = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_County_MDU",
                    CountyVariable: props.Cnty_FIPS,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                CountyMDUData = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_County_Store_Detail",
                    CountyVariable: props.Cnty_FIPS,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                CountystoreData = JSON.parse(data.d);
                
                if (CountystoreData.length == 0) {
                    const marketType = getMarketType();
                    marketType == 'MARKET' ? CountystoreData = appState.storeDataSet.market : (marketType == 'REGION' ? CountystoreData = appState.storeDataSet.region : CountystoreData = appState.storeDataSet.national)
                }

                myParamsObject = {
                    type: "Get_CopperUpgrade_Data",
                    CountyVariable: props.Cnty_FIPS,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                CountyCopperUpgradeData = JSON.parse(data.d);

                var CountyVariable = props.Cnty_FIPS;

                $('#myCountyModalCopperUpgradeMap').show();
                $('#myCountyModalMap').show();
                CountyModalCopperUpgradeTab(CountyCopperUpgradeData, CountystoreData, VpgmData2, MarketBoundaryData, CountyVariable);
                ShowCountyModalMap(VpgmData2, CountystoreData, MarketBoundaryData, CountyVariable, CountyMDUData, CountyCopperUpgradeData);
                CountyMDUTable(CountyMDUData, CountyVariable);

                //next two lines for testing
                $('#LOADING_County_Modal').hide();
                $('#CountyModalTitle').show();
                $('#ModalDisplay_County').show();
            }

            var ShowCountyModalMap = (VpgmData2, CountystoreData, MarketBoundaryData, CountyVariable, CountyMDUData, copperUpgradeData) => {

                const ResetCountyModalTabs = () => {
                    document.getElementById('ddlCountyCopperUpgradeSortBy').selectedIndex = 0;
                    const countyPSATab = document.getElementById("countyPSATab");
                    const countyPSATabPane = document.getElementById("countyPSATabLink");
                    countyPSATab.classList.add("active");
                    countyPSATabPane.classList.add("active");

                    var countyMDUTab = document.getElementById("countyMDUTab");
                    var countyMDUTabPane = document.getElementById("countyMDUTabLink");
                    countyMDUTab.classList.remove("active");
                    countyMDUTabPane.classList.remove("active");
                }
                ResetCountyModalTabs();

                $('#LOADING_County_Modal').hide();
                $('#ModalDisplay_County').show();
                $(window).resize();

                var ATTR = CountystoreData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = CountystoreData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });


                //check to make sure that ATTR and AR stores exist in the County - dont try to add a layer with no points.
                if (ATTR.length > 0) {
                    var ATTRstorePoints = new L.layerGroup();
                    for (i in ATTR) {
                        var popup =
                            //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                            '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                            '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                            '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                            loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found   
                            ATTRstoreTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#002280'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                        //marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        ATTRstorePoints.addLayer(marker);
                    }
                }

                if (AR.length > 0) {
                    var ARstorePoints = new L.layerGroup();
                    for (i in AR) {
                        var popup =
                            //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                            '<b>Store Category:</b> ' + 'Authorized Reseller' +
                            '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                            '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                            loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                            ARstoreTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#21b2ff'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                        //marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        ARstorePoints.addLayer(marker);
                    }
                }


                if (CountyMDUData.length > 0) {
                    $('#countyMDUTab').show(); 
                    var MDU1 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 1; });
                    var MDU2 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 2; });
                    var MDU3 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var MDU4 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var MDU5 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 5; });

                    CountyMDUPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><button class="countymodalmdulink-button" style="background-color: white; border-style: none;"><a href="#" class="CountyModalMDULink">Click to Export Unit Numbers</a></button><br><button class="countymodalmdulink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>';
                    } else {
                        var unitExportText = '<br><a href="#" class="CountyModalMDULink">Click to Show Unit Numbers</a>';
                    }

                    for (i in MDU1) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU1[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU1[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU1[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU1[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU1[i].HOUSE_NUMBER + ' ' + MDU1[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU1[i].CITY + ', ' + MDU1[i].STATE +
                            unitExportText,
                            loc = [MDU1[i].LATITUDE, MDU1[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions1) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU1[i].HOUSE_NUMBER, MDU1[i].PREFIX, MDU1[i].STREET_NAME, MDU1[i].ZIP]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }
                    for (i in MDU2) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU2[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU2[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU2[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU2[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU2[i].HOUSE_NUMBER + ' ' + MDU2[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU2[i].CITY + ', ' + MDU2[i].STATE +
                            unitExportText,
                            loc = [MDU2[i].LATITUDE, MDU2[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions2) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU2[i].HOUSE_NUMBER, MDU2[i].PREFIX, MDU2[i].STREET_NAME, MDU2[i].ZIP]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }

                    for (i in MDU3) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU3[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU3[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU3[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU3[i].HOUSE_NUMBER + ' ' + MDU3[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU3[i].CITY + ', ' + MDU3[i].STATE +
                            unitExportText,
                            loc = [MDU3[i].LATITUDE, MDU3[i].LONGITUDE],	//position found

                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions3) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU3[i].HOUSE_NUMBER, MDU3[i].PREFIX, MDU3[i].STREET_NAME, MDU3[i].ZIP]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }

                    for (i in MDU4) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU4[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU4[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU4[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU4[i].HOUSE_NUMBER + ' ' + MDU4[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU4[i].CITY + ', ' + MDU4[i].STATE +
                            unitExportText,
                            loc = [MDU4[i].LATITUDE, MDU4[i].LONGITUDE],	//position found


                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions4) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU4[i].HOUSE_NUMBER, MDU4[i].PREFIX, MDU4[i].STREET_NAME, MDU4[i].ZIP]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }


                    for (i in MDU5) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU5[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU5[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU5[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU5[i].HOUSE_NUMBER + ' ' + MDU5[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU5[i].CITY + ', ' + MDU5[i].STATE +
                            unitExportText,
                            loc = [MDU5[i].LATITUDE, MDU5[i].LONGITUDE],	//position found
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions5) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU5[i].HOUSE_NUMBER, MDU5[i].PREFIX, MDU5[i].STREET_NAME, MDU5[i].ZIP]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }
                }
                else {
                    $('#countyMDUTab').hide();
                }

                document.getElementById('myCountyModalMap').innerHTML = "<div id='CountyModalMap' style='height: 300px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                        subdomains: ['a', 'b', 'c']
                    });

                var baseLayers = {
                    "Streets": streets,
                    "Satellite": sat
                };

                // create a map options object, create the array of layers dynamically, then call in mapModal below.
                CountymapModalOptions = {
                    attributionControl: false,
                    preferCanvas: true,
                    center: [39.73, -104.99],
                    zoom: 10,
                    minZoom: 3,
                    //zoomControl: false,
                    layers: [],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                };

                //clean out layer array?
                //CountymapModalOptions.layers.splice(0, CountymapModalOptions.layers.length);

                CountymapModalOptions.layers.push(streets);
                if (ATTR.length > 0) { CountymapModalOptions.layers.push(ATTRstorePoints); }
                if (AR.length > 0) { CountymapModalOptions.layers.push(ARstorePoints); }
                if (CountyMDUData.length > 0) { CountymapModalOptions.layers.push(CountyMDUPoints); }

                CountymapModal = L.map("CountyModalMap", CountymapModalOptions);

                function MDULinkClick(e) {
                    console.log(this.key);
                    mapHouseValue = this.key[0];
                    mapPrefixValue = this.key[1];
                    mapStreetValue = this.key[2];
                    mapZipValue = this.key[3];
                    //on popup open collapse layercontrol
                    $(".leaflet-control-layers")
                        .each(function () {
                            $(this).removeClass("leaflet-control-layers-expanded");
                        });
                    var popup = e.target.getPopup();
                    //on popup close collapse layercontrol
                    popup.on('remove', function () {
                        $(".leaflet-control-layers")
                            .each(function () {
                                $(this).addClass("leaflet-control-layers-expanded");
                            });
                    });
                }

                CountymapModal.on('popupopen', function (e) {
                    $('.CountyModalMDULink').click(function (e) {
                        SpecificMDUGetAddressesCounty(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue);
                    });
                });

                async function SpecificMDUGetAddressesCounty(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue) {
                    if (Access == "Unlimited") {
                        $('.countymodalmdulink-button').attr("disabled", "disabled");
                        $('.countymodalmdulink-spinner').show();
                        //log event
                        let myParamsObject = {
                            userID: "<%=hf_User.Value%>",
                        eventType: "COUNTY_MDU_SINGLE_EXPORT",
                            logData: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                            logJsonPayload: JSON.stringify({
                                "HouseNumber": mapHouseValue,
                                "Prefix": mapPrefixValue,
                                "Street Name": mapStreetValue,
                                "Zip": mapZipValue
                            })
                        };
                        await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                        ponderApp.startDownloadChecker("countymodalmdulink-button", "countymodalmdulink-spinner", 1200);
                        document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = mapHouseValue;
                        document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = mapStreetValue;
                        myParamsObject = {
                            type: "ExportToExcel_SelectedMDUAddressesCounty",
                            mduValue: document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value,
                            houseValue: mapHouseValue,
                            prefixValue: mapPrefixValue,
                            streetValue: mapStreetValue,
                            zipValue: mapZipValue,
                        };
                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                        ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
                    } else {
                        document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = mapHouseValue;
                        document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = mapStreetValue;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        MDUCountyShowAddressesFromMapClick(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue);
                    }
                }

                async function MDUCountyShowAddressesFromMapClick(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue) {
                    var countyVariable = CountyVariable;
                    var houseVariable = mapHouseValue;
                    var streetVariable = mapStreetValue;
                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText + ' - ' + houseVariable + ' ' + streetVariable;
                    const myParamsObject = {
                        type: "showData_MDUAddressesCountyFromMap",
                        CountyVariable: countyVariable,
                        houseValue: mapHouseValue,
                        prefixValue: mapPrefixValue,
                        streetValue: mapStreetValue,
                        zipValue: mapZipValue,
                    };
                    const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    unitNumbersData = JSON.parse(data.d);
                    ponderApp.showLimitedUserData(unitNumbersData);
                }

                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    //featureLayer.bindPopup(feature.properties.VPGM_Markt);                    
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(CountymapModal);

                function onEachFeatureCounty(feature, featureLayer) {
                    //featureLayer.bindPopup(feature.properties.ZIP);                    
                }

                var CountyModalLayerGroup = L.layerGroup().addTo(CountymapModal);

                var myCountyModalStyle = {
                    weight: 5,
                    color: '#000000',
                    opacity: 0.5,
                    fillOpacity: 0.05
                };

                CountyModalLayerTest = L.geoJSON(VpgmData2, {
                    style: myCountyModalStyle,
                    filter: CountyModalFilter,
                    onEachFeature: onEachFeatureCounty
                }).addTo(CountyModalLayerGroup);

                function CountyModalFilter(feature) {
                    if (feature.properties.Cnty_FIPS == CountyVariable) return true
                }

                CountymapModal.fitBounds(CountyModalLayerTest.getBounds());
                L.control.scale({ metric: false, position: 'bottomright' }).addTo(CountymapModal);

                const overlays = {};
                if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                if (CountyMDUData.length > 0) { overlays["High Opportunity MDUs"] = CountyMDUPoints; }

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(CountymapModal);

                const CountyPSATabClickHandler = () => {
                    $('#myCountyModalMap').hide();
                    $('#myCountyModalCopperUpgradeMap').show();
                    countyModalCopperUpgradeMap.invalidateSize();
                    //set bounds
                    let allCopperUpgradePoints = new L.featureGroup();
                    for (i in copperUpgradeData) {
                        const loc = [copperUpgradeData[i].LATITUDE, copperUpgradeData[i].LONGITUDE];
                        marker = new L.Marker(new L.latLng(loc));
                        allCopperUpgradePoints.addLayer(marker);
                    }
                    const bounds = allCopperUpgradePoints.getBounds();
                    countyModalCopperUpgradeMap.fitBounds(bounds);
                }
                const CountyMDUTabClickHandler = () => {
                    $('#myCountyModalMap').show();
                    $('#myCountyModalCopperUpgradeMap').hide();
                    CountymapModal.invalidateSize();
                    //set bounds
                    let allMDUPoints = new L.featureGroup();
                    for (i in CountyMDUData) {
                        const loc = [CountyMDUData[i].LATITUDE, CountyMDUData[i].LONGITUDE];
                        marker = new L.Marker(new L.latLng(loc));
                        allMDUPoints.addLayer(marker);
                    }
                    const bounds = allMDUPoints.getBounds();
                    CountymapModal.fitBounds(bounds);
                }
                // hide and show layers based on different tab clicks
                $('#countyPSATab').click(function (e) {
                    CountyPSATabClickHandler();
                });
                $('#countyMDUTab').click(function (e) {
                    CountyMDUTabClickHandler();
                });
                ponderApp.updateOverlaysLabel();
                if (copperUpgradeData.length == 0) {
                    $('#countyPSATab').hide();
                    $('#myCountyModalCopperUpgradeMap').hide();
                }
                else {
                    CountyPSATabClickHandler();
                }
            }

            var storeMapV3_National = async function (storeData, VpgmData3, MarketBoundaryData, marketType, PSAData, futurePSAData) {
                
                $('#buttonrowcma').show();
                $('#MapDiv').show();
                $('#cmaTableDiv').show();
                $('#zipfooter').hide();
                //$('#zipfooter3').hide();
                //$('#zipfooter2').show();
                $('#LOADING1').hide();
                $('#ddlMarket').removeAttr('disabled');
                $("#ddlGroupBy").val('CMA');
                if ($('#<%= ddlMarket.ClientID %> option:selected').val() != '%') {
                    $('#ddlGroupBy').removeAttr('disabled');
                }
                /*$('#ddlRegionGroupBy').removeAttr('disabled');*/
                //$('#ddlMarketGroupBy').removeAttr('disabled');
                $('#ddlHeatTheme').removeAttr('disabled');

                if (PSAData == 'NoPSAData') {
                    $('#zipfooter').hide();
                    //$('#zipfooter2').show();
                } else {

                    $('#zipfooter').show();

                    if (marketType == 'MARKET') {
                        if (Access == "Unlimited") {
                            $('#psaFooterLimited').hide();
                            $('#psaFooterUnlimited').show();
                        } else {
                            $('#psaFooterLimited').show();
                            $('#psaFooterUnlimited').hide();
                        }
                    }
                    else {
                        $('#psaFooterLimited').hide();
                        $('#psaFooterUnlimited').hide();
                    }

                }


                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                //var ATTR = storeData.filter(function (el) {
                //    return el.STORE_CATEGORY.includes("ATTR");
                //});
                //var AR = storeData.filter(function (el) {
                //    return el.STORE_CATEGORY.includes("AR");
                //});

                //var ATTRstorePoints = new L.layerGroup();
                //var ARstorePoints = new L.layerGroup();

                var regionLevels = [
                    0,  //REGION
                    0,
                    1,  //MARKET_GROUP
                    1,
                    2,  //STATE
                    2,
                    3,  //COUNTY
                    3,
                    4,  //CITY
                    4,
                    5,  //ZIP
                    5,
                    5,
                    5,
                    5,
                    5,
                    5,
                    5,
                    5
                ];

                //var clusterOptions = {
                //    regionLevels: regionLevels,
                //    maxClusterRadius: 50,
                //    addRegionToolTips: true,
                //    allowClustersOfOne: false,
                //    hullHugFactor: 'auto',
                //    polygonOptions: {
                //        color: 'blue', // default: '#0033ff'
                //        weight: 4, // default: 5
                //        opacity: 0.6, // default: 0.5
                //        fill: true,
                //        fillColor: 'white', // default: same as color
                //        fillOpacity: 0.4, // default: 0.2
                //        lineCap: 'round',
                //        lineJoin: 'round'
                //    }
                //};

                //var ATTRstorePoints = new L.MarkerClusterGroup(clusterOptions);
                //var ARstorePoints = new L.MarkerClusterGroup(clusterOptions);

                //mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 8, spiderfyOnMaxZoom: false, maxClusterRadius: 120 }),
                //    ATTRstorePoints = L.featureGroup.subGroup(mcg),
                //    ARstorePoints = L.featureGroup.subGroup(mcg);

                //for (i in ATTR) {
                //    var popup =
                //        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                //        '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                //        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                //        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                //        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                //        ATTRstoreTableoptions = {
                //            //icon: 'store',
                //            iconShape: 'doughnut',
                //            iconSize: [12, 12],
                //            borderWidth: 4,
                //            borderColor: '#002280'
                //        };

                //    var SALES_REGION = ATTR[i][12];
                //    var SALES_VPGM_MARKET = ATTR[i][13];
                //    var STATE = ATTR[i][7];
                //    var COUNTY = ATTR[i][9];
                //    var CITY = ATTR[i][6];
                //    var ZIP_CODE = ATTR[i][8];

                //    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                //    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                //    marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.7);
                //    marker.bindPopup(popup);
                //    //ATTRstorePoints.addLayer(marker);
                //    marker.addTo(ATTRstorePoints);
                //}

                //for (i in AR) {
                //    var popup =
                //        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                //        '<b>Store Category:</b> ' + 'Authorized Reseller' +
                //        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                //        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                //        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                //        ARstoreTableoptions = {
                //            iconShape: 'doughnut',
                //            iconSize: [12, 12],
                //            borderWidth: 4,
                //            borderColor: '#21b2ff'
                //        };

                //    var SALES_REGION = AR[i][12];
                //    var SALES_VPGM_MARKET = AR[i][13];
                //    var STATE = AR[i][7];
                //    var COUNTY = AR[i][9];
                //    var CITY = AR[i][6];
                //    var ZIP_CODE = AR[i][8];

                //    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                //    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                //    marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.7);
                //    marker.bindPopup(popup);
                //    //ARstorePoints.addLayer(marker);
                //    marker.addTo(ARstorePoints);
                //}

                //console.log(VpgmData3);

                //document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v3.1 - " + market_long;
                document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text() + " CMAs colored by " + $('#<%= ddlHeatTheme.ClientID %> option:selected').text();
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                    id: 'osm.topo',
                    maxZoom: 17,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                    sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                        id: 'arcgis.sat',
                        maxZoom: 17,
                        zIndex: 1,
                        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                        subdomains: ['a', 'b', 'c']
                    }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                        subdomains: ['a', 'b', 'c']
                    });

                var baseLayers = {
                    "Streets": streets,
                    //"<span style='color: gray'>Grayscale</span>": grayscale,
                    "Satellite": sat
                    //"Topo": topo
                };

                if (PSAData == 'NoPSAData') {
                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        //layers: [streets, ATTRstorePoints, ARstorePoints],
                        layers: [streets],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else {
                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        //layers: [streets, ATTRstorePoints, ARstorePoints],
                        layers: [streets],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });

                    if (PSAData) {
                        const title = "PSA Locations";
                        let pane = map.getPane(title);
                        if (!pane) {
                            pane = map.createPane(title);
                            pane.style.zIndex = 400;
                        }
                        const response = ponderApp.createMaskCanvas(
                            {
                                pane,
                                heatMapDataKey: 'WIRELESS_SCORE',
                                heatMapObject: {
                                    "5": "#003300",
                                    "4": "#008000",
                                    "3": "#00cc00",
                                    "2": "#ffff00",
                                    "1": "#e6b800"
                                },
                            }, {
                            title,
                            isDefault: 0,
                            minZoomVisibility: 10,
                            maxZoomVisibility: 20,
                            markerType: 'psa'
                        },
                            PSAData);
                        PSALayerCma = response.canvasLayer;
                        psaDataForMaskCanvas = response.psaData;
                        map.addLayer(PSALayerCma);
                    }

                    if (futurePSAData) {
                        FuturePSALayerCma = (await createFuturePSAsLayer(map, 'Future PSA Locations', futurePSAData)).canvasLayer;
                        map.addLayer(FuturePSALayerCma);
                    }

                    map.on("zoomend", function (e) {
                        ponderApp.showHideLayers(this);
                    });

                    map.on('enterFullscreen', function () {
                        //console.log('enter Fullscreen');
                        CMAFullScreenState = 1;
                    });

                    map.on('exitFullscreen', function () {
                        //console.log('exit Fullscreen');
                        CMAFullScreenState = 0;
                    });


                }


                /*  map = L.map("storemapid", {
                      attributionControl: false,
                      preferCanvas: true,
                      center: [39.73, -104.99],
                      zoom: 10,
                      minZoom: 3,
                      layers: [streets, ATTRstorePoints, ARstorePoints],
                      fullscreenControl: true,
                      fullscreenControlOptions: {
                          position: 'topleft'
                      }
                  }); 
  
                  map.on('enterFullscreen', function () {
                      //console.log('enter Fullscreen');
                      CMAFullScreenState = 1;
                  });
  
                  map.on('exitFullscreen', function () {
                      //console.log('exit Fullscreen');
                      CMAFullScreenState = 0;
                  }); */

                //mcg.addTo(map);

                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    if (navigator.userAgent.indexOf("Firefox") > 0) {
                        featureLayer.on({
                            click: ClickToCMA
                        });
                    } else {
                        if (L.Browser.touch) {
                            featureLayer.on({
                                click: highlightFeatureTouch
                            });
                        } else {
                            featureLayer.on({
                                click: ClickToCMA
                            });
                        }
                    }
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(map);

                info = L.control({ position: 'bottomleft' });

                info.onAdd = function (map) {
                    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                    this.update();
                    return this._div;
                };

                // method that we will use to update the control based on feature properties passed
                info.update = function (props) {
                    //console.log(props);

                    var TOTALPOPSCOMMA = "";
                    var COPPER_UPGRADECOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var NUMBER_OF_PSASCOMMA = "";

                    if (props) {
                        TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                        COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        NUMBER_OF_PSASCOMMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                    }

                    if (props) {
                        if (L.Browser.touch) {
                            //alert("props.NUMBER_OF_PSAS: " + props.NUMBER_OF_PSAS);
                            if (NUMBER_OF_PSASCOMMA == '0') {
                                CMATouchLink = '';
                            } else {
                                CMATouchLink = '<br /><a href="#" class="CMATouchDetailLink">Click to Show Fiber Opportunities</a>';
                            }
                        } else {
                            CMATouchLink = '';
                        }
                    } else {
                        CMATouchLink = '';
                    }

                    const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                    let heatMapConfig = ponderApp.heatMapConfig(props)[heatTheme];

                    //Baseball Card for CMA from hovering on Map
                    this._div.innerHTML = '<h4>CMA Information</h4>' + (props ?
                        '<b>CMA: ' + props.cma + '<br />' + 'CMA Name: ' + props.Name + '</b>'
                        + heatMapConfig.baseBallCardInfo.description
                        + '<br />' + '<b>Wireless Category: ' + props.WIRELESS_CATEGORY + '</b>'
                        + '<br />' + '<b>Fiber Addresses Available: ' + FIBER_AVAILABLECOMMA + '</b>'
                        + '<br />' + '<b>Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + ' (' + props.FIBER_PERCENTAGE + '%)' + '</b>'
                        + '<br />' + '<b>Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA + '</b>'
                        + '<br />' + '<b>Copper Upgrade: ' + COPPER_UPGRADECOMMA + '</b>'
                        + CMATouchLink
                        : 'Hover over a CMA');


                    $('.CMATouchDetailLink').click(function () {
                        showCMAModal(props, SelectCMALat, SelectCMALng);
                    });

                    let cssinfo = "info";
                    let borderColor;

                    if (props) {
                        if (heatMapConfig.button1.criteria) {
                            cssinfo = "info1";
                            borderColor = heatMapConfig.button1.color;
                        }
                        else if (heatMapConfig.button2.criteria) {
                            cssinfo = "info2";
                            borderColor = heatMapConfig.button2.color;
                        }
                        else if (heatMapConfig.button3.criteria) {
                            cssinfo = "info3";
                            borderColor = heatMapConfig.button3.color;
                        }
                        else if (heatMapConfig.button4.criteria) {
                            cssinfo = "info4";
                            borderColor = heatMapConfig.button4.color;
                        }
                    }

                    this._div.classList.remove("info");
                    this._div.classList.remove("info1");
                    this._div.classList.remove("info2");
                    this._div.classList.remove("info3");
                    this._div.classList.remove("info4");
                    this._div.classList.add(cssinfo);
                    // Can use below line to dynamically adjust border Color of baseball card
                    // $("." + cssinfo).css("border-color", borderColor);

                };

                info.addTo(map);



                var highlight;
                var highlight0;
                var highlight1;
                var highlight2;
                var highlight3;
                var highlight4;
                var zoom0;
                var clearHighlight = function (e) {                    
                    if (highlight) {
                        vectorGridCMA.resetFeatureStyle(highlight);
                        info.update();
                    }
                    highlight = null;                    
                    ClickToCMA(e);
                };

                //function getGeometry(VpgmData3, idProperty) {

                //    VpgmLayerTest = L.geoJSON(VpgmData3, { filter: CMAFilter });
                //    function CMAFilter(feature) {
                //        if (feature.properties.CMA == idProperty) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());

                //};


                vectorGridCMA0 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.cma;
                        },

                    })


                    .addTo(map);

                vectorGridCMA1 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.highlightColor :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.cma;
                                                    }
                    })

                    .addTo(map);

                vectorGridCMA2 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.highlightColor :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.cma;
                        }
                    })

                    .addTo(map);

                vectorGridCMA3 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.highlightColor :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.cma;
                        }
                    })

                    .addTo(map);

                //console.log(ponderApp.heatMapConfig(properties));

                vectorGridCMA4 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.highlightColor :
                                                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.cma;
                        }
                    })

                    .addTo(map);

                map.on('click', clearHighlight);

                map.on('baselayerchange', function () {
                    if (map.hasLayer(vectorGridCMA0)) {
                        vectorGridCMA0.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCMA1)) {
                        vectorGridCMA1.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCMA2)) {
                        vectorGridCMA2.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCMA3)) {
                        vectorGridCMA3.bringToFront();
                    }
                    if (map.hasLayer(vectorGridCMA4)) {
                        vectorGridCMA4.bringToFront();
                    }
                });

                /////////////////////////////

                function highlightFeature(e) {
                    SelectCMALat = (e.target.getBounds()._northEast.lat + e.target.getBounds()._southWest.lat) / 2;
                    SelectCMALng = (e.target.getBounds()._northEast.lng + e.target.getBounds()._southWest.lng) / 2;

                    //this.openPopup();
                    if (map.hasLayer(Vpgm3LayerTest)) {
                        Vpgm3LayerTest.clearLayers();
                        map.removeControl(infoDatatable);
                        map.addControl(info);
                    };

                    //map.removeLayer(Vpgm3LayerTest);
                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                    });
                    //console.log("check for properties");
                    //console.log(layer.feature.properties);
                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    info.update(layer.feature.properties);
                }

                function highlightFeatureTouch(e) {
                    SelectCMALat = (e.target.getBounds()._northEast.lat + e.target.getBounds()._southWest.lat) / 2;
                    SelectCMALng = (e.target.getBounds()._northEast.lng + e.target.getBounds()._southWest.lng) / 2;

                    var layer = e.target;
                    if (map.hasLayer(Vpgm3LayerTest)) {
                        Vpgm3LayerTest.clearLayers();
                        map.removeControl(infoDatatable);
                        map.addControl(info);
                    }
                    VpgmData3Layer.resetStyle();

                    // check if CMA Layer is being clicked, this code block is only applicable to CMA Layer
                    if (layer.feature.properties.FIBER_AVAILABLE) {                       
                        layer.setStyle({
                            weight: 5,
                            color: '#000000',
                            opacity: 0.5,
                            fillOpacity: 0.001
                        });
                        if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                            layer.bringToFront();
                        }
                        info.update(layer.feature.properties);
                    }

                    const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());
                    if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom() 
                                && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                        map.on('popupopen', function (e) {
                            $('.FuturePSAZipModalDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').prop("onclick", null).off("click");
                            $('.CMATouchDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FIBER_AVAILABLE: this.dataset['fiberavailable'],
                                    FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                                    FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                                    COPPER_UPGRADE: this.dataset['copperupgrade']
                                }
                                ponderApp.exitFullScreen();
                                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                clickButton.click();
                                PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData);
                                console.log("Clicked PSA2: " + SelectedPSA);
                            });
                            $('.FuturePSAZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FUTURE_FIBER_OPPORTUNITY: this.dataset['futurefiberopportunity'],
                                    GRN_30DAY_DT: this.dataset['green30daydate']
                                }
                                ponderApp.exitFullScreen();
                                var clickButton = document.getElementById("<%= btnShowFuturePSAData.ClientID %>");
                                                            clickButton.click();
                                                            const selectedFuturePSA = this.dataset['psa'];
                                                            console.log("Clicked Future PSA: " + selectedFuturePSA);
                                                            FuturePSAZipShowAddressesFromMapClick(selectedFuturePSA, storeData, psaData);
                                                        });
                            $('.CMATouchDetailLink').click(function () {
                                ponderApp.exitFullScreen();
                                showCMAModal(layer.feature.properties, SelectCMALat, SelectCMALng);
                            });
                        });
                        const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                        <%--const groupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();--%>
                        const groupBy = $('#<%= ddlGroupBy.ClientID %> option:selected').val();
                        ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, `${groupBy}-TOUCH`);
                        $('.top25mdulink').click(async function () {
                            CMATop25MDUClickHandler(closestLocation);
                        });
                    }
                }

                function resetHighlight(e) {
                    //this.closePopup();
                    if (map.hasLayer(Vpgm3LayerTest)) {
                        Vpgm3LayerTest.clearLayers();
                        map.removeControl(infoDatatable);
                        map.addControl(info);
                    }
                    //map.removeLayer(Vpgm3LayerTest);
                    VpgmData3Layer.resetStyle(e.target);
                    info.update();

                }

                function zoomToFeature(e) {
                    var zoomlevel = map.getZoom();
                    if (zoomlevel <= 7) {
                        if (map.hasLayer(Vpgm3LayerTest)) {
                            Vpgm3LayerTest.clearLayers();
                            map.removeControl(infoDatatable);
                            map.addControl(info);
                        }
                        var bounds = e.target.getBounds().pad(0.5);
                        map.fitBounds(bounds);
                    }
                    //var layer = e.target;
                    //showCMAModal(layer.feature.properties);
                }


                $('.nav-tabs li').on('click', function () {
                    setTimeout(function () {
                        $(window).resize();
                    }, 0);
                });

                function ClickToCMA(e) {
                    L.DomEvent.stopPropagation(e);
                    // 08/16/2022 - check if layer.feature is not undefined where ever applicable to show and hide second link from PSA popup

                    //include the zoom in on click functionality
                    var zoomlevel = map.getZoom();
                    if (zoomlevel <= 7) {
                        if (map.hasLayer(Vpgm3LayerTest)) {
                            Vpgm3LayerTest.clearLayers();
                            map.removeControl(infoDatatable);
                            map.addControl(info);
                        }
                        if (e.target.feature && e.target.feature.properties.FIBER_AVAILABLE && e.target.getBounds) {
                            var bounds = e.target.getBounds().pad(0.5);
                            map.fitBounds(bounds);
                        }
                    }
                    if (this.closePopup) {
                        this.closePopup();
                    }
                    var layer = e.target;                    
                    const closestLocation = ponderApp.closest(map.getZoom(), e.latlng.lat, e.latlng.lng, ponderApp.getMapOverlaysData());                    
                    if (closestLocation && closestLocation.p.minZoomVisibility <= map.getZoom()
                        && map.getZoom() <= closestLocation.p.maxZoomVisibility) {
                        map.on('popupopen', function (e) {
                            $('.FuturePSAZipModalDetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').prop("onclick", null).off("click");
                            $('.CMADetailLink').prop("onclick", null).off("click");
                            $('.ZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FIBER_AVAILABLE: this.dataset['fiberavailable'],
                                    FIBER_CUSTOMERS: this.dataset['fibercustomers'],
                                    FIBER_OPPORTUNITY: this.dataset['fiberopportunity'],
                                    COPPER_UPGRADE: this.dataset['copperupgrade']
                                }
                                ponderApp.exitFullScreen();
                                document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                                var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                                clickButton.click();
                                PSAZipShowAddressesFromMapClick(SelectedPSA, storeData, psaData);
                                console.log("Clicked PSA2: " + SelectedPSA);
                            });
                            $('.FuturePSAZipModalDetailLink').click(async function (e) {
                                const psaData = {
                                    ZIP_CO_PSA: this.dataset['psa'],
                                    WIRELESS_SCORE_TEXT: this.dataset['wirelessscore'],
                                    FUTURE_FIBER_OPPORTUNITY: this.dataset['futurefiberopportunity'],
                                    GRN_30DAY_DT: this.dataset['green30daydate']
                                }
                                ponderApp.exitFullScreen();
                                var clickButton = document.getElementById("<%= btnShowFuturePSAData.ClientID %>");
                                                                clickButton.click();
                                                                const selectedFuturePSA = this.dataset['psa'];
                                                                console.log("Clicked Future PSA: " + selectedFuturePSA);
                                                                FuturePSAZipShowAddressesFromMapClick(selectedFuturePSA, storeData, psaData);
                                                            });
                            $('.CMADetailLink').click(function () {
                                ponderApp.exitFullScreen();
                                if (CMAFullScreenState == 1) {
                                    CMAFullScreenState = 0; // set full screen state to 0 (not full screen)
                                    map.fullscreenControl.toggleFullScreen(); //exit full screen
                                }
                                map.eachLayer(function (layer) {
                                    layer.closePopup();
                                });
                                showCMAModal(layer.feature.properties, SelectCMALat, SelectCMALng);
                            });
                        });
                        const market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                        <%--const groupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();--%>
                        const groupBy = layer.feature ? $('#<%= ddlGroupBy.ClientID %> option:selected').val() : null;
                        ponderApp.markerTypes[closestLocation.p.markerType].clicked(map, closestLocation, market, groupBy);
                    }
                    else if (layer.feature && layer.feature.properties.FIBER_AVAILABLE > 0) {
                        this.openPopup(e.latlng);
                    }
                    $('.CMADetailLink').prop("onclick", null).off("click");
                    $('.CMADetailLink').click(function () {
                        ponderApp.exitFullScreen();
                        if (CMAFullScreenState == 1) {
                            CMAFullScreenState = 0; // set full screen state to 0 (not full screen)
                            map.fullscreenControl.toggleFullScreen(); //exit full screen
                        }
                        map.eachLayer(function (layer) {
                            layer.closePopup();
                        });
                        showCMAModal(layer.feature.properties, SelectCMALat, SelectCMALng);
                    });
                    $('.top25mdulink').click(async function () {
                        CMATop25MDUClickHandler(closestLocation);
                    });
                }

                function highlightAndZoom(e) {
                    //this.openPopup();
                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#008000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                        //stroke: true,
                        //color: '#008000',
                        //opacity: 1,
                        //weight: 5,
                    });

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    info.update(layer.feature.properties);

                    var bounds = e.target.getBounds().pad(0.5);
                    map.fitBounds(bounds);
                }

                function onEachFeature(feature, layer) {



                    //layer.bindPopup(feature.properties.Name, {
                    //    closeButton: false,
                    //    autoPan: false
                    //});
                    if (navigator.userAgent.indexOf("Firefox") > 0) {
                        layer.bindPopup('CMA #' + feature.properties.cma + ' - ' + feature.properties.Name + '<br><a href="#" class="CMADetailLink">Click to Show Fiber Opportunities in this CMA</a>', {
                            closeButton: true,
                            autoPan: false,
                            maxWidth: 350
                        });

                        layer.on({
                            mouseover: highlightFeature,
                            mouseout: resetHighlight,
                            //click: zoomToFeature
                            click: ClickToCMA
                        });
                    } else {
                        if (L.Browser.touch) {
                            layer.on({
                                click: highlightFeatureTouch
                            });
                        } else {
                            layer.bindPopup('CMA #' + feature.properties.cma + ' - ' + feature.properties.Name + '<br><a href="#" class="CMADetailLink">Click to Show Fiber Opportunities in this CMA</a>', {
                                closeButton: true,
                                autoPan: false,
                                maxWidth: 350
                            });

                            layer.on({
                                mouseover: highlightFeature,
                                mouseout: resetHighlight,
                                //click: zoomToFeature
                                click: ClickToCMA
                            });
                        }
                    }
                }

                //////////////////////////////

                var myStyle = {
                    "color": "#ffffff",
                    "weight": 0,
                    "opacity": 0.00
                };

                VpgmData3Layer = L.geoJSON(VpgmData3, {
                    onEachFeature: onEachFeature,
                    style: myStyle
                });

                if (marketType == 'NATIONAL' | marketType == 'REGION') {
                    map.setView({ lat: 37.0902405, lng: -95.7128906 }, 4);
                } else {
                    map.fitBounds(VpgmData3Layer.getBounds());
                }

                //map.on('zoomend', function () {
                //    var zoomlevel = map.getZoom();
                //    if (zoomlevel < 5) {
                //        if (map.hasLayer(vectorGridCounty)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCounty);
                //            map.addLayer(vectorGridCMA);
                //        } else {
                //           //console.log("no point layer active");
                //        }
                //    }
                //    if (zoomlevel >= 5 & zoomlevel < 6) {
                //        if (map.hasLayer(vectorGridZip0)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridCounty);
                //        } else {
                //           //console.log("no point layer active");
                //        }
                //        if (map.hasLayer(vectorGridCMA)) {
                //            map.removeLayer(vectorGridZip0);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridCounty);
                //        } else {
                //           //console.log("no point layer active");
                //        }
                //    }
                //    if (zoomlevel >= 6) {
                //        if (map.hasLayer(vectorGridZip0)) {
                //            console.log("layer already added");
                //        } else {
                //            map.removeLayer(vectorGridCounty);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridZip0);
                //        }
                //        if (map.hasLayer(vectorGridCounty)) {
                //            console.log("layer already added");
                //        } else {
                //            map.removeLayer(vectorGridCounty);
                //            map.removeLayer(vectorGridCMA);
                //            map.addLayer(vectorGridZip0);
                //        }
                //    }
                //    console.log("Current Zoom Level =" + zoomlevel)
                //});

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                // add the search bar to the map
                var searchControl = new L.Control.Search({
                    //container: 'findbox',
                    collapsed: true,
                    autoCollapse: true,
                    position: 'topleft',
                    layer: PSALayerCma,
                    overlayLayer: VpgmData3Layer,
                    propertyName: 'ZIP_CO_PSA',
                    propertyLoc: ['LATITUDE','LONGITUDE'],
                    marker: false,
                    moveToLocation: function (latlng, title, map) {
                        map.setView(latlng, 18); // access the zoom
                        //const cmaFeature = VpgmData3.features.filter((feature) => feature.properties.ZIP == R.take(5, title));
                        //const feature = cmaFeature[0];
                        //const e = { target: { feature }, latlng};
                        //ClickToCMA(e);
                    },
                    textPlaceholder: 'Type In PSA to Search' // placeholder while nothing is searched
                });

                searchControl.on('search:locationfound', function (e) {

                    /* e.layer.setStyle({
                        //fillColor: '#3f0',
                        //color: '#0f0'
                        weight: 8,
                        color: '#008000',
                        dashArray: '',
                        dashArray: '',
                        fillOpacity: 0.7
                    }); */
                    //if (e.layer._popup)
                    //    e.layer.openPopup();

                }).on('search:expanded', function () {
                    $('.leaflet-control-search .search-button').hide();
                }).on('search:collapsed', function (e) {
                    $('.leaflet-control-search .search-button').show();
                    VpgmData3Layer.eachLayer(function (layer) {	//restore feature color
                        VpgmData3Layer.resetStyle(layer);
                    });
                });
                if (marketType === 'MARKET') {
                    map.addControl(searchControl);
                }

                else {
                    VpgmData3Layer.addTo(map);
                }

                var overlays = {};
                var myLayersControl = L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);
                const storeOverlays = await createStoreLayers(map, storeData);
                if (marketType == 'MARKET') {
                    const top25Overlays = await createTop25Layers(map, top25PSAsDataset, top25MDUsDataset);
                    overlays = Object.assign(overlays, storeOverlays, top25Overlays);
                }
                else {
                    overlays = Object.assign(overlays, storeOverlays);
                }
                if (PSAData) {
                    overlays = Object.assign(overlays, { 'PSA Locations': PSALayerCma });
                }
                if (futurePSAData) {
                    overlays = Object.assign(overlays, { 'Future PSA Locations': FuturePSALayerCma });
                }
                overlaysNames = Object.keys(overlays);
                overlaysNames.sort(sorter);
                overlaysNames.forEach(x => myLayersControl.addOverlay(overlays[x], x));

                map.on('overlayremove', function () {
                    //close open popup
                    map.closePopup();
                    // reset data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(map);
                });

                map.on('overlayadd', function () {
                    // rebuild data needed for the ponderApp.closest function
                    ponderApp.rebuildMapOverlaysData(map);

                    if (map.hasLayer(vectorGridCMA0)) {
                        vectorGridCMA0.bringToFront();
                        if (map.hasLayer(PSALayerCma)) {
                            PSALayerCma.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCMA1)) {
                        vectorGridCMA1.bringToFront();
                        if (map.hasLayer(PSALayerCma)) {
                            PSALayerCma.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCMA2)) {
                        vectorGridCMA2.bringToFront();
                        if (map.hasLayer(PSALayerCma)) {
                            PSALayerCma.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCMA3)) {
                        vectorGridCMA3.bringToFront();
                        if (map.hasLayer(PSALayerCma)) {
                            PSALayerCma.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridCMA4)) {
                        vectorGridCMA4.bringToFront();
                        if (map.hasLayer(PSALayerCma)) {
                            PSALayerCma.bringToFront();
                        }
                    }
                    if (map.hasLayer(VpgmData3Layer)) {
                        VpgmData3Layer.bringToFront();
                        if (map.hasLayer(PSALayerCma)) {
                            PSALayerCma.bringToFront();
                        }
                    }
                });

                ponderApp.updateOverlaysLabel();
                startCMA();
            }

            var showCMAModal = (props, clickedlat, clickedlong) => {
                CMAModal_Click();
                updateCMAModal(props, clickedlat, clickedlong); // function for getting data for modal
            }

            var CMAModal_Click = (source, eventArgs) => {
                var clickButton = document.getElementById("<%= btnCMAModal.ClientID %>");
                $('#LOADING_CMA_Modal').show();
                $('#CMAModalTitle').hide();
                $('#ModalDisplay_CMA').hide();

                if (Access == "Unlimited") {
                    $('#CMAfooterMapModal3').hide();
                    $('#CMAfooterMapModal').show();
                } else {
                    $('#CMAfooterMapModal').hide();
                    $('#CMAfooterMapModal3').show();
                }
                clickButton.click();
            }

            var updateCMAModal = async (props, clickedlat, clickedlong) => {
                console.log('updateCMAModal Start');
                var TOTALPOPSCOMMA = "";
                var COPPER_UPGRADECOMMA = "";
                var FIBER_AVAILABLECOMMA_CMA = "";
                var FIBER_CUSTOMERSCOMMA_CMA = "";
                var FIBER_OPPORTUNITYCOMMA_CMA = "";
                var NUMBER_OF_PSASCOMMA_CMA = "";
                if (props) {
                    TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                    COPPER_UPGRADECOMMA = Number(props.COPPER_UPGRADE).toLocaleString('en');
                    FIBER_AVAILABLECOMMA_CMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                    FIBER_CUSTOMERSCOMMA_CMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                    FIBER_OPPORTUNITYCOMMA_CMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    NUMBER_OF_PSASCOMMA_CMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                }
                document.getElementById('CMAModalTitle').innerHTML = 'CMA #' + props.cma + ' - ' + props.Name;
                document.getElementById('DisplayCMA').innerHTML = props.Name + ' (CMA #' + props.cma + ')';;
                document.getElementById('DisplayFiberAvail_CMA').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA_CMA;
                document.getElementById('DisplayFiberCurrent_CMA').innerHTML = 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA_CMA;
                document.getElementById('DisplayFiberPen_CMA').innerHTML = 'Fiber Penetration Rate: ' + props.FIBER_PERCENTAGE + "%";
                document.getElementById('DisplayFiberOpp_CMA').innerHTML = 'Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA_CMA;
                document.getElementById('DisplayCopperUpgrade_CMA').innerHTML = 'Copper Upgrade: ' + COPPER_UPGRADECOMMA;
                
                CMAModalSelected = props.CMA;

                let myParamsObject = {
                    type: "Get_CMAModalTable_Data",
                    CMAVariable: props.cma,
                };
                let data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                $('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                $('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                CMAModalTabledata = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_CMA_PSA_Detail_Market",
                    CMAVariable: props.cma,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                const CMAPSAData = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_CMA_MDU",
                    CMAVariable: props.cma,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                const CMAMDUData = JSON.parse(data.d);

                myParamsObject = {
                    type: "Get_CMA_Store_Detail",
                    CMAVariable: props.cma,
                    LatVariable: clickedlat,
                    LongVariable: clickedlong
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                const CMAstoreData = JSON.parse(data.d);

                if (CMAstoreData.length == 0) {
                    const marketType = getMarketType();
                    marketType == 'MARKET' ? CMAstoreData = appState.storeDataSet.market : (marketType == 'REGION' ? CMAstoreData = appState.storeDataSet.region : CMAstoreData = appState.storeDataSet.national)
                }

                myParamsObject = {
                    type: "Get_CopperUpgrade_Data",
                    CMAVariable: props.cma,
                };
                data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                const CMACopperUpgradeData = JSON.parse(data.d);

                var CMAVariable = props.cma;
                
                $('#myCMAModalCopperUpgradeMap').show();
                $('#myCMAModalMap').show();
                CMAModalCopperUpgradeTab(CMACopperUpgradeData, CMAstoreData, VpgmData3, MarketBoundaryData, CMAVariable);
                ShowCMAModalMap(VpgmData3, CMAstoreData, MarketBoundaryData, CMAVariable, CMAMDUData, CMACopperUpgradeData);
                CMAMDUTable(CMAMDUData, CMAVariable);

                //next two lines for testing
                $('#LOADING_CMA_Modal').hide();
                $('#CMAModalTitle').show();
                $('#ModalDisplay_CMA').show();
            }

            var ShowCMAModalMap = (VpgmData3, CMAstoreData, MarketBoundaryData, CMAVariable, CMAMDUData, copperUpgradeData) => {
                
                const ResetCMAModalTabs = () => {
                    document.getElementById('ddlCMACopperUpgradeSortBy').selectedIndex = 0;
                    const cmaPSATab = document.getElementById("cmaPSATab");
                    const cmaPSATabPane = document.getElementById("cmaPSATabLink");
                    cmaPSATab.classList.add("active");
                    cmaPSATabPane.classList.add("active");

                    var cmaMDUTab = document.getElementById("cmaMDUTab");
                    var cmaMDUTabPane = document.getElementById("cmaMDUTabLink");
                    cmaMDUTab.classList.remove("active");
                    cmaMDUTabPane.classList.remove("active");
                }
                ResetCMAModalTabs();

                $('#LOADING_CMA_Modal').hide();
                $('#ModalDisplay_CMA').show();

                $(window).resize();

                var ATTR = CMAstoreData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = CMAstoreData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });


                //check to make sure that ATTR and AR stores exist in the CMA - dont try to add a layer with no points.
                if (ATTR.length > 0) {
                    var ATTRstorePoints = new L.layerGroup();


                    for (i in ATTR) {
                        var popup =
                            //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                            '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                            '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                            '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                            loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                            ATTRstoreTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#002280'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                        //marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        ATTRstorePoints.addLayer(marker);
                    }
                }

                if (AR.length > 0) {
                    var ARstorePoints = new L.layerGroup();
                    for (i in AR) {
                        var popup =
                            //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                            '<b>Store Category:</b> ' + 'Authorized Reseller' +
                            '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                            '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                            loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                            ARstoreTableoptions = {
                                iconShape: 'doughnut',
                                iconSize: [12, 12],
                                borderWidth: 4,
                                borderColor: '#21b2ff'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                        //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                        //marker = new L.Marker(new L.latLng(loc), markerOptions);
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        ARstorePoints.addLayer(marker);
                    }
                }


                if (CMAMDUData.length > 0) {
                    $('#cmaMDUTab').show();

                    var MDU1 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 1; });
                    var MDU2 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 2; });
                    var MDU3 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var MDU4 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var MDU5 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 5; });

                    MDUPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><button class="cmamodalmdulink-button" style="background-color: white; border-style: none;"><a href="#" class="CMAModalMDULink">Click to Export Unit Numbers</a></button><br><button class="cmamodalmdulink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>';
                    } else {
                        var unitExportText = '<br><a href="#" class="CMAModalMDULink">Click to Show Unit Numbers</a>';
                    }
                    for (i in MDU1) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU1[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU1[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU1[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU1[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU1[i].HOUSE_NUMBER + ' ' + MDU1[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU1[i].CITY + ', ' + MDU1[i].STATE +
                            unitExportText,
                            loc = [MDU1[i].LATITUDE, MDU1[i].LONGITUDE],	//position found
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions1) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU1[i].HOUSE_NUMBER, MDU1[i].PREFIX, MDU1[i].STREET_NAME, MDU1[i].ZIP]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }
                    for (i in MDU2) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU2[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU2[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU2[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU2[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU2[i].HOUSE_NUMBER + ' ' + MDU2[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU2[i].CITY + ', ' + MDU2[i].STATE +
                            unitExportText,
                            loc = [MDU2[i].LATITUDE, MDU2[i].LONGITUDE],	//position found
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions2) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU2[i].HOUSE_NUMBER, MDU2[i].PREFIX, MDU2[i].STREET_NAME, MDU2[i].ZIP]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }
                    for (i in MDU3) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU3[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU3[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU3[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU3[i].HOUSE_NUMBER + ' ' + MDU3[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU3[i].CITY + ', ' + MDU3[i].STATE +
                            unitExportText,
                            loc = [MDU3[i].LATITUDE, MDU3[i].LONGITUDE],	//position found
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions3) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU3[i].HOUSE_NUMBER, MDU3[i].PREFIX, MDU3[i].STREET_NAME, MDU3[i].ZIP]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }
                    for (i in MDU4) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU4[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU4[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU4[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU4[i].HOUSE_NUMBER + ' ' + MDU4[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU4[i].CITY + ', ' + MDU4[i].STATE +
                            unitExportText,
                            loc = [MDU4[i].LATITUDE, MDU4[i].LONGITUDE],	//position found
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions4) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU4[i].HOUSE_NUMBER, MDU4[i].PREFIX, MDU4[i].STREET_NAME, MDU4[i].ZIP]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }
                    for (i in MDU5) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Indoor Coverage Score:</b> ' + MDU5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU5[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU5[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU5[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU5[i].HOUSE_NUMBER + ' ' + MDU5[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU5[i].CITY + ', ' + MDU5[i].STATE +
                            unitExportText,
                            loc = [MDU5[i].LATITUDE, MDU5[i].LONGITUDE],	//position found
                            marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDUIconOptions5) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU5[i].HOUSE_NUMBER, MDU5[i].PREFIX, MDU5[i].STREET_NAME, MDU5[i].ZIP]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }
                }
                else {
                    $('#cmaMDUTab').hide();
                }



                document.getElementById('myCMAModalMap').innerHTML = "<div id='CMAModalMap' style='height: 300px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
                        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                        subdomains: ['a', 'b', 'c']
                    });

                var baseLayers = {
                    "Streets": streets,
                    "Satellite": sat
                };

                // create a map options object, create the array of layers dynamically, then call in mapModal below.
                mapModalOptions = {
                    attributionControl: false,
                    preferCanvas: true,
                    center: [39.73, -104.99],
                    zoom: 10,
                    minZoom: 3,
                    //zoomControl: false,
                    layers: [],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                };

                //clean out layer array?
                //mapModalOptions.layers.splice(0, mapModalOptions.layers.length);

                mapModalOptions.layers.push(streets);
                if (ATTR.length > 0) { mapModalOptions.layers.push(ATTRstorePoints); }
                if (AR.length > 0) { mapModalOptions.layers.push(ARstorePoints); }

                if (CMAMDUData.length > 0) { mapModalOptions.layers.push(MDUPoints); }



                mapModal = L.map("CMAModalMap", mapModalOptions);

                function MDULinkClick(e) {
                    console.log(this.key);
                    //on popup open collapse layercontrol
                    $(".leaflet-control-layers")
                        .each(function () {
                            $(this).removeClass("leaflet-control-layers-expanded");
                        });
                    var popup = e.target.getPopup();
                    //on popup close collapse layercontrol
                    popup.on('remove', function () {
                        $(".leaflet-control-layers")
                            .each(function () {
                                $(this).addClass("leaflet-control-layers-expanded");
                            });
                    });
                    mapHouseValue = this.key[0];
                    mapPrefixValue = this.key[1];
                    mapStreetValue = this.key[2];
                    mapZipValue = this.key[3];
                }

                mapModal.on('popupopen', function (e) {
                    $('.CMAModalMDULink').click(function (e) {
                        SpecificMDUGetAddresses(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue);
                    });
                });

                async function SpecificMDUGetAddresses(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue) {
                    if (Access == "Unlimited") {
                        $('.cmamodalmdulink-button').attr("disabled", "disabled");
                        $('.cmamodalmdulink-spinner').show();
                        //log event
                        let myParamsObject = {
                            userID: "<%=hf_User.Value%>",
                        eventType: "CMA_MDU_SINGLE_EXPORT",
                            logData: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value,
                            logJsonPayload: JSON.stringify({
                                "HouseNumber": mapHouseValue,
                                "Prefix": mapPrefixValue,
                                "Street Name": mapStreetValue,
                                "Zip": mapZipValue
                            })
                        };
                        await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
                        //download data
                        ponderApp.startDownloadChecker("cmamodalmdulink-button", "cmamodalmdulink-spinner", 1200);
                        document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = mapHouseValue;
                        document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = mapStreetValue;
                        myParamsObject = {
                            type: "ExportToExcel_SelectedMDUAddressesCMA",
                            mduValue: document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value,
                            houseValue: mapHouseValue,
                            prefixValue: mapPrefixValue,
                            streetValue: mapStreetValue,
                            zipValue: mapZipValue,
                        };
                        const data = await ponderApp.getExportToExcelData(JSON.stringify({ myParamsObject }));
                        ponderApp.downloadFile(data, 'SelectMDU_Addresses_UnitNumbers.csv');
                    } else {
                        document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = mapHouseValue;
                        document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = mapStreetValue;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        MDUCMAShowAddressesFromMapClick(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue);
                    }
                }

                async function MDUCMAShowAddressesFromMapClick(mapHouseValue, mapPrefixValue, mapStreetValue, mapZipValue) {
                    var cmaVariable = CMAVariable;
                    var houseVariable = mapHouseValue;
                    var streetVariable = mapStreetValue;
                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + cmaVariable + ' - ' + houseVariable + ' ' + streetVariable;
                    const myParamsObject = {
                        type: "showData_MDUAddressesCMAFromMap",
                        CMAVariable: cmaVariable,
                        houseValue: mapHouseValue,
                        prefixValue: mapPrefixValue,
                        streetValue: mapStreetValue,
                        zipValue: mapZipValue,
                    };
                    const data = await ponderApp.getJsonData(JSON.stringify({ myParamsObject }));
                    unitNumbersData = JSON.parse(data.d);
                    ponderApp.showLimitedUserData(unitNumbersData);
                }

                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    //featureLayer.bindPopup(feature.properties.VPGM_Markt);
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(mapModal);

                function onEachFeatureCMA(feature, featureLayer) {
                    //featureLayer.bindPopup(feature.properties.ZIP);
                }

                var CMAModalLayerGroup = L.layerGroup().addTo(mapModal);

                var myCMAModalStyle = {
                    weight: 5,
                    color: '#000000',
                    opacity: 0.5,
                    fillOpacity: 0.05
                };

                CMAModalLayerTest = L.geoJSON(VpgmData3, {
                    style: myCMAModalStyle,
                    filter: CMAModalFilter,
                    onEachFeature: onEachFeatureCMA
                }).addTo(CMAModalLayerGroup);




                function CMAModalFilter(feature) {
                    if (feature.properties.cma == CMAVariable) return true
                }

                mapModal.fitBounds(CMAModalLayerTest.getBounds());

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(mapModal);
                const overlays = {};

                if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                if (CMAMDUData.length > 0) { overlays["High Opportunity MDUs"] = MDUPoints; }

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);

                const CMAPSATabClickHandler = () => {
                    $('#myCMAModalMap').hide();
                    $('#myCMAModalCopperUpgradeMap').show();
                    CMAModalCopperUpgradeMap.invalidateSize();
                    //set bounds
                    let allCopperUpgradePoints = new L.featureGroup();
                    for (i in copperUpgradeData) {
                        const loc = [copperUpgradeData[i].LATITUDE, copperUpgradeData[i].LONGITUDE];
                        marker = new L.Marker(new L.latLng(loc));
                        allCopperUpgradePoints.addLayer(marker);
                    }
                    const bounds = allCopperUpgradePoints.getBounds();
                    CMAModalCopperUpgradeMap.fitBounds(bounds);
                }
                const CMAMDUTabClickHandler = () => {
                    $('#myCMAModalMap').show();
                    $('#myCMAModalCopperUpgradeMap').hide();
                    mapModal.invalidateSize();
                    //set bounds
                    let allMDUPoints = new L.featureGroup();
                    for (i in CMAMDUData) {
                        const loc = [CMAMDUData[i].LATITUDE, CMAMDUData[i].LONGITUDE];
                        marker = new L.Marker(new L.latLng(loc));
                        allMDUPoints.addLayer(marker);
                    }
                    const bounds = allMDUPoints.getBounds();
                    mapModal.fitBounds(bounds);
                }
                // hide and show layers based on different tab clicks
                $('#cmaPSATab').click(function (e) {
                    CMAPSATabClickHandler();
                });
                $('#cmaMDUTab').click(function (e) {
                    CMAMDUTabClickHandler();
                });
                ponderApp.updateOverlaysLabel();
                if (copperUpgradeData.length == 0) {
                    $('#cmaPSATab').hide();
                    $('#myCMAModalCopperUpgradeMap').hide();
                }
                else {
                    CMAPSATabClickHandler();
                }
            }

            var storeMapV3 = function (VpgmData, storeData, VpgmData2, VpgmData3, MarketBoundaryData) {

                console.log('************************************************storeMapV3');
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var ATTR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });

                //var ATTRstorePoints = new L.layerGroup();
                //var ARstorePoints = new L.layerGroup();

                //var regionLevels = [
                //    0,  //REGION
                //    0,
                //    1,  //MARKET_GROUP
                //    1,
                //    2,  //STATE
                //    2,
                //    3,  //COUNTY
                //    3,
                //    4,  //CITY
                //    4,
                //    5,  //ZIP
                //    5,
                //    5,
                //    5,
                //    5,
                //    5,
                //    5,
                //    5,
                //    5
                //];

                //var clusterOptions = {
                //    //regionLevels: regionLevels,
                //    maxClusterRadius: 50,
                //    addRegionToolTips: true,
                //    allowClustersOfOne: false,
                //    chunkedLoading: true,
                //    disableClusteringAtZoom: 8,
                //    spiderfyOnMaxZoom: false,
                //    hullHugFactor: 'auto',
                //    polygonOptions: {
                //        color: 'blue', // default: '#0033ff'
                //        weight: 4, // default: 5
                //        opacity: 0.6, // default: 0.5
                //        fill: true,
                //        fillColor: 'white', // default: same as color
                //        fillOpacity: 0.4, // default: 0.2
                //        lineCap: 'round',
                //        lineJoin: 'round'
                //    }
                //};


                mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 8, spiderfyOnMaxZoom: false }),

                    ATTRstorePoints = L.featureGroup.subGroup(mcg),
                    ARstorePoints = L.featureGroup.subGroup(mcg);

                //var ATTRstorePoints = new L.MarkerClusterGroup(clusterOptions);
                //var ARstorePoints = new L.MarkerClusterGroup(clusterOptions);



                for (i in ATTR) {
                    var popup =
                        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                        '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                        ATTRstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#002280'
                        };

                    var SALES_REGION = ATTR[i][12];
                    var SALES_VPGM_MARKET = ATTR[i][13];
                    var STATE = ATTR[i][7];
                    var COUNTY = ATTR[i][9];
                    var CITY = ATTR[i][6];
                    var ZIP_CODE = ATTR[i][8];

                    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                    markerOptions = { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) }; //regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE],
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    ATTRstorePoints.addLayer(marker);
                }

                for (i in AR) {
                    var popup =
                        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                        '<b>Store Category:</b> ' + 'Authorized Reseller' +
                        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                        ARstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#21b2ff'
                        };

                    var SALES_REGION = AR[i][12];
                    var SALES_VPGM_MARKET = AR[i][13];
                    var STATE = AR[i][7];
                    var COUNTY = AR[i][9];
                    var CITY = AR[i][6];
                    var ZIP_CODE = AR[i][8];

                    //marker = new L.Marker(new L.latLng(loc), { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                    markerOptions = { icon: L.BeautifyIcon.icon(ARstoreTableoptions) }; //regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE],
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    ARstorePoints.addLayer(marker);
                }

                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v4.3 - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('https://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                var topo = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                    id: 'osm.topo',
                    maxZoom: 17,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                    sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                        id: 'arcgis.sat',
                        maxZoom: 17,
                        zIndex: 1,
                        attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                        subdomains: ['a', 'b', 'c']
                    }),
                    streets = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        id: 'osm.streets',
                        maxZoom: 19,
                        zIndex: 1,
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

                map = L.map("storemapid", {
                    attributionControl: false,
                    preferCanvas: true,
                    center: [39.73, -104.99],
                    zoom: 10,
                    minZoom: 3,
                    layers: [streets, ATTRstorePoints, ARstorePoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                mcg.addTo(map);

                function styleBoundary(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        //color: "#ff7800",
                        weight: 3,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function onEachFeatureBoundary(feature, featureLayer) {
                    //if (groupGeo == "ACE") {
                    //    if (marketGeo == "ALL" | marketGeo == "CENTRAL" | marketGeo == "NORTHEAST" | marketGeo == "SOUTHEAST" | marketGeo == "WEST") {
                    //        featureLayer.bindPopup(feature.properties.Region);
                    //    }
                    //    else {
                    //        featureLayer.bindPopup(feature.properties.Market_Lon);
                    //    }
                    //} else {
                    featureLayer.bindPopup(feature.properties.VPGM_Markt);
                    //}
                }

                var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                    style: styleBoundary,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(map);

                var info = L.control({ position: 'bottomleft' });

                info.onAdd = function (map) {
                    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                    this.update();
                    return this._div;
                };

                // method that we will use to update the control based on feature properties passed
                info.update = function (props) {
                    //console.log(props);
                    this._div.innerHTML = '<h4>Zip Code Information</h4>' + (props ?
                        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                        '<b>Zip Code: ' + props.ZIP + '</b><br />' + 'Population: ' + props.ZIP_POPS +
                        '<br />' + 'CMA: ' + props.CMA + '<br />CMA Name: ' + props.CMA_Name
                        : 'Hover over a zip code');
                };

                info.addTo(map);



                var highlight;
                var highlight0;
                var highlight1;
                var highlight2;
                var highlight3;
                var highlight4;
                var zoom0;
                var clearHighlight = function () {
                    if (highlight) {
                        vectorGridZip.resetFeatureStyle(highlight);
                        info.update();
                    }
                    highlight = null;
                };

                var clearHighlight0 = function () {
                    if (highlight0) {
                        vectorGridZip0.resetFeatureStyle(highlight0);
                        info.update();
                    }
                    highlight0 = null;
                };

                var clearHighlight1 = function () {
                    if (highlight1) {
                        vectorGridZip1.resetFeatureStyle(highlight1);
                        info.update();
                    }
                    highlight1 = null;
                };

                var clearHighlight2 = function () {
                    if (highlight2) {
                        vectorGridZip2.resetFeatureStyle(highlight2);
                        info.update();
                    }
                    highlight2 = null;
                };

                var clearHighlight3 = function () {
                    if (highlight3) {
                        vectorGridZip3.resetFeatureStyle(highlight3);
                        info.update();
                    }
                    highlight3 = null;
                };

                var clearHighlight4 = function () {
                    if (highlight4) {
                        vectorGridZip4.resetFeatureStyle(highlight4);
                        info.update();
                    }
                    highlight4 = null;
                };

                //function getGeometry(VpgmData, idProperty) {

                //    VpgmLayerTest = L.geoJSON(VpgmData, { filter: zipFilter });
                //    function zipFilter(feature) {
                //        if (feature.properties.ZIP == idProperty) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());

                //};

                vectorGridZip0 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                                const heatMapConfig = ponderApp.heatMapConfig(properties)[heatTheme];
                                return {
                                    fillColor: heatMapConfig.button1.criteria ? heatMapConfig.button1.color :
                                        heatMapConfig.button2.criteria ? heatMapConfig.button2.color :
                                            heatMapConfig.button3.criteria ? heatMapConfig.button3.color :
                                                heatMapConfig.button4.criteria ? heatMapConfig.button4.color :
                                                    '#ffffff',
                                    //var p = properties.ZIP_POPS;
                                    //return {
                                    //    fillColor: p > 5000 ? '#b3ffb3' :
                                    //        p > 4000 ? '#b3d9ff' :
                                    //            p > 3000 ? '#ffff99' :
                                    //                p > 1000 ? '#ffe6cc' :
                                    //                    '#ffffff',
                                    fillOpacity: 0.5,
                                    //fillOpacity: 1,
                                    stroke: true,
                                    fill: true,
                                    color: 'black',
                                    opacity: 0.8,
                                    weight: .5,
                                }
                            }
                        },
                        interactive: false,
                        getFeatureId: function (f) {
                            return f.properties.ZIP;
                        },

                    })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    //clearHighlight0();
                    //    //highlight0 = properties.ZIP;

                    //    var p = properties.ZIP_POPS;
                    //    var style = {
                    //        //fillColor: p > 5000 ? '#b3ffb3' :
                    //        //    p > 4000 ? '#b3d9ff' :
                    //        //        p > 3000 ? '#ffff99' :
                    //        //            p > 1000 ? '#ffe6cc' :
                    //        //                '#ffffff',
                    //        //fillOpacity: 0.5,
                    //        //fillOpacity: 1,
                    //        stroke: true,
                    //        //fill: true,
                    //        color: '#008000',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    info.update(properties);

                    //    vectorGridZip0.setFeatureStyle(properties.ZIP, style);
                    //})

                    //.on('mouseout', function (e) {
                    //    var properties = e.layer.properties;
                    //    clearHighlight0();
                    //    highlight0 = properties.ZIP;

                    //    //info.update(properties);

                    //})

                    //.on('click', function (e) {

                    //    var properties = e.layer.properties;
                    //    getGeometry(VpgmData, properties.ZIP);

                    //})

                    .addTo(map);

                vectorGridZip1 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#ffff99' :
                                            p > 1000 ? '#ff9933' :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    //.on('mouseover', function (e) {
                    //    var properties = e.layer.properties;
                    //    L.popup()
                    //        .setContent(properties.ZIP || properties.type)
                    //        .setLatLng(e.latlng)
                    //        .openOn(map);

                    //    clearHighlight1();
                    //    highlight1 = properties.ZIP;

                    //    var p = properties.ZIP_POPS;
                    //    var style = {
                    //        fillColor: p > 5000 ? '#b3ffb3' :
                    //            p > 4000 ? '#b3d9ff' :
                    //                p > 3000 ? '#ffff99' :
                    //                    p > 1000 ? '#ffe6cc' :
                    //                        '#ffffff',
                    //        fillOpacity: 0.5,
                    //        fillOpacity: 1,
                    //        stroke: true,
                    //        fill: true,
                    //        color: 'red',
                    //        opacity: 1,
                    //        weight: 4,
                    //    };

                    //    info.update(properties);

                    //    vectorGridZip1.setFeatureStyle(properties.ZIP, style);
                    //})
                    //.on('click', function (e) {
                    //    zoomToFeature(e.layer.properties);

                    //})

                    .addTo(map);

                vectorGridZip2 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#ffff00' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    .on('mouseover', function (e) {
                        var properties = e.layer.properties;
                        L.popup()
                            .setContent(properties.ZIP || properties.type)
                            .setLatLng(e.latlng)
                            .openOn(map);

                        clearHighlight2();
                        highlight2 = properties.ZIP;

                        var p = properties.ZIP_POPS;
                        var style = {
                            fillColor: p > 5000 ? '#b3ffb3' :
                                p > 4000 ? '#b3d9ff' :
                                    p > 3000 ? '#ffff99' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffffff',
                            fillOpacity: 0.5,
                            fillOpacity: 1,
                            stroke: true,
                            fill: true,
                            color: 'red',
                            opacity: 1,
                            weight: 4,
                        };

                        info.update(properties);

                        vectorGridZip2.setFeatureStyle(properties.ZIP, style);
                    })
                    .on('click', function (e) {
                        zoomToFeature(e.layer.properties);

                    })

                    .addTo(map);

                vectorGridZip3 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#4da6ff' :
                                        p > 3000 ? '#ffff99' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    .on('mouseover', function (e) {
                        var properties = e.layer.properties;
                        L.popup()
                            .setContent(properties.ZIP || properties.type)
                            .setLatLng(e.latlng)
                            .openOn(map);

                        clearHighlight3();
                        highlight3 = properties.ZIP;

                        var p = properties.ZIP_POPS;
                        var style = {
                            fillColor: p > 5000 ? '#b3ffb3' :
                                p > 4000 ? '#b3d9ff' :
                                    p > 3000 ? '#ffff99' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffffff',
                            fillOpacity: 0.5,
                            fillOpacity: 1,
                            stroke: true,
                            fill: true,
                            color: 'red',
                            opacity: 1,
                            weight: 4,
                        };

                        info.update(properties);

                        vectorGridZip3.setFeatureStyle(properties.ZIP, style);
                    })
                    .on('click', function (e) {
                        zoomToFeature(e.layer.properties);

                    })

                    .addTo(map);

                vectorGridZip4 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#009900' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#ffff99' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    .on('mouseover', function (e) {
                        var properties = e.layer.properties;
                        L.popup()
                            .setContent(properties.ZIP || properties.type)
                            .setLatLng(e.latlng)
                            .openOn(map);

                        clearHighlight4();
                        highlight4 = properties.ZIP;

                        var p = properties.ZIP_POPS;
                        var style = {
                            fillColor: p > 5000 ? '#b3ffb3' :
                                p > 4000 ? '#b3d9ff' :
                                    p > 3000 ? '#ffff99' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffffff',
                            fillOpacity: 0.5,
                            fillOpacity: 1,
                            stroke: true,
                            fill: true,
                            color: 'red',
                            opacity: 1,
                            weight: 4,
                        };

                        info.update(properties);

                        vectorGridZip4.setFeatureStyle(properties.ZIP, style);
                    })
                    .on('click', function (e) {
                        zoomToFeature(e.layer.properties);

                    })

                    .addTo(map);

                vectorGridCounty = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#ffff99' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    .on('mouseover', function (e) {
                        var properties = e.layer.properties;
                        L.popup()
                            .setContent(properties.ZIP || properties.type)
                            .setLatLng(e.latlng)
                            .openOn(map);

                        clearHighlight();
                        highlight = properties.ZIP;

                        var p = properties.ZIP_POPS;
                        var style = {
                            fillColor: p > 5000 ? '#b3ffb3' :
                                p > 4000 ? '#b3d9ff' :
                                    p > 3000 ? '#ffff99' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffffff',
                            fillOpacity: 0.5,
                            fillOpacity: 1,
                            stroke: true,
                            fill: true,
                            color: 'red',
                            opacity: 1,
                            weight: 4,
                        };

                        info.update(properties);

                        vectorGridCounty.setFeatureStyle(properties.ZIP, style);
                    })
                    .on('click', function (e) {
                        zoomToFeature(e.layer.properties);

                    })

                    .addTo(map);

                vectorGridCMA = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#ffff99' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffffff',
                                fillOpacity: 0.5,
                                //fillOpacity: 1,
                                stroke: true,
                                fill: true,
                                color: 'black',
                                opacity: 0.8,
                                weight: .5,
                            }
                        }
                    },
                    interactive: false,
                    getFeatureId: function (f) {
                        return f.properties.ZIP;
                    }
                })
                    .on('mouseover', function (e) {
                        var properties = e.layer.properties;
                        L.popup()
                            .setContent(properties.ZIP || properties.type)
                            .setLatLng(e.latlng)
                            .openOn(map);

                        clearHighlight();
                        highlight = properties.ZIP;

                        var p = properties.ZIP_POPS;
                        var style = {
                            fillColor: p > 5000 ? '#b3ffb3' :
                                p > 4000 ? '#b3d9ff' :
                                    p > 3000 ? '#ffff99' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffffff',
                            fillOpacity: 0.5,
                            fillOpacity: 1,
                            stroke: true,
                            fill: true,
                            color: 'red',
                            opacity: 1,
                            weight: 4,
                        };

                        info.update(properties);

                        vectorGridCMA.setFeatureStyle(properties.ZIP, style);
                    })
                    .on('click', function (e) {
                        zoomToFeature(e.layer.properties);

                    })

                    .addTo(map);

                map.on('click', clearHighlight);

                map.on('baselayerchange', function () {
                    if (map.hasLayer(vectorGridZip0)) {
                        vectorGridZip0.bringToFront();
                    }
                    if (map.hasLayer(vectorGridZip1)) {
                        vectorGridZip1.bringToFront();
                    }
                    if (map.hasLayer(vectorGridZip2)) {
                        vectorGridZip2.bringToFront();
                    }
                    if (map.hasLayer(vectorGridZip3)) {
                        vectorGridZip3.bringToFront();
                    }
                    if (map.hasLayer(vectorGridZip4)) {
                        vectorGridZip4.bringToFront();
                    }
                });

                /////////////////////////////

                function highlightFeature(e) {
                    this.openPopup();
                    var layer = e.target;
                    layer.setStyle({
                        weight: 5,
                        color: '#000000',
                        opacity: 0.5,
                        fillOpacity: 0.001
                        //stroke: true,
                        //color: '#008000',
                        //opacity: 1,
                        //weight: 5,
                    });

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    info.update(layer.feature.properties);
                }

                function resetHighlight(e) {
                    this.closePopup();
                    VpgmDataLayer.resetStyle(e.target);
                    info.update();
                }

                function zoomToFeature(e) {
                    var bounds = e.target.getBounds().pad(0.5);
                    map.fitBounds(bounds);
                }



                function onEachFeature(feature, layer) {
                    layer.bindPopup(feature.properties.ZIP);
                    if (navigator.userAgent.indexOf("Firefox") > 0) {
                        layer.on({
                            mouseover: highlightFeature,
                            mouseout: resetHighlight,
                            click: zoomToFeature
                        });
                    } else {
                        if (L.Browser.touch) {
                            layer.on({
                                click: highlightFeatureTouch,
                            });
                        } else {
                            layer.on({
                                mouseover: highlightFeature,
                                mouseout: resetHighlight,
                                click: zoomToFeature
                            });
                        }
                    }
                }

                //////////////////////////////

                var myStyle = {
                    "color": "#ffffff",
                    "weight": 0,
                    "opacity": 0.00
                };

                VpgmDataLayer = L.geoJSON(VpgmData, {
                    onEachFeature: onEachFeature,
                    style: myStyle
                });
                map.fitBounds(VpgmDataLayer.getBounds());



                map.on('zoomend', function () {
                    var zoomlevel = map.getZoom();
                    if (zoomlevel < 5) {
                        if (map.hasLayer(vectorGridCounty)) {
                            map.removeLayer(vectorGridZip0);
                            map.removeLayer(vectorGridCounty);
                            map.addLayer(vectorGridCMA);
                        } else {
                            console.log("no point layer active");
                        }
                    }
                    if (zoomlevel >= 5 & zoomlevel < 6) {
                        if (map.hasLayer(vectorGridZip0)) {
                            map.removeLayer(vectorGridZip0);
                            map.removeLayer(vectorGridCMA);
                            map.addLayer(vectorGridCounty);
                        } else {
                            console.log("no point layer active");
                        }
                        if (map.hasLayer(vectorGridCMA)) {
                            map.removeLayer(vectorGridZip0);
                            map.removeLayer(vectorGridCMA);
                            map.addLayer(vectorGridCounty);
                        } else {
                            console.log("no point layer active");
                        }
                    }
                    if (zoomlevel >= 6) {
                        if (map.hasLayer(vectorGridZip0)) {
                            console.log("layer already added");
                        } else {
                            map.removeLayer(vectorGridCounty);
                            map.removeLayer(vectorGridCMA);
                            map.addLayer(vectorGridZip0);
                        }
                        if (map.hasLayer(vectorGridCounty)) {
                            console.log("layer already added");
                        } else {
                            map.removeLayer(vectorGridCounty);
                            map.removeLayer(vectorGridCMA);
                            map.addLayer(vectorGridZip0);
                        }
                    }
                    console.log("Current Zoom Level =" + zoomlevel)
                });

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                // add the search bar to the map
                var searchControl = new L.Control.Search({
                    //container: 'findbox',
                    collapsed: true,
                    autoCollapse: true,
                    position: 'topleft',
                    layer: VpgmDataLayer,
                    propertyName: 'ZIP',
                    marker: false,
                    moveToLocation: function (latlng, title, map) {
                        var zoom = map.getBoundsZoom(latlng.layer.getBounds());
                        map.setView(latlng, zoom); // access the zoom
                    },
                    textPlaceholder: 'search...' // placeholder while nothing is searched
                });

                searchControl.on('search:locationfound', function (e) {

                    e.layer.setStyle({
                        //fillColor: '#3f0',
                        //color: '#0f0'
                        weight: 8,
                        color: '#008000',
                        dashArray: '',
                        dashArray: '',
                        fillOpacity: 0.7
                    });
                    if (e.layer._popup)
                        e.layer.openPopup();

                }).on('search:expanded', function () {
                    $('.leaflet-control-search .search-button').hide();
                }).on('search:collapsed', function (e) {
                    $('.leaflet-control-search .search-button').show();
                    VpgmDataLayer.eachLayer(function (layer) {	//restore feature color
                        VpgmDataLayer.resetStyle(layer);
                    });
                });
                if (marketType === 'MARKET') {
                    map.addControl(searchControl);
                }

                // else add to map?

                var overlays = {
                    //"VPGM Market Borders": MarketBoundaryLayer,
                    "CMA Overlay": vectorGridCMA,
                    "County Overlay": vectorGridCounty,
                    "Zip Overlay": vectorGridZip0,
                    "AT&T Retail Store": ATTRstorePoints,
                    "Authorized Reseller Store": ARstorePoints
                };

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);
                ponderApp.updateOverlaysLabel()
                turnLayer0ZipOn();


            }

            function startZip() {
                ZipLayerState = 0;
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip0);
                document.getElementById('TableSubtitle2').innerHTML = "";
            }

            function turnLayer0ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                //if (map.hasLayer(vectorGridZip0)) {
                //    return;
                //} else {
                document.getElementById('TableSubtitle2').innerHTML = "";
                ZipLayerState = 0;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip0);
                //};
            }
            function turnLayer1ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button1.buttonText + ')';
                ZipLayerState = 1;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip1);
            }
            function turnLayer2ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button2.buttonText + ')';
                ZipLayerState = 2;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip2);
            }
            function turnLayer3ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button3.buttonText + ')';
                ZipLayerState = 3;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip3);
            }
            function turnLayer4ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button4.buttonText + ')';
                ZipLayerState = 4;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip4);
            }

            function startCounty() {
                CountyLayerState = 0;
                map.removeLayer(vectorGridCounty0);
                map.removeLayer(vectorGridCounty1);
                map.removeLayer(vectorGridCounty2);
                map.removeLayer(vectorGridCounty3);
                map.removeLayer(vectorGridCounty4);
                map.addLayer(vectorGridCounty0);
                document.getElementById('TableSubtitle2').innerHTML = "";
            }

            function turnLayer0CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                //if (map.hasLayer(vectorGridCounty0)) {
                //    return;
                //} else {
                document.getElementById('TableSubtitle2').innerHTML = "";
                CountyLayerState = 0;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCounty0);
                map.removeLayer(vectorGridCounty1);
                map.removeLayer(vectorGridCounty2);
                map.removeLayer(vectorGridCounty3);
                map.removeLayer(vectorGridCounty4);
                map.addLayer(vectorGridCounty0);
                //}
            }
            function turnLayer1CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button1.buttonText + ')';
                CountyLayerState = 1;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCounty0);
                map.removeLayer(vectorGridCounty1);
                map.removeLayer(vectorGridCounty2);
                map.removeLayer(vectorGridCounty3);
                map.removeLayer(vectorGridCounty4);
                map.addLayer(vectorGridCounty1);
                //if (map.hasLayer(Vpgm2LayerTest)) {
                //    Vpgm2LayerTest.clearLayers();
                //    map.removeControl(infoDatatableCounty);
                //    map.addControl(infoCounty);
                //};
                //if (map.hasLayer(vectorGridCounty1)) {
                //    return;
                //} else {
                //    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                //    CountyLayerState = 1;
                //    UpdateHomeTable();
                //    map.removeLayer(vectorGridCounty0);
                //    map.removeLayer(vectorGridCounty1);
                //    map.removeLayer(vectorGridCounty2);
                //    map.removeLayer(vectorGridCounty3);
                //    map.removeLayer(vectorGridCounty4);
                //    map.addLayer(vectorGridCounty1);
                //}
            }
            function turnLayer2CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button2.buttonText + ')';
                CountyLayerState = 2;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCounty0);
                map.removeLayer(vectorGridCounty1);
                map.removeLayer(vectorGridCounty2);
                map.removeLayer(vectorGridCounty3);
                map.removeLayer(vectorGridCounty4);
                map.addLayer(vectorGridCounty2);

            }
            function turnLayer3CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button3.buttonText + ')';
                CountyLayerState = 3;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCounty0);
                map.removeLayer(vectorGridCounty1);
                map.removeLayer(vectorGridCounty2);
                map.removeLayer(vectorGridCounty3);
                map.removeLayer(vectorGridCounty4);
                map.addLayer(vectorGridCounty3);
            }
            function turnLayer4CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button4.buttonText + ')';
                CountyLayerState = 4;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCounty0);
                map.removeLayer(vectorGridCounty1);
                map.removeLayer(vectorGridCounty2);
                map.removeLayer(vectorGridCounty3);
                map.removeLayer(vectorGridCounty4);
                map.addLayer(vectorGridCounty4);
            }

            function startCMA() {
                CMALayerState = 0;
                map.removeLayer(vectorGridCMA0);
                map.removeLayer(vectorGridCMA1);
                map.removeLayer(vectorGridCMA2);
                map.removeLayer(vectorGridCMA3);
                map.removeLayer(vectorGridCMA4);
                map.addLayer(vectorGridCMA0);
                document.getElementById('TableSubtitle2').innerHTML = "";
            }

            function turnLayer0CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);

                //if (map.hasLayer(vectorGridCMA0)) {
                //    return;
                //} else {
                document.getElementById('TableSubtitle2').innerHTML = "";
                CMALayerState = 0;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCMA0);
                map.removeLayer(vectorGridCMA1);
                map.removeLayer(vectorGridCMA2);
                map.removeLayer(vectorGridCMA3);
                map.removeLayer(vectorGridCMA4);
                map.addLayer(vectorGridCMA0);
                //}
            }
            function turnLayer1CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                //if (map.hasLayer(vectorGridCMA1)) {
                //    return;
                //} else {
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button1.buttonText + ')';
                CMALayerState = 1;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCMA0);
                map.removeLayer(vectorGridCMA1);
                map.removeLayer(vectorGridCMA2);
                map.removeLayer(vectorGridCMA3);
                map.removeLayer(vectorGridCMA4);
                map.addLayer(vectorGridCMA1);
                //could make the button outline bold bc of being selected
                //}
            }
            function turnLayer2CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                //if (map.hasLayer(vectorGridCMA2)) {
                //    return;
                //} else {
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button2.buttonText + ')';
                CMALayerState = 2;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCMA0);
                map.removeLayer(vectorGridCMA1);
                map.removeLayer(vectorGridCMA2);
                map.removeLayer(vectorGridCMA3);
                map.removeLayer(vectorGridCMA4);
                map.addLayer(vectorGridCMA2);
                //}
            }
            function turnLayer3CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                //if (map.hasLayer(vectorGridCMA3)) {
                //    return;
                //} else {
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button3.buttonText + ')';
                CMALayerState = 3;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCMA0);
                map.removeLayer(vectorGridCMA1);
                map.removeLayer(vectorGridCMA2);
                map.removeLayer(vectorGridCMA3);
                map.removeLayer(vectorGridCMA4);
                map.addLayer(vectorGridCMA3);
                //}
            }
            function turnLayer4CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                //if (map.hasLayer(vectorGridCMA4)) {
                //    return;
                //} else {
                const heatTheme = $('#<%= ddlHeatTheme.ClientID %> option:selected').val();
                const heatMapConfig = ponderApp.heatMapConfig()[heatTheme];
                document.getElementById('TableSubtitle2').innerHTML = ' (' + heatMapConfig.button4.buttonText + ')';
                CMALayerState = 4;
                //UpdateHomeTable();
                FilterHomeTable();
                map.removeLayer(vectorGridCMA0);
                map.removeLayer(vectorGridCMA1);
                map.removeLayer(vectorGridCMA2);
                map.removeLayer(vectorGridCMA3);
                map.removeLayer(vectorGridCMA4);
                map.addLayer(vectorGridCMA4);
                //}
            }

            function turnLayer0On() {
                map.removeLayer(VpgmCMA);
                map.removeLayer(VpgmCounty);
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                //VpgmLayer = L.geoJSON(VpgmData, {
                //    onEachFeature: onEachFeature,
                //    style: style0
                //}).addTo(map);
                map.addLayer(VpgmLayer);
            }

            function turnLayer1On() {
                map.removeLayer(VpgmCMA);
                map.removeLayer(VpgmCounty);
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                //VpgmLayer = L.geoJSON(VpgmData, {
                //    onEachFeature: onEachFeature,
                //    style: style1
                //}).addTo(map);
                map.addLayer(VpgmLayer1);
            }

            function turnLayer2On() {
                map.removeLayer(VpgmCMA);
                map.removeLayer(VpgmCounty);
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                //VpgmLayer = L.geoJSON(VpgmData, {
                //    onEachFeature: onEachFeature,
                //    style: style2
                //}).addTo(map);
                map.addLayer(VpgmLayer2);
            }

            function turnLayer3On() {
                map.removeLayer(VpgmCMA);
                map.removeLayer(VpgmCounty);
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                //VpgmLayer = L.geoJSON(VpgmData, {
                //    onEachFeature: onEachFeature,
                //    style: style3
                //}).addTo(map);
                map.addLayer(VpgmLayer3);
            }

            function turnLayer4On() {
                map.removeLayer(VpgmCMA);
                map.removeLayer(VpgmCounty);
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                //VpgmLayer = L.geoJSON(VpgmData, {
                //    onEachFeature: onEachFeature,
                //    style: style4
                //}).addTo(map);
                map.addLayer(VpgmLayer4);
            }

            function turnLayerCountyOn() {
                map.removeLayer(VpgmCMA);
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                map.addLayer(VpgmCounty);
            }

            function turnLayerCMAOn() {
                map.removeLayer(VpgmLayer);
                map.removeLayer(VpgmCounty);
                map.removeLayer(VpgmLayer1);
                map.removeLayer(VpgmLayer2);
                map.removeLayer(VpgmLayer3);
                map.removeLayer(VpgmLayer4);
                map.addLayer(VpgmCMA);
            }



            //$('.btnprimary1').click(function () {
            //    if ($(this).hasClass('active')) {
            //        $(this).removeClass('active')
            //    } else {
            //        $(this).addClass('active')
            //    }
            //});

            $('.oneButton').click(function () {
                var clicked = $(this);
                console.log("clicked button");
                console.log(clicked);

                if (clicked.hasClass('active')) {
                    //$('.oneButton').removeClass('disabled'); //enable all again
                    //clicked.removeClass('active');
                } else {
                    $('.oneButton').removeClass('active');
                    clicked.addClass('active');
                    //clicked.removeClass('disabled');
                    //$('.oneButton').not(clicked).addClass('disabled'); //disable everything except clicked element
                }
            });

            function UpdateTime() {
                console.log("This WORKED!");
            }

        }

        function UpdateTime() {
            console.log("This WORKED!");
        }

    </script>


</asp:Content>
