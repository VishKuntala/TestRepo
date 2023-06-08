//define default Props so that you don't have to have props to access the heatMapConfig info, for example to get button text titles.
const defaultProps = {
    FIBER_AVAILABLE: null,
    FIBER_PERCENTAGE: null,
    OVERALL_CAT: null,
    ELDERLY_PERCENT: null
};

let heatMapScore = {};

const setHeatMapSummary = score => heatMapScore = R.clone(score);

const getHeatMapSummary = () => heatMapScore;

const heatMapConfig = (properties = defaultProps) => ({
    "fiberPenetration": {
        getCellColor: function (fiberPercentage, fiberAvailable) {
            if (fiberAvailable == 0)
                return '#ffe6cc';
            else if (fiberAvailable > 0 && fiberPercentage < 30)
                return '#ffff99';
            else if (fiberAvailable > 0 && fiberPercentage < 40 && fiberPercentage >= 30)
                return '#b3d9ff';
            else if (fiberAvailable > 0 && fiberPercentage >= 40)
                return '#b3ffb3';
        },
        baseBallCardInfo: {
            description: '',
        },
        button1: {
            criteria: properties.FIBER_AVAILABLE === 0, //reminder that summary queries are hard coded, ex: GET_CMA_SUMMARY_INFO
            color: '#ffe6cc', //'#ffffff',
            highlightColor: '#ff9933',
            buttonText: 'No Fiber Available',
            exportText: 'No_Fiber_Available_',
            summaryCol1: 'NO_FIBER_COUNT',
            summaryCol2: 'NO_FIBER_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE = 0',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") == 0);
            }
        },
        button2: {
            criteria: properties.FIBER_PERCENTAGE < 30,
            color: '#ffff99', // '#b3daff',
            highlightColor: '#ffff00',
            buttonText: 'Less than 30% Fiber Penetration',
            exportText: 'Under_30_Percent_Fiber_Pen_',
            summaryCol1: 'LOW_PEN_COUNT',
            summaryCol2: 'LOW_PEN_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE > 0 AND FIBER_PERCENTAGE< 30',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.FIBER_PERCENTAGE < 30);
            }
        },
        button3: {
            criteria: properties.FIBER_PERCENTAGE < 40,
            color: '#b3d9ff',   // '#339cff',
            highlightColor: '#4da6ff',
            buttonText: '30% to 40% Fiber Penetration',
            exportText: '30_to_40_Percent_Fiber_Pen_',
            summaryCol1: 'MED_PEN_COUNT',
            summaryCol2: 'MED_PEN_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE > 0 AND FIBER_PERCENTAGE< 40 AND FIBER_PERCENTAGE >= 30',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.FIBER_PERCENTAGE < 40 && row.FIBER_PERCENTAGE >= 30);
            }

        },
        button4: {
            criteria: properties.FIBER_PERCENTAGE >= 40,
            color: '#b3ffb3', //'#004f99',
            highlightColor: '#009900',
            buttonText: 'More than 40% Fiber Penetration',
            exportText: 'Atleast_40_Percent_Fiber_Pen_',
            summaryCol1: 'HIGH_PEN_COUNT',
            summaryCol2: 'HIGH_PEN_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE > 0 AND FIBER_PERCENTAGE >= 40',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.FIBER_PERCENTAGE >= 40);
            }

        },
    },
    "wirelessCoverageAndFiber": {
        getCellColor: function (wirelessCategory, fiberAvailable) {
            if (fiberAvailable == 0 && wirelessCategory == "Weak")
                return '#ffe6cc';
            else if (fiberAvailable > 0 && wirelessCategory == "Weak")
                return '#ffff99';
            else if (fiberAvailable == 0 && wirelessCategory == "Strong")
                return '#b3d9ff';
            else if (fiberAvailable > 0 && wirelessCategory == "Strong")
                return '#b3ffb3';
        },
        baseBallCardInfo: {
            description: '',
        },
        button1: {
            criteria: properties.OVERALL_CAT === 'WeakWirelessNoFiber',
            color: '#ffe6cc',
            highlightColor: '#ff9933',
            buttonText: 'Weak Wireless & No Fiber',
            exportText: 'With_WeakWireless_NoFiber_',
            summaryCol1: 'PWNF_COUNT',
            summaryCol2: 'PWNF_OPP',
            sqlWhereClause: "AND OVERALL_CAT LIKE 'WeakWirelessNoFiber'", //NOTE if the Where clause needs quotes, the entire clause must be surrounded by double quotes and the inner quotes must be single quotes
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") == 0 && row.WIRELESS_CATEGORY == 'Weak');
            }
        },
        button2: {
            criteria: properties.OVERALL_CAT === 'WeakWirelessFiberAvailable',
            color: '#ffff99',
            highlightColor: '#ffff00',
            buttonText: 'Weak Wireless & Fiber Available',
            exportText: 'With_WeakWireless_FiberAvailable_',
            summaryCol1: 'PWGF_COUNT',
            summaryCol2: 'PWGF_OPP',
            sqlWhereClause: "AND OVERALL_CAT LIKE 'WeakWirelessFiberAvailable'",
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.WIRELESS_CATEGORY == 'Weak');
            }
        },
        button3: {
            criteria: properties.OVERALL_CAT === 'StrongWirelessNoFiber',
            color: '#b3d9ff',
            highlightColor: '#4da6ff',
            buttonText: 'Strong Wireles & No Fiber',
            exportText: 'With_StrongWireless_NoFiber_',
            summaryCol1: 'GWNF_COUNT',
            summaryCol2: 'GWNF_OPP',
            sqlWhereClause: "AND OVERALL_CAT LIKE 'StrongWirelessNoFiber'",
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") == 0 && row.WIRELESS_CATEGORY == 'Strong');
            }
        },
        button4: {
            criteria: properties.OVERALL_CAT === 'StrongWirelessFiberAvailable',
            color: '#b3ffb3',
            highlightColor: '#009900',
            buttonText: 'Strong Wireless & Fiber Available',
            exportText: 'With_StrongWireless_FiberAvailable_',
            summaryCol1: 'GWGF_COUNT',
            summaryCol2: 'GWGF_OPP',
            sqlWhereClause: "AND OVERALL_CAT LIKE 'StrongWirelessFiberAvailable'",
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.WIRELESS_CATEGORY == 'Strong');
            }
        },
    },
    "elderlyPercentage": {
        getCellColor: function (elderlyPercent, fiberAvailable) {            
            if (fiberAvailable == 0)
                return '#ffe6cc';
            else if (fiberAvailable > 0 && elderlyPercent < 20)
                return '#ffff99';
            else if (fiberAvailable > 0 && elderlyPercent < 25 && elderlyPercent >= 20)
                return '#b3d9ff';
            else if (fiberAvailable > 0 && elderlyPercent >= 25)
                return '#b3ffb3';
        },
        baseBallCardInfo: {
            description: '<br />' + '<b>Elderly Percent: ' + properties.ELDERLY_PERCENT + '%' + '</b>',
        },
        button1: {
            criteria: properties.FIBER_AVAILABLE === 0, //reminder that summary queries are hard coded, ex: GET_CMA_SUMMARY_INFO
            color: '#ffe6cc', //'#ffffff',
            highlightColor: '#ff9933',
            buttonText: 'No Fiber Available',
            exportText: 'No_Fiber_Available_',
            summaryCol1: 'NO_FIBER_COUNT',
            summaryCol2: 'NO_FIBER_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE = 0',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") == 0);
            }
        },
        button2: {
            criteria: properties.ELDERLY_PERCENT < 20,
            color: '#ffff99', // '#b3daff',
            highlightColor: '#ffff00',
            buttonText: 'Less than 20% 60+',
            exportText: 'Under_20_Percent_Elderly_',
            summaryCol1: 'LOW_ELDERLY_COUNT',
            summaryCol2: 'LOW_ELDERLY_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE > 0 AND ELDERLY_PERCENT < 20',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.ELDERLY_PERCENT < 20);
            }
        },
        button3: {
            criteria: properties.ELDERLY_PERCENT < 25,
            color: '#b3d9ff',   // '#339cff',
            highlightColor: '#4da6ff',
            buttonText: '20% to 25% 60+',
            exportText: '20_to_25_Percent_Elderly_',
            summaryCol1: 'MED_ELDERLY_COUNT',
            summaryCol2: 'MED_ELDERLY_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE > 0 AND ELDERLY_PERCENT < 25 AND ELDERLY_PERCENT >= 20',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.ELDERLY_PERCENT < 25 && row.ELDERLY_PERCENT >= 20);
            }

        },
        button4: {
            criteria: properties.ELDERLY_PERCENT >= 25,
            color: '#b3ffb3', //'#004f99',
            highlightColor: '#009900',
            buttonText: 'More than 25% 60+',
            exportText: 'Atleast_25_Percent_Elderly_',
            summaryCol1: 'HIGH_ELDERLY_COUNT',
            summaryCol2: 'HIGH_ELDERLY_OPP',
            sqlWhereClause: 'AND FIBER_AVAILABLE > 0 AND ELDERLY_PERCENT >= 25',
            filter: function (data) {
                return data.filter(row => row.FIBER_AVAILABLE.replace(/,/g, "") > 0 && row.ELDERLY_PERCENT >= 25);
            }

        }
    },
});


export { heatMapConfig, setHeatMapSummary, getHeatMapSummary };

// (ponderApp.heatMapConfig(props)()["fiberPenetration"].button1.criteria 
// (ponderApp.heatMapConfig(properties)()["fiberPenetration"].button1.criteria 

