const get = (pgClient, id, accessGroup) => {
  rows: [];
};

const accessGroups = (pgClient, id, accessGroup) => {
  if (accessGroup == "FOT") {
    return pgClient.query(
      `SELECT access_control.access_level,access_control.access_control_id, acc_control_attribute.attribute_name, acc_control_attribute.attribute_value FROM cmn.ponder_access_control access_control
          INNER JOIN cmn.ponder_access_control_attribute acc_control_attribute
          ON access_control.access_control_id = acc_control_attribute.access_control_id
          WHERE att_userid=$1 AND access_group=$2`,
      [id, accessGroup]
    );
  }
  return pgClient.query(
    `SELECT access_level,access_control_id FROM cmn.ponder_access_control WHERE att_userid=$1 AND access_group=$2`,
    [id, accessGroup]
  );
};

module.exports = { get, accessGroups };
