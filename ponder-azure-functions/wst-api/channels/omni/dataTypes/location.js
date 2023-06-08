const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType) => {

    const latlng = entityType.split('|');

    const lat = latlng[0];
    const lng = latlng[1];


   const result = await pgClient.query(
          `
          SELECT coverage_score_rank,svid, svid_name,coverage_score, latitude, longitude,
          FIVEG, BAND_14, FIRST_NET, ROAM_TEXT, SM_ATTUID, OWNING_ATTUID,FIVEG_PLUS,TPUT_TEXT,FIBER_CUST,
          ADDR,CITY,STATE_Y,ZIPCODE
                FROM ${config.tableName}  WHERE  latitude=${lat} and longitude=${lng}
        `
      );

      return result.rows;


}