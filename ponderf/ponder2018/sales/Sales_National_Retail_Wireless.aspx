<%@ Page Title="Sales National Retail Wireless Scoring" Language="C#" MasterPageFile="~/MasterPageNationalRetail.master" AutoEventWireup="true" CodeFile="Sales_National_Retail_Wireless.aspx.cs" Inherits="sales_National_Retail_Wireless" %>

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
            height: 166px;
            width: 110px;
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

    </style>

    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />


    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
            <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                <!--begin::Info-->
                <div class="d-flex align-items-center flex-wrap mr-1">
                    <!--begin::Page Heading-->
                    <div class="d-flex align-items-baseline mr-5">
                        <!--begin::Page Title-->
                        <h5 class="text-dark font-weight-bold my-2 mr-5">National Retail - Store Wireless Scoring</h5>
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
                                <a href="/sales/Sales_National_Retail_Wireless.aspx" class="text-muted">National Retail - Store Wireless Scoring</a>
                            </li>                            
                        </ul>--%>
                        <!--end::Breadcrumb-->
                    </div>
                    <!--end::Page Heading-->
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
                        <%--<div class="m-demo__preview m-demo__preview--btn">                                                                    
                            <button type="button" class="btn btn-primaryClassification btn-sm" id="ClassificationMethodologyBtn" onclick="ShowClassificationMethodology()">&nbsp; Classification Methodology
                                &nbsp;<br />Click to Show Details</button>&nbsp;                                      
                        </div>--%>

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
                                            <div id="ddlWrapper">
                                                <asp:Label ID="labelMarket" runat="server" Visible="false" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:Label ID="labelSortNational" runat="server" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                            <asp:DropDownList ID="ddlSortNational" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="NationalTableUpdate();">
                                            </asp:DropDownList>

                                            <div style="display: none;">
                                                <asp:Button runat="server" ID="btnZipModal" data-toggle="modal" data-target="#m_modal_zip" />
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
                                            
                                            
                                            <div class="row" id="MapDiv">
                                                <div class="col-lg-1" id="Placeholder_tab1"></div>
                                                <div class="col-lg-10" id="Placeholder_tab2">
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
                                                            General Wireless Coverage within 3-5 miles around a store location is calculated and classified as:  <br />
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> 1: Very Weak
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> 2: Weak 
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> 3: Strong
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> 4: Very Strong
                                                            <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> 5: Best 
                                                        </div>
                                                    </div>

                                                </div>
                                                
                                                
                                            </div>
                                            <br />
                                            <div class="row">                                                
                                                <div class="col-lg-12" id="buttonrowcenter">
                                                    <div id="LOADING1" style='display: none'>
                                                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Map Data...
                                                    </div>
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
                                                    <%--<div id="buttonrowcma" style="display:none">                                                      
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
                                                        <button type="button" class="btn btn-primary3 btn-lg oneButton" onclick="clusterDisable()">
                                                            Disable Clustering<br>
                                                            <span id="CMA_GWNF_COUNT"></span> CMAs<br>
                                                            <span id="CMA_GWNF_POPS"></span> Pops</button>
                                                        <button type="button" class="btn btn-primary4 btn-lg oneButton" onclick="clusterEnable()">
                                                            Enable Clustering<br>
                                                            <span id="CMA_GWGF_COUNT"></span> CMAs<br>
                                                            <span id="CMA_GWGF_POPS"></span> Pops</button>
                                                    </div>--%>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv5_tab1">
                                                    <div class="row">
                                                        <%--<div class="col-lg-1" id="Placeholder_tab3">
                                                        </div>--%>
                                                        <div class="col-lg-12" id="RecentDiv6_tab1">

                                                            <div class="content d-flex flex-column flex-column-fluid" id="kt_content2">
                                                                <div class="d-flex flex-column-fluid">
                                                                    <div class="container" id="zipTableDiv">
                                                                        <div class="card card-custom">
                                                                            
                                                                                <div class="card-header">
                                                                                    <div class="card-title">
                                                                                        <%--<span class="card-icon">
                                                                                            <i class="flaticon2-gear text-primary"></i>
                                                                                        </span>--%>
                                                                                        <h3 class="card-label"><span id="ZipTableSubtitle1"></span> Top 50 Zips <span id="ZipTableSubtitle2"></span></h3>
                                                                                        <div style="display: none;">
                                                                                            <asp:Button runat="server" ID="ButtonFCExportZips" OnClick="ExportToExcel_AllZips" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="card-toolbar">
                                                                                        <div class="right" id="right_orderSortZip">
                                                            
                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortZip" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        <asp:Label ID="labelSortZip" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlSortZip" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="ZipTableUpdate();">
                                                                                                        </asp:DropDownList>
                                                                                                                                               

                                                                                                    </ContentTemplate>

                                                                                                </asp:UpdatePanel>
                                                                                            </h5>
                                                                                        </div>

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
                                                                            
                                                                                <div class="card-header">
                                                                                    <div class="card-title">
                                                                                        <%--<span class="card-icon">
                                                                                            <i class="flaticon2-gear text-primary"></i>
                                                                                        </span>--%>
                                                                                        <h3 class="card-label"><span id="CountyTableSubtitle1"></span> Top 50 Counties <span id="CountyTableSubtitle2"></span></h3>
                                                                                        <div style="display: none;">
                                                                                            <asp:Button runat="server" ID="ButtonFCExportCounties" OnClick="ExportToExcel_AllCounties" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="card-toolbar">
                                                                                        <div class="right" id="right_orderSortCounty">
                                                            
                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortCounty" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        <asp:Label ID="labelSortCounty" runat="server" Text="Order By: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                                                                                        <asp:DropDownList ID="ddlSortCounty" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="CountyTableUpdate();">
                                                                                                        </asp:DropDownList>
                                                                                                                                               

                                                                                                    </ContentTemplate>

                                                                                                </asp:UpdatePanel>
                                                                                            </h5>
                                                                                        </div>


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
                                                                    
                                                                    <div class="container" id="NationalTableDiv">
                                                                        <div class="card card-custom">
                                                                            
                                                                                <div class="card-header">
                                                                                    <div class="card-title">
                                                                                        <%--<span class="card-icon">
                                                                                            <i class="flaticon2-gear text-primary"></i>
                                                                                        </span>--%>
                                                                                        <h3 class="card-label"><span id="NationalTableSubtitle1"></span>National Top 50 Store Locations by Wireless Score</h3>
                                                                                        <div style="display: none;">
                                                                                            <asp:Button runat="server" ID="ButtonFCExportNational" OnClick="ExportToExcel_AllNational" />
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="card-toolbar">
                                                                                        <div class="right" id="right_orderSortNational">
                                                            
                                                                                            <h5>
                                                                                                <asp:UpdatePanel ID="UpdatePanelSortNational" runat="server" ChildrenAsTriggers="true">
                                                                                                    <ContentTemplate>

                                                                                                        
                                                                                                                                               

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
                                                                                                <th>Location ID</th>
                                                                                                <th>Dealer Name</th>
                                                                                                <th>Store Number</th>
                                                                                                <th>City</th>
                                                                                                <th>State</th>
                                                                                                <th>Wireless Score</th>
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
                    <h2>Classification Methodology and Tool Description</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i aria-hidden="true" class="ki ki-close"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div style="text-align: center;">
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
                    <br />
                    <div style="text-align: left;">
                        <h6>This tool divides Sales areas into smaller geographies. The default is a National map with CMA boundaries. <br />
                        There is a dropdown list in the top right corner of the tool which allows the user to select a Sales Region or VPGM Market. <br />
                           The Regional maps will split into Counties, and for VPGM Markets it displays Zip Codes. <br /> <br />
                    
                      The CMAs/Counties/Zips are colored based on two dimensions: Wireless Strength and Fiber Availability. <br />
                          Wireless strength uses Reference Signal Received Power (RSRP) from IQI data collected within the area, and is exclusively based around population centers. <br />
                          Fiber Availability reflects if we currently offer Fiber to customers in the area or not. <br />
                          These two dimensions create four categories that color the map:
                      </h6>
                    
                        <div class="row">
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
                        </div>                        

                        <h6> Stores are also plotted on the map: AT&T Retail in dark blue and Authorized Reseller in light blue. <br />
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
                            The PSAs are then subdivided into smaller categories to allow for more granular classification: <br /> <br />

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
                            <span style="width: 13px; height: 13px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Score 5 (Best): 0% = NoServiceRate AND Bottom 25% of samples have RSRP >= -100 dBm<br />


                        </h6>
                    </div>

                    <div id="ModalDisplay_RYG3">                       
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
                $('#LOADING1').show();

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_National_Retail_Wireless.aspx/GetDATADATE",
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

                    getFilterCriteria();
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
                $('#LOADING1').show();

                //Show tabs
                //$('#LOADING_Quad1_tab' + activeTabNumber).show();

                //trigger chain of functions to get data
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

                if (groupGeo == 'SALES') {
                    if (marketGeo == '%') {
                        updateSalesOpportunityChartNational();
                    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {
                        updateSalesOpportunityChartRegion();
                    } else {
                        updateSalesOpportunityChartMarket();
                    }
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail_Market",  //use a function from C# , change this for different data return
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_Zip_Summary_Info",  //use a function from C# , change this for different data return
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2, 'overallCatVariable': '%', 'orderVariable': 'ZIPTOTALPOPS' }),
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail_Region1",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail_Region2",  //use a function from C# , change this for different data return
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_County_Summary_Info",  //use a function from C# , change this for different data return
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_CountyTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'overallCatVariable': '%', 'orderVariable': 'TOTALPOPS' }),
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail_National1",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail_National2",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail_National3",  //use a function from C# , change this for different data return
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

                //$.ajax({
                //    type: "POST",
                //    async: true,
                //    url: "Sales_National_Retail_Wireless.aspx/Get_CMA_Summary_Info",  //use a function from C# , change this for different data return
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_NationalTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo, 'overallCatVariable': '%', 'storeVariable': '%' }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        NationalTable(data);
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

                var SelectedSortZip = $('#<%= ddlSortZip.ClientID %> option:selected').val();
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_ZipTable_Data",  //use a function from C# , change this for different data return
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

                var SelectedSortCounty = $('#<%= ddlSortCounty.ClientID %> option:selected').val();
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_CountyTable_Data",  //use a function from C# , change this for different data return
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

            function NationalTableUpdate() {
                console.log('NationalTableUpdate');
                if (map.hasLayer(Vpgm3LayerTest)) {
                    Vpgm3LayerTest.clearLayers();
                    map.removeControl(infoDatatable);
                    map.addControl(info);
                };

                var SelectedSortNational = $('#<%= ddlSortNational.ClientID %> option:selected').val();
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log('CMA table sort pulldown change: ' + SelectedSortNational);

                var CMACatFilter = '%'
                if (CMALayerState == 0) { CMACatFilter = '%'; }
                else if (CMALayerState == 1) { CMACatFilter = 'WeakWirelessNoFiber'; }
                else if (CMALayerState == 2) { CMACatFilter = 'WeakWirelessFiberAvailable'; }
                else if (CMALayerState == 3) { CMACatFilter = 'StrongWirelessNoFiber'; }
                else if (CMALayerState == 4) { CMACatFilter = 'StrongWirelessFiberAvailable'; }

                //WALMARTstorePoints, TARGETstorePoints, BESTBUYstorePoints, SAMSCLUBstorePoints, COSTCOstorePoints, SMARTCIRCLEstorePoints, MICROSOFTstorePoints, OTHERSstorePoints
                console.log('SelectedSortNational: ' + SelectedSortNational)
                if (SelectedSortNational == "%") {
                    map.addLayer(WALMARTstorePoints);
                    map.addLayer(TARGETstorePoints);
                    map.addLayer(BESTBUYstorePoints);
                    map.addLayer(SAMSCLUBstorePoints);
                    map.addLayer(COSTCOstorePoints);
                    map.addLayer(SMARTCIRCLEstorePoints);
                    map.addLayer(MICROSOFTstorePoints);
                    map.addLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == "WALMART") {
                    map.addLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == "TARGET MOBILE/DIRECT") {
                    map.removeLayer(WALMARTstorePoints);
                    map.addLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == "BEST BUY MOBILE") {
                    map.removeLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.addLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == "SAM'S CLUB MOBILE") {
                    map.removeLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.addLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == 'COSTCO/WIRELESS ADVOCATES') {
                    map.removeLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.addLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == 'SMART CIRCLE') {
                    map.removeLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.addLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == 'MICROSOFT') {
                    map.removeLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.addLayer(MICROSOFTstorePoints);
                    map.removeLayer(OTHERSstorePoints);
                } else if (SelectedSortNational == 'OTHERS') {
                    map.removeLayer(WALMARTstorePoints);
                    map.removeLayer(TARGETstorePoints);
                    map.removeLayer(BESTBUYstorePoints);
                    map.removeLayer(SAMSCLUBstorePoints);
                    map.removeLayer(COSTCOstorePoints);
                    map.removeLayer(SMARTCIRCLEstorePoints);
                    map.removeLayer(MICROSOFTstorePoints);
                    map.addLayer(OTHERSstorePoints);
                } 
                               


                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_National_Retail_Wireless.aspx/Get_NationalTable_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo2, 'overallCatVariable': CMACatFilter, 'storeVariable': SelectedSortNational }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        NationalTable(data);
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
                    url: "Sales_National_Retail_Wireless.aspx/Get_ZipModalTable_Data",  //use a function from C# , change this for different data return
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
                document.getElementById('ZipTableSubtitle1').innerHTML = marketGeoText;

                var ExportZipOrder = 'Total_Pops';
                console.log($('#<%= ddlSortZip.ClientID %> option:selected').text());
                if ($('#<%= ddlSortZip.ClientID %> option:selected').text() == 'Highest Pop Density') {
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
                        // { 'data': 'ZIPTOTALAREA' },
                        { 'data': 'ZIPTOTALPOPS' },
                        { 'data': 'ZIPPOP_DENSITY' },
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

                    //    if (SelectedSortZip == "ZIPTOTALPOPS") {
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

                        var ZIPTOTALPOPSCOMMA = "";
                        var FIBER_AVAILABLECOMMA = "";
                        var FIBER_CUSTOMERSCOMMA = "";
                        var FIBER_OPPORTUNITYCOMMA = "";

                        if (props) {
                            ZIPTOTALPOPSCOMMA = Number(props.ZIPTOTALPOPS).toLocaleString('en');
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
                            '<b>Zip Code: ' + props.ZIP + ', ' + props.STATE + '</b><br />' + 'ZIP Population: ' + ZIPTOTALPOPSCOMMA +
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
                console.log($('#<%= ddlSortCounty.ClientID %> option:selected').text());
                if ($('#<%= ddlSortCounty.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportCountyOrder = 'Pop_Density';
                }

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                marketGeoText = marketGeoText + " REGION";
                document.getElementById('CountyTableSubtitle1').innerHTML = marketGeoText;
                
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
                        // { 'data': 'CMATOTALAREA' },
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

                        if (props) {
                            TotalPOPsCOMMA = Number(props.TotalPOPs).toLocaleString('en');
                            FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                            FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                            FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                        }

                        this._div.innerHTML = '<h4>County Information</h4>' + (props ?
                            //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                            '<b>County: ' + props.COUNTY_STATE + '</b><br />' + 'Population: ' + TotalPOPsCOMMA +
                            '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                            '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                            '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT
                            : 'Hover over a county');

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
                        text: 'Export All',
                        className: 'btn btn-primary', 
                        titleAttr: 'Exports All Nationally',
                        action: function (e, dt, node, config) {
                            ExportAll_CMAs();
                        }
                    },
                        { extend: 'csv', text: 'Export Top 50', className: 'btn btn-primary', titleAttr: 'Export Top 50 Stores to Excel', title: 'Top_50_National' }],
                    columns: [
                        { 'data': 'ROWNUM' },
                        { 'data': 'LOCATION_ID' },
                        { 'data': 'MASTER_DEALER_NAME' },
                        { 'data': 'STORE_NUMBER' },
                        { 'data': 'CITY' },
                        { 'data': 'STATE' },
                        { 'data': 'WIRELESS_SCORE' }
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

            function CMATable(data) {
                $('#national_datatable').dataTable().fnDestroy(); //destroy old table

                var table = $('#national_datatable');
                console.log('KTDataTables begin');

                var ExportNationalOrder = 'Total_Pops';
                console.log($('#<%= ddlSortNational.ClientID %> option:selected').text());
                if ($('#<%= ddlSortNational.ClientID %> option:selected').text() == 'Highest Pop Density') {
                    ExportNationalOrder = 'Pop_Density';
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
                        // { 'data': 'CMATOTALAREA' },
                        { 'data': 'CMATOTALPOPS' },
                        { 'data': 'CMAPOP_DENSITY' },
                        // { 'data': 'WIRELESS_SCORE' },
                        // { 'data': 'FIBER_SCORE' },
                        // { 'data': 'FIBER_AVAILABLE' },
                        { 'data': 'FIBER_CUSTOMERS' },
                        { 'data': 'FIBER_OPPORTUNITY' },
                        { 'data': 'ALL_STORE_COUNT' },
                        // { 'data': 'FIBER_PERCENTAGE' }
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

            function zipCodeModalTable(data, SelectedSortZipModal) {

                $('#zipCodeModal_datatable').dataTable().fnDestroy(); //destroy old table                

                var table = $('#zipCodeModal_datatable');
                document.getElementById('<%= hf_PSALocationZip.ClientID %>').value = SelectedSortZipModal;
                
                console.log('KTDataTables ZipModal begin');

                var marketGeoText = $('#<%= ddlMarket.ClientID %> option:selected').val();
                if (marketGeoText == 'NTX') {
                    marketGeoText = 'NORTH TEXAS'
                } if (marketGeoText == 'STX') {
                    marketGeoText = 'SOUTH TEXAS'
                }
                document.getElementById('ZipModalTableSubtitle1').innerHTML = ZipCodeModalSelected;                

                console.log('SelectedSortZipModal: ' + SelectedSortZipModal)


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
                        text: 'Export All Fiber Addresses in ZIP',
                        titleAttr: 'Export All Fiber Addresses for Selected Zip to Excel',
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
                        { 'data': 'FIBER_OPPORTUNITY' }
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
                    selectedFiberGetExport(value);
                    //alert(value);
                    return false;
                });

                function selectedFiberGetExport(value) {
                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = value;
                    var clickButton = document.getElementById("<%= ButtonPSALocations.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA from table: " + value);
                }

                function selectedFiberGetExportAll(SelectedSortZipModal) {                    
                    var clickButton = document.getElementById("<%= ButtonPSALocationsZip.ClientID %>");
                    clickButton.click();
                    //console.log("Clicked PSA from table: " + value);
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

                console.log('KTDataTables zip modal end');

            };

            

            function ExportAll_CMAs() {
                console.log('ExportAll_National');
                var clickButton = document.getElementById("<%= ButtonFCExportNational.ClientID %>");
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

            function GET_MAP_THEME_DATA(storeData) {
                console.log('GET_MAP_THEME_DATA function start');
                <%--var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();--%>
                var groupGeo = 'SALES';
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var countyGeo;
                
                console.log('marketGeo: ' + marketGeo);
                console.log('countyGeo: ' + countyGeo);

                if (groupGeo == 'SALES') {
                    if (marketGeo == '%') {

                        $.when(

                            //$.ajax({
                            //    type: "POST",
                            //    async: true,
                            //    url: "Sales_National_Retail_Wireless.aspx/Get_cma_theme_data",  //use a function from C# , change this for different data return
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

                            storeMapV3_National(storeData, MarketBoundaryData);
                        });

                    } else if (marketGeo == 'CENTRAL' | marketGeo == 'EAST' | marketGeo == 'WEST') {

                        countyGeo = marketGeo;

                        $.when(

                            $.ajax({
                                type: "POST",
                                async: true,
                                url: "Sales_National_Retail_Wireless.aspx/Get_county_theme_data",  //use a function from C# , change this for different data return
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

                        var marketGeo2 = $('#<%= ddlMarket.ClientID %> option:selected').val();                        

                        if (marketGeo == 'FLORIDA' | marketGeo == 'GEORGIA SOUTH CAROLINA' | marketGeo == 'GREATER LAKES' | marketGeo == 'GULF STATES' | marketGeo == 'HEARTLAND STATES' | marketGeo == 'KAMO' |
                            marketGeo == 'MID-ATLANTIC' | marketGeo == 'NORTHERN CALIFORNIA' | marketGeo == 'NTX' | marketGeo == 'OHIOPENNSYLVANIA' | marketGeo == 'SOUTHERN CALIFORNIA' | marketGeo == 'STX') {                           

                            document.getElementById('mapcountwarning').innerHTML = "";
                            document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity - " + $('#<%= ddlMarket.ClientID %> option:selected').text();
                            document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?"; 

                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_National_Retail_Wireless.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
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
                            document.getElementById('mapcounttitle').innerHTML = $('#<%= ddlMarket.ClientID %> option:selected').text();
                            document.getElementById('mapcountsubtitle').innerHTML = ""; 

                            $.when(

                                $.ajax({
                                    type: "POST",
                                    async: true,
                                    url: "Sales_National_Retail_Wireless.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail2",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Store_Detail3",  //use a function from C# , change this for different data return
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
                //    url: "Sales_National_Retail_Wireless.aspx/Get_Master_Data",  //use a function from C# , change this for different data return
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
                    $('#zipfooter').show();
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

                //document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity - " + market_long;
                //document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
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

                    var ZIPTOTALPOPSCOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";
                    var zipTouchLink;

                    if (props) {
                        ZIPTOTALPOPSCOMMA = Number(props.ZIPTOTALPOPS).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    }

                    //if (props.NUMBER_OF_PSAS == 0) {
                    //    zipTouchLink = '';
                    //} else {
                    //    if (L.Browser.touch) {                            
                    //        zipTouchLink = '<br /><a href="#" class="ZipTouchDetailLink">Click to Show PSA Location Details</a>';                            
                    //    } else {
                    //        zipTouchLink = '';
                    //    }
                    //}
                    
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
                        '<b>Zip Code: ' + props.ZIP + ', ' + props.STATE + '</b>' + '<br />' + 'ZIP Population: ' + ZIPTOTALPOPSCOMMA +
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
                    clickButton.click();
                }

                function showZipModal(props) {                    
                    ZipModal_Click();
                    updateZipModal(props); // function for getting data for modal
                }                

                function modalAlert(props) {
                    alert('Clicked Zip: ' + props.ZIP );
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Zip_Store_Detail_Market",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_Zip_PSA_Detail_Market",  //use a function from C# , change this for different data return
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
                        url: "Sales_National_Retail_Wireless.aspx/Get_ZipModalTable_Data",  //use a function from C# , change this for different data return
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

                    var ZIPTOTALPOPSCOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";

                    if (props) {
                        ZIPTOTALPOPSCOMMA = Number(props.ZIPTOTALPOPS).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    }

                    document.getElementById('ZipModalZip').innerHTML = props.ZIP;
                    document.getElementById('DisplayZipCode').innerHTML = 'Zip Code: ' + props.ZIP + ', ' + props.STATE;
                    document.getElementById('DisplayZipPop').innerHTML = 'ZIP Population: ' + ZIPTOTALPOPSCOMMA;
                    document.getElementById('DisplayWirelessCat').innerHTML = 'Wireless Category: ' + props.WIRELESS_CATEGORY;
                    document.getElementById('DisplayFiberCat').innerHTML = 'Fiber Availability: ' + props.FIBER_AVAILABILITY;
                    document.getElementById('DisplayFiberAvail').innerHTML = 'Fiber Available: ' + FIBER_AVAILABLECOMMA;
                    document.getElementById('DisplayFiberCurrent').innerHTML = 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA;
                    document.getElementById('DisplayFiberOpp').innerHTML = 'Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA;
                    document.getElementById('DisplayATTRStore').innerHTML = 'AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT;
                    document.getElementById('DisplayARStore').innerHTML = 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT;
                    document.getElementById('DisplayALLStore').innerHTML = 'All Store Count: ' + props.ALL_STORE_COUNT;
                    document.getElementById('DisplayPSACount').innerHTML = 'PSA Location Count: ' + props.NUMBER_OF_PSAS;

                    ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable);
                    zipCodeModalTable(zipCodeModalTabledata, ZipVariable);

                });           

            }           

            function ShowZipModalMap(VpgmData, ZipstoreData, MarketBoundaryData, ZipPSAData, ZipVariable) {

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

                for (i in PSA0) {
                    var popup =
                        '<b>ZIP CO PSA:</b> ' + PSA0[i].ZIP_CO_PSA +
                        '<br/><b>Wireless Score:</b> ' + PSA0[i].WIRELESS_SCORE_TEXT +
                        '<br/><b>Fiber Locations:</b> ' + PSA0[i].FIBER_AVAILABLE +
                        '<br/><b>Fiber Customers:</b> ' + PSA0[i].FIBER_CUSTOMERS +
                        '<br/><b>Fiber Opportunity:</b> ' + PSA0[i].FIBER_OPPORTUNITY +
                        '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>' ,

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
                        '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>',

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
                        '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>',

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
                        '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>',

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
                        '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>',

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
                        '<br><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses</a>',

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

                document.getElementById('mapcountwarning').innerHTML = "";
                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity - " + market_long;
                document.getElementById('mapcountsubtitle').innerHTML = "Where can we sell fiber today?";
                document.getElementById('myZipModalMap').innerHTML = "<div id='ModalMap' style='height: 400px;'></div>";
                
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

                if (ZipPSAData.length <= 0) {
                    mapModal = L.map("ModalMap", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        //zoomControl: false,
                        layers: [streets, ATTRstorePoints, ARstorePoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                } else {
                    mapModal = L.map("ModalMap", {
                        attributionControl: false,
                        preferCanvas: true,
                        center: [39.73, -104.99],
                        zoom: 10,
                        minZoom: 3,
                        //zoomControl: false,
                        layers: [streets, ATTRstorePoints, ARstorePoints, PSALocationPoints],
                        fullscreenControl: true,
                        fullscreenControlOptions: {
                            position: 'topleft'
                        }
                    });
                }

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
                    document.getElementById('<%= hf_PSALocation.ClientID %>').value = SelectedPSA;
                    var clickButton = document.getElementById("<%= ButtonPSALocations.ClientID %>");
                    clickButton.click();
                    console.log("Clicked PSA2: " + SelectedPSA);
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

                //L.control.touchHover().addTo(mapModal);

                //if (L.Browser.touch) {
                //    L.control.touchHover().addTo(mapModal);
                //}

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
                

                if (ZipPSAData.length <= 0) {

                    legendZipNoPSA.onAdd = function (mapModal) {

                        var div = L.DomUtil.create('div', 'infolegendZipNoPSA legendZipNoPSA');
                        categories = ['AT&T Retail Store', 'Authorized Reseller Store'];


                        for (var i = 0; i < categories.length; i++) {
                            div.innerHTML +=
                                '<i class="doughnutZipNoPSA" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                (categories[i] ? categories[i] + '<br>' : '+');
                        }

                        return div;
                    };

                    legendZipNoPSA.addTo(mapModal);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer,
                        "AT&T Retail Store": ATTRstorePoints,
                        "Authorized Reseller Store": ARstorePoints
                    };

                } else {

                    legendZip.onAdd = function (mapModal) {

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

                    legendZip.addTo(mapModal);

                    var overlays = {
                        "VPGM Market Borders": MarketBoundaryLayer,
                        "AT&T Retail Store": ATTRstorePoints,
                        "Authorized Reseller Store": ARstorePoints,
                        "PSA Locations": PSALocationPoints
                    };
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

                mapModal.on('overlayadd', function () {
                    
                    //if (mapModal.hasLayer(VpgmModalDataLayer)) {
                    //    VpgmModalDataLayer.bringToFront();
                    //}
                }); 

                mapModal.invalidateSize();

            }

            var storeMapV3_Region = function (storeData, VpgmData2, MarketBoundaryData) {

                $('#buttonrowcounty').show();
                $('#MapDiv').show();
                $('#countyTableDiv').show();
                $('#zipfooter').hide();
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

                var mcg = L.markerClusterGroup(),
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

                document.getElementById('mapcountwarning').innerHTML = "";
                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity - " + market_long;
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

                //L.control.touchHover().addTo(map);

                //if (L.Browser.touch) {
                //    L.control.touchHover().addTo(map);
                //}

                infoCounty = L.control({ position: 'bottomleft' });

                infoCounty.onAdd = function (map) {
                    this._div = L.DomUtil.create('div', 'info'); // create a div with a class "info"
                    this.update();
                    return this._div;
                };

                // method that we will use to update the control based on feature properties passed
                infoCounty.update = function (props) {
                    //console.log(props);

                    var TotalPOPsCOMMA = "";
                    var FIBER_AVAILABLECOMMA = "";
                    var FIBER_CUSTOMERSCOMMA = "";
                    var FIBER_OPPORTUNITYCOMMA = "";

                    if (props) {
                        TotalPOPsCOMMA = Number(props.TotalPOPs).toLocaleString('en');
                        FIBER_AVAILABLECOMMA = Number(props.FIBER_AVAILABLE).toLocaleString('en');
                        FIBER_CUSTOMERSCOMMA = Number(props.FIBER_CUSTOMERS).toLocaleString('en');
                        FIBER_OPPORTUNITYCOMMA = Number(props.FIBER_OPPORTUNITY).toLocaleString('en');
                    }

                    this._div.innerHTML = '<h4>County Information</h4>' + (props ?
                        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
                        '<b>County: ' + props.COUNTY_STATE + '</b><br />' + 'Population: ' + TotalPOPsCOMMA +
                        '<br />Wireless Category: ' + props.WIRELESS_CATEGORY + '<br />' + 'Fiber Available: ' + props.FIBER_AVAILABILITY +
                        '<br />Fiber Available: ' + FIBER_AVAILABLECOMMA + '<br />' + 'Current Fiber Customers: ' + FIBER_CUSTOMERSCOMMA + '<br />Potential Fiber Opportunities: ' + FIBER_OPPORTUNITYCOMMA +
                        '<br />AT&T Retail Store Count: ' + props.ATTR_STORE_COUNT + '<br />' + 'Authorized Reseller Store Count: ' + props.AR_STORE_COUNT + '<br />All Store Count: ' + props.ALL_STORE_COUNT
                        : 'Hover over a county');

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

                function onEachFeature(feature, layer) {
                    //layer.bindPopup(feature.properties.COUNTY_STATE, {
                    //    closeButton: false,
                    //    autoPan: false
                    //});
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

                VpgmData2Layer = L.geoJSON(VpgmData2, {
                    onEachFeature: onEachFeature,
                    style: myStyle
                });
                map.fitBounds(VpgmData2Layer.getBounds());

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
                    "VPGM Region Borders": MarketBoundaryLayer,                    
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

            //function clusterDisable() {
            //    console.log('clusterDisable');
            //    mcg.disableClustering();
            //}

            //function clusterEnable() {
            //    console.log('clusterEnable');
            //    mcg.enableClustering();
            //}

            var storeMapV3_National = function (storeData, MarketBoundaryData) {

                $('#buttonrowcma').show();
                $('#MapDiv').show();
                $('#NationalTableDiv').show();
                $('#zipfooter').hide();
                $('#zipfooter2').show();
                $('#LOADING1').hide();

                $(window).resize();

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();                

                var WALMART = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("WALMART");
                });
                var TARGET = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("TARGET MOBILE/DIRECT");
                });
                var BESTBUY = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("BEST BUY MOBILE");
                });
                var SAMSCLUB = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("SAM'S CLUB MOBILE");
                });
                var COSTCO = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("COSTCO/WIRELESS ADVOCATES");
                });
                var SMARTCIRCLE = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("SMART CIRCLE");
                });
                var MICROSOFT = storeData.filter(function (el) {
                    return el.MASTER_DEALER_NAME.includes("MICROSOFT");
                });                
                var OTHERS = storeData.filter(x => x.MASTER_DEALER_NAME == 'AAFES/WIRELESS ADVOCATES' || x.MASTER_DEALER_NAME == 'CYDCOR' || x.MASTER_DEALER_NAME == 'FRYS ELECTRONICS' || x.MASTER_DEALER_NAME == 'NAVY/WIRELESS ADVOCATES'
                    || x.MASTER_DEALER_NAME == 'STEREN ELECTRONICS' || x.MASTER_DEALER_NAME == 'MARINES/WIRELESS ADVOCATES' || x.MASTER_DEALER_NAME == 'TROC/SAMSUNG' || x.MASTER_DEALER_NAME == 'NEBRASKA FURNITURE MART');


                mcg = L.markerClusterGroup({ chunkedLoading: true, disableClusteringAtZoom: 8, spiderfyOnMaxZoom: false}),
                    WALMARTstorePoints = L.featureGroup.subGroup(mcg),// use `L.featureGroup.subGroup(parentGroup)` instead of `L.featureGroup()` or `L.layerGroup()`!
                    TARGETstorePoints = L.featureGroup.subGroup(mcg),
                    BESTBUYstorePoints = L.featureGroup.subGroup(mcg),
                    SAMSCLUBstorePoints = L.featureGroup.subGroup(mcg),
                    COSTCOstorePoints = L.featureGroup.subGroup(mcg),
                    SMARTCIRCLEstorePoints = L.featureGroup.subGroup(mcg),
                    MICROSOFTstorePoints = L.featureGroup.subGroup(mcg),
                    OTHERSstorePoints = L.featureGroup.subGroup(mcg);

                for (i in WALMART) {
                    var popup =
                        '<b>Dealer Name:</b> ' + WALMART[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + WALMART[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + WALMART[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + WALMART[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + WALMART[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + WALMART[i].CITY + ', ' + WALMART[i].STATE + ' ' + WALMART[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + WALMART[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + WALMART[i].OVERALL_RANK;

                    var loc = [WALMART[i].LATITUDE, WALMART[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = WALMART[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var WALMARTstoreTableoptions = {
                            //icon: 'store',
                            iconShape: 'doughnut',
                            iconSize: [18, 18],
                            backgroundColor: customColor,
                            borderWidth: 3,
                            borderColor: '#0000ff'
                        };
                    
                    markerOptions = { icon: L.BeautifyIcon.icon(WALMARTstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(WALMARTstorePoints);
                }

                for (i in TARGET) {
                    var popup =
                        '<b>Dealer Name:</b> ' + TARGET[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + TARGET[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + TARGET[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + TARGET[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + TARGET[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + TARGET[i].CITY + ', ' + TARGET[i].STATE + ' ' + TARGET[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + TARGET[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + TARGET[i].OVERALL_RANK;

                    var loc = [TARGET[i].LATITUDE, TARGET[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = TARGET[i].WIRELESS_SCORE;                    

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var TARGETstoreTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#ff0000'
                    };
                                        
                    markerOptions = { icon: L.BeautifyIcon.icon(TARGETstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ARstorePoints.addLayer(marker);
                    marker.addTo(TARGETstorePoints);
                }

                for (i in BESTBUY) {
                    var popup =
                        '<b>Dealer Name:</b> ' + BESTBUY[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + BESTBUY[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + BESTBUY[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + BESTBUY[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + BESTBUY[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + BESTBUY[i].CITY + ', ' + BESTBUY[i].STATE + ' ' + BESTBUY[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + BESTBUY[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + BESTBUY[i].OVERALL_RANK;

                    var loc = [BESTBUY[i].LATITUDE, BESTBUY[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = BESTBUY[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var BESTBUYstoreTableoptions = {
                        //icon: 'store',
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#87cefa'
                    };

                    markerOptions = { icon: L.BeautifyIcon.icon(BESTBUYstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(BESTBUYstorePoints);
                }

                for (i in SAMSCLUB) {
                    var popup =
                        '<b>Dealer Name:</b> ' + SAMSCLUB[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + SAMSCLUB[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + SAMSCLUB[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + SAMSCLUB[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + SAMSCLUB[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + SAMSCLUB[i].CITY + ', ' + SAMSCLUB[i].STATE + ' ' + SAMSCLUB[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + SAMSCLUB[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + SAMSCLUB[i].OVERALL_RANK;

                    var loc = [SAMSCLUB[i].LATITUDE, SAMSCLUB[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = SAMSCLUB[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var SAMSCLUBstoreTableoptions = {
                        //icon: 'store',
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#076cab'
                    };

                    markerOptions = { icon: L.BeautifyIcon.icon(SAMSCLUBstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(SAMSCLUBstorePoints);
                }

                for (i in COSTCO) {
                    var popup =
                        '<b>Dealer Name:</b> ' + COSTCO[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + COSTCO[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + COSTCO[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + COSTCO[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + COSTCO[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + COSTCO[i].CITY + ', ' + COSTCO[i].STATE + ' ' + COSTCO[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + COSTCO[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + COSTCO[i].OVERALL_RANK;

                    var loc = [COSTCO[i].LATITUDE, COSTCO[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = COSTCO[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var COSTCOstoreTableoptions = {
                        //icon: 'store',
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#990000'
                    };

                    markerOptions = { icon: L.BeautifyIcon.icon(COSTCOstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(COSTCOstorePoints);
                }

                for (i in SMARTCIRCLE) {
                    var popup =
                        '<b>Dealer Name:</b> ' + SMARTCIRCLE[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + SMARTCIRCLE[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + SMARTCIRCLE[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + SMARTCIRCLE[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + SMARTCIRCLE[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + SMARTCIRCLE[i].CITY + ', ' + SMARTCIRCLE[i].STATE + ' ' + SMARTCIRCLE[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + SMARTCIRCLE[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + SMARTCIRCLE[i].OVERALL_RANK;

                    var loc = [SMARTCIRCLE[i].LATITUDE, SMARTCIRCLE[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = SMARTCIRCLE[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var SMARTCIRCLEstoreTableoptions = {
                        //icon: 'store',
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#032e49'
                    };

                    markerOptions = { icon: L.BeautifyIcon.icon(SMARTCIRCLEstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(SMARTCIRCLEstorePoints);
                }

                for (i in MICROSOFT) {
                    var popup =
                        '<b>Dealer Name:</b> ' + MICROSOFT[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + MICROSOFT[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + MICROSOFT[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + MICROSOFT[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + MICROSOFT[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + MICROSOFT[i].CITY + ', ' + MICROSOFT[i].STATE + ' ' + MICROSOFT[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + MICROSOFT[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + MICROSOFT[i].OVERALL_RANK;

                    var loc = [MICROSOFT[i].LATITUDE, MICROSOFT[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = MICROSOFT[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var MICROSOFTstoreTableoptions = {
                        //icon: 'store',
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#000000'
                    };

                    markerOptions = { icon: L.BeautifyIcon.icon(MICROSOFTstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(MICROSOFTstorePoints);
                }

                for (i in OTHERS) {
                    var popup =
                        '<b>Dealer Name:</b> ' + OTHERS[i].MASTER_DEALER_NAME +
                        '<br/><b>Store Number:</b> ' + OTHERS[i].STORE_NUMBER +
                        '<br/><b>Dealer Code:</b> ' + OTHERS[i].DEALER_CODE +
                        '<br/><b>Location ID:</b> ' + OTHERS[i].LOCATION_ID +
                        '<br/><b>Address:</b> ' + OTHERS[i].ADDRESS +
                        '<br/><b>City, State Zip:</b> ' + OTHERS[i].CITY + ', ' + OTHERS[i].STATE + ' ' + OTHERS[i].ZIP_CODE +
                        '<br/><b>Wireless Score:</b> ' + OTHERS[i].WIRELESS_SCORE;
                        //+ '<br/><b>Rank:</b> ' + OTHERS[i].OVERALL_RANK;

                    var loc = [OTHERS[i].LATITUDE, OTHERS[i].LONGITUDE];	//position found

                    var customColor = '#ffffff';
                    var wirelessscore = OTHERS[i].WIRELESS_SCORE;

                    if (wirelessscore === 5)
                        customColor = '#003300';
                    if (wirelessscore === 4)
                        customColor = '#008000';
                    if (wirelessscore === 3)
                        customColor = '#00cc00';
                    if (wirelessscore === 2)
                        customColor = '#ffff00';
                    else if (wirelessscore === 1)
                        customColor = '#e6b800';

                    var OTHERSstoreTableoptions = {
                        //icon: 'store',
                        iconShape: 'doughnut',
                        iconSize: [18, 18],
                        backgroundColor: customColor,
                        borderWidth: 3,
                        borderColor: '#808080'
                    };

                    markerOptions = { icon: L.BeautifyIcon.icon(OTHERSstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.95);
                    marker.bindPopup(popup);
                    //ATTRstorePoints.addLayer(marker);
                    marker.addTo(OTHERSstorePoints);
                }

                //console.log(VpgmData3);

                document.getElementById('mapcountwarning').innerHTML = "";
                document.getElementById('mapcounttitle').innerHTML = "National Retail - Store Wireless Scoring";
                document.getElementById('mapcountsubtitle').innerHTML = "";
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
                    zoom: 4,
                    minZoom: 3,
                    layers: [streets, WALMARTstorePoints, TARGETstorePoints, BESTBUYstorePoints, SAMSCLUBstorePoints, COSTCOstorePoints, SMARTCIRCLEstorePoints, MICROSOFTstorePoints, OTHERSstorePoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });

                mcg.addTo(map);

                map.on('zoomend', function () {
                    var currentZoom = map.getZoom();
                    console.log('current zoom level: ' + currentZoom)
                    var iconSize = [currentZoom * (8 / 2), currentZoom * (8 / 2)];
                    //var myRadius = currentZoom * (1 / 2); //or whatever ratio you prefer
                    //var myWeight = currentZoom * (1 / 5); //or whatever ratio you prefer
                    mcg.setStyle({ iconSize: iconSize });
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
                    return d === 'Walmart' ? "#0000ff" :
                        d === 'Target' ? "#ff0000" :
                            d === 'BestBuy' ? "#87cefa" :
                                d === 'Sams Club' ? "#076cab" :
                                    d === 'Costco' ? "#990000" :
                                        d === 'Smart Circle' ? "#032e49" :
                                            d === 'Microsoft' ? "#000000" :
                                                d === 'Others' ? "#808080" :
                                                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomleft' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'infolegend legend');
                    categories = ['Walmart', 'Target', 'BestBuy', 'Sams Club', 'Costco', 'Smart Circle', 'Microsoft', 'Others'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 3px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                var overlays = {
                    //"VPGM Region Borders": MarketBoundaryLayer,
                    //"CMA Overlay": vectorGridCMA,
                    "Walmart": WALMARTstorePoints,
                    "Target": TARGETstorePoints,
                    "BestBuy": BESTBUYstorePoints,
                    "Sams Club": SAMSCLUBstorePoints,
                    "Costco": COSTCOstorePoints,
                    "Smart Circle": SMARTCIRCLEstorePoints,
                    "Microsoft": MICROSOFTstorePoints,
                    "Others": OTHERSstorePoints
                };

                L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

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

            function addWALMARTLayer() {
                map.addLayer(WALMARTstorePoints);
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

                var ATTRstorePoints = new L.MarkerClusterGroup(clusterOptions);
                var ARstorePoints = new L.MarkerClusterGroup(clusterOptions);

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
                    markerOptions = { regions: [SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CITY, ZIP_CODE], icon: L.BeautifyIcon.icon(ARstoreTableoptions) };
                    marker = new L.Marker(new L.latLng(loc), markerOptions);
                    marker.setOpacity(.7);
                    marker.bindPopup(popup);
                    ARstorePoints.addLayer(marker);
                }

                document.getElementById('mapcountwarning').innerHTML = "";
                document.getElementById('mapcounttitle').innerHTML = "Current Fiber Sales Opportunity - " + market_long;
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


