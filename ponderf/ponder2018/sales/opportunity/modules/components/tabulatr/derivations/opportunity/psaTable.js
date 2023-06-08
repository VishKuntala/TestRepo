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

const psaTable = ({ instance }) => {

    const {
        dataKeys,
        headers,
        frozenDataKeys,
        hiddenColumns,
        footerElement,
        minWidthColumns,
        psasExportDataKeysMap
    } = config.tables.psas;

    const initSubscriptions = async () => {

        const updatePsaTable = async () => {
            instance.derivedClass.dataKeys = dataKeys;
            instance.derivedClass.headers = headers;
            instance.derivedClass.frozenDataKeys = frozenDataKeys;
            instance.derivedClass.hiddenColumns = hiddenColumns;
            instance.derivedClass.minWidthColumns = minWidthColumns;
            instance.derivedClass.dataTableConfig.footerElement = footerElement;
            $("#txtTableSearch").val('');
            await instance.renderTable();
        }

        // triggered by hyperlinks in PSA or Address Layer popups 
        instance.stateManager.subscribe("addPSAFilter", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event            
            await updatePsaTable();
        });

        // triggered by clearPSA filter button click 
        instance.stateManager.subscribe("clearPSAFilter", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event                        
            await updatePsaTable();
        });

        instance.stateManager.subscribe("updatePSATable", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event                        
            await updatePsaTable();
        });

        instance.stateManager.subscribe("currentHeatmapFilterIndex", async d => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event            
            instance.store.overallCatWhereClause = instance.store.currentHeatmapFilterIndex !== undefined ?
                heatmapConfig[instance.store.currentHeatmapFilter].filters[instance.store.currentHeatmapFilterIndex].overallCatWhereClause : '';
            await updatePsaTable();
            setTableSort(instance);
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters 
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), 'keyup');
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => reloadTableDataUsingSearchInput(instance, "psas")); //pass tableName
    };

    const getAjaxParams = () => {
        const { marketType, market } = instance.store;
        return Object.assign(
            {
                market: market == "%" ? null : market,
                marketType,
            },
            {
                searchedZip: instance.store.searchMode === 'zipSearch' ? instance.store.searchedZip : null,
                searchedCounty: instance.store.searchMode === 'countySearch' ? instance.store.searchedCounty : null,
                searchedDMA: instance.store.searchMode === 'dmaSearch' ? instance.store.searchedDMA : null,
                searchedPSA: instance.store.searchedPSA,
                overallCatVariable: instance.store.overallCatWhereClause || ''
            }
        );

    }

    const getAjaxUrl = () => `${instance.store.baseApiUrl}/table/psas`;

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    const exportPSAs = async () => {
        //log event
        const params = {
            userID: instance.store.userId,
            eventType: "psaTable_export",
            logDataType: null,
            logData: null,
        };
        await instance.postData(
            `${instance.store.baseApiUrl}/log/event`,
            params
        );
        //export data
        $("body").toast({
            class: "success",
            showIcon: "arrow circle down",
            displayTime: 5000,
            message:
                "Your file is being generated and will be downloaded when ready. You can continue to use the application",
        });
        const postData = getAjaxParams();
        const response = await instance.postData(`${instance.store.baseApiUrl}/table/psas`, postData);
        const exportKeys = R.keys(psasExportDataKeysMap); // get keys to be exported from config
        let exportData = R.map((x) => R.pick(exportKeys, x), response) // pick only specific keys from exportData            
        exportData = R.map(renameDataKeys(psasExportDataKeysMap), exportData); //rename keys before export
        const csv = Papa.unparse(exportData);
        const blob = new Blob([csv], {
            type: "text/plain;charset=utf-8",
        });
        saveAs(blob, "TableDataExport.csv");
    };

    const attachEventHandlers = async () => {
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", () => exportPSAs());
    };

    return {
        attachEventHandlers,
        minWidthColumns: config.tables.psas.minWidthColumns,
        frozenDataKeys: config.tables.psas.frozenDataKeys,
        hiddenColumns: config.tables.psas.hiddenColumns,
        dataKeys: config.tables.psas.dataKeys,
        headers: config.tables.psas.headers,
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
                    zoom: mapConfig.heatmapLayers.CENSUS_BLOCK.minZoom, // zoom to census blocks level i.e 14
                    addMarker: false,
                    markerData: {
                        type: 'psa',
                        id: data.zip_co_psa,
                        coordinates: [data.longitude, data.latitude]
                    },
                };
            }
        }, {
                title: 'PSA Events',
                formatter: function (cell, formatterParams, onRendered) {
                    const data = cell.getRow().getData();
                    return `<button class="blue ui mini icon button">${data.psa_events_exists}</button>`
                },
                width: 75,
                headerSort: false,
                hozAlign: "center",
                cellClick: async (e, cell) => {
                    const psa = cell.getRow().getData().zip_co_psa;
                    const eventExists = cell.getRow().getData().psa_events_exists;
                    if (eventExists == "Yes") {
                        const response = await instance.postData(`${instance.store.baseApiUrl}/table/psaevents`, { psa });
                        instance.store.psaEventsData = response;
                    }
                    else {
                        instance.store.psaEventsData = [];
                    }
                    $('.psaEvents.modal').modal('setting', 'transition', 'fade up')
                        .modal('show');
                }
            }],
        dataTableConfig: {
            headerHozAlign: "center",
            pagination: config.tables.psas.pagination,
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
            tableBuilt: async function () {
                this.setSort("fiber_opportunity", "desc"); //Trigger Sorting Programmatically
            },
            footerElement: config.tables.psas.footerElement,
            columnMaxWidth: 125, //maximum column width of 125px    
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
    };
};

export default psaTable;
