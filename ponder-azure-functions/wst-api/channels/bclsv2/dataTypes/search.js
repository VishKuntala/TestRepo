const R = require('ramda');
const config = require('../common/config');

module.exports = async (pgClient, postParams, getParams, entityType, userAttributes) => {
    const result = await pgClient.query(` select distinct CONCAT(bc_company_nm, ', ', bc_company_street_address, ', ', bc_company_city, ', ', bc_company_state, ', ', bc_company_zip) as name, 
    CONCAT(wst.bcls_tenant_summary.mikey::text,'|', latitude, '|', longitude) as value from wst.bcls_tenant_summary inner join wst.bcls_summary
    on wst.bcls_tenant_summary.mikey = wst.bcls_summary.mikey
        WHERE LOWER(bc_company_nm) like LOWER('${getParams.searchId}%') order by name
    `);

    return result.rows;
};