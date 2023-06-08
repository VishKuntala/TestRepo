/*
 * This function is not intended to be invoked directly. Instead it will be
 * triggered by an HTTP starter function.
 */

const df = require("durable-functions");
const { bclsv2 } = require("../wst-api/channels");
let instanceId = null;
const channels = (process.env.CACHED_WST_CHANNELS || "bclsv2").split(',');

module.exports = df.orchestrator(function* (context) {
    const outputs = [];
    // if (context.bindings.context.instanceId !== instanceId) {
        instanceId = context.bindings.context.instanceId;
        const cacheTrackerRows = context.df.getInput().cacheTrackerRows;
        const baseApiUrl = context.df.getInput().baseApiUrl;
        for (let i = 0; i < channels.length; i += 1) {
            for (let j = 0; j < cacheTrackerRows.length; j += 1) {
                const { sortClause, whereClause, chartKeys, bbox, geoEntity, heatmap, locationAttribute } = cacheTrackerRows[j];
                const channel = channels[i];
                outputs.push(yield context.df.callActivity("wst-cache-builder", JSON.stringify({whereClause, sortClause, chartKeys, bbox, geoEntity, heatmap, locationAttribute, channel, baseApiUrl}) ));
            }
        }
    // }
    return outputs;
    
});