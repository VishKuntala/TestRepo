import $ from "jquery";
import * as R from "ramda";
import { fromEvent } from "rxjs";
import { debounceTime } from "rxjs/operators";
import { config } from "./config/config.js";
import { config as mapConfig } from "../../../azureMap/derivations/mainMap/config/config.js";
import Papa from "papaparse";
import { saveAs } from "file-saver";
import { reloadTableDataUsingSearchInput } from "./utils/utils.js";

const mduTable = ({ instance }) => {
    const {
        frozenDataKeys,
        hiddenColumns,
        dataKeys,
        mduExportDataKeysMap,
        mduUnitsExportDataKeysMap,
        headers,
        pagination,
        footerElement,
    } = config.tables.mdus;

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    const exportMDUs = async () => {        
        if (instance.tableData) {
            const exportKeys = R.keys(mduExportDataKeysMap); // get keys to be exported from config
            let exportData = R.map((x) => R.pick(exportKeys, x), instance.tableData) // pick only specific keys from exportData
            //log event
            const exportProperties =  R.uniq(exportData.map(x => x.zip_co_psa)).toString();
            const params = {
                userID: instance.store.userId,
                eventType: "mduTable_export",
                logDataType: "PSA",
                logData: exportProperties
            };
            await instance.postData(
                `${instance.store.baseApiUrl}/log/event`,
                params
            );
            exportData = R.map(renameDataKeys(mduExportDataKeysMap), exportData); //rename keys before export            
            const csv = Papa.unparse(exportData);
            const blob = new Blob([csv], {
                type: "text/plain;charset=utf-8",
            });
            saveAs(blob, `TableDataExport.csv`);
        }
    };

    const exportAllMDUUnits = async () => {
        if (instance.store.mduUnitsData) {            
            const exportKeys = R.keys(mduUnitsExportDataKeysMap); // get keys to be exported from config
            let exportData = R.map((x) => R.pick(exportKeys, x), instance.store.mduUnitsData) // pick only specific keys from exportData
            //log export event
            const exportProperties = R.uniq(exportData.map(x => x.zip_co_psa)).toString();
            const params = {
                userID: instance.store.userId,
                eventType: "mduTable_units_export",
                logDataType: "PSA",
                logData: exportProperties
            };
            await instance.postData(
                `${instance.store.baseApiUrl}/log/event`,
                params
            );
            //export data
            exportData = R.map(renameDataKeys(mduUnitsExportDataKeysMap), exportData); //rename keys before export
            const csv = Papa.unparse(exportData);
            const blob = new Blob([csv], {
                type: "text/plain;charset=utf-8",
            });
            saveAs(blob, `TableDataExport.csv`);
        }
    };

    const initSubscriptions = async () => {
        instance.stateManager.subscribe("mduTableData", async d => {
            // app intial load event
            if (d && R.is(Array, d) && d.length == 0) {
                $('#mduTableTab').css('pointer-events', 'none'); //disable mduTableTab pointer-events
                if (instance.table)
                    instance.table.setData([]);
                return;
            }
            $('#mduTableTab').css('pointer-events', 'auto');
            instance.store.mduUnitsData = d;
            //filter duplicate lat and lang, we need to display single MDU entry in the table.
            const filteredMDUs = R.uniqBy(R.prop("longitude"), (R.uniqBy(R.prop("latitude"), d)));
            instance.tableData = filteredMDUs;
            instance.cellAlignments = R.map(
                item =>
                    !isNaN(instance.tableData?.[0]?.[item])
                        ? "center"
                        : "right",
                instance.dataKeys
            );
            await instance.renderTable();
        });

        instance.stateManager.subscribe("switchToMainTableTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return;
            if (instance.store.currentZoom < mapConfig.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom) {
                $('#mduTableTab').css('pointer-events', 'none'); //disable mduTableTab pointer-events
                if (instance.table)
                    instance.table.setData([]);
                return;
            }
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), "keyup");
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => reloadTableDataUsingSearchInput(instance, "mdus")); //pass tableName
    };

    const attachEventHandlers = async () => {
        // hide "Export MDU Units" button for limited users
        if (instance.store.accessLevel !== 'Unlimited') {            
            $(".export-mdu-units.button").hide();
        }
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", () => exportMDUs());
        $(".export-mdu-units")
            .off()
            .on("click", () => exportAllMDUUnits());
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
                    lat: data.latitude,
                    lng: data.longitude,
                    zoom: mapConfig.pointsLayers.MDU_ALL_ATT_FIBER_CUSTOMERS.minZoom, // zoom to address level,
                    addMarker: false,
                    markerData: {
                        type: 'mdu',
                        id: data.addr_id,
                        coordinates: [data.longitude, data.latitude]
                    },
                };
            }
        }],
        dataTableConfig: {
            headerHozAlign: "center",
            pagination: pagination,
            paginationSize: 8,
            footerElement: `${footerElement} <button class="ui blue mini left floated button export-mdu-units">Export MDU Units</button>`,
        },
        initSubscriptions,
    };
};

export default mduTable;
