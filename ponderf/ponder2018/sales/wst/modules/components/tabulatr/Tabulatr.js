import Tabulator from 'tabulator-tables';
import $ from "jquery";
import * as R from 'ramda';
import Papa from 'papaparse';
import { saveAs } from 'file-saver';
import { fromEvent } from 'rxjs';
import { debounceTime } from 'rxjs/operators';

import { html } from 'lit-element';
import tabulatrTemplate from '../../../templates/components/tabulatr.js';
import PonderComponent from '../PonderComponent.js';
import sortRankingConfig from './derivations/sortRankingConfig.js';
import { buildPayloadFromStore } from "../../helpers/remoteData.js";


class Tabulatr extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.subscriptions = [];
        this.headers = [];
        this.dataKeys = [];
        this.prependTemplates = [];
        this.appendTemplates = [];
        this.remoteUrl = null;
        this.table = null;
        this.tableData = null;
        this.storeDataKey = null;
        this.derivation = null;
        this.derivedClass = null;
        this.primaryKeyColumn = null;
        this.cellAlignments = [];
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'tableid',
                type: String
            },
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            prependTemplates: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            appendTemplates: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            headers: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            dataKeys: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            remoteUrl: {
                attribute: 'remoteurl',
                type: String
            },
            storeDataKey: {
                attribute: 'storedatakey',
                type: String
            },
            derivation: {
                attribute: 'derivation',
                type: String
            },
            primaryKeyColumn: {
                attribute: 'primarykeycolumn',
                type: String
            }
        }
    }

    async sortData() {
        const instance = this;
        const response = await $.ajax({
            url: `${instance.store.config.baseUrl}/TableData`,
            headers: { "Content-Type": "application/json" },
            type: 'post',
            data: JSON.stringify(Object.assign(buildPayloadFromStore(instance), { limit: instance.store.config.tableRecordsLimit, buildSortColumns: true })),
            processData: false
        });
        return response.d;
    }

    async exportTableData() {
        const instance = this;
        const config = (await import(`./derivations/${$('#hdnAppName').val()}/config/config.js`)).config;
        if (instance.derivedClass.dataTableConfig.pagination !== "remote") {
            if (instance.tableData) {
               /* const csv = Papa.unparse(R.map(item => R.omit(
                    R.concat(
                        ['etag', 'partitionKey', 'rowKey', 'timestamp'],
                        instance.derivedClass.dataTableExportOmitKeys || []
                    ), item), instance.tableData)); */
                const defaultDatakeysObject = {};
                R.map(h => defaultDatakeysObject[h] = "", config.tables[instance.store.channelCode].dataKeys);
                const csv = Papa.unparse({
                    "fields": config.tables[instance.store.channelCode].headers, "data": R.map(item => {
                        // const itemWithNullDefaults = R.mapObjIndexed((val, key, obj) => R.defaultTo("", val), item);
                        const itemWithNullDefaults = R.mergeRight(defaultDatakeysObject, item);
                        return R.values(R.omit(
                            R.concat(['etag', 'partitionKey', 'rowKey', 'timestamp'], config.tables[instance.store.channelCode].dataTableExportOmitKeys || []),
                            R.pick(config.tables[instance.store.channelCode].dataKeys, itemWithNullDefaults)))
                    }, instance.tableData)
                });

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
                    "modules/components/tabulatr/derivations/fetchAllDataWorker.js"
                );
                fetchDataWorker.postMessage({
                    postData: Object.assign(
                        { filters: instance.table.getFilters(), tableExport: true, },
                        instance.derivedClass.getAjaxParams()
                    ),
                    ajaxURL: instance.derivedClass.getAjaxUrl(),
                    authToken: $("#hdnToken").val(),
                });

                fetchDataWorker.onmessage = function (e) {
                    /* const csv = Papa.unparse(R.map(item => R.omit(
                        R.concat(
                            ['etag', 'partitionKey', 'rowKey', 'timestamp'],
                            instance.derivedClass.dataTableExportOmitKeys || []
                        ), item), e.data)); */
                    const headers = [];
                    for (let i = 0; i < config.tables[instance.store.channelCode].dataKeys.length; i += 1) {
                        if (!R.includes(config.tables[instance.store.channelCode].dataKeys[i], config.tables[instance.store.channelCode].dataTableExportOmitKeys)) {
                            headers.push(config.tables[instance.store.channelCode].headers[i]);
                        }
                    }
                    const defaultDatakeysObject = {};
                    R.map(h => defaultDatakeysObject[h] = "", config.tables[instance.store.channelCode].dataKeys);
                    const csv = Papa.unparse({
                        "fields": headers, "data": R.map(item => {
                            // const itemWithNullDefaults = R.mapObjIndexed((val, key, obj) => R.defaultTo("", val), item);
                            const itemWithNullDefaults = R.mergeRight(defaultDatakeysObject, item);
                            return R.values(R.omit(
                                R.concat(['etag', 'partitionKey', 'rowKey', 'timestamp'], config.tables[instance.store.channelCode].dataTableExportOmitKeys || []),
                                R.pick(config.tables[instance.store.channelCode].dataKeys, itemWithNullDefaults)))
                        }, e.data)
                    });

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
        const instance = this;
        let columns = R.map(R.objOf("field"), instance.derivedClass.dataKeys);
        let headers = R.map(R.objOf("title"), instance.derivedClass.headers);
        /* const cellAlignments = R.map(item => !isNaN(instance.tableData?.[0]?.[item]) ? 'center' : 'right', instance.dataKeys);
        const alignments = R.map(R.objOf('hozAlign'), cellAlignments); */
        const alignments = R.map(R.objOf("hozAlign"), instance.cellAlignments);
        const mapIndexed = R.addIndex(R.map);
        columns = mapIndexed((col, idx) => {
            let column = col;
            column = Object.assign(column, { width: 125 });
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

            if (instance.derivedClass && instance.derivedClass.sortingDisabled) {
                column = Object.assign(column, { headerSort: false});
            }

            if (instance.derivedClass && instance.derivedClass.columnFormatter) {
                instance.derivedClass.columnFormatter(column)
            }

            return R.merge(R.merge(column, headers[idx]), alignments[idx]);
        }, columns);
        if (instance.derivedClass.prependColumns) {
            columns = R.concat(instance.derivedClass.prependColumns, columns);
        }
        if (instance.derivedClass.appendColumns) {
            columns = R.concat(columns, instance.derivedClass.appendColumns);
        }
        let dataTableConfig = {};
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
        this.table.redraw();
        await this.attachEventHandlers();

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
        const adminUser = $("#hdnViewerAttId").val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${$('#hdnAppName').val()}/${this.derivation
                }`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.initSubscriptions();
        this.derivedClass && this.derivedClass.firstUpdated
            ? await this.derivedClass.firstUpdated(changedProperties)
            : null;
        // await this.renderTable();
    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        $("#txtTableSearch").val("");
        const adminUser = $("#hdnViewerAttId").val();
        if (this.table) {
            this.table = null;
        }
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${$('#hdnAppName').val()}/${this.derivation
                }`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }

        this.derivedClass && this.derivedClass.updated
            ? await this.derivedClass.updated(changedProperties)
            : null;

       /* if (this.store.config.loadDataOnChannelInit) {
            $(`.ui.btnSubmit`).click();
        } */

    }

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        const instance = this;
        $(`#${instance.id} button.exportData`)
            .off()
            .on("click", async function () {
                await instance.exportTableData();
            });
        this.derivedClass && this.derivedClass.attachEventHandlers
            ? await this.derivedClass.attachEventHandlers()
            : null;
    }

    // render the html from the template in the DOM
    render() {
        return html`${tabulatrTemplate({ id: this.id })}`;
    }


    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {
        const instance = this;

        instance.stateManager.subscribe("updateTable", async d => {
            if (typeof d === "string") {
                if (instance.derivedClass && instance.derivedClass.updateTable) {
                    await instance.derivedClass.updateTable(d);
                }
            }
        });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters 
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), 'keyup');
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(async x => {
            if (instance.derivedClass && instance.derivedClass.filterTable) {
                await instance.derivedClass.filterTable();
            }
        });

        instance.derivedClass.initSubscriptions ? instance.derivedClass.initSubscriptions() : null;
    }


}

customElements.define('ponder-tabulator', Tabulatr);

export default Tabulatr;
