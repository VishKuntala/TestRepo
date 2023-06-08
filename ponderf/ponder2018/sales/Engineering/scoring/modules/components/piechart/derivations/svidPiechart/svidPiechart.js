import $ from "jquery";
import * as R from 'ramda';



const svidPiechart = ({ adminUser, instance }) => {

    const pieChartConfig = {
        
        series: [{
            name: instance.seriesName,
            colorByPoint: true,
            size: '100%',
            innerSize: '50%',
            data: []
        }]
    };


    const generateSeries = async (groupedData) => {
        const configHelper = (await import(`./${instance.configHelper}`)).default;
        const keys = R.keys(groupedData);
        const series = R.map(key => {
            // strip the key of spaces and /
            const cleanedUpKey = R.replace(/ /g, '', R.replace(/\//g, '', key));
            return { name: configHelper[cleanedUpKey].name, y: groupedData[key], color: configHelper[cleanedUpKey].color };
        }, keys);
        // trigger an update to the legend control       

        instance.store[instance.legendDataKey] = series;
        return series;
    }

    const initSubscriptions = () => {
        instance.stateManager.subscribe("mapData",
            async d => {
                if (d) {
                    // const seriesData = await generateSeries(d);
                    // await instance.renderChart(seriesData, d.length);
                }

            });
        instance.stateManager.subscribe(`renderChart_${instance.groupByProp}`,
            async d => {
                if (d && !R.is(Array, d)) {
                    const chartData = await $.ajax({
                        url: `${instance.store.config.baseUrl}/ChartData`,
                        headers: { "Content-Type": "application/json" },
                        type: 'post',
                        data: JSON.stringify(Object.assign(d, { attribute: instance.groupByProp })),
                        processData: false
                    });
                    const totalCount = R.reduce(R.add, 0, R.pluck("count", chartData.d));
                    const groupedData = {};
                    for (let i = 0; i < chartData.d.length; i += 1) {
                        const item = chartData.d[i];
                        groupedData[item[instance.groupByProp]] = item.count;
                    }
                    const seriesData = await generateSeries(groupedData);
                    if ($(".charts.segment").is(":hidden")) {
                        $(".charts.segment").show();
                    }
                    await instance.renderChart(seriesData, totalCount);

                }

            });

    }


    return {
        initSubscriptions,
        pieChartConfig
    }
}

export default svidPiechart;

