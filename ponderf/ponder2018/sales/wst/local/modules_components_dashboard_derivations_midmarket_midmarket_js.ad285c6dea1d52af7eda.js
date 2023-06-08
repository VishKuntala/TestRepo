/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(self["webpackChunkleafletapp"] = self["webpackChunkleafletapp"] || []).push([["modules_components_dashboard_derivations_midmarket_midmarket_js"],{

/***/ "./modules/components/dashboard/derivations/midmarket/midmarket.js":
/*!*************************************************************************!*\
  !*** ./modules/components/dashboard/derivations/midmarket/midmarket.js ***!
  \*************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! jquery */ \"jquery\");\n/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var _templates_components_dashboards_midmarketDashboard_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../../../../../templates/components/dashboards/midmarketDashboard.js */ \"./templates/components/dashboards/midmarketDashboard.js\");\n\n\n\n\nvar midmarket = function midmarket(_ref) {\n  var adminUser = _ref.adminUser,\n      instance = _ref.instance;\n  return {\n    html: _templates_components_dashboards_midmarketDashboard_js__WEBPACK_IMPORTED_MODULE_1__.html\n  };\n};\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (midmarket);\n\n//# sourceURL=webpack://leafletapp/./modules/components/dashboard/derivations/midmarket/midmarket.js?");

/***/ }),

/***/ "./templates/components/dashboards/midmarketDashboard.js":
/*!***************************************************************!*\
  !*** ./templates/components/dashboards/midmarketDashboard.js ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"html\": () => (/* binding */ html)\n/* harmony export */ });\nvar html = function html(_ref) {\n  var id = _ref.id,\n      config = _ref.config;\n  return \"\\n                    <h3>Dashboard</h3>\\n                    <div class=\\\"ui sixteen column aligned stackable grid\\\">\\n                        <div class=\\\"row\\\">\\n                            <div class=\\\"two wide centered column\\\">\\n                                <ponder-piechart seriesname='covScore' confighelper='covScoreConfigHelper.js'\\n                                        legenddatakey=\\\"covScoreLegend\\\" derivation=\\\"svidPiechart/svidPiechart.js\\\"\\n                                        title=\\\"Simple Coverage Score\\\" \\n                                        chartid=\\\"piechart1\\\" groupbyprop=\\\"coverage_score\\\" aggregatetype=\\\"COUNT\\\"></ponder-piechart>\\n                                <ponder-chartlegend legenddatakey=\\\"covScoreLegend\\\" legendid='covscorelegend'></ponder-chartlegend>\\n                            </div>\\n                            <div class=\\\"two wide centered column\\\">\\n                                <ponder-piechart seriesname='fiveg' confighelper='fivegConfigHelper.js'\\n                                        legenddatakey=\\\"fivegLegend\\\" derivation=\\\"svidPiechart/svidPiechart.js\\\"\\n                                        title=\\\"5G\\\" \\n                                        chartid=\\\"piechart2\\\" groupbyprop=\\\"fiveg\\\" aggregatetype=\\\"COUNT\\\"></ponder-piechart>\\n                                <ponder-chartlegend legenddatakey=\\\"fivegLegend\\\" legendid='fiveglegend'></ponder-chartlegend>\\n                            </div>\\n                            <div class=\\\"two wide centered column\\\">\\n                                <ponder-piechart seriesname='band14' confighelper='band14ConfigHelper.js'\\n                                        legenddatakey=\\\"band14Legend\\\" derivation=\\\"svidPiechart/svidPiechart.js\\\"\\n                                        title=\\\"FNET Band 14\\\" \\n                                        chartid=\\\"piechart3\\\" groupbyprop=\\\"band_14\\\" aggregatetype=\\\"COUNT\\\"></ponder-piechart>\\n                                <ponder-chartlegend legenddatakey=\\\"band14Legend\\\" legendid='band14legend'></ponder-chartlegend>\\n                            </div>\\n                            <div class=\\\"two wide centered column\\\">\\n                                <ponder-piechart seriesname='tput' confighelper='tputConfigHelper.js'\\n                                        legenddatakey=\\\"tputLegend\\\"\\n                                        title=\\\"Speed/Avail Capacity\\\" derivation=\\\"svidPiechart/svidPiechart.js\\\"\\n                                        chartid=\\\"piechart4\\\" groupbyprop=\\\"tput_text\\\" aggregatetype=\\\"COUNT\\\"></ponder-piechart>\\n                                <ponder-chartlegend legenddatakey=\\\"tputLegend\\\" legendid='tputlegend'></ponder-chartlegend>\\n                            </div>\\n                            <div class=\\\"two wide centered column\\\">\\n                                <ponder-piechart seriesname='roaming' confighelper='roamingConfigHelper.js'\\n                                        legenddatakey=\\\"roamingLegend\\\"\\n                                        title=\\\"Roaming\\\" derivation=\\\"svidPiechart/svidPiechart.js\\\"\\n                                        chartid=\\\"piechart5\\\" groupbyprop=\\\"roam_text\\\" aggregatetype=\\\"COUNT\\\"></ponder-piechart>\\n                                <ponder-chartlegend legenddatakey=\\\"roamingLegend\\\" legendid='roaminglegend'></ponder-chartlegend>\\n                            </div>\\n                            <div class=\\\"two wide centered column\\\">\\n                                <ponder-piechart seriesname='fiberCust' confighelper='fiberCustConfigHelper.js'\\n                                        legenddatakey=\\\"fiberCust\\\"\\n                                        title=\\\"Legacy Device Penetration\\\" derivation=\\\"svidPiechart/svidPiechart.js\\\"\\n                                        chartid=\\\"piechart6\\\" groupbyprop=\\\"fiber_cust\\\" aggregatetype=\\\"COUNT\\\"></ponder-piechart>\\n                                <ponder-chartlegend legenddatakey=\\\"fiberCust\\\" legendid='fiberCustlegend'></ponder-chartlegend>\\n                            </div>\\n                        </div>\\n                </div>\\n\";\n};\n\n\n\n//# sourceURL=webpack://leafletapp/./templates/components/dashboards/midmarketDashboard.js?");

/***/ })

}]);