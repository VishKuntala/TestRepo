/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(self["webpackChunkleafletapp"] = self["webpackChunkleafletapp"] || []).push([["modules_components_datatable_derivations_omni_omni_js"],{

/***/ "./modules/components/datatable/derivations/omni/compareCheckbox.js":
/*!**************************************************************************!*\
  !*** ./modules/components/datatable/derivations/omni/compareCheckbox.js ***!
  \**************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"html\": () => (/* binding */ html)\n/* harmony export */ });\nvar html = function html(_ref) {\n  var adminUser = _ref.adminUser,\n      id = _ref.id;\n  return \"<div class=\\\"center aligned\\\">\\n  <input data-publish-attr=\\\"compareSvid\\\" type=\\\"checkbox\\\" name=\\\"chkCompareSvid\\\" id=\\\"chkCompareSvid\\\">\\n</div>\";\n};\n\n\n\n//# sourceURL=webpack://leafletapp/./modules/components/datatable/derivations/omni/compareCheckbox.js?");

/***/ }),

/***/ "./modules/components/datatable/derivations/omni/omni.js":
/*!***************************************************************!*\
  !*** ./modules/components/datatable/derivations/omni/omni.js ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _templates_components_datatables_omniDatatable_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../../../../../templates/components/datatables/omniDatatable.js */ \"./templates/components/datatables/omniDatatable.js\");\n/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! jquery */ \"jquery\");\n/* harmony import */ var jquery__WEBPACK_IMPORTED_MODULE_1___default = /*#__PURE__*/__webpack_require__.n(jquery__WEBPACK_IMPORTED_MODULE_1__);\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/take.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/is.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/without.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/includes.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/filter.js\");\n/* harmony import */ var ramda__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ramda */ \"./node_modules/ramda/es/append.js\");\n/* harmony import */ var _compareCheckbox_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./compareCheckbox.js */ \"./modules/components/datatable/derivations/omni/compareCheckbox.js\");\nfunction asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }\n\nfunction _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, \"next\", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, \"throw\", err); } _next(undefined); }); }; }\n\n\n\n\n\n\nvar omniTable = function omniTable(_ref) {\n  var adminUser = _ref.adminUser,\n      instance = _ref.instance;\n\n  var fetchData = /*#__PURE__*/function () {\n    var _ref2 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee() {\n      var _instance$store, svIds, salesRepId, statecode, covScore, fiveg, band14, tputText, roamingDependency, zipcode, smId, sortCriteria, legacyPen, postData, response;\n\n      return regeneratorRuntime.wrap(function _callee$(_context) {\n        while (1) {\n          switch (_context.prev = _context.next) {\n            case 0:\n              _instance$store = instance.store, svIds = _instance$store.svIds, salesRepId = _instance$store.salesRepId, statecode = _instance$store.statecode, covScore = _instance$store.covScore, fiveg = _instance$store.fiveg, band14 = _instance$store.band14, tputText = _instance$store.tputText, roamingDependency = _instance$store.roamingDependency, zipcode = _instance$store.zipcode, smId = _instance$store.smId, sortCriteria = _instance$store.sortCriteria, legacyPen = _instance$store.legacyPen;\n\n              if (!(smId === '' && salesRepId === '')) {\n                _context.next = 3;\n                break;\n              }\n\n              return _context.abrupt(\"return\");\n\n            case 3:\n              // $(`#${instance.id} .ui.submit`).addClass('loading');\n              if (svIds) {\n                svIds = '\\'' + svIds.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (salesRepId) {\n                salesRepId = '\\'' + salesRepId.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (statecode) {\n                statecode = '\\'' + statecode.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (covScore) {\n                covScore = '\\'' + covScore.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (fiveg) {\n                fiveg = '\\'' + fiveg.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (band14) {\n                band14 = '\\'' + band14.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (tputText) {\n                tputText = '\\'' + tputText.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (roamingDependency) {\n                roamingDependency = '\\'' + roamingDependency.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (zipcode) {\n                zipcode = '\\'' + zipcode.split(',').join('\\',\\'') + '\\'';\n              }\n\n              if (legacyPen) {\n                legacyPen = '\\'' + legacyPen.split(',').join('\\',\\'') + '\\'';\n              }\n\n              postData = {\n                smId: smId,\n                salesRepId: salesRepId,\n                sortCriteria: sortCriteria,\n                svIds: svIds || '',\n                zipcode: zipcode || '',\n                statecode: statecode || '',\n                covScore: covScore || '',\n                fiveg: fiveg || '',\n                band14: band14 || '',\n                tputText: tputText || '',\n                roamingDependency: roamingDependency || '',\n                limit: \"500\",\n                legacyPen: legacyPen || ''\n              };\n              _context.next = 16;\n              return jquery__WEBPACK_IMPORTED_MODULE_1___default().ajax({\n                url: \"/sales/scoring/Scoring.aspx/TableData\",\n                headers: {\n                  \"Content-Type\": \"application/json\"\n                },\n                type: 'post',\n                data: JSON.stringify(postData),\n                processData: false\n              });\n\n            case 16:\n              response = _context.sent;\n              return _context.abrupt(\"return\", response.d);\n\n            case 18:\n            case \"end\":\n              return _context.stop();\n          }\n        }\n      }, _callee);\n    }));\n\n    return function fetchData() {\n      return _ref2.apply(this, arguments);\n    };\n  }();\n\n  var prependColumns = {\n    data: null,\n    \"defaultContent\": _compareCheckbox_js__WEBPACK_IMPORTED_MODULE_2__.html({\n      adminUser: adminUser,\n      id: instance.id\n    })\n  };\n\n  var attachEventHandlers = /*#__PURE__*/function () {\n    var _ref3 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee2() {\n      return regeneratorRuntime.wrap(function _callee2$(_context2) {\n        while (1) {\n          switch (_context2.prev = _context2.next) {\n            case 0:\n              jquery__WEBPACK_IMPORTED_MODULE_1___default()('#' + instance.id).off().on('draw.dt', function () {\n                jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:checked').prop('checked', false);\n\n                for (var i = 0; i < instance.store.compareSvids.length; i += 1) {\n                  jquery__WEBPACK_IMPORTED_MODULE_1___default()(\"input[type=\\\"checkbox\\\"][rowid=\\\"\".concat(instance.store.compareSvids[i], \"\\\"]\")).prop('checked', true);\n                }\n\n                if (instance.store.compareSvids.length >= 2) {\n                  jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:not(:checked)').attr(\"disabled\", true);\n                } else {\n                  jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:not(:checked)').removeAttr(\"disabled\");\n                }\n              });\n              jquery__WEBPACK_IMPORTED_MODULE_1___default()(\"#\".concat(instance.id, \" tbody\")).on('click', 'tr', function () {\n                var clickedRow = jquery__WEBPACK_IMPORTED_MODULE_1___default()(this).closest('tr');\n                var data = instance.table.row(clickedRow).data(); // we add the currentdatetimestring to trigger the publish of the zoomToPoint event\n\n                instance.store.zoomToPoint = [data.latitude, data.longitude, Date.now().toString()];\n              });\n\n            case 2:\n            case \"end\":\n              return _context2.stop();\n          }\n        }\n      }, _callee2);\n    }));\n\n    return function attachEventHandlers() {\n      return _ref3.apply(this, arguments);\n    };\n  }();\n\n  var initSubscriptions = function initSubscriptions() {\n    instance.stateManager.subscribe(\"tableData\", /*#__PURE__*/function () {\n      var _ref4 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee3(d) {\n        var takeFiveHundred;\n        return regeneratorRuntime.wrap(function _callee3$(_context3) {\n          while (1) {\n            switch (_context3.prev = _context3.next) {\n              case 0:\n                takeFiveHundred = ramda__WEBPACK_IMPORTED_MODULE_3__.default(500, d);\n                _context3.next = 3;\n                return instance.reloadTableData(takeFiveHundred);\n\n              case 3:\n                if (instance.table) {\n                  instance.table.columns.adjust();\n                }\n\n                jquery__WEBPACK_IMPORTED_MODULE_1___default()(window).resize();\n\n              case 5:\n              case \"end\":\n                return _context3.stop();\n            }\n          }\n        }, _callee3);\n      }));\n\n      return function (_x) {\n        return _ref4.apply(this, arguments);\n      };\n    }());\n    instance.stateManager.subscribe(\"removeAllCards\", /*#__PURE__*/function () {\n      var _ref5 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee4(d) {\n        return regeneratorRuntime.wrap(function _callee4$(_context4) {\n          while (1) {\n            switch (_context4.prev = _context4.next) {\n              case 0:\n                jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:checked').prop('checked', false);\n                instance.store.compareSvids = [];\n                jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:not(:checked)').removeAttr(\"disabled\");\n\n              case 3:\n              case \"end\":\n                return _context4.stop();\n            }\n          }\n        }, _callee4);\n      }));\n\n      return function (_x2) {\n        return _ref5.apply(this, arguments);\n      };\n    }());\n    instance.stateManager.subscribe(\"removeCard\", /*#__PURE__*/function () {\n      var _ref6 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee5(d) {\n        return regeneratorRuntime.wrap(function _callee5$(_context5) {\n          while (1) {\n            switch (_context5.prev = _context5.next) {\n              case 0:\n                if (d && !ramda__WEBPACK_IMPORTED_MODULE_4__.default(Array, d)) {\n                  jquery__WEBPACK_IMPORTED_MODULE_1___default()(\"input[type=\\\"checkbox\\\"][rowid=\\\"\".concat(d, \"\\\"]\")).prop('checked', false);\n                  instance.store.compareSvids = ramda__WEBPACK_IMPORTED_MODULE_5__.default([d], instance.store.compareSvids);\n\n                  if (instance.store.compareSvids.length < 2) {\n                    jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:not(:checked)').removeAttr(\"disabled\");\n                  }\n                }\n\n              case 1:\n              case \"end\":\n                return _context5.stop();\n            }\n          }\n        }, _callee5);\n      }));\n\n      return function (_x3) {\n        return _ref6.apply(this, arguments);\n      };\n    }());\n    instance.stateManager.subscribe(\"sortCriteria\", /*#__PURE__*/function () {\n      var _ref7 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee6(d) {\n        var data;\n        return regeneratorRuntime.wrap(function _callee6$(_context6) {\n          while (1) {\n            switch (_context6.prev = _context6.next) {\n              case 0:\n                _context6.next = 2;\n                return fetchData();\n\n              case 2:\n                data = _context6.sent;\n                _context6.next = 5;\n                return instance.reloadTableData(data);\n\n              case 5:\n              case \"end\":\n                return _context6.stop();\n            }\n          }\n        }, _callee6);\n      }));\n\n      return function (_x4) {\n        return _ref7.apply(this, arguments);\n      };\n    }());\n    instance.stateManager.subscribe(\"compareSvid\", /*#__PURE__*/function () {\n      var _ref8 = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee7(d) {\n        var compareEntry;\n        return regeneratorRuntime.wrap(function _callee7$(_context7) {\n          while (1) {\n            switch (_context7.prev = _context7.next) {\n              case 0:\n                compareEntry = \"\".concat(d.svid, \"_\").concat(d.latitude, \"_\").concat(d.longitude);\n\n                if (d && !ramda__WEBPACK_IMPORTED_MODULE_4__.default(Array, d)) {\n                  if (ramda__WEBPACK_IMPORTED_MODULE_6__.default(compareEntry, instance.store.compareSvids)) {\n                    instance.store.compareSvids = ramda__WEBPACK_IMPORTED_MODULE_5__.default([compareEntry], instance.store.compareSvids);\n                    instance.store.cardsData = ramda__WEBPACK_IMPORTED_MODULE_7__.default(function (item) {\n                      return item.id !== compareEntry;\n                    }, instance.store.cardsData);\n\n                    if (instance.store.compareSvids.length < 2) {\n                      jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:not(:checked)').removeAttr(\"disabled\");\n                    }\n                  } else {\n                    if (instance.store.compareSvids.length < 2) {\n                      instance.store.compareSvids = ramda__WEBPACK_IMPORTED_MODULE_8__.default(compareEntry, instance.store.compareSvids);\n                      instance.store.cardsData = ramda__WEBPACK_IMPORTED_MODULE_8__.default({\n                        id: compareEntry,\n                        title: d.svid_name,\n                        description: ''\n                      }, instance.store.cardsData);\n\n                      if (instance.store.compareSvids.length === 2) {\n                        jquery__WEBPACK_IMPORTED_MODULE_1___default()('#chkCompareSvid:not(:checked)').attr(\"disabled\", true);\n                      }\n                    }\n                  }\n                }\n\n                if (instance.store.cardsData.length) {\n                  jquery__WEBPACK_IMPORTED_MODULE_1___default()('.ponderCards.message').removeClass('hidden').addClass('visible');\n                } else {\n                  jquery__WEBPACK_IMPORTED_MODULE_1___default()('.ponderCards.message').removeClass('visible').addClass('hidden');\n                }\n\n              case 3:\n              case \"end\":\n                return _context7.stop();\n            }\n          }\n        }, _callee7);\n      }));\n\n      return function (_x5) {\n        return _ref8.apply(this, arguments);\n      };\n    }());\n  };\n\n  return {\n    headers: \"Rank,Business Name,Sales Manager,Seller,Simple Coverage Score,5G,5G Plus,Speed and Available Capacity,Roaming,FNET,FNET Band 14,Legacy Device Penetration,Address,City,State,Zip\",\n    dataKeys: \"rownum,svid_name,sm_attuid,owning_attuid,coverage_score,fiveg,fiveg_plus,tput_text,roam_text,first_net,band_14,fiber_cust,addr,city,state_y,zipcode\",\n    prependColumns: null,\n    appendColumns: null,\n    initSubscriptions: initSubscriptions,\n    createdCell: function createdCell(td, cellData, rowData, row, col) {\n      if (!isNaN(cellData)) {\n        jquery__WEBPACK_IMPORTED_MODULE_1___default()(td).addClass('center aligned');\n      }\n    },\n    nowrap: true,\n    dataSrc: function dataSrc(result) {\n      return instance.store.filterClusterTable ? ramda__WEBPACK_IMPORTED_MODULE_7__.default(instance.store.filterClusterTable, result.d) : result.d;\n    },\n    dataTableConfig: {\n      searching: true,\n      paging: true,\n      pageLength: 6,\n      // scrollX: true,\n      fixedColumns: {\n        leftColumns: 2\n      },\n      lengthChange: false,\n      \"createdRow\": function createdRow(row, data, index) {\n        var dataTableRow = jquery__WEBPACK_IMPORTED_MODULE_1___default()(row);\n        var checkbox = dataTableRow.find('input[type=\"checkbox\"]');\n        var id = \"\".concat(data.svid, \"_\").concat(data.latitude, \"_\").concat(data.longitude);\n        jquery__WEBPACK_IMPORTED_MODULE_1___default()(checkbox[0]).attr(\"rowid\", id);\n      }\n    },\n    attachEventHandlers: attachEventHandlers,\n    html: _templates_components_datatables_omniDatatable_js__WEBPACK_IMPORTED_MODULE_0__.html\n  };\n};\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (omniTable);\n\n//# sourceURL=webpack://leafletapp/./modules/components/datatable/derivations/omni/omni.js?");

