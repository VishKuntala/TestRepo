import { html } from 'lit-element';
import * as R from 'ramda';
import $ from "jquery";
import searchDropdownTemplate from '../../../templates/components/searchDropdown.js';
import PonderComponent from '../PonderComponent.js';
import displayTextTransformer from './derivations/displayTextTransformer.js';





class SearchDropdown extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.allowMultipleSelection = false;
        this.clearable = true;
        this.searchable = false;
        this.disabled = false;
        this.enablePill = false;
        this.defaultText = '';
        this.remoteUrl = null;
        this.subscriptions = [];
        this.dependentFields = [];
        this.dependentKeys = [];
        this.pillsLabel = '';
        this.pillsValueSource = null;
        this.pillsPriority = 1;
        this.dataKey = '';
        this.derivation = null;
        this.derivedClass = null;
        this.randomId = Date.now().toString();
        this.classNames = null;
        this.ddValuesDataKey = null;
        this.changeTrigger = null;
        this.initialSelectedText = null;
        this.initialSelectedValue = null;
        this.requeryOnSelect = false;
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
            pillsLabel: {
                attribute: 'pillslabel',
                type: String
            },
            pillsPriority: {
                attribute: 'pillspriority',
                type: String
            },
            randomId: {
                attribute: 'randomid',
                type: String
            },
            pillsValueSource: {
                attribute: 'pillsvaluesource',
                type: String
            },
            dataKey: {
                attribute: 'datakey',
                type: String
            },
            allowMultipleSelection: {
                attribute: 'allowmultipleselection',
                type: Boolean,
                converter: value => value === "true" ? true : false
            },
            clearable: {
                type: Boolean,
                converter: value => value === "false" ? false : true
            },
            searchable: {
                type: Boolean,
                converter: value => value === "true" ? true : false
            },
            disabled: {
                attribute: 'disabled',
                type: Boolean,
                converter: value => value === "true" ? true : false
            },
            dependentFields: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            dependentKeys: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            enablePill: {
                attribute: 'enablepill',
                type: Boolean,
                converter: value => value ? value === "true" : false
            },
            derivation: {
                attribute: 'derivation',
                type: String
            },
            classNames: {
                attribute: 'classnames',
                type: String
            },
            ddValuesDataKey: {
                attribute: 'ddvaluesdatakey',
                type: String
            },
            initialSelectedText : {
                attribute: 'initialselectedtext',
                type: String
            },
            initialSelectedValue: {
                attribute: 'initialselectedvalue',
                type: String
            },
            requeryOnSelect: {
                attribute: 'requeryonselect',
                type: Boolean,
                converter: value => value ? value === "true" : false
            }
        }
    }

    // render the html from the template in the DOM

    render() {
        return html`${searchDropdownTemplate({
            id: this.id,
            defaultText: this.defaultText,
            allowMultipleSelection: this.allowMultipleSelection,
            disabled: this.disabled,
            classNames: this.classNames,
            clearable: this.clearable,
            isSearchable: !this.store.isMobile && this.searchable
        })}`
    }


    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {

        const instance = this;

        instance.appendSubscription(instance.stateManager.subscribe("tool",
            async d => {
                if (!R.is(Array, d)) {
                    instance.requestUpdate();
                }
            }));
        
        instance.appendSubscription(instance.stateManager.subscribe("deletedPill",
            async d => {
                // d is the deleted pill text which is of the form:
                // <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:pillpriority
                if (d && !R.is(Array, d) && d.split(':')[2] === instance.id) {
                    instance.store.changeTrigger = 'deletedPill';
                        let pillsData = R.clone(instance.store.pillsData) || [];
                        if (!instance.allowMultipleSelection) {
                            $(`#${instance.id}`).dropdown('clear');
                            pillsData = R.filter(item => !R.contains(`:${instance.id}`, item), pillsData);
                            instance.store.pillsData = pillsData;
                            instance.store[instance.dataKey] = '';
                        } else {
                            const pillValue = d.split(':')[1];
                            const item = $($(`#${instance.id} a.ui.label:contains(${pillValue})`)[0]);
                            const itemValue = item.attr('data-value');
                            if (itemValue) {
                                const currentSelectedValues = R.split(',', $(`#${instance.id}`).dropdown("get value"));
                                const currentValidValues = R.join(',', R.without(itemValue, currentSelectedValues));
                                // instance.store.triggerDropdownValueChangedEvent = false;
                                 $(`#${instance.id}`).dropdown('set exactly', currentValidValues.split(','));
                                 instance.store[instance.dataKey] = currentValidValues;

                            }
                        }

                    if (R.trim(R.reduce(R.concat, '', R.map(item => instance.store[item], instance.store.config.filter.requiredDataKeys))) === '') {
                        instance.store.clearFilters = Date.now().toString();
                    }

                }
            }));

        instance.derivedClass && instance.derivedClass.initSubscriptions ? instance.derivedClass.initSubscriptions() : null;
    }

    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const instance = this;
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        if (this.store.config.filter.initialValues) {
            const keys = R.keys(this.store.config.filter.initialValues);
            for (let i = 0; i < keys.length; i += 1) {
                const key = keys[i];
                if (this.dataKey === key) {
                    if (instance.pillsLabel) {
                        // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:<<pillpriority>>
                        let pillsData = R.clone(instance.store.pillsData) || [];
                        const itemToAdd = `${instance.pillsLabel}:${this.store.config.filter.initialValues[key]}:${instance.id}:${instance.pillsPriority}`;
                        pillsData = R.append(itemToAdd, pillsData);
                        instance.store.pillsData = pillsData;
                    }
                }
            }
        }
        await this.initSubscriptions();
    }

    // attach event handlers (button click, etc)

    async attachEventHandlers() {
        this.derivedClass && this.derivedClass.attachEventHandlers ? this.derivedClass.attachEventHandlers() : null;

    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivation) {
            const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            this.derivedClass = DerivedClass({ adminUser, instance: this });
        }
        const instance = this;
        let dropdownConfig = {
            saveRemoteData: false,
            clearable: this.clearable,
            apiSettings: this.remoteUrl ? {
                cache: false,
                url: this.remoteUrl,
                beforeSend: (settings) => {
                    if (instance.derivedClass && instance.derivedClass.buildQueryStringFromStore) {
                        settings.data = instance.derivedClass.buildQueryStringFromStore(true);
                    }
                    return settings;
                },
                beforeXHR: (xhr) => {
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    // reset propogation for dropdwon changed event
                    instance.store.triggerDropdownValueChangedEvent = true;
                    instance.store.changeTrigger = null;
                },
                onResponse: function (response) {
                    let results = response.d;
                    if (instance.allowMultipleSelection) {
                        // replace commas in the value with caret to avoid wrong splits on the commas
                        results = R.map(item => R.merge(item, { value: !isNaN(item.value) ? item.value : item.value.replace(/,/g, '^') }), R.clone(results));
                    }
                    if (displayTextTransformer[instance.dataKey]) {
                        results = R.map(item => R.merge(item, { name: displayTextTransformer[instance.dataKey][item.name] }), R.clone(results))
                    }
                    return {
                        "success": true, results
                    };
                },
            } : null,
            values: this.ddValuesDataKey ? this.store[this.ddValuesDataKey] : null,
            onAdd: (addedValue, addedText, $addedChoice) => {
                instance.store.changeTrigger = null;
                if (instance.pillsLabel) {
                    // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:<<pillpriority>>
                    let pillsData = R.clone(instance.store.pillsData) || [];
                    const itemToAdd = `${instance.pillsLabel}:${instance.pillsValueSource === "text" ? addedText : addedValue}:${instance.id}:${instance.pillsPriority}`;
                    pillsData = R.append(itemToAdd, pillsData);
                    instance.store.pillsData = pillsData;
                }
            },
            onRemove: (removedValue, removedText, $removedChoice) => {
                if (instance.pillsLabel) {
                    // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:<<pillpriority>>
                    let pillsData = R.clone(instance.store.pillsData) || [];
                    const itemToRemove = `${instance.pillsLabel}:${instance.pillsValueSource === "text" ? removedText : removedValue}:${instance.id}:${instance.pillsPriority}`;
                    pillsData = R.without([itemToRemove], pillsData);
                    instance.store.pillsData = pillsData;
                }
            },
            onChange: (value, text, $choice) => {
                if (instance.store.changeTrigger === 'deletedPill') {
                    return;
                }
                instance.store[instance.dataKey] = value;
                // publish dropdownValueChanged event to all listeners

                if (instance.store.triggerDropdownValueChangedEvent) {
                    instance.store.dropdownValueChanged = `${Date.now().toString()}^${instance.id}`;
                } 
                // if it is multi-select then onAdd and onRemove will be more appropriate

                if (!instance.allowMultipleSelection && instance.pillsLabel) {
                    // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:<<pillpriority>>
                    let pillsData = R.clone(instance.store.pillsData) || [];
                    if (text) { // item has been selected
                        const itemToAdd = `${instance.pillsLabel}:${instance.pillsValueSource === "text" ? text : value}:${instance.id}:${instance.pillsPriority}`;
                        pillsData = R.filter(item => !R.contains(`:${instance.id}`, item), pillsData);
                        pillsData = R.append(itemToAdd, pillsData);
                    } else { // dropdown has been cleared
                        pillsData = R.filter(item => !R.contains(`:${instance.id}`, item), pillsData);
                    }
                    instance.store.pillsData = pillsData;
                }
            },
            minCharacters: 3
        };
        if (instance.derivedClass && instance.derivedClass.dropdownConfig) {
            dropdownConfig = Object.assign(dropdownConfig, instance.derivedClass.dropdownConfig);
        }
        $(`#${this.id}`)
            .dropdown(dropdownConfig);
        if (instance.initialSelectedText && instance.initialSelectedValue) {
            instance.store.triggerDropdownValueChangedEvent = false;
            // $(`#${instance.id}`).dropdown('change values', [{ name: instance.initialSelectedText, value: instance.initialSelectedValue  }]);
            $(`#${instance.id}`).dropdown('set exactly', instance.initialSelectedValue.split(','));
            instance.store[instance.dataKey] = instance.initialSelectedValue;
        }
    
        await this.attachEventHandlers();


    }



}


customElements.define('ponder-search-dd', SearchDropdown);

