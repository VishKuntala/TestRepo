
const clicked = async (map, closestLocation) => {   

    var Campaign_Name;
    if (closestLocation.p.CAMPAIGN_ID === "midMarket") {
        Campaign_Name = "Mid Market Locations"
    } else if (closestLocation.p.CAMPAIGN_ID === "omni") {
        Campaign_Name = "Omni Locations"
    };
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                        <b>Sales Channel:</b> ${Campaign_Name}
                        <br/><b>Company Name:</b> ${closestLocation.p.CONTACT_COMPANY_NM}                        
                        <br/><b>Address:</b> ${closestLocation.p.ADDR_LINE1}
                        <br/><b>City, State Zip:</b> ${closestLocation.p.CITY_NM}, ${closestLocation.p.STATE_Y} ${closestLocation.p.POSTL_CD}
                        <br/><b>Simple Coverage Score:</b> ${closestLocation.p.COVERAGE_SCORE}
                        <br/><b>5G:</b> ${closestLocation.p.FIVEG} - <b>5G+:</b> ${closestLocation.p.FIVEG_PLUS}
                        <br/><b>Speed and Available Capacity:</b> ${closestLocation.p.TPUT_TEXT}
                        <br/><b>Roaming:</b> ${closestLocation.p.ROAM_TEXT} - <b>FNET:</b> ${closestLocation.p.FIRST_NET} - <b>FNET Band 14:</b> ${closestLocation.p.BAND_14}
                        <br/><b>Legacy Device Penetration:</b> ${closestLocation.p.FIBER_CUST}
                                                `);
        popup.openOn(map);
    
}

export { clicked };