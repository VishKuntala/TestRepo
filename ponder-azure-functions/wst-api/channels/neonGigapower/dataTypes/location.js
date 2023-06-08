const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {

  const config = conf(process.env.GROUP_MEMBERSHIP);
   const result = await pgClient.query(
          `
          SELECT
          ts.addr_id, ts.zip_co_psa, ts.network_service_addr, ts.fibr_co_glid, 
          lus.wireless_percentage as psa_wireless_pen_rate, lus.fiber_percentage as psa_fiber_pen_rate,
          ts.dwelling_type, ts.adjusted_dwelling_type, ts.building_number, 
          ts.house_nbr, ts.prefix, ts.street_name, ts.unit_number, ts.city, ts.zip, ts.state,
          ts.fiber_customer, ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} as addr_customer_category_id, 
          ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["map_customer_category_id"]} as map_customer_category_id, ts.csi_eligible, ts.hypergig,
          ts.LATITUDE::text, ts.LONGITUDE::text, cov.name as indoor_coverage_score, acc.name as customer_category,
          mdu.unit_count,mdu.fiber_customer_count,
          mdu.wireless_customer_count,mdu.mdu_hypergig_count,mdu.fiber_opportunity,mdu.wireless_opportunity,ts.mdu_id
            FROM wst.neon_gigapower_fiber_addresses ts
            inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
          WHERE ts.addr_id=${entityType}
        `
      );

      return result.rows;


}