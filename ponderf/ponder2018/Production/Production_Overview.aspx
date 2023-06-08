<%@ Page Title="Production Overview" Language="C#" MasterPageFile="~/MasterPageProduction.master" AutoEventWireup="true" CodeFile="Production_Overview.aspx.cs" Inherits="Production_Production_Overview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/variwide.js"></script>
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

    <%--<div class="d-flex align-items-center">
        <div class="mr-auto">--%>
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Production Overview
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
        <%--</div>--%>

        <%--Search Function--%>
        <%-- <input type="search" id="txtSearch" value="" style="width: 425px; height: 35px; float: right;" placeholder="Search (FA, USID, Site ID, PACE Number, iPlan Job Number)" spellcheck="false" autocomplete="off" onkeypress="return searchKeyPress(event);" />

        <button type="button" class="btn btn-primary btn-md" id="btnSearch" data-toggle="modal" data-target="#m_modal_search">
            <span>
                <i class="fa flaticon-search"></i>
                <span>Search</span>
            </span>
        </button>--%>
        <%--End Search Function--%>
    <%--</div>--%>

    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <%--<h5 class="left">Date Of Data: &nbsp; </h5>
                    <h5 class="left" id="DATADATE"></h5>--%>

                    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>

                            
                            <asp:Label ID="labelMarketType" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Market Type: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                           <asp:DropDownList ID="ddlMarketType" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server"> 
                            </asp:DropDownList>



                            
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
                                            <i class="flaticon-map"></i><span class="m--visible-desktop-inline-block">5G mmWave</span>
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


                                                        <div class="row">
                                                        <div class="col-lg-12" id ="NSB_div">
                                                            <div id="LOADING_tab1" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>

                                                            <div id="div2_tab1" class="m-section__content" style="height: 100%; width: 100%;"> 

                                                                <div id="BAR_CHART_tab1"> </div>
                                                                <div id="NSB_variwide"> </div>

                                                                <table id="Table_Tab1" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                   
                                                                    <thead>
                                                                         <tr>
                                                                             <th bgcolor="#87CEFA"><span class="large_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="small_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Plan</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Forecast</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Actual</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> YTD Plan</th>
                                                                             <th bgcolor="#87CEFA">Actual vs YTD Plan Delta</th>
                                                                             <%--<th bgcolor="#87CEFA">% of YTD Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Actual vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>--%>
                                                                        </tr>
                                                                    </thead>
                                                                     <tfoot>
                                                                            <tr>
                                                                            <th bgcolor="#87CEFA"><span class="large_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="small_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Plan</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Forecast</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Actual</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> YTD Plan</th>
                                                                             <th bgcolor="#87CEFA">Actual vs YTD Plan Delta</th>
                                                                             <%--<th bgcolor="#87CEFA">% of YTD Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>--%>
                                                                            </tr>
                                                                    </tfoot>
                                                             </table>

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
                                                <div class="row">

                                                        <div class="col-lg-12" id ="CRAN_div">
                                                            <div id="LOADING_tab3" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="div2_tab3" class="m-section__content" style="height: 100%; width: 100%;">

                                                            <div id="BAR_CHART_tab3"> </div>

                                                            <div id="CRAN_Region_div" class="m-section__content" style="height: 100%; width: 100%;"> 
                                                                <table id="Table_Tab3" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                   <thead>
                                                                         <tr>
                                                                             <th bgcolor="#87CEFA"><span class="large_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="small_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Plan</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Forecast</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Actual</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> YTD Plan</th>
                                                                             <th bgcolor="#87CEFA">Actual vs YTD Plan Delta</th>
                                                                             <%--<th bgcolor="#87CEFA">% of YTD Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Actual vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>--%>
                                                                        </tr>
                                                                    </thead>
                                                                     <tfoot>
                                                                            <tr>
                                                                            <th bgcolor="#87CEFA"><span class="large_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="small_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Plan</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Forecast</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Actual</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> YTD Plan</th>
                                                                             <th bgcolor="#87CEFA">Actual vs YTD Plan Delta</th>
                                                                             <%--<th bgcolor="#87CEFA">% of YTD Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>--%>
                                                                            </tr>
                                                                    </tfoot>
                                                             </table>

                                                          </div>


                                                      </div>
                                                      </div>
                                                    </div>


                                            </div>
                                       
                                    </div>

                                    <div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
                                            <div class="m-portlet__head-caption">
                                                <div class="row">
                                                    

                                                        <div class="col-lg-12" id ="MMW_div">
                                                            <div id="LOADING_tab4" style='display: none'>
                                                                <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                                                            </div>
                                                            <div id="div2_tab4" class="m-section__content" style="height: 100%; width: 100%;">

                                                            <div id="BAR_CHART_tab4"> </div>

                                                            <div id="MMW_Region_div" class="m-section__content" style="height: 100%; width: 100%;"> 
                                                                <table id="Table_Tab4" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                                                    <thead>
                                                                         <tr>
                                                                             <th bgcolor="#87CEFA"><span class="large_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="small_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Plan</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Forecast</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Actual</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> YTD Plan</th>
                                                                             <th bgcolor="#87CEFA">Actual vs YTD Plan Delta</th>
                                                                             <%--<th bgcolor="#87CEFA">% of YTD Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Actual vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>--%>
                                                                        </tr>
                                                                    </thead>
                                                                     <tfoot>
                                                                            <tr>
                                                                            <th bgcolor="#87CEFA"><span class="large_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="small_geo"></span></th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Plan</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Forecast</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> Actual</th>
                                                                             <th bgcolor="#87CEFA"><span class="current_year"></span> YTD Plan</th>
                                                                             <th bgcolor="#87CEFA">Actual vs YTD Plan Delta</th>
                                                                             <%--<th bgcolor="#87CEFA">% of YTD Plan Actualized</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>
                                                                             <th bgcolor="#87CEFA">Forecast vs Plan Delta</th>
                                                                             <th bgcolor="#87CEFA">% of Plan in Forecast</th>--%>
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
    <%--</div>--%>

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

            var curmonth = ''; //give curmonth global scope
            var showcolumn = true; //give showcolumn global scope

            var largeGeoShow = true; // Shows (true) or Hides (false) the Large Geo. Want to hide (false) if we are looking at Regions
            var largeGeo = 'Region';
            var smallGeo = 'Market';

            var marketType = 'ACE - MARKETS';

            //adjust the pptp hiearchy based on tab number
            var pptp1 = 'NSB ALL';
            var pptp2 = 'NSB All In Market';
            var pptp3 = '%';
            var pptp4 = '%';
            var pptp5 = '%';

            var activeTab = 1; //change this when the user clicks on a tab

            var tab1Loaded = 0;
            var tab2Loaded = 0;
            var tab3Loaded = 0;
            var tab4Loaded = 0;


            $(document).ready(function () {

                console.log("DocReady");

                attachClickHandlers();

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Overview.aspx/GetDATADATE",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        loadDATADATE(data);
                    },
                    error: function (data) {
                    }
                });



                trigger_Data(marketType, activeTab, pptp1, pptp2, pptp3, pptp4, pptp5);


                var tabpane1 = document.getElementById("m_tabs_1_1");
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
                tab3.classList.remove("active");
                tab4.classList.remove("active");
                //tab5.classList.remove("active");
                //tab6.classList.remove("active");
                //tab7.classList.remove("active");
                //tab8.classList.remove("active");
            });

            $('.nav-tabs li').on('click', function () {
                setTimeout(function () {
                    $(window).resize();
                }, 0);
            });

            $('#tab3').on('click', function (e) {
                //$('#LOADING_Recent2_CRAN').show();


                activeTab = 3;
                console.log(activeTab + 'clicked');

                tabClicked(activeTab)



            });

            $('#tab4').on('click', function (e) {
                //$('#LOADING_Recent2_MMW').show();



                activeTab = 4;
                console.log(activeTab + 'clicked');

                tabClicked(activeTab)


            });

            function attachClickHandlers() {
                console.log('market change test');
                $('#ddlMarketType').change(
                    function () { // console log the new selection, update market Type, reset all tabs to unloaded, trigger data
                        var marketchange = $('#ddlMarketType option:selected').text();
                        console.log('market change: ' + marketchange);
                        marketType = marketchange;
                        tab1Loaded = 0;
                        tab2Loaded = 0;
                        tab3Loaded = 0;
                        tab4Loaded = 0;
                        trigger_Data(marketType, activeTab, pptp1, pptp2, pptp3, pptp4, pptp5);
                    });
            }


            function tabClicked(activeTab) {

                //update pptp hierarchy and grab loaded state of tab
                var activeTabLoaded;

                if (activeTab == 1) {
                    pptp1 = 'NSB ALL';
                    pptp2 = 'NSB All In Market';
                    pptp3 = '%';
                    pptp4 = '%';
                    pptp5 = '%';
                    activeTabLoaded = tab1Loaded;
                }

                else if (activeTab == 2) {
                    pptp1 = 'NSB ALL';
                    pptp2 = 'NSB All In Market';
                    pptp3 = '%';
                    pptp4 = '%';
                    pptp5 = '%';
                    activeTabLoaded = tab2Loaded;
                }

                else if (activeTab == 3) {
                    pptp1 = 'CRAN ALL';
                    pptp2 = 'CRAN Combined';
                    pptp3 = 'CRAN 1C Node';
                    pptp4 = '%';
                    pptp5 = '%';
                    activeTabLoaded = tab3Loaded;
                }

                else if (activeTab == 4) {
                    pptp1 = '5G mmWave ALL';
                    pptp2 = '5G mmWave All Nodes';
                    pptp3 = '%';
                    pptp4 = '%';
                    pptp5 = '%';
                    activeTabLoaded = tab4Loaded;
                }

                if (activeTabLoaded == 0) { // trigger process to pull data and set the tab to loaded
                    trigger_Data(marketType, activeTab, pptp1, pptp2, pptp3, pptp4, pptp5)
                    if (activeTab == 1) { tab1Loaded = 1; }
                    if (activeTab == 2) { tab2Loaded = 1; }
                    if (activeTab == 3) { tab3Loaded = 1; }
                    if (activeTab == 4) { tab4Loaded = 1; }
                }

                else {
                    //show and hide already loaded charts?
                }

            }




            function loadDATADATE(data) {
                //Parse Data Date, Create ISO String format for query, Create 3 letter Month for spans
                var score = JSON.parse(data.d);
                var value = score[0]["DATADATE"];
                document.getElementById('DATADATE').innerHTML = "Date of Data: " + value;
                var d = new Date(value);
                var curyear = d.getFullYear();
                console.log(curyear);

                var isostring = d.toISOString();
                var datestring = isostring.substring(0, 10);

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

                curmonth = month[d.getMonth()];

                if (curmonth == "Jan") {
                    showcolumn = false; //showcolumn is a global variable used to hide cumulative columns if the data date is in January
                }

                //console.log('curmonth inside loadDATADATE function: ' + curmonth);

                var curyearClasses = document.getElementsByClassName('current_year');
                for (var i = 0; i < curyearClasses.length; i++) {
                    curyearClasses[i].innerHTML = curyear;
                }

                var curmonthClasses = document.getElementsByClassName('current_month');
                for (var i = 0; i < curmonthClasses.length; i++) {
                    curmonthClasses[i].innerHTML = curmonth;
                }


            }


            function trigger_Data(marketType, activeTab, pptp1, pptp2, pptp3, pptp4, pptp5) {

                $('#LOADING_tab' + activeTab).show();
                $('#div2_tab' + activeTab).hide();

                $.ajax({
                    type: "POST",
                    async: true,
                    url: "Production_Overview.aspx/Get_Production_Numbers",
                    data: JSON.stringify({ 'MarketTypeVariable': marketType, 'pptpOneVariable': pptp1, 'pptpTwoVariable': pptp2, 'pptpThreeVariable': pptp3, 'pptpFourVariable': pptp4, 'pptpFiveVariable': pptp5 }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        load_Production(data, activeTab, marketType);
                        //load_NSB_variwide(data);
                        BC_data = JSON.parse(data.d);
                        //loadBarChart(BC_data, chartDiv + tabName, chartTitle, chartSubtitle, SVNum, tabName, pptp1, pptp2, pptp3, pptp4, pptp5, tabCategory);
                        loadBarChart(BC_data, 'BAR_CHART_tab' + activeTab, '', 'YTD Plan & Actuals', '1', '_tab' + activeTab, pptp1, pptp2, pptp3, pptp4, pptp5, 'tabCategory');

                    },
                    error: function (data) {
                        $('#LOADING_tab' + activeTab).hide();
                    }
                });
            }

            function load_Production(data, activeTab, marketType) {

                console.log('load Production function start');

                //adjust the tables to hide large geo if needed, and to have correct column header
                if (marketType == 'SALES - REGIONS') { largeGeoShow = false; smallGeo = 'Sales Region'; }
                else if (marketType == 'ACE - REGIONS') { largeGeoShow = false; smallGeo = 'ACE Region'; }
                else if (marketType == 'ACE - AVPS') { largeGeoShow = true; smallGeo = 'ACE AVP'; largeGeo = 'ACE Region'; }
                else if (marketType == 'ACE - MARKETS') { largeGeoShow = true; smallGeo = 'ACE Market'; largeGeo = 'ACE Region'; }
                else if (marketType == 'SALES - VPGM MARKETS') { largeGeoShow = true; smallGeo = 'Sales VPGM Market'; largeGeo = 'Sales Region'; } 

                var largeGeoClasses = document.getElementsByClassName('large_geo');
                for (var i = 0; i < largeGeoClasses.length; i++) {
                    largeGeoClasses[i].innerHTML = largeGeo;
                }

                var smallGeoClasses = document.getElementsByClassName('small_geo');
                for (var i = 0; i < smallGeoClasses.length; i++) {
                    smallGeoClasses[i].innerHTML = smallGeo;
                }

                data = JSON.parse(data.d);


                if (data.length <= 0) {
                    console.log('No Data Returned');
                    return;
                }
                else {

                    $('#Table_Tab' + activeTab).dataTable().fnDestroy(); //destroy old table
                    $.fn.dataTable.moment('MM-DD-YYYY');
                    $('#Table_Tab' + activeTab).DataTable({ //build new table
                        orderCellsTop: false,
                        fixedHeader: false,
                        paging: false,
                        sort: true,
                        scrollY: 275,
                        scrollCollapse: true,
                        scrollX: true,
                        order: [[4, "desc"]],
                        searching: true,
                        data: data,
                        info: false,
                        binfo: true,
                        dom: 'Bfrtip',
                        buttons: [{ extend: 'csv', title: 'Production Overview Export' }, { extend: 'excelHtml5', title: 'Production Overview Export' }],

                        columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data

                            //{ 'visible': showcolumn,  'data': 'CUM_POE_NSB' }, // Example of how to dynamically hide

                            { 'visible': largeGeoShow, 'data': 'LARGE_GEO' },
                            { 'data': 'SMALL_GEO' },
                            { 'data': 'PLAN' },
                            { 'data': 'FCST' },
                            { 'data': 'ACT' },
                            { 'data': 'YTDPLAN' },
                            { 'data': 'ACT_YTDPLAN_DELTA' }
                            //{ 'data': 'ACT_YTDPLAN_PERCENT' },
                            //{ 'data': 'PLAN_ACT_DELTA' },
                            //{ 'data': 'ACT_PLAN_PERCENT' },
                            //{ 'data': 'FCST_PLAN_DELTA' },
                            //{ 'data': 'FCST_PLAN_PERCENT' }
                        ],



                        "fnDrawCallback": function () {

                            //Highlight the selected row of a data table in silver on mouseover, remove on mouseout
                            $('#Table_Tab' + activeTab + 'tr').find('td').each(function () {
                                $(this).on('mouseover', function () {
                                    $(this).parent().css('background', 'silver');

                                    this.style.cursor = 'pointer';
                                }).on('mouseout', function () {
                                    $(this).parent().css('background', 'transparent');
                                    this.style.cursor = 'default';
                                });

                            });

                        },

                        rowCallback: function (row, data, index) {

                            //Bold the Regions and National rows
                            if (data['SALES_VPGM_MARKET'] == 'ALL') {
                                $(row).css('font-weight', 'bold');
                            }

                            //GYR

                            var colorcodingcoloffset;

                            if (largeGeoShow) { colorcodingcoloffset = 1; }
                            else { colorcodingcoloffset = 0; }

                            if (data['YTDPLAN'] == 0) {
                                $(row).find('td:eq(' + (5 + colorcodingcoloffset) + ')').css('background', 'LightGreen');
                                $(row).find('td:eq(' + (0 + colorcodingcoloffset) + ')').css('background', 'LightGreen');
                                //$(row).find('td:eq(6)').css('color', 'Green');
                            }

                            else if (data['ACT'] / data['YTDPLAN'] >= 1) {
                                $(row).find('td:eq(' + (5 + colorcodingcoloffset) + ')').css('background', 'LightGreen');
                                $(row).find('td:eq(' + (0 + colorcodingcoloffset) + ')').css('background', 'LightGreen');
                            }

                            //else if (data['ACT'] / data['YTDPLAN'] >= .8) {
                            //    $(row).find('td:eq(' + colorcodingcol+ ')').css('background', 'Khaki');
                            //    $(row).find('td:eq(6)').css('background', 'Khaki');
                            //}

                            else {
                                $(row).find('td:eq(' + (5 + colorcodingcoloffset) + ')').css('background', 'LightCoral');
                                $(row).find('td:eq(' + (0 + colorcodingcoloffset) + ')').css('background', 'LightCoral');
                            } 

                            if (data['PLAN'] == 0) {
                                $(row).find('td:eq(11)').css('background', 'LightGreen');
                            }

                            else if (data['FCST'] / data['PLAN'] >= 1) {
                                $(row).find('td:eq(11)').css('background', 'LightGreen');
                            }

                            else {
                                $(row).find('td:eq(11)').css('background', 'LightCoral');
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
                        }
                    });

                }

                //console.log('curmonth inside loadNSBREGION function: ' + curmonth);

                $(window).resize();

            }


            var barChart;

            function loadBarChart(BarChart_data, chart_div_name, marketTitle, marketSubTitle, SVNum, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory) {
                var BarChart_series_values = [];
                var keys = Object.keys(BarChart_data[0]);

                for (var k = 0; k < keys.length; k++) {
                    var a = [];
                    for (var j = 0; j < BarChart_data.length; j++) {
                        if (k == 0) {
                            a.push(BarChart_data[j][0]);
                        } else {
                            a.push(BarChart_data[j][keys[k]]);
                        }
                    }
                    BarChart_series_values.push(a);
                }

                createBarChart(BarChart_series_values[SVNum], chart_div_name, marketTitle, marketSubTitle, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory, BarChart_data);

                var j = 4
                barChart.addSeries({
                    name: 'YTD On-Air Actual',
                    id: 'On-Air Actual',
                    data: BarChart_series_values[j],
                    animation: false,
                    showInLegend: true,
                    color: '#3CB371'
                }, false);
                var j = 5
                barChart.addSeries({
                    name: 'YTD On-Air Plan (POE)',
                    id: 'Plan',
                    data: BarChart_series_values[j],
                    animation: false,
                    showInLegend: true,
                    color: '#A9A9A9'
                }, false); 

                $('#LOADING_tab' + activeTab).hide();
                $('#div2_tab' + activeTab).show(); 
                $('#LOADING_tab1').hide();
                $('#div2_tab1').show();

                barChart.redraw();
            }

            function createBarChart(chartxaxis, chart_div_name, chart_title, chart_subtitle, tabName, pptp_custom_one, pptp_custom_two, pptp_custom_three, pptp_custom_four, pptp_custom_five, tabCategory, BarChart_data) {

                Highcharts.setOptions({
                    lang: {
                        thousandsSep: ','
                    },
                    //colors: ['#808080', '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                });
                barChart = new Highcharts.Chart({
                    chart: {
                        type: 'column',
                        renderTo: chart_div_name,
                        backgroundColor: "#FFFFFF",
                        spacingBottom: 5,
                        zoomType: 'xy',
                        height: '350',
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
                            fontSize: "14px",
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
                        //type: 'category',
                        //labels: {

                        //    rotation: 270
                        //}
                        categories: chartxaxis,
                        title: {
                            enabled: false
                        },
                        labels: {
                            rotation: 270
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
                    },
                        //{//Secondary yAxis
                        //title: {
                        //    text: 'Cumulative',
                        //    style: {
                        //        fontSize: "12px"
                        //    }
                        //},
                        //labels: {
                        //    style: {
                        //        fontSize: "12px"
                        //    }
                        //},
                        //opposite: true
                        //}
                    ],
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
                window.setTimeout(function () { barChart.reflow(); });
                $(window).resize();

            }

            function load_NSB_variwide(data) {

                console.log('load_NSB_variwide function start');

                //var widthAdj = 1;

                var variwide_title = '2020 NSBs, Actual vs YTD Plan Delta';
                var variwide_series_title = 'NSB Actual vs YTD Plan Delta';
                var zero_width = [];
                var zero_width_count = 0;
                var subcaption = '';

                console.log(data);

                dataseries = JSON.parse(data.d);

                var seriesData = [];
                for (var i = 0; i < dataseries.length; i++) {
                    if (dataseries[i]["ACT"] == 0) {
                        zero_width[zero_width_count] = dataseries[i]["SMALL_GEO"];
                        zero_width_count++;
                    }
                    seriesData.push([dataseries[i]["SMALL_GEO"], dataseries[i]["ACT_YTDPLAN_DELTA"], dataseries[i]["ACT"]]); // x, y, z
                }

                if (zero_width_count > 0) {

                    if (zero_width_count == 1) {
                        subcaption = zero_width[zero_width.length - 1] + ' has zero width'
                    }

                    else {

                        for (var i = 0; i < zero_width.length - 1; i++) {
                            subcaption += zero_width[i] + ', ';
                        }

                        subcaption += zero_width[zero_width.length - 1] + ' have zero width';
                    }


                }


                seriesData.sort(function (a, b) { return b[2] - a[2] });  //sort by 3rd column desc


                console.log(seriesData);

                var weightadj = 5;
                Highcharts.chart('NSB_variwide', {

                    chart: {
                        type: 'variwide'
                    },

                    credits: {
                        enabled: false
                    },

                    title: {
                        text: variwide_title
                    },

                    yAxis: {
                        title: {
                            enabled: false
                        },
                        labels: {
                            format: '{value}'  // can do '{value} to YTD Plan'
                        }
                    },


                    xAxis: {
                        type: 'category',
                        labels: {

                            rotation: 270
                        }
                    },

                    plotOptions: {
                        series: {
                            minPointLength: 3
                        },

                        variwide: {
                            zones: [{
                                value: 0, // Values up to 0 (not including) ...
                                color: 'LightCoral'
                            }, {
                                color: 'LightGreen' // Values from 0 (including)
                            }]
                        }
                    },

                    caption: {
                        text: 'Column widths are proportional to NSB Actuals' + '<br/>' + subcaption + ' (no NSB Actuals)' + '<br/>' + 'Sorted by NSB Actuals'
                    },

                    legend: {
                        enabled: false
                    },

                    series: [{
                        name: variwide_series_title,
                        data: seriesData,

                        // ['NORTHERN PLAINS', 7.69, 10 + weightadj],

                        dataLabels: {
                            enabled: true,
                            style: {
                                fontWeight: 'bold',
                                color: 'black'
                            },
                            format: '{point.y:,.0f}'
                        },
                        tooltip: {
                            pointFormat: 'Actuals vs YTD Plan Delta: <b> {point.y}</b><br>' +
                                'Actuals: <b> {point.z} NSBs</b><br>'
                        },
                        colorByPoint: false,
                        borderWidth: 0,
                        pointPadding: 0.01
                    }]

                });

                $(window).resize();

            }




            $('.nav-tabs li').click(function () {
                $(window).resize();
                $(window).resize();
            });
        }

    </script>


</asp:Content>


