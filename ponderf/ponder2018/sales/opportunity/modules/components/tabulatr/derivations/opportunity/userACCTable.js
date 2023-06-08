import $ from "jquery";
import * as R from "ramda";
import Papa from "papaparse";
import { saveAs } from "file-saver";
import { fromEvent } from 'rxjs';
import { debounceTime } from 'rxjs/operators';
import { config } from "./config/config.js";
import { config as mapConfig } from "../../../azureMap/derivations/mainMap/config/config.js";
import { heatmapConfig } from "../../../azureMap/derivations/mainMap/config/heatmapConfig.js";
import { setTableSort, reloadTableDataUsingSearchInput } from "./utils/utils.js";

const userACCTable = ({ instance }) => {

    const {
        dataKeys,
        headers,
        frozenDataKeys,
        hiddenColumns,
        footerElement,
        minWidthColumns,
        userACCExportDataKeysMap,
        pagination
    } = config.tables.useraccs;

    const initSubscriptions = async () => {

        instance.stateManager.subscribe("userACCTableData", async (d) => {
            // app intial load event
            if (d && R.is(Array, d) && d.length == 0) {
                $('#userACCTableTab').css('pointer-events', 'none'); //disable addressTableTab pointer-events
                if (instance.table)
                    instance.table.setData([]);
                return;
            }
            $('#userACCTableTab').css('pointer-events', 'auto');
            instance.tableData = d;
            instance.cellAlignments = R.map(item => !isNaN(instance.tableData?.[0]?.[item]) ? 'center' : 'right', instance.dataKeys);
            await instance.renderTable();
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters 
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), 'keyup');
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => reloadTableDataUsingSearchInput(instance, "useraccs")); //pass tableName
    };

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    const exportUserACCs = async () => {
        $("body").toast({
            class: "success",
            showIcon: "arrow circle down",
            displayTime: 5000,
            message:
                "Your file is being generated and will be downloaded when ready. You can continue to use the application",
        });
        const exportKeys = R.keys(userACCExportDataKeysMap); // get keys to be exported from config
        let exportData = R.map((x) => R.pick(exportKeys, x), instance.tableData) // pick only specific keys from exportData
        //log export event
        const exportProperties = R.uniq(exportData.map(x => x.acc_mstr_prpty_id)).toString();        
        const params = {
            userID: instance.store.userId,
            eventType: "userACCTable_export",
            logDataType: "Property",
            logData: exportProperties
        };
        await instance.postData(
            `${instance.store.baseApiUrl}/log/event`,
            params
        );
        //export data
        exportData = R.map(renameDataKeys(userACCExportDataKeysMap), exportData); //rename keys before export
        const csv = Papa.unparse(exportData);
        const blob = new Blob([csv], {
            type: "text/plain;charset=utf-8",
        });
        saveAs(blob, "TableDataExport.csv");
    };

    const attachEventHandlers = async () => {
        // hide "Export Units" button for limited users
        if (instance.store.accessLevel !== 'Unlimited') {
            $(".export-user-acc-units.button").hide();
        }
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", () => exportUserACCs());
    };

    return {
        attachEventHandlers,
        minWidthColumns: minWidthColumns,
        frozenDataKeys: frozenDataKeys,
        hiddenColumns: hiddenColumns,
        dataKeys: dataKeys,
        headers: headers,
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
                    lat: data.latitude,
                    lng: data.longitude,
                    zoom: mapConfig.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.minZoom, // zoom to address level i.e 15
                    addMarker: true,
                };
            }
        }, {
            title: 'Export',
            formatter: function (cell, formatterParams, onRendered) {
                return "<button class='ui blue mini left floated button export-user-acc-units'>Export Units</button>";
            },
            width: 120,
            hozAlign: "center",
            cellClick: async function (e, cell) {
                const renameDataKeys = R.curry((keysMap, obj) =>
                    R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
                );
                const accMasterPropertyId = cell.getRow().getData().acc_mstr_prpty_id;
                //get userACCUnitsExportData for accMasterPropertyId
                const response = await instance.postData(`${instance.store.baseApiUrl}/table/useraccsrow`, { accMasterPropertyId });
                if (response) {
                    const exportDataKeysMap = config.tables.useraccs.userACCUnitsExportDataKeysMap;
                    const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config                            
                    let exportData = response;
                    exportData = R.map((x) => R.pick(exportKeys, x), exportData) // pick only specific keys from exportData
                    const exportProperties = R.uniq(exportData.map(x => x.zip_co_psa)).toString();
                    //log export event
                    const params = {
                        userID: instance.store.userId,
                        eventType: "userACCTable_units_export",
                        logDataType: "PSA",
                        logData: exportProperties,
                        logJsonPayload: `${accMasterPropertyId}`
                    };
                    await instance.postData(
                        `${instance.store.baseApiUrl}/log/event`,
                        params
                    );
                    //export data
                    exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export                            
                    const csv = Papa.unparse(exportData);
                    const blob = new Blob([csv], {
                        type: "text/plain;charset=utf-8",
                    });
                    saveAs(blob, `TableDataExport.csv`);
                }
            },
            headerSort: false,
        }
        ],
        dataTableConfig: {
            headerHozAlign: "center",
            pagination: pagination,
            paginationSize: 8,
            ajaxLoaderLoading: "<div style='display:inline-block; border:4px solid #333; border-radius:10px; background:#fff; font-weight:bold; font-size:16px; color:#000; padding:10px 20px;'>Loading Data</div>",
            footerElement: footerElement
        },
        initSubscriptions,
    };
};

export default userACCTable;
