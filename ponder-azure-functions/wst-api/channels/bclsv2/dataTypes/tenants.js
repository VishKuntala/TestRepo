const R = require('ramda');
const config = require('../common/config');
const { sqlBuilder } = require('../common');
const SphericalMercator = require('@mapbox/sphericalmercator');
const { featureCollection } =  require('@turf/helpers');
const turfBbox= require("@turf/bbox");
const turfBboxPolygon = require("@turf/bbox-polygon");
const turfCombine = require("@turf/combine");
const mercator = new SphericalMercator({size: 256});

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {

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

    const selectColumns = `ts.SEGMENT_NAME,
    ts.OWNING_SALES_CENTER_ID,
    ts.OWNING_MODULE,
    ts.LOC_CUST_PROSP,
    ts.CO_ID_TYPE,
    ts.CO_ID,
    ts.BC_COMPANY_NM, 
    ts.BC_COMPANY_STREET_ADDRESS,
    SPLIT_PART(ts.BC_COMPANY_STREET_ADDRESS, ' ', 1) as ADDRESS_NUMBER,
    SUBSTR(ts.BC_COMPANY_STREET_ADDRESS, STRPOS(ts.BC_COMPANY_STREET_ADDRESS, ' ') + 1) as STREET_NAME,
    ts.BC_COMPANY_CITY,
    ts.BC_COMPANY_STATE,
    ts.BC_COMPANY_ZIP,
    ts.mikey::text,
    ts.TOT_FIBER_PORTS,
    ts.ADI_PORTS, 
    ts.ABF_PORTS, 
    ts.GPON_PORTS,
    ts.BB_UVERSE_PORTS,
    ts.BB_IPDSL_PORTS,
    ts.BB_DSL_PORTS,    
    ts.ASE_PORTS,
    ts.ASE_NOD_PORTS,
    ts.PID,
    ts.ADE_PORTS,
    ts.VPN_PORTS,
    ts.PNT_PORTS,
    ts.DS3_PORTS,    
    ts.METRO_E_PORTS,
    ts.SONET_PORTS,
    ts.OPT_E_MAN_PORTS,
    ts.OPT_E_WAN_PORTS,
    ts.EPSL_PORTS,
    ts.BB_ENT_PORTS,
    ts.LEGACY_DATA_PORTS,
    ts.VOICE_PORTS,
    ts.VIDEO_PORTS,
    ts.TRANSPORT_PORTS,
    ts.OWNING_SEGMENT,
    ts.OWNING_AE_FIRST_NM,
    ts.OWNING_AE_LAST_NM,
    ts.OWNING_AE_USER,
    CONCAT(ts.bcl_sic,' - ',ts.bcl_sic_grp) as bcl_sic_cd_grp,
    te.name as business_employees,
     lus.LATITUDE::text, lus.LONGITUDE::text, cov.name as simple_coverage_score, fvg.name AS fiveg, lus.wcpsa as psa,
     nospend.name as no_spend , lus.fiber_pid`;


    const sortClause = () => {
        if (sorters && sorters.length) {
          return `ORDER BY ${sorters[0].field} ${sorters[0].dir}`;
        }
        return `order by ts.CO_ID`;
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
            const totalCountResult = await pgClient.query(` select count(*) total_count from wst.bcls_tenant_summary ts
            inner join wst.bcls_summary lus
            on ts.mikey = lus.mikey
                WHERE ts.mikey IN (${ postParams.censusBlockId ? `SELECT lus.mikey
                from wst.bcls_summary lus
                inner join wst.channel_point_geom cpg
                on lus.latitude = cpg.latitude
                and lus.longitude = cpg.longitude
                where 
                cpg.census_block_gid = ${postParams.censusBlockId}` : postParams.mikeys ||
                    `SELECT lus.mikey
                    from wst.bcls_summary lus 
                    inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey
                    INNER JOIN WST.channel_point_geom cpg
                    on lus.latitude = cpg.latitude
                    and lus.longitude = cpg.longitude
                    where 
                ST_Within(geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${combinedBbox[1]}, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857)) `}) 
                ${whereClause()}
            `);
            totalCount = totalCount + totalCountResult.rows[0].total_count;

            const result = await pgClient.query(` select ${selectColumns}
            from wst.bcls_tenant_summary ts inner join wst.bcls_summary lus
            on ts.mikey = lus.mikey
            LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
            LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
            LEFT JOIN wst.ref_bb_tenant_employees te on ts.tenant_employees_id  = te.id
            LEFT JOIN wst.ref_bb_active_mobility_spend nospend ON ts.active_mobility_spend_id = nospend.id
                WHERE ts.mikey IN (${ postParams.censusBlockId ? `SELECT lus.mikey
                from wst.bcls_summary lus
                inner join wst.channel_point_geom cpg
                on lus.latitude = cpg.latitude
                and lus.longitude = cpg.longitude
                where 
                cpg.census_block_gid = ${postParams.censusBlockId}` : postParams.mikeys ||
                `SELECT lus.mikey
                from wst.bcls_summary lus 
                inner join wst.bcls_tenant_summary ts on lus.mikey = ts.mikey
                INNER JOIN WST.channel_point_geom cpg
                on lus.latitude = cpg.latitude
                and lus.longitude = cpg.longitude
                where 
                ST_Within(geom, ST_Transform(ST_MakeEnvelope(${combinedBbox[0]}, ${combinedBbox[1]}, ${combinedBbox[2]}, ${combinedBbox[3]}, 4326), 3857)) `}) 
                ${whereClause()} ${sortClause()}
            `);

            tableData = tableData.concat(result.rows);
    } else {

        const totalCountResult = await pgClient.query(` select count(*) total_count from wst.bcls_tenant_summary ts
        inner join wst.bcls_summary lus
        on ts.mikey = lus.mikey
            WHERE ts.mikey IN (${ postParams.censusBlockId ? `SELECT lus.mikey
            from wst.bcls_summary lus
            inner join wst.channel_point_geom cpg
            on lus.latitude = cpg.latitude
            and lus.longitude = cpg.longitude
            where 
            cpg.census_block_gid = ${postParams.censusBlockId}` :
                postParams.mikeys}) ${whereClause()}
        `);

        totalCount = totalCountResult.rows[0].total_count;

        const result = await pgClient.query(` select ${selectColumns}
        from wst.bcls_tenant_summary ts inner join wst.bcls_summary lus
        on ts.mikey = lus.mikey
        LEFT JOIN wst.ref_simple_coverage_score cov ON lus.ics_score_id = cov.id
        LEFT JOIN wst.ref_fiveg fvg ON lus.fiveg_id = fvg.id
        LEFT JOIN wst.ref_bb_tenant_employees te on ts.tenant_employees_id  = te.id
        LEFT JOIN wst.ref_bb_active_mobility_spend nospend ON ts.active_mobility_spend_id = nospend.id
            WHERE ts.mikey IN (${ postParams.censusBlockId ? `SELECT lus.mikey
            from wst.bcls_summary lus
            inner join wst.channel_point_geom cpg
            on lus.latitude = cpg.latitude
            and lus.longitude = cpg.longitude
            where 
            cpg.census_block_gid = ${postParams.censusBlockId}` :
                postParams.mikeys}) ${whereClause()} ${sortClause()}
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

