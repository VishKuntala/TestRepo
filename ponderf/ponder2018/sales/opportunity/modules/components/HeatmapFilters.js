import { html } from "lit-element";
import heatmapFiltersTemplate from "../../templates/components/heatmapFilters/heatmapFilters";
import { heatmapConfig } from "./maplibre/derivations/mainMap/config/heatmapConfig";
import { config } from "./maplibre/derivations/mainMap/config/config";
import PonderComponent from "./PonderComponent";
import { CONSTANTS } from "../helpers/constants";

const getGroupByLabel = (tableType) => {
    // switch on type
    let label;
    switch (tableType) {
        case "salesmarkets":
        case "vpgms":
            label = "Sales Markets";
            break;
        case "dmas":
            label = "DMAs";
            break;
        case "counties":
            label = "Counties";
            break;
        case "zips":
            label = "Zips";
            break;
        case "censusblocks":
            label = "CensusBlocks";
            break;
        default:
            label = `${tableType}`;
    }
    return label;
}

const getSummaryData = (instance, results) => {
    const { tableType } = instance.store;
    if (instance.store.heatmap == CONSTANTS.HEATMAP_FIBER_PENETRATION) {
        return {
            groupBy: instance.store.searchMode === 'zipSearch' ? 'Zip' : getGroupByLabel(tableType),
            groupCount: [
                results.fiber_penetration_count_1,
                results.fiber_penetration_count_2,
                results.fiber_penetration_count_3,
                results.fiber_penetration_count_4,
            ],
            opportunityCount: [
                results.fiber_penetration_opp_1,
                results.fiber_penetration_opp_2,
                results.fiber_penetration_opp_3,
                results.fiber_penetration_opp_4,
            ],
        };
    }
    else if (instance.store.heatmap == CONSTANTS.HEATMAP_WIRELESS_SCORING) {
        return {
            groupBy: instance.store.searchMode === 'zipSearch' ? 'Zip' : getGroupByLabel(tableType),
            groupCount: [
                results.wireless_coverage_count_1,
                results.wireless_coverage_count_2,
                results.wireless_coverage_count_3,
                results.wireless_coverage_count_4,
            ],
            opportunityCount: [
                results.wireless_coverage_opp_1,
                results.wireless_coverage_opp_2,
                results.wireless_coverage_opp_3,
                results.wireless_coverage_opp_4,
            ],
        };
    }
    else if (instance.store.heatmap == CONSTANTS.HEATMAP_COPPER_UPGRADE) {
        return {
            groupBy: instance.store.searchMode === 'zipSearch' ? 'Zip' : getGroupByLabel(tableType),
            groupCount: [
                results.copper_upgrade_count_1,
                results.copper_upgrade_count_2,
                results.copper_upgrade_count_3,
                results.copper_upgrade_count_4,
            ],
            opportunityCount: [
                results.copper_upgrade_opp_1,
                results.copper_upgrade_opp_2,
                results.copper_upgrade_opp_3,
                results.copper_upgrade_opp_4,
            ],
        };
    }
    else if (instance.store.heatmap == CONSTANTS.HEATMAP_FIBER_OPPORTUNITY) {
        return {
            groupBy: instance.store.searchMode === 'zipSearch' ? 'Zip' : getGroupByLabel(tableType),
            groupCount: [
                results.fiber_opportunity_count_1,
                results.fiber_opportunity_count_2,
                results.fiber_opportunity_count_3,
                results.fiber_opportunity_count_4,
            ],
            opportunityCount: [
                results.fiber_opportunity_opp_1,
                results.fiber_opportunity_opp_2,
                results.fiber_opportunity_opp_3,
                results.fiber_opportunity_opp_4,
            ],
        };
    }
}

const updateHeatmapFilters = async (instance) => {
    const { market, marketType, tableType, searchMode, baseApiUrl, heatmap } = instance.store;
    if (tableType == "censusblocks") return;
    if ((tableType && searchMode !== 'zipSearch') || (tableType === 'zips' && searchMode === 'zipSearch')) {
        let results;
        try {
            instance.isLoading = true;
            const params = {
                marketType,
                market,
            };            
            const data = await instance.getData(
                `${baseApiUrl}/summary/${heatmap}/${tableType}`,
                params
            );            
            results = data[0];
        } catch (error) {
            //alert("error from updateHeatmapFilters");            
            let errorMessage = '';
            for (const key in error) {
                errorMessage = errorMessage + `${key}: ${error[key]}` + '\n';
                if (key == "statusText")
                    alert("updateHeatmapFilters - " + `${key}: ${error[key]}`);
                //console.log(`${key}: ${error[key]}`);
            }
            //alert(errorMessage);
        } finally {
            instance.isLoading = false;            
            if (results) {
                instance.summaryData = getSummaryData(instance, results);
            }
        }
        // state changed, so request update
        instance.requestUpdate();
    }
}

class HeatmapFilters extends PonderComponent {
    constructor() {
        super();
        this.filters = [];
        this.isLoading = false;
        this.summaryData = {
            groupBy: "Sales Markets",
            groupCount: Array(4).fill(0),
            opportunityCount: Array(4).fill(0),
        };
    }

    async initSubscriptions() {
        const instance = this;
        // triggered when Heatmap dropdown value is changed, update state and reload the component
        // also triggered during page initial load, don't cancel app intial load event as we need to load sales market filters
        this.stateManager.subscribe(
            "currentHeatmapFilter",
            async heatmapFilter => {
                this.filters = [];
                heatmapConfig[heatmapFilter]?.filters.forEach(
                    ({ color, heading }) => {
                        this.filters.push({
                            color,
                            heading,
                            active: undefined,
                        });
                    }
                );
                await updateHeatmapFilters(instance);
            }
        );

        // triggered when main table is refreshed during zoomin and zoom out events, update state and reload the component
        this.stateManager.subscribe("updateMainTable", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            await updateHeatmapFilters(instance);
        });

