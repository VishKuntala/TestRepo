import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";
import { config } from "../config/config.js";



const nbwcTable = ({ adminUser, instance }) => {


    const updateTable = async d => {
        const tableConfiguration = config.tables.nbwc;
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
        // trigger chart rendering
        instance.store.renderChart = buildPayloadFromStore(instance);
    }

    const filterTable = async () => {
        const tableConfiguration = config.tables.nbwc;
        const searchText = R.trim($("#txtTableSearch").val().toLowerCase());
        if (searchText === '') {
            instance.table.clearFilter();
        } else {
            instance.table.setFilter(tableConfiguration.tableFilters ? tableConfiguration.tableFilters(searchText) : []);
        }
    }

    const initSubscriptions = async () => { };

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
        frozenDataKeys: config.tables.nbwc.frozenDataKeys,
        hiddenColumns: config.tables.nbwc.hiddenColumns,
        dataKeys: config.tables.nbwc.dataKeys,
        headers: config.tables.nbwc.headers,
        dataTableConfig: {
            ajaxResponse: function (url, params, response) {
                if (response.locationCount) {
                    $("#mainTableTab").html(`${instance.store.config.toolName} Locations (${new Intl.NumberFormat().format(response.locationCount)})`)
                }
                return response;
            },
            headerHozAlign: "center",
            pagination: config.tables.nbwc.pagination,
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
                config.tables.nbwc.rowClick(instance, data);
            },
            footerElement: config.tables.nbwc.footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
        updateTable,
        filterTable,
    };


}

export default nbwcTable;

