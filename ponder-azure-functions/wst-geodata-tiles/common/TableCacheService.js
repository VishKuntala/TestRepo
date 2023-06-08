const R = require('ramda');
const { TableClient, TableServiceClient, TableTransaction } = require("@azure/data-tables");

const tableService = TableServiceClient.fromConnectionString(
    process.env.AZURE_STORAGE_CONNECTION_STRING
  );

  class TableCacheService {

    constructor() {
      this.tableClient = null;
      this.cacheTrackerTableClient = null;
      this.summaryEntityDoesNotExist = false;
      this.summaryEntity = null;
      this.cacheTrackerEntity = null;
      this.cacheTrackerEntityDoesNotExist = false;
    }

    async initService (channel, partitionKey, whereClause, sortClause, chartKeys, bbox, geoEntity, heatmap, locationAttribute) {

      await tableService.createTable(channel);
      await tableService.createTable('wstCacheTracker');

      this.tableClient = TableClient.fromConnectionString(
        process.env.AZURE_STORAGE_CONNECTION_STRING, channel
      );
    
      this.cacheTrackerTableClient = TableClient.fromConnectionString(
        process.env.AZURE_STORAGE_CONNECTION_STRING, "wstCacheTracker"
      );

      try {
        this.summaryEntity = await this.tableClient.getEntity(`${partitionKey}-summary`, "1");
      } catch (err) {
        this.summaryEntityDoesNotExist = (err.statusCode === 404);
      }
      
  
      try {
        this.cacheTrackerEntity = await this.cacheTrackerTableClient.getEntity(`${partitionKey}-${channel}`, "1");
      } catch (err) {
        this.cacheTrackerEntityDoesNotExist = (err.statusCode === 404);
      }
  
      if (this.cacheTrackerEntityDoesNotExist) {
        await this.cacheTrackerTableClient.createEntity({
          partitionKey: `${partitionKey}-${channel}`,
          rowKey: "1",
          whereClause: whereClause?.trim(),
          sortClause: sortClause?.trim(),
          chartKeys,
          bbox,
          geoEntity,
          heatmap,
          locationAttribute,
          requestCount: 1
        });
      } else {
        await this.cacheTrackerTableClient.updateEntity({
          partitionKey: `${partitionKey}-${channel}`,
          rowKey: "1",
          whereClause: whereClause?.trim(),
          sortClause: sortClause?.trim(),
          chartKeys,
          bbox,
          requestCount: this.cacheTrackerEntity.requestCount + 1
        });
      }
    }

    async putInCache(rows, partitionKey, totalCount, lastPage, businessCount) {
      const batchedRows = R.splitEvery(100,rows);
      for ( let i = 0; i < batchedRows.length; i += 1) {
            // Create a transaction
            const transaction = new TableTransaction();
            const batch = batchedRows[i];
            for ( let j = 0; j < batch.length; j += 1) {
              const row = batch[j];
              transaction.createEntity(Object.assign({
                partitionKey,
                rowKey: `${i*100 + j}`.padStart(9, '0'),
              }, row));
            }
        const transactionResult = await this.tableClient.submitTransaction(transaction.actions);
      }
      await this.tableClient.createEntity({
        partitionKey: `${partitionKey}-summary`,
        rowKey: `1`,
        totalCount, lastPage, businessCount
      });


    }

    async getFromCache( queryOptions ) {
      const rowsFromCache = [];
      const entities = this.tableClient.listEntities(
        { 
          queryOptions
        });
  
      for await (const entity of entities) {
        rowsFromCache.push(entity)
      }

      return rowsFromCache;

    }

  }

  module.exports = TableCacheService;