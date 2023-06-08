import $ from "jquery";
import * as R from "ramda";
import Papa from "papaparse";
import { saveAs } from "file-saver";
import { fromEvent } from 'rxjs';
import { debounceTime } from 'rxjs/operators';
import { config } from "./config/config.js";
import { config as mapConfig } from '../../../azureMap/derivations/mainMap/config/config.js';
import { reloadTableDataUsingSearchInput } from "./utils/utils.js";

const addressTable = ({ adminUser, instance }) => {
    const { addressExportDataKeysMap } = config.tables.addresses;

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    const exportAddresses = async () => {
        if (instance.tableData) {
            const exportKeys = R.keys(addressExportDataKeysMap); // get keys to be exported from config
            let exportData = R.map((x) => R.pick(exportKeys, x), instance.tableData) // pick only specific keys from exportData   
            //log export event
            const exportProperties = R.uniq(exportData.map(x => x.zip_co_psa)).toString();
            const params = {
                userID: instance.store.userId,
                eventType: "addressTable_export",
                logDataType: "PSA",
                logData: exportProperties
            };
            await instance.postData(
                `${instance.store.baseApiUrl}/log/event`,
                params
            );
            //export data
            exportData = R.map(renameDataKeys(addressExportDataKeysMap), exportData); //rename keys before export            
            const csv = Papa.unparse(exportData);
            const blob = new Blob([csv], {
                type: "text/plain;charset=utf-8",
            });
            saveAs(blob, `TableDataExport.csv`);
        }
    };

    const initSubscriptions = async () => {
        instance.stateManager.subscribe("addressTableData", async (d) => {            
            // app intial load event
            if (d && R.is(Array, d) && d.length == 0) {
                $('#addressTableTab').css('pointer-events', 'none'); //disable addressTableTab pointer-events
                if(instance.table)
                    instance.table.setData([]);
                return;
            }
            $('#addressTableTab').css('pointer-events', 'auto');
            instance.tableData = d;
            instance.cellAlignments = R.map(item => !isNaN(instance.tableData?.[0]?.[item]) ? 'center' : 'right', instance.dataKeys);
            await instance.renderTable();
            instance.table.setSort([
                { column: "address", dir: "asc" }, //sort by this first
                { column: "unit_number", dir: "asc" }, //then sort by this second
            ]);
        });

        instance.stateManager.subscribe("switchToMainTableTab", async (d) => {
            if (d && R.is(Array, d) && d.length == 0) return;            
            if (instance.store.currentZoom < mapConfig.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom) {
                $('#addressTableTab').css('pointer-events', 'none'); //disable addressTableTab pointer-events
                if (instance.table)
                    instance.table.setData([]);
                return;
            }
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters 
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), 'keyup');
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => reloadTableDataUsingSearchInput(instance, "addresses")); //pass tableName
    };

    const attachEventHandlers = async () => {
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", () => exportAddresses());
    };

    return {
        attachEventHandlers,
        frozenDataKeys: config.tables.addresses.frozenDataKeys,
        hiddenColumns: config.tables.addresses.hiddenColumns,
        dataKeys: config.tables.addresses.dataKeys,
        headers: config.tables.addresses.headers,
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
                    zoom: mapConfig.pointsLayers.FIBER_CUSTOMER_AND_WIRELESS_CUSTOMER.minZoom, // zoom to address level,
                    addMarker: false,
                    markerData: {
                        type: 'address',
                        id: data.addr_id,
                        coordinates: [data.longitude, data.latitude]
                    },
                };
            }
        }],
        dataTableConfig: {
            headerHozAlign: "center",
            pagination: config.tables.addresses.pagination,
            paginationSize: 8,
            footerElement:
                config.tables["addresses"].footerElement,
        },
        initSubscriptions,
    };
};

export default addressTable;
