const { locations } = require('../common');

const mvt = async (bbox, pgClient, filterParams, channel) => locations.mvt(bbox, pgClient, filterParams, channel);
  
module.exports = { mvt };
  