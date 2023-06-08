import { html } from 'lit-element';
import * as R from 'ramda';
import $ from "jquery";
import { fromEvent } from "rxjs";
import { debounceTime } from "rxjs/operators";
import searchTextboxTemplate from '../../../templates/components/searchTextbox.js';
import PonderComponent from '../PonderComponent.js';





class SearchTextbox extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.disabled = false;
        this.enablePill = false;
        this.defaultText = '';
        this.textLabel = '';
        this.pillsLabel = '';
        this.pillsValueSource = null;
        this.pillsPriority = 1;
        this.dataKey = '';
        this.derivation = null;
        this.derivedClass = null;
        this.randomId = Date.now().toString();
        this.changeTrigger = null;
    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'searchtextboxid',
                type: String
            },
            defaultText: {
                attribute: 'defaulttext',
                type: String
            },
            textLabel: {
                attribute: 'textlabel',
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
            disabled: {
                attribute: 'disabled',
                type: Boolean,
                converter: value => value === "true" ? true : false
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
        }
    }

    // render the html from the template in the DOM

    render() {
        return html`${searchTextboxTemplate({
            id: this.id,
            defaultText: this.defaultText,
            disabled: this.disabled,
            textLabel: this.textLabel,
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

        // subscribe to keyup event from the search textbox. However instead of reacting to every single keyup event,
        // introduce a delay to allow the user to type in a few characters

        const SearchInputkeyUps = fromEvent($(`#${instance.id}`), "keyup");
        const searchInputkeyUp = SearchInputkeyUps.pipe(debounceTime(1000));
        searchInputkeyUp.subscribe(x => {
            const searchText = R.trim($(`#${instance.id}`).val().toLowerCase());
            instance.store[instance.dataKey] = searchText;
            if (instance.pillsLabel) {
                // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:<<pillpriority>>
                let pillsData = R.clone(instance.store.pillsData) || [];
                if (searchText !== '') { 
                    const itemToAdd = `${instance.pillsLabel}:${searchText}:${instance.id}:${instance.pillsPriority}`;
                    pillsData = R.filter(item => !R.contains(`:${instance.id}`, item), pillsData);
                    pillsData = R.append(itemToAdd, pillsData);
                } else { // dropdown has been cleared
                    pillsData = R.filter(item => !R.contains(`:${instance.id}`, item), pillsData);
                }
                instance.store.pillsData = pillsData;
            }

            const requiredChecker = instance.store.config.filter.requiredBooleanOperator === "all" ?
                R.reduce(R.add, 0, R.map(item => R.trim(instance.store[item] || '') === '' ? 1 : 0, instance.store.config.filter.requiredDataKeys)) === 0 :
                R.reduce(R.concat, '', R.map(item => R.trim(instance.store[item] || ''), instance.store.config.filter.requiredDataKeys)) !== '';
            if (!requiredChecker) {
                if (!R.includes(instance.dataKey, instance.store.config.filter.requiredDataKeys)) {
                    $(`#${instance.id}`).val('');
                    if (instance.store.config.filter.requiredDataKeys?.length) {
                        $(`#${instance.id}`).addClass('disabled');
                    }
                }
                $(`.btnSubmit`).addClass('disabled');
            } else { // all the *required* dropdowns have values, enable the submit button and also enable this dropdown
                $(`#${instance.id}`).removeClass('disabled');
                $(`.btnSubmit`).removeClass('disabled');
            }
        });

        instance.stateManager.subscribe("clearFilters",
            async d => {
                $(`#${instance.id}`).val('');
                instance.store[instance.dataKey] = '';
                if (instance.pillsLabel) {
                    // pillsData is an array of strings - each pill string is of the format <<pill title>>:<<pill value>>:<<id of the control that generated the pill>>:<<pillpriority>>
                    let pillsData = R.clone(instance.store.pillsData) || [];
                    pillsData = R.filter(item => !R.contains(`:${instance.id}`, item), pillsData);
                    instance.store.pillsData = pillsData;
                }
                if (!instance.store.config.filter.requiredDataKeys?.length) {
                    $(`.btnSubmit`).removeClass('disabled');
                }
            }
        );

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
        await this.attachEventHandlers();
    }



}


customElements.define('ponder-search-textbox', SearchTextbox);

