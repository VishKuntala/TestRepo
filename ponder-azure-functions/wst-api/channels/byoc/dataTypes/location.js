const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType) => {

    const latlngClusterId = entityType.split('|');

    const lat = latlngClusterId[0];
    const lng = latlngClusterId[1];

    const byocClusterId = latlngClusterId[2];


   const result = await pgClient.query(
          `
          SELECT coverage_score_rank,byoc_cluster_name,location_id, company_name,coverage_score, latitude, longitude,
          FIVEG,TPUT_TEXT,FIRST_NET,BAND_14,LEGACY_DEVICE_TEXT,
          ADDRESS,CITY,STATE,ZIPCODE FROM WST.SALES_OPP_BYOC_DETAIL INNER JOIN WST.SALES_OPP_BYOC_LIST
          ON WST.SALES_OPP_BYOC_DETAIL.BYOC_CLUSTER_ID = WST.SALES_OPP_BYOC_LIST.BYOC_CLUSTER_ID WHERE  
          SALES_OPP_BYOC_DETAIL.BYOC_CLUSTER_ID = ${byocClusterId} AND latitude=${lat} and longitude=${lng}
        `
      );

      return result.rows;


}