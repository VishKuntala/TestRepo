
const clicked = async (map, closestLocation, toolConfig) => {
    const campaignName = "Omni Locations";
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
                        <b>Sales Channel:</b> ${campaignName}
                        <br/><b>Company Name:</b> ${locationData.svid_name}                        
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state_y} ${locationData.zipcode}
                        <br/><b>Indoor Coverage Score:</b> ${locationData.indoor_coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>5G+:</b> ${locationData.fiveg_plus}
                        <br/><b>Speed and Available Capacity:</b> ${locationData.tput_text}
                        <br/><b>Roaming:</b> ${locationData.roam_text} - <b>FNET:</b> ${locationData.first_net} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>Legacy Device Penetration:</b> ${locationData.fiber_cust}
                                                `);


}

export { clicked };

