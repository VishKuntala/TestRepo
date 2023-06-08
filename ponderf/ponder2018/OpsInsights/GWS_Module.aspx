<%@ Page Title="Sales Opportunity" Language="C#" MasterPageFile="~/MasterPageGWS.master" AutoEventWireup="true" CodeFile="GWS_Module.aspx.cs" Inherits="OpsInsights_GWS_Module" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />

    <%--<link href="../assets_v7_0_0/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" />--%>

    <link href="../assets_v7_0_0/plugins/global/plugins.bundle.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/plugins/custom/prismjs/prismjs.bundle.css" rel="stylesheet" />
    <link href="../OpsInsights/css_style/style.bundle2.css" rel="stylesheet" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="http://rudovjan.github.io/highcharts-tooltip-delay/tooltip-delay.js"></script>

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

       /* Box around "GWS Market Information - Hover over Drive Market"*/
        .info {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 2px solid #868e96;
        }
         /* Box around CMA hover pop up - orange box*/
        /* Box around CMA hover pop up - dark green box (WIN)*/
        .info1 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #009900;
        }
        /* Box around CMA hover pop up - lime green box (TIE)*/
        .info2 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #00FF00;
        }
        /* Box around CMA hover pop up - orange box (LOSS)*/
        .info3 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #FF9933;
        }
        /* Box around CMA hover pop up - green box*/
        .info4 {
            padding: 6px 8px;
            font: 14px/16px Arial, Helvetica, sans-serif;
            background: white;
            background: rgba(255,255,255,1.0);
            /*box-shadow: 0 0 15px rgba(0,0,0,0.2);*/
            border-radius: 5px;
            border: 6px solid #009900;
        }
        /* style, format, and color of "GWS Market Information - Hover over Drive Market"*/
        .info h4 {
            margin: 0 0 5px;
            color: #777;
        }
        /* style, format, and color of text in hover pop up*/
        .info1 h4 {
            margin: 0 0 5px;
            color: #777;
        }
        /* style, format, and color of text in hover pop up*/
        .info2 h4 {
            margin: 0 0 5px;
            color: #777;
        }
        /* style, format, and color of text in hover pop up*/
        .info3 h4 {
            margin: 0 0 5px;
            color: #777;
        }
        /* style, format, and color of text in hover pop up*/
        .info4 h4 {
            margin: 0 0 5px;
            color: #777;
        }
        /* Text Color in Legend (ATTR and AR Legend - National map) */
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
        /* Text Color in Legend (ATTR and AR Legend - ZIP map) */
        .legendZip {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        /* Text Color in Legend (ATTR and AR Legend - CMA map) */
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

        .legendTwoRows{
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

        .legendTwoRows i{
            width: 16px;
            height: 16px;
            float: left;
            margin-right: 8px;
            opacity: 0.6;
        }

        /*.infolegendTwoRows.legendTwoRows {
            background-color: white;
            border-radius: 5px;*/
            /*padding: 20px;*/
            /*border: 2px solid #868e96;
            height: 44px;
            width: 170px;
        }*/

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


        /*Size of the box around the legend*/
        .infolegend.legend {
            background-color: white;
            border-radius: 5px;
            padding: 4px;
            border: 2px solid #868e96;
            height: 68px;
            width: 100px;
        }
        /*change the shape inside the legend*/
        .legend .doughnut {
            border-radius: 6px;
            height: 12px;
            width: 12px;
            margin-top: 4px;
            margin-left: 6px;           
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

    </style>

    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_Access" runat="server" ClientIDMode="Static" />

<!-- Upper left title - Below PONDER label kk_note -->
    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
      <%--  <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">--%>
            <diheader-logov class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap" style="background-color: white">
                <!--begin::Info-->
                <d-btniv class="d-flex align-items-center flex-wrap mr-1">
                    <!--begin::Page Heading-->
                    <div class="header-logo">
                        <a id="logoLink" href="link">
                            <img alt="Logo" src="../assets/demo/default/media/img/logo/ponder_logo.jpg" />
                        </a>
                    </div>
                    <%--<div class="d-flex align-items-baseline mr-5">--%>
                        <!--begin::Page Title -->
                    <h5 class="text-dark font-weight-bold my-2 mr-5">&nbsp; &nbsp; GWS OneScore Results v1.0</h5>
                        <!--end::Page Title-->
                        <!--begin::Breadcrumb-->
                    <div id="breadcrumb" style="display: none;">
                        <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                            <li class="breadcrumb-item">
                                <a href="/OpsInsights/GWS_Module.aspx" class="text-muted">GWS OneScore Results v1.0</a>
                            </li>
                        </ul>
                    </div>
                        
                           <%-- <li class="breadcrumb-item">
                                <a href="/sales/Sales.aspx" class="text-muted">Sales Home Page</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales_Dashboard.aspx" class="text-muted">Sales Dashboard</a>
                            </li>--%>
                            
                            <%--<li class="breadcrumb-item">
                                <a href="" class="text-muted">Scroller</a>
                            </li>--%>

                        <!--end::Breadcrumb-->
                    <%--</div>--%>
                    <!--end::Page Heading-->
                </d-btniv>
                <div style="text-align: right; float: right;" class="m-demo_preview m-demo_preview--btn">
                    <button type="button" class="btn btn-primaryClassification btn-sm" id="OneScoreMethodologyBtn" onclick="window.location.href='https://att.sharepoint.com/:p:/r/sites/OperationalInsightsTeam/Shared%20Documents/General/Ops_Insights_Ponder/GWS_OneScore_Methodology_ATT.pptx?d=w127c6d8a7c1e42e5a6266ae0f008f372&csf=1&web=1&e=pkjwbn';">
                        OneScore Methodology
                    </button>
                
                    <button type="button" class="btn btn-primaryClassification btn-sm" id="PowerBIBtn" onclick="window.location.href='https://app.powerbi.com/groups/9ebabb79-f373-4563-82ad-f23ea21568ef/reports/18a905e9-383e-414e-95db-50a23d4cfaa1/ReportSection67d183e6ed08105784cc';">
                        Power BI Report
                    </button>
                </div>
                <!--end::Info-->
            </diheader-logov>        
       <%-- </div>--%>
    </div>


    <div class="d-flex flex-column-fluid">
        <div class="container">
            <div class="card card-custom">
                <div class="card-body p-0">

                    <div class="alert alert-custom alert-white fade show" role="alert" style="background-color: #b3d9ff">
                        <div class="alert-text">
                            <div id="right_subs">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                                </asp:ScriptManager>
                                <h5>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-4">
                                                    <div ID="ShowHideMarket" style="text-align: right">
                                                        <asp:Label ID="labelMarket" runat="server" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlMarket" Width="220px" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div ID="ShowHideCampaign" style="text-align: right">
                                                        <asp:Label ID="labelCampaign" runat="server" Text="Campaign: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                        <asp:DropDownList ID="ddlCampaign" Width="220px" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnCMAModal" data-toggle="modal" data-target="#m_modal_cma" />
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
                                <%-- change the width of the display - map on main page adjustment and anything else contained within the div --%>
                                <div class="col-lg-12" id="tabs">

                                    <div id="LOADING1" style='text-align: center; display: none'>
                                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Map and Table Data...
                                    </div>
                                    <div class="tab-content" id="MapDiv">
                                        <%--<div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">  --%>

                                        <%--Changing the width of the map and such--%>

                                            <div class="row">
                                                <%--<div class="col-lg-1" id="Placeholder_tab1"></div>--%>
                                                <div class="col-lg-6" id="Placeholder_tab2">
                                                    <div style="text-align: center; color: red">
                                                        <h2 id="mapcountwarning"></h2>
                                                    </div>
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle"></h2>

                                                        <h4 id="mapcountsubtitle"></h4>
                                                    </div>
                                                    <div id="storemapdiv" style="height: 450px; text-align: left;"></div>
                                                    <div id="zipfooter" style="text-align: center; color: #343a40; font-size:12px;">
                                                        <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                                        <div id="zipfooterheader" style="text-align: center; color: #343a40; font-size:14px;">
                                                            <b>* Win / Loss / Tie claim is based upon GWS OneScore Results.</b><br />
                                                        </div>
                                                    </div>
                                                    <%-- Footer below National Map kk_note--%>
                                                    <div id="zipfooter2"style="text-align: center; color: #343a40; font-size:12px;">
                                                        <div id="zipfooter2header" style="text-align: center; color: #343a40; font-size:14px;">
                                                            <b>* Win / Loss / Tie claim is based upon GWS OneScore Results.</b><br />
                                                        </div>
                                                        <div id="zipfooter2content" style="text-align: center; color: #343a40; font-size:12px;">
                                                            <b>Overall rank is based on the OneScore metric vs the competition.</b>
                                                        </div>
                                                        <br />
                                                    </div>
                                                   
                                                </div>

                                               <%-- Test - changing table--%>

                                                <%--Remove sort by--%>
                                                <div class="col-lg-6" id="cmaTableDiv">
                                                    <div style="text-align: center;">
                                                        <h3><span id="TableSubtitle1.1"></span></h3>
                                                    </div>
                                                    
                                                    <div class="card card-custom">
                                                        <div class="card-toolbar">

                                                        </div>
                                                        <div class="card-body">
                                                            <table class="table compact" id="cma_datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>CAMPAIGN</th>
                                                                        <th>SALES MARKET</th>
                                                                        <th>GWS MARKET</th>
                                                                        <th>ONESCORE</th>
                                                                        <th>CLAIM</th>
                                                                        <th>CMA NAME</th>
                                                                        <th>CMA RANK</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <br />                                               
                                            
                                            <br />
                                        <%-- Code for the 5 buttons below map footer first is when Zip is selected, second for county, and last for CMA kk_note--%>
                                                                                        
                                            </div>
                                        <div class="row">
                                                <div class="col-lg-6" id="buttonrowcenter">                                                    
                                                    
                                                    <%-- kk updated label to show GWS Drive, need to update so the counts for # of drive routes and drive routes completed rather than # of CMA's and Pops --%>  
                                                    <div id="buttonrowcma" style="display:none">
                                                        <button type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0CMAOn()">
                                                            Clear All Highlights<br>                                                            
                                                            <br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1CMAOn()">
                                                            New Win<br>
                                                            <span id="CMA_NEW_WIN"></span><br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2CMAOn()">
                                                            Tie from Loss<br>
                                                            <span id="CMA_TIE_FROM_LOSS"></span><br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3CMAOn()">
                                                            Tie from Win<br>
                                                            <span id="CMA_TIE_FROM_WIN"></span><br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4CMAOn()">
                                                            New Loss<br>
                                                            <span id="CMA_NEW_LOSS"></span><br>
                                                            </button>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6" id="WLTTableDiv">
                                                    <div style="text-align: center;">
                                                        <h3><span id="TableSubtitle1.11"></span></h3>
                                                    </div>                                                    
                                                    <div class="card card-custom">
                                                        <div class="card-toolbar">

                                                        </div>
                                                        <div class="card-body">
                                                            <table class="table compact" id="WLT_datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>CAMPAIGN</th>
                                                                        <th>WIN</th>
                                                                        <th>TIE</th>
                                                                        <th>LOSS</th>                                                                        
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
        </div>
    </div>
    

    <!-- Classification Modal Start - improvement needed to automatically update the data dates. Don't want to manually update the modal  ends at line 1381-->
    <%--<div class="modal fade" id="ClassificationModal" tabindex="-1" role="dialog" aria-labelledby="myRYGModal3Label">
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
                        <h4>OVALS Fiber Location Data: 10/14/2020</h4>
                        <h4>OVALS In-Service Customer Data: 10/14/2020</h4>
                        <h4>Store Data: 09/07/2020</h4>
                        <br />
                    </div>
                  

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
        </div>--%>

    <!-- Classification Modal End -->

<!-- CMA Modal through lines 2100 -->
    <%-- Data displayed when you click into a CMA and then click "Show location PSA details  kk_Note" --%>
    <asp:HiddenField ID="hf_PSALocationCMA" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_GWSResults" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_CMA" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_CMA_Street" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_SelectedMDU_CMA_House" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hf_CMAExportGIF" runat="server" ClientIDMode="Static" />


    <div class="modal fade" id="m_modal_cma" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>GWS OneScore Results <span id="CMAModalTitle"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_CMA_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH_CMA" style='display: none'>No fiber opportunities found, please check input.</div>

<%-- Modal Pop up for clicked on GWS Drive Market --%>
                    <div id="ModalDisplay_CMA">
                        <div class="row" id="DisplayInfoRow_CMA">
                           
                            <div class="col-md-6" id="ZipInfoCol1_1_CMA">
                                <div id="myCMAModalMap" style="width: 100%; height: 800px; border: 1px solid #AAA;"></div>  <%-- Adjust Map of Modal Here kk_Map Adjust--%>
                            </div>

                            <div class="col-md-6">
                                <div class="row">
                                <div class="col-md-6">
                            <!--begin::Portlet-->                                
                                    <h3 class="m-subheader2__title m-subheader2__title--separator" id="DisplayGWS_Market"></h3>
                                    <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplaySales_Market"></h5>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCMA_Name"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCMA_Rank"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayLatest_Drive"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayOneScore"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayGWS_Claim"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayPrevious_Result"></h6>
                                    <h6 class="m-subheader2__title m-subheader2__title--separator" id="DisplayOverall_Rank"></h6>
                                    </div>
                                        <div class="col-lg-6">
                                            <table class="table compact" id="CMAModal_datatable">
                                                <thead>
                                                    <tr>
                                                        <th>CAMPAIGN</th>
                                                        <th>AT&T</th>
                                                        <th>VERIZON</th>
                                                        <th>T-MOBILE</th>
                                                        <th>SPRINT</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                    
                                </div>
                                
                                <div class="m-portlet__head">
                                    <br />
                                    <br />
                                    <div class="m-portlet__head-caption">
                                        <div class="m-portlet__head-title">
                                            <span class="m-portlet__head-icon">
                                                <i class="flaticon-line-graph"></i>
                                            </span>
                                            <h3 class="m-portlet__head-text">OneScore Trend</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-portlet__body">
                                    <div id="GWS_TREND" style="visibility: visible;"></div> <%--//loads the graph on the popup--%> 
                                   <%-- <br />--%>
                                </div>
                                </div>
                        </div>
                        <div class="row" id="DisplayInfoRow2_CMA">
                            <div class="col-md-6" id="ZipInfoCol1_3_CMA" style="text-align: center; color: black">
                                <div id="CMAfooterMapModal"style="text-align: center; color: #343a40; font-size:11px;">
                                    <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                    <b>* Win/Loss/Tie claim is based upon GWS OneScore Results</b><br />
                                        Overall rank is based on the OneScore metric vs the competition.  <br />
                                        <%--<span style="width: 10px; height: 10px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best--%>

                                </div> 
                            </div>
                        </div>
                        <br />   
                        <br />

                        <div class="row">

                            <div class="col-lg-12" id="ModalDiv6_tab1_CMA">

<%--                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2_CMA">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="CMAModalTableDiv">

                                            <div class="card card-custom">
                                               
                                                <div class="card-body">
                                                  <ul class="nav nav-tabs" role="tablist">
                                                    
                                                    <li class="nav-item">--%>
                                                        <a class="nav-link" data-toggle="tab" href="#m_tabs_1_tab2" id="tab2">
<%--                                                           <h6>OneScore Results</h6>--%>
                                                        </a>
<%--                                                    </li>

                                                    </ul>--%>


                                <div class="tab-content">
                                    <div class="tab-pane" id="m_tabs_1_tab2" role="tabpanel">
                                    </div>
<%--                                                </div>
                                               </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
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
    </div>


    <script>
                
        const getExportColumns = (dataTableName) => {
            const GWSResultColumns = [0, 1, 2, 3, 4, 5, 6];
            if (dataTableName == "cma_datatable") 
                return dataTableExportColumnsCMA = GWSResultColumns;
            else
                return dataTableExportColumnsCMA = GWSResultColumns;            
        }

        var ZipLayerState = 0; //global layer state for zip layer, default to one so that initial clear will run, that will set it to zero, then updates on zip button clicks by user
        var CMALayerState = 0;
        var CountyLayerState = 0;
        var CMALayerGroup;
        var VpgmLayerTest;
        var Vpgm2LayerTest;
        var Vpgm3LayerTest;
        var testbutton;
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
            var campaignStored = '';

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

                $('#MapDiv').hide();
                $('#LOADING1').show();
              //  $('#ShowHideRegionGroupBy').hide();
             //   $('#ShowHideMarketGroupBy').hide();

             
                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
                SubmitButtonClick();

            });

 

            function ShowClassificationMethodology(source, eventArgs) {
                var clickButton = document.getElementById("<%= ClassificationMethodology.ClientID %>");
                clickButton.click();

                var delayInMilliseconds = 1000; //500 ms

                setTimeout(function () {
                    groupByFilter();
                }, delayInMilliseconds);

            }

            function AlertAddressExport() {
                alert('Exporting Addresses and Unit Numbers can take up to 15 seconds. Thank you for your patience. <br> Please respect the sensitivity of this data.');
            }
<%-- kk_Start --%>
            function SubmitButtonClick() {
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var campaign = $('#<%=ddlCampaign.ClientID %> option:selected').val();
                console.log("SubmitButtonClick function: " + market);

                // adding Campaign DDL selection
                //check if anything has changed since last submitbuttonclick
                if (
                    <%--geoTypeStored == $('#<%= ddlGeo.ClientID %> option:selected').text()--%>
                    //&&
                    marketStored == $('#<%= ddlMarket.ClientID %> option:selected').text() &&
                    campaignStored == $('#<%=ddlCampaign.ClientID %> option:selected').text()) {
                    console.log('Button Click without Pulldown Change');
                }

                else {
                    console.log('step 8');
                    <%--var geo = $('#<%= ddlGeo.ClientID %> option:selected').text();--%>
                    //var geo = "SALES";
                    var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                    var campaign = $('#<%=ddlCampaign.ClientID %> option:selected').val();
                    //console.log("getFilterCriteria function: " + geo);
                    console.log("MarketLong: " + market_long);
                    console.log("market: " + market);
                    console.log("campaign: " + campaign);

 
                    var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    console.log("marketspan: " + marketspan);
                    var marketClasses = document.getElementsByClassName('current_market');
                    for (var i = 0; i < marketClasses.length; i++) {
                        marketClasses[i].innerHTML = marketspan;

                    }

                    //update stored pulldown values
                    <%--geoTypeStored = $('#<%= ddlGeo.ClientID %> option:selected').text();--%>
                    //geoTypeStored = "SALES";
                    marketStored = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    console.log("marketStored: " + marketStored);
                    campaignStored = $('#<%=ddlCampaign.ClientID %> option:selected').text();
                    console.log("campaignStored: " + campaignStored);
                    getFilterCriteria();

                }

            }
<%--  kk_1 --%>
            //show and hide divs, grab variable info, trigger the UpdateHomePage function
            function getFilterCriteria() {
                console.log('kk_1N');
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
                
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var campaignGeo = $('#<%= ddlCampaign.ClientID %> option:selected').val();
                var marketGeoStore = marketGeo; //This will handle when the market names are different in the store file
                var marketGeoJSONName = marketGeo; //This will handle when market names are different in the geo Json files
                var marketType = '';
                var campaignType = '';
               // var GroupBy = '';
                                
                if (marketGeo == '%') {
                        console.log('step 10');
                        marketType = 'NATIONAL';
                 //       GroupBy = 'CMA';
                    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                        marketType = 'REGION';
                        console.log('step 10.1');
                   
                    } else {
                        marketType = 'MARKET';
                    
                        console.log('step 10.2');     
                    }
                
                //console.log("UpdateHomePageFunction");
                UpdateHomePage(marketGeo, marketGeoStore, marketGeoJSONName, marketType, campaignGeo);

            }


//kk Remvoing table info
            function UpdateHomeTable() {
                console.log('step 24');
                //User changed the Sort Order By of the table, which doesnt affect the map, the themes, or any of the show hides.
                //Grab the required variables and rerun the ajax call for table creation, which is based on the Group By
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var marketType = '';
               // var GroupBy = '';
                var CategoryFilter = '%';
                var CategoryLayerState = 0;
                var campaignGeo = $('#<%= ddlCampaign.ClientID %> option:selected').val();
               //console.log('KK_1.1N');
                if (marketGeo == '%') {
                    console.log('step 25');
                    marketType = 'NATIONAL';
                 //   GroupBy = 'CMA';

                } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                    marketType = 'REGION';                

                } else {
                    marketType = 'MARKET';
               
                }
                           
                              

                { //CMA
                    console.log('button_click');
                    console.log('step 30');
                    CategoryLayerState = CMALayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'New Win'; }
                    //else if (CategoryLayerState == 5) { CategoryFilter = '20D2'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'Tie from Loss'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'Tie from Win'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'New Loss'; }
                   // testbutton = CategoryFilter;
                    console.log('UpdateHomeTable CMA Category Filter: ' + CategoryFilter);
                    //console.log('Testbutton: ' + testbutton);
                   // DriveDataPopUp(testbutton, VpgmData3);
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            cmaTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_WLTTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            WLTTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

               }
               var myStyle = {
                   "color": "#ffffff",
                   "weight": 0,
                   "opacity": 0.00
               };

               function DriveDataPopUp(testbutton, VpgmData3) {
                   console.log('kk_popuptest');
                   console.log('testbutton: ' + testbutton);
                   if (testbutton == '%') {
                       VpgmData3Layer = L.geoJSON(VpgmData3, {
                           onEachFeature: onEachFeature,
                           style: myStyle
                       });
                       VpgmData3Layer.bringToFront();
                   }
               }

               function onEachFeature(feature, layer) { //populates popup when a CMA w/ fiber opportunities is clicked 
                   console.log('TACKING');
                   //console.log(layer.feature.properties);
                   if (navigator.userAgent.indexOf("Firefox") > 0) {
                       layer.bindPopup('CMA #' + feature.properties.cma + ' - ' + feature.properties.Name + '<br><a href="#" class="CMADetailLink">Click to Show Top Fiber Opportunities</a>', {
                           closeButton: true,
                           autoPan: false
                       });

                       //layer.on({
                       //    mouseover: highlightFeature,
                       //    mouseout: resetHighlight,
                       //    //click: zoomToFeature
                       //    click: ClickToCMA
                       //});
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

                           //layer.on({
                           //    mouseover: highlightFeature,
                           //    mouseout: resetHighlight,
                           //    //click: zoomToFeature
                           //    click: ClickToCMA
                           //});
                       }
                   }
               } //console.log(VpgmData3Layer);
            }

            <%-- kk_2 --%>
            function UpdateHomePage(marketGeo, marketGeoStore, marketGeoJSONName, marketType, campaignGeo) {
                //console.log('kk_2N');table.DataTable
                console.log('marketGeo' + marketGeo);
                console.log('marketGeoStore' + marketGeoStore);
                console.log('marketType' + marketType);
              //  console.log('GroupBy' + GroupBy);
                console.log('campaignGeo: ' + campaignGeo);                               

                //First use Market Type to hide and show the correct Group By ddl, select the correct ajax to grab store data, and trigger GET_MAP_THEME
                console.log('UpdateHomePage / marketType: ' + marketType);
                
<%-- kk_3 --%>                               
                //Use Group by to show hide the appropriate table div, call the ajax to build the table, and to populate the summary stats that show up in the filter buttons
                
                var CategoryFilter = '%';
                var CategoryLayerState = 0;
                var campaignGeo = $('#<%= ddlCampaign.ClientID %> option:selected').val();
                console.log('step 50');
                console.log('kk_3N');
                console.log('marketGeo: ' + marketGeo);
               // console.log('GroupBy: ' + GroupBy);
                console.log("If statement based on GroupBy");
                <%-- kk_4 --%>
                 { 
                    $('#zipTableDiv').hide();
                    $('#countyTableDiv').hide();
                  //  $('#GWSTableDiv').show();
                    $('#cmaTableDiv').show();
                    $('#WLTTableDiv').show();
                    console.log('kk_4N');
                    CategoryLayerState = CMALayerState;
                    if (CategoryLayerState == 0) { CategoryFilter = '%'; }
                    else if (CategoryLayerState == 1) { CategoryFilter = 'New Win'; }
                    //else if (CategoryLayerState == 5) { CategoryFilter = '20D2'; }
                    else if (CategoryLayerState == 2) { CategoryFilter = 'Tie from Loss'; }
                    else if (CategoryLayerState == 3) { CategoryFilter = 'Tie from Win'; }
                    else if (CategoryLayerState == 4) { CategoryFilter = 'New Loss'; }

                    console.log('Get_CMA_Summary_Info :' + marketGeo + ' - ' + marketType);

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_CMA_Summary_Info",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'campaignVariable': campaignGeo }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            CMA_SUMMARY_DATA(data);
                            console.log('CMA_SUMMARY_DATA_8N_Return');
                            console.log(data);
                        },
                        error: function (data) {
                        }
                    });
                    // build the table associated with CMA level data
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'campaignVariable' : campaignGeo, 'overallCatVariable': CategoryFilter }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            cmaTable(data);
                            console.log('cmaTable_9N_return');
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_WLTTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'overallCatVariable': CategoryFilter }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            WLTTable(data);
                        },
                        error: function (data, market, time, market_long) {
                        }
                    });
                }
                GET_MAP_THEME_DATA(marketType, marketGeoJSONName);  //added this portion when I removed from the AJAX calls in UpdateHomePage Function
            }

            // ********** SALES OPPORTUNITY MARKET **********
  
            

            // Code to pull the information to populate the 5 buttons below the map  kk_note

            function CMA_SUMMARY_DATA(data) {
                console.log('step 63');
                score = JSON.parse(data.d);
                console.log('kk_5N');
                var NEW_WIN = score[0]["NEW_WIN"];
                var NEW_WIN_comma = Number(NEW_WIN).toLocaleString('en');
                document.getElementById('CMA_NEW_WIN').innerHTML = NEW_WIN_comma;
                var TIE_FROM_LOSS = score[0]["TIE_FROM_LOSS"];
                var TIE_FROM_LOSS_comma = Number(TIE_FROM_LOSS).toLocaleString('en');
                document.getElementById('CMA_TIE_FROM_LOSS').innerHTML = TIE_FROM_LOSS_comma;
               // var NO_CHANGE = score[0]["NO_CHANGE"];
               // var NO_CHANGE_comma = Number(NO_CHANGE).toLocaleString('en');
               // document.getElementById('CMA_NO_CHANGE').innerHTML = NO_CHANGE_comma;                
                var TIE_FROM_WIN = score[0]["TIE_FROM_WIN"];
                var TIE_FROM_WIN_comma = Number(TIE_FROM_WIN).toLocaleString('en');
                document.getElementById('CMA_TIE_FROM_WIN').innerHTML = TIE_FROM_WIN_comma;
                var NEW_LOSS = score[0]["NEW_LOSS"];
                var NEW_LOSS_comma = Number(NEW_LOSS).toLocaleString('en');
                document.getElementById('CMA_NEW_LOSS').innerHTML = NEW_LOSS_comma;

            }
            //TABLE Update, does not appear to be used so commenting out

            <%--function CMATableUpdate() {
                console.log('kk_tableupdate');
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                };

                var SelectedSortCMA = $('#<%= ddlSortBy.ClientID %> option:selected').val();                
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
                    url: "Sales_Opportunity_KK3.aspx/Get_CMATable_Data",  //use a function from C# , change this for different data return
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
            }--%>
/*            second table add*/
            function cmaTable(data) {
                console.log('step 80');
                $('#cma_datatable').dataTable().fnDestroy(); //destroy old table
                console.log('kk_7N');
                var table = $('#cma_datatable');
                console.log('KTDataTables begin');

                var ExportCMAOrder = 'Total_Pops';
                //console.log('sortby selection');
                

                var ExportCMAFilter = '';
              
                if (CMALayerState == 0) { ExportCMAFilter = ''; }
                else if (CMALayerState == 1) { ExportCMAFilter = 'New Win'; }
                else if (CMALayerState == 2) { ExportCMAFilter = 'Tie from Loss'; }
                else if (CMALayerState == 3) { ExportCMAFilter = 'Tie from Win'; }
                else if (CMALayerState == 4) { ExportCMAFilter = 'New Loss'; }

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
                    buttons: [
                        {
                            extend: 'csv',
                            className: 'btn btn-primary export-top50-cmas-to-csv',
                            exportOptions: {
                                columns: getExportColumns('cma_datatable')
                            },
                            filename: "PONDER_" + $('#<%= ddlMarket.ClientID %> option:selected').text().replace(/\s/g, "") + "_Market_Drive"
                        },
                        {
                            text: 'Export Data',
                            className: 'btn btn-primary export-top50-cmas', titleAttr: 'Export CMAs to Excel', title: 'CMAs',
                            action: async function (e, dt, node, config) {
                                //console.log("export top 50 layer state: " + CMALayerState);
                                //console.log("export top 50 filter: " + ExportCMAFilter);
                               // $(".export-top50-cmas").attr("disabled", "disabled");
                                $(".export-top50-cmas-spinner").show();
                                $('.buttons-csv.export-top50-cmas-to-csv').click();
                                const myParamsObject = {
                                    userID: "<%=hf_User.Value%>",
                                eventType: "MARKET_CMA_EXPORT",
                                    logData: $('#<%= ddlMarket.ClientID %> option:selected').text()
                                };
                                //await ponderApp.logUIEvent(JSON.stringify({ myParamsObject }));
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
                    //buttons: [{
                    //    text: 'Export All (Unfiltered)',
                    //    className: 'btn btn-primary',
                    //    titleAttr: 'Exports All CMAs Ignoring Filters',
                    //    action: function (e, dt, node, config) {
                    //        ExportAll_CMAs();
                    //    }
                    //},//kk table update
                    //{ extend: 'csv', text: 'Export Top 50', className: 'btn btn-primary', titleAttr: 'Export Top 50 CMAs to Excel', title: 'Top_50_National_CMAs_' + ExportCMAFilter + 'By_' + ExportCMAOrder }],
                    columns: [
                        { 'data': 'CAMPAIGN', name: "CAMPAIGN" },
                        { 'data': 'SALES_MARKET', name: "SALES_MARKET" },
                        { 'data': 'GWS_MARKET', name: "GWS_MARKET" },
                        { 'data': 'ONESCORE', name: "ONESCORE" },
                        { 'data': 'WLT_MARKER', name: "CLAIM" },
                        { 'data': 'CMA_NAME', name: "CMA_NAME" },
                        { 'data': 'CMA_RANK', name: "RANK" },
                    ],
                    order: [],

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
                        $(".export-all-cmas-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-all-cmas-spinner").hide();
                        $(".export-top50-cmas-to-csv").hide();
                        $(".export-top50-cmas-spinner").css({ "background-color": "white", "border-style": "none" });
                        $(".export-top50-cmas-spinner").hide();

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
                        if (feature.properties.GWS_MARKET == data.GWS_MARKET) return true
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

                        //var TOTALPOPSCOMMA = "";
                        //var FIBER_AVAILABLECOMMA = "";
                        //var FIBER_CUSTOMERSCOMMA = "";
                        //var FIBER_OPPORTUNITYCOMMA = "";
                        //var NUMBER_OF_PSASCOMMA = "";

                        //if (props) {
                        //    TOTALPOPSCOMMA = Number(props.TOTALPOPS).toLocaleString('en');
                        //    FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        //    FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        //    FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        //    NUMBER_OF_PSASCOMMA = Number(props.NUMBER_OF_PSAS).toLocaleString('en');
                        //}

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

                        
                        this._div.innerHTML = '<h4>GWS Market Information</h4>' + (props ?
                            //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                            '<b>Sales Market:  ' + props.SALES_MARKET + '<br />' + 'Market Drive: ' + props.GWS_Market +
                            '<br />' + 'Latest Drive: ' + props.LATEST_DRIVE + '</b><br />' + 'OneScore: ' + props.LATEST_SCORE +
                            '<br />' + 'GWS WLT_Claim: ' + props.WLT_MARKER + '<br />' + 'Overall Rank: ' + props.CARRIER_RANK + CMATouchLink
                            : 'Hover over a Drive Market');

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
                            if (props.WLT_MARKER == 'WIN') {
                                cssinfo = "info1";
                            } else if (props.WLT_MARKER == 'TIE') {
                                cssinfo = "info2";
                            } else if (props.WLT_MARKER == 'LOSS') {
                                cssinfo = "info3";
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

            function WLTTable(data) {               
                $('#WLT_datatable').dataTable().fnDestroy();
                var table2 = $('#WLT_datatable');

                var ExportCMAOrder = 'Total_Pops';
                

                var ExportCMAFilter = '';
              
                if (CMALayerState == 0) { ExportCMAFilter = ''; }
                else if (CMALayerState == 1) { ExportCMAFilter = 'New Win'; }
                else if (CMALayerState == 2) { ExportCMAFilter = 'Tie from Loss'; }
                else if (CMALayerState == 3) { ExportCMAFilter = 'Tie from Win'; }
                else if (CMALayerState == 4) { ExportCMAFilter = 'New Loss'; }

                table2.DataTable({
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
                    dom: 'rtlip',
                    //buttons: [{
                    //    text: 'Export All (Unfiltered)',
                    //    className: 'btn btn-primary',
                    //    titleAttr: 'Exports All CMAs Ignoring Filters',
                    //    action: function (e, dt, node, config) {
                    //        ExportAll_CMAs();
                    //    }
                    //},//kk table update
                    //],
                   // columnDefs: [{ className: "dt-nowrap", targets: [0] }, { className: "dt-center", targets: '_all' }, { orderable: false, targets: '_all'}],
                    columns: [
                        { 'data': 'CAMPAIGN' },
                        { 'data': 'WIN' },
                        { 'data': 'TIE' },
                        { 'data': 'LOSS' }
                    ],

                    //"fnDrawCallback": function () {
                    //    $('#WLT_datatable tr').find('td').each(function () {
                    //        $(this).on('mouseover', function () {
                    //            $(this).parent().css('background', 'silver');

                    //            this.style.cursor = 'pointer';
                    //        }).on('mouseout', function () {
                    //            $(this).parent().css('background', 'transparent');
                    //            this.style.cursor = 'default';
                    //        });

                    //    });
                    //},

                    //initComplete: function () {                       

                    //    this.api().columns().header().each(function (th) {
                    //        $(th).removeClass("sorting_asc");
                    //        $(th).removeClass("sorting");
                    //    });

                    //},

                });              


                $(window).resize();

                console.log('KTDataTables end');

            };


            console.log('testing flow');
            // deleting table update needed to populate table in CMAModal Popup
            function CMAModalTable(data, CMAModalSelected) {
                console.log('table_update for CMAModal');
                console.log(data);
                $('#CMAModal_datatable').dataTable().fnDestroy(); //destroy old table
                var table = $('#CMAModal_datatable');
                document.getElementById('<%= hf_GWSResults.ClientID %>').value = CMAModalSelected;
                console.log('selected modal');
                console.log(CMAModalSelected);
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
                    dom: 'rtip',
                    
                    columns: [
                        { 'data': 'CAMPAIGN' },
                        { 'data': 'ATT' },
                        { 'data': 'VERIZON' },
                        { 'data': 'TMOBILE' },
                        { 'data': 'SPRINT' }                       
                    ],

                    //initComplete: function () {                    
                    //    this.api().columns().header().each(function (th) {
                    //        $(th).removeClass("sorting_asc");
                    //        $(th).removeClass("sorting");
                    //    });

                    //}, 

                });
                groupByFilter();
                console.log('table update end');
            };

<%-- kk_6 --%>
            function GET_MAP_THEME_DATA(marketType, marketGeoJSONName, campaignGeo) {
                console.log("kk_8N");
                console.log('GET_MAP_THEME_DATA function start');
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var campaignGeo = $('#<%= ddlCampaign.ClientID %> option:selected').val();
                var countyGeo;
                console.log('groupGeo: ' + groupGeo);
                console.log('maketGeo: ' + marketGeo);
                console.log('marketType: ' + marketType);
                console.log("If statement based on groupGeo and marketType");             
                console.log('kk_9N');
                //test
                if (marketGeo == '%') {
                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "GWS_Module.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'campaignVariable': campaignGeo }),  //add campaignVariable: campaignGeo in CS file
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                Data1 = data.d; 
                                theme_data = JSON.parse(Data1);
                            },
                            error: function (data) {
                            }
                        }),

                        $.getJSON("GWSGeo/GWS_MARKET_POLY_FME.json", function (data) {
                            VpgmData3 = data;
                        }),

                        $.getJSON("GWSGeo/VPGM_Markets_geojson_033021_FME.json", function (data) {
                            MarketBoundaryData = data;
                        }),
                        //kk trying to add drive routes

                        $.getJSON("GWSGeo/GWS_DR_NATION_FME.json", function (data) {
                            DriveRouteData = data;
                        }),
                    ).then(function () {

                        console.log("kk_10N");//kkChange
                        VpgmData3.features.forEach(function (element) {
                            theme_data.find(function (newElement) {
                                if (element.properties.GWS_Market == newElement.GWS_MARKET) {
                                    element.properties.SALES_MARKET = newElement.SALES_MARKET;
                                    element.properties.CAMPAIGN = newElement.CAMPAIGN;
                                    element.properties.GWS_MARKET = newElement.GWS_MARKET;
                                    element.properties.CARRIER = newElement.CARRIER;
                                    element.properties.CMA_NAME = newElement.CMA_NAME;
                                    element.properties.CMA_RANK = newElement.CMA_RANK;
                                    element.properties.LATEST_DRIVE = newElement.LATEST_DRIVE;
                                    element.properties.CARRIER_RANK = newElement.CARRIER_RANK;
                                    element.properties.WLT_MARKER = newElement.WLT_MARKER;
                                    element.properties.PREVIOUS_RESULT = newElement.PREVIOUS_RESULT;
                                    element.properties.ONESCORE = newElement.ONESCORE;
                                    element.properties.DRIVE_STATUS = newElement.DRIVE_STATUS;
                                    element.properties.CHANGE = newElement.CHANGE;
                                    element.properties.LATEST_SCORE = newElement.LATEST_SCORE;
                                }
                            });
                        });

                        storeMapV3_National(VpgmData3, MarketBoundaryData, marketType, DriveRouteData);
                    });

                } else if (marketGeo == 'WEST' | marketGeo == 'EAST') {
                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "GWS_Module.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
                            data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'campaignVariable': campaignGeo }),  //add campaignVariable: campaignGeo in CS file
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                Data1 = data.d; 
                                theme_data = JSON.parse(Data1);
                            },
                            error: function (data) {
                            }
                        }),

                        $.getJSON("GWSGeo/GWS_MARKET_POLY_FME.json", function (data) {
                            VpgmData3 = data;
                        }),

                        $.getJSON("GWSGeo/VPGM_Markets_geojson_033021_FME.json", function (data) {
                            MarketBoundaryData = data;
                        }),


                        $.getJSON("GWSGEO/DR_" + marketGeo + "_FME.json", function (data) {
                            DriveRouteData = data;
                        }),
                       
                    ).then(function () {
                        console.log("kk_10.regionN");//kkChange
                        VpgmData3.features.forEach(function (element) {
                            theme_data.find(function (newElement) {
                                if (element.properties.GWS_Market == newElement.GWS_MARKET) {
                                    element.properties.SALES_MARKET = newElement.SALES_MARKET;
                                    element.properties.GWS_MARKET = newElement.GWS_MARKET;
                                    element.properties.CAMPAIGN = newElement.CAMPAIGN;
                                    element.properties.CARRIER = newElement.CARRIER;
                                    element.properties.CMA_NAME = newElement.CMA_NAME;
                                    element.properties.CMA_RANK = newElement.CMA_RANK;
                                    element.properties.LATEST_DRIVE = newElement.LATEST_DRIVE;
                                    element.properties.CARRIER_RANK = newElement.CARRIER_RANK;
                                    element.properties.WLT_MARKER = newElement.WLT_MARKER;
                                    element.properties.PREVIOUS_RESULT = newElement.PREVIOUS_RESULT;
                                    element.properties.ONESCORE = newElement.ONESCORE;
                                    element.properties.DRIVE_STATUS = newElement.DRIVE_STATUS;
                                    element.properties.CHANGE = newElement.CHANGE;
                                    element.properties.LATEST_SCORE = newElement.LATEST_SCORE;
                                }
                            });
                        });

                        storeMapV3_National(VpgmData3, MarketBoundaryData, marketType, DriveRouteData);
                    });
                }
                else {
                    $.when(
                        $.ajax({
                            type: "POST",
                            async: true,
                            url: "GWS_Module.aspx/Get_cma_theme_data",  
                            data: JSON.stringify({ 'marketVariable': marketGeo, 'marketTypeVariable': marketType, 'campaignVariable': campaignGeo }),  
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                Data1 = data.d; 
                                theme_data = JSON.parse(Data1);
                            },
                            error: function (data) {
                            }
                        }),

                        $.getJSON("GWSGeo/GWS_MARKET_POLY_FME.json", function (data) {
                            VpgmData3 = data;
                        }),

                        $.getJSON("GWSGeo/VPGM_Markets_geojson_033021_FME.json", function (data) {
                            MarketBoundaryData = data;
                        }),
                        
                        $.getJSON("GWSGEO/DR_" + marketGeo + "_FME.json", function (data) {
                            DriveRouteData = data;
                        }),
                        
                    ).then(function () {
                        console.log("kk_10.marketN");//kkChange
                        
                        VpgmData3.features.forEach(function (element) {
                            theme_data.find(function (newElement) {
                                if (element.properties.GWS_Market == newElement.GWS_MARKET) {
                                    element.properties.SALES_MARKET = newElement.SALES_MARKET;
                                    element.properties.GWS_MARKET = newElement.GWS_MARKET;
                                    element.properties.CAMPAIGN = newElement.CAMPAIGN;
                                    element.properties.CARRIER = newElement.CARRIER;
                                    element.properties.CMA_NAME = newElement.CMA_NAME;
                                    element.properties.CMA_RANK = newElement.CMA_RANK;
                                    element.properties.LATEST_DRIVE = newElement.LATEST_DRIVE;
                                    element.properties.CARRIER_RANK = newElement.CARRIER_RANK;
                                    element.properties.WLT_MARKER = newElement.WLT_MARKER;
                                    element.properties.PREVIOUS_RESULT = newElement.PREVIOUS_RESULT;
                                    element.properties.ONESCORE = newElement.ONESCORE;
                                    element.properties.DRIVE_STATUS = newElement.DRIVE_STATUS;
                                    element.properties.CHANGE = newElement.CHANGE;
                                    element.properties.LATEST_SCORE = newElement.LATEST_SCORE;
                                }
                            });
                        });
                        for (var i = 0; i < VpgmData3.features.length; i++) {
                            if (VpgmData3.features[i].properties.SALES_MARKET != marketGeo) {
                                VpgmData3.features.splice(i, 1);
                                i--; //otherwise it will skip the next element after removing an index. Ex: After removing index at i = 2, need to check the new i = 2 which was previously i = 3
                            }
                        }
                        storeMapV3_National(VpgmData3, MarketBoundaryData, marketType, DriveRouteData);
                    });
                }
            }

 

            var map;

            var vectorGridZip0;
            var vectorGridZip1;
            var vectorGridZip2;
            var vectorGridZip3;
            var vectorGridZip4;
            var vectorGridCounty;
            var vectorGridCMA;


