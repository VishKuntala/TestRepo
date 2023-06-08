import { CONSTANTS as HEATMAP_CONSTANTS } from "../../helpers/constants.js";
import Tabulator from "tabulator-tables";
import $ from "jquery";
import * as R from "ramda";
import Papa from "papaparse";
import { saveAs } from "file-saver";
import { html } from "lit-element";
import tabulatrTemplate from "../../../templates/components/tabulatr.js";
import PonderComponent from "../PonderComponent.js";
import { buildPayloadFromStore } from "../../helpers/remoteData.js";
import { config } from "./derivations/opportunity/config/config.js";

class Tabulatr extends PonderComponent {
    constructor() {
        super();
        this.id = "";
        this.subscriptions = [];
        this.headers = [];
        this.dataKeys = [];
        this.cellAlignments = [];
        this.prependTemplates = [];
        this.appendTemplates = [];
        this.remoteUrl = null;
        this.table = null;
        this.tableData = null;
        this.storeDataKey = null;
        this.derivation = null;
        this.derivedClass = null;
        this.primaryKeyColumn = null;
        this.table = null;
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: "tableid",
                type: String,
            },
            subscriptions: {
                type: Array,
                converter: value => (value ? value.split(",") : []),
            },
            prependTemplates: {
                type: Array,
                converter: value => (value ? value.split(",") : []),
            },
            appendTemplates: {
                type: Array,
                converter: value => (value ? value.split(",") : []),
            },
            headers: {
                type: Array,
                converter: value => (value ? value.split(",") : []),
            },
            dataKeys: {
                type: Array,
                converter: value => (value ? value.split(",") : []),
            },
            remoteUrl: {
                attribute: "remoteurl",
                type: String,
            },
            storeDataKey: {
                attribute: "storedatakey",
                type: String,
            },
            derivation: {
                attribute: "derivation",
                type: String,
            },
            primaryKeyColumn: {
                attribute: "primarykeycolumn",
                type: String,
            },
        };
    }

    // Subscribe to Observables (publishers) declared in other components
    async initSubscriptions() {
        const instance = this;

        instance.stateManager.subscribe("exportTableData", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            if (instance.tableData) {
                const csv = Papa.unparse(
                    R.map(
                        item =>
                            R.omit(
                                [
                                    "roam_text_sort_column",
                                    "tput_text_sort_column",
                                    "fiber_cust_sort_column",
                                    "band_14_sort_column",
                                    "fiveg_sort_column",
                                    "fiveg_plus_sort_column",
                                    "first_net_sort_column",
                                ],
                                item
                            ),
                        instance.tableData
                    )
                );
                const blob = new Blob([csv], {
                    type: "text/plain;charset=utf-8",
                });
                saveAs(
                    blob,
                    `TOP_${
                        instance.store.config.tableRecordsLimit
                    }_Exported_Data.csv.csv`
                );
            }
        });

        instance.derivedClass.initSubscriptions
            ? instance.derivedClass.initSubscriptions()
            : null;
    }

    //async sortData() {
    //    const instance = this;
    //    const response = await $.ajax({
    //        url: `${instance.store.config.baseUrl}/TableData`,
    //        headers: { "Content-Type": "application/json" },
    //        type: "post",
    //        data: JSON.stringify(
    //            Object.assign(buildPayloadFromStore(instance), {
    //                limit: instance.store.config.tableRecordsLimit,
    //                buildSortColumns: true,
    //            })
    //        ),
    //        processData: false,
    //    });
    //    return response.d;
    //}

    async exportTableData() {
        const instance = this;
        if (instance.derivedClass.dataTableConfig.pagination !== "remote") {
            if (instance.tableData) {
                const csv = Papa.unparse(instance.tableData);
                const blob = new Blob([csv], {
                    type: "text/plain;charset=utf-8",
                });
                saveAs(blob, `TableDataExport.csv`);
            }
        } else {
            if (window.Worker) {
                $("body").toast({
                    class: "success",
                    showIcon: "arrow circle down",
                    displayTime: 5000,
                    message:
                        "Your file is being generated and will be downloaded when ready. You can continue to use the application",
                });
                const fetchDataWorker = new Worker(
                    "modules/components/tabulatr/derivations/opportunity/fetchAllDataWorker.js"
                );
                fetchDataWorker.postMessage({
                    postData: Object.assign(
                        { filters: instance.table.getFilters() },
                        instance.derivedClass.getAjaxParams()
                    ),
                    ajaxURL: instance.derivedClass.getAjaxUrl(),
                    authToken: $("#hdnToken").val(),
                });

                fetchDataWorker.onmessage = function(e) {
                    const csv = Papa.unparse(e.data);
                    const blob = new Blob([csv], {
                        type: "text/plain;charset=utf-8",
                    });
                    saveAs(blob, "TableDataExport.csv");
                    $("body").toast({
                        class: "success",
                        showIcon: "arrow circle down",
                        displayTime: 5000,
                        message: "Your file has been generated ",
                    });
                };
            }
        }
    }

    async renderTable() {
        try {
            const instance = this;
            let columns = R.map(R.objOf("field"), instance.derivedClass.dataKeys);
            let headers = R.map(R.objOf("title"), instance.derivedClass.headers);
            /* const cellAlignments = R.map(item => !isNaN(instance.tableData?.[0]?.[item]) ? 'center' : 'right', instance.dataKeys);
            const alignments = R.map(R.objOf('hozAlign'), cellAlignments); */
            const alignments = R.map(R.objOf("hozAlign"), instance.cellAlignments);
            const mapIndexed = R.addIndex(R.map);
            columns = mapIndexed((col, idx) => {
                let column = col;
                if (instance.derivedClass && instance.derivedClass.frozenDataKeys) {
                    if (
                        R.contains(
                            column.field,
                            instance.derivedClass.frozenDataKeys
                        )
                    ) {
                        column = Object.assign(column, { frozen: true });
                    }
                }
                if (instance.derivedClass && instance.derivedClass.hiddenColumns) {
                    if (
                        R.contains(
                            column.field,
                            instance.derivedClass.hiddenColumns
                        )
                    ) {
                        column = Object.assign(column, { visible: false });
                    }
                }
                if (instance.derivedClass && instance.derivedClass.minWidthColumns) {
                    if (
                        R.contains(
                            column.field,
                            instance.derivedClass.minWidthColumns
                        )
                    ) {
                        column = Object.assign(column, { minWidth: 200, maxWidth: false }); //set minimum column width to 200px and overwrite default columnMaxWidth property by setting maxWidth: false
                    }
                }
                if (instance.derivedClass && instance.derivedClass.columnFormatter) {
                    instance.derivedClass.columnFormatter(column)
                }
                // append % if column name is "fiber_percentage"
                if (column.field == "fiber_percentage" || column.field == "fiber_penetration_rate") {
                    column = Object.assign(column, {
                        formatter: function (cell, formatterParams, onRendered) {
                            //cell - the cell component
                            //formatterParams - parameters set for the column
                            //onRendered - function to call when the formatter has been rendered
                            return cell.getValue() + "%"; //return the contents of the cell;
                        },
                    });
                }
                //Header Sort Direction - By default Tabulator will sort a column in ascending order when a user first clicks on the column header.
                // The headerSortStartingDir property in the column definition can be used to set the starting sort direction when a user clicks on an unsorted column, it can either be set to asc or desc.
                column = Object.assign(column, { headerSortStartingDir: "desc" });
                // market_rank sort by asc in psaTable and mduTable
                if ((this.id == "psaTable" || this.id == "mduTable") && column.field == "market_rank") {
                    column = Object.assign(column, { headerSortStartingDir: "asc" });
                }
                return R.merge(R.merge(column, headers[idx]), alignments[idx]);
            }, columns);

            if (instance.derivedClass.prependColumns) {
                columns = R.concat(instance.derivedClass.prependColumns, columns);
            }
            if (instance.derivedClass.appendColumns) {
                columns = R.concat(columns, instance.derivedClass.appendColumns);
            }
            let dataTableConfig = { headerSortElement: "<span><i class='fas fa-sort'></i><i class='fas fa-sort-up'></i><i class='fas fa-sort-down'></i></span>" };
            dataTableConfig.columns = columns;
            dataTableConfig = Object.assign(dataTableConfig, instance.derivedClass.dataTableConfig);
            if (instance.derivedClass.getPaginationMode) {
                dataTableConfig.pagination = instance.derivedClass.getPaginationMode();
            }
            if (dataTableConfig.pagination === 'remote') {
                dataTableConfig.ajaxSorting = true;
                dataTableConfig.ajaxFiltering = true;
                dataTableConfig.ajaxParams = instance.derivedClass.getAjaxParams();
                dataTableConfig.ajaxURL = instance.derivedClass.getAjaxUrl();
            } else {
                dataTableConfig.ajaxSorting = false;
                dataTableConfig.ajaxFiltering = false;
                dataTableConfig.ajaxParams = null;
                dataTableConfig.ajaxURL = null;
                dataTableConfig.data = this.tableData || this.store[this.storeDataKey] || [];
            }
            this.table = new Tabulator("#" + this.id, dataTableConfig);
            //if (this.id == "accTable" && instance.store.accessLevel === 'Unlimited') {
            //    const renameDataKeys = R.curry((keysMap, obj) =>
            //        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
            //    );
            //    this.table.addColumn(
            //        {
            //            formatter: function (cell, formatterParams) {
            //                return "<button class='ui blue mini left floated button export-acc-units'>Export Units</button>";
            //            },
            //            width: 120,
            //            hozAlign: "center",
            //            cellClick: async function (e, cell) {
            //                if (instance.store.mduUnitsData) {
            //                    //log export event
            //                    const params = {
            //                        userID: instance.store.userId,
            //                        eventType: "accTable_units_export",
            //                        logDataType: "PSA",
            //                        logData: cell.getRow().getData().zip_co_psa,
            //                    };
            //                    await instance.postData(
            //                        `${instance.store.baseApiUrl}/log/event`,
            //                        params
            //                    );
            //                    const exportDataKeysMap = config.tables.accs.accUnitsExportDataKeysMap;
            //                    const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config
            //                    // filter mduUnitsData for specific acc_mstr_prpty_id before export
            //                    let exportData = R.filter(v => v.acc_mstr_prpty_id === cell.getRow().getData().acc_mstr_prpty_id, instance.store.mduUnitsData);
            //                    exportData = R.map((x) => R.pick(exportKeys, x), exportData) // pick only specific keys from exportData
            //                    exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export
            //                    const csv = Papa.unparse(exportData);
            //                    const blob = new Blob([csv], {
            //                        type: "text/plain;charset=utf-8",
            //                    });
            //                    saveAs(blob, `TableDataExport.csv`);
            //                }
            //            },
            //            headerSort: false,
            //        },
            //        true
            //    );
            //}
            //if (this.id == "userACCTable") {
            //    const renameDataKeys = R.curry((keysMap, obj) =>
            //        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
            //    );
            //    this.table.addColumn(
            //        {
            //            formatter: function (cell, formatterParams) {
            //                return "<button class='ui blue mini left floated button export-acc-units'>Export Units</button>";
            //            },
            //            width: 120,
            //            hozAlign: "center",
            //            cellClick: async function (e, cell) {
            //                const accMasterPropertyId = cell.getRow().getData().acc_mstr_prpty_id;
            //                //get userACCUnitsExportData for accMasterPropertyId
            //                const result = await instance.postData(`${instance.store.baseApiUrl}/table/useraccsrow`, { accMasterPropertyId });
            //                if (result.data) {
            //                    const exportDataKeysMap = config.tables.useraccs.userACCUnitsExportDataKeysMap;
            //                    const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config                            
            //                    let exportData = result.data;
            //                    exportData = R.map((x) => R.pick(exportKeys, x), exportData) // pick only specific keys from exportData
            //                    const exportProperties = R.uniq(exportData.map(x => x.zip_co_psa)).toString();
            //                    //log export event
            //                    const params = {
            //                        userID: instance.store.userId,
            //                        eventType: "userACCTable_units_export",
            //                        logDataType: "PSA",
            //                        logData: exportProperties,
            //                        logJsonPayload: `${accMasterPropertyId}`
            //                    };
            //                    await instance.postData(
            //                        `${instance.store.baseApiUrl}/log/event`,
            //                        params
            //                    );
            //                    //export data
            //                    exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export                            
            //                    const csv = Papa.unparse(exportData);
            //                    const blob = new Blob([csv], {
            //                        type: "text/plain;charset=utf-8",
            //                    });
            //                    saveAs(blob, `TableDataExport.csv`);
            //                }
            //            },
            //            headerSort: false,
            //        },
            //        true
            //    );
            //}
            this.table.redraw();            
            await this.attachEventHandlers();
            if (instance.store.accessLevel !== 'Unlimited')
                $(".exportData.button").hide();
            // show wireless_category column only for "wirelessCoverageAndFiber" heatmap
            if (this.id == "mainTable" && instance.store.currentHeatmapFilter != HEATMAP_CONSTANTS.HEATMAP_WIRELESS_SCORING) {
                var wirelessCategoryColumn = this.table.getColumn("wireless_category");
                if (wirelessCategoryColumn) {
                    this.table.hideColumn("wireless_category") //hide the "wireless_category" column
                }
            }
        }
        catch (error) {
            alert('error from renderTable()');
            alert(error);            
        }
    }

    async reloadTableData(d) {
        if (d && d.length) {
            this.tableData = d;
            if (this.table) {
                await this.table.setData(this.tableData);
            } else {
                await this.renderTable();
            }
        }
    }

    // first updated is called the first time the html is rendered on the DOM.
    async firstUpdated(changedProperties) {
        try {
            const adminUser = $("#hdnViewerAttId").val();
            if (this.derivation) {
                const DerivedClass = (await import(`./derivations/${this.derivation
                    }`)).default;
                this.derivedClass = DerivedClass({ adminUser, instance: this });
            }
            await this.initSubscriptions();
            this.derivedClass && this.derivedClass.firstUpdated
                ? await this.derivedClass.firstUpdated(changedProperties)
                : null;
            await this.renderTable();
        }
        catch (error) {
            alert('error from firstUpdated()');
            alert(error);            
        }
    }

    // updated is called after the html is rendered on the DOM.
    async updated(changedProperties) {
        try {
            $("#txtTableSearch").val("");
            const adminUser = $("#hdnViewerAttId").val();
            if (this.table) {
                this.table = null;
            }
            if (this.derivation) {
                const DerivedClass = (await import(`./derivations/${this.derivation
                    }`)).default;
                this.derivedClass = DerivedClass({ adminUser, instance: this });
            }

            this.derivedClass && this.derivedClass.updated
                ? await this.derivedClass.updated(changedProperties)
                : null;
        }
        catch (error) {
            alert('error from updated()');
            alert(error);
        }
    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers
            ? await this.derivedClass.attachEventHandlers()
            : null;
    }

    // render the html from the template in the DOM
    render() {
        return html`${tabulatrTemplate({ id: this.id })}`;
    }
}

customElements.define("ponder-tabulator", Tabulatr);

export default Tabulatr;
