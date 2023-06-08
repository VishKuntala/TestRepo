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
                const tableConfiguration = config.tables.tenants;
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
                instance.mikeys = d;
                instance.existingMiKeys = R.clone(d);
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

        });

        instance.stateManager.subscribe("updateTenantTableDataForBuilding", async (d) => {
            if (d.id || d.censusBlockId) {
                const tableConfiguration = config.tables.tenants;
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
        });

        instance.stateManager.subscribe("exportTenantTableForBuilding", async (d) => {
            if (d.id || d.censusBlockId) {
                $(".filter-table-panel-menu.menu .item").tab('change tab', 'tenantTable');
                instance.store.updateTenantTableDataForBuilding = d;
                $(".clearBuilding").removeClass("ponderHidden");
                if (d.censusBlockId) {
                    $(".clearBuilding").text('Clear Census Block');
                } else {
                    $(".clearBuilding").text('Clear Building');
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
        const postData = Object.assign(buildPayloadFromStore(instance), { mikeys: instance.mikeys, censusBlockId: instance.censusBlockId });
        const res = await instance.postData(`${instance.store.config.baseUrl}/tenants`, postData);
        //const csv = Papa.unparse(R.map(item => R.omit(
        //    ['etag', 'partitionKey', 'rowKey', 'timestamp'],
        //    item), res.data));
        /* const csv = Papa.unparse({
            "fields": config.tables.tenants.headers, "data": R.map(item => R.values(R.omit(
                R.concat(['etag', 'partitionKey', 'rowKey', 'timestamp'], config.tables.tenants.dataTableExportOmitKeys || []),
                item)), res.data)
        }); */
        const defaultDatakeysObject = {};
        R.map(h => defaultDatakeysObject[h] = "", config.tables.tenants.dataKeys);
        const csv = Papa.unparse({
            "fields": config.tables.tenants.headers, "data": R.map(item => {
                const itemWithNullDefaults = R.mergeRight(defaultDatakeysObject, item);
                return R.values(R.omit(
                    R.concat(['etag', 'partitionKey', 'rowKey', 'timestamp'], config.tables.tenants.dataTableExportOmitKeys || []),
                    R.pick(config.tables.tenants.dataKeys, itemWithNullDefaults)))
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
                    instance.store.updateTenantTableData = instance.existingMiKeys;
                }
                $(".clearBuilding").addClass("ponderHidden");

            });
    };

    const getAjaxParams = () => {
        return Object.assign(buildPayloadFromStore(instance),
            { buildSortColumns: true, mikeys: instance.mikeys, censusBlockId: instance.censusBlockId }
        );
    }

    const getAjaxUrl = () => `${instance.store.config.baseUrl}/tenants`;


    return {
        attachEventHandlers,
        sortingDisabled: true,
        frozenDataKeys: config.tables.tenants.frozenDataKeys,
        hiddenColumns: config.tables.tenants.hiddenColumns,
        dataKeys: config.tables.tenants.dataKeys,
        headers: config.tables.tenants.headers,
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
                    `${instance.store.config.baseUrl}/location/${rowData.mikey}`,
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
                        message: `<b>Owning Segment Name:</b> ${rowData.segment_name}
                                 <br/><b>Owning Sales Center ID:</b> ${rowData.owning_sales_center_id}
                                 <br/><b>Owning Module:</b> ${rowData.owning_module}
                                 <br/><b>Customer Status:</b> ${rowData.loc_cust_prosp}
                                 <br/><b>Customer ID Type:</b> ${rowData.co_id_type}
                                 <br/><b>Customer ID Number:</b> ${rowData.co_id}
                                 <br/><b>Business Name:</b> ${rowData.bc_company_nm}
                                 <br/><b>Business Address:</b> ${rowData.bc_company_street_address}, ${rowData.bc_company_city}, ${rowData.bc_company_state} ${rowData.bc_company_zip}
                                 <br/><b>miKey:</b> ${rowData.mikey}
                                 <br/><b>Total Fiber Ports:</b> ${rowData.tot_fiber_ports}
                                 <br/><b>ADI Ports:</b> ${rowData.adi_ports} - <b>ABF Ports:</b> ${rowData.abf_ports} - <b>GPON Ports:</b> ${rowData.gpon_ports}
                                 <br/><b>U-verse Ports:</b> ${rowData.bb_uverse_ports} - <b>IPDSL Ports:</b> ${rowData.bb_ipdsl_ports} - <b>DSL Ports:</b> ${rowData.bb_dsl_ports}
                                 <br/><b>Classic ASE Ports:</b> ${rowData.ase_ports} - <b>ASENOD Ports:</b> ${rowData.ase_nod_ports}
                                `
                    });

            }
        }],
        dataTableConfig: {
            minHeight: 500,
            headerHozAlign: "center",
            pagination: config.tables.tenants.pagination,
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
            footerElement:
                config.tables["tenants"].footerElement,
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
    };
};

export default tenantTable;
