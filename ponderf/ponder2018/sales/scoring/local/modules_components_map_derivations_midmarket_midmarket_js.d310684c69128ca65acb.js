/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(self["webpackChunkleafletapp"] = self["webpackChunkleafletapp"] || []).push([["modules_components_map_derivations_midmarket_midmarket_js"],{

/***/ "./modules/components/map/derivations/midmarket/midmarket.js":
/*!*******************************************************************!*\
  !*** ./modules/components/map/derivations/midmarket/midmarket.js ***!
  \*******************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! jquery */ \"jquery\");\n/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_0__);\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/groupBy.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/prop.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/keys.js\");\n/* harmony import */ var _createMaskCanvas_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../../../../createMaskCanvas.js */ \"./modules/createMaskCanvas.js\");\n/* harmony import */ var _mapLayers_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../mapLayers.js */ \"./modules/mapLayers.js\");\n/* harmony import */ var _helpers_layersControl_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../helpers/layersControl.js */ \"./modules/helpers/layersControl.js\");\nfunction asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }\n\nfunction _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, \"next\", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, \"throw\", err); } _next(undefined); }); }; }\n\n\n\n\n\n\n\nvar midmarketMap = function midmarketMap(_ref) {\n  var adminUser = _ref.adminUser,\n      instance = _ref.instance;\n\n  var createStoreLayer = /*#__PURE__*/function () {\n    var _ref2 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee(title, lineColor, storeDataset) {\n      var pane, response;\n      return regeneratorRuntime.wrap(function _callee$(_context) {\n        while (1) {\n          switch (_context.prev = _context.next) {\n            case 0:\n              pane = instance.map.getPane(title);\n\n              if (!pane) {\n                pane = instance.map.createPane(title);\n                pane.style.zIndex = 400;\n              }\n\n              response = (0,_createMaskCanvas_js__WEBPACK_IMPORTED_MODULE_1__.createMaskCanvas)({\n                pane: pane,\n                markerShape: 'STOREDOUGHNUT',\n                heatMapDataKey: 'store_category',\n                heatMapObject: {\n                  \"ATTR\": \"#002280\",\n                  \"AR\": \"#21b2ff\"\n                },\n                heatMapActivationZoomLevel: 1,\n                markerSizeOffsetFromZoomValue: 2,\n                lineColor: lineColor,\n                lineWidth: 7,\n                minZoomBorderVisibility: 12,\n                maxZoomBorderVisibility: 20\n              }, {\n                title: title,\n                isDefault: 0,\n                minZoomVisibility: 1,\n                maxZoomVisibility: 20,\n                showHideOnZoom: false,\n                markerType: 'store'\n              }, storeDataset);\n              return _context.abrupt(\"return\", response);\n\n            case 4:\n            case \"end\":\n              return _context.stop();\n          }\n        }\n      }, _callee);\n    }));\n\n    return function createStoreLayer(_x, _x2, _x3) {\n      return _ref2.apply(this, arguments);\n    };\n  }();\n\n  var createStoreLayers = /*#__PURE__*/function () {\n    var _ref3 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee2() {\n      var storeLayerLineColors, storeOverlays, dataGroupedByStoreCategory, storeCategory, i, storeLayer;\n      return regeneratorRuntime.wrap(function _callee2$(_context2) {\n        while (1) {\n          switch (_context2.prev = _context2.next) {\n            case 0:\n              storeLayerLineColors = {\n                \"ATTR\": \"#002280\",\n                \"AR\": \"#21b2ff\"\n              };\n              storeOverlays = {};\n              dataGroupedByStoreCategory = ramda__WEBPACK_IMPORTED_MODULE_4__.default(ramda__WEBPACK_IMPORTED_MODULE_5__.default('store_category'), instance.storeData);\n              storeCategory = ramda__WEBPACK_IMPORTED_MODULE_6__.default(dataGroupedByStoreCategory);\n              i = 0;\n\n            case 5:\n              if (!(i < storeCategory.length)) {\n                _context2.next = 13;\n                break;\n              }\n\n              _context2.next = 8;\n              return createStoreLayer(storeCategory[i], storeLayerLineColors[storeCategory[i]], dataGroupedByStoreCategory[storeCategory[i]]);\n\n            case 8:\n              storeLayer = _context2.sent.canvasLayer;\n              //instance.map.addLayer(storeLayer);\n              storeOverlays[storeCategory[i] === \"AR\" ? \"Authorized Reseller Store\" : \"AT&T Retail Store\"] = storeLayer;\n\n            case 10:\n              i += 1;\n              _context2.next = 5;\n              break;\n\n            case 13:\n              return _context2.abrupt(\"return\", storeOverlays);\n\n            case 14:\n            case \"end\":\n              return _context2.stop();\n          }\n        }\n      }, _callee2);\n    }));\n\n    return function createStoreLayers() {\n      return _ref3.apply(this, arguments);\n    };\n  }();\n\n  var createMidMarketLayer = /*#__PURE__*/function () {\n    var _ref4 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee3(title) {\n      var pane, response;\n      return regeneratorRuntime.wrap(function _callee3$(_context3) {\n        while (1) {\n          switch (_context3.prev = _context3.next) {\n            case 0:\n              pane = instance.map.getPane(title);\n\n              if (!pane) {\n                pane = instance.map.createPane(title);\n                pane.style.zIndex = 400;\n              }\n\n              response = (0,_createMaskCanvas_js__WEBPACK_IMPORTED_MODULE_1__.createMaskCanvas)({\n                pane: pane,\n                markerShape: 'SQUARE',\n                heatMapDataKey: 'coverage_score',\n                heatMapObject: {\n                  \"5\": \"#003300\",\n                  \"4\": \"#008000\",\n                  \"3\": \"#00cc00\",\n                  \"2\": \"#ffff00\",\n                  \"1\": \"#e6b800\"\n                },\n                heatMapActivationZoomLevel: 10,\n                markerSizeOffsetFromZoomValue: -2,\n                lineColor: '#3366ff',\n                lineWidth: 4,\n                minZoomBorderVisibility: 12,\n                maxZoomBorderVisibility: 20\n              }, {\n                title: title,\n                isDefault: 1,\n                minZoomVisibility: 1,\n                maxZoomVisibility: 20,\n                markerType: 'midmarket'\n              }, instance.mapData);\n              return _context3.abrupt(\"return\", response);\n\n            case 4:\n            case \"end\":\n              return _context3.stop();\n          }\n        }\n      }, _callee3);\n    }));\n\n    return function createMidMarketLayer(_x4) {\n      return _ref4.apply(this, arguments);\n    };\n  }();\n\n  var createMapLayers = /*#__PURE__*/function () {\n    var _ref5 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee4() {\n      var midmarketLayer, storeOverlays, midMarketOverlays, overlays;\n      return regeneratorRuntime.wrap(function _callee4$(_context4) {\n        while (1) {\n          switch (_context4.prev = _context4.next) {\n            case 0:\n              _context4.next = 2;\n              return createMidMarketLayer('Mid Market Locations');\n\n            case 2:\n              midmarketLayer = _context4.sent.canvasLayer;\n              _context4.next = 5;\n              return createStoreLayers();\n\n            case 5:\n              storeOverlays = _context4.sent;\n              instance.map.addLayer(midmarketLayer);\n              midMarketOverlays = {};\n              midMarketOverlays[\"Mid Market Locations\"] = midmarketLayer;\n              overlays = {};\n              overlays = Object.assign(storeOverlays, midMarketOverlays);\n              L.control.layers((0,_mapLayers_js__WEBPACK_IMPORTED_MODULE_2__.getBaseLayers)(), overlays, {\n                collapsed: false\n              }).addTo(instance.map);\n              (0,_mapLayers_js__WEBPACK_IMPORTED_MODULE_2__.rebuildMapOverlaysData)(instance.map);\n              (0,_helpers_layersControl_js__WEBPACK_IMPORTED_MODULE_3__.updateOverlaysLabel)();\n\n            case 14:\n            case \"end\":\n              return _context4.stop();\n          }\n        }\n      }, _callee4);\n    }));\n\n    return function createMapLayers() {\n      return _ref5.apply(this, arguments);\n    };\n  }();\n\n  var eventHandlers = {\n    moveend: function moveend(e) {\n      instance.store.currentMapBounds = instance.map.getBounds();\n      instance.store.currentMapZoom = instance.map.getZoom();\n      instance.store.currentMapCenter = instance.map.getCenter();\n    },\n    zoomend: function zoomend(e) {\n      instance.store.currentMapBounds = instance.map.getBounds();\n      instance.store.currentMapZoom = instance.map.getZoom();\n      instance.store.currentMapCenter = instance.map.getCenter();\n    }\n  };\n  return {\n    eventHandlers: eventHandlers,\n    createMapLayers: createMapLayers\n  };\n};\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (midmarketMap);\n\n//# sourceURL=webpack://leafletapp/./modules/components/map/derivations/midmarket/midmarket.js?");

/***/ }),

