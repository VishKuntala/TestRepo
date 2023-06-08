<%@ Page Title="B14 mPilot Scheduler Testing" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mPilot_Scheduler_Testing.aspx.cs" Inherits="toolsandauto_mPilot_Scheduler_Testing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />    
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <%--<script src="https://code.highcharts.com/modules/exporting.js"></script>--%>
    <%--<script src="https://code.highcharts.com/modules/export-data.js"></script>--%>
    <script src="https://rudovjan.github.io/highcharts-tooltip-delay/tooltip-delay.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>

    <%--<link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>--%>

    <link href="../tabulator4_2/dist/css/tabulator.css" rel="stylesheet">
    <script type="text/javascript" src="../tabulator4_2/dist/js/tabulator.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.4.0/dist/leaflet.css" integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA==" crossorigin="" />
    <link href="../capacity/maps/src/leaflet-search.css" rel="stylesheet" />
    <link href="../capacity/maps/leaflet-beautify-marker-icon.css" rel="stylesheet" />
    <link href="../capacity/maps/L.Control.ZoomBox.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.Aggregations.css" rel="stylesheet" />
    <link href="../capacity/maps/clustermap/dist/MarkerCluster.Default.css" rel="stylesheet" />

    <script src="https://unpkg.com/leaflet@1.4.0/dist/leaflet.js" integrity="sha512-QVftwZFqvtRNi0ZyCtsznlKSWOStnDORoefr1enyq5mVL4tmKB3S/EnC3rRJcxCPavG10IcrVGSmPh6Qw5lwrg==" crossorigin=""></script>
    <script src="../capacity/maps/src/leaflet-search.js"></script>
    <script src="../capacity/maps/leaflet-beautify-marker-icon.js"></script>
    <script src="../capacity/maps/L.Control.ZoomBox.js"></script>
    <script src="../capacity/maps/clustermap/dist/leaflet.markercluster-regionbound.min.js"></script>
    <script src="../capacity/maps/clustermap/layersupport.js"></script>
    <script src="../capacity/maps/clustermap/leaflet.featuregroup.subgroup.js"></script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.10.18/b-1.5.6/b-flash-1.5.6/b-html5-1.5.6/fh-3.1.4/sl-1.3.0/datatables.min.js"></script>


    <style type="text/css">
        .box1 {
            width: 18px;
            height: 18px;
        }

        .box2 {
            height: 2px;
        }

        .box3 {
            height: 5px;
        }

        .backdarkgreen {
            background: #003300;
            display: inline-block;
        }

        .backmedgreen {
            background: #008000;
            display: inline-block;
        }

        .backlightgreen {
            background: #00cc00;
            display: inline-block;
        }

        .backverydarkblue {
            background: #00008b;
            display: inline-block;
        }

        .backdarkblue {
            background: #0066cc;
            display: inline-block;
        }

        .backmedblue {
            background: #4da6ff;
            display: inline-block;
        }

        .backlightblue {
            background: #87cefa;
            display: inline-block;
        }

        .backlightred {
            background: #ff3333;
            display: inline-block;
        }

        .cata {
            font-size: 12px;
            display: inline-block;
        }

        .right {
            float: right;
        }

        .center_title {
            text-align: center;
        }

        .left {
            float: left;
        }

        .highlightGreen {
            background-color: #9fdf9f !important;
        }

        .highlightRed {
            background-color: #ff9999 !important;
        }

        .highlightYellow {
            background-color: #ffff66 !important;
        }

        .box2 {
            height: 2px;
        }

        .titleback {
            background: #87cefa;
        }

        .mydropdownlist {
            color: #000;
            font-size: 14px;
            padding: 2px 2px;
            border-radius: 5px;
            font-weight: bold;
            width: 200px;
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

        #buttonrowcenter {
            text-align: center;
        }

        #buttonrowcenter2 {
            text-align: center;
        }

        #buttonrowcenter3 {
            text-align: center;
        }

        #inputbuttons {
            padding: 10px 3px 10px 3px;
            background-color: #FEC7FD;
            display: inline:block;
            border-radius: 10px;
            margin-bottom: 10px;
        }

        /*#ck-button {
            margin: 4px;
            background-color: #EFEFEF;
            border-radius: 4px;
            border: 1px solid #D0D0D0;
            overflow: auto;
            float: left;
        }

            #ck-button label {
                float: left;
                width: 4.0em;
            }

                #ck-button label span {
                    text-align: center;
                    padding: 3px 0px;
                    display: block;
                    border-radius: 4px;
                }

                #ck-button label input {
                    position: absolute;
                    top: -20px;
                }

            #ck-button input:hover + span {
                background-color: #efE0E0;
            }

            #ck-button input:checked + span {
                background-color: #911;
                color: #fff;
            }

            #ck-button input:checked:hover + span {
                background-color: #c11;
                color: #fff;
            }*/
    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">B14 mPilot Scheduler *** BETA TESTING VERSION ***</h3>

            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/Default.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/Default.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Dashboard
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">Tools and Automation
                        </span>
                    </a>
                </li>                
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/toolsandauto/mPilot_Scheduler_Testing.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">B14 mPilot Scheduler *** BETA TESTING VERSION ***
                        </span>
                    </a>
                </li>
            </ul>

            <%--Search Function--%>
        </div>
        <input type="search" id="txtSearch" value="" style="width: 425px; height: 35px; float: right;" placeholder="Search (FA, USID, Site ID, PACE Number, iPlan Job Number)" spellcheck="false" autocomplete="off" onkeypress="return searchKeyPress(event);" />

        <button type="button" class="btn btn-primary btn-md" id="btnSearch" data-toggle="modal" data-target="#m_modal_search">
            <span>
                <i class="fa flaticon-search"></i>
                <span>Search</span>
            </span>
        </button>

        <%--End Search Function--%>
    </div>

    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <h3 class="center_title">B14 mPilot Scheduler *** BETA TESTING VERSION ***</h3>
                </div>
            </div>
            <div class="m-portlet__body">
                  
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <%--<div class="m-portlet__head-title">--%>
                                <%--<h4 class="m-portlet__head-text">Placeholder Tab2</h4>--%>

                                <div class="row">
                                    <div class="col-md-9">
                                        <div style="margin-left: 1px;">

                                            <!-- CLUSTER NAME LABEL & TEXTBOX + SHARE USERS TEXTBOX -->
                                            <div class="row" style="text-align: left">
                                                <div class="col-md-12">
                                                    <h4>Cluster Name:*</h4>
                                                    <input id="txt_ClusterName" type="text" style="width: 500px; font-size: 12pt; height: 30px" spellcheck="false" autocomplete="off" value="" />
                                                </div>
                                            </div>
                                            <br />
                                            <%--<div class="row" style="text-align: left">
                                                <div class="col-md-12">
                                                    <h6>Shared Users (list UIDs, comma seperated):</h6>
                                                    <input id="txt_sharedUsers" type="text" style="width: 400px; font-size: 10pt; height: 24px" spellcheck="false" autocomplete="off" value="" />
                                                    <input id="cb_Public" type="checkbox" value="Public Cluster" />Public Cluster
                                                </div>
                                            </div>
                                            <br />--%>
                                            <div class="row" style="text-align: left">
                                                <div class="col-md-12">
                                                    <h6>Select Market to Populate Select From List:</h6>
                                                    <asp:Label ID="label100" runat="server" Text="Market: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="false" ForeColor="Black"></asp:Label>
                                                    <asp:DropDownList ID="ddlMarketMenu" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                                                        <asp:ListItem Text=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <!-- USER INPUT COLUMN: SELECT, SQL, PASTE, MAP -->
                                            <div class="row">
                                                <div id="tbl_Source" class="col-md-5" style='text-align: center;'>
                                                    Source List
                                                    <div id="filter_box2" style="width: 100%;">
                                                        <div id="PRELOADER_IMAGE2" style='display: none; text-align: center;'>
                                                            <img src="../ajax-loader_2.gif" />
                                                            <br />
                                                            Loading
                                                        </div>
                                                        <div class="col-md-12">
                                                            <textarea id="txt_Paste" style="height: 300px; width: 100%;" spellcheck="false"></textarea>
                                                            <div id="tbl_Sites" style="display: none; max-height: 300px; width: 100%; overflow: auto; text-align: left; color: black;">
                                                                <table id="displayTable_tbl_Sites" class="display compact">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>FA_CODE</th>
                                                                            <th>USID</th>
                                                                            <th>SITE_NAME</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="Actions_Selection" class="col-md-2" style="text-align: center;">
                                                    <div id="PRELOADER_IMAGE" style='display: none'>
                                                        <img src="../ajax-loader_2.gif" />
                                                        <br />
                                                        Loading
                                                    </div>
                                                    <%--<div class="col-md-12">
                                                                <div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">--%>
                                                    <div id="testdiv" style="margin-top: 100px; margin-bottom: 20px;">
                                                        <input id="btn_CopyRows" type="button" value="ADD ROWS &raquo;" onclick="pcb_addSelectedRows();" />
                                                    </div>
                                                    <%--</div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">--%>
                                                    <div id="testdiv2" style="margin-top: 20px; margin-bottom: 20px;">
                                                        <input id="btn_ClearAllRows" type="button" value="CLEAR ALL &raquo;" onclick="pcb_dropAllRows();" />
                                                    </div>
                                                    <%--</div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">--%>
                                                    <div id="testdiv3" style="margin-top: 20px; margin-bottom: 20px;">
                                                        <input id="btn_DropRows" type="button" value="&laquo; DROP ROWS" onclick="pcb_removeSelectedRows();" />
                                                    </div>
                                                    <%--</div>
                                                            </div>--%>
                                                </div>
                                                <div id="tbl_Selection" class="col-md-5" style='text-align: center;'>
                                                    Selection List
                                                    <div id="filter_box3" style="width: 100%;">
                                                        <div id="PRELOADER_IMAGE3" style='display: none; text-align: center;'>
                                                            <img src="../ajax-loader_2.gif" />
                                                            <br />
                                                            Loading
                                                        </div>
                                                        <div class="col-md-12" style="max-height: 300px; width: 100%; overflow: auto; text-align: left; color: black;">
                                                            <div id="tbl_SelectedSites" style='display: none'>
                                                                <table id="displayTable_tbl_Selection" class="display compact">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>FA_CODE</th>
                                                                            <th>USID</th>
                                                                            <th>SITE_NAME</th>
                                                                        </tr>
                                                                    </thead>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row" style="text-align: center">
                                                <div class="col-md-12">
                                                    <input id="cb_Power" type="checkbox" value="Full Power" />Full Power
                                                </div>
                                            </div>
                                            <div class="row" style="text-align: center">
                                                <div class="col-md-4">
                                                    <%--<div id="ck-button">
                                                        <label>
                                                            <input type="checkbox" value="1"><span>red</span>
                                                        </label>
                                                    </div>--%>
                                                    <input id="btn_Select" type="button" value="Select From List" onclick="$('#txt_Paste').hide(); $('#tbl_Sites').show();" />
                                                    <input id="btn_Paste" type="button" value="Paste Input" onclick="$('#txt_Paste').show(); $('#tbl_Sites').hide();" />

                                                    <%--<button type="button" class="btn btn-primary" id="btn_Select">Select From List</button>
                                                    <input id="btn_Paste" type="button" value="Paste Input" onclick="$('#txt_Paste').show(); $('#tbl_Sites').hide();" />--%>
                                                </div>
                                                <div class="col-md-4">
                                                    <input id="btn_Submit" type="button" value="Submit Selection for B14 mPilot Testing" onclick="pcb_submitClusterUpdates();" />
                                                    <%--<input id="cb_Power" type="checkbox" value="Full Power" />Full Power--%>
                                                </div>
                                                <div class="col-md-4">
                                                    <input id="btn_Delete" type="button" value="Delete Cluster" onclick="pcb_deleteCluster();" />
                                                    <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                    </div>


                                    <div class="col-md-3">
                                        <%--<div class="row" style="text-align: center">
                                            <div class="col-md-12">
                                                <input id="btn_mine" type="button" value="My Clusters" onclick="pcb_ClusterLevel = 'self'; pcb_getClusterList(pcb_ClusterLevel);" />
                                                <input id="btn_shared" type="button" value="Shared with Me" onclick="pcb_ClusterLevel = 'shared'; pcb_getClusterList(pcb_ClusterLevel);" />
                                                <input id="btn_public" type="button" value="Public" onclick="pcb_ClusterLevel = 'public'; pcb_getClusterList(pcb_ClusterLevel);" />
                                            </div>
                                        </div>
                                        <br />--%>                                        
                                        <div class="row" style="text-align: center">
                                            <div class="col-md-12">
                                                <h4>Previously Submited</h4>
                                                <h4>Cluster Selections:</h4>
                                                <asp:ListBox ID="lb_Clusters" ClientIDMode="Static" runat="server" Rows="10" Width="100%" onchange="pcb_getClusterInfo();"></asp:ListBox>
                                            </div>
                                        </div>
                                        <br />
                                        <%--<div class="row" style="text-align: center">
                                            <div class="col-md-12">                                                
                                                <input id="txt_SearchClusters" type="text" spellcheck="false" autocomplete="off" value="search clusters..." />
                                            </div>
                                        </div>--%>
                                    </div>


                                    <div class="row">
                                        <label id="lb_message"></label>
                                    </div>
                                </div>

                                <%--</div>--%>
                            </div>
                        </div>
                <br />                
                <div class="row" style="text-align: center">                    
                    <div class="col-md-12">
                        <div id="PRELOADER_IMAGE4">
                            <img src="../ajax-loader_2.gif" />&nbsp; Scheduling Job...
                        </div>
                        <h4>Your Personal Historical B14 mPilot Scheduler Requests</h4>
                    </div>
                </div>
                <div class="m-section__content" style="height: 400px; width: 100%;">
                            <table id="tablemPilot" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">User ID</th>
                                        <th bgcolor="#87CEFA">Market</th>
                                        <th bgcolor="#87CEFA">Submarket</th>
                                        <th bgcolor="#87CEFA">FA</th>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">Site ID</th>
                                        <th bgcolor="#87CEFA">Vendor</th>
                                        <th bgcolor="#87CEFA">Date Requested</th>
                                        <th bgcolor="#87CEFA">Full Power Requested</th>
                                        <th bgcolor="#87CEFA">Date Completed</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                
            </div>
        </div>
    </div>



    <!-- Search Modal -->
    <div class="modal fade" id="m_modal_search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Search Results</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="LOADING_SEARCH_MAP" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH" style='display: none'>No data found, please check input.</div>
                    <div id="ModalDisplay">
                        <div class="row" id="DisplayInfoRow">
                            <div class="col-md-7" id="InfoCol1_1">
                                <div id="mysearchmap" style="width: 700px; height: 400px; border: 1px solid #AAA;"></div>
                            </div>
                            <div class="col-md-5" id="InfoCol1_2" style="text-align: center; color: black">
                                <h3 class="m-subheader2__title m-subheader2__title--separator" id="DisplaySitename"></h3>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayUSID"></h4>
                                <h4 class="m-subheader2__title m-subheader2__title--separator" id="DisplayFACODE"></h4>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayREGION"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayMARKET"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplaySUBMARKET"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayADDRESS"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayCITY"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayZIP"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayLAT"></h5>
                                <h5 class="m-subheader2__title m-subheader2__title--separator" id="DisplayLNG"></h5>
                            </div>
                        </div>
                        <br />

                        <div class="m-section__content" style="height: 400px; width: 1200px;">
                            <table id="tabMapSearchTable" class="table compact" style="width: 100%; height: 100%; font-size: 12px; white-space: nowrap; text-align: center; color: black;">
                                <thead>
                                    <tr>
                                        <th bgcolor="#87CEFA">USID</th>
                                        <th bgcolor="#87CEFA">FA Code</th>
                                        <th bgcolor="#87CEFA">Site Name</th>
                                        <th bgcolor="#87CEFA">Job Number</th>
                                        <th bgcolor="#87CEFA">iPlan Status</th>
                                        <th bgcolor="#87CEFA">PACE Number</th>
                                        <th bgcolor="#87CEFA">PACE Status</th>
                                        <th bgcolor="#87CEFA">Issued Date</th>
                                        <th bgcolor="#87CEFA">Need By Date</th>
                                        <th bgcolor="#87CEFA">On Air Forecast</th>
                                        <th bgcolor="#87CEFA">PACE Name</th>
                                        <th bgcolor="#87CEFA">Product Group</th>
                                        <th bgcolor="#87CEFA">Product Subgroup</th>
                                        <th bgcolor="#87CEFA">Spectrum</th>
                                        <th bgcolor="#87CEFA">Project Manager</th>
                                        <th bgcolor="#87CEFA">Civil Vendor</th>
                                        <th bgcolor="#87CEFA">RF Engineer</th>
                                        <th bgcolor="#87CEFA">RFDS ID</th>
                                        <th bgcolor="#87CEFA">RFDS Owner</th>
                                        <th bgcolor="#87CEFA">RFDS State</th>
                                        <th bgcolor="#87CEFA">pRFDS Complete (JI022)</th>
                                        <th bgcolor="#87CEFA">fRFDS Complete (SS020)</th>
                                        <th bgcolor="#87CEFA">SAQ Forecast (RE020)</th>
                                        <th bgcolor="#87CEFA">SAQ Complete (RE020)</th>
                                        <th bgcolor="#87CEFA">Const Start (CI025)</th>
                                        <th bgcolor="#87CEFA">T Top Comp (CI020)</th>
                                        <th bgcolor="#87CEFA">Const Comp (CI050)</th>
                                        <th bgcolor="#87CEFA">On Air Actual</th>
                                        <th bgcolor="#87CEFA">PM ATTUID</th>
                                    </tr>
                                </thead>
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

    <script>

        //ATTACH CLICK HANDLERS
        $(document).ready(function () {

            $('#PRELOADER_IMAGE4').hide();
            MenuSelectionMade();
            var market = '';
            var parameter = window.location.href.match(/market=([^&]+)/);
            if (parameter != null) {                
                $('#ddlMarketMenu').val(market);
                $('#ddlMarketMenu').trigger('change');
            }
            $('#buttonrowcenter').hide();
            console.log("DocReady");
            pcb_Initialize_Lists();

            var admin = $('#hf_User').val(); // get ATTUID from hidden field

            $.ajax({
                type: "POST",
                async: true,
                url: "mPilot_Scheduler_Testing.aspx/Get_SchedulerData",
                data: JSON.stringify({ 'adminVariable': admin }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadSchedulerData(data);
                },
                error: function (data) {
                }
            });

        });

        // PONDER CLUSTER BUILDER (PCB)
        var pcb_ClusterLevel = "";

        // Initialize Site Info and Cluster lists
        function pcb_Initialize_Lists(market) {
            $('#PRELOADER_IMAGE2').show();
            $('#tbl_SelectedSites').show();
            $('#btn_Select').click(); // initialize with "Select" 
            //var market = "RUMW"; // Market - get this from input in the future

            //var sql = "";
            //if (market == 'NYC') {
            //    var sql = "select distinct FA_CODE,USID,SITE_NAME from AXIOM.IPLAN i where market = 'RNYJ' and SUB_MARKET = 'NEW YORK CITY RETAIL CO' and USID is not null and SITE_NAME is not null and GSM_UMTS='LTE'";
            //} else if (market == 'UPSNY') {
            //    var sql = "select distinct FA_CODE,USID,SITE_NAME from AXIOM.IPLAN i where market = 'RNYJ' and SUB_MARKET = 'UPSTATE NEW YORK RETAIL CO' and USID is not null and SITE_NAME is not null and GSM_UMTS='LTE'";
            //} else {
            //    var sql = "select distinct FA_CODE,USID,SITE_NAME from AXIOM.IPLAN i where market = '" + market + "' and USID is not null and SITE_NAME is not null and GSM_UMTS='LTE'";
            //};

            var sql = "";
            if (market == 'ROAR') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('ARKANSAS/OKLAHOMA') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RANM') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('ARIZONA/NEW MEXICO') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";           
            } else if (market == 'RPHL') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('E. PA/S. NJ/DE') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RTFL') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('FLORIDA','NORTH FLORIDA') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RGSC') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('GEORGIA/SOUTH CAROLINA') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RKSL') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('GREATER MIDWEST') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RBHM') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('GULF STATES') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RHII') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('HAWAII') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RCHI') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('ILLINOIS/WISCONSIN','IL/WI Partitioners') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RLOS') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('LOS ANGELES') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RIND') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('MICHIGAN/INDIANA') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RVWN') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('MID ATLANTIC','NORTH CAROLINA/SOUTH CAROLINA') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RCTB') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('NEW ENGLAND','New England Partitioners') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RNTX') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('NORTH TEXAS','NTX Partitioners') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RSFR') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('NORTHERN CALIFORNIA','N.CA Partitioners') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RUMW') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('NORTHERN PLAINS','ND/SD/NE/MN/IA Partitioners') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'ROWP') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('OHIO/WESTERN PENNSYLVANIA') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')"
            } else if (market == 'RWOR') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('PACIFIC NORTHWEST','SEATTLE/OREGON/NO. ID','SEA/OR/N.ID Partitioners') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RRPR') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('PUERTO RICO') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RUTH') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('ROCKY MOUNTAIN REGION') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RSDL') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('SAN DIEGO/LAS VEGAS') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RSTX') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('SOUTH TEXAS') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RTNK') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('TENNESSEE/KENTUCKY') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'RWSH') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('WASHINGTON DC-BALTIMORE','WASHINGTON D.C./MARYLAND') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'NYC') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('NY/NNJ') and SUBMARKET IN ('NYC EAST','NYC MANHATTAN','NYC WEST') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else if (market == 'UPSNY') {
                var sql = "select distinct FA AS FA_CODE, USID, SITE_ID AS SITE_NAME from COAR.LTE_MASTERS i where market IN ('NY/NNJ') and SUBMARKET IN ('UP STATE NY') and USID is not null and SITE_NAME is not null AND FA NOT IN ('0','UPDATE CSS','NO EUTRANCELLID IN CSS','NO FA IN CSS')";
            } else {
                var sql = "select distinct FA_CODE,USID,SITE_NAME from AXIOM.IPLAN i where market = '" + market + "' and USID is not null and SITE_NAME is not null and GSM_UMTS='LTE'";
            };
            
            pcb_queryTableBuilder(sql, "tbl_Sites"); // build initial "Select" table

            pcb_ClusterLevel = "self"; // initialize ClusterLevel Global var
            pcb_getClusterList(pcb_ClusterLevel); // fill cluster list box

            $('#displayTable_tbl_Selection').DataTable( // initialize Selection table as type DataTable
                {
                    destroy: true,
                    columnDefs: [
                        { "width": "20%", "targets": 0 },
                        { "width": "15%", "targets": 1 },
                        { "width": "65%", "targets": 2 }
                    ],
                    autoWidth: false,
                    fixedHeader: true,
                    select: true,
                    paging: false,
                    sort: true,
                    searching: true,
                    order: [0, 'asc'],
                    dom: 'Bfrtip',
                    buttons: [
                        'copyHtml5', 'excelHtml5'
                    ],
                    "stripeClasses": []
                }
            );
        }

        // Fill Cluster selection list
        function pcb_getClusterList(level) {
            var admin = $('#hf_User').val().toUpperCase(); // get ATTUID from hidden field
        console.log(admin);
            var sql = "";
            switch (level) { // filter based on which "level" (button) is clicked
                case "self":
                    sql = "Select ADMIN_USER||'_'||CLUSTER_ID as CLUSTER_ID from PONDER.MPILOT_CLUSTER_LIST where upper(ADMIN_USER) = '" + admin + "' order by 1";
                    break;
                case "shared":
                    sql = "Select ADMIN_USER||'_'||CLUSTER_ID as CLUSTER_ID from PONDER.MPILOT_CLUSTER_LIST where upper(VIEW_USER) like '%" + admin + "%' order by 1";
                    break;
                case "public":
                    sql = "Select ADMIN_USER||'_'||CLUSTER_ID as CLUSTER_ID from PONDER.MPILOT_CLUSTER_LIST where VIEW_PUBLIC = 1 order by 1";
                    break;
            }

            $('#lb_Clusters').empty(); // empty listbox
            pcb_queryFillList(sql, "lb_Clusters"); // fill listbox with new list            
        }

        // fill Listbox for Select box
        function pcb_queryFillList(sql1, myObject) {
            $.ajax({
                type: "POST",
                async: true,
                url: "mPilot_Scheduler_Testing.aspx/callAXIOMquery",
                data: JSON.stringify({ 'sql': sql1 }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $.each(JSON.parse(data.d), function (index, value) {
                        var optionSite = JSON.stringify(value).replace(/{|}|FA_CODE|USID|SITE_NAME|CLUSTER_ID|:|"/g, "").replace(/,/g, "\t\t");
                        var optionIndex = function () {
                            if (myObject == 'lb_SiteSelecter') { $(this).text().substring(0, 8); }
                            //else if (myObject == 'lb_Clusters') {}
                            else { index }
                        };
                        $('#' + myObject).append($('<option>').text(optionSite).val(optionIndex));
                    })
                },
                error: function (data) {
                    $('#lb_message').text('Error Updating table!');
                    return;
                }
            });
        }

        // Query AXIOM DB - Returns DataFrame
        var myData;
        function pcb_queryReturn(sql1) {
            $.ajax({
                type: "POST",
                async: false,
                url: "mPilot_Scheduler_Testing.aspx/callAXIOMquery",
                data: JSON.stringify({ 'sql': sql1 }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    myData = JSON.parse(data.d);
                    return JSON.parse(data.d);
                },
                error: function (data) {
                    $('#lb_message').text('Error Updating table!');
                    return;
                }
            });
        }

        // Query AXIOM DB - Execute (insert/update/delete)
        function pcb_queryUpdates(sql1) {            
            $.ajax({
                type: "POST",
                async: false,
                url: "mPilot_Scheduler_Testing.aspx/callAXIOMinsert",
                data: JSON.stringify({ 'sql': sql1 }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                },
                error: function (data) {
                    $('#lb_message').text('Error Updating table!');
                    return;
                }
            });
        }

        // request data to fill table
        function pcb_queryTableBuilder(sql, table, willDestroy) {
            $.ajax({
                type: "POST",
                async: true,
                url: "mPilot_Scheduler_Testing.aspx/callAXIOMquery",
                data: JSON.stringify({ 'sql': sql }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    pcb_getKeys(table, JSON.parse(data.d), willDestroy);
                    $('#PRELOADER_IMAGE').hide();
                    $('#PRELOADER_IMAGE2').hide();
                    $('#PRELOADER_IMAGE3').hide();
                },
                error: function (data) {
                    $('#lb_message').text('Error Updating table!');
                    return;
                }
            });
        }

        function pcb_PasteTableBuilder(sql, table) {
            $.ajax({
                type: "POST",
                async: true,
                url: "mPilot_Scheduler_Testing.aspx/callAXIOMquery",
                data: JSON.stringify({ 'sql': sql }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var rows = JSON.parse(data.d);
                    $('#PRELOADER_IMAGE').hide();
                    $('#PRELOADER_IMAGE2').hide();
                    $('#PRELOADER_IMAGE3').hide();
                    for (i = 0; i < rows.length; i++) {
                        var row = rows[i]; // create a copy of the row to be added
                        var newRow = '<tr role="row" class><td>' + row.FA_CODE + '</td><td>' + row.USID + '</td><td>' + row.SITE_NAME + '</td></tr>';
                        $('#displayTable_tbl_Selection').dataTable().fnAddData($(newRow)); // add datarow to 'selection' table
                    }
                },
                error: function (data) {
                    $('#lb_message').text('Error Updating table!');
                    return;
                }
            });
        }

        // build header from table keys
        var keys = [];
        var keyString;
        var tableHeaders;
        function pcb_getKeys(tableID, data, willDestroy) {
            keys = [];
            tableHeaders = "";
            keyString = "[";
            for (var k in data[0]) {
                keys.push(k);
                keyString += "{ \"data\": \"" + k + "\"},";
                tableHeaders += "<th>" + k + "</th>";
            }
            //$("#" + tableID).empty();
            //$("#" + tableID).append('<table id="displayTable_' + tableID + '" class="display compact" style="color: black;" cellspacing="0" width="100%"><thead><tr>' + tableHeaders + '</tr></thead></table>');
            $("#" + tableID).append('<table id="displayTable_' + tableID + '" class="display compact" style="color: black;" cellspacing="0" width="100%"></table>');
            keyString = keyString.replace(/,\s*$/, "");
            keyString += "]";
            pcb_buildTable(tableID, data, willDestroy);
            //console.log(tableID);
        }
        // build datatable
        function pcb_buildTable(table, tableData, willDestroy) {

            //if ($.fn.DataTable.isDataTable('#displayTable_' + table)) {
            //    var table = $('#displayTable_' + table).DataTable();

            //    table.row.add([ tableData ]).draw();
            //}
            //else {
            var varDestroy = (willDestroy === '1') ? true : false;

            $('#displayTable_' + table).DataTable(
                {
                    destroy: true,
                    columnDefs: [
                        { "width": "20%", "targets": 0 },
                        { "width": "15%", "targets": 1 },
                        { "width": "65%", "targets": 2 }
                    ],
                    autoWidth: false,
                    fixedHeader: true,
                    select: true,
                    paging: false,
                    //"pageLength": 5,
                    sort: true,
                    searching: true,
                    order: [0, 'asc'],
                    stripeClasses: [],
                    data: tableData,
                    columns: JSON.parse(keyString),
                    dom: 'Bfrtip',
                    buttons: [
                        'copyHtml5', 'excelHtml5'
                    ]
                });
            //}

        }

        // Clone Rows from Left List to Right List
        function pcb_addSelectedRows() {
            if ($('#txt_Paste').is(":visible")) {
                pcb_pasteCluster();
            }
            else if ($('#tbl_Sites').is(":visible")) {
                var selection = document.getElementById('displayTable_tbl_Sites').getElementsByClassName('selected'); // the selected rows
                for (i = 0; i < selection.length; i++) {
                    var oldRow = selection[i].cloneNode(true); // create a copy of the row to be added
                    oldRow.className = ""; // clear 'selected' class from copy
                    if (selection[i].cells[0].innerHTML != "FA_CODE") {
                        $('#displayTable_tbl_Selection').dataTable().fnAddData(oldRow);// add datarow to 'selection' table
                    }
                }
            }

        }

        // Drop Rows from Right List
        function pcb_removeSelectedRows() {
            var table = $('#displayTable_tbl_Selection').DataTable();
            table.rows('.selected').remove().draw();
        }

        // Drop ALL Rows from Right List
        function pcb_dropAllRows() {
            var table = $('#displayTable_tbl_Selection').DataTable();
            table.rows('tr').remove().draw();
        }
        
        // Check + Submit Updates to PONDER Cluster Tables 
        function pcb_submitClusterUpdates() {            
            $('#PRELOADER_IMAGE4').show();            
            var message = ""; // Error handling:  make sure everything required for a cluster is present
            var admin = $('#hf_User').val(); // users ATTUID
            var sharedUsers = "";
            var is_public = $("#cb_Public").is(':checked'); // see if "Public" checkbox is "checked"
            var add_public = 0; // default to "NOT PUBLIC"
            var is_fullPower = $("#cb_Power").is(':checked'); // see if "Power" checkbox is "checked"
            //var add_fullPower = 0; // default to "NOT PUBLIC"

            // check Title
            var txt_title = $('#txt_ClusterName').val();
            if (txt_title == "") {
                message += "No Cluster Title\n";
            }

            // check that sites are selected
            var siteList = [];
            $('#displayTable_tbl_Selection tr:gt(0)').each(function () {
                siteList.push($(this).find('td:eq(0)').text().trim());
            });
            var distinctSiteList = [...new Set(siteList)];
            if (distinctSiteList.length == 1 && distinctSiteList[0] == "No data available in table") {
                message += "No Items Added To List\n";
            }

            // verify admin capabilities
            var selection = $('#lb_Clusters option:selected').text();
            var adminCheck = selection.split("_", 1);
            var cluster = selection.substr(adminCheck[0].length + 1, selection.length);
            if (txt_title == cluster && admin.toUpperCase() != adminCheck[0].toUpperCase()) { // if cluster name matches, but Admin ATTUID doesn't match users ATTUID, then disallow
                message += "Insufficient Privileges to Edit\n";
            }

            // check if turning "PUBLIC"
            if (is_public) {
                add_public = 1;
            }

            // check if turning on "Full Power"
            if (is_fullPower) {
                add_fullPower = 1;
            }

            // final:  if no message, call to Insert/Update
            if (message == "") {
                sharedUsers = $('#txt_sharedUsers').val();
                //console.log("Shared Users: " + sharedUsers);
                // insert/update List item
                var sql_Insert_List = `merge into PONDER.MPILOT_CLUSTER_LIST l
                    using (select '` + admin + `' as admin,'` + txt_title + `' as val from dual) d on (l.CLUSTER_ID = d.val and UPPER(l.admin_user)=UPPER(d.admin))
                    when matched then UPDATE set l.LASTUSED_DATE=SYSDATE, l.VIEW_USER = '` + sharedUsers + `', l.FULL_POWER = ` + add_fullPower + `
                    when not matched then INSERT  (CLUSTER_ID,ADMIN_USER,CREATE_DATE,LASTUSED_DATE,ID,VIEW_USER,FULL_POWER)
                        VALUES ('` + txt_title + `','` + admin + `',SYSDATE,SYSDATE,coalesce((select max(id)+1 id from PONDER.MPILOT_CLUSTER_LIST),1),'` + sharedUsers + `',` + add_fullPower + `);commit;`;
                pcb_queryUpdates(sql_Insert_List);
                //console.log("Insert List: " + sql_Insert_List);
                // get ID for Detail Insert
                var sql_get_ID = "select ID from PONDER.MPILOT_CLUSTER_LIST l where UPPER(l.ADMIN_USER)=UPPER('" + admin + "') and l.CLUSTER_ID='" + txt_title + "'"
                var getID = pcb_queryReturn(sql_get_ID);
                var ID = myData[0]["ID"];
                console.log("ID QUERY: " + sql_get_ID);
                console.log("ID: " + ID);
                // delete old Detail
                var sql_Delete_Detail = "delete from PONDER.MPILOT_CLUSTER_DETAIL where ID = " + ID + ";commit;";
                pcb_queryUpdates(sql_Delete_Detail);
                //console.log("Delete Detail: " + sql_Delete_Detail);
                // insert new Detail                
                for (var i = 0; i < distinctSiteList.length; i++) {
                    var sql_Insert_Detail = `Insert into PONDER.MPILOT_CLUSTER_DETAIL (ID,FA) VALUES (` + ID + `,` + distinctSiteList[i] + `);commit;`;
                    pcb_queryUpdates(sql_Insert_Detail);
                }
                //console.log("Insert Detail(last): " + sql_Insert_Detail);
                //console.log("Completed Insert/Update");                                
                alert("Insert Complete");                
                mpilot_scheduler_update();
                mpilot_update_table();
                pcb_getClusterList(pcb_ClusterLevel);
            } else {
                alert(message);
            }
        }

        // Update MPILOT_SCHEDULER Table after Inserting new site list details
        function mpilot_scheduler_update() {
            
            $.ajax({
                type: "POST",
                async: false,
                url: "mPilot_Scheduler_Testing.aspx/mpilot_scheduler_update",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    $('#PRELOADER_IMAGE4').hide();
                },
                error: function (data) {
                    $('#lb_message').text('Error Updating MPILOT SCHEDULER table!');
                    return;
                }
            });
        }

        //Update MPILOT Table
        function mpilot_update_table() {

            var admin = $('#hf_User').val(); // get ATTUID from hidden field

            $.ajax({
                type: "POST",
                async: true,
                url: "mPilot_Scheduler_Testing.aspx/Get_SchedulerData",
                data: JSON.stringify({ 'adminVariable': admin }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadSchedulerData(data);
                },
                error: function (data) {
                }
            });
        }


        // Retrieve Cluster Info on Select
        function pcb_getClusterInfo() {
            var selection = $('#lb_Clusters option:selected').text();
            var admin = selection.split("_", 1);
            var cluster = selection.substr(admin[0].length + 1, selection.length);
            //var market = 'RUMW';
            var sql = `select distinct i.FA_CODE,i.USID,i.SITE_NAME from PONDER.MPILOT_CLUSTER_DETAIL d join PONDER.MPILOT_CLUSTER_LIST l on d.ID=l.ID 
                        join AXIOM.IPLAN i on d.FA=i.FA_CODE
                        where i.USID is not null and i.SITE_NAME is not null and GSM_UMTS='LTE' and l.ADMIN_USER='` + admin + `' and l.CLUSTER_ID='` + cluster + `'`;
            pcb_queryTableBuilder(sql, 'tbl_Selection', '1');
            $('#txt_ClusterName').val(cluster);

            var sql_users = `Select VIEW_USER from PONDER.MPILOT_CLUSTER_LIST where ADMIN_USER='` + admin + `' and CLUSTER_ID='` + cluster + `'`;
            var get_users = pcb_queryReturn(sql_users);
            var users = myData[0]["VIEW_USER"];
            $('#txt_sharedUsers').val(users);
            $('#PRELOADER_IMAGE3').show();
        }

        // Delete Cluster on Selection - verify Privileges
        function pcb_deleteCluster() {
            var selection = $('#lb_Clusters option:selected').text();
            var admin = selection.split("_", 1);
            var cluster = selection.substr(admin[0].length + 1, selection.length);
            if (admin[0] == $('#hf_User').val()) {
                var sql = `delete from PONDER.MPILOT_CLUSTER_DETAIL
                    where ID=(select ID from PONDER.MPILOT_CLUSTER_LIST where admin_user = '`+ admin + `' and CLUSTER_ID = '` + cluster + `');commit;
                    delete from PONDER.MPILOT_CLUSTER_LIST where admin_user = '`+ admin + `' and CLUSTER_ID = '` + cluster + `';commit;`;
                pcb_queryUpdates(sql);
                alert("Delete Completed");
                pcb_getClusterList(pcb_ClusterLevel);
            } else {
                alert("Insufficient Privileges.  Only the Creator can Delete a Cluster.");
            }
        }

        // Build Right List with Paste Box
        function pcb_pasteCluster() {
            $('#PRELOADER_IMAGE').show();
            var paste = $('#txt_Paste').val().replace(/,/g, '\n').replace(/\t/g, '\n').replace(/ /g, '\n').split('\n');// replace commas, tabs, and spaces with newline + split into array with newline delimiter
            var n = "";
            for (var i = 0; i < paste.length; i++) { n += "'" + paste[i] + "',"; }
            var n2 = n.replace(/,,/g, ",");
            if (n2.substr(-1) == ",") { n2 = n2.substr(0, n2.length - 1) };
            var sql = `Select distinct i.FA_CODE,i.USID,i.SITE_NAME from AXIOM.IPLAN i
                where i.USID is not null and i.SITE_NAME is not null and GSM_UMTS='LTE' and (FA_CODE in (` + n2 + `) or USID in (` + n2 + `) or SITE_NAME in (` + n2 + `))`; // search with FA
            pcb_PasteTableBuilder(sql, 'tbl_Selection', '0');
        }        

        function MenuSelectionMade() {
            console.log("ClickHandler");
            $('#ddlMarketMenu').change(
                function () {
                    var market = $('#ddlMarketMenu option:selected').val();
                    var market_long = $('#ddlMarketMenu option:selected').text();
                    console.log(market_long);
                    console.log(market);                    
                    pcb_Initialize_Lists(market);
                });
        }        

        function searchKeyPress(e) {
            // look for window.event in case event isn't passed in
            e = e || window.event;
            if (e.keyCode == 13) {
                document.getElementById('btnSearch').click();
                return false;
            }
            return true;
        }

        function displayInfo() {

        }

        $(function () {

            $("#btnSearch").click(function () {
                $('#LOADING_SEARCH_MAP').show();
                $('#NODATA_SEARCH').hide();
                $('#ModalDisplay').hide();
                $.ajax({
                    type: "POST",
                    url: "mPilot_Scheduler_Testing.aspx/GetSearchAll",
                    data: "{name: '" + $("#txtSearch").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        $('#LOADING_SEARCH_MAP').hide();
                        $('#ModalDisplay').show();
                        loadSearchCheck(data);
                    }
                });
            });
        });        

        function loadSchedulerData(data) {
            var data = JSON.parse(data.d);
            if (data.length <= 0) {
                return;
            }
            else {
                var sitename = data[0]["SITE_NAME"];
                $('#tablemPilot').dataTable().fnDestroy(); //destroy old table
                $('#tablemPilot').DataTable({ //build new table                
                    orderCellsTop: true,
                    fixedHeader: true,
                    paging: true,
                    sort: true,
                    scrollY: 350,
                    scrollCollapse: true,
                    scrollX: true,
                    //order: [[3, "asc"]],
                    searching: true,
                    data: data,
                    info: false,
                    binfo: true,
                    dom: 'Bfrtip',
                    buttons: [{ extend: 'csv', title: 'mPilot Export' }, { extend: 'excel', title: 'mPilot Export' }],
                    //columnDefs: [{ visible: false, targets: 8 }],
                    columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                        { 'data': 'USERID' },
                        { 'data': 'MARKET' },
                        { 'data': 'SUBMARKET' },
                        { 'data': 'FA' },
                        { 'data': 'USID' },
                        { 'data': 'SITE_ID' },
                        { 'data': 'VENDOR' },
                        { 'data': 'DATE_REQUESTED' },
                        { 'data': 'FULL_POWER' },
                        { 'data': 'DATE_COMPLETE' }
                    ],

                    createdRow: function (row, data, index) {
                        if (data["DATE_COMPLETE"] != null) {
                            $(row).addClass('highlightGreen');
                        }
                    },

                    "fnDrawCallback": function () {
                        $('#tablemPilot tr').find('td').each(function () {
                            $(this).on('mouseover', function () {
                                $(this).parent().css('background', 'silver');
                                this.style.cursor = 'pointer';
                            }).on('mouseout', function () {
                                $(this).parent().css('background', 'transparent');
                                this.style.cursor = 'default';
                            });
                        });
                    },
                });

                $(window).resize();
            }

        }

        function loadSearchCheck(data) {
            var json = JSON.parse(data.d);
            if (json.length <= 0) {
                $('#NODATA_SEARCH').show();
                $('#ModalDisplay').hide();
            }
            else {
                loadMapSearchTable(data, "SearchTablePlace");
                loadSearchMap(data);
                loadSearchInfo(data);
            }
        }

        function loadSearchInfo(data) {
            var data = JSON.parse(data.d);
            var sitename = data[0]["SITE_NAME"];
            sitename = sitename || 'no info';
            var DisplaySitename = sitename.toLocaleString();
            document.getElementById('DisplaySitename').innerHTML = 'Site Name: ' + DisplaySitename;
            var USID = data[0]["USID"];
            USID = USID || 'no info';
            var DisplayUSID = USID.toLocaleString();
            document.getElementById('DisplayUSID').innerHTML = 'USID: ' + DisplayUSID;
            var FACODE = data[0]["FA_CODE"];
            FACODE = FACODE || 'no info';
            var DisplayFACODE = FACODE.toLocaleString();
            document.getElementById('DisplayFACODE').innerHTML = 'FA Code: ' + DisplayFACODE;
            var REGION = data[0]["REGION"];
            REGION = REGION || 'no info';
            var DisplayREGION = REGION.toLocaleString();
            document.getElementById('DisplayREGION').innerHTML = 'Region:  ' + DisplayREGION;
            var MARKET = data[0]["MARKET"];
            MARKET = MARKET || 'no info';
            var DisplayMARKET = MARKET.toLocaleString();
            document.getElementById('DisplayMARKET').innerHTML = 'Market:  ' + DisplayMARKET;
            var SUBMARKET = data[0]["SUBMARKET"];
            SUBMARKET = SUBMARKET || 'no info';
            var DisplaySUBMARKET = SUBMARKET.toLocaleString();
            document.getElementById('DisplaySUBMARKET').innerHTML = 'Submarket:  ' + DisplaySUBMARKET;
            var ADDRESS = data[0]["ADDRESS"];
            ADDRESS = ADDRESS || 'no info';
            var DisplayADDRESS = ADDRESS.toLocaleString();
            document.getElementById('DisplayADDRESS').innerHTML = 'Address:  ' + DisplayADDRESS;
            var CITY = data[0]["CITY"];
            CITY = CITY || 'no info';
            var DisplayCITY = CITY.toLocaleString();
            document.getElementById('DisplayCITY').innerHTML = 'City:  ' + DisplayCITY;
            var ZIP = data[0]["ZIP"];
            ZIP = ZIP || 'no info';
            var DisplayZIP = ZIP.toLocaleString();
            document.getElementById('DisplayZIP').innerHTML = 'ZIP:  ' + DisplayZIP;
            var LAT = data[0]["lat"];
            LAT = LAT || 'no info';
            var DisplayLAT = LAT.toLocaleString();
            document.getElementById('DisplayLAT').innerHTML = 'Latitude:  ' + DisplayLAT;
            var LNG = data[0]["lng"];
            LNG = LNG || 'no info';
            var DisplayLNG = LNG.toLocaleString();
            document.getElementById('DisplayLNG').innerHTML = 'Longitude:  ' + DisplayLNG;

        }

        function loadSearchMap(data) {
            var markers = JSON.parse(data.d);

            var loc1 = [markers[0].lat, markers[0].lng];

            var NE_lat = Number(markers[0].lat);
            var NE_lng = Number(markers[0].lng);
            var add1 = .05
            var NE_lat_1 = NE_lat + add1;
            var NE_lng_1 = NE_lng + add1;

            var SW_lat = Number(markers[0].lat);
            var SW_lng = Number(markers[0].lng);
            var add1 = .05
            var SW_lat_1 = SW_lat - add1;
            var SW_lng_1 = SW_lng - add1;

            document.getElementById('mysearchmap').innerHTML = "<div id='searchmap' style='width: 700px; height: 400px; border: 1px solid #AAA;'></div>";

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
                "<span style='color: gray'>Grayscale</span>": grayscale,
                "Satelite": sat
                //"Topo": topo
            };

            var map = L.map('searchmap', {
                center: [38.5, -95],
                minZoom: 2,
                zoom: 5,
                layers: [streets]
            });

            L.control.layers(baseLayers).addTo(map);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
                subdomains: ['a', 'b', 'c']
            }).addTo(map);

            L.control.scale({ metric: false }).addTo(map);

            var southWest = new L.LatLng(SW_lat_1, SW_lng_1),
                northEast = new L.LatLng(NE_lat_1, NE_lng_1),

                bounds = new L.LatLngBounds(southWest, northEast);

            L.marker(loc1)
                .bindPopup(markers[0].SITE_NAME)
                .addTo(map);

            map.fitBounds(bounds, { padding: [10, 10] });

        }

        function loadMapSearchTable(data) {
            var data = JSON.parse(data.d);
            var sitename = data[0]["SITE_NAME"];
            $('#tabMapSearchTable').dataTable().fnDestroy(); //destroy old table
            $('#tabMapSearchTable').DataTable({ //build new table                
                orderCellsTop: true,
                fixedHeader: true,
                paging: true,
                sort: true,
                scrollY: 350,
                scrollCollapse: true,
                scrollX: true,
                //order: [[3, "asc"]],
                searching: false,
                data: data,
                info: false,
                binfo: true,
                dom: 'Bfrtip',
                buttons: [{ extend: 'csv', title: 'Export: ' + sitename }, { extend: 'excel', title: 'Table title' }],
                columnDefs: [{ visible: false, targets: 28 }],
                columns: [ //define columns, you can hard code them like this, or build them dynamically with a loop based on your parsed JSON data
                    { 'data': 'USID' },
                    { 'data': 'FA_CODE' },
                    { 'data': 'SITE_NAME' },
                    { 'data': 'JOB_NUMBER' },
                    { 'data': 'IPLAN_STATUS' },
                    { 'data': 'PACE_NUMBER' },
                    { 'data': 'PACE_STATUS' },
                    { 'data': 'ORIGINAL_ISSUED_DATE' },
                    { 'data': 'CURRENT_NEED_BY_DATE' },
                    { 'data': 'ONAIR_FORECAST' },
                    { 'data': 'PACE_NAME' },
                    { 'data': 'PRODUCT_GROUP' },
                    { 'data': 'SUB_GROUP' },
                    { 'data': 'SPECTRUM' },
                    {
                        'data': 'PROJECT_MANAGER'
                        ,
                        'render': function (data, type, JsonResultRow, meta) {
                            if (data === null) { return null; }
                            else {
                                var varattuid = JsonResultRow['PM_ATTUID'];
                                var varpacejob = JsonResultRow['PACE_NUMBER'];
                                return '<a href="mailto:' + varattuid + '@att.com?subject=Inquiry about PACE job ' + varpacejob + '"> ' + data + ' </a>';
                            }
                        }
                    },
                    { 'data': 'CIVIL_VENDOR' },
                    { 'data': 'RF_ENGINEER' },
                    { 'data': 'RFDS_ID' },
                    {
                        'data': 'RFDS_OWNER'
                        ,
                        'render': function (data, type, JsonResultRow, meta) {
                            if (data === null) { return null; }
                            else {
                                var varrfdsjob = JsonResultRow['RFDS_ID'];
                                return '<a href="mailto:' + data + '@att.com?subject=Inquiry about RFDS ID ' + varrfdsjob + '"> ' + data + ' </a>';
                            }
                        }
                    },
                    { 'data': 'RFDS_STATE' },
                    { 'data': 'JI022_ACTUAL' },
                    { 'data': 'SS020_ACTUAL' },
                    { 'data': 'RE020_FORECAST' },
                    { 'data': 'RE020_ACTUAL' },
                    { 'data': 'CI025_ACTUAL' },
                    { 'data': 'CI020_ACTUAL' },
                    { 'data': 'CI050_ACTUAL' },
                    { 'data': 'ONAIR_ACTUAL' },
                    { 'data': 'PM_ATTUID' }
                ],

                createdRow: function (row, data, index) {
                    if (data["IPLAN_STATUS"] == "Complete") {
                        $(row).addClass('highlightGreen');
                    }
                    if (data["CURRENT_NEED_BY_DATE"] === null) { return '12/31/9999'; }

                    if (data["IPLAN_STATUS"] == "Complete") {
                        $('td', row).eq(8).addClass('highlightGreen');
                    }
                    else {
                        if (new Date(data["CURRENT_NEED_BY_DATE"]) < new Date()) {
                            $('td', row).eq(8).addClass('highlightYellow');
                        }
                    }
                },

                "fnDrawCallback": function () {
                    $('#tabMapSearchTable tr').find('td').each(function () {
                        $(this).on('mouseover', function () {
                            $(this).parent().css('background', 'silver');
                            this.style.cursor = 'pointer';
                        }).on('mouseout', function () {
                            $(this).parent().css('background', 'transparent');
                            this.style.cursor = 'default';
                        });
                    });
                },
            });

            $(window).resize();

        }

        /* MARKET CHART CREATER */
        function loadMarket_Chart_Creator(DD1, container, chart_title, SVNum) {
            var DD1_series_values = [];
            var keys = Object.keys(DD1[0]);
            var prev_year = new Date().getFullYear() - 1
            var curr_year = new Date().getFullYear()
            var curr_year_plus1 = new Date().getFullYear() + 1
            var curr_year_plus2 = new Date().getFullYear() + 2
            var curr_year_plus3 = new Date().getFullYear() + 3


            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < DD1.length; j++) {
                    if (k == 0) {
                        a.push(DD1[j][0]);
                    } else {
                        a.push(DD1[j][keys[k]]);
                    }
                }
                DD1_series_values.push(a);
            }

            createMarketChart(DD1_series_values[SVNum], container, chart_title);

            var j = 16
            chartmodcode.addSeries({
                name: curr_year_plus3 + '+ Forecasted',
                id: curr_year_plus3 + '+ Forecasted',
                data: DD1_series_values[j],
                animation: false,
                color: '#87cefa',
                showInLegend: false
            }, false);
            var j = 15
            chartmodcode.addSeries({
                name: curr_year_plus2 + ' Forecasted',
                id: curr_year_plus2 + ' Forecasted',
                data: DD1_series_values[j],
                animation: false,
                color: '#4da6ff',
                showInLegend: false
            }, false);
            var j = 14
            chartmodcode.addSeries({
                name: curr_year_plus1 + ' Forecasted',
                id: curr_year_plus1 + ' Forecasted',
                data: DD1_series_values[j],
                animation: false,
                color: '#0066cc',
                showInLegend: false
            }, false);
            var j = 13
            chartmodcode.addSeries({
                name: curr_year + ' Forecasted',
                id: curr_year + ' Forecasted',
                data: DD1_series_values[j],
                animation: false,
                color: '#00008b',
                showInLegend: false
            }, false);
            var j = 10
            chartmodcode.addSeries({
                name: curr_year + ' Complete',
                id: curr_year + ' Complete',
                data: DD1_series_values[j],
                animation: false,
                color: '#008000',
                showInLegend: false
            }, false);
            var j = 17
            chartmodcode.addSeries({
                name: prev_year + ' Complete',
                id: prev_year + ' Complete',
                data: DD1_series_values[j],
                animation: false,
                color: '#003300',
                showInLegend: false
            }, false);

            chartmodcode.redraw();
        }

        function createMarketChart(chartxaxis, container, chart_title) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
            });
            chartmodcode = new Highcharts.Chart({
                chart: {
                    type: 'bar',
                    renderTo: container,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 10,
                    zoomType: 'xy',
                    marginLeft: '140',
                    marginRight: '25',
                    //margin: '0',
                    height: '500',
                    //height: '230',
                    //width: '280'
                },
                exporting: {
                    enabled: true
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
                xAxis: {
                    categories: chartxaxis,
                    title: {
                        enabled: false
                    }
                },
                plotOptions: {
                    bar: { stacking: 'normal' },
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
                        text: 'Project Count',
                        style: {
                            fontSize: "12px"
                        }
                    },
                    labels: {
                        style: {
                            fontSize: "10px"
                        }
                    },
                    stackLabels: {
                        enabled: true,
                        style: {
                            fontWeight: 'bold',
                            color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                        }
                    }
                }],
                tooltip: {
                    headerFormat: '<span style="font-size:16px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y} </b></td>' + '<td style="padding:0"> ({point.percentage: .1f} %) </td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var table

        function createMAIN_TABLE(tabledata, div, field_title, field_value) {


            var prev_year = new Date().getFullYear() - 1
            var curr_year = new Date().getFullYear()
            var curr_year_plus1 = new Date().getFullYear() + 1
            var curr_year_plus2 = new Date().getFullYear() + 2
            var curr_year_plus3 = new Date().getFullYear() + 3
            var tabCheck = $("#" + div).hasClass("tabulator")
            if (tabCheck) {
                table.destroy;
            }

            table = new Tabulator("#MAIN_TABLE_" + div, {
                index: "name",
                layout: "fitColumns",
                columnVertAlign: "bottom",
                //height: 311, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
                data: tabledata, //assign data to table                
                pagination: "local",
                paginationSize: 10,
                paginationSizeSelector: [10, 20, 30],
                layout: "fitColumns", //fit columns to width of table (optional)
                columns: [
                    //{ title: "Rank", field: "rank"},
                    { title: field_title, field: field_value, align: "center" },
                    { title: prev_year + " Completed", field: "PREVYR_COMPLETE", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatter: "money", formatterParams: { thousand: ",", precision: false }, align: "center" },
                    { title: curr_year + " Completed", field: "YTD_COMPLETE", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatter: "money", formatterParams: { thousand: ",", precision: false }, align: "center" },
                    { title: curr_year + " Remain Fcst", field: "FORE_CURYR", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatter: "money", formatterParams: { thousand: ",", precision: false }, align: "center" },
                    { title: curr_year_plus1 + " Forcasted", field: "FORE_CURYR_PLUS1", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatter: "money", formatterParams: { thousand: ",", precision: false }, align: "center" },
                    { title: curr_year_plus2 + " Forcasted", field: "FORE_CURYR_PLUS2", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatter: "money", formatterParams: { thousand: ",", precision: false }, align: "center" },
                    { title: curr_year_plus3 + "+ Forcasted", field: "FORE_CURYR_PLUS3", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatter: "money", formatterParams: { thousand: ",", precision: false }, align: "center" },
                    { title: "Total Jobs", field: "TOTAL_JOBS", formatter: "money", bottomCalc: "sum", bottomCalcFormatter: "money", bottomCalcFormatterParams: { thousand: ",", precision: false }, formatterParams: { thousand: ",", precision: false }, align: "center" },

                ],
                rowClick: function (e, row) {
                    //var index = row.getIndex();
                    var index = row.getData().name;
                    //console.log(index);
                },
            });
            //table.clearData;
            //table.setColumns(newColumns);
            //table.setData(tabledata);
            table.setSort(field_value, "asc");
            table.updateData([{ rank: 0 }]);
            //table.redraw;
            BUTTON_YEAR();
        }

        function loadcalculatenumbers(planbasedata, pacepoedata, pacepoecuryrdata, planvsactualdata) {
            var pacedata = JSON.parse(pacepoedata.d); 
            var plandata = JSON.parse(planbasedata.d);
            var pacepoecuryrdata = JSON.parse(pacepoecuryrdata.d);
            var planvsactualdata = JSON.parse(planvsactualdata.d);
            var allin_value = plandata[0]["ALLIN"];            
            var plan = pacedata[0]["POE_CURYR"];            
            var podtotal = plandata[0]["PODTOTAL_CUR_YR"];                        
            var remainingforecast = pacedata[0]["FORE_CURYR"];
            var ytd_complete = pacedata[0]["YTD_COMPLETE"];
            var prevyr_complete = pacedata[0]["PREVYR_COMPLETE"];
            var planvsact = planvsactualdata[0]["PLANVSACT"];

            var forecast = remainingforecast + ytd_complete;
            var RemainingNotComplete = allin_value - ytd_complete - prevyr_complete;
            
            var donutvalue = pacepoecuryrdata[0]["PERCENT_COMPLETE"];
            var donuttitle = 'Job Status';
            var donutpoe = pacepoecuryrdata[0]["POE_CURYR"];
            var donutforecast = pacepoecuryrdata[0]["FORE_CURYR"];
            var donutytdcomplete = pacepoecuryrdata[0]["YTD_COMPLETE"];
            var donutfore1q = pacepoecuryrdata[0]["FORE1Q"];
            var donutfore2q = pacepoecuryrdata[0]["FORE2Q"];
            var donutfore3q = pacepoecuryrdata[0]["FORE3Q"];
            var donutfore4q = pacepoecuryrdata[0]["FORE4Q"];
            var donutplanvsact = pacepoecuryrdata[0]["YTD_COMPLETE"];
            var donutperc_fore_of_plan = (forecast * 100 / plan).toFixed(1);
            var donutperc_comp = (ytd_complete * 100 / plan).toFixed(1);            
            var donutshort = plan - forecast;
            var donutplanyear = pacepoecuryrdata[0]["FORECAST_YEAR"];            

            var plan_comma = Number(plan).toLocaleString('en');
            var allin_value_comma = Number(allin_value).toLocaleString('en');
            var podtotal_value_comma = Number(podtotal).toLocaleString('en');
            var forecast_comma = Number(forecast).toLocaleString('en');
            var ytd_complete_comma = Number(ytd_complete).toLocaleString('en');
            var prevyr_complete_comma = Number(prevyr_complete).toLocaleString('en');
            var RemainingNotComplete_comma = Number(RemainingNotComplete).toLocaleString('en');

            document.getElementById('POE_CURYR').innerHTML = plan_comma;
            document.getElementById('ALLIN').innerHTML = allin_value_comma;
            document.getElementById('FORE_CURYR').innerHTML = forecast_comma;
            document.getElementById('YTD_COMPLETE').innerHTML = ytd_complete_comma;
            document.getElementById('ALLIN_COMP_CURYR').innerHTML = ytd_complete_comma;
            document.getElementById('ALLIN_COMP_PREVYR').innerHTML = prevyr_complete_comma;
            document.getElementById('ALLIN_REMAIN').innerHTML = RemainingNotComplete_comma;
            //document.getElementById('PODTOTAL_CUR_YR').innerHTML = podtotal_value_comma;

            //loadDonut1(pacepoecuryrdata);
            donutcharting101('donut1', Number(donutvalue), donuttitle, plan, forecast, donutytdcomplete, donutfore1q, donutfore2q, donutfore3q, donutfore4q, planvsact, donutperc_fore_of_plan, donutperc_comp, donutshort, donutplanyear);
        }
        
        /* donut1 chart data */

        //function loadDonut1(data) {
        //    var score = JSON.parse(data.d); //parse your data
        //    var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
        //    var title = 'Job Status';
        //    var poe = score[0]["POE_CURYR"];
        //    var forecast = score[0]["FORE_CURYR"];
        //    var ytdcomplete = score[0]["YTD_COMPLETE"];
        //    var fore1q = score[0]["FORE1Q"];
        //    var fore2q = score[0]["FORE2Q"];
        //    var fore3q = score[0]["FORE3Q"];
        //    var fore4q = score[0]["FORE4Q"];
        //    var planvsact = score[0]["YTD_COMPLETE"];
        //    var perc_fore_of_plan = (score[0]["FORE_CURYR"] * 100 / score[0]["POE_CURYR"]).toFixed(1);
        //    var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_CURYR"]).toFixed(1);
        //    var short = score[0]["POE_CURYR"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];
        //    var planyear = score[0]["FORECAST_YEAR"];

        //    donutcharting101('donut1', Number(value), title, poe, forecast, ytdcomplete, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short, planyear); //call my chart building function
        //}

        /* TASK PROGRESSION CHART CREATER */
        function columnSAProgressChartCreatorMCA(container, allindata, MSdata, planyear, poe, forecast, categorylist, chartheight) {
            var max_of_array = Math.max(poe, forecast);
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }

            });
            $(function () {
                Highcharts.chart(container, {
                    colors: ['#959595', '#4da6ff'],
                    chart: {
                        type: 'bar',
                        height: chartheight,
                        //width: '430'
                    },
                    title: {
                        text: 'Task Progression of Forecasted Jobs'
                    },
                    xAxis: {
                        categories: categorylist,
                        //categories: ['<b>' + planyear + ' (POE)  <b>' + poeperc + '%', '<b>' + planyear + ' Forecasted  <b>' + foreperc + '%', 'Tower Application Submitted (RE007)  <b>' + re007perc + '%', 'Leasing Agreement Signed (RE015)  <b>' + re015perc + '% ',
                        //'Site Acquisition Complete (RE020)  <b>' + re020perc + '% ', 'Construction Started (CI025)  <b>' + ci025perc + '%', 'Tower Work Complete (CI020)  <b>' + ci020perc + '% ',
                        //'Integration Complete (CI035)  <b>' + ci035perc + '% ', 'On-Air Complete (OnAir Actual)  <b>' + onairperc + '% '],
                        labels: {
                            style: {
                                fontSize: '14px',
                                color: 'black'
                            }
                        },
                        title: {
                            text: ''
                        }
                    },
                    yAxis: {
                        max: max_of_array,
                        labels:
                        {
                            enabled: false
                        },
                        title: {
                            text: 'Project Count',
                            style: {
                                fontSize: "14px"
                            }
                        }
                    },
                    legend: {
                        itemStyle: {
                            color: '#000000',
                            fontSize: "14px",
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

                        //formatter: function () {
                        //    var content = "";
                        //    this.series.data.forEach(function (serie) {
                        //        content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                        //    });
                        //    return '<b><p style="font-size:12px;" align="center";>{point.key}</b></br><p style="font-size:11px;">' + content ;
                        //},

                        shared: true,
                        useHTML: true,
                        backgroundColor: '#FFFFFF'
                    },
                    credits: {
                        enabled: false
                    },
                    plotOptions: {
                        series: {
                            stacking: 'normal',
                            pointWidth: 25,
                            animation: false
                        }
                    },
                    series: [{
                        name: 'Not Complete',
                        legendIndex: 1,
                        dataLabels: {
                            enabled: true,
                            color: '#000',
                            style: {
                                textOutline: false,
                                fontWeight: 'bold'
                            }
                        },
                        data: allindata
                    },
                    {
                        name: 'Milestone Complete',
                        legendIndex: 0,
                        dataLabels: {
                            enabled: true,
                            color: '#000',
                            style: {
                                textOutline: false,
                                fontWeight: 'bold'
                            }
                        },
                        data: MSdata
                    }]
                });
            });
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
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        margin: '0',
                        height: '265',
                        //width: '200'

                    },
                    title: {
                        text: null
                    },
                    subtitle: { //chart subtitle assignment and location in the chart area
                        text: subtitle,
                        align: 'center',
                        verticalAlign: 'middle',
                        y: 0
                    },
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:12px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' + content +
                                '<b><center>' + planyear + ' POE (Plan): ' + poe
                                +
                                '<br>' + planyear + ' Forecast: ' + forecast + ' (' + perc_fore_of_plan + '%)'
                                +
                                '<br>' + planyear + ' Complete: ' + ytdcomplete + ' (' + perc_comp + '%)'
                                ;
                        },
                        useHTML: true,
                        backgroundColor: '#FFFFFF'

                    },
                    plotOptions: { //setting other options like data labels, themes
                        pie: {
                            allowPointSelect: false,
                            cursor: 'default',
                            dataLabels: {
                                enabled: true,
                                format: '{point.y:.0f}',
                                distance: -25,
                                filter: {
                                    property: 'percentage',
                                    operator: '>',
                                    value: 4
                                }
                            }
                        }
                    },
                    credits: { //gets rid of the highcharts.com link
                        enabled: false
                    },
                    series: [{ //assign your data to the series
                        name: title,
                        colorByPoint: true,
                        size: '100%',
                        innerSize: '50%',
                        data: [
                            { name: 'Completed', y: ytdcomplete, color: '#008000' },
                            { name: '1Q Forecast', y: fore1q, color: '#00008b' },
                            { name: '2Q Forecast', y: fore2q, color: '#0066cc' },
                            { name: '3Q Forecast', y: fore3q, color: '#4da6ff' },
                            { name: '4Q Forecast', y: fore4q, color: '#87cefa' },
                            { name: 'Not ' + planyear + ' Forecasted', y: short2, color: '#ff3333' },

                        ]
                    }]
                });
            });
        }

        /* CYCLETIME CHART LOADER */

        function createCYCLETIME_CHART(chart_data) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#1E90FF', '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4', '#808080']
            });
            chart2 = new Highcharts.Chart({

                chart: {
                    renderTo: "CYCLETIME_CHART",
                    type: 'bubble',
                    plotBorderWidth: 1,
                    height: '575',
                    zoomType: 'xy'
                },

                legend: {
                    enabled: false
                },

                title: {
                    text: 'Cycletime - RE020 - Site Acquisition Vendor'
                },

                credits: {
                    enabled: false
                },

                subtitle: {
                    text: 'subtitle'
                },

                xAxis: {
                    gridLineWidth: 1,
                    title: {
                        text: 'ISSUE ONAIR FORECAST MEDIAN'
                    },
                    labels: {
                        format: '{value} days'
                    },
                    plotLines: [{
                        color: 'black',
                        dashStyle: 'dot',
                        width: 2,
                        value: 460,
                        label: {
                            rotation: 0,
                            y: 15,
                            style: {
                                fontStyle: 'italic'
                            },
                            text: 'SLA 460 days'
                        },
                        zIndex: 3
                    }]
                },

                yAxis: {
                    startOnTick: false,
                    endOnTick: false,
                    title: {
                        text: 'ISSUE RE020A MEDIAN'
                    },
                    labels: {
                        format: '{value} days'
                    },
                    maxPadding: 0.2,
                    plotLines: [{
                        color: 'black',
                        dashStyle: 'dot',
                        width: 2,
                        value: 300,
                        label: {
                            align: 'right',
                            style: {
                                fontStyle: 'italic'
                            },
                            text: 'SLA 300 days',
                            x: -10
                        },
                        zIndex: 3
                    }]
                },

                tooltip: {
                    useHTML: true,
                    headerFormat: '<table>',
                    pointFormat: '<tr><th colspan="2"><h3>{point.country}</h3></th></tr>' +
                        '<tr><th>ISSUE ONAIR FORECAST MEDIAN:</th><td>{point.x} days</td></tr>' +
                        '<tr><th>ISSUE RE020A MEDIAN:</th><td>{point.y} days</td></tr>' +
                        '<tr><th>Job Count:</th><td>{point.z}</td></tr>',
                    footerFormat: '</table>',
                    followPointer: true
                },

                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}'
                        }
                    }
                },

                series: [{
                    data: chart_data
                }]
            });
        }

        function getCSV_10stringALL(year, region, market, submarket, program, subprogram, civilvendor, siteacqvendor, geturl1) {
            var divloader = "#LOADING_EXPORT_BUTTON";
            $(divloader).show();
            var geturl1_2 = geturl1 + "_2"
            var geturl1_3 = geturl1 + "_3"
            var geturl1_4 = geturl1 + "_4"
            var geturl1_5 = geturl1 + "_5"
            var geturl1_6 = geturl1 + "_6"
            var geturl1_7 = geturl1 + "_7"
            var geturl1_8 = geturl1 + "_8"
            var geturl1_9 = geturl1 + "_9"
            var geturl1_10 = geturl1 + "_10"
            $.when(
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
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
                    url: geturl1_2,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data2 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_3,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data3 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_4,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data4 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_5,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data5 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_6,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data6 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_7,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data7 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_8,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data8 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_9,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data9 = data.d;
                    },
                    error: function (data) { }
                }),
                $.ajax({
                    type: "POST",
                    async: true,
                    url: geturl1_10,
                    data: JSON.stringify({ 'yearVariable': year, 'regionVariable': region, 'marketVariable': market, 'submarketVariable': submarket, 'programVariable': program, 'subprogramVariable': subprogram, 'civilvendorVariable': civilvendor, 'siteacqvendorVariable': siteacqvendor }),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        Data10 = data.d;
                    },
                    error: function (data) { }
                })
            ).then(function () {
                $(divloader).hide();
                dataConcat_10stringsALL(Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10);
            });
        }

        function dataConcat_10stringsALL(data1, data2, data3, data4, data5, data6, data7, data8, data9, data10) {
            var dataConcat10;
            data1 = data1.substring(0, data1.length - 1);
            data2 = data2.substring(1, data2.length - 1);
            data3 = data3.substring(1, data3.length - 1);
            data4 = data4.substring(1, data4.length - 1);
            data5 = data5.substring(1, data5.length - 1);
            data6 = data6.substring(1, data6.length - 1);
            data7 = data7.substring(1, data7.length - 1);
            data8 = data8.substring(1, data8.length - 1);
            data9 = data9.substring(1, data9.length - 1);
            data10 = data10.substring(1, data10.length);
            dataConcat10 = data1 + ',' + data2 + ',' + data3 + ',' + data4 + ',' + data5 + ',' + data6 + ',' + data7 + ',' + data8 + ',' + data9 + ',' + data10;
            loadDownloadCSV_ConcatALL(dataConcat10);
        }

        function loadDownloadCSV_ConcatALL(data) {
            stockData = JSON.parse(data);
            if (stockData.length <= 0) {
                alert("No data to export")
                //$('#NODATA_EXPORT').show(); 
                //setTimeout('$("#NODATA_EXPORT").hide()',4000);
            }
            else {
                var forecast_year = stockData[0]["FORECAST_YEAR"];
                var region = stockData[0]["REGION"];
                var market = stockData[0]["MARKET"];
                var submarket = stockData[0]["SUBMARKET"];
                var subprog = stockData[0]["SUB_PROGRAM"];
                var program = stockData[0]["PROGRAM"];
                var data, filename, link;
                var csv = convertArrayOfObjectsToCSV({
                    data: stockData
                });
                if (csv == null)
                    return;

                filename = forecast_year + '_' + region + '_' + market + '_' + submarket + '.csv';

                var blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });

                if (navigator.msSaveBlob) { // IE 10+
                    navigator.msSaveBlob(blob, filename)
                }
                else {
                    var link = document.createElement("a");
                    if (link.download !== undefined) { // feature detection, Browsers that support HTML5 download attribute
                        var url = URL.createObjectURL(blob);
                        link.setAttribute("href", url);
                        link.setAttribute("download", filename);
                        link.style = "visibility:hidden";
                        document.body.appendChild(link);
                        link.click();
                        document.body.removeChild(link);
                    }
                }
            }
        }

        function convertArrayOfObjectsToCSV(args) {
            var result, ctr, keys, columnDelimiter, lineDelimiter, data;

            data = args.data || null;
            if (data == null || !data.length) {
                return null;
            }

            columnDelimiter = args.columnDelimiter || ',';
            lineDelimiter = args.lineDelimiter || '\n';

            keys = Object.keys(data[0]);

            result = '';
            result += keys.join(columnDelimiter);
            result += lineDelimiter;

            data.forEach(function (item) {
                ctr = 0;
                keys.forEach(function (key) {
                    if (ctr > 0) result += columnDelimiter;

                    result += item[key];
                    ctr++;
                });
                result += lineDelimiter;
            });

            return result;
        }

        function BUTTON_YEAR() {
            $('#Year_CR').show();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').show();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_REGION() {
            $('#Year_CR').hide();
            $('#Region_CR').show();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').show();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_MARKET() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').show();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').show();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_SUBMARKET() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').show();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').show();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_PROGRAM() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').show();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').show();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_SUBPROGRAM() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').show();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').show();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_CIVIL() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').show();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').show();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_SITE_ACQ() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').show();
            $('#RanInitiative_CR').hide();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').show();
            $('#MAIN_TABLE_RANINITIATIVE').hide();
        }

        function BUTTON_RAN_INITIATIVE() {
            $('#Year_CR').hide();
            $('#Region_CR').hide();
            $('#Market_CR').hide();
            $('#Submarket_CR').hide();
            $('#Program_CR').hide();
            $('#Subprogram_CR').hide();
            $('#CivilVendor_CR').hide();
            $('#SiteAcqVendor_CR').hide();
            $('#RanInitiative_CR').show();
            $('#MAIN_TABLE_YEAR').hide();
            $('#MAIN_TABLE_REGION').hide();
            $('#MAIN_TABLE_MARKET').hide();
            $('#MAIN_TABLE_SUBMARKET').hide();
            $('#MAIN_TABLE_PROGRAM').hide();
            $('#MAIN_TABLE_SUBPROGRAM').hide();
            $('#MAIN_TABLE_CIVILVENDOR').hide();
            $('#MAIN_TABLE_SITEACQVENDOR').hide();
            $('#MAIN_TABLE_RANINITIATIVE').show();
        }

    </script>

</asp:Content>

