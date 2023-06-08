<%@ Page Title="TESTING Sales Opportunity" Language="C#" MasterPageFile="~/MasterPageSalesTesting.master" AutoEventWireup="true" CodeFile="Sales_Opportunity_Testing.aspx.cs" Inherits="sales_Sales_Opportunity_Testing" %>

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
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.Default.css" rel="stylesheet" />
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

        .info h4 {
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


        .info2.legend {
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

        #buttonrowcenter {
            text-align: center;
        }

        .left {
            float: left;
        }

        .right {
            float: right;
        }
    </style>




    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
        <div class="subheader py-2 py-lg-4 subheader-solid" id="kt_subheader">
            <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                <!--begin::Info-->
                <div class="d-flex align-items-center flex-wrap mr-1">
                    <!--begin::Page Heading-->
                    <div class="d-flex align-items-baseline mr-5">
                        <!--begin::Page Title-->
                        <h5 class="text-dark font-weight-bold my-2 mr-5">Sales Opportunity</h5>
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
                                <a href="/sales/Sales_Opportunity_Testing.aspx" class="text-muted">Sales Opportunity</a>
                            </li>
                            <%--<li class="breadcrumb-item">
                                <a href="" class="text-muted">Scroller</a>
                            </li>--%>
                        </ul>
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
                        <div class="alert-text">
                            <div class="left" id="left_subs">
                                <h5 class="left">Date Of Data: &nbsp;</h5>
                                <h5 class="left" id="DATADATE"></h5>
                            </div>
                            <div class="right" id="right_subs">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                                </asp:ScriptManager>
                                <h5>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                                        <ContentTemplate>

                                            <asp:Label ID="labelGeo" runat="server" Text="Geography type: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                            <asp:DropDownList ID="ddlGeo" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlGeo_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:Label ID="labelMarket" runat="server" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                                            <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server" onchange="SubmitButtonClick();">
                                            </asp:DropDownList>

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
                                    <ul class="nav nav-tabs" role="tablist">
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

                                    </ul>

                                    <div class="tab-content">
                                        <div class="tab-pane active" id="m_tabs_1_1" role="tabpanel">
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-12" id="buttonrowcenter">
                                                                                                            
                                                        <button type="button" class="btn btn-primary0 btn-lg oneButton" onclick="turnLayer0ZipOn()">
                                                            <br>Clear All Highlights<br>
                                                            <br>
                                                            </button>
                                                        <button type="button" class="btn btn-primary1 btn-lg oneButton" onclick="turnLayer1ZipOn()">
                                                            No Fiber & Weak Wireless<br>
                                                            7 Zips<br>
                                                            1,231 Pops</button>
                                                        <button type="button" class="btn btn-primary2 btn-lg oneButton" onclick="turnLayer2ZipOn()">
                                                            Fiber & Weak Wireless<br>
                                                            2 Zips<br>
                                                            415 Pops</button>
                                                        <button type="button" class="btn btn-primary3 btn-lg oneButton" onclick="turnLayer3ZipOn()">
                                                            No Fiber & Strong Wireless<br>
                                                            150 Zips<br>
                                                            178,965 Pops</button>
                                                        <button type="button" class="btn btn-primary4 btn-lg oneButton" onclick="turnLayer4ZipOn()">
                                                            Fiber & Strong Wireless<br>
                                                            20 Zips<br>
                                                            5,784 Pops</button>
                                                    
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row">
                                                <div class="col-lg-1" id="Placeholder_tab1"></div>
                                                <div class="col-lg-10" id="Placeholder_tab2">
                                                    <div style="text-align: center; color: #343a40">
                                                        <h2 id="mapcounttitle"></h2>
                                                        <h5 id="mapcountsubtitle2"></h5>
                                                        <h4 id="mapcountsubtitle"></h4>
                                                        <h6 id="mapcountsubtitle3"></h6>
                                                    </div>                                                    
                                                    <div id="storemapdiv" style="height: 450px; text-align: left;"></div>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12" id="RecentDiv5_tab1">
                                                    <div class="row">
                                                        <div class="col-lg-1" id="Placeholder_tab3">
                                                        </div>
                                                        <div class="col-lg-10" id="RecentDiv6_tab1">

                                                            <div class="content d-flex flex-column flex-column-fluid" id="kt_content2">
                                                                <div class="d-flex flex-column-fluid">
                                                                    <div class="container">
                                                                        <div class="card card-custom">
                                                                            <div class="card-header">
                                                                                <div class="card-title">
                                                                                    <span class="card-icon">
                                                                                        <i class="flaticon2-percentage text-primary"></i>
                                                                                    </span>
                                                                                    <h3 class="card-label">Zip Code Network Information</h3>
                                                                                </div>
                                                                                <div class="card-toolbar">
                                                                                    <!--begin::Dropdown-->
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
                                                                                                <%--<li class="navi-item">
                                                                                                    <a href="#" class="navi-link">
                                                                                                        <span class="navi-icon">
                                                                                                            <i class="la la-print"></i>
                                                                                                        </span>
                                                                                                        <span class="navi-text">Print</span>
                                                                                                    </a>
                                                                                                </li>--%>
                                                                                                <%--<li class="navi-item">
                                                                                                    <a href="#" class="navi-link">
                                                                                                        <span class="navi-icon">
                                                                                                            <i class="la la-copy"></i>
                                                                                                        </span>
                                                                                                        <span class="navi-text">Copy</span>
                                                                                                    </a>
                                                                                                </li>--%>
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
                                                                                                <%--<li class="navi-item">
                                                                                                    <a href="#" class="navi-link">
                                                                                                        <span class="navi-icon">
                                                                                                            <i class="la la-file-pdf-o"></i>
                                                                                                        </span>
                                                                                                        <span class="navi-text">PDF</span>
                                                                                                    </a>
                                                                                                </li>--%>
                                                                                            </ul>
                                                                                            <!--end::Navigation-->
                                                                                        </div>
                                                                                        <!--end::Dropdown Menu-->
                                                                                    </div>
                                                                                    <!--end::Dropdown-->
                                                                                </div>
                                                                            </div>
                                                                            <div class="card-body">
                                                                                <!--begin: Datatable-->
                                                                                <table class="table compact" id="kt_datatable">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <th>Zip Code</th>
                                                                                            <th>Fiber Category</th>
                                                                                            <th>Wireless Category</th>
                                                                                            <th>Zip Pops</th>
                                                                                            <th>Pop Density</th>
                                                                                            <th>Network Quality Score</th>
                                                                                            <th>Voice Importance Score</th>
                                                                                            <th>Zip Sub Count</th>
                                                                                            <th>Voluntary Churn Count</th>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tfoot>
                                                                                        <tr>
                                                                                            <th>Zip Code</th>
                                                                                            <th>Fiber Category</th>
                                                                                            <th>Wireless Category</th>
                                                                                            <th>Zip Pops</th>
                                                                                            <th>Pop Density</th>
                                                                                            <th>Network Quality Score</th>
                                                                                            <th>Voice Importance Score</th>
                                                                                            <th>Zip Sub Count</th>
                                                                                            <th>Voluntary Churn Count</th>
                                                                                        </tr>
                                                                                    </tfoot>
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

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Sales_Opportunity_Testing.aspx/GetDATADATE",
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
                    url: "Sales_Opportunity_Testing.aspx/Get_Master_Data",  //use a function from C# , change this for different data return
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        data = JSON.parse(data.d);
                        KTDatatbles_Regular(data);
                    },
                    error: function (data, market, time, market_long) {
                    }
                })

            });

            function KTDatatbles_Regular(data) {
                //$('#kt_datatable').dataTable().fnDestroy(); //destroy old table
                ////$.fn.dataTable.moment('MM-DD-YYYY');
                //$('#kt_datatable').DataTable({ //build new table


                var table = $('#kt_datatable');
                console.log('KTDataTables begin');

                // begin first table
                table.DataTable({
                    //responsive: true,
                    data: data,
                    paging: false,
                    //deferRender: true,
                    scrollY: '350px',
                    scrollCollapse: true,
                    scrollX: true,
                    //scroller: true,
                    columns: [
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'FIBER' },
                        { 'data': 'WIRELESS' },
                        { 'data': 'ZIP_POPS' },
                        { 'data': 'POP_DENSITY' },
                        { 'data': 'NETWORK_QUALITY_SCORE' },
                        { 'data': 'VOICE_IMPORTANCE_SCORE' },
                        { 'data': 'ZIP_SUB_COUNT' },
                        { 'data': 'VOL_CHURN_COUNT' }
                    ],

                    "fnDrawCallback": function () {
                        $('#kt_datatable tr').find('td').each(function () {
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
                    },

                });

                $('#kt_datatable tbody').on('click', 'tr', function () {
                    var data = $('#kt_datatable').DataTable().row(this).data();
                    //console.log(data);
                    //alert('You clicked on ZIP CODE: ' + data.ZIP_CODE + '.');
                    //map.addLayer(VpgmLayer4);
                    map.setZoom(map.getZoom() + 1)
                    
                    //theTeam = data.ZIP_CODE;
                    //console.log(theTeam);
                    //map._layers_[73012].fire('click');
                    //var coords = map._layers[theTeam]._latlng;
                    //console.log(coords);
                    //map.setView(coords, 12);
                });

                console.log('KTDataTables end');

            };

            

            function loadDATADATE(data) {
                var score = JSON.parse(data.d);
                var value = score[0]["DATADATE"];
                document.getElementById('DATADATE').innerHTML = value;

                executedon = value.substring(6, 10) + '-' + value.substring(0, 2) + value.substring(2, 5);

                var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();

                SubmitButtonClick();

            }

            function SubmitButtonClick() {
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                console.log("SubmitButtonClick function: " + market);

                //check if anything has changed since last submitbuttonclick
                if (geoTypeStored == $('#<%= ddlGeo.ClientID %> option:selected').text()
                    && marketStored == $('#<%= ddlMarket.ClientID %> option:selected').text()) {
                    console.log('Button Click without Pulldown Change');
                }

                else {

                    var geo = $('#<%= ddlGeo.ClientID %> option:selected').text();
                    var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                    var market = $('#<%= ddlMarket.ClientID %> option:selected').val();

                    console.log("getFilterCriteria function: " + geo);
                    console.log("getFilterCriteria function: " + market_long);
                    console.log("getFilterCriteria function: " + market);

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

                    getFilterCriteria();

                }

            }

            //show and hide divs, kick off correct get data function
            function getFilterCriteria() {
                //Hide tabs
                //$('#Quad1_tab' + activeTabNumber).hide();
                //$('#Quad2_tab' + activeTabNumber).hide();
                //$('#Quad3_tab' + activeTabNumber).hide();
                //$('#Quad4_tab' + activeTabNumber).hide();
                //$('#Recent_Sales_Detail_tab' + activeTabNumber).hide();
                //$('#HideTaskProgressionChart2Button_tab' + activeTabNumber).hide();
                //$('#HidePCTableButton_tab' + activeTabNumber).hide();
                //$('#HideMapTableButton_tab' + activeTabNumber).hide();
                //$('#ProductionChartTable_tab' + activeTabNumber).hide();
                //$('#TaskProductionChart2_tab' + activeTabNumber).hide();
                //$('#NoData_tab' + activeTabNumber).hide();
                //$('#RYG_Modal_NoData').hide();
                //$('#RYG_Modal2_NoData').hide();

                //Show tabs
                //$('#LOADING_Quad1_tab' + activeTabNumber).show();
                //$('#LOADING_Quad2_tab' + activeTabNumber).show();
                //$('#LOADING_Quad3_tab' + activeTabNumber).show();
                //$('#LOADING_Quad4_tab' + activeTabNumber).show(); 

                    //trigger chain of functions to get data
                    Getmarketdata();
                               

            }

            function Getmarketdata() {  

                // if statement here
                //updateSalesOpportunityChart();
                updateSalesOpportunityChartMarket()
            }

            // ********** SALES OPPORTUNITY **********

            var recent_lat_index = 10; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var recent_long_index = 11; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat

            function updateSalesOpportunityChartMarket() {
                console.log('updateStoreChartMarket function start');

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
                    } if (marketGeo == 'OHIO / PENNSYLVANIA') {
                        marketGeo = 'OHIO PENNSYLVANIA'
                    }
                    else { marketGeo = marketGeo }
                }

                     $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_Testing.aspx/Get_Store_Detail_Market",  //use a function from C# , change this for different data return
                        data: JSON.stringify({ 'groupVariable': groupGeo, 'marketVariable': marketGeo }),
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            data = JSON.parse(data.d);
                            GET_MAP_THEME_DATA(data);
                        },
                        error: function (data) {
                        }
                    })

            }            

            function updateSalesOpportunityChart() {
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
                        url: "Sales_Opportunity_Testing.aspx/Get_Store_Detail",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_Testing.aspx/Get_Store_Detail2",  //use a function from C# , change this for different data return
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
                        url: "Sales_Opportunity_Testing.aspx/Get_Store_Detail3",  //use a function from C# , change this for different data return
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
                //    url: "Sales_Opportunity_Testing.aspx/Get_Master_Data",  //use a function from C# , change this for different data return
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

            }

            function dataConcat_3strings(data1, data2, data3) {
                var dataConcat3;

                data1 = data1.substring(0, data1.length - 1);
                data2 = data2.substring(1, data2.length - 1);
                data3 = data3.substring(1, data3.length);
                dataConcat3 = data1 + ',' + data2 + ',' + data3;
                loadStoreData(dataConcat3);
            }           

            function loadStoreData(data) {
                $('#LOADING_Recent2').hide();
                $('#storemapShow').show();

                console.log('loadStoreData function start')

                data = JSON.parse(data);

                if (data.length <= 0) {
                    return;
                }
                else {

                    $('#Store_Detail').dataTable().fnDestroy(); //destroy old table
                    //$.fn.dataTable.moment('MM-DD-YYYY');
                    $('#Store_Detail').DataTable({ //build new table
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
                        buttons: [{ extend: 'csv', title: 'Store_Detail_Export' }, { extend: 'excelHtml5', title: 'Store_Detail_Export' }, {
                            text: 'Update Map',
                            titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                            action: function (e, dt, node, config) {
                                GET_MAP_THEME_DATA();
                                //storeMap();
                            }
                        }],
                        //columnDefs: [{ visible: false, targets: 8 }],
                        columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                            { 'data': 'STORE_CATEGORY' },
                            { 'data': 'LOCATION_ID' },
                            { 'data': 'LOCATION_NAME' },
                            { 'data': 'MASTER_DEALER' },
                            { 'data': 'ADDRESS_1' },
                            { 'data': 'ADDRESS_2' },
                            { 'data': 'CITY' },
                            { 'data': 'STATE' },
                            { 'data': 'ZIP_CODE' },
                            { 'data': 'COUNTY' },
                            { 'data': 'LATITUDE' },
                            { 'data': 'LONGITUDE' },
                            { 'data': 'SALES_REGION' },
                            { 'data': 'SALES_VPGM_MARKET' }

                        ],


                        //Highlight rows that don't have lat longs in the detail table in Red
                        createdRow: function (row, data, index) {
                            if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                                $(row).addClass('highlightRed');
                            }
                        },

                        "fnDrawCallback": function () {
                            $('#Store_Detail tr').find('td').each(function () {
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

                GET_MAP_THEME_DATA(data);
            }

            function GET_MAP_THEME_DATA(storeData) {
                console.log('GET_MAP_THEME_DATA function start');
                var groupGeo = $('#<%= ddlGeo.ClientID %> option:selected').val();
                var marketGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var countyGeo;

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'GEORGIA / SOUTH CAROLINA') {
                        marketGeo = 'GEORGIA SOUTH CAROLINA'
                    } if (marketGeo == 'PR/VI') {
                        marketGeo = 'PR VI'
                    } if (marketGeo == 'NEW YORK / NEW JERSEY') {
                        marketGeo = 'NEW YORK NEW JERSEY'
                    } if (marketGeo == 'OHIO / PENNSYLVANIA') {
                        marketGeo = 'OHIO PENNSYLVANIA'
                    }
                    else { marketGeo = marketGeo }
                }
                console.log('marketGeo: ' + marketGeo);

                if (groupGeo == 'SALES') {
                    if (marketGeo == 'GREATER LAKES' | marketGeo == 'GULF STATES' | marketGeo == 'KAMO' | marketGeo == 'NORTHERN PLAINS' | marketGeo == 'NTX' | marketGeo == 'PR VI' | marketGeo == 'STX') {
                        countyGeo = 'CENTRAL'
                    } else if (marketGeo == 'DESERT SOUTHWEST' | marketGeo == 'NORTHERN CALIFORNIA' | marketGeo == 'PACIFIC STATES' | marketGeo == 'ROCKY MOUNTAIN' | marketGeo == 'SOUTHERN CALIFORNIA') {
                        countyGeo = 'WEST'
                    } else { countyGeo = 'EAST' }
                }
                console.log('countyGeo: ' + countyGeo);

                $.when(

                    $.ajax({
                        type: "POST",
                        async: true,
                        url: "Sales_Opportunity_Testing.aspx/Get_zip_theme_data",  //use a function from C# , change this for different data return
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

                    $.getJSON("SalesGeo/CMA_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                        VpgmData3 = data;
                    }),

                    $.getJSON("SalesVpgmCounties/" + countyGeo + "_COUNTY_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                        VpgmData2 = data;
                    }),

                    console.log('GEOJSON function check1'),

                    $.getJSON("SalesVpgmZips/" + marketGeo + "_ZIP_GEOJSON_MAPSHAPER_2_FME_042820.json", function (data) {
                        VpgmData = data;
                    }),

                    console.log('GEOJSON function check2'),

                    $.getJSON("SalesGeo/VPGM_Markets_geojson_042720_FME.json", function (data) {
                        MarketBoundaryData = data;
                        //prep(MarketBoundaryData);
                    }),

                    //$.getJSON("SalesVpgmZips/ALL_ZIP_052020_geojson_FME.json", function (data) {
                    //    VpgmData = data;
                    //})                    

                ).then(function () {

                    console.log('GET_MAP_THEME_DATA function check1');

                    VpgmData.features.forEach(function (element) {
                        theme_data.find(function (newElement) {
                            if (element.properties.ZIP == newElement.ZIP_CODE) {
                                element.properties.ZIP_POPS = newElement.ZIP_POPS;

                            }
                        });
                    });

                    console.log('GET_MAP_THEME_DATA function check2');

                    //storeMap(VpgmData, theme_data);
                    
                    storeMapV3(VpgmData, storeData, VpgmData2, VpgmData3, MarketBoundaryData);
                });
                

            }

            //var map;
            var VpgmLayer;
            var VpgmCounty;
            var VpgmCMA;

            var storeMapV2 = function (VpgmData, storeData, VpgmData2, VpgmData3) {

                //console.log('vpgmdata' + JSON.stringify(VpgmData));

                //var table = $('#zip_table');
                //console.log('KTDataTables begin');

                // begin first table
                $('#zip_table').DataTable({
                    ajax: {
                        url: 'SalesVpgmZips/KAMO_ZIP_GEOJSON_MAPSHAPER_2_FME_042820.json',
                        dataSrc: 'features'
                    },
                    columns: [                        
                        { data: 'properties.ZIP' }
                    ]
                });

                //var table = $('#zip_table').DataTable();

                ////$('#zip_table').on('click', 'tbody td', function () {
                ////    var idx = table.cell(this).index().column;
                ////console.log('idx: ' + idx);
                ////    alert('Data source: ' + table.column(idx).dataSrc());
                ////});

                //$('#zip_table tbody').on('click', 'tr', function () {
                //    var data = $('#zip_table').DataTable().row(this).data();
                //    console.log('data: ' + data);
                //    alert('You clicked on ZIP CODE: ' + properties.ZIP + '.');
                //    //map.addLayer(VpgmLayer4);
                //    map.setZoom(map.getZoom() + 1)

                //    //theTeam = data.ZIP;
                //    //console.log(theTeam);
                //    //map._layers_[theTeam].fire('click');
                //    //var coords = map._layers[theTeam]._latlng;
                //    //console.log(coords);
                //    //map.setView(coords, 12);
                //});

                console.log('storeMapV2 function start');

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
                        '<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found   
                        ATTRstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#008000'
                        };

                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                    marker.setOpacity(.6);
                    marker.bindPopup(popup);
                    ATTRstorePoints.addLayer(marker);
                }

                for (i in AR) {
                    var popup =
                        '<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                        ARstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#002280'
                        };
                    marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                    marker.setOpacity(.6);
                    marker.bindPopup(popup);
                    ARstorePoints.addLayer(marker);
                }

                $('#LOADING_Quad3_tab1').hide();
                $('#Quad3_tab1').show();

                $(window).resize();

                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

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
                    "Satellite": sat
                    //"Topo": topo
                };

                

                map = L.map("storemapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, ATTRstorePoints, ARstorePoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });                
                
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

                function getColor0(d) {
                    return d > 5000 ? '#b3ffb3' :
                        d > 4000 ? '#b3d9ff' :
                            d > 3000 ? '#e7f5fe' :
                                d > 1000 ? '#ffe6cc' :
                                    '#ffe6cc';
                }

                function getColor1(d) {
                    return d > 5000 ? '#b3ffb3' :
                        d > 4000 ? '#b3d9ff' :
                            d > 3000 ? '#e7f5fe' :
                                d > 1000 ? '#ff9933' :
                                    '#ff9933';
                }

                function getColor2(d) {
                    return d > 5000 ? '#b3ffb3' :
                        d > 4000 ? '#b3d9ff' :
                            d > 3000 ? '#87cefa' :
                                d > 1000 ? '#ffe6cc' :
                                    '#ffe6cc';
                }

                function getColor3(d) {
                    return d > 5000 ? '#b3ffb3' :
                        d > 4000 ? '#4da6ff' :
                            d > 3000 ? '#e7f5fe' :
                                d > 1000 ? '#ffe6cc' :
                                    '#ffe6cc';
                }

                function getColor4(d) {
                    return d > 5000 ? '#009900' :
                        d > 4000 ? '#b3d9ff' :
                            d > 3000 ? '#e7f5fe' :
                                d > 1000 ? '#ffe6cc' :
                                    '#ffe6cc';
                }

                function style0(feature) {
                    return {
                        fillColor: getColor0(feature.properties.ZIP_POPS),
                        fillOpacity: 0.7,
                        //color: "#ff7800",
                        weight: 2,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function style1(feature) {
                    return {
                        fillColor: getColor1(feature.properties.ZIP_POPS),
                        fillOpacity: 0.7,
                        //color: "#ff7800",
                        weight: 2,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function style2(feature) {
                    return {
                        fillColor: getColor2(feature.properties.ZIP_POPS),
                        fillOpacity: 0.7,
                        //color: "#ff7800",
                        weight: 2,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function style3(feature) {
                    return {
                        fillColor: getColor3(feature.properties.ZIP_POPS),
                        fillOpacity: 0.7,
                        //color: "#ff7800",
                        weight: 2,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function style4(feature) {
                    return {
                        fillColor: getColor4(feature.properties.ZIP_POPS),
                        fillOpacity: 0.7,
                        //color: "#ff7800",
                        weight: 2,
                        opacity: 0.5,
                        //fill: false
                    };
                }

                function highlightFeature(e) {
                    var layer = e.target;

                    layer.setStyle({
                        weight: 5,
                        color: '#008000',
                        dashArray: '',
                        fillOpacity: 0.7
                    });

                    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                        layer.bringToFront();
                    }

                    info.update(layer.feature.properties);
                }

                function resetHighlight(e) {
                    VpgmLayer.resetStyle(e.target);
                    info.update();
                }

                function resetHighlight1(e) {
                    VpgmLayer1.resetStyle(e.target);
                    info.update();
                }

                function resetHighlight2(e) {
                    VpgmLayer2.resetStyle(e.target);
                    info.update();
                }

                function resetHighlight3(e) {
                    VpgmLayer3.resetStyle(e.target);
                    info.update();
                }

                function resetHighlight4(e) {
                    VpgmLayer4.resetStyle(e.target);
                    info.update();
                }

                function zoomToFeature(e) {
                    map.fitBounds(e.target.getBounds());
                }

                function onEachFeature(feature, layer) {
                    layer.bindPopup(feature.properties.ZIP);
                    layer.on({
                        mouseover: highlightFeature,
                        mouseout: resetHighlight,
                        click: zoomToFeature
                    });
                }

                function onEachFeature1(feature, layer) {
                    layer.bindPopup(feature.properties.ZIP);
                    layer.on({
                        mouseover: highlightFeature,
                        mouseout: resetHighlight1,
                        click: zoomToFeature
                    });
                }

                function onEachFeature2(feature, layer) {
                    layer.bindPopup(feature.properties.ZIP);
                    layer.on({
                        mouseover: highlightFeature,
                        mouseout: resetHighlight2,
                        click: zoomToFeature
                    });
                }

                function onEachFeature3(feature, layer) {
                    layer.bindPopup(feature.properties.ZIP);
                    layer.on({
                        mouseover: highlightFeature,
                        mouseout: resetHighlight3,
                        click: zoomToFeature
                    });
                }

                function onEachFeature4(feature, layer) {
                    layer.bindPopup(feature.properties.ZIP);
                    layer.on({
                        mouseover: highlightFeature,
                        mouseout: resetHighlight4,
                        click: zoomToFeature
                    });
                }                

                VpgmLayer = L.geoJSON(VpgmData, {
                    onEachFeature: onEachFeature,
                    style: style0
                }).addTo(map);

                VpgmLayer1 = L.geoJSON(VpgmData, {
                    onEachFeature: onEachFeature1,
                    style: style1
                }).addTo(map);

                VpgmLayer2 = L.geoJSON(VpgmData, {
                    onEachFeature: onEachFeature2,
                    style: style2
                }).addTo(map);

                VpgmLayer3 = L.geoJSON(VpgmData, {
                    onEachFeature: onEachFeature3,
                    style: style3
                }).addTo(map);

                VpgmLayer4 = L.geoJSON(VpgmData, {
                    onEachFeature: onEachFeature4,
                    style: style4
                }).addTo(map);

                VpgmCounty = L.geoJSON(VpgmData2, {
                    onEachFeature: onEachFeature,
                    style: style0
                }).addTo(map);

                VpgmCMA = L.geoJSON(VpgmData3, {
                    onEachFeature: onEachFeature,
                    style: style0
                }).addTo(map);

                map.fitBounds(VpgmLayer.getBounds());

                // add the search bar to the map
                var searchControl = new L.Control.Search({
                    //container: 'findbox',
                    collapsed: true,
                    autoCollapse: true,
                    position: 'topleft',
                    layer: VpgmLayer,
                    propertyName: 'ZIP',
                    marker: false,
                    moveToLocation: function (latlng, title, map) {
                        //map.fitBounds( latlng.layer.getBounds() );
                        var zoom = map.getBoundsZoom(latlng.layer.getBounds());
                        map.setView(latlng, zoom); // access the zoom
                    },
                    textPlaceholder: 'search...' // placeholder while nothing is searched
                });

                searchControl.on('search:locationfound', function (e) {
                    
                    //console.log('search:locationfound', );

                    //map.removeLayer(this._markerSearch)

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

                    VpgmLayer.eachLayer(function (layer) {	//restore feature color
                        VpgmLayer.resetStyle(layer);
                    });
                });

                map.on('zoomend', function () {
                    var zoomlevel = map.getZoom();
                    if (zoomlevel < 5) {
                        if (map.hasLayer(VpgmCounty)) {
                            map.removeLayer(VpgmLayer);
                            map.removeLayer(VpgmCounty);
                            map.addLayer(VpgmCMA);
                        } else {
                            console.log("no point layer active");
                        }
                        //if (map.hasLayer(VpgmLayer1)) {
                        //    map.removeLayer(VpgmLayer1);
                        //    map.addLayer(VpgmCounty);
                        //} else {
                        //    console.log("no point layer active");
                        //}
                        //if (map.hasLayer(VpgmLayer2)) {
                        //    map.removeLayer(VpgmLayer2);
                        //    map.addLayer(VpgmCounty);
                        //} else {
                        //    console.log("no point layer active");
                        //}
                    }
                    if (zoomlevel >= 5 & zoomlevel < 6 ) {
                        if (map.hasLayer(VpgmLayer)) {                            
                            map.removeLayer(VpgmLayer);
                            map.removeLayer(VpgmCMA);
                            map.addLayer(VpgmCounty);
                        } else {
                            console.log("no point layer active");
                        }
                        if (map.hasLayer(VpgmCMA)) {
                            map.removeLayer(VpgmLayer);
                            map.removeLayer(VpgmCMA);
                            map.addLayer(VpgmCounty);
                        } else {
                            console.log("no point layer active");
                        }
                        //if (map.hasLayer(VpgmLayer1)) {
                        //    map.removeLayer(VpgmLayer1);
                        //    map.addLayer(VpgmCounty);
                        //} else {
                        //    console.log("no point layer active");
                        //}
                        //if (map.hasLayer(VpgmLayer2)) {
                        //    map.removeLayer(VpgmLayer2);
                        //    map.addLayer(VpgmCounty);
                        //} else {
                        //    console.log("no point layer active");
                        //}
                    }
                    if (zoomlevel >= 6) {
                        if (map.hasLayer(VpgmLayer)) {
                            console.log("layer already added");
                        } else {
                            map.removeLayer(VpgmCounty);
                            map.removeLayer(VpgmCMA);
                            map.addLayer(VpgmLayer);
                        }
                        if (map.hasLayer(VpgmCounty)) {
                            console.log("layer already added");
                        } else {
                            map.removeLayer(VpgmCounty);
                            map.removeLayer(VpgmCMA);
                            map.addLayer(VpgmLayer);
                        }
                        //if (map.hasLayer(VpgmLayer1)) {
                        //    console.log("layer already added");
                        //} else {
                        //    map.removeLayer(VpgmCounty);
                        //    map.addLayer(VpgmLayer1);
                        //}
                        //if (map.hasLayer(VpgmLayer2)) {
                        //    console.log("layer already added");
                        //} else {
                        //    map.removeLayer(VpgmCounty);
                        //    map.addLayer(VpgmLayer2);
                        //}
                    }
                    console.log("Current Zoom Level =" + zoomlevel)
                });

                var options = {
                    modal: true,
                    position: 'topleft',
                    title: "Box area zoom"
                };

                var control = L.control.zoomBox(options);

                map.addControl(control);


                map.addControl(searchControl); // add it to the map

                

                L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                //var overlays = {
                //    "Zip Code Borders": VpgmLayer,
                //    "Highlight Layer 1": VpgmLayer1,
                //    "Highlight Layer 2": VpgmLayer2,
                //    "Highlight Layer 3": VpgmLayer3,
                //    "Highlight Layer 4": VpgmLayer4,
                //    "AT&T Retail Store": ATTRstorePoints,
                //    "Authorized Reseller Store": ARstorePoints
                //};

                var groupedOverlays = {                    
                    //"Layers": {
                    //    "CMA Overview": VpgmCMA,
                    //    "County Overview": VpgmCounty,
                    //    "Zip Code Overview": VpgmLayer,
                    //    "No Fiber & Weak Wireless": VpgmLayer1,
                    //    "Fiber & Weak Wireless": VpgmLayer2,
                    //    "No Fiber & Strong Wireless": VpgmLayer3,
                    //    "Fiber & Strong Wireless": VpgmLayer4
                    //},                    
                    "Stores": {
                        "AT&T Retail Store": ATTRstorePoints,
                        "Authorized Reseller Store": ARstorePoints
                    }
                };

                var groupOptions = {
                    // Make the "Zip Layers" group exclusive (use radio inputs)
                    //exclusiveGroups: ["Layers"],
                    // Show a checkbox next to non-exclusive group labels for toggling all
                    groupCheckboxes: false,
                    collapsed: false
                };

                //L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

                var layerscontrol = L.control.groupedLayers(baseLayers, groupedOverlays, groupOptions).addTo(map);

                L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }).addTo(map);

                //map.invalidateSize();
                //map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                info.addTo(map);

                function getColor(d) {
                    return d === 'AT&T Retail Store' ? "#008000" :
                        d === 'Authorized Reseller Store' ? "#002280" :
                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomright' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'info2 legend');
                    categories = ['AT&T Retail Store', 'Authorized Reseller Store'];

                    for (var i = 0; i < categories.length; i++) {
                        div.innerHTML +=
                            '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                            (categories[i] ? categories[i] + '<br>' : '+');
                    }

                    return div;
                };

                legend.addTo(map);

                turnLayer0On();

            }

            var map;
            var vectorGridZip0;
            var vectorGridZip1;
            var vectorGridZip2;
            var vectorGridZip3;
            var vectorGridZip4;
            var vectorGridCounty;
            var vectorGridCMA;

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
                        '<b>Store Category:</b> ' + ATTR[i].STORE_CATEGORY +
                        '<br/><b>Location ID:</b> ' + ATTR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + ATTR[i].LOCATION_NAME,

                        loc = [ATTR[i].LATITUDE, ATTR[i].LONGITUDE],	//position found   
                        ATTRstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#008000'
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
                        '<b>Store Category:</b> ' + AR[i].STORE_CATEGORY +
                        '<br/><b>Location ID:</b> ' + AR[i].LOCATION_ID +
                        '<br/><b>Location Name:</b> ' + AR[i].LOCATION_NAME,

                        loc = [AR[i].LATITUDE, AR[i].LONGITUDE],	//position found
                        ARstoreTableoptions = {
                            iconShape: 'doughnut',
                            iconSize: [12, 12],
                            borderWidth: 4,
                            borderColor: '#002280'
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
                

                document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

                var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
                    id: 'osm.grayscale',
                    maxZoom: 18,
                    zIndex: 1,
                    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                    subdomains: ['a', 'b', 'c']
                }),
                    topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                    "<span style='color: gray'>Grayscale</span>": grayscale,
                    "Satellite": sat
                    //"Topo": topo
                };

                map = L.map("storemapid", {
                    attributionControl: false,
                    preferCanvas: true,
                    center: [39.73, -104.99],
                    zoom: 10,
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

                if (L.Browser.touch) {
                    L.control.touchHover().addTo(map);
                }

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
                                        p > 3000 ? '#e7f5fe' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffe6cc',
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
                    //        //        p > 3000 ? '#e7f5fe' :
                    //        //            p > 1000 ? '#ffe6cc' :
                    //        //                '#ffe6cc',
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
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#e7f5fe' :
                                            p > 1000 ? '#ff9933' :
                                                '#ff9933',
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

                        clearHighlight1();
                        highlight1 = properties.ZIP;

                        var p = properties.ZIP_POPS;
                        var style = {
                            fillColor: p > 5000 ? '#b3ffb3' :
                                p > 4000 ? '#b3d9ff' :
                                    p > 3000 ? '#e7f5fe' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffe6cc',
                            fillOpacity: 0.5,
                            fillOpacity: 1,
                            stroke: true,
                            fill: true,
                            color: 'red',
                            opacity: 1,
                            weight: 4,
                        };

                        info.update(properties);

                        vectorGridZip1.setFeatureStyle(properties.ZIP, style);
                    })
                    .on('click', function (e) {
                        zoomToFeature(e.layer.properties);

                    })

                    .addTo(map);

                vectorGridZip2 = L.vectorGrid.slicer(VpgmData, {
                    rendererFactory: L.canvas.tile,
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#87cefa' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffe6cc',
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
                                    p > 3000 ? '#e7f5fe' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffe6cc',
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
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#4da6ff' :
                                        p > 3000 ? '#e7f5fe' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffe6cc',
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
                                    p > 3000 ? '#e7f5fe' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffe6cc',
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
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#009900' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#e7f5fe' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffe6cc',
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
                                    p > 3000 ? '#e7f5fe' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffe6cc',
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
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#e7f5fe' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffe6cc',
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
                                    p > 3000 ? '#e7f5fe' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffe6cc',
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
                    vectorTileLayerStyles: {
                        sliced: function (properties, zoom) {
                            var p = properties.ZIP_POPS;
                            return {
                                fillColor: p > 5000 ? '#b3ffb3' :
                                    p > 4000 ? '#b3d9ff' :
                                        p > 3000 ? '#e7f5fe' :
                                            p > 1000 ? '#ffe6cc' :
                                                '#ffe6cc',
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
                                    p > 3000 ? '#e7f5fe' :
                                        p > 1000 ? '#ffe6cc' :
                                            '#ffe6cc',
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

                /////////////////////////////

                function highlightFeature(e) {
                    this.openPopup( closeButton: false);
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
                    layer.on({
                        mouseover: highlightFeature,
                        mouseout: resetHighlight,
                        click: zoomToFeature
                    });
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
                    return d === 'AT&T Retail Store' ? "#008000" :
                        d === 'Authorized Reseller Store' ? "#002280" :
                            "#ff7f00";
                }

                var legend = L.control({ position: 'bottomright' });

                legend.onAdd = function (map) {

                    var div = L.DomUtil.create('div', 'info2 legend');
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

            function storeMap(VpgmData, theme_data) {

                console.log('storeMap function start');

                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();

                           var recent_lat_index = 10; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
                           var recent_long_index = 11; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat

                           console.log(VpgmData);
                           console.log(theme_data);
                           var recentSelectedCount = $("#Store_Detail").get(0).lastChild.childElementCount;
                           console.log('recentSelectedCount: ' + recentSelectedCount);
                           var recentDetailColCount = $("#Store_Detail").get(0).lastChild.childNodes[0].childElementCount;
                           console.log('recentDetailColCount: ' + recentDetailColCount);

                           var j = 0;
                           var i = 0;

                           //console.log(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

                           //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
                           var maxlat = parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
                           var minlat = parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
                           var maxlong = parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
                           var minlong = parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

                           if (isNaN(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
                               maxlat = 48;
                               minlat = 25;
                               maxlong = -66;
                               minlong = -125;
                           }

                           var recentFilteredTable = [];
                           var ARstoreTable = [];
                           var ATTRstoreTable = [];
                           var ARstoreindex = 0;
                           var ATTRstoreindex = 0;
                           var concatlatlong = [];
                           var NaNcount = 0;
                           var NaNcountMessage = '';

                           //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
                           for (i = 0; i < recentSelectedCount; i++) {
                               recentFilteredTable[i] = [];
                               ARstoreTable[ARstoreindex] = [];
                               ATTRstoreTable[ATTRstoreindex] = [];
                               concatlatlong[i] = $("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                               if (isNaN(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                                   //dont adjust max min based on NaN
                                   NaNcount++;
                               }

                               else {
                                   maxlat = Math.max(maxlat, parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                                   minlat = Math.min(minlat, parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                                   maxlong = Math.max(maxlong, parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                                   minlong = Math.min(minlong, parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                               }


                               for (j = 0; j < recentDetailColCount; j++) {
                                   //console.log($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                                   recentFilteredTable[i][j] = $("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                               }

                               //console.log(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));

                               if (isNaN(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                                   //dont map if lat or long is NaN
                                   ;
                               }

                               //else if ($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                               else if ($("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == 'ATTR') {

                                   for (k = 0; k < recentDetailColCount; k++) {
                                       ATTRstoreTable[ATTRstoreindex][k] = $("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                                       //console.log('ATTRstoreTable' + $("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML)
                                   }

                                   ATTRstoreindex++;
                               }
                               else {

                                   for (l = 0; l < recentDetailColCount; l++) {
                                       ARstoreTable[ARstoreindex][l] = $("#Store_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                                   }

                                   ARstoreindex++;
                               }

                           }

                           //check to see if an empty row exists in the last row of the table and remove it if so
                           if (ARstoreTable[ARstoreTable.length - 1].length == 0) {
                               ARstoreTable.splice(-1, 1);
                           }

                           if (ATTRstoreTable[ATTRstoreTable.length - 1].length == 0) {
                               ATTRstoreTable.splice(-1, 1);
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

                           document.getElementById('mapcounttitle').innerHTML = market_long + " - Zip Code Map & Store Locations";
                           //document.getElementById('mapcountsubtitle').innerHTML = 'Recently Completed Count: ' + ATTRstoreTable.length + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Upcoming Forecasted Count: " + ARstoreTable.length;
                           //document.getElementById('mapcountsubtitle2').innerHTML = 'Last 90 days on air / +45 days forecasted';
                           //document.getElementById('mapcountsubtitle3').innerHTML = 'Recently Completed (' + DATE1 + ' to ' + DATE2 + ') and Upcoming Forecasted (' + DATE3 + ' to ' + DATE4 + ')';

                           //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;

                           var ATTRstorePoints = new L.layerGroup();
                           var ARstorePoints = new L.layerGroup();
                           for (i in ATTRstoreTable) {

                               /*
                               var title = OA[i].PACE_NAME,  //value searched                
                   
                                       */
                               var popup =
                                   '<b>Store Category:</b> ' + ATTRstoreTable[i][0] +
                                   '<br/><b>Location ID:</b> ' + ATTRstoreTable[i][1] +
                                   '<br/><b>Location Name:</b> ' + ATTRstoreTable[i][2],


                                   loc = [parseFloat(ATTRstoreTable[i][recent_lat_index]), parseFloat(ATTRstoreTable[i][recent_long_index])],	//position found
                                   ATTRstoreTableoptions = {
                                       iconShape: 'doughnut',
                                       iconSize: [12, 12],
                                       borderWidth: 4,
                                       borderColor: '#008000'
                                   };

                               marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ATTRstoreTableoptions) });
                               marker.setOpacity(.6);
                               marker.bindPopup(popup);
                               ATTRstorePoints.addLayer(marker);
                           }

                           for (i = 0; i < ARstoreTable.length; i++) {

                               popup =
                                   '<b>Store Category:</b> ' + ARstoreTable[i][0] +
                                   '<br/><b>Location ID:</b> ' + ARstoreTable[i][1] +
                                   '<br/><b>Location Name:</b> ' + ARstoreTable[i][2],

                                   loc = [parseFloat(ARstoreTable[i][recent_lat_index]), parseFloat(ARstoreTable[i][recent_long_index])],	//position found
                                   ARstoreTableoptions = {
                                       iconShape: 'doughnut',
                                       iconSize: [12, 12],
                                       borderWidth: 4,
                                       borderColor: '#002280'
                                   };
                               marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(ARstoreTableoptions) });
                               marker.setOpacity(.6);
                               marker.bindPopup(popup);
                               ARstorePoints.addLayer(marker);
                           }

                           $('#LOADING_Quad3_tab1').hide();
                           $('#Quad3_tab1').show();

                           $(window).resize();

                           document.getElementById('storemapdiv').innerHTML = "<div id='storemapid' style='height: 450px;'></div>";

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
                               "Satellite": sat
                               //"Topo": topo
                           };

                           map = L.map("storemapid", {
                               attributionControl: false,
                               center: [39.73, -104.99],
                               zoom: 10,
                               layers: [streets, ATTRstorePoints, ARstorePoints],
                               fullscreenControl: true,
                               fullscreenControlOptions: {
                                   position: 'topleft'
                               }
                           });

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
                                   '<b>Zip Code: ' + props.ZIP + '</b><br />' + props.ZIP_POPS + ' people'
                                   : 'Hover over a zip code');
                           };

                           function getColor2(d) {
                               return d > 5000 ? '#b3ffb3' :
                                   d > 4000 ? '#b3d9ff' :
                                       d > 3000 ? '#e7f5fe' :
                                           d > 1000 ? '#ffe6cc' :
                                               '#ffe6cc';
                           }

                           function getColor11(d) {
                               return d > 5000 ? '#b3ffb3' :
                                   d > 4000 ? '#b3d9ff' :
                                       d > 3000 ? '#e7f5fe' :
                                           d > 1000 ? '#ff9933' :
                                               '#ff9933';
                           }

                           function getColor12(d) {
                               return d > 5000 ? '#b3ffb3' :
                                   d > 4000 ? '#b3d9ff' :
                                       d > 3000 ? '#87cefa' :
                                           d > 1000 ? '#ffe6cc' :
                                               '#ffe6cc';
                           }

                           function getColor13(d) {
                               return d > 5000 ? '#b3ffb3' :
                                   d > 4000 ? '#4da6ff' :
                                       d > 3000 ? '#e7f5fe' :
                                           d > 1000 ? '#ffe6cc' :
                                               '#ffe6cc';
                           }

                           function getColor14(d) {
                               return d > 5000 ? '#009900' :
                                   d > 4000 ? '#b3d9ff' :
                                       d > 3000 ? '#e7f5fe' :
                                           d > 1000 ? '#ffe6cc' :
                                               '#ffe6cc';
                           }


                           function style(feature) {
                               return {
                                   fillColor: getColor2(feature.properties.ZIP_POPS),
                                   fillOpacity: 0.7,
                                   //color: "#ff7800",
                                   weight: 2,
                                   opacity: 0.5,
                                   //fill: false
                               };
                           }

                           function style1(feature) {
                               return {
                                   fillColor: getColor11(feature.properties.ZIP_POPS),
                                   fillOpacity: 0.7,
                                   //color: "#ff7800",
                                   weight: 2,
                                   opacity: 0.5,
                                   //fill: false
                               };
                           }

                           function style2(feature) {
                               return {
                                   fillColor: getColor12(feature.properties.ZIP_POPS),
                                   fillOpacity: 0.7,
                                   //color: "#ff7800",
                                   weight: 2,
                                   opacity: 0.5,
                                   //fill: false
                               };
                           }

                           function style3(feature) {
                               return {
                                   fillColor: getColor13(feature.properties.ZIP_POPS),
                                   fillOpacity: 0.7,
                                   //color: "#ff7800",
                                   weight: 2,
                                   opacity: 0.5,
                                   //fill: false
                               };
                           }

                           function style4(feature) {
                               return {
                                   fillColor: getColor14(feature.properties.ZIP_POPS),
                                   fillOpacity: 0.7,
                                   //color: "#ff7800",
                                   weight: 2,
                                   opacity: 0.5,
                                   //fill: false
                               };
                           }

                           function highlightFeature(e) {
                               var layer = e.target;

                               layer.setStyle({
                                   weight: 5,
                                   color: '#008000',
                                   dashArray: '',
                                   fillOpacity: 0.7
                               });

                               if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
                                   layer.bringToFront();
                               }

                               info.update(layer.feature.properties);
                           }



                           function resetHighlight(e) {
                               VpgmLayer.resetStyle(e.target);
                               info.update();
                           }

                           function resetHighlight1(e) {
                               VpgmLayer1.resetStyle(e.target);
                               info.update();
                           }

                           function resetHighlight2(e) {
                               VpgmLayer2.resetStyle(e.target);
                               info.update();
                           }

                           function resetHighlight3(e) {
                               VpgmLayer3.resetStyle(e.target);
                               info.update();
                           }

                           function resetHighlight4(e) {
                               VpgmLayer4.resetStyle(e.target);
                               info.update();
                           }

                           function zoomToFeature(e) {
                               map.fitBounds(e.target.getBounds());
                               console.log('target' + e.target);
                           }

                           function onEachFeature(feature, layer) {
                               layer.bindPopup(feature.properties.ZIP);
                               layer.on({
                                   mouseover: highlightFeature,
                                   mouseout: resetHighlight,
                                   click: zoomToFeature
                               });
                           }


                           function onEachFeature1(feature, layer) {
                               layer.bindPopup(feature.properties.ZIP);
                               layer.on({
                                   mouseover: highlightFeature,
                                   mouseout: resetHighlight1,
                                   click: zoomToFeature
                               });
                           }

                           function onEachFeature2(feature, layer) {
                               layer.bindPopup(feature.properties.ZIP);
                               layer.on({
                                   mouseover: highlightFeature,
                                   mouseout: resetHighlight2,
                                   click: zoomToFeature
                               });
                           }

                           function onEachFeature3(feature, layer) {
                               layer.bindPopup(feature.properties.ZIP);
                               layer.on({
                                   mouseover: highlightFeature,
                                   mouseout: resetHighlight3,
                                   click: zoomToFeature
                               });
                           }

                           function onEachFeature4(feature, layer) {
                               layer.bindPopup(feature.properties.ZIP);
                               layer.on({
                                   mouseover: highlightFeature,
                                   mouseout: resetHighlight4,
                                   click: zoomToFeature
                               });
                           }

                           VpgmLayer = L.geoJSON(VpgmData, {
                               onEachFeature: onEachFeature,
                               style: style
                           }).addTo(map);

                           VpgmLayer1 = L.geoJSON(VpgmData, {
                               onEachFeature: onEachFeature1,
                               style: style1
                           }).addTo(map);

                           VpgmLayer2 = L.geoJSON(VpgmData, {
                               onEachFeature: onEachFeature2,
                               style: style2
                           }).addTo(map);

                           VpgmLayer3 = L.geoJSON(VpgmData, {
                               onEachFeature: onEachFeature3,
                               style: style3
                           }).addTo(map);

                           VpgmLayer4 = L.geoJSON(VpgmData, {
                               onEachFeature: onEachFeature4,
                               style: style4
                           }).addTo(map);

                           var options = {
                               modal: true,
                               position: 'topleft',
                               title: "Box area zoom"
                           };
                           var control = L.control.zoomBox(options);

                           map.addControl(control);

                           L.control.scale({ metric: false, position: 'bottomright' }).addTo(map);

                           //var overlays = {
                           //    "Zip Code Borders": VpgmLayer,
                           //    "Highlight Layer 1": VpgmLayer1,
                           //    "Highlight Layer 2": VpgmLayer2,
                           //    "Highlight Layer 3": VpgmLayer3,
                           //    "Highlight Layer 4": VpgmLayer4,
                           //    "AT&T Retail Store": ATTRstorePoints,
                           //    "Authorized Reseller Store": ARstorePoints
                           //};

                           var groupedOverlays = {
                               "Zip Layers": {
                                   "Zip Code Overview": VpgmLayer,
                                   "No Fiber & Weak Wireless": VpgmLayer1,
                                   "Fiber & Weak Wireless": VpgmLayer2,
                                   "No Fiber & Strong Wireless": VpgmLayer3,
                                   "Fiber & Strong Wireless": VpgmLayer4
                               },
                               "Stores": {
                                   "AT&T Retail Store": ATTRstorePoints,
                                   "Authorized Reseller Store": ARstorePoints
                               }
                           };

                           var groupOptions = {
                               // Make the "Zip Layers" group exclusive (use radio inputs)
                               exclusiveGroups: ["Zip Layers"],
                               // Show a checkbox next to non-exclusive group labels for toggling all
                               groupCheckboxes: false,
                               collapsed: false
                           };

                           //L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

                           L.control.groupedLayers(baseLayers, groupedOverlays, groupOptions).addTo(map);

                           L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                               attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                               subdomains: ['a', 'b', 'c']
                           }).addTo(map);

                           map.invalidateSize();
                           map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

                           info.addTo(map);

                           function getColor(d) {
                               return d === 'AT&T Retail Store' ? "#008000" :
                                   d === 'Authorized Reseller Store' ? "#002280" :
                                       "#ff7f00";
                           }

                           var legend = L.control({ position: 'bottomright' });

                           legend.onAdd = function (map) {

                               var div = L.DomUtil.create('div', 'info2 legend');
                               categories = ['AT&T Retail Store', 'Authorized Reseller Store'];

                               for (var i = 0; i < categories.length; i++) {
                                   div.innerHTML +=
                                       '<i class="doughnut" style="border: 4px solid ' + getColor(categories[i]) + '"></i> ' +
                                       (categories[i] ? categories[i] + '<br>' : '+');
                               }

                               return div;
                           };

                           legend.addTo(map);

                           turnLayerOn();

            }

                       function zoomToZip(e) {
                           map.fitBounds(e.target.getBounds());

                           //function zoomToFeature(e) {
                           //    map.fitBounds(e.target.getBounds());
                           //}

                           //function onEachFeature(feature, layer) {
                           //    layer.bindPopup(feature.properties.ZIP);
                           //    layer.on({
                           //        mouseover: highlightFeature,
                           //        mouseout: resetHighlight,
                           //        click: zoomToFeature
                           //    });
                           //}

                           //VpgmLayer = L.geoJSON(VpgmData, {
                           //    onEachFeature: onEachFeature,
                           //    style: style
                           //}).addTo(map);

                       }

            

            //function getColor0(d) {
            //    return d > 5000 ? '#b3ffb3' :
            //        d > 4000 ? '#b3d9ff' :
            //            d > 3000 ? '#e7f5fe' :
            //                d > 1000 ? '#ffe6cc' :
            //                    '#ffe6cc';
            //}

            //function getColor1(d) {
            //    return d > 5000 ? '#b3ffb3' :
            //        d > 4000 ? '#b3d9ff' :
            //            d > 3000 ? '#e7f5fe' :
            //                d > 1000 ? '#ff9933' :
            //                    '#ff9933';
            //}

            //function getColor2(d) {
            //    return d > 5000 ? '#b3ffb3' :
            //        d > 4000 ? '#b3d9ff' :
            //            d > 3000 ? '#87cefa' :
            //                d > 1000 ? '#ffe6cc' :
            //                    '#ffe6cc';
            //}

            //function getColor3(d) {
            //    return d > 5000 ? '#b3ffb3' :
            //        d > 4000 ? '#4da6ff' :
            //            d > 3000 ? '#e7f5fe' :
            //                d > 1000 ? '#ffe6cc' :
            //                    '#ffe6cc';
            //}

            //function getColor4(d) {
            //    return d > 5000 ? '#009900' :
            //        d > 4000 ? '#b3d9ff' :
            //            d > 3000 ? '#e7f5fe' :
            //                d > 1000 ? '#ffe6cc' :
            //                    '#ffe6cc';
            //}

            //function style0(feature) {
            //    return {
            //        fillColor: getColor0(feature.properties.ZIP_POPS),
            //        fillOpacity: 0.7,
            //        //color: "#ff7800",
            //        weight: 2,
            //        opacity: 0.5,
            //        //fill: false
            //    };
            //}

            //function style1(feature) {
            //    return {
            //        fillColor: getColor1(feature.properties.ZIP_POPS),
            //        fillOpacity: 0.7,
            //        //color: "#ff7800",
            //        weight: 2,
            //        opacity: 0.5,
            //        //fill: false
            //    };
            //}

            //function style2(feature) {
            //    return {
            //        fillColor: getColor2(feature.properties.ZIP_POPS),
            //        fillOpacity: 0.7,
            //        //color: "#ff7800",
            //        weight: 2,
            //        opacity: 0.5,
            //        //fill: false
            //    };
            //}

            //function style3(feature) {
            //    return {
            //        fillColor: getColor3(feature.properties.ZIP_POPS),
            //        fillOpacity: 0.7,
            //        //color: "#ff7800",
            //        weight: 2,
            //        opacity: 0.5,
            //        //fill: false
            //    };
            //}

            //function style4(feature) {
            //    return {
            //        fillColor: getColor4(feature.properties.ZIP_POPS),
            //        fillOpacity: 0.7,
            //        //color: "#ff7800",
            //        weight: 2,
            //        opacity: 0.5,
            //        //fill: false
            //    };
            //}

            //function onEachFeature(feature, layer) {
            //    layer.bindPopup(feature.properties.ZIP);
            //    layer.on({
            //        mouseover: highlightFeature,
            //        mouseout: resetHighlight,
            //        click: zoomToFeature
            //    });
            //}
            

            //// method that we will use to update the control based on feature properties passed
            //var infoupdate = function (props) {
            //    //console.log(props);
            //    map.info.update._div.innerHTML = '<h4>Zip Code Information</h4>' + (props ?
            //        //document.getElementById('custom-map-controls').innerHTML = '<h4>Population Counts</h4>' + (props ?
            //        '<b>Zip Code: ' + props.ZIP + '</b><br />' + props.ZIP_POPS + ' people'
            //        : 'Hover over a zip code');
            //};
            
            //function highlightFeature(e) {
            //    var layer = e.target;

            //    layer.setStyle({
            //        weight: 5,
            //        color: '#008000',
            //        dashArray: '',
            //        fillOpacity: 0.7
            //    });

            //    if (!L.Browser.ie && !L.Browser.opera && !L.Browser.edge) {
            //        layer.bringToFront();
            //    }

            //    infoupdate(layer.feature.properties);
            //}

            //function resetHighlight(e) {
            //    VpgmLayer.resetStyle(e.target);
            //    infoupdate();
            //}            

            //function zoomToFeature(e) {
            //    map.fitBounds(e.target.getBounds());
            //}
            
            function turnLayer0ZipOn() {                
                map.removeLayer(vectorGridCMA);
                map.removeLayer(vectorGridCounty);
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                
                map.addLayer(vectorGridZip0);
            }
            function turnLayer1ZipOn() {
                map.removeLayer(vectorGridCMA);
                map.removeLayer(vectorGridCounty);
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip1);
            }
            function turnLayer2ZipOn() {
                map.removeLayer(vectorGridCMA);
                map.removeLayer(vectorGridCounty);
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip2);
            }
            function turnLayer3ZipOn() {
                map.removeLayer(vectorGridCMA);
                map.removeLayer(vectorGridCounty);
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip3);
            }
            function turnLayer4ZipOn() {
                map.removeLayer(vectorGridCMA);
                map.removeLayer(vectorGridCounty);
                map.removeLayer(vectorGridZip0);
                map.removeLayer(vectorGridZip1);
                map.removeLayer(vectorGridZip2);
                map.removeLayer(vectorGridZip3);
                map.removeLayer(vectorGridZip4);
                map.addLayer(vectorGridZip4);
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
                clicked.removeClass('active');
            } else {
                $('.oneButton').removeClass('active');
                clicked.addClass('active');
                //clicked.removeClass('disabled');
                //$('.oneButton').not(clicked).addClass('disabled'); //disable everything except clicked element
            }
        });

    </script>


</asp:Content>


