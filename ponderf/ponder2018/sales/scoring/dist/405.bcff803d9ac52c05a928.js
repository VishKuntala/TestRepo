(self.webpackChunkleafletapp=self.webpackChunkleafletapp||[]).push([[405],{8405:(t,n,o)=>{"use strict";o.r(n),o.d(n,{default:()=>c});var e=o(3609),r=o.n(e);function a(t,n,o,e,r,a,i){try{var c=t[a](i),u=c.value}catch(t){return void o(t)}c.done?n(u):Promise.resolve(u).then(e,r)}function i(t){return function(){var n=this,o=arguments;return new Promise((function(e,r){var i=t.apply(n,o);function c(t){a(i,e,r,c,u,"next",t)}function u(t){a(i,e,r,c,u,"throw",t)}c(void 0)}))}}const c=function(t){t.adminUser;var n=t.instance;return{attachEventHandlers:function(){var t=i(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:r()("#btnExportAll").off().on("click",(function(){n.store.exportMapData="".concat(Date.now().toString())})),r()("#btnExportTopLocations").off().on("click",i(regeneratorRuntime.mark((function t(){return regeneratorRuntime.wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,n.exportTableData();case 2:case"end":return t.stop()}}),t)}))));case 2:case"end":return t.stop()}}),t)})));return function(){return t.apply(this,arguments)}}(),frozenDataKeys:["rownum","campaign_name","contact_company_nm"],dataTableConfig:{tableBuilt:function(){n.store.mapDataLength>n.store.config.tableRecordsLimit?r()(".tabulator-footer #btnExportTopLocations").show():r()(".tabulator-footer #btnExportTopLocations").hide()},headerHozAlign:"center",pagination:"local",paginationSize:5,rowClick:function(t,o){var e=o.getData();n.store.zoomToPoint=[e.latitude,e.longitude,Date.now().toString()]},footerElement:'<button id="btnExportAll" class="ui blue mini left floated button">Export All</button>\n                            <button id="btnExportTopLocations"  class="ui blue mini left floated button">Export Top '.concat(n.store.config.tableRecordsLimit,"</button>")}}}}}]);