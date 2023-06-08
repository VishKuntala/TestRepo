import { CONSTANTS } from '../../../../../helpers/constants';

//reused variables for the heatmapConfig
export const fiberPenColumn = 'fiber_percentage';
export const fiberPenColors = ['#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
export const fiberPenMax = [1, 2, 3, 4];
export const fiberPenDataKey = 'fiber_penetration_hm_color_code';

export const wirelessScoringColumn = 'wireless_category';
export const wirelessScoringColors = ['#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
export const wirelessScoringMax = [1, 2, 3, 4];
export const wirelessScoringDataKey = 'wireless_coverage_hm_color_code';

export const copperUpgradeColumn = 'copper_upgrade';
export const copperUpgradeColors = ["#D3D3D3", '#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
export const copperUpgradeMax = [-1, 1, 2, 3, 4];
export const copperUpgradeDataKey = 'copper_upgrade_hm_color_code';

export const fiberOpportunityColumn = 'fiber_opportunity';
export const fiberOpportunityColors = ["#D3D3D3", '#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
export const fiberOpportunityMax = [-1, 1, 2, 3, 4];
export const fiberOpportunityDataKey = 'fiber_opportunity_hm_color_code';

export const heatmapConfig = Object.freeze({
    [CONSTANTS.HEATMAP_FIBER_PENETRATION]: {
        name: 'Fiber Penetration',
        filters: [
            { color: fiberPenColors[0], heading: 'No Fiber', max: fiberPenMax[0], overallCatWhereClause: " AND fiber_penetration_hm_color_code=1 " },
            { color: fiberPenColors[1], heading: '<30% Fiber', max: fiberPenMax[1], overallCatWhereClause: " AND fiber_penetration_hm_color_code=2 " },
            { color: fiberPenColors[2], heading: '30-40% Fiber', max: fiberPenMax[2], overallCatWhereClause: " AND fiber_penetration_hm_color_code=3 " },
            { color: fiberPenColors[3], heading: '>40% Fiber', max: fiberPenMax[3], overallCatWhereClause: " AND fiber_penetration_hm_color_code=4 "}
        ],
        dataKey: fiberPenDataKey,
        fillColorExpression: [
            'step',
            ['get', fiberPenDataKey],
            fiberPenColors[0],
            fiberPenMax[1], fiberPenColors[1],
            fiberPenMax[2], fiberPenColors[2],
            fiberPenMax[3], fiberPenColors[3]
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', fiberPenDataKey], 0],
            0,
            0.5
        ],
        fillOpacityHoverExpression: [
            'case', ['==', ['get', fiberPenDataKey], 0],
            0,
            0.75
        ],
    },
    [CONSTANTS.HEATMAP_WIRELESS_SCORING]: {        
        name: 'Wireless Coverage',
        filters: [
            { color: wirelessScoringColors[0], heading: 'Weak Wrls & No Fiber', max: wirelessScoringMax[0], overallCatWhereClause: " AND wireless_coverage_hm_color_code=1 " },
            { color: wirelessScoringColors[1], heading: 'Weak Wrls & Fiber Available', max: wirelessScoringMax[1], overallCatWhereClause: " AND wireless_coverage_hm_color_code=2 " },
            { color: wirelessScoringColors[2], heading: 'Strong Wrls & No Fiber', max: wirelessScoringMax[2], overallCatWhereClause: " AND wireless_coverage_hm_color_code=3 "},
            { color: wirelessScoringColors[3], heading: 'Strong Wrls & Fiber Available', max: wirelessScoringMax[3], overallCatWhereClause: " AND wireless_coverage_hm_color_code=4 " }
        ],
        dataKey: wirelessScoringDataKey,
        //fillColorExpression: [
        //    'interpolate',
        //    ['linear'],
        //    ['get', wirelessScoringDataKey],
        //    wirelessScoringMax[0], wirelessScoringColors[0],
        //    wirelessScoringMax[1], wirelessScoringColors[1],
        //    wirelessScoringMax[2], wirelessScoringColors[2],
        //    wirelessScoringMax[3], wirelessScoringColors[3],
        //],
        //fillOpacityExpression: [
        //    'case',
        //    ['boolean', ['feature-state', 'hover'], false], // changes the fill opacity when the hover state changes (uses 'onAreaHover()' to control hovers) 
        //    0.5,
        //    0.75
        //],
        fillColorExpression: [
            'step',
            ['get', wirelessScoringDataKey],
            wirelessScoringColors[0],
            wirelessScoringMax[1], wirelessScoringColors[1],
            wirelessScoringMax[2], wirelessScoringColors[2],
            wirelessScoringMax[3], wirelessScoringColors[3],
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', wirelessScoringDataKey], 0],
            0,
            0.5
        ],
        fillOpacityHoverExpression: [
            'case', ['==', ['get', wirelessScoringDataKey], 0],
            0,
            0.75
        ],
    },
    [CONSTANTS.HEATMAP_COPPER_UPGRADE]: {
        name: 'Copper Upgrade',
        filters: [
            { color: copperUpgradeColors[1], heading: '0-25% Copper Upgrade', max: copperUpgradeMax[1], overallCatWhereClause: " AND copper_upgrade_hm_color_code=1 " },
            { color: copperUpgradeColors[2], heading: '25-50% Copper Upgrade', max: copperUpgradeMax[2], overallCatWhereClause: " AND copper_upgrade_hm_color_code=2 " },
            { color: copperUpgradeColors[3], heading: '50-75% Copper Upgrade', max: copperUpgradeMax[3], overallCatWhereClause: " AND copper_upgrade_hm_color_code=3 " },
            { color: copperUpgradeColors[4], heading: '75-100% Copper Upgrade', max: copperUpgradeMax[4], overallCatWhereClause: " AND copper_upgrade_hm_color_code=4 " }
        ],
        dataKey: copperUpgradeDataKey,
        //fillColorExpression: [
        //    'interpolate',
        //    ['linear'],
        //    ['get', copperUpgradeDataKey],
        //    copperUpgradeMax[0],copperUpgradeColors[0],
        //    copperUpgradeMax[1], copperUpgradeColors[1],
        //    copperUpgradeMax[2], copperUpgradeColors[2],
        //    copperUpgradeMax[3], copperUpgradeColors[3],
        //    copperUpgradeMax[4], copperUpgradeColors[4],
        //],
        //fillOpacityExpression: [
        //    'case',
        //    ['boolean', ['feature-state', 'hover'], false], // changes the fill opacity when the hover state changes (uses 'onAreaHover()' to control hovers) 
        //    0.5,
        //    0.75
        //],
        fillColorExpression: [
            'step',
            ['get', copperUpgradeDataKey],
            copperUpgradeColors[0],
            copperUpgradeMax[1], copperUpgradeColors[1],
            copperUpgradeMax[2], copperUpgradeColors[2],
            copperUpgradeMax[3], copperUpgradeColors[3],
            copperUpgradeMax[4], copperUpgradeColors[4],
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', copperUpgradeDataKey], 0],
            0,
            0.5
        ],
        fillOpacityHoverExpression: [
            'case', ['==', ['get', copperUpgradeDataKey], 0],
            0,
            0.75
        ],
    },
    [CONSTANTS.HEATMAP_FIBER_OPPORTUNITY]: {
        name: 'Fiber Opportunity',
        filters: [
            { color: fiberOpportunityColors[1], heading: '0-25% Fiber Opportunity', max: fiberOpportunityMax[1], overallCatWhereClause: " AND fiber_opportunity_hm_color_code=1 " },
            { color: fiberOpportunityColors[2], heading: '25-50% Fiber Opportunity', max: fiberOpportunityMax[2], overallCatWhereClause: " AND fiber_opportunity_hm_color_code=2 " },
            { color: fiberOpportunityColors[3], heading: '50-75% Fiber Opportunity', max: fiberOpportunityMax[3], overallCatWhereClause: " AND fiber_opportunity_hm_color_code=3 " },
            { color: fiberOpportunityColors[4], heading: '75-100% Fiber Opportunity', max: fiberOpportunityMax[4], overallCatWhereClause: " AND fiber_opportunity_hm_color_code=4 " }
        ],
        dataKey: fiberOpportunityDataKey,
        //fillColorExpression: [
        //    'interpolate',
        //    ['linear'],
        //    ['get', fiberOpportunityDataKey],
        //    fiberOpportunityMax[0], fiberOpportunityColors[0],
        //    fiberOpportunityMax[1], fiberOpportunityColors[1],
        //    fiberOpportunityMax[2], fiberOpportunityColors[2],
        //    fiberOpportunityMax[3], fiberOpportunityColors[3],
        //    fiberOpportunityMax[4], fiberOpportunityColors[4],
        //],
        //fillOpacityExpression: [
        //    'case',
        //    ['boolean', ['feature-state', 'hover'], false], // changes the fill opacity when the hover state changes (uses 'onAreaHover()' to control hovers) 
        //    0.5,
        //    0.75
        //],
        fillColorExpression: [
            'step',
            ['get', fiberOpportunityDataKey],
            fiberOpportunityColors[0],
            fiberOpportunityMax[1], fiberOpportunityColors[1],
            fiberOpportunityMax[2], fiberOpportunityColors[2],
            fiberOpportunityMax[3], fiberOpportunityColors[3],
            fiberOpportunityMax[4], fiberOpportunityColors[4],
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', fiberOpportunityDataKey], 0],
            0,
            0.5
        ],
        fillOpacityHoverExpression: [
            'case', ['==', ['get', fiberOpportunityDataKey], 0],
            0,
            0.75
        ],
    },
});
