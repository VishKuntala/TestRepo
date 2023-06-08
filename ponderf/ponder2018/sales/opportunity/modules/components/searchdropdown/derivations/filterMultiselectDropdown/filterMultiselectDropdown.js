import $ from "jquery";
import * as R from 'ramda';
import { buildPayloadFromStore } from "../../../../helpers/remoteData.js";

const filterMultiselectDropdown = ({ adminUser, instance }) => {

    const buildQueryStringFromStore = (blankOutExistingValue) => {

        let queryStringData = buildPayloadFromStore(instance);

        //blank out the existing value for the data that the dropdown is trying to fetch
        // we don't want the request to fetch data for the states dropdown (for example) send a
        // previously selected statecode which will then be used by the webmethod in the oracle select
        // statement to get distinct states.
        if (blankOutExistingValue) {
            queryStringData[instance.dataKey] = "";
        }

        return queryStringData;

    }


    const initSubscriptions = async () => {

        instance.appendSubscription(instance.stateManager.subscribe("clearFilters",
            async d => {
                instance.store.triggerDropdownValueChangedEvent = false;
                $(`#${instance.id}`).dropdown('clear');
                $(`#${instance.id}`).dropdown('change values', []);
                if (instance.store.config.filter.initialValues) {
                    instance.store[instance.dataKey] = instance.store.config.filter.initialValues[instance.dataKey] || ''
                } else {
                    instance.store[instance.dataKey] = '';
                }
                // if (instance.dataKey !== "salesRepId") {
                if (instance.store.config.filter.requiredDataKeys?.length && !R.contains(instance.dataKey, instance.store.config.filter.requiredDataKeys)) {
                    $(`#${instance.id}`).addClass('disabled');
                }
                if (!instance.store.config.filter.requiredDataKeys?.length) {
                    $(`.btnSubmit`).removeClass('disabled');
                } else {
                    $(`.btnSubmit`).addClass('disabled');
                }
            }
        ));

        instance.appendSubscription(instance.stateManager.subscribe("postDropdownValueChanged",
            async d => {
                $(`.btnSubmit`).addClass('enabled');

                // d is of the form randomnumber^instanceidofdropdownthattriggeredthisevent
                const idOfDropdownPublishingThisEvent = d && d.split ? d.split('^')[1] : '';

                // check if the required dropdowns on the filter have values
                // if the required dropdowns have no value selected, then
                // check if the current instance itself is not one of the *required* drodowns that triggered this event, disable the dropdown and clear all selected values
                // and also disable the submit button
                // const requiredAnyChecker = R.reduce(R.concat, '', R.map(item => R.trim(instance.store[item] || '')));
                // const requiredAllChecker = R.reduce(R.add, 0, R.map(item => R.trim(instance.store[item] || '') === '' ? 1 : 0));
                const requiredChecker = instance.store.config.filter.requiredBooleanOperator === "all" ?
                    R.reduce(R.add, 0, R.map(item => R.trim(instance.store[item] || '') === '' ? 1 : 0, instance.store.config.filter.requiredDataKeys)) === 0 :
                    R.reduce(R.concat, '', R.map(item => R.trim(instance.store[item] || ''), instance.store.config.filter.requiredDataKeys)) !== '';
                if (!requiredChecker) {
                    // if (R.trim(R.reduce(R.concat, '', R.map(item => instance.store[item] || '', instance.store.config.filter.requiredDataKeys))) === '') {
                    if (!R.includes(instance.dataKey, instance.store.config.filter.requiredDataKeys)) {
                        instance.store.triggerDropdownValueChangedEvent = false;
                        $(`#${instance.id}`).dropdown('clear');
                        if (instance.store.config.filter.requiredDataKeys?.length) {
                            $(`#${instance.id}`).addClass('disabled');
                        }
                    }
                    $(`.btnSubmit`).addClass('disabled');

                } else { // all the *required* dropdowns have values, enable the submit button and also enable this dropdown

                    $(`#${instance.id}`).removeClass('disabled');
                    $(`.btnSubmit`).removeClass('disabled');
                }


                // if this dropdown is the one that triggered the dropdownchanged event and
                // the dropdown is part of the filter section, then hide the map / table section on change.
                // if it is one of the required dropdowns marked to reset the map, reset the currentMapZoom and currentMapCenter to the starting values

                if (idOfDropdownPublishingThisEvent === instance.id && $(`#${instance.id}`).closest('ponder-filter').length !== 0) {
                    // $(".mapAndTable.segment").hide();
                    // $(".charts.segment").hide();
                    // $("#tableSortLoader").hide();

                    if (R.contains(instance.dataKey, instance.store.config.filter.mapResetDataKeys)) {
                        instance.store.currentMapZoom = instance.store.startingMapZoom;
                        instance.store.currentMapCenter = instance.store.startingMapCenter;
                    }

                }

            }));
    }

    return {
        initSubscriptions,
        buildQueryStringFromStore
    }
}

export default filterMultiselectDropdown;

