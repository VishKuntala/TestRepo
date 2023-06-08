
const clicked = async (map, closestLocation, toolConfig) => {



    /* var Campaign_Name;
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
    } else if (closestLocation.p.CAMPAIGN_ID === "midMarket") {
        Campaign_Name = "Mid Market Locations"
    }; */
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
    popup.setContent(`
    <div class="ui active mini blue elastic loader"></div>
  `);
    popup.openOn(map);
    const response = await $.ajax({
        url: `${toolConfig.baseUrl}/LocationData`,
        headers: { "Content-Type": "application/json" },
        type: 'post',
        data: JSON.stringify({ latitude: closestLocation.lat, longitude: closestLocation.lng }),
        processData: false
    });

    const locationData = response.d[0];
        popup.setContent(`
                        <b>Campaign ID:</b> ${locationData.campaign_id}
                        <br/><b>Campaign Name:</b> ${locationData.campaign_name}
                        <br/><b>Company Name:</b> ${locationData.contact_company_nm}
                        <br/><b>Location ID:</b> ${locationData.location_id}
                        <br/><b>Contact Name:</b> ${locationData.contact_first_nm} ${locationData.contact_last_nm}
                        <br/><b>Contact Phone:</b> ${locationData.contact_phone1}
                        <br/><b>Contact email:</b> ${locationData.contact_email}
                        <br/><b>Address:</b> ${locationData.addr_line1}
                        <br/><b>City, State Zip:</b> ${locationData.city_nm}, ${locationData.state_y} ${locationData.postl_cd}
                        <br/><b>Number of Employees:</b> ${locationData.number_of_employees}
                        <br/><b>Wireless Indoor Coverage Score:</b> ${locationData.coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G+:</b> ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b> ${locationData.first_net} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>Legacy Device Penetration:</b> ${locationData.fiber_cust}
                        <br/><b>Primary Competitor:</b> ${locationData.primary_competitor_name}
                                                `);
        
    
}

export { clicked };