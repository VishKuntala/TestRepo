import $ from "jquery";
import * as R from "ramda";
import Papa from 'papaparse';
import { saveAs } from 'file-saver';
import { fromEvent } from 'rxjs';
import { debounceTime } from 'rxjs/operators';
import { config } from "../config/config.js";
import { buildPayloadFromStore } from "../../../../../helpers/remoteData.js";

const tenantTable = ({ adminUser, instance }) => {
    const initSubscriptions = async () => {
        instance.stateManager.subscribe("updateTenantTableData", async (d) => {
            if (d && d.length) {
                const tableConfiguration = config.tables.tenants[instance.store.channelCode];
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

                $('#tenantTableTab').css('pointer-events', 'auto');
                $('#tenantTableLoader').css('visibility', 'visible');
                instance.coords = d;
                instance.existingCoords = R.clone(d);
                // const res = await instance.postData(`${instance.store.config.baseUrl}/tenants`, { mikeys: d });
                // instance.tableData = res.data;
                // instance.cellAlignments = R.map(item => !isNaN(instance.tableData?.[0]?.[item]) ? 'center' : 'right', instance.dataKeys);
                await instance.renderTable();
                $('#tenantTableLoader').css('visibility', 'hidden ');
                $(".filter-table-panel-menu.menu .item").tab('change tab', 'tenantTable');

            }
            else {
                $('#tenantTableTab').css('pointer-events', 'none');
            }
            instance.store.fetchingTenantData = false;
            instance.coords = null;
            
        });

        instance.stateManager.subscribe("updateTenantTableDataForBuilding", async (d) => {
            if (d.id || d.censusBlockId || d.mduId) {
                const tableConfiguration = config.tables.tenants[instance.store.channelCode];
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

                $('#tenantTableTab').css('pointer-events', 'auto');
                $('#tenantTableLoader').css('visibility', 'visible');
                instance.mikeys = d.id;
                instance.censusBlockId = d.censusBlockId;
                instance.mduId = d.mduId;
                // const res = await instance.postData(`${instance.store.config.baseUrl}/tenants`, { mikeys: d });
                // instance.tableData = res.data;
                // instance.cellAlignments = R.map(item => !isNaN(instance.tableData?.[0]?.[item]) ? 'center' : 'right', instance.dataKeys);
                await instance.renderTable();
                $('#tenantTableLoader').css('visibility', 'hidden ');
            }
            else {
                $('#tenantTableTab').css('pointer-events', 'none');
            }
            instance.store.fetchingTenantData = false;
            instance.censusBlockId = null;
            instance.mduId = null;
            instance.mikeys = null;
        });

        instance.stateManager.subscribe("exportTenantTableForBuilding", async (d) => {
            if (d.id || d.censusBlockId || d.mduId) {
                $(".filter-table-panel-menu.menu .item").tab('change tab', 'tenantTable');
                instance.store.updateTenantTableDataForBuilding = d;
                $(".clearBuilding").removeClass("ponderHidden");
                if (d.censusBlockId) {
                    $(".clearBuilding").text('Clear Census Block');
                } else if (d.mduId) {
                    $(".clearBuilding").text('Clear MDU');
                } else {
                    $(".clearBuilding").text(`${instance.store.config.tabs?.[0]?.clearLabel || 'Clear Building'}`);
                }
               
            }
        });

        instance.stateManager.subscribe("clearBuilding", async (d) => {
            if (typeof d === "string") {
                $(`#${instance.id} button.clearBuilding`).click();
            }
        });

    };


    const exportTenantData = async () => {
        $("body").toast({
            class: "success",
            showIcon: "arrow circle down",
            displayTime: 5000,
            message:
                "Your file is being generated and will be downloaded when ready. You can continue to use the application",
        });
        const postData = Object.assign(buildPayloadFromStore(instance), { coords: instance.submittedCoords, mikeys: instance.submittedMikeys, censusBlockId: instance.submittedCensusBlockId, mduId: instance.submittedMduId } );
        const res = await instance.postData(`${instance.store.config.baseUrl}/tenants`, postData);
        //const csv = Papa.unparse(R.map(item => R.omit(
        //    ['etag', 'partitionKey', 'rowKey', 'timestamp'],
        //    item), res.data));        
        /* const csv = Papa.unparse({
            "fields": config.tables.tenants[instance.store.channelCode].headers, "data": R.map(item => R.values(R.omit(
                R.concat(['etag', 'partitionKey', 'rowKey', 'timestamp'], config.tables.tenants[instance.store.channelCode].dataTableExportOmitKeys || []),
                R.pick(config.tables.tenants[instance.store.channelCode].dataKeys,item))), res.data)
        }); */
        const headers = [];
        for (let i = 0; i < config.tables.tenants[instance.store.channelCode].dataKeys.length; i += 1) {
        if (!R.includes(config.tables.tenants[instance.store.channelCode].dataKeys[i], config.tables.tenants[instance.store.channelCode].dataTableExportOmitKeys)) {
                headers.push(config.tables.tenants[instance.store.channelCode].headers[i]);
            }
        }
        const defaultDatakeysObject = {};
        R.map(h => defaultDatakeysObject[h] = "", config.tables.tenants[instance.store.channelCode].dataKeys);
        const csv = Papa.unparse({
            "fields": headers, "data": R.map(item => {
                const itemWithNullDefaults = R.mergeRight(defaultDatakeysObject, item);
                return R.values(R.omit(
                    R.concat(['etag', 'partitionKey', 'rowKey', 'timestamp'], config.tables.tenants[instance.store.channelCode].dataTableExportOmitKeys || []),
                    R.pick(config.tables.tenants[instance.store.channelCode].dataKeys, itemWithNullDefaults)))
            }, res.data)
        });
        const blob = new Blob([csv], {
            type: "text/plain;charset=utf-8",
        });
        saveAs(blob, "BusinessDataExport.csv");
    }


    const attachEventHandlers = async () => {

        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", async function () {
                await exportTenantData();
            });
       
        $(`#${instance.id} button.clearBuilding`)
            .off()
            .on("click", function () {
                if (instance.store.geoEntity !== "censusBlocks") {
                    instance.table.clearData();
                } else {
                    instance.store.updateTenantTableData = instance.existingCoords;
                }
                $(".clearBuilding").addClass("ponderHidden");

            });
    };

    const getAjaxParams = () => {
        return Object.assign(buildPayloadFromStore(instance),
            { buildSortColumns: true, coords: instance.coords, mikeys: instance.mikeys, censusBlockId: instance.censusBlockId, mduId: instance.mduId }
        );
    }

    const getAjaxUrl = () => `${instance.store.config.baseUrl}/tenants`;


    return {
        attachEventHandlers,
        sortingDisabled: true,
        frozenDataKeys: config.tables.tenants[instance.store.channelCode].frozenDataKeys,
        hiddenColumns: config.tables.tenants[instance.store.channelCode].hiddenColumns,
        dataKeys: config.tables.tenants[instance.store.channelCode].dataKeys,
        headers: config.tables.tenants[instance.store.channelCode].headers,
        prependColumns: [{
            title: 'Map',
            formatter: function (cell, formatterParams, onRendered) {
                return `<button class="blue ui mini icon button">
                            <i data-publish-attr="zoomToPoint" class="map marker alternate icon"></i>
                       </button>`
            },
            width: 60,
            headerSort: false,
            align: "center", cellClick: async (e, cell) => {
                $("div.toast-box").remove();
                const rowData = cell.getRow().getData();
                const { data } = await instance.getData(
                    `${instance.store.config.baseUrl}/location/${rowData.mikey || rowData.id}`,
                );
                instance.store.openPopup = Object.assign(data[0], {
                    lat: rowData.latitude,
                    lng: rowData.longitude
                });
            }
        }, {
                title: 'Info',
                formatter: function (cell, formatterParams, onRendered) {
                    return `<button class="blue ui mini icon rowpopup button" data-title="Using click events" data-content="Clicked popups will close if you click away, but not if you click inside the popup">
                            <i data-publish-attr="dataPopup" class="plus alternate icon"></i>
                       </button>`
                },
                width: 60,
                headerSort: false,
                align: "center", cellClick: function (e, cell) {
                    const rowData = cell.getRow().getData();
                    $("div.toast-box").remove();
                    $('body')
                        .toast({
                            context: $('#tenantTable'),
                            displayTime: 0,
                            closeIcon: true,
                            compact: false,
                            message: config.tables.tenants[instance.store.channelCode].popupMessageKey(rowData)
                        });
                        
                }
            }],
        dataTableConfig: {
            minHeight: 500,
            headerHozAlign: "center",
            pagination: config.tables.tenants[instance.store.channelCode].pagination,
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
            ajaxResponse: (url, params, response) => {
                // $("#tenantTableTab").html(`<i class="address card outline icon"></i> Business Tenants (${new Intl.NumberFormat().format(response.locationCount)})`);
                $("#tenantTableTab").html(`<i class=${instance.store.config.tabs?.[1]?.icon || "address card outline icon"}></i> ${instance.store.config.tabs?.[1]?.label || 'Business Tenants'} (${new Intl.NumberFormat().format(response.locationCount)})`);
                $("#tenantTableTab").css('pointer-events','auto');    
                instance.submittedCoords = params.coords;
                instance.submittedMikeys = params.mikeys;
                instance.submittedCensusBlockId = params.censusBlockId;
                instance.submittedMduId = params.mduId;
                return response;
            },
            paginationDataSent: {
                "page": "offset",
                "size": "limit"
            },
            footerElement:
                config.tables["tenants"].footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
    };
};

export default tenantTable;
