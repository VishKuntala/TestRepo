const R = require('ramda');
const { BlobServiceClient } = require('@azure/storage-blob');
const config = require('../common/config');
const { sqlBuilder } = require('../common');

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {


   const result = await pgClient.query(
          `
          SELECT
          lus.id as rownum, mkt.vpgm_markt AS sales_market, arch.name as archetype, 
          dc.dma_name, lus.mikey::text, address, lus.city, st.state_abbr AS state, zipcode,
          cov.name as simple_coverage_score, fvg.name AS fiveg, mmw.name AS fiveg_plus_mmwave, 
          fgpc.name AS fiveg_plus_cband,  b14.name AS band_14, fnt.name AS first_net,
          shss.name AS sales_high_speed_suitability,  exp.name AS speed_experience,
          acp.name AS avail_capacity,mgig.name as multigig,fibstatus.name as fiber_status,
          futurefiberstatus.name as future_fiber_status,
          eligmaxspeed.name as eligible_max_speed, fibcomp.name as fiber_competitor_any,
          mtnt.name as multi_tenant, COALESCE(newlitgpon.name,'n/a') as newly_lit_gpon, 
          totemp.name as total_employees_here,
          attookla.name as att_ookla_quintile,tmo.name as tmo_ratio_ookla,
          vzn.name as vzn_ratio_ookla,popden.name as pop_density_zip,medinc.name as median_income,
          pcthispanic.name as percentHispanic, totopploc.name as total_opportunities_at_location,
          totcustatloc.name as total_customers_at_location, nonfibercust.name as non_fiber_customers_at_location,
          lus.latitude::text, lus.longitude::text, COALESCE(lus.any_fiber_lit_yearmo::text,'n/a') as any_fiber_lit_yearmo, lus.wcpsa as psa,
          lus.location_id, attstore.location_name, fiber_pid
          FROM ${config.tableName} lus
          LEFT JOIN spatial.vpgm_market mkt ON lus.sales_market_id = mkt.gid
          LEFT JOIN wst.ref_bb_archetype arch on lus.archetype_id = arch.id
          LEFT JOIN spatial.dma_county dc ON lus.dma_id = dc.gid
          LEFT JOIN spatial.state st ON lus.state_id = st.gid
          LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
          LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
          LEFT JOIN wst.ref_fiveg_plus_mmwave mmw ON lus.fiveg_plus_mmwave_id = mmw.id
          LEFT JOIN wst.ref_fiveg_plus_cband fgpc ON lus.fiveg_plus_cband_ics_id = fgpc.id
          LEFT JOIN wst.ref_band_14 b14 ON lus.band_14_id = b14.id
          LEFT JOIN wst.ref_first_net fnt ON lus.first_net_id = fnt.id
          LEFT JOIN wst.ref_sales_high_speed_suitability shss ON lus.wireless_broadband_suitability_ics_id = shss.id
          LEFT JOIN wst.ref_speed_experience exp on lus.speed_experience_ics_id = exp.id
          LEFT JOIN wst.ref_avail_capacity acp ON lus.avail_capacity_id = acp.id
          LEFT JOIN wst.ref_alternative mgig on lus.multigig_id = mgig.id
          LEFT JOIN wst.ref_bb_fiber_status_report_rows fibstatus on lus.fiber_status_report_rows_id = fibstatus.id
          LEFT JOIN wst.ref_bb_future_fiber_status futurefiberstatus on lus.future_fiber_status_id = futurefiberstatus.id
          LEFT JOIN wst.ref_bb_eligible_max_speed eligmaxspeed on lus.bb_eligible_max_speed_id = eligmaxspeed.id
          LEFT JOIN wst.ref_alternative fibcomp on lus.fiber_competitor_any_id = fibcomp.id
          LEFT JOIN wst.ref_alternative mtnt on lus.multi_tenant_id = mtnt.id
          LEFT JOIN wst.ref_alternative newlitgpon on lus.newly_lit_gpon_id = newlitgpon.id 
          LEFT JOIN wst.ref_bb_total_employees_here totemp on lus.total_employees_here_id = totemp.id
          LEFT JOIN wst.ref_bb_pct_hispanic pcthispanic on lus.pct_hispanic_id = pcthispanic.id
          LEFT JOIN wst.ref_bb_att_ookla_quintile attookla on lus.att_ookla_quintile_id = attookla.id
          LEFT JOIN wst.ref_bb_tmovzn_ratio tmo on lus.tmo_ratio_ookla_id = tmo.id
          LEFT JOIN wst.ref_bb_tmovzn_ratio vzn on lus.vzn_ratio_ookla_id = vzn.id
          LEFT JOIN wst.ref_bb_pop_denisty_quintile popden on lus.pop_density_zip_id = popden.id
          LEFT JOIN wst.ref_bb_median_income medinc on lus.median_income_id = medinc.id
          LEFT JOIN wst.ref_bb_total_customers_at_location totcustatloc on lus.total_customers_at_location_id = totcustatloc.id
          LEFT JOIN wst.ref_bb_non_fiber_customers_at_location nonfibercust on lus.non_fiber_customers_at_location_id = nonfibercust.id
          LEFT JOIN wst.ref_bb_total_opportunities_at_location totopploc on lus.total_opportunities_at_location_id = totopploc.id
          LEFT JOIN wst.ref_bb_total_employees_here totemplhere ON lus.total_employees_here_id = totemplhere.id
          LEFT JOIN sot.sales_att_store_loc_prod attstore on lus.location_id = attstore.location_id
          WHERE lus.mikey=${entityType}
        `
      );

      return result.rows;


}