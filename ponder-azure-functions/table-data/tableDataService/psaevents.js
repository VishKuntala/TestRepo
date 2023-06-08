const R = require("ramda");

const get = async (pgClient, params) => {
  const { psa } = params;
  return await pgClient.query(
    `SELECT EVENT_ID,EVENT_NAME,FIBER_CHANNELS, TO_CHAR(START_DT,'MM/DD/YYYY') AS START_DT,STATUS,EVENT_ACTIVITY,ACTUAL_NEW_FIBER_SALES,ACTUAL_FIBER_MIGRATIONS,FORECAST_NEW_FIBER_SALES,FORECAST_FIBER_MIGRATIONS,PSA 
     FROM SOT.SALES_OPP_PSA_EVENT_DATA
     WHERE PSA = '${psa}' ORDER BY START_DT DESC
    `
  );
};

module.exports = { get };
