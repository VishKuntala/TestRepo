<%@ Page Title="Sales Opportunity TestingV2" Language="C#" MasterPageFile="~/MasterPageSalesTesting.master" AutoEventWireup="true" CodeFile="Sales_Opportunity_TestingV2.aspx.cs" Inherits="sales_Sales_Opportunity_TestingV2" %>

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

    <%--<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>--%>

    <script src="../assets_v7_0_0/plugins/global/plugins.bundle.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/prismjs/prismjs.bundle.js"></script>
    <script src="../assets_v7_0_0/js/scripts.bundle.js"></script>

    <%--<script src="../assets_v7_0_0/plugins/custom/datatables/datatables.bundle.js"></script>--%>

    <%--<script type="text/javascript" src="http://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>--%>

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
    <script src="../capacity/maps/leaflet-search.src.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
    <script src="../capacity/maps/Control.TouchHover.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.18/b-1.5.6/b-flash-1.5.6/b-html5-1.5.6/fh-3.1.4/sl-1.3.0/datatables.min.js"></script>
    <script type="text/javascript" src="http://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

    <%--<script src="../assets_v7_0_0/js/pages/crud/datatables/extensions/scroller.js"></script>--%>

    <style>

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

        .legendZip {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }


         .legendCMA {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendZip i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }


        .legendCMA i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .legendZipNoPSA {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendZipNoPSA i {
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
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

        .legendTwoRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendTwoRows.legendTwoRows {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 170px;
        }

        .legendTwoRows .doughnutTwoRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendThreeRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendThreeRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendThreeRows.legendThreeRows {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 66px;
            width: 170px;
        }

        .legendThreeRows .doughnutThreeRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendFourRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendFourRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendFourRows.legendFourRows {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 88px;
            width: 170px;
        }

        .legendFourRows .doughnutFourRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendFiveRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendFiveRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendFiveRows.legendFiveRows {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 108px;
            width: 170px;
        }

        .legendFiveRows .doughnutFiveRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchOneRow{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendSearchOneRow{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendSearchOneRow i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendSearchOneRow.legendSearchOneRow {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 22px;
            width: 170px;
        }

        .legendSearchOneRow .doughnutOneRow {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchOneRow .doughnutTwoRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchOneRow .doughnutThreeRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchTwoRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendSearchTwoRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendSearchTwoRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendSearchTwoRows.legendSearchTwoRows {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 170px;
        }

        .legendSearchTwoRow .doughnutOneRow {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchTwoRows .doughnutTwoRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchTwoRows .doughnutThreeRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchThreeRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendSearchThreeRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        .infolegendSearchThreeRows.legendSearchThreeRows {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 66px;
            width: 170px;
        }

        .legendSearchThreeRow .doughnutOneRow {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchThreeRows .doughnutTwoRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendSearchThreeRows .doughnutThreeRows {
            border-radius: 6px;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }


        .infolegend.legend {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 170px;
        }

        .legend .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .infolegendZip.legendZip {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 64px;
            width: 170px;
        }


        .infolegendCMA.legendCMA {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 90px;
            width: 170px;
        }


        .infolegendCMANoPSA.legendCMANoPSA {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 170px;
        }

        .legendZip .doughnutZip {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legendZip .doughnutZip2 {
            border-radius: 50%;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendZip .doughnutZip3 {
            border-radius: 50%;
            height: 10px;
            width: 10px;
            margin-top: 5px;
            margin-left: 4px;
        }


        .legendCMA .doughnutCMA {
            border-radius: 5px;
            height: 10px;
            width: 10px;
            margin-top: 4px;
            margin-left: 3px;
        }

        .legendCMA .doughnutCMA2 {
            border-radius: 50%;
            height: 14px;
            width: 14px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .legendCMA .doughnutCMA3 {
            border-radius: 0%;
            height: 14px;
            width: 14px;
            margin-top: 5px;
            margin-left: 4px;
        }

        .infolegendZipNoPSA.legendZipNoPSA {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px;
            width: 170px;
        }


        .legendZipNoPSA .doughnutZipNoPSA {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 3px;
        }

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

    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_Access" runat="server" ClientIDMode="Static" />

    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
            <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                <!--begin::Info-->
                <div class="d-flex align-items-center flex-wrap mr-1">
                    <!--begin::Page Heading-->
                    <div class="d-flex align-items-baseline mr-5">
                        <!--begin::Page Title-->
                        <h5 class="text-dark font-weight-bold my-2 mr-5">Current Fiber Sales Opportunity v2.1</h5>
                        <!--end::Page Title-->
                        <!--begin::Breadcrumb-->
                        <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales.aspx" class="text-muted">Sales Home Page</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales_Dashboard.aspx" class="text-muted">Sales Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales_Opportunity_TestingV2.aspx" class="text-muted">Current Fiber Sales Opportunity v2.1</a>
                            </li>
                            <%--<li class="breadcrumb-item">
                                <a href="" class="text-muted">Scroller</a>
                            </li>--%>
                        </ul>
                        <!--end::Breadcrumb-->
                    </div>
                    <!--end::Page Heading-->
                </div>
                <%--Search Function--%>
                <div style="text-align: right; float: right;" class="m-demo__preview m-demo__preview--btn">
                    <button type="button" class="btn btn-primaryClassification btn-md" id="btnSearch" data-toggle="modal" data-target="#m_modal_search" onclick="hideOldSearchInfo()">
                        <span>
                            <i class="fa flaticon-search"></i>
                            <span>Search for Address</span>
                        </span>
                    </button>
                </div>
                <%--End Search Function--%>
                <!--end::Info-->
            </div>
        </div>
    </div>


    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom">
                <div class="card-body p-0">

                    <div class="alert alert-custom alert-white fade show" role="alert">
                        <div class="alert-icon">
                        </div>
                        <div class="m-demo__preview m-demo__preview--btn" id="classificationButton">
                            <button type="button" class="btn btn-primaryClassification btn-sm" id="ClassificationMethodologyBtn" onclick="ShowClassificationMethodology()">&nbsp; Classification Methodology
                                &nbsp;<br />Click to Show Details</button>&nbsp;
                        </div>

                        <div class="alert-text">
                            <%--<div class="left" id="left_subs">
                                <h5 class="left">Date Of Data: &nbsp;</h5>
                                <h5 class="left" id="DATADATE"></h5>
                            </div>--%>
                            <div class="right" id="right_subs">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                                </asp:ScriptManager>
                                <h5>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                        <ContentTemplate>

                                            <%--<asp:Label ID="labelGeo" runat="server" Text="Geography type: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                            <asp:DropDownList ID="ddlGeo" AutoPostBack="true" runat="server" Visible="true" OnSelectedIndexChanged="ddlGeo_SelectedIndexChanged">
                                            </asp:DropDownList>--%>

                                            <div ID="ShowHideMarket" style="text-align: right">
                                                <asp:Label ID="labelMarket" runat="server" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlMarket" Width="220px" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                                                </asp:DropDownList>
                                            </div>

                                            <div ID="ShowHideRegionGroupBy" style="text-align: right">
                                                <asp:Label ID="labelRegionGroupBy" runat="server" Text="Group Region By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlRegionGroupBy" Width="220px" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                </asp:DropDownList>
                                            </div>

                                            <div ID="ShowHideMarketGroupBy" style="text-align: right">
                                                <asp:Label ID="labelMarketGroupBy" runat="server" Text="Group Market By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlMarketGroupBy" Width="220px" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="GroupByChange();">
                                                </asp:DropDownList>
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
                                                <asp:Button runat="server" ID="ButtonSelectedBusinessShowTenants" data-toggle="modal" data-target="#m_modal_showData" />
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
                                    <div class="tab-content" id="MapDiv">
                                        <%--<div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">  --%>


                                            <div class="row">
                                                <div class="col-lg-1" id="Placeholder_tab1"></div>
                                                <div class="col-lg-10" id="Placeholder_tab2">
                                                    <div style="text-align: center; color: red">
                                                        <h2 id="mapcountwarning"></h2>
                                                    </div>
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle"></h2>
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
                                                    <div id="zipfooter" style="text-align: center; color: #343a40; font-size:12px;">
                                                        <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                                        <div id="zipfooterheader" style="text-align: center; color: #343a40; font-size:14px;">
                                                            <b>* Wireless coverage is exclusively assessed around population centers.</b><br />
                                                        </div>
                                                        <div id="zipfootercontent" style="text-align: center; color: #343a40; font-size:12px;">
                                                            <b>Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b><br />
                                                            A Wireless Score was generated for each PSA Location, utilizing IQI data within a 3/4 mile radius of each Exact PSA Location.  <br />
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                                        </div>
                                                    </div>
                                                    <div id="zipfooter2"style="text-align: center; color: #343a40; font-size:12px;">
                                                        <div id="zipfooter2header" style="text-align: center; color: #343a40; font-size:14px;">
                                                            <b>* Wireless coverage is exclusively assessed around population centers.</b><br />
                                                        </div>
                                                        <div id="zipfooter2content" style="text-align: center; color: #343a40; font-size:12px;">
                                                            <b>Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b>
                                                        </div>
                                                    </div>
                                                    <div id="zipfooter3"style="text-align: center; color: #343a40; font-size:12px;">
                                                        <div id="zipfooter3header" style="text-align: center; color: #343a40; font-size:14px;">
                                                            <b>* Wireless coverage is exclusively assessed around population centers.</b><br />
                                                        </div>
                                                        <div id="zipfooter3content" style="text-align: center; color: #343a40; font-size:12px;">
                                                            <b>Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b><br />
                                                            <b>PSA scoring: &nbsp;&nbsp;&nbsp; </b>
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                                        </div>
                                                    </div>

                                                </div>


                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-12" id="buttonrowcenter">                                                    
                                                    <div id="buttonrowzip" style="display:none">
                                                        <button type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0ZipOn()">
                                                            <br>Clear All Highlights<br>
                                                            <br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1ZipOn()">
                                                            Weak Wireless & No Fiber<br>
                                                            <span id="ZIP_PWNF_COUNT"></span> Zips<br>
                                                            <span id="ZIP_PWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2ZipOn()">
                                                            Weak Wireless & Fiber Available<br>
                                                            <span id="ZIP_PWGF_COUNT"></span> Zips<br>
                                                            <span id="ZIP_PWGF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3ZipOn()">
                                                            Strong Wireless & No Fiber<br>
                                                            <span id="ZIP_GWNF_COUNT"></span> Zips<br>
                                                            <span id="ZIP_GWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4ZipOn()">
                                                            Strong Wireless & Fiber Available<br>
                                                            <span id="ZIP_GWGF_COUNT"></span> Zips<br>
                                                            <span id="ZIP_GWGF_POPS"></span> Pops</button>
                                                    </div>
                                                    <div id="buttonrowcounty" style="display:none">
                                                        <button type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0CountyOn()">
                                                            <br>Clear All Highlights<br>
                                                            <br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1CountyOn()">
                                                            Weak Wireless & No Fiber<br>
                                                            <span id="COUNTY_PWNF_COUNT"></span> Counties<br>
                                                            <span id="COUNTY_PWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2CountyOn()">
                                                            Weak Wireless & Fiber Available<br>
                                                            <span id="COUNTY_PWGF_COUNT"></span> Counties<br>
                                                            <span id="COUNTY_PWGF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3CountyOn()">
                                                            Strong Wireless & No Fiber<br>
                                                            <span id="COUNTY_GWNF_COUNT"></span> Counties<br>
                                                            <span id="COUNTY_GWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4CountyOn()">
                                                            Strong Wireless & Fiber Available<br>
                                                            <span id="COUNTY_GWGF_COUNT"></span> Counties<br>
                                                            <span id="COUNTY_GWGF_POPS"></span> Pops</button>
                                                    </div>
                                                    <div id="buttonrowcma" style="display:none">
                                                        <button type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0CMAOn()">
                                                            <br>Clear All Highlights<br>
                                                            <br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1CMAOn()">
                                                            Weak Wireless & No Fiber<br>
                                                            <span id="CMA_PWNF_COUNT"></span> CMAs<br>
                                                            <span id="CMA_PWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2CMAOn()">
                                                            Weak Wireless & Fiber Available<br>
                                                            <span id="CMA_PWGF_COUNT"></span> CMAs<br>
                                                            <span id="CMA_PWGF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3CMAOn()">
                                                            Strong Wireless & No Fiber<br>
                                                            <span id="CMA_GWNF_COUNT"></span> CMAs<br>
                                                            <span id="CMA_GWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4CMAOn()">
                                                            Strong Wireless & Fiber Available<br>
                                                            <span id="CMA_GWGF_COUNT"></span> CMAs<br>
                                                            <span id="CMA_GWGF_POPS"></span> Pops</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv5_tab1">
                                                    <%--<div class="row">--%>

                                                        <div class="content d-flex flex-column flex-column-fluid" id="kt_content20">
                                                                <div class="d-flex flex-column-fluid">
                                                                    <div class="container" id="ddlCard">
                                                                        <div class="card card-custom">

                                                                                <div class="card-header">
                                                                                    <div class="card-title">

                                                                                        <div class="right">
                                                                                            
                                                                                            <h3 class="card-label"><span id="TableSubtitle1"></span> Top 50 <span id="TableSubtitle3"></span> <span id="TableSubtitle2"></span></h3> 

                                                                                            <div style="display: none;">
                                                                                                <asp:Button runat="server" ID="ButtonFCExportZips" OnClick="ExportToExcel_AllZips" />
                                                                                            </div>
                                                                                            <div style="display: none;">
                                                                                                <asp:Button runat="server" ID="ButtonFCExportCounties" OnClick="ExportToExcel_AllCounties" />
                                                                                            </div>
                                                                                            <div style="display: none;">
                                                                                                <asp:Button runat="server" ID="ButtonFCExportCMAs" OnClick="ExportToExcel_AllCMAs" />
                                                                                            </div>
                                                                                            
                                                                                        </div>

                                                                                    </div>
                                                                                    <div class="card-toolbar">
                                                                                        <div class="right" id="right_orderSortddl">
                                                            
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

                                                                                                        <asp:Label ID="labelSortBy" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="UpdateHomeTable();">
                                                                                                        </asp:DropDownList>

                                                                                                    </ContentTemplate>

                                                                                                </asp:UpdatePanel>
                                                                                            </h5>
                                                                                        </div>
                                                                                    </div>


                                                                                </div>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>

                                                        
                                                        <%--<div class="col-lg-1" id="Placeholder_tab3">
                                                        </div>--%>
                                                        <div class="col-lg-12" id="RecentDiv6_tab1">

                                                            <div class="content d-flex flex-column flex-column-fluid" id="kt_content2">
                                                                <div class="d-flex flex-column-fluid">
                                                                    <div class="container" id="zipTableDiv">
                                                                        <div class="card card-custom">

                                                                                
                                                                                    
                                                                                    <div class="card-toolbar"> 

                                                                                        <%--<!--begin::Dropdown-->
                                                                                        <div class="dropdown dropdown-inline mr-2">
                                                                                            <button type="button" class="btn btn-light-primary font-weight-bolder dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                                                <span class="svg-icon svg-icon-md">
                                                                                                    <!--begin::Svg Icon | path:assets_v7_0_0/media/svg/icons/Design/PenAndRuller.svg-->
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
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
                                                                                    </div>
                                                                                
                                                                                <div class="card-body">
                                                                                    <!--begin: Datatable-->
                                                                                    <table class="table compact" id="zipCode_datatable">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Rank</th>
                                                                                                <th>Zip Code</th>
                                                                                                <th>Wireless</th>
                                                                                                <th>Fiber Availability</th>
                                                                                                <%--<th>Total Area</th>--%>
                                                                                                <th>Total Pops</th>
                                                                                                <th title="Pops per Sq Mile">Pop Density</th>
                                                                                                <%--<th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>--%>
                                                                                                <th>Fiber Customers</th>
                                                                                                <th>Fiber Opportunity</th>
                                                                                                <th>Total Stores</th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <%--<tfoot>
                                                                                            <tr>
                                                                                                <th>Zip Code</th>
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
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    <div class="container" id="countyTableDiv">
                                                                        <div class="card card-custom">

                                                                                
                                                                                    
                                                                                    <div class="card-toolbar">
                                                                                       <%-- <div class="right" id="right_orderSortCounty">

                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortCounty" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        <asp:Label ID="labelGroupRegion" runat="server" Text="Group By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlGroupRegion" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="RegionGroupChange()">
                                                                                                        </asp:DropDownList>

                                                                                                        <asp:Label ID="labelSortCounty" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlSortCounty" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="CountyTableUpdate();">
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
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
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
                                                                                    </div>
                                                                                
                                                                                <div class="card-body">
                                                                                    <!--begin: Datatable-->
                                                                                    <table class="table compact" id="county_datatable">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Rank</th>
                                                                                                <th>County</th>
                                                                                                <th>Wireless</th>
                                                                                                <th>Fiber Availability</th>
                                                                                                <%--<th>Total Area</th>--%>
                                                                                                <th>Total Pops</th>
                                                                                                <th title="Pops per Sq Mile">Pop Density</th>
                                                                                                <%--<th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>--%>
                                                                                                <th>Fiber Customers</th>
                                                                                                <th>Fiber Opportunity</th>
                                                                                                <th>Total Stores</th>
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
                                                                                </div>

                                                                            </div>
                                                                        </div>

                                                                    <div class="container" id="cmaTableDiv">
                                                                        <div class="card card-custom">

                                                                                
                                                                                    
                                                                                    <div class="card-toolbar">
                                                                                        <%--<div class="right" id="right_orderSortCMA">

                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortCMA" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        <asp:Label ID="labelGroupNational" runat="server" Text="Group By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlGroupNational" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="NationalGroupChange();">
                                                                                                        </asp:DropDownList>

                                                                                                        <asp:Label ID="labelSortCMA" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlSortCMA" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="CMATableUpdate();">
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
                                                                                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
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
                                                                                    </div>
                                                                                
                                                                                <div class="card-body">
                                                                                    <!--begin: Datatable-->
                                                                                    <table class="table compact" id="cma_datatable">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Rank</th>
                                                                                                <th>CMA Name</th>
                                                                                                <th>CMA</th>
                                                                                                <th>Wireless</th>
                                                                                                <th>Fiber Availability</th>
                                                                                                <%--<th>Total Area</th>--%>
                                                                                                <th>Total Pops</th>
                                                                                                <th title="Pops per Sq Mile">Pop Density</th>
                                                                                                <%--<th>Wireless Score</th>
                                                                                                <th>Fiber Score</th>
                                                                                                <th>Fiber Available</th>--%>
                                                                                                <th>Fiber Customers</th>
                                                                                                <th>Fiber Opportunity</th>
                                                                                                <th>Total Stores</th>

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
                                                                                </div>


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

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

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
                    <h2>Classification Methodology and Tool Description</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">
                        <h4>The purpose of this tool is to find specific areas, down to the exact address, to sell our current fiber. <br />
                            Wireless Strength, determined by IQI data, is used to priortize these areas. <br />
                            These addresses are an additional input for consideration by our sales teams, to be used in their existing sales processes. <br />
                        </h4>
                        <br />
                        <h4>IQI Data: Sep 2019 - Aug 2020</h4>
                        <h4>OVALS Fiber Location Data: 11/10/2020</h4>
                        <h4>OVALS In-Service Customer Data: 11/10/2020</h4>
                        <h4>Store Data: 09/07/2020</h4>
                        <br />
                    </div>
                   <%-- <hr style="height:2px;border-width:0;color: #595959;background-color: #595959">
                    <div style="text-align: center;">
                        <h3> How to Identify Sales Opportunities</h3>
                    </div>
                    <div style="text-align: left;">


                         <h6>

                            From the National Map, zoom in on a Green CMA, or click on a row in the table below the map, for example the Dalla CMA. <br />
                            Clicking within the map, on an area with Fiber Available, will display a link that says "Click to Show Top Fiber Opportunities" <br />
                            This link will open up a more detailed view showing Top PSA locations, and any High Opportunity MDUs. This is  <br />
                            For Top PSA locations (circles) and High Opportunity MDUs (squares) the Darker the Green the stronger the wireless. <br />
                            Export the address locations to Excel. Note that the MDUs are all at a single address, but the export will include the distinct unit numbers.

                        </h6>--%>

                        <hr style="height:2px;border-width:0;color: #595959;background-color: #595959">

                        <div style="text-align: center;">
                        <h3>Classifications - How we Color the Map</h3>
                    </div>

                        <h6>Sales Markets are split into smaller geographies: The default is a National map with CMA boundaries. <br />
                        The dropdown in the top right corner allows the user to select a Sales Region divided by County, or a VPGM Market by Zip Code. <br /><br />

                      The CMAs/Counties/Zips are colored based on two dimensions: Wireless Strength and Fiber Availability. <br />
                          Wireless Strength uses Reference Signal Received Power (RSRP) from IQI data collected within the area, and is exclusively based around population centers. <br />
                          If any addresses within the geography have Fiber Available, then we classify that entire CMA/County/Zip as Fiber Available.
                      </h6>

                        <div class="row">
                            <div class="col-lg-5" style="padding-bottom: 10px; padding-top: 5px;">
                                <div style="  border: 2px solid #ff9933; background-color: #ffe6cc; color: black; text-align: center;">
                                    <b>Weak Wireless & No Fiber</b><br>
                                    IQI Samples Weighted Average RSRP < -105 dBm<br>
                                    No Addresses have Fiber Available
                                </div>
                            </div>
                            <div class="col-lg-5" style="padding-bottom: 10px; padding-top: 5px;">
                                <div style=" border: 2px solid #999900; background-color: #ffff99; color: black; text-align: center;">
                                    <b>Weak Wireless & Fiber Available</b><br>
                                    IQI Samples  Weighted Average RSRP < -105 dBm<br>
                                    Some Addresses have Fiber Available
                                </div>
                            </div>
                         </div>
                        <div class="row">
                            <div class="col-lg-5" style="padding-bottom: 5px;">
                                <div style=" color: black; background-color: #b3d9ff; border: 2px solid #4da6ff; text-align: center; ">
                                    <b>Strong Wireless & No Fiber</b><br>
                                    IQI Samples  Weighted Average RSRP >= -105 dBm<br>
                                    No Addresses have Fiber Available
                                </div>
                            </div>
                            <div class="col-lg-5" style="padding-bottom: 5px;">
                                <div style=" color: black; background-color: #b3ffb3; border: 2px solid #009900; text-align: center; ">
                                    <b>Strong Wireless & Fiber Available</b><br>
                                    IQI Samples  Weighted Average RSRP >= -105 dBm<br>
                                    Some Addresses have Fiber Available
                                </div>
                            </div>
                        </div>

                        <h6> Stores are also plotted on the map: AT&T Retail in dark blue and Authorized Reseller in light blue. <br />
                            From a distance stores are clustered together, but individual stores can always be seen by zooming in.

                            </h6>
                            <img src="Store_Legend_Cluster.png" />
                            <br />

                       <h6>
                           The Wireless Strength of addresses are determined by IQI data within 3/4 mile of their associated PSA location.<br />
                           PON Serving Areas (PSAs) indicate the neighborhood being served by our Passive Optical Network, the "last mile" of our Fiber service. <br />
                           The PSAs are then subdivided into five smaller categories to allow for more granular classification: <br /> <br />


                            <%--(DRAFT) <br /> --%>

                           <%-- <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Score 1 (Very Weak): NoServiceRate > 5 % OR RSRP 75% < -120 <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Score 2 (Weak): Not in Score 1 AND (5% > NoServiceRate > 1% OR RSRP 75% < -115) <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Score 3 (Strong): (Not in Score 1 AND not in Score 2) AND (1%> NoServiceRate > 0.02% OR RSRP 75% < -110) <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Score 4 (Very Strong): (Not in Score 1 AND not in Score 2 AND not in Score 3) AND (0.02% > NoServiceRate >= 0% OR RSRP 75% < -100) <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): (Not in Score 1 AND not in Score 2 AND not in Score 3 AND not in Score 4) AND NoServiceRate = 0% AND RSRP 75% >= -100 <br />--%>

                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Score 1 (Very Weak): NoServiceRate > 5% OR Bottom 25% of samples have RSRP < -120 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Score 2 (Weak): 5% > NoServiceRate > 1% OR Bottom 25% of samples have RSRP < -115 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Score 3 (Strong): 1% > NoServiceRate > 0.02% OR Bottom 25% of samples have RSRP < -110 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Score 4 (Very Strong): 0.02% > NoServiceRate OR Bottom 25% of samples have RSRP < -100 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): 0% = NoServiceRate AND Bottom 25% of samples have RSRP >= -100 dBm<br /><br />

                           Single Address MDUs are also mapped, and have the same color code as their associated PSA location. For example: <br /><br />

                           <span style="width: 13px; height: 13px; border-radius: 0%;  border: 3px solid #008000; display: inline-block; vertical-align: middle;"></></span> MDU with Very Strong Wireless

                       </h6>

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
                    <h2>PSA Location Details - Zip Code <span id="ZipModalZip"></span></h2>
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
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayZipCode"></h4>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayZipPop"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayWirelessCat"></h5>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCat"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberAvail"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCurrent"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberOpp"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayATTRStore"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayARStore"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayALLStore"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSACount"></h6>
                            </div>
                            <div class="col-md-8" id="ZipInfoCol1_1">
                                <div id="myZipModalMap" style="width: 100%; height: 400px; border: 1px solid #AAA;"></div>
                            </div>
                        </div>
                        <div class="row" id="DisplayInfoRow2">
                            <div class="col-md-12" id="ZipInfoCol1_3" style="text-align: center; color: black">
                                <div id="zipfooterMapModal"style="text-align: center; color: #343a40; font-size:11px;">
                                    <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                    <b>* Wireless coverage and capacity in an area is subject to change. Questions about specific areas should be directed to the market RAN director.</b><br />
                                        A Wireless Score was generated for each PSA Location, utilizing IQI data within a 3/4 mile radius of each Exact PSA Location.  <br />
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                        <span style="                                                width: 10px;
                                                height: 10px;
                                                border-radius: 50%;
                                                background-color: #ffff00;
                                                display: inline-block;
                                                vertical-align: middle;"></></span> Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                </div>
                                <div id="zipfooterMapModal3"style="text-align: center; color: #343a40; font-size:12px;">
                                    <div id="zipfooterMapModal3content" style="text-align: center; color: #343a40; font-size:12px;">
                                        <b>* Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b><br />
                                        <b>PSA scoring: &nbsp;&nbsp;&nbsp; </b>
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonPSALocations" OnClick="ExportToExcel_PSALocations" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonPSALocationsZip" OnClick="ExportToExcel_PSALocationsAllZip" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonTopMDUs_ZIP" OnClick="ExportToExcel_TopMDUsZIP" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonTopMDUAddresses_ZIP" OnClick="ExportToExcel_MDUAddressesZIP" />
                        </div>

                         <div style="display: none;">

                            <%--<asp:UpdateProgress ID="UpdateProgress1" runat="Server" AssociatedUpdatePanelID="UpdatePanel3">
                                <ProgressTemplate >
                                   Please wait ...
                                </ProgressTemplate>
                            </asp:UpdateProgress>

                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                               <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID="ButtonSelectedMDUAddresses_ZIP" EventName="Click" />
                               </Triggers>

                               <ContentTemplate>
                                  <asp:Button runat="server" ID="ButtonSelectedMDUAddresses_ZIP" OnClick="ExportToExcel_SelectedMDUAddressesZIP" />
                               </ContentTemplate>
                            </asp:UpdatePanel>--%>


                            <asp:Button runat="server" ID="ButtonSelectedMDUAddresses_ZIP" OnClick="ExportToExcel_SelectedMDUAddressesZIP" />
                        </div>

                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="zipModalTableDiv">


                                            <div class="card card-custom">
                                                <div class="card-body">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li class="nav-item">
                                                            <a class="nav-link active" data-toggle="tab" href="#m_tabs_1_tab1_ZIP" id="tab1_ZIP">
                                                                <%--<i class="flaticon-pin"></i><span class="m--visible-desktop-inline-block">New Site Build</span>--%>
                                                                <h6>High Opportunity MDUs</h6>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab2_ZIP" id="tab2_ZIP">
                                                               <h6>PSA Locations</h6>
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab3_ZIP" id="tab3_ZIP">
                                                               <h6>Top Business Locations</h6>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="m_tabs_1_tab1_ZIP" role="tabpanel">
                                                            <div class="card card-custom">
                                                                <div class="card-header">
                                                                    <div class="card-title">
                                                                        <h3 class="card-label" id="ZIPSubtitleMDU"><span id="ZIPModalSubtitleMDU"></span> </h3>
                                                                    </div>
                                                                </div>
                                                                <div class="card-body">
                                                                    <table class="table compact" id="ZIPModal_MDUtable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Export Addresses</th>
                                                                                <th>Zip Rank</th>
                                                                                <th>House Number</th>
                                                                                <th>Street Name</th>
                                                                                <th>City</th>
                                                                                <th>State</th>
                                                                                <th>Wireless Score</th>
                                                                                <th>Fiber Available</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Fiber Penetration</th>
                                                                                <th>Market Rank</th>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="tab-pane" id="m_tabs_1_tab2_ZIP" role="tabpanel">
                                                            <div class="card card-custom">
                                                                <div class="card-header">
                                                                    <div class="card-title">
                                                                        <h3 class="card-label">ZIP: <span id="ZipModalTableSubtitle1"></span> - PSA Location Details <span id="ZipModalTableSubtitle2"></span></h3>
                                                                    </div>
                                                                    <div class="card-toolbar">
                                                                        <div class="right" id="right_orderSortZipModal">

                                                                            <h5>
                                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true">
                                                                                    <ContentTemplate>

                                                                                        <asp:Label ID="SortZipModalLabel" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                        <asp:DropDownList ID="ddlSortZipModal" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="ZipModalTableUpdate();">
                                                                                        </asp:DropDownList>


                                                                                    </ContentTemplate>

                                                                                </asp:UpdatePanel>
                                                                            </h5>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="card-body">
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="zipCodeModal_datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Rank</th>
                                                                                <th>ZIP CO PSA</th>
                                                                                <th>Export Addresses</th>
                                                                                <th>Wireless Score</th>
                                                                                <th>Fiber Locations</th>
                                                                                <th>Fiber Customers</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Fiber Penetration</th>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                    <!--end: Datatable-->
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="tab-pane" id="m_tabs_1_tab3_Zip" role="tabpanel">
                                                            <div class="card-title">
                                                                <h3 class="card-label" id="ZipSubtitleBusiness"><span id="ZipModalSubtitleBusiness"></span> </h3>
                                                            </div>
                                                                <!--begin: Datatable-->
                                                                <table class="table compact" id="ZipModal_Businesstable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Export Tenants</th>
                                                                            <th>CMA Rank</th>
                                                                            <th>MIKEY</th>
                                                                            <th>Wireless Score</th>
                                                                            <th>Fiber Status</th>
                                                                            <th>Address</th>
                                                                            <th>City</th>
                                                                            <th>State</th>
                                                                            <th>Zip</th>                                                                            
                                                                            <th>Tenant Count</th>
                                                                            <th>Market Rank</th>
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
                        <h2>Top Fiber Sales Opportunities - <span id="CountyModalTitle"></span></h2>
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
                                    <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCountyPop"></h5>
                                    <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayWirelessCat_County"></h5>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCat_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberAvail_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCurrent_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberOpp_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSANumber_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayATTRStore_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayARStore_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayALLStore_County"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSACount_County"></h6>
                                </div>
                                <div class="col-md-8" id="ZipInfoCol1_1_County">
                                    <div id="myCountyModalMap" style="width: 100%; height: 400px; border: 1px solid #AAA;"></div>
                                </div>
                            </div>
                            <div class="row" id="DisplayInfoRow2_County">
                                <div class="col-md-12" id="ZipInfoCol1_3_County" style="text-align: center; color: black">
                                    <div id="CountyfooterMapModal"style="text-align: center; color: #343a40; font-size:11px;">
                                        <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                        <b>* Wireless coverage and capacity in an area is subject to change. Questions about specific areas should be directed to the market RAN director.</b><br />
                                            A Wireless Score was generated for each PSA Location, utilizing IQI data within a 3/4 mile radius of each Exact PSA Location.  <br />
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                            <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best

                                    </div>
                                </div>
                            </div>
                            <br />
                            <div style="display: none;">
                                <asp:Button runat="server" ID="ButtonPSALocations_County" OnClick="ExportToExcel_PSALocations_County" />
                            </div>
                            <div style="display: none;">
                                <asp:Button runat="server" ID="ButtonPSALocationsAll_County" OnClick="ExportToExcel_PSALocationsAllCounty" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="ButtonTopMDUs_County" OnClick="ExportToExcel_TopMDUsCounty" />
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="ButtonTopMDUAddresses_County" OnClick="ExportToExcel_MDUAddressesCounty" />
                            </div>

                             <div style="display: none;">
                                <asp:Button runat="server" ID="ButtonSelectedMDUAddresses_County" OnClick="ExportToExcel_SelectedMDUAddressesCounty" />
                            </div>

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
                                                                <a class="nav-link active" data-toggle="tab" href="#m_tabs_1_tab1_County" id="tab1_County">
                                                                    <%--<i class="flaticon-pin"></i><span class="m--visible-desktop-inline-block">New Site Build</span>--%>
                                                                    <h6>High Opportunity MDUs</h6>
                                                                </a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab2_County" id="tab2_County">
                                                                   <h6>Top PSA Locations</h6>
                                                                </a>
                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab3_County" id="tab3_County">
                                                                   <h6>Top Business Locations</h6>
                                                                </a>
                                                            </li>
                                                        </ul>

                                                        <div class="tab-content">

                                                            <div class="tab-pane active" id="m_tabs_1_tab1_County" role="tabpanel">
                                                                <div class="card-title">
                                                                    <h3 class="card-label" id="CountySubtitleMDU"><span id="CountyModalSubtitleMDU"></span> </h3>
                                                                </div>
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="CountyModal_MDUtable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Export Addresses</th>
                                                                                <th>County Rank</th>
                                                                                <th>House Number</th>
                                                                                <th>Street Name</th>
                                                                                <th>City</th>
                                                                                <th>State</th>
                                                                                <th>Wireless Score</th>
                                                                                <th>Fiber Available</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Fiber Penetration</th>
                                                                                <th>Market Rank</th>
                                                                            </tr>
                                                                        </thead>
                                                                    </table>
                                                                    <!--end: Datatable-->
                                                            </div>

                                                            <div class="tab-pane" id="m_tabs_1_tab2_County" role="tabpanel">
                                                                <div class="card-title">
                                                                    <h3 class="card-label" id="CountySubtitlePSA"><span id="CountyModalSubtitlePSA"></span> </h3>
                                                                </div>
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="CountyModal_datatable">
                                                                        <thead>
                                                                            <tr>
                                                                                <%--<th>Rank</th>  --%>
                                                                                <%--<th>ZIP</th>--%>
                                                                                <th>ZIP CO PSA</th>
                                                                                <th>Export Addresses</th>
                                                                                <%--<th>Wireless</th>--%>
                                                                                <%--<th>Fiber</th>--%>
                                                                                <%--<th>Total Area</th>--%>
                                                                                <%--<th>Total Pops</th>--%>
                                                                                <%--<th title="Pops per Sq Mile">Pop Density</th>--%>
                                                                                <th>Wireless Score</th>
                                                                                <%--<th>Fiber Score</th>--%>
                                                                                <th>Fiber Locations</th>
                                                                                <th>Fiber Customers</th>
                                                                                <th>Fiber Opportunity</th>
                                                                                <th>Fiber Penetration</th>
                                                                                <%--<th>Latitude</th>
                                                                                <th>Longitude</th>--%>
                                                                                <%--<th>Total Stores</th>--%>
                                                                            </tr>
                                                                        </thead>                                                                        
                                                                    </table>
                                                                    <!--end: Datatable-->
                                                            </div>

                                                            <div class="tab-pane" id="m_tabs_1_tab3_County" role="tabpanel">
                                                                <div class="card-title">
                                                                    <h3 class="card-label" id="CountySubtitleBusiness"><span id="CountyModalSubtitleBusiness"></span> </h3>
                                                                </div>
                                                                    <!--begin: Datatable-->
                                                                    <table class="table compact" id="CountyModal_Businesstable">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>Export Tenants</th>
                                                                                <th>CMA Rank</th>
                                                                                <th>MIKEY</th>
                                                                                <th>Wireless Score</th>
                                                                                <th>Fiber Status</th>
                                                                                <th>Address</th>
                                                                                <th>City</th>
                                                                                <th>State</th>
                                                                                <th>Zip</th>                                                                            
                                                                                <th>Tenant Count</th>
                                                                                <th>Market Rank</th>
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

    <asp:HiddenField ID="hf_SelectedBusiness_CMA" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedBusiness_CMA_Mikey" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_CMAExportGIF" runat="server" ClientIDMode="Static" />


    <div class="modal fade" id="m_modal_cma" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Top Fiber Sales Opportunities - <span id="CMAModalTitle"></span></h2>
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
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCMAPop"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayWirelessCat_CMA"></h5>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCat_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberAvail_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberCurrent_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFiberOpp_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSANumber_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayATTRStore_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayARStore_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayALLStore_CMA"></h6>
                                <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPSACount_CMA"></h6>
                            </div>
                            <div class="col-md-8" id="ZipInfoCol1_1_CMA">
                                <div id="myCMAModalMap" style="width: 100%; height: 400px; border: 1px solid #AAA;"></div>
                            </div>
                        </div>
                        <div class="row" id="DisplayInfoRow2_CMA">
                            <div class="col-md-12" id="ZipInfoCol1_3_CMA" style="text-align: center; color: black">
                                <div id="CMAfooterMapModal"style="text-align: center; color: #343a40; font-size:11px;">
                                    <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                    <b>* Wireless coverage and capacity in an area is subject to change. Questions about specific areas should be directed to the market RAN director.</b><br />
                                        A Wireless Score was generated for each PSA Location, utilizing IQI data within a 3/4 mile radius of each Exact PSA Location.  <br />
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                        <div id="businessFooterMapModal">
                                            <b>Business Locations Only Fiber Status:</b>
                                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; border: 3px solid #000000; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span> Green (Fiber Lit)
                                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; border: 3px solid #ffffff; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span> Light Green (Fiber Near)
                                        </div>
                                </div>
                                <div id="CMAfooterMapModal3"style="text-align: center; color: #343a40; font-size:12px;">
                                    <div id="CMAfooterMapModal3content" style="text-align: center; color: #343a40; font-size:12px;">
                                        <b>* Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b><br />
                                        <b>PSA & MDU Scoring: &nbsp;&nbsp;&nbsp; </b>
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonPSALocations_CMA" OnClick="ExportToExcel_PSALocations_CMA" />
                        </div>
                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonPSALocationsAll_CMA" OnClick="ExportToExcel_PSALocationsAllCMA" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonTopMDUs" OnClick="ExportToExcel_TopMDUsCMA" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonTopMDUAddresses" OnClick="ExportToExcel_MDUAddressesCMA" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonSelectedMDUAddresses" OnClick="ExportToExcel_SelectedMDUAddressesCMA" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonTopBusiness" OnClick="ExportToExcel_TopBusinessCMA" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonTopBusinessTenants" OnClick="ExportToExcel_BusinessTenantsCMA" />
                        </div>

                        <div style="display: none;">
                            <asp:Button runat="server" ID="ButtonSelectedBusinessTenants" OnClick="ExportToExcel_SelectedBusinessTenantsCMA" />
                        </div>

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
                                                <div class="card-body" id="CMAtabs">
                                                  <ul class="nav nav-tabs" role="tablist" id="ulCMAtabs">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" data-toggle="tab" href="#m_tabs_1_tab1" id="tab1">
                                                            <%--<i class="flaticon-pin"></i><span class="m--visible-desktop-inline-block">New Site Build</span>--%>
                                                            <h6>High Opportunity MDUs</h6>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab2" id="tab2">
                                                           <h6>Top PSA Locations</h6>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab3" id="tab3">
                                                           <h6>Top Business Locations</h6>
                                                        </a>
                                                    </li>
                                                </ul>


                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="m_tabs_1_tab1" role="tabpanel">
                                                            <div class="card-title">
                                                                <h3 class="card-label" id="CMASubtitleMDU"><span id="CMAModalSubtitleMDU"></span> </h3>
                                                            </div>
                                                                <!--begin: Datatable-->
                                                                <table class="table compact" id="CMAModal_MDUtable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Export Addresses</th>
                                                                            <th>CMA Rank</th>
                                                                            <th>House Number</th>
                                                                            <th>Street Name</th>
                                                                            <th>City</th>
                                                                            <th>State</th>
                                                                            <th>Wireless Score</th>
                                                                            <th>Fiber Available</th>
                                                                            <th>Fiber Opportunity</th>
                                                                            <th>Fiber Penetration</th>
                                                                            <th>Market Rank</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                                <!--end: Datatable-->
                                                        </div>

                                                        <div class="tab-pane" id="m_tabs_1_tab2" role="tabpanel">
                                                            <div class="card-title">
                                                                <h3 class="card-label" id="CMASubtitlePSA"><span id="CMAModalSubtitlePSA"></span> </h3>
                                                            </div>
                                                              <!--begin: Datatable-->
                                                                <table class="table compact" id="CMAModal_datatable">
                                                                    <thead>
                                                                        <tr>
                                                                            <%--<th>Rank</th>  --%>
                                                                            <%--<th>ZIP</th>--%>
                                                                            <th>ZIP CO PSA</th>
                                                                            <th>Export Addresses</th>
                                                                            <%--<th>Wireless</th>--%>
                                                                            <%--<th>Fiber</th>--%>
                                                                            <%--<th>Total Area</th>--%>
                                                                            <%--<th>Total Pops</th>--%>
                                                                            <%--<th title="Pops per Sq Mile">Pop Density</th>--%>
                                                                            <th>Wireless Score</th>
                                                                            <%--<th>Fiber Score</th>--%>
                                                                            <th>Fiber Locations</th>
                                                                            <th>Fiber Customers</th>
                                                                            <th>Fiber Opportunity</th>
                                                                            <th>Fiber Penetration</th>
                                                                            <%--<th>Latitude</th>
                                                                            <th>Longitude</th>--%>
                                                                            <%--<th>Total Stores</th>--%>
                                                                        </tr>
                                                                    </thead>                                                                    
                                                                </table>
                                                                <!--end: Datatable-->
                                                        </div>

                                                        <div class="tab-pane" id="m_tabs_1_tab3" role="tabpanel">
                                                            <div class="card-title">
                                                                <h3 class="card-label" id="CMASubtitleBusiness"><span id="CMAModalSubtitleBusiness"></span> </h3>
                                                            </div>
                                                                <!--begin: Datatable-->
                                                                <table class="table compact" id="CMAModal_Businesstable">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Export Tenants</th>
                                                                            <th>CMA Rank</th>
                                                                            <th>Address</th>
                                                                            <th>City</th>
                                                                            <th>State</th>
                                                                            <th>Zip</th>     
                                                                            <th>Wireless Score</th>
                                                                            <th>Fiber Status</th>                                                                                                                                                   
                                                                            <th>Tenant Count</th>
                                                                            <th>Tenant 1</th>
                                                                            <th>Tenant 2</th>
                                                                            <th>Tenant 3</th>
                                                                            <th>Market Rank</th>
                                                                            <th>MIKEY</th>
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

                                               <div class="card-body" id="showMDUtable">

                                                   <!--begin: Datatable-->
                                                    <table class="table compact" id="showDataModal_MDUtable">
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
                                                                <th>Dwelling Type</th>
                                                            </tr>
                                                        </thead>
                                                    </table>
                                                    <!--end: Datatable-->

                                               </div>

                                                <div class="card-body" id="showBusinesstable">

                                                   <!--begin: Datatable-->
                                                    <table class="table compact" id="showDataModal_Businesstable">
                                                        <thead>
                                                            <tr>
                                                                <th>MIKEY</th>
                                                                <th>CMA</th>
                                                                <th>Fiber Status</th>
                                                                <th>Address</th>
                                                                <th>City</th>
                                                                <th>State</th>
                                                                <th>Zip</th>
                                                                <th>Wireless Score</th>
                                                                <th>Tenant Count</th>
                                                                <th>Tenant 1</th>
                                                                <th>Tenant 2</th>
                                                                <th>Tenant 3</th>
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
                                                <input type="search" id="txtSearchHouseNumber" value="" style="width: 215px; height: 35px; " placeholder="Input House Number" spellcheck="false" autocomplete="off"  />
                                                
                                            </div>
                                            <br />
                                            <div>
                                                
                                                <asp:Label ID="label1" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* Street Name: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                <input type="search" id="txtSearchStreetName" value="" style="width: 215px; height: 35px; " placeholder="Input Street Name (Required)" spellcheck="false" autocomplete="off"  />
                                                
                                            </div>
                                            <br />
                                            <div>
                                                
                                                <asp:Label ID="label2" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* City: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                <input type="search" id="txtSearchCity" value="" style="width: 215px; height: 35px; " placeholder="Input City (Required)" spellcheck="false" autocomplete="off" />
                                                
                                            </div>
                                            <br />
                                            <div>
                                                
                                                <asp:Label ID="label3" runat="server" Style="width: 160px; height: 35px; float: left;" Text="* State Abbr: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                <input type="search" id="txtSearchState" value="" style="width: 215px; height: 35px; " placeholder="Input State (Required)" spellcheck="false" autocomplete="off" />
                                                
                                            </div>
                                            <br />
                                            <div>
                                                
                                                <asp:Label ID="label4" runat="server" Style="width: 160px; height: 35px; float: left;" Text="Zip: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                <input type="search" id="txtSearchZip" value="" style="width: 215px; height: 35px; " placeholder="Input Zip" spellcheck="false" autocomplete="off"  />
                                                
                                            </div>
                                            <br />
                                        <asp:UpdatePanel ID="UpdatePanel_SearchInputs" runat="server" ChildrenAsTriggers="true">
                                            <ContentTemplate>

                                            <div id="buttonrowcenterSearch">
                                                <%--<asp:Button ID="ClearSearchButton" runat="server" Text="Clear" OnClientClick="reset();" />--%>
                                                <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="btnSearch_Click" OnClientClick="checkForm();"/>
                                                <%--<asp:Button ID="Button1" runat="server" Text="Search" OnClick="btnSearch_Click" OnClientClick="UpdateHomeTable();" />--%>
                                                <div>* Required fields for search</div>
                                            </div>
                                                </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <br />
                                        <div id="buttonrowcenterSearch2">
                                            <div id="LOADING_SEARCH_MAP" style='display: none'>
                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading data, please be patient...
                                            </div>
                                            <div id="NODATA_SEARCH_SEARCH" style="display: none; Font-Size: 22px;">No data found, please check input.</div>
                                            <div id="checkFailed" style="display: none; Font-Size: 18px;">* Please input all required fields.</div>
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
                            <div class="col-md-7" id="searchDivMap" style="text-align: left; color: black">
                                <div id="mySearchMap" style="height: 400px; border: 1px solid #AAA;"></div>
                            </div>
                            
                        </div>
                        <br />

                        <div class="card-body" id="showSearchtable">

                            <!--begin: Datatable-->
                            <table class="table compact" id="showDataModal_Searchtable">
                                <thead>
                                    <tr>
                                        <th>House Number</th>
                                        <th>Prefix</th>
                                        <th>Street Name</th>
                                        <th>City</th>
                                        <th>State</th>
                                        <th>Zip</th>
                                        <th>PSA Wireless Score</th>
                                        <th>Service Status</th>
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
        var ZipCodeModalSelected;
        var SelectedPSA;
        var PSALocationPoints;
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
        console.log('Access: ' + Access);
        var CountyStateModalText;
        var SearchModalLayerGroup;



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
                $('#zipfooter2').hide();
                $('#zipfooter3').hide();
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
                $('#zipfooter2').hide();
                $('#zipfooter3').hide();
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
                $('#zipfooter2').hide();
                $('#zipfooter3').hide();
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

                if (Access == "Limited") {
                    $('body').bind('cut copy paste', function (e) {
                        e.preventDefault();
                    });

                    //Disable mouse right click
                    $("body").on("contextmenu", function (e) {
                        return false;
                    });
                }

                if (Access == "Unlimited") {
                    $('#classificationButton').show();
                } else {
                    $('#classificationButton').hide();
                }

                console.log("DocReady");
                $('#zipfooter').hide();
                $('#zipfooter2').hide();
                $('#zipfooter3').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                //$('#zipTableDiv').hide();
                //$('#countyTableDiv').hide();
                //$('#cmaTableDiv').hide();
                $('#MapDiv').hide();
                $('#LOADING1').show();
                $('#ShowHideRegionGroupBy').hide();
                $('#ShowHideMarketGroupBy').hide();
                $('#businessFooterMapModal').hide();
                $('#searchDivMap').hide();
                $('#showSearchtable').hide();

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_Opportunity_TestingV2.aspx/GetDATADATE",
                //    data: JSON.stringify({}),
                //    dataType: "json",
                //    contentType: "application/json; charset=utf-8",
                //    success: function (data) {
                //        loadDATADATE(data);
                //    },
                //    error: function (data) {
                //    }
                //});

                //var score = JSON.parse(data.d);
                //var value = score[0]["DATADATE"];
                //document.getElementById('DATADATE').innerHTML = value;
                //executedon = value.substring(6, 10) + '-' + value.substring(0, 2) + value.substring(2, 5);
                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
                SubmitButtonClick();

            });

            <%--function loadDATADATE(data) {
                var score = JSON.parse(data.d);
                var value = score[0]["DATADATE"];
                document.getElementById('DATADATE').innerHTML = value;
                executedon = value.substring(6, 10) + '-' + value.substring(0, 2) + value.substring(2, 5);
                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();

                SubmitButtonClick();

            }--%>

            function ShowClassificationMethodology(source, eventArgs) {
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
                var resetButton4 = document.getElementById("txtSearchState");
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
                if (resetButton4) {
                    resetButton4.value = "";
                }
                if (resetButton5) {
                    resetButton5.value = "";
                }
                
            }

            function resetDisplay() {
                console.log("reset display *****");
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                } else {
                    marketType = 'MARKET';
                }

                if (marketType == 'MARKET') {
                    console.log('***** MarketType MARKET *****');
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').show();
                }
                else if (marketType == 'REGION') {
                    console.log('***** MarketType REGION *****');
                    $('#ShowHideRegionGroupBy').show();
                    $('#ShowHideMarketGroupBy').hide();
                }
                else { //National
                    console.log('***** MarketType NATIONAL *****');
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').hide();
                }
            }

            function checkForm() {
                var checkField1 = document.getElementById("txtSearchHouseNumber");
                var checkField2 = document.getElementById("txtSearchStreetName");
                var checkField3 = document.getElementById("txtSearchCity");
                var checkField4 = document.getElementById("txtSearchState");
                var checkField5 = document.getElementById("txtSearchZip");
                //var check1 = 0;
                //if (checkField1.value == '') {
                //    check1 = 1;
                //    console.log('checkField1 FAILED')
                //}
                var check2 = 0;
                if (checkField2.value == '') {
                    check2 = 1;
                    console.log('checkField2 FAILED')
                }
                var check3 = 0;
                if (checkField3.value == '') {
                    check3 = 1;
                    console.log('checkField3 FAILED')
                }
                var check4 = 0;
                if (checkField4.value == '') {
                    check4 = 1;
                    console.log('checkField4 FAILED')
                }
                //var check5 = 0;
                //if (checkField5.value == '') {
                //    check5 = 1;
                //    console.log('checkField5 FAILED')
                //}

                var check;
                check = check2 + check3 + check4;

                if (check == 0) {
                    console.log('checkFields PASSED')
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

            function SearchButtonClick() {
                $('#LOADING_SEARCH_MAP').show();
                $('#NODATA_SEARCH_SEARCH').hide();
                $('#checkFailed').hide();
                $('#ModalDisplay').hide();
                $('#searchDivMap').hide();
                $('#showSearchtable').hide();

                console.log("HouseNumber: " + $("#txtSearchHouseNumber").val());
                console.log("StreetName: " + $("#txtSearchStreetName").val());
                console.log("City: " + $("#txtSearchCity").val());
                console.log("State: " + $("#txtSearchState").val());
                console.log("Zip: " + $("#txtSearchZip").val());

                var houseNumberVariable = $("#txtSearchHouseNumber").val();
                var streetNameVariable = $("#txtSearchStreetName").val();
                var cityVariable = $("#txtSearchCity").val();
                var stateVariable = $("#txtSearchState").val();
                var zipVariable = $("#txtSearchZip").val();

                $.ajax({
                    type: "POST",
                    url: "Sales_Opportunity_TestingV2.aspx/GetSearchAll",
                    data: JSON.stringify({ 'HouseNumber': houseNumberVariable, 'StreetName': streetNameVariable, 'City': cityVariable, 'StateVariable': stateVariable, 'Zip': zipVariable }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#LOADING_SEARCH_MAP').hide();
                        $('#ModalDisplay').show();
                        loadSearchCheck(data);
                    }
                });
            }            

            function loadSearchCheck(data) {                

                //$('#searchDivMap').show();
                //$('#showSearchtable').show();

                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                } else {
                    marketType = 'MARKET';
                }

                if (marketType == 'MARKET') {
                    console.log('***** MarketType MARKET *****');
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').show();
                }
                else if (marketType == 'REGION') {
                    console.log('***** MarketType REGION *****');
                    $('#ShowHideRegionGroupBy').show();
                    $('#ShowHideMarketGroupBy').hide();
                }
                else { //National
                    console.log('***** MarketType NATIONAL *****');
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').hide();
                }

                var json = JSON.parse(data.d);
                if (json.length <= 0) {
                    $('#NODATA_SEARCH_SEARCH').show();
                    $('#checkFailed').hide();
                    $('#searchDivMap').hide();
                    $('#showSearchtable').hide();
                }
                else {
                    console.log("Search Results");
                    //console.log("json Search Results: " + json);
                    $('#searchDivMap').show();
                    $('#showSearchtable').show();
                    loadMapSearchTable(json);
                    searchMap(json);
                    //loadSearchInfo(data);
                }
            }

            function loadMapSearchTable(dataInput) {
                //console.log('loadMapSearchTable Start');
                //console.log('dataInput: ' + dataInput);

                var data = dataInput.filter(function (el) {
                    return (el.SHOW_MAP == "SHOW");
                });

                //console.log('data: ' + data);

                $('#showDataModal_Searchtable').dataTable().fnDestroy(); //destroy old table

                var table = $('#showDataModal_Searchtable');                
                
                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[4, "desc"]],
                    dom: 'frtip',                    
                    //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                    columns: [
                        { 'data': 'HOUSE_NUMBER' },
                        { 'data': 'PREFIX' },                        
                        { 'data': 'STREET_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'STATE' },
                        { 'data': 'ZIP' },
                        { 'data': 'WIRELESS_SCORE' },
                        { 'data': 'SHOW_SERVICE_STATUS' },
                        { 'data': 'ADJUSTED_DWELLING_TYPE' },
                        { 'data': 'LATITUDE', visible: false },
                        { 'data': 'LONGITUDE', visible: false }                        

                    ],

                    initComplete: function () {
                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                    },

                });

                $('#showDataModal_Searchtable tr').off().on('click', function () {
                    
                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#showDataModal_Searchtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#showDataModal_Searchtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

                    //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                    var loc = [latitudeClicked, longitudeClicked];
                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [20, 20],
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };

                    if (SearchModalLayerGroup) {
                        SearchModalLayerGroup.removeFrom(mapModal);
                    }

                    SearchModalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                    SearchModalLayerGroup.addLayer(marker);
                    SearchModalLayerGroup.addTo(mapModal);

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

                    mapModal.fitBounds(bounds, { padding: [.00, .00] });

                    setTimeout(function () {
                        SearchModalLayerGroup.removeFrom(mapModal);
                    }, 2000);
                    //}
                });

                $('#showDataModal_Searchtable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );                 

            }

            function searchMap(searchResults) {

                var All_Locations = searchResults;
                
                var ATT_FiberCustomer = searchResults.filter(function (el) {
                    return (el.SHOW_SERVICE_STATUS == "InService" && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW");
                });
                var ATT_Fiber = searchResults.filter(function (el) {
                    return (el.SHOW_SERVICE_STATUS == null && el.ADJUSTED_DWELLING_TYPE == "S" && el.SHOW_MAP == "SHOW");
                });
                var MDU_Fiber = searchResults.filter(function (el) {
                    return (el.ADJUSTED_DWELLING_TYPE == "M" && el.SHOW_MAP == "SHOW");
                });

                var ATT_FiberCustomerPoints = new L.featureGroup();
                var ATT_FiberPoints = new L.featureGroup();
                var MDU_FiberPoints = new L.featureGroup();
                var All_LocationsPoints = new L.featureGroup();

                for (i in ATT_FiberCustomer) {
                    var popup =
                        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +                        
                        '<b>Address:</b> ' + ATT_FiberCustomer[i].HOUSE_NUMBER + ' ' + ATT_FiberCustomer[i].PREFIX + ' ' + ATT_FiberCustomer[i].STREET_NAME + 
                        '<br/><b>City, State Zip:</b> ' + ATT_FiberCustomer[i].CITY + ', ' + ATT_FiberCustomer[i].STATE + ' ' + ATT_FiberCustomer[i].ZIP +
                        '<br/><b>PSA Wireless Score:</b> ' + ATT_FiberCustomer[i].WIRELESS_SCORE +
                        '<br/><b>Customer Category:</b> ' + 'AT&T Fiber Customer',

                        loc = [ATT_FiberCustomer[i].LATITUDE, ATT_FiberCustomer[i].LONGITUDE],	//position found
                        ATT_FiberCustomerTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#00cc00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberCustomerTableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup, { maxWidth: 500 });
                    ATT_FiberCustomerPoints.addLayer(marker);
                }

                for (i in ATT_Fiber) {
                    var popup =
                        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                        
                        '<b>Address:</b> ' + ATT_Fiber[i].HOUSE_NUMBER + ' ' + ATT_Fiber[i].PREFIX + ' ' + ATT_Fiber[i].STREET_NAME +
                        '<br/><b>City, State Zip:</b> ' + ATT_Fiber[i].CITY + ', ' + ATT_Fiber[i].STATE + ' ' + ATT_Fiber[i].ZIP +
                        '<br/><b>PSA Wireless Score:</b> ' + ATT_Fiber[i].WIRELESS_SCORE +
                        '<br/><b>Customer Category:</b> ' + 'Prospective',

                        loc = [ATT_Fiber[i].LATITUDE, ATT_Fiber[i].LONGITUDE],	//position found
                        ATT_FiberTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#21b2ff'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberTableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup, { maxWidth: 500 });
                    ATT_FiberPoints.addLayer(marker);
                }

                for (i in MDU_Fiber) {
                    var popup =
                        //'<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +

                        '<b>Address:</b> ' + MDU_Fiber[i].HOUSE_NUMBER + ' ' + MDU_Fiber[i].PREFIX + ' ' + MDU_Fiber[i].STREET_NAME +
                        '<br/><b>City, State Zip:</b> ' + MDU_Fiber[i].CITY + ', ' + MDU_Fiber[i].STATE + ' ' + MDU_Fiber[i].ZIP +
                        '<br/><b>PSA Wireless Score:</b> ' + MDU_Fiber[i].WIRELESS_SCORE +
                        '<br/><b>Customer Category:</b> ' + MDU_Fiber[i].SHOW_SERVICE_STATUS,

                        loc = [MDU_Fiber[i].LATITUDE, MDU_Fiber[i].LONGITUDE],	//position found
                        ATT_FiberTableoptions = {
                            iconShape: 'rectangle-dot',
                            iconSize: [16, 16],
                            borderWidth: 4,
                            borderColor: '#000000'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATT_FiberTableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup, { maxWidth: 500 });
                    MDU_FiberPoints.addLayer(marker);
                }

                for (i in All_Locations) {
                    var loc = [All_Locations[i].LATITUDE, All_Locations[i].LONGITUDE];	//position found                        

                    marker = new L.Marker(new L.latLng(loc));                    
                    All_LocationsPoints.addLayer(marker);
                }

                document.getElementById('mySearchMap').innerHTML = "<div id='searchMap' style='height: 400px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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
                if (ATT_FiberCustomer.length > 0) { mapModalOptions.layers.push(ATT_FiberCustomerPoints); }
                if (ATT_Fiber.length > 0) { mapModalOptions.layers.push(ATT_FiberPoints); }
                if (MDU_Fiber.length > 0) { mapModalOptions.layers.push(MDU_FiberPoints); }

                mapModal = L.map("searchMap", mapModalOptions);

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(mapModal);

                function getColor(d) {
                    return d === 'AT&T Fiber Customer' ? "#00cc00" :
                        d === 'Prospective' ? "#21b2ff" :
                            d === 'MDU' ? "#000000" :
                            "#ff7f00";
                }

                var legendSearch = L.control({ position: 'bottomright' });                

                legendSearch.onAdd = function (mapModal) {

                    var legendCount = 0;
                    var ATT_FiberCustomerLegendCount = 0;
                    var ATT_FiberLegendCount = 0;
                    var MDU_FiberLegendCount = 0;
                    if (ATT_FiberCustomer.length > 0) { ATT_FiberCustomerLegendCount = 1; }
                    if (ATT_Fiber.length > 0) { ATT_FiberLegendCount = 1; }
                    if (MDU_Fiber.length > 0) { MDU_FiberLegendCount = 1; }
                    legendCount = ATT_FiberCustomerLegendCount + ATT_FiberLegendCount + MDU_FiberLegendCount;
                    console.log('Legend Count: ' + legendCount);

                    if (legendCount == 1) {
                        console.log('Legend count 1');
                        var div = L.DomUtil.create('div', 'infolegendSearchOneRow legendSearchOneRow');

                        categories = [];
                        categories2 = [];
                        if (ATT_FiberCustomer.length > 0) { categories.push('AT&T Fiber Customer'); }
                        if (ATT_Fiber.length > 0) { categories.push('Prospective'); }
                        if (MDU_Fiber.length > 0) { categories2.push('MDU'); }

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutOneRow" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        for (var i = 0; i < categories2.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutOneRow" style="border-radius: 0%; height: 12px; width: 12px; border: 3px solid #000000"></i> ' +
                                (categories2[i] ? categories2[i] + '<br>' : '+');
                        }

                        return div;

                    } else if (legendCount == 2){
                        console.log('Legend count 2');
                        var div = L.DomUtil.create('div', 'infolegendSearchTwoRows legendSearchTwoRows');

                        categories =[];
                        categories2 =[];
                        if(ATT_FiberCustomer.length > 0) { categories.push('AT&T Fiber Customer'); }
                        if (ATT_Fiber.length > 0) { categories.push('Prospective'); }
                        if (MDU_Fiber.length > 0) { categories2.push('MDU'); }

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutTwoRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        for (var i = 0; i < categories2.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutTwoRows" style="border-radius: 0%; height: 12px; width: 12px; border: 3px solid #000000"></i> ' +
                                (categories2[i] ? categories2[i] + '<br>' : '+');
                        }

                        return div;

                    } else {
                        console.log('Legend count 3');
                        var div = L.DomUtil.create('div', 'infolegendSearchThreeRows legendSearchThreeRows');

                        categories = [];
                        categories2 = [];
                        if (ATT_FiberCustomer.length > 0) { categories.push('AT&T Fiber Customer'); }
                        if (ATT_Fiber.length > 0) { categories.push('Prospective'); }
                        if (MDU_Fiber.length > 0) { categories2.push('MDU'); }

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutThreeRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        for (var i = 0; i < categories2.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutThreeRows" style="border-radius: 0%; height: 12px; width: 12px; border: 3px solid #000000"></i> ' +
                                (categories2[i] ? categories2[i] + '<br>' : '+');
                        }

                        return div;

                    }
                };

                legendSearch.addTo(mapModal);

                var overlays = {
                    
                };

                if (ATT_FiberCustomer.length > 0) { overlays["AT&T Fiber Customer"] = ATT_FiberCustomerPoints; }
                if (ATT_Fiber.length > 0) { overlays["Prospective"] = ATT_FiberPoints; }
                if (MDU_Fiber.length > 0) { overlays["MDU"] = MDU_FiberPoints; }


                

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);  

                //var featureGroup = L.featureGroup(ATT_FiberPoints).addTo(map);

                var bounds = All_LocationsPoints.getBounds().pad(0.1);
                mapModal.fitBounds(bounds);

                //mapModal.fitBounds(ATT_FiberPoints.getBounds(), { padding: [50, 50] });
                //var bounds = L.latLngBounds(ATT_FiberPoints);
                //mapModal.fitBounds(bounds);//works!
                //mapModal.fitBounds(ATT_FiberPoints.getBounds());

                mapModal.invalidateSize();

            }


            function AlertAddressExport() {
                alert('Exporting Addresses and Unit Numbers can take up to 15 seconds. Thank you for your patience. <br> Please respect the sensitivity of this data.');
            }

            function SubmitButtonClick() {
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log("SubmitButtonClick function: " + market);

                //check if anything has changed since last submitbuttonclick
                if (
                    <%--geoTypeStored == $('#<%= ddlGeo.ClientID %> option:selected').text()--%>
                    //&&
                    marketStored == $('#<%= ddlMarket.ClientID %> option:selected').text()) {
                    console.log('Button Click without Pulldown Change');
                }

                else {

                    <%--var geo = $('#<%= ddlGeo.ClientID %> option:selected').text();--%>
                    //var geo = "SALES";
                    var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var market = $('#<%= ddlMarket.ClientID %> option:selected').val();

                    //console.log("getFilterCriteria function: " + geo);
                    console.log("getFilterCriteria function: " + market_long);
                    console.log("getFilterCriteria function: " + market);

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
                console.log('start2');
                //Hide tabs
                $('.oneButton').removeClass('active');
                $('#zipfooter').hide();
                $('#zipfooter2').hide();
                $('#zipfooter3').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#cmaTableDiv').hide();
                $('#MapDiv').hide();
                $('#LOADING1').show();

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
                    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                        marketType = 'REGION';
                        GroupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                    } else {
                        marketType = 'MARKET';
                        GroupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();

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
                            marketGeoStore = 'OHIO PENNSYLVANIA';
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
                var GroupBySelection = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                console.log('GroupBySelection' + GroupBySelection);
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                    GroupBy = 'CMA';
                } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                    GroupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();
                } else {
                    marketType = 'MARKET';
                    GroupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();
                }

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == '%') {
                    marketGeoText = "National";
                } if (marketGeoText == 'CENTRAL' | marketGeoText == 'EAST' | marketGeoText == 'WEST') {
                    marketGeoText = marketGeoText + " REGION";
                } if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }

                if (GroupBy == 'CMA') {
                    document.getElementById('TableSubtitle3').innerHTML = 'CMAs';
                } else if (GroupBy == 'COUNTY') {
                    document.getElementById('TableSubtitle3').innerHTML = 'Counties';
                } else if (GroupBy == 'ZIP') {
                    document.getElementById('TableSubtitle3').innerHTML = 'Zips';
                }

                document.getElementById('TableSubtitle1').innerHTML = marketGeoText;
                getFilterCriteria();
            }



            function UpdateHomeTable() {
                //User changed the Sort Order By of the table, which doesnt affect the map, the themes, or any of the show hides.
                //Grab the required variables and rerun the ajax call for table creation, which is based on the Group By
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var marketType = '';
                var GroupBy = '';
                var CategoryFilter = '%';
                var CategoryLayerState = 0;

                if (marketGeo == '%') {
                    marketType = 'NATIONAL';
                    GroupBy = 'CMA';

                } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';
                    GroupBy = $('#<%= ddlRegionGroupBy.ClientID %> option:selected').val();

                    } else {
                        marketType = 'MARKET';
                        GroupBy = $('#<%= ddlMarketGroupBy.ClientID %> option:selected').val();
                }
                var SortByVariable = $('#<%= ddlSortBy.ClientID %> option:selected').val();

                if (GroupBy == 'ZIP') {

                    CategoryLayerState = ZipLayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'overallCatVariable': CategoryFilter, 'orderVariable': SortByVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            zipCodeTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });
                }

                else if (GroupBy == 'COUNTY') {

                    CategoryLayerState = CountyLayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CountyTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter, 'orderVariable': SortByVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            countyTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

                }

                else { //CMA

                    CategoryLayerState = CMALayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    console.log('UpdateHomeTable CMA Category Filter: ' + CategoryFilter);

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter, 'orderVariable': SortByVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            cmaTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

                }
            }

            //*** NEW UPDATE SALES OPPORTUNITY FUNCTION - TAKES IN PARAMETERS - SAME FUNCTION FOR ALL GEOGRAPHY TYPES

            function groupByFilter() {
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (groupGeo == 'SALES') {
                    if (marketGeo == '%') {
                        marketType = 'NATIONAL';
                    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                        marketType = 'REGION';
                    } else {
                        marketType = 'MARKET';
                    }
                }

                console.log('groupByFilter / marketType: ' + marketType);

                if (marketType == 'MARKET') {
                    console.log('***** MarketType MARKET *****');
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').show();
                }
                else if (marketType == 'REGION') {
                    console.log('***** MarketType REGION *****');
                    $('#ShowHideRegionGroupBy').show();
                    $('#ShowHideMarketGroupBy').hide();
                }
                else { //National
                    console.log('***** MarketType NATIONAL *****');
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').hide();
                }
            }

            function UpdateHomePage(marketGeo, marketGeoStore, marketGeoJSONName, marketType, GroupBy) {
                console.log('marketGeo' + marketGeo);
                console.log('marketGeoStore' + marketGeoStore);
                console.log('marketType' + marketType);
                console.log('GroupBy' + GroupBy);


                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == '%') {
                    marketGeoText = "National";
                } if (marketGeoText == 'CENTRAL' | marketGeoText == 'EAST' | marketGeoText == 'WEST') {
                    marketGeoText = marketGeoText + " REGION";
                } if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }

                if (GroupBy == 'CMA') {
                    document.getElementById('TableSubtitle3').innerHTML = 'CMAs';
                } else if (GroupBy == 'COUNTY') {
                    document.getElementById('TableSubtitle3').innerHTML = 'Counties';
                } else if (GroupBy == 'ZIP') {
                    document.getElementById('TableSubtitle3').innerHTML = 'Zips';
                }

                document.getElementById('TableSubtitle1').innerHTML = marketGeoText;

                //First use Market Type to hide and show the correct Group By ddl, select the correct ajax to grab store data, and trigger GET_MAP_THEME
                console.log('UpdateHomePage / marketType: ' + marketType);

                if (marketType == 'MARKET') {
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').show();

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_Market",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeoStore }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            GET_MAP_THEME_DATA(data, marketType, GroupBy, marketGeoJSONName);
                        },
                        error: function (data) {
                        }
                    });
                }

                else if (marketType == 'REGION') {
                    $('#ShowHideRegionGroupBy').show();
                    $('#ShowHideMarketGroupBy').hide();

                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_Region1",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'marketVariable': marketGeoStore }),
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
                            url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_Region2",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'marketVariable': marketGeoStore }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                Data2 = data.d;
                            },
                            error: function (data) {
                            }
                        })
                    ).then(function () {
                        dataConcat_2strings(Data1, Data2);
                    });

                    function dataConcat_2strings(data1, data2) {
                        var dataConcat2;
                        data1 = data1.substring(0, data1.length - 1);
                        data2 = data2.substring(1, data2.length);
                        dataConcat2 = data1 + ',' + data2;
                        data = JSON.parse(dataConcat2);
                        GET_MAP_THEME_DATA(data, marketType, GroupBy, marketGeoJSONName);
                    }
                }

                else { //National
                    $('#ShowHideRegionGroupBy').hide();
                    $('#ShowHideMarketGroupBy').hide();

                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_National1",  //use a function from C# , change this for different data return
                            data: JSON.stringify(),
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
                            url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_National2",  //use a function from C# , change this for different data return
                            data: JSON.stringify(),
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
                            url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_National3",  //use a function from C# , change this for different data return
                            data: JSON.stringify(),
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
                        GET_MAP_THEME_DATA(data, marketType, GroupBy, marketGeoJSONName);
                    }
                }

                //Use Group by to show hide the appropriate table div, call the ajax to build the table, and to populate the summary stats that show up in the filter buttons
                var SortByVariable = $('#<%= ddlSortBy.ClientID %> option:selected').val();
                var CategoryFilter = '%';
                var CategoryLayerState = 0;

                if (GroupBy == 'ZIP') {

                    $('#zipTableDiv').show();
                    $('#countyTableDiv').hide();
                    $('#cmaTableDiv').hide();

                    CategoryLayerState = ZipLayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Zip_Summary_Info",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            ZIP_SUMMARY_DATA(data);
                        },
                        error: function (data) {
                        }
                    });

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'overallCatVariable': CategoryFilter, 'orderVariable': SortByVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            zipCodeTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });
                }

                else if (GroupBy == 'COUNTY') {

                    $('#zipTableDiv').hide();
                    $('#countyTableDiv').show();
                    $('#cmaTableDiv').hide();

                    CategoryLayerState = CountyLayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_County_Summary_Info",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            COUNTY_SUMMARY_DATA(data);
                        },
                        error: function (data) {
                        }
                    });

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CountyTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter, 'orderVariable': SortByVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            countyTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

                }

                else { //CMA
                    $('#zipTableDiv').hide();
                    $('#countyTableDiv').hide();
                    $('#cmaTableDiv').show();

                    CategoryLayerState = CMALayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'WeakWirelessNoFiber'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'WeakWirelessFiberAvailable'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'StrongWirelessNoFiber'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'StrongWirelessFiberAvailable'; }

                    console.log('Get_CMA_Summary_Info :' + marketGeo + ' - ' + marketType);

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMA_Summary_Info",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CMA_SUMMARY_DATA(data);
                            console.log('CMA_SUMMARY_DATA');
                            console.log(data);
                        },
                        error: function (data) {
                        }
                    });

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter, 'orderVariable': SortByVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            cmaTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

                }

            }

            // ********** SALES OPPORTUNITY MARKET **********

            function updateSalesOpportunityChartMarket() {
                console.log('updateSalesOpportunityChartMarket function start');

                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
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
                    } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                        marketGeo = 'OHIO PENNSYLVANIA'
                    } if (marketGeo == 'MID-ATLANTIC') {
                        marketGeo = 'MID-ATLANTIC STATES'
                    } if (marketGeo == 'ROCKY MOUNTAIN') {
                        marketGeo = 'ROCKY MOUNTAINS'
                    }
                    else { marketGeo = marketGeo }
                }

                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_Market",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        GET_MAP_THEME_DATA(data);
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_Zip_Summary_Info",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2 }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        ZIP_SUMMARY_DATA(data);
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2, 'overallCatVariable': '%', 'orderVariable': 'FIBER_OPPORTUNITY' }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        zipCodeTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });

                console.log('updateSalesOpportunityChartMarket function end');

            }

            function updateSalesOpportunityChartRegion() {
                console.log('updateSalesOpportunityChartRegion function start');

                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                console.log('Get_Store_Detail groupGeo: ' + groupGeo);
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('Get_Store_Detail marketGeo: ' + marketGeo);

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_Region1",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_Region2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            Data2 = data.d;
                        },
                        error: function (data) {
                        }
                    })
                ).then(function () {
                    dataConcat_2strings(Data1, Data2);
                });

                function dataConcat_2strings(data1, data2) {
                    var dataConcat2;
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length);
                    dataConcat2 = data1 + ',' + data2;
                    data = JSON.parse(dataConcat2);
                    GET_MAP_THEME_DATA(data);
                }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_County_Summary_Info",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        COUNTY_SUMMARY_DATA(data);
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_CountyTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'overallCatVariable': '%', 'orderVariable': 'FIBER_OPPORTUNITY' }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        countyTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });

                console.log('updateSalesOpportunityChartRegion function end');

            }

            function updateSalesOpportunityChartNational() {
                console.log('updateSalesOpportunityChartNational function start');

                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                console.log('Get_Store_Detail groupGeo: ' + groupGeo);
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('Get_Store_Detail marketGeo: ' + marketGeo);

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_National1",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_National2",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail_National3",  //use a function from C# , change this for different data return
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

                function dataConcat_3strings(data1, data2, data3) {
                    var dataConcat3;
                    data1 = data1.substring(0, data1.length - 1);
                    data2 = data2.substring(1, data2.length - 1);
                    data3 = data3.substring(1, data3.length);
                    dataConcat3 = data1 + ',' + data2 + ',' + data3;
                    data = JSON.parse(dataConcat3);
                    GET_MAP_THEME_DATA(data);
                }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_CMA_Summary_Info",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        CMA_SUMMARY_DATA(data);
                        console.log('CMA_SUMMARY_DATA');
                        console.log(data);
                    },
                    error: function (data) {
                    }
                });

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'overallCatVariable': '%', 'orderVariable': 'FIBER_OPPORTUNITY' }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        cmaTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });


                console.log('updateSalesOpportunityChartNational function end');

            }

            function ZIP_SUMMARY_DATA(data) {
                score = JSON.parse(data.d);

                var PWNF_COUNT = score[0]["PWNF_COUNT"];
                var PWNF_COUNT_comma = Number(PWNF_COUNT).toLocaleString('en');
                document.getElementById('ZIP_PWNF_COUNT').innerHTML = PWNF_COUNT_comma;
                var PWNF_POPS = score[0]["PWNF_POPS"];
                var PWNF_POPS_comma = Number(PWNF_POPS).toLocaleString('en');
                document.getElementById('ZIP_PWNF_POPS').innerHTML = PWNF_POPS_comma;

                var PWGF_COUNT = score[0]["PWGF_COUNT"];
                var PWGF_COUNT_comma = Number(PWGF_COUNT).toLocaleString('en');
                document.getElementById('ZIP_PWGF_COUNT').innerHTML = PWGF_COUNT_comma;
                var PWGF_POPS = score[0]["PWGF_POPS"];
                var PWGF_POPS_comma = Number(PWGF_POPS).toLocaleString('en');
                document.getElementById('ZIP_PWGF_POPS').innerHTML = PWGF_POPS_comma;

                var GWNF_COUNT = score[0]["GWNF_COUNT"];
                var GWNF_COUNT_comma = Number(GWNF_COUNT).toLocaleString('en');
                document.getElementById('ZIP_GWNF_COUNT').innerHTML = GWNF_COUNT_comma;
                var GWNF_POPS = score[0]["GWNF_POPS"];
                var GWNF_POPS_comma = Number(GWNF_POPS).toLocaleString('en');
                document.getElementById('ZIP_GWNF_POPS').innerHTML = GWNF_POPS_comma;

                var GWGF_COUNT = score[0]["GWGF_COUNT"];
                var GWGF_COUNT_comma = Number(GWGF_COUNT).toLocaleString('en');
                document.getElementById('ZIP_GWGF_COUNT').innerHTML = GWGF_COUNT_comma;
                var GWGF_POPS = score[0]["GWGF_POPS"];
                var GWGF_POPS_comma = Number(GWGF_POPS).toLocaleString('en');
                document.getElementById('ZIP_GWGF_POPS').innerHTML = GWGF_POPS_comma;

            }

            function COUNTY_SUMMARY_DATA(data) {
                score = JSON.parse(data.d);

                var PWNF_COUNT = score[0]["PWNF_COUNT"];
                var PWNF_COUNT_comma = Number(PWNF_COUNT).toLocaleString('en');
                document.getElementById('COUNTY_PWNF_COUNT').innerHTML = PWNF_COUNT_comma;
                var PWNF_POPS = score[0]["PWNF_POPS"];
                var PWNF_POPS_comma = Number(PWNF_POPS).toLocaleString('en');
                document.getElementById('COUNTY_PWNF_POPS').innerHTML = PWNF_POPS_comma;

                var PWGF_COUNT = score[0]["PWGF_COUNT"];
                var PWGF_COUNT_comma = Number(PWGF_COUNT).toLocaleString('en');
                document.getElementById('COUNTY_PWGF_COUNT').innerHTML = PWGF_COUNT_comma;
                var PWGF_POPS = score[0]["PWGF_POPS"];
                var PWGF_POPS_comma = Number(PWGF_POPS).toLocaleString('en');
                document.getElementById('COUNTY_PWGF_POPS').innerHTML = PWGF_POPS_comma;

                var GWNF_COUNT = score[0]["GWNF_COUNT"];
                var GWNF_COUNT_comma = Number(GWNF_COUNT).toLocaleString('en');
                document.getElementById('COUNTY_GWNF_COUNT').innerHTML = GWNF_COUNT_comma;
                var GWNF_POPS = score[0]["GWNF_POPS"];
                var GWNF_POPS_comma = Number(GWNF_POPS).toLocaleString('en');
                document.getElementById('COUNTY_GWNF_POPS').innerHTML = GWNF_POPS_comma;

                var GWGF_COUNT = score[0]["GWGF_COUNT"];
                var GWGF_COUNT_comma = Number(GWGF_COUNT).toLocaleString('en');
                document.getElementById('COUNTY_GWGF_COUNT').innerHTML = GWGF_COUNT_comma;
                var GWGF_POPS = score[0]["GWGF_POPS"];
                var GWGF_POPS_comma = Number(GWGF_POPS).toLocaleString('en');
                document.getElementById('COUNTY_GWGF_POPS').innerHTML = GWGF_POPS_comma;

            }

            function CMA_SUMMARY_DATA(data) {
                score = JSON.parse(data.d);

                var PWNF_COUNT = score[0]["PWNF_COUNT"];
                var PWNF_COUNT_comma = Number(PWNF_COUNT).toLocaleString('en');
                document.getElementById('CMA_PWNF_COUNT').innerHTML = PWNF_COUNT_comma;
                var PWNF_POPS = score[0]["PWNF_POPS"];
                var PWNF_POPS_comma = Number(PWNF_POPS).toLocaleString('en');
                document.getElementById('CMA_PWNF_POPS').innerHTML = PWNF_POPS_comma;

                var PWGF_COUNT = score[0]["PWGF_COUNT"];
                var PWGF_COUNT_comma = Number(PWGF_COUNT).toLocaleString('en');
                document.getElementById('CMA_PWGF_COUNT').innerHTML = PWGF_COUNT_comma;
                var PWGF_POPS = score[0]["PWGF_POPS"];
                var PWGF_POPS_comma = Number(PWGF_POPS).toLocaleString('en');
                document.getElementById('CMA_PWGF_POPS').innerHTML = PWGF_POPS_comma;

                var GWNF_COUNT = score[0]["GWNF_COUNT"];
                var GWNF_COUNT_comma = Number(GWNF_COUNT).toLocaleString('en');
                document.getElementById('CMA_GWNF_COUNT').innerHTML = GWNF_COUNT_comma;
                var GWNF_POPS = score[0]["GWNF_POPS"];
                var GWNF_POPS_comma = Number(GWNF_POPS).toLocaleString('en');
                document.getElementById('CMA_GWNF_POPS').innerHTML = GWNF_POPS_comma;

                var GWGF_COUNT = score[0]["GWGF_COUNT"];
                var GWGF_COUNT_comma = Number(GWGF_COUNT).toLocaleString('en');
                document.getElementById('CMA_GWGF_COUNT').innerHTML = GWGF_COUNT_comma;
                var GWGF_POPS = score[0]["GWGF_POPS"];
                var GWGF_POPS_comma = Number(GWGF_POPS).toLocaleString('en');
                document.getElementById('CMA_GWGF_POPS').innerHTML = GWGF_POPS_comma;

            }

            function ZipTableUpdate() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };

                var SelectedSortZip = $('#<%= ddlSortBy.ClientID %> option:selected').val();
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('zip table sort pulldown change: ' + SelectedSortZip);

                var ZipCatFilter = '%'
                if (ZipLayerState == 0) { ZipCatFilter = '%'; }
                else if (ZipLayerState == 1) { ZipCatFilter = 'WeakWirelessNoFiber'; }
                else if (ZipLayerState == 2) { ZipCatFilter = 'WeakWirelessFiberAvailable'; }
                else if (ZipLayerState == 3) { ZipCatFilter = 'StrongWirelessNoFiber'; }
                else if (ZipLayerState == 4) { ZipCatFilter = 'StrongWirelessFiberAvailable'; }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2, 'overallCatVariable': ZipCatFilter, 'orderVariable': SelectedSortZip }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        zipCodeTable(data, SelectedSortZip);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });
            }

            function CountyTableUpdate() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };

                var SelectedSortCounty = $('#<%= ddlSortBy.ClientID %> option:selected').val();
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('county table sort pulldown change: ' + SelectedSortCounty);

                var CountyCatFilter = '%'
                if (CountyLayerState == 0) { CountyCatFilter = '%'; }
                else if (CountyLayerState == 1) { CountyCatFilter = 'WeakWirelessNoFiber'; }
                else if (CountyLayerState == 2) { CountyCatFilter = 'WeakWirelessFiberAvailable'; }
                else if (CountyLayerState == 3) { CountyCatFilter = 'StrongWirelessNoFiber'; }
                else if (CountyLayerState == 4) { CountyCatFilter = 'StrongWirelessFiberAvailable'; }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_CountyTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2, 'overallCatVariable': CountyCatFilter, 'orderVariable': SelectedSortCounty }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        countyTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });
            }

            function CMATableUpdate() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                };

                var SelectedSortCMA = $('#<%= ddlSortBy.ClientID %> option:selected').val();
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('CMA table sort pulldown change: ' + SelectedSortCMA);

                var CMACatFilter = '%'
                if (CMALayerState == 0) { CMACatFilter = '%'; }
                else if (CMALayerState == 1) { CMACatFilter = 'WeakWirelessNoFiber'; }
                else if (CMALayerState == 2) { CMACatFilter = 'WeakWirelessFiberAvailable'; }
                else if (CMALayerState == 3) { CMACatFilter = 'StrongWirelessNoFiber'; }
                else if (CMALayerState == 4) { CMACatFilter = 'StrongWirelessFiberAvailable'; }

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2, 'overallCatVariable': CMACatFilter, 'orderVariable': SelectedSortCMA }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        cmaTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });
            }

            function ZipModalTableUpdate() {

                ////////////////////
                // need to bring zipselected varaible into this function to use in query
                ////////////////////

                var SelectedSortZipModal = $('#<%= ddlSortZipModal.ClientID %> option:selected').val();
                var groupGeo = 'SALES';
                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('zip modal table sort pulldown change: ' + SelectedSortZipModal);

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_TestingV2.aspx/Get_ZipModalTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'zipVariable': ZipCodeModalSelected, 'orderVariable': SelectedSortZipModal }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        zipCodeModalTable(data, SelectedSortZipModal);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });
            }


            function zipCodeTable(data, SelectedSortZip) {
                $('#zipCode_datatable').dataTable().fnDestroy(); //destroy old table
                ////$.fn.dataTable.moment('MM-DD-YYYY');
                //$('#zipCode_datatable').DataTable({ //build new table

                var table = $('#zipCode_datatable');
                console.log('KTDataTables begin');

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }
                //document.getElementById('ZipTableSubtitle1').innerHTML = marketGeoText;

                var ExportZipOrder = 'Total_Pops';
                console.log($('#<%= ddlSortBy.ClientID %> option:selected').text());
                if ($('#<%= ddlSortBy.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportZipOrder = 'Pop_Density';
                }

                var ExportZipFilter = '';
                if (ZipLayerState == 1) { ExportZipFilter = 'With_WeakWireless_NoFiber_'; }
                else if (ZipLayerState == 2) { ExportZipFilter = 'With_WeakWireless_FiberAvailable_'; }
                else if (ZipLayerState == 3) { ExportZipFilter = 'With_StrongWireless_NoFiber_'; }
                else if (ZipLayerState == 4) { ExportZipFilter = 'With_StrongWireless_FiberAvailable_'; }

                console.log('SelectedSortZip: ' + SelectedSortZip)


                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[4, "desc"]],
                    dom: 'Brtlifp',
                    buttons: [{
                        text: 'Export All (Unfiltered)',
                        titleAttr: 'Exports All Zips Ignoring Filters',
                        className: 'btn btn-primary',
                        action: function (e, dt, node, config) {
                            ExportAll_Zips();
                        }
                    }, { extend: 'csv', text: 'Export Top 50', className: 'btn btn-primary', titleAttr: 'Export Top 50 ZIPs to Excel', title: 'Top_50_ZIPs_' + ExportZipFilter + 'By_' + ExportZipOrder }],
                    columns: [
                        { 'data': 'ROWNUM' },
                        { 'data': 'ZIP' },
                        { 'data': 'WIRELESS_CATEGORY' },
                        { 'data': 'FIBER_AVAILABILITY' },
                        // { 'data': 'TOTALAREA' },
                        { 'data': 'TOTALPOPS' },
                        { 'data': 'POP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'ALL_STORE_COUNT' },
                        // { 'data': 'FIBER_PERCENTAGE' },

                    ],

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

                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });
                    },

                });


                $('#zipCode_datatable tbody').on('click', 'tr', function () {
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
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";

                        if (props) {
                            TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
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

                        this._div.innerHTML = '<h4>Zip Code Information</h4>' + (props ?
                            //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                            '<b>Zip Code: ' + props.ZIP + ', ' + props.STATE + '</b><br />' + 'ZIP Population: ' + TOTALPOPSCOMMA +
                            '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                            '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                            '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT +
                            '<br />PSA Location Count: ' + props.NUMBER_OF_PSAS + zipTouchLink
                            : 'Hover over a zip code');

                        $('.ZipTouchDetailLink').click(function () {
                            showZipTouchModal(props);
                        });

                        function showZipTouchModal(props) {
                            ZipTouchModal_Click();
                            updateZipModal(props); // function for getting data for modal
                        }

                        function ZipTouchModal_Click(source, eventArgs) {
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

                        var cssinfo = "info";

                        if (props) {
                            if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                                cssinfo = "info1";
                            } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                                cssinfo = "info2";
                            } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                                cssinfo = "info3";
                            } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                                cssinfo = "info4";
                            } else {
                                cssinfo = "info";
                            };

                            this._div.classList.remove("info");
                            this._div.classList.remove("info1");
                            this._div.classList.remove("info2");
                            this._div.classList.remove("info3");
                            this._div.classList.remove("info4");
                            this._div.classList.add(cssinfo);
                        } else {
                            this._div.classList.remove("info");
                            this._div.classList.remove("info1");
                            this._div.classList.remove("info2");
                            this._div.classList.remove("info3");
                            this._div.classList.remove("info4");
                            this._div.classList.add(cssinfo);
                        }
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

                });

                $(window).resize();

                console.log('KTDataTables end');

            };



            function countyTable(data) {
                $('#county_datatable').dataTable().fnDestroy(); //destroy old table
                ////$.fn.dataTable.moment('MM-DD-YYYY');
                //$('#county_datatable').DataTable({ //build new table

                var table = $('#county_datatable');
                console.log('KTDataTables begin');

                var ExportCountyOrder = 'Total_Pops';
                console.log($('#<%= ddlSortBy.ClientID %> option:selected').text());
                if ($('#<%= ddlSortBy.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportCountyOrder = 'Pop_Density';
                }

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                marketGeoText = marketGeoText + " REGION";
                //document.getElementById('CountyTableSubtitle1').innerHTML = marketGeoText;

                var ExportCountyFilter = '';
                if (CountyLayerState == 0) { ExportCountyFilter = ''; }
                else if (CountyLayerState == 1) { ExportCountyFilter = 'With_WeakWireless_NoFiber_'; }
                else if (CountyLayerState == 2) { ExportCountyFilter = 'With_WeakWireless_FiberAvailable_'; }
                else if (CountyLayerState == 3) { ExportCountyFilter = 'With_StrongWireless_NoFiber_'; }
                else if (CountyLayerState == 4) { ExportCountyFilter = 'With_StrongWireless_FiberAvailable_'; }

                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[4, "desc"]],
                    dom: 'Brtlifp',
                    buttons: [{
                        text: 'Export All (Unfiltered)',
                        titleAttr: 'Exports All Counties Ignoring Filters',
                        className: 'btn btn-primary',
                        action: function (e, dt, node, config) {
                            ExportAll_Counties();
                        }
                    }, { extend: 'csv', text: 'Export Top 50', className: 'btn btn-primary', titleAttr: 'Export Top 50 Counties to Excel', title: 'Top_50_Counties_' + ExportCountyFilter + 'By_' + ExportCountyOrder }],
                    columns: [
                        { 'data': 'ROWNUM' },
                        { 'data': 'COUNTY_STATE' },
                        { 'data': 'WIRELESS_CATEGORY' },
                        { 'data': 'FIBER_AVAILABILITY' },
                        // { 'data': 'TOTALAREA' },
                        { 'data': 'TOTALPOPS' },
                        { 'data': 'POP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'ALL_STORE_COUNT' },
                        // { 'data': 'FIBER_PERCENTAGE' }
                    ],

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

                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });

                    },

                });

                $('#county_datatable tbody').on('click', 'tr', function () {
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
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";
                        var NUMBER_OF_PSASCOMMA = "";

                        if (props) {
                            TotalPOPsCOMMA = Number(props.TotalPOPs).toLocaleString('en');
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
                                    CountyTouchLink = '<br /><a href="#" class="CountyTouchDetailLink">Click to Show Top Fiber Opportunities</a>';
                                }
                            } else {
                                CountyTouchLink = '';
                            }
                        } else {
                            CountyTouchLink = '';
                        }

                        this._div.innerHTML = '<h4>County Information</h4>' + (props ?
                            //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                            '<b>County: ' + props.COUNTY_STATE + '</b><br />' + 'Population: ' + TotalPOPsCOMMA +
                            '<br />Wireless Category: ' + props.WIRELESS_CATEGORY +
                            '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                            '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT +
                            '<br />PSA Location Count: ' + NUMBER_OF_PSASCOMMA + CountyTouchLink
                            : 'Hover over a county');

                        $('.CountyTouchDetailLink').click(function () {
                            showCountyModal(props, SelectCountyLat, SelectCountyLng);
                        });

                        var cssinfo = "info";

                        if (props) {
                            if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                                cssinfo = "info1";
                            } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                                cssinfo = "info2";
                            } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                                cssinfo = "info3";
                            } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                                cssinfo = "info4";
                            } else {
                                cssinfo = "info";
                            };

                            this._div.classList.remove("info");
                            this._div.classList.remove("info1");
                            this._div.classList.remove("info2");
                            this._div.classList.remove("info3");
                            this._div.classList.remove("info4");
                            this._div.classList.add(cssinfo);
                        } else {
                            this._div.classList.remove("info");
                            this._div.classList.remove("info1");
                            this._div.classList.remove("info2");
                            this._div.classList.remove("info3");
                            this._div.classList.remove("info4");
                            this._div.classList.add(cssinfo);
                        }
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

                });

                $(window).resize();

                console.log('KTDataTables end');

            };

            function cmaTable(data) {
                $('#cma_datatable').dataTable().fnDestroy(); //destroy old table

                var table = $('#cma_datatable');
                console.log('KTDataTables begin');

                var ExportCMAOrder = 'Total_Pops';
                console.log($('#<%= ddlSortBy.ClientID %> option:selected').text());
                if ($('#<%= ddlSortBy.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportCMAOrder = 'Pop_Density';
                }

                var ExportCMAFilter = '';
                if (CMALayerState == 0) { ExportCMAFilter = ''; }
                else if (CMALayerState == 1) { ExportCMAFilter = 'With_WeakWireless_NoFiber_'; }
                else if (CMALayerState == 2) { ExportCMAFilter = 'With_WeakWireless_FiberAvailable_'; }
                else if (CMALayerState == 3) { ExportCMAFilter = 'With_StrongWireless_NoFiber_'; }
                else if (CMALayerState == 4) { ExportCMAFilter = 'With_StrongWireless_FiberAvailable_'; }

                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '300px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: false,
                    //order: [[5, "desc"]],
                    dom: 'Brtlifp',
                    buttons: [{
                        text: 'Export All (Unfiltered)',
                        className: 'btn btn-primary',
                        titleAttr: 'Exports All CMAs Ignoring Filters',
                        action: function (e, dt, node, config) {
                            ExportAll_CMAs();
                        }
                    },
                    { extend: 'csv', text: 'Export Top 50', className: 'btn btn-primary', titleAttr: 'Export Top 50 CMAs to Excel', title: 'Top_50_National_CMAs_' + ExportCMAFilter + 'By_' + ExportCMAOrder }],
                    columns: [
                        { 'data': 'ROWNUM' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CMA' },
                        { 'data': 'WIRELESS_CATEGORY' },
                        { 'data': 'FIBER_AVAILABILITY' },
                        // { 'data': 'TOTALAREA' },
                        { 'data': 'TOTALPOPS' },
                        { 'data': 'POP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'ALL_STORE_COUNT' },
                        // { 'data': 'FIBER_PERCENTAGE' }
                    ],


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

                        this.api().columns().header().each(function (th) {
                            $(th).removeClass("sorting_asc");
                            $(th).removeClass("sorting");
                        });

                    },

                });

                $('#cma_datatable tbody').on('click', 'tr', function () {
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

                    console.log('vpgm3layertest: ');
                    console.log(Vpgm3LayerTest.getBounds());
                    console.log(Vpgm3LayerTest.getBounds()._northEast);
                    console.log(Vpgm3LayerTest.getBounds()._northEast.lat);
                    console.log(SelectCMALat);
                    console.log(SelectCMALng);

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
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";
                        var NUMBER_OF_PSASCOMMA = "";

                        if (props) {
                            TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
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
                                    CMATouchLink = '<br /><a href="#" class="CMATouchDetailLink">Click to Show Top Fiber Opportunities</a>';
                                }
                            } else {
                                CMATouchLink = '';
                            }
                        } else {
                            CMATouchLink = '';
                        }


                        this._div.innerHTML = '<h4>CMA Information</h4>' + (props ?
                            //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                            '<b>CMA: ' + props.cma + '<br />' + 'CMA Name: ' + props.Name + '</b><br />' + 'CMA Population: ' + TOTALPOPSCOMMA +
                            '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                            '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                            '<br />Number of PSAs: ' + NUMBER_OF_PSASCOMMA +
                            '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT + CMATouchLink
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

                        var cssinfo = "info";

                        if (props) {
                            if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                                cssinfo = "info1";
                            } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                                cssinfo = "info2";
                            } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                                cssinfo = "info3";
                            } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                                cssinfo = "info4";
                            } else {
                                cssinfo = "info";
                            };

                            this._div.classList.remove("info");
                            this._div.classList.remove("info1");
                            this._div.classList.remove("info2");
                            this._div.classList.remove("info3");
                            this._div.classList.remove("info4");
                            this._div.classList.add(cssinfo);
                        } else {
                            this._div.classList.remove("info");
                            this._div.classList.remove("info1");
                            this._div.classList.remove("info2");
                            this._div.classList.remove("info3");
                            this._div.classList.remove("info4");
                            this._div.classList.add(cssinfo);
                        }
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



                });

                $(window).resize();

                console.log('KTDataTables end');

            };

            function zipCodeModalTable(data, SelectedSortZipModal) {

                console.log('SelectedSortZipModal');
                console.log(SelectedSortZipModal);

                $('#zipCodeModal_datatable').dataTable().fnDestroy(); //destroy old table

                var table = $('#zipCodeModal_datatable');
                document.getElementById('<%= hf_PSALocationZip.ClientID %>').value = SelectedSortZipModal;

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export All Fiber Addresses for Selected Zip to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)'
                    var buttonTitleAttr = 'Show All Fiber Addresses for Selected Zip to Excel';
                }

                console.log('KTDataTables ZipModal begin');

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }
                document.getElementById('ZipModalTableSubtitle1').innerHTML = ZipCodeModalSelected;

                console.log('SelectedSortZipModal: ' + SelectedSortZipModal)


                if (Access == "Unlimited") {
                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' All Fiber Addresses in ZIP' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                selectedFiberGetExportAll();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }],
                        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                        columns: [
                            { 'data': 'ROWNUM' },
                            { 'data': 'ZIP_CO_PSA' },
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_CUSTOMERS' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                } else {
                    // begin limited table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' All Fiber Addresses in ZIP' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                selectedFiberGetExportAll();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }],
                        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                        columns: [
                            { 'data': 'ROWNUM' },
                            //{ 'data': 'ZIP' },
                            { 'data': 'ZIP_CO_PSA' },
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                'className': "text-center",
                            },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_CUSTOMERS' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                }

                function ExportSpecificPSAAddress() {
                    console.log('ExportSpecificPSAAddress');
                }

                //$('#zipCodeModal_datatable tbody').off('click').on('click', 'button', function () {
                //    //var data = table.row($(this).parents('tr')).data();
                //    alert("ZIP CO PSA");
                //});

                $('#zipCodeModal_datatable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var value = $(tr).find('td').eq(1)[0].innerHTML;
                    if (Access == "Unlimited") {
                        selectedFiberGetExport(value);
                    } else {
                        selectedFiberShowAddresses(value);
                    }
                    return false;
                });

                function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = value;
                    var clickButton = document.getElementById("<%= ButtonPSALocations.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA from table: " + value);
                }

                function selectedFiberGetExportAll() {
                    if (Access == "Unlimited") {
                        var clickButton = document.getElementById("<%= ButtonPSALocationsZip.ClientID %>");
                        clickButton.click();
                        //console.log("Clicked PSA from table: " + value);
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");
                        clickButton.click();

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();

                        document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + SelectedSortZipModal;

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddresses",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'ZipVariable': SelectedSortZipModal }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                unitNumbersData = JSON.parse(data.d);
                                showDataPSAAddresses(unitNumbersData);
                            },
                            error: function (data) {
                            }
                        })

                    }
                }

                function selectedFiberShowAddresses(PSAValue) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    PSAShowAddressesFromTableClick(PSAValue)
                }

                function PSAShowAddressesFromTableClick(PSAValue) {

                    var PSAVariable = PSAValue;
                    console.log('PSA: ' + PSAVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + SelectedSortZipModal + ' - ' + 'PSA: ' + PSAValue;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'PSAVariable': PSAVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                function showDataPSAAddresses(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                //$('#zipCodeModal_datatable tr td:nth-child(1)').hover(function () {
                //    $(this).addClass('DT_pointer');
                //}, function () {
                //    $(this).removeClass('DT_pointer');
                //}
                //);

                $('#zipCodeModal_datatable tr').off().on('click', function () {

                    //$('#zipCodeModal_datatable tr td:eq(0)').off().on('click', function () {
                    //var visIdx = $(this).index();
                    //var dataIdx = '#zipCodeModal_datatable'.column.index('fromVisible', visIdx);

                    //console.log('index: ' + visIdx);
                    //console.log('dataIdx: ' + dataIdx);
                    //if ($(this).index() == 3) { // provide index of your column in which you prevent row click here is column of 4 index
                    //    return;
                    //} else {
                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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
                    }, 2000);
                    //}
                });

                $('#zipCodeModal_datatable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );

                //$('#zipCodeModal_datatable tbody').off('click').on('click', 'td', function () {
                //    if ($(this).index() == 3) { // provide index of your column in which you prevent row click here is column of 4 index
                //        return;
                //    } else {
                //        var row_clicked = $(this).closest('tr');
                //        var latitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                //        var longitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                //        console.log("latitudeClicked: " + latitudeClicked);
                //        console.log("longitudeClicked: " + longitudeClicked);

                //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                //        var loc = [latitudeClicked, longitudeClicked];
                //            markerOptions = {
                //                iconShape: 'doughnut',
                //                iconSize: [20, 20],
                //                borderWidth: 3,
                //                borderColor: '#ff0000'
                //        };

                //        if (ZipModalLayerGroup) {
                //            ZipModalLayerGroup.removeFrom(mapModal);
                //        }

                //        ZipModalLayerGroup = L.layerGroup();
                //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                //        ZipModalLayerGroup.addLayer(marker);
                //        ZipModalLayerGroup.addTo(mapModal);

                //        var NE_lat = Number(latitudeClicked);
                //        var NE_lng = Number(longitudeClicked);
                //        var add1 = .01
                //        var NE_lat_1 = NE_lat + add1;
                //        var NE_lng_1 = NE_lng + add1;

                //        var SW_lat = Number(latitudeClicked);
                //        var SW_lng = Number(longitudeClicked);
                //        var add1 = .01
                //        var SW_lat_1 = SW_lat - add1;
                //        var SW_lng_1 = SW_lng - add1;

                //        var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                //            northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                //            bounds = new L.LatLngBounds(southWest, northEast);

                //        mapModal.fitBounds(bounds, { padding: [.05, .05] });

                //        setTimeout(function () {
                //            ZipModalLayerGroup.removeFrom(mapModal);
                //            }, 2000);


                //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                //        //var loc = [data.LATITUDE, data.LONGITUDE];
                //        //markerOptions = {
                //        //    iconShape: 'doughnut',
                //        //    iconSize: [20, 20],
                //        //    borderWidth: 3,
                //        //    borderColor: '#ff0000'
                //        //};

                //        //if (ZipModalLayerGroup) {
                //        //    ZipModalLayerGroup.removeFrom(mapModal);
                //        //}

                //        //ZipModalLayerGroup = L.layerGroup();
                //        //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                //        //ZipModalLayerGroup.addLayer(marker);
                //        //ZipModalLayerGroup.addTo(mapModal);

                //        //var NE_lat = Number(data.LATITUDE);
                //        //var NE_lng = Number(data.LONGITUDE);
                //        //var add1 = .01
                //        //var NE_lat_1 = NE_lat + add1;
                //        //var NE_lng_1 = NE_lng + add1;

                //        //var SW_lat = Number(data.LATITUDE);
                //        //var SW_lng = Number(data.LONGITUDE);
                //        //var add1 = .01
                //        //var SW_lat_1 = SW_lat - add1;
                //        //var SW_lng_1 = SW_lng - add1;

                //        //var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                //        //    northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                //        //    bounds = new L.LatLngBounds(southWest, northEast);

                //        //mapModal.fitBounds(bounds, { padding: [.05, .05] });

                //        //setTimeout(function () {
                //        //    ZipModalLayerGroup.removeFrom(mapModal);
                //        //}, 2000);
                //    }

                //});


                //$('#zipCodeModal_datatable tbody').on('click', 'tr', function () {
                //    var data = $('#zipCodeModal_datatable').DataTable().row(this).data();

                //    if (mapModal.hasLayer(PSALocationPoints)) {
                //        PSALocationPoints.clearLayers();
                //    };

                //    var ZipLayerGroup = L.layerGroup().addTo(mapModal);

                //    var myStyle = {
                //        weight: 5,
                //        color: '#000000',
                //        opacity: 0.5,
                //        fillOpacity: 0.001
                //    };

                //    VpgmLayerTest = L.geoJSON(VpgmData, {
                //        style: myStyle,
                //        filter: zipFilter,
                //        onEachFeature: onEachFeature
                //    }).addTo(ZipLayerGroup);

                //    function zipFilter(feature) {
                //        if (feature.properties.ZIP == data.ZIP) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());

                //    function onEachFeature(feature, layer) {

                //        map.removeControl(infoZip);
                //        if (infoDatatableZip) {
                //            map.removeControl(infoDatatableZip);
                //        };

                //        setTimeout(function () {
                //            infoDatatableZip.update(layer.feature.properties);
                //        }, 1000);

                //        //infoDatatable.update(layer.feature.properties);
                //    }

                //});

                $(window).resize();

                console.log('KTDataTables zip modal1 end');
                groupByFilter();

            };

            function CountyModalTable(data, CountyModalSelected) {

                console.log('CountyModalSelected: ' + CountyModalSelected);

                var TopPSACount = data.length;
                var TopPSAOpportunitySum = 0;


                for (var i = 0; i < data.length; i++) {
                    TopPSAOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }

                TopPSAOpportunitySumCOMMA = TopPSAOpportunitySum.toLocaleString('en');

                document.getElementById('CountyModalSubtitlePSA').innerHTML = TopPSAOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today around these top ' + TopPSACount + ' PSAs';
                //document.getElementById('CountyModalSubtitlePSA').innerHTML = 'Top ' + TopPSACount + ' PSAs combine for ' + TopPSAOpportunitySum + ' Addresses of Opportunity to Sell Fiber Today';

                $('#CountyModal_datatable').dataTable().fnDestroy(); //destroy old table                

                var table = $('#CountyModal_datatable');
                document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value = CountyModalSelected;

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export Fiber Addresses from Top PSAs to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)'
                    var buttonTitleAttr = 'Show Fiber Addresses from Top PSAs (limit 3000 rows)';
                }

                console.log('KTDataTables County Modal begin');
                groupByFilter();

                <%--var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }--%>

                //document.getElementById('CountyModalTableSubtitle1').innerHTML = CountyModalSelected;

                //console.log('SelectedSortZipModal: ' + SelectedSortZipModal)

                if (Access == "Unlimited") {
                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' Fiber Addresses' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                selectedFiberGetExportAllCounty();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }],
                        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                        columns: [
                            //{ 'data': 'ROWNUM' },
                            //{ 'data': 'ZIP' },
                            { 'data': 'ZIP_CO_PSA' },
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
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_CUSTOMERS' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

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

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                } else {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' Fiber Addresses' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                selectedFiberGetExportAllCounty();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }],
                        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                        columns: [
                            //{ 'data': 'ROWNUM' },
                            //{ 'data': 'ZIP' },
                            { 'data': 'ZIP_CO_PSA' },
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
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                'className': "text-center",
                            },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_CUSTOMERS' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

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

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                }

                function ExportSpecificPSAAddress() {
                    console.log('ExportSpecificPSAAddress');
                }

                //$('#zipCodeModal_datatable tbody').off('click').on('click', 'button', function () {
                //    //var data = table.row($(this).parents('tr')).data();
                //    alert("ZIP CO PSA");
                //});

                $('#CountyModal_datatable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var value = $(tr).find('td').eq(0)[0].innerHTML;
                    console.log('value: ' + value);
                    if (Access == "Unlimited") {
                        selectedFiberGetExport(value);
                    } else {
                        selectedFiberShowAddresses(value);
                    }
                    //alert(value);
                    return false;
                });

                function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value = value;
                    var clickButton = document.getElementById("<%= ButtonPSALocations_County.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA from table: " + value);
                }

                function selectedFiberGetExportAllCounty() {
                    if (Access == "Unlimited") {
                        var clickButton = document.getElementById("<%= ButtonPSALocationsAll_County.ClientID %>");
                        clickButton.click();
                        //console.log("Clicked PSA from table: " + value);
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();

                        document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText;

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesCounty",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'CountyVariable': CountyModalSelected }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                unitNumbersData = JSON.parse(data.d);
                                showDataCountyPSAAddresses(unitNumbersData);
                            },
                            error: function (data) {
                            }
                        })

                        clickButton.click();
                    }
                }

                function selectedFiberShowAddresses(PSAValue) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    PSACountyShowAddressesFromTableClick(PSAValue)
                }

                function PSACountyShowAddressesFromTableClick(PSAValue) {

                    var PSAVariable = PSAValue;
                    console.log('PSA: ' + PSAVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText + ' - ' + 'PSA: ' + PSAVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesCountyFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'PSAVariable': PSAVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataCountyUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataCountyUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                function showDataCountyPSAAddresses(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                //$('#zipCodeModal_datatable tr td:nth-child(1)').hover(function () {
                //    $(this).addClass('DT_pointer');
                //}, function () {
                //    $(this).removeClass('DT_pointer');
                //}
                //);

                $('#CountyModal_datatable tr').off().on('click', function () {

                    //$('#zipCodeModal_datatable tr td:eq(0)').off().on('click', function () {
                    //var visIdx = $(this).index();
                    //var dataIdx = '#zipCodeModal_datatable'.column.index('fromVisible', visIdx);

                    //console.log('index: ' + visIdx);
                    //console.log('dataIdx: ' + dataIdx);
                    //if ($(this).index() == 3) { // provide index of your column in which you prevent row click here is column of 4 index
                    //    return;
                    //} else {
                    CountymapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CountyModal_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CountyModal_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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

                $('#CountyModal_datatable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );

                //$('#zipCodeModal_datatable tbody').off('click').on('click', 'td', function () {
                //    if ($(this).index() == 3) { // provide index of your column in which you prevent row click here is column of 4 index
                //        return;
                //    } else {
                //        var row_clicked = $(this).closest('tr');
                //        var latitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                //        var longitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                //        console.log("latitudeClicked: " + latitudeClicked);
                //        console.log("longitudeClicked: " + longitudeClicked);

                //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                //        var loc = [latitudeClicked, longitudeClicked];
                //            markerOptions = {
                //                iconShape: 'doughnut',
                //                iconSize: [20, 20],
                //                borderWidth: 3,
                //                borderColor: '#ff0000'
                //        };

                //        if (ZipModalLayerGroup) {
                //            ZipModalLayerGroup.removeFrom(CountymapModal);
                //        }

                //        ZipModalLayerGroup = L.layerGroup();
                //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                //        ZipModalLayerGroup.addLayer(marker);
                //        ZipModalLayerGroup.addTo(CountymapModal);

                //        var NE_lat = Number(latitudeClicked);
                //        var NE_lng = Number(longitudeClicked);
                //        var add1 = .01
                //        var NE_lat_1 = NE_lat + add1;
                //        var NE_lng_1 = NE_lng + add1;

                //        var SW_lat = Number(latitudeClicked);
                //        var SW_lng = Number(longitudeClicked);
                //        var add1 = .01
                //        var SW_lat_1 = SW_lat - add1;
                //        var SW_lng_1 = SW_lng - add1;

                //        var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                //            northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                //            bounds = new L.LatLngBounds(southWest, northEast);                   

                //        CountymapModal.fitBounds(bounds, { padding: [.05, .05] });                   

                //        setTimeout(function () {                        
                //            ZipModalLayerGroup.removeFrom(CountymapModal);                        
                //            }, 2000);                


                //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                //        //var loc = [data.LATITUDE, data.LONGITUDE];
                //        //markerOptions = {
                //        //    iconShape: 'doughnut',
                //        //    iconSize: [20, 20],
                //        //    borderWidth: 3,
                //        //    borderColor: '#ff0000'
                //        //};

                //        //if (ZipModalLayerGroup) {
                //        //    ZipModalLayerGroup.removeFrom(CountymapModal);
                //        //}

                //        //ZipModalLayerGroup = L.layerGroup();
                //        //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                //        //ZipModalLayerGroup.addLayer(marker);
                //        //ZipModalLayerGroup.addTo(CountymapModal);

                //        //var NE_lat = Number(data.LATITUDE);
                //        //var NE_lng = Number(data.LONGITUDE);
                //        //var add1 = .01
                //        //var NE_lat_1 = NE_lat + add1;
                //        //var NE_lng_1 = NE_lng + add1;

                //        //var SW_lat = Number(data.LATITUDE);
                //        //var SW_lng = Number(data.LONGITUDE);
                //        //var add1 = .01
                //        //var SW_lat_1 = SW_lat - add1;
                //        //var SW_lng_1 = SW_lng - add1;

                //        //var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                //        //    northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                //        //    bounds = new L.LatLngBounds(southWest, northEast);

                //        //CountymapModal.fitBounds(bounds, { padding: [.05, .05] });

                //        //setTimeout(function () {
                //        //    ZipModalLayerGroup.removeFrom(CountymapModal);
                //        //}, 2000);
                //    }

                //});


                //$('#zipCodeModal_datatable tbody').on('click', 'tr', function () {
                //    var data = $('#zipCodeModal_datatable').DataTable().row(this).data();                

                //    if (CountymapModal.hasLayer(PSALocationPoints)) {
                //        PSALocationPoints.clearLayers();
                //    };

                //    var ZipLayerGroup = L.layerGroup().addTo(CountymapModal);

                //    var myStyle = {
                //        weight: 5,
                //        color: '#000000',
                //        opacity: 0.5,
                //        fillOpacity: 0.001
                //    };

                //    VpgmLayerTest = L.geoJSON(VpgmData, {
                //        style: myStyle,
                //        filter: zipFilter,
                //        onEachFeature: onEachFeature
                //    }).addTo(ZipLayerGroup);

                //    function zipFilter(feature) {
                //        if (feature.properties.ZIP == data.ZIP) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());                     

                //    function onEachFeature(feature, layer) {

                //        map.removeControl(infoZip);
                //        if (infoDatatableZip) {
                //            map.removeControl(infoDatatableZip);
                //        };

                //        setTimeout(function () {
                //            infoDatatableZip.update(layer.feature.properties);
                //        }, 1000);

                //        //infoDatatable.update(layer.feature.properties);
                //    }

                //});

                $(window).resize();

                console.log('KTDataTables CountyModalTable modal end');

            };

            function CMAModalTable(data, CMAModalSelected) {

                console.log('CMAModalSelected: ' + CMAModalSelected);

                var TopPSACount = data.length;
                var TopPSAOpportunitySum = 0;


                for (var i = 0; i < data.length; i++) {
                    TopPSAOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }

                TopPSAOpportunitySumCOMMA = TopPSAOpportunitySum.toLocaleString('en');

                document.getElementById('CMAModalSubtitlePSA').innerHTML = TopPSAOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today around these top ' + TopPSACount + ' PSAs';
                //document.getElementById('CMAModalSubtitlePSA').innerHTML = 'Top ' + TopPSACount + ' PSAs combine for ' + TopPSAOpportunitySum + ' Addresses of Opportunity to Sell Fiber Today';

                $('#CMAModal_datatable').dataTable().fnDestroy(); //destroy old table

                var table = $('#CMAModal_datatable');
                document.getElementById('<%= hf_PSALocationCMA.ClientID %>').value = CMAModalSelected;

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export Fiber Addresses from Top PSAs to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)'
                    var buttonTitleAttr = 'Show Fiber Addresses from Top PSAs (limit 3000 rows)';
                }

                console.log('KTDataTables CMA Modal begin');

                <%--var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }--%>

                //document.getElementById('CMAModalTableSubtitle1').innerHTML = CMAModalSelected;

                //console.log('SelectedSortZipModal: ' + SelectedSortZipModal)


                if (Access == "Unlimited") {
                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' Fiber Addresses' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                selectedFiberGetExportAllCMA();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }],
                        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                        columns: [
                            //{ 'data': 'ROWNUM' },
                            //{ 'data': 'ZIP' },
                            { 'data': 'ZIP_CO_PSA' },
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
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_CUSTOMERS' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

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

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                } else {
                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' Fiber Addresses' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                selectedFiberGetExportAllCMA();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }],
                        //columnDefs: [{ visible: false, searchable: false, targets: [7,8] }],
                        columns: [
                            //{ 'data': 'ROWNUM' },
                            //{ 'data': 'ZIP' },
                            { 'data': 'ZIP_CO_PSA' },
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
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                'className': "text-center",
                            },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_CUSTOMERS' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

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

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                }

                function ExportSpecificPSAAddress() {
                    console.log('ExportSpecificPSAAddress');
                }

                //$('#zipCodeModal_datatable tbody').off('click').on('click', 'button', function () {
                //    //var data = table.row($(this).parents('tr')).data();
                //    alert("ZIP CO PSA");
                //});

                $('#CMAModal_datatable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var value = $(tr).find('td').eq(0)[0].innerHTML;
                    console.log('value: ' + value);
                    if (Access == "Unlimited") {
                        selectedFiberGetExport(value);
                    } else {
                        selectedFiberShowAddresses(value);
                    }
                    //alert(value);
                    return false;
                });

                function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocationCMA.ClientID %>').value = value;
                    var clickButton = document.getElementById("<%= ButtonPSALocations_CMA.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA from table: " + value);
                }

                <%--function selectedFiberGetExportAllCMA() {
                    var clickButton = document.getElementById("<%= ButtonPSALocationsAll_CMA.ClientID %>");
                    clickButton.click();
                    //console.log("Clicked PSA from table: " + value);
                }--%>

                function selectedFiberGetExportAllCMA() {
                    if (Access == "Unlimited") {
                        var clickButton = document.getElementById("<%= ButtonPSALocationsAll_CMA.ClientID %>");
                        clickButton.click();
                        //console.log("Clicked PSA from table: " + value);
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();

                        document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected;

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesCMA",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'CMAVariable': CMAModalSelected }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                unitNumbersData = JSON.parse(data.d);
                                showDataCMAPSAAddresses(unitNumbersData);
                            },
                            error: function (data) {
                            }
                        })

                        clickButton.click();
                    }
                }

                function selectedFiberShowAddresses(PSAValue) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    PSACMAShowAddressesFromTableClick(PSAValue)
                }

                function PSACMAShowAddressesFromTableClick(PSAValue) {

                    var PSAVariable = PSAValue;
                    console.log('PSA: ' + PSAVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - ' + 'PSA: ' + PSAVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesCMAFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'PSAVariable': PSAVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataCMAUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataCMAUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                function showDataCMAPSAAddresses(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                //$('#zipCodeModal_datatable tr td:nth-child(1)').hover(function () {
                //    $(this).addClass('DT_pointer');
                //}, function () {
                //    $(this).removeClass('DT_pointer');
                //}
                //);

                $('#CMAModal_datatable tr').off().on('click', function () {

                    //$('#zipCodeModal_datatable tr td:eq(0)').off().on('click', function () {
                    //var visIdx = $(this).index();
                    //var dataIdx = '#zipCodeModal_datatable'.column.index('fromVisible', visIdx);

                    //console.log('index: ' + visIdx);
                    //console.log('dataIdx: ' + dataIdx);
                    //if ($(this).index() == 3) { // provide index of your column in which you prevent row click here is column of 4 index
                    //    return;
                    //} else {
                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CMAModal_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CMAModal_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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

                $('#CMAModal_datatable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );

                //$('#zipCodeModal_datatable tbody').off('click').on('click', 'td', function () {
                //    if ($(this).index() == 3) { // provide index of your column in which you prevent row click here is column of 4 index
                //        return;
                //    } else {
                //        var row_clicked = $(this).closest('tr');
                //        var latitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                //        var longitudeClicked = $('#zipCodeModal_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                //        console.log("latitudeClicked: " + latitudeClicked);
                //        console.log("longitudeClicked: " + longitudeClicked);

                //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                //        var loc = [latitudeClicked, longitudeClicked];
                //            markerOptions = {
                //                iconShape: 'doughnut',
                //                iconSize: [20, 20],
                //                borderWidth: 3,
                //                borderColor: '#ff0000'
                //        };

                //        if (ZipModalLayerGroup) {
                //            ZipModalLayerGroup.removeFrom(mapModal);
                //        }

                //        ZipModalLayerGroup = L.layerGroup();
                //        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                //        ZipModalLayerGroup.addLayer(marker);
                //        ZipModalLayerGroup.addTo(mapModal);

                //        var NE_lat = Number(latitudeClicked);
                //        var NE_lng = Number(longitudeClicked);
                //        var add1 = .01
                //        var NE_lat_1 = NE_lat + add1;
                //        var NE_lng_1 = NE_lng + add1;

                //        var SW_lat = Number(latitudeClicked);
                //        var SW_lng = Number(longitudeClicked);
                //        var add1 = .01
                //        var SW_lat_1 = SW_lat - add1;
                //        var SW_lng_1 = SW_lng - add1;

                //        var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                //            northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                //            bounds = new L.LatLngBounds(southWest, northEast);

                //        mapModal.fitBounds(bounds, { padding: [.05, .05] });

                //        setTimeout(function () {
                //            ZipModalLayerGroup.removeFrom(mapModal);
                //            }, 2000);


                //        //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                //        //var loc = [data.LATITUDE, data.LONGITUDE];
                //        //markerOptions = {
                //        //    iconShape: 'doughnut',
                //        //    iconSize: [20, 20],
                //        //    borderWidth: 3,
                //        //    borderColor: '#ff0000'
                //        //};

                //        //if (ZipModalLayerGroup) {
                //        //    ZipModalLayerGroup.removeFrom(mapModal);
                //        //}

                //        //ZipModalLayerGroup = L.layerGroup();
                //        //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                //        //ZipModalLayerGroup.addLayer(marker);
                //        //ZipModalLayerGroup.addTo(mapModal);

                //        //var NE_lat = Number(data.LATITUDE);
                //        //var NE_lng = Number(data.LONGITUDE);
                //        //var add1 = .01
                //        //var NE_lat_1 = NE_lat + add1;
                //        //var NE_lng_1 = NE_lng + add1;

                //        //var SW_lat = Number(data.LATITUDE);
                //        //var SW_lng = Number(data.LONGITUDE);
                //        //var add1 = .01
                //        //var SW_lat_1 = SW_lat - add1;
                //        //var SW_lng_1 = SW_lng - add1;

                //        //var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                //        //    northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                //        //    bounds = new L.LatLngBounds(southWest, northEast);

                //        //mapModal.fitBounds(bounds, { padding: [.05, .05] });

                //        //setTimeout(function () {
                //        //    ZipModalLayerGroup.removeFrom(mapModal);
                //        //}, 2000);
                //    }

                //});


                //$('#zipCodeModal_datatable tbody').on('click', 'tr', function () {
                //    var data = $('#zipCodeModal_datatable').DataTable().row(this).data();

                //    if (mapModal.hasLayer(PSALocationPoints)) {
                //        PSALocationPoints.clearLayers();
                //    };

                //    var ZipLayerGroup = L.layerGroup().addTo(mapModal);

                //    var myStyle = {
                //        weight: 5,
                //        color: '#000000',
                //        opacity: 0.5,
                //        fillOpacity: 0.001
                //    };

                //    VpgmLayerTest = L.geoJSON(VpgmData, {
                //        style: myStyle,
                //        filter: zipFilter,
                //        onEachFeature: onEachFeature
                //    }).addTo(ZipLayerGroup);

                //    function zipFilter(feature) {
                //        if (feature.properties.ZIP == data.ZIP) return true
                //    }
                //    map.fitBounds(VpgmLayerTest.getBounds());

                //    function onEachFeature(feature, layer) {

                //        map.removeControl(infoZip);
                //        if (infoDatatableZip) {
                //            map.removeControl(infoDatatableZip);
                //        };

                //        setTimeout(function () {
                //            infoDatatableZip.update(layer.feature.properties);
                //        }, 1000);

                //        //infoDatatable.update(layer.feature.properties);
                //    }

                //});

                $(window).resize();

                console.log('KTDataTables zip modal2 end');
                groupByFilter();

            };

            function ZIPMDUTable(data, ZipCodeModalSelected) {

                var MDUCount = data.length;
                var MDUOpportunitySum = 0;

                for (var i = 0; i < data.length; i++) {
                    MDUOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }
                MDUOpportunitySumCOMMA = MDUOpportunitySum.toLocaleString('en');

                document.getElementById('ZIPModalSubtitleMDU').innerHTML = MDUOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today at these ' + MDUCount + ' Single Address MDUs';

                $('#ZIPModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                var table = $('#ZIPModal_MDUtable');
                document.getElementById('<%= hf_SelectedMDU_ZIP.ClientID %>').value = ZipCodeModalSelected;

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export High Opportunity MDUs (Single Address) to Excel';
                    var buttonTitleAttr2 = 'Export Unit Numbers from High Opportunity MDUs to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)';
                    var buttonTitleAttr = 'Show High Opportunity MDUs (Single Address) in Table (limit 3000 rows)';
                    var buttonTitleAttr2 = 'Show Unit Numbers from High Opportunity MDUs in Table (limit 3000 rows)';
                }

                // begin first table
                if (Access == "Unlimited") {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' High Opportunity MDUs' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopMDUsExport_Zip();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        },
                        {
                            text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                            titleAttr: buttonTitleAttr2,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopMDUAddressesExport_Zip();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'ZIP_RANK' },
                            { 'data': 'HOUSE_NUMBER', 'className': "text-center" },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT', 'className': "text-center" },
                            { 'data': 'FIBER_AVAILABLE', 'className': "text-center" },
                            { 'data': 'FIBER_OPPORTUNITY', 'className': "text-center" },
                            { 'data': 'FIBER_PENETRATION_RATE', 'className': "text-center" },
                            { 'data': 'MARKET_RANK' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                } else {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [
                            {
                                text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                                titleAttr: buttonTitleAttr2,
                                className: 'btn btn-primary',
                                action: function (e, dt, node, config) {
                                    TopMDUAddressesExport_Zip();
                                }
                                //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            }
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                'className': "text-center",
                            },
                            { 'data': 'ZIP_RANK' },
                            { 'data': 'HOUSE_NUMBER', 'className': "text-center" },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT', 'className': "text-center" },
                            { 'data': 'FIBER_AVAILABLE', 'className': "text-center" },
                            { 'data': 'FIBER_OPPORTUNITY', 'className': "text-center" },
                            { 'data': 'FIBER_PENETRATION_RATE', 'className': "text-center" },
                            { 'data': 'MARKET_RANK' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                }

                function ExportSpecificPSAAddress() {
                    console.log('ExportSpecificPSAAddress');
                }


                $('#ZIPModal_MDUtable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var housenumber = $(tr).find('td').eq(2)[0].innerHTML;
                    var streetname = $(tr).find('td').eq(3)[0].innerHTML;
                    if (Access == "Unlimited") {
                        selectedMDUGetAddresses_Zip(housenumber, streetname);
                        console.log("Clicked MDU from table: " + housenumber + ' ' + streetname);
                    } else {
                        selectedMDUShowAddresses_Zip(housenumber, streetname);
                        console.log("Clicked MDU from table: " + housenumber + ' ' + streetname);
                    }
                    //alert(value);
                    return false;
                });

                function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = value;
                    var clickButton = document.getElementById("<%= ButtonPSALocationsZip.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA from table: " + value);
                }

                function selectedFiberGetExportAllZIP() {
                    var clickButton = document.getElementById("<%= ButtonPSALocationsZip.ClientID %>");
                    clickButton.click();
                    //console.log("Clicked PSA from table: " + value);
                }

                function selectedMDUGetAddresses_Zip(housenumber, streetname) {
                    document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = housenumber;
                    document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = streetname;
                    console.log("*******housenumber" + housenumber);
                    console.log("*******streetname" + streetname);
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUAddresses_ZIP.ClientID %>");
                    clickButton.click();

                }

                function selectedMDUShowAddresses_Zip(housenumber, streetname) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    MDUShowAddressesFromTableClick(housenumber, streetname)
                }

                function MDUShowAddressesFromTableClick(housenumber, streetname) {

                    var houseNumberVariable = housenumber;
                    var streetNameVariable = streetname;
                    console.log('houseNumberVariable: ' + houseNumberVariable);
                    console.log('streetNameVariable: ' + streetNameVariable);
                    console.log('ZipCodeModalSelected: ' + ZipCodeModalSelected);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - ' + houseNumberVariable + ' ' + streetNameVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesZipFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'ZipVariable': ZipCodeModalSelected, 'houseVariable': houseNumberVariable, 'streetVariable': streetNameVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataMDUUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function TopMDUsExport_Zip() {
                    console.log('Top MDU Zip Export Triggered');
                    var clickButton = document.getElementById("<%= ButtonTopMDUs_ZIP.ClientID %>");
                    clickButton.click();
                }

                function TopMDUAddressesExport_Zip() {
                    if (Access == "Unlimited") {
                        console.log('Top MDU Addresses Export Triggered');
                        var clickButton = document.getElementById("<%= ButtonTopMDUAddresses_ZIP.ClientID %>");
                        clickButton.click();
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();

                        document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - MDUs';

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesZip",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'ZipVariable': ZipCodeModalSelected }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                unitNumbersData = JSON.parse(data.d);
                                showDataMDUUnitNumbers(unitNumbersData);
                            },
                            error: function (data) {
                            }
                        })

                        clickButton.click();
                    }
                }

                function showDataMDUUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }


                $('#ZIPModal_MDUtable tr').off().on('click', function () {

                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#ZIPModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#ZIPModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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

                    ZIPModalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                    ZIPModalLayerGroup.addLayer(marker);
                    ZIPModalLayerGroup.addTo(mapModal);

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
                        ZIPModalLayerGroup.removeFrom(mapModal);
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

                console.log('KTDataTables zip modal3 end');
                groupByFilter();

            };

            function CountyMDUTable(data, CountyModalSelected) {

                var MDUCount = data.length;
                var MDUOpportunitySum = 0;

                for (var i = 0; i < data.length; i++) {
                    MDUOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }
                MDUOpportunitySumCOMMA = MDUOpportunitySum.toLocaleString('en');

                //document.getElementById('CountyModalSubtitleMDU').innerHTML = MDUCount + ' High Opportunity MDUs combine for ' + MDUOpportunitySum + ' Addresses to Sell Fiber Today';
                document.getElementById('CountyModalSubtitleMDU').innerHTML = MDUOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today at these ' + MDUCount + ' Single Address MDUs';

                $('#CountyModal_MDUtable').dataTable().fnDestroy(); //destroy old table                

                var table = $('#CountyModal_MDUtable');
                document.getElementById('<%= hf_SelectedMDU_County.ClientID %>').value = CountyModalSelected;

                //document.getElementById('CountyModalTableSubtitle1').innerHTML = CountyModalSelected;

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export High Opportunity MDUs (Single Address) to Excel';
                    var buttonTitleAttr2 = 'Export Unit Numbers from High Opportunity MDUs to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)';
                    var buttonTitleAttr = 'Show High Opportunity MDUs (Single Address) in Table (limit 3000 rows)';
                    var buttonTitleAttr2 = 'Show Unit Numbers from High Opportunity MDUs in Table (limit 3000 rows)';
                }

                // begin first table
                if (Access == "Unlimited") {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' High Opportunity MDUs' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopMDUsExport_County();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        },
                        {
                            text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                            titleAttr: buttonTitleAttr2,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopMDUAddressesExport_County();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }
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
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'COUNTY_RANK' },
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' },
                            { 'data': 'MARKET_RANK' }
                            //{ 'data': 'LATITUDE', visible: false },
                            //{ 'data': 'LONGITUDE', visible: false }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                    } else {
                            table.DataTable({
                                //responsive: true,
                                data: data,
                                paging: false,
                                //deferRender: true,
                                scrollY: '300px',
                                scrollCollapse: true,
                                scrollX: true,
                                //scroller: true,
                                sort: false,
                                //order: [[4, "desc"]],
                                dom: 'Brtlifp',
                                buttons: [
                                    {
                                        text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                                        titleAttr: buttonTitleAttr2,
                                        className: 'btn btn-primary',
                                        action: function (e, dt, node, config) {
                                            TopMDUAddressesExport_County();
                                        }
                                        //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                                    }
                                ],
                                columnDefs: [{ width: 50, targets: [0, 1, 2, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                                columns: [                                    
                                    {
                                        'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                        'className': "text-center",
                                    },
                                    { 'data': 'COUNTY_RANK' },
                                    { 'data': 'HOUSE_NUMBER' },
                                    { 'data': 'STREET_NAME' },
                                    { 'data': 'CITY' },
                                    { 'data': 'STATE' },
                                    { 'data': 'WIRELESS_SCORE_TEXT' },
                                    { 'data': 'FIBER_AVAILABLE' },
                                    { 'data': 'FIBER_OPPORTUNITY' },
                                    { 'data': 'FIBER_PENETRATION_RATE' },
                                    { 'data': 'MARKET_RANK' }                                    
                                    //{ 'data': 'LATITUDE', visible: false },
                                    //{ 'data': 'LONGITUDE', visible: false }
                                ],

                                initComplete: function () {
                                    this.api().columns().header().each(function (th) {
                                        $(th).removeClass("sorting_asc");
                                        $(th).removeClass("sorting");
                                    });
                                },

                            });
                    }




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
                    console.log('ExportSpecificPSAAddress');
                }


                $('#CountyModal_MDUtable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var housenumber = $(tr).find('td').eq(2)[0].innerHTML;
                    var streetname = $(tr).find('td').eq(3)[0].innerHTML;
                    if (Access == "Unlimited") {
                        selectedMDUGetAddresses(housenumber, streetname);
                        console.log("Clicked MDU from table: " + housenumber + ' ' + streetname);
                    } else {
                        selectedMDUShowAddresses(housenumber, streetname);
                        console.log("Clicked MDU from table: " + housenumber + ' ' + streetname);
                    }
                    return false;
                });

                function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocationCounty.ClientID %>').value = value;
                    var clickButton = document.getElementById("<%= ButtonPSALocations_County.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA from table: " + value);
                }

                function selectedFiberGetExportAllCounty() {
                    var clickButton = document.getElementById("<%= ButtonPSALocationsAll_County.ClientID %>");
                    clickButton.click();
                    //console.log("Clicked PSA from table: " + value);
                }

                function selectedMDUGetAddresses(housenumber, streetname) {
                    document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = housenumber;
                    document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = streetname;
                    console.log("*******housenumber" + housenumber);
                    console.log("*******streetname" + streetname);
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUAddresses_County.ClientID %>");
                    clickButton.click();

                }

                function TopMDUsExport_County() {
                        console.log('Top MDU Export Triggered');
                        var clickButton = document.getElementById("<%= ButtonTopMDUs_County.ClientID %>");
                        clickButton.click();                    
                }

                function TopMDUAddressesExport_County() {
                    if (Access == "Unlimited") {
                        console.log('Top MDU Addresses Export Triggered');
                        var clickButton = document.getElementById("<%= ButtonTopMDUAddresses_County.ClientID %>");
                        clickButton.click();
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();

                        document.getElementById('showDataModalTitle').innerHTML = 'County FIPS: ' + CountyModalSelected + ' - MDUs';

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesCounty",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'CountyVariable': CountyModalSelected }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                unitNumbersData = JSON.parse(data.d);
                                showDataMDUUnitNumbers(unitNumbersData);
                            },
                            error: function (data) {
                            }
                        })

                        clickButton.click();
                    }
                }

                function selectedMDUShowAddresses(housenumber, streetname) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    MDUShowAddressesFromTableClick(housenumber, streetname)
                }

                function MDUShowAddressesFromTableClick(housenumber, streetname) {

                    var houseNumberVariable = housenumber;
                    var streetNameVariable = streetname;
                    console.log('houseNumberVariable: ' + houseNumberVariable);
                    console.log('streetNameVariable: ' + streetNameVariable);
                    console.log('CountyModalSelected: ' + CountyModalSelected);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText + ' - ' + houseNumberVariable + ' ' + streetNameVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesCountyFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CountyVariable': CountyModalSelected, 'houseVariable': houseNumberVariable, 'streetVariable': streetNameVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataMDUUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataMDUUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                


                $('#CountyModal_MDUtable tr').off().on('click', function () {


                    CountymapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CountyModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CountyModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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

                console.log('KTDataTables CountyMDUTable modal end');

            };

            function CMAMDUTable(data, CMAModalSelected) {


                var MDUCount = data.length;
                var MDUOpportunitySum = 0;


                for (var i = 0; i < data.length; i++) {
                    MDUOpportunitySum += parseInt(data[i].FIBER_OPPORTUNITY);
                }
                MDUOpportunitySumCOMMA = MDUOpportunitySum.toLocaleString('en');

                //document.getElementById('CMAModalSubtitleMDU').innerHTML = MDUCount + ' High Opportunity MDUs combine for ' + MDUOpportunitySum + ' Addresses to Sell Fiber Today';
                document.getElementById('CMAModalSubtitleMDU').innerHTML = MDUOpportunitySumCOMMA + ' Opportunities to Sell Fiber Today at these ' + MDUCount + ' Single Address MDUs';

                $('#CMAModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                var table = $('#CMAModal_MDUtable');
                document.getElementById('<%= hf_SelectedMDU_CMA.ClientID %>').value = CMAModalSelected;             

                //document.getElementById('CMAModalTableSubtitle1').innerHTML = CMAModalSelected;

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export High Opportunity MDUs (Single Address) to Excel';
                    var buttonTitleAttr2 = 'Export Unit Numbers from High Opportunity MDUs to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = ' (limit 3000 rows)';
                    var buttonTitleAttr = 'Show High Opportunity MDUs (Single Address) in Table (limit 3000 rows)';
                    var buttonTitleAttr2 = 'Show Unit Numbers from High Opportunity MDUs in Table (limit 3000 rows)';
                }

                // begin first table
                if (Access == "Unlimited") {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' High Opportunity MDUs' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopMDUsExport();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        },
                        {
                            text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                            titleAttr: buttonTitleAttr2,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopMDUAddressesExport();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 5, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { width: 150, targets: [3] }, { width: 100, targets: [3] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'CMA_RANK' },
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' },
                            { 'data': 'MARKET_RANK' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                } else {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [
                            {
                                text: buttonText + ' Unit Numbers from MDUs' + buttonText2,
                                titleAttr: buttonTitleAttr2,
                                className: 'btn btn-primary',
                                action: function (e, dt, node, config) {
                                    TopMDUAddressesExport();
                                }
                                //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            }
                        ],
                        columnDefs: [{ width: 50, targets: [0, 1, 2, 5, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { width: 150, targets: [3] }, { width: 100, targets: [3] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                'className': "text-center",
                            },
                            { 'data': 'CMA_RANK' },
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_AVAILABLE' },
                            { 'data': 'FIBER_OPPORTUNITY' },
                            { 'data': 'FIBER_PENETRATION_RATE' },
                            { 'data': 'MARKET_RANK' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                }

                function ExportSpecificPSAAddress() {
                    console.log('ExportSpecificPSAAddress');
                }


                $('#CMAModal_MDUtable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var housenumber = $(tr).find('td').eq(2)[0].innerHTML;
                    var streetname = $(tr).find('td').eq(3)[0].innerHTML;
                    if (Access == "Unlimited") {
                        selectedMDUGetAddresses(housenumber, streetname);                        
                    } else {
                        selectedMDUShowAddresses(housenumber, streetname);
                    }
                    return false;
                });                

                function selectedMDUGetAddresses(housenumber, streetname) {
                    document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = housenumber;
                    document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = streetname;
                    console.log("*******housenumber" + housenumber);
                    console.log("*******streetname" + streetname);
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUAddresses.ClientID %>");
                    clickButton.click();

                }

                function TopMDUsExport() {
                    console.log('Top MDU Export Triggered');
                    var clickButton = document.getElementById("<%= ButtonTopMDUs.ClientID %>");
                    clickButton.click();
                }

                function TopMDUAddressesExport() {
                    if (Access == "Unlimited") {
                        console.log('Top MDU Addresses Export Triggered');
                        var clickButton = document.getElementById("<%= ButtonTopMDUAddresses.ClientID %>");
                        clickButton.click();
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();

                        document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - MDUs';                        

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesCMA",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'CMAVariable': CMAModalSelected }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                unitNumbersData = JSON.parse(data.d);
                                showDataMDUUnitNumbers(unitNumbersData);
                            },
                            error: function (data) {
                            }
                        })

                        clickButton.click();
                    }
                }

                function selectedMDUShowAddresses(housenumber, streetname) {
                    var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                    clickButton.click();
                    MDUShowAddressesFromTableClick(housenumber, streetname)
                }

                function MDUShowAddressesFromTableClick(housenumber, streetname) {

                    var houseNumberVariable = housenumber;
                    var streetNameVariable = streetname;                    
                    console.log('houseNumberVariable: ' + houseNumberVariable);
                    console.log('streetNameVariable: ' + streetNameVariable);
                    console.log('CMAModalSelected: ' + CMAModalSelected);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();
                    
                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - ' + houseNumberVariable + ' ' + streetNameVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesCMAFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': CMAModalSelected, 'houseVariable': houseNumberVariable, 'streetVariable': streetNameVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataMDUUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataMDUUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }


                $('#CMAModal_MDUtable tr').off().on('click', function () {


                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CMAModal_MDUtable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CMAModal_MDUtable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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

                console.log('KTDataTables zip modal4 end');
               

            };

            function CMABusinessTable(data, CMAModalSelected) {


                var BusinessCount = data.length;
                var BusinessOpportunitySum = 0;


                for (var i = 0; i < data.length; i++) {
                    BusinessOpportunitySum += parseInt(data[i].TENANT_COUNT);
                }
                BusinessOpportunitySumCOMMA = BusinessOpportunitySum.toLocaleString('en');
                
                document.getElementById('CMAModalSubtitleBusiness').innerHTML = BusinessOpportunitySumCOMMA + ' Tenants at these ' + BusinessCount + ' Business Locations';

                $('#CMAModal_Businesstable').dataTable().fnDestroy(); //destroy old table

                var table = $('#CMAModal_Businesstable');
                document.getElementById('<%= hf_SelectedBusiness_CMA.ClientID %>').value = CMAModalSelected;                

                if (Access == "Unlimited") {
                    var buttonText = 'Export';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Export Top Business Locations to Excel';
                    var buttonTitleAttr2 = 'Export Tenants from Business Locations to Excel';
                } else {
                    var buttonText = 'Show';
                    var buttonText2 = '';
                    var buttonTitleAttr = 'Show Top Business Locations in Table';
                    var buttonTitleAttr2 = 'Show Tenants from Business Locations in Table';
                }

                // begin first table
                if (Access == "Unlimited") {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [{
                            text: buttonText + ' Top Business Locations' + buttonText2,
                            titleAttr: buttonTitleAttr,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopBusinessExport();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        },
                        {
                            text: buttonText + ' Tenants from Business Locations' + buttonText2,
                            titleAttr: buttonTitleAttr2,
                            className: 'btn btn-primary',
                            action: function (e, dt, node, config) {
                                TopBusinessTenantExport();
                            }
                            //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                        }
                        ],
                        //columnDefs: [{ width: 50, targets: [0, 1, 2, 5, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { width: 150, targets: [3] }, { width: 100, targets: [3] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Excel</button>",
                                'className': "text-center",
                            },
                            { 'data': 'CMA_RANK' },
                            { 'data': 'ADDRESS' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_STATUS' },                            
                            { 'data': 'TENANT_COUNT' },
                            { 'data': 'TENANT1_TABLE' },
                            { 'data': 'TENANT2_TABLE' },
                            { 'data': 'TENANT3_TABLE' },
                            { 'data': 'MARKET_RANK' },
                            { 'data': 'MIKEY' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                } else {
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'Brtlifp',
                        buttons: [
                            {
                                text: buttonText + ' Tenants from Business Locations' + buttonText2,
                                titleAttr: buttonTitleAttr2,
                                className: 'btn btn-primary',
                                action: function (e, dt, node, config) {
                                    TopBusinessTenantExport();
                                }
                                //extend: 'csv', text: 'Export All Fiber Addresses in ZIP', titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel', title: 'All_Fiber_Addresses_For_ZIP_' + ZipCodeModalSelected
                            }
                        ],
                        //columnDefs: [{ width: 50, targets: [0, 1, 2, 5, 10] }, { width: 55, targets: [6, 7, 8, 9] }, { width: 150, targets: [3] }, { width: 100, targets: [3] }, { className: "dt-center", targets: [1, 6, 7, 8, 9, 10] }],
                        columns: [
                            {
                                'defaultContent': "<button class='btn btn-primary btn-xsm'>Show List</button>",
                                'className': "text-center",
                            },
                            { 'data': 'CMA_RANK' },
                            { 'data': 'ADDRESS' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE_TEXT' },
                            { 'data': 'FIBER_STATUS' },
                            { 'data': 'TENANT_COUNT' },
                            { 'data': 'TENANT1_TABLE' },
                            { 'data': 'TENANT2_TABLE' },
                            { 'data': 'TENANT3_TABLE' },
                            { 'data': 'MARKET_RANK' },
                            { 'data': 'MIKEY' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },

                    });
                }

                function ExportSpecificPSAAddress() {
                    console.log('ExportSpecificPSAAddress');
                }


                $('#CMAModal_Businesstable tbody').off().on('click', 'button', function () {
                    var tr = $(this).closest('tr');
                    var mikey = $(tr).find('td').eq(13)[0].innerHTML;
                    if (Access == "Unlimited") {
                        selectedBusinessGetAddresses(mikey);
                    } else {
                        selectedBusinessShowAddresses(mikey);
                    }
                    return false;
                });

                function selectedBusinessGetAddresses(mikey) {
                    document.getElementById('<%= hf_SelectedBusiness_CMA_Mikey.ClientID %>').value = mikey;
                    console.log("*******mikey" + mikey);
                    var clickButton = document.getElementById("<%= ButtonSelectedBusinessTenants.ClientID %>");
                    clickButton.click();

                }

                function TopBusinessExport() {
                    console.log('Top Business Export Triggered');
                    var clickButton = document.getElementById("<%= ButtonTopBusiness.ClientID %>");
                    clickButton.click();
                }

                function TopBusinessTenantExport() {
                    if (Access == "Unlimited") {
                        console.log('Top Business Tenant Export Triggered');
                        var clickButton = document.getElementById("<%= ButtonTopBusinessTenants.ClientID %>");
                        clickButton.click();
                    } else {
                        var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");

                        $('#showDataModalTableDiv').hide();
                        $('#LOADING_showData_Modal').show();                        

                        document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - Business Tenants';                        

                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "Sales_Opportunity_TestingV2.aspx/showData_BusinessTenantsCMA",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'CMAVariable': CMAModalSelected }),
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                tenantsData = JSON.parse(data.d);
                                showDataBusinessTenants(tenantsData);
                            },
                            error: function (data) {
                            }
                        })

                        clickButton.click();
                    }
                }

                function selectedBusinessShowAddresses(mikey) {
                    var clickButton = document.getElementById("<%= ButtonSelectedBusinessShowTenants.ClientID %>");
                    clickButton.click();
                    BusinessShowTenantsFromTableClick(mikey)
                }

                function BusinessShowTenantsFromTableClick(mikey) {

                    var mikeyVariable = mikey;
                    console.log('mikeyVariable: ' + mikeyVariable);
                    console.log('CMAModalSelected: ' + CMAModalSelected);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAModalSelected + ' - MIKEY: ' + mikeyVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_BusinessTenantsCMAFromTable",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': CMAModalSelected, 'mikeyVariable': mikeyVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            tenantsData = JSON.parse(data.d);
                            showDataBusinessTenants(tenantsData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataBusinessTenants(data) {
                    console.log('showDataModal_Businesstable');

                    $('#showDataModal_Businesstable').dataTable().fnDestroy(); //destroy old table
                    
                    $('#LOADING_showData_Modal').hide();                    
                    $('#showDataModalTableDiv').show();
                    
                    groupByFilter();

                    var table = $('#showDataModal_Businesstable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        //columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'MIKEY' },
                            { 'data': 'CMA' },
                            { 'data': 'FIBER_STATUS' },
                            { 'data': 'ADDRESS' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'TENANT_COUNT' },
                            { 'data': 'TENANT1' },
                            { 'data': 'TENANT2' },
                            { 'data': 'TENANT3' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }


                $('#CMAModal_Businesstable tr').off().on('click', function () {


                    mapModal.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#CMAModal_Businesstable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#CMAModal_Businesstable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

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

                $('#CMAModal_Businesstable tr').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                }
                );


                $(window).resize();

                console.log('CMA Modal Business Table End');


            };

            function ExportAll_CMAs() {
                console.log('ExportAll_CMAs');
                var clickButton = document.getElementById("<%= ButtonFCExportCMAs.ClientID %>");
                clickButton.click();
            }

            function ExportAll_Counties() {
                console.log('ExportAll_Counties');
                var clickButton = document.getElementById("<%= ButtonFCExportCounties.ClientID %>");
                clickButton.click();
            }

            function ExportAll_Zips() {
                console.log('ExportAll_Zips');
                var clickButton = document.getElementById("<%= ButtonFCExportZips.ClientID %>");
                clickButton.click();
            }


            //function getGeometry(VpgmData, idProperty) {

            //        VpgmLayerTest = L.geoJSON(VpgmData, { filter: zipFilter });
            //        function zipFilter(feature) {
            //            if (feature.properties.ZIP == idProperty) return true
            //        }
            //        map.fitBounds(VpgmLayerTest.getBounds());

            //    };

            function GET_MAP_THEME_DATA(storeData, marketType, GroupBy, marketGeoJSONName) {
                console.log('GET_MAP_THEME_DATA function start');
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var countyGeo;


                if (groupGeo == 'SALES') {
                    if (marketType == 'NATIONAL') {
                        //National can only be CMA level
                         
                        $.when(

                            $.ajax({
                                type: "POST",
                                async: true,
                                url: "Sales_Opportunity_TestingV2.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
                                data: JSON.stringify({'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                success: function (data) {
                                    Data1 = data.d;
                                    theme_data = JSON.parse(Data1);
                                },
                                error: function (data) {
                                }
                            }),

                            //improvement_needed - is there ever a benefit of automatically refreshing geojsons? Probably just manually update whenever needed?
                            $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_081820.json", function (data) {
                                VpgmData3 = data;
                            }),

                            $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
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

                                    }
                                });
                            });

                            storeMapV3_National(storeData, VpgmData3, MarketBoundaryData, marketType);
                        });

                    } else if (marketType == 'REGION') {
                        //Regional can be shown by County or CMA
                        
                        if (GroupBy == 'COUNTY') {

                            countyGeo = marketGeo;
                            
                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_Opportunity_TestingV2.aspx/Get_county_theme_data",  //use a function from C# , change this for different data return
                                    data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        Data1 = data.d;
                                        theme_data = JSON.parse(Data1);
                                    },
                                    error: function (data) {
                                    }
                                }),

                                $.getJSON("SalesVpgmCounties/" + countyGeo + "_COUNTY_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                    VpgmData2 = data;


                                }),

                                $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                }),

                            ).then(function () {

                               

                                VpgmData2.features.forEach(function (element) {
                                    theme_data.find(function (newElement) {
                                        if (element.properties.Cnty_FIPS == newElement.CNTY_FIPS) {
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
                                        }
                                    });
                                });

                                storeMapV3_Region(storeData, VpgmData2, MarketBoundaryData);
                            });
                        }

                        else if (GroupBy == 'CMA') {

                            countyGeo = marketGeo;

                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_Opportunity_TestingV2.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
                                    data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        Data1 = data.d;
                                        theme_data = JSON.parse(Data1);
                                    },
                                    error: function (data) {
                                    }
                                }),

                                $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_081820.json", function (data) {
                                    VpgmData3 = data;
                                }),

                                $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
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

                                        }
                                    });
                                });

                                //improvement_needed - is it possible to filter to show just the selected Region's CMAs here? 
                                //How do we get Region info from the CMA properties ? Is it better to filter later, in leaflet?
                                console.log('VpgmData3');
                                console.log(VpgmData3);
                                console.log('VpgmData3.features');
                                console.log(VpgmData3.features);

                                storeMapV3_National(storeData, VpgmData3, MarketBoundaryData, marketType);
                            });
                        }

                    } else if (marketType == 'MARKET') {
                        //Market can be shown by Zip, County, or CMA

                        //improvement_needed - how do we more automatically check to see if we have fiber for the given market?
                        if (marketGeoJSONName == 'FLORIDA' | marketGeoJSONName == 'GEORGIA SOUTH CAROLINA' | marketGeoJSONName == 'GREATER LAKES' | marketGeoJSONName == 'GULF STATES' | marketGeoJSONName == 'HEARTLAND STATES' | marketGeoJSONName == 'KAMO' |
                            marketGeoJSONName == 'MID-ATLANTIC' | marketGeoJSONName == 'NORTHERN CALIFORNIA' | marketGeoJSONName == 'NTX' | marketGeoJSONName == 'OHIO PENNSYLVANIA' | marketGeoJSONName == 'SOUTHERN CALIFORNIA' | marketGeoJSONName == 'STX') {

                            document.getElementById('mapcountwarning').innerHTML = "";
                            document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + $('#<%= ddlMarket.ClientID %> option:selected').text();
                            document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";

                            if (GroupBy == 'ZIP') {
                                //zip can only be shown for markets, dont need market type variable

                                console.log('marketGeo' + marketGeo);

                                $.when(

                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "Sales_Opportunity_TestingV2.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
                                        data: JSON.stringify({ 'marketVariable': marketGeo }),
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        success: function (data) {
                                            Data1 = data.d;
                                            theme_data = JSON.parse(Data1);
                                        },
                                        error: function (data) {
                                        }
                                    }),

                                    $.getJSON("SalesVpgmZips/" + marketGeoJSONName + "_ZIP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                        VpgmData = data;
                                    }),

                                    $.getJSON("PSALocations/" + marketGeoJSONName + "_PSA_GEOJSON.json", function (data) {
                                        PSAData = data;
                                    }),

                                    //$.getJSON("PSALocations/" + marketGeoJSONName + "_PSA_GEOJSON.json", function (data) {
                                    //    PSAData2 = data;
                                    //}),

                                    $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
                                        MarketBoundaryData = data;
                                        //prep(MarketBoundaryData);
                                    }),


                                ).then(function () {

                                    console.log('GET_MAP_THEME_DATA function check1');

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

                                    console.log('GET_MAP_THEME_DATA function check2');

                                    //storeMap(VpgmData, theme_data);

                                    storeMapV3_Market(VpgmData, storeData, MarketBoundaryData, PSAData);
                                });
                            }

                            //improvement_needed - how do we assign markets to regions in a better way than listing them here? Listing requires maintenance.
                            else if (GroupBy == 'COUNTY') {

                                 countyGeo = "CENTRAL";
                                if (marketGeoJSONName == 'FLORIDA' | marketGeoJSONName == 'GEORGIA SOUTH CAROLINA' | marketGeoJSONName == 'MID-ATLANTIC' | marketGeoJSONName == 'OHIO PENNSYLVANIA' | marketGeoJSONName == 'HEARTLAND STATES') {
                                    countyGeo = "EAST";
                                }

                                if (marketGeoJSONName == 'NORTHERN CALIFORNIA' | marketGeoJSONName == 'SOUTHERN CALIFORNIA') {
                                    countyGeo = "WEST";
                                }

                                $.when(

                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "Sales_Opportunity_TestingV2.aspx/Get_county_theme_data",  //use a function from C# , change this for different data return
                                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        success: function (data) {
                                            Data1 = data.d;
                                            theme_data = JSON.parse(Data1);
                                        },
                                        error: function (data) {
                                        }
                                    }),

                                    $.getJSON("SalesVpgmCounties/" + countyGeo + "_COUNTY_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                        VpgmData2 = data;

                                    }),

                                    $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
                                        MarketBoundaryData = data;
                                    }),


                                ).then(function () {

                                    

                                    for (var i = 0; i < VpgmData2.features.length; i++)
                                    {
                                        //improvement_needed - update regional county geojson to have property name of SALES_MARKET, make sure market names are consistant
                                        if (VpgmData2.features[i].properties.Sales_Mark != marketGeo)
                                        {
                                            VpgmData2.features.splice(i, 1);
                                            i--; //otherwise it will skip the next element after removing an index. Ex: After removing index at i = 2, need to check the new i = 2 which was previously i = 3
                                        }
                                    }


                                    VpgmData2.features.forEach(function (element) {
                                        theme_data.find(function (newElement) {
                                            if (element.properties.Cnty_FIPS == newElement.CNTY_FIPS) {
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

                                            }
                                        });
                                    });

                                    storeMapV3_Region(storeData, VpgmData2, MarketBoundaryData);

                                });
                            }

                            else if (GroupBy == 'CMA') {

                                $.when(

                                    $.ajax({
                                        type: "POST",
                                        async: true,
                                        url: "Sales_Opportunity_TestingV2.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
                                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType }),
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        success: function (data) {
                                            Data1 = data.d;
                                            theme_data = JSON.parse(Data1);
                                        },
                                        error: function (data) {
                                        }
                                    }),

                                    $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_081820.json", function (data) {
                                        VpgmData3 = data;
                                    }),

                                    $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
                                        MarketBoundaryData = data;
                                    }),

                                ).then(function () {

                                    console.log(VpgmData3.features[0].properties);

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

                                            }
                                        });
                                    });

                                    storeMapV3_National(storeData, VpgmData3, MarketBoundaryData, marketType);
                                });
                            }

                        } else {

                            document.getElementById('mapcountwarning').innerHTML = "No fiber found in this market - No current fiber sales opportunities exist.";
                            document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text();
                            document.getElementById('mapcountsubtitle').innerHTML = "";

                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_Opportunity_TestingV2.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
                                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    success: function (data) {
                                        Data1 = data.d;
                                        theme_data = JSON.parse(Data1);
                                    },
                                    error: function (data) {
                                    }
                                }),

                                $.getJSON("SalesVpgmZips/" + marketGeo + "_ZIP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                    VpgmData = data;
                                }),

                                //$.getJSON("PSALocations/" + marketGeo + "_PSA_GEOJSON.json", function (data) {
                                //    PSAData = data;
                                //}),

                                $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
                                    MarketBoundaryData = data;
                                    //prep(MarketBoundaryData);
                                }),


                            ).then(function () {

                                console.log('GET_MAP_THEME_DATA function check1 alt');

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

                                        }
                                    });
                                });

                                console.log('GET_MAP_THEME_DATA function check2 alt');




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
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail2",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Store_Detail3",  //use a function from C# , change this for different data return
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
                //    url: "Sales_Opportunity_TestingV2.aspx/Get_Master_Data",  //use a function from C# , change this for different data return
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




            var storeMapV3_Market = function (VpgmData, storeData, MarketBoundaryData, PSAData) {

                $('#buttonrowzip').show();
                $('#MapDiv').show();
                $('#zipTableDiv').show();
                $('#LOADING1').hide();
                if (PSAData == 'NoPSAData') {
                    $('#zipfooter').hide();
                    $('#zipfooter2').show();
                } else {
                    if (Access == "Unlimited") {
                        $('#zipfooter3').hide();
                        $('#zipfooter').show();
                    } else {
                        $('#zipfooter').hide();
                        $('#zipfooter3').show();
                    }

                }

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var ATTR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = storeData.filter(function (el) {
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


                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //    }),
                var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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
                        layers: [streets, ATTRstorePoints, ARstorePoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else {
                    PSALayer = L.vectorGrid.slicer(PSAData, {
                        rendererFactory: L.canvas.tile,
                        zIndex: 7,
                        maxZoom: 19,
                        vectorTileLayerStyles: {

                            sliced: function (properties, zoom) {
                                //icon: L.BeautifyIcon.icon(PSAIconOptions);
                                var p = properties.WIRELESS_SCORE;
                                return {
                                    color: p === 5 ? '#003300' :
                                        p === 4 ? '#008000' :
                                            p === 3 ? '#00cc00' :
                                                p === 2 ? '#ffff00' :
                                                    p === 1 ? '#e6b800' :
                                                        '#ffffff',
                                    opacity: 1,
                                    fill: true,
                                    radius: 3,
                                    fillOpacity: 1.0

                                    ////weight: 5,
                                    ////color: '#00008b',
                                    //opacity: 1,
                                    //fillColor: '#87cefa',
                                    //fill: true,
                                    //radius: 3,
                                    //fillOpacity: 1.0
                                }
                            }
                        },
                        interactive: true,	// Make sure that this VectorGrid fires mouse/pointer events
                        getFeatureId: function (f) {
                            return f.properties.Zip_CO_PSA;
                        }
                    }).on('click', function (e) {
                        console.log('clickclickclick');

                    });

                    map = L.map("storemapid", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        layers: [streets, ATTRstorePoints, ARstorePoints, PSALayer],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });

                    map.on('enterFullscreen', function () {
                        //console.log('enter Fullscreen');
                        ZipFullScreenState = 1;
                    });

                    map.on('exitFullscreen', function () {
                        //console.log('exit Fullscreen');
                        ZipFullScreenState = 0;
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
                    featureLayer.bindPopup(feature.properties.VPGM_Markt);
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

                    //console.log("props: " + props);

                    var TOTALPOPSCOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var zipTouchLink;

                    if (props) {
                        TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
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

                    this._div.innerHTML = '<h4>Zip Code Information</h4>' + (props ?
                        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                        '<b>Zip Code: ' + props.ZIP + ', ' + props.STATE + '</b>' + '<br />' + 'ZIP Population: ' + TOTALPOPSCOMMA +
                        '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                        '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                        '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT +
                        '<br />PSA Location Count: ' + props.NUMBER_OF_PSAS + zipTouchLink
                        : 'Hover over a zip code');

                    $('.ZipTouchDetailLink').click(function () {
                        showZipTouchModal(props);
                    });

                    function showZipTouchModal(props) {
                        ZipTouchModal_Click();
                        updateZipModal(props); // function for getting data for modal
                    }

                    function ZipTouchModal_Click(source, eventArgs) {
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

                    var cssinfo = "info";

                    if (props) {
                        if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                            cssinfo = "info1";
                        } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                            cssinfo = "info2";
                        } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                            cssinfo = "info3";
                        } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                            cssinfo = "info4";
                        } else {
                            cssinfo = "info";
                        };

                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    } else {
                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    }

                };

                infoZip.addTo(map);



                var highlight;
                var highlight0;
                var highlight1;
                var highlight2;
                var highlight3;
                var highlight4;

                var clearHighlight = function () {
                    if (highlight) {
                        vectorGridZip.resetFeatureStyle(highlight);
                        infoZip.update();
                    }
                    highlight = null;
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ff9933' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff00' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#4da6ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#009900' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip1)) {
                        vectorGridZip1.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip2)) {
                        vectorGridZip2.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip3)) {
                        vectorGridZip3.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip4)) {
                        vectorGridZip4.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(VpgmDataLayer)) {
                        console.log('bring VpgmDataLayer to front');
                        VpgmDataLayer.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            console.log('bring PSALayer to front');
                            PSALayer.bringToFront();
                        }
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

                function ClickToZip(e) {
                    this.closePopup();
                    var layer = e.target;
                    //modalAlert(layer.feature.properties);

                    //console.log(layer.feature.properties.NUMBER_OF_PSAS);
                    if (layer.feature.properties.NUMBER_OF_PSAS > 0) { //Only Give Zip Modal Link Popup if the Zip has PSA Locations to Show in the modal.

                        this.openPopup(e.latlng);
                        //console.log("You clicked the map at " + e.latlng);

                        $('.ZipDetailLink').click(function () {
                            //alert('Clicked the Link: ' + layer.feature.properties.ZIP);
                            //this.closePopup();

                            if (ZipFullScreenState == 1) {
                                ZipFullScreenState = 0; // set full screen state to 0 (not full screen)
                                map.fullscreenControl.toggleFullScreen(); //exit full screen
                            }

                            map.eachLayer(function (layer) {
                                layer.closePopup();
                            });
                            showZipModal(layer.feature.properties);
                        });

                    }

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

                function modalAlert(props) {
                    alert('Clicked Zip: ' + props.ZIP);
                }

                //<button type="button" class="btn btn-primary" id="ShowZipButton" onclick="ShowZipModal()">Show Zip Details</button>

                function onEachFeature(feature, layer) {


                    if (navigator.userAgent.indexOf("Firefox") > 0) {

                        layer.bindPopup(feature.properties.ZIP + ", " + feature.properties.STATE + '<br><a href="#" class="ZipDetailLink">Click to Show PSA Location Details</a>', {
                            closeButton: true,
                            autoPan: false
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
                            layer.bindPopup(feature.properties.ZIP + ", " + feature.properties.STATE + '<br><a href="#" class="ZipDetailLink">Click to Show PSA Location Details</a>', {
                                closeButton: true,
                                autoPan: false
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
                    //if (e.layer._popup)
                    //    e.layer.openPopup();

                }).on('search:collapsed', function (e) {

                    VpgmDataLayer.eachLayer(function (layer) {	//restore feature color
                        VpgmDataLayer.resetStyle(layer);
                    });
                });

                map.addControl(searchControl);

                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legendZip = L.control({ position: 'bottomright' });
                var legendZipNoPSA = L.control({ position: 'bottomright' });

                console.log('psadata check2: ' + PSAData);

                if (PSAData == 'NoPSAData') {

                    legendZipNoPSA.onAdd = function (map) {

                        var div = L.DomUtil.create('div', 'infolegendZipNoPSA legendZipNoPSA');
                        categories = ['AT&T Retail Store', 'Authorized Reseller Store'];


                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutZipNoPSA" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        return div;
                    };

                    legendZipNoPSA.addTo(map);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer,
                        //"Zip Overlay": vectorGridZip0,
                        "AT&T Retail Store": ATTRstorePoints,
                        "Authorized Reseller Store": ARstorePoints
                    };

                } else {

                    legendZip.onAdd = function (map) {

                        var div = L.DomUtil.create('div', 'infolegendZip legendZip');
                        categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                        categories2 = ['PSA Locations'];

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutZip" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        for (var i = 0; i < categories2.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutZip2" style="border: 5px solid #00cc00"></i> ' +
                                (categories2[i] ? categories2[i] + '<br>' : '+');
                        }

                        return div;
                    };

                    legendZip.addTo(map);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer,
                        //"Zip Overlay": vectorGridZip0,
                        "AT&T Retail Store": ATTRstorePoints,
                        "Authorized Reseller Store": ARstorePoints,
                        "PSA Locations": PSALayer
                    };
                }

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

                map.on('overlayadd', function () {
                    if (map.hasLayer(vectorGridZip0)) {
                        vectorGridZip0.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip1)) {
                        vectorGridZip1.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip2)) {
                        vectorGridZip2.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip3)) {
                        vectorGridZip3.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(vectorGridZip4)) {
                        vectorGridZip4.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                    if (map.hasLayer(VpgmDataLayer)) {
                        VpgmDataLayer.bringToFront();
                        if (map.hasLayer(PSALayer)) {
                            PSALayer.bringToFront();
                        }
                    }
                });

                startZip();

            }

            function updateZipModal(props) {
                console.log('updateZipModal Start');

                ZipCodeModalSelected = props.ZIP;

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
                    } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                        marketGeo = 'OHIOPENNSYLVANIA'
                    } if (marketGeo == 'MID-ATLANTIC') {
                        marketGeo = 'MID-ATLANTIC STATES'
                    } if (marketGeo == 'ROCKY MOUNTAIN') {
                        marketGeo = 'ROCKY MOUNTAINS'
                    }
                    else { marketGeo = marketGeo }
                }

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'OHIOPENNSYLVANIA') {
                        marketGeoStore = 'OHIO PENNSYLVANIA'
                    }
                    else { marketGeoStore = marketGeo }
                }

                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('marketGeoStore: ' + marketGeoStore);

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Zip_Store_Detail_Market",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': '%', 'marketVariable': marketGeoStore, 'zipVariable': props.ZIP }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            ZipstoreData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_Zip_PSA_Detail_Market",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': '%', 'marketVariable': marketGeo, 'zipVariable': props.ZIP }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            ZipPSAData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_ZIP_MDU",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'ZipVariable': props.ZIP }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            ZIPMDUData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_ZipModalTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'zipVariable': props.ZIP, 'orderVariable': 'FIBER_OPPORTUNITY' }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                            zipCodeModalTabledata = JSON.parse(data.d);

                        },
                        error: function (data, market, time, market_long) {
                        }
                    }),

                ).then(function () {

                    var ZipVariable = props.ZIP;
                    console.log('ZipVariable: ' + ZipVariable);

                    var TOTALPOPSCOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";

                    if (props) {
                        TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    }

                    document.getElementById('ZipModalZip').innerHTML = props.ZIP;
                    document.getElementById('DisplayZipCode').innerHTML = 'Zip Code: ' + props.ZIP + ', ' + props.STATE;
                    document.getElementById('DisplayZipPop').innerHTML = 'ZIP Population: ' + TOTALPOPSCOMMA;
                    document.getElementById('DisplayWirelessCat').innerHTML = 'Wireless Category: ' + props.WIRELESS_CATEGORY;
                    document.getElementById('DisplayFiberCat').innerHTML = 'Fiber Availability: ' + props.FIBER_AVAILABILITY;
                    document.getElementById('DisplayFiberAvail').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA;
                    document.getElementById('DisplayFiberCurrent').innerHTML = 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA;
                    document.getElementById('DisplayFiberOpp').innerHTML = 'Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA;
                    document.getElementById('DisplayATTRStore').innerHTML = 'AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT;
                    document.getElementById('DisplayARStore').innerHTML = 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT;
                    document.getElementById('DisplayALLStore').innerHTML = 'All Store Count: ' + props.ALL_STORE_COUNT;
                    document.getElementById('DisplayPSACount').innerHTML = 'PSA Location Count: ' + props.NUMBER_OF_PSAS;

                    ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable, ZIPMDUData);
                    zipCodeModalTable(zipCodeModalTabledata, ZipVariable);
                    ZIPMDUTable(ZIPMDUData, ZipVariable);

                });

            }

            function ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable, ZipMDUData) {

                console.log('ZipVariable2: ' + ZipVariable);

                //$('#buttonrowzip').show();
                //$('#MapDiv').show();
                //$('#zipTableDiv').show();
                //$('#LOADING1').hide();
                //if (ZipPSAData == 'NoPSAData') {
                //    $('#zipfooter').hide();
                //} else {
                //    $('#zipfooter').show();
                //}

                $('#LOADING_ZIP_Modal').hide();
                $('#ModalDisplay').show();

                $(window).resize();

                if (mapModal != null) {
                    mapModal.remove();
                    mapModal = null;
                }

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

                    var MDU1 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 1; });
                    var MDU2 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 2; });
                    var MDU3 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var MDU4 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var MDU5 = ZipMDUData.filter(function (value) { return value.WIRELESS_SCORE == 5; });

                    $('#tab1_ZIP').show(); //in case previous Zip did not have any MDUs, and the MDU tab is hidden.

                    var tab2 = document.getElementById("tab2_ZIP");
                    if (tab2.classList.contains("active")) {
                        tab2.classList.remove("active");
                        var tabpane2 = document.getElementById("m_tabs_1_tab2_ZIP");
                        tabpane2.classList.remove("active");

                        var tabpane1 = document.getElementById("m_tabs_1_tab1_ZIP");
                        tabpane1.classList.add("active");
                        var tab1 = document.getElementById("tab1_ZIP");
                        tab1.classList.add("active");
                    }

                    var ZipMDUPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><a href="#" class="ZipModalMDULink">Click to Export Unit Numbers</a>';                        

                    } else {
                        var unitExportText = '<br><a href="#" class="ZipModalMDULink">Click to Show Unit Numbers</a>';
                    }

                    for (i in MDU1) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU1[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU1[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU1[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU1[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU1[i].HOUSE_NUMBER + ' ' + MDU1[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU1[i].CITY + ', ' + MDU1[i].STATE +
                            unitExportText,

                            loc = [MDU1[i].LATITUDE, MDU1[i].LONGITUDE],	//position found
                            MDU1Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#e6b800'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU1Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU1[i].HOUSE_NUMBER, MDU1[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU2) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU2[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU2[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU2[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU2[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU2[i].HOUSE_NUMBER + ' ' + MDU2[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU2[i].CITY + ', ' + MDU2[i].STATE +
                            unitExportText,

                            loc = [MDU2[i].LATITUDE, MDU2[i].LONGITUDE],	//position found
                            MDU2Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#ffff00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU2Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU2[i].HOUSE_NUMBER, MDU2[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU3) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU3[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU3[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU3[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU3[i].HOUSE_NUMBER + ' ' + MDU3[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU3[i].CITY + ', ' + MDU3[i].STATE +
                            unitExportText,

                            loc = [MDU3[i].LATITUDE, MDU3[i].LONGITUDE],	//position found
                            MDU3Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#00cc00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU3Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU3[i].HOUSE_NUMBER, MDU3[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }

                    for (i in MDU4) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU4[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU4[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU4[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU4[i].HOUSE_NUMBER + ' ' + MDU4[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU4[i].CITY + ', ' + MDU4[i].STATE +
                            unitExportText,

                            loc = [MDU4[i].LATITUDE, MDU4[i].LONGITUDE],	//position found
                            MDU4Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#008000'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#008000'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU4Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU4[i].HOUSE_NUMBER, MDU4[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }


                    for (i in MDU5) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU5[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU5[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU5[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU5[i].HOUSE_NUMBER + ' ' + MDU5[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU5[i].CITY + ', ' + MDU5[i].STATE +
                            unitExportText,

                            loc = [MDU5[i].LATITUDE, MDU5[i].LONGITUDE],	//position found
                            MDU5Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#003300'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#003300'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU5Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU5[i].HOUSE_NUMBER, MDU5[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        ZipMDUPoints.addLayer(marker);
                    }
                }

                else {
                    //make tab 2 active, remove active from tab 1, hide tab 1
                    var tabpane2 = document.getElementById("m_tabs_1_tab2_ZIP");
                    tabpane2.classList.add("active");
                    var tab2 = document.getElementById("tab2_ZIP");
                    tab2.classList.add("active");


                    var tabpane1 = document.getElementById("m_tabs_1_tab1_ZIP");
                    tabpane1.classList.remove("active");
                    var tab1 = document.getElementById("tab1_ZIP");
                    tab1.classList.remove("active");


                    $('#tab1_ZIP').hide();

                }

                var PSA0 = ZipPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA0");
                });
                var PSA1 = ZipPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA1");
                });
                var PSA2 = ZipPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA2");
                });
                var PSA3 = ZipPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA3");
                });
                var PSA4 = ZipPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA4");
                });
                var PSA5 = ZipPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA5");
                });

                PSALocationPoints = new L.layerGroup();

                if (Access == "Unlimited") {
                    var addressExportText = '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>';
                } else {
                    var addressExportText = '<br><a href="#" class="ZipModalDetailLink">Click to Show Fiber Addresses</a>';
                }

                for (i in PSA0) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA0[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA0[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA0[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA0[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA0[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

                        loc = [PSA0[i].LATITUDE, PSA0[i].LONGITUDE],	//position found
                        PSA0Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [10, 10],
                            borderWidth: 5,
                            borderColor: '#ffffff'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA0Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA0[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA1) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA1[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA1[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA1[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA1[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA1[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

                        loc = [PSA1[i].LATITUDE, PSA1[i].LONGITUDE],	//position found
                        PSA1Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [10, 10],
                            borderWidth: 5,
                            borderColor: '#e6b800'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA1Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA1[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA2) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA2[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA2[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA2[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA2[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA2[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

                        loc = [PSA2[i].LATITUDE, PSA2[i].LONGITUDE],	//position found
                        PSA2Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [10, 10],
                            borderWidth: 5,
                            borderColor: '#ffff00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA2Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA2[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA3) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA3[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA3[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA3[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA3[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA3[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

                        loc = [PSA3[i].LATITUDE, PSA3[i].LONGITUDE],	//position found
                        PSA3Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [10, 10],
                            borderWidth: 5,
                            borderColor: '#00cc00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA3Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA3[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA4) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA4[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA4[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA4[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA4[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA4[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

                        loc = [PSA4[i].LATITUDE, PSA4[i].LONGITUDE],	//position found
                        PSA4Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [10, 10],
                            borderWidth: 5,
                            borderColor: '#008000'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA4Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA4[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA5) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA5[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA5[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA5[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA5[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA5[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

                        loc = [PSA5[i].LATITUDE, PSA5[i].LONGITUDE],	//position found
                        PSA5Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [10, 10],
                            borderWidth: 5,
                            borderColor: '#003300'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA5Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA5[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('myZipModalMap').innerHTML = "<div id='ZipModalMap' style='height: 400px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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
                if (ZipPSAData.length > 0) { mapModalOptions.layers.push(PSALocationPoints); console.log('PSA points found'); }
                if (ZipMDUData.length > 0) { mapModalOptions.layers.push(ZipMDUPoints); }

                mapModal = L.map("ZipModalMap", mapModalOptions);


                //if (ZipPSAData.length <= 0) {
                //    mapModal = L.map("ModalMap", {
                //        attributionControl: false,
                //        preferCanvas: true,
                //        center: [39.73, -104.99],
                //        zoom: 10,
                //        minZoom: 3,
                //        //zoomControl: false,
                //        layers: [streets, ATTRstorePoints, ARstorePoints],
                //        fullscreenControl: true,
                //        fullscreenControlOptions: {
                //            position: 'topleft'
                //        }
                //    });
                //} else {
                //    mapModal = L.map("ModalMap", {
                //        attributionControl: false,
                //        preferCanvas: true,
                //        center: [39.73, -104.99],
                //        zoom: 10,
                //        minZoom: 3,
                //        //zoomControl: false,
                //        layers: [streets, ATTRstorePoints, ARstorePoints, PSALocationPoints],
                //        fullscreenControl: true,
                //        fullscreenControlOptions: {
                //            position: 'topleft'
                //        }
                //    });
                //}

                function onClick(e) {
                    SelectedPSA = this.key;
                }

                mapModal.on('popupopen', function (e) {
                    $('.ZipModalDetailLink').click(function (e) {
                        console.log("Clicked PSA: " + SelectedPSA);
                        selectedPSAGetExport();
                    });
                });

                function selectedPSAGetExport() {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonPSALocations.ClientID %>");
                        clickButton.click();
                        console.log("Clicked PSA2: " + SelectedPSA);
                    } else {
                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        PSAZipShowAddressesFromMapClick(SelectedPSA);
                        console.log("Clicked PSA2: " + SelectedPSA);
                    }
                }

                function PSAZipShowAddressesFromMapClick(SelectedPSA) {

                    var PSAVariable = SelectedPSA;
                    console.log('PSA: ' + PSAVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - ' + 'PSA: ' + PSAVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesZipFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'PSAVariable': PSAVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataZipUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataZipUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                function MDULinkClick(e) {
                    console.log(this.key);
                    SpecificMDUHouse = this.key[0];
                    SpecificMDUStreet = this.key[1];
                }

                mapModal.on('popupopen', function (e) {
                    $('.ZipModalMDULink').click(function (e) {
                        console.log("SpecificMDUHouse: " + SpecificMDUHouse);
                        console.log("SpecificMDUStreet: " + SpecificMDUStreet);
                        ZipSpecificMDUGetAddresses(SpecificMDUHouse, SpecificMDUStreet);
                    });
                });

                function ZipSpecificMDUGetAddresses(housenumber, streetname) {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = housenumber;
                        document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = streetname;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUAddresses_ZIP.ClientID %>");
                        clickButton.click();
                        // AlertAddressExport();
                    } else {
                        document.getElementById('<%= hf_SelectedMDU_ZIP_House.ClientID %>').value = housenumber;
                        document.getElementById('<%= hf_SelectedMDU_ZIP_Street.ClientID %>').value = streetname;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        MDUZipShowAddressesFromMapClick(housenumber, streetname);
                    }
                }

                function MDUZipShowAddressesFromMapClick(housenumber, streetname) {
                    
                    var houseVariable = housenumber;
                    console.log('house: ' + houseVariable);
                    var streetVariable = streetname;
                    console.log('street: ' + streetVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'Zip: ' + ZipCodeModalSelected + ' - ' + houseVariable + ' ' + streetVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesZipFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'ZipVariable': ZipCodeModalSelected, 'houseVariable': houseVariable, 'streetVariable': streetVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataZipUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

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


                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legendZip = L.control({ position: 'bottomright' });
                var legendZipNoPSA = L.control({ position: 'bottomright' });

                if (ZipPSAData.length <= 0) { //(ZipPSAData.length <= 0)

                    legendZipNoPSA.onAdd = function (mapModal) {

                        var div = L.DomUtil.create('div', 'infolegendTwoRows legendTwoRows');

                        categories = [];
                        if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                        if (AR.length > 0) { categories.push('Authorized Reseller Store'); }

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutTwoRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        return div;
                    };

                    legendZipNoPSA.addTo(mapModal);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer
                    };

                    if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                    if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }


                } else {

                    if (ZipMDUData.length <= 0) {

                        legendZip.onAdd = function (mapModal) {

                            var div = L.DomUtil.create('div', 'infolegendThreeRows legendThreeRows');

                            categories = [];
                            if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                            if (AR.length > 0) { categories.push('Authorized Reseller Store'); }

                            categories2 = ['PSA Locations'];

                            for (var i = 0; i < categories.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutThreeRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                    (categories[i] ? categories[i] + '<br>' : '+');
                            }

                            for (var i = 0; i < categories2.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutThreeRows" style="height: 14px; width: 14px; border: 7px solid #008000"></i> ' +
                                    (categories2[i] ? categories2[i] + '<br>' : '+');
                            }


                            return div;
                        };

                        legendZip.addTo(mapModal);

                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer
                        };

                        if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                        if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                        overlays["PSA Locations"] = PSALocationPoints;
                        if (ZipMDUData.length > 0) { overlays["High Opportunity MDUs"] = ZipMDUPoints; }
                    }

                    else {

                        legendZip.onAdd = function (mapModal) {

                            var div = L.DomUtil.create('div', 'infolegendFourRows legendFourRows');

                            //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                            categories = [];
                            if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                            if (AR.length > 0) { categories.push('Authorized Reseller Store'); }
                            if (ZipMDUData.length > 0) { categories3 = ['High Opportunity MDUs']; }
                            categories2 = ['PSA Locations'];

                            for (var i = 0; i < categories.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFourRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                    (categories[i] ? categories[i] + '<br>' : '+');
                            }

                            for (var i = 0; i < categories2.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFourRows" style="height: 14px; width: 14px; border: 7px solid #008000"></i> ' +
                                    (categories2[i] ? categories2[i] + '<br>' : '+');
                            }

                            if (ZipMDUData.length > 0) {
                                for (var i = 0; i < categories3.length; i++) {
                                    div.innerHTML +=
                                        '<i class="doughnutFourRows" style="border-radius: 0%; height: 14px; width: 14px; border: 3px solid #008000"></i> ' +
                                        (categories3[i] ? categories3[i] + '<br>' : '+');
                                }
                            }


                            return div;
                        };

                        legendZip.addTo(mapModal);

                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer
                        };

                        if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                        if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                        overlays["PSA Locations"] = PSALocationPoints;
                        if (ZipMDUData.length > 0) { overlays["High Opportunity MDUs"] = ZipMDUPoints; }
                    }
                }


                //if (ZipPSAData.length <= 0) {

                //    legendZipNoPSA.onAdd = function (mapModal) {

                //        var div = L.DomUtil.create('div', 'infolegendZipNoPSA legendZipNoPSA');
                //        categories = ['AT&T Retail Store', 'Authorized Reseller Store'];


                //        for (var i = 0; i < categories.length; i++) {
                //            div.innerHTML +=
                //                '<i class="doughnutZipNoPSA" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                //                (categories[i] ? categories[i] + '<br>' : '+');
                //        }

                //        return div;
                //    };

                //    legendZipNoPSA.addTo(mapModal);

                //    var overlays = {
                //        "VPGM Market Borders": MarketBoundaryLayer,
                //        "AT&T Retail Store": ATTRstorePoints,
                //        "Authorized Reseller Store": ARstorePoints
                //    };

                //} else {

                //    legendZip.onAdd = function (mapModal) {

                //        var div = L.DomUtil.create('div', 'infolegendZip legendZip');
                //        categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                //        categories2 = ['PSA Locations'];

                //        for (var i = 0; i < categories.length; i++) {
                //            div.innerHTML +=
                //                '<i class="doughnutZip" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                //                (categories[i] ? categories[i] + '<br>' : '+');
                //        }

                //        for (var i = 0; i < categories2.length; i++) {
                //            div.innerHTML +=
                //                '<i class="doughnutZip2" style="border: 5px solid #00cc00"></i> ' +
                //                (categories2[i] ? categories2[i] + '<br>' : '+');
                //        }

                //        return div;
                //    };

                //    legendZip.addTo(mapModal);

                //    var overlays = {
                //        "VPGM Market Borders": MarketBoundaryLayer,
                //        "AT&T Retail Store": ATTRstorePoints,
                //        "Authorized Reseller Store": ARstorePoints,
                //        "PSA Locations": PSALocationPoints
                //    };
                //}

                // zoom control options

                //mapModal.createPane('zoomlabels');
                //mapModal.getPane('zoomlabels').style.zIndex = 650;

                //var zoomOptions = {
                //    minZoom: 3,
                //    pane: 'zoomlabels'
                //};
                //var zoom = L.control.zoom(zoomOptions);
                //zoom.addTo(mapModal);

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);

                mapModal.on('overlayadd', function () {
                    if (map.hasLayer(PSALocationPoints)) {
                        PSALocationPoints.bringToFront();
                        if (map.hasLayer(ZipMDUPoints)) {
                            ZipMDUPoints.bringToFront();
                        }
                    }
                });

                mapModal.invalidateSize();

            }

            var storeMapV3_Region = function (storeData, VpgmData2, MarketBoundaryData) {

                $('#buttonrowcounty').show();
                $('#MapDiv').show();
                $('#countyTableDiv').show();
                $('#zipfooter').hide();
                $('#zipfooter3').hide();
                $('#zipfooter2').show();
                $('#LOADING1').hide();

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var ATTR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });

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

                var clusterOptions = {
                    regionLevels: regionLevels,
                    maxClusterRadius: 50,
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

                //var ATTRstorePoints = new L.MarkerClusterGroup(clusterOptions);
                //var ARstorePoints = new L.MarkerClusterGroup(clusterOptions);


                mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 8, spiderfyOnMaxZoom: false, maxClusterRadius: 120 }),
                    ATTRstorePoints = L.featureGroup.subGroup(mcg),// use `L.featureGroup.subGroup(parentGroup)` instead of `L.featureGroup()` or `L.layerGroup()`!
                    ARstorePoints = L.featureGroup.subGroup(mcg);

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
                    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(ATTRstorePoints);
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

                    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    //ARstorePoints.addLayer(marker);
                    marker.addTo(ARstorePoints);
                }

                console.log(VpgmData2);

                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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
                    featureLayer.bindPopup(feature.properties.Region);
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
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var NUMBER_OF_PSASCOMMA = "";

                    if (props) {
                        TotalPOPsCOMMA = Number(props.TotalPOPs).toLocaleString('en');
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
                                CountyTouchLink = '<br /><a href="#" class="CountyTouchDetailLink">Click to Show Top Fiber Opportunities</a>';
                            }
                        } else {
                            CountyTouchLink = '';
                        }
                    } else {
                        CountyTouchLink = '';
                    }

                    this._div.innerHTML = '<h4>County Information</h4>' + (props ?
                        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                        '<b>County: ' + props.COUNTY_STATE + '</b><br />' + 'Population: ' + TotalPOPsCOMMA +
                        '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                        '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                        '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT + 
                        '<br />PSA Location Count: ' + NUMBER_OF_PSASCOMMA + CountyTouchLink
                        : 'Hover over a county');

                    $('.CountyTouchDetailLink').click(function () {
                        showCountyModal(props, SelectCountyLat, SelectCountyLng);
                    });

                    var cssinfo = "info";

                    if (props) {
                        if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                            cssinfo = "info1";
                        } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                            cssinfo = "info2";
                        } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                            cssinfo = "info3";
                        } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                            cssinfo = "info4";
                        } else {
                            cssinfo = "info";
                        };

                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    } else {
                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    }

                };

                infoCounty.addTo(map);



                var highlight;
                var highlight0;
                var highlight1;
                var highlight2;
                var highlight3;
                var highlight4;
                var zoom0;
                var clearHighlight = function () {
                    if (highlight) {
                        vectorGridCounty.resetFeatureStyle(highlight);
                        infoCounty.update();
                    }
                    highlight = null;
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
                            var p = properties.OVERALL_CAT;
                                return {
                                    fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                        p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                            p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                                p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                    },

                })

                    .addTo(map);

                vectorGridCounty1 = L.vectorGrid.slicer(VpgmData2, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ff9933' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff00' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#4da6ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#009900' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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

                    //include the zoom in on click functionality
                    var zoomlevel = map.getZoom();
                    if (zoomlevel <= 9) {
                        if (map.hasLayer(Vpgm2LayerTest)) {
                            Vpgm2LayerTest.clearLayers();
                            map.removeControl(infoDatatableCounty);
                            map.addControl(infoCounty);
                        }
                        var bounds = e.target.getBounds().pad(0.5);
                        map.fitBounds(bounds);
                    }


                    this.closePopup();
                    var layer = e.target;

                    //console.log(layer.feature.properties);
                    if (layer.feature.properties.FIBER_AVAILABLE > 0) { //Only Give Zip Modal Link Popup if the Zip has Fiber Available.

                        this.openPopup(e.latlng);

                        $('.CountyDetailLink').click(function () {


                            if (CountyFullScreenState == 1) {
                                CountyFullScreenState = 0; // set full screen state to 0 (not full screen)
                                map.fullscreenControl.toggleFullScreen(); //exit full screen
                            }

                            console.log('user clicked at:');
                            console.log(e.latlng);
                            console.log(e.latlng.lat);
                            console.log(e.latlng.lng);
                            map.eachLayer(function (layer) {
                                layer.closePopup();
                            });
                            showCountyModal(layer.feature.properties, SelectCountyLat, SelectCountyLng);
                        });
                    }

                }

                function onEachFeature(feature, layer) {

                    if (navigator.userAgent.indexOf("Firefox") > 0) {
                        layer.bindPopup('County: ' + feature.properties.Name + ', ' + feature.properties.State_Abbr + '<br><a href="#" class="CountyDetailLink">Click to Show Top Fiber Opportunities</a>', {
                            closeButton: true,
                            autoPan: false
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
                            layer.bindPopup('County: ' + feature.properties.Name + ', ' + feature.properties.State_Abbr + '<br><a href="#" class="CountyDetailLink">Click to Show Top Fiber Opportunities</a>', {
                                closeButton: true,
                                autoPan: false
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
                    layer: VpgmData2Layer,
                    propertyName: 'COUNTY_STATE',
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
                    //if (e.layer._popup)
                    //    e.layer.openPopup();

                }).on('search:collapsed', function (e) {

                    VpgmData2Layer.eachLayer(function (layer) {	//restore feature color
                        VpgmData2Layer.resetStyle(layer);
                    });
                });

                map.addControl(searchControl);

                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomright' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'infolegend legend');
                    categories = ['AT&T Retail Store', 'Authorized Reseller Store'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                var overlays = {
                    "VPGM Market Borders": MarketBoundaryLayer,
                    //"County Overlay": vectorGridCounty,
                    "AT&T Retail Store": ATTRstorePoints,
                    "Authorized Reseller Store": ARstorePoints
                };

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

                map.on('overlayadd', function () {
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

                startCounty();


            }

            function showCountyModal(props, clickedlat, clickedlong) {
                CountyModal_Click();
                updateCountyModal(props, clickedlat, clickedlong); // function for getting data for modal
            }

            function CountyModal_Click(source, eventArgs) {
                var clickButton = document.getElementById("<%= btnCountyModal.ClientID %>");
                $('#LOADING_County_Modal').show();
                $('#CountyModalTitle').hide();
                $('#ModalDisplay_County').hide();
                clickButton.click();
            }

            function updateCountyModal(props, clickedlat, clickedlong) {
                console.log('updateCountyModal Start');

                CountyModalSelected = props.Cnty_FIPS;
                console.log(props);

                <%--var marketGeoStore;
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
                    } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                        marketGeo = 'OHIOPENNSYLVANIA'
                    } if (marketGeo == 'MID-ATLANTIC') {
                        marketGeo = 'MID-ATLANTIC STATES'
                    } if (marketGeo == 'ROCKY MOUNTAIN') {
                        marketGeo = 'ROCKY MOUNTAINS'
                    }
                    else { marketGeo = marketGeo }
                }

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'OHIOPENNSYLVANIA') {
                        marketGeoStore = 'OHIO PENNSYLVANIA'
                    }
                    else { marketGeoStore = marketGeo }
                }

                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('marketGeoStore: ' + marketGeoStore);--%>

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_County_Store_Detail",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CountyVariable': props.Cnty_FIPS, 'LatVariable': clickedlat, 'LongVariable': clickedlong }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CountystoreData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_County_PSA_Detail_Market",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CountyVariable': props.Cnty_FIPS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CountyPSAData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_County_MDU",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CountyVariable': props.Cnty_FIPS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CountyMDUData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CountyModalTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CountyVariable': props.Cnty_FIPS }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                            CountyModalTabledata = JSON.parse(data.d);

                        },
                        error: function (data, market, time, market_long) {
                        }
                    })

                ).then(function () {

                    var CountyVariable = props.Cnty_FIPS;

                    var CountyTOTALPOPSCOMMA = "";
                    var FIBER_AVAILABLECOMMA_County = "";
                    var FIBER_CUSTOMERSCOMMA_County = "";
                    var FIBER_OPPORTUNITYCOMMA_County = "";
                    var NUMBER_OF_PSASCOMMA_County = "";

                    if (props) {
                        CountyTOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                        FIBER_AVAILABLECOMMA_County = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA_County = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA_County = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        NUMBER_OF_PSASCOMMA_County = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                    }

                    document.getElementById('CountyModalTitle').innerHTML = 'County - ' + props.COUNTY_STATE;
                    CountyStateModalText = props.COUNTY_STATE;
                    document.getElementById('DisplayCounty').innerHTML = props.COUNTY_STATE;
                    document.getElementById('DisplayCountyPop').innerHTML = 'County Population: ' + CountyTOTALPOPSCOMMA;
                    document.getElementById('DisplayWirelessCat_County').innerHTML = 'Wireless Category: ' + props.WIRELESS_CATEGORY;
                    //document.getElementById('DisplayFiberCat_County').innerHTML = 'Fiber Availability: ' + props.FIBER_AVAILABILITY;
                    document.getElementById('DisplayFiberAvail_County').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA_County;
                    document.getElementById('DisplayFiberCurrent_County').innerHTML = 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA_County;
                    document.getElementById('DisplayFiberOpp_County').innerHTML = 'Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA_County;
                    document.getElementById('DisplayPSANumber_County').innerHTML = 'Number of PSAs: ' + NUMBER_OF_PSASCOMMA_County;
                    document.getElementById('DisplayATTRStore_County').innerHTML = 'AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT;
                    document.getElementById('DisplayARStore_County').innerHTML = 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT;
                    document.getElementById('DisplayALLStore_County').innerHTML = 'All Store Count: ' + props.ALL_STORE_COUNT;
                    //document.getElementById('DisplayPSACount_County').innerHTML = 'PSA Location Count: ' + props.NUMBER_OF_PSAS;

                    //ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable);


                    ShowCountyModalMap(VpgmData2, CountystoreData, MarketBoundaryData, CountyPSAData, CountyVariable, CountyMDUData);

                    CountyModalTable(CountyModalTabledata, CountyVariable);
                    CountyMDUTable(CountyMDUData, CountyVariable);

                    //next two lines for testing
                    $('#LOADING_County_Modal').hide();
                    $('#CountyModalTitle').show();
                    $('#ModalDisplay_County').show();


                });

            }

            function ShowCountyModalMap(VpgmData2, CountystoreData, MarketBoundaryData, CountyPSAData, CountyVariable, CountyMDUData) { // ShowCMAModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable) {

                //console.log('ZipVariable2: ' + ZipVariable);

                console.log('CountystoreData');
                console.log(CountystoreData);

                console.log('CountyPSAData');
                console.log(CountyPSAData);

                console.log('CountyMDUData');
                console.log(CountyMDUData);

                $('#LOADING_County_Modal').hide();
                $('#ModalDisplay_County').show();

                $(window).resize();

                if (CountymapModal != null) {
                    CountymapModal.remove();
                    CountymapModal = null;
                }

                <%--var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();--%>



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

                    console.log('CountyMDUData.length: ' + CountyMDUData.length);

                    var MDU3 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var MDU4 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var MDU5 = CountyMDUData.filter(function (value) { return value.WIRELESS_SCORE == 5; });



                    $('#tab1_County').show(); //in case previous County did not have any MDUs, and the MDU tab is hidden.


                    var tab2County = document.getElementById("tab2_County");
                    if (tab2County.classList.contains("active")) {
                        tab2County.classList.remove("active");
                        var tabpane2County = document.getElementById("m_tabs_1_tab2_County");
                        tabpane2County.classList.remove("active");

                        var tabpane1County = document.getElementById("m_tabs_1_tab1_County");
                        tabpane1County.classList.add("active");
                        var tab1County = document.getElementById("tab1_County");
                        tab1County.classList.add("active");
                    }

                    var CountyMDUPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><a href="#" class="CountyModalMDULink">Click to Export Unit Numbers</a>';
                        var addressExportText = '<br><a href="#" class="CountyModalDetailLink">Click to Export Fiber Addresses</a>';

                    } else {
                        var unitExportText = '<br><a href="#" class="CountyModalMDULink">Click to Show Unit Numbers</a>';
                        var addressExportText = '<br><a href="#" class="CountyModalDetailLink">Click to Show Fiber Addresses</a>';
                    }

                    for (i in MDU3) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU3[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU3[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU3[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU3[i].HOUSE_NUMBER + ' ' + MDU3[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU3[i].CITY + ', ' + MDU3[i].STATE +
                            unitExportText,

                            loc = [MDU3[i].LATITUDE, MDU3[i].LONGITUDE],	//position found
                            MDU3Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#00cc00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU3Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU3[i].HOUSE_NUMBER, MDU3[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }

                    for (i in MDU4) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU4[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU4[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU4[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU4[i].HOUSE_NUMBER + ' ' + MDU4[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU4[i].CITY + ', ' + MDU4[i].STATE +
                            unitExportText,

                            loc = [MDU4[i].LATITUDE, MDU4[i].LONGITUDE],	//position found
                            MDU4Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#008000'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#008000'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU4Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU4[i].HOUSE_NUMBER, MDU4[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }


                    for (i in MDU5) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU5[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU5[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU5[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU5[i].HOUSE_NUMBER + ' ' + MDU5[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU5[i].CITY + ', ' + MDU5[i].STATE +
                            unitExportText,

                            loc = [MDU5[i].LATITUDE, MDU5[i].LONGITUDE],	//position found
                            MDU5Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#003300'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#003300'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU5Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU5[i].HOUSE_NUMBER, MDU5[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        CountyMDUPoints.addLayer(marker);
                    }
                }

                else {
                    //make tab 2 active, remove active from tab 1, hide tab 1
                    var tabpane2County = document.getElementById("m_tabs_1_tab2_County");
                    tabpane2County.classList.add("active");
                    var tab2County = document.getElementById("tab2_County");
                    tab2County.classList.add("active");


                    var tabpane1County = document.getElementById("m_tabs_1_tab1_County");
                    tabpane1County.classList.remove("active");
                    var tab1County = document.getElementById("tab1_County");
                    tab1County.classList.remove("active");


                    $('#tab1').hide();

                }

                var PSA0 = CountyPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA0");
                });
                var PSA1 = CountyPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA1");
                });
                var PSA2 = CountyPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA2");
                });
                var PSA3 = CountyPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA3");
                });
                var PSA4 = CountyPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA4");
                });
                var PSA5 = CountyPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA5");
                });

                PSALocationPoints = new L.layerGroup();

                for (i in PSA0) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA0[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA0[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA0[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA0[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA0[i].FIBER_OPPORTUNITY +
                        addressExportText,

                        loc = [PSA0[i].LATITUDE, PSA0[i].LONGITUDE],	//position found   
                        PSA0Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#ffffff'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA0Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA0[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA1) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA1[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA1[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA1[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA1[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA1[i].FIBER_OPPORTUNITY +
                        addressExportText,

                        loc = [PSA1[i].LATITUDE, PSA1[i].LONGITUDE],	//position found   
                        PSA1Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#e6b800'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA1Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA1[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA2) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA2[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA2[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA2[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA2[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA2[i].FIBER_OPPORTUNITY +
                        addressExportText,

                        loc = [PSA2[i].LATITUDE, PSA2[i].LONGITUDE],	//position found   
                        PSA2Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#ffff00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA2Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA2[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA3) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA3[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA3[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA3[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA3[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA3[i].FIBER_OPPORTUNITY +
                        addressExportText,

                        loc = [PSA3[i].LATITUDE, PSA3[i].LONGITUDE],	//position found   
                        PSA3Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#00cc00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA3Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA3[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA4) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA4[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA4[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA4[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA4[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA4[i].FIBER_OPPORTUNITY +
                        addressExportText,

                        loc = [PSA4[i].LATITUDE, PSA4[i].LONGITUDE],	//position found   
                        PSA4Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#008000'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA4Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA4[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA5) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA5[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA5[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA5[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA5[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA5[i].FIBER_OPPORTUNITY +
                        addressExportText,

                        loc = [PSA5[i].LATITUDE, PSA5[i].LONGITUDE],	//position found   
                        PSA5Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#003300'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA5Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA5[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                //document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                //document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('myCountyModalMap').innerHTML = "<div id='CountyModalMap' style='height: 400px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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

                //console.log('CountymapModalOptions1');
                //console.log(CountymapModalOptions);

                CountymapModalOptions.layers.push(streets);
                if (ATTR.length > 0) { CountymapModalOptions.layers.push(ATTRstorePoints); }
                if (AR.length > 0) { CountymapModalOptions.layers.push(ARstorePoints); }
                if (CountyPSAData.length > 0) { CountymapModalOptions.layers.push(PSALocationPoints); console.log('PSA points found'); }
                if (CountyMDUData.length > 0) { CountymapModalOptions.layers.push(CountyMDUPoints); }

                //console.log('CountymapModalOptions2');
                //console.log(CountymapModalOptions);

                CountymapModal = L.map("CountyModalMap", CountymapModalOptions);


                function onClick(e) {
                    SelectedPSA = this.key;
                }

                CountymapModal.on('popupopen', function (e) {
                    $('.CountyModalDetailLink').click(function (e) {
                        console.log("Clicked PSA: " + SelectedPSA);
                        selectedPSAGetExport();
                    });
                });

                function selectedPSAGetExport() {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonPSALocations.ClientID %>");
                        clickButton.click();
                        console.log("Clicked PSA2: " + SelectedPSA);
                    } else {                        
                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        PSACountyShowAddressesFromMapClick(SelectedPSA);
                        console.log("Clicked PSA2: " + SelectedPSA);
                    }
                }

                function PSACountyShowAddressesFromMapClick(SelectedPSA) {

                    var PSAVariable = SelectedPSA;
                    console.log('PSA: ' + PSAVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText + ' - ' + 'PSA: ' + PSAVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesCountyFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'PSAVariable': PSAVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataCountyUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function MDULinkClick(e) {
                    console.log(this.key);
                    SpecificMDUHouse = this.key[0];
                    SpecificMDUStreet = this.key[1];
                }

                CountymapModal.on('popupopen', function (e) {
                    $('.CountyModalMDULink').click(function (e) {
                        console.log("SpecificMDUHouse: " + SpecificMDUHouse);
                        console.log("SpecificMDUStreet: " + SpecificMDUStreet);
                        SpecificMDUGetAddressesCounty(SpecificMDUHouse, SpecificMDUStreet);
                    });
                });

                function SpecificMDUGetAddressesCounty(housenumber, streetname) {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = housenumber;
                        document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = streetname;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUAddresses_County.ClientID %>");                        
                        clickButton.click();
                        // AlertAddressExport();
                    } else {
                        document.getElementById('<%= hf_SelectedMDU_County_House.ClientID %>').value = housenumber;
                        document.getElementById('<%= hf_SelectedMDU_County_Street.ClientID %>').value = streetname;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        MDUCountyShowAddressesFromMapClick(housenumber, streetname);
                    }
                }

                function MDUCountyShowAddressesFromMapClick(housenumber, streetname) {

                    var countyVariable = CountyVariable;
                    console.log('county: ' + countyVariable);
                    var houseVariable = housenumber;
                    console.log('house: ' + houseVariable);
                    var streetVariable = streetname;
                    console.log('street: ' + streetVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'County: ' + CountyStateModalText + ' - ' + houseVariable + ' ' + streetVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesCountyFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CountyVariable': countyVariable, 'houseVariable': houseVariable, 'streetVariable': streetVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataCountyUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataCountyUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

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


                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legendCounty = L.control({ position: 'bottomright' });
                var legendCountyNoPSA = L.control({ position: 'bottomright' });





                if (CountyPSAData.length <= 0) { //(ZipPSAData.length <= 0)

                    legendCountyNoPSA.onAdd = function (CountymapModal) {

                        var div = L.DomUtil.create('div', 'infolegendTwoRows legendTwoRows');

                        categories = [];
                        if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                        if (AR.length > 0) { categories.push('Authorized Reseller Store'); }


                        //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];


                        //for (var i = 0; i < categories.length; i++) {
                        //    div.innerHTML +=
                        //        '<i class="doughnutCountyNoPSA" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                        //        (categories[i] ? categories[i] + '<br>' : '+');
                        //}

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutTwoRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        return div;
                    };

                    legendCountyNoPSA.addTo(CountymapModal);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer //,
                        //"AT&T Retail Store": ATTRstorePoints,
                        //"Authorized Reseller Store": ARstorePoints
                    };

                    if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                    if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }


                } else {

                    if (CountyMDUData.length <= 0) {

                        legendCounty.onAdd = function (CountymapModal) {

                            var div = L.DomUtil.create('div', 'infolegendThreeRows legendThreeRows');

                            //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                            categories = [];
                            if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                            if (AR.length > 0) { categories.push('Authorized Reseller Store'); }

                            categories2 = ['Top PSA Locations'];



                            for (var i = 0; i < categories.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutThreeRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                    (categories[i] ? categories[i] + '<br>' : '+');
                            }

                            for (var i = 0; i < categories2.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutThreeRows" style="height: 14px; width: 14px; border: 7px solid #008000"></i> ' +
                                    (categories2[i] ? categories2[i] + '<br>' : '+');
                            }


                            return div;
                        };

                        legendCounty.addTo(CountymapModal);

                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer //,
                            //"AT&T Retail Store": ATTRstorePoints,
                            //"Authorized Reseller Store": ARstorePoints,
                            //"PSA Locations": PSALocationPoints
                        };

                        if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                        if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                        overlays["Top PSA Locations"] = PSALocationPoints;
                        if (CountyMDUData.length > 0) { overlays["High Opportunity MDUs"] = CountyMDUPoints; }
                    }

                    else {

                        legendCounty.onAdd = function (CountymapModal) {

                            var div = L.DomUtil.create('div', 'infolegendFourRows legendFourRows');

                            //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                            categories = [];
                            if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                            if (AR.length > 0) { categories.push('Authorized Reseller Store'); }
                            if (CountyMDUData.length > 0) { categories3 = ['High Opportunity MDUs']; }
                            categories2 = ['Top PSA Locations'];



                            for (var i = 0; i < categories.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFourRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                    (categories[i] ? categories[i] + '<br>' : '+');
                            }

                            for (var i = 0; i < categories2.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFourRows" style="height: 14px; width: 14px; border: 7px solid #008000"></i> ' +
                                    (categories2[i] ? categories2[i] + '<br>' : '+');
                            }

                            if (CountyMDUData.length > 0) {
                                for (var i = 0; i < categories3.length; i++) {
                                    div.innerHTML +=
                                        '<i class="doughnutFourRows" style="border-radius: 0%; height: 14px; width: 14px; border: 3px solid #008000"></i> ' +
                                        (categories3[i] ? categories3[i] + '<br>' : '+');
                                }
                            }


                            return div;
                        };

                        legendCounty.addTo(CountymapModal);

                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer //,
                            //"AT&T Retail Store": ATTRstorePoints,
                            //"Authorized Reseller Store": ARstorePoints,
                            //"PSA Locations": PSALocationPoints
                        };

                        if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                        if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                        overlays["Top PSA Locations"] = PSALocationPoints;
                        if (CountyMDUData.length > 0) { overlays["High Opportunity MDUs"] = CountyMDUPoints; }
                    }
                }

                // zoom control options

                //CountymapModal.createPane('zoomlabels');
                //CountymapModal.getPane('zoomlabels').style.zIndex = 650;

                //var zoomOptions = {
                //    minZoom: 3,
                //    pane: 'zoomlabels'
                //};
                //var zoom = L.control.zoom(zoomOptions);
                //zoom.addTo(CountymapModal);

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(CountymapModal);

                CountymapModal.on('overlayadd', function () {
                    if (map.hasLayer(PSALocationPoints)) {
                        PSALocationPoints.bringToFront();
                        if (map.hasLayer(CountyMDUPoints)) {
                            CountyMDUPoints.bringToFront();
                        }
                    }
                });

                CountymapModal.invalidateSize();

            }

            var storeMapV3_National = function (storeData, VpgmData3, MarketBoundaryData, marketType) {

                $('#buttonrowcma').show();
                $('#MapDiv').show();
                $('#cmaTableDiv').show();
                $('#zipfooter').hide();
                $('#zipfooter3').hide();
                $('#zipfooter2').show();
                $('#LOADING1').hide();

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                var ATTR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });

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

                mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 8, spiderfyOnMaxZoom: false, maxClusterRadius: 120 }),
                    ATTRstorePoints = L.featureGroup.subGroup(mcg),
                    ARstorePoints = L.featureGroup.subGroup(mcg);

                for (i in ATTR) {
                    var popup =
                        //'<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                        '<b>Store Category:</b> ' + 'AT&T Retail Store' +
                        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found
                        ATTRstoreTableoptions = {
                            //icon: 'store',
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
                    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(ATTRstorePoints);
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

                    //marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    //ARstorePoints.addLayer(marker);
                    marker.addTo(ARstorePoints);
                }

                console.log(VpgmData3);

                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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

                map.on('enterFullscreen', function () {
                    //console.log('enter Fullscreen');
                    CMAFullScreenState = 1;
                });

                map.on('exitFullscreen', function () {
                    //console.log('exit Fullscreen');
                    CMAFullScreenState = 0;
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
                    featureLayer.bindPopup(feature.properties.Region);
                    //}
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
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var NUMBER_OF_PSASCOMMA = "";

                    if (props) {
                        TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
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
                                CMATouchLink = '<br /><a href="#" class="CMATouchDetailLink">Click to Show Top Fiber Opportunities</a>';
                            }
                        } else {
                            CMATouchLink = '';
                        }
                    } else {
                        CMATouchLink = '';
                    }

                    this._div.innerHTML = '<h4>CMA Information</h4>' + (props ?
                        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                        '<b>CMA: ' + props.cma + '<br />' + 'CMA Name: ' + props.Name + '</b><br />' + 'CMA Population: ' + TOTALPOPSCOMMA +
                        '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                        '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                        '<br />Number of PSAs: ' + NUMBER_OF_PSASCOMMA +
                        '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT + CMATouchLink
                        : 'Hover over a CMA');

                    $('.CMATouchDetailLink').click(function () {
                        showCMAModal(props, SelectCMALat, SelectCMALng);
                    });

                    var cssinfo = "info";

                    if (props) {
                        if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                            cssinfo = "info1";
                        } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                            cssinfo = "info2";
                        } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                            cssinfo = "info3";
                        } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                            cssinfo = "info4";
                        } else {
                            cssinfo = "info";
                        };

                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    } else {
                        this._div.classList.remove("info");
                        this._div.classList.remove("info1");
                        this._div.classList.remove("info2");
                        this._div.classList.remove("info3");
                        this._div.classList.remove("info4");
                        this._div.classList.add(cssinfo);
                    }
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
                        vectorGridCMA.resetFeatureStyle(highlight);
                        info.update();
                    }
                    highlight = null;
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
                            var p = properties.OVERALL_CAT;
                                return {
                                    fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                        p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                            p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                                p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ff9933' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff00' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                                    p == 'StrongWirelessNoFiber' ? '#4da6ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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

                vectorGridCMA4 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.OVERALL_CAT;
                            return {
                                fillColor: p == 'StrongWirelessFiberAvailable' ? '#009900' :
                                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
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
                    console.log("check for properties");
                    console.log(layer.feature.properties);
                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    info.update(layer.feature.properties);
                }

                function highlightFeatureTouch(e) {
                    SelectCMALat = (e.target.getBounds()._northEast.lat + e.target.getBounds()._southWest.lat) / 2;
                    SelectCMALng = (e.target.getBounds()._northEast.lng + e.target.getBounds()._southWest.lng) / 2;

                    //this.openPopup();
                    if (map.hasLayer(Vpgm3LayerTest)) {
                        Vpgm3LayerTest.clearLayers();
                        map.removeControl(infoDatatable);
                        map.addControl(info);
                    }
                    //map.removeLayer(Vpgm3LayerTest);
                    VpgmData3Layer.resetStyle();

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

                    info.update(layer.feature.properties);
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

                    //include the zoom in on click functionality
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


                    this.closePopup();
                    var layer = e.target;

                    //console.log(layer.feature.properties);
                    if (layer.feature.properties.FIBER_AVAILABLE > 0) { //Only Give Zip Modal Link Popup if the Zip has Fiber Available.

                        this.openPopup(e.latlng);

                        $('.CMADetailLink').click(function () {


                            if (CMAFullScreenState == 1) {
                                CMAFullScreenState = 0; // set full screen state to 0 (not full screen)
                                map.fullscreenControl.toggleFullScreen(); //exit full screen
                            }

                            console.log('user clicked at:');
                            console.log(e.latlng);
                            console.log(e.latlng.lat);
                            console.log(e.latlng.lng);
                            map.eachLayer(function (layer) {
                                layer.closePopup();
                            });
                            showCMAModal(layer.feature.properties, SelectCMALat, SelectCMALng);
                        });
                    }

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
                        layer.bindPopup('CMA #' + feature.properties.cma + ' - ' + feature.properties.Name + '<br><a href="#" class="CMADetailLink">Click to Show Top Fiber Opportunities</a>', {
                            closeButton: true,
                            autoPan: false
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
                            layer.bindPopup('CMA #' + feature.properties.cma + ' - ' + feature.properties.Name + '<br><a href="#" class="CMADetailLink">Click to Show Top Fiber Opportunities</a>', {
                                closeButton: true,
                                autoPan: false
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
                    layer: VpgmData3Layer,
                    propertyName: 'Name',
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
                    //if (e.layer._popup)
                    //    e.layer.openPopup();

                }).on('search:collapsed', function (e) {

                    VpgmData3Layer.eachLayer(function (layer) {	//restore feature color
                        VpgmData3Layer.resetStyle(layer);
                    });
                });

                map.addControl(searchControl);

                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomright' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'infolegend legend');
                    categories = ['AT&T Retail Store', 'Authorized Reseller Store'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                var overlays = {
                    "VPGM Market Borders": MarketBoundaryLayer,
                    //"CMA Overlay": vectorGridCMA,
                    "AT&T Retail Store": ATTRstorePoints,
                    "Authorized Reseller Store": ARstorePoints
                };

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

                map.on('overlayadd', function () {
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
                    if (map.hasLayer(VpgmData3Layer)) {
                        VpgmData3Layer.bringToFront();
                    }
                });

                startCMA();


            }

            function showCMAModal(props, clickedlat, clickedlong) {
                CMAModal_Click();
                updateCMAModal(props, clickedlat, clickedlong); // function for getting data for modal

            }

            function CMAModal_Click(source, eventArgs) {
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

            function updateCMAModal(props, clickedlat, clickedlong) {
                console.log('updateCMAModal Start');                
                CMAModalSelected = props.CMA;
                console.log(props);

                <%--var marketGeoStore;
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
                    } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                        marketGeo = 'OHIOPENNSYLVANIA'
                    } if (marketGeo == 'MID-ATLANTIC') {
                        marketGeo = 'MID-ATLANTIC STATES'
                    } if (marketGeo == 'ROCKY MOUNTAIN') {
                        marketGeo = 'ROCKY MOUNTAINS'
                    }
                    else { marketGeo = marketGeo }
                }

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'OHIOPENNSYLVANIA') {
                        marketGeoStore = 'OHIO PENNSYLVANIA'
                    }
                    else { marketGeoStore = marketGeo }
                }

                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('marketGeoStore: ' + marketGeoStore);--%>

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMA_Store_Detail",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': props.cma, 'LatVariable': clickedlat, 'LongVariable': clickedlong }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CMAstoreData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMA_PSA_Detail_Market",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': props.cma }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CMAPSAData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMA_MDU",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': props.cma }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CMAMDUData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMA_Business",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': props.cma }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CMABusinessData = JSON.parse(data.d);
                        },
                        error: function (data) {
                        }
                    }),

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/Get_CMAModalTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': props.cma }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                            $('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                            CMAModalTabledata = JSON.parse(data.d);

                        },
                        error: function (data, market, time, market_long) {
                        }
                    })

                ).then(function () {

                    var CMAVariable = props.cma;

                    var TOTALPOPSCOMMA = "";
                    var FIBER_AVAILABLECOMMA_CMA = "";
                    var FIBER_CUSTOMERSCOMMA_CMA = "";
                    var FIBER_OPPORTUNITYCOMMA_CMA = "";
                    var NUMBER_OF_PSASCOMMA_CMA = "";

                    if (props) {
                        TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                        FIBER_AVAILABLECOMMA_CMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA_CMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA_CMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        NUMBER_OF_PSASCOMMA_CMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                    }

                    document.getElementById('CMAModalTitle').innerHTML = 'CMA #' + props.cma + ' - ' + props.Name;
                    document.getElementById('DisplayCMA').innerHTML = props.Name + ' (CMA #' + props.cma + ')';;
                    document.getElementById('DisplayCMAPop').innerHTML = 'CMA Population: ' + TOTALPOPSCOMMA;
                    document.getElementById('DisplayWirelessCat_CMA').innerHTML = 'Wireless Category: ' + props.WIRELESS_CATEGORY;
                    document.getElementById('DisplayFiberCat_CMA').innerHTML = 'Fiber Availability: ' + props.FIBER_AVAILABILITY;
                    document.getElementById('DisplayFiberAvail_CMA').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA_CMA;
                    document.getElementById('DisplayFiberCurrent_CMA').innerHTML = 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA_CMA;
                    document.getElementById('DisplayFiberOpp_CMA').innerHTML = 'Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA_CMA;
                    document.getElementById('DisplayPSANumber_CMA').innerHTML = 'Number of PSAs: ' + NUMBER_OF_PSASCOMMA_CMA;
                    document.getElementById('DisplayATTRStore_CMA').innerHTML = 'AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT;
                    document.getElementById('DisplayARStore_CMA').innerHTML = 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT;
                    document.getElementById('DisplayALLStore_CMA').innerHTML = 'All Store Count: ' + props.ALL_STORE_COUNT;
                    //document.getElementById('DisplayPSACount_CMA').innerHTML = 'PSA Location Count: ' + props.NUMBER_OF_PSAS;

                    //ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable);

                    console.log('VpgmData3');
                    console.log(VpgmData3);
                    ShowCMAModalMap(VpgmData3, CMAstoreData, MarketBoundaryData, CMAPSAData, CMAVariable, CMAMDUData, CMABusinessData);

                    CMAModalTable(CMAModalTabledata, CMAVariable);
                    CMAMDUTable(CMAMDUData, CMAVariable);
                    CMABusinessTable(CMABusinessData, CMAVariable);

                    //next two lines for testing
                    $('#LOADING_CMA_Modal').hide();
                    $('#CMAModalTitle').show();
                    $('#ModalDisplay_CMA').show();


                });

            }

            function ShowCMAModalMap(VpgmData3, CMAstoreData, MarketBoundaryData, CMAPSAData, CMAVariable, CMAMDUData, CMABusinessData) { // ShowCMAModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable) {

                //console.log('ZipVariable2: ' + ZipVariable);

                console.log('CMAstoreData');
                console.log(CMAstoreData);

                console.log('CMAPSAData');
                console.log(CMAPSAData);

                console.log('CMAMDUData');
                console.log(CMAMDUData);

                console.log('CMABusinessData');
                console.log(CMABusinessData);

                $('#LOADING_CMA_Modal').hide();
                $('#ModalDisplay_CMA').show();

                $(window).resize();

                if (mapModal != null) {
                    mapModal.remove();
                    mapModal = null;
                }

                <%--var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();--%>

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

                    var MDU3 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var MDU4 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var MDU5 = CMAMDUData.filter(function (value) { return value.WIRELESS_SCORE == 5; });

                    $('#tab1').show(); //in case previous CMA did not have any MDUs, and the MDU tab is hidden.

                    var tab2 = document.getElementById("tab2");
                    if (tab2.classList.contains("active")) {
                        tab2.classList.remove("active");
                        var tabpane2 = document.getElementById("m_tabs_1_tab2");
                        tabpane2.classList.remove("active");

                        var tabpane1 = document.getElementById("m_tabs_1_tab1");
                        tabpane1.classList.add("active");
                        var tab1 = document.getElementById("tab1");
                        tab1.classList.add("active");
                    }

                    var tab3 = document.getElementById("tab3");
                    if (tab3.classList.contains("active")) {
                        tab3.classList.remove("active");
                        var tabpane3 = document.getElementById("m_tabs_1_tab3");
                        tabpane3.classList.remove("active");

                        var tabpane1 = document.getElementById("m_tabs_1_tab1");
                        tabpane1.classList.add("active");
                        var tab1 = document.getElementById("tab1");
                        tab1.classList.add("active");
                    }

                    var MDUPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><a href="#" class="CMAModalMDULink">Click to Export Unit Numbers</a>';
                        var addressExportText = '<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>';

                    } else {
                        var unitExportText = '<br><a href="#" class="CMAModalMDULink">Click to Show Unit Numbers</a>';
                        var addressExportText = '<br><a href="#" class="CMAModalDetailLink">Click to Show Fiber Addresses</a>';
                    }

                    for (i in MDU3) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU3[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU3[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU3[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU3[i].HOUSE_NUMBER + ' ' + MDU3[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU3[i].CITY + ', ' + MDU3[i].STATE +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalMDULink">Click to Export Unit Numbers</a>',

                            loc = [MDU3[i].LATITUDE, MDU3[i].LONGITUDE],	//position found
                            MDU3Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#00cc00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU3Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU3[i].HOUSE_NUMBER, MDU3[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }

                    for (i in MDU4) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU4[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU4[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU4[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU4[i].HOUSE_NUMBER + ' ' + MDU4[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU4[i].CITY + ', ' + MDU4[i].STATE +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalMDULink">Click to Export Unit Numbers</a>',

                            loc = [MDU4[i].LATITUDE, MDU4[i].LONGITUDE],	//position found
                            MDU4Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#008000'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#008000'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU4Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU4[i].HOUSE_NUMBER, MDU4[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }


                    for (i in MDU5) {
                        var popup =
                            '<b>High Opportunity MDU</b>' +
                            '<br/><b>Wireless Score:</b> ' + MDU5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Available:</b> ' + MDU5[i].FIBER_AVAILABLE +
                            '<br/><b>Fiber Opportunity:</b> ' + MDU5[i].FIBER_OPPORTUNITY +
                            '<br/><b>Fiber Penetration:</b> ' + MDU5[i].FIBER_PENETRATION_RATE +
                            '<br/><b>Address:</b> ' + MDU5[i].HOUSE_NUMBER + ' ' + MDU5[i].STREET_NAME +
                            '<br/><b>City:</b> ' + MDU5[i].CITY + ', ' + MDU5[i].STATE +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalMDULink">Click to Export Unit Numbers</a>',

                            loc = [MDU5[i].LATITUDE, MDU5[i].LONGITUDE],	//position found
                            MDU5Tableoptions = {
                                iconShape: 'rectangle-dot',
                                iconSize: [16, 16],
                                borderWidth: 4,
                                borderColor: '#003300'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#003300'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(MDU5Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup);
                        marker.key = [MDU5[i].HOUSE_NUMBER, MDU5[i].STREET_NAME]
                        marker.on('click', MDULinkClick);
                        MDUPoints.addLayer(marker);
                    }
                }

                else {
                    //make tab 2 active, remove active from tab 1, hide tab 1
                    var tabpane2 = document.getElementById("m_tabs_1_tab2");
                    tabpane2.classList.add("active");
                    var tab2 = document.getElementById("tab2");
                    tab2.classList.add("active");


                    var tabpane1 = document.getElementById("m_tabs_1_tab1");
                    tabpane1.classList.remove("active");
                    var tab1 = document.getElementById("tab1");
                    tab1.classList.remove("active");


                    $('#tab1').hide();

                }

                if (CMABusinessData.length > 0) {

                    var Business1 = CMABusinessData.filter(function (value) { return value.WIRELESS_SCORE == 1; });
                    var Business2 = CMABusinessData.filter(function (value) { return value.WIRELESS_SCORE == 2; });
                    var Business3 = CMABusinessData.filter(function (value) { return value.WIRELESS_SCORE == 3; });
                    var Business4 = CMABusinessData.filter(function (value) { return value.WIRELESS_SCORE == 4; });
                    var Business5 = CMABusinessData.filter(function (value) { return value.WIRELESS_SCORE == 5; });

                    $('#tab1').show(); //in case previous CMA did not have any Business Locations, and the Business Locations tab is hidden.

                    var tab2 = document.getElementById("tab2");
                    if (tab2.classList.contains("active")) {
                        tab2.classList.remove("active");
                        var tabpane2 = document.getElementById("m_tabs_1_tab2");
                        tabpane2.classList.remove("active");

                        var tabpane1 = document.getElementById("m_tabs_1_tab1");
                        tabpane1.classList.add("active");
                        var tab1 = document.getElementById("tab1");
                        tab1.classList.add("active");
                    }

                    var tab3 = document.getElementById("tab3");
                    if (tab3.classList.contains("active")) {
                        tab3.classList.remove("active");
                        var tabpane3 = document.getElementById("m_tabs_1_tab3");
                        tabpane3.classList.remove("active");

                        var tabpane1 = document.getElementById("m_tabs_1_tab1");
                        tabpane1.classList.add("active");
                        var tab1 = document.getElementById("tab1");
                        tab1.classList.add("active");
                    }

                    var BusinessPoints = new L.layerGroup();

                    if (Access == "Unlimited") {
                        var unitExportText = '<br><a href="#" class="CMAModalBusinessLink">Click to Export Business Tenants</a>';
                        var addressExportText = '<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>';

                    } else {
                        var unitExportText = '<br><a href="#" class="CMAModalBusinessLink">Click to Show Business Tenants</a>';
                        var addressExportText = '<br><a href="#" class="CMAModalDetailLink">Click to Show Fiber Addresses</a>';
                    }

                    for (i in Business1) {

                        var backgroundFiberStatus;
                        if (Business1[i].FIBER_STATUS == 'Green (Fiber Lit)') { backgroundFiberStatus = '#000000'; }
                        else if (Business1[i].FIBER_STATUS == 'Light Green (Fiber Near)') { backgroundFiberStatus = '#ffffff'; }
                        else backgroundFiberStatus = '#ffffff';

                        var Tenant1;
                        if (Business1[i].TENANT1 == null) { Tenant1 = ''; }
                        else { Tenant1 = '<br/><b>Tenant 1: </b>' + Business1[i].TENANT1_TABLE };

                        var Tenant2;
                        if (Business1[i].TENANT2 == null) { Tenant2 = ''; }
                        else { Tenant2 = '<br/><b>Tenant 2: </b>' + Business1[i].TENANT2_TABLE };

                        var Tenant3;
                        if (Business1[i].TENANT3 == null) { Tenant3 = ''; }
                        else { Tenant3 = '<br/><b>Tenant 3: </b>' + Business1[i].TENANT3_TABLE };

                        var Tenant4;
                        if (Business1[i].TENANT4 == null) { Tenant4 = ''; }
                        else { Tenant4 = '<br/><b>Tenant 4: </b>' + Business1[i].TENANT4_TABLE };

                        var Tenant5;
                        if (Business1[i].TENANT5 == null) { Tenant5 = ''; }
                        else { Tenant5 = '<br/><b>Tenant 5: </b>' + Business1[i].TENANT5_TABLE };

                        var popup =
                            '<b>Top Business Location</b>' +
                            '<br/><b>Address:</b> ' + Business1[i].ADDRESS +
                            '<br/><b>City, St Zip:</b> ' + Business1[i].CITY + ', ' + Business1[i].STATE + '  ' + Business1[i].ZIP +                            
                            '<br/><b>Wireless Score:</b> ' + Business1[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Status:</b> ' + Business1[i].FIBER_STATUS +
                            '<br/><b>MIKEY:</b> ' + Business1[i].MIKEY +
                            '<br/><b>Tenant Count:</b> ' + Business1[i].TENANT_COUNT +                            
                            '<br/><b>Top 5 Tenants</b>' +
                            Tenant1 +
                            Tenant2 +
                            Tenant3 +
                            Tenant4 +
                            Tenant5 +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalBusinessLink">Click to Export Unit Numbers</a>',

                            loc = [Business1[i].LATITUDE, Business1[i].LONGITUDE],	//position found                            
                            Business1Tableoptions = {
                                //icon: '',
                                iconShape: 'circle-dot',
                                iconSize: [18, 18],
                                borderColor: backgroundFiberStatus,
                                //textColor: 'Red',
                                borderWidth: 3,
                                backgroundColor: '#e6b800',
                                //innerIconStyle: 'font-size:12px;padding-top:1px;'

                                //iconShape: 'circle-dot',
                                //iconSize: [16, 16],
                                //borderWidth: 4,
                                //borderColor: '#00cc00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                                //html: '<span style="width: 18px; height: 18px; border-radius: 50%; background-color: #e6b800; border: 3px solid ' + backgroundFiberStatus + '; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span>'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(Business1Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup, { maxWidth: 500 });
                        marker.key = [Business1[i].MIKEY]
                        marker.on('click', BusinessLinkClick);
                        BusinessPoints.addLayer(marker);
                    }

                    for (i in Business2) {

                        var backgroundFiberStatus;
                        if (Business2[i].FIBER_STATUS == 'Green (Fiber Lit)') { backgroundFiberStatus = '#000000'; }
                        else if (Business2[i].FIBER_STATUS == 'Light Green (Fiber Near)') { backgroundFiberStatus = '#ffffff'; }
                        else backgroundFiberStatus = '#ffffff';

                        var Tenant1;
                        if (Business2[i].TENANT1 == null) { Tenant1 = ''; }
                        else { Tenant1 = '<br/><b>Tenant 1: </b>' + Business2[i].TENANT1_TABLE };

                        var Tenant2;
                        if (Business2[i].TENANT2 == null) { Tenant2 = ''; }
                        else { Tenant2 = '<br/><b>Tenant 2: </b>' + Business2[i].TENANT2_TABLE };

                        var Tenant3;
                        if (Business2[i].TENANT3 == null) { Tenant3 = ''; }
                        else { Tenant3 = '<br/><b>Tenant 3: </b>' + Business2[i].TENANT3_TABLE };

                        var Tenant4;
                        if (Business2[i].TENANT4 == null) { Tenant4 = ''; }
                        else { Tenant4 = '<br/><b>Tenant 4: </b>' + Business2[i].TENANT4_TABLE };

                        var Tenant5;
                        if (Business2[i].TENANT5 == null) { Tenant5 = ''; }
                        else { Tenant5 = '<br/><b>Tenant 5: </b>' + Business2[i].TENANT5_TABLE };

                        var popup =
                            '<b>Top Business Location</b>' +
                            '<br/><b>Address:</b> ' + Business2[i].ADDRESS +
                            '<br/><b>City, St Zip:</b> ' + Business2[i].CITY + ', ' + Business2[i].STATE + '  ' + Business2[i].ZIP +                            
                            '<br/><b>Wireless Score:</b> ' + Business2[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Status:</b> ' + Business2[i].FIBER_STATUS +
                            '<br/><b>MIKEY:</b> ' + Business2[i].MIKEY +
                            '<br/><b>Tenant Count:</b> ' + Business2[i].TENANT_COUNT +                            
                            '<br/><b>Top 5 Tenants</b>' +
                            Tenant1 +
                            Tenant2 +
                            Tenant3 +
                            Tenant4 +
                            Tenant5 +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalBusinessLink">Click to Export Unit Numbers</a>',

                            loc = [Business2[i].LATITUDE, Business2[i].LONGITUDE],	//position found                            
                            Business2Tableoptions = {
                                //icon: '',
                                iconShape: 'circle-dot',
                                iconSize: [18, 18],
                                borderColor: backgroundFiberStatus,
                                //textColor: 'Red',
                                borderWidth: 3,
                                backgroundColor: '#ffff00',
                                //innerIconStyle: 'font-size:12px;padding-top:1px;'

                                //iconShape: 'circle-dot',
                                //iconSize: [16, 16],
                                //borderWidth: 4,
                                //borderColor: '#00cc00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                                //html: '<span style="width: 18px; height: 18px; border-radius: 50%; background-color: #ffff00; border: 3px solid ' + backgroundFiberStatus + '; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span>'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(Business2Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup, { maxWidth: 500 });
                        marker.key = [Business2[i].MIKEY]
                        marker.on('click', BusinessLinkClick);
                        BusinessPoints.addLayer(marker);
                    }

                    for (i in Business3) {

                        var backgroundFiberStatus;
                        if (Business3[i].FIBER_STATUS == 'Green (Fiber Lit)') { backgroundFiberStatus = '#000000'; }
                        else if (Business3[i].FIBER_STATUS == 'Light Green (Fiber Near)') { backgroundFiberStatus = '#ffffff'; }
                        else backgroundFiberStatus = '#ffffff';

                        var Tenant1;
                        if (Business3[i].TENANT1 == null) { Tenant1 = ''; }
                        else { Tenant1 = '<br/><b>Tenant 1: </b>' + Business3[i].TENANT1_TABLE };

                        var Tenant2;
                        if (Business3[i].TENANT2 == null) { Tenant2 = ''; }
                        else { Tenant2 = '<br/><b>Tenant 2: </b>' + Business3[i].TENANT2_TABLE };

                        var Tenant3;
                        if (Business3[i].TENANT3 == null) { Tenant3 = ''; }
                        else { Tenant3 = '<br/><b>Tenant 3: </b>' + Business3[i].TENANT3_TABLE };

                        var Tenant4;
                        if (Business3[i].TENANT4 == null) { Tenant4 = ''; }
                        else { Tenant4 = '<br/><b>Tenant 4: </b>' + Business3[i].TENANT4_TABLE };

                        var Tenant5;
                        if (Business3[i].TENANT5 == null) { Tenant5 = ''; }
                        else { Tenant5 = '<br/><b>Tenant 5: </b>' + Business3[i].TENANT5_TABLE };

                        var popup =
                            '<b>Top Business Location</b>' +
                            '<br/><b>Address:</b> ' + Business3[i].ADDRESS +
                            '<br/><b>City, St Zip:</b> ' + Business3[i].CITY + ', ' + Business3[i].STATE + '  ' + Business3[i].ZIP +                            
                            '<br/><b>Wireless Score:</b> ' + Business3[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Status:</b> ' + Business3[i].FIBER_STATUS +
                            '<br/><b>MIKEY:</b> ' + Business3[i].MIKEY +
                            '<br/><b>Tenant Count:</b> ' + Business3[i].TENANT_COUNT +                            
                            '<br/><b>Top 5 Tenants</b>' +
                            Tenant1 +
                            Tenant2 +
                            Tenant3 +
                            Tenant4 +
                            Tenant5 +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalBusinessLink">Click to Export Unit Numbers</a>',

                            loc = [Business3[i].LATITUDE, Business3[i].LONGITUDE],	//position found                            
                            Business3Tableoptions = {
                                //icon: '',
                                iconShape: 'circle-dot',
                                iconSize: [18, 18],
                                borderColor: backgroundFiberStatus,
                                //textColor: 'Red',
                                borderWidth: 3,
                                backgroundColor: '#00cc00',
                                //innerIconStyle: 'font-size:12px;padding-top:1px;'

                                //iconShape: 'circle-dot',
                                //iconSize: [16, 16],
                                //borderWidth: 4,
                                //borderColor: '#00cc00'
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#00cc00'
                                //html: '<span style="width: 18px; height: 18px; border-radius: 50%; background-color: #00cc00; border: 3px solid ' + backgroundFiberStatus + '; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span>'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(Business3Tableoptions) });                        
                        marker.setOpacity(.7);
                        marker.bindPopup(popup, { maxWidth: 500 });
                        marker.key = [Business3[i].MIKEY]
                        marker.on('click', BusinessLinkClick);
                        BusinessPoints.addLayer(marker);
                    }

                    for (i in Business4) {
                        var backgroundFiberStatus;
                        if (Business4[i].FIBER_STATUS == 'Green (Fiber Lit)') { backgroundFiberStatus = '#000000'; }
                        else if (Business4[i].FIBER_STATUS == 'Light Green (Fiber Near)') { backgroundFiberStatus = '#ffffff'; }
                        else backgroundFiberStatus = '#ffffff';

                        var Tenant1;
                        if (Business4[i].TENANT1 == null) { Tenant1 = ''; }
                        else { Tenant1 = '<br/><b>Tenant 1: </b>' + Business4[i].TENANT1_TABLE };

                        var Tenant2;
                        if (Business4[i].TENANT2 == null) { Tenant2 = ''; }
                        else { Tenant2 = '<br/><b>Tenant 2: </b>' + Business4[i].TENANT2_TABLE };

                        var Tenant3;
                        if (Business4[i].TENANT3 == null) { Tenant3 = ''; }
                        else { Tenant3 = '<br/><b>Tenant 3: </b>' + Business4[i].TENANT3_TABLE };

                        var Tenant4;
                        if (Business4[i].TENANT4 == null) { Tenant4 = ''; }
                        else { Tenant4 = '<br/><b>Tenant 4: </b>' + Business4[i].TENANT4_TABLE };

                        var Tenant5;
                        if (Business4[i].TENANT5 == null) { Tenant5 = ''; }
                        else { Tenant5 = '<br/><b>Tenant 5: </b>' + Business4[i].TENANT5_TABLE };

                        var popup =
                            '<b>Top Business Location</b>' +
                            '<br/><b>Address:</b> ' + Business4[i].ADDRESS +
                            '<br/><b>City, St Zip:</b> ' + Business4[i].CITY + ', ' + Business4[i].STATE + '  ' + Business4[i].ZIP +                            
                            '<br/><b>Wireless Score:</b> ' + Business4[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Status:</b> ' + Business4[i].FIBER_STATUS +
                            '<br/><b>MIKEY:</b> ' + Business4[i].MIKEY +
                            '<br/><b>Tenant Count:</b> ' + Business4[i].TENANT_COUNT +                            
                            '<br/><b>Top 5 Tenants</b>' +
                            Tenant1 +
                            Tenant2 +
                            Tenant3 +
                            Tenant4 +
                            Tenant5 +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalBusinessLink">Click to Export Unit Numbers</a>',

                            loc = [Business4[i].LATITUDE, Business4[i].LONGITUDE],	//position found
                            Business4Tableoptions = {
                                //icon: '',
                                iconShape: 'circle-dot',
                                iconSize: [18, 18],
                                borderColor: backgroundFiberStatus,
                                //textColor: 'Red',
                                borderWidth: 3,
                                backgroundColor: '#008000',
                                //innerIconStyle: 'font-size:12px;padding-top:1px;'

                                //iconShape: 'circle-dot',
                                //iconSize: [18, 18],
                                //borderWidth: 3,
                                //borderColor: backgroundFiberStatus,
                                //borderWidth: 2,
                                //borderColor: '#FF0000',
                                //backgroundColor: '#008000'
                                //html: '<span style="width: 18px; height: 18px; border-radius: 50%; background-color: #008000; border: 3px solid ' + backgroundFiberStatus + '; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span>'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(Business4Tableoptions) });
                        marker.setOpacity(.7);
                        marker.bindPopup(popup, { maxWidth: 500 });
                        marker.key = [Business4[i].MIKEY]
                        marker.on('click', BusinessLinkClick);
                        BusinessPoints.addLayer(marker);
                    }


                    for (i in Business5) {

                        var backgroundFiberStatus;
                        if (Business5[i].FIBER_STATUS == 'Green (Fiber Lit)') { backgroundFiberStatus = '#000000'; }
                        else if (Business5[i].FIBER_STATUS == 'Light Green (Fiber Near)') { backgroundFiberStatus = '#ffffff'; }
                        else backgroundFiberStatus = '#ffffff';

                        var Tenant1;
                        if (Business5[i].TENANT1 == null) { Tenant1 = ''; }
                        else { Tenant1 = '<br/><b>Tenant 1: </b>' + Business5[i].TENANT1_TABLE };

                        var Tenant2;
                        if (Business5[i].TENANT2 == null) { Tenant2 = ''; }
                        else { Tenant2 = '<br/><b>Tenant 2: </b>' + Business5[i].TENANT2_TABLE };

                        var Tenant3;
                        if (Business5[i].TENANT3 == null) { Tenant3 = ''; }
                        else { Tenant3 = '<br/><b>Tenant 3: </b>' + Business5[i].TENANT3_TABLE };

                        var Tenant4;
                        if (Business5[i].TENANT4 == null) { Tenant4 = ''; }
                        else { Tenant4 = '<br/><b>Tenant 4: </b>' + Business5[i].TENANT4_TABLE };

                        var Tenant5;
                        if (Business5[i].TENANT5 == null) { Tenant5 = ''; }
                        else { Tenant5 = '<br/><b>Tenant 5: </b>' + Business5[i].TENANT5_TABLE };

                        var popup =
                            '<b>Top Business Location</b>' +
                            '<br/><b>Address:</b> ' + Business5[i].ADDRESS +
                            '<br/><b>City, St Zip:</b> ' + Business5[i].CITY + ', ' + Business5[i].STATE + '  ' + Business5[i].ZIP +                            
                            '<br/><b>Wireless Score:</b> ' + Business5[i].WIRELESS_SCORE_TEXT +
                            '<br/><b>Fiber Status:</b> ' + Business5[i].FIBER_STATUS +
                            '<br/><b>MIKEY:</b> ' + Business5[i].MIKEY +
                            '<br/><b>Tenant Count:</b> ' + Business5[i].TENANT_COUNT +                            
                            '<br/><b>Top 5 Tenants</b>' +
                            Tenant1 +
                            Tenant2 +
                            Tenant3 +
                            Tenant4 +
                            Tenant5 +
                            unitExportText,
                            //'<br><a href="#" class="CMAModalBusinessLink">Click to Export Unit Numbers</a>',

                            loc = [Business5[i].LATITUDE, Business5[i].LONGITUDE],	//position found                            
                            
                            Business5Tableoptions = {
                                //icon: '',
                                iconShape: 'circle-dot',
                                iconSize: [18, 18],
                                borderColor: backgroundFiberStatus,
                                //textColor: 'Red',
                                borderWidth: 3,
                                backgroundColor: '#003300',
                                //innerIconStyle: 'font-size:12px;padding-top:1px;'

                                //    iconShape: 'circle-dot',
                                //    iconSize: [16, 16],
                                //    borderWidth: 4,
                                //    borderColor: '#003300'
                                //    //borderWidth: 2,
                                //    //borderColor: '#FF0000',
                                //    //backgroundColor: '#003300'
                                //html: '<span style="width: 18px; height: 18px; border-radius: 50%; background-color: #003300; border: 3px solid ' + backgroundFiberStatus + '; box-shadow: 0 0 0 1px #000000; display: inline-block; vertical-align: middle;"></></span>'
                            };

                        marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(Business5Tableoptions) });
                        
                        marker.setOpacity(.7);
                        marker.bindPopup(popup, { maxWidth: 500 });
                        marker.key = [Business5[i].MIKEY]
                        marker.on('click', BusinessLinkClick);
                        BusinessPoints.addLayer(marker);
                    }
                }

                else {
                    //make tab 2 active, remove active from tab 3, hide tab 3
                    var tabpane1 = document.getElementById("m_tabs_1_tab1");
                    tabpane1.classList.add("active");
                    var tab1 = document.getElementById("tab1");
                    tab1.classList.add("active");

                    var tabpane2 = document.getElementById("m_tabs_1_tab2");
                    tabpane2.classList.remove("active");
                    var tab2 = document.getElementById("tab2");
                    tab2.classList.remove("active");


                    var tabpane3 = document.getElementById("m_tabs_1_tab3");
                    tabpane3.classList.remove("active");
                    var tab3 = document.getElementById("tab3");
                    tab3.classList.remove("active");


                    $('#tab3').hide();

                }

                var PSA0 = CMAPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA0");
                });
                var PSA1 = CMAPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA1");
                });
                var PSA2 = CMAPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA2");
                });
                var PSA3 = CMAPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA3");
                });
                var PSA4 = CMAPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA4");
                });
                var PSA5 = CMAPSAData.filter(function (el) {
                    return el.PSA_SCORE.includes("PSA5");
                });

                PSALocationPoints = new L.layerGroup();

                for (i in PSA0) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA0[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA0[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA0[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA0[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA0[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>',

                        loc = [PSA0[i].LATITUDE, PSA0[i].LONGITUDE],	//position found
                        PSA0Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#ffffff'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA0Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA0[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA1) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA1[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA1[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA1[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA1[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA1[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>',

                        loc = [PSA1[i].LATITUDE, PSA1[i].LONGITUDE],	//position found
                        PSA1Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#e6b800'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA1Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA1[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA2) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA2[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA2[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA2[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA2[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA2[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>',

                        loc = [PSA2[i].LATITUDE, PSA2[i].LONGITUDE],	//position found
                        PSA2Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#ffff00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA2Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA2[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA3) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA3[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA3[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA3[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA3[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA3[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>',

                        loc = [PSA3[i].LATITUDE, PSA3[i].LONGITUDE],	//position found
                        PSA3Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#00cc00'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA3Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA3[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA4) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA4[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA4[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA4[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA4[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA4[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>',

                        loc = [PSA4[i].LATITUDE, PSA4[i].LONGITUDE],	//position found
                        PSA4Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#008000'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA4Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA4[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                for (i in PSA5) {
                    var popup =
                        '<b>Top PSA Location</b>' +
                        '<br/><b>ZIP CO PSA:</b> ' + PSA5[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA5[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA5[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA5[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA5[i].FIBER_OPPORTUNITY +
                        addressExportText,
                        //'<br><a href="#" class="CMAModalDetailLink">Click to Export Fiber Addresses</a>',

                        loc = [PSA5[i].LATITUDE, PSA5[i].LONGITUDE],	//position found
                        PSA5Tableoptions = {
                            iconShape: 'circle-dot',
                            iconSize: [14, 14],
                            borderWidth: 9,
                            borderColor: '#003300'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(PSA5Tableoptions) });
                    //markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) };
                    //marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    marker.key = PSA5[i].ZIP_CO_PSA;
                    marker.on('click', onClick);
                    PSALocationPoints.addLayer(marker);
                }

                //document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                //document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('myCMAModalMap').innerHTML = "<div id='CMAModalMap' style='height: 400px;'></div>";

                var sat = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
                    id: 'arcgis.sat',
                    maxZoom: 19,
                    zIndex: 1,
                    attribution: 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid, IGN, IGP, UPR-EGP, and the GIS User Community',
                    subdomains: ['a', 'b', 'c']
                }),
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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

                //console.log('mapModalOptions1');
                //console.log(mapModalOptions);

                mapModalOptions.layers.push(streets);
                if (ATTR.length > 0) { mapModalOptions.layers.push(ATTRstorePoints); }
                if (AR.length > 0) { mapModalOptions.layers.push(ARstorePoints); }
                //if (CMAPSAData.length > 0) { mapModalOptions.layers.push(PSALocationPoints); console.log('PSA points found'); }
                if (CMAMDUData.length > 0) { mapModalOptions.layers.push(MDUPoints); }
                //if (CMABusinessData.length > 0) { mapModalOptions.layers.push(BusinessPoints); }

                //console.log('mapModalOptions2');
                //console.log(mapModalOptions);

                mapModal = L.map("CMAModalMap", mapModalOptions);


                function onClick(e) {
                    SelectedPSA = this.key;
                }

                mapModal.on('popupopen', function (e) {
                    $('.CMAModalDetailLink').click(function (e) {
                        console.log("Clicked PSA: " + SelectedPSA);
                        selectedPSAGetExport();
                    });
                });

                $('#ulCMAtabs').on("click", "li", function (event) {
                    var selectedTab = $(this).find('a').attr('href');
                    console.log(selectedTab);
                    if (selectedTab == "#m_tabs_1_tab1") {
                        $('#businessFooterMapModal').hide();
                        mapModal.removeLayer(PSALocationPoints);
                        mapModal.removeLayer(BusinessPoints);
                        mapModal.addLayer(MDUPoints);
                    };
                    if (selectedTab == "#m_tabs_1_tab2")
                    {
                        $('#businessFooterMapModal').hide();
                        mapModal.removeLayer(MDUPoints);
                        mapModal.removeLayer(BusinessPoints);
                        mapModal.addLayer(PSALocationPoints);
                    };
                    if (selectedTab == "#m_tabs_1_tab3")
                    {
                        $('#businessFooterMapModal').show();
                        mapModal.removeLayer(MDUPoints);
                        mapModal.removeLayer(PSALocationPoints);
                        mapModal.addLayer(BusinessPoints);
                    };
                });

                function selectedPSAGetExport() {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonPSALocations.ClientID %>");
                        clickButton.click();
                        console.log("Clicked PSA2: " + SelectedPSA);
                    } else {
                        document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        PSACMAShowAddressesFromMapClick(SelectedPSA);
                        console.log("Clicked PSA2: " + SelectedPSA);
                    }
                }

                function PSACMAShowAddressesFromMapClick(SelectedPSA) {

                    var PSAVariable = SelectedPSA;
                    console.log('PSA: ' + PSAVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + CMAVariable + ' - ' + 'PSA: ' + PSAVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_PSAAddressesCMAFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'PSAVariable': PSAVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataCMAUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function MDULinkClick(e) {
                    console.log(this.key);
                    SpecificMDUHouse = this.key[0];
                    SpecificMDUStreet = this.key[1];
                }

                function BusinessLinkClick(e) {
                    console.log(this.key);
                    SpecificBusinessMikey = this.key[0];
                }

                mapModal.on('popupopen', function (e) {
                    $('.CMAModalMDULink').click(function (e) {
                        console.log("SpecificMDUHouse: " + SpecificMDUHouse);
                        console.log("SpecificMDUStreet: " + SpecificMDUStreet);
                        SpecificMDUGetAddresses(SpecificMDUHouse, SpecificMDUStreet);
                    });
                });

                mapModal.on('popupopen', function (e) {
                    $('.CMAModalBusinessLink').click(function (e) {
                        console.log("SpecificBusinessMikey: " + SpecificBusinessMikey);
                        SpecificBusinessGetTenants(SpecificBusinessMikey);
                    });
                });

                function SpecificMDUGetAddresses(housenumber, streetname) {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = housenumber;
                        document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = streetname;                        
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUAddresses.ClientID %>");
                        clickButton.click();
                        // AlertAddressExport();
                    } else {
                        document.getElementById('<%= hf_SelectedMDU_CMA_House.ClientID %>').value = housenumber;
                        document.getElementById('<%= hf_SelectedMDU_CMA_Street.ClientID %>').value = streetname;
                        var clickButton = document.getElementById("<%= ButtonSelectedMDUShowAddresses.ClientID %>");
                        clickButton.click();
                        MDUCMAShowAddressesFromMapClick(housenumber, streetname);
                    }
                }

                function SpecificBusinessGetTenants(mikey) {
                    if (Access == "Unlimited") {
                        document.getElementById('<%= hf_SelectedBusiness_CMA_Mikey.ClientID %>').value = mikey;
                        var clickButton = document.getElementById("<%= ButtonSelectedBusinessTenants.ClientID %>");
                        clickButton.click();
                        // AlertAddressExport();
                    } else {
                        document.getElementById('<%= hf_SelectedBusiness_CMA_Mikey.ClientID %>').value = mikey;
                        var clickButton = document.getElementById("<%= ButtonSelectedBusinessShowTenants.ClientID %>");
                        clickButton.click();
                        BusinessCMAShowAddressesFromMapClick(mikey);
                    }
                }

                function MDUCMAShowAddressesFromMapClick(housenumber, streetname) {

                    var cmaVariable = CMAVariable;
                    console.log('cma: ' + cmaVariable);
                    var houseVariable = housenumber;
                    console.log('house: ' + houseVariable);
                    var streetVariable = streetname;
                    console.log('street: ' + streetVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + cmaVariable + ' - ' + houseVariable + ' ' + streetVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_MDUAddressesCMAFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': cmaVariable, 'houseVariable': houseVariable, 'streetVariable': streetVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            unitNumbersData = JSON.parse(data.d);
                            showDataCMAUnitNumbers(unitNumbersData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function BusinessCMAShowAddressesFromMapClick(mikey) {

                    var cmaVariable = CMAVariable;
                    console.log('cma: ' + cmaVariable);
                    var mikeyVariable = mikey;
                    console.log('mikey: ' + mikeyVariable);

                    $('#showDataModalTableDiv').hide();
                    $('#LOADING_showData_Modal').show();

                    document.getElementById('showDataModalTitle').innerHTML = 'CMA: ' + cmaVariable + ' - MIKEY: ' + mikeyVariable;

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_TestingV2.aspx/showData_BusinessTenantsCMAFromMap",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': cmaVariable, 'mikeyVariable': mikeyVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            tenantsData = JSON.parse(data.d);
                            showDataCMATenants(tenantsData);
                        },
                        error: function (data) {
                        }
                    })

                }

                function showDataCMAUnitNumbers(data) {
                    console.log('showDataModal_MDUtable');
                    $('#showDataModal_MDUtable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_MDUtable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'HOUSE_NUMBER' },
                            { 'data': 'PREFIX' },
                            { 'data': 'STREET_NAME' },
                            { 'data': 'UNIT_NUMBER' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'SERVICE_STATUS' },
                            { 'data': 'DWELLING_TYPE' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

                }

                function showDataCMATenants(data) {
                    console.log('showDataModal_Businesstable');
                    
                    $('#showDataModal_Businesstable').dataTable().fnDestroy(); //destroy old table

                    $('#LOADING_showData_Modal').hide();
                    $('#showDataModalTableDiv').show();
                    groupByFilter();

                    var table = $('#showDataModal_Businesstable');

                    // begin first table
                    table.DataTable({
                        //responsive: true,
                        data: data,
                        paging: false,
                        //deferRender: true,
                        scrollY: '300px',
                        scrollCollapse: true,
                        scrollX: true,
                        //scroller: true,
                        sort: false,
                        //order: [[4, "desc"]],
                        dom: 'frtip',
                        //columnDefs: [{ width: 50, targets: [0, 1, 3] }, { width: 55, targets: [7, 8, 9] }],
                        columns: [
                            { 'data': 'MIKEY' },
                            { 'data': 'CMA' },
                            { 'data': 'FIBER_STATUS' },
                            { 'data': 'ADDRESS' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP' },
                            { 'data': 'WIRELESS_SCORE' },
                            { 'data': 'TENANT_COUNT' },
                            { 'data': 'TENANT1' },
                            { 'data': 'TENANT2' },
                            { 'data': 'TENANT3' }
                        ],

                        initComplete: function () {
                            this.api().columns().header().each(function (th) {
                                $(th).removeClass("sorting_asc");
                                $(th).removeClass("sorting");
                            });
                        },
                    });

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


                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legendCMA = L.control({ position: 'bottomright' });
                var legendCMANoPSA = L.control({ position: 'bottomright' });

                if (CMAPSAData.length <= 0) { //(ZipPSAData.length <= 0)

                    legendCMANoPSA.onAdd = function (mapModal) {

                        var div = L.DomUtil.create('div', 'infolegendTwoRows legendTwoRows');

                        categories = [];
                        if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                        if (AR.length > 0) { categories.push('Authorized Reseller Store'); }


                        //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];


                        //for (var i = 0; i < categories.length; i++) {
                        //    div.innerHTML +=
                        //        '<i class="doughnutCMANoPSA" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                        //        (categories[i] ? categories[i] + '<br>' : '+');
                        //}

                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutTwoRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        return div;
                    };

                    legendCMANoPSA.addTo(mapModal);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer //,
                        //"AT&T Retail Store": ATTRstorePoints,
                        //"Authorized Reseller Store": ARstorePoints
                    };

                    if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                    if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }


                } else {

                    if (CMAMDUData.length <= 0) {

                        legendCMA.onAdd = function (mapModal) {

                            var div = L.DomUtil.create('div', 'infolegendFourRows legendFourRows');

                            //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                            categories = [];
                            if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                            if (AR.length > 0) { categories.push('Authorized Reseller Store'); }
                            if (CMABusinessData.length > 0) { categories4 = ['Top Business Locations']; }

                            categories2 = ['Top PSA Locations'];



                            for (var i = 0; i < categories.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFourRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                    (categories[i] ? categories[i] + '<br>' : '+');
                            }

                            for (var i = 0; i < categories2.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFourRows" style="height: 14px; width: 14px; border: 7px solid #008000"></i> ' +
                                    (categories2[i] ? categories2[i] + '<br>' : '+');
                            }

                            if (CMABusinessData.length > 0) {
                                for (var i = 0; i < categories4.length; i++) {
                                    div.innerHTML +=
                                        '<i class="doughnutFourRows" style="border-radius: 50%; height: 14px; width: 14px; border: 3px solid #008000"></i> ' +
                                        (categories4[i] ? categories4[i] + '<br>' : '+');
                                }
                            }


                            return div;
                        };

                        legendCMA.addTo(mapModal);

                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer //,
                            //"AT&T Retail Store": ATTRstorePoints,
                            //"Authorized Reseller Store": ARstorePoints,
                            //"PSA Locations": PSALocationPoints
                        };

                        if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                        if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                        overlays["Top PSA Locations"] = PSALocationPoints;
                        if (CMAMDUData.length > 0) { overlays["High Opportunity MDUs"] = MDUPoints; }
                        if (CMABusinessData.length > 0) { overlays["Top Business Locations"] = BusinessPoints; }
                    }

                    else {

                        legendCMA.onAdd = function (mapModal) {

                            var div = L.DomUtil.create('div', 'infolegendFiveRows legendFiveRows');

                            //categories = ['AT&T Retail Store', 'Authorized Reseller Store'];
                            categories = [];
                            if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                            if (AR.length > 0) { categories.push('Authorized Reseller Store'); }
                            if (CMAMDUData.length > 0) { categories3 = ['High Opportunity MDUs']; }
                            if (CMABusinessData.length > 0) { categories4 = ['Top Business Locations']; }
                            categories2 = ['Top PSA Locations'];



                            for (var i = 0; i < categories.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFiveRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                    (categories[i] ? categories[i] + '<br>' : '+');
                            }

                            for (var i = 0; i < categories2.length; i++) {
                                div.innerHTML +=
                                    '<i class="doughnutFiveRows" style="height: 14px; width: 14px; border: 7px solid #008000"></i> ' +
                                    (categories2[i] ? categories2[i] + '<br>' : '+');
                            }

                            if (CMAMDUData.length > 0) {
                                for (var i = 0; i < categories3.length; i++) {
                                    div.innerHTML +=
                                        '<i class="doughnutFiveRows" style="border-radius: 0%; height: 14px; width: 14px; border: 3px solid #008000"></i> ' +
                                        (categories3[i] ? categories3[i] + '<br>' : '+');
                                }
                            }

                            if (CMABusinessData.length > 0) {
                                for (var i = 0; i < categories4.length; i++) {
                                    div.innerHTML +=
                                        '<i class="doughnutFiveRows" style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; border: 3px solid #000000; box-shadow: 0 0 0 1px #000000"></i> ' +
                                        (categories4[i] ? categories4[i] + '<br>' : '+');
                                }
                            }

                            return div;
                        };

                        legendCMA.addTo(mapModal);

                        var overlays = {
                            "VPGM Market Borders": MarketBoundaryLayer //,
                            //"AT&T Retail Store": ATTRstorePoints,
                            //"Authorized Reseller Store": ARstorePoints,
                            //"PSA Locations": PSALocationPoints
                        };

                        if (ATTR.length > 0) { overlays["AT&T Retail Store"] = ATTRstorePoints; }
                        if (AR.length > 0) { overlays["Authorized Reseller Store"] = ARstorePoints; }
                        overlays["Top PSA Locations"] = PSALocationPoints;
                        if (CMAMDUData.length > 0) { overlays["High Opportunity MDUs"] = MDUPoints; }
                        if (CMABusinessData.length > 0) { overlays["Top Business Locations"] = BusinessPoints; }
                    }
                }

                // zoom control options

                //mapModal.createPane('zoomlabels');
                //mapModal.getPane('zoomlabels').style.zIndex = 650;

                //var zoomOptions = {
                //    minZoom: 3,
                //    pane: 'zoomlabels'
                //};
                //var zoom = L.control.zoom(zoomOptions);
                //zoom.addTo(mapModal);

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);

                mapModal.on('overlayadd', function (eventLayer) {
                    if (map.hasLayer(PSALocationPoints)) {
                        console.log('**--**--** map has PSA layer **--**--**');
                        PSALocationPoints.bringToFront();
                        if (map.hasLayer(MDUPoints)) {
                            MDUPoints.bringToFront();
                        }
                        if (map.hasLayer(BusinessPoints)) {
                            
                            BusinessPoints.bringToFront();
                        }
                    }
                    if (map.hasLayer(BusinessPoints)) {
                        console.log('**--**--** map has business layer **--**--**');
                        $('#businessFooterMapModal').show();
                    }
                });

                mapModal.invalidateSize();

            }

            var storeMapV3 = function (VpgmData, storeData, VpgmData2, VpgmData3, MarketBoundaryData) {

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

                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                //var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                //    id: 'osm.grayscale',
                //    maxZoom: 18,
                //    zIndex: 1,
                //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                //    subdomains: ['a', 'b', 'c']
                //}),
                var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    streets = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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

                }).on('search:collapsed', function (e) {

                    VpgmDataLayer.eachLayer(function (layer) {	//restore feature color
                        VpgmDataLayer.resetStyle(layer);
                    });
                });

                map.addControl(searchControl);

                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomright' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'infolegend legend');
                    categories = ['AT&T Retail Store', 'Authorized Reseller Store'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                var overlays = {
                    "VPGM Market Borders": MarketBoundaryLayer,
                    "CMA Overlay": vectorGridCMA,
                    "County Overlay": vectorGridCounty,
                    "Zip Overlay": vectorGridZip0,
                    "AT&T Retail Store": ATTRstorePoints,
                    "Authorized Reseller Store": ARstorePoints
                };

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

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
                if (map.hasLayer(vectorGridZip0)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "";
                    ZipLayerState = 0;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridZip0);
                    map.removeLayer(vectorGridZip1);
                    map.removeLayer(vectorGridZip2);
                    map.removeLayer(vectorGridZip3);
                    map.removeLayer(vectorGridZip4);
                    map.addLayer(vectorGridZip0);
                };
            }
            function turnLayer1ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                if (map.hasLayer(vectorGridZip1)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                    ZipLayerState = 1;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridZip0);
                    map.removeLayer(vectorGridZip1);
                    map.removeLayer(vectorGridZip2);
                    map.removeLayer(vectorGridZip3);
                    map.removeLayer(vectorGridZip4);
                    map.addLayer(vectorGridZip1);
                };
            }
            function turnLayer2ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                if (map.hasLayer(vectorGridZip2)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & Fiber Available)";
                    ZipLayerState = 2;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridZip0);
                    map.removeLayer(vectorGridZip1);
                    map.removeLayer(vectorGridZip2);
                    map.removeLayer(vectorGridZip3);
                    map.removeLayer(vectorGridZip4);
                    map.addLayer(vectorGridZip2);
                };
            }
            function turnLayer3ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                if (map.hasLayer(vectorGridZip3)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & No Fiber)";
                    ZipLayerState = 3;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridZip0);
                    map.removeLayer(vectorGridZip1);
                    map.removeLayer(vectorGridZip2);
                    map.removeLayer(vectorGridZip3);
                    map.removeLayer(vectorGridZip4);
                    map.addLayer(vectorGridZip3);
                };
            }
            function turnLayer4ZipOn() {
                if (map.hasLayer(VpgmLayerTest)) {
                    VpgmLayerTest.clearLayers();
                    map.removeControl(infoDatatableZip);
                    map.addControl(infoZip);
                };
                if (map.hasLayer(vectorGridZip4)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
                    ZipLayerState = 4;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridZip0);
                    map.removeLayer(vectorGridZip1);
                    map.removeLayer(vectorGridZip2);
                    map.removeLayer(vectorGridZip3);
                    map.removeLayer(vectorGridZip4);
                    map.addLayer(vectorGridZip4);
                };
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
                if (map.hasLayer(vectorGridCounty0)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "";
                    CountyLayerState = 0;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCounty0);
                    map.removeLayer(vectorGridCounty1);
                    map.removeLayer(vectorGridCounty2);
                    map.removeLayer(vectorGridCounty3);
                    map.removeLayer(vectorGridCounty4);
                    map.addLayer(vectorGridCounty0);
                }
            }
            function turnLayer1CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                if (map.hasLayer(vectorGridCounty1)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                    CountyLayerState = 1;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCounty0);
                    map.removeLayer(vectorGridCounty1);
                    map.removeLayer(vectorGridCounty2);
                    map.removeLayer(vectorGridCounty3);
                    map.removeLayer(vectorGridCounty4);
                    map.addLayer(vectorGridCounty1);
                }
            }
            function turnLayer2CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                if (map.hasLayer(vectorGridCounty2)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & Fiber Available)";
                    CountyLayerState = 2;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCounty0);
                    map.removeLayer(vectorGridCounty1);
                    map.removeLayer(vectorGridCounty2);
                    map.removeLayer(vectorGridCounty3);
                    map.removeLayer(vectorGridCounty4);
                    map.addLayer(vectorGridCounty2);
                }
            }
            function turnLayer3CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                if (map.hasLayer(vectorGridCounty3)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & No Fiber)";
                    CountyLayerState = 3;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCounty0);
                    map.removeLayer(vectorGridCounty1);
                    map.removeLayer(vectorGridCounty2);
                    map.removeLayer(vectorGridCounty3);
                    map.removeLayer(vectorGridCounty4);
                    map.addLayer(vectorGridCounty3);
                }
            }
            function turnLayer4CountyOn() {
                if (map.hasLayer(Vpgm2LayerTest)) {
                    Vpgm2LayerTest.clearLayers();
                    map.removeControl(infoDatatableCounty);
                    map.addControl(infoCounty);
                };
                if (map.hasLayer(vectorGridCounty4)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
                    CountyLayerState = 4;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCounty0);
                    map.removeLayer(vectorGridCounty1);
                    map.removeLayer(vectorGridCounty2);
                    map.removeLayer(vectorGridCounty3);
                    map.removeLayer(vectorGridCounty4);
                    map.addLayer(vectorGridCounty4);
                }
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
                if (map.hasLayer(vectorGridCMA0)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "";
                    CMALayerState = 0;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA0);
                }
            }
            function turnLayer1CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                if (map.hasLayer(vectorGridCMA1)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                    CMALayerState = 1;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA1);
                }
            }
            function turnLayer2CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                if (map.hasLayer(vectorGridCMA2)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Weak Wireless & Fiber Available)";
                    CMALayerState = 2;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA2);
                }
            }
            function turnLayer3CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                if (map.hasLayer(vectorGridCMA3)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & No Fiber)";
                    CMALayerState = 3;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA3);
                }
            }
            function turnLayer4CMAOn() {
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                if (map.hasLayer(vectorGridCMA4)) {
                    return;
                } else {
                    document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
                    CMALayerState = 4;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA4);
                }
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
