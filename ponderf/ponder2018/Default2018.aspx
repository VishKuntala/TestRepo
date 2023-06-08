<%@ Page Title="CR Dashboard Overview" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2018.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" />

    <script type="text/javascript" src="../Scripts/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-ui.min.js"></script>
    <link href="../tabulator/dist/css/tabulator.css" rel="stylesheet">
    <script type="text/javascript" src="../tabulator/dist/js/tabulator.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.css" />
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/pdfmake-0.1.18/dt-1.10.13/b-1.2.4/b-colvis-1.2.4/b-flash-1.2.4/b-html5-1.2.4/b-print-1.2.4/cr-1.3.2/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>

    <style type="text/css">
        .box1 {
            width: 20px;
            height: 20px;
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
            display: inline-block;
        }

        #donutrowlegend {
            text-align: center;
        }

        .tabulator {
            position: relative;
            border: 1px solid #999;
            background-color: #888;
            font-size: 13px;
            text-align: left;
            overflow: hidden;
            -ms-transform: translatez(0);
            transform: translatez(0);
        }

            .tabulator .tabulator-header .tabulator-col {
                display: inline-block;
                position: relative;
                box-sizing: border-box;
                border-right: 1px solid #aaa;
                background: #87cefa;
                text-align: center;
                vertical-align: bottom;
                overflow: hidden;
            }
        a:link {
            color: #00008b;
            background-color: transparent;
            text-decoration: none;
        }
        a:hover {
            color: royalblue;
            background-color: transparent;
            text-decoration: underline;
        }
        a.menu_show { cursor: pointer; }
        a.menu_hide { cursor: pointer; }

    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">RAN Central Region 2018 Capital Plan ** Michigan/Indiana now included **
            </h3>
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
            </ul>
        </div>
    </div>

    <div class="col-xl-12">
        <!--begin::Portlet-->
        <div class="m-portlet">

            <%-- SELECTORS --%>

            <%--<div class="row" id="selectorrow" style="width: 99.5%; height: 3%; margin: 0.5%;">

                <asp:Label ID="labelMarket" runat="server" Text="Market: &nbsp;&nbsp;" Visible="true" font-size=12 ForeColor="Black"></asp:Label>
                <asp:DropDownList ID="ddlMarket" AppendDataBoundItems="true" AutoPostBack="false" ClientIDMode="Static" runat="server">
                    <asp:ListItem Text=""></asp:ListItem>
                </asp:DropDownList>

            </div>--%>

            <div class="m-portlet__head">
                <div class="m-portlet__head-caption">
                    <div class="m-portlet__head-title">
                        <h3 class="m-portlet__head-text">Date Of Data: &nbsp; </h3>
                        <h3 class="m-portlet__head-text" id="DATADATE" style="text-align: right;"></h3>
                    </div>              
                </div>
            </div>

            <div class="m-portlet__body">
                <div class="m-section">
                    <div class="row">
                        <div class="col-lg-5">
                            <!--begin::Portlet-->

                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">                                    
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon">
                                            <i class="flaticon-clipboard"></i>
                                        </span>                                        
                                        <h3 class="m-portlet__head-text">Plan Numbers</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="m-portlet__body">
                                    <div class="row" id="titlerow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title1col" style="height: 100%;"></div>
                                        <div class="col-md-2" id="title2col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">Jobs</h6>
                                        </div>
                                        <div class="col-md-2" id="title3col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">FA's</h6>
                                        </div>                                        
                                    </div>
                                    
                                    <div class="row" id="titlerow1" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title11col" style="height: 100%;" title="All iPlan Jobs (Status: Issued, In Progress, Completed in 2018)">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total Projects Issued</h6>
                                        </div>
                                        <div class="col-md-2" id="ALLIN_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="ALLIN"></h6>
                                        </div>
                                        <div class="col-md-2" id="ALLINFA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="ALLINFA"></h6>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row" id="titlerow21" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title22col" style="height: 100%;" title="All iPlan Jobs (Status: Issued, In Progress, Completed in 2018) Need By Date Year = 2018 or earlier">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total 2018 POD</h6>
                                        </div>
                                        <div class="col-md-2" id="PODTOTAL2018_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="PODTOTAL2018"></h6>
                                        </div>
                                        <div class="col-md-2" id="PODTOTAL2018FA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="PODTOTAL2018FA"></h6>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row" id="titlerow31" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title33col" style="height: 100%;" title="PACE Jobs (Status: Active or Complete) Plan Year = 2018">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total 2018 POE</h6>
                                        </div>
                                        <div class="col-md-2" id="POETOTAL2018_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="POETOTAL2018"></h6>
                                        </div>
                                        <div class="col-md-2" id="POETOTAL2018FA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="POETOTAL2018FA"></h6>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row" id="titlerow41" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title44col" style="height: 100%;" title="PACE Jobs (Status: Active or Complete) Forecasted Year = 2018">
                                            <h6 class="m-subheader__title m-subheader__title--separator">Total 2018 Forecasted</h6>
                                        </div>
                                        <div class="col-md-2" id="FORETOTAL2018_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="FORETOTAL2018"></h6>
                                        </div>
                                        <div class="col-md-2" id="FORETOTAL2018FA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="FORETOTAL2018FA"></h6>
                                        </div>
                                        
                                    </div>
                                    
                                    <div class="row" id="titlerow51" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title55col" style="height: 100%;" title="PACE Jobs (Status: Complete) On-Air Actual Year = 2018">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">Total 2018 On Air</h6>
                                        </div>
                                        <div class="col-md-2" id="COMPTOTAL2018_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="COMPTOTAL2018"></h6>
                                        </div>
                                        <div class="col-md-2" id="COMPTOTAL2018FA_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator" id="COMPTOTAL2018FA"></h6>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row" id="titlerow61a" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                            <div class="col-md-12" id="title62acol" style="text-align: center">
                                                <h5 class="m-subheader2__title m-subheader2__title--separator">Metrics</h5>
                                            </div>
                                    </div>
                                    <div class="row" id="titlerow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title2a_col" style="height: 100%;"></div>
                                        
                                        <div class="col-md-2" id="title5a_col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">#</h6>
                                        </div>
                                        <div class="col-md-2" id="title6a_col" style="text-align: center">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">%</h6>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow61" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title65col" style="height: 100%;" title="PACE Jobs (2018 Completed) On-Air Actual <= Need by Date">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">Jobs On Air by NBD</h6>
                                        </div>                                        
                                        <div class="col-md-2" id="NBD_ON_TIME_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="NBD_ON_TIME"></h6>
                                        </div>
                                        <div class="col-md-2" id="NBD_ON_TIME_PERC_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="NBD_ON_TIME_PERC"></h6>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow71" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-8" id="title75col" style="height: 100%;" title="PACE Jobs (2018 Forecasted - Not Completed) Current Date is Beyond Need by Date">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">2018 Remaining Jobs Beyond NBD</h6>
                                        </div>                                       
                                        <div class="col-md-2" id="NBD_LATE_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="NBD_LATE"></h6>
                                        </div>
                                        <div class="col-md-2" id="NBD_LATE_PERC_1" style="text-align: center; color: black">
                                            <h6 class="m-subheader__title m-subheader__title--separator" id="NBD_LATE_PERC"></h6>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow81" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-10" id="title85col" style="height: 100%;" title="Compares counts of jobs forecasted for that month on the first day of the month, to what actually got completed that month (1-month buffer on completions to allow for true-up)">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">30 Day Forecast Attainment</h6>
                                        </div>                                        
                                        <div class="col-md-2" id="DAY30FOREATTAIN_1" style="text-align: center; color: #00008b">
                                            <a class="menu_show" title="Toggle 30 Day Forecast Attainment History Chart">
                                            <h6 class="m-subheader__title m-subheader__title--separator" onmouseover="style.color='royalblue'" onmouseout="style.color='#00008b'" id="DAY30AVG"></h6>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row" id="titlerow91" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                                        <div class="col-md-10" id="title95col" style="height: 100%;" title="Same as 30 Day Forecast Attainment except looks 90 Days back for forecasted amount">
                                            <h6 class="m-subheader2__title m-subheader2__title--separator">90 Day Forecast Attainment</h6>
                                        </div>                                        
                                        <div class="col-md-2" id="DAY90FOREATTAIN_1" style="text-align: center; color: #00008b">
                                            <a class="menu_show" title="Toggle 90 Day Forecast Attainment History Chart">
                                            <h6 class="m-subheader__title m-subheader__title--separator" onmouseover="style.color='royalblue'" onmouseout="style.color='#00008b'" id="DAY90AVG"></h6>
                                            </a>
                                        </div>
                                    </div>
                                    <br />
                                    <a class="menu_hide">
                                        <div id="DAY30AVG_HISTORY" style="visibility:visible;"></div> 
                                        <div id="DAY90AVG_HISTORY" style="visibility:visible;"></div>
                                    </a>
                                </div>
                            </div>

                            <!--end::Portlet-->

                            <%--<!--begin::Portlet-->
                            <div class="m-portlet m-portlet--rounded">
                                <div class="m-portlet__head">
                                    <div class="m-portlet__head-caption">
                                        <div class="m-portlet__head-title">
                                            <h3 class="m-portlet__head-text">Rounded Style <small>portlet sub title</small>
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="m-portlet__body">
                                        Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.
                                    </div>
                                </div>
                            </div>
                            <!--end::Portlet-->--%>
                        </div>
                        <div class="col-lg-7">
                            <!--begin::Portlet-->

                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon">
                                            <i class="flaticon-line-graph"></i>
                                        </span>
                                        <h3 class="m-portlet__head-text">Production Chart<small>2018 Forecasted Jobs</small>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-portlet__body">
                                <div id="CEN2018POEALLIN" style="visibility: visible;"></div>
                                
                            </div>

                            <%--    <div class="m-portlet__foot m--hide">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            Portlet footer: 
                                        </div>
                                        <div class="col-lg-6">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                            <span class="m--margin-left-10">or <a href="#" class="m-link m--font-bold">Cancel</a></span>
                                        </div>
                                    </div>
                                </div>--%>

                            <!--end::Portlet-->

                            <%--<!--begin::Portlet-->
                            <div class="m-portlet">
                                <div class="m-portlet__head">
                                    <div class="m-portlet__head-caption">
                                        <div class="m-portlet__head-title">
                                            <span class="m-portlet__head-icon">
                                                <i class="flaticon-multimedia"></i>
                                            </span>
                                            <h3 class="m-portlet__head-text">Portlet Footer
                                            </h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="m-portlet__body">
                                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.
                                </div>
                                <div class="m-portlet__foot">
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 m--valign-middle">
                                            Portlet footer: 
                                        </div>
                                        <div class="col-lg-6 m--align-right">
                                            <button type="submit" class="btn btn-brand">Submit</button>
                                            <span class="m--margin-left-10">or <a href="#" class="m-link m--font-bold">Cancel</a></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end::Portlet-->--%>
                        </div>
                    </div>

                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon">
                                    <i class="flaticon-analytics"></i>
                                </span>
                                <h3 class="m-portlet__head-text">2018 Program Status</h3>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row" id="titlerow100" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="title100col" style="text-align: center">
                            <a href="/capacity/Regional_Drilldown.aspx?accordheader=0" title="Go to NSB Drilldown section">
                                <h3 class="m-subheader2__title m-subheader2__title--separator">New Site Build</h3>
                            </a>
                        </div>
                        <div class="col-md-2" id="title200col" style="text-align: center">
                            <a href="/capacity/Regional_Drilldown.aspx?accordheader=1" title="Go to LTE AC Drilldown section">
                                <h3 class="m-subheader2__title m-subheader2__title--separator">LTE AC</h3>
                            </a>
                        </div>
                        <div class="col-md-2" id="title300col" style="text-align: center">
                            <a href="/capacity/Regional_Drilldown.aspx?accordheader=2" title="Go to CRAN Drilldown section">
                                <h3 class="m-subheader2__title m-subheader2__title--separator">CRAN</h3>
                            </a>
                        </div>
                        <div class="col-md-2" id="title400col" style="text-align: center">
                            <a href="/capacity/Regional_Drilldown.aspx?accordheader=3" title="Go to LTE 1C Drilldown section">
                                <h3 class="m-subheader2__title m-subheader2__title--separator">LTE 1C</h3>
                            </a>
                        </div>
                        <div class="col-md-2" id="title500col" style="text-align: center">
                            <a href="/capacity/Regional_Drilldown.aspx?accordheader=4" title="Go to 4T4R Drilldown section">
                                <h3 class="m-subheader2__title m-subheader2__title--separator">4T4R</h3>
                            </a>
                        </div>
                        <div class="col-md-2" id="title600col" style="text-align: center">
                            <a href="/capacity/Regional_Drilldown.aspx?accordheader=5" title="Go to BWE HW Drilldown section">
                                <h3 class="m-subheader2__title m-subheader2__title--separator">BWE HW</h3>
                            </a>
                        </div>
                    </div>
                    <div class="row" id="titlerow200" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="title101col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENPOENSB"></h5>
                        </div>
                        <div class="col-md-2" id="title201col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENPOELTEAC"></h5>
                        </div>
                        <div class="col-md-2" id="title301col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENPOECRAN"></h5>
                        </div>
                        <div class="col-md-2" id="title401col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENPOELTE1C"></h5>
                        </div>
                        <div class="col-md-2" id="title501col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENPOE4T4R"></h5>
                        </div>
                        <div class="col-md-2" id="title601col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENPOEBWEHW"></h5>
                        </div>
                    </div>
                    <div class="row" id="titlerow300" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="title102col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENFORENSB"></h5>
                        </div>
                        <div class="col-md-2" id="title202col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENFORELTEAC"></h5>
                        </div>
                        <div class="col-md-2" id="title302col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENFORECRAN"></h5>
                        </div>
                        <div class="col-md-2" id="title402col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENFORELTE1C"></h5>
                        </div>
                        <div class="col-md-2" id="title502col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENFORE4T4R"></h5>
                        </div>
                        <div class="col-md-2" id="title602col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENFOREBWEHW"></h5>
                        </div>
                    </div>
                    <div class="row" id="titlerow400" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="title103col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENCOMPNSB"></h5>
                        </div>
                        <div class="col-md-2" id="title203col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENCOMPLTEAC"></h5>
                        </div>
                        <div class="col-md-2" id="title303col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENCOMPCRAN"></h5>
                        </div>
                        <div class="col-md-2" id="title403col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENCOMPLTE1C"></h5>
                        </div>
                        <div class="col-md-2" id="title503col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENCOMP4T4R"></h5>
                        </div>
                        <div class="col-md-2" id="title603col" style="text-align: center">
                            <h5 class="m-portlet__head-text" id="CENCOMPBWEHW"></h5>
                        </div>
                    </div>

                    <div class="row" id="donutrow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-2" id="donut1col" style="height: 100%;">
                            <div id="donut1" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut2col" style="height: 100%;">
                            <div id="donut2" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut3col" style="height: 100%;">
                            <div id="donut3" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut4col" style="height: 100%;">
                            <div id="donut4" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut5col" style="height: 100%;">
                            <div id="donut5" style="visibility: visible;"></div>
                        </div>
                        <div class="col-md-2" id="donut6col" style="height: 100%;">
                            <div id="donut6" style="visibility: visible;"></div>
                        </div>
                    </div>

                    <div id="donutrowlegend">

                        <div class="box1 backmedgreen">&nbsp;</div>
                        <div class="cata">&ensp;Completed &emsp;</div>
                        <div class="box1 backverydarkblue">&nbsp;</div>
                        <div class="cata">&ensp;Remaining Forecasted 1Q &emsp;</div>
                        <div class="box1 backdarkblue">&nbsp;</div>
                        <div class="cata">&ensp;Remaining Forecasted 2Q &emsp;</div>
                        <div class="box1 backmedblue">&nbsp;</div>
                        <div class="cata">&ensp;Remaining Forecasted 3Q &emsp;</div>
                        <div class="box1 backlightblue">&nbsp;</div>
                        <div class="cata">&ensp;Remaining Forecasted 4Q &emsp;</div>
                        <div class="box1 backlightred">&nbsp;</div>
                        <div class="cata">&ensp;Not 2018 Forecasted &emsp;</div>
                    </div>
                    <br />

                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon">
                                    <i class="flaticon-network"></i>
                                </span>
                                <h3 class="m-portlet__head-text">Market Details</h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row" id="market_tablerow" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="market_tablecol" style="height: 100%;">
                            <div id="market-table1" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <div class="row" id="market_tablerow2" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="market_tablecol2" style="height: 100%;">
                            <div id="market-table2" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <%--<h4 class="m-subheader__title m-subheader__title--separator">Central Region: LTE Program Progress 2018 YTD</h4>
                    <br />
                    <div class="row" id="table3row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table3col" style="height: 100%;">
                            <div id="example-table" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - NSB</h4>
                   
                    <div class="row" id="table4row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table4col" style="height: 100%;">
                            <div id="example-table4" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - LTE 1C</h4>
                    <div class="row" id="table5row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table5col" style="height: 100%;">
                            <div id="example-table5" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - LTE AC</h4>
                    <div class="row" id="table6row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table6col" style="height: 100%;">
                            <div id="example-table6" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - 4T4R</h4>
                    <div class="row" id="table7row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table7col" style="height: 100%;">
                            <div id="example-table7" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - CRAN</h4>
                    <div class="row" id="table8row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table8col" style="height: 100%;">
                            <div id="example-table8" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />
                    <h4 class="m-subheader__title m-subheader__title--separator">Market Comparison - BWE HW</h4>
                    <div class="row" id="table9row" style="height: 35%; width: 100%; overflow: auto; display: flex;">
                        <div class="col-md-12" id="table9col" style="height: 100%;">
                            <div id="example-table9" style="visibility: visible;"></div>
                        </div>
                    </div>
                    <br />--%>
                </div>
            </div>

        </div>
    </div>

    <script>
        ////ATTACH CLICK HANDLERS
        //$(document).ready(function () {
        //    attachClickHandlers();
        //    console.log("DocReady");
        //});
        //// Re-attach click handlers if gridview is changed
        ////var prm = Sys.WebForms.PageRequestManager.getInstance();

        ////prm.add_endRequest(function () {
        ////    attachClickHandlers();
        ////});

        //function attachClickHandlers() {
        //    console.log("ClickHandler");
        //    $('#ddlMarket').change(
        //        function () {
        //            var market = $('#ddlMarket option:selected').val();
        //            console.log(market);
        //            Getmarketdata(market);
        //            // Do something with val1 and val2 ...
        //        }
        //    );
        //}

        $(document).ready(function () {

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetDATADATE",
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
                url: "Default.aspx/GetProject_AllIn",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadProject_AllIn(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetProject_AllIn_FA",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadProject_AllIn_FA(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetCEN2018POEALLIN",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadCEN2018POEALLIN(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetFORECAST_ATTAIN_ALLIN",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadFORECAST_ATTAIN_ALLIN(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetFORECAST_ATTAIN_ALLIN_30CH",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadFORECAST_ATTAIN_ALLIN_30CH(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetFORECAST_ATTAIN_ALLIN_90CH",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadFORECAST_ATTAIN_ALLIN_90CH(data);
                },
                error: function (data) {
                }
            });

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboard1",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboard1(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetDashboardMARKET",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKET(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/GetDashboardMARKET_2",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDashboardMARKET_2(data);
                },
                error: function (data) {
                }
            });

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboardMARKETNSB",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboardMARKETNSB(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboardMARKETLTE1C",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboardMARKETLTE1C(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboardMARKETLTEAC",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboardMARKETLTEAC(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboardMARKET4T4R",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboardMARKET4T4R(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboardMARKETCRAN",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboardMARKETCRAN(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            //$.ajax({
            //    type: "POST",
            //    async: true,
            //    url: "Default.aspx/GetDashboardMARKETBWEHW",
            //    data: JSON.stringify({}),
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (data) {
            //        loadDashboardMARKETBWEHW(data);
            //    },
            //    error: function (data) {
            //    }
            //});

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut1",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut1(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut2",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut2(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut3",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut3(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut4",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut4(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut5",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut5(data);
                },
                error: function (data) {
                }
            });

            $.ajax({
                type: "POST",
                async: true,
                url: "Default.aspx/Getdonut6",
                data: JSON.stringify({}),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    loadDonut6(data);
                },
                error: function (data) {
                }
            });



        });

        function loadDATADATE(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["DATADATE"];
            document.getElementById('DATADATE').innerHTML = value;
        }

        function loadProject_AllIn(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["PODTOTAL2018"];
            document.getElementById('PODTOTAL2018').innerHTML = value;
            var value = score[0]["POETOTAL2018"];
            document.getElementById('POETOTAL2018').innerHTML = value;
            var value = score[0]["FORETOTAL2018"];
            document.getElementById('FORETOTAL2018').innerHTML = value;
            var value = score[0]["COMPTOTAL2018"];
            document.getElementById('COMPTOTAL2018').innerHTML = value;
            var value = score[0]["NBD_ON_TIME"];
            document.getElementById('NBD_ON_TIME').innerHTML = value;
            var value = score[0]["NBD_ON_TIME_PERC"];
            document.getElementById('NBD_ON_TIME_PERC').innerHTML = value;
            var value = score[0]["NBD_LATE"];
            document.getElementById('NBD_LATE').innerHTML = value;
            var value = score[0]["NBD_LATE_PERC"];
            document.getElementById('NBD_LATE_PERC').innerHTML = value;
            var value = score[0]["ALLIN"];
            document.getElementById('ALLIN').innerHTML = value;
        }

        function loadProject_AllIn_FA(data) {
            var score = JSON.parse(data.d);
            var value = score[0]["ALLINFA"];
            document.getElementById('ALLINFA').innerHTML = value;
            var value = score[0]["PODTOTAL2018FA"];
            document.getElementById('PODTOTAL2018FA').innerHTML = value;
            var value = score[0]["POETOTAL2018FA"];
            document.getElementById('POETOTAL2018FA').innerHTML = value;
            var value = score[0]["FORETOTAL2018FA"];
            document.getElementById('FORETOTAL2018FA').innerHTML = value;
            var value = score[0]["COMPTOTAL2018FA"];
            document.getElementById('COMPTOTAL2018FA').innerHTML = value;
        }

        function loadFORECAST_ATTAIN_ALLIN(data) {
            var score = JSON.parse(data.d);
            var value = score[11]["DAY30AVG"] + "%";
            document.getElementById('DAY30AVG').innerHTML = value;
            var value = score[11]["DAY90AVG"] + "%";
            document.getElementById('DAY90AVG').innerHTML = value;
        }

        var chart2;

        /* HC SUMMARY CHART LOADER */
        function loadCEN2018POEALLIN(data) {
            NBD_Trend = JSON.parse(data.d);
            var NBD_series_values = [];
            var keys = Object.keys(NBD_Trend[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < NBD_Trend.length; j++) {
                    if (k == 0) {
                        a.push(NBD_Trend[j][0]);
                    } else {
                        a.push(NBD_Trend[j][keys[k]]);
                    }
                }
                NBD_series_values.push(a);
            }

            createNBDColchart(NBD_series_values[0], 'CEN2018POEALLIN', 'Central Region Plan/Forecast/Actuals', 'All Projects');

            
            var j = 8
            chart2.addSeries({
                name: 'Plan',
                id: 'Plan',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 2
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 4
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: NBD_series_values[j],
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
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);
            var j = 3
            chart2.addSeries({
                name: 'Cumulative - Forecast',
                id: 'Cumulative - Forecast',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);            
            var j = 5
            chart2.addSeries({
                name: 'Cumulative - On-Air',
                id: 'Cumulative - On-Air',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                marker: {
                    symbol: 'circle'
                },
                data: NBD_series_values[j],
                animation: false,
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createNBDColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#808080','#1E90FF',  '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 0,
                    zoomType: 'xy',
                    height: '370',
                    width: '800'
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
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '12px',
                //        fontWeight: 'bold'
                //    }
                //},
                xAxis: {
                    categories: ['<-2017', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', '2019->'],
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
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var chart2;

        /* HC ATTAINMENT SUMMARY CHART LOADER */
        function loadFORECAST_ATTAIN_ALLIN_30CH(data) {
            Attain_30CH = JSON.parse(data.d);
            var avg30 = Attain_30CH[11]["DAY30AVG"];
            var Att_30CH_series_values = [];
            var keys = Object.keys(Attain_30CH[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < Attain_30CH.length; j++) {
                    if (k == 0) {
                        a.push(Attain_30CH[j][0]);
                    } else {
                        a.push(Attain_30CH[j][keys[k]]);
                    }
                }
                Att_30CH_series_values.push(a);
            }

            createAtt_30CHColchart(Att_30CH_series_values[0], 'DAY30AVG_HISTORY', '30 Day Forecast Attainment History', 'All Projects', avg30);

            
            var j = 18
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: Att_30CH_series_values[j],
                color: '#1E90FF',
                animation: false,
                showInLegend: true
            }, false);
            var j = 17
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: Att_30CH_series_values[j],
                color: '#2E8B57',
                animation: false,
                showInLegend: true
            }, false);
            var j = 15
            chart2.addSeries({
                name: '% Monthly Attainment',
                id: '% Monthly Attainment',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                color: '#87CEEB',
                tooltip: {
                    valueSuffix: '%'
                },
                marker: {
                    symbol: 'circle'
                },
                data: Att_30CH_series_values[j],
                animation: false,
                dataLabels: {
                    enabled: true,
                        formatter: function () {
                             return this.y.toFixed(1) +'%';   
                        }
                    },
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createAtt_30CHColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle, avg30) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#808080','#1E90FF',  '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 0,
                    zoomType: 'xy',
                    height: '370',
                    width: '650'
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
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '12px',
                //        fontWeight: 'bold'
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
                        text: '% Attainment',
                        style: {
                            fontSize: "12px"
                        }
                        },
                        min: 0,
                        max: 100,
                        plotBands: [{
                            label: {
                                text: 'Target > 80%',
                            align: 'right'},color: '#b3ffb3', // Color value
                            from: 80, // Start of the plot band
                            to: 100 // End of the plot band
                        }],
                        plotLines: [{
                            label: {
                                text: '2018 Average ' + avg30 + '%',
                            align: 'right'},
                            color: 'red',
                            value: avg30,
                            width: '1',
                            zIndex: 5
                        }],
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
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var chart2;

        /* HC ATTAINMENT 90 SUMMARY CHART LOADER */
        function loadFORECAST_ATTAIN_ALLIN_90CH(data) {
            Attain_90CH = JSON.parse(data.d);
            var avg90 = Attain_90CH[11]["DAY90AVG"];
            var Att_90CH_series_values = [];
            var keys = Object.keys(Attain_90CH[0]);

            // Parse returned json string into x axis categories and y series values

            for (var k = 0; k < keys.length; k++) {
                var a = [];
                for (var j = 0; j < Attain_90CH.length; j++) {
                    if (k == 0) {
                        a.push(Attain_90CH[j][0]);
                    } else {
                        a.push(Attain_90CH[j][keys[k]]);
                    }
                }
                Att_90CH_series_values.push(a);
            }

            createAtt_90CHColchart(Att_90CH_series_values[0], 'DAY90AVG_HISTORY', '90 Day Forecast Attainment History', 'All Projects', avg90);

            
            var j = 23
            chart2.addSeries({
                name: 'Forecast',
                id: 'Forecast',
                data: Att_90CH_series_values[j],
                color: '#1E90FF',
                animation: false,
                showInLegend: true
            }, false);
            var j = 22
            chart2.addSeries({
                name: 'On-Air Actual',
                id: 'On-Air Actual',
                data: Att_90CH_series_values[j],
                color: '#2E8B57',
                animation: false,
                showInLegend: true
            }, false);
            var j = 16
            chart2.addSeries({
                name: '% Monthly Attainment',
                id: '% Monthly Attainment',
                type: 'spline',
                yAxis: 1,
                lineWidth: 3,
                color: '#87CEEB',
                tooltip: {
                    valueSuffix: '%'
                },
                marker: {
                    symbol: 'circle'
                },
                data: Att_90CH_series_values[j],
                animation: false,
                dataLabels: {
                    enabled: true,
                        formatter: function () {
                             return this.y.toFixed(1) +'%';   
                        }
                    },
                showInLegend: true
            }, false);

            chart2.redraw();
        }

        function createAtt_90CHColchart(chartxaxis, chart_div_name, chart_title, chart_subtitle, avg90) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                },
                colors: ['#808080','#1E90FF',  '#2E8B57', '#A9A9A9', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
                //colors: ['#1E90FF', '#2E8B57', '#87CEEB', '#3CB371', '#FF9655', '#FFF263', '#6AF9C4']
            });
            chart2 = new Highcharts.Chart({
                chart: {
                    type: 'column',
                    renderTo: chart_div_name,
                    backgroundColor: "#FFFFFF",
                    spacingBottom: 0,
                    zoomType: 'xy',
                    height: '370',
                    width: '650'
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
                //subtitle: {
                //    text: chart_subtitle,
                //    style: {
                //        fontSize: '12px',
                //        fontWeight: 'bold'
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
                        text: '% Attainment',
                        style: {
                            fontSize: "12px"
                        }
                        },
                        min: 0,
                        max: 100,
                        plotBands: [{
                            label: {
                                text: 'Target > 70%',
                            align: 'right'},color: '#b3ffb3', // Color value
                            from: 70, // Start of the plot band
                            to: 100 // End of the plot band
                        }],
                        plotLines: [{
                            label: {
                                text: '2018 Average ' + avg90 + '%',
                            align: 'right'},
                            color: 'red',
                            value: avg90,
                            width: '1',
                            zIndex: 5
                        }],
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
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true,
                    backgroundColor: '#FFFFFF'
                }
            });
        }

        var chart2;

        /* donut1 chart data */

        function loadDonut1(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'New Site Build'; //put the data into variables to pass to a chart building function
            var poe2018 = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var short = score[0]["POE_2018"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];

            var CENPOENSB2 = score[0]["POE_2018"];
            var CENPOENSB = CENPOENSB2.toLocaleString();
            document.getElementById('CENPOENSB').innerHTML = 'POE: ' + CENPOENSB;
            var CENFORENSB2 = score[0]["FORECAST"];
            var CENFORENSB = CENFORENSB2.toLocaleString();
            document.getElementById('CENFORENSB').innerHTML = 'Forecast: ' + CENFORENSB + ' (' + perc_fore_of_plan + '%)';
            var CENCOMPNSB2 = score[0]["YTD_COMPLETE"];
            var CENCOMPNSB = CENCOMPNSB2.toLocaleString();
            document.getElementById('CENCOMPNSB').innerHTML = 'Complete: ' + CENCOMPNSB + ' (' + perc_comp + '%)';

            donutcharting102('donut1', Number(value), title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short); //call my chart building function
        }

        /* Ajax call to load the donut2 chart data */

        function loadDonut2(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'LTE AC'; //put the data into variables to pass to a chart building function
            var poe2018 = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var short = score[0]["POE_2018"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];

            var CENPOELTEAC2 = score[0]["POE_2018"];
            var CENPOELTEAC = CENPOELTEAC2.toLocaleString();
            document.getElementById('CENPOELTEAC').innerHTML = 'POE: ' + CENPOELTEAC;
            var CENFORELTEAC2 = score[0]["FORECAST"];
            var CENFORELTEAC = CENFORELTEAC2.toLocaleString();
            document.getElementById('CENFORELTEAC').innerHTML = 'Forecast: ' + CENFORELTEAC + ' (' + perc_fore_of_plan + '%)';
            var CENCOMPLTEAC2 = score[0]["YTD_COMPLETE"];
            var CENCOMPLTEAC = CENCOMPLTEAC2.toLocaleString();
            document.getElementById('CENCOMPLTEAC').innerHTML = 'Complete: ' + CENCOMPLTEAC + ' (' + perc_comp + '%)';

            donutcharting102('donut2', Number(value), title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short); //call my chart building function
        }

        /* Ajax call to load the donut3 chart data */

        function loadDonut3(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'CRAN'; //put the data into variables to pass to a chart building function
            var poe2018 = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var short = score[0]["POE_2018"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];

            var CENPOECRAN2 = score[0]["POE_2018"];
            var CENPOECRAN = CENPOECRAN2.toLocaleString();
            document.getElementById('CENPOECRAN').innerHTML = 'POE: ' + CENPOECRAN;
            var CENFORECRAN2 = score[0]["FORECAST"];
            var CENFORECRAN = CENFORECRAN2.toLocaleString();
            document.getElementById('CENFORECRAN').innerHTML = 'Forecast: ' + CENFORECRAN + ' (' + perc_fore_of_plan + '%)';
            var CENCOMPCRAN2 = score[0]["YTD_COMPLETE"];
            var CENCOMPCRAN = CENCOMPCRAN2.toLocaleString();
            document.getElementById('CENCOMPCRAN').innerHTML = 'Complete: ' + CENCOMPCRAN + ' (' + perc_comp + '%)';

            donutcharting102('donut3', Number(value), title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short); //call my chart building function
        }

        /* Ajax call to load the donut4 chart data */

        function loadDonut4(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'LTE 1C'; //put the data into variables to pass to a chart building function
            var poe2018 = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var short = score[0]["POE_2018"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];

            var CENPOELTE1C2 = score[0]["POE_2018"];
            var CENPOELTE1C = CENPOELTE1C2.toLocaleString();
            document.getElementById('CENPOELTE1C').innerHTML = 'POE: ' + CENPOELTE1C;
            var CENFORELTE1C2 = score[0]["FORECAST"];
            var CENFORELTE1C = CENFORELTE1C2.toLocaleString();
            document.getElementById('CENFORELTE1C').innerHTML = 'Forecast: ' + CENFORELTE1C + ' (' + perc_fore_of_plan + '%)';
            var CENCOMPLTE1C2 = score[0]["YTD_COMPLETE"];
            var CENCOMPLTE1C = CENCOMPLTE1C2.toLocaleString();
            document.getElementById('CENCOMPLTE1C').innerHTML = 'Complete: ' + CENCOMPLTE1C + ' (' + perc_comp + '%)';

            donutcharting102('donut4', Number(value), title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short); //call my chart building function
        }

        /* Ajax call to load the donut5 chart data */

        function loadDonut5(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = '4T4R'; //put the data into variables to pass to a chart building function
            var poe2018 = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var short = score[0]["POE_2018"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];

            var CENPOE4T4R2 = score[0]["POE_2018"];
            var CENPOE4T4R = CENPOE4T4R2.toLocaleString();
            document.getElementById('CENPOE4T4R').innerHTML = 'POE: ' + CENPOE4T4R;
            var CENFORE4T4R2 = score[0]["FORECAST"];
            var CENFORE4T4R = CENFORE4T4R2.toLocaleString();
            document.getElementById('CENFORE4T4R').innerHTML = 'Forecast: ' + CENFORE4T4R + ' (' + perc_fore_of_plan + '%)';
            var CENCOMP4T4R2 = score[0]["YTD_COMPLETE"];
            var CENCOMP4T4R = CENCOMP4T4R2.toLocaleString();
            document.getElementById('CENCOMP4T4R').innerHTML = 'Complete: ' + CENCOMP4T4R + ' (' + perc_comp + '%)';

            donutcharting102('donut5', Number(value), title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short); //call my chart building function
        }

        /* Ajax call to load the donut6 chart data */

        function loadDonut6(data) {
            var score = JSON.parse(data.d); //parse your data
            var value = score[0]["PERCENT_COMPLETE"]; //put the data into variables to pass to a chart building function
            var title = 'BWE HW'; //put the data into variables to pass to a chart building function
            var poe2018 = score[0]["POE_2018"]; //put the data into variables to pass to a chart building function
            var forecast = score[0]["FORECAST"]; //put the data into variables to pass to a chart building function
            var ytdcomplete = score[0]["YTD_COMPLETE"]; //put the data into variables to pass to a chart building function
            var prevmonthscomp = score[0]["PREVMONTHSCOMP"];
            var lastmonthcomp = score[0]["LASTMONTHCOMP"];
            var currmonthcomp = score[0]["CURRMONTHCOMP"];
            var beforenbd = score[0]["BEFORENBD"];
            var bnbd_perccomp = score[0]["BNBD_PERCCOMP"];
            var within90nbd = score[0]["WITHIN90NBD"];
            var w90nbd_perccomp = score[0]["W90NBD_PERCCOMP"];
            var after90nbd = score[0]["AFTER90NBD"];
            var a90nbd_perccomp = score[0]["A90NBD_PERCCOMP"];
            var currentmonth = score[0]["CURRENTMONTH"];
            var nextmonth = score[0]["NEXTMONTH"];
            var fore1q = score[0]["FORE1Q"];
            var fore2q = score[0]["FORE2Q"];
            var fore3q = score[0]["FORE3Q"];
            var fore4q = score[0]["FORE4Q"];
            var planvsact = score[0]["PLANVSACT"];
            var perc_fore_of_plan = (score[0]["FORECAST"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var perc_comp = (score[0]["YTD_COMPLETE"] * 100 / score[0]["POE_2018"]).toFixed(1);
            var short = score[0]["POE_2018"] - score[0]["YTD_COMPLETE"] - score[0]["FORE1Q"] - score[0]["FORE2Q"] - score[0]["FORE3Q"] - score[0]["FORE4Q"];

            var CENPOEBWEHW2 = score[0]["POE_2018"];
            var CENPOEBWEHW = CENPOEBWEHW2.toLocaleString();
            document.getElementById('CENPOEBWEHW').innerHTML = 'POE: ' + CENPOEBWEHW;
            var CENFOREBWEHW2 = score[0]["FORECAST"];
            var CENFOREBWEHW = CENFOREBWEHW2.toLocaleString();
            document.getElementById('CENFOREBWEHW').innerHTML = 'Forecast: ' + CENFOREBWEHW + ' (' + perc_fore_of_plan + '%)';
            var CENCOMPBWEHW2 = score[0]["YTD_COMPLETE"];
            var CENCOMPBWEHW = CENCOMPBWEHW2.toLocaleString();
            document.getElementById('CENCOMPBWEHW').innerHTML = 'Complete: ' + CENCOMPBWEHW + ' (' + perc_comp + '%)';

            donutcharting102('donut6', Number(value), title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
                within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short); //call my chart building function
        }

        /* DONUT CHART CREATER */
        function donutcharting101(container, value, title, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth) {
            Highcharts.setOptions({
                lang: {
                    thousandsSep: ','
                }
            });

            $(function () {
                var color101; //variable for chart color assignments

                //subtitle = '<p style="font-size:14px;">Complete: ' + ytdcomplete + '</p>' + '<br><p style="font-size:12px; font-style:italic;">(Forecast: ' + forecast + ')</p>'; //create the chart subtitle variable
                if (value == 101) {
                    color101 = '#00ff00'; //its green
                } else {
                    color101 = '#1e90ff'; //its dark blue
                }


                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '230',
                        width: '230'

                    },
                    title: {
                        text: null
                    },
                    //subtitle: { //chart subtitle assignment and location in the chart area
                    //    text: subtitle,
                    //    align: 'center',
                    //    verticalAlign: 'top',
                    //    y: 32
                    //},
                    tooltip: { //define the tooltip - information shown on mouse hover over the chart
                        //pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                        formatter: function () {
                            var content = "";
                            this.series.data.forEach(function (serie) {
                                content += "<span style='color:" + serie.color + ";'>\u25CF</span>" + serie.name + ': <b>' + serie.y.toFixed(0) + '</b> (' + serie.percentage.toFixed(1) + '%)<br/>';
                            });
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' +
                                content +
                                '<b><center>2018 Complete: ' + ytdcomplete + ' (' + value + '%)' +
                                '<br>2018 Forecast Total: ' + this.total.toFixed(0) +
                                '<br/></b></center><p style="font-size:11px;">Cmp Before NBD: ' + beforenbd + ' (' + bnbd_perccomp + '%)' +
                                '<br/>Cmp 1-90 Days of NBD: ' + within90nbd + ' (' + w90nbd_perccomp + '%)' +
                                '<br/>Cmp > 90 Days of NBD: ' + after90nbd + ' (' + a90nbd_perccomp + '%)'
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
                            { name: 'Comp Other Months', y: prevmonthscomp },
                            { name: 'Complete Last Month', y: lastmonthcomp },
                            { name: 'Complete Curr Month', y: currmonthcomp },
                            { name: 'Curr Month Remaining', y: currentmonth },
                            { name: 'Next Month Forecast', y: nextmonth },
                            { name: 'Remaining Forecast', y: forecast - beforenbd - within90nbd - after90nbd - currentmonth - nextmonth },
                        ]
                    }]
                });
            });
        }

        /* DONUT CHART CREATER */
        function donutcharting102(container, value, title, poe2018, forecast, ytdcomplete, prevmonthscomp, lastmonthcomp, currmonthcomp, beforenbd, bnbd_perccomp,
            within90nbd, w90nbd_perccomp, after90nbd, a90nbd_perccomp, currentmonth, nextmonth, fore1q, fore2q, fore3q, fore4q, planvsact, perc_fore_of_plan, perc_comp, short) {
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

                subtitle = '<p style="font-size:24px; font-weight: bold; color:' + color101 + ';">' + planvsact + '<br><p style="font-size:18px; color:' + color101 + ';">to Plan' + '</p>'; //create the chart subtitle variable

                Highcharts.chart(container, { //define the Highchart
                    colors: ['#003300', '#008000', '#00cc00', '#0066cc', '#4da6ff', '#87cefa'], //series' colors light blue
                    chart: { //chart type, sizing
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie',
                        height: '230',
                        width: '230'

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
                            return '<b><p style="font-size:14px;" align="center";>' + title + '</b></br><p style="font-size:11px;">' +
                                //content +
                                //'<b><center>2018 Complete: ' + ytdcomplete + ' (' + value + '%)' +
                                //'<br>2018 Forecast: ' + this.total.toFixed(0)
                                //+
                                //'<br>2018 POE (Plan): ' + poe2018

                                content +
                                '<b><center>2018 POE (Plan): ' + poe2018
                                +
                                '<br>2018 Forecast: ' + forecast + ' (' + perc_fore_of_plan + '%)'
                                +
                                '<br>2018 Complete: ' + ytdcomplete + ' (' + perc_comp + '%)'
                                //+
                                //'<br/></b></center><p style="font-size:11px;">Cmp Before NBD: ' + beforenbd + ' (' + bnbd_perccomp + '%)' +
                                //'<br/>Cmp 1-90 Days of NBD: ' + within90nbd + ' (' + w90nbd_perccomp + '%)' +
                                //'<br/>Cmp > 90 Days of NBD: ' + after90nbd + ' (' + a90nbd_perccomp + '%)'
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
                            { name: 'Not 2018 Forecasted', y: short, color: '#ff3333' },

                        ]
                    }]
                });
            });
        }

        function loadDashboardMARKET(data) {
            var tabdataMARKET_1 = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#market-table1").tabulator({
                rowFormatter:function(row){
                    //row - row component

                    var data = row.getData();

                    if(data.MARKET == "CENTRAL REGION"){
                        row.getElement().css({ "font-weight": "bold" });
                    }
                },      
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", headerSort: false, align: "center" },
                    {
                        title: "New Site Build", width: 410,
                        columns: [
                            { title: "POE", field: "POE_2018_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_NSB", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_NSB", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "LTE AC", width: 410,
                        columns: [
                            { title: "POE", field: "POE_2018_LTEAC", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_LTEAC", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_LTEAC", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_LTEAC", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_LTEAC", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "CRAN", width: 410,
                        columns: [
                            { title: "POE", field: "POE_2018_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_CRAN", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_CRAN", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                ],
            });

            $("#market-table1").tabulator("setData", tabdataMARKET_1);

        }

        function loadDashboardMARKET_2(data) {
            var tabdataMARKET_2 = JSON.parse(data.d);
            /* create Tabulator on DOM element with id "example-table" */
            $("#market-table2").tabulator({
                rowFormatter:function(row){
                    //row - row component

                    var data = row.getData();

                    if(data.MARKET == "CENTRAL REGION"){
                        row.getElement().css({ "font-weight": "bold" });
                    }
                },      
                layout: "fitColumns",
                columnVertAlign: "bottom",
                columns: [ //Define Table Columns
                    { title: "Market", field: "MARKET", headerSort: false, align: "center" },
                    {
                        title: "LTE 1C", width: 410,
                        columns: [
                            { title: "POE", field: "POE_2018_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_LTE1C", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_LTE1C", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "4T4R", width: 410,
                        columns: [
                            { title: "POE", field: "POE_2018_4T4R", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_4T4R", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_4T4R", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_4T4R", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_4T4R", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                    {
                        title: "BWE HW", width: 410,
                        columns: [
                            { title: "POE", field: "POE_2018_BWEHW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Forecast", field: "FORECAST_BWEHW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "Actual", field: "YTD_COMPLETE_BWEHW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 80 },
                            { title: "% Compl", field: "PERCENT_COMPLETE_BWEHW", headerSort: false, formatter: "progress", width: 80, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
                            {
                                title: "YTD vs Plan", field: "PLANVSACT_BWEHW", formatter: "money", formatterParams: { precision: 0 }, headerSort: false, align: "center", width: 90,
                                formatter: function (cell, formatterParams) {
                                    var value = cell.getValue();
                                    if (value < 0) {
                                        return "<span style='color:red; font-weight:bold;'>" + value + "</span>";
                                    } else {
                                        return "<span style='color:#00cc00; font-weight:bold;'>" + value + "</span>";
                                    }
                                }
                            },
                        ],
                    },
                ],
            });

            $("#market-table2").tabulator("setData", tabdataMARKET_2);

        }

        //function loadDashboard1(data) {
        //    var tabulatordata = JSON.parse(data.d);
        //    var spark = tabulatordata[1]["POE_2018"];
        //    /* create Tabulator on DOM element with id "example-table" */

        //    //generate bar chart
        //    var barFormatter = function (cell, formatterParams) {
        //        setTimeout(function () { //give cell enough time to be added to the DOM before calling sparkline formatter
        //            cell.getElement().sparkline(cell.getValue(), { width: "100%", type: "bar", barWidth: 14, disableTooltips: true });
        //        }, 10);
        //    };

        //    $("#example-table").tabulator({
        //        //height: 305, // set height of table (in CSS or here), this enables the Virtual DOM and improves render speed dramatically (can be any valid css height value)
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Program", field: "PROJECT", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    //define some sample data
        //    /* var tabledata = [
        //        { id: 1, name: "Oli Bob", age: "12", col: "red", dob: "" },
        //        { id: 2, name: "Mary May", age: "1", col: "blue", dob: "14/05/1982" },
        //        { id: 3, name: "Christine Lobowski", age: "42", col: "green", dob: "22/05/1982" },
        //        { id: 4, name: "Brendon Philips", age: "125", col: "orange", dob: "01/08/1980" },
        //        { id: 5, name: "Margret Marmajuke", age: "16", col: "yellow", dob: "31/01/1999" },
        //    ];*/

        //    //load sample data into the table
        //    $("#example-table").tabulator("setData", tabulatordata);

        //}

        //function loadDashboardMARKETNSB(data) {
        //    var tabdataMARKETNSB = JSON.parse(data.d);
        //    /* create Tabulator on DOM element with id "example-table" */
        //    $("#example-table4").tabulator({
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Market", field: "MARKET", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    $("#example-table4").tabulator("setData", tabdataMARKETNSB);

        //}

        //function loadDashboardMARKETLTE1C(data) {
        //    var tabdataMARKETLTE1C = JSON.parse(data.d);
        //    /* create Tabulator on DOM element with id "example-table" */
        //    $("#example-table5").tabulator({
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Market", field: "MARKET", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    $("#example-table5").tabulator("setData", tabdataMARKETLTE1C);

        //}

        //function loadDashboardMARKETLTEAC(data) {
        //    var tabdataMARKETLTEAC = JSON.parse(data.d);
        //    /* create Tabulator on DOM element with id "example-table" */
        //    $("#example-table6").tabulator({
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Market", field: "MARKET", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    $("#example-table6").tabulator("setData", tabdataMARKETLTEAC);

        //}

        //function loadDashboardMARKET4T4R(data) {
        //    var tabdataMARKET4T4R = JSON.parse(data.d);
        //    /* create Tabulator on DOM element with id "example-table" */
        //    $("#example-table7").tabulator({
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Market", field: "MARKET", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    $("#example-table7").tabulator("setData", tabdataMARKET4T4R);

        //}

        //function loadDashboardMARKETCRAN(data) {
        //    var tabdataMARKETCRAN = JSON.parse(data.d);
        //    /* create Tabulator on DOM element with id "example-table" */
        //    $("#example-table8").tabulator({
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Market", field: "MARKET", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    $("#example-table8").tabulator("setData", tabdataMARKETCRAN);

        //}
        //function loadDashboardMARKETBWEHW(data) {
        //    var tabdataMARKETBWEHW = JSON.parse(data.d);
        //    /* create Tabulator on DOM element with id "example-table" */
        //    $("#example-table9").tabulator({
        //        layout: "fitColumns",
        //        columnVertAlign: "bottom",
        //        columns: [ //Define Table Columns
        //            { title: "Market", field: "MARKET", align: "center" },
        //            { title: "POE 2018", field: "POE_2018", align: "center", width: 95 },
        //            {
        //                title: "Last 30 Days", width: 100,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 100,
        //                        columns: [

        //                            { title: "#", field: "LAST_30_DAYS", align: "center", width: 100 },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Year To Date", width: 240,
        //                columns: [

        //                    {
        //                        title: "Completed", width: 120,
        //                        columns: [
        //                            { title: "#", field: "YTD_COMPLETE", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#87cefa"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Plan", width: 120,
        //                        columns: [
        //                            { title: "#", field: "PLAN_CUMU", align: "center", width: 60 },
        //                            { title: "%", field: "PERCENT_OF_PLAN_COMPLETE", formatter: "progress", width: 60, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            {
        //                title: "Completed Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "After NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_LATE", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_LATE_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "Before NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "NBD_ON_TIME", align: "center", width: 70 },
        //                            { title: "%", field: "NBD_ON_TIME_PERC", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //            { title: "Remaining Jobs", field: "REMAIN_JOBS", align: "center", width: 150 },
        //            {
        //                title: "Remaining Jobs", width: 240,
        //                columns: [

        //                    {
        //                        title: "Already Past NBD", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_PAST", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_PAST_REM", formatter: "progress", width: 70, formatterParams: { color: ["#66ff66", "#ffff66", "#ffb366", "#ff6666"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },
        //                    {
        //                        title: "NBD Upcoming", width: 140,
        //                        columns: [
        //                            { title: "#", field: "REM_JOBS_NBD_CUMU_FUTURE", align: "center", width: 70 },
        //                            { title: "%", field: "PERC_OF_PLAN_FUTURE_REM", formatter: "progress", width: 70, formatterParams: { color: ["#ff6666", "#ffb366", "#ffff66", "#66ff66"], legend: function (value) { return value + "%" } } },
        //                        ],
        //                    },

        //                ],
        //            },
        //        ],
        //    });

        //    $("#example-table9").tabulator("setData", tabdataMARKETBWEHW);

        //}
        function showObjDrill() {
                        
            //$('#DAY30AVG').on('click', function () {
            //    $('#DAY30AVG').show();
            //    $('#DAY30AVG_HISTORY').show();
            //});            
            //$('#DAY30AVG_HISTORY').on('click', function () {
            //    $('#DAY30AVG_HISTORY').hide();
            //    $('#DAY30AVG').show();
            //});

            $('#DAY30AVG').click(function() {
                var clicks = $(this).data('clicks');
                if (clicks) {
                    $('#DAY30AVG').show();
                    $('#DAY30AVG_HISTORY').hide();
                    $('#DAY90AVG_HISTORY').hide();
                } else {
                    $('#DAY30AVG').show();
                    $('#DAY90AVG_HISTORY').hide();
                    $('#DAY30AVG_HISTORY').show();
                }
                $(this).data("clicks", !clicks);
            });

            $('#DAY90AVG').click(function() {
                var clicks2 = $(this).data('clicks2');
                if (clicks2) {
                    $('#DAY90AVG').show();
                    $('#DAY30AVG_HISTORY').hide();
                    $('#DAY90AVG_HISTORY').hide();
                } else {
                    $('#DAY90AVG').show();
                    $('#DAY30AVG_HISTORY').hide();
                    $('#DAY90AVG_HISTORY').show();
                }
                $(this).data("clicks2", !clicks2);
            });

        }
                
        $('#DAY30AVG_HISTORY').hide();
        $('#DAY90AVG_HISTORY').hide();
        showObjDrill();

    </script>

</asp:Content>


