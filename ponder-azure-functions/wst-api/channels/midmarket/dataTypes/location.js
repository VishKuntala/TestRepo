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
                FIVEG, BAND_14, FIRST_NET, ROAM_TEXT, AVP_ATTUID, SM_ATTUID, OWNING_ATTUID,MOB_SE_ATTUID,FIVEG_PLUS,TPUT_TEXT,LEGACY_DEVICE_TEXT,FIBER_STATUS,
                ADDR,CITY,STATE,ZIPCODE,ROAM_TEXT_SORT_COLUMN,TPUT_TEXT_SORT_COLUMN,LEGACY_DEVICE_TEXT_SORT_COLUMN,
                BAND_14_SORT_COLUMN,FIVEG_SORT_COLUMN,FIVEG_PLUS_SORT_COLUMN,FIRST_NET_SORT_COLUMN,FIBER_STATUS_SORT_COLUMN
                FROM ${config.tableName}  WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0
                AND latitude=${lat} and longitude=${lng}
        `
      );

      return result.rows;


}