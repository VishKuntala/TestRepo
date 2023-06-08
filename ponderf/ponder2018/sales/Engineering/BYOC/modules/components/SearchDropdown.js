import { html } from 'lit-element';
import * as R from 'ramda';
import $ from "jquery";
import searchDropdownTemplate from '../../templates/components/searchDropdown.js';
import PonderComponent from './PonderComponent';





class SearchDropdown extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.allowMultipleSelection = false;
        this.defaultText = '';
        this.remoteUrl = null;
        this.storeDataKey = null;
        this.subscriptions = [];

    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'searchdropdownid',
                type: String
            },
            defaultText: {
                attribute: 'defaulttext',
                type: String
            },
            remoteUrl: {
                attribute: 'remoteurl',
                type: String
            },
            storeDataKey: {
                attribute: 'storedatakey',
                type: String
            },
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            allowMultipleSelection: {
                attribute: 'allowmultipleselection',
                type: Boolean,
                converter: value => value ? value === "true" : false
            }
        }
    }

    // render the html from the template in the DOM

    render() {
        return html`${searchDropdownTemplate({ id: this.id, defaultText: this.defaultText, allowMultipleSelection: this.allowMultipleSelection })}`
    }


    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {


    }

    // attach event handlers (button click, etc)

    async attachEventHandlers() {
    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const instance = this;
        // compile plain html to one or more semantic components.

        const dropDownDataConfig = this.remoteUrl ? {
            apiSettings: {
                url: `${this.remoteUrl}`,
                beforeXHR: (xhr) => {
                    xhr.setRequestHeader('Content-Type', 'application/json');
                },
                onResponse: function (response) {
                    return { "success": true, results: response.d };
                },
            }
        } : { values: this.store[this.storeDataKey] };


        $(`#${this.id}`)
            .dropdown(Object.assign({
                onAdd: (addedValue, addedText, $addedChoice) => {
                    console.log(addedValue);
                },
                onRemove: (removedValue, removedText, $removedChoice) => {
                    console.log(removedValue);
                },
                onChange: (value, text, $choice) => {
                    console.log(value);
                },
                minCharacters: 3
            }, dropDownDataConfig));
    }



}


customElements.define('ponder-search-dd', SearchDropdown);