        // triggered when census block table data is refreshed, update state and reload the component
        this.stateManager.subscribe("censusBlockTableData", async d => {
            if (d && R.is(Array, d) && d.length == 0) return; // app intial load event
            if (d) {
                const { censusBlockFeatures, zoomLevel } = d;
                if (zoomLevel > config.heatmapLayers.CENSUS_BLOCK.minZoom) {
                    const getCount = (heatmap, features, colorCodeValue) => {
                        if (heatmap == CONSTANTS.HEATMAP_FIBER_PENETRATION) {
                            const count = features.filter(feature => feature.fiber_penetration_hm_color_code == colorCodeValue).length;
                            return count;
                        }
                        else if (heatmap == CONSTANTS.HEATMAP_WIRELESS_SCORING) {
                            const count = features.filter(feature => feature.wireless_coverage_hm_color_code == colorCodeValue).length;
                            return count;
                        }
                        else if (heatmap == CONSTANTS.HEATMAP_COPPER_UPGRADE) {
                            const count = features.filter(feature => feature.copper_upgrade_hm_color_code == colorCodeValue).length;
                            return count;
                        }
                        else if (heatmap == CONSTANTS.HEATMAP_FIBER_OPPORTUNITY) {
                            const count = features.filter(feature => feature.fiber_opportunity_hm_color_code == colorCodeValue).length;
                            return count;
                        }
                        return 0;
                    }
                    const getOpportunity = (heatmap, features, colorCodeValue) => {
                        if (heatmap == CONSTANTS.HEATMAP_FIBER_PENETRATION) {
                            const filteredFeatures = features.filter(feature => feature.fiber_penetration_hm_color_code == colorCodeValue);
                            const sum = filteredFeatures.reduce(function (s, a) {
                                if (a.fiber_opportunity) {
                                    return s + a.fiber_opportunity;
                                }
                                return s;
                            }, 0);
                            return sum;
                        }
                        else if (heatmap == CONSTANTS.HEATMAP_WIRELESS_SCORING) {
                            const filteredFeatures = features.filter(feature => feature.wireless_coverage_hm_color_code == colorCodeValue);
                            const sum = filteredFeatures.reduce(function (s, a) {
                                if (a.fiber_opportunity) {
                                    return s + a.fiber_opportunity;
                                }
                                return s;
                            }, 0);
                            return sum;
                        }
                        else if (heatmap == CONSTANTS.HEATMAP_COPPER_UPGRADE) {
                            const filteredFeatures = features.filter(feature => feature.copper_upgrade_hm_color_code == colorCodeValue);
                            const sum = filteredFeatures.reduce(function (s, a) {
                                if (a.copper_upgrade) {
                                    return s + a.copper_upgrade;
                                }
                                return s;
                            }, 0);
                            return sum;
                        }
                        else if (heatmap == CONSTANTS.HEATMAP_FIBER_OPPORTUNITY) {
                            const filteredFeatures = features.filter(feature => feature.fiber_opportunity_hm_color_code == colorCodeValue);
                            const sum = filteredFeatures.reduce(function (s, a) {
                                if (a.fiber_opportunity) {
                                    return s + a.fiber_opportunity;
                                }
                                return s;
                            }, 0);
                            return sum;
                        }
                        return 0;
                    }
                    this.summaryData = {
                        groupBy: getGroupByLabel("censusblocks"),
                        groupCount: [
                            getCount(this.store.heatmap, censusBlockFeatures, 1)?.toLocaleString(),
                            getCount(this.store.heatmap, censusBlockFeatures, 2)?.toLocaleString(),
                            getCount(this.store.heatmap, censusBlockFeatures, 3)?.toLocaleString(),
                            getCount(this.store.heatmap, censusBlockFeatures, 4)?.toLocaleString(),
                        ],
                        opportunityCount: [
                            getOpportunity(this.store.heatmap, censusBlockFeatures, 1)?.toLocaleString(),
                            getOpportunity(this.store.heatmap, censusBlockFeatures, 2)?.toLocaleString(),
                            getOpportunity(this.store.heatmap, censusBlockFeatures, 3)?.toLocaleString(),
                            getOpportunity(this.store.heatmap, censusBlockFeatures, 4)?.toLocaleString(),
                        ],
                    };
                    // state changed, so request update
                    this.requestUpdate();
                }
            }
        });
    }

    async handleFilterClick({ index, event, instance }) {
        if ($(event.currentTarget).hasClass("active")) {
            $(".heatmap-filters button.ui.button").removeClass("active");
            instance.store.currentHeatmapFilterIndex = undefined;
        } else {
            $(".heatmap-filters button.ui.button").removeClass("active");
            $(event.currentTarget).addClass("active");
            instance.store.currentHeatmapFilterIndex = index;
        }
    }

    async firstUpdated() {
        await this.initSubscriptions();
        this.filters = [];
        heatmapConfig[this.store.currentHeatmapFilter].filters.forEach(
            ({ color, heading }, index) => {
                this.filters.push({
                    color,
                    heading,
                    active: index === this.store.currentHeatmapFilterIndex,
                });
            }
        );
    }

    // render the html from the template in the DOM
    render() {
        return html`${heatmapFiltersTemplate({
            handleFilterClick: this.handleFilterClick,
            filters: this.filters,
            summaryData: this.summaryData,
            instance: this,
            isLoading: this.isLoading,
        })}`;
    }
}

customElements.define("ponder-heatmap-filters", HeatmapFilters);
