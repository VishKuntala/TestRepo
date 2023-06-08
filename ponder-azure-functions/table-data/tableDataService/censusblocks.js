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

    const { coords } = postParams;

    // coords is of the form z1,x1,y1^z2,x2,y2^z3,x3,y3
    coordsAsArray = coords.split("^");

    const selectColumns = `dim.gid as id, dim.name, dim.geom,
    fct.copper_upgrade, fct.totalarea, fct.totalpops, fct.pop_density, fct.wireless_score, fct.fiber_score,
    COALESCE(fct.fiber_available, 0) as fiber_available, COALESCE(fct.fiber_customers, 0) as fiber_customers, COALESCE(fct.fiber_percentage, 0)::float as fiber_percentage, fct.overall_cat, 
    fct.fiber_opportunity, fct.number_of_psas, fct.wireless_category, fct.fiber_availability, 
    COALESCE (fct.fiber_penetration_hm_color_code, 1) as fiber_penetration_hm_color_code, 
    COALESCE (fct.wireless_coverage_hm_color_code, 1) as wireless_coverage_hm_color_code, 
    COALESCE (fct.copper_upgrade_hm_color_code, -1) as copper_upgrade_hm_color_code, 
    COALESCE (fct.fiber_opportunity_hm_color_code, -1) as fiber_opportunity_hm_color_code,
    COALESCE(fct.fiber_customer_wireless_customer, 0) as fiber_customer_wireless_customer,
    COALESCE(fct.fiber_customer_no_wireless, 0) as fiber_customer_no_wireless,
    COALESCE(fct.copper_upgrade_wireless_customer, 0) as copper_upgrade_wireless_customer,
    COALESCE(fct.copper_upgrade_no_wireless, 0) as copper_upgrade_no_wireless,
    COALESCE(fct.wireless_customer_no_fiber, 0) as wireless_customer_no_fiber,
    COALESCE(fct.no_fiber_no_wireless, 0) as no_fiber_no_wireless`;

    let currentPageResults = [];
    let totalCount = 0;
    let lastPage = 0;
    if (coordsAsArray.length) {
        for (let i = 0; i < coordsAsArray.length; i += 1) {
            const zxy = coordsAsArray[i].split(',');
            bbx = mercator.bbox(parseFloat(zxy[1]), parseFloat(zxy[2]), parseFloat(zxy[0]), false);
            bboxes.push(bbx);
            if (i >= 1) {
                if (!combinedBbox) {
                    combinedBbox = bbox(combine(featureCollection([bboxPolygon(bboxes[i-1]), bboxPolygon(bboxes[i])])));
                } else {
                    combinedBbox = bbox(combine(featureCollection([bboxPolygon(combinedBbox), bboxPolygon(bboxes[i])])));
                }
            }
        }
    }

    const totalCountResult = await pgClient.query(` select count(*) total_count 
    FROM spatial.census_block as dim
    LEFT OUTER JOIN sot.sales_opp_census_prod fct on dim.gid = fct.census_block_gid
            where 
        ST_Within(dim.geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${combinedBbox[1]}, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857))
    `);
    totalCount = totalCount + totalCountResult.rows[0].total_count;

    const result = await pgClient.query(` select ${selectColumns}
        FROM spatial.census_block as dim
        LEFT OUTER JOIN sot.sales_opp_census_prod fct on dim.gid = fct.census_block_gid
        where 
        ST_Within(dim.geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${combinedBbox[1]}, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857))        
    `);

    tableData = tableData.concat(result.rows);
    return tableData;
};

module.exports = { get };