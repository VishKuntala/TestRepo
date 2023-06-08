const df = require("durable-functions");
const { odata } = require("@azure/data-tables");
const { TableClient, TableServiceClient, TableTransaction } = require("@azure/data-tables");

const getCacheTrackerEntities = async () => {
    const cacheTrackerTableClient = TableClient.fromConnectionString(
        process.env.AZURE_STORAGE_CONNECTION_STRING, "wstCacheTracker"
      );    
      const  queryOptions = {
        filter: odata`requestCount ge 30` 
      };       
    const cacheTrackerRows = [];
    const entities = cacheTrackerTableClient.listEntities(
      { 
        queryOptions
      });

    for await (const entity of entities) {
        cacheTrackerRows.push(entity)
    }

    return cacheTrackerRows;

  }

module.exports = async function (context, req) {

    const client = df.getClient(context);
    const cacheTrackerRows = await getCacheTrackerEntities();

    const instanceId = await client.startNew(req.params.functionName, undefined, {cacheTrackerRows, baseApiUrl: req.originalUrl.split('/wstcache')[0] });

    context.log(`Started orchestration with ID = '${instanceId}'.`);

    return client.createCheckStatusResponse(context.bindingData.req, instanceId);
};