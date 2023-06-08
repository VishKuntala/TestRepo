import { CONSTANTS } from "../../../../../helpers/constants.js";
import { config as tableConfig } from "../config/config.js";

const setTableSort = (instance) => {
    if (instance.store.currentHeatmapFilter == CONSTANTS.HEATMAP_FIBER_PENETRATION) {
        instance.table.setSort("fiber_percentage", "desc"); //Trigger Sorting Programmatically
    }
    if (instance.store.currentHeatmapFilter == CONSTANTS.HEATMAP_WIRELESS_SCORING) {
        instance.table.setSort("wireless_category", "desc"); //Trigger Sorting Programmatically
    }
    if (instance.store.currentHeatmapFilter == CONSTANTS.HEATMAP_COPPER_UPGRADE) {
        instance.table.setSort("copper_upgrade", "desc"); //Trigger Sorting Programmatically
    }
    if (instance.store.currentHeatmapFilter == CONSTANTS.HEATMAP_FIBER_OPPORTUNITY) {
        instance.table.setSort("fiber_opportunity", "desc"); //Trigger Sorting Programmatically
    }
}

const reloadTableDataUsingSearchInput = (instance, tableName) => {
    if (instance.store.currentTab === instance.id) {
        const searchText = R.trim($("#txtTableSearch").val().toLowerCase());
        if (tableConfig.tables[tableName].pagination === "remote") {
            const tableConfiguration = tableConfig.tables[tableName];
            if (searchText === '') {                
                instance.table.clearFilter();
            } else {
                instance.table.setFilter(tableConfiguration.tableFilters ? tableConfiguration.tableFilters(searchText) : []);
            }
        } else {
            const filterPredicates = [];
            if (searchText === '') {
                instance.table.replaceData(instance.tableData);
            } else {
                for (let i = 0; i < instance.derivedClass.dataKeys.length; i += 1) {
                    filterPredicates.push(R.propSatisfies(val => R.contains(searchText, (val || '').toString().toLowerCase()), instance.derivedClass.dataKeys[i]));
                }
                const satisfySearch = R.anyPass(filterPredicates);
                const filteredData = R.filter(item => satisfySearch(item), instance.tableData);
                instance.table.replaceData(filteredData);
            }
        }
    }
}

export { setTableSort, reloadTableDataUsingSearchInput };
