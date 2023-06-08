const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType) => {


   const result = await pgClient.query(
          `
          SELECT
                lus.id as rownum, mkt.vpgm_markt AS sales_market, dc.dma_name, address, city, st.state_abbr AS state, zipcode,
                ics_score_id, fvg.name AS fiveg, mmw.name AS fiveg_plus_mmwave, lus.fiveg_plus_speed,
                fgpc.name AS fiveg_plus_cband, cband_scs_id, cband_speed, b14.name AS band_14, fnt.name AS first_net,
                shss.name AS sales_high_speed_suitability, rsc.name AS ran_suitability_cause, exp.name AS speed_experience,
                lus.weighted_avg_tput, tput_min, tput_max, acp.name AS avail_capacity, cqi, spef.name AS spectrum_efficiency_12_pl,
                weighted_avg_mcep_prbutl, rtxt.name AS roam_text, lus.roaming_rate, lus.coverage_radius, lus.coverage_score_rank,
                lus.latitude::text, lus.longitude::text
                FROM ${config.tableName} lus
                INNER JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
                INNER JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
                INNER JOIN spatial.state st ON lus.state_id = st.gid
                INNER JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
                INNER JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
                INNER JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
                INNER JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
                INNER JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
                INNER JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
                INNER JOIN wst.ref_ran_suitability_cause rsc ON lus.ran_suitability_cause_id = rsc.id
                INNER JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
                INNER JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
                INNER JOIN wst.ref_spectrum_efficiency_12_pl spef ON lus.spectrum_efficiency_12_pl_id = spef.id
                INNER JOIN wst.ref_roam_text rtxt ON lus.roam_text_id = rtxt.id 
                WHERE lus.id=${entityType}
        `
      );

      return result.rows;


}