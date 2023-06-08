<%@ Page Title="TESTING - Sales National Wireless Campaign" Language="C#" MasterPageFile="~/MasterPageNationalWirelessCampaign.master" AutoEventWireup="true" CodeFile="Sales_National_Wireless_Campaign_TestingV2.aspx.cs" Inherits="sales_Sales_National_Wireless_Campaign_TestingV2" %>

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
    <script src="../capacity/maps/leaflet-event-forwarder.js"></script>
    <script src="../capacity/maps/leaflet.markercluster.freezable.js"></script> 

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
            opacity: 0.95;
        }

        .legendZip {
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


        .infolegend.legend {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 66px;
            width: 175px;
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

        #filter_box2 {
            border-color: #87cefa;
            border-style: solid;
            border-width: 1.5px;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #filter_box3 {
            border-color: #87cefa;
            border-style: solid;
            border-width: 1.5px;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #filter_box4 {
            border-color: #87cefa;
            border-style: solid;
            border-width: 2px;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        #buttonrowcenter3 {
            text-align: center;
        }

        #Prioritization_Header {
            text-align: center;
        }

        #buttonrowcenter101 {
            text-align: center;
        }
        #buttonrowcenter102 {
            text-align: center;
        }
        #buttonrowcenter103 {
            text-align: center;
        }
        #buttonrowcenter104 {
            text-align: center;
        }
        #buttonrowcenter105 {
            text-align: center;
        }
        #buttonrowcenter106 {
            text-align: center;
        }
        #buttonrowcenter107 {
            text-align: center;
        }
        #buttonrowcenter108 {
            text-align: center;
        }
        #buttonrowcenter109 {
            text-align: center;
        }
        #buttonrowcenter110 {
            text-align: center;
        }


    </style>

    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />


    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <div class="subheader py-2 py-lg-12 subheader-solid" id="kt_subheader">
            <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                <!--begin::Info-->
                <div class="d-flex align-items-center flex-wrap mr-1">
                    <!--begin::Page Heading-->
                    <div class="d-flex align-items-baseline mr-5">
                        <!--begin::Page Title-->
                        <h5 class="text-dark font-weight-bold my-2 mr-5">National Wireless Campaign - Wireless Scoring *TESTING PAGE*</h5>
                        
                        <!--end::Page Title-->
                        <!--begin::Breadcrumb-->
                        <%--<ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales.aspx" class="text-muted">Sales Home Page</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales_Dashboard.aspx" class="text-muted">Sales Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales_National_Wireless_Campaign_TestingV2.aspx" class="text-muted">National Retail - Store Wireless Scoring</a>
                            </li>                            
                        </ul>--%>
                        <!--end::Breadcrumb-->
                    </div>                    
                    <!--end::Page Heading-->
                </div>
                <div style="text-align: right; float: right;" class="m-demo__preview m-demo__preview--btn">                                                                    
                    <button type="button" class="btn btn-primaryClassification btn-sm" id="ClassificationMethodologyBtn" onclick="ShowClassificationMethodology()">&nbsp; Classification Methodology
                        &nbsp;<br />Click to Show Details</button>&nbsp; 
                    
                    <a class="btn btn-primaryClassification btn-sm" href="mailto:wc5172@att.com;kj390r@att.com;tl246s@att.com;eh569u@att.com?subject=PONDER - National Wireless Campaign Feedback">&nbsp; Submit Feedback
                        &nbsp;<br />Click to Send Email
                    </a>&nbsp;
                </div>
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
                                            <%--<div id="ddlWrapper">
                                                <asp:Label ID="labelMarket" runat="server" Visible="false" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                                                </asp:DropDownList>
                                            </div>--%>

                                            <%--<div id="ddlWrapper2" style="text-align: right">
                                                <asp:Label ID="labelSortNational" runat="server" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlSortNational" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="NationalTableUpdate();">
                                                </asp:DropDownList>
                                            </div>--%>
                                            <%--<div id="ddlWrapper3" style="text-align: right">
                                                <asp:Label ID="labelSortBy" runat="server" Text="Filter By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="UpdateHomeTable();">
                                                </asp:DropDownList>  
                                            </div>--%>

                                            <%--<div style="display: none;">
                                                <asp:Button runat="server" ID="btnZipModal" data-toggle="modal" data-target="#m_modal_zip" />
                                            </div>--%>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnshowDataModal" data-toggle="modal" data-target="#m_modal_showData" />
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

                                    <div class="tab-content">
                                        <%--<div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">  --%>                                         
                                            
                                            
                                            <div class="row" id="MapDivHeader">
                                                <div class="col-lg-4" id="Placeholder_tab1">
                                                    <div id="filter_box">
                                                        <div class="card-body">
                                                            <div id="Filter_Header" style="text-align: center; color: black">
                                                                <h3 class="m-subheader2__title m-subheader2__title--separator">Filters</h3>
                                                                <h6 class="m-subheader2__title m-subheader2__title--separator">(Important for Top 50 List Below)</h6>
                                                            </div>
                                                            

                                                            <%--<asp:ScriptManager ID="ScriptManager2" runat="server" AsyncPostBackTimeout="120">
                                                            </asp:ScriptManager>--%>

                                                            <asp:UpdatePanel ID="UpdatePanel_Inputs" runat="server" ChildrenAsTriggers="true">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <div>
                                                                            <asp:Label ID="label1" runat="server" Style="height: 35px; width: 150px; float: left;" Text="Campaign ID: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlCampaign" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCampaign_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label8" runat="server" Style="height: 35px; width: 150px; float: left;" Text="State: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <%--<asp:Label ID="label12" runat="server" Style="height: 35px; text-align: right;" Text="(Important for Top 50 List Below)" Visible="true" Font-Size="9" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:Label ID="label13" runat="server" Style="height: 35px; text-align: right;" Text=": &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>--%>
                                                                            <asp:DropDownList ID="ddlState" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label9" runat="server" Style="height: 35px; width: 150px; float: left;" Text="Zip: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <%--<asp:Label ID="label11" runat="server" Style="height: 35px; text-align: right;" Text="(Important for Top 50 List Below)" Visible="true" Font-Size="9" Font-Bold="false" ForeColor="Black"></asp:Label>                                                                            
                                                                            <asp:Label ID="label14" runat="server" Style="height: 35px; text-align: right;" Text=": &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>--%>
                                                                            <asp:DropDownList ID="ddlZip" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlZip_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label2" runat="server" Style="height: 35px; text-align: left;" Text="* Coverage Score " Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:Label ID="label12" runat="server" Style="height: 35px; text-align: left;" Text="(At Least)" Visible="true" Font-Size="9" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:Label ID="label13" runat="server" Style="height: 35px; text-align: left;" Text=": &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlCoverageScore" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCoverageScore_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label3" runat="server" Style="height: 35px; width: 150px; float: left;" Text="5G: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddl5G" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl5G_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                       
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label4" runat="server" Style="height: 35px; text-align: left;" Text="* Speed/Avail Capacity " Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:Label ID="label11" runat="server" Style="height: 35px; text-align: left;" Text="(At Least)" Visible="true" Font-Size="9" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:Label ID="label14" runat="server" Style="height: 35px; text-align: left;" Text=": &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlTPUT_TEXT" Width="220px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTPUT_TEXT_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label6" runat="server" Style="height: 35px; width: 150px; float: left;" Text="Roaming: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlROAM" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlROAM_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>

                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label5" runat="server" Style="height: 35px; width: 150px; float: left;" Text="FirstNet Band 14: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlB14" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlB14_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        
                                                                        <br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label7" runat="server" Style="height: 35px; text-align: left;" Text="* Legacy Device Penetration: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlFiberCust" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFiberCust_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>

                                                                        <%--<br />
                                                                        <br />
                                                                        
                                                                            <asp:Label ID="label11" runat="server" Style="height: 35px; text-align: right;" Text="Primary Competitor: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlCompetitor" Width="150px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCompetitor_SelectedIndexChanged">
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>--%>

                                                                        </div>
                                                                        <br />                                                            
                                                                        
                                                                        <div id="Prioritization_Header" style="text-align: center; color: black">
                                                                            <h4 class="m-subheader2__title m-subheader2__title--separator">Priority</h4>
                                                                        </div>                                                                        

                                                                        <div>
                                                                            <asp:Label ID="label10" runat="server" Style="height: 35px; width: 150px; float: left;" Text="Prioritize By: &nbsp;&nbsp;" Visible="true" Font-Size="10" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                                            <asp:DropDownList ID="ddlSort_1" Width="190px" runat="server" AutoPostBack="true" >
                                                                                <asp:ListItem Text="ALL" Value="ALL"></asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </div>                                                                         
                                                                        
                                                                        
                                                                        <br />
                                                                        <div id="buttonrowcenter3">
                                                                            <asp:Button ID="ClearButton" runat="server" Text="Clear" OnClick="btnClear_Click" />
                                                                            <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="btnSubmit_Click" Enabled ="false" OnClientClick="UpdateHomeTable();" />
                                                                            <br />
                                                                            <div id="footer submit" style="text-align: center; color: #343a40; font-size:11px;">(Campaign ID and State must be selected to activate submit button)</div>                                                                            
                                                                            <div id="footer submit2" style="text-align: center; color: #343a40; font-size:13px;"><b>* Item counts towards Network Enhancement Contest</b></div>
                                                                            <div id="footer submit3" style="text-align: center; color: #343a40; font-size:10px;">(Network Enhancement Contest Criteria - Must have Coverage Score of 4 or 5 <b>AND EITHER</b></div>
                                                                            <div id="footer submit4" style="text-align: center; color: #343a40; font-size:10px;">Speed/Available Capcity = High Speed/Very High Avail Capacity <b>OR</b> Legacy Device Penetration = High)</div>
                                                                        </div>
                                                                        

                                                                        <%--<asp:RadioButton ID="rbtnCluster" runat="server" GroupName="cluster" Checked="true" Text="My Clusters" AutoPostBack="true" OnCheckedChanged="rbtn_CheckedChanged" />
                                                                        <asp:RadioButton ID="rbtnShared" runat="server" GroupName="cluster" Text="Shared with Me" AutoPostBack="true" OnCheckedChanged="rbtn_CheckedChanged" />
                                                                        <asp:RadioButton ID="rbtnPublic" runat="server" GroupName="cluster" Text="Public" AutoPostBack="true" OnCheckedChanged="rbtn_CheckedChanged" />--%>

                                                                        
                                                                        <%--<br />
                                                                        <asp:Label ID="lblResults" runat="server" Text="" Font-Names="Arial"></asp:Label>--%>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>   
                                                             

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-lg-8" id="MapDivSection">
                                                    <div id="Information" style='text-align: center;'>
                                                        <h2>Select Campaign ID & State, and any Filters then click 'Submit' to show data.</h2>
                                                    </div>
                                                    <div id="LOADING1" style='display: none; text-align: center;'>
                                                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Map and Table Data...
                                                    </div>
                                                    <div id="MapDiv">
                                                        <div style="text-align: center; color: red">
                                                            <h2 id="mapcountwarning"></h2>
                                                        </div>
                                                        
                                                        <div style="text-align: center; color: #343a40">                                                        
                                                            <h2 id="mapcounttitle"></h2>
                                                            <h4 id="mapcountsubtitle"></h4>
                                                        </div>                                                    
                                                        <div id="storemapdiv" style="height: 500px; text-align: left;"></div>
                                                        <div id="zipfooter" style="text-align: center; color: #343a40; font-size:12px;">
                                                            <%-- * A Wireless Score was generated for each PSA, utilizing IQI data within a 3/4 mile radius of each Exact PSA location. The darker the green PSA dot, the higher the wireless score.--%>
                                                            <%--<div id="zipfooterheader" style="text-align: center; color: #343a40; font-size:14px;">
                                                                <b>* Wireless coverage is exclusively assessed around population centers.</b><br />
                                                            </div>--%>
                                                            <div id="zipfootercontent" style="text-align: center; color: #343a40; font-size:12px;">
                                                                <%--<b>Wireless coverage and capacity is subject to change. Wireless coverage shown is a general indication, for more accurate analysis contact the market RAN Director.</b><br />--%>
                                                            
                                                            </div>
                                                        </div>
                                                        <div id="zipfooter2"style="text-align: center; color: #343a40; font-size:12px;">
                                                            <div id="zipfooter2header" style="text-align: center; color: #343a40; font-size:14px;">
                                                                <%--<b>* Wireless coverage is exclusively assessed around population centers.</b><br />--%>
                                                            </div>
                                                            <div id="zipfooter2content" style="text-align: center; color: #343a40; font-size:12px;">
                                                                <b>** Network Information is Proprietary and should not be disclosed or shared outside of AT&T without written permission. ** </b><br />                                                                
                                                                General Wireless Coverage within 200 meters around a location, calculated and classified as:  <br />
                                                                <span style="width: 12px; height: 12px; border-radius: 0%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> 1: Very Weak
                                                                <span style="width: 12px; height: 12px; border-radius: 0%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> 2: Weak 
                                                                <span style="width: 12px; height: 12px; border-radius: 0%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> 3: Strong
                                                                <span style="width: 12px; height: 12px; border-radius: 0%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> 4: Very Strong
                                                                <span style="width: 12px; height: 12px; border-radius: 0%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> 5: Best 
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                
                                                
                                            </div>
                                            <br />
                                           
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv5_tab1">
                                                    <div class="row">
                                                        <%--<div class="col-lg-1" id="Placeholder_tab3">
                                                        </div>--%>
                                                        <div class="col-lg-12" id="RecentDiv6_tab1">

                                                            <div class="content d-flex flex-column flex-column-fluid" id="kt_content2">
                                                                <div class="d-flex flex-column-fluid">                                                                   
                                                                   
                                                                    
                                                                    <div class="container" id="NationalTableDiv">
                                                                        <div class="card card-custom">
                                                                            
                                                                                <div class="card-header">
                                                                                    <div class="card-title">
                                                                                        <%--<span class="card-icon">
                                                                                            <i class="flaticon2-gear text-primary"></i>
                                                                                        </span>--%>
                                                                                        <h3 class="card-label"><span id="NationalTableSubtitle1"></span>Top 50 Locations Prioritized by <span id="orderBySpan"></span></h3>
                                                                                        <h6 class="card-label">&nbsp;&nbsp;(Important: Depends on filter settings from above)</h6>
                                                                                        <div style="display: none;">
                                                                                            <asp:Button runat="server" ID="ButtonExportAll_Filtered" OnClick="ExportToExcel_All_Filtered" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="card-toolbar">
                                                                                        <div class="right" id="right_orderSortNational">
                                                            
                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortNational" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        <%--<asp:Label ID="labelSortBy" runat="server" Text="Filter By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlSortBy" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="UpdateHomeTable();">
                                                                                                        </asp:DropDownList>  --%>                                                                                                                                                

                                                                                                    </ContentTemplate>

                                                                                               </asp:UpdatePanel>
                                                                                            </h5>
                                                                                        </div>

                                                                                    </div>
                                                                                </div>                                                                                
                                                                                <div class="card-body">
                                                                                    <!--begin: Datatable-->
                                                                                    <table class="table compact" id="national_datatable">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th>Rank</th>
                                                                                                <th>Campaign ID</th>
                                                                                                <th>Coverage Score</th>
                                                                                                <th>5G</th>
                                                                                                <th>5G Plus</th>
                                                                                                <th>Speed and Available Capacity</th>
                                                                                                <th>Roaming</th>
                                                                                                <th>FNET</th>
                                                                                                <th>FNET Band 14</th>
                                                                                                <th>Legacay Device Penetration</th>                                                                                                
                                                                                                <th>Primary Competitor</th>
                                                                                                <th>Company Name</th>
                                                                                                <th>Employee Count</th>
                                                                                                <th>Contact First Name</th>
                                                                                                <th>Contact Last Name</th>
                                                                                                <th>Contact Phone</th>
                                                                                                <th>Contact Email</th>
                                                                                                <th>City</th>
                                                                                                <th>State</th>
                                                                                                <th>Zip</th>
                                                                                                <th>Latitude</th>
                                                                                                <th>Longitude</th>
                                                                                                <th>Location ID</th>
                                                                                                <%--<th>Overall Rank</th>--%>

                                                                                            </tr>
                                                                                        </thead>
                                                                                        <%--<tfoot>
                                                                                            <tr>
                                                                                                <th>Rank</th>
                                                                                                <th>Location ID</th>
                                                                                                <th>Dealer Name</th>
                                                                                                <th>Store Number</th>
                                                                                                <th>City</th>
                                                                                                <th>State</th>
                                                                                                <th>Wireless Score</th>
                                                                                                <th>Overall Rank</th>
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
    </div>

    <!-- Classification Modal Start -->
    <div class="modal fade" id="ClassificationModal" tabindex="-1" role="dialog" aria-labelledby="myRYGModal3Label">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Wireless Classification Methodology</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <%--<div style="text-align: center;">
                        <h4>The purpose of this tool is to find specific areas (down to the exact address) to sell our current fiber. <br />
                            These are addresses where our fiber is available but not currently being purchased. <br />
                            IQI data is also pulled to check that our wireless strength in that area is strong enough to not limit fiber sales.</h4>
                        <br />
                        <h4>IQI Data: May 2019 - Apr 2020</h4>                    
                        <h4>OVALS Fiber Location Data: 07/13/2020</h4>
                        <h4>OVALS In-Service Customer Data: 07/13/2020</h4>
                        <br />
                    </div>
                    <hr style="height:2px;border-width:0;color: #595959;background-color: #595959">
                    <br />--%>
                    <div style="text-align: left;">
                        <h4><b><u>Coverage Score</u></b></h4>
                        <h6>The coverage score is built to reflect the way the customer experiences coverage when being indoor. It is accurate and considers the customer’s business location and its immediate surroundings. 
                            Please note that it is still less accurate than a local engineering assessment, so please refer to your market for 100% certainty. 
                            The score ranges from 1–Very Weak to 5-Best correspond to the following experience: <br /> <br />
                    
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;5-Best: Excellent experience in indoor and outdoor conditions. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;4-Very Strong: Very good experience. Excellent coverage outdoor and at strong coverage everywhere indoor. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;3-Strong: Seamless network experience, typical of any cellular network. Good coverage outdoor and in most areas indoor. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;2-Weak: Good experience outdoor and partially indoor. Some areas may not be adequately covered indoor. Typical situation where enabling Voice over Wi-Fi would be recommended for a seamless experience. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;1-Very Weak: Weak outdoor experience, partial indoor coverage is possible but poor experience overall. <br />
                            <br />
                        </h6>

                        <h4><b><u>Speed Rating</u></b></h4>
                        <h6>
                    
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;High: Very fast downloads available (top 20% in the network). Outstanding experience. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;Medium: Consistently fast download available. Seamless experience with video and downloads. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;Low: Download speed may dip during busiest time of the day. Video quality may be degraded at that time. <br />
                            <br />
                          
                        </h6>

                        <h4><b><u>Available Capacity Rating</u></b></h4>
                        <h6>
                    
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;Very High Avail Capacity: Sites carry few users and low traffic. Seamless Connection Sharing, even for very demanding tasks. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;High Avail Capacity: Sites carry low traffic for most of the day. Seamless Connection Sharing is possible. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;Medium Avail Capacity: Sites carry moderate traffic. Connection sharing works well but will slow down at peak time. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;Low Avail Capacity: Sites carry many users and high traffic. Connection Sharing works but experience will be degraded at peak time, especially if several users are watching videos at the same time. <br />
                           &nbsp;&nbsp;&nbsp;&nbsp; •	&nbsp;&nbsp;Very Low Avail Capacity: Sites carry large amount of users and very high traffic volumes. Individual experience is likely to be affected. Connection Sharing is not recommended. <br />
                          
                        </h6>
                    
                        <%--<div class="row">
                            <div class="col-lg-5" style="padding-bottom: 10px; padding-top: 5px;">
                                <div style="  border: 2px solid #ff9933; background-color: #ffe6cc; color: black; text-align: center;">                                                      
                                    <b>Weak Wireless & No Fiber</b><br>
                                    IQI Samples Weighted Average RSRP < -105 dBm<br>
                                    No Fiber Available
                                </div>
                            </div>
                            <div class="col-lg-5" style="padding-bottom: 10px; padding-top: 5px;">
                                <div style=" border: 2px solid #999900; background-color: #ffff99; color: black; text-align: center;">             
                                    <b>Weak Wireless & Fiber Available</b><br>
                                    IQI Samples  Weighted Average RSRP < -105 dBm<br>
                                    Fiber Available
                                </div>
                            </div>
                         </div>
                        <div class="row">
                            <div class="col-lg-5" style="padding-bottom: 5px;">
                                <div style=" color: black; background-color: #b3d9ff; border: 2px solid #4da6ff; text-align: center; ">
                                    <b>Strong Wireless & No Fiber</b><br>
                                    IQI Samples  Weighted Average RSRP >= -105 dBm<br>
                                    No Fiber Available
                                </div>
                            </div>
                            <div class="col-lg-5" style="padding-bottom: 5px;">
                                <div style=" color: black; background-color: #b3ffb3; border: 2px solid #009900; text-align: center; ">
                                    <b>Strong Wireless & Fiber Available</b><br>
                                    IQI Samples  Weighted Average RSRP >= -105 dBm<br>
                                    Fiber Available
                                </div>
                            </div>
                        </div>                      --%>  

                        <%--<h6> Stores are also plotted on the map: AT&T Retail in dark blue and Authorized Reseller in light blue. <br />
                            For National and Regional maps the store counts are so high that we must cluster them. <br />
                            Individual stores can always be seen by zooming in. 

                            </h6>
                            <img src="Store_Legend_Cluster.png" />
                            <br />


                        <h6>
                            At the VPGM Market level, within the Zip Codes, we show PON Serving Areas (PSAs) as small Green or Yellow circles. <br />
                            These give a sense of which neighborhood is being served by our Passive Optical Network, the "last mile" of our Fiber service.<br />
                            Green PSAs indicate Strong Wireless coverage, and Yellow PSAs indicate Weak Wireless coverage. <br />
                            IQI Data is used within 3/4 mile of the PSA Location. <br />
                            The PSAs are then subdivided into smaller categories to allow for more granular classification: <br /> <br />--%>

                            <%--(DRAFT) <br /> --%>

                           <%-- <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Score 1 (Very Weak): NoServiceRate > 5 % OR RSRP 75% < -120 <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Score 2 (Weak): Not in Score 1 AND (5% > NoServiceRate > 1% OR RSRP 75% < -115) <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Score 3 (Strong): (Not in Score 1 AND not in Score 2) AND (1%> NoServiceRate > 0.02% OR RSRP 75% < -110) <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Score 4 (Very Strong): (Not in Score 1 AND not in Score 2 AND not in Score 3) AND (0.02% > NoServiceRate >= 0% OR RSRP 75% < -100) <br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): (Not in Score 1 AND not in Score 2 AND not in Score 3 AND not in Score 4) AND NoServiceRate = 0% AND RSRP 75% >= -100 <br />--%>

                           <%-- <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Score 1 (Very Weak): NoServiceRate > 5% OR Bottom 25% of samples have RSRP < -120 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Score 2 (Weak): 5% > NoServiceRate > 1% OR Bottom 25% of samples have RSRP < -115 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Score 3 (Strong): 1% > NoServiceRate > 0.02% OR Bottom 25% of samples have RSRP < -110 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Score 4 (Very Strong): 0.02% > NoServiceRate OR Bottom 25% of samples have RSRP < -100 dBm<br />
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): 0% = NoServiceRate AND Bottom 25% of samples have RSRP >= -100 dBm<br />--%>


                        <%--</h6>--%>
                    </div>

                    <div id="ModalDisplay_RYG3">                       
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Classification Modal End -->

    <%--************** showData Modal **************--%>
    <div class="modal fade" id="m_modal_showData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Show Filtered List of Locations</h2>
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

                                               <div class="card-body">

                                                   <!--begin: Datatable-->
                                                    <table class="table compact" id="showDataModal_table">
                                                        <thead>
                                                            <tr>                                                                 
                                                                <th>Campaign ID</th>
                                                                <th>Coverage Score</th>
                                                                <th>5G</th>
                                                                <th>5G Plus</th>
                                                                <th>Speed and Available Capacity</th>
                                                                <th>Roaming</th>
                                                                <th>FNET</th>
                                                                <th>FNET Band 14</th>
                                                                <th>Legacay Device Penetration</th>                                                                                                
                                                                <th>Primary Competitor</th>
                                                                <th>Company Name</th>
                                                                <th>Employee Count</th>
                                                                <th>Contact First Name</th>
                                                                <th>Contact Last Name</th>
                                                                <th>Contact Phone</th>
                                                                <th>Contact Email</th>
                                                                <th>City</th>
                                                                <th>State</th>
                                                                <th>Zip</th>
                                                                <th>Latitude</th>
                                                                <th>Longitude</th>
                                                                <th>Location ID</th>
                                                                <th>Coverage Score Rank</th>
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

    <!-- Zip Modal -->

    <asp:HiddenField ID="hf_PSALocation" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hf_PSALocationZip" runat="server" ClientIDMode="Static" />
    
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
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Weak 
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                        <span style="width: 10px; height: 10px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                        
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

                        <div class="row">
                                                        
                            <div class="col-lg-12" id="ModalDiv6_tab1">

                                <div class="content d-flex flex-column flex-column-fluid" id="kt_contentModal2">
                                    <div class="d-flex flex-column-fluid">
                                        <div class="container" id="zipModalTableDiv">
                            
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
                                                                <%--<th>Latitude</th>
                                                                <th>Longitude</th>--%>
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
        var NationalLayerGroup;
        var mapModal;
        var VpgmDataLayer;
        var VpgmData2Layer;
        var VpgmData3Layer;
        var ZipFullScreenState = 0; // 0 means not fullscreen, 1 means fullscreen. Only care about maps that can lead to modals being hidden behind their fullscreen
        var mcg;
        var currentZoom = 4;
        var currentCenter = [39.73, -104.99];
        var globalFilteredAll;
        var globalFilteredTop50;

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

            var geoTypeStored = '';         // these will be populated after submit button click. Note that initial load calls a submit button click without user clicking
            var marketStored = '';

            

            $(document).keypress(function (e) { if (e.keyCode === 13) { e.preventDefault(); return false; } });

            $(document).ready(function () {

                $('body').bind('cut copy paste', function (e) {
                    e.preventDefault();
                });

                //Disable mouse right click
                $("body").on("contextmenu", function (e) {
                    return false;
                });

                console.log("DocReady");
                $('#ddlWrapper').hide();
                $('#zipfooter').hide();
                $('#zipfooter2').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#NationalTableDiv').hide();
                $('#MapDiv').hide();
                //$('#Information').hide();
                //$('#LOADING1').show();

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/GetDATADATE",
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
                <%--var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();--%>
                //SubmitButtonClick();

            });

            <%--function loadDATADATE(data) {
                var score = JSON.parse(data.d);
                var value = score[0]["DATADATE"];
                document.getElementById('DATADATE').innerHTML = value;
                executedon = value.substring(6, 10) + '-' + value.substring(0, 2) + value.substring(2, 5);
                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();

                SubmitButtonClick();

            }--%>            

            function SubmitButtonClick() {                

                getFilterCriteria();

            }

            //show and hide divs, kick off correct get data function
            function getFilterCriteria() {
                console.log('start2');
                //Hide tabs
                $('.oneButton').removeClass('active');
                $('#zipfooter').hide();
                $('#zipfooter2').hide();
                $('#buttonrowzip').hide();
                $('#buttonrowcounty').hide();
                $('#buttonrowcma').hide();
                $('#zipTableDiv').hide();
                $('#countyTableDiv').hide();
                $('#NationalTableDiv').hide();
                $('#MapDiv').hide();
                $('#Information').hide();
                $('#LOADING1').show();

                //Show tabs
                //$('#LOADING_Quad1_tab' + activeTabNumber).show();

                //trigger chain of functions to get data
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                //var groupGeo = 'SALES';
                <%--var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();--%>

                //if (groupGeo == 'SALES') {
                //    if (marketGeo == '%') {
                //        updateSalesOpportunityChartNational();
                //    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                //        updateSalesOpportunityChartRegion();
                //    } else {
                //        updateSalesOpportunityChartMarket();
                //    }
                //}

            }

            // ********** SALES OPPORTUNITY MARKET **********

            function updateSalesOpportunityChartMarket() {
                console.log('updateSalesOpportunityChartMarket function start');

                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                <%--var groupGeo = 'SALES';
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
                }--%>

                <%--var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();--%>

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_Market",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo }),
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
                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Zip_Summary_Info",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo }),
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
                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'overallCatVariable': '%', 'orderVariable': 'ZIPTOTALPOPS' }),
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

            function UpdateHomeTable() {
                //User changed the Sort Order By of the table, which doesnt affect the map, the themes, or any of the show hides.
                //Grab the required variables and rerun the ajax call for table creation, which is based on the Group By

                $('#NationalTableDiv').hide();
                $('#MapDiv').hide();
                $('#Information').hide();
                $('#LOADING1').show();

                

                var CampaignVariable = $('#<%= ddlCampaign.ClientID %> option:selected').val();
                var CoverageScoreVariable = $('#<%= ddlCoverageScore.ClientID %> option:selected').val();
                var FiveGVariable = $('#<%= ddl5G.ClientID %> option:selected').val();
                var TPUT_TEXTVariable = $('#<%= ddlTPUT_TEXT.ClientID %> option:selected').val();
                <%--var CompetitorVariable = $('#<%= ddlCompetitor.ClientID %> option:selected').val();--%>
                var CompetitorVariable = '%';
                var ROAMVariable = $('#<%= ddlROAM.ClientID %> option:selected').val();
                var B14Variable = $('#<%= ddlB14.ClientID %> option:selected').val();
                var FiberCustVariable = $('#<%= ddlFiberCust.ClientID %> option:selected').val();
                var StateVariable = $('#<%= ddlState.ClientID %> option:selected').val();
                var ZipVariable = $('#<%= ddlZip.ClientID %> option:selected').val();
                var SortVariable = $('#<%= ddlSort_1.ClientID %> option:selected').val();
                var SortVariableText = $('#<%= ddlSort_1.ClientID %> option:selected').text();

                console.log('UpdateHomeTable function start');
                console.log('CampaignVariable: ' + CampaignVariable);
                console.log('StateVariable: ' + StateVariable);
                console.log('ZipVariable: ' + ZipVariable);
                console.log('CoverageScoreVariable: ' + CoverageScoreVariable);
                console.log('FiveGVariable: ' + FiveGVariable);
                console.log('TPUT_TEXTVariable: ' + TPUT_TEXTVariable);
                console.log('CompetitorVariable: ' + CompetitorVariable);
                console.log('ROAMVariable: ' + ROAMVariable);
                console.log('B14Variable: ' + B14Variable);
                console.log('FiberCustVariable: ' + FiberCustVariable);
                console.log('SortVariable: ' + SortVariable);

                document.getElementById('orderBySpan').innerHTML = SortVariableText;


                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                console.log('Get_Store_Detail groupGeo: ' + groupGeo);                

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National1",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData1 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData2 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National3",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData3 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National4",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData4 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National5",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData5 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National6",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData6 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_National1",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'StateVariable': StateVariable, 'ZipVariable': ZipVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            StoreData1 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_National2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'StateVariable': StateVariable, 'ZipVariable': ZipVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            StoreData2 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_National3",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'StateVariable': StateVariable, 'ZipVariable': ZipVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            StoreData3 = data.d;
                        },
                        error: function (data) {
                        }
                    })
                ).then(function () {
                    dataConcat_6strings(LocationData1, LocationData2, LocationData3, LocationData4, LocationData5, LocationData6, StoreData1, StoreData2, StoreData3);
                });                

                function dataConcat_6strings(LocationData1, LocationData2, LocationData3, LocationData4, LocationData5, LocationData6, StoreData1, StoreData2, StoreData3) {
                    var LocationDataConcat6;

                    if (LocationData2 == '[]') {  // if only 1 job
                        LocationDataConcat6 = LocationData1;
                    }
                    else if (LocationData3 == '[]') {  // if only 2 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2;
                    } 
                    else if (LocationData4 == '[]') {  // if only 3 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3;
                    }    
                    else if (LocationData5 == '[]') {  // if only 4 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length - 1);
                        LocationData4 = LocationData4.substring(1, LocationData4.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3 + ',' + LocationData4;
                    }    
                    else if (LocationData6 == '[]') {  // if only 5 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length - 1);
                        LocationData4 = LocationData4.substring(1, LocationData4.length - 1);
                        LocationData5 = LocationData5.substring(1, LocationData5.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3 + ',' + LocationData4 + ',' + LocationData5;
                    }    
                    else {  // 6 or more jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length - 1);
                        LocationData4 = LocationData4.substring(1, LocationData4.length - 1);
                        LocationData5 = LocationData5.substring(1, LocationData5.length - 1);
                        LocationData6 = LocationData6.substring(1, LocationData6.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3 + ',' + LocationData4 + ',' + LocationData5 + ',' + LocationData6;
                    }
                    LocationData = JSON.parse(LocationDataConcat6);
                    globalFilteredAll = LocationData;

                    var StoreDataConcat3;

                    if (StoreData2 == '[]') {  // if only 1 job
                        StoreDataConcat3 = StoreData1;
                    }
                    else if (StoreData3 == '[]') {  // if only 2 jobs
                        StoreData1 = StoreData1.substring(0, StoreData1.length - 1);
                        StoreData2 = StoreData2.substring(1, StoreData2.length);
                        StoreDataConcat3 = StoreData1 + ',' + StoreData2;
                    }
                    else {  // 3 or more jobs
                        StoreData1 = StoreData1.substring(0, StoreData1.length - 1);
                        StoreData2 = StoreData2.substring(1, StoreData2.length - 1);
                        StoreData3 = StoreData3.substring(1, StoreData3.length);
                        StoreDataConcat3 = StoreData1 + ',' + StoreData2 + ',' + StoreData3;
                    }
                    StoreData = JSON.parse(StoreDataConcat3);

                    GET_MAP_THEME_DATA(LocationData, StoreData);

                }

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_CMA_Summary_Info",  //use a function from C# , change this for different data return
                //    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                //    dataType: "json",
                //    contentType: "application/json; charset=utf-8",
                //    success: function (data) {
                //        CMA_SUMMARY_DATA(data);
                //    },
                //    error: function (data) {
                //    }
                //});

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_NationalTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({
                        'groupVariable': groupGeo, 'overallCatVariable': '%', 'campaignVariable': '%', 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable,
                        'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                        'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        globalFilteredTop50 = data;
                        NationalTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });

                console.log('UpdateHomeTable function end');

            }

            function ShowClassificationMethodology(source, eventArgs) {
                var clickButton = document.getElementById("<%= ClassificationMethodology.ClientID %>");
                clickButton.click();

                //var delayInMilliseconds = 1000; //500 ms

                //setTimeout(function () {
                //    groupByFilter();
                //}, delayInMilliseconds);

            }

            function updateSalesOpportunityChartNational() {
                console.log('updateSalesOpportunityChartNational function start');

                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                console.log('Get_Store_Detail groupGeo: ' + groupGeo);                
                var FilterByVariable = 'NOFILTER';

                var CampaignVariable = $('#<%= ddlCampaign.ClientID %> option:selected').val();
                var CoverageScoreVariable = $('#<%= ddlCoverageScore.ClientID %> option:selected').val();
                var FiveGVariable = $('#<%= ddl5G.ClientID %> option:selected').val();
                var TPUT_TEXTVariable = $('#<%= ddlTPUT_TEXT.ClientID %> option:selected').val();
                <%--var CompetitorVariable = $('#<%= ddlCompetitor.ClientID %> option:selected').val();--%>
                var CompetitorVariable = '%';
                var ROAMVariable = $('#<%= ddlROAM.ClientID %> option:selected').val();
                var B14Variable = $('#<%= ddlB14.ClientID %> option:selected').val();
                var FiberCustVariable = $('#<%= ddlFiberCust.ClientID %> option:selected').val();
                var SortVariable = $('#<%= ddlSort_1.ClientID %> option:selected').val();

                console.log('UpdateHomeTable function start');
                console.log('CampaignVariable: ' + CampaignVariable);
                console.log('CoverageScoreVariable: ' + CoverageScoreVariable);
                console.log('FiveGVariable: ' + FiveGVariable);
                console.log('TPUT_TEXTVariable: ' + TPUT_TEXTVariable);
                console.log('CompetitorVariable: ' + CompetitorVariable);
                console.log('ROAMVariable: ' + ROAMVariable);
                console.log('FiberCustVariable: ' + FiberCustVariable);
                console.log('SortVariable: ' + SortVariable);

                $.when(
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National1",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData1 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData2 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National3",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData3 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National4",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData4 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National5",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData5 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Location_Detail_National6",  //use a function from C# , change this for different data return
                        data: JSON.stringify({
                            'groupVariable': groupGeo, 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                            'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable
                        }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            LocationData6 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_National1",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'StateVariable': StateVariable, 'ZipVariable': ZipVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            StoreData1 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_National2",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'StateVariable': StateVariable, 'ZipVariable': ZipVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            StoreData2 = data.d;
                        },
                        error: function (data) {
                        }
                    }),
                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_Store_Detail_National3",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'StateVariable': StateVariable, 'ZipVariable': ZipVariable }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            StoreData3 = data.d;
                        },
                        error: function (data) {
                        }
                    })
                ).then(function () {
                    dataConcat_6strings(LocationData1, LocationData2, LocationData3, StoreData1, StoreData2, StoreData3);
                });

                function dataConcat_6strings(LocationData1, LocationData2, LocationData3, LocationData4, LocationData5, LocationData6, StoreData1, StoreData2, StoreData3) {
                    var LocationDataConcat6;

                    if (LocationData2 == '[]') {  // if only 1 job
                        LocationDataConcat6 = LocationData1;
                    }
                    else if (LocationData3 == '[]') {  // if only 2 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2;
                    }
                    else if (LocationData4 == '[]') {  // if only 3 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3;
                    }
                    else if (LocationData5 == '[]') {  // if only 4 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length - 1);
                        LocationData4 = LocationData4.substring(1, LocationData4.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3 + ',' + LocationData4;
                    }
                    else if (LocationData6 == '[]') {  // if only 5 jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length - 1);
                        LocationData4 = LocationData4.substring(1, LocationData4.length - 1);
                        LocationData5 = LocationData5.substring(1, LocationData5.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3 + ',' + LocationData4 + ',' + LocationData5;
                    }
                    else {  // 6 or more jobs
                        LocationData1 = LocationData1.substring(0, LocationData1.length - 1);
                        LocationData2 = LocationData2.substring(1, LocationData2.length - 1);
                        LocationData3 = LocationData3.substring(1, LocationData3.length - 1);
                        LocationData4 = LocationData4.substring(1, LocationData4.length - 1);
                        LocationData5 = LocationData5.substring(1, LocationData5.length - 1);
                        LocationData6 = LocationData6.substring(1, LocationData6.length);
                        LocationDataConcat6 = LocationData1 + ',' + LocationData2 + ',' + LocationData3 + ',' + LocationData4 + ',' + LocationData5 + ',' + LocationData6;
                    }
                    LocationData = JSON.parse(LocationDataConcat6);
                    globalFilteredAll = LocationData;

                    var StoreDataConcat3;

                    if (StoreData2 == '[]') {  // if only 1 job
                        StoreDataConcat3 = StoreData1;
                    }
                    else if (StoreData3 == '[]') {  // if only 2 jobs
                        StoreData1 = StoreData1.substring(0, StoreData1.length - 1);
                        StoreData2 = StoreData2.substring(1, StoreData2.length);
                        StoreDataConcat3 = StoreData1 + ',' + StoreData2;
                    }
                    else {  // 3 or more jobs
                        StoreData1 = StoreData1.substring(0, StoreData1.length - 1);
                        StoreData2 = StoreData2.substring(1, StoreData2.length - 1);
                        StoreData3 = StoreData3.substring(1, StoreData3.length);
                        StoreDataConcat3 = StoreData1 + ',' + StoreData2 + ',' + StoreData3;
                    }
                    StoreData = JSON.parse(StoreDataConcat3);

                    GET_MAP_THEME_DATA(LocationData, StoreData);

                }

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_CMA_Summary_Info",  //use a function from C# , change this for different data return
                //    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                //    dataType: "json",
                //    contentType: "application/json; charset=utf-8",
                //    success: function (data) {
                //        CMA_SUMMARY_DATA(data);
                //    },
                //    error: function (data) {
                //    }
                //});

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_NationalTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({
                        'groupVariable': groupGeo, 'overallCatVariable': '%', 'campaignVariable': '%', 'CampaignVariable': CampaignVariable, 'StateVariable': StateVariable, 'ZipVariable': ZipVariable,
                        'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                        'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable, 'SortVariable': SortVariable }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        globalFilteredTop50 = data;
                        NationalTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });

                console.log('updateSalesOpportunityChartNational function end');

            }

            function GET_MAP_THEME_DATA(locationData, storeData) {
                console.log('GET_MAP_THEME_DATA function start');
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = '%';
                var countyGeo;

                console.log('marketGeo: ' + marketGeo);
                console.log('countyGeo: ' + countyGeo);

                if (groupGeo == 'SALES') {
                    if (marketGeo == '%') {

                        $.when(

                            //$.ajax({
                            //    type: "POST",
                            //    async: true,
                            //    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
                            //    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                            //    dataType: "json",
                            //    contentType: "application/json; charset=utf-8",
                            //    success: function (data) {
                            //        Data1 = data.d;
                            //        theme_data = JSON.parse(Data1);
                            //    },
                            //    error: function (data) {
                            //    }
                            //}),

                            //$.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                            //    VpgmData3 = data;
                            //}),

                            $.getJSON("SalesGeo/VPGM_Regions_geojson_042720_FME.json", function (data) {
                                MarketBoundaryData = data;
                            }),

                        ).then(function () {

                            //VpgmData3.features.forEach(function (element) {
                            //    theme_data.find(function (newElement) {
                            //        if (element.properties.cma == newElement.CMA) {
                            //            element.properties.CMATOTALAREA = newElement.CMATOTALAREA;
                            //            element.properties.CMATOTALPOPS = newElement.CMATOTALPOPS;
                            //            element.properties.CMAPOP_DENSITY = newElement.CMAPOP_DENSITY;
                            //            element.properties.WIRELESS_SCORE = newElement.WIRELESS_SCORE;
                            //            element.properties.FIBER_AVAILABLE = newElement.FIBER_AVAILABLE;
                            //            element.properties.FIBER_CUSTOMERS = newElement.FIBER_CUSTOMERS;
                            //            element.properties.OVERALL_CAT = newElement.OVERALL_CAT;
                            //            element.properties.WIRELESS_CATEGORY = newElement.WIRELESS_CATEGORY;
                            //            element.properties.FIBER_AVAILABILITY = newElement.FIBER_AVAILABILITY;
                            //            element.properties.FIBER_OPPORTUNITY = newElement.FIBER_OPPORTUNITY;
                            //            element.properties.ATTR_STORE_COUNT = newElement.ATTR_STORE_COUNT;
                            //            element.properties.AR_STORE_COUNT = newElement.AR_STORE_COUNT;
                            //            element.properties.ALL_STORE_COUNT = newElement.ALL_STORE_COUNT;

                            //        }
                            //    });
                            //});

                            storeMapV3_National(locationData, storeData, MarketBoundaryData);
                        });

                    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {

                        countyGeo = marketGeo;

                        $.when(

                            $.ajax({
                                type: "POST",
                                async: true,
                                url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_county_theme_data",  //use a function from C# , change this for different data return
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

                            $.getJSON("SalesVpgmCounties/" + countyGeo + "_COUNTY_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                                VpgmData2 = data;
                            }),

                            $.getJSON("SalesGeo/VPGM_Regions_geojson_042720_FME.json", function (data) {
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

                                    }
                                });
                            });

                            storeMapV3_Region(storeData, VpgmData2, MarketBoundaryData);
                        });

                    } else {

                        if (marketGeo == 'GEORGIA / SOUTH CAROLINA') {
                            marketGeo = 'GEORGIA SOUTH CAROLINA'
                        } if (marketGeo == 'PR/VI') {
                            marketGeo = 'PR VI'
                        } if (marketGeo == 'NEW YORK / NEW JERSEY') {
                            marketGeo = 'NEW YORK NEW JERSEY'
                        } if (marketGeo == 'OHIO/PENNSYLVANIA') {
                            marketGeo = 'OHIOPENNSYLVANIA'
                        }
                        else { marketGeo = marketGeo }

                        var marketGeo2 = '%';                        

                        if (marketGeo == 'FLORIDA' | marketGeo == 'GEORGIA SOUTH CAROLINA' | marketGeo == 'GREATER LAKES' | marketGeo == 'GULF STATES' | marketGeo == 'HEARTLAND STATES' | marketGeo == 'KAMO' |
                            marketGeo == 'MID-ATLANTIC' | marketGeo == 'NORTHERN CALIFORNIA' | marketGeo == 'NTX' | marketGeo == 'OHIOPENNSYLVANIA' | marketGeo == 'SOUTHERN CALIFORNIA' | marketGeo == 'STX') {                           

                            document.getElementById('mapcountwarning').innerHTML = "";
                            <%--document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity - " + $('#<%= ddlMarket.ClientID %> option:selected').text();--%>
                            document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?"; 

                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
                                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2 }),
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

                                $.getJSON("PSALocations071320/" + marketGeo + "_PSA_GEOJSON_071320.json", function (data) {
                                    PSAData = data;
                                }),

                                //$.getJSON("PSALocations/" + marketGeo + "_PSA_GEOJSON.json", function (data) {
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
                                            element.properties.ZIPTOTALPOPS = newElement.ZIPTOTALPOPS;
                                            element.properties.ZIPPOP_DENSITY = newElement.ZIPPOP_DENSITY;
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

                        } else {

                            document.getElementById('mapcountwarning').innerHTML = "No fiber found in this market - No current fiber sales opportunities exist.";
                            <%--document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text();--%>
                            document.getElementById('mapcountsubtitle').innerHTML = "";

                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
                                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2 }),
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
                                            element.properties.ZIPTOTALPOPS = newElement.ZIPTOTALPOPS;
                                            element.properties.ZIPPOP_DENSITY = newElement.ZIPPOP_DENSITY;
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


            function NationalTableUpdate() {
                console.log('NationalTableUpdate');
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                };
                
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                
                var CMACatFilter = '%'
                if (CMALayerState == 0) { CMACatFilter = '%'; }
                else if (CMALayerState == 1) { CMACatFilter = 'WeakWirelessNoFiber'; }
                else if (CMALayerState == 2) { CMACatFilter = 'WeakWirelessFiberAvailable'; }
                else if (CMALayerState == 3) { CMACatFilter = 'StrongWirelessNoFiber'; }
                else if (CMALayerState == 4) { CMACatFilter = 'StrongWirelessFiberAvailable'; }

                //CAMPAIGN1storePoints, CAMPAIGN2storePoints, CAMPAIGN3storePoints, SAMSCLUBstorePoints, COSTCOstorePoints, SMARTCIRCLEstorePoints, MICROSOFTstorePoints, OTHERSstorePoints

                var SelectedSortNational = "%";
                if (SelectedSortNational == "%") {
                    map.addLayer(CAMPAIGN1storePoints);
                    map.addLayer(CAMPAIGN2storePoints);
                    map.addLayer(CAMPAIGN3storePoints);                    
                } else if (SelectedSortNational == "CAMPAIGN1") {
                    map.addLayer(CAMPAIGN1storePoints);
                    map.removeLayer(CAMPAIGN2storePoints);
                    map.removeLayer(CAMPAIGN3storePoints);
                } else if (SelectedSortNational == "CAMPAIGN2") {
                    map.removeLayer(CAMPAIGN1storePoints);
                    map.addLayer(CAMPAIGN2storePoints);
                    map.removeLayer(CAMPAIGN3storePoints);
                } else if (SelectedSortNational == "CAMPAIGN3") {
                    map.removeLayer(CAMPAIGN1storePoints);
                    map.removeLayer(CAMPAIGN2storePoints);
                    map.addLayer(CAMPAIGN3storePoints);
                }                              


                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_National_Wireless_Campaign_TestingV2.aspx/Get_NationalTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({
                        'groupVariable': groupGeo, 'overallCatVariable': CMACatFilter,
                        'CampaignVariable': CampaignVariable, 'CoverageScoreVariable': CoverageScoreVariable, 'FiveGVariable': FiveGVariable,
                        'TPUT_TEXTVariable': TPUT_TEXTVariable, 'CompetitorVariable': CompetitorVariable, 'ROAMVariable': ROAMVariable, 'B14Variable': B14Variable, 'FiberCustVariable': FiberCustVariable }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        globalFilteredTop50 = data;
                        NationalTable(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                });
            }

            function NationalTable(data) {
                $('#national_datatable').dataTable().fnDestroy(); //destroy old table

                var table = $('#national_datatable');
                console.log('KTDataTables begin National Table');                

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
                        text: 'Show Location Info for Filtered All',
                        className: 'btn btn-primary', 
                        titleAttr: 'Show Location Info for All Filtered Locations - *WARNING - unfiltered large datasets will take significant time to render',
                        action: function (e, dt, node, config) {
                            ExportAll_Filtered();
                        }
                    },
                    {
                        text: 'Show Location Info for Filtered Top 50',
                        className: 'btn btn-primary',
                        titleAttr: 'Show Location Info for Top 50 Locations',
                        action: function (e, dt, node, config) {
                            ExportTop50_Filtered();
                        }
                    }],
                    columnDefs: [{ width: 50, targets: [0, 2, 9, 12] }, { visible: false, searchable: false, targets: [13, 14, 15, 16, 20, 21, 22] }, { className: "dt-center", targets: [0, 2, 6, 7, 8, 9, 12] }],
                    columns: [
                        { 'data': 'ROWNUM' },
                        { 'data': 'CAMPAIGN_ID' },
                        { 'data': 'COVERAGE_SCORE' },
                        { 'data': 'FIVEG' },
                        { 'data': 'FIVEG_PLUS' },
                        { 'data': 'TPUT_TEXT' },
                        { 'data': 'ROAM_TEXT' },
                        { 'data': 'FIRST_NET' },
                        { 'data': 'BAND_14' },
                        { 'data': 'FIBER_CUST' },
                        { 'data': 'PRIMARY_COMPETITOR_NAME' },
                        { 'data': 'CONTACT_COMPANY_NM' },
                        { 'data': 'NUMBER_OF_EMPLOYEES' },
                        { 'data': 'CONTACT_FIRST_NM' },
                        { 'data': 'CONTACT_LAST_NM' },
                        { 'data': 'CONTACT_PHONE1' },
                        { 'data': 'CONTACT_EMAIL' },
                        { 'data': 'CITY_NM' },
                        { 'data': 'STATE_Y' },
                        { 'data': 'POSTL_CD' },
                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'LOCATION_ID' }
                        //,
                        //{ 'data': 'OVERALL_RANK' }
                    ],


                    "fnDrawCallback": function () {
                        $('#national_datatable tr').find('td').each(function () {
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

                $('#national_datatable tbody').on('click', 'tr', function () {
                    map.closePopup();

                    var row_clicked = $(this).closest('tr');
                    var latitudeClicked = $('#national_datatable').DataTable().row(row_clicked).data()['LATITUDE'];
                    var longitudeClicked = $('#national_datatable').DataTable().row(row_clicked).data()['LONGITUDE'];
                    console.log("latitudeClicked: " + latitudeClicked);
                    console.log("longitudeClicked: " + longitudeClicked);

                    //var data = $('#zipCodeModal_datatable').DataTable().row(this).data();
                    var loc = [latitudeClicked, longitudeClicked];
                    markerOptions = {
                        iconShape: 'doughnut',
                        iconSize: [30, 30],
                        borderWidth: 15,
                        borderColor: '#ff0000'
                    };

                    if (NationalLayerGroup) {
                        NationalLayerGroup.removeFrom(map);
                    }

                    NationalLayerGroup = L.layerGroup();
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(markerOptions) });
                    NationalLayerGroup.addLayer(marker);
                    NationalLayerGroup.addTo(map);

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

                    map.fitBounds(bounds, { padding: [.05, .05] });

                    setTimeout(function () {
                        NationalLayerGroup.removeFrom(map);
                    }, 2000);

                });

                $(window).resize();

                console.log('KTDataTables end');

            };

            function ExportAll_Filtered() {
                
                var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");
                clickButton.click();

                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();

                showDataAll(globalFilteredAll);
                
            }

            function ExportTop50_Filtered() {
                var clickButton = document.getElementById("<%= btnshowDataModal.ClientID %>");
                clickButton.click();

                $('#showDataModalTableDiv').hide();
                $('#LOADING_showData_Modal').show();

                showDataAll(globalFilteredTop50);
            }

            function showDataAll(data) {
                console.log('showDataModal_MDUtable');
                $('#showDataModal_table').dataTable().fnDestroy(); //destroy old table

                $('#LOADING_showData_Modal').hide();
                $('#showDataModalTableDiv').show();

                //var table = $('#showDataModal_table');                

                var orderColumn;
                var SortVariable = $('#<%= ddlSort_1.ClientID %> option:selected').val();
                if (SortVariable == "COVERAGE_SCORE") { orderColumn = 1; }
                else if (SortVariable == "FIVEG") { orderColumn = 2; }
                else if (SortVariable == "TPUT_TEXT") { orderColumn = 4; }
                else if (SortVariable == "ROAM_TEXT") { orderColumn = 5; }
                else if (SortVariable == "BAND_14") { orderColumn = 7; }
                else if (SortVariable == "FIBER_CUST") { orderColumn = 8; }
                else if (SortVariable == "PRIMARY_COMPETITOR_NAME") { orderColumn = 9; }
                else if (SortVariable == "FIVEG_PLUS") { orderColumn = 3; }
                else if (SortVariable == "FIRST_NET") { orderColumn = 6; }
                else if (SortVariable == "NUMBER_OF_EMPLOYEES") { orderColumn = 11; }                
                
                // begin first table
                var table = $('#showDataModal_table').DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '500px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    sort: true,
                    order: ([[orderColumn, 'desc'],[22, 'asc']] ),
                    dom: 'rtlifp',
                    //buttons: [{}],
                    columnDefs: [{ width: 50, targets: [ 1, 8, 11] }, { className: "dt-center", targets: [1, 5, 6, 7, 8, 11, 22] }],
                    columns: [                        
                        { 'data': 'CAMPAIGN_ID' },
                        { 'data': 'COVERAGE_SCORE' },
                        { 'data': 'FIVEG' },
                        { 'data': 'FIVEG_PLUS' },
                        { 'data': 'TPUT_TEXT' },
                        { 'data': 'ROAM_TEXT' },
                        { 'data': 'FIRST_NET' },
                        { 'data': 'BAND_14' },
                        { 'data': 'FIBER_CUST' },
                        { 'data': 'PRIMARY_COMPETITOR_NAME' },
                        { 'data': 'CONTACT_COMPANY_NM' },
                        { 'data': 'NUMBER_OF_EMPLOYEES' },
                        { 'data': 'CONTACT_FIRST_NM' },
                        { 'data': 'CONTACT_LAST_NM' },
                        { 'data': 'CONTACT_PHONE1' },
                        { 'data': 'CONTACT_EMAIL' },
                        { 'data': 'CITY_NM' },
                        { 'data': 'STATE_Y' },
                        { 'data': 'POSTL_CD' },
                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'LOCATION_ID' },
                        { 'data': 'COVERAGE_SCORE_RANK' }
                        //,
                        //{ 'data': 'OVERALL_RANK' }
                    ],


                    "fnDrawCallback": function () {
                        $('#showDataModal_table tr').find('td').each(function () {
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

                //$(".container").css("display", "block");
                //table.columns.adjust();

                var delayInMilliseconds = 1000; //500 ms

                setTimeout(function () {
                    adjustHeader();
                }, delayInMilliseconds);

                function adjustHeader() {
                    console.log("adjustHeader");
                    $(".container").css("display", "block");
                    table.columns.adjust();
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
            

            var storeMapV3_National = function (locationData, storeData, MarketBoundaryData) {
                console.log(locationData);

                $('#buttonrowcma').show();
                $('#MapDiv').show();
                $('#NationalTableDiv').show();
                $('#zipfooter').hide();
                $('#zipfooter2').show();
                $('#LOADING1').hide();

                $(window).resize();

                var CampaignVariable = $('#<%= ddlCampaign.ClientID %> option:selected').val();

                var ATTR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("ATTR");
                });
                var AR = storeData.filter(function (el) {
                    return el.STORE_CATEGORY.includes("AR");
                });
                var CAMPAIGN1 = locationData.filter(function (el) {
                    return el.CAMPAIGN_ID.includes(CampaignVariable);
                });
                //var CAMPAIGN2 = locationData.filter(function (el) {
                //    return el.CAMPAIGN_ID.includes("CAMPAIGN2");
                //});
                //var CAMPAIGN3 = locationData.filter(function (el) {
                //    return el.CAMPAIGN_ID.includes("CAMPAIGN3");
                //});


                mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 13, spiderfyOnMaxZoom: false }),
                    ATTRstorePoints = L.featureGroup.subGroup(mcg),
                    ARstorePoints = L.featureGroup.subGroup(mcg),
                    CAMPAIGN1storePoints = L.featureGroup.subGroup(mcg),// use `L.featureGroup.subGroup(parentGroup)` instead of `L.featureGroup()` or `L.layerGroup()`!
                    CAMPAIGN2storePoints = L.featureGroup.subGroup(mcg),
                    CAMPAIGN3storePoints = L.featureGroup.subGroup(mcg);

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
                    marker.bindPopup(popup, { maxWidth: 500 });
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
                    marker.bindPopup(popup, { maxWidth: 500 });
                    //ARstorePoints.addLayer(marker);
                    marker.addTo(ARstorePoints);
                }

                for (i in CAMPAIGN1) {
                    var popup =
                        '<b>Company Name:</b> ' + CAMPAIGN1[i].CONTACT_COMPANY_NM +
                        '<br/><b>Location ID:</b> ' + CAMPAIGN1[i].LOCATION_ID +
                        '<br/><b>Contact Name:</b> ' + CAMPAIGN1[i].CONTACT_FIRST_NM + ' ' + CAMPAIGN1[i].CONTACT_LAST_NM +
                        '<br/><b>Contact Phone:</b> ' + CAMPAIGN1[i].CONTACT_PHONE1 +
                        '<br/><b>Contact email:</b> ' + CAMPAIGN1[i].CONTACT_EMAIL +
                        '<br/><b>Address:</b> ' + CAMPAIGN1[i].ADDR_LINE1 +
                        '<br/><b>City, State Zip:</b> ' + CAMPAIGN1[i].CITY_NM + ', ' + CAMPAIGN1[i].STATE_Y + ' ' + CAMPAIGN1[i].POSTL_CD +
                        '<br/><b>Number of Employees:</b> ' + CAMPAIGN1[i].NUMBER_OF_EMPLOYEES +
                        '<br/><b>Wireless Coverage Score:</b> ' + CAMPAIGN1[i].COVERAGE_SCORE +
                        '<br/><b>5G:</b> ' + CAMPAIGN1[i].FIVEG + ' - <b>5G+:</b> ' + CAMPAIGN1[i].FIVEG_PLUS +
                        '<br/><b>Speed and Available Capacity:</b> ' + CAMPAIGN1[i].TPUT_TEXT +
                        '<br/><b>Roaming:</b> ' + CAMPAIGN1[i].ROAM_TEXT + ' - <b>FNET:</b> ' + CAMPAIGN1[i].FIRST_NET + ' - <b>FNET Band 14:</b> ' + CAMPAIGN1[i].BAND_14 +
                        '<br/><b>Legacay Device Penetration:</b> ' + CAMPAIGN1[i].FIBER_CUST +                        
                        '<br/><b>Primary Competitor:</b> ' + CAMPAIGN1[i].PRIMARY_COMPETITOR_NAME; 
                        //'<br/><b>Nearest Store (ATTR/AR):</b> ' + '(0.0 miles/0.0 miles)';
                        //+ '<br/><b>Rank:</b> ' + CAMPAIGN1[i].OVERALL_RANK;

                    var loc = [CAMPAIGN1[i].LATITUDE, CAMPAIGN1[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = CAMPAIGN1[i].COVERAGE_SCORE;
                    var employeecount = CAMPAIGN1[i].NUMBER_OF_EMPLOYEES;

                    if (wirelessscore == '5')
                        customColor = '#003300';
                    if (wirelessscore == '4')
                        customColor = '#008000';
                    if (wirelessscore == '3')
                        customColor = '#00cc00';
                    if (wirelessscore == '2')
                        customColor = '#ffff00';
                    else if (wirelessscore == '1')
                        customColor = '#e6b800';

                    //customBorderColor = '#ffffff';
                    //if (employeecount >= 25)
                    //    customBorderColor = '#000000';
                    //else if (employeecount > 5 && employeecount < 25)
                    //    customBorderColor = '#808080';
                    //else if (employeecount <= 5)
                    //    customBorderColor = '#ffffff';
                    customBorderColor = '#0000ff';

                    var CAMPAIGN1storeTableoptions = {
                            //icon: 'store',
                            iconShape: 'rectangle-dot',
                            iconSize: [18, 18],
                            backgroundColor: customColor,
                            borderWidth: 3,
                            //borderColor: '#0000ff'
                            borderColor: customBorderColor
                        };
                    
                    markerOptions = { icon: L.BeautifyIcon.icon(CAMPAIGN1storeTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup, { maxWidth: 500 });
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(CAMPAIGN1storePoints);
                }

                //for (i in CAMPAIGN2) {
                //    var popup =
                //        '<b>Company Name:</b> ' + CAMPAIGN2[i].CONTACT_COMPANY_NM +
                //        '<br/><b>Location ID:</b> ' + CAMPAIGN2[i].LOCATION_ID +
                //        '<br/><b>Contact Name:</b> ' + CAMPAIGN2[i].CONTACT_FIRST_NM + ' ' + CAMPAIGN2[i].CONTACT_LAST_NM +
                //        '<br/><b>Contact email:</b> ' + CAMPAIGN2[i].CONTACT_EMAIL +
                //        '<br/><b>Address:</b> ' + CAMPAIGN2[i].ADDR_LINE1 +
                //        '<br/><b>City, State Zip:</b> ' + CAMPAIGN2[i].CITY_NM + ', ' + CAMPAIGN2[i].STATE + ' ' + CAMPAIGN2[i].POSTL_CD +
                //        '<br/><b>Wireless Coverage Score:</b> ' + CAMPAIGN2[i].COVERAGE_SCORE +
                //        '<br/><b>Legacay Device Penetration:</b> ' + CAMPAIGN2[i].FIBER_CUST;
                //    //+ '<br/><b>Rank:</b> ' + CAMPAIGN1[i].OVERALL_RANK;

                //    var loc = [CAMPAIGN2[i].LATITUDE, CAMPAIGN2[i].LONGITUDE];	//position found

                //    var customColor = '#ffffff';
                //    var wirelessscore = CAMPAIGN2[i].WIRELESS_SCORE;                    

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

                //    var CAMPAIGN2storeTableoptions = {
                //        iconShape: 'rectangle-dot',
                //        iconSize: [18, 18],
                //        backgroundColor: customColor,
                //        borderWidth: 3,
                //        borderColor: '#ff0000'
                //    };
                                        
                //    markerOptions = { icon: L.BeautifyIcon.icon(CAMPAIGN2storeTableoptions) };
                //    marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.95);
                //    marker.bindPopup(popup);
                //    //ARstorePoints.addLayer(marker);
                //    marker.addTo(CAMPAIGN2storePoints);
                //}

                //for (i in CAMPAIGN3) {
                //    var popup =
                //        '<b>Company Name:</b> ' + CAMPAIGN3[i].CONTACT_COMPANY_NM +
                //        '<br/><b>Location ID:</b> ' + CAMPAIGN3[i].LOCATION_ID +
                //        '<br/><b>Contact Name:</b> ' + CAMPAIGN3[i].CONTACT_FIRST_NM + ' ' + CAMPAIGN3[i].CONTACT_LAST_NM +
                //        '<br/><b>Contact email:</b> ' + CAMPAIGN3[i].CONTACT_EMAIL +
                //        '<br/><b>Address:</b> ' + CAMPAIGN3[i].ADDR_LINE1 +
                //        '<br/><b>City, State Zip:</b> ' + CAMPAIGN3[i].CITY_NM + ', ' + CAMPAIGN3[i].STATE + ' ' + CAMPAIGN3[i].POSTL_CD +
                //        '<br/><b>Wireless Coverage Score:</b> ' + CAMPAIGN3[i].COVERAGE_SCORE +
                //        '<br/><b>Legacay Device Penetration:</b> ' + CAMPAIGN3[i].FIBER_CUST;
                //    //+ '<br/><b>Rank:</b> ' + CAMPAIGN1[i].OVERALL_RANK;

                //    var loc = [CAMPAIGN1[i].LATITUDE, CAMPAIGN1[i].LONGITUDE];	//position found

                //    var customColor = '#ffffff';
                //    var wirelessscore = CAMPAIGN3[i].WIRELESS_SCORE;

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

                //    var CAMPAIGN3storeTableoptions = {
                //        //icon: 'store',
                //        iconShape: 'rectangle-dot',
                //        iconSize: [18, 18],
                //        backgroundColor: customColor,
                //        borderWidth: 3,
                //        borderColor: '#87cefa'
                //    };

                //    markerOptions = { icon: L.BeautifyIcon.icon(CAMPAIGN3storeTableoptions) };
                //    marker = new L.Marker(new L.latLng(loc), markerOptions);
                //    marker.setOpacity(.95);
                //    marker.bindPopup(popup);
                //    //ATTRstorePoints.addLayer(marker);
                //    marker.addTo(CAMPAIGN3storePoints);
                //}                

                //console.log(VpgmData3);

                document.getElementById('mapcountwarning').innerHTML = "";
                document.getElementById('mapcounttitle').innerHTML = "National Wireless Campaign - Wireless Scoring";
                document.getElementById('mapcountsubtitle').innerHTML = "";
                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 500px;'></div>";

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
                    center: currentCenter,
                    zoom: currentZoom,
                    minZoom: 3,
                    layers: [streets, CAMPAIGN1storePoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                mcg.addTo(map);

                map.on('zoomend', function () {
                    currentZoom = map.getZoom();
                    currentBounds = map.getBounds();
                    currentCenter = map.getCenter();
                    console.log('current zoom level: ' + currentZoom);
                    console.log('current bounds: ' + currentBounds);
                    console.log('current center: ' + currentCenter);
                    var iconSize = [currentZoom * (8 / 2), currentZoom * (8 / 2)];
                    //var myRadius = currentZoom * (1 / 2); //or whatever ratio you prefer
                    //var myWeight = currentZoom * (1 / 5); //or whatever ratio you prefer
                    mcg.setStyle({ iconSize: iconSize });
                });

                map.on('dragend', function () {
                    currentCenter = map.getCenter();
                });

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

                //map.fitBounds(mcg.getBounds());

                //var MarketBoundaryLayer = L.geoJSON(MarketBoundaryData, {
                //    style: styleBoundary,
                //    zIndex: 5,
                //    onEachFeature: onEachFeatureBoundary
                //}).addTo(map);

                //L.control.touchHover().addTo(map);

                //if (L.Browser.touch) {
                //    L.control.touchHover().addTo(map);
                //}

                //info = L.control({ position: 'bottomleft' });

                //info.onAdd = function (map) {
                //    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                //    this.update();
                //    return this._div;
                //};

                //// method that we will use to update the control based on feature properties passed
                //info.update = function (props) {
                //    //console.log(props);

                //    var CMATOTALPOPSCOMMA = "";
                //    var FIBER_AVAILABLECOMMA = "";
                //    var FIBER_CUSTOMERSCOMMA = "";
                //    var FIBER_OPPORTUNITYCOMMA = "";

                //    if (props) {
                //        CMATOTALPOPSCOMMA = Number(props.CMATOTALPOPS).toLocaleString('en');
                //        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                //        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                //        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                //    }

                //    this._div.innerHTML = '<h4>CMA Information</h4>' + (props ?
                //        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                //        '<b>CMA: ' + props.cma + '<br />' + 'CMA Name: ' + props.Name + '</b><br />' + 'CMA Population: ' + CMATOTALPOPSCOMMA +
                //        '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                //        '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                //        '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT
                //        : 'Hover over a CMA');

                //    var cssinfo = "info";

                //    if (props) {
                //        if (props.OVERALL_CAT == 'WeakWirelessNoFiber') {
                //            cssinfo = "info1";
                //        } else if (props.OVERALL_CAT == 'WeakWirelessFiberAvailable') {
                //            cssinfo = "info2";
                //        } else if (props.OVERALL_CAT == 'StrongWirelessNoFiber') {
                //            cssinfo = "info3";
                //        } else if (props.OVERALL_CAT == 'StrongWirelessFiberAvailable') {
                //            cssinfo = "info4";
                //        } else {
                //            cssinfo = "info";
                //        };

                //        this._div.classList.remove("info");
                //        this._div.classList.remove("info1");
                //        this._div.classList.remove("info2");
                //        this._div.classList.remove("info3");
                //        this._div.classList.remove("info4");
                //        this._div.classList.add(cssinfo);
                //    } else {
                //        this._div.classList.remove("info");
                //        this._div.classList.remove("info1");
                //        this._div.classList.remove("info2");
                //        this._div.classList.remove("info3");
                //        this._div.classList.remove("info4");
                //        this._div.classList.add(cssinfo);
                //    }                        
                //};

                //info.addTo(map);

                //var highlight;
                //var highlight0;
                //var highlight1;
                //var highlight2;
                //var highlight3;
                //var highlight4;
                //var zoom0;
                //var clearHighlight = function () {
                //    if (highlight) {
                //        vectorGridCMA.resetFeatureStyle(highlight);
                //        info.update();
                //    }
                //    highlight = null;
                //};                

                ////function getGeometry(VpgmData3, idProperty) {                                        

                ////    VpgmLayerTest = L.geoJSON(VpgmData3, { filter: CMAFilter });
                ////    function CMAFilter(feature) {
                ////        if (feature.properties.CMA == idProperty) return true
                ////    }
                ////    map.fitBounds(VpgmLayerTest.getBounds());                    

                ////};  

                //vectorGridCMA0 = L.vectorGrid.slicer(VpgmData3, {
                //    rendererFactory: L.canvas.tile,
                //    zIndex: 3,
                //    vectorTileLayerStyles: {
                //        sliced: function (properties, zoom) {
                //            var p = properties.OVERALL_CAT;
                //            return {
                //                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                //                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                //                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                //                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                //                                '#ffffff',
                //                fillOpacity: 0.5,
                //                //fillOpacity: 1,
                //                stroke: true,
                //                fill: true,
                //                color: 'black',
                //                opacity: 0.8,
                //                weight: .5,
                //            }
                //        }
                //    },
                //    interactive: false,
                //    getFeatureId: function (f) {
                //        return f.properties.cma;
                //    },

                //})

                //    .addTo(map);

                //vectorGridCMA1 = L.vectorGrid.slicer(VpgmData3, {
                //    rendererFactory: L.canvas.tile,
                //    zIndex: 3,
                //    vectorTileLayerStyles: {
                //        sliced: function (properties, zoom) {
                //            var p = properties.OVERALL_CAT;
                //            return {
                //                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                //                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                //                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                //                            p == 'WeakWirelessNoFiber' ? '#ff9933' :
                //                                '#ffffff',
                //                fillOpacity: 0.5,
                //                //fillOpacity: 1,
                //                stroke: true,
                //                fill: true,
                //                color: 'black',
                //                opacity: 0.8,
                //                weight: .5,
                //            }
                //        }
                //    },
                //    interactive: false,
                //    getFeatureId: function (f) {
                //        return f.properties.cma;
                //    }
                //})

                //    .addTo(map);

                //vectorGridCMA2 = L.vectorGrid.slicer(VpgmData3, {
                //    rendererFactory: L.canvas.tile,
                //    zIndex: 3,
                //    vectorTileLayerStyles: {
                //        sliced: function (properties, zoom) {
                //            var p = properties.OVERALL_CAT;
                //            return {
                //                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                //                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                //                        p == 'WeakWirelessFiberAvailable' ? '#ffff00' :
                //                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                //                                '#ffffff',
                //                fillOpacity: 0.5,
                //                //fillOpacity: 1,
                //                stroke: true,
                //                fill: true,
                //                color: 'black',
                //                opacity: 0.8,
                //                weight: .5,
                //            }
                //        }
                //    },
                //    interactive: false,
                //    getFeatureId: function (f) {
                //        return f.properties.cma;
                //    }
                //})

                //    .addTo(map);

                //vectorGridCMA3 = L.vectorGrid.slicer(VpgmData3, {
                //    rendererFactory: L.canvas.tile,
                //    zIndex: 3,
                //    vectorTileLayerStyles: {
                //        sliced: function (properties, zoom) {
                //            var p = properties.OVERALL_CAT;
                //            return {
                //                fillColor: p == 'StrongWirelessFiberAvailable' ? '#b3ffb3' :
                //                    p == 'StrongWirelessNoFiber' ? '#4da6ff' :
                //                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                //                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                //                                '#ffffff',
                //                fillOpacity: 0.5,
                //                //fillOpacity: 1,
                //                stroke: true,
                //                fill: true,
                //                color: 'black',
                //                opacity: 0.8,
                //                weight: .5,
                //            }
                //        }
                //    },
                //    interactive: false,
                //    getFeatureId: function (f) {
                //        return f.properties.cma;
                //    }
                //})

                //    .addTo(map);

                //vectorGridCMA4 = L.vectorGrid.slicer(VpgmData3, {
                //    rendererFactory: L.canvas.tile,
                //    zIndex: 3,
                //    vectorTileLayerStyles: {
                //        sliced: function (properties, zoom) {
                //            var p = properties.OVERALL_CAT;
                //            return {
                //                fillColor: p == 'StrongWirelessFiberAvailable' ? '#009900' :
                //                    p == 'StrongWirelessNoFiber' ? '#b3d9ff' :
                //                        p == 'WeakWirelessFiberAvailable' ? '#ffff99' :
                //                            p == 'WeakWirelessNoFiber' ? '#ffe6cc' :
                //                                '#ffffff',
                //                fillOpacity: 0.5,
                //                //fillOpacity: 1,
                //                stroke: true,
                //                fill: true,
                //                color: 'black',
                //                opacity: 0.8,
                //                weight: .5,
                //            }
                //        }
                //    },
                //    interactive: false,
                //    getFeatureId: function (f) {
                //        return f.properties.cma;
                //    }
                //})

                //    .addTo(map);

                //map.on('click', clearHighlight);

                //map.on('baselayerchange', function () {
                //    if (map.hasLayer(vectorGridCMA0)) {
                //        vectorGridCMA0.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA1)) {
                //        vectorGridCMA1.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA2)) {
                //        vectorGridCMA2.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA3)) {
                //        vectorGridCMA3.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA4)) {
                //        vectorGridCMA4.bringToFront();
                //    }
                //});                

                ///////////////////////////////

                //function highlightFeature(e) {
                //    //this.openPopup();
                //    if (map.hasLayer(Vpgm3LayerTest)) {                        
                //        Vpgm3LayerTest.clearLayers();
                //        map.removeControl(infoDatatable);
                //        map.addControl(info);
                //    };                    
                    
                //    //map.removeLayer(Vpgm3LayerTest);
                //    var layer = e.target;
                //    layer.setStyle({
                //        weight: 5,
                //        color: '#000000',
                //        opacity: 0.5,
                //        fillOpacity: 0.001
                //    });

                //    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                //        layer.bringToFront();
                //    }

                //    info.update(layer.feature.properties);
                //}

                //function highlightFeatureTouch(e) {
                //    //this.openPopup();
                //    if (map.hasLayer(Vpgm3LayerTest)) {
                //        Vpgm3LayerTest.clearLayers();
                //        map.removeControl(infoDatatable);
                //        map.addControl(info);
                //    }
                //    //map.removeLayer(Vpgm3LayerTest);
                //    VpgmData3Layer.resetStyle();
                    
                //    var layer = e.target;
                //    layer.setStyle({
                //        weight: 5,
                //        color: '#000000',
                //        opacity: 0.5,
                //        fillOpacity: 0.001
                //    });

                //    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                //        layer.bringToFront();
                //    }

                //    info.update(layer.feature.properties);
                //}

                //function resetHighlight(e) {
                //    //this.closePopup();
                //    if (map.hasLayer(Vpgm3LayerTest)) {
                //        Vpgm3LayerTest.clearLayers();
                //        map.removeControl(infoDatatable);
                //        map.addControl(info);
                //    }
                //    //map.removeLayer(Vpgm3LayerTest);
                //    VpgmData3Layer.resetStyle(e.target);
                //    info.update();
                    
                //}

                //function zoomToFeature(e) {
                //    var zoomlevel = map.getZoom();
                //    if (zoomlevel <= 7) {
                //        if (map.hasLayer(Vpgm3LayerTest)) {
                //            Vpgm3LayerTest.clearLayers();
                //            map.removeControl(infoDatatable);
                //            map.addControl(info);
                //        }
                //        var bounds = e.target.getBounds().pad(0.5);
                //        map.fitBounds(bounds);
                //    }

                    
                //}

                //function highlightAndZoom(e) {
                //    //this.openPopup();
                //    var layer = e.target;
                //    layer.setStyle({
                //        weight: 5,
                //        color: '#008000',
                //        opacity: 0.5,
                //        fillOpacity: 0.001
                //        //stroke: true,
                //        //color: '#008000',
                //        //opacity: 1,
                //        //weight: 5,
                //    });

                //    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                //        layer.bringToFront();
                //    }

                //    info.update(layer.feature.properties);

                //    var bounds = e.target.getBounds().pad(0.5);
                //    map.fitBounds(bounds);
                //}

                //function onEachFeature(feature, layer) {
                //    //layer.bindPopup(feature.properties.Name, {
                //    //    closeButton: false,
                //    //    autoPan: false
                //    //});
                //    if (navigator.userAgent.indexOf("Firefox") > 0) {
                //        layer.on({
                //            mouseover: highlightFeature,
                //            mouseout: resetHighlight,
                //            click: zoomToFeature
                //        });
                //    } else {
                //        if (L.Browser.touch) {
                //            layer.on({
                //                click: highlightFeatureTouch,
                //            });
                //        } else {
                //            layer.on({
                //                mouseover: highlightFeature,
                //                mouseout: resetHighlight,
                //                click: zoomToFeature
                //            });
                //        }
                //    }
                //}

                ////////////////////////////////

                //var myStyle = {
                //    "color": "#ffffff",
                //    "weight": 0,
                //    "opacity": 0.00
                //};

                //VpgmData3Layer = L.geoJSON(VpgmData3, {
                //    onEachFeature: onEachFeature,
                //    style: myStyle
                //});
                ////map.fitBounds(VpgmData3Layer.getBounds());
                //map.setView({ lat: 37.0902405, lng: -95.7128906 }, 4);

                ////map.on('zoomend', function () {
                ////    var zoomlevel = map.getZoom();
                ////    if (zoomlevel < 5) {
                ////        if (map.hasLayer(vectorGridCounty)) {
                ////            map.removeLayer(vectorGridZip0);
                ////            map.removeLayer(vectorGridCounty);
                ////            map.addLayer(vectorGridCMA);
                ////        } else {
                ////            console.log("no point layer active");
                ////        }
                ////    }
                ////    if (zoomlevel >= 5 & zoomlevel < 6) {
                ////        if (map.hasLayer(vectorGridZip0)) {
                ////            map.removeLayer(vectorGridZip0);
                ////            map.removeLayer(vectorGridCMA);
                ////            map.addLayer(vectorGridCounty);
                ////        } else {
                ////            console.log("no point layer active");
                ////        }
                ////        if (map.hasLayer(vectorGridCMA)) {
                ////            map.removeLayer(vectorGridZip0);
                ////            map.removeLayer(vectorGridCMA);
                ////            map.addLayer(vectorGridCounty);
                ////        } else {
                ////            console.log("no point layer active");
                ////        }
                ////    }
                ////    if (zoomlevel >= 6) {
                ////        if (map.hasLayer(vectorGridZip0)) {
                ////            console.log("layer already added");
                ////        } else {
                ////            map.removeLayer(vectorGridCounty);
                ////            map.removeLayer(vectorGridCMA);
                ////            map.addLayer(vectorGridZip0);
                ////        }
                ////        if (map.hasLayer(vectorGridCounty)) {
                ////            console.log("layer already added");
                ////        } else {
                ////            map.removeLayer(vectorGridCounty);
                ////            map.removeLayer(vectorGridCMA);
                ////            map.addLayer(vectorGridZip0);
                ////        }
                ////    }
                ////    console.log("Current Zoom Level =" + zoomlevel)
                ////});

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                //// add the search bar to the map
                //var searchControl = new L.Control.Search({
                //    //container: 'findbox',
                //    collapsed: true,
                //    autoCollapse: true,
                //    position: 'topleft',
                //    layer: VpgmData3Layer,
                //    propertyName: 'Name',
                //    marker: false,
                //    moveToLocation: function (latlng, title, map) {
                //        var zoom = map.getBoundsZoom(latlng.layer.getBounds());
                //        map.setView(latlng, zoom); // access the zoom
                //    },
                //    textPlaceholder: 'search...' // placeholder while nothing is searched
                //});

                //searchControl.on('search:locationfound', function (e) {

                //    e.layer.setStyle({
                //        //fillColor: '#3f0',
                //        //color: '#0f0'
                //        weight: 8,
                //        color: '#008000',
                //        dashArray: '',
                //        dashArray: '',
                //        fillOpacity: 0.7
                //    });
                //    //if (e.layer._popup)
                //    //    e.layer.openPopup();

                //}).on('search:collapsed', function (e) {

                //    VpgmData3Layer.eachLayer(function (layer) {	//restore feature color
                //        VpgmData3Layer.resetStyle(layer);
                //    });
                //});

                //map.addControl(searchControl);

                function getColor(d) {
                    return d === CampaignVariable ? "#0000ff" :
                        d === 'CAMPAIGN2' ? "#ff0000" :
                            d === 'CAMPAIGN3' ? "#87cefa" :
                                d === 'Sams Club' ? "#076cab" :
                                    d === 'Costco' ? "#990000" :
                                        d === 'Smart Circle' ? "#032e49" :
                                            d === 'Microsoft' ? "#000000" :
                                                d === 'Others' ? "#808080" :
                                                            "#ff7f00";
                }

                function getColor2(d) {
                    return d === 'AT&T Retail Store' ? "#002280" :
                        d === 'Authorized Reseller Store' ? "#21b2ff" :
                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'infolegend legend');

                    categories2 = ['AT&T Retail Store', 'Authorized Reseller Store'];

                    for (var i = 0; i < categories2.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor2(categories2[i]) + '"></i> ' +
                            (categories2[i] ? categories2[i] + '<br>' : '+');
                    }                    

                    categories = [CampaignVariable];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            //'<i class="doughnut" style="border: 3px solid ' + getColor(categories[i]) + '"></i> ' +
                            '<i class="rectangle-dot" style="border-radius: 0%; margin-left: 2px; margin-top: 2px; height: 14px; width: 14px; border: 3px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                var overlays = {
                    "AT&T Retail Store": ATTRstorePoints,
                    "Authorized Reseller Store": ARstorePoints,
                    "Selected Campaign": CAMPAIGN1storePoints
                };

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

                //L.control.locate().addTo(map);

                //map.on('overlayadd', function () {
                //    if (map.hasLayer(vectorGridCMA0)) {
                //        vectorGridCMA0.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA1)) {
                //        vectorGridCMA1.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA2)) {
                //        vectorGridCMA2.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA3)) {
                //        vectorGridCMA3.bringToFront();
                //    }
                //    if (map.hasLayer(vectorGridCMA4)) {
                //        vectorGridCMA4.bringToFront();
                //    }
                //    if (map.hasLayer(VpgmData3Layer)) {
                //        VpgmData3Layer.bringToFront();
                //    }
                //});

                //startCMA();


            }

            function addCAMPAIGN1Layer() {
                map.addLayer(CAMPAIGN1storePoints);
            }


            function startZip() {
                ZipLayerState = 0;
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip0);
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
                    document.getElementById('ZipTableSubtitle2').innerHTML = "";
                    ZipLayerState = 0;
                    ZipTableUpdate();
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
                    document.getElementById('ZipTableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                    ZipLayerState = 1;
                    ZipTableUpdate();
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
                    document.getElementById('ZipTableSubtitle2').innerHTML = "(Weak Wireless & Fiber Available)";
                    ZipLayerState = 2;
                    ZipTableUpdate();
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
                    document.getElementById('ZipTableSubtitle2').innerHTML = "(Strong Wireless & No Fiber)";
                    ZipLayerState = 3;
                    ZipTableUpdate();
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
                    document.getElementById('ZipTableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
                    ZipLayerState = 4;
                    ZipTableUpdate();
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
                    document.getElementById('CountyTableSubtitle2').innerHTML = "";
                    CountyLayerState = 0;
                    CountyTableUpdate();
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
                    document.getElementById('CountyTableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                    CountyLayerState = 1;
                    CountyTableUpdate();
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
                    document.getElementById('CountyTableSubtitle2').innerHTML = "(Weak Wireless & Fiber Available)";
                    CountyLayerState = 2;
                    CountyTableUpdate();
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
                    document.getElementById('CountyTableSubtitle2').innerHTML = "(Strong Wireless & No Fiber)";
                    CountyLayerState = 3;
                    CountyTableUpdate();
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
                    document.getElementById('CountyTableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
                    CountyLayerState = 4;
                    CountyTableUpdate();
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
                    document.getElementById('CMATableSubtitle2').innerHTML = "";
                    CMALayerState = 0;
                    NationalTableUpdate();
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
                    //document.getElementById('CMATableSubtitle2').innerHTML = "(Weak Wireless & No Fiber)";
                    CMALayerState = 1;
                    NationalTableUpdate();
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
                    //document.getElementById('CMATableSubtitle2').innerHTML = "(Weak Wireless & Fiber Available)";
                    CMALayerState = 2;
                    NationalTableUpdate();
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
                    //document.getElementById('CMATableSubtitle2').innerHTML = "(Strong Wireless & No Fiber)";
                    CMALayerState = 3;
                    NationalTableUpdate();
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
                    //document.getElementById('CMATableSubtitle2').innerHTML = "(Strong Wireless & Fiber Available)";
                    CMALayerState = 4;
                    NationalTableUpdate();
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

    </script>


</asp:Content>


