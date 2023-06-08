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
          SELECT VPGM, ARCHETYPE, DMA_NM, MIKEY, SIMPLE_COVERAGE_SCORE, FIVEG, BAND_14, AWB_CAPACITY_TEXT,
          AWB_SPECTRUM_EFFICIENCY, GPON_STATUS, GPON_CUSTOMERS, '' as HYPERGIG, ATT_RANK_GWS, TMO_RANK_GWS, VZ_RANK_GWS, ATT_OOKLA_QUANTILE, 
          TMO_RATIO_OOKLA_LTE, VERIZON_RATIO_OOKLA_LTE,
          POP_DENSITY_TEXT, HH_MEDIAN_INCOME_TEXT, ADDR, CITY, ST, ZIP, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_PHONE1, LATITUDE, LONGITUDE
                FROM ${config.tableName}  WHERE  latitude=${lat} and longitude=${lng}
        `
      );

      return result.rows;


}