<%@ Page Title="Production Insights" Language="C#" MasterPageFile="~/MasterPageProduction.master" AutoEventWireup="true" CodeFile="Production_Insights.aspx.cs" Inherits="Production_Production_Insights" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />

    <script src="https://code.highcharts.com/stock/highstock.js"></script>
    <script src="https://code.highcharts.com/modules/bullet.js"></script>
    <%--<script src="https://code.highcharts.com/highcharts.js"></script>--%>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>

    <script src="http://rudovjan.github.io/highcharts-tooltip-delay/tooltip-delay.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script type="text/javascript" src="/capacity/haccordion.js"></script>
    <script type="text/javascript" src="/capacity/ddaccordion.js"></script>

    <script type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>
    <link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script src="../Content/Bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>

    <script src="https://d3js.org/d3.v5.js"></script>

    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"></script>

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
    <%--<link href="../assets/leaflet.fullscreen-1.6.0/Control.FullScreen.css" rel="stylesheet" />
    <script src="../assets/leaflet.fullscreen-1.6.0/Control.FullScreen.js"></script>--%>
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
    <script type="text/javascript" src="http://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"></script>

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
            height: 66px;
            width: 125px;
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

        .legend_MMW {
            margin-top: 4px;
            line-height: 20px;
            color: #555;
        }

            .legend_MMW i {
                width: 16px;
                height: 16px;
                float: left;
                margin-right: 8px;
                opacity: 0.6;
            }

        .info.legend_MMW {
            background-color: white;
            border-radius: 5px;
            /*padding: 20px;*/
            border: 2px solid #868e96;
            height: 44px; /*change to 64 for 3 items in box*/
            width: 150px;
        }

        .legend_MMW .doughnut {
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
    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Production Insights - SAMPLE - SAMPLE - SAMPLE
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/Production/Production.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/Production/Production_Insights.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Production Insights - SAMPLE - SAMPLE - SAMPLE
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
                            <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                            </asp:DropDownList>

                            <asp:Label ID="labelMonth" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Month: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlMonth" AutoPostBack="false" runat="server">
                            </asp:DropDownList>

                            <asp:HiddenField ID="hf_FCCategory" runat="server" ClientIDMode="Static" />

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

                            <asp:Button ID="Button1" Style="margin: 5px;" runat="server" Text="Submit" OnClientClick="SubmitButtonClick();" />

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
                                            <i class="flaticon-map"></i><span class="m--visible-desktop-inline-block">mmWave</span>
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

                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv2">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB <span class="current_market"></span> <span class="current_year"></span> Production Numbers - SAMPLE - SAMPLE</h5>
                                                            <div id="LOADING_NSB_Quad1" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="NSB_Quad1" class="m-section__content" style="height: 200px; width: 100%;">
                                                                <br />
                                                                <br />
                                                                <div class="row">
                                                                    <div class="col-lg-6" id="ActVsPlanSection" style="text-align: center;">
                                                                        <h3><span id="NSB_ACTvsPLAN"></span>&nbsp;<span id="AheadBehind"></span></h3>
                                                                        <div style="text-align: center; color: black">
                                                                            <h5><span id="NSB_ACT"></span> Actual / <span id="NSB_YTDPLAN"></span> YTD Planned (<span id="NSB_AVTvsPLAN_Perc"></span>%)</h5>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6" id="ActVsPlanSection2" style="text-align: center;">
                                                                        <div id="donut1" style="visibility: visible; height: 90px"></div>
                                                                    </div>
                                                                </div>

                                                                <br />
                                                                <br />

                                                                <table id="NSB_Table3" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
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

                                                                <%--<table id="NSB_Table" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                        <tr>                                                                            
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs in the Current Year's locked POE: Strategic Driver = Current Year, Status = Active or Complete, POE_Status = Nationally Locked"><span class="current_year"></span> POE</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs with an On Air Forecast in the Current Year"><span class="current_year"></span> Forecast</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Forecast / NSB POE : (Compares Counts not Specific Jobs)"><span class="current_year"></span> Fcst % of POE</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs with an On Air Actual in Current Year"><span class="current_year"></span> Actual</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Actual / NSB POE"><span class="current_year"></span> Act % of POE</th>                                                                            
                                                                        </tr>
                                                                    </thead>
                                                                </table>--%>

                                                                <br />

                                                                <div class="m-demo__preview m-demo__preview--btn">
                                                                    <%--<button type="button" class="btn btn-primary btn-sm" id="Pulls_btn" onclick="ShowPull_Map()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull In Details (<span id="btn_CY_PULL_NSB"></span> jobs,&nbsp;<span id="btn_CY_PULL_NSB_perc_POE"></span>% of POE)</button>&nbsp;
                                                                    <button type="button" class="btn btn-primary btn-sm" id="Pushes_btn" onclick="ShowPush_Map()"><span class="current_year"></span> Push Out Details (<span id="btn_CY_PUSH_NSB"></span> jobs,&nbsp;<span id="btn_CY_PUSH_NSB_perc_POE"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i></button>&nbsp; --%>
                                                                    
                                                                    <button type="button" class="btn btn-primary btn-sm" id="Pulls_btn" onclick="ShowPull_Map()"><i class="fa fa-arrow-left "></i>&nbsp;<span class="current_year"></span> Pull In Details (<span id="btn_CY_PULL_NSB"></span> jobs,&nbsp;<span id="btn_CY_PULL_NSB_perc_POE"></span>% of POE) and <span class="current_year"></span> Push Out Details (<span id="btn_CY_PUSH_NSB"></span> jobs,&nbsp;<span id="btn_CY_PUSH_NSB_perc_POE"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i></button>&nbsp;
                                                                    <%--<button type="button" class="btn btn-primary btn-sm" id="Pushes_btn" onclick="ShowPush_Map()"><span class="current_year"></span> Push Out Details (<span id="btn_CY_PUSH_NSB"></span> jobs,&nbsp;<span id="btn_CY_PUSH_NSB_perc_POE"></span>% of POE)&nbsp;<i class="fa fa-arrow-right "></i></button>&nbsp;--%>
                                                                </div>

                                                                <br />

                                                                <%--<table id="NSB_Table2" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                        <tr>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs in the POE with On Air Forecasts later than Current Year">Pushes</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs outside of the POE with On Air Forecasts in Current Year">Pulls</th>
                                                                            <th bgcolor="#87CEFA" title="NSB Jobs in the POE with On Air Forecast in Current Year">POE & Forecast</th>
                                                                            <th bgcolor="#87CEFA" title="Percentage of (specific) NSB POE jobs with On Air Forecast in Current Year:  (POE & Forecast) / POE">% POE In Forecast</th>

                                                                        </tr>
                                                                    </thead>
                                                                </table>--%>

                                                                <br />
                                                                <%--<h6><span class="selected_month"></span> NSB Production Numbers - SAMPLE - SAMPLE</h6> --%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv3">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv4">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB <span class="current_market"></span> <span class="current_year"></span> Production Curve - SAMPLE - SAMPLE</h5>
                                                            <div id="LOADING_NSB_Quad2" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="NSB_Quad2">
                                                                <div id="PRODUCTION_CHART_NSB" style="visibility: visible;"></div>

                                                                <div id="HIDE_SHOW_PC_TABLE_NSB">
                                                                    <table id="PRODUCTION_CHART_TABLE_NSB" class="table compact cell-border" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black; visibility: visible">
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

                                                                <button type="button" class="btn btn-primary" id="HideTable" onclick="HidePC_Table()">Hide Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowTable" onclick="ShowPC_Table()">Show Table</button>
                                                                <button type="button" class="btn btn-primary" id="ShowMap" onclick="ShowPC_Map()">Show Map of All</button>
                                                            </div>

                                                            <%--<br />--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv5">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv6">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB <span class="current_market"></span> Forecast Accuracy - SAMPLE - SAMPLE</h5>
                                                            <div id="LOADING_NSB_Quad3" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="NSB_Quad3">
                                                                <div class="col-lg-12">
                                                                    <div id="histCountShow">

                                                                        <h6 id="bullet_month_note"></h6>
                                                                        <br />
                                                                        <div id="HistCountBullet" style="height: 110px;"></div>

                                                                        <button type="button" class="btn btn-primary" id="ShowTable_HistAllMarkets" onclick="HistAllMarketsSelector()">Show Across All Markets</button>
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <table id="NSB_HistCountSummary" class="table compact cell-border DT_pointer" style="width: 100%; height: 100%; font-size: 14px; white-space: nowrap; text-align: center; color: black;">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th bgcolor="#87CEFA" title="Comparing the NSB Actuals of this Month to the forecast for this Month">Month</th>
                                                                                    <th bgcolor="#87CEFA" title="NSB End of Month Actual / Forecast">Accuracy</th>
                                                                                    <th bgcolor="#87CEFA" title="How many NSBs came On Air this Month">Actual</th>
                                                                                    <th bgcolor="#87CEFA" title="NSBs forecasted to come On Air this Month">Forecast</th>
                                                                                    <th bgcolor="#87CEFA" title="Date of Forecast Snapshot for Accuracy Calculation">Forecast Snapshot Date</th>
                                                                                </tr>
                                                                            </thead>
                                                                        </table>
                                                                        <br />
                                                                        <button type="button" class="btn btn-primary" id="ShowTable_HistDetail" onclick="HistDetailMonthSelector()">Show Detail</button>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv7">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv8">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h5>NSB Recent and Upcoming Map - SAMPLE - SAMPLE</h5>
                                                            <div id="LOADING_NSB_Quad4" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="salesmapShow">
                                                                <%--<h3 id="mapcounttitle"></h3>--%>
                                                                <h6 id="mapcountsubtitle"></h6>
                                                                <%--<h5 id="mapcountsubtitle2"></h5>--%>
                                                                <%--<h6 id="mapcountsubtitle3"></h6>--%>

                                                                <%--<h5 id="mapcountsubtitle2"></h5>
                                                                <h5 id="mapcountsubtitle"></h5>
                                                                <h5 id="mapcountsubtitle3"></h5>--%>

                                                                <div id="salesmapdiv" style="height: 350px; text-align: left;"></div>
                                                            </div>
                                                        </div>



                                                        <br />
                                                        <div id="Recent_Sales_Detail" class="m-section__content" style="height: 350px; width: 100%">
                                                            <table id="Sales_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA">Latitude</th>
                                                                        <th bgcolor="#87CEFA">Longitude</th>
                                                                        <th bgcolor="#87CEFA">Category</th>
                                                                        <th bgcolor="#87CEFA">PACE Number</th>
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
                                                                        <th bgcolor="#87CEFA">PACE Number</th>
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

                                        <div id="CRAN_tab_page">

                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv_CRAN">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv2_CRAN">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h2>CRAN Green Yellow Red Score Card Quadrant - SAMPLE - SAMPLE</h2>
                                                            Place Content Here
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv3_CRAN">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv4_CRAN">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h2>CRAN Production Curve Quadrant - SAMPLE - SAMPLE</h2>
                                                            Place Content Here
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv5_CRAN">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv6_CRAN">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h2>CRAN Daily Forecast History Quadrant - SAMPLE - SAMPLE</h2>
                                                            Place Content Here
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6" id="RecentDiv7_CRAN">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv8_CRAN">

                                                        <div id="salesmapShow_CRAN">
                                                            <div style="text-align: center; color: #343a40">
                                                                <h2>CRAN Recent and Upcoming Map Quadrant - SAMPLE - SAMPLE</h2>
                                                                <br />
                                                                <%--<h2 id="mapcounttitle_CRAN"></h2>--%>

                                                                <h4 id="mapcountsubtitle_CRAN"></h4>
                                                                <h5 id="mapcountsubtitle2_CRAN"></h5>
                                                                <h6 id="mapcountsubtitle3_CRAN"></h6>

                                                                <%--<h5 id="mapcountsubtitle2_CRAN"></h5>
                                                                <h4 id="mapcountsubtitle_CRAN"></h4>
                                                                <h6 id="mapcountsubtitle3_CRAN"></h6>--%>
                                                            </div>

                                                            <div id="salesmapdiv_CRAN" style="height: 450px;"></div>
                                                        </div>
                                                        <br />
                                                        <div id="Recent_Sales_Detail_CRAN" class="m-section__content" style="height: 350px; width: 100%">
                                                            <table id="Sales_Detail_CRAN" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA">Latitude</th>
                                                                        <th bgcolor="#87CEFA">Longitude</th>
                                                                        <th bgcolor="#87CEFA">Category</th>
                                                                        <th bgcolor="#87CEFA">PACE Number</th>
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
                                                                        <th bgcolor="#87CEFA">PACE Number</th>
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
                                                </div>

                                            </div>
                                        </div>

                                        </div>

                                    </div>

                                    <div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
                                        <div class="m-portlet__head-caption">
                                        </div>
                                        <div id="LOADING_Recent2_MMW" style='display: none'>
                                            <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                        </div>

                                        <div id="MMW_tab_page">

                                        <div class="row">
                                            <div class="col-lg-6" id="RecentDiv_MMW">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv2_MMW">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h2>mmWave Green Yellow Red Score Card Quadrant - SAMPLE - SAMPLE</h2>
                                                            Place Content Here
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv3_MMW">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv4_MMW">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h2>mmWave Production Curve Quadrant - SAMPLE - SAMPLE</h2>
                                                            Place Content Here
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <br />
                                        <div class="row">

                                            <div class="col-lg-6" id="RecentDiv5_MMW">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv6_MMW">
                                                        <div style="text-align: center; color: #343a40">
                                                            <h2>mmWave Daily Forecast History Quadrant - SAMPLE - SAMPLE</h2>
                                                            Place Content Here
                                                            <br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-lg-6" id="RecentDiv7_MMW">
                                                <div class="row">
                                                    <div class="col-lg-12" id="RecentDiv8_MMW">
                                                        <div id="salesmapShow_MMW">
                                                            <div style="text-align: center; color: #343a40">
                                                                <h2>mmWave Recent and Upcoming Map Quadrant - SAMPLE - SAMPLE</h2>
                                                                <br />
                                                                <%--<h2 id="mapcounttitle_MMW"></h2>--%>

                                                                <h4 id="mapcountsubtitle_MMW"></h4>
                                                                <h5 id="mapcountsubtitle2_MMW"></h5>
                                                                <h6 id="mapcountsubtitle3_MMW"></h6>

                                                                <%--<h5 id="mapcountsubtitle2_MMW"></h5>
                                                                <h4 id="mapcountsubtitle_MMW"></h4>
                                                                <h6 id="mapcountsubtitle3_MMW"></h6>--%>
                                                            </div>

                                                            <div id="salesmapdiv_MMW" style="height: 450px;"></div>

                                                            <div style="text-align: center; color: #343a40">
                                                                <h6 id="mapcountfooter_MMW"></h6>
                                                            </div>

                                                        </div>
                                                        <br />
                                                        <div id="Recent_Sales_Detail_MMW" class="m-section__content" style="height: 350px; width: 100%">
                                                            <table id="Sales_Detail_MMW" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                <thead>
                                                                    <tr>
                                                                        <th bgcolor="#87CEFA">Latitude</th>
                                                                        <th bgcolor="#87CEFA">Longitude</th>
                                                                        <th bgcolor="#87CEFA">Category</th>
                                                                        <th bgcolor="#87CEFA">PACE Number</th>
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
                                                                        <th bgcolor="#87CEFA">PACE Number</th>
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



    <!-- General Modal -->
    <div class="modal fade" id="m_modal_general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>NSB Production Chart Details</h2>
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
                            <div class="col-md-8" id="InfoCol1_2">
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
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
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
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
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
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
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

    <!-- HistDetail Modal -->
    <div class="modal fade" id="m_modal_HistDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>NSB Forecast History/Accuracy</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_HistDetail_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH_HistDetail" style='display: none'>No data found, please check input.</div>


                    <div id="ModalDisplay_HistDetail">
                        <div class="row" id="DisplayInfoRow_HistDetail">
                            <div class="col-md-2" id="InfoCol1_1_HistDetail" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-8" id="InfoCol1_2_HistDetail">

                                <div id="HistCountStockJAN" style="visibility: visible;"></div>
                                <div id="HistCountStockFEB" style="visibility: visible;"></div>
                                <div id="HistCountStockMAR" style="visibility: visible;"></div>
                                <div id="HistCountStockAPR" style="visibility: visible;"></div>
                                <div id="HistCountStockMAY" style="visibility: visible;"></div>
                                <div id="HistCountStockJUN" style="visibility: visible;"></div>
                                <div id="HistCountStockJUL" style="visibility: visible;"></div>
                                <div id="HistCountStockAUG" style="visibility: visible;"></div>
                                <div id="HistCountStockSEP" style="visibility: visible;"></div>
                                <div id="HistCountStockOCT" style="visibility: visible;"></div>
                                <div id="HistCountStockNOV" style="visibility: visible;"></div>
                                <div id="HistCountStockDEC" style="visibility: visible;"></div>

                            </div>

                            <div class="col-md-2" id="InfoCol1_3_HistDetail" style="text-align: center; color: black">
                                <%--Text Area2--%>
                            </div>
                        </div>
                        <br />


                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- HistAllMarkets Modal -->
    <div class="modal fade" id="m_modal_HistAllMarkets" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2 id="HistAllMarketsTitle"></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_HistAllMarkets_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH_HistAllMarkets" style='display: none'>No data found, please check input.</div>


                    <div id="ModalDisplay_HistAllMarkets">
                        <div class="row" id="DisplayInfoRow_HistAllMarkets">
                            <div class="col-md-2" id="InfoCol1_1_HistAllMarkets" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-8" id="InfoCol1_2_HistAllMarkets">


                                <div id="HistAllMarkets0" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets1" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets2" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets3" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets4" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets5" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets6" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets7" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets8" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets9" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets10" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets11" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets12" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets13" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets14" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets15" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets16" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets17" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets18" style="visibility: visible; height: 110px;"></div>
                                <div id="HistAllMarkets19" style="visibility: visible; height: 110px;"></div>


                            </div>

                            <div class="col-md-2" id="InfoCol1_3_HistAllMarkets" style="text-align: center; color: black">
                                <%--Text Area2--%>
                            </div>
                        </div>
                        <br />


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
                    <h2>NSB Monthly Details<span id="Modal_Month_Title"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_RYG_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH_RYG" style='display: none'>No data found, please check input.</div>


                    <div id="ModalDisplay_RYG">
                        <div class="row" id="DisplayInfoRow_RYG">
                            <div class="col-md-2" id="RYG_InfoCol1_1" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-8" id="RYG_InfoCol1_2">
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
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Civil Vendor</th>
                                        <th bgcolor="#87CEFA">Site Acq Vendor</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Header_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Header_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Header_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Civil Vendor</th>
                                        <th bgcolor="#87CEFA">Site Acq Vendor</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Footer_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Footer_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Footer_RYGModal"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
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
                    <h2>NSB Yearly Details<span id="Modal_Year_Title"></span></h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_RYG_Modal2" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH_RYG2" style='display: none'>No data found, please check input.</div>


                    <div id="ModalDisplay_RYG2">
                        <div class="row" id="DisplayInfoRow_RYG2">
                            <div class="col-md-2" id="RYG2_InfoCol1_1" style="text-align: center; color: black">
                                <%--Text Area1--%>
                            </div>
                            <div class="col-md-8" id="RYG2_InfoCol1_2">
                                <div id="recentRYG_Modal2DetailSection1">
                                    <div style="text-align: center; color: #343a40">
                                        <h4 id="RYG_Modal2_mapcounttitle"></h4>
                                        <h5 id="RYG_Modal2_mapcountsubtitle"></h5>
                                        <%--<h6 id="PC_Modal2_mapcountsubtitle2"></h6>--%>
                                    </div>
                                    <div id="RYG_Modal2_mapdiv" style="height: 450px;"></div>
                                    <h5 id="RYG_Modal2_mapcountfooter"></h5>
                                    <h6 id="RYG_Modal2_mapcountfooter2"></h6>
                                </div>
                            </div>
                            <div class="col-md-2" id="RYG2_InfoCol1_3" style="text-align: center; color: black">
                                <%--Text Area2--%>
                            </div>
                        </div>
                        <br />

                        <div class="m-section__content" id="recentRYG_Modal2DetailSection2" style="height: 100%; width: 1200px;">
                            <table id="RYG_Modal2_Recent_Detail" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
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
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
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
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
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
                    <h2>NSB Push/Pull Details</h2>
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
                            <div class="col-md-8" id="RYG3_InfoCol1_2">
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
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Civil Vendor</th>
                                        <th bgcolor="#87CEFA">Site Acq Vendor</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Header_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Header_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Header_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>

                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th bgcolor="#87CEFA">Category</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Program</th>
                                        <th bgcolor="#87CEFA">Subprogram</th>
                                        <th bgcolor="#87CEFA">Subgroup</th>
                                        <th bgcolor="#87CEFA">AVP</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
                                        <th bgcolor="#87CEFA">State</th>
                                        <th bgcolor="#87CEFA">County</th>
                                        <th bgcolor="#87CEFA">City</th>
                                        <th bgcolor="#87CEFA">Zip Code</th>
                                        <th bgcolor="#87CEFA">RAN Initiative</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Civil Vendor</th>
                                        <th bgcolor="#87CEFA">Site Acq Vendor</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_PlanMS_Footer_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ForecastMS_Footer_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA"><span id="Recent_ActualMS_Footer_RYGModal3"></span>&nbsp;</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Latitude</th>
                                        <th bgcolor="#87CEFA">Longitude</th>
                                        <th bgcolor="#87CEFA">On Air Plan</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
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

        var curmonthspan = 'Jan'; //give curmonthspan global scope and default to Jan
        var curyearspan = '2020';
        var showcolumn = true; //give showcolumn global scope
        var executedon = '2020-01-01'; // global scope default to 1/1/2020

        $(document).ready(function () {
            attachClickHandlers();
            console.log("DocReady");
            var market_long = $('#ddlMarket option:selected').text();
            //document.getElementById('markettitle').innerHTML = market_long;
            $('#ActVsPlanSection').hide();
            $('#salesmapShow').hide();
            $('#histCountShow').hide();
            $('#salesmapShow_CRAN').hide();
            $('#salesmapShow_MMW').hide();
            $('#Recent_Sales_Detail').hide();
            $('#Recent_Sales_Detail_CRAN').hide();
            $('#Recent_Sales_Detail_MMW').hide();
            $('#HideTable').hide();
            $('#HIDE_SHOW_PC_TABLE_NSB').hide();
            $('#NSB_Quad1').hide();
            $('#NSB_Quad2').hide();
            $('#NSB_Quad3').hide();
            //$('#HistCountTable').hide();
            $('#HistActTable').hide();
            var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
            var market_long = "National";
            var time = "Last 90 days on air / +45 days forecasted";
            <%--var time = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            $('#LOADING_NSB_Quad1').show();
            $('#LOADING_NSB_Quad2').show();
            $('#LOADING_NSB_Quad3').show();
            $('#LOADING_NSB_Quad4').show();
            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/GetDATADATE",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDATADATE(data);
                },
                error: function (data) {
                }
            });
            //Getmarketdata(market, time, market_long);
            mainClickOnce();
            mainClickOnceMMW();

        });

        function HidePC_Table() {
            $('#HideTable').hide();
            $('#ShowTable').show();
            $('#HIDE_SHOW_PC_TABLE_NSB').hide();

        }

        function ShowPC_Table() {
            $('#HideTable').show();
            $('#ShowTable').hide();
            $('#HIDE_SHOW_PC_TABLE_NSB').show();

        }

        function ShowPC_Map() {
            Modal_Click();
            updatePC_Modal("%", "ONAIR");

        }

        function ShowPull_Map() {
            Modal3_Click_RYG();
            updateRYG_Modal3("Month", "ONAIR", "PULL");

        }

        //function ShowPush_Map() {
        //    Modal3_Click_RYG();
        //    updateRYG_Modal3("Month", "ONAIR", "PUSH");

        //}


        function SubmitButtonClick() {
            var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(market);
            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
            console.log("SubmitButtonClick function: " + pulldown_month);

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

            getFilterCriteria();
            //updateHistCountchart();
            
        }

        function attachClickHandlers() {
            console.log("ClickHandler");
            $('#ddlMarket').change(
                function () {
                    getFilterCriteria();
                    mainClickOnce();
                    mainClickOnceMMW();
                }
            );
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

        function mainClickOnce() {
            $('#tab3').one('click', function (e) {
                $('#CRAN_tab_page').hide();
                //$('#LOADING_Recent2_CRAN').show();
                //$('#salesmapShow_CRAN').hide();
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var time = "Last 90 days on air / +45 days forecasted";
                //updateSalesChart_CRAN(market, time, market_long);
            });
        }

        function mainClickOnceMMW() {
            $('#tab4').one('click', function (e) {
                $('#MMW_tab_page').hide();
                //$('#LOADING_Recent2_MMW').show();
                //$('#salesmapShow_MMW').hide();
                var market_long = $('#<%= ddlMarket.ClientID %> option:selected').text();
                var market = $('#<%= ddlMarket.ClientID %> option:selected').val();
                var time = "Last 90 days on air / +45 days forecasted";
                //updateSalesChart_MMW(market, time, market_long);
            });
        }

        function getFilterCriteria() {
            $('#salesmapShow').hide();
            $('#histCountShow').hide();
            $('#salesmapShow_CRAN').hide();
            $('#salesmapShow_MMW').hide();
            $('#Recent_Sales_Detail').hide();
            $('#Recent_Sales_Detail_CRAN').hide();
            $('#Recent_Sales_Detail_MMW').hide();
            $('#HideTable').hide();
            $('#HIDE_SHOW_PC_TABLE_NSB').hide();
            //$('#HistCountTable').hide();
            $('#HistActTable').hide();
            $('#NSB_Quad1').hide();
            $('#NSB_Quad2').hide();
            $('#NSB_Quad3').hide();
            $('#LOADING_NSB_Quad1').show();
            $('#LOADING_NSB_Quad2').show();
            $('#LOADING_NSB_Quad3').show();
            $('#LOADING_NSB_Quad4').show();
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
            var tabpane3 = document.getElementById("m_tabs_1_3"); //turn off
            var tabpane4 = document.getElementById("m_tabs_1_4"); //turn off
            //var tabpane5 = document.getElementById("m_tabs_1_5");
            //var tabpane6 = document.getElementById("m_tabs_1_6");
            //var tabpane7 = document.getElementById("m_tabs_1_7"); 
            //var tabpane8 = document.getElementById("m_tabs_1_8");
            //tabpane2.classList.remove("active");
            tabpane3.classList.remove("active"); //turn off
            tabpane4.classList.remove("active"); //turn off
            //tabpane5.classList.remove("active");
            //tabpane6.classList.remove("active");
            //tabpane7.classList.remove("active"); 
            //tabpane8.classList.remove("active");
            //var tab2 = document.getElementById("tab2");
            var tab3 = document.getElementById("tab3"); //turn off
            var tab4 = document.getElementById("tab4"); //turn off
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

            Getmarketdata(market, time, market_long);
            var marketspan = $('#<%= ddlMarket.ClientID %> option:selected').text();
            var marketClasses = document.getElementsByClassName('current_market');
            for (var i = 0; i < marketClasses.length; i++) {
                marketClasses[i].innerHTML = marketspan;
            }
            //updateHistCountchart();

        }

        function Getmarketdata(market, time, market_long) {
            //document.getElementById('markettitle').innerHTML = market_long;
            updateProductionCurve(market, time, market_long);
            update_NSB();
            updateSalesChart(market, time, market_long);
            updateHistCountchart();
        }

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value;            

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

            Month_Fake_Click();
            //updateHistCountchart();
            //Getmarketdata(market, time, market_long);

        }

        function Month_Fake_Click(source, eventArgs) {
            var clickButton = document.getElementById("<%= ButtonFC.ClientID %>");
            clickButton.click();

            var delayInMilliseconds = 500; //500 ms

            setTimeout(function () {
                var pulldown_month_test = $('#<%= ddlMonth.ClientID %> option:selected').val();
                console.log("setTimeout Month Selected: " + pulldown_month_test);
                SubmitButtonClick();
            }, delayInMilliseconds);

            
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

        //Counts and GYR Section

        function update_NSB() {
            
            var pulldown_region = $('#<%= ddlMarket.ClientID %> option:selected').val();
            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
            //var d = Date.parse(pulldown_month);
            
            console.log("Testing Month: " + pulldown_month);

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_NSB",
                data: JSON.stringify({ 'geoVariable': pulldown_region, 'monthVariable': pulldown_month }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    load_NSB(data, pulldown_region, pulldown_month);
                    $('#LOADING_NSB_Quad1').hide();
                    $('#NSB_Quad1').show();
                    $('#ActVsPlanSection').show();
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Getdonut1",
                data: JSON.stringify({ 'geoVariable': pulldown_region, 'monthVariable': pulldown_month }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut1(data);
                },
                error: function (data) {
                }
            });

        }

        function load_NSB(data, pulldown_region, pulldown_month) {

            console.log('load_NSB function start');

            data = JSON.parse(data.d);


            if (data.length <= 0) {
                return;
            }
            else {

                var PLAN = data[0]["CY_POE_NSB"];
                var ACT = data[0]["CY_ACT_NSB"];
                var FCST = data[0]["CY_FCST_NSB"];
                var YTDPLAN = data[0]["YTD_PLAN_NSB"];
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

                document.getElementById('NSB_ACTvsPLAN').innerHTML = ACTvsPLANCheck;
                document.getElementById('NSB_ACT').innerHTML = ACT;
                document.getElementById('NSB_YTDPLAN').innerHTML = YTDPLAN;
                document.getElementById('NSB_AVTvsPLAN_Perc').innerHTML = AVTvsPLAN_Perc;

                if (ACTvsPLAN > 0) {
                    var AheadBehindCheck = "Ahead of Plan";
                }
                else if (ACTvsPLAN < 0) {
                    var AheadBehindCheck = "Behind Plan";
                }
                else if (ACTvsPLAN == 0) {
                    var AheadBehindCheck = "Exactly On Plan";
                };

                document.getElementById('AheadBehind').innerHTML = AheadBehindCheck;

                if (PLAN == 0) {
                    var ACT_PER_OF_POE = "-";
                } else {
                    var ACT_PER_OF_POE = ((ACT / PLAN) * 100).toFixed(0);
                }

                document.getElementById('ActVsPlanSection').style.color = textcolor1;

                data[0].ACT_PER_OF_POE = ACT_PER_OF_POE + "%"

                $('#NSB_Table').dataTable().fnDestroy(); //destroy old table
                $('#NSB_Table2').dataTable().fnDestroy();
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#NSB_Table').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: true,
                    paging: false,
                    sort: false,
                    scrollY: 375,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[1, 'asc']],
                    searching: false,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    //buttons: [{ extend: 'csv', title: 'NSB_Export' }, { extend: 'excelHtml5', title: 'NSB_Export' }],
                    buttons: [],
                    columnDefs: [{ width: '20%', targets: [0, 1, 2, 3, 4] }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'CY_POE_NSB', 'className': 'clickable' },
                        { 'data': 'CY_FCST_NSB', 'className': 'clickable' },
                        { 'data': 'CY_PERCENT_FCST_NSB' },
                        { 'data': 'CY_ACT_NSB', 'className': 'clickable' },
                        { 'data': 'ACT_PER_OF_POE' }

                    ],

                    rowCallback: function (row, data, index) {

                        if (data['CY_FCST_NSB'] / data['CY_POE_NSB'] >= 1) {
                            $(row).find('td:eq(2)').css('background', 'LightGreen');
                        }
                        else if (data['CY_FCST_NSB'] / data['CY_POE_NSB'] < .8) {
                            $(row).find('td:eq(2)').css('background', 'LightCoral');
                        }
                        else {
                            $(row).find('td:eq(2)').css('background', 'Khaki');
                        }

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

                $('#NSB_Table tr td:eq(0)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR");
                    console.log("click");
                });
                $('#NSB_Table tr td:eq(1)').off().on('click', function () {
                    Modal_Click_RYG2();
                    updateRYG_Modal("Month", "ONAIR");
                });
                $('#NSB_Table tr td:eq(3)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR");
                });

                $('#NSB_Table tr td:eq(0)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                });
                $('#NSB_Table tr td:eq(1)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                });
                $('#NSB_Table tr td:eq(3)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                });

                document.getElementById('btn_CY_PUSH_NSB').innerHTML = data[0]["CY_PUSH_NSB"];
                document.getElementById('btn_CY_PULL_NSB').innerHTML = data[0]["CY_PULL_NSB"];
                var CY_PUSH_PERC_NSB = ((data[0]["CY_PUSH_NSB"] / PLAN) * 100).toFixed(1);
                var CY_PULL_PERC_NSB = ((data[0]["CY_PULL_NSB"] / PLAN) * 100).toFixed(1);
                document.getElementById('btn_CY_PUSH_NSB_perc_POE').innerHTML = CY_PUSH_PERC_NSB;
                document.getElementById('btn_CY_PULL_NSB_perc_POE').innerHTML = CY_PULL_PERC_NSB;

                $('#NSB_Table2').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: false,
                    paging: false,
                    sort: false,
                    scrollY: 375,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[1, "asc"]],
                    searching: false,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [],
                    columnDefs: [{ width: '25%', targets: [0, 1, 2, 3] }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'CY_PUSH_NSB' },
                        { 'data': 'CY_PULL_NSB' },
                        { 'data': 'CY_BOTH_NSB' },
                        { 'data': 'CY_PERCENT_BOTH_NSB' }

                    ],

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

                $('#NSB_Table2 tr td:eq(0)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR");
                    console.log("click");
                });
                $('#NSB_Table2 tr td:eq(1)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR");
                });
                $('#NSB_Table2 tr td:eq(2)').off().on('click', function () {
                    Modal_Click_RYG();
                    updateRYG_Modal("Month", "ONAIR");
                });

                $('#NSB_Table2 tr td:eq(0)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                });
                $('#NSB_Table2 tr td:eq(1)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                });
                $('#NSB_Table2 tr td:eq(2)').hover(function () {
                    $(this).addClass('DT_highlight DT_pointer');
                }, function () {
                    $(this).removeClass('DT_highlight DT_pointer');
                });

            }

            //console.log('curmonth inside loadNSBREGION function: ' + curmonth);

            $(window).resize();

        }

        //Forecast History Section

        function updateHistCountchart() {

            console.log('updateHistCountchart started');

            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
            console.log('histcount pulldown month: ' + pulldown_month);

            var stringyearnum = pulldown_month.substring(0, 4);

            if (pulldown_month.substring(5, 6) == 0) {
                stringmonthnum = pulldown_month.substring(6, 7);
            }

            else {
                stringmonthnum = pulldown_month.substring(5, 7);
            }

            //console.log('stringmonthnum ' + stringmonthnum);

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

            var monthselected = month[stringmonthnum - 1];

            console.log('monthselected ' + monthselected);

            var columnname = 'ONAIR_' + monthselected.toUpperCase() + '_' + stringyearnum;  // need to make this dynamic to allow for future year roll overs
            console.log('columnname ' + columnname);

            var pulldown_region = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(pulldown_region);

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_HistCountSummary",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'pulldownRegionVariable': pulldown_region }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadHistCountSummary(data); //function in frontpage below 

                },
                error: function (data) {
                }
            })

            //document.getElementById('MS_Header').innerHTML = actualized_ms;
            
        }



        function loadHistCountSummary(data) {
            console.log('loadHistCountSummary start');

            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();

            var stringyearnum = pulldown_month.substring(0, 4);

            if (pulldown_month.substring(5, 6) == 0) {
                stringmonthnum = pulldown_month.substring(6, 7);
            }

            else {
                stringmonthnum = pulldown_month.substring(5, 7);
            }


            if (executedon.substring(5, 6) == 0) {
                executedonmonthnum = executedon.substring(6, 7);
            }

            else {
                executedonmonthnum = executedon.substring(5, 7);
            }

            if (executedon.substring(8, 9) == 0) {
                executedondaynum = executedon.substring(9, 10);
            }

            else {
                executedondaynum = executedon.substring(8, 10);
            }

            console.log('executedondaynum: ' + executedondaynum);

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

            data = JSON.parse(data.d);

            console.log(data);
            console.log(data[0]);
            console.log(data[0]['LOCK_JAN_FCST']);

            var historytable = new Array(executedonmonthnum);
            //var historytable = [];
            for (var i = 0; i < executedonmonthnum; i++) {
                historytable[i] = new Array(4);
                historytable[i][0] = month[i];
                if (data[0]['BEGINNING_' + month[i].toUpperCase() + '_FCST'] == 0) {
                    historytable[i][1] = '-';
                }
                else {
                    historytable[i][1] = (100 * data[0]['ACT_' + month[i].toUpperCase()] / data[0]['BEGINNING_' + month[i].toUpperCase() + '_FCST']).toFixed(0) + '%';
                } 
                historytable[i][2] = data[0]['ACT_' + month[i].toUpperCase()];
                historytable[i][3] = data[0]['BEGINNING_' + month[i].toUpperCase() + '_FCST'];
                historytable[i][4] = i + 1 + '/5/2020';
            }

            historytable[0][4] = '1/17/2020';

            if (executedondaynum < 5) {
                historytable[executedonmonthnum - 1][3] = '-'; // if you are before the 5th day of the month, dont show forecast
            }

            console.log(historytable);


            var bullet_data = [];
            var bullet_caption = '';
            var month_note = document.getElementById("bullet_month_note");

            // If the user has selected the current month (based on executed on date) then show previous month's forecast accuracy (instead of showing current accuracy with partial actuals)

            if (stringmonthnum == executedonmonthnum) {

                bullet_data[0] = historytable[stringmonthnum - 2][2];
                bullet_data[1] = historytable[stringmonthnum - 2][3];
                bullet_data[2] = historytable[stringmonthnum - 2][0];
                bullet_caption = '*Showing ' + historytable[stringmonthnum - 2][0] + ' Accuracy because ' + historytable[stringmonthnum - 1][0] + ' Actuals are not final yet*';
                month_note.innerHTML = bullet_caption;
                $('#bullet_month_note').show();

            }

            else {
                bullet_data[0] = historytable[stringmonthnum - 1][2];
                bullet_data[1] = historytable[stringmonthnum - 1][3];
                bullet_data[2] = historytable[stringmonthnum - 1][0];
                month_note.innerHTML = '';
                $('#bullet_month_note').hide();
            }

            if (bullet_data[1] == 0) {
                bullet_percentage = '-';
            }

            else {
                bullet_percentage = Math.round(100 * bullet_data[0] / bullet_data[1]);
            } 


            var bullet_title = bullet_data[2] + ' Forecast Accuracy: ' + bullet_percentage + '%  (' + bullet_data[0] + ' ACT / ' + bullet_data[1] + ' FCST)';

            if (executedonmonthnum <= 2 || stringmonthnum == 1)
                console.log("executedonmonthnum: " + executedonmonthnum);

                historytable[executedonmonthnum - 1][2] += ' (so far)'; // add the so far onto the end of current month actuals
            historytable[executedonmonthnum - 1][1] = '-'; // get rid of percentage calculation for current month

            Highcharts.chart('HistCountBullet', {
                chart: {
                    marginTop: 40,
                    inverted: true,
                    marginLeft: 75,
                    type: 'bullet'

                },

                credits: {
                    enabled: false
                },

                legend: {
                    enabled: false
                },

                exporting: {
                    enabled: false
                },

                title: {
                    text: bullet_title
                },

                //caption: {
                //    text: bullet_caption
                //},

                xAxis: {
                    categories: ['NSB']
                },

                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    max: bullet_data[1] * 2.0,
                    title: 'NSBs',

                    plotBands: [{
                        from: 0,
                        to: bullet_data[1] * .6,
                        color: 'LightCoral'
                    }, {
                        from: bullet_data[1] * .6,
                        to: bullet_data[1] * 1.4,
                        color: 'LightGreen'
                    }, {
                        from: bullet_data[1] * 1.4,
                        to: 9e9,
                        color: 'Khaki'
                    }]


                },
                plotOptions: {

                    series: {
                        pointWidth: 15,
                        lineWidth: 25
                    }
                },
                series: [{
                    data: [{
                        y: bullet_data[0],
                        target: bullet_data[1],
                        color: '#999'
                    }],
                    targetOptions: {
                        borderColor: '#2E8B57',
                        color: '#2E8B57'
                    }
                }],
                tooltip: {
                    pointFormat: '<b>{point.y}</b> with target of {point.target} '
                }
            });


            if (data.length <= 0) {
                return;
            }
            else {

                $('#NSB_HistCountSummary').dataTable().fnDestroy(); //destroy old table
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#NSB_HistCountSummary').DataTable({ //build new table
                    orderCellsTop: false,
                    fixedHeader: true,
                    paging: false,
                    sort: false,
                    scrollY: 375,
                    scrollCollapse: true,
                    scrollX: true,
                    order: [[1, 'asc']],
                    searching: false,
                    data: historytable,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [],
                    columnDefs: [{ width: '18%', targets: [0, 1, 2, 3] }, { width: '28%', targets: [4] }],


                    //rowCallback: function (row, data, index) {

                    //    if (data['CY_FCST_NSB'] / data['CY_POE_NSB'] >= 1) {
                    //        $(row).find('td:eq(2)').css('background', 'LightGreen');
                    //    }
                    //    else if (data['CY_FCST_NSB'] / data['CY_POE_NSB'] < .8) {
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

                //$('#NSB_HistCountSummary').on('click', 'tbody td.clickable', function (e) {
                //        alert("cell selected");
                //    });

                //$('#NSB_HistCountSummary' td').hover(function () {
                //        $(this).addClass('DT_highlight');
                //    }, function () {
                //        $(this).removeClass('DT_highlight');
                //    }
                //    );

                $('#NSB_Quad3').show();
                $('#LOADING_NSB_Quad3').hide();
                $('#histCountShow').show();

                $(window).resize();                

            }
        }
        
        function HistAllMarketsSelector() {

            $('#LOADING_HistAllMarkets_Modal').show();

            console.log('HistAllMarkets start');

            Modal_Click_HistAllMarkets(); //fake click to open modal

            $('#HistAllMarketsTitle').hide();

            for (var i = 0; i < 20; i++) {

                $('#HistAllMarkets' + i).hide();

            }

            var monthselected = 'Jan'; //default

            if (executedon.substring(5, 6) == 0) {
                executedonmonthnum = executedon.substring(6, 7);
            }

            else {
                executedonmonthnum = executedon.substring(5, 7);
            }

            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();

            if (pulldown_month.substring(5, 6) == 0) {
                stringmonthnum = pulldown_month.substring(6, 7);
            }

            else {
                stringmonthnum = pulldown_month.substring(5, 7);
            }

            //console.log('stringmonthnum ' + stringmonthnum);

            var month = new Array();
            month[0] = "JAN";
            month[1] = "FEB";
            month[2] = "MAR";
            month[3] = "APR";
            month[4] = "MAY";
            month[5] = "JUN";
            month[6] = "JUL";
            month[7] = "AUG";
            month[8] = "SEP";
            month[9] = "OCT";
            month[10] = "NOV";
            month[11] = "DEC";

            if (executedonmonthnum == stringmonthnum) {
                monthselected = month[stringmonthnum - 2];
            }

            else {

                monthselected = month[stringmonthnum - 1];
            }

            console.log('monthselected: ' + monthselected);

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_HistCountAllMarkets",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'pulldownMonth': monthselected }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    data1 = data.d
                    HistAllMarketsCreator(data1, monthselected);
                },
                error: function (data) {
                }
            })

        }

        function HistAllMarketsCreator(data, monthselected) {
            //loop through each row of data, unhide the corresponding div, create a bullet chart

            var marketdata = JSON.parse(data);


            document.getElementById('HistAllMarketsTitle').innerHTML = monthselected + ' NSB Forecast Accuracy - Sorted by VPGM Markets with Highest ' + monthselected + ' Actuals';
            $('#HistAllMarketsTitle').show();


            for (var i = 0; i < marketdata.length; i++) {

                $('#HistAllMarkets' + i).show();

                var bullet_percentage = Math.round(100 * marketdata[i]['ACT_' + monthselected] / marketdata[i]['BEGINNING_' + monthselected + '_FCST']);
                var bullet_title = marketdata[i]['SALES_VPGM_MARKET'] + ' Forecast Accuracy: ' + bullet_percentage + '%  (' + marketdata[i]['ACT_' + monthselected] + ' ACT / ' + marketdata[i]['BEGINNING_' + monthselected + '_FCST'] + ' FCST)';

                if (marketdata[i]['BEGINNING_' + monthselected + '_FCST'] == 0) {
                    var bullet_title = marketdata[i]['SALES_VPGM_MARKET'] + ' Forecast Accuracy: -  (' + marketdata[i]['ACT_' + monthselected] + ' ACT / ' + marketdata[i]['BEGINNING_' + monthselected + '_FCST'] + ' FCST)';
                }

                console.log(marketdata[i]['ACT_' + monthselected]);
                console.log(marketdata[i]['BEGINNING_' + monthselected + '_FCST']);

                Highcharts.chart('HistAllMarkets' + i, {
                    chart: {
                        marginTop: 40,
                        inverted: true,
                        marginLeft: 75,
                        type: 'bullet'

                    },

                    credits: {
                        enabled: false
                    },

                    legend: {
                        enabled: false
                    },

                    exporting: {
                        enabled: false
                    },

                    title: {
                        text: bullet_title
                    },

                    //caption: {
                    //    text: bullet_caption
                    //},

                    xAxis: {
                        categories: ['NSB']
                    },

                    yAxis: {
                        allowDecimals: false,
                        tickInterval: 2,
                        min: 0,
                        max: marketdata[i]['BEGINNING_' + monthselected + '_FCST'] * 2.0,
                        title: 'NSBs',

                        plotBands: [{
                            from: 0,
                            to: marketdata[i]['BEGINNING_' + monthselected + '_FCST'] * .6,
                            color: 'LightCoral'
                        }, {
                            from: marketdata[i]['BEGINNING_' + monthselected + '_FCST'] * .6,
                            to: marketdata[i]['BEGINNING_' + monthselected + '_FCST'] * 1.4,
                            color: 'LightGreen'
                        }, {
                            from: marketdata[i]['BEGINNING_' + monthselected + '_FCST'] * 1.4,
                            to: 9e9,
                            color: 'Khaki'
                        }]


                    },
                    plotOptions: {

                        series: {
                            pointWidth: 15,
                            lineWidth: 25
                        }
                    },
                    series: [{
                        data: [{
                            y: marketdata[i]['ACT_' + monthselected],
                            target: marketdata[i]['BEGINNING_' + monthselected + '_FCST'],
                            color: '#999'
                        }],
                        targetOptions: {
                            borderColor: '#2E8B57',
                            color: '#2E8B57'
                        }
                    }],
                    tooltip: {
                        pointFormat: '<b>{point.y}</b> with target of {point.target} '
                    }
                });
            }

            $('#LOADING_HistAllMarkets_Modal').hide();

        }

        function HistDetailMonthSelector() {

            Modal_Click_HistDetail(); //fake click to open modal
            $('#LOADING_HistDetail_Modal').show();
            $('#HistCountStockJAN').hide();
            $('#HistCountStockFEB').hide();
            $('#HistCountStockMAR').hide();
            $('#HistCountStockAPR').hide();
            $('#HistCountStockMAY').hide();
            $('#HistCountStockJUN').hide();
            $('#HistCountStockJUL').hide();
            $('#HistCountStockAUG').hide();
            $('#HistCountStockSEP').hide();
            $('#HistCountStockOCT').hide();
            $('#HistCountStockNOV').hide();
            $('#HistCountStockDEC').hide();

            if (executedon.substring(5, 6) == 0) {
                executedonmonthnum = executedon.substring(6, 7);
            }

            else {
                executedonmonthnum = executedon.substring(5, 7);
            }

            updateHistDetail('JAN', '2020-01-01');

            if (executedonmonthnum >= 2) {
                updateHistDetail('FEB', '2020-02-01');
            }

            if (executedonmonthnum >= 3) {
                updateHistDetail('MAR', '2020-03-01');
            }

            if (executedonmonthnum >= 4) {
                updateHistDetail('APR', '2020-04-01');
            }

            if (executedonmonthnum >= 5) {
                updateHistDetail('MAY', '2020-05-01');
            }

            if (executedonmonthnum >= 6) {
                updateHistDetail('JUN', '2020-06-01');
            }

            if (executedonmonthnum >= 7) {
                updateHistDetail('JUL', '2020-07-01');
            }

            if (executedonmonthnum >= 8) {
                updateHistDetail('AUG', '2020-08-01');
            }

            if (executedonmonthnum >= 9) {
                updateHistDetail('SEP', '2020-09-01');
            }

            if (executedonmonthnum >= 10) {
                updateHistDetail('OCT', '2020-10-01');
            }

            if (executedonmonthnum >= 11) {
                updateHistDetail('NOV', '2020-11-01');
            }

            if (executedonmonthnum >= 12) {
                updateHistDetail('DEC', '2020-12-01');
            }


        }

        function updateHistDetail(monthname, monthdate) {

            console.log('updateHistDetail' + monthname + 'started');

            var stringyearnum = monthdate.substring(0, 4);

            var columnname = 'ONAIR_' + monthname + '_' + stringyearnum;  // need to make this dynamic to allow for future year roll overs
            console.log('columnname ' + columnname);

            var pulldown_region = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(pulldown_region);

            console.log('monthdate: ' + monthdate);

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_HistCountStock",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'pulldownRegionVariable': pulldown_region, 'pulldownColumnName': columnname, 'pulldownDateVariable': monthdate }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    data1 = data;
                    updateHistDetail2(pulldown_region, monthdate, monthname, columnname, data1);
                },
                error: function (data) {
                }
            })
        }


        function updateHistDetail2(pulldown_region, monthdate, monthname, columnname, data1) {

            console.log('updateHistDetail2' + monthname + 'started');
            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_HistActStock",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'pulldownRegionVariable': pulldown_region, 'pulldownDateVariable': monthdate, 'executedOnVariable': executedon }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //loadHistActStock(data, 'HistActStock'); //function in frontpage below 
                    data2 = data;
                    loadHistCountStock(data1, data2, 'HistCountStock' + monthname, columnname, monthname, monthdate)
                },
                error: function (data) {
                }
            })
        }


        function loadHistCountStock(data, data2, container, columnname, monthselected, monthdate) {

            console.log('loadHistCountStock');
            console.log('monthdate ' + monthdate);


            var score = JSON.parse(data.d);
            var score2 = JSON.parse(data2.d);
            var pulldown_region = $('#<%= ddlMarket.ClientID %> option:selected').text();



            var stringyearnum = monthdate.substring(0, 4);
            if (monthdate.substring(5, 6) == 0) {
                stringmonthnum = monthdate.substring(6, 7);
            }

            else {
                stringmonthnum = monthdate.substring(5, 7);
            }

            if (executedon.substring(5, 6) == 0) {
                executedonmonthnum = executedon.substring(6, 7);
            }

            else {
                executedonmonthnum = executedon.substring(5, 7);
            }



            var stockChartTitle = pulldown_region + ' ' + monthselected + ' NSB Forecast and Actuals';



            var fcstFlagDate = Date.UTC(2020, 0, 17) // 1/17/20 as default
            var actFlagDate = Date.UTC(2020, 1, 0) // default to last day in January. month 0 = Jan, Day 0 means last day of previous month, so Feb last day of previous month

            if (monthselected != "JAN") {
                fcstFlagDate = Date.UTC(2020, stringmonthnum - 1, 5); // 5th day of selected month
                actFlagDate = Date.UTC(2020, stringmonthnum, 0); //setting day to zero does last day of previous month
            }

            //document.getElementById('MS_Header_HistCount').innerHTML = stockChartTitle;

            var seriesData = [];
            for (var i = 0; i < score.length; i++) {
                seriesData.push([score[i]["MILLISECONDS"], score[i][columnname]]);
            }

            console.log(monthselected + ' data: ');
            console.log(seriesData);

            var seriesData2 = [];
            for (var i = 0; i < score2.length; i++) {
                seriesData2.push([score2[i]["MILLISECONDS"], score2[i]["CUMULATIVE"]]);
            }

            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#2E8B57']
            });

            Highcharts.stockChart(container, {

                rangeSelector: {
                    allButtonsEnabled: false,
                    inputEnabled: false

                },

                credits: {
                    enabled: false
                },

                exporting: {
                    enabled: false
                },

                chart: {
                    zoomType: 'xy'
                },

                title: {
                    text: stockChartTitle
                },

                navigator: {
                    enabled: false
                },

                legend: {
                    enabled: true
                },

                rangeSelector: {
                    enabled: false
                },

                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'NSB Count',
                        rotation: 90
                    }
                },

                xAxis: {

                    //min: Date.UTC(stringyearnum, stringmonthnum - 1, 1),
                    //max: Date.UTC(stringyearnum, stringmonthnum, 1),

                    //range: 35 * 24 * 3600 * 1000, // 35 days

                    tickAmount: 12,

                    labels: {

                        rotation: 90
                    }
                },

                series:
                    [{
                        name: pulldown_region + " NSB - " + monthselected + " FCST",
                        data: seriesData,
                        id: 'fcstseries',
                        step: true,
                        tooltip: {
                            valueDecimals: 0
                        }

                    },
                    {
                        type: 'column',
                        name: pulldown_region + " NSB - " + monthselected + " ACT",
                        data: seriesData2,
                        id: 'actseries',
                        step: true,
                        tooltip: {
                            valueDecimals: 0
                        },
                        marker: {
                            enabled: true,
                            radius: 4
                        }

                        // the event marker flags
                    }, {
                        type: 'flags',
                        name: 'FCST Snapshot',
                        data: [{
                            x: fcstFlagDate,
                            title: 'FCST',
                            text: pulldown_region + " NSB - " + monthselected + " FCST early in the month"
                        }],
                        onSeries: 'fcstseries',
                        shape: 'squarepin',
                        width: 28



                    }, {
                        type: 'flags',
                        name: 'ACT Snapshot', //ACT Flag set to last day of selected month. 
                        data: [{
                            x: actFlagDate,
                            title: 'ACT',
                            text: pulldown_region + " NSB - " + monthselected + " ACT at end of Month"
                        }],
                        onSeries: 'actseries',
                        shape: 'squarepin',
                        width: 28

                    }]

                //setTimeout(function() {
                //    $('input.highcharts-range-selector', $(chart.container).parent())
                //        .datepicker();
                //}, 0);

            });

            // Set the datepicker's date format

            //$.datepicker.setDefaults({
            //    dateFormat: 'yy-mm-dd',
            //    onSelect: function () {
            //        this.onchange();
            //        this.onblur();
            //    }
            //});

            $('#LOADING_HistDetail_Modal').hide();
            $('#' + container).show();            

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
            var timeselection = $('#<%= ddlMonth.ClientID %> option:selected').val();

            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail", //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail2", //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail3", //use a function from C# , change this for different data return
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
            console.log('updateSalesChart function start');
            var timeselection = "Last 90 days on air / +45 days forecasted";
            <%--var timeselection = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_CRAN",  //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_CRAN2",  //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_CRAN3",  //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_CRAN4",  //use a function from C# , change this for different data return
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

        function updateSalesChart_MMW(market, time, market_long) {
            console.log('updateSalesChart function start');
            var timeselection = "Last 90 days on air / +45 days forecasted";
            <%--var timeselection = $('#<%= ddlTime.ClientID %> option:selected').text();--%>
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();

            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_MMW",  //use a function from C# , change this for different data return
                    data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_MMW2",  //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_MMW3",  //use a function from C# , change this for different data return
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
                    url: "Production_Insights.aspx/Get_Recent_Sales_Detail_MMW4",  //use a function from C# , change this for different data return
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
                dataConcat_MMW(Data1, Data2, Data3, Data4, market, time, market_long);
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

        function dataConcat_MMW(data1, data2, data3, data4, market, time, market_long) {
            var dataConcat4;
            data1 = data1.substring(0, data1.length - 1);
            data2 = data2.substring(1, data2.length - 1);
            data3 = data3.substring(1, data3.length - 1);
            data4 = data4.substring(1, data4.length);
            dataConcat4 = data1 + ',' + data2 + ',' + data3 + ',' + data4;
            loadSalesData_MMW(dataConcat4, market, time, market_long);
        }

        function loadSalesData(data, market, time, market_long) {
            $('#LOADING_NSB_Quad4').hide();
            $('#salesmapShow').show();

            console.log('loadSalesData function start')
            //$('#Sales_Detail').show();
            data = JSON.parse(data);
            //var DATE1 = data[0]["DATE1"];
            //var DATE2 = data[0]["DATE2"];
            //var DATE3 = data[0]["DATE3"];
            //var DATE4 = data[0]["DATE4"];

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
                            salesMap(market, time, market_long);
                        }
                    }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ONAIR_DATE' }

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

            salesMap(market, time, market_long);
        }

        function salesMap(market, time, market_long) {

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
            var previousTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            var previousindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                previousTable[previousindex] = [];
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

                else if ($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'CM ACTUAL') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        //console.log('recentOnAirTable' + $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML)
                    }

                    onairindex++;
                }
                else if ($("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'CM REMAINING FORECASTED') {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

                else {

                    for (w = 0; w < recentDetailColCount; w++) {
                        previousTable[previousindex][w] = $("#Sales_Detail").get(0).lastChild.childNodes[i].childNodes[w].innerHTML;
                    }

                    previousindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }

            if (previousTable[previousTable.length - 1].length == 0) {
                previousTable.splice(-1, 1);
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
            document.getElementById('mapcountsubtitle').innerHTML = month_current + ' Actual: ' + recentOnAirTable.length + ' / ' + month_current + ' Remaining Forecasted: ' + recentUpcomingTable.length + ' / ' + month_minus_two + " & " + month_minus_one + " Actual: " + previousTable.length;
            //document.getElementById('mapcountsubtitle2').innerHTML = selectedMonthName + ' Remaining Forecasted: ' + recentUpcomingTable.length;
            //document.getElementById('mapcountsubtitle3').innerHTML = month_minus_two + " & " + month_minus_one + ": " + previousTable.length;
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;
            var series1name = month_current + ' Actual';
            var series2name = month_current + ' Remaining';
            var series3name = month_minus_two + ' & ' + month_minus_one + ' Actual';

            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();
            var Previouspoints = new L.layerGroup();
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                
    
                        */
                var popup =
                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    //'<br/><b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    '<b>On Air Date:</b> ' + recentOnAirTable[i][12] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][3] +
                    //'<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>City, State:</b> ' + recentOnAirTable[i][10] + ', ' + recentOnAirTable[i][7] +
                    //'<br/><b>CMA Name:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>County, Zip:</b> ' + recentOnAirTable[i][8] + ', ' + recentOnAirTable[i][11],

                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],     //position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#008000'
                    };

                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                OApoints.addLayer(marker);
            }

            for (i = 0; i < recentUpcomingTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + recentUpcomingTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentUpcomingTable[i][recent_long_index] +
                    //'<br/><b>On Air Category:</b> ' + recentUpcomingTable[i][2] +
                    '<b>On Air Date:</b> ' + recentUpcomingTable[i][12] +
                    '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][3] +
                    //'<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>City, State:</b> ' + recentUpcomingTable[i][10] + ', ' + recentUpcomingTable[i][7] +
                    //'<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>County, Zip:</b> ' + recentUpcomingTable[i][8] + ', ' + recentUpcomingTable[i][11],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],            //position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#002280'
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                Uppoints.addLayer(marker);
            }

            for (i = 0; i < previousTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + previousTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + previousTable[i][recent_long_index] +
                    //'<br/><b>On Air Category:</b> ' + previousTable[i][2] +
                    '<b>On Air Date:</b> ' + previousTable[i][12] +
                    '<br/><b>PACE Number:</b> ' + previousTable[i][3] +
                    //'<br/><b>Subprogram:</b> ' + previousTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + previousTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + previousTable[i][6] +
                    '<br/><b>City, State:</b> ' + previousTable[i][10] + ', ' + previousTable[i][7] +
                    //'<br/><b>CMA Name:</b> ' + previousTable[i][9] +
                    '<br/><b>County, Zip:</b> ' + previousTable[i][8] + ', ' + previousTable[i][11],

                    loc = [parseFloat(previousTable[i][recent_lat_index]), parseFloat(previousTable[i][recent_long_index])],                //position found
                    previousTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: "#6bd16b"
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(previousTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                Previouspoints.addLayer(marker);
            }

            document.getElementById('salesmapdiv').innerHTML = "<div id='salesmapid' style='height: 350px;'></div>";

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
            //var defaultbase = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            //    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            //}).addTo(map);
            // ***********            

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

            var map = L.map("salesmapid", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets, OApoints, Uppoints],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            var overlays = {};

            overlays[series1name] = OApoints;
            overlays[series2name] = Uppoints;
            overlays[series3name] = Previouspoints;

            L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map) {

                var div = L.DomUtil.create('div', 'info legend');
                categories = [series1name, series2name, series3name];

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
            $('#LOADING_Recent2_CRAN').hide();
            $('#salesmapShow_CRAN').show();

            console.log('loadSalesData_CRAN function start')
            //$('#Sales_Detail').show();
            data = JSON.parse(data);
            //var DATE1 = data[0]["DATE1"];
            //var DATE2 = data[0]["DATE2"];
            //var DATE3 = data[0]["DATE3"];
            //var DATE4 = data[0]["DATE4"];

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
                            salesMap_CRAN(market, time, market_long);
                        }
                    }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ONAIR_DATE' }

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

            salesMap_CRAN(market, time, market_long);
        }

        function loadSalesData_MMW(data, market, time, market_long) {
            $('#LOADING_Recent2_MMW').hide();
            $('#salesmapShow_MMW').show();

            console.log('loadSalesData_MMW function start')
            //$('#Sales_Detail').show();
            data = JSON.parse(data);
            //var DATE1 = data[0]["DATE1"];
            //var DATE2 = data[0]["DATE2"];
            //var DATE3 = data[0]["DATE3"];
            //var DATE4 = data[0]["DATE4"];

            if (data.length <= 0) {
                return;
            }
            else {

                $('#Sales_Detail_MMW').dataTable().fnDestroy(); //destroy old table
                $.fn.dataTable.moment('MM-DD-YYYY');
                $('#Sales_Detail_MMW').DataTable({ //build new table
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
                    buttons: [{ extend: 'csv', title: 'Sales_Detail_MMW_Export' }, { extend: 'excelHtml5', title: 'Sales_Detail_MMW_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            salesMap_MMW(market, time, market_long);
                        }
                    }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SALES_REGION' },
                        { 'data': 'SALES_VPGM_MARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CMA_NAME' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'ONAIR_DATE' }

                    ],

                    //Highlight rows that don't have lat longs in the detail table in Red
                    createdRow: function (row, data, index) {
                        if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                            $(row).addClass('highlightRed');
                        }
                    },

                    "fnDrawCallback": function () {
                        $('#Sales_Detail_MMW tr').find('td').each(function () {
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

            salesMap_MMW(market, time, market_long);
        }

        function salesMap_CRAN(market, time, market_long) {

            var selectedMonthName = $('#<%= ddlMonth.ClientID %> option:selected').text();

            var recentSelectedCount = $("#Sales_Detail_CRAN").get(0).lastChild.childElementCount;
            console.log('recentSelectedCount: ' + recentSelectedCount);
            var recentDetailColCount = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childElementCount;
            console.log('recentDetailColCount: ' + recentDetailColCount);

            var j = 0;
            var i = 0;

            //console.log(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

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
            var previousTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            var previousindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                previousTable[previousindex] = [];
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
                    //console.log($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    recentFilteredTable[i][j] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                //console.log(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));

                if (isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                //else if ($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                else if ($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'CM ACTUAL') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        //console.log('recentOnAirTable' + $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[k].innerHTML)
                    }

                    onairindex++;
                }
                else if ($("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'CM REMAINING FORECASTED') {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

                else {

                    for (w = 0; w < recentDetailColCount; w++) {
                        previousTable[previousindex][w] = $("#Sales_Detail_CRAN").get(0).lastChild.childNodes[i].childNodes[w].innerHTML;
                    }

                    previousindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }

            if (previousTable[previousTable.length - 1].length == 0) {
                previousTable.splice(-1, 1);
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


            //document.getElementById('mapcounttitle').innerHTML = market_long + " - New Site Build";
            document.getElementById('mapcountsubtitle_CRAN').innerHTML = selectedMonthName + ' Actual: ' + recentOnAirTable.length;
            document.getElementById('mapcountsubtitle2_CRAN').innerHTML = selectedMonthName + ' Remaining Forecasted: ' + recentUpcomingTable.length;
            document.getElementById('mapcountsubtitle3_CRAN').innerHTML = 'Previous Two Month Actuals: ' + previousTable.length;
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;

            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();
            var Previouspoints = new L.layerGroup();
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                
    
                        */
                var popup =
                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>State:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>County:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>CMA Name:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>City:</b> ' + recentOnAirTable[i][10] +
                    '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][11] +
                    '<br/><b>On Air Date:</b> ' + recentOnAirTable[i][12],


                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],     //position found
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
                    '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>State:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>County:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>City:</b> ' + recentUpcomingTable[i][10] +
                    '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][11] +
                    '<br/><b>On Air Date:</b> ' + recentUpcomingTable[i][12],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],            //position found
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

            for (i = 0; i < previousTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + previousTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + previousTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + previousTable[i][2] +
                    '<br/><b>PACE Number:</b> ' + previousTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + previousTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + previousTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + previousTable[i][6] +
                    '<br/><b>State:</b> ' + previousTable[i][7] +
                    '<br/><b>County:</b> ' + previousTable[i][8] +
                    '<br/><b>CMA Name:</b> ' + previousTable[i][9] +
                    '<br/><b>City:</b> ' + previousTable[i][10] +
                    '<br/><b>Zip Code:</b> ' + previousTable[i][11] +
                    '<br/><b>On Air Date:</b> ' + previousTable[i][12],

                    loc = [parseFloat(previousTable[i][recent_lat_index]), parseFloat(previousTable[i][recent_long_index])],                //position found
                    previousTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: "#ff7f00"
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(previousTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                Previouspoints.addLayer(marker);
            }

            document.getElementById('salesmapdiv_CRAN').innerHTML = "<div id='salesmapid_CRAN' style='height: 400px;'></div>";

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
            //var defaultbase = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            //    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            //}).addTo(map);
            // ***********            

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
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satellite": sat
                //"Topo": topo
            };

            var map = L.map("salesmapid_CRAN", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets, OApoints, Uppoints],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            var overlays = {
                "Recently Completed": OApoints,
                "Upcoming Forecasted": Uppoints,
                "Previously Completed": Previouspoints
            };

            L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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
                categories = ['Recently Completed', 'Upcoming Forecasted', 'Previously Completed'];

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


            //console.log($("#Sales_Detail_CRAN").get(0).firstChild);
            //console.log($("#Sales_Detail_CRAN").get(0).firstChild.innerHTML);
        }

        $('.nav-tabs li').click(function () {
            $(window).resize();
            $(window).resize();
        });

        function salesMap_MMW(market, time, market_long) {

            var selectedMonthName = $('#<%= ddlMonth.ClientID %> option:selected').text();

            var recentSelectedCount = $("#Sales_Detail_MMW").get(0).lastChild.childElementCount;
            console.log('recentSelectedCount: ' + recentSelectedCount);
            var recentDetailColCount = $("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childElementCount;
            console.log('recentDetailColCount: ' + recentDetailColCount);

            var j = 0;
            var i = 0;

            //console.log(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var minlat = parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);
            var minlong = parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[0].childNodes[recent_long_index].innerHTML))) {
                maxlat = 48;
                minlat = 25;
                maxlong = -66;
                minlong = -125;
            }

            var recentFilteredTable = [];
            var recentUpcomingTable = [];
            var recentOnAirTable = [];
            var previousTable = [];
            var upcomingindex = 0;
            var onairindex = 0;
            var previousindex = 0;
            var concatlatlong = [];
            var NaNcount = 0;
            var NaNcountMessage = '';

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                previousTable[previousindex] = [];
                concatlatlong[i] = $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML + $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    //console.log($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    recentFilteredTable[i][j] = $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                //console.log(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML));

                if (isNaN(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_lat_index].innerHTML)) || isNaN(parseFloat($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                //else if ($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                else if ($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'CM ACTUAL') {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                        //console.log('recentOnAirTable' + $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[k].innerHTML)
                    }

                    onairindex++;
                }
                else if ($("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[2].innerHTML == 'CM REMAINING FORECASTED') {

                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
                    }

                    upcomingindex++;
                }

                else {

                    for (w = 0; w < recentDetailColCount; w++) {
                        previousTable[previousindex][w] = $("#Sales_Detail_MMW").get(0).lastChild.childNodes[i].childNodes[w].innerHTML;
                    }

                    previousindex++;
                }

            }

            //check to see if an empty row exists in the last row of the table and remove it if so
            if (recentUpcomingTable[recentUpcomingTable.length - 1].length == 0) {
                recentUpcomingTable.splice(-1, 1);
            }

            if (recentOnAirTable[recentOnAirTable.length - 1].length == 0) {
                recentOnAirTable.splice(-1, 1);
            }

            if (previousTable[previousTable.length - 1].length == 0) {
                previousTable.splice(-1, 1);
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


            //document.getElementById('mapcounttitle').innerHTML = market_long + " - New Site Build";
            document.getElementById('mapcountsubtitle_MMW').innerHTML = selectedMonthName + ' Actual: ' + recentOnAirTable.length;
            document.getElementById('mapcountsubtitle2_MMW').innerHTML = selectedMonthName + ' Remaining Forecasted: ' + recentUpcomingTable.length;
            document.getElementById('mapcountsubtitle3_MMW').innerHTML = 'Previous Two Month Actuals: ' + previousTable.length;
            //document.getElementById('mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + NaNcountMessage;

            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();
            var Previouspoints = new L.layerGroup();
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                
    
                        */
                var popup =
                    //'<br/><b>Latitude:</b> ' + recentOnAirTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + recentOnAirTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + recentOnAirTable[i][2] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>State:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>County:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>CMA Name:</b> ' + recentOnAirTable[i][9] +
                    '<br/><b>City:</b> ' + recentOnAirTable[i][10] +
                    '<br/><b>Zip Code:</b> ' + recentOnAirTable[i][11] +
                    '<br/><b>On Air Date:</b> ' + recentOnAirTable[i][12],


                    loc = [parseFloat(recentOnAirTable[i][recent_lat_index]), parseFloat(recentOnAirTable[i][recent_long_index])],     //position found
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
                    '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>State:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>County:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>CMA Name:</b> ' + recentUpcomingTable[i][9] +
                    '<br/><b>City:</b> ' + recentUpcomingTable[i][10] +
                    '<br/><b>Zip Code:</b> ' + recentUpcomingTable[i][11] +
                    '<br/><b>On Air Date:</b> ' + recentUpcomingTable[i][12],

                    loc = [parseFloat(recentUpcomingTable[i][recent_lat_index]), parseFloat(recentUpcomingTable[i][recent_long_index])],            //position found
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

            for (i = 0; i < previousTable.length; i++) {

                popup =
                    //'<br/><b>Latitude:</b> ' + previousTable[i][recent_lat_index] +
                    //'<br/><b>Longitude:</b> ' + previousTable[i][recent_long_index] +
                    '<b>On Air Category:</b> ' + previousTable[i][2] +
                    '<br/><b>PACE Number:</b> ' + previousTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + previousTable[i][4] +
                    '<br/><b>Sales Region:</b> ' + previousTable[i][5] +
                    '<br/><b>VPGM Market:</b> ' + previousTable[i][6] +
                    '<br/><b>State:</b> ' + previousTable[i][7] +
                    '<br/><b>County:</b> ' + previousTable[i][8] +
                    '<br/><b>CMA Name:</b> ' + previousTable[i][9] +
                    '<br/><b>City:</b> ' + previousTable[i][10] +
                    '<br/><b>Zip Code:</b> ' + previousTable[i][11] +
                    '<br/><b>On Air Date:</b> ' + previousTable[i][12],

                    loc = [parseFloat(previousTable[i][recent_lat_index]), parseFloat(previousTable[i][recent_long_index])],                //position found
                    previousTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: "#ff7f00"
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(previousTableoptions) });
                marker.setOpacity(.6);
                marker.bindPopup(popup);
                Previouspoints.addLayer(marker);
            }

            document.getElementById('salesmapdiv_MMW').innerHTML = "<div id='salesmapid_MMW' style='height: 400px;'></div>";

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
            //var defaultbase = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            //    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            //}).addTo(map);
            // ***********            

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
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satellite": sat
                //"Topo": topo
            };

            var map = L.map("salesmapid_MMW", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets, OApoints, Uppoints],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            var overlays = {
                "Recently Completed": OApoints,
                "Upcoming Forecasted": Uppoints,
                "Previously Completed": Previouspoints
            };

            L.control.layers(baseLayers, overlays, { collapsed: true }).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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
                categories = ['Recently Completed', 'Upcoming Forecasted', 'Previously Completed'];

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


            //console.log($("#Sales_Detail_MMW").get(0).firstChild);
            //console.log($("#Sales_Detail_MMW").get(0).firstChild.innerHTML);
        }

        $('.nav-tabs li').click(function () {
            $(window).resize();
            $(window).resize();
        });

        // ********** PRODUCTION CURVE START **********

        function updateProductionCurve(market, time, market_long) {
            console.log('updateProductionCurve function start');
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(salesGeo);
            var timeselection = $('#<%= ddlMonth.ClientID %> option:selected').val();
            console.log(timeselection);
            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
            var month = pulldown_month.substring(0, 7);

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/GetPRODUCTION_CHART_NSB", //v5 updated
                data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var marketTitle = $('#ddlMarket option:selected').text();
                    PC_data = JSON.parse(data.d);
                    loadDRILL_CHART_CREATOR(PC_data, 'PRODUCTION_CHART_NSB', marketTitle, 'Plan/Forecast/Actuals', '0');
                    $('#NSB_Quad2').show();
                    $('#LOADING_NSB_Quad2').hide();
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/GetPRODUCTION_CHART_TABLE_NSB", //v5 updated
                data: JSON.stringify({ 'timeVariable': timeselection, 'geoVariable': salesGeo }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    PCT_data = JSON.parse(data.d);
                    loadProductionTable(PCT_data)
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/GetNSB_QUAD1", //v5 updated
                data: JSON.stringify({ 'monthVariable': month, 'geoVariable': salesGeo }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').text();
                    Quad1_data = JSON.parse(data.d);
                    loadQuad1_Month(Quad1_data, pulldown_month);
                },
                error: function (data) {
                }
            });

        }

        function loadQuad1_Month(PC_data, month) {

            //for (var i = 0; i < PC_data.length; i++) {
            //    if (!(PC_data[i].FORECAST_MONTH == month)) {
            //        PC_data.splice(i, 1);
            //        i--;
            //    }
            //}

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

            $('#NSB_Table3').dataTable().fnDestroy();
            $.fn.dataTable.moment('MM-DD-YYYY');
            $('#NSB_Table3').DataTable({ //build new table
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

            $('#NSB_Table3 tr td:eq(1)').off().on('click', function () {
                Modal_Click_RYG();
                updateRYG_Modal("Month", "ONAIR", "PLAN", "PLAN");
            });
            $('#NSB_Table3 tr td:eq(2)').off().on('click', function () {
                Modal_Click_RYG();
                updateRYG_Modal("Month", "ONAIR", "FCST", "FORECAST");
            });
            $('#NSB_Table3 tr td:eq(3)').off().on('click', function () {
                Modal_Click_RYG();
                updateRYG_Modal("Month", "ONAIR", "ACT", "FORECAST");
            });
            $('#NSB_Table3 tr td:eq(6)').off().on('click', function () {
                Modal2_Click_RYG();
                updateRYG_Modal2("Month", "ONAIR", "FCST", "PLAN");
            });
            $('#NSB_Table3 tr td:eq(7)').off().on('click', function () {
                Modal2_Click_RYG();
                updateRYG_Modal2("Month", "ONAIR", "FCST", "FORECAST");
            });
            $('#NSB_Table3 tr td:eq(8)').off().on('click', function () {
                Modal2_Click_RYG();
                updateRYG_Modal2("Month", "ONAIR", "ACT", "FORECAST");
            });

            $('#NSB_Table3 tr td:eq(1)').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            $('#NSB_Table3 tr td:eq(2)').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            $('#NSB_Table3 tr td:eq(3)').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            $('#NSB_Table3 tr td:eq(6)').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            $('#NSB_Table3 tr td:eq(7)').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );
            $('#NSB_Table3 tr td:eq(8)').hover(function () {
                $(this).addClass('DT_highlight DT_pointer');
            }, function () {
                $(this).removeClass('DT_highlight DT_pointer');
            }
            );

        };


        var chart2;

        /* PLAN/FORECAST/ACTUAL SUMMARY CHART LOADER */
        function loadDRILL_CHART_CREATOR(PC_data, container, marketTitle, marketSubTitle, SVNum) {
            var PC_series_values = [];
            var keys = Object.keys(PC_data[0]);

            // Parse returned json string into x axis categories and y series values

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

            createProductionChart(PC_series_values[SVNum], container, marketTitle, marketSubTitle);

            var j = 8
            chart2.addSeries({
                name: 'Plan',
                id: 'Plan',
                data: PC_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: PC_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 6
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: PC_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 9
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
                data: PC_series_values[j],
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
                data: PC_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createProductionChart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
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
                                    updatePC_Modal(chartCategory, "ONAIR");
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
        }

        function loadProductionTable(data) {  //Aging/Audit table to display data           

            if (data.length <= 0) {
                return;
            }
            else {
                var sitename = data[0]["SITE_NAME"];
                $('#PRODUCTION_CHART_TABLE_NSB').dataTable().fnDestroy(); //destroy old table
                $('#PRODUCTION_CHART_TABLE_NSB').DataTable({ //build new table                


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

        // ********** PRODUCTION CURVE END **********

        // ********** PRODUCTION CURVE MODAL START **********

        var PC_recent_lat_index = 23; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
        var PC_recent_long_index = 24; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

        //function updatePC_Modal(rowSelected, RecentMS) {
        function updatePC_Modal(monthSelected, RecentMS) {
            console.log('updatePC_Modal Start');
            $('#LOADING_PC_Modal').show();
            $('#recentPC_ModalDetailSection1').hide();
            $('#recentPC_ModalDetailSection2').hide();

            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(salesGeo);
            var monthSelected = monthSelected;
            console.log(monthSelected);
            var RecentMS = RecentMS;
            console.log(RecentMS);
            var RecentMStext = RecentMS;
            var RecentGroup = RecentMS;
            var rowSelected = RecentMS;
            var days = RecentMS;

            document.getElementById('Recent_PlanMS_Header').innerHTML = RecentMS + ' Plan';
            document.getElementById('Recent_ForecastMS_Header').innerHTML = RecentMS + ' Forecast';
            document.getElementById('Recent_ActualMS_Header').innerHTML = RecentMS + ' Actual';

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_PC_Modal",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'geoVariable': salesGeo, 'monthVariable': monthSelected, 'RecentMSVariable': RecentMS }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    load_PC_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected); //function in frontpage below, 
                },
                error: function (data) {

                    alert('Unable to load map due to high number of jobs');

                }
            });
        }



        function load_PC_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected) {  // Recent and Upcoming Detail after user clicks on a row


            data = JSON.parse(data.d);
            // $.fn.dataTable.moment('MM-DD-YYYY');
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];
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
                    order: [[19, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            recent_PC_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected);
                        }
                    }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data


                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'PACE_NAME' },
                        { 'data': 'PROGRAM' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SUBGROUP' },
                        { 'data': 'RAN_AVP' },
                        { 'data': 'MARKET' },
                        { 'data': 'SUBMARKET' },
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
                        { 'data': 'ONAIR_PLAN' },
                        { 'data': 'ONAIR_FORECAST' },
                        { 'data': 'ONAIR_ACTUAL' }



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


            $('#LOADING_PC_Modal').hide();
            //$('#Recent_Top_Section').show();
            $('#recentPC_ModalDetailSection1').show();
            $('#recentPC_ModalDetailSection2').show();

            $(window).resize();

            recent_PC_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected);
        }

        function recent_PC_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, days1, days2, days3, days4, monthSelected) {

            var PC_recent_lat_index = 21; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var PC_recent_long_index = 22; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

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

            if (monthSelected == '%') {
                monthSelectedtext = 'Current Year'
            }
            else {
                monthSelectedtext = monthSelected
            }

            document.getElementById('PC_Modal_mapcounttitle').innerHTML = salesGeo + ' Production Curve NSB Map';
            document.getElementById('PC_Modal_mapcountsubtitle').innerHTML = monthSelectedtext + ' Actual and Remaining Forecasted';
            //document.getElementById('PC_Modal_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
            document.getElementById('PC_Modal_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            document.getElementById('PC_Modal_mapcountfooter2').innerHTML = NaNcountMessage;




            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();

            console.log('test 1');
            console.log(recentOnAirTable);
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                

                        */
                var popup = '<b>Category:</b> ' + recentOnAirTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentOnAirTable[i][2] +
                    '<br/><b>Program:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>Market:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentOnAirTable[i][11] + ', ' + recentOnAirTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentOnAirTable[i][10] + ', ' + recentOnAirTable[i][12] +
                    '<br/><b>Issued Date:</b> ' + recentOnAirTable[i][15] +
                    '<br/><b>USID:</b> ' + recentOnAirTable[i][19] +
                    '<br/><b>FA Code:</b> ' + recentOnAirTable[i][20] +
                    '<br/><b>Latitude:</b> ' + recentOnAirTable[i][PC_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentOnAirTable[i][PC_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentOnAirTable[i][23] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentOnAirTable[i][24] +
                    '<br/><b>ONAIR Actual:</b> ' + recentOnAirTable[i][25],

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
                    '<br/><b>PACE Name:</b> ' + recentUpcomingTable[i][2] +
                    '<br/><b>Program:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>Market:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentUpcomingTable[i][11] + ', ' + recentUpcomingTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentUpcomingTable[i][10] + ', ' + recentUpcomingTable[i][12] +
                    '<br/><b>Issued Date:</b> ' + recentUpcomingTable[i][15] +
                    '<br/><b>USID:</b> ' + recentUpcomingTable[i][19] +
                    '<br/><b>FA Code:</b> ' + recentUpcomingTable[i][20] +
                    '<br/><b>Latitude:</b> ' + recentUpcomingTable[i][PC_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentUpcomingTable[i][PC_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentUpcomingTable[i][23] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentUpcomingTable[i][24] +
                    '<br/><b>ONAIR Actual:</b> ' + recentUpcomingTable[i][25],

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

            console.log('test4');

            document.getElementById('PC_Modal_mapdiv').innerHTML = "<div id='PC_Modal_mapid' style='height: 435px;'></div>";

            //var map = L.map("PC_Modal_mapid").fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);
            // ***********
            //var map = L.map("PC_Modal_mapid", {
            //    attributionControl: false,
            //    center: [39.73, -104.99],
            //    zoom: 10,
            //    layers: [OApoints, Uppoints]
            //});
            // ***********

            console.log('test5');
            // ***********
            //var defaultbase = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            //    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            //}).addTo(map);
            // ***********

            //var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
            //    id: 'osm.grayscale',
            //    maxZoom: 18,
            //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
            //    subdomains: ['a', 'b', 'c']
            //});
            var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            var overlays = {
                "Recently Completed": OApoints,
                "Upcoming Forecasted": Uppoints
            };

            L.control.layers(baseLayers, overlays).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
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

            var legend = L.control({ position: 'bottomright' });

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

        var RYG_recent_lat_index = 23; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
        var RYG_recent_long_index = 24; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

        //function updateRYG_Modal(rowSelected, RecentMS) {
        function updateRYG_Modal(monthSelected, RecentMS, cellSelected, PlanFcst) {
            console.log("updateRYG_Modal Start");
            $('#LOADING_RYG_Modal').show();
            $('#recentRYG_ModalDetailSection1').hide();
            $('#recentRYG_ModalDetailSection2').hide();

            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(salesGeo);

            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
            console.log('histcount pulldown month: ' + pulldown_month);

            var stringyearnum = pulldown_month.substring(0, 4);

            if (pulldown_month.substring(5, 6) == 0) {
                stringmonthnum = pulldown_month.substring(6, 7);
            }

            else {
                stringmonthnum = pulldown_month.substring(5, 7);
            }

            //console.log('stringmonthnum ' + stringmonthnum);

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
            console.log(monthSelected);
            var RecentMS = RecentMS;
            console.log(RecentMS);
            var RecentMStext = RecentMS;
            var RecentGroup = RecentMS;
            var rowSelected = RecentMS;
            var days = RecentMS;

            document.getElementById('Recent_PlanMS_Header_RYGModal').innerHTML = RecentMS + ' Plan';
            document.getElementById('Recent_ForecastMS_Header_RYGModal').innerHTML = RecentMS + ' Forecast';
            document.getElementById('Recent_ActualMS_Header_RYGModal').innerHTML = RecentMS + ' Actual';

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_RYG_Modal",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'geoVariable': salesGeo, 'monthVariable': monthSelected, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    load_RYG_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst); //function in frontpage below, 
                },
                error: function (data) {

                    alert('Unable to load map due to high number of jobs');

                }
            });
        }



        function load_RYG_Modal_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst) {  // Recent and Upcoming Detail after user clicks on a row

            data = JSON.parse(data.d);
            // $.fn.dataTable.moment('MM-DD-YYYY');
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];
            //$('#footer2').show();

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
                    order: [[19, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            recent_RYG_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected, cellSelected, PlanFcst);
                        }
                    }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data


                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'PACE_NAME' },
                        { 'data': 'PROGRAM' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SUBGROUP' },
                        { 'data': 'RAN_AVP' },
                        { 'data': 'MARKET' },
                        { 'data': 'SUBMARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'RAN_INITIATIVE' },
                        { 'data': 'SPECTRUM' },
                        { 'data': 'CIVIL_VENDOR' },
                        { 'data': 'SA_VENDOR' },
                        { 'data': 'ISSUED_DATE' },
                        { 'data': RecentMS + '_PLAN' },
                        { 'data': RecentMS + '_FORECAST' },
                        { 'data': RecentMS + '_ACTUAL' },
                        { 'data': 'USID' },
                        { 'data': 'FA_CODE' },
                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'ONAIR_PLAN' },
                        { 'data': 'ONAIR_FORECAST' },
                        { 'data': 'ONAIR_ACTUAL' }



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


            $('#LOADING_RYG_Modal').hide();
            //$('#Recent_Top_Section').show();
            $('#recentRYG_ModalDetailSection1').show();
            $('#recentRYG_ModalDetailSection2').show();

            $(window).resize();

            recent_RYG_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected, cellSelected, PlanFcst);
        }

        function recent_RYG_Modal_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, days1, days2, days3, days4, monthSelected, cellSelected, PlanFcst) {

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

            //loop through the visible (filtered) rows of the detail table and grab the data. Store the upcoming rows in one table and the recent on airs in another
            for (i = 0; i < recentSelectedCount; i++) {
                recentFilteredTable[i] = [];
                recentUpcomingTable[upcomingindex] = [];
                recentOnAirTable[onairindex] = [];
                concatlatlong[i] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML + $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML;

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


                for (j = 0; j < recentDetailColCount; j++) {
                    //console.log($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    recentFilteredTable[i][j] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                //console.log(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));

                if (isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                else if ($("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                    }

                    onairindex++;
                }
                else {
                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#RYG_Modal_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
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

            document.getElementById('Modal_Month_Title').innerHTML = " - " + selectedMonthName;
            document.getElementById('RYG_Modal_mapcounttitle').innerHTML = salesGeo + ' NSB Map';
            //document.getElementById('RYG_Modal_mapcountsubtitle').innerHTML = selectedMonthName + ' Actual and Remaining ' + PlanOrFcst;
            document.getElementById('RYG_Modal_mapcountsubtitle').innerHTML = selectedMonthName + ' Actual (' + recentOnAirTable.length + ') and Remaining ' + PlanOrFcst + ' (' + recentUpcomingTable.length + ')';
            //document.getElementById('RYG_Modal_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
            document.getElementById('RYG_Modal_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            document.getElementById('RYG_Modal_mapcountfooter2').innerHTML = NaNcountMessage;


            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();

            //console.log('test 1');
            //console.log(recentOnAirTable);
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                

                        */
                var popup = '<b>Category:</b> ' + recentOnAirTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentOnAirTable[i][2] +
                    '<br/><b>Program:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>Market:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentOnAirTable[i][11] + ', ' + recentOnAirTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentOnAirTable[i][10] + ', ' + recentOnAirTable[i][12] +
                    '<br/><b>Civil Vendor:</b> ' + recentOnAirTable[i][15] +
                    '<br/><b>Site Acq Vendor:</b> ' + recentOnAirTable[i][16] +
                    '<br/><b>Issued Date:</b> ' + recentOnAirTable[i][17] +
                    '<br/><b>USID:</b> ' + recentOnAirTable[i][21] +
                    '<br/><b>FA Code:</b> ' + recentOnAirTable[i][22] +
                    '<br/><b>Latitude:</b> ' + recentOnAirTable[i][RYG_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentOnAirTable[i][RYG_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentOnAirTable[i][25] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentOnAirTable[i][26] +
                    '<br/><b>ONAIR Actual:</b> ' + recentOnAirTable[i][27],

                    loc = [parseFloat(recentOnAirTable[i][RYG_recent_lat_index]), parseFloat(recentOnAirTable[i][RYG_recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#2E8B57'
                    };

                //console.log('test2');
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                OApoints.addLayer(marker);
            }

            //console.log('test3');

            for (i = 0; i < recentUpcomingTable.length; i++) {

                

                var popup = '<b>Category:</b> ' + recentUpcomingTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentUpcomingTable[i][2] +
                    '<br/><b>Program:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>Market:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentUpcomingTable[i][11] + ', ' + recentUpcomingTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentUpcomingTable[i][10] + ', ' + recentUpcomingTable[i][12] +
                    '<br/><b>Civil Vendor:</b> ' + recentUpcomingTable[i][15] +
                    '<br/><b>Site Acq Vendor:</b> ' + recentUpcomingTable[i][16] +
                    '<br/><b>Issued Date:</b> ' + recentUpcomingTable[i][17] +
                    '<br/><b>USID:</b> ' + recentUpcomingTable[i][21] +
                    '<br/><b>FA Code:</b> ' + recentUpcomingTable[i][22] +
                    '<br/><b>Latitude:</b> ' + recentUpcomingTable[i][PC_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentUpcomingTable[i][PC_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentUpcomingTable[i][25] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentUpcomingTable[i][26] +
                    '<br/><b>ONAIR Actual:</b> ' + recentUpcomingTable[i][27],

                    loc = [parseFloat(recentUpcomingTable[i][RYG_recent_lat_index]), parseFloat(recentUpcomingTable[i][RYG_recent_long_index])],	//position found

                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,                        
                        borderColor: dotColor
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                Uppoints.addLayer(marker);
            }

            //console.log('test4');

            document.getElementById('RYG_Modal_mapdiv').innerHTML = "<div id='RYG_Modal_mapid' style='height: 450px;'></div>";

            //var map = L.map("PC_Modal_mapid").fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);
            // ***********
            //var map = L.map("PC_Modal_mapid", {
            //    attributionControl: false,
            //    center: [39.73, -104.99],
            //    zoom: 10,
            //    layers: [OApoints, Uppoints]
            //});
            // ***********

            //console.log('test5');
            // ***********
            //var defaultbase = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
            //    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
            //}).addTo(map);
            // ***********

            //var grayscale = L.tileLayer('http://{s}.tiles.wmflabs.org/bw-mapnik/{z}/{x}/{y}.png', {
            //    id: 'osm.grayscale',
            //    maxZoom: 18,
            //    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
            //    subdomains: ['a', 'b', 'c']
            //});
            var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satelite": sat
                //"Topo": topo
            };

            if (cellSelected == "ACT") {
                var map = L.map("RYG_Modal_mapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, OApoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });
            } else {
                var map = L.map("RYG_Modal_mapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, Uppoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });
            }

            if ( PlanFcst == "PLAN" ) {
                var overlays = {
                    "Recently Completed": OApoints,
                    "Upcoming POE": Uppoints
                };
            } else {
                var overlays = {
                    "Recently Completed": OApoints,
                    "Upcoming Forecasted": Uppoints
                };
            }

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map);

            map.invalidateSize();
            map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return d === 'Recently Completed' ? "#2E8B57" :
                    d === 'Upcoming Forecasted' ? "#1E90FF" :
                        d === 'Upcoming POE' ? "#808080" :
                        "#ffffff";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map) {

                var div = L.DomUtil.create('div', 'info legend_RYG');

                if (PlanFcst == "PLAN") {
                    categories = ['Recently Completed', 'Upcoming POE'];
                } else {
                    categories = ['Recently Completed', 'Upcoming Forecasted'];
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

        function loadDonut1(data) {
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

            donutcharting101('donut1', Number(value), title, poe, forecast, ytdcomplete, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
        }

        /* DONUT CHART CREATER */
        function donutcharting101(container, value, title, poe, forecast, ytdcomplete, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear) {
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
                        categories: ['NSB']
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

        // ********** RYG MODAL2 START **********

        var RYG_recent_lat_index = 21; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
        var RYG_recent_long_index = 22; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

        //function updateRYG_Modal2(rowSelected, RecentMS) {
        function updateRYG_Modal2(monthSelected, RecentMS, cellSelected, PlanFcst) {            

            console.log("updateRYG_Modal2 Start");
            $('#LOADING_RYG_Modal2').show();
            $('#recentRYG_Modal2DetailSection1').hide();
            $('#recentRYG_Modal2DetailSection2').hide();

            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(salesGeo);

            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();
            console.log('histcount pulldown month: ' + pulldown_month);

            var stringyearnum = pulldown_month.substring(0, 4);

            if (pulldown_month.substring(5, 6) == 0) {
                stringmonthnum = pulldown_month.substring(6, 7);
            }

            else {
                stringmonthnum = pulldown_month.substring(5, 7);
            }

            //console.log('stringmonthnum ' + stringmonthnum);

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
            console.log(monthSelected);
            var RecentMS = RecentMS;
            console.log(RecentMS);
            var RecentMStext = RecentMS;
            var RecentGroup = RecentMS;
            var rowSelected = RecentMS;
            var days = RecentMS;

            document.getElementById('Recent_PlanMS_Header_RYGModal2').innerHTML = RecentMS + ' Plan';
            document.getElementById('Recent_ForecastMS_Header_RYGModal2').innerHTML = RecentMS + ' Forecast';
            document.getElementById('Recent_ActualMS_Header_RYGModal2').innerHTML = RecentMS + ' Actual';

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_RYG_Modal2",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'geoVariable': salesGeo, 'yearVariable': stringyearnum, 'RecentMSVariable': RecentMS, 'PlanFcstVariable': PlanFcst }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    load_RYG_Modal2_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst); //function in frontpage below, 
                },
                error: function (data) {

                    alert('Unable to load map due to high number of jobs');

                }
            });
        }



        function load_RYG_Modal2_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected, PlanFcst) {  // Recent and Upcoming Detail after user clicks on a row

            data = JSON.parse(data.d);
            // $.fn.dataTable.moment('MM-DD-YYYY');
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];
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
                    order: [[19, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            recent_RYG_Modal2_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected, cellSelected, PlanFcst);
                        }
                    }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data


                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'PACE_NAME' },
                        { 'data': 'PROGRAM' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SUBGROUP' },
                        { 'data': 'RAN_AVP' },
                        { 'data': 'MARKET' },
                        { 'data': 'SUBMARKET' },
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
                        { 'data': 'ONAIR_PLAN' },
                        { 'data': 'ONAIR_FORECAST' },
                        { 'data': 'ONAIR_ACTUAL' }



                    ],


                    //Highlight rows that don't have lat longs in the detail table in Red
                    createdRow: function (row, data, index) {
                        if (isNaN(parseFloat(data["LATITUDE"])) || isNaN(parseFloat(data["LONGITUDE"]))) {
                            $(row).addClass('highlightRed');
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


            $('#LOADING_RYG_Modal2').hide();
            //$('#Recent_Top_Section').show();
            $('#recentRYG_Modal2DetailSection1').show();
            $('#recentRYG_Modal2DetailSection2').show();

            $(window).resize();

            recent_RYG_Modal2_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected, cellSelected, PlanFcst);
        }

        function recent_RYG_Modal2_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, days1, days2, days3, days4, monthSelected, cellSelected, PlanFcst) {

            var RYG_recent_lat_index = 21; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
            var RYG_recent_long_index = 22; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

            var MSSelected = "RECENT " + RecentMS;
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

            //console.log(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML);
            var minlat = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML);
            var minlong = parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML))) {
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
                concatlatlong[i] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML + $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    //console.log($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    recentFilteredTable[i][j] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                //console.log(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));

                if (isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                else if ($("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                    }

                    onairindex++;
                }
                else {
                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#RYG_Modal2_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
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

            document.getElementById('RYG_Modal2_mapcounttitle').innerHTML = salesGeo + ' NSB Map';
            document.getElementById('RYG_Modal2_mapcountsubtitle').innerHTML = stringyearnum + ' Actual (' + recentOnAirTable.length + ') and Remaining ' + PlanOrFcst + ' (' + recentUpcomingTable.length + ')';
            //document.getElementById('RYG_Modal2_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
            document.getElementById('RYG_Modal2_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            document.getElementById('RYG_Modal2_mapcountfooter2').innerHTML = NaNcountMessage;

            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();

            //console.log('test 1');
            //console.log(recentOnAirTable);
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                

                        */
                var popup = '<b>Category:</b> ' + recentOnAirTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentOnAirTable[i][2] +
                    '<br/><b>Program:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>Market:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentOnAirTable[i][11] + ', ' + recentOnAirTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentOnAirTable[i][10] + ', ' + recentOnAirTable[i][12] +                    
                    '<br/><b>Issued Date:</b> ' + recentOnAirTable[i][15] +
                    '<br/><b>USID:</b> ' + recentOnAirTable[i][19] +
                    '<br/><b>FA Code:</b> ' + recentOnAirTable[i][20] +
                    '<br/><b>Latitude:</b> ' + recentOnAirTable[i][RYG_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentOnAirTable[i][RYG_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentOnAirTable[i][23] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentOnAirTable[i][24] +
                    '<br/><b>ONAIR Actual:</b> ' + recentOnAirTable[i][25],

                    loc = [parseFloat(recentOnAirTable[i][RYG_recent_lat_index]), parseFloat(recentOnAirTable[i][RYG_recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#2E8B57'
                    };

                //console.log('test2');
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                OApoints.addLayer(marker);
            }

            //console.log('test3');

            for (i = 0; i < recentUpcomingTable.length; i++) {

                var popup = '<b>Category:</b> ' + recentUpcomingTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentUpcomingTable[i][2] +
                    '<br/><b>Program:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>Market:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentUpcomingTable[i][11] + ', ' + recentUpcomingTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentUpcomingTable[i][10] + ', ' + recentUpcomingTable[i][12] +                    
                    '<br/><b>Issued Date:</b> ' + recentUpcomingTable[i][15] +
                    '<br/><b>USID:</b> ' + recentUpcomingTable[i][19] +
                    '<br/><b>FA Code:</b> ' + recentUpcomingTable[i][20] +
                    '<br/><b>Latitude:</b> ' + recentUpcomingTable[i][PC_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentUpcomingTable[i][PC_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentUpcomingTable[i][23] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentUpcomingTable[i][24] +
                    '<br/><b>ONAIR Actual:</b> ' + recentUpcomingTable[i][25],

                    loc = [parseFloat(recentUpcomingTable[i][RYG_recent_lat_index]), parseFloat(recentUpcomingTable[i][RYG_recent_long_index])],	//position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: dotColor
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                Uppoints.addLayer(marker);
            }

            //console.log('test4');

            document.getElementById('RYG_Modal2_mapdiv').innerHTML = "<div id='RYG_Modal2_mapid' style='height: 450px;'></div>";

            var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satelite": sat
                //"Topo": topo
            };

            if (cellSelected == "ACT") {
                var map = L.map("RYG_Modal2_mapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, OApoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });
            } else {
                var map = L.map("RYG_Modal2_mapid", {
                    attributionControl: false,
                    center: [39.73, -104.99],
                    zoom: 10,
                    layers: [streets, Uppoints],
                    fullscreenControl: true,
                    fullscreenControlOptions: {
                        position: 'topleft'
                    }
                });
            }

            if (PlanFcst == "PLAN") {
                var overlays = {
                    "Recently Completed": OApoints,
                    "Upcoming POE": Uppoints
                };
            } else {
                var overlays = {
                    "Recently Completed": OApoints,
                    "Upcoming Forecasted": Uppoints
                };
            } 

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map);

            map.invalidateSize();
            map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return d === 'Recently Completed' ? "#2E8B57" :
                    d === 'Upcoming Forecasted' ? "#1E90FF" :
                d === 'Upcoming POE' ? "#808080" :
                        "#fffff";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map) {

                var div = L.DomUtil.create('div', 'info legend_RYG');
                if (PlanFcst == "PLAN") {
                    categories = ['Recently Completed', 'Upcoming POE'];
                } else {
                    categories = ['Recently Completed', 'Upcoming Forecasted'];
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

        // ********** RYG MODAL3 START **********

        var RYG_recent_lat_index = 23; //to allow for easier table updates, use this variable to indicate which column in the sql detail has lat
        var RYG_recent_long_index = 24; //to allow for easier table updates, use this variable to indicate which column in the sql detail has long

        //function updateRYG_MODAL3(rowSelected, RecentMS) {
        function updateRYG_Modal3(monthSelected, RecentMS, cellSelected) {
            console.log("updateRYG_Modal3 Start");
            $('#LOADING_RYG_Modal3').show();
            $('#recentRYG_Modal3DetailSection1').hide();
            $('#recentRYG_Modal3DetailSection2').hide();

            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').val();
            console.log(salesGeo);

            var pulldown_month = $('#<%= ddlMonth.ClientID %> option:selected').val();            

            var stringyearnum = pulldown_month.substring(0, 4);

            if (pulldown_month.substring(5, 6) == 0) {
                stringmonthnum = pulldown_month.substring(6, 7);
            }

            else {
                stringmonthnum = pulldown_month.substring(5, 7);
            }

            //console.log('stringmonthnum ' + stringmonthnum);

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
            console.log(monthSelected);
            var RecentMS = RecentMS;
            console.log(RecentMS);
            var RecentMStext = RecentMS;
            var RecentGroup = RecentMS;
            var rowSelected = RecentMS;
            var days = RecentMS;

            document.getElementById('Recent_PlanMS_Header_RYGModal3').innerHTML = RecentMS + ' Plan';
            document.getElementById('Recent_ForecastMS_Header_RYGModal3').innerHTML = RecentMS + ' Forecast';
            document.getElementById('Recent_ActualMS_Header_RYGModal3').innerHTML = RecentMS + ' Actual';

            $.ajax({
                type: "POST",
                async: true,
                url: "Production_Insights.aspx/Get_RYG_Modal3",  //use a function from C# , change this for different data return
                data: JSON.stringify({ 'geoVariable': salesGeo, 'yearVariable': stringyearnum, 'RecentMSVariable': RecentMS }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadPushPullCheck(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected); 
                },
                error: function (data) {

                    alert('Unable to load map due to high number of jobs');

                }
            });
        }

        function loadPushPullCheck(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected) {
            var json = JSON.parse(data.d);
            if (json.length <= 0) {
                $('#NODATA_SEARCH_RYG3').show();
                $('#LOADING_RYG_Modal3').hide();
                $('#ModalDisplay_RYG3').hide();
            }
            else {
                load_RYG_Modal3_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected);
            }
        }



        function load_RYG_Modal3_Detail(data, RecentMS, RecentMStext, RecentGroup, rowSelected, days, monthSelected, cellSelected) {  // Recent and Upcoming Detail after user clicks on a row

            data = JSON.parse(data.d);
            // $.fn.dataTable.moment('MM-DD-YYYY');
            var DATE1 = data[0]["DATE1"];
            var DATE2 = data[0]["DATE2"];
            var DATE3 = data[0]["DATE3"];
            var DATE4 = data[0]["DATE4"];
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
                    order: [[19, "asc"]], // order by On Air Forecast Desc (will show oldest recent on airs first)
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'RecentDetail_Export' }, { extend: 'excel', title: 'RecentDetail_Export' }, {
                        text: 'Update Map',
                        titleAttr: 'Update Map to apply the filters from the bottom of the table below',
                        action: function (e, dt, node, config) {
                            recent_RYG_Modal3_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected, cellSelected);
                        }
                    }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data


                        { 'data': 'CATEGORY' },
                        { 'data': 'PACE_NUMBER' },
                        { 'data': 'PACE_NAME' },
                        { 'data': 'PROGRAM' },
                        { 'data': 'SUBPROGRAM' },
                        { 'data': 'SUBGROUP' },
                        { 'data': 'RAN_AVP' },
                        { 'data': 'MARKET' },
                        { 'data': 'SUBMARKET' },
                        { 'data': 'STATE' },
                        { 'data': 'COUNTY' },
                        { 'data': 'CITY' },
                        { 'data': 'ZIP_CODE' },
                        { 'data': 'RAN_INITIATIVE' },
                        { 'data': 'SPECTRUM' },
                        { 'data': 'CIVIL_VENDOR' },
                        { 'data': 'SA_VENDOR' },
                        { 'data': 'ISSUED_DATE' },
                        { 'data': RecentMS + '_PLAN' },
                        { 'data': RecentMS + '_FORECAST' },
                        { 'data': RecentMS + '_ACTUAL' },
                        { 'data': 'USID' },
                        { 'data': 'FA_CODE' },
                        { 'data': 'LATITUDE' },
                        { 'data': 'LONGITUDE' },
                        { 'data': 'ONAIR_PLAN' },
                        { 'data': 'ONAIR_FORECAST' },
                        { 'data': 'ONAIR_ACTUAL' }



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


            $('#LOADING_RYG_Modal3').hide();
            //$('#Recent_Top_Section').show();
            $('#recentRYG_Modal3DetailSection1').show();
            $('#recentRYG_Modal3DetailSection2').show();

            $(window).resize();

            recent_RYG_Modal3_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, DATE1, DATE2, DATE3, DATE4, monthSelected, cellSelected);
        }

        function recent_RYG_Modal3_Map(RecentMS, RecentMStext, RecentGroup, rowSelected, days, days1, days2, days3, days4, monthSelected, cellSelected) {

            var MSSelected = "PUSH " + RecentMS;
            var salesGeo = $('#<%= ddlMarket.ClientID %> option:selected').text();

            var recentSelectedCount = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childElementCount;
            var recentDetailColCount = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childElementCount;

            console.log("RYG_Modal3_Map_Testpoint_Start");
            console.log(recentSelectedCount);
            console.log(recentDetailColCount);

            var j = 0;
            var i = 0;

            //console.log(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[21].innerHTML));

            //initialize max and min lat/longs based on the first row. If the first row does not have Lat Longs then use arbitrary max lat longs based on size of USA
            var maxlat = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML);
            var minlat = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML);
            var maxlong = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML);
            var minlong = parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML);

            if (isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[0].childNodes[RYG_recent_long_index].innerHTML))) {
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
                concatlatlong[i] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML + $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML;

                if (isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                    //dont adjust max min based on NaN
                    NaNcount++;
                }

                else {
                    maxlat = Math.max(maxlat, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));
                    minlat = Math.min(minlat, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));
                    maxlong = Math.max(maxlong, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML));
                    minlong = Math.min(minlong, parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML));
                }


                for (j = 0; j < recentDetailColCount; j++) {
                    //console.log($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML);
                    recentFilteredTable[i][j] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[j].innerHTML;

                }

                //console.log(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML));

                if (isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_lat_index].innerHTML)) || isNaN(parseFloat($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[RYG_recent_long_index].innerHTML))) {
                    //dont map if lat or long is NaN
                    ;
                }

                else if ($("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[0].innerHTML == MSSelected) {

                    for (k = 0; k < recentDetailColCount; k++) {
                        recentOnAirTable[onairindex][k] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[k].innerHTML;
                    }

                    onairindex++;
                }
                else {
                    for (l = 0; l < recentDetailColCount; l++) {
                        recentUpcomingTable[upcomingindex][l] = $("#RYG_Modal3_Recent_Detail").get(0).lastChild.childNodes[i].childNodes[l].innerHTML;
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

            if (monthSelected == '%') {
                monthSelectedtext = 'Current Year'
            }
            else {
                monthSelectedtext = monthSelected
            }

            document.getElementById('RYG_Modal3_mapcounttitle').innerHTML = salesGeo + ' Production Curve NSB Map';
            document.getElementById('RYG_Modal3_mapcountsubtitle').innerHTML = monthSelectedtext + ' Pull (' + recentUpcomingTable.length + ') and Push (' + recentOnAirTable.length + ') Jobs';
            //document.getElementById('RYG_Modal3_mapcountsubtitle2').innerHTML = 'Recently Actualized (' + days1 + ' to ' + days2 + ') and Upcoming Forecasted (' + days3 + ' to ' + days4 + ')';
            document.getElementById('RYG_Modal3_mapcountfooter').innerHTML = 'Job Count: ' + recentSelectedCount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unique Lat/Long Pairs: ' + latlongdistinctcount + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
            document.getElementById('RYG_Modal3_mapcountfooter2').innerHTML = NaNcountMessage;

            var OApoints = new L.layerGroup();
            var Uppoints = new L.layerGroup();

            //console.log('test 1');
            //console.log(recentOnAirTable);
            for (i in recentOnAirTable) {

                /*
                var title = OA[i].PACE_NAME,  //value searched                

                        */
                var popup = '<b>Category:</b> ' + recentOnAirTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentOnAirTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentOnAirTable[i][2] +
                    '<br/><b>Program:</b> ' + recentOnAirTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentOnAirTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentOnAirTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentOnAirTable[i][6] +
                    '<br/><b>Market:</b> ' + recentOnAirTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentOnAirTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentOnAirTable[i][11] + ', ' + recentOnAirTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentOnAirTable[i][10] + ', ' + recentOnAirTable[i][12] +
                    '<br/><b>Civil Vendor:</b> ' + recentOnAirTable[i][15] +
                    '<br/><b>Site Acq Vendor:</b> ' + recentOnAirTable[i][16] +
                    '<br/><b>Issued Date:</b> ' + recentOnAirTable[i][17] +
                    '<br/><b>USID:</b> ' + recentOnAirTable[i][21] +
                    '<br/><b>FA Code:</b> ' + recentOnAirTable[i][22] +
                    '<br/><b>Latitude:</b> ' + recentOnAirTable[i][RYG_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentOnAirTable[i][RYG_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentOnAirTable[i][25] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentOnAirTable[i][26] +
                    '<br/><b>ONAIR Actual:</b> ' + recentOnAirTable[i][27],

                    loc = [parseFloat(recentOnAirTable[i][RYG_recent_lat_index]), parseFloat(recentOnAirTable[i][RYG_recent_long_index])],	//position found
                    recentOnAirTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#ff7f00'
                    };

                //console.log('test2');
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentOnAirTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                OApoints.addLayer(marker);
            }

            //console.log('test3');

            for (i = 0; i < recentUpcomingTable.length; i++) {

                var popup = '<b>Category:</b> ' + recentUpcomingTable[i][0] +
                    '<br/><b>PACE Number:</b> ' + recentUpcomingTable[i][1] +
                    '<br/><b>PACE Name:</b> ' + recentUpcomingTable[i][2] +
                    '<br/><b>Program:</b> ' + recentUpcomingTable[i][3] +
                    '<br/><b>Subprogram:</b> ' + recentUpcomingTable[i][4] +
                    '<br/><b>Subgroup:</b> ' + recentUpcomingTable[i][5] +
                    '<br/><b>AVP:</b> ' + recentUpcomingTable[i][6] +
                    '<br/><b>Market:</b> ' + recentUpcomingTable[i][7] +
                    '<br/><b>Submarket:</b> ' + recentUpcomingTable[i][8] +
                    '<br/><b>City, State:</b> ' + recentUpcomingTable[i][11] + ', ' + recentUpcomingTable[i][9] +
                    '<br/><b>County, Zip Code:</b> ' + recentUpcomingTable[i][10] + ', ' + recentUpcomingTable[i][12] +
                    '<br/><b>Civil Vendor:</b> ' + recentUpcomingTable[i][15] +
                    '<br/><b>Site Acq Vendor:</b> ' + recentUpcomingTable[i][16] +
                    '<br/><b>Issued Date:</b> ' + recentUpcomingTable[i][17] +
                    '<br/><b>USID:</b> ' + recentUpcomingTable[i][21] +
                    '<br/><b>FA Code:</b> ' + recentUpcomingTable[i][22] +
                    '<br/><b>Latitude:</b> ' + recentUpcomingTable[i][PC_recent_lat_index] +
                    '<br/><b>Longitude:</b> ' + recentUpcomingTable[i][PC_recent_long_index] +
                    '<br/><b>ONAIR Plan:</b> ' + recentUpcomingTable[i][25] +
                    '<br/><b>ONAIR Forecast:</b> ' + recentUpcomingTable[i][26] +
                    '<br/><b>ONAIR Actual:</b> ' + recentUpcomingTable[i][27],

                    loc = [parseFloat(recentUpcomingTable[i][RYG_recent_lat_index]), parseFloat(recentUpcomingTable[i][RYG_recent_long_index])],	//position found
                    recentUpcomingTableoptions = {
                        iconShape: 'doughnut',
                        iconSize: [12, 12],
                        borderWidth: 4,
                        borderColor: '#008000'
                    };
                marker = new L.Marker(new L.latLng(loc), { icon: L.BeautifyIcon.icon(recentUpcomingTableoptions) });
                marker.setOpacity(.7);
                marker.bindPopup(popup);
                Uppoints.addLayer(marker);
            }

            //console.log('test4');

            document.getElementById('RYG_Modal3_mapdiv').innerHTML = "<div id='RYG_Modal3_mapid' style='height: 450px;'></div>";

            var topo = L.tileLayer('http://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
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
                //"<span style='color: gray'>Grayscale</span>": grayscale,
                "Satelite": sat
                //"Topo": topo
            };

            var map = L.map("RYG_Modal3_mapid", {
                attributionControl: false,
                center: [39.73, -104.99],
                zoom: 10,
                layers: [streets, OApoints, Uppoints],
                fullscreenControl: true,
                fullscreenControlOptions: {
                    position: 'topleft'
                }
            });

            //if (cellSelected == "PUSH") {
            //    var map = L.map("RYG_Modal3_mapid", {
            //        attributionControl: false,
            //        center: [39.73, -104.99],
            //        zoom: 10,
            //        layers: [streets, OApoints]
            //    });
            //} else {
            //    var map = L.map("RYG_Modal3_mapid", {
            //        attributionControl: false,
            //        center: [39.73, -104.99],
            //        zoom: 10,
            //        layers: [streets, Uppoints]
            //    });
            //}

            var overlays = {
                "2020 Push Outs": OApoints,
                "2020 Pull Ins": Uppoints
            };

            var options = {
                modal: true,
                position: 'topleft',
                title: "Box area zoom"
            };
            var control = L.control.zoomBox(options);

            map.addControl(control);

            L.control.scale({ metric: false }).addTo(map);

            L.control.layers(baseLayers, overlays, { collapsed: false }).addTo(map);

            L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map);

            map.invalidateSize();
            map.fitBounds([[minlat - .1, minlong - .1], [maxlat + .1, maxlong + .1]]);

            function getColor(d) {
                return d === '2020 Push Outs' ? "#ff7f00" :
                    d === '2020 Pull Ins' ? "#008000" :
                        "#ff7f00";
            }

            var legend = L.control({ position: 'bottomright' });

            legend.onAdd = function (map) {

                var div = L.DomUtil.create('div', 'info legend_RYG_PushPull');
                categories = ['2020 Push Outs', '2020 Pull Ins'];

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

    </script>


</asp:Content>


