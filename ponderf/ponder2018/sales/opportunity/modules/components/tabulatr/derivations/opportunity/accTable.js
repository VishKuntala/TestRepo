import $ from "jquery";
import * as R from "ramda";
import { fromEvent } from "rxjs";
import { debounceTime } from "rxjs/operators";
import { config } from "./config/config.js";
import { config as mapConfig } from "../../../azureMap/derivations/mainMap/config/config.js";
import Papa from "papaparse";
import { saveAs } from "file-saver";
import { reloadTableDataUsingSearchInput } from "./utils/utils.js";

const accTable = ({ instance }) => {
    const {
        frozenDataKeys,
        hiddenColumns,
        dataKeys,
        accExportDataKeysMap,        
        accUnitsExportDataKeysMap,
        headers,
        pagination,
        footerElement,
    } = config.tables.accs;

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    const exportACCs = async () => {
        if (instance.tableData) {
            const exportKeys = R.keys(accExportDataKeysMap); // get keys to be exported from config
            let exportData = R.map((x) => R.pick(exportKeys, x), instance.tableData) // pick only specific keys from exportData            
            //log event
            const exportProperties = R.uniq(exportData.map(x => x.acc_mstr_prpty_id)).toString();
            const params = {
                userID: instance.store.userId,
                eventType: "accTable_export",
                logDataType: "Property",
                logData: exportProperties
            };
            await instance.postData(
                `${instance.store.baseApiUrl}/log/event`,
                params
            );
            //export data
            exportData = R.map(renameDataKeys(accExportDataKeysMap), exportData); //rename keys before export
            const csv = Papa.unparse(exportData);
            const blob = new Blob([csv], {
                type: "text/plain;charset=utf-8",
            });
            saveAs(blob, `TableDataExport.csv`);
        }
    };

    const exportAllACCUnits = async () => {
        if (instance.store.accMapData && instance.store.accMapData.length) {
            const exportKeys = R.keys(accUnitsExportDataKeysMap); // get keys to be exported from config
            let exportData = R.map((x) => R.pick(exportKeys, x), instance.store.accMapData).filter((x) => Boolean(x.acc_mstr_prpty_id)) // pick only specific keys from exportData and filter MDUs with undefined acc_mstr_prpty_id                       
            if (exportData) {
                //log export event
                const exportProperties = R.uniq(exportData.map(x => x.zip_co_psa)).toString();
                const params = {
                    userID: instance.store.userId,
                    eventType: "accTable_all_units_export",
                    logDataType: "PSA",
                    logData: exportProperties
                };
                await instance.postData(
                    `${instance.store.baseApiUrl}/log/event`,
                    params
                );
                //export data
                exportData = R.map(renameDataKeys(accUnitsExportDataKeysMap), exportData); //rename keys before export
                const csv = Papa.unparse(exportData);
                const blob = new Blob([csv], {
                    type: "text/plain;charset=utf-8",
                });
                saveAs(blob, `TableDataExport.csv`);
            }
        }
    };

    const initSubscriptions = async () => {
        instance.stateManager.subscribe("accMapData", async d => {
            // app intial load event
            if (d && R.is(Array, d) && d.length == 0) {
                $('#accTableTab').css('pointer-events', 'none'); //disable accTableTab pointer-events
                if (instance.table)
                    instance.table.setData([]);
                return;
            }
            $('#accTableTab').css('pointer-events', 'auto');
            //filter duplicate lat and lang
            let filteredACCs = R.uniqBy(R.prop("longitude"), (R.uniqBy(R.prop("latitude"), d)));
            //filter undefined acc_mstr_prpty_id 
            filteredACCs = filteredACCs.filter((x) => Boolean(x.acc_mstr_prpty_id));
            //filter duplicate acc_mstr_prpty_id
            filteredACCs = R.uniqBy(R.prop("acc_mstr_prpty_id"), filteredACCs);
            if (filteredACCs && filteredACCs.length) {
                const pickDataKeys = (x) => R.pick(dataKeys, x);
                filteredACCs = R.map(pickDataKeys, filteredACCs); //pick specific dataKeys
                instance.tableData = filteredACCs;
                instance.cellAlignments = R.map(
                    item =>
                        !isNaN(instance.tableData?.[0]?.[item])
                            ? "center"
                            : "right",
                    instance.dataKeys
                );
                await instance.renderTable();
            }
            else {
                $('#accTableTab').css('pointer-events', 'none');
            }
        });

        instance.stateManager.subscribe("switchToMainTableTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return;            
            if (instance.store.currentZoom < mapConfig.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom) {
                $('#accTableTab').css('pointer-events', 'none'); //disable accTableTab pointer-events
                if (instance.table)
                    instance.table.setData([]);
                return;
            }
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), "keyup");
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => reloadTableDataUsingSearchInput(instance, "accs")); //pass tableName
    };

    const attachEventHandlers = async () => {
        // hide "Export Units" and "Export All Units" buttons for limited users
        if (instance.store.accessLevel !== 'Unlimited') {
            $(".export-all-acc-units.button").hide();
            $(".export-acc-units.button").hide();
        }
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", () => exportACCs());
        $(".export-acc-units")
            .off()
            .on("click", () => exportAllACCUnits());
    };

    return {
        attachEventHandlers,
        frozenDataKeys,
        hiddenColumns,
        dataKeys,
        headers,
        prependColumns: [{
            title: 'Map',
            formatter: function (cell, formatterParams, onRendered) {
                return `<button class="blue ui mini icon button">
                            <i data-publish-attr="zoomToPoint" class="map marker alternate icon"></i>
                       </button>`
            },
            width: 60,
            headerSort: false,
            hozAlign: "center",
            cellClick: async (e, cell) => {
                const data = cell.getRow().getData();
                instance.store.zoomToPoint = {
                    lat: data.latitude, //acc lat
                    lng: data.longitude, //acc lang
                    zoom: mapConfig.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.minZoom,
                    addMarker: true,
                };
            }
        }, {
            title: 'Export',
            formatter: function (cell, formatterParams, onRendered) {
                return "<button class='ui blue mini left floated button export-acc-units'>Export Units</button>";
            },
            width: 120,
            hozAlign: "center",
            cellClick: async function (e, cell) {
                const renameDataKeys = R.curry((keysMap, obj) =>
                    R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
                );
                if (instance.store.mduUnitsData) {
                    //log export event
                    const params = {
                        userID: instance.store.userId,
                        eventType: "accTable_units_export",
                        logDataType: "PSA",
                        logData: cell.getRow().getData().zip_co_psa,
                    };
                    await instance.postData(
                        `${instance.store.baseApiUrl}/log/event`,
                        params
                    );
                    const exportDataKeysMap = config.tables.accs.accUnitsExportDataKeysMap;
                    const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config
                    // filter mduUnitsData for specific acc_mstr_prpty_id before export
                    let exportData = R.filter(v => v.acc_mstr_prpty_id === cell.getRow().getData().acc_mstr_prpty_id, instance.store.mduUnitsData);
                    exportData = R.map((x) => R.pick(exportKeys, x), exportData) // pick only specific keys from exportData
                    exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export
                    const csv = Papa.unparse(exportData);
                    const blob = new Blob([csv], {
                        type: "text/plain;charset=utf-8",
                    });
                    saveAs(blob, `TableDataExport.csv`);
                }
            },
            headerSort: false,
        }],
        dataTableConfig: {
            headerHozAlign: "center",
            pagination: pagination,
            paginationSize: 8,
            footerElement: `${footerElement} <button class="ui blue mini left floated button export-all-acc-units">Export All Units</button>`,
        },
        initSubscriptions,
    };
};

export default accTable;
