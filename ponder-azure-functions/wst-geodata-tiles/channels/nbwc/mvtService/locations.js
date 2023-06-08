const { locations } = require('../common');

const mvt = async (bbox, pgClient, filterParams) => locations.mvt(bbox, pgClient, filterParams);
  
module.exports = { mvt };
  