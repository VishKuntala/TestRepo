<%@ Page Title="POE Central" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cappoecen.aspx.cs" Inherits="cappoecen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <link href="/assets/vendors/base/vendors.bundle.css" rel="stylesheet" type="text/css" />
		<link href="/assets/demo/default/base/style.bundle.css" rel="stylesheet" type="text/css" />
        <link href="//www.amcharts.com/lib/3/plugins/export/export.css" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/favicon.ico" />

        
		<script src="/assets/app/js/dashboard.js" type="text/javascript"></script>
        <script src="/scripts/jquery-3.3.1.min.js"></script>
        <script src="/assets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
        <script src="/assets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
        <!--end::Base Scripts -->
        <!--begin::Page Vendors -->
        <script src="/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/amstock.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/serial.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/gauge.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/pie.js" type="text/javascript"></script>
        <script src="//www.amcharts.com/lib/3/plugins/tools/polarScatter/polarScatter.min.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/plugins/animate/animate.min.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/plugins/export/export.min.js" type="text/javascript"></script>
        <script src="/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
        <!--end::Page Vendors -->
        <!--begin::Page Resources -->
        <script src="/assets/demo/default/custom/components/quality/centralcqicharts/charts.js" type="text/javascript"></script>
        <!--end::Page Resources -->
            <!--<div class="m-grid__item m-grid__item--fluid m-wrapper">-->
                <!--<div class="m-subheader ">-->
                        <div class="d-flex align-items-center">
                            <div class="mr-auto">
                                <h3 class="m-subheader__title m-subheader__title--separator">
                                    Capacity
                                </h3>
                                <ul class="m-subheader__breadcrumbs m-nav m-nav--inline">
                                    <li class="m-nav__item m-nav__item--home">
                                        <a href="/ponder.aspx" class="m-nav__link m-nav__link--icon">
                                            <i class="m-nav__link-icon la la-home"></i>
                                        </a>
                                    </li>
                                    <li class="m-nav__separator">
                                        -
                                    </li>
                                    <li class="m-nav__item">
                                        <a href="" class="m-nav__link">
                                            <span class="m-nav__link-text">
                                                RANFT
                                            </span>
                                        </a>
                                    </li>
                                    <li class="m-nav__separator">
                                        -
                                    </li>
                                    <li class="m-nav__item">
                                        <a href="" class="m-nav__link">
                                            <span class="m-nav__link-text">
                                                POE
                                            </span>
                                        </a>
                                    </li>
                                    <li class="m-nav__separator">
                                        -
                                    </li>
                                    <li class="m-nav__item">
                                        <a href="" class="m-nav__link">
                                            <span class="m-nav__link-text">
                                                Central Region
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>                            
                        </div>
                    <!--</div>-->

                        <div class="row">
                            <div class="col-xl-4">
                                <!--begin::Portlet-->
                                <div class="m-portlet">
                                    <div class="m-portlet__head">
                                        <div class="m-portlet__head-caption">
                                            <div class="m-portlet__head-title">
                                                <h3 class="m-portlet__head-text">
                                                    POE Tables
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-portlet__body">
                                        <!--begin::Section-->
                                        <div class="m-section">
                                            <span class="m-section__heading">
                                                Central Region: LTE Additional Carrier
                                            </span>
                                            <div class="m-section__content">
                                                <table id="example" class="m-table table-striped table-bordered table-hover table-condensed text-center" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th></th>
                                                            <th>2016 Actuals</th>
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
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Total</th>
                                                            <th>893</th>
                                                            <th>1140</th>
                                                            <th>1140</th>
                                                            <th>1136</th>
                                                            <th>1137</th>
                                                            <th>1141</th>
                                                            <th>1141</th>
                                                            <th>1141</th>
                                                            <th>1141</th>
                                                            <th>1141</th>
                                                            <th>1121</th>
                                                            <th>1120</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <tr>
                                                            <td>Jan</td>
                                                            <td bgcolor="#92D050">48</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                            <td bgcolor="#92D050">14</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Feb</td>
                                                            <td bgcolor="#92D050">41</td>
                                                            <td>58</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                            <td bgcolor="#92D050">24</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mar</td>
                                                            <td bgcolor="#92D050">68</td>
                                                            <td>49</td>
                                                            <td>86</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                            <td bgcolor="#92D050">77</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Apr</td>
                                                            <td bgcolor="#92D050">82</td>
                                                            <td>94</td>
                                                            <td>93</td>
                                                            <td>85</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                            <td bgcolor="#92D050">67</td>
                                                        </tr>
                                                        <tr>
                                                            <td>May</td>
                                                            <td bgcolor="#92D050">88</td>
                                                            <td>84</td>
                                                            <td>68</td>
                                                            <td>57</td>
                                                            <td>70</td>
                                                            <td bgcolor="#92D050">66</td>
                                                            <td bgcolor="#92D050">66</td>
                                                            <td bgcolor="#92D050">66</td>
                                                            <td bgcolor="#92D050">66</td>
                                                            <td bgcolor="#92D050">66</td>
                                                            <td bgcolor="#92D050">66</td>
                                                            <td bgcolor="#92D050">66</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Jun</td>
                                                            <td bgcolor="#92D050">155</td>
                                                            <td>158</td>
                                                            <td>173</td>
                                                            <td>157</td>
                                                            <td>162</td>
                                                            <td>116</td>
                                                            <td bgcolor="#92D050">106</td>
                                                            <td bgcolor="#92D050">106</td>
                                                            <td bgcolor="#92D050">106</td>
                                                            <td bgcolor="#92D050">106</td>
                                                            <td bgcolor="#92D050">106</td>
                                                            <td bgcolor="#92D050">106</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Jul</td>
                                                            <td bgcolor="#92D050">131</td>
                                                            <td>143</td>
                                                            <td>126</td>
                                                            <td>155</td>
                                                            <td>175</td>
                                                            <td>134</td>
                                                            <td>133</td>
                                                            <td bgcolor="#92D050">136</td>
                                                            <td bgcolor="#92D050">136</td>
                                                            <td bgcolor="#92D050">136</td>
                                                            <td bgcolor="#92D050">136</td>
                                                            <td bgcolor="#92D050">136</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Aug</td>
                                                            <td bgcolor="#92D050">82</td>
                                                            <td>190</td>
                                                            <td>198</td>
                                                            <td>183</td>
                                                            <td>191</td>
                                                            <td>270</td>
                                                            <td>260</td>
                                                            <td>231</td>
                                                            <td bgcolor="#92D050">161</td>
                                                            <td bgcolor="#92D050">161</td>
                                                            <td bgcolor="#92D050">161</td>
                                                            <td bgcolor="#92D050">161</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Sep</td>
                                                            <td bgcolor="#92D050">71</td>
                                                            <td>159</td>
                                                            <td>167</td>
                                                            <td>147</td>
                                                            <td>122</td>
                                                            <td>138</td>
                                                            <td>129</td>
                                                            <td>133</td>
                                                            <td>151</td>
                                                            <td bgcolor="#92D050">91</td>
                                                            <td bgcolor="#92D050">91</td>
                                                            <td bgcolor="#92D050">91</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Oct</td>
                                                            <td bgcolor="#92D050">47</td>
                                                            <td>133</td>
                                                            <td>130</td>
                                                            <td>131</td>
                                                            <td>123</td>
                                                            <td>96</td>
                                                            <td>68</td>
                                                            <td>74</td>
                                                            <td>125</td>
                                                            <td>98</td>
                                                            <td bgcolor="#92D050">64</td>
                                                            <td bgcolor="#92D050">64</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Nov</td>
                                                            <td bgcolor="#92D050">19</td>
                                                            <td>17</td>
                                                            <td>17</td>
                                                            <td>30</td>
                                                            <td>32</td>
                                                            <td>43</td>
                                                            <td>32</td>
                                                            <td>40</td>
                                                            <td>45</td>
                                                            <td>56</td>
                                                            <td>79</td>
                                                            <td bgcolor="#92D050">65</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Dec</td>
                                                            <td bgcolor="#92D050">61</td>
                                                            <td>30</td>
                                                            <td>30</td>
                                                            <td>52</td>
                                                            <td>44</td>
                                                            <td>85</td>
                                                            <td>49</td>
                                                            <td>55</td>
                                                            <td>63</td>
                                                            <td>81</td>
                                                            <td>76</td>
                                                            <td>86</td>
                                                        </tr>
                                                        <tr>
                                                            <td>2018</td>
                                                            <td></td>
                                                            <td>11</td>
                                                            <td>11</td>
                                                            <td>24</td>
                                                            <td>36</td>
                                                            <td>11</td>
                                                            <td>117</td>
                                                            <td>119</td>
                                                            <td>107</td>
                                                            <td>165</td>
                                                            <td>162</td>
                                                            <td>165</td>
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
                    
                            <div class="col-xl-3">
                                <div class="m-portlet m-portlet--tab">
                                    <div class="m-portlet__head">
                                        <div class="m-portlet__head-caption">
                                            <div class="m-portlet__head-title">
                                                <span class="m-portlet__head-icon m--hide">
                                                    <i class="la la-gear"></i>
                                                </span>
                                                <h3 class="m-portlet__head-text">
                                                    POE LTE AC Milestone Progress
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-portlet__body">
                                        <div id="centralpoeacgauge" style="height: 443px;"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-5">
                                <!--begin::Portlet-->
                                <div class="m-portlet">
                                    <div class="m-portlet__head">
                                        <div class="m-portlet__head-caption">
                                            <div class="m-portlet__head-title">
                                                <h3 class="m-portlet__head-text">
                                                    POE Milestone Counts
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="m-portlet__body">
                                        <!--begin::Section-->
                                        <div class="m-section">
                                            <span class="m-section__heading">
                                                Central Region: LTE Additional Carrier
                                            </span>
                                            <div class="m-section__content">
                                                <table id="example" class="table table-striped table-bordered table-hover text-center" width="100%">
                                                    <thead>
                                                        <tr>
                                                            <th>Market</th>
                                                            <th>Project Count</th>
                                                            <th>Site Acquisition Complete</th>
                                                            <th>Construction Started</th>
                                                            <th>Tower Work Complete</th>
                                                            <th>On-Air</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Total</th>
                                                            <th>13681</th>
                                                            <th>1678</th>
                                                            <th>490</th>
                                                            <th>259</th>
                                                            <th>85</th>
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
                    
   
                                        <div class="col-xl-12">
                                            <!--begin::Portlet-->
                                            <div class="m-portlet m-portlet--tab">
                                                <div class="m-portlet__head">
                                                    <div class="m-portlet__head-caption">
                                                        <div class="m-portlet__head-title">
                                                            <span class="m-portlet__head-icon m--hide">
                                                                <i class="la la-gear"></i>
                                                            </span>
                                                            <h3 class="m-portlet__head-text">
                                                                POE Charts
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="m-portlet__body">
                                                    <div id="centralpoelteac" style="height: 600px;"></div>
                                                </div>
                                            </div>
                                        </div>
       
                                            <!--end::Portlet-->
    
                                        <div class="col-xl-12">
                                            <!--begin::Portlet-->
                                            <div class="m-portlet m-portlet--tab">
                                                <div class="m-portlet__head">
                                                    <div class="m-portlet__head-caption">
                                                        <div class="m-portlet__head-title">
                                                            <span class="m-portlet__head-icon m--hide">
                                                                <i class="la la-gear"></i>
                                                            </span>
                                                            <h3 class="m-portlet__head-text">
                                                                LTE AC Milestone Outlook
                                                            </h3>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="m-portlet__body">
                                                    <div id="centralpoemileout" style="height: 600px;"></div>
                                                </div>
                                            </div>
                                        </div>
                                            <!--begin::Portlet-->
                                            <!--end::Portlet-->
                                            <!--begin::Portlet-->
                                            <!--end::Portlet-->
                                            <!--begin::Portlet-->
                                            <!--end::Portlet-->
                                            <!--begin::Portlet-->
                                            <!--end::Portlet-->
                             <!--</div>-->       
</div>

</asp:Content>

