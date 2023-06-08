<%@ Page Title="Sambar Table" Language="C#" MasterPageFile="~/MasterPageSambar.master" AutoEventWireup="true" CodeFile="Sambar_Table.aspx.cs" Inherits="Sambar_Sambar_Table" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
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

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Sambar Table
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/Sambar/Sambar.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/Sambar/Sambar_Table.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Sambar Table
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

                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                    </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>

                            <asp:Label ID="labelMarket" runat="server" Text="Sales Region/VPGM: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlMarket"  AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                            </asp:DropDownList>

                            <asp:Label ID="labelMonth" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;Month: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlMonth" AutoPostBack="false" runat="server">
                            </asp:DropDownList>--%>

                            <%--<asp:Button ID="Button1" Style="margin: 5px;" runat="server" Text="Submit" OnClientClick="getFilterCriteria();" />--%>

                        <%--</ContentTemplate>
                    </asp:UpdatePanel>--%>

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
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="row">
                                                    <div class="col-lg-12">

                                                        <div class="row" style="text-align: left">Placeholder1</div>

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
                                        <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="row">
                                                    <div class="col-lg-12">

                                                        <div class="row" style="text-align: left">Placeholder3</div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="m_tabs_1_4" role="tabpanel">
                                       <div class="m-portlet__head">
                                            <div class="m-portlet__head-caption">
                                                <div class="row">
                                                    <div class="col-lg-12">

                                                        <div class="row" style="text-align: left">Placeholder4</div>

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

        $(document).ready(function () {
            
            console.log("DocReady");
            $.ajax({
                type: "POST",
                async: true,
                url: "Sambar_Table.aspx/GetDATADATE",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDATADATE(data);
                },
                error: function (data) {
                }
            });

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

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value; 

        }

        $('.nav-tabs li').click(function () {
            $(window).resize();
            $(window).resize();
        });

    </script>


</asp:Content>


