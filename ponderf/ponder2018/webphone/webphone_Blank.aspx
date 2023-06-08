<%@ Page Title="Webphone Blank" Language="C#" MasterPageFile="~/MasterPageWebphone.master" AutoEventWireup="true" CodeFile="webphone_Blank.aspx.cs" Inherits="_webphone_Blank" %>

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

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>

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

    <style>
        .left {
            float: left;
        }

    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">            
            <h3 class="m-subheader__title m-subheader__title--separator">Webphone Report Dashboard
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/webphone/webphone.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/webphone/webphone.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Webphone Dashboard
                        </span>
                    </a>
                </li>
            </ul>        
        </div>
       
    </div>

    <div class="col-xl-12">        
        <div class="m-portlet">
            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <h5 class="left">Date Of Data: &nbsp; </h5>
                    <h5 class="left" id="DATADATE"></h5>
                    <asp:Label ID="labelMarket" runat="server" Text="Region/AVP/Market: &nbsp;&nbsp;" Visible="true" Font-Size="12" Font-Bold="true" ForeColor="Black"></asp:Label>
                    <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                        <asp:ListItem Text=""></asp:ListItem>
                    </asp:DropDownList>                    
                </div>
            </div>

            <div class="m-portlet__body">                

                
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            attachClickHandlers();
            console.log("DocReady");            

        });        

        function attachClickHandlers() {
            console.log("ClickHandler");
            $('#ddlMarket').change(
                function () {
                    var market = $('#ddlMarket option:selected').val();
                    var market_long = $('#ddlMarket option:selected').text();
                    console.log(market_long);
                    console.log(market);
                    Getmarketdata(market);

                }
            );

            $.ajax({
                type: "POST",
                async: true,
                url: "webphone_Blank.aspx/GetCURRYEAR",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadCURRYEAR(data);
                },
                error: function (data) {
                }
            });
        }

        function Getmarketdata(market) {

            $.ajax({
                type: "POST",
                async: true,
                url: "webphone_Blank.aspx/GetDATADATE",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDATADATE(data);
                },
                error: function (data) {
                }
            });
        }

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value;
        }
        

    </script>


</asp:Content>