/***/ }),

/***/ "./templates/components/datatables/omniDatatable.js":
/*!**********************************************************!*\
  !*** ./templates/components/datatables/omniDatatable.js ***!
  \**********************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"html\": () => (/* binding */ html)\n/* harmony export */ });\nvar html = function html(_ref) {\n  var id = _ref.id,\n      headers = _ref.headers;\n  return \"\\n  <thead>\\n<tr>\\n\".concat(headers.map(function (header) {\n    return \"<th class=\\\"center aligned\\\">\".concat(header, \"</th>\");\n  }), \"\\n</tr>\\n  </thead>\");\n};\n\n\n\n//# sourceURL=webpack://leafletapp/./templates/components/datatables/omniDatatable.js?");

/***/ }),

/***/ "./node_modules/ramda/es/internal/_xtake.js":
/*!**************************************************!*\
  !*** ./node_modules/ramda/es/internal/_xtake.js ***!
  \**************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _curry2_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./_curry2.js */ \"./node_modules/ramda/es/internal/_curry2.js\");\n/* harmony import */ var _reduced_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./_reduced.js */ \"./node_modules/ramda/es/internal/_reduced.js\");\n/* harmony import */ var _xfBase_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./_xfBase.js */ \"./node_modules/ramda/es/internal/_xfBase.js\");\n\n\n\n\nvar XTake =\n/*#__PURE__*/\nfunction () {\n  function XTake(n, xf) {\n    this.xf = xf;\n    this.n = n;\n    this.i = 0;\n  }\n\n  XTake.prototype['@@transducer/init'] = _xfBase_js__WEBPACK_IMPORTED_MODULE_0__.default.init;\n  XTake.prototype['@@transducer/result'] = _xfBase_js__WEBPACK_IMPORTED_MODULE_0__.default.result;\n\n  XTake.prototype['@@transducer/step'] = function (result, input) {\n    this.i += 1;\n    var ret = this.n === 0 ? result : this.xf['@@transducer/step'](result, input);\n    return this.n >= 0 && this.i >= this.n ? (0,_reduced_js__WEBPACK_IMPORTED_MODULE_1__.default)(ret) : ret;\n  };\n\n  return XTake;\n}();\n\nvar _xtake =\n/*#__PURE__*/\n(0,_curry2_js__WEBPACK_IMPORTED_MODULE_2__.default)(function _xtake(n, xf) {\n  return new XTake(n, xf);\n});\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_xtake);\n\n//# sourceURL=webpack://leafletapp/./node_modules/ramda/es/internal/_xtake.js?");

