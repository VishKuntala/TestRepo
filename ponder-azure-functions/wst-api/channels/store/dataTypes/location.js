const R = require('ramda');



module.exports = async (pgClient, postParams, getParams, entityType) => {

    const { locationId } = getParams;
    

   const result = await pgClient.query(
          `
          SELECT store_category, 
      CASE WHEN store_category = 'ATTR' THEN 1 WHEN store_category = 'AR' THEN 2 ELSE NULL END AS store_category_id, 
      location_id, location_name, city, zip_code, county, 
      latitude::text, longitude::text FROM sot.sales_att_store_loc_prod 
      WHERE location_id = '${locationId}'
         
        `
      );

      return result.rows;


}