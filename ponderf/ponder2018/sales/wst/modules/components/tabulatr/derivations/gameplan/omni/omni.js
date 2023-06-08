import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";
import { config } from "../config/config.js";



const omniTable = ({ adminUser, instance }) => {

    const updateTable = async d => {
        const tableConfiguration = config.tables.omni;
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
        const tableConfiguration = config.tables.omni;
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
        sortingDisabled: true,
        frozenDataKeys: config.tables.omni.frozenDataKeys,
        hiddenColumns: config.tables.omni.hiddenColumns,
        dataKeys: config.tables.omni.dataKeys,
        headers: config.tables.omni.headers,
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
                    lat: rowData.latitude,
                    lng: rowData.longitude,
                    addMarker: false,
                    addPoup: true,
                });
            }
        }],
        dataTableConfig: {
            ajaxResponse: function (url, params, response) {
                if (response.locationCount) {
                    $("#mainTableTab").html(`${instance.store.config.toolName} Locations (${new Intl.NumberFormat().format(response.locationCount)})`)
                }
                return response;
            },
            headerHozAlign: "center",
            pagination: config.tables.omni.pagination,
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
            footerElement: config.tables.omni.footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
        updateTable,
        filterTable,
    };


}

export default omniTable;