/***/ }),

/***/ "./node_modules/ramda/es/take.js":
/*!***************************************!*\
  !*** ./node_modules/ramda/es/take.js ***!
  \***************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\n/* harmony import */ var _internal_curry2_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./internal/_curry2.js */ \"./node_modules/ramda/es/internal/_curry2.js\");\n/* harmony import */ var _internal_dispatchable_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./internal/_dispatchable.js */ \"./node_modules/ramda/es/internal/_dispatchable.js\");\n/* harmony import */ var _internal_xtake_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./internal/_xtake.js */ \"./node_modules/ramda/es/internal/_xtake.js\");\n/* harmony import */ var _slice_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./slice.js */ \"./node_modules/ramda/es/slice.js\");\n\n\n\n\n/**\n * Returns the first `n` elements of the given list, string, or\n * transducer/transformer (or object with a `take` method).\n *\n * Dispatches to the `take` method of the second argument, if present.\n *\n * @func\n * @memberOf R\n * @since v0.1.0\n * @category List\n * @sig Number -> [a] -> [a]\n * @sig Number -> String -> String\n * @param {Number} n\n * @param {*} list\n * @return {*}\n * @see R.drop\n * @example\n *\n *      R.take(1, ['foo', 'bar', 'baz']); //=> ['foo']\n *      R.take(2, ['foo', 'bar', 'baz']); //=> ['foo', 'bar']\n *      R.take(3, ['foo', 'bar', 'baz']); //=> ['foo', 'bar', 'baz']\n *      R.take(4, ['foo', 'bar', 'baz']); //=> ['foo', 'bar', 'baz']\n *      R.take(3, 'ramda');               //=> 'ram'\n *\n *      const personnel = [\n *        'Dave Brubeck',\n *        'Paul Desmond',\n *        'Eugene Wright',\n *        'Joe Morello',\n *        'Gerry Mulligan',\n *        'Bob Bates',\n *        'Joe Dodge',\n *        'Ron Crotty'\n *      ];\n *\n *      const takeFive = R.take(5);\n *      takeFive(personnel);\n *      //=> ['Dave Brubeck', 'Paul Desmond', 'Eugene Wright', 'Joe Morello', 'Gerry Mulligan']\n * @symb R.take(-1, [a, b]) = [a, b]\n * @symb R.take(0, [a, b]) = []\n * @symb R.take(1, [a, b]) = [a]\n * @symb R.take(2, [a, b]) = [a, b]\n */\n\nvar take =\n/*#__PURE__*/\n(0,_internal_curry2_js__WEBPACK_IMPORTED_MODULE_0__.default)(\n/*#__PURE__*/\n(0,_internal_dispatchable_js__WEBPACK_IMPORTED_MODULE_1__.default)(['take'], _internal_xtake_js__WEBPACK_IMPORTED_MODULE_2__.default, function take(n, xs) {\n  return (0,_slice_js__WEBPACK_IMPORTED_MODULE_3__.default)(0, n < 0 ? Infinity : n, xs);\n}));\n\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (take);\n\n//# sourceURL=webpack://leafletapp/./node_modules/ramda/es/take.js?");

/***/ })

}]);