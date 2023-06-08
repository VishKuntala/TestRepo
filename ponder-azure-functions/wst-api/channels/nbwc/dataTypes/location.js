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
          SELECT CAMPAIGN_ID, CASE WHEN CAMPAIGN_ID = '1-33735165693' THEN '2T21 Grow Mobility Add A Line'
             WHEN CAMPAIGN_ID = '1-33735165652' THEN '2T21 Acquire Mobility Existing Wireline'
             WHEN CAMPAIGN_ID = '1-33735165636' THEN '2T21 Acquire Mobility Port Outs'
             WHEN CAMPAIGN_ID = '1-33735165719' THEN '2T21 Acquire Mobility Fiber Fast Follow'
             WHEN CAMPAIGN_ID = '1-33735165667' THEN '2T21 Acquire Mobility New Logo'
             WHEN CAMPAIGN_ID = '1-33761622514' THEN '2T21 Grow Top Mobility'
             WHEN CAMPAIGN_ID = '1-33735165706' THEN '2T21 Grow FAN Fast Follow' 
             WHEN CAMPAIGN_ID = '1-35275858218' THEN '2T21 Grow Mobility Voice'
             END AS CAMPAIGN_NAME, 
                            COVERAGE_SCORE, FIVEG, FIVEG_PLUS,
                            TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, CONTACT_COMPANY_NM,ADDR_LINE1,
                            CITY_NM, STATE_Y, POSTL_CD, LATITUDE, LONGITUDE,
                            LOCATION_ID, CONTACT_PHONE1, CONTACT_EMAIL, CONTACT_FIRST_NM, CONTACT_LAST_NM, COVERAGE_SCORE_RANK,
                            NUMERIC_OF_EMPLOYEES::FLOAT8 AS NUMBER_OF_EMPLOYEES
                FROM ${config.tableName}  WHERE  latitude=${lat} and longitude=${lng}
        `
      );

      return result.rows;


}