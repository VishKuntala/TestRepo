const getJsonData = async (args) => {
  let result;
  try {
    result = await $.ajax({
      url: "Sales_Opportunity.aspx/GetJsonData",
      type: "POST",
      data: args,
      contentType: "application/json; charset=utf-8",
    });
    return result;
  } catch (error) {
    console.error(error);
  }
};

export { getJsonData };
