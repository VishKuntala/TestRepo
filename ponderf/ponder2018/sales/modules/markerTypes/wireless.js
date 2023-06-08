
const clicked = async (map, closestLocation) => {   

    var Campaign_Name;
    if (closestLocation.p.CAMPAIGN_ID === "1-29918786310") {
        Campaign_Name = "3T20 Acquire Mobility White Space"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-29985573337") {
        Campaign_Name = "3T20 Acquire Mobility Port Outs"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-28585961300") {
        Campaign_Name = "Acquire Mobility Whitespace"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898167") {
        Campaign_Name = "1T21 Grow Mobility Top ARPU"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898230") {
        Campaign_Name = "1T21 Grow Mobility Top TBR"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898283") {
        Campaign_Name = "1T21 Grow Mobility Top Integrated subs"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898296") {
        Campaign_Name = "1T21 Grow Mobility Top Data subs"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898369") {
        Campaign_Name = "1T21 Grow Mobility Top Voice subs"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898442") {
        Campaign_Name = "1T21 Grow Mobility Top Potential CRU"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31609052529") {
        Campaign_Name = "1T21 Grow Mobility 3G Shutdown"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898141") {
        Campaign_Name = "1T21 Acquire Mobility existing Wireline"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898154") {
        Campaign_Name = "1T21 Acquire Mobility Port Outs"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898068") {
        Campaign_Name = "1T21 Acquire Mobility New Logo"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-31465898088") {
        Campaign_Name = "1T21 Grow Mobility Post COVID"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-32874953448") {
        Campaign_Name = "1T21 Acquire Mobility Mid Market"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33735165693") {
        Campaign_Name = "2T21 Grow Mobility Add A Line"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33735165652") {
        Campaign_Name = "2T21 Acquire Mobility Existing Wireline"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33735165636") {
        Campaign_Name = "2T21 Acquire Mobility Fiber Fast Follow"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33735165719") {
        Campaign_Name = "2T21 Acquire Mobility Port Outs"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33735165667") {
        Campaign_Name = "2T21 Acquire Mobility New Logo"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33761622514") {
        Campaign_Name = "2T21 Grow Top Mobility"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-33735165706") {
        Campaign_Name = "2T21 Grow FAN Fast Follow"
    } else if (closestLocation.p.CAMPAIGN_ID === "1-35275858218") {
        Campaign_Name = "2T21 Grow Mobility Voice"
    } else if (closestLocation.p.CAMPAIGN_ID === "midMarket") {
        Campaign_Name = "Mid Market Locations"
    } else if (closestLocation.p.CAMPAIGN_ID === "omni") {
        Campaign_Name = "Omni Locations"
    };
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                        <b>Campaign ID:</b> ${closestLocation.p.CAMPAIGN_ID}
                        <br/><b>Campaign Name:</b> ${Campaign_Name}
                        <br/><b>Company Name:</b> ${closestLocation.p.CONTACT_COMPANY_NM}
                        <br/><b>Location ID:</b> ${closestLocation.p.LOCATION_ID}
                        <br/><b>Contact Name:</b> ${closestLocation.p.CONTACT_FIRST_NM} ${closestLocation.p.CONTACT_LAST_NM}
                        <br/><b>Contact Phone:</b> ${closestLocation.p.CONTACT_PHONE1}
                        <br/><b>Contact email:</b> ${closestLocation.p.CONTACT_EMAIL}
                        <br/><b>Address:</b> ${closestLocation.p.ADDR_LINE1}
                        <br/><b>City, State Zip:</b> ${closestLocation.p.CITY_NM}, ${closestLocation.p.STATE_Y} ${closestLocation.p.POSTL_CD}
                        <br/><b>Number of Employees:</b> ${closestLocation.p.NUMBER_OF_EMPLOYEES}
                        <br/><b>Simple Coverage Score:</b> ${closestLocation.p.COVERAGE_SCORE}
                        <br/><b>5G:</b> ${closestLocation.p.FIVEG} - <b>5G+:</b> ${closestLocation.p.FIVEG_PLUS}
                        <br/><b>Speed and Available Capacity:</b> ${closestLocation.p.TPUT_TEXT}
                        <br/><b>Roaming:</b> ${closestLocation.p.ROAM_TEXT} - <b>FNET:</b> ${closestLocation.p.FIRST_NET} - <b>FNET Band 14:</b> ${closestLocation.p.BAND_14}
                        <br/><b>Legacy Device Penetration:</b> ${closestLocation.p.FIBER_CUST}
                        <br/><b>Primary Competitor:</b> ${closestLocation.p.PRIMARY_COMPETITOR_NAME}
                                                `);
        popup.openOn(map);
    
}

export { clicked };