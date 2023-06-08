/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
(self["webpackChunkleafletapp"] = self["webpackChunkleafletapp"] || []).push([["modules_components_map_derivations_fetchAllDataWorker_js"],{

/***/ "./modules/components/map/derivations/fetchAllDataWorker.js":
/*!******************************************************************!*\
  !*** ./modules/components/map/derivations/fetchAllDataWorker.js ***!
  \******************************************************************/
/***/ (() => {

eval("onmessage = function onmessage(e) {\n  console.log('Worker: Message received from main script');\n  console.log(e);\n  var xhr = new XMLHttpRequest();\n\n  var requestComplete = function requestComplete() {\n    if (xhr.readyState === XMLHttpRequest.DONE) {\n      if (xhr.status === 200) {\n        var response = JSON.parse(xhr.responseText);\n        console.log(response);\n        postMessage(response.d);\n      }\n    }\n  };\n\n  xhr.open('post', \"\".concat(e.data.baseUrl, \"/TableData\"));\n  xhr.setRequestHeader(\"Content-Type\", \"application/json;charset=UTF-8\");\n  xhr.onreadystatechange = requestComplete;\n  xhr.send(JSON.stringify(e.data.postData));\n};\n\n//# sourceURL=webpack://leafletapp/./modules/components/map/derivations/fetchAllDataWorker.js?");

/***/ })

}]);