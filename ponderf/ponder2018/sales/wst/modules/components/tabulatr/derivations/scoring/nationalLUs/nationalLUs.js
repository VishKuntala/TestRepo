import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";
import { config } from "../config/config.js";




const nationalLUsTable = ({ adminUser, instance }) => {

    const updateTable = async d => {
        const tableConfiguration = config.tables.nationalLUs;
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
        const tableConfiguration = config.tables.nationalLUs;
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
        frozenDataKeys: config.tables.nationalLUs.frozenDataKeys,
        hiddenColumns: config.tables.nationalLUs.hiddenColumns,
        dataKeys: config.tables.nationalLUs.dataKeys,
        headers: config.tables.nationalLUs.headers,
        dataTableConfig: {
            ajaxResponse: function (url, params, response) {
                if (response.locationCount) {
                    $("#mainTableTab").html(`${instance.store.config.toolName} Locations (${new Intl.NumberFormat().format(response.locationCount)})`)
                }
                return response;
            },
            headerHozAlign: "center",
            pagination: config.tables.nationalLUs.pagination,
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
                config.tables.nationalLUs.rowClick(instance, data);
            },
            footerElement: config.tables.nationalLUs.footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
        updateTable,
        filterTable,
    };
}

export default nationalLUsTable;