/***/ "./node_modules/ramda/es/groupBy.js":
/*!******************************************!*\
  !*** ./node_modules/ramda/es/groupBy.js ***!
  \******************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _internal_checkForMethod_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./internal/_checkForMethod.js */ \"./node_modules/ramda/es/internal/_checkForMethod.js\");\n/* harmony import */ var _internal_curry2_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./internal/_curry2.js */ \"./node_modules/ramda/es/internal/_curry2.js\");\n/* harmony import */ var _reduceBy_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./reduceBy.js */ \"./node_modules/ramda/es/reduceBy.js\");\n\n\n\n/**\n * Splits a list into sub-lists stored in an object, based on the result of\n * calling a String-returning function on each element, and grouping the\n * results according to values returned.\n *\n * Dispatches to the `groupBy` method of the second argument, if present.\n *\n * Acts as a transducer if a transformer is given in list position.\n *\n * @func\n * @memberOf R\n * @since v0.1.0\n * @category List\n * @sig (a -> String) -> [a] -> {String: [a]}\n * @param {Function} fn Function :: a -> String\n * @param {Array} list The array to group\n * @return {Object} An object with the output of `fn` for keys, mapped to arrays of elements\n *         that produced that key when passed to `fn`.\n * @see R.reduceBy, R.transduce\n * @example\n *\n *      const byGrade = R.groupBy(function(student) {\n *        const score = student.score;\n *        return score < 65 ? 'F' :\n *               score < 70 ? 'D' :\n *               score < 80 ? 'C' :\n *               score < 90 ? 'B' : 'A';\n *      });\n *      const students = [{name: 'Abby', score: 84},\n *                      {name: 'Eddy', score: 58},\n *                      // ...\n *                      {name: 'Jack', score: 69}];\n *      byGrade(students);\n *      // {\n *      //   'A': [{name: 'Dianne', score: 99}],\n *      //   'B': [{name: 'Abby', score: 84}]\n *      //   // ...,\n *      //   'F': [{name: 'Eddy', score: 58}]\n *      // }\n */\n\nvar groupBy =\n/*#__PURE__*/\n(0,_internal_curry2_js__WEBPACK_IMPORTED_MODULE_0__.default)(\n/*#__PURE__*/\n(0,_internal_checkForMethod_js__WEBPACK_IMPORTED_MODULE_1__.default)('groupBy',\n/*#__PURE__*/\n(0,_reduceBy_js__WEBPACK_IMPORTED_MODULE_2__.default)(function (acc, item) {\n  if (acc == null) {\n    acc = [];\n  }\n\n  acc.push(item);\n  return acc;\n}, null)));\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (groupBy);\n\n//# sourceURL=webpack://leafletapp/./node_modules/ramda/es/groupBy.js?");

/***/ }),

/***/ "./node_modules/ramda/es/internal/_xreduceBy.js":
/*!******************************************************!*\
  !*** ./node_modules/ramda/es/internal/_xreduceBy.js ***!
  \******************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _curryN_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./_curryN.js */ \"./node_modules/ramda/es/internal/_curryN.js\");\n/* harmony import */ var _has_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./_has.js */ \"./node_modules/ramda/es/internal/_has.js\");\n/* harmony import */ var _xfBase_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./_xfBase.js */ \"./node_modules/ramda/es/internal/_xfBase.js\");\n\n\n\n\nvar XReduceBy =\n/*#__PURE__*/\nfunction () {\n  function XReduceBy(valueFn, valueAcc, keyFn, xf) {\n    this.valueFn = valueFn;\n    this.valueAcc = valueAcc;\n    this.keyFn = keyFn;\n    this.xf = xf;\n    this.inputs = {};\n  }\n\n  XReduceBy.prototype['@@transducer/init'] = _xfBase_js__WEBPACK_IMPORTED_MODULE_0__.default.init;\n\n  XReduceBy.prototype['@@transducer/result'] = function (result) {\n    var key;\n\n    for (key in this.inputs) {\n      if ((0,_has_js__WEBPACK_IMPORTED_MODULE_1__.default)(key, this.inputs)) {\n        result = this.xf['@@transducer/step'](result, this.inputs[key]);\n\n        if (result['@@transducer/reduced']) {\n          result = result['@@transducer/value'];\n          break;\n        }\n      }\n    }\n\n    this.inputs = null;\n    return this.xf['@@transducer/result'](result);\n  };\n\n  XReduceBy.prototype['@@transducer/step'] = function (result, input) {\n    var key = this.keyFn(input);\n    this.inputs[key] = this.inputs[key] || [key, this.valueAcc];\n    this.inputs[key][1] = this.valueFn(this.inputs[key][1], input);\n    return result;\n  };\n\n  return XReduceBy;\n}();\n\nvar _xreduceBy =\n/*#__PURE__*/\n(0,_curryN_js__WEBPACK_IMPORTED_MODULE_2__.default)(4, [], function _xreduceBy(valueFn, valueAcc, keyFn, xf) {\n  return new XReduceBy(valueFn, valueAcc, keyFn, xf);\n});\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_xreduceBy);\n\n//# sourceURL=webpack://leafletapp/./node_modules/ramda/es/internal/_xreduceBy.js?");

