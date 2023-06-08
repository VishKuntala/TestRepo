import { CONSTANTS } from '../../../../../helpers/constants';

//reused variables for the heatmapConfig
export const fiberPenColors = ['#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
export const fiberPenMax = [.1, 30, 40, 100];
const fiberPenDataKey = 'fiber_percentage';
const wirelessScoringColors = ['#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
const wirelessScoringMax = [0, 30, 40, 100];
const wirelessScoringDataKey = 'fiber_percentage';
const aveCoverageScoreDataKey = 'avg_cov_score';
const aveCoverageScoreColors = ['#a9a9a9', '#e6b800', '#ffff00', '#00cc00', '#008000', '#003300'];
const aveCoverageScoreMax = [0.99, 1.99, 2.99, 3.99, 4.99];
const locationDensityDataKey = 'density_percentage';
const locationDensityColors = ['#ffe6cc', '#ffff99', '#b3d9ff', '#b3ffb3'];
const locationDensityMax = [.1, 30, 40, 100];


export const heatmapConfig = Object.freeze({
    [CONSTANTS.HEATMAP_FIBER_PENETRATION]: {
        name: 'Fiber Penetration',
        filters: [
            { color: fiberPenColors[0], heading: 'No Fiber', max: fiberPenMax[0], overallCatWhereClause: ' AND FIBER_AVAILABLE = 0 ' },
            { color: fiberPenColors[1], heading: '<30% Fiber', max: fiberPenMax[1], overallCatWhereClause: ' AND FIBER_AVAILABLE > 0 AND FIBER_PERCENTAGE< 30 ' },
            { color: fiberPenColors[2], heading: '30-40% Fiber', max: fiberPenMax[2], overallCatWhereClause: ' AND FIBER_AVAILABLE > 0 AND FIBER_PERCENTAGE< 40 AND FIBER_PERCENTAGE >= 30 ' },
            { color: fiberPenColors[3], heading: '>40% Fiber', overallCatWhereClause: ' AND FIBER_AVAILABLE > 0 AND FIBER_PERCENTAGE >= 40 '}
        ],
        dataKey: fiberPenDataKey,
        fillColorExpression: [
            'step',
            ['get', fiberPenDataKey],
            fiberPenColors[0], fiberPenMax[0],
            fiberPenColors[1], fiberPenMax[1],
            fiberPenColors[2], fiberPenMax[2],
            fiberPenColors[3]
        ],
        fillOpacityExpression: [
            'case',
            ['boolean', ['feature-state', 'hover'], false], // changes the fill opacity when the hover state changes (uses 'onAreaHover()' to control hovers) 
            0.5,
            0.75
        ],
    },
    [CONSTANTS.HEATMAP_WIRELESS_SCORING]: {
        name: 'Wireless Coverage',
        colorRamp: [
            { color: wirelessScoringColors[0], heading: 'No Fiber', max: wirelessScoringMax[0] },
            { color: wirelessScoringColors[1], heading: '<30% Fiber', max: wirelessScoringMax[1] },
            { color: wirelessScoringColors[2], heading: '30-40% Fiber', max: wirelessScoringMax[2] },
            { color: wirelessScoringColors[3], heading: '>40% Fiber' }
        ],
        dataKey: wirelessScoringDataKey,
        fillColorExpression: [
            'step',
            ['get', wirelessScoringDataKey],
            wirelessScoringColors[0], wirelessScoringMax[0],
            wirelessScoringColors[1], wirelessScoringMax[1],
            wirelessScoringColors[2], wirelessScoringMax[2],
            wirelessScoringColors[3]
        ],
        fillOpacityExpression: [
            'case',
            ['boolean', ['feature-state', 'hover'], false], // changes the fill opacity when the hover state changes (uses 'onAreaHover()' to control hovers) 
            0.5,
            0.75
        ],
    },
    [CONSTANTS.HEATMAP_NONE]: {
        name: '',
        mapCardInfo: properties => [
            { label: "Sales Market Name", property: properties.name },
            { label: "Avg Indoor Coverage Score", property: properties[aveCoverageScoreDataKey] },
        ],
        colorRamp: [
            { color: aveCoverageScoreColors[0], heading: 'Unknown', max: aveCoverageScoreMax[0] },
            { color: aveCoverageScoreColors[1], heading: 'Very Weak', max: aveCoverageScoreMax[1] },
            { color: aveCoverageScoreColors[2], heading: 'Uneven', max: aveCoverageScoreMax[2] },
            { color: aveCoverageScoreColors[3], heading: 'Strong', max: aveCoverageScoreMax[3] },
            { color: aveCoverageScoreColors[4], heading: 'Very Strong', max: aveCoverageScoreMax[4] },
            { color: aveCoverageScoreColors[5], heading: 'Best' }
        ],
        dataKey: aveCoverageScoreDataKey,
        fillColorExpression: [
            'step',
            ['get', aveCoverageScoreDataKey],
            aveCoverageScoreColors[0], aveCoverageScoreMax[0],
            aveCoverageScoreColors[1], aveCoverageScoreMax[1],
            aveCoverageScoreColors[2], aveCoverageScoreMax[2],
            aveCoverageScoreColors[3], aveCoverageScoreMax[3],
            aveCoverageScoreColors[4], aveCoverageScoreMax[4],
            aveCoverageScoreColors[5]
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', aveCoverageScoreDataKey], 0],
            0,
            ['case', ['boolean', ['feature-state', 'hover'], false], 0.3, 0.55]
        ],
    },
    [CONSTANTS.HEATMAP_AVE_COVERAGE_SCORE]: {
        name: 'Average Indoor Coverage Score',
        mapCardInfo: properties => [
            { label: "Sales Market Name", property: properties.name },
            { label: "Avg Indoor Coverage Score", property: properties[aveCoverageScoreDataKey] },
        ],
        colorRamp: [
            { color: aveCoverageScoreColors[0], heading: 'Unknown', max: aveCoverageScoreMax[0] },
            { color: aveCoverageScoreColors[1], heading: 'Very Weak', max: aveCoverageScoreMax[1] },
            { color: aveCoverageScoreColors[2], heading: 'Uneven', max: aveCoverageScoreMax[2] },
            { color: aveCoverageScoreColors[3], heading: 'Strong', max: aveCoverageScoreMax[3] },
            { color: aveCoverageScoreColors[4], heading: 'Very Strong', max: aveCoverageScoreMax[4] },
            { color: aveCoverageScoreColors[5], heading: 'Best' }
        ],
        dataKey: aveCoverageScoreDataKey,
        fillColorExpression: [
            'step',
            ['get', aveCoverageScoreDataKey],
            aveCoverageScoreColors[0], aveCoverageScoreMax[0],
            aveCoverageScoreColors[1], aveCoverageScoreMax[1],
            aveCoverageScoreColors[2], aveCoverageScoreMax[2],
            aveCoverageScoreColors[3], aveCoverageScoreMax[3],
            aveCoverageScoreColors[4], aveCoverageScoreMax[4],
            aveCoverageScoreColors[5]
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', aveCoverageScoreDataKey], 0],
            0,
            ['case', ['boolean', ['feature-state', 'hover'], false], 0.3, 0.55]
        ],
    },
    [CONSTANTS.HEATMAP_LOCATION_DENSITY]: {
        name: 'Location County Density',
        mapCardInfo: properties => [
            { label: "Sales Market Name", property: properties.name },
            { label: "Location Density %age", property: properties[locationDensityDataKey] },
            { label: "# of Filtered Locations", property: properties.numberofmatchedlocations },
            { label: "Total Locations", property: properties.totallocations },
        ],
        colorRamp: [
            { color: locationDensityColors[0], heading: 'No Locations', max: locationDensityMax[0] },
            { color: locationDensityColors[1], heading: '<30% Density', max: locationDensityMax[1] },
            { color: locationDensityColors[2], heading: '30-40% Density', max: locationDensityMax[2] },
            { color: locationDensityColors[3], heading: '>40% Density' }
        ],
        dataKey: locationDensityDataKey,
        fillColorExpression: [
            'step',
            ['get', locationDensityDataKey],
            locationDensityColors[0], locationDensityMax[0],
            locationDensityColors[1], locationDensityMax[1],
            locationDensityColors[2], locationDensityMax[2],
            locationDensityColors[3]
        ],
        fillOpacityExpression: [
            'case', ['==', ['get', aveCoverageScoreDataKey], 0],
            0,
            ['case', ['boolean', ['feature-state', 'hover'], false], 0.3, 0.55]
        ],
    },
});
