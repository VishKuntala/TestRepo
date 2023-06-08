const R = require('ramda');
const SphericalMercator = require('@mapbox/sphericalmercator');
const { featureCollection } =  require('@turf/helpers');
const turfBbox= require("@turf/bbox");
const turfBboxPolygon = require("@turf/bbox-polygon");
const turfCombine = require("@turf/combine");
const mercator = new SphericalMercator({size: 256});


    const get = async (pgClient, postParams) => {
      const bboxPolygon = turfBboxPolygon.default;
      const bbox = turfBbox.default;
      const combine = turfCombine.default;

      let combinedBbox = null;

      let bbx = null;

      let tableData = [];

      let coordsAsArray = [];
      const bboxes = [];

      const {
        searchedZip,
        searchedCounty,
        searchedDMA,
        customerCategoryId,
        psa,
        coords,
      } = postParams;

      const whereClauseForFilters = () => {
        let whereClause = "1=1";
        if (searchedZip && searchedZip !== "undefined") {
          whereClause = `${whereClause} and fa.zip='${searchedZip}'`;
        }
        if (searchedCounty && searchedCounty !== "undefined") {
          whereClause = `${whereClause} and fa.county_fips='${searchedCounty}'`;
        }
        if (searchedDMA && searchedDMA !== "undefined") {
          whereClause = `${whereClause} and fa.dma='${searchedDMA}'`;
        }
        if (psa && psa !== "undefined") {
          whereClause = `${whereClause} and fa.zip_co_psa='${psa}'`;
        }
        return whereClause;
      };

      // let mduTableJoinClause = `LEFT OUTER JOIN sot.SALES_OPP_MDU_PROD mdu ON fa.latitude = mdu.latitude and fa.longitude = mdu.longitude`;
      // if (customerCategoryId == 7 || customerCategoryId == 8)
      //   mduTableJoinClause = `INNER JOIN sot.SALES_OPP_MDU_PROD mdu ON fa.latitude = mdu.latitude and fa.longitude = mdu.longitude`;

      let mduTableJoinClause = `LEFT OUTER JOIN sot.SALES_OPP_MDU_PROD mdu ON fa.latitude = mdu.latitude and fa.longitude = mdu.longitude`;
      let mduTableInClause = `customer_category_id IN (1,2,3,4,5,6)`;
      if (customerCategoryId > 6) {
        mduTableJoinClause = `INNER JOIN sot.SALES_OPP_MDU_PROD mdu ON fa.latitude = mdu.latitude and fa.longitude = mdu.longitude`;
        mduTableInClause = `customer_category_id IN (7,8)`;
      }

      // coords is of the form z1,x1,y1^z2,x2,y2^z3,x3,y3
      coordsAsArray = coords.split("^");

      const selectColumns = `addr_id, fa.network_service_addr as id, fa.zip_co_psa, fa.sales_category, fa.wireless_score, fa.latitude::TEXT, fa.longitude::TEXT,
    fa.house_number, fa.prefix, fa.street_name, fa.city, fa.state, fa.zip,
    CONCAT(fa.house_number, ' ', fa.prefix, ' ', fa.street_name, ', ',fa.city, ' ',fa.zip, ' ', fa.state) as address,
    CASE WHEN fa.REGREEN = 'true' THEN 'Yes' ELSE 'No' END AS REGREEN, 
    CASE WHEN fa.ADSL = 'true' THEN 'Yes' ELSE 'No' END AS ADSL, 
    CASE WHEN fa.CSI_ELIGIBLE = 'true' THEN 'Yes' ELSE 'No' END AS CSI_ELIGIBLE,
    fa.unit_number,fa.dwelling_type, customer, customer_category_id, customer_category, point_geom.geom,
    mdu.fiber_available, mdu.fiber_opportunity, mdu.FIBER_PENETRATION_RATE::float AS fiber_penetration_rate, mdu.market_rank,     
    CASE WHEN mdu.acc_flag IS TRUE THEN 'Yes' ELSE 'No' END AS mdu_acc_flag,
    CASE WHEN mdu.acc_flag IS TRUE THEN 1 ELSE 2 END AS mdu_acc_flag_code,
    mdu_acc_prod.acc_mstr_prpty_id, mdu_acc_prod.property_name, mdu_acc_prod.preferred_partner, mdu_acc_prod.contract_type, mdu_acc_prod.gm, mdu_acc_prod.area_mgr, mdu_acc_prod.fibr_elgbl_yrmo,
    mdu_acc_prod.fiber_available as mdu_acc_prod_fiber_available,
    mdu_acc_prod.fiber_opportunity as mdu_acc_prod_fiber_opportunity,
    mdu_acc_prod.latitude as mdu_acc_prod_latitude,
    mdu_acc_prod.longitude as mdu_acc_prod_longitude,
    mdu_acc_prod.copper_upgrade as mdu_acc_prod_copper_upgrade,
    mdu_acc_prod.psa_coverage_score as mdu_acc_prod_psa_coverage_score,
    mdu_acc_elu_prod.hsiaplan,
    CONCAT(TO_CHAR(mdu_acc_prod.fiber_penetration_rate,'FM99990.0'),'%') as mdu_acc_prod_fiber_penetration_rate`;

      let currentPageResults = [];
      let totalCount = 0;
      let lastPage = 0;
      if (coordsAsArray.length) {
        for (let i = 0; i < coordsAsArray.length; i += 1) {
          const zxy = coordsAsArray[i].split(",");
          bbx = mercator.bbox(
            parseFloat(zxy[1]),
            parseFloat(zxy[2]),
            parseFloat(zxy[0]),
            false
          );
          bboxes.push(bbx);
          if (i >= 1) {
            if (!combinedBbox) {
              combinedBbox = bbox(
                combine(
                  featureCollection([
                    bboxPolygon(bboxes[i - 1]),
                    bboxPolygon(bboxes[i]),
                  ])
                )
              );
            } else {
              combinedBbox = bbox(
                combine(
                  featureCollection([
                    bboxPolygon(combinedBbox),
                    bboxPolygon(bboxes[i]),
                  ])
                )
              );
            }
          }
        }
      }

      const totalCountResult =
        await pgClient.query(` select count(*) total_count 
    from sot.sales_opp_fiber_addr fa join sot.sales_opp_point_geom  point_geom on fa.latitude = point_geom.latitude and fa.longitude = point_geom.longitude
    ${mduTableJoinClause}
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_elu_prod mdu_acc_elu_prod ON fa.network_service_addr = mdu_acc_elu_prod.elu
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_prod mdu_acc_prod ON mdu_acc_elu_prod.acc_id = mdu_acc_prod.acc_id
    where ${mduTableInClause} AND ${whereClauseForFilters()}
        AND 
        ST_Within(geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${
          combinedBbox[1]
        }, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857))
    `);
      totalCount = totalCount + totalCountResult.rows[0].total_count;

      const result = await pgClient.query(` select ${selectColumns}
    from sot.sales_opp_fiber_addr fa join sot.sales_opp_point_geom  point_geom on fa.latitude = point_geom.latitude and fa.longitude = point_geom.longitude
    ${mduTableJoinClause}
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_elu_prod mdu_acc_elu_prod ON fa.network_service_addr = mdu_acc_elu_prod.elu
    LEFT OUTER JOIN sot.sales_opp_mdu_acc_prod mdu_acc_prod ON mdu_acc_elu_prod.acc_id = mdu_acc_prod.acc_id
    where ${mduTableInClause} AND ${whereClauseForFilters()}
        AND 
        ST_Within(geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${
        combinedBbox[1]
      }, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857))        
    `);

      tableData = tableData.concat(result.rows);
      return tableData;
    };

module.exports = { get };