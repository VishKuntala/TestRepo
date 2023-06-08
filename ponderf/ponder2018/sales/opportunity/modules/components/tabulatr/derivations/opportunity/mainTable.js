import $ from "jquery";
import * as R from "ramda";
import Papa from "papaparse";
import { saveAs } from "file-saver";
import { fromEvent } from "rxjs";
import { debounceTime } from "rxjs/operators";
import { config as tableConfig } from "./config/config.js";
import { heatmapConfig } from "../../../azureMap/derivations/mainMap/config/heatmapConfig.js";
import { formatRowCellColors } from "../../../azureMap/derivations/mainMap/utils/utils.js";
import { CONSTANTS } from "../../../../helpers/constants.js";
import { setTableSort, reloadTableDataUsingSearchInput } from "./utils/utils.js";

const mainTable = ({ instance }) => {
    const initSubscriptions = async () => {
        // censusBlockTableData - subscription event is triggered ONLY when zoom level is greater than CENSUS_BLOCK.minZoom (zoom level - 14) and group by is not DYNAMIC from mainMap.js
        instance.stateManager.subscribe("censusBlockTableData", async (d) => {            
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            if (d) {
                const { censusBlockFeatures } = d;                
                let filteredcensusBlockFeatures = censusBlockFeatures; // defalut don't filter censusBlockFeatures
                // filter censusBlockFeatures if currentHeatmapFilterIndex !== undefined i.e filter button clicked
                if (typeof instance.store.currentHeatmapFilterIndex !== 'undefined') {                    
                    if (instance.store.heatmap == CONSTANTS.HEATMAP_FIBER_PENETRATION) {
                        filteredcensusBlockFeatures = censusBlockFeatures.filter(censusBlockFeature => censusBlockFeature.fiber_penetration_hm_color_code == instance.store.currentHeatmapFilterIndex + 1);
                    }
                    else if (instance.store.heatmap == CONSTANTS.HEATMAP_WIRELESS_SCORING) {
                        filteredcensusBlockFeatures = censusBlockFeatures.filter(censusBlockFeature => censusBlockFeature.wireless_coverage_hm_color_code == instance.store.currentHeatmapFilterIndex + 1);
                    }
                    else if (instance.store.heatmap == CONSTANTS.HEATMAP_COPPER_UPGRADE) {
                        filteredcensusBlockFeatures = censusBlockFeatures.filter(censusBlockFeature => censusBlockFeature.copper_upgrade_hm_color_code == instance.store.currentHeatmapFilterIndex + 1);
                    }
                    else if (instance.store.heatmap == CONSTANTS.HEATMAP_FIBER_OPPORTUNITY) {
                        filteredcensusBlockFeatures = censusBlockFeatures.filter(censusBlockFeature => censusBlockFeature.fiber_opportunity_hm_color_code == instance.store.currentHeatmapFilterIndex + 1);
                    }
                }
                // filter duplicate censusblock IDs
                filteredcensusBlockFeatures = R.uniqBy(R.prop("id"), filteredcensusBlockFeatures);
                instance.store.tableType = "censusblocks";
                const tableConfiguration = tableConfig.tables[instance.store.tableType];
                if (!tableConfiguration) return; // if tableConfiguration not found return
                const {
                    dataKeys,
                    headers,
                    frozenDataKeys,
                    hiddenColumns,
                    footerElement,
                    description
                } = tableConfiguration;
                instance.derivedClass.dataKeys = dataKeys;
                instance.derivedClass.headers = headers;
                instance.derivedClass.frozenDataKeys = frozenDataKeys;
                instance.derivedClass.hiddenColumns = hiddenColumns;
                instance.derivedClass.dataTableConfig.footerElement = footerElement;
                $("#txtTableSearch").val('');
                instance.tableData = filteredcensusBlockFeatures;
                $("#mainTableTab").text(description); // update mainTableTab text property
                await instance.renderTable();
            }
        });

        const updateMainTable = async d => {
            try {
                if (
                    (instance.store.tableType &&
                        instance.store.searchMode !== "zipSearch") ||
                    (instance.store.tableType === "zips" &&
                        instance.store.searchMode === "zipSearch")
                ) {
                    const tableConfiguration =
                        tableConfig.tables[instance.store.tableType];
                    if (!tableConfiguration) return; // if tableConfiguration not found return
                    const {
                        dataKeys,
                        headers,
                        frozenDataKeys,
                        hiddenColumns,
                        footerElement,
                        minWidthColumns,
                        description
                    } = tableConfiguration;

                    instance.derivedClass.dataKeys = dataKeys;
                    instance.derivedClass.headers = headers;
                    instance.derivedClass.frozenDataKeys = frozenDataKeys;
                    instance.derivedClass.hiddenColumns = hiddenColumns;
                    instance.derivedClass.dataTableConfig.footerElement = footerElement;
                    instance.derivedClass.minWidthColumns = minWidthColumns;
                    $("#txtTableSearch").val("");
                    $("#mainTableTab").text(description); // update mainTableTab text property
                    await instance.renderTable();
                }
            }
            catch (error) {
                alert('error in updateMainTable');
                alert(error);
            }
        }

        instance.stateManager.subscribe("currentHeatmapFilterIndex", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            instance.store.overallCatWhereClause = instance.store.currentHeatmapFilterIndex !== undefined ?
                heatmapConfig[instance.store.currentHeatmapFilter].filters[instance.store.currentHeatmapFilterIndex].overallCatWhereClause : '';
            await updateMainTable();
            setTableSort(instance);
        });

        instance.stateManager.subscribe("updateMainTable", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            await updateMainTable();
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), "keyup");
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => reloadTableDataUsingSearchInput(instance, instance.store.tableType)); // pass tableName from state for mainTable
    };

    const getAjaxParams = () => {
        const {
            market,
            marketType,
            tableType,
            config,
            sortCriteria,
        } = instance.store;

        let updatedMarket = market;
        let updatedMarketType = marketType;

        /* if (instance.store.groupBy === "DYNAMIC") {
            // zip table cannot be loaded in dynamic mode when marketType is NATIONAL/REGION
            if (
                (updatedMarketType == "NATIONAL" ||
                    updatedMarketType == "REGION") &&
                tableType == "zips"
            ) {
                updatedMarketType = "MARKET";
                updatedMarket = "KAMO";
            }
        } */

        return Object.assign({
            type: tableType,
            marketVariable: updatedMarket,
            marketTypeVariable: updatedMarketType,
            orderVariable:
                sortCriteria || config.startingSortCriteria || "",
        },
            {
                searchedZip: instance.store.searchMode === 'zipSearch' ? instance.store.searchedZip : null,
                searchedCounty: instance.store.searchMode === 'countySearch' ? instance.store.searchedCounty : null,
                searchedDMA: instance.store.searchMode === 'dmaSearch' ? instance.store.searchedDMA : null,
                overallCatVariable: instance.store.overallCatWhereClause || ''
            });

    }

    const getAjaxUrl = () => 
        `${instance.store.baseApiUrl}/table/${instance.store.tableType}`

    const getPaginationMode = () =>
        tableConfig.tables[instance.store.tableType].pagination;    

    //const fetchData = async myParamsObject => {
    //    const response = await instance.postData(
    //        `${instance.store.baseApiUrl}/table/${myParamsObject.type}`,
    //        myParamsObject
    //    );
    //};

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    const exportMainTableData = async () => {
        //log event
        const params = {
            userID: instance.store.userId,            
            eventType: instance.store.tableType + "Table_export",
            logDataType: null,
            logData: null,
        };
        await instance.postData(
            `${instance.store.baseApiUrl}/log/event`,
            params
        );
        //export data
        const { pagination, exportDataKeysMap } = tableConfig.tables[instance.store.tableType];        
        if (pagination !== "remote") {
            if (instance.tableData) {
                const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config
                let exportData = R.map((x) => R.pick(exportKeys, x), instance.tableData) // pick only specific keys from exportData            
                exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export
                const csv = Papa.unparse(exportData);
                const blob = new Blob([csv], {
                    type: "text/plain;charset=utf-8",
                });
                saveAs(blob, `TableDataExport.csv`);
            }
        } else {
            $("body").toast({
                class: "success",
                showIcon: "arrow circle down",
                displayTime: 5000,
                message:
                    "Your file is being generated and will be downloaded when ready. You can continue to use the application",
            });
            const postData = getAjaxParams();
            const response = await instance.postData(`${instance.store.baseApiUrl}/table/${instance.store.tableType}`, postData);
            const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config
            let exportData = R.map((x) => R.pick(exportKeys, x), response) // pick only specific keys from exportData
            exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export
            const csv = Papa.unparse(exportData);
            const blob = new Blob([csv], {
                type: "text/plain;charset=utf-8",
            });
            saveAs(blob, "TableDataExport.csv");
        }
    };

    const attachEventHandlers = async () => {        
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", () => exportMainTableData());
    };

    return {
        attachEventHandlers,
        minWidthColumns: tableConfig.tables[instance.store.tableType].minWidthColumns,
        dataKeys: tableConfig.tables[instance.store.tableType].dataKeys,
        headers: tableConfig.tables[instance.store.tableType].headers,
        frozenDataKeys: tableConfig.tables[instance.store.tableType].frozenDataKeys,
        hiddenColumns: tableConfig.tables[instance.store.tableType].hiddenColumns,
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
                if (tableConfig.tables[instance.store.tableType].rowClick) {                    
                    await tableConfig.tables[instance.store.tableType].rowClick(instance, data);
                }
            }
        }],
        dataTableConfig: {
            headerHozAlign: "center",            
            paginationSize: 8,
            ajaxContentType: "json",
            ajaxSorting: true,
            ajaxFiltering: true,
            ajaxConfig: {
                method: "post",
                headers: {
                    Authorization: $("#hdnToken").val(),
                },
            },
            paginationDataSent: {
                page: "offset",
                size: "limit",
            },
            tableBuilt: async function () {
                this.setSort("fiber_opportunity", "desc"); //Trigger Sorting Programmatically
            },
            footerElement: tableConfig.tables[instance.store.tableType].footerElement,
            rowFormatter: row => {
                formatRowCellColors(row, instance.store.currentHeatmapFilter);
            },
            columnMaxWidth: 125, //maximum column width of 125px  
            // ajaxError: function (error) {
            //     alert('error from ajaxError - mainTable');
            //     let errorMessage = '';
            //     for (const key in error) {
            //         errorMessage = errorMessage + `${key}: ${error[key]}` + '\n';
            //         console.log(`${key}: ${error[key]}`);
            //     }
            //     alert(errorMessage);
            // },
        },
        initSubscriptions,
        getAjaxParams,
        getAjaxUrl,
        getPaginationMode,
    };
};

export default mainTable;
