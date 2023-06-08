const { psas } = require('../common');

const mvt = async (bbox, pgClient, filterParams, channel) => psas.mvt(bbox, pgClient, filterParams, channel);
  
module.exports = { mvt };