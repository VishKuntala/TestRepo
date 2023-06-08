<%@ Page Title="POE MNP" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cappoemnp.aspx.cs" Inherits="cappoemnp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
    <link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />

    <link rel="shortcut icon" href="/favicon.ico" />

    <script src="../assets/app/js/dashboard.js" type="text/javascript"></script>
    <script src="../scripts/jquery-3.3.1.min.js"></script>
    <script src="../assets/vendors/base/vendors.bundle.js" type="text/javascript"></script> 
    <script src="../assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
    <!--end::Base Scripts -->
    <script src="../assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
    <script src="../assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
    <script src="../assets/demo/default/custom/components/datatables/base/data-local.js" type="text/javascript"></script>
    <script src="../node_modules/highcharts/highcharts.js"></script>
    <script src="../node_modules/highcharts/highcharts-more.js"></script>
    <script src="../node_modules/highcharts/modules/exporting.js"></script>
    <script src="../node_modules/highcharts/modules/data.js"></script>
    <script src="../highcharts/charts-highcharts.js" type="text/javascript"></script>

    <!--begin::Page Vendors -->

    <!--end::Page Resources -->
    <div class="d-flex align-items-center">
        <div class="mr-auto">
            <h3 class="m-subheader__title m-subheader__title--separator">Capacity
            </h3>
            <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                <li class="m-nav__item m-nav__item--home">
                    <a href="/ponder.aspx" class="m-nav__link m-nav__link--icon">
                        <i class="m-nav__link-icon la la-home"></i>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">RANFT
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">POE
                        </span>
                    </a>
                </li>
                <li class="m-nav__separator">-
                </li>
                <li class="m-nav__item">
                    <a href="" class="m-nav__link">
                        <span class="m-nav__link-text">Central Region
                        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!--</div>-->

    <div class="row">

        <div class="col-xl-5">
            <!--begin::Portlet-->
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">POE Milestone Counts
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <!--begin::Section-->
                    <div class="m-section">
                        <span class="m-section__heading">Central Region: All Projects
                        </span>
                        <div class="m-section__content" style="height: 386px;">
                            <table id="example" class="table table-striped table-bordered table-hover text-center" width="100%">
                                <thead>
                                    <tr>
                                        <th>Market</th>
                                        <th>POE Forecast</th>
                                        <th>Site Acquisition Complete</th>
                                        <th>Construction Started</th>
                                        <th>Tower Work Complete</th>
                                        <th>On-Air</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <td>Central Region</td>
                                        <td>19200</td>
                                        <td>13616</td>
                                        <td>378</td>
                                        <td>5073</td>
                                        <td>135</td>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>Arkansas/Oklahoma</td>
                                        <td>2166</td>
                                        <td>466</td>
                                        <td>98</td>
                                        <td>31</td>
                                        <td>5</td>
                                    </tr>
                                    <tr>
                                        <td>Illinois/Wisconsin</td>
                                        <td>2798</td>
                                        <td>454</td>
                                        <td>78</td>
                                        <td>54</td>
                                        <td>17</td>
                                    </tr>
                                    <tr>
                                        <td>Missouri/Kansas</td>
                                        <td>1971</td>
                                        <td>178</td>
                                        <td>43</td>
                                        <td>26</td>
                                        <td>5</td>
                                    </tr>
                                    <tr>
                                        <td>Northern Plains</td>
                                        <td>1085</td>
                                        <td>115</td>
                                        <td>70</td>
                                        <td>57</td>
                                        <td>31</td>
                                    </tr>
                                    <tr>
                                        <td>North Texas</td>
                                        <td>3246</td>
                                        <td>276</td>
                                        <td>146</td>
                                        <td>56</td>
                                        <td>16</td>
                                    </tr>
                                    <tr>
                                        <td>South Texas</td>
                                        <td>2415</td>
                                        <td>189</td>
                                        <td>55</td>
                                        <td>35</td>
                                        <td>11</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-7">
            <!--begin::Portlet-->
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">POE Milestone Waterfall Breakout
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="portlet-body">

                    <fieldset id="group1">
                        <label>
                            &emsp; All Projects
                                        <input class="test" name="g" type="radio" value="a">
                        </label>
                        <label>
                            &emsp; LTE Additional Carrier
                                        <input class="test" name="g" type="radio" value="b">
                        </label>
                        <label>
                            &emsp; NSB
                                        <input class="test" name="g" type="radio" value="c">
                        </label>
                        <label>
                            &emsp; C-RAN
                                        <input class="test" name="g" type="radio" value="d">
                        </label>
                        <label>
                            &emsp; LTE 1C
                                        <input class="test" name="g" type="radio" value="e">
                        </label>
                    </fieldset>
                    <div id="testclick" style="height: 500px"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-7">
            <!--begin::Portlet-->
            <div class="m-portlet m-portlet--tab">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">POE Forecast vs. Need By Date
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <fieldset id="group2">
                        <label>
                            &emsp; All Projects
                                                <input class="test2" name="l" type="radio" value="f">
                        </label>
                        <label>
                            &emsp; LTE Additional Carrier
                                                <input class="test2" name="l" type="radio" value="g">
                        </label>
                        <label>
                            &emsp; NSB
                                                <input class="test2" name="l" type="radio" value="h">
                        </label>
                        <label>
                            &emsp; C-RAN
                                                <input class="test2" name="l" type="radio" value="i">
                        </label>
                        <label>
                            &emsp; LTE 1C
                                                <input class="test2" name="l" type="radio" value="j">
                        </label>
                    </fieldset>
                    <div id="testclick2" style="height: 500px;"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-5">
            <!--begin::Portlet-->
            <div class="m-portlet">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <h3 class="m-portlet__head-text">POE Forecast vs. Actual Tracking
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <!--begin::Section-->
                    <div class="m-section">
                        <span class="m-section__heading">Central Region: LTE Additional Carrier
                        </span>
                        <div class="m-section__content" style="height: 447px;">
                            <table id="example2" class="m-table table-striped table-bordered table-hover table-condensed text-center" width="100%">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>2017 Actuals</th>
                                        <th>Jan</th>
                                        <th>Feb</th>
                                        <th>Mar</th>
                                        <th>Apr</th>
                                        <th>May</th>
                                        <th>Jun</th>
                                        <th>Jul</th>
                                        <th>Aug</th>
                                        <th>Sep</th>
                                        <th>Oct</th>
                                        <th>Nov</th>
                                        <th>30-day</th>
                                        <th>90-day</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Total</th>
                                        <th>6297</th>
                                        <th>13705</th>
                                        <th>13672</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>Jan</td>
                                        <td bgcolor="#92D050">186</td>
                                        <td bgcolor="#92D050">109</td>
                                        <td bgcolor="#92D050">108</td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Feb</td>
                                        <td bgcolor="#92D050">281</td>
                                        <td>204</td>
                                        <td bgcolor="#92D050">188</td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Mar</td>
                                        <td bgcolor="#92D050">498</td>
                                        <td>511</td>
                                        <td>295</td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Apr</td>
                                        <td bgcolor="#92D050">510</td>
                                        <td>830</td>
                                        <td>624</td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>May</td>
                                        <td bgcolor="#92D050">484</td>
                                        <td>1183</td>
                                        <td>1281</td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Jun</td>
                                        <td bgcolor="#92D050">607</td>
                                        <td>1760</td>
                                        <td>1803</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Jul</td>
                                        <td bgcolor="#92D050">623</td>
                                        <td>1704</td>
                                        <td>1616</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Aug</td>
                                        <td bgcolor="#92D050">595</td>
                                        <td>1625</td>
                                        <td>1728</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Sep</td>
                                        <td bgcolor="#92D050">628</td>
                                        <td>2006</td>
                                        <td>1847</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Oct</td>
                                        <td bgcolor="#92D050">683</td>
                                        <td>1710</td>
                                        <td>1767</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Nov</td>
                                        <td bgcolor="#92D050">581</td>
                                        <td>1331</td>
                                        <td>1553</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td bgcolor="#92D050"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Dec</td>
                                        <td bgcolor="#92D050">621</td>
                                        <td>732</td>
                                        <td>862</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>2019</td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--end::Section-->

                </div>
                <!--end::Form-->
            </div>
            <!--end::Portlet-->
            <!--begin::Portlet-->
            <!--end::Portlet-->
            <!--begin::Portlet-->
            <!--end::Portlet-->
            <!--begin::Portlet-->
            <!--end::Portlet-->
            <!--begin::Portlet-->
            <!--end::Portlet-->
            <!--begin::Portlet-->
            <!--end::Portlet-->
        </div>

        <div class="col-xl-6">
            <!--begin::Portlet-->
            <div class="m-portlet m-portlet--tab">
                <div class="m-portlet__head">
                    <div class="m-portlet__head-caption">
                        <div class="m-portlet__head-title">
                            <span class="m-portlet__head-icon m--hide">
                                <i class="la la-gear"></i>
                            </span>
                            <h3 class="m-portlet__head-text">Issued vs. POE Aging Chart
                            </h3>
                        </div>
                    </div>
                </div>
                <div class="m-portlet__body">
                    <div id="cenaging" style="height: 500px;"></div>
                </div>
            </div>
        </div>       

       <div class="col-xl-12">

                        
                        <div class="m-portlet m-portlet--mobile">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <h3 class="m-portlet__head-text">
                                            POE Milestone Chart
                                            <small>
                                                2018
                                            </small>
                                        </h3>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="m-portlet__body">
                                <!--begin: Search Form -->
                                <div class="m-form m-form--label-align-right m--margin-top-10 m--margin-bottom-10">
                                    <div class="row align-items-center">
                                        <div class="col-xl-8 order-2 order-xl-1">
                                            <div class="form-group m-form__group row align-items-center">
                                                <div class="col-md-4">
                                                    <div class="m-form__group m-form__group--inline">
                                                        <div class="m-form__label">
                                                            <label>
                                                                Market:
                                                            </label>
                                                        </div>
                                                        <div class="m-form__control">
                                                            <select class="form-control m-bootstrap-select m-bootstrap-select--solid" id="m_form_status">
                                                                <option value="">
                                                                    All
                                                                </option>
                                                                <option value="Central Region">
                                                                    Central Region
                                                                </option>
                                                                <option value="MNP">
                                                                    Northern Plains
                                                                </option>
                                                                <option value="ILWI">
                                                                    Illinois/Wisconsin
                                                                </option>
                                                                <option value="GMW">
                                                                    Greater Midwest
                                                                </option>
                                                                <option value="AROK">
                                                                    Arkansas/Oklahoma
                                                                </option>
                                                                <option value="NTX">
                                                                    North Texas
                                                                </option>
                                                                <option value="STX">
                                                                    South Texas
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="d-md-none m--margin-bottom-10"></div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="m-form__group m-form__group--inline">
                                                        <div class="m-form__label">
                                                            <label class="m-label m-label--single">
                                                                Program:
                                                            </label>
                                                        </div>
                                                        <div class="m-form__control">
                                                            <select class="form-control m-bootstrap-select m-bootstrap-select--solid" id="m_form_type">
                                                                <option value="">
                                                                    All Projects
                                                                </option>
                                                                <option value="LTE AC">
                                                                    LTE Additional Carrier
                                                                </option>
                                                                <option value="NSB">
                                                                    NSB
                                                                </option>
                                                                <option value="C-RAN">
                                                                    C-RAN
                                                                </option>
                                                                <option value="LTE 1C">
                                                                    LTE 1C
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="d-md-none m--margin-bottom-10"></div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="m-input-icon m-input-icon--left">
                                                        <input type="text" class="form-control m-input m-input--solid" placeholder="Search..." id="generalSearch">
                                                        <span class="m-input-icon__icon m-input-icon__icon--left">
                                                            <span>
                                                                <i class="la la-search"></i>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 order-1 order-xl-2 m--align-right">
                                            
                                        </div>
                                    </div>
                                </div>
                                <!--end: Search Form -->
                                <!--begin: Datatable -->
                                <div class="m_datatable" id="local_data"></div>                                    
                                <!--end: Datatable -->
                            </div>
                        </div>
                    
       </div>


    </div>
    
    

</asp:Content>