/***/ }),

/***/ "./node_modules/ramda/es/reduceBy.js":
/*!*******************************************!*\
  !*** ./node_modules/ramda/es/reduceBy.js ***!
  \*******************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _internal_clone_js__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./internal/_clone.js */ \"./node_modules/ramda/es/internal/_clone.js\");\n/* harmony import */ var _internal_curryN_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./internal/_curryN.js */ \"./node_modules/ramda/es/internal/_curryN.js\");\n/* harmony import */ var _internal_dispatchable_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./internal/_dispatchable.js */ \"./node_modules/ramda/es/internal/_dispatchable.js\");\n/* harmony import */ var _internal_has_js__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./internal/_has.js */ \"./node_modules/ramda/es/internal/_has.js\");\n/* harmony import */ var _internal_reduce_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./internal/_reduce.js */ \"./node_modules/ramda/es/internal/_reduce.js\");\n/* harmony import */ var _internal_xreduceBy_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./internal/_xreduceBy.js */ \"./node_modules/ramda/es/internal/_xreduceBy.js\");\n\n\n\n\n\n\n/**\n * Groups the elements of the list according to the result of calling\n * the String-returning function `keyFn` on each element and reduces the elements\n * of each group to a single value via the reducer function `valueFn`.\n *\n * This function is basically a more general [`groupBy`](#groupBy) function.\n *\n * Acts as a transducer if a transformer is given in list position.\n *\n * @func\n * @memberOf R\n * @since v0.20.0\n * @category List\n * @sig ((a, b) -> a) -> a -> (b -> String) -> [b] -> {String: a}\n * @param {Function} valueFn The function that reduces the elements of each group to a single\n *        value. Receives two values, accumulator for a particular group and the current element.\n * @param {*} acc The (initial) accumulator value for each group.\n * @param {Function} keyFn The function that maps the list's element into a key.\n * @param {Array} list The array to group.\n * @return {Object} An object with the output of `keyFn` for keys, mapped to the output of\n *         `valueFn` for elements which produced that key when passed to `keyFn`.\n * @see R.groupBy, R.reduce\n * @example\n *\n *      const groupNames = (acc, {name}) => acc.concat(name)\n *      const toGrade = ({score}) =>\n *        score < 65 ? 'F' :\n *        score < 70 ? 'D' :\n *        score < 80 ? 'C' :\n *        score < 90 ? 'B' : 'A'\n *\n *      var students = [\n *        {name: 'Abby', score: 83},\n *        {name: 'Bart', score: 62},\n *        {name: 'Curt', score: 88},\n *        {name: 'Dora', score: 92},\n *      ]\n *\n *      reduceBy(groupNames, [], toGrade, students)\n *      //=> {\"A\": [\"Dora\"], \"B\": [\"Abby\", \"Curt\"], \"F\": [\"Bart\"]}\n */\n\nvar reduceBy =\n/*#__PURE__*/\n(0,_internal_curryN_js__WEBPACK_IMPORTED_MODULE_0__.default)(4, [],\n/*#__PURE__*/\n(0,_internal_dispatchable_js__WEBPACK_IMPORTED_MODULE_1__.default)([], _internal_xreduceBy_js__WEBPACK_IMPORTED_MODULE_2__.default, function reduceBy(valueFn, valueAcc, keyFn, list) {\n  return (0,_internal_reduce_js__WEBPACK_IMPORTED_MODULE_3__.default)(function (acc, elt) {\n    var key = keyFn(elt);\n    acc[key] = valueFn((0,_internal_has_js__WEBPACK_IMPORTED_MODULE_4__.default)(key, acc) ? acc[key] : (0,_internal_clone_js__WEBPACK_IMPORTED_MODULE_5__.default)(valueAcc, [], [], false), elt);\n    return acc;\n  }, {}, list);\n}));\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (reduceBy);\n\n//# sourceURL=webpack://leafletapp/./node_modules/ramda/es/reduceBy.js?");

/***/ })

}]);