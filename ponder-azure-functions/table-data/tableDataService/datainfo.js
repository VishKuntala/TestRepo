const get = async (pgClient) => {
  return await pgClient.query(`SELECT * FROM cmn.data_info WHERE tool = 'FOT' and app_name = 'Fiber sales opportunity' AND is_active = true ORDER BY data_order`);
};

module.exports = { get };
