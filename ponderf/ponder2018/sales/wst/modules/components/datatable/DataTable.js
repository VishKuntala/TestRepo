import $ from "jquery";
import * as R from 'ramda';
import Papa from 'papaparse';
import { saveAs } from 'file-saver';
// require('datatables.net-select-se');
require('datatables.net-se');
// require('datatables.net-responsive-se');
require('datatables.net-fixedcolumns-se');
// require('datatables.net-fixedcolumns');


import { html } from 'lit-element';
import dataTableTemplate from '../../../templates/components/dataTable.js';
import PonderComponent from '../PonderComponent.js';


class DataTable extends PonderComponent {


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


    async renderTable() {

        const instance = this;
        if (instance.table) {
            instance.table.destroy();
            instance.table = null;
        }
    let columns = R.map(R.objOf('data'), instance.dataKeys);
    let headers = R.map(R.objOf('title'), instance.headers);
    const mapIndexed = R.addIndex(R.map);
    // columns = mapIndexed((col, idx) => R.merge(col, headers[idx]), columns);
    if (instance.derivedClass.prependColumns) {
        columns = R.prepend(instance.derivedClass.prependColumns, columns);
    }
    if (instance.derivedClass.appendColumns) {
        columns = R.append(instance.derivedClass.appendColumns, columns);
    }
    if (instance.derivedClass.createdCell) {
        columns = R.forEach(c => Object.assign(c, { createdCell: instance.derivedClass.createdCell, className: instance.derivedClass.nowrap ? 'nowrap':'' }), R.clone(columns));
    }
    let dataTableConfig = this.remoteUrl ? {
        ajax: {
            'url': this.remoteUrl,
            'type': 'GET',
            'dataType': 'json',
            'dataSrc': instance.derivedClass.dataSrc || 'd',
            'beforeSend': function (request) {
                request.setRequestHeader('Content-Type', 'application/json');
            },
            'complete': function (jqXHR, textStatus) {
                instance.tableData = jqXHR.responseJSON.d;
            }
        }
    } : { data: this.tableData || this.store[this.storeDataKey] };
    dataTableConfig.columns = columns;
    dataTableConfig.responsive =  {
        details: false
    };
    dataTableConfig.initComplete = function (settings, json) {
         $("#" + instance.id).wrap("<div style='overflow:auto; width:100%;position:relative;'></div>");
    }
     dataTableConfig = Object.assign(dataTableConfig, instance.derivedClass.dataTableConfig);
    this.table = $("#" + this.id).DataTable(dataTableConfig);
        this.table.columns.adjust().draw();
    $('#' + this.id + ' tbody').off().on('click', 'button', function (e) {
        const data = instance.table.row($(this).parents('tr')).data();
        const publishAttribute = e.target.getAttribute('data-publish-attr');
        instance.store[publishAttribute] = data[instance.primaryKeyColumn];
    });
    $('#' + this.id + ' tbody').off().on('click', 'input[type=checkbox]', function (e) {
        const data = instance.table.row($(this).parents('tr')).data();
        const publishAttribute = e.target.getAttribute('data-publish-attr');
        instance.store[publishAttribute] = data;
    });
    await this.attachEventHandlers();

}

async filterTableData() {

    if (this.table) {
        this.table.clear();
        this.table.rows.add(R.filter(this.store.filterClusterTable, this.tableData));
        this.table.draw();
    }
}

async reloadTableData(d) {
    if (d && d.length) {
        this.tableData = d;
        if (this.table) {
            this.table.clear();
            this.table.rows.add(this.tableData);
            this.table.draw();
        } else {
            await this.renderTable();
        }
    }
}

async loadRemoteData() {
    if (this.table) {
        this.table.ajax.reload();
    }
}

// render the html from the template in the DOM

render() {
    return html`${dataTableTemplate({ id: this.id })}`
}

// first updated is called the first time the html is rendered on the DOM. 
 async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
            $('.ui.datatable').html(this.derivedClass.html({ id: this.id, headers: this.headers, config: this.store.config }));
        }
        await this.initSubscriptions();
}


// updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.table) {
            this.table.destroy();
            this.table = null;
        }
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
           $('.ui.datatable').html(this.derivedClass.html({ id:this.id,  headers: this.headers, config: this.store.config }));
        }

        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;

        /* if (!this.table && (this.remoteUrl || this.tableData || this.store[this.storeDataKey])) {
            await this.renderTable();
        } */
 

}

    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

// Subscribe to Observables (publishers) declared in other components
async initSubscriptions() {
    const instance = this;
    instance.stateManager.subscribe("exportTableData",
        async d => {
            if (instance.tableData) {
                const csv = Papa.unparse(instance.tableData);
                const blob = new Blob([csv], { type: "text/plain;charset=utf-8" });
                saveAs(blob, "TOP_500_Exported_Data.csv.csv");
            }

        });
    instance.derivedClass.initSubscriptions ? instance.derivedClass.initSubscriptions() : null;
}


  }

customElements.define('ponder-datatable', DataTable);

export default DataTable;
