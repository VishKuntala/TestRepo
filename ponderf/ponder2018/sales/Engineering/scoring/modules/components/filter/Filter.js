import { html } from 'lit-element';
import * as R from 'ramda';
import $ from "jquery";
import filterTemplate from '../../../templates/components/filter.js';
import PonderComponent from '../PonderComponent.js';
import { buildPayloadFromStore } from "../../helpers/remoteData.js";
import { until } from 'lit-html/directives/until.js';




class Filter extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.subscriptions = [];
        this.mapData = null;
        this.derivation = null;
        this.derivedClass = null;


    }

    // declare properties and map it from attribute values
    static get properties() {
        return {
            id: {
                attribute: 'filterid',
                type: String
            },
            subscriptions: {
                type: Array,
                converter: value => value ? value.split(',') : []
            },
            derivation: {
                attribute: 'derivation',
                type: String
            }
        }
    }

    buildQueryStringFromStore(blankOutExistingValue, filterDropdown) {


        let queryStringData = buildPayloadFromStore(filterDropdown);

        //blank out the existing value for the data that the dropdown is trying to fetch
        // we don't want the request to fetch data for the states dropdown (for example) send a
        // previously selected statecode which will then be used by the webmethod in the oracle select
        // statement to get distinct states.

        if (blankOutExistingValue) {
            queryStringData[filterDropdown.dataKey] = "";
        }

        // set the queryString params for the remote data fetch call
        return queryStringData;

    }

    async fetchData() {
        const instance = this;
        const ponderMap = $($("ponder-map[mapid='map1']")[0])[0];
        const ponderDatatable = $($("ponder-tabulator[tableid='tblSvids']")[0])[0];
        ponderDatatable.table = null;
        $(`#${instance.id} .ui.submit`).addClass('loading');
        const postData = this.buildQueryStringFromStore(false, instance);
        const results = [];

        // fetch initial map data (columns lat,lng, campaign_id and coverage_score without limits)        
        results.push($.ajax({
            url: `${instance.store.config.baseUrl}/MapData`,
            headers: { "Content-Type": "application/json" },
            type: 'post',
            data: JSON.stringify(Object.assign(postData, {attribute: (instance.store.config.map && instance.store.config.map.heatmapAttribute) || 'COVERAGE_SCORE', limit: null })),
            processData: false
        }));

        // fetch table data (all columns but limited to only config.tableRecordsLimit rows)

        results.push($.ajax({
            url: `${instance.store.config.baseUrl}/TableData`,
            headers: { "Content-Type": "application/json" },
            type: 'post',
            data: JSON.stringify(Object.assign(postData, { limit: instance.store.config.tableRecordsLimit, buildSortColumns: true })),
            processData: false
        }));

        // fetch store data

        if (instance.appState.storeData) {
            ponderMap.storeData = instance.appState.storeData;
        } else {
            const res = await $.ajax({
                url: `${instance.store.config.baseUrl}/StoreData`,
                headers: { "Content-Type": "application/json" },
                type: 'post',
                data: JSON.stringify({ statecode: '', zipcode: '' }),
                processData: false
            });
            ponderMap.storeData = res.d;
            instance.appState.storeData = res.d;
        }

        await Promise.all(results);
        ponderMap.mapData = results[0].responseJSON.d;
        $(`#${instance.id} .ui.submit`).removeClass('loading');
        $(`#${instance.id} .ui.submit`).addClass('disabled');

        if (ponderMap.mapData.length) {
            $(".mapAndTable.segment").show();
            $(".charts.segment .inline.loader").show();
            $(".charts.segment ponder-barchart").hide();
            $(".charts.segment").show();
            $(".filter.form").hide();
            $("#filterGrid").hide();
            $(".showFilter.button").show();
            $(".showFilter.button").html('Show Filter');
            $(`#sortCriteria`).dropdown('change values', instance.store.config.sortCriteriaData);

            $("#mapLocationCount").html(`(${new Intl.NumberFormat().format(ponderMap.mapData.length)})`);
            instance.store.mapDataLength = ponderMap.mapData.length;
            if (ponderMap.mapData.length > instance.store.config.tableRecordsLimit) {
                // $("#btnExportTopLocations").show();
                $("#tableTitle").html(`${instance.store.toolName} Top ${instance.store.config.tableRecordsLimit} Locations`);
            } else {
                // $("#btnExportTopLocations").hide();
                $("#tableTitle").html(``);
            }


            await ponderMap.renderMap();
            ponderDatatable.tableData = results[1].responseJSON.d;
            await ponderDatatable.renderTable();

            // trigger chart rendering

            instance.store.renderChart = postData;
        }


    }

    async requery(filterDropdown, blankOutExistingValue) {
        const instance = this;
        const webmethodName = R.takeLast(1, filterDropdown.remoteUrl.split('/'))[0];
        return $.ajax({
            url: `${filterDropdown.store.config.baseUrl}/${webmethodName.replace('{query}', '')}`,
            headers: { "Content-Type": "application/json" },
            type: 'get',
            data: this.buildQueryStringFromStore(blankOutExistingValue, filterDropdown)
        });
    }

    // render the html from the template in the DOM

    /* render() {
        return html`${filterTemplate({
            id: this.id
        })}`
    } */

    render() {

        const instance = this;
        const adminUser = $('#hdnViewerAttId').val();
        if (!this.derivedClass) {
            return html`
            ${until(
                import(`./derivations/${this.derivation}`)
                    .then(response => {
                        const DerivedClass = response.default;
                        until(DerivedClass({ adminUser, instance })
                            .then(res => {
                                instance.derivedClass = res;
                                instance.requestUpdate();
                            }).catch((error) => { console.error('Error:', error); }),
                            html`<h4>Loading...</h4>`);
                    })
                    .catch((error) => { console.error('Error:', error); }),
                html`<h4>Loading...</h4>`
            )}`;
        } else {
            return html`${filterTemplate({ id: instance.id })}`;
        }

    }


    // attach event handlers (button click, etc)
    async attachEventHandlers() {
        const instance = this;
        $(`#${instance.id} .ui.submit`).off().on('click', async function () {
            $(`.btnClear`).addClass('disabled');
            await instance.fetchData();
            $(`.btnClear`).removeClass('disabled');
        });

        $(`.btnClear`).off().on('click', async function () {
            // trigger clear in all the dropdowns
            instance.store.clearFilters = Date.now().toString();
            $(".mapAndTable.segment").hide();
            $(".charts.segment").hide();
            $("#tableSortLoader").hide();
        });

        $(`.showFilter.button`).off().on('click', async function () {
            if ($(".filter.form").is(":visible")) {
                $(".showFilter.button").html('Show Filter');
                $(".filter.form").hide();
                $("#filterGrid").hide();
            } else {
                $(".showFilter.button").html('Hide Filter');
                $(".filter.form").show();
                $("#filterGrid").show();

            }

        });
        this.derivedClass && this.derivedClass.attachEventHandlers ? await this.derivedClass.attachEventHandlers() : null;
    }

    async initializeAppWithQueryParams(queryStringObject) {
        const instance = this;
        if (instance.initializationInProgress) {
            return;
        }
        instance.initializationInProgress = true;
        instance.store.triggerDropdownValueChangedEvent = false;
        for (let i = 0; i < $(`ponder-filter ponder-search-dd`).length; i += 1) {
            const filterDropdown = $($(`ponder-filter ponder-search-dd`)[i])[0];
            if (queryStringObject[filterDropdown.dataKey]) {
                // if (filterDropdown.remoteUrl) {
                const response = await instance.requery(filterDropdown, true);

                    // replace commas in the value with caret to avoid wrong splits on the commas
                    const results = R.map(item => R.merge(item, { value: !isNaN(item.value) ? item.value : item.value.replace(/,/g, '^') }), response.d);
                    const currentValidValues = R.intersection(queryStringObject[filterDropdown.dataKey].split(','), R.pluck('value', results));
                    $(`#${filterDropdown.id}`).dropdown('change values', results);

                    //const currentValidValues = R.intersection(queryStringObject[filterDropdown.dataKey].split(','), R.pluck('value', response.d));
                    //$(`#${filterDropdown.id}`).dropdown('change values', response.d);
                    $(`#${filterDropdown.id}`).dropdown('set exactly', currentValidValues);
                    filterDropdown.store[filterDropdown.dataKey] = currentValidValues.join(',');
               // }
            }
            if (R.trim(R.reduce(R.concat, '', R.map(item => filterDropdown.store[item] || '', filterDropdown.store.config.filter.requiredDataKeys))) === '') {
                $(`.btnSubmit`).addClass('disabled');
            } else {
                $(`#${filterDropdown.id}`).removeClass('disabled');
                $(`.btnSubmit`).removeClass('disabled');
            }
        }
        instance.store.triggerDropdownValueChangedEvent = true;
        if (!$(`.btnSubmit`).hasClass('disabled')) {
            $(`#${instance.id} .ui.submit`).click();
        }
        instance.initializationInProgress = false;
    }

    // Subscribe to Observables (publishers) declared in other components

    async initSubscriptions() {
        const instance = this;


        this.stateManager.subscribe("tool",
            async d => {
                if (!R.is(Array, d)) {
                    const adminUser = $('#hdnViewerAttId').val();
                    const DerivedClass = (await import(`./derivations/${d.tool}/${d.tool}.js`)).default;
                    instance.derivedClass = await DerivedClass({ adminUser, instance });
                    instance.requestUpdate();
                }

            });

        instance.stateManager.subscribe("pillsData",
            async d => {
                if (d && R.is(Array, d) && d.length) {
                    $(`.btnClear`).removeClass('disabled');
                } else {
                    $(`.btnClear`).addClass('disabled');
                }
            });

        this.stateManager.subscribe("dropdownValueChanged",
            async d => {
                if (d && !R.is(Array, d)) {
                    // d is of the form randomnumber^instanceidofdropdownthattriggeredthisevent

                    const idOfDropdownPublishingThisEvent = d && d.split ? d.split('^')[1] : '';
                    const dropdownInstance = $($(`ponder-search-dd[searchdropdownid='${idOfDropdownPublishingThisEvent}']`)[0])[0];

                    // if this dropdown is not part of the filter secton, then do nothing
                    if ($(`#${dropdownInstance.id}`).closest('ponder-filter').length === 0) {
                        return;
                    }

                    const requiredChecker = instance.store.config.filter.requiredBooleanOperator === "all" ?
                        R.reduce(R.add, 0, R.map(item => R.trim(instance.store[item] || '') === '' ? 1 : 0, instance.store.config.filter.requiredDataKeys)) === 0 :
                        R.reduce(R.concat, '', R.map(item => R.trim(instance.store[item] || ''), instance.store.config.filter.requiredDataKeys)) !== ''; 
                    if (!requiredChecker) {
                    // if (R.trim(R.reduce(R.concat, '', R.map(item => dropdownInstance.store[item] || '', dropdownInstance.store.config.filter.requiredDataKeys))) === '') {
                        if (!R.includes(dropdownInstance.dataKey, dropdownInstance.store.config.filter.requiredDataKeys)
                            && idOfDropdownPublishingThisEvent !== dropdownInstance.id) {
                            $(`#${dropdownInstance.id}`).dropdown('clear');
                            $(`#${dropdownInstance.id}`).addClass('disabled');
                        }
                        $(`.btnSubmit`).addClass('disabled');
                    } else {
                        $(`#${dropdownInstance.id}`).removeClass('disabled');
                        $(`.btnSubmit`).removeClass('disabled');
                    }
                    try {
                        instance.store.triggerDropdownValueChangedEvent = false;
                        $(`ponder-filter ponder-search-dd div.dropdown`).addClass('disabled');
                        for (let i = 0; i < $(`ponder-filter ponder-search-dd`).length; i += 1) {
                            const filterDropdown = $($(`ponder-filter ponder-search-dd`)[i])[0];
                            // if the dropdown had already been accessed, it will have either the list of options populated or
                            // a message indicating "No results found".
                            const dropdownItemsCount = $($(`ponder-filter ponder-search-dd`)[i]).find('div.item').length;
                            const noResultsFoundMessageCount = $($(`ponder-filter ponder-search-dd`)[i]).find('div.message').length;
                            // requery the dropdown values from the remote url if the
                            // 1. dropdown is a multi-select
                            // 2. if the dropdown is not the one that initiated the dropdown value change event
                            // 3. if the dropdown has already been accessed before and a remote call was made to fetch the options for the dropdown
                            if (filterDropdown.requeryOnSelect || (filterDropdown.allowMultipleSelection
                                && filterDropdown.dataKey !== dropdownInstance.dataKey
                                && (dropdownItemsCount !== 0 || noResultsFoundMessageCount !== 0))) {
                                const response = await instance.requery(filterDropdown, true);

                                // replace commas in the value with caret to avoid wrong splits on the commas
                                const results = R.map(item => R.merge(item, { value: !isNaN(item.value) ? item.value : item.value.replace(/,/g, '^') }), response.d);
                                const currentValidValues = R.intersection(filterDropdown.store[filterDropdown.dataKey].split(','), R.pluck('value', results));
                                $(`#${filterDropdown.id}`).dropdown('change values', results);

                                //const currentValidValues = R.intersection(filterDropdown.store[filterDropdown.dataKey].split(','),  R.pluck('value', response.d));
                                //$(`#${filterDropdown.id}`).dropdown('change values', response.d);
                                $(`#${filterDropdown.id}`).dropdown('set exactly', currentValidValues);
                                filterDropdown.store[filterDropdown.dataKey] = currentValidValues.join(',');
                            }
                        }
                        instance.store.triggerDropdownValueChangedEvent = true;
                        $(`ponder-filter ponder-search-dd div.dropdown`).removeClass('disabled');
                        instance.store.postDropdownValueChanged = d;
                    } catch (err) {
                        console.log(err);
                        instance.store.triggerDropdownValueChangedEvent = true;
                        $(`ponder-filter ponder-search-dd div.dropdown`).removeClass('disabled');
                        instance.store.postDropdownValueChanged = d;

                    }
                }
            });
        this.derivedClass && this.derivedClass.initSubscriptions ? await this.derivedClass.initSubscriptions() : null;
    }



    // first updated is called the first time the html is rendered on the DOM. 
    async firstUpdated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivedClass) {
            const filterHtml = await this.derivedClass.html();
            $('.filter.container').html(filterHtml({ id: this.id, config: this.store.config }));
        }
        await this.initSubscriptions();
    }



    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivedClass) {
            const filterHtml = await this.derivedClass.html();
            $('.filter.container').html(filterHtml({ id: this.id, config: this.store.config }));
        }
        await this.attachEventHandlers();
        this.derivedClass && this.derivedClass.updated ? await this.derivedClass.updated(changedProperties) : null;
        // if the app is invoked/initialized using querystring values for the different filter dropdowns
        // fetch data for any filter dropdowns that has the datakey as one of the querystring keys.
        // set the dropdown value to the value passed for the key in the querystring
        // submit the filters to render the map/chart/table
        // grab query string params
        const urlParams = new URLSearchParams(window.location.search);
        if (this.store.appInitializedWithQueryParams && $(`ponder-filter ponder-search-dd`).length) {
            const keys = Array.from(urlParams.keys());
            const values = Array.from(urlParams.values());
            await this.initializeAppWithQueryParams(R.zipObj(keys, values));
            this.store.appInitializedWithQueryParams = false;
        }

    }



}


customElements.define('ponder-filter', Filter);


