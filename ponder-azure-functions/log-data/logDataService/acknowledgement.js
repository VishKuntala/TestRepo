const get = (pgClient, params) => {  
  const { userID, eventType } = params;
  return pgClient.query(
    `
    INSERT INTO cmn.ponder_log_acknowledge (user_id, url_acknowledged, create_date, log_json_payload)
    VALUES ('${userID}','${eventType}',CURRENT_TIMESTAMP, null)
    `
  );
};

module.exports = { get };