<%-- kk_7 --%>
            var storeMapV3_National = function (VpgmData3, MarketBoundaryData, marketType, DriveRouteData, campaignGeo) {
                console.log('kk_11N');
                $('#buttonrowcma').show();
                $('#MapDiv').show();
             //   $('#GWSTableDiv').show();
                $('#cmaTableDiv').show();
                $('#WLTTableDiv').show();
                $('#ddlMarket').removeAttr('disabled');
                $('#zipfooter').hide();
                $('#zipfooter3').hide();
                $('#zipfooter2').show();
                $('#LOADING1').hide();

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text(); 
                //mcg = L.markerClusterGroup({ chunkedLoading: true, disableCLusteringAtZoom: 8, spiderfyOnMaxZoom: false, maxClusterRadius: 120}),
                //console.log(VpgmData3);

                document.getElementById('mapcounttitle').innerHTML = "GWS OneScore Results - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "How does AT&T compare to the competition?";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";
                document.getElementById('TableSubtitle1.1').innerHTML = "Market Drive Results - " + market_long;
                document.getElementById('TableSubtitle1.11').innerHTML = "OneScore Claim Summary - " + market_long;

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
                    layers: [streets],
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

               /* mcg.addTo(map);*/
                console.log('test');
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

                function onEachFeatureBoundary(feature, featureLayer) { //kk_question2
                    console.log('step 209'); 
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

                info.onAdd = function (map) { //kk_question
                    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                    this.update();
                    return this._div;
                };

                // method that we will use to update the control based on feature properties passed
                info.update = function (props) {                    
                    console.log("step 211");                    
                   
                    //Brings up button when clicking on CMA (need to update so you can click on drive market it will allow you to click link to popup up graph of historical performance etc)
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
                    console.log("kk_12N");
                    console.log('Testbotton: ' + testbutton);
                    this._div.innerHTML = '<h4>GWS Market Information</h4>' + (props ?
                        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                        '<b>Sales Market:  ' + props.SALES_MARKET + '<br />' + 'Market Drive: ' + props.GWS_Market +
                        '<br />' + 'Latest Drive: ' + props.LATEST_DRIVE + '</b><br />' + 'OneScore: ' + props.LATEST_SCORE +
                        '<br />' + 'GWS WLT_Claim: ' + props.WLT_MARKER + '<br />' + 'Overall Rank: ' + props.CARRIER_RANK + CMATouchLink
                        : 'Hover over a Drive Market');
                    //kk_Change -- updated over pop up 

                    $('.CMATouchDetailLink').click(function () {
                        showCMAModal(props, SelectCMALat, SelectCMALng);
                    });
                    
                    var cssinfo = "info";

                    if (props) {
                        console.log('step 214');
                        if (props.WLT_MARKER == 'WIN') {
                            cssinfo = "info1";
                        } else if (props.WLT_MARKER == 'TIE') {
                            cssinfo = "info2";
                        } else if (props.WLT_MARKER == 'LOSS') {
                            cssinfo = "info3"; 
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
                console.log('214.1');
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
                        console.log('step 215');
                        vectorGridCMA.resetFeatureStyle(highlight);
                        info.update();
                    }
                    highlight = null;
                };

                console.log('kk_13N - Drive Status');
                vectorGridCMA0 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.WLT_MARKER;
                            return {
                                fillColor: p == 'WIN' ? '#009900' :
                                    p == 'TIE' ? '#00FF00' :
                                        p == 'LOSS' ? '#FF9933' :
                                            '#ffffff',
                            //}
                           // var s = properties.DRIVE_STATUS
                            //return {
                            //    fillColor: s == 'Reported' ? '#339933' :
                            //        s == 'Drive Completed' ? '#c6ecc6' :
                            //            s == 'In Progress' ? '#ffcc00' :
                            //                s == 'NOT STARTED' ? '#ffffff' :
                            //                    '#339933',
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
                            var p = properties.WLT_MARKER;
                            var d = properties.CHANGE;
                            return {
                                fillColor: d == 'New Win' ? '#008000' :
                                    p == 'WIN' ? '#79d279' :                                    
                                        p == 'TIE' ? '#99FF99' :
                                            p == 'LOSS' ? '#ffe6cc' :
                                                '#ffffff',
                                //}
                                // var s = properties.DRIVE_STATUS
                                //return {
                                //    fillColor: s == 'Reported' ? '#339933' :
                                //        s == 'Drive Completed' ? '#c6ecc6' :
                                //            s == 'In Progress' ? '#ffcc00' :
                                //                s == 'NOT STARTED' ? '#ffffff' :
                                //                    '#339933',
                                fillOpacity: 0.95,
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

                vectorGridCMA2 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.WLT_MARKER;
                            var d = properties.CHANGE;
                            return {
                                fillColor: p == 'WIN' ? '#79d279' :
                                    d == 'Tie from Loss' ? '#00ff00' :
                                         p == 'TIE' ? '#99FF99' :
                                           p == 'LOSS' ? '#ffe6cc' :
                                        '#ffffff',
                                //}
                                // var s = properties.DRIVE_STATUS
                                //return {
                                //    fillColor: s == 'Reported' ? '#339933' :
                                //        s == 'Drive Completed' ? '#c6ecc6' :
                                //            s == 'In Progress' ? '#ffcc00' :
                                //                s == 'NOT STARTED' ? '#ffffff' :
                                //                    '#339933',
                                fillOpacity: 0.95,
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

                vectorGridCMA3 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.WLT_MARKER;
                            var d = properties.CHANGE;
                            return {
                                fillColor: p == 'WIN' ? '#79d279' :
                                    d == 'Tie from Win' ? '#00ff00' :
                                          p == 'TIE' ? '#99FF99' :
                                        p == 'LOSS' ? '#ffe6cc' :
                                            '#ffffff',
                                //}
                                // var s = properties.DRIVE_STATUS
                                //return {
                                //    fillColor: s == 'Reported' ? '#339933' :
                                //        s == 'Drive Completed' ? '#c6ecc6' :
                                //            s == 'In Progress' ? '#ffcc00' :
                                //                s == 'NOT STARTED' ? '#ffffff' :
                                //                    '#339933',
                                fillOpacity: 0.95,
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

                vectorGridCMA4 = L.vectorGrid.slicer(VpgmData3, {
                    rendererFactory: L.canvas.tile,
                    zIndex: 3,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.WLT_MARKER;
                            var d = properties.CHANGE;
                            return {
                                fillColor: p == 'WIN' ? '#79d279' :                                    
                                    p == 'TIE' ? '#99FF99' :
                                        d == 'New Loss' ? '#ff8000' :
                                         p == 'LOSS' ? '#ffe6cc' :
                                        '#ffffff',
                                //}
                                // var s = properties.DRIVE_STATUS
                                //return {
                                //    fillColor: s == 'Reported' ? '#339933' :
                                //        s == 'Drive Completed' ? '#c6ecc6' :
                                //            s == 'In Progress' ? '#ffcc00' :
                                //                s == 'NOT STARTED' ? '#ffffff' :
                                //                    '#339933',
                                fillOpacity: 0.95,
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

                map.on('click', clearHighlight);
                console.log('step 221');
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
                    console.log('kk_popup');
                    //this.openPopup();
                    if (map.hasLayer(Vpgm3LayerTest)) {
                        Vpgm3LayerTest.clearLayers();
                        map.removeControl(infoDatatable);
                        map.addControl(info);
                    };
                    VpgmData3Layer.bringToFront();
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
                    console.log('Info_update');
                    DriveDataPopUp(testbutton, VpgmData3);
                    console.log('popup_return');
                    console.log(VpgmData3Layer);
                    console.log(layer.feature.properties);
                    info.update(layer.feature.properties);
                    console.log('Info_updatenext');
                    console.log(layer.feature.properties);
                    console.log('end check');
                }

                function highlightFeatureTouch(e) {
                    SelectCMALat = (e.target.getBounds()._northEast.lat + e.target.getBounds()._southWest.lat) / 2;
                    SelectCMALng = (e.target.getBounds()._northEast.lng + e.target.getBounds()._southWest.lng) / 2;
                    console.log('kk_popup2');
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
                    if (layer.feature.properties) { //Only Give Zip Modal Link Popup if the Zip has Fiber Available.

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

                function DriveDataPopUp(testbutton, VpgmData3) {
                    console.log('kk_popuptest');
                    console.log('testbutton: ' + testbutton);
                    if (testbutton == '%') {
                        VpgmData3Layer = L.geoJSON(VpgmData3, {
                            onEachFeature: onEachFeature,
                            style: myStyle
                        });
                        VpgmData3Layer.bringToFront();
                    } 
                }
                
                function onEachFeature(feature, layer) { //populates popup when a CMA w/ fiber opportunities is clicked 
                    //console.log('kk_popup3');
                    console.log(layer.feature.properties);
                    if (navigator.userAgent.indexOf("Firefox") > 0) {
                        layer.bindPopup('Market Drive: ' + ' - ' + feature.properties.GWS_Market + '<br><a href="#" class="CMADetailLink">Click to Show Market Drive History</a>', {
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
                            layer.bindPopup('Market Drive: ' + ' - ' + feature.properties.GWS_Market + '<br><a href="#" class="CMADetailLink">Click to Show Market Drive History</a>', {
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

                //kk attempt to populate popup data for each drive
                console.log('step 241');
                VpgmData3Layer = L.geoJSON(VpgmData3, {
                    onEachFeature: onEachFeature,
                    style: myStyle
                });
               

         
                console.log("kk_14N");
                console.log("marketType" + marketType);
                if (marketType == 'NATIONAL' | marketType == 'REGION') {
                    console.log('step 242');
                    map.setView({ lat: 37.0902405, lng: -95.7128906 }, 4);
                } else {
                    map.fitBounds(VpgmData3Layer.getBounds());
                }

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
                    console.log('step 243');
                    return d === 'WIN' ? "#009900" :
                        d === 'TIE' ? "#00FF00" :
                            d === 'LOSS' ? "#FF9933" :
                                "#ff7f00";
                }

                var legend = L.control({ position: 'bottomright' });
                // Legend info in bottom right - change to WLT legend kk_needed_update
                legend.onAdd = function (map) {
                    console.log('step 244');
                    var div = L.DomUtil.create('div', 'infolegend legend');
                    categories = ['WIN', 'TIE', 'LOSS'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="rectangle" style="border: 8px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);
//layer selection on main page map
                var overlays = {
                    "VPGM Market Borders": MarketBoundaryLayer

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
    
                });

                startCMA();


            }
            console.log('kk_CMA_Modal_Click');
            function showCMAModal(props, clickedlat, clickedlong) {
                CMAModal_Click();
                console.log('showCMAModal');
                updateCMAModal(props, clickedlat, clickedlong); // function for getting data for modal

            }

            function CMAModal_Click(source, eventArgs) {
                console.log('CMAModal Click Function');
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
            console.log('test3');
            function updateCMAModal(props, clickedlat, clickedlong) {
                console.log('kk_updateCMAModal Start');                
                CMAModalSelected = props.GWS_MARKET;
                console.log(props);

 // kk removing store from map
                $.when(

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_CMAModalTable_Data",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'CMAVariable': props.GWS_Market }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            //$('#ddlSortZipModal option:eq(1)').removeAttr('selected');
                            //$('#ddlSortZipModal option:eq(2)').removeAttr('selected');
                            //$('#ddlSortZipModal option:eq(3)').removeAttr('selected');
                            //$('#ddlSortZipModal option:eq(0)').attr('selected', 'selected');
                            CMAModalTabledata = JSON.parse(data.d);

                        },
                        error: function (data, market, time, market_long) {
                        }
                    }),
                   // kk_OneScore Trend Graph Load starting changes                   
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "GWS_Module.aspx/Get_GWS_Trend", //v5 updated
                        data: JSON.stringify({ 'CMAVariable': props.GWS_Market }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                           // GWS_Data_Chart = JSON.parse(data.d);  //graph change
                            loadGWS_TREND(data, props);
                           
                        },
                        error: function (data) {
                        }
                    })                 

                ).then(function () {
                    console.log('Chart Data');
                   // console.log(GWS_Data_Chart);
                    //loadGWS_TREND(GWS_Data_Chart); //graph change
                    //console.log(CMAModalTabledata);
                    var CMAVariable = props.GWS_Market;

                   
                    console.log('CMAVariable');
                    console.log(CMAVariable);
                    document.getElementById('CMAModalTitle').innerHTML = ' - ' + props.GWS_Market; 
                    document.getElementById('DisplayGWS_Market').innerHTML = props.GWS_Market;
                    document.getElementById('DisplaySales_Market').innerHTML = 'Sales Market: ' + props.SALES_MARKET;
                    document.getElementById('DisplayCMA_Name').innerHTML = 'CMAs Driven: ' + props.CMA_NAME;
                    document.getElementById('DisplayCMA_Rank').innerHTML = 'CMAs Rank: ' + props.CMA_RANK;
                    document.getElementById('DisplayLatest_Drive').innerHTML = 'Latest Drive: ' + props.LATEST_DRIVE;
                    document.getElementById('DisplayOneScore').innerHTML = 'OneScore: ' + props.ONESCORE;
                    document.getElementById('DisplayGWS_Claim').innerHTML = 'GWS Claim: ' + props.WLT_MARKER;
                    document.getElementById('DisplayPrevious_Result').innerHTML = 'Previous GWS Claim: ' + props.PREVIOUS_RESULT;
                    document.getElementById('DisplayOverall_Rank').innerHTML = 'Overall Rank: ' + props.CARRIER_RANK;
 
                    console.log('Boundary');
                    console.log(MarketBoundaryData);
                    console.log('VpgmData3');
                    console.log(VpgmData3);
                    console.log('modaltable');
                    console.log(CMAModalTabledata);
                    ShowCMAModalMap(VpgmData3, MarketBoundaryData, CMAVariable, DriveRouteData);
                    loadGWS_TREND
                    CMAModalTable(CMAModalTabledata, CMAVariable);
 

                    //next two lines for testing
                    $('#LOADING_CMA_Modal').hide();
                    $('#CMAModalTitle').show();
                    $('#ModalDisplay_CMA').show();


                });

            }
            var chart2;
            function loadGWS_TREND(data, props) {
                console.log('Kelly');
                console.log(chart2);
                console.log(props.GWS_Market);
                console.log(data.GWS_Market);
                var GWSmarketTitle = props.GWS_Market;  
                GWS_Trend = JSON.parse(data.d);
                var GWS_series_values = [];
                var keys = Object.keys(GWS_Trend[0]);
                console.log('GWS_Trend_Chart');
                console.log(GWS_Trend);
                // Parse returned json string into x axis categories and y series values - why am I getting sting values and not integer values?
                

                for (var k = 0; k < keys.length; k++) {
                    var a = [];
                    for (var j = 0; j < GWS_Trend.length; j++) {
                        if (k == 0) {
                            a.push(GWS_Trend[j][0]);
                        } else {
                            a.push(GWS_Trend[j][keys[k]]);
                        }
                    }
                    //'GWS_series_values[]|{ATT: (.key)tonumber}'
                    GWS_series_values.push(a);
                }

                createGWSColchart(GWS_series_values[0], 'GWS_TREND', GWSmarketTitle,  'OneScore Results - VoLTE');
                console.log('GWS_Trend_Chart2');
                console.log(GWS_series_values);
                console.log('Kelly2');
                console.log(chart2);
                var j = 2
                console.log('ATT Values');
                console.log(GWS_series_values[j]);
                chart2.addSeries({
                    name: 'AT&T',
                    id: 'AT&T',                    
                    //yAxis: 1,
                    lineWidth: 4,
                    //marker: {
                    //    symbol: 'circle'
                    //},
                    data: GWS_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 3
                console.log('Sprint Values');
                console.log(GWS_series_values[j]);
                chart2.addSeries({
                    name: 'SPRINT',
                    id: 'SPRINT',
                    //yAxis: 1,
                    lineWidth: 4,
                    //marker: {
                    //    symbol: 'circle'
                    //},
                    data: GWS_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 4
                console.log('TMO Values');
                console.log(GWS_series_values[j]);
                chart2.addSeries({
                    name: 'T-MOBILE',
                    id: 'T-MOBILE',
                    //yAxis: 1,
                    lineWidth: 4,
                    //marker: {
                    //    symbol: 'circle'
                    //},
                    data: GWS_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);
                var j = 5
                console.log('Verizon Values');
                console.log(GWS_series_values[j]);
                chart2.addSeries({
                    name: 'VERIZON',
                    id: 'VERIZON',
                    //yAxis: 1,
                    lineWidth: 4,
                    //marker: {
                    //    symbol: 'circle'
                    //},
                    data: GWS_series_values[j],
                    animation: false,
                    showInLegend: true
                }, false);                
                console.log('GWS_Trend_Chart3');
                chart2.redraw();
            }

            function createGWSColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
                Highcharts.setOptions({                    
                    //lang: {
                    //    thousandsSep: ','
                    //},
                    colors: ['#3399FF', '#FFE100', '#FF99FF', '#FF3300'] //blue, yellow, pink, red
                    //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                });             
                chart2 = new Highcharts.Chart({
                    chart: {
                        type: 'line',
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
                        categories: ['19D1', '19D2', '20D1', '20D2', '21D1', '21D2'],
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
                            text: 'OneScore',
                            style: {
                                fontSize: "12px"
                            }
                        },
                        labels: {
                            style: {
                                fontSize: "12px"
                            }
                        }                    
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

            function ShowCMAModalMap(VpgmData3, MarketBoundaryData, CMAVariable, DriveRouteData) { // ShowCMAModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable) {

                //console.log('ZipVariable2: ' + ZipVariable);

                //console.log('CMAstoreData');
                //console.log(CMAstoreData);
                console.log('DriveRoute');
                console.log(DriveRouteData);
                
                $('#LOADING_CMA_Modal').hide();
                $('#ModalDisplay_CMA').show();

                $(window).resize();

                if (mapModal != null) {
                    mapModal.remove();
                    mapModal = null;
                }

               
               {
                    //make tab 2 active, remove active from tab 1, hide tab 1
                    var tabpane2 = document.getElementById("m_tabs_1_tab2");
                    tabpane2.classList.add("active");
                    var tab2 = document.getElementById("tab2");
                    tab2.classList.add("active");
                    console.log('kk tab state2');


                    //var tabpane1 = document.getElementById("m_tabs_1_tab1");
                    //tabpane1.classList.remove("active");
                    //var tab1 = document.getElementById("tab1");
                    //tab1.classList.remove("active");


                    $('#tab1').hide();

                }

                //document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity v2.1 - " + market_long;
                //document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('myCMAModalMap').innerHTML = "<div id='CMAModalMap' style='height: 800px;'></div>";

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
                //if (ATTR.length > 0) { mapModalOptions.layers.push(ATTRstorePoints); }
                //if (AR.length > 0) { mapModalOptions.layers.push(ARstorePoints); }
             //   if (CMAPSAData.length > 0) { mapModalOptions.layers.push(PSALocationPoints); console.log('PSA points found'); }
               // if (CMAMDUData.length > 0) { mapModalOptions.layers.push(MDUPoints); }

                //console.log('mapModalOptions2');
                //console.log(mapModalOptions);

                mapModal = L.map("CMAModalMap", mapModalOptions);

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

                function styleRoute(feature) {
                    return {
                        //fillColor: "#FCB81E",
                        fillOpacity: 0.01,
                        color: "#0000ff",
                        weight: 1,
                        //opacity: 0.5,
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

                var DriveRouteLayer = L.geoJSON(DriveRouteData, {
                    style: styleRoute,
                    zIndex: 5,
                    onEachFeature: onEachFeatureBoundary
                }).addTo(mapModal);                

                function onEachFeatureCMA(feature, featureLayer) {
                    console.log('step 257');
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
                    console.log('step 258');
                    if (feature.properties.GWS_Market == CMAVariable) return true
                    if (feature.properties.DriveRouteData == CMAVariable)return true
                }

                mapModal.fitBounds(CMAModalLayerTest.getBounds());

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(mapModal);


                //function getColor(d) {
                //    return d === 'AT&T Retail Store' ? "#002280" :
                //        d === 'Authorized Reseller Store' ? "#21b2ff" :
                //            "#ff7f00";
                //}

            //    var legendCMA = L.control({ position: 'bottomright' });
                var legendCMANoPSA = L.control({ position: 'bottomright' });
                legendCMANoPSA.onAdd = function (mapModal) {

                    var div = L.DomUtil.create('div', 'infolegendTwoRows legendTwoRows');

                    categories = [];
                    //if (ATTR.length > 0) { categories.push('AT&T Retail Store'); }
                    //if (AR.length > 0) { categories.push('Authorized Reseller Store'); } 

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnutTwoRows" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legendCMANoPSA.addTo(mapModal);

                var overlays = {
                    "VPGM Market Borders": MarketBoundaryLayer,
                    "Drive Route": DriveRouteLayer
                };







                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(mapModal);

                mapModal.on('overlayadd', function () {
                    if (map.hasLayer(PSALocationPoints)) {
                        PSALocationPoints.bringToFront();
                        if (map.hasLayer(MDUPoints)) {
                            MDUPoints.bringToFront();
                        }
                    }
                });

                mapModal.invalidateSize();

            }



            function startCMA() {
                console.log('step 296');
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
                console.log('step 297');
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                if (map.hasLayer(vectorGridCMA0)) {
                    return;
                } else {
                    console.log('tewst');
                   // document.getElementById('TableSubtitle2').innerHTML = "";
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
                console.log('step 298');
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                }
                //map.removeLayer(Vpgm3LayerTest);
                if (map.hasLayer(vectorGridCMA1)) {
                    return;
                } else {
                    console.log('kktesting');
                   // document.getElementById('TableSubtitle2').innerHTML = "(New Win)";
                    CMALayerState = 1;
                    UpdateHomeTable();
                    //console.log('table return');
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA1);
                   // map.addLayer(vectorGridCMA0);
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
                   // document.getElementById('TableSubtitle2').innerHTML = "(Tie from Loss)";
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
                    //document.getElementById('TableSubtitle2').innerHTML = "(Tie from Win)";
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
                  //  document.getElementById('TableSubtitle2').innerHTML = "(New Loss)";
                    CMALayerState = 5;
                    UpdateHomeTable();
                    map.removeLayer(vectorGridCMA0);
                    map.removeLayer(vectorGridCMA1);
                    map.removeLayer(vectorGridCMA2);
                    map.removeLayer(vectorGridCMA3);
                    map.removeLayer(vectorGridCMA4);
                    map.addLayer(vectorGridCMA4);
                }
            }

            //function turnLayer5CMAOn() {
            //    if (map.hasLayer(Vpgm3LayerTest)) {
            //        Vpgm3LayerTest.clearLayers();
            //        map.removeControl(infoDatatable);
            //        map.addControl(info);
            //    }
            //    //map.removeLayer(Vpgm3LayerTest);
            //    if (map.hasLayer(vectorGridCMA4)) {
            //        return;
            //    } else {
            //        document.getElementById('TableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
            //        CMALayerState = 4;
            //        UpdateHomeTable();
            //        map.removeLayer(vectorGridCMA0);
            //        map.removeLayer(vectorGridCMA1);
            //        map.removeLayer(vectorGridCMA2);
            //        map.removeLayer(vectorGridCMA3);
            //        map.removeLayer(vectorGridCMA4);
            //        map.addLayer(vectorGridCMA4);
            //    }
            //}
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
                console.log('step 309');
                var clicked = $(this);

                if (clicked.hasClass('active')) {
                    //$('.oneButton').removeClass('disabled'); //enable all again
                    //clicked.removeClass('active');
                } else {
                    console.log('noclass');
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
