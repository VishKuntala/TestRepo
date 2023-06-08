import $ from "jquery";
import * as R from 'ramda';
require('datatables.net-select-se');
require('datatables.net-se');
require('datatables.net-responsive-se');


import { html } from 'lit-element';
import dataTableTemplate from '../../../templates/components/dataTable.js';
import PonderComponent from '../PonderComponent';


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
    let columns = R.map(R.objOf('data'), this.dataKeys);
    columns = R.prepend(instance.derivedClass.prependColumns, columns);
    columns = R.append(instance.derivedClass.appendColumns, columns);
    if (instance.derivedClass.createdCell) {
        columns = R.forEach(c => Object.assign(c, { createdCell: instance.derivedClass.createdCell }), R.clone(columns));
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
    dataTableConfig = Object.assign(dataTableConfig, instance.derivedClass.dataTableConfig);
    this.table = $("#" + this.id).DataTable(dataTableConfig);
    $('#' + this.id + ' tbody').off().on('click', 'button', function (e) {
        var data = instance.table.row($(this).parents('tr')).data();
        const publishAttribute = e.target.getAttribute('data-publish-attr');
        instance.store[publishAttribute] = data[instance.primaryKeyColumn];
    });

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
    return html`${dataTableTemplate({ id: this.id, headers: this.headers })}`
}

// updated is called after the html is rendered on the DOM.

async updated(changedProperties) {
    const adminUser = $('#hdnViewerAttId').val();
    const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
    this.derivedClass = DerivedClass({ adminUser, instance:this });
    await this.initSubscriptions();
    if (!this.table && (this.remoteUrl || this.tableData || this.store[this.storeDataKey])) {
        await this.renderTable();
    }
    const instance = this;


}

// Subscribe to Observables (publishers) declared in other components
async initSubscriptions() {
    const instance = this;
    instance.derivedClass.initSubscriptions ? instance.derivedClass.initSubscriptions() : null;
}


  }

customElements.define('ponder-datatable', DataTable);

export default DataTable;
