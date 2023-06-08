const geodata = (pgClient, filterParams) => {
  const { marketType, market } = filterParams;
  const whereClauseForFilters = () => {
    let whereClause = "1=1";
    if (marketType == "REGION") {
      whereClause = `${whereClause} and vpgm_reg = '${market}'`;
    }
    if (marketType == "MARKET") {
      whereClause = `${whereClause} and vpgm_markt = '${market}'`;
    }
    return whereClause;
  };
  return pgClient.query(
    `
    SELECT  ST_AsGeoJSON(ST_BOUNDARY(ST_Transform(geom,4326))) 
    FROM spatial.vpgm_market where ${whereClauseForFilters()}
    `
  );
};

module.exports = { geodata };
