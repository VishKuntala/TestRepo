
const clicked = async (map, closestLocation) => {
    const campaignName = "Mid Market Locations";
    const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
    popup.setLatLng(closestLocation.latlng);
    popup.setContent(`
                        <b>Sales Channel:</b> ${campaignName}
                        <br/><b>Company Name:</b> ${closestLocation.p.svid_name}                        
                        <br/><b>Address:</b> ${closestLocation.p.addr}
                        <br/><b>City, State Zip:</b> ${closestLocation.p.city}, ${closestLocation.p.state_y} ${closestLocation.p.zipcode}
                        <br/><b>Simple Coverage Score:</b> ${closestLocation.p.coverage_score}
                        <br/><b>5G:</b> ${closestLocation.p.fiveg} - <b>5G+:</b> ${closestLocation.p.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${closestLocation.p.tput_text}
                        <br/><b>Roaming:</b> ${closestLocation.p.roam_text} - <b>FNET:</b> ${closestLocation.p.first_net} - <b>FNET Band 14:</b> ${closestLocation.p.band_14}
                        <br/><b>Legacy Device Penetration:</b> ${closestLocation.p.fiber_cust}
                                                `);
    popup.openOn(map);

}

export { clicked };

