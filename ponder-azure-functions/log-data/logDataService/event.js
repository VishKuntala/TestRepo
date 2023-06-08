const get = (pgClient, params) => {  
  const {
    userID,
    eventType,
    logDataType,
    logData,
    logJsonPayload,
    searchedZip,
    searchedCounty,
    searchedDMA,
    searchedPSA,
  } = params;

  let logDataTypeValue = null;
  let logDataValue = null;
  let logJsonPayloadValue = null;

  if (logDataType) {
    logDataTypeValue = logDataType;
  }

  if (logData) {
    logDataValue = logData;
  } else {
    logDataValue = logData;
    if (searchedZip) {
      logDataTypeValue = "Zip";
      logDataValue = searchedZip;
    } else if (searchedDMA) {
      logDataTypeValue = "DMA";
      logDataValue = searchedDMA;
    } else if (searchedCounty) {
      logDataTypeValue = "County";
      logDataValue = searchedCounty;
    } else if (searchedPSA) {
      logDataTypeValue = "PSA";
      logDataValue = searchedPSA;
    }
  }

  if (logJsonPayload) {
    if (
      eventType == "export_units_for_this_property" ||
      eventType == "export_units_for_this_property_acc_popup" ||
      eventType == "userACCTable_units_export"
    ) {
      logJsonPayloadValue = JSON.stringify({ property: logJsonPayload });
    } else {
      logJsonPayloadValue = JSON.stringify({ address: logJsonPayload });
    }    
  } else {
    logJsonPayloadValue = JSON.stringify({
      searchedZip,
      searchedCounty,
      searchedDMA,
      searchedPSA,
    });
  }

  return pgClient.query(    
    `INSERT INTO sot.sales_opp_log_events (user_id, event_type, log_data_type, log_data, log_json_payload)
    VALUES
    ($1, $2, $3, $4, $5)`,[userID, eventType, logDataTypeValue, logDataValue, logJsonPayloadValue]);
  
};

module.exports = { get };
