import { CONSTANTS as HELPER_CONSTANTS } from "../../../../../helpers/constants.js";
import { CONSTANTS } from "../../../../../../constants/constants";

import { config } from "../config/config";
import {
    heatmapConfig,
    fiberPenColumn,
    fiberPenColors,    
    fiberPenDataKey,
    wirelessScoringColumn,    
    wirelessScoringColors,
    wirelessScoringDataKey,
    copperUpgradeColumn,
    copperUpgradeColors,
    copperUpgradeDataKey,
    fiberOpportunityColumn,
    fiberOpportunityColors,
    fiberOpportunityDataKey,
} from "../config/heatmapConfig";

const checkExistence = value =>
    value === null || value === undefined ? CONSTANTS.NOT_AVAILABLE : value;

const formatValue = ({ value, format }) => {
    if (format === "percent") {
        return `${value}%`;
    }
    return value;
};

export const updateShapeSize = (zoomLevel, store) => {
    const shapeSizes = [];
    for (const key in config.pointsLayers) {
        const {
            id,
            maxShapeSize,
            minShapeSize,
            denominatorValue,
        } = config.pointsLayers[key];
        const updatedShapeSize = Number(
            (zoomLevel / parseInt(denominatorValue)).toFixed(2)
        );
        const shapeSize =
            updatedShapeSize > minShapeSize
                ? Math.min(updatedShapeSize, maxShapeSize)
                : minShapeSize;
        shapeSizes.push({ layerId: id, shapeSize });
    }
    store.shapeSizes = shapeSizes;
};

export const updateMapInfo = (store, cardData, isPointData = false) => {
    const { mapCardHeader, mapCardInfo } = cardData;
    store[
        isPointData ? "mapCardPointHeader" : "mapCardAreaHeader"
    ] = mapCardHeader;
    store[isPointData ? "mapCardPointInfo" : "mapCardAreaInfo"] = mapCardInfo
        ? mapCardInfo.map(({ label, property, format }) => {
              let updatedProperty = checkExistence(property);

              if (typeof updatedProperty === "number") {
                  updatedProperty =
                      updatedProperty < 0
                          ? CONSTANTS.NOT_AVAILABLE
                          : formatValue({ value: updatedProperty, format });
                  return { label, property: updatedProperty };
              }

              return { label, property: updatedProperty };
          })
        : undefined;
};

export const getPaintFill = (
    currentHeatmapFilterIndex,
    currentHeatmapFilter
) => {
    const currentHeatmap = heatmapConfig[currentHeatmapFilter];

    // if no filter is applied, return normal color expression
    if (typeof currentHeatmapFilterIndex === "undefined") {
        return currentHeatmap.fillColorExpression;
    }

    // otherwise, update the colors to only show the active filter color
    const updatedColors = currentHeatmap.filters.map(({ color }, idx) => {
        if (idx === currentHeatmapFilterIndex) {
            return color;
        }
        return "rgba(0, 0, 0, 0)";
    });

    if (currentHeatmapFilter == HELPER_CONSTANTS.HEATMAP_FIBER_PENETRATION || currentHeatmapFilter == HELPER_CONSTANTS.HEATMAP_WIRELESS_SCORING) {
        return [
            'interpolate',
            ['linear'],
            ['get', currentHeatmap.dataKey],
            currentHeatmap.filters[0].max, updatedColors[0],
            currentHeatmap.filters[1].max, updatedColors[1],
            currentHeatmap.filters[2].max, updatedColors[2],
            currentHeatmap.filters[3].max, updatedColors[3],
        ];
    }
    return [
        'interpolate',
        ['linear'],
        ['get', currentHeatmap.dataKey],
        -1, "rgba(0, 0, 0, 0)",
        currentHeatmap.filters[0].max, updatedColors[0],
        currentHeatmap.filters[1].max, updatedColors[1],
        currentHeatmap.filters[2].max, updatedColors[2],
        currentHeatmap.filters[3].max, updatedColors[3],
    ];
};

