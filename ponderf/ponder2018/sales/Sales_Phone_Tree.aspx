<%@ Page Title="Sales Phone Tree" Language="C#" MasterPageFile="~/MasterPagePhoneTree.master" AutoEventWireup="true" CodeFile="Sales_Phone_Tree.aspx.cs" Inherits="sales_Sales_Phone_Tree" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />

    <%--<link href="../assets_v7_0_0/plugins/custom/datatables/datatables.bundle.css" rel="stylesheet" />--%>
    <link href="../assets_v7_0_0/plugins/custom/treant-js-master/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" />
    <link href="../assets_v7_0_0/plugins/custom/treant-js-master/Treant.css" rel="stylesheet" />
    <link href="treant_PhoneTree/phone-decision-tree.css" rel="stylesheet" />

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

    <%--<link href="treant_PhoneTree/phone-decision-tree.css" rel="stylesheet" />--%>
    
    <script src="../assets_v7_0_0/plugins/custom/treant-js-master/vendor/jquery.easing.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/treant-js-master/vendor/jquery.min.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/treant-js-master/vendor/jquery.mousewheel.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/treant-js-master/vendor/raphael.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/treant-js-master/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="../assets_v7_0_0/plugins/custom/treant-js-master/Treant.js"></script>
    <script src="treant_PhoneTree/phone-decision-tree.js"></script>
    

    <style>
    .sidebar {
    height: 100%;
    width: 500px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
  }

  .sidebar p {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 15px;
    color: #818181;
    display: block;
    transition: 0.3s;
  }

  .sidebar a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
  }

  .sidebar a:hover {
    color: #f1f1f1;
  }

  .sidebar .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
  }

  .openbtn {
    font-size: 20px;
    cursor: pointer;
    background-color: #111;
    color: white;
    padding: 10px 15px;
    border: none;
  }

  .restartbtn {
    font-size: 20px;
    cursor: pointer;
    background-color: #087cc4;
    color: white;
    padding: 10px 15px;
    margin-right: 16px;
    border: none;
  }

  .openbtn:hover {
    background-color: #444;
  }

  #main {
    transition: margin-left .5s;
    padding: 16px;
    text-align: center;


  }

    /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
  @media screen and (max-height: 450px) {
    .sidebar {padding-top: 15px;}
    .sidebar p {font-size: 18px;}
    .sidebar a {font-size: 18px;}
  }
    table {
      width:80%;
    }
    table.center {
      margin-left: auto;
      margin-right: auto;
    }
    th, td {
      padding: 15px;
      text-align: left;
    }
    tr:nth-child(odd) {
      background-color: #eee;
    }
    tr:nth-child(even) {
     background-color: #fff;
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
                        <h5 class="text-dark font-weight-bold my-2 mr-5">Sales Phone Tree</h5>
                        <!--end::Page Title-->
                        <!--begin::Breadcrumb-->
                        <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales.aspx" class="text-muted">Sales Home Page</a>
                            </li>                            
                            <li class="breadcrumb-item">
                                <a href="/sales/Sales_Phone_Tree.aspx" class="text-muted">Sales Phone Tree</a>
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

                    <div style="text-align: center; color: #343a40">
                        <h2 id="contentTitle"></h2>
                    </div>                    

                    <div id="main">
                        <h1>Phone Decision Tool</h1>
                        <button class="restartbtn" id="reset" onclick="reset()" style="float: right">Restart</button>
                    </div>

                    <%--<div id="mySidebar" class="sidebar">
                      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
                      <p>Welcome to the Phone Decision Tool!</p>
                      <p>This site is an interactive decision tree to assist you in choosing a 5-way carrier aggregation
                        capable phone for a customer. Click on any green-highlighted block to progress
                        further through the tree. White blocks can be clicked on to compress any blocks below it.
                        When you reach a blue decision box, click on it to reveal
                        more detailed features of the phone below. When you're done and want to use the tool again,
                        click the Restart button in the top right corner to reset the tool.
                      </p>
                      </div>--%>
                      <p id="instructions">Welcome to the Phone Decision Tool! This site is an interactive decision tree to help you choose a 5-way carrier aggregation
                        capable phone for a customer. Click on any green-highlighted block to progress
                        further through the tree. White blocks can be clicked on to compress blocks below it.
                        When you reach a blue decision box, click on it to reveal
                        more detailed features of the phone below. When you're done and want to use the tool again,
                        click the Restart button in the top right corner to reset the tool.
                      </p>
                      <div class="chart" id="DecisionTree" class="center">
                      </div>
                      <h3 id="phoneM" style="text-align:left"></h3>
                      <h2 id="phoneName" style="text-align:left"></h2>
                      <img src="treant_PhoneTree/phonePhotos/iPhone11.jpg" style="display:none" id="phonePic" width="300" height=auto alt="" />
                      <table id="phoneFeatures" class="center">
                        <tr>
                          <td>Internal Memory Storage</td> <td></td>
                        </tr>
                        <tr>
                          <td>Processor Chipset</td><td></td>
                        </tr>
                        <tr>
                          <td>Battery Capacity(mAh)/Video Playback (hours)</td><td></td>
                        </tr>
                        <tr>
                          <td>Display Type</td><td></td>
                        </tr>
                        <tr>
                          <td>Front Camera</td><td></td>
                        </tr>
                        <tr>
                          <td>Rear Camera</td><td></td>
                        </tr>
                        <tr>
                          <td>4G/LTE/5Ge Support </td><td></td>
                        </tr>
                        <tr>
                          <td>5G Support</td><td></td>
                        </tr>
                        <tr>
                          <td>5G Plus Support</td><td></td>
                        </tr>
                        <tr>
                          <td>WiFi Calling</td><td></td>
                        </tr>
                        <tr>
                          <td>WiFi 6 Support</td><td></td>
                        </tr>
                        <tr>
                          <td>SIM Type</td><td></td>
                        </tr>
                        <tr>
                          <td>Carrier Aggregation</td><td></td>
                        </tr>
                        <tr>
                          <td>FirstNet Support</td><td></td>
                        </tr>
                      </table>
                    <br />
                    <br />
                    <br />
                </div>
            </div>                
        </div>
    </div>


    <script>

        var my_chart = new Treant(simple_chart_config);
        var tree = document.getElementById("DecisionTree");
        tree.style.display = "block";
        var phoneTable = document.getElementById("phoneFeatures");
        phoneTable.style.display = "none";
        document.getElementById("instructions").style.display = "block";
        $('body').on('click', '.Treant .node', function () {
            if ($(this).find(".node-name").text() == "iPhone SE 2020") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/iPhoneSE2020.jpg";
                document.getElementById("phoneName").innerHTML = "iPhone SE 2020";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 128 GB/ 256 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A13";
                phoneTable.rows[2].cells[1].innerHTML = "13 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "4.7\" LCD (1334 x 750 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Dual Flash) 4K Ultra HD (Standard)";
                phoneTable.rows[5].cells[1].innerHTML = "7MP (HDR) 1080p HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "iPhone 11") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/iPhone11.jpg";
                document.getElementById("phoneName").innerHTML = "iPhone 11";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 128 GB/ 256 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A13";
                phoneTable.rows[2].cells[1].innerHTML = "17 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "6.1\" LCD (1792 x 828 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Quad Flash) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "12MP (HDR Wide) 4K Ultra HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "iPhone 11 Pro") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/iPhone11Pro.jpg";
                document.getElementById("phoneName").innerHTML = "iPhone 11 Pro";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 256 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A13";
                phoneTable.rows[2].cells[1].innerHTML = "18 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "5.8\" OLED (2436 x 1125 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Quad Flash) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "12MP (HDR Wide) 4K Ultra HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "iPhone 11 Pro Max") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/iPhone11ProMax.jpg";
                document.getElementById("phoneName").innerHTML = "iPhone 11 Pro Max";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 256 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A13";
                phoneTable.rows[2].cells[1].innerHTML = "20 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "6.5\" OLED (2688 x 1242 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Quad Flash) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "12MP (HDR Wide) 4K Ultra HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "iPhone XS") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/iPhoneXS.jpg";
                document.getElementById("phoneName").innerHTML = "iPhone XS";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 128 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A12";
                phoneTable.rows[2].cells[1].innerHTML = "14 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "5.8\" OLED (2436 x 1125 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Quad Flash) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "7MP (HDR) 1080p HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "No";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "iPhone XS Max") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").width = "300";
                document.getElementById("phoneName").innerHTML = "iPhone XS Max";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 128 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A12";
                phoneTable.rows[2].cells[1].innerHTML = "15 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "6.5\" OLED (2688 x 1242 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Quad Flash) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "7MP (HDR) 1080p HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "No";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "iPhone XR") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/iPhoneXR.jpg";
                document.getElementById("phoneName").innerHTML = "iPhone XR";
                document.getElementById("phoneM").innerHTML = "Apple";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 128 GB";
                phoneTable.rows[1].cells[1].innerHTML = "A12";
                phoneTable.rows[2].cells[1].innerHTML = "16 hrs";
                phoneTable.rows[3].cells[1].innerHTML = "6.1\" LCD (1792 x 828 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP (Wide/Quad Flash) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "7MP (HDR) 1080p HD";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "No";
                phoneTable.rows[11].cells[1].innerHTML = "Dual SIM (eSIM + Nano SIM)";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S9") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s9.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy S9";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "64 GB/ 128 GB/ 256 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 845";
                phoneTable.rows[2].cells[1].innerHTML = "3000 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "5.8\" AMOLED (2960 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP(Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "8MP (HDR Wide) 1440p";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "No";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S10") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s10.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy S10";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "3400 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.1\" AMOLED (3040 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "16MP(Ultra Wide)/12MP(Wide)/12MP(Tele) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S10+") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s10Plus.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy S10+";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB/ 512 GB/ 1 TB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "4100 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.4\" AMOLED (3040 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "16MP(Ultra Wide)/12MP(Wide)/12MP(Tele) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "10MP/8MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S10 Lite") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s10Lite.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy S10 Lite";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "4500 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.7\" AMOLED (2400 x 1080 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "48MP(Wide)/12MP(Ultra Wide)/5MP(Macro)  4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "32MP(HDR Wide) 1080p HD";
                phoneTable.rows[6].cells[1].innerHTML = "No";
                phoneTable.rows[7].cells[1].innerHTML = "No";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "No";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S10e") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s10e.jfif";
                document.getElementById("phoneName").innerHTML = "Galaxy S10e";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "4100 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.4\" AMOLED (3040 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "16MP(Ultra Wide)/12MP(Wide)/12MP(Tele) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "10MP/8MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S20 5G") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s20.png";
                document.getElementById("phoneName").innerHTML = "Galaxy S20 5G";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 865";
                phoneTable.rows[2].cells[1].innerHTML = "4000 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.2\" AMOLED (3200 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "64MP(Tele)/12MP(Wide)/12MP(Ultra Wide) 8K";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S20+ 5G") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s20Plus.jpeg";
                document.getElementById("phoneName").innerHTML = "Galaxy S20+ 5G";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 865";
                phoneTable.rows[2].cells[1].innerHTML = "4500 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.7\" AMOLED (3200 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "64MP(Tele)/12MP(Wide)/12MP(Ultra Wide) 8K";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "Yes";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy S20 Ultra 5G") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/s20Ultra.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy S20 Ultra 5G";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 865";
                phoneTable.rows[2].cells[1].innerHTML = "5000 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.9\" AMOLED (3200 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "108MP(Wide)/48MP(Tele)/12MP(Utra Wide) 8K";
                phoneTable.rows[5].cells[1].innerHTML = "40MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "Yes";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy Note9") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/note9.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy Note9";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 845";
                phoneTable.rows[2].cells[1].innerHTML = "4000 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.4\" AMOLED (2960 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "12MP(Wide) 4K Ultra HD (Standard)";
                phoneTable.rows[5].cells[1].innerHTML = "80MP (HDR Wide) 1440p";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "No";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "No";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy Note10") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/note10.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy Note10";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "256 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "3500 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.3\" AMOLED (2280 x 1080 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "16MP(Ultra Wide)/12MP(Wide)/12MP(Tele) 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Standard)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "No";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy Note10+") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/note10Plus.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy Note10+";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "256 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "4300 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.8\" AMOLED (3040 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "16MP(Ultra Wide)/12MP(Wide)/12MP(Tele)/Dual OIS 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Standard)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "No";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy Note10+ 5G") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/note10P5G.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy Note10+ 5G";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "256 GB/ 512 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 855";
                phoneTable.rows[2].cells[1].innerHTML = "4300 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.8\" AMOLED (3040 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "16MP(Ultra Wide)/12MP(Wide)/12MP(Tele)/Dual OIS 4K Ultra HD (Advanced)";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Standard)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "No";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy Note20 5G") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/note20.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy Note20 5G";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 865+";
                phoneTable.rows[2].cells[1].innerHTML = "4300 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.7\" AMOLED (2400 x 1080 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "64MP(Tele)/12MP(Ultra Wide)/12MP(Wide) 8K";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 8K";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "Yes";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }
            else if ($(this).find(".node-name").text() == "Galaxy Note20 Ultra 5G") {
                document.getElementById("phonePic").style.display = "block";
                document.getElementById("instructions").style.display = "none";
                tree.style.display = "none";
                document.getElementById("phonePic").src = "treant_PhoneTree/phonePhotos/note20Ultra.jpg";
                document.getElementById("phoneName").innerHTML = "Galaxy Note20 Ultra 5G";
                document.getElementById("phoneM").innerHTML = "Samsung";
                phoneTable.style.display = "block";
                phoneTable.rows[0].cells[1].innerHTML = "128 GB/ 256 GB";
                phoneTable.rows[1].cells[1].innerHTML = "Snapdragon 865+";
                phoneTable.rows[2].cells[1].innerHTML = "4500 mAh";
                phoneTable.rows[3].cells[1].innerHTML = "6.9\" AMOLED (3088 x 1440 pixels)";
                phoneTable.rows[4].cells[1].innerHTML = "108MP(Wide)/12MP(Ultra Wide)/12MP(Tele) 8K";
                phoneTable.rows[5].cells[1].innerHTML = "10MP (HDR Wide) 4K Ultra HD (Advanced)";
                phoneTable.rows[6].cells[1].innerHTML = "Yes";
                phoneTable.rows[7].cells[1].innerHTML = "Yes";
                phoneTable.rows[8].cells[1].innerHTML = "Yes";
                phoneTable.rows[9].cells[1].innerHTML = "Yes";
                phoneTable.rows[10].cells[1].innerHTML = "Yes";
                phoneTable.rows[11].cells[1].innerHTML = "Nano";
                phoneTable.rows[12].cells[1].innerHTML = "5 way";
                phoneTable.rows[13].cells[1].innerHTML = "Ready";
            }

        });

        function reset() {
            tree.style.display = "block";
            my_chart.destroy();
            my_chart = new Treant(simple_chart_config);
            document.getElementById("instructions").style.display = "block";
            document.getElementById("phoneFeatures").style.display = "none";
            document.getElementById("phonePic").style.display = "none";
            document.getElementById("phoneName").style.display = "none";
            document.getElementById("phoneM").style.display = "none";
        }

    </script>


</asp:Content>
