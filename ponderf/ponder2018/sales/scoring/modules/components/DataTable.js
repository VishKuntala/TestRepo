import $ from "jquery";
// import dataTable from 'datatables.net';
import dataTable from 'datatables.net-se';
import { html } from 'lit-element';
import dataTableTemplate from '../../templates/components/dataTable.js';
import PonderComponent from './PonderComponent';


class DataTable extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.subscriptions = [];
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
            }
        }
    }

// private class method (starts with #)
async #renderTable() {
    $("#" + this.id).dataTable();
}

// render the html from the template in the DOM

render() {
    return html`${dataTableTemplate({ id: this.id })}`
}

// updated is called after the html is rendered on the DOM.
async updated(changedProperties) {
    await this.initSubscriptions();
    await this.#renderTable();
}

// Subscribe to Observables (publishers) declared in other components
async initSubscriptions() {
    const instance = this;
    for (let i = 0; i < this.subscriptions.length; i += 1) {
        const subscription = this.subscriptions[i];
        if (subscription === "mapData") {
            instance.stateManager.subscribe(subscription,
                async d => {
                    instance[subscription] = d;
                    console.log(d);
                    await instance.#renderTable();
                });
        }
    }
}


  }

// customElements.define('ponder-datatable', DataTable);

// export default DataTable;