// Not sure this is used
export const markerClicked = async ({ event, instance }) => {
    if (!event?.features?.[0]?.properties) return;
    if (!event?.features?.[0]?.geometry?.coordinates) return;

    const { geometry, properties } = event.features[0];

    const coordinates = geometry.coordinates.slice();
    // Ensure that if the map is zoomed out such that multiple
    // copies of the feature are visible, the popup appears
    // over the copy being pointed to.

    while (Math.abs(event.lngLat.lng - coordinates[0]) > 180) {
        coordinates[0] += event.lngLat.lng > coordinates[0] ? 360 : -360;
    }

    const popup = new maplibregl.Popup({
        maxWidth: "500px",
        closeButton: true,
        anchor: "bottom",
    })
        .setLngLat(coordinates)
        .setHTML('<div class="ui active mini blue elastic loader"></div>')
        .addTo(instance.map);

    popup.on("open", () => {
        const point = instance.map.project(popup._lngLat);
        const popupHeight = popup._container.clientHeight + 50; // Small amount of padding
        if (point.y - popupHeight < 0) {
            instance.map.panBy([0, point.y - popupHeight]);
        }
    });

    try {
        const response = await $.ajax({
            url: `${instance.store.config.baseUrl}/LocationData`,
            headers: { "Content-Type": "application/json" },
            type: "post",            
            data: JSON.stringify({
                latitude: properties.latitude,
                longitude: properties.longitude,
            }),
            processData: false,
        });

        const locationData = response.d[0];
        popup.setHTML(`
            <b>Campaign ID:</b> ${locationData.campaign_id}
            <br/><b>Campaign Name:</b> ${locationData.campaign_name}
            <br/><b>Company Name:</b> ${locationData.contact_company_nm}
            <br/><b>Location ID:</b> ${locationData.location_id}
            <br/><b>Contact Name:</b> ${locationData.contact_first_nm} ${
            locationData.contact_last_nm
        }
            <br/><b>Contact Phone:</b> ${locationData.contact_phone1}
            <br/><b>Contact email:</b> ${locationData.contact_email}
            <br/><b>Address:</b> ${locationData.addr_line1}
            <br/><b>City, State Zip:</b> ${locationData.city_nm}, ${
            locationData.state_y
        } ${locationData.postl_cd}
            <br/><b>Number of Employees:</b> ${locationData.number_of_employees}
            <br/><b>Indoor Coverage Score:</b> ${locationData.coverage_score}
            <br/><b>5G:</b> ${locationData.fiveg} - <b>5G+:</b> ${
            locationData.fiveg_plus
        }
            <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
            <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b> ${
            locationData.first_net
        } - <b>FNET Band 14:</b> ${locationData.band_14}
            <br/><b>Legacy Device Penetration:</b> ${locationData.fiber_cust}
            <br/><b>Primary Competitor:</b> ${
                locationData.primary_competitor_name
            }
        `);
    } catch (err) {
        console.error(err);
    }
};

export const formatRowCellColors = ({ _row: row }, currentHeatmapFilter) => {
    try {
        let fiberPenCell;
        let fiberPenColorCodeCell;
        let wirelessScoringCell;
        let wirelessScoringColorCodeCell;
        let copperUpgradeCell;
        let copperUpgradeColorCodeCell;
        let fiberOpportunityCell;
        let fiberOpportunityColorCodeCell;
        row.cells.map(cell => {
            const field = cell.column.field;
            if (field == fiberPenColumn) {
                fiberPenCell = cell;
            }
            else if (field == fiberPenDataKey) {
                fiberPenColorCodeCell = cell;
            }
            else if (field == wirelessScoringColumn) {
                wirelessScoringCell = cell;
            }
            else if (field == wirelessScoringDataKey) {
                wirelessScoringColorCodeCell = cell;
            }
            else if (field == copperUpgradeColumn) {
                copperUpgradeCell = cell;
            }
            else if (field == copperUpgradeDataKey) {
                copperUpgradeColorCodeCell = cell;
            }
            else if (field == fiberOpportunityColumn) {
                fiberOpportunityCell = cell;
            }
            else if (field == fiberOpportunityDataKey) {
                fiberOpportunityColorCodeCell = cell;
            }
        });
        if (currentHeatmapFilter == HELPER_CONSTANTS.HEATMAP_FIBER_PENETRATION) {
            if (fiberPenCell && fiberPenColorCodeCell) {
                fiberPenCell.element.style.backgroundColor = fiberPenColors[fiberPenColorCodeCell.value - 1];
                wirelessScoringCell.element.style.backgroundColor = "#ffffff";
                copperUpgradeCell.element.style.backgroundColor = "#ffffff";
                fiberOpportunityCell.element.style.backgroundColor = "#ffffff";
            }
        }
        else if (currentHeatmapFilter == HELPER_CONSTANTS.HEATMAP_WIRELESS_SCORING) {
            if (wirelessScoringCell && wirelessScoringColorCodeCell) {
                wirelessScoringCell.element.style.backgroundColor = wirelessScoringColors[wirelessScoringColorCodeCell.value - 1];
                fiberPenCell.element.style.backgroundColor = "#ffffff";
                copperUpgradeCell.element.style.backgroundColor = "#ffffff";
                fiberOpportunityCell.element.style.backgroundColor = "#ffffff";
            }
        }
        else if (currentHeatmapFilter == HELPER_CONSTANTS.HEATMAP_COPPER_UPGRADE) {
            if (copperUpgradeCell && copperUpgradeColorCodeCell) {
                const index = copperUpgradeColorCodeCell.value == -1 ? copperUpgradeColorCodeCell.value + 1 : copperUpgradeColorCodeCell.value;
                copperUpgradeCell.element.style.backgroundColor = copperUpgradeColors[index];
                fiberPenCell.element.style.backgroundColor = "#ffffff";
                wirelessScoringCell.element.style.backgroundColor = "#ffffff";
                fiberOpportunityCell.element.style.backgroundColor = "#ffffff";
            }
        }
        else if (currentHeatmapFilter == HELPER_CONSTANTS.HEATMAP_FIBER_OPPORTUNITY) {
            if (fiberOpportunityCell && fiberOpportunityColorCodeCell) {
                const index = fiberOpportunityColorCodeCell.value == -1 ? fiberOpportunityColorCodeCell.value + 1 : fiberOpportunityColorCodeCell.value;
                fiberOpportunityCell.element.style.backgroundColor = fiberOpportunityColors[index];
                fiberPenCell.element.style.backgroundColor = "#ffffff";
                wirelessScoringCell.element.style.backgroundColor = "#ffffff";
                copperUpgradeCell.element.style.backgroundColor = "#ffffff";
            }
        }

    }
    catch (error) {
        alert('error in formatRowCellColors');
        alert(error);
    }
};
