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
          SELECT external_living_unit_id, address, city, state_cd, zipcode, address_line_2, network_build_type_cd
                FROM ${config.tableName}  WHERE  latitude=${lat} and longitude=${lng}
        `
      );

      return result.rows;


}