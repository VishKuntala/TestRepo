import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";
import { config } from "../config/config.js";
import { config as mapconfig } from "../../../../maplibre/derivations/mainMap/config/config.js";





const ch8DemoTable = ({ adminUser, instance }) => {


    const updateTable = async d => {
        const tableConfiguration = config.tables.ch8Demo;
        const {
            dataKeys,
            headers,
            frozenDataKeys,
            hiddenColumns,
            footerElement,
            dataTableExportOmitKeys,
        } = tableConfiguration;
        instance.derivedClass.dataKeys = dataKeys;
        instance.derivedClass.headers = headers;
        instance.derivedClass.frozenDataKeys = frozenDataKeys;
        instance.derivedClass.hiddenColumns = hiddenColumns;
        instance.derivedClass.dataTableConfig.footerElement = footerElement(instance.isExportAllowed());
        instance.derivedClass.dataTableExportOmitKeys = dataTableExportOmitKeys;
        await instance.renderTable();
        /* instance.store.filterTotalCount = true;
        $(`#heatMapDropdown`).dropdown('set value', 'locationDensity');
        if (instance.store.heatmap === 'locationDensity') {
            instance.store.updateLayers = `${Date.now().toString()}`;
        } */
        // trigger chart rendering
        instance.store.renderChart = buildPayloadFromStore(instance);

    }

    const filterTable = async () => {
        const tableConfiguration = config.tables.ch8Demo;
        const searchText = R.trim($("#txtTableSearch").val().toLowerCase());
        if (searchText === '') {
            instance.table.clearFilter();
        } else {
            instance.table.setFilter(tableConfiguration.tableFilters ? tableConfiguration.tableFilters(searchText) : []);
        }
    }

    const initSubscriptions = async () => {

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters 
        //    const SearchInputkeyUps = fromEvent($("#txtTableSearch"), 'keyup');
        //    const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        /*  searchInputkeyUp.subscribe(x => {
              // if (instance.store.currentTab === instance.id) {
              const tableConfiguration = config.tables.ch8Demo;
                  const searchText = R.trim($("#txtTableSearch").val().toLowerCase());
                  if (searchText === '') {
                      instance.table.clearFilter();
                  } else {
                      instance.table.setFilter(tableConfiguration.tableFilters ? tableConfiguration.tableFilters(searchText) : []);
                  }
              // }
          }); */
    };


    const getAjaxParams = () => {
        return Object.assign(buildPayloadFromStore(instance),
            { buildSortColumns: true }
        );
    }

    const getAjaxUrl = () => `${instance.store.config.baseUrl}/table`;

    const attachEventHandlers = async () => {
        $('#btnExportAll')
            .off().on('click', function () {
                // trigger exportMapData event
                instance.store.exportMapData = `${Date.now().toString()}`;
            });

        $('#btnExportTopLocations')
            .off().on('click', async function () {
                await instance.exportTableData();
            });
    }

    return {
        sortingDisabled: true,
        frozenDataKeys: config.tables.ch8Demo.frozenDataKeys,
        hiddenColumns: config.tables.ch8Demo.hiddenColumns,
        dataKeys: config.tables.ch8Demo.dataKeys,
        headers: config.tables.ch8Demo.headers,
        prependColumns: [{
            title: 'Zoom Map',
            formatter: function (cell, formatterParams, onRendered) {
                return `<button class="blue ui mini icon button">
                            <i data-publish-attr="zoomToPoint" class="map marker alternate icon"></i>
                       </button>`
            },
            width: 60,
            headerSort: false,
            align: "center", cellClick: async (e, cell) => {
                const rowData = cell.getRow().getData();
                const { data } = await instance.getData(
                    `${instance.store.config.baseUrl}/location/${rowData.mikey}`,
                );
                instance.store.zoomToPoint = Object.assign(data[0], {
                    zoom: mapconfig.pointsLayers.WS_POINTS.minZoom + 1,
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });
            }
        }],
        dataTableConfig: {
            ajaxURLGenerator: function (url, config, params) {
                //url - the url from the ajaxURL property or setData function
                //config - the request config object from the ajaxConfig property
                //params - the params object from the ajaxParams property, this will also include any pagination, filter and sorting properties based on table setup
                //return request url
                return url;
            },
            ajaxResponse: function (url, params, response) {
                if (response.locationCount) {
                    $("#mainTableTab").html(`<i class="building icon"></i>Building Locations (${new Intl.NumberFormat().format(response.businessCount < 5000 ? response.businessCount : 5000 )})`);
                    $("#addlInfo1").html(`<div>Total Building Locations (as filtered): ${new Intl.NumberFormat().format(response.businessCount)}</div>`);
                    $("#addlInfo2").html(`<div>Total Business Tenants (as filtered): ${new Intl.NumberFormat().format(response.locationCount)}</div>`);
                }
                return response;
            },
            headerHozAlign: "center",
            pagination: config.tables.ch8Demo.pagination,
            paginationSize: 12,
            ajaxContentType: "json",
            ajaxSorting: true,
            ajaxFiltering: true,
            ajaxConfig: {
                method: "post",
                headers: {
                    Authorization: $("#hdnToken").val(),
                }
            },
            paginationDataSent: {
                "page": "offset",
                "size": "limit"
            },
            footerElement: config.tables.natLus.footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
        updateTable,
        filterTable,
    };

    /* return {
        attachEventHandlers,
        frozenDataKeys : ['rownum', 'svid_name'],
        dataTableConfig: {
            tableBuilt: function () {
                instance.implementAuthRules();
                if (instance.store.mapDataLength > instance.store.config.tableRecordsLimit && !$(".tabulator-footer #btnExportTopLocations").is(":hidden")) {
                    $(".tabulator-footer #btnExportTopLocations").show();
                } else {
                    $(".tabulator-footer #btnExportTopLocations").hide();
                }

            },
            headerHozAlign: "center",
            pagination: "local",
            paginationSize: 5,
            rowClick: function (e, row) {
                const data = row.getData();
                // we add the currentdatetimestring to trigger the publish of the zoomToPoint event
                instance.store.zoomToPoint = [data.latitude, data.longitude, Date.now().toString()];
            },
            footerElement: `<button id="btnExportAll" class="ui blue mini left floated button">Export All</button>
                            <button id="btnExportTopLocations"  class="ui blue mini left floated button">Export Top ${instance.store.config.tableRecordsLimit}</button>`

        }
    } */
}

export default ch8DemoTable;

