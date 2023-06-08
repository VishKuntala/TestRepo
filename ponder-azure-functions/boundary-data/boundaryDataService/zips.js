const search = (pgClient, filterParams) => pgClient.query(`
select distinct zip as name, zip as value from sot.sales_opp_zip_prod
    WHERE zip like '${filterParams.searchId}%' order by zip
`);



module.exports = { search } ;