<%@ Page Title="Survey 0001" Language="C#" MasterPageFile="~/MasterPageSurvey.master" AutoEventWireup="true" CodeFile="Survey_0001.aspx.cs" Inherits="_Survey_0001" %>

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

        .box2 {
            height: 2px;
        }

        .titleback {
            background: #87cefa;
        }

        .divider{
            width:20px;
            height:auto;
            display:inline-block;
        }

    </style>

    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <%--<h3 class="m-subheader__title m-subheader__title--separator">11/6/19 - We are currently having PACE data load issues, milestone task progressions are incomplete. We are working to resolve the issue. Thanks,
            </h3>
            <br />--%>
            <h3 class="m-subheader__title m-subheader__title--separator">Survey COVID-19-0001
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/Survey/Survey.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="/Survey/Survey.aspx" class="m-nav__link">
                        <span class="m-nav__link-text">Survey COVID-19-0001
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
        <div class="kt-portlet">

            <%--<div class="kt-portlet__head">
                <div class="kt-portlet__head-label">
                    <h3 class="kt-portlet__head-title">Survey on Data</h3>
                </div>
            </div>--%>

            <!--begin::Form-->

            <div class="kt-portlet__body">
                
                <asp:HiddenField ID="hf_User" runat="server" ClientIDMode="Static" />
                <%--<div class="form-group">
                    <label>Email address</label>
                    <input type="email" class="form-control" aria-describedby="emailHelp" placeholder="Enter email">
                    <span class="form-text text-muted">We'll never share your email with anyone else.</span>
                </div>--%>
                <%--<div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>--%>
                <div class="form-group">
                    <%--<label>Data obtained from Global login and webphone:</label>--%>
                    <p class="form-control-static" style="font-size: 20px; color: black; text-align: center;">ATTUID:  <b><span id="userIdText"></span></b></p>
                </div>

                <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="120">
                </asp:ScriptManager>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div style="text-align: center;">
                            <asp:Label ID="labelState" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;State: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:Label ID="labelCounty" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;County: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlCounty" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCounty_SelectedIndexChanged">
                            </asp:DropDownList>

                            <asp:Label ID="labelCity" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;City: &nbsp;&nbsp;" Visible="true" Font-Size="14" Font-Bold="true" ForeColor="Black"></asp:Label>
                            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                            </asp:DropDownList>
                            <div class="divider"></div>
                            <asp:Button ID="btn_clear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                            <asp:Button ID="btn_getQuestions" runat="server" Text="Get Questions" OnClientClick="getQuestions();" />  
                            </div>

                            <div style="display: none;">
                                <asp:Button runat="server" ID="btnModal" data-toggle="modal" data-backdrop="static" data-keyboard="false" data-target="#m_modal_general" />
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                <br />
                <br />
                <div class="form-group form-group-last">
                    <div class="alert alert-secondary" role="alert">
                        <div class="alert-icon"><i class="flaticon-warning kt-font-brand"></i></div>
                        <div class="alert-text" style="font-size: 20px; color: black;">
                            <div class="row" id="divMessage1"><span id="message1Text"></span></div>
                            <br />
							<div class="row" id="divMessage2"><span id="message2Text"></span></div>
                            <br />
							<div class="row" id="divMessage3"><span id="message3Text"></span></div>
                        </div>
                    </div>
                </div>                
                <br />
                <%--<div class="form-group">
                    <label for="GeoExampleSelect1">Which best descripes your reporting area?</label>
                    <select class="form-control" id="GeoExampleSelect1">                        
                        <option>National</option>
                        <option>Central Region</option>
                        <option>Northeast Region</option>
                        <option>Southeast Region</option>
                        <option>West Region</option>
                    </select>
                </div>--%>
                <%--<div class="form-group">
                    <label for="exampleSelect1"><span id="question1Text"></span></label>
                    <select class="form-control" id="exampleSelect1">
                        <option>Yes</option>
                        <option>No</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="exampleSelect1">Question 2 - How do you feel?</label>
                    <select class="form-control" id="exampleSelect2">
                        <option>1 - Extremely well</option>
                        <option>2 - Very well</option>
                        <option>3 - Somewhat well</option>
                        <option>4 - Not so well</option>
                        <option>5 - Not at all well</option>
                    </select>
                </div>--%>
                <%--<div class="form-group">
                    <label for="exampleSelect2">Example multiple select</label>
                    <select multiple="" class="form-control" id="exampleSelect3">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                    </select>
                </div>--%>
                
                <div class="form-group" id="divQuestion1">
                    <label><span id="question1Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <%--<input type="radio" checked="checked" name="radio1" value="Yes">--%>
                            <input type="radio" name="radio1" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio1" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <%--<label class="kt-radio">
                            <input type="radio" name="radio1" value="3 - Somewhat well">
                            3 - Somewhat well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio1" value="4 - Not so well">
                            4 - Not so well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio1" value="5 - Not at all well">
                            5 - Not at all well
														
                            <span></span>
                        </label>--%>
                        <%--<label class="kt-radio kt-radio--disabled">
                            <input type="radio" disabled name="radio1">
                            Disabled button
														
                            <span></span>
                        </label>--%>
                    </div>
                </div>
                <div class="form-group" id="divQuestion2">
                    <label><span id="question2Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <%--<label class="kt-radio">
                            <input type="radio" name="radio2" value="3 - Somewhat well">
                            3 - Somewhat well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="4 - Not so well">
                            4 - Not so well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="5 - Not at all well">
                            5 - Not at all well
														
                            <span></span>
                        </label>--%>
                        <%--<label class="kt-radio kt-radio--disabled">
                            <input type="radio" disabled name="radio2">
                            Disabled button
														
                            <span></span>
                        </label>--%>
                    </div>
                </div>
                <div class="form-group" id="divQuestion3">
                    <label><span id="question3Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio3" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio3" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <%--<label class="kt-radio">
                            <input type="radio" name="radio2" value="3 - Somewhat well">
                            3 - Somewhat well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="4 - Not so well">
                            4 - Not so well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="5 - Not at all well">
                            5 - Not at all well
														
                            <span></span>
                        </label>--%>
                        <%--<label class="kt-radio kt-radio--disabled">
                            <input type="radio" disabled name="radio2">
                            Disabled button
														
                            <span></span>
                        </label>--%>
                    </div>
                </div>
                <div class="form-group" id="divQuestion4">
                    <label><span id="question4Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio4" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio4" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <%--<label class="kt-radio">
                            <input type="radio" name="radio2" value="3 - Somewhat well">
                            3 - Somewhat well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="4 - Not so well">
                            4 - Not so well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="5 - Not at all well">
                            5 - Not at all well
														
                            <span></span>
                        </label>--%>
                        <%--<label class="kt-radio kt-radio--disabled">
                            <input type="radio" disabled name="radio2">
                            Disabled button
														
                            <span></span>
                        </label>--%>
                    </div>
                </div>
                <div class="form-group" id="divQuestion5">
                    <label><span id="question5Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio5" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio5" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <%--<label class="kt-radio">
                            <input type="radio" name="radio2" value="3 - Somewhat well">
                            3 - Somewhat well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="4 - Not so well">
                            4 - Not so well
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio2" value="5 - Not at all well">
                            5 - Not at all well
														
                            <span></span>
                        </label>--%>
                        <%--<label class="kt-radio kt-radio--disabled">
                            <input type="radio" disabled name="radio2">
                            Disabled button
														
                            <span></span>
                        </label>--%>
                    </div>
                </div>
                <%--<div class="form-group" id="divQuestion6">
                    <label><span id="question6Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio6" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio6" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;                        
                    </div>
                </div>--%>
                <div class="form-group" id="divQuestion7">
                    <label><span id="question7Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio7" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio7" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;                        
                    </div>
                </div>
                <div class="form-group" id="divQuestion8">
                    <label><span id="question8Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio8" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio8" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;                        
                    </div>
                </div>
                <div class="form-group" id="divQuestion9">
                    <label><span id="question9Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio9" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio9" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;                        
                    </div>
                </div>
                <div class="form-group" id="divQuestion10">
                    <label><span id="question10Text"></span></label>
                    <div class="kt-radio-list">
                        <label class="kt-radio">
                            <input type="radio" name="radio10" value="Yes">
                            Yes
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label class="kt-radio">
                            <input type="radio" name="radio10" value="No">
                            No
														
                            <span></span>
                        </label>&nbsp;&nbsp;&nbsp;                        
                    </div>
                </div>

                <%--<div class="form-group form-group-last">
                    <label for="exampleTextarea">Example text area, give us details. Comments or suggestions.</label>
                    <textarea class="form-control" id="exampleTextarea" rows="3" maxlength="1000"></textarea>
                    <span class="form-text text-muted">Maximum of 1,000 characters.</span>
                </div>--%>
                
            </div>
            <div class="col-md-4">
                <input id="btn_Submit" class="btn btn-primary btn-md" type="button" value="Submit Survey" onclick="submitButton(); this.disabled = true;" />
            </div>
            <%--<div class="kt-portlet__foot">
                <div class="kt-form__actions">
                    <button type="reset" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-secondary">Cancel</button>
                </div>
            </div>--%>


            <!--end::Form-->
        </div>

        <!--end::Portlet-->

    </div>

    <!-- General Modal -->
    <div class="modal fade" id="m_modal_general" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-xlg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h2>Additional Answers Required</h2>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>--%>
                </div>

                <div class="modal-body">
                    <div id="LOADING_PC_Modal" style='display: none'>
                        <img src="../ajax-loader_2.gif" />&nbsp; Loading Data...
                    </div>
                    <div id="NODATA_SEARCH" style='display: none'>No data found, please check input.</div>


                    <div class="form-group" id="divQuestion6">
                    <label><span id="question6Text"></span></label>
                        <div class="kt-radio-list">
                            <label class="kt-radio">
                                <input type="radio" name="radio6" value="Yes">
                                Yes
														
                                <span></span>
                            </label>&nbsp;&nbsp;&nbsp;
                            <label class="kt-radio">
                                <input type="radio" name="radio6" value="No">
                                No
														
                                <span></span>
                            </label>&nbsp;&nbsp;&nbsp;                        
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Submit Additional Answers</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            var userId = $('#hf_User').val();
            document.getElementById('userIdText').innerHTML = userId;
            $('#divMessage1').hide();
            $('#divMessage2').hide();
            $('#divMessage3').hide();
            $('#divQuestion1').hide();
            $('#divQuestion2').hide();
            $('#divQuestion3').hide();
            $('#divQuestion4').hide();
            $('#divQuestion5').hide();
            $('#divQuestion6').hide();
            $('#divQuestion7').hide();
            $('#divQuestion8').hide();
            $('#divQuestion9').hide();
            $('#divQuestion10').hide();

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001.aspx/GetWebphoneData",
                data: JSON.stringify({ 'userIdVariable': userId }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    //loadCURRYEAR(data);
                    webphoneData = JSON.parse(data.d);
                    console.log(webphoneData);
                    assignWebphoneData(webphoneData);
                },
                error: function (data) {
                }
            });



            attachClickHandlers();
            console.log("DocReady");

            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                $('#tabCUR_YR_ALLIN').resize()
            });

            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                $('#tabCUR_YR_PLUS1_ALLIN').resize()
            });

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
                    document.getElementById('markettitle').innerHTML = market_long;

                }
            );

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001.aspx/GetCURRYEAR",
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

        var GlobalsupervisorAttuId = "na";

        function assignWebphoneData(webphoneData) {
            GlobalsupervisorAttuId = webphoneData[0]["SUPERVISOR_ATTUID"];
        }

        function getQuestions() {
            var state_long = $('#<%= ddlState.ClientID %> option:selected').text();
            console.log(state_long);
            var county = $('#<%= ddlCounty.ClientID %> option:selected').val();
            console.log(county);
            var city = $('#<%= ddlCity.ClientID %> option:selected').val();
            console.log(city);

            $('#divMessage1').hide();
            $('#divMessage2').hide();
            $('#divMessage3').hide();
            $('#divQuestion1').hide();
            $('#divQuestion2').hide();
            $('#divQuestion3').hide();
            $('#divQuestion4').hide();
            $('#divQuestion5').hide();
            $('#divQuestion6').hide();
            $('#divQuestion7').hide();
            $('#divQuestion8').hide();
            $('#divQuestion9').hide();
            $('#divQuestion10').hide();

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001.aspx/GetQuestions",
                data: JSON.stringify({ 'stateVariable': state_long, 'countyVariable': county, 'cityVariable': city }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    questionData = JSON.parse(data.d);
                    processQuestionData(questionData);
                },
                error: function (data) {
                }
            });

        }

        function processQuestionData(questionData) {            

            if ((questionData[0]["MESSAGE1"] !== undefined) && (questionData[0]["MESSAGE1"] !== null)) {
                var message1 = questionData[0]["MESSAGE1"];
                document.getElementById('message1Text').innerHTML = message1;
                $('#divMessage1').show();
            }

            if ((questionData[0]["MESSAGE2"] !== undefined) && (questionData[0]["MESSAGE2"] !== null)) {
                var message2 = questionData[0]["MESSAGE2"];
                document.getElementById('message2Text').innerHTML = message2;
                $('#divMessage2').show();
            }

            if ((questionData[0]["MESSAGE3"] !== undefined) && (questionData[0]["MESSAGE3"] !== null)) {
                var message3 = questionData[0]["MESSAGE3"];
                document.getElementById('message3Text').innerHTML = message3;
                $('#divMessage3').show();
            }

            if ((questionData[0]["QUESTION1"] !== undefined) && (questionData[0]["QUESTION1"] !== null)) {
                var question1 = questionData[0]["QUESTION1"];
                document.getElementById('question1Text').innerHTML = question1;
                $('#divQuestion1').show();
            }

            if ((questionData[0]["QUESTION2"] !== undefined) && (questionData[0]["QUESTION2"] !== null)) {
                var question2 = questionData[0]["QUESTION2"];
                document.getElementById('question2Text').innerHTML = question2;
                $('#divQuestion2').show();
            }

            if ((questionData[0]["QUESTION3"] !== undefined) && (questionData[0]["QUESTION3"] !== null)) {
                var question3 = questionData[0]["QUESTION3"];
                document.getElementById('question3Text').innerHTML = question3;
                $('#divQuestion3').show();
            }

            if ((questionData[0]["QUESTION4"] !== undefined) && (questionData[0]["QUESTION4"] !== null)) {
                var question4 = questionData[0]["QUESTION4"];
                document.getElementById('question4Text').innerHTML = question4;
                $('#divQuestion4').show();
            }

            if ((questionData[0]["QUESTION5"] !== undefined) && (questionData[0]["QUESTION5"] !== null)) {
                var question5 = questionData[0]["QUESTION5"];
                document.getElementById('question5Text').innerHTML = question5;
                $('#divQuestion5').show();
            }
            
            if ((questionData[0]["QUESTION6"] !== undefined) && (questionData[0]["QUESTION6"] !== null)) {
                var question6 = questionData[0]["QUESTION6"];
                document.getElementById('question6Text').innerHTML = question6;
                $('#divQuestion6').show();
            }

            if ((questionData[0]["QUESTION7"] !== undefined) && (questionData[0]["QUESTION7"] !== null)) {
                var question7 = questionData[0]["QUESTION7"];
                document.getElementById('question7Text').innerHTML = question6;
                $('#divQuestion7').show();
            }

            if ((questionData[0]["QUESTION8"] !== undefined) && (questionData[0]["QUESTION8"] !== null)) {
                var question8 = questionData[0]["QUESTION8"];
                document.getElementById('question8Text').innerHTML = question8;
                $('#divQuestion8').show();
            }

            if ((questionData[0]["QUESTION9"] !== undefined) && (questionData[0]["QUESTION9"] !== null)) {
                var question9 = questionData[0]["QUESTION9"];
                document.getElementById('question9Text').innerHTML = question9;
                $('#divQuestion9').show();
            }

            if ((questionData[0]["QUESTION10"] !== undefined) && (questionData[0]["QUESTION10"] !== null)) {
                var question10 = questionData[0]["QUESTION10"];
                document.getElementById('question10Text').innerHTML = question10;
                $('#divQuestion10').show();
            }
           
        }

        function submitButton() {
            var admin = $('#hf_User').val();
            console.log("admin: " + admin);

            var state_long = $('#<%= ddlState.ClientID %> option:selected').text();
            //geo1 = $('#GeoExampleSelect1').val();
            var county = $('#<%= ddlCounty.ClientID %> option:selected').text();
            var city = $('#<%= ddlCity.ClientID %> option:selected').text();

            //response1 = $('#exampleSelect1').val();
            //console.log(response1);
            //if (response1 == '1 - Extremely well') {
            //    var response1_num = 1;
            //} else if (response1 == '2 - Very well') {
            //    var response1_num = 2;
            //} else if (response1 == '3 - Somewhat well') {
            //    var response1_num = 3;
            //} else if (response1 == '4 - Not so well') {
            //    var response1_num = 4;
            //} else if (response1 == '5 - Not at all well') {
            //    var response1_num = 5;
            //}
            //console.log("response1: " + response1_num)

            //response2 = $('#exampleSelect2').val();
            //console.log(response2);
            //if (response2 == '1 - Extremely well') {
            //    var response2_num = 1;
            //} else if (response2 == '2 - Very well') {
            //    var response2_num = 2;
            //} else if (response2 == '3 - Somewhat well') {
            //    var response2_num = 3;
            //} else if (response2 == '4 - Not so well') {
            //    var response2_num = 4;
            //} else if (response2 == '5 - Not at all well') {
            //    var response2_num = 5;
            //}            

            if ((questionData[0]["QUESTION1"] !== undefined) && (questionData[0]["QUESTION1"] !== null)) {
                var ele1 = document.getElementsByName('radio1');
                var response1 = undefined;
                for (i = 0; i < ele1.length; i++) {
                    if (ele1[i].checked)
                        response1 = ele1[i].value
                }

                if (response1 == undefined) {
                    var response1_num = 999;
                } else if (response1 == 'Yes') {
                    var response1_num = 1;
                } else if (response1 == 'No') {
                    var response1_num = 0;
                }
            } else { var response1_num = 999; }

            if ((questionData[0]["QUESTION2"] !== undefined) && (questionData[0]["QUESTION2"] !== null)) {
                var ele2 = document.getElementsByName('radio2');
                var response2 = undefined;
                for (i = 0; i < ele2.length; i++) {
                    if (ele2[i].checked)
                        response2 = ele2[i].value
                }

                if (response2 == undefined) {
                    var response2_num = 999;
                } else if (response2 == 'Yes') {
                    var response2_num = 1;
                } else if (response2 == 'No') {
                    var response2_num = 0;
                }
            } else { var response2_num = 999; }

            if ((questionData[0]["QUESTION3"] !== undefined) && (questionData[0]["QUESTION3"] !== null)) {
                var ele3 = document.getElementsByName('radio3');
                var response3 = undefined;
                for (i = 0; i < ele3.length; i++) {
                    if (ele3[i].checked)
                        response3 = ele3[i].value
                }

                if (response3 == undefined) {
                    var response3_num = 999;
                } else if (response3 == 'Yes') {
                    var response3_num = 1;
                } else if (response3 == 'No') {
                    var response3_num = 0;
                }
            } else { var response3_num = 999; }

            if ((questionData[0]["QUESTION4"] !== undefined) && (questionData[0]["QUESTION4"] !== null)) {
                var ele4 = document.getElementsByName('radio4');
                var response4 = undefined;
                for (i = 0; i < ele4.length; i++) {
                    if (ele4[i].checked)
                        response4 = ele4[i].value
                }

                if (response4 == undefined) {
                    var response4_num = 999;
                } else if (response4 == 'Yes') {
                    var response4_num = 1;
                } else if (response4 == 'No') {
                    var response4_num = 0;
                }
            } else { var response4_num = 999; }

            if (response4_num == 1) {              

                Modal_Click();
            }
           
            if ((questionData[0]["QUESTION5"] !== undefined) && (questionData[0]["QUESTION5"] !== null)) {
                var ele5 = document.getElementsByName('radio5');
                var response5 = undefined;
                for (i = 0; i < ele5.length; i++) {
                    if (ele5[i].checked)
                        response5 = ele5[i].value
                }

                if (response5 == undefined) {
                    var response5_num = 999;
                } else if (response5 == 'Yes') {
                    var response5_num = 1;
                } else if (response5 == 'No') {
                    var response5_num = 0;
                }
            } else { var response5_num = 999; }

            if ((questionData[0]["QUESTION6"] !== undefined) && (questionData[0]["QUESTION6"] !== null)) {
                var ele6 = document.getElementsByName('radio6');
                var response6 = undefined;
                for (i = 0; i < ele6.length; i++) {
                    if (ele6[i].checked)
                        response6 = ele6[i].value
                }

                if (response6 == undefined) {
                    var response6_num = 999;
                } else if (response6 == 'Yes') {
                    var response6_num = 1;
                } else if (response6 == 'No') {
                    var response6_num = 0;
                }
            } else { var response6_num = 999; }

            if ((questionData[0]["QUESTION7"] !== undefined) && (questionData[0]["QUESTION7"] !== null)) {
                var ele7 = document.getElementsByName('radio7');
                var response7 = undefined;
                for (i = 0; i < ele7.length; i++) {
                    if (ele7[i].checked)
                        response7 = ele7[i].value
                }

                if (response7 == undefined) {
                    var response7_num = 999;
                } else if (response7 == 'Yes') {
                    var response7_num = 1;
                } else if (response7 == 'No') {
                    var response7_num = 0;
                }
            } else { var response7_num = 999; }

            if ((questionData[0]["QUESTION8"] !== undefined) && (questionData[0]["QUESTION8"] !== null)) {
                var ele8 = document.getElementsByName('radio8');
                var response8 = undefined;
                for (i = 0; i < ele8.length; i++) {
                    if (ele8[i].checked)
                        response8 = ele8[i].value
                }

                if (response8 == undefined) {
                    var response8_num = 999;
                } else if (response8 == 'Yes') {
                    var response8_num = 1;
                } else if (response8 == 'No') {
                    var response8_num = 0;
                }
            } else { var response8_num = 999; }

            if ((questionData[0]["QUESTION9"] !== undefined) && (questionData[0]["QUESTION9"] !== null)) {
                var ele9 = document.getElementsByName('radio9');
                var response9 = undefined;
                for (i = 0; i < ele9.length; i++) {
                    if (ele9[i].checked)
                        response9 = ele9[i].value
                }

                if (response9 == undefined) {
                    var response9_num = 999;
                } else if (response9 == 'Yes') {
                    var response9_num = 1;
                } else if (response9 == 'No') {
                    var response9_num = 0;
                }
            } else { var response9_num = 999; }

            if ((questionData[0]["QUESTION10"] !== undefined) && (questionData[0]["QUESTION10"] !== null)) {
                var ele10 = document.getElementsByName('radio10');
                var response10 = undefined;
                for (i = 0; i < ele10.length; i++) {
                    if (ele10[i].checked)
                        response10 = ele10[i].value
                }

                if (response10 == undefined) {
                    var response10_num = 999;
                } else if (response10 == 'Yes') {
                    var response10_num = 1;
                } else if (response10 == 'No') {
                    var response10_num = 0;
                }
            } else { var response10_num = 999; }

            console.log("FILTERS");
            console.log(admin);
            console.log(state_long);
            console.log(county);
            console.log(city);
            console.log(response1_num);
            console.log(response2_num);
            console.log(response3_num);            
            console.log(response4_num);
            console.log(response5_num);
            console.log(response6_num);
            console.log(response7_num);
            console.log(response8_num);
            console.log(response9_num);
            console.log(response10_num);
            //response5 = $('#exampleTextarea').val();
            //console.log(response5);

            var sql_Insert_Detail = `Insert into PONDER.SURVEY_0001_TABLE_V2 (ATTUID, STATE_LONG, COUNTY, CITY, RESPONSE1, RESPONSE2, RESPONSE3, RESPONSE4, RESPONSE5, RESPONSE6, RESPONSE7, RESPONSE8, RESPONSE9, RESPONSE10, SUPERVISOR_ATTUID, DATE_INSERTED) VALUES ('` + admin + `','` + state_long + `','` + county + `','` + city + `','` + response1_num + `','` + response2_num + `','` + response3_num + `','` + response4_num + `','` + response5_num + `','` + response6_num + `','` + response7_num + `','` + response8_num + `','` + response9_num + `','` + response10_num + `','` + GlobalsupervisorAttuId + `', SYSDATE);commit;`;
            //Validate(sql_Insert_Detail)

        }

        function updateSubmitTable(sql1) {
            $.ajax({
                type: "POST",
                async: false,
                url: "Survey_0001.aspx/callAXIOMinsert",
                data: JSON.stringify({ 'sql': sql1 }),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    alert("Survey submitted. Thanks.");
                },
                error: function (data) {
                    alert("Error Updating table!");
                    return;
                }
            });
        }

        function Validate(sql_Insert_Detail) {

            updateSubmitTable(sql_Insert_Detail);

            //var response5_check = $('#exampleTextarea').val();
            //if (response5_check == "") {
            //    updateSubmitTable(sql_Insert_Detail);
            //    return;
            //}
            //else {

            //    //Regex for Valid Characters i.e. Alphabets, Numbers and Space.
            //    var response5_text = document.getElementById("exampleTextarea").value;

            //    var regex = /^[A-Za-z 0-9\_\.\,\!\?]+$/

            //    //Validate TextBox value against the Regex.
            //    var isValid = regex.test(response5_text);
            //    console.log("isValid: " + isValid);
            //    if (!isValid) {
            //        alert("Response Contains Special Characters. Please remove from text box.");
            //    } else {
            //        updateSubmitTable(sql_Insert_Detail);
            //    }

            //    return isValid;
            //}
        }

        function Modal_Click(source, eventArgs) {
            var clickButton = document.getElementById("<%= btnModal.ClientID %>");
            clickButton.click();
        }
        

        function Getmarketdata(market) {

            $.ajax({
                type: "POST",
                async: true,
                url: "Survey_0001.aspx/GetDATADATE",
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

        function loadCURRYEAR(data) {
            var score = JSON.parse(data.d);
            var value_prevyr = score[0]["PREV_YR"];



            var value_curyr = score[0]["CUR_YR"];
            var curyrx = document.querySelectorAll("#CUR_YRa, #CUR_YRb, #CUR_YRc, #CUR_YRc, #CUR_YRd, #CUR_YRe, #CUR_Yrf");
            var i;
            for (i = 0; i < curyrx.length; i++) {
                curyrx[i].innerHTML = value_curyr;
            }

            var value_curyr_plus1 = score[0]["CUR_YR_PLUS1"];

            var value_curyr_plus2 = score[0]["CUR_YR_PLUS2"];

            var value_curyr_plus3 = score[0]["CUR_YR_PLUS3"];

        }

    </script>


</asp:Content>


