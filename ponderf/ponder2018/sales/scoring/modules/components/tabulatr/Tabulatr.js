import Tabulator from 'tabulator-tables';
import $ from "jquery";
import * as R from 'ramda';
import ExcelJS from 'exceljs';
import Readable from 'readable-stream';
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
        if (instance.tableData) {
            const csv = Papa.unparse(R.map(item => R.omit(instance.store.config.dataTableExportOmitKeys || [], item), instance.tableData));
            const blob = new Blob([csv], { type: "text/plain;charset=utf-8" });
            saveAs(blob, `TOP_${instance.store.config.tableRecordsLimit}_Exported_Data.csv.csv`);
        }
    }


    async renderTable() {

        const instance = this;
        let columns = R.map(R.objOf('field'), instance.dataKeys);
        let headers = R.map(R.objOf('title'), instance.headers);
        const cellAlignments = R.map(item => !isNaN(instance.tableData[0][item]) ? 'center' : 'right', instance.dataKeys);
        const alignments = R.map(R.objOf('hozAlign'), cellAlignments);
        const mapIndexed = R.addIndex(R.map);
        columns = mapIndexed((col, idx) => {
            let column = col;
            if (instance.derivedClass && instance.derivedClass.frozenDataKeys) {
                if (R.contains(column.field, instance.derivedClass.frozenDataKeys)) {
                    column = Object.assign(column, { frozen: true });
                }
            }
            return R.merge(R.merge(column, headers[idx]), alignments[idx]);
        }, columns);
        if (instance.derivedClass.prependColumns) {
            columns = R.prepend(instance.derivedClass.prependColumns, columns);
        }
        if (instance.derivedClass.appendColumns) {
            columns = R.append(instance.derivedClass.appendColumns, columns);
        }

    

        let dataTableConfig = this.remoteUrl ? {
            ajaxURL: this.remoteUrl,
            ajaxContentType: 'json',
            ajaxResponse: function (url, params, response) {
                //url - the URL of the request
                //params - the parameters passed with the request
                //response - the JSON object returned in the body of the response.
                instance.tableData = response[instance.derivedClass.dataSrc || 'd'];
                return instance.tableData; 
            }

        } : { data: this.tableData || this.store[this.storeDataKey] };
        dataTableConfig.columns = columns;
        dataTableConfig = Object.assign(dataTableConfig, instance.derivedClass.dataTableConfig);
        this.table = new Tabulator( "#" + this.id, dataTableConfig);
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


    // render the html from the template in the DOM

    render() {
        return html`${tabulatrTemplate({ id: this.id })}`
    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        await this.initSubscriptions();
    }


    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        $("#txtTableSearch").val('');
        const adminUser = $('#hdnViewerAttId').val();
        if (this.table) {
            this.table = null;
        }
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }

        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;

    }

    // attach event handlers (button click, etc)

    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {
        const instance = this;
        instance.stateManager.subscribe("sortCriteria",
            async d => {                
                if (instance.table) {
                    $("#tableSortLoader").show();
                    $("#txtTableSearch").val('');
                    const sortedData = await instance.sortData();                    
                    instance.tableData = sortedData;
                    instance.table.replaceData(sortedData);
                    $("#tableSortLoader").hide();
                }
            });
        instance.stateManager.subscribe("exportTableData",
            async d => {
                if (instance.tableData) {
                    const workbook = new ExcelJS.Workbook();
                    const csv = Papa.unparse(R.map(item => R.omit(instance.store.config.dataTableExportOmitKeys || [], item), instance.tableData));
                    const readable = Readable.from([csv]);
                    const worksheet1 = await workbook.csv.read(readable);
                    worksheet1.name = "Exported Data";
                    // const blob = new Blob([csv], { type: "text/plain;charset=utf-8" });
                    // saveAs(blob, `TOP_${instance.store.config.tableRecordsLimit}_Exported_Data.csv.csv`);
                    const worksheet2 = workbook.addWorksheet("ATT Proprietary");
                    worksheet2.getRow(1).getCell(1).value = "AT&T Proprietary and Confidential Information";
                    worksheet2.getRow(2).getCell(1).value = "Not for use or disclosure outside the AT&T companies except under written agreement.";
                    if (instance.store.methodologyAttributes && instance.store.methodologyAttributes.length) {
                        const worksheet3 = workbook.addWorksheet("Methodology");
                        let rownum = 1;
                        for (let i = 0; i < instance.store.methodologyAttributes.length; i += 1) {
                            const attribute = instance.store.methodologyAttributes[i];
                            if (attribute.header && attribute.header.length) {
                                const headerCell = worksheet3.getRow(rownum).getCell(1)
                                headerCell.value = attribute.header;
                                headerCell.font = { bold: true, underline: true };
                                rownum += 1;
                            }
                            for (let j = 0; j < attribute.content.length; j += 1) {
                                worksheet3.getRow(rownum).getCell(1).value = attribute.content[j];
                                rownum += 1;
                            }
                        }
                    }                    
                    const buffer = await workbook.xlsx.writeBuffer();
                    const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
                    saveAs(blob, "ALL_Exported_Data.xlsx");
                }

            });

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters 
        const SearchInputkeyUps = fromEvent($("#txtTableSearch"), 'keyup');
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => {
            const filterPredicates = [];
            const searchText = $("#txtTableSearch").val().toLowerCase();
            if (R.trim(searchText) === '') {
                instance.table.replaceData(instance.tableData);
            } else {
                for (let i = 0; i < instance.dataKeys.length; i += 1) {
                    filterPredicates.push(R.propSatisfies(val => R.contains(searchText, (val || '').toString().toLowerCase()), instance.dataKeys[i]));
                }
                const satisfySearch = R.anyPass(filterPredicates);
                const filteredData = R.filter(item => satisfySearch(item), instance.tableData);
                instance.table.replaceData(filteredData);
            }
        });
    
        instance.derivedClass.initSubscriptions ? instance.derivedClass.initSubscriptions() : null;
    }


}

customElements.define('ponder-tabulator', Tabulatr);

export default Tabulatr;
