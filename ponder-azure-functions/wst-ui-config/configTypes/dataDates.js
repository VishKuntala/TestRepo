module.exports = async (pool, queryParams) => {

    const { tool, appName } = queryParams;
    const result = await pool.query(`
    SELECT display_name  from cmn.data_info 
    WHERE tool = '${tool}' and app_name = '${appName}'
    and is_active = true order by data_order
    `);
     return result.rows;
}