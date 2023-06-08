const logUIEvent = async (args) => {
    let result;
    try {
        result = await $.ajax({
            url: "Sales_Opportunity.aspx/LogUIEvent",
            type: "POST",
            data: args,
            contentType: "application/json; charset=utf-8",
        });
        return result;
    } catch (error) {
        console.error(error);
    }
};

const logAcknowledge = async (args, url) => {
    let result;
    try {
        result = await $.ajax({
            url: url,
            type: "POST",
            data: args,
            contentType: "application/json; charset=utf-8",
        });
        return result;
    } catch (error) {
        console.error(error);
    }
};

export { logUIEvent, logAcknowledge };
