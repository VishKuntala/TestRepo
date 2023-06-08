const R = require('ramda');
const SphericalMercator = require('@mapbox/sphericalmercator');
const { featureCollection } =  require('@turf/helpers');
const turfBbox= require("@turf/bbox");
const turfBboxPolygon = require("@turf/bbox-polygon");
const turfCombine = require("@turf/combine");
const mercator = new SphericalMercator({size: 256});
const conf = require('../../../../wst-common/channels/neonGigapower/config');
const { sqlBuilder } = require('../../../../wst-common/channels/neonGigapower');


module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {

    const config = conf(process.env.GROUP_MEMBERSHIP);

    const bboxPolygon = turfBboxPolygon.default;
    const bbox = turfBbox.default;
    const combine = turfCombine.default;

    let combinedBbox = null;

    let bbx = null;

    let tableData = [];

    let coordsAsArray = [];
    const bboxes = [];

    const {
        sorters, filters, limit, tableExport, coords
      } = postParams;

    let { offset } = postParams;
    if (offset) {
        offset = (offset -1);
    } else {
        offset = 0;
    }

    if (coords) {
        // coords is of the form z1,x1,y1^z2,x2,y2^z3,x3,y3
        coordsAsArray = coords.split('^');
    }

    const whereClause = () => {
        return ` ${sqlBuilder.whereClause(postParams, userAttributes)} `;
    }

    const selectColumns = `ts.addr_id as id, ts.zip_co_psa, ts.network_service_addr, ts.fibr_co_glid, 
    lus.wireless_percentage as psa_wireless_pen_rate, lus.fiber_percentage as psa_fiber_pen_rate,
    ts.dwelling_type, ts.adjusted_dwelling_type, ts.building_number, 
    ts.house_nbr, ts.prefix, ts.street_name, ts.unit_number, ts.city, ts.zip, ts.state,
    ts.fiber_customer, ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} as addr_customer_category_id, 
    ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["map_customer_category_id"]} as map_customer_category_id, ts.csi_eligible, ts.hypergig,
     ts.LATITUDE::text, ts.LONGITUDE::text, cov.name as indoor_coverage_score, acc.name as customer_category,ts.mdu_id,
     mdu.unit_count,mdu.fiber_customer_count,mdu.wireless_customer_count,mdu.mdu_hypergig_count,mdu.fiber_opportunity,mdu.wireless_opportunity`;


    const sortClause = () => {
        if (sorters && sorters.length) {
          return `ORDER BY ${sorters[0].field} ${sorters[0].dir}`;
        }
        return `order by ts.zip_co_psa`;
    }

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

    if (coordsAsArray.length) {
            const totalCountResult = await pgClient.query(` select count(*) total_count from wst.neon_gigapower_fiber_addresses ts
            inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            left join wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
                WHERE ts.addr_id IN (
                    SELECT ts1.addr_id
                    from wst.neon_gigapower_fiber_addresses ts1 
                    JOIN wst.neon_gigapower_point_geom cpg
                    on ts1.latitude = cpg.latitude
                    and ts1.longitude = cpg.longitude
                    where 
                ST_Within(cpg.geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${combinedBbox[1]}, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857))) 
                ${whereClause()}
            `);
            totalCount = totalCount + totalCountResult.rows[0].total_count;

            const result = await pgClient.query(` select ${selectColumns}
            from wst.neon_gigapower_fiber_addresses ts inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
            WHERE ts.addr_id IN (SELECT ts1.addr_id
                from wst.neon_gigapower_fiber_addresses ts1 
                JOIN wst.neon_gigapower_point_geom cpg
                on ts1.latitude = cpg.latitude
                and ts1.longitude = cpg.longitude
                where 
                ST_Within(cpg.geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${combinedBbox[1]}, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857))) 
                ${whereClause()} ${sortClause()}
            `);

            tableData = tableData.concat(result.rows);
    } else if (postParams.mduId) {
            const totalCountResult = await pgClient.query(` select count(*) total_count from wst.neon_gigapower_fiber_addresses ts
            inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
            WHERE ts.mdu_id = ${postParams.mduId} ${whereClause()}
            `);
    
            totalCount = totalCountResult.rows[0].total_count;

    
            const result = await pgClient.query(` select ${selectColumns}
            from wst.neon_gigapower_fiber_addresses ts inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
                WHERE ts.mdu_id = ${postParams.mduId} ${whereClause()} ${sortClause()}
            `);
            tableData = tableData.concat(result.rows);
        } else if (postParams.censusBlockId) {
            const totalCountResult = await pgClient.query(` select count(*) total_count from wst.neon_gigapower_fiber_addresses ts
            inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
            WHERE ts.census_block_gid = ${postParams.censusBlockId} ${whereClause()}
            `);
    
            totalCount = totalCountResult.rows[0].total_count;

    
            const result = await pgClient.query(` select ${selectColumns}
            from wst.neon_gigapower_fiber_addresses ts inner join ${config.tableName} lus
            on ts.zip_co_psa = lus.zip_co_psa
            LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
            LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
            LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
                WHERE ts.census_block_gid = ${postParams.censusBlockId} ${whereClause()} ${sortClause()}
            `);
            tableData = tableData.concat(result.rows);
        } else {
        const totalCountResult = await pgClient.query(` select count(*) total_count from wst.neon_gigapower_fiber_addresses ts
        inner join ${config.tableName} lus
        on ts.zip_co_psa = lus.zip_co_psa
        LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
        LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
        LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
            WHERE ts.zip_co_psa IN ('${postParams.mikeys}') ${whereClause()}
        `);

        totalCount = totalCountResult.rows[0].total_count;

        const result = await pgClient.query(` select ${selectColumns}
        from wst.neon_gigapower_fiber_addresses ts inner join ${config.tableName} lus
        on ts.zip_co_psa = lus.zip_co_psa
        LEFT JOIN wst.neon_gigapower_mdu_fiber_addresses mdu on ts.addr_id = mdu.addr_id
        LEFT JOIN wst.ref_simple_coverage_score cov ON ts.indoor_coverage_score = cov.id
        LEFT JOIN wst.ref_neon_gigapower_addr_customer_category acc on ts.${config.accessGroupBasedSelectColumns[config.groupMembership]["addr_customer_category_id"]} = acc.id
            WHERE ts.zip_co_psa IN ('${postParams.mikeys}') ${whereClause()} ${sortClause()}
        `);

        tableData = tableData.concat(result.rows);
    }
    if (limit) {
        lastPage = Math.ceil(tableData.length / limit);
        const pagedRows = R.splitEvery(limit,tableData);
        currentPageResults = pagedRows[offset];

        const functionResponse = {
            "locationCount": totalCount,
            "last_page": lastPage,
            "data": currentPageResults
        }
        return functionResponse;
    }
    return tableData;
};

