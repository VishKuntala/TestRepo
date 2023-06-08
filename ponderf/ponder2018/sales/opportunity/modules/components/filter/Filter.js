import { html } from 'lit-element';
import { until } from 'lit-html/directives/until.js';
import * as R from 'ramda';
import centroid from "@turf/centroid";
import $, { post } from "jquery";
import filterTemplate from '../../../templates/components/filter.js';
import PonderComponent from '../PonderComponent.js';
import { buildPayloadFromStore } from "../../helpers/remoteData.js";
import { config } from "../azureMap/derivations/mainMap/config/config.js";




class Filter extends PonderComponent {


    constructor() {
        super();
        this.id = '';
        this.subscriptions = [];
        this.mapData = null;
        this.derivation = null;
        this.derivedClass = null;
        this.canZoomToSalesMarket = false;


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

    async zoomToSalesMarket() {
        const instance = this;
        if (instance.store.config.filter.zoomToAreaDataKey && instance.canZoomToSalesMarket) {
            const params = { id: instance.store[instance.store.config.filter.zoomToAreaDataKey] };
            const boundaryData = await instance.getData(
                `${instance.store.baseSearchApiUrl}/geodata/none/salesMarketBoundary.geojson`,
                params
            );
            const salesMarketCenter = centroid(boundaryData);
            instance.store.zoomToPoint = {
                lat: salesMarketCenter.geometry.coordinates[1],
                lng: salesMarketCenter.geometry.coordinates[0],
                zoom: config.heatmapLayers.DMA.maxZoom - 1,
                addMarker: false,
            };
            // instance.store.salesMarketBoundary = boundaryData.data;
        }

    }

    async fetchData() {        
        const instance = this;
        //$("#addlInfo").html('');
        //$("#mainTableTab").html(`${instance.store.config.toolName}`);
        $(`.btnClear`).addClass('disabled');
        //instance.store.searchedZip = null;
        //const ponderMap = $($("ponder-maplibre[mapid='mainMap']")[0])[0];
        //const ponderDatatable = $($("ponder-tabulator[tableid='mainTable']")[0])[0];
        //ponderDatatable.table = null;
        //$(`#${instance.id} .ui.submit`).addClass('loading');
        const postData = this.buildQueryStringFromStore(false, instance);
        //const results = [];

        //// fetch initial map data (columns lat,lng, campaign_id and coverage_score without limits)        
        ///*   results.push($.ajax({
        //       url: `${instance.store.config.baseUrl}/MapData`,
        //       headers: { "Content-Type": "application/json" },
        //       type: 'post',
        //       data: JSON.stringify(Object.assign(postData, {attribute: (instance.store.config.map && instance.store.config.map.heatmapAttribute) || 'COVERAGE_SCORE', limit: null })),
        //       processData: false
        //   })); */

        //// fetch table data (all columns but limited to only config.tableRecordsLimit rows)

        ///* results.push($.ajax({
        //     url: `${instance.store.config.baseUrl}/table`,
        //     headers: { "Content-Type": "application/json" },
        //     type: 'post',
        //     data: JSON.stringify(Object.assign(postData, { limit: instance.store.config.tableRecordsLimit, buildSortColumns: true })),
        //     processData: false
        // })); */

        //// fetch store data

        ///*    if (instance.appState.storeData) {
        //        ponderMap.storeData = instance.appState.storeData;
        //    } else {
        //        const res = await $.ajax({
        //            url: `${instance.store.config.baseUrl}/StoreData`,
        //            headers: { "Content-Type": "application/json" },
        //            type: 'post',
        //            data: JSON.stringify({ statecode: '', zipcode: '' }),
        //            processData: false
        //        });
        //        ponderMap.storeData = res.d;
        //        instance.appState.storeData = res.d;
        //    } */

        //await Promise.all(results);
        // ponderMap.mapData = results[0].responseJSON.d;
        // ponderMap.mapData = [];
        //$(`#${instance.id} .ui.submit`).removeClass('loading');
        //$(`#${instance.id} .ui.submit`).addClass('disabled');

        // if (ponderMap.mapData.length) {
        //$(".mapAndTable.segment").show();
        //$(".onlyTable.segment").show();
        //$(".charts.segment .inline.loader").show();
        //$(".charts.segment ponder-barchart").hide();
        //$(".charts.segment").show();
        //$(".filter.form").hide();
        //$("#filterGrid").hide();
        //$(".showFilter.button").show();
        //$(".showFilter.button").html('Show Filter');
        //$(`#sortCriteria`).dropdown('change values', instance.store.config.sortCriteriaData);

        // $("#mapLocationCount").html(`(${new Intl.NumberFormat().format(ponderMap.mapData.length)})`);
        // instance.store.mapDataLength = ponderMap.mapData.length;
        /* if (ponderMap.mapData.length > instance.store.config.tableRecordsLimit) {
            $("#tableTitle").html(`${instance.store.toolName} Top ${instance.store.config.tableRecordsLimit} Locations`);
        } else {
            $("#tableTitle").html(``);
        } */

        // update the map's acc point layer
        instance.store.accFilterData = postData;
        instance.store.showACCPointLayer = `${Date.now().toString()}`;

        // update the map's point layer

        //if (!this.store.mapLayersReady) {
        //    instance.store.createMapLayers = `${Date.now().toString()}`;
        //} else {
        //    instance.store.updatePointLayer = `${Date.now().toString()}`;
        //    instance.store.updateClusterLayer = `${Date.now().toString()}`;
        //}
        //instance.store.updateTable = `${Date.now().toString()}`;

        // ponderDatatable.tableData = results[1].responseJSON.d;
        // await ponderDatatable.renderTable();

        // trigger chart rendering

        // instance.store.renderChart = postData;
        // }

        $(`.btnClear`).removeClass('disabled');
        //await this.zoomToSalesMarket();
    }

    async requery(filterDropdown, blankOutExistingValue, keysToBeRequeried) {
        const instance = this;
        const webmethodName = filterDropdown.remoteUrl ? R.takeLast(1, filterDropdown.remoteUrl.split('/'))[0] : '';
        return $.ajax({
            url: `${filterDropdown.store.config.baseUrl}/filter`,
            headers: { "Content-Type": "application/json", "Authorization": $("#hdnToken").val() },
            type: 'get',            
            data: Object.assign(
                this.buildQueryStringFromStore(blankOutExistingValue, filterDropdown),
                { keysToBeRequeried: keysToBeRequeried.join(',') }
            )
        });
        /* return $.ajax({
            url: `${filterDropdown.store.config.baseUrl}/${webmethodName.replace('{query}', '')}`,
            headers: { "Content-Type": "application/json" },
            type: 'get',
            data: this.buildQueryStringFromStore(blankOutExistingValue, filterDropdown)
        }); */
    }

    // render the html from the template in the DOM


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
        $(`#${instance.id} .ui.btnSubmit`).off().on('click', async function () {
            console.log('.btnSubmit click');
            //await instance.fetchData();
            //$('.map-section').dimmer({ on: false });
            //$(`.ponder-search-container`).removeClass('ponderHidden');
            //// $(`.btnClear`).addClass('disabled');
            //await instance.fetchData();
            //instance.canZoomToSalesMarket = false;
            //// $(`.btnClear`).removeClass('disabled');
            const postData = instance.buildQueryStringFromStore(false, instance);
            instance.store.accFilterData = postData;
            instance.store.showACCPointLayer = `${Date.now().toString()}`;
            instance.store.showUserACCTable = `${Date.now().toString()}`;
            $(`.btnClear`).removeClass('disabled');
            $(".filter.form").hide();
            $("#filterGrid").hide();
            $(".showFilter.button").show();
            $(".showFilter.button").html('Show Filter');
        });

        $(`.btnClear`).off().on('click', async function () {
            console.log('.btnClear click');
            //$('.map-section').dimmer({ on: 'hover' });
            //$(`.ponder-search-container`).addClass('ponderHidden');
            // trigger clear in all the dropdowns
            instance.store.clearFilters = Date.now().toString();
            // $('.map-section').dimmer('set active');
            //$(".segment.onlyTable").hide();
            // $(".charts.segment").hide();
            // $("#tableSortLoader").hide();
            const postData = instance.buildQueryStringFromStore(false, instance);
            instance.store.accFilterData = postData;
            instance.store.hideACCPointLayer = `${Date.now().toString()}`;            
            instance.store.hideUserACCTable = `${Date.now().toString()}`;
        });

        $(`.showFilter.button`).off().on('click', async function () {
            console.log('.showFilter.button');
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
        // if the user is not authorized to access the channel, return
        await this.getAvailableChannels();
        if (!R.contains(queryStringObject.channel, R.pluck('value', this.appState.availableChannels))) {
            return;
        }
        const instance = this;
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

        this.stateManager.subscribe("fetchTableData",
            async d => {
                if (d && !R.is(Array, d)) {
                    await instance.fetchData();
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
                    if (!instance.canZoomToSalesMarket) {
                        instance.canZoomToSalesMarket = instance.store.config.filter.mapResetDataKeys?.includes(dropdownInstance.dataKey);
                    }

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

                        const isStoreValueNotEmptyForMultiValueDD = key => !R.isEmpty(instance.store[key]) && !R.isNil(instance.store[key]);
                        const multiValueKeysWithValue = R.filter(isStoreValueNotEmptyForMultiValueDD,
                            R.without(instance.store.config.filter.singularValueDataKeys, instance.store.config.filter.dataKeys));
                        // remove the dataKey that relates to the dropdown that initiated this change event
                        const keysToBeRequeried = R.without([dropdownInstance.dataKey], multiValueKeysWithValue);
                        // add datakeys where the drodown is configured to requery on select
                        for (let i = 0; i < $(`ponder-filter ponder-search-dd`).length; i += 1) {
                            const filterDropdown = $($(`ponder-filter ponder-search-dd`)[i])[0];
                            if (filterDropdown.requeryOnSelect) {
                                R.append(filterDropdown.dataKey, keysToBeRequeried)
                            }
                        }
                        if (keysToBeRequeried.length) {
                            const response = JSON.parse((await instance.requery(instance, true, keysToBeRequeried)));
                            instance.store.triggerDropdownValueChangedEvent = false;
                            $(`ponder-filter ponder-search-dd div.dropdown`).addClass('disabled');
                            for (let i = 0; i < $(`ponder-filter ponder-search-dd`).length; i += 1) {
                                const filterDropdown = $($(`ponder-filter ponder-search-dd`)[i])[0];
                                const filterDropdownResults = response.d[filterDropdown.dataKey];
                                if (filterDropdownResults) {
                                    // replace commas in the value with caret to avoid wrong splits on the commas
                                    const results = R.map(item => R.merge(item, { value: !isNaN(item.value) ? item.value : item.value.replace(/,/g, '^') }), filterDropdownResults);
                                    const currentValidValues = R.intersection(filterDropdown.store[filterDropdown.dataKey].split(','), R.pluck('value', results));
                                    $(`#${filterDropdown.id}`).dropdown('change values', results);
                                    $(`#${filterDropdown.id}`).dropdown('set exactly', currentValidValues);
                                    filterDropdown.store[filterDropdown.dataKey] = currentValidValues.join(',');
                                }
                            }
                            instance.store.triggerDropdownValueChangedEvent = true;
                            $(`ponder-filter ponder-search-dd div.dropdown`).removeClass('disabled');
                        }
                        instance.store.postDropdownValueChanged = d;
                        /* instance.store.triggerDropdownValueChangedEvent = false;
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
                        instance.store.postDropdownValueChanged = d; */
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
            // const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            // this.derivedClass = DerivedClass({ adminUser, instance: this });
            const filterHtml = await this.derivedClass.html();
            $('.filter.container').html(filterHtml({ id: this.id, config: this.store.config }));
        }
        if (!this.store.config.loadDataOnChannelInit) {
            this.store.mapLayersReady = false;
        }
        await this.initSubscriptions();


    }

    // updated is called after the html is rendered on the DOM.

    async updated(changedProperties) {
        const adminUser = $('#hdnViewerAttId').val();
        if (this.derivedClass) {
            // const DerivedClass = (await import(`./derivations/${this.derivation}`)).default;
            // this.derivedClass =  DerivedClass({ adminUser, instance: this });
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
        if (this.store.appInitializedWithQueryParams) {
            const keys = Array.from(urlParams.keys());
            const values = Array.from(urlParams.values());
            await this.initializeAppWithQueryParams(R.zipObj(keys, values));
            this.store.appInitializedWithQueryParams = false;
        }

        if (this.store.config.loadDataOnChannelInit) {
            $(`.ui.btnSubmit`).click();
        }
    }



}


customElements.define('ponder-filter', Filter);