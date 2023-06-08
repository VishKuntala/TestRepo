import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";
import { config } from "../config/config.js";




const midmarketTable = ({ adminUser, instance }) => {


    const updateTable = async d => {
        const tableConfiguration = config.tables.midmarket;
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
        const tableConfiguration = config.tables.midmarket;
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
            const tableConfiguration = config.tables.midmarket;
                const searchText = R.trim($("#txtTableSearch").val().toLowerCase());
                if (searchText === '') {
                    instance.table.clearFilter();
                } else {
                    instance.table.setFilter(tableConfiguration.tableFilters ? tableConfiguration.tableFilters(searchText) : []);
                }
            // }
        }); */
    };


    const getAjaxParams = () => Object.assign(buildPayloadFromStore(instance), { buildSortColumns: true });

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
        frozenDataKeys: config.tables.midmarket.frozenDataKeys,
        hiddenColumns: config.tables.midmarket.hiddenColumns,
        dataKeys: config.tables.midmarket.dataKeys,
        headers: config.tables.midmarket.headers,
        dataTableConfig: {
            ajaxResponse: function (url, params, response) {
                if (response.locationCount) {
                    $("#mainTableTab").html(`${instance.store.config.toolName} Locations (${new Intl.NumberFormat().format(response.locationCount)})`)
                }
                return response;
            },
            headerHozAlign: "center",
            pagination: config.tables.midmarket.pagination,
            paginationSize: 8,
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
            rowClick: function (e, row) {
                const data = row.getData();
                config.tables.midmarket.rowClick(instance, data);
            },
            footerElement: config.tables.midmarket.footerElement,
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

export default midmarketTable;

