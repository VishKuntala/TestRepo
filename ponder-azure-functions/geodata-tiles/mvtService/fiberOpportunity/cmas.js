const mvt = (bbox, pgClient, filterParams) => {
    const { marketType, market } = filterParams;
    if (marketType == "NATIONAL") {
      // if marketType == "NATIONAL" return all cmas
      return pgClient.query(
        `
        WITH geom_envelop (geom_e) AS
        (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
        geom_filter AS
        (
            SELECT * from (
              SELECT dim.gid as id, dim.cma, dim.name, dim.geom,
              fct.copper_upgrade, fct.totalarea, fct.totalpops, fct.pop_density, fct.wireless_score, fct.fiber_score,
              fct.fiber_available, fct.fiber_customers, fct.fiber_percentage::float, fct.overall_cat, fct.fiber_opportunity,
              fct.number_of_psas, fct.wireless_category, fct.fiber_availability, fct.attr_store_count,
              fct.ar_store_count, fct.all_store_count, fct.sales_market, fct.elderly_percent
              FROM spatial.cma as dim
              LEFT OUTER JOIN sot.sales_opp_cma_prod fct on dim.cma = fct.cma            
            ) nf 
            , geom_envelop ge
        WHERE ST_Intersects(nf.geom, ge.geom_e))
        SELECT ST_AsMVT(q, 'cmaLayer', 4096, 'geom') FROM (
        SELECT 
              id, cma, name, 
              copper_upgrade, totalarea, totalpops, pop_density, wireless_score, fiber_score,
              fiber_available, fiber_customers, fiber_percentage, overall_cat, fiber_opportunity,
              number_of_psas, wireless_category, fiber_availability, attr_store_count,
              ar_store_count, all_store_count, sales_market, elderly_percent,
              ST_AsMVTGeom(geom, geom_e, 4096, 256, true) geom FROM geom_filter gf) q;
        `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
    } else if (marketType == "REGION") {
      return pgClient.query(
        `
        WITH geom_envelop (geom_e) AS
        (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
        geom_filter AS
        (
            SELECT * from (
              SELECT dim.gid as id, dim.cma, dim.name, dim.geom,
              fct.copper_upgrade, fct.totalarea, fct.totalpops, fct.pop_density, fct.wireless_score, fct.fiber_score,
              fct.fiber_available, fct.fiber_customers, fct.fiber_percentage::float, fct.overall_cat, fct.fiber_opportunity,
              fct.number_of_psas, fct.wireless_category, fct.fiber_availability, fct.attr_store_count,
              fct.ar_store_count, fct.all_store_count, fct.sales_market, fct.elderly_percent
              FROM spatial.cma as dim
              LEFT OUTER JOIN sot.sales_opp_cma_prod fct on dim.cma = fct.cma
              WHERE UPPER(fct.sales_region1) = UPPER('${market}') OR UPPER(fct.sales_region2) = UPPER('${market}')
            ) nf 
            , geom_envelop ge
        WHERE ST_Intersects(nf.geom, ge.geom_e))
        SELECT ST_AsMVT(q, 'cmaLayer', 4096, 'geom') FROM (
        SELECT 
              id, cma, name, 
              copper_upgrade, totalarea, totalpops, pop_density, wireless_score, fiber_score,
              fiber_available, fiber_customers, fiber_percentage, overall_cat, fiber_opportunity,
              number_of_psas, wireless_category, fiber_availability, attr_store_count,
              ar_store_count, all_store_count, sales_market, elderly_percent,
              ST_AsMVTGeom(geom, geom_e, 4096, 256, true) geom FROM geom_filter gf) q;
        `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
    } else if (marketType == "MARKET") {
      return pgClient.query(
        `
        WITH geom_envelop (geom_e) AS
        (SELECT ST_Transform(ST_MakeEnvelope($1, $2, $3, $4, 4326), 3857)), 
        geom_filter AS
        (
            SELECT * from (
              SELECT dim.gid as id, dim.cma, dim.name, dim.geom,
              fct.copper_upgrade, fct.totalarea, fct.totalpops, fct.pop_density, fct.wireless_score, fct.fiber_score,
              fct.fiber_available, fct.fiber_customers, fct.fiber_percentage::float, fct.overall_cat, fct.fiber_opportunity,
              fct.number_of_psas, fct.wireless_category, fct.fiber_availability, fct.attr_store_count,
              fct.ar_store_count, fct.all_store_count, fct.sales_market, fct.elderly_percent
              FROM spatial.cma as dim
              LEFT OUTER JOIN sot.sales_opp_cma_prod fct on dim.cma = fct.cma
              WHERE UPPER(fct.sales_market1) = UPPER('${market}') OR UPPER(fct.sales_market2) = UPPER('${market}') OR UPPER(fct.sales_market3) = UPPER('${market}')
            ) nf 
            , geom_envelop ge
        WHERE ST_Intersects(nf.geom, ge.geom_e))
        SELECT ST_AsMVT(q, 'cmaLayer', 4096, 'geom') FROM (
        SELECT 
              id, cma, name, 
              copper_upgrade, totalarea, totalpops, pop_density, wireless_score, fiber_score,
              fiber_available, fiber_customers, fiber_percentage, overall_cat, fiber_opportunity,
              number_of_psas, wireless_category, fiber_availability, attr_store_count,
              ar_store_count, all_store_count, sales_market, elderly_percent,
              ST_AsMVTGeom(geom, geom_e, 4096, 256, true) geom FROM geom_filter gf) q;
        `,
        [bbox[0], bbox[1], bbox[2], bbox[3]]
      );
    }
  };
  
  module.exports = { mvt };
  