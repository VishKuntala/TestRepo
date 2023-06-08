
const clicked = async (map, closestLocation, toolConfig) => {
    const campaignName = "Global Business Locations";
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
                        <b>Sales Channel:</b> ${ campaignName }
                        <br/><b>Industry:</b> ${ locationData.industry }
                        <br/><b>SVID:</b> ${ locationData.svid }
                        <br/><b>Company Name:</b> ${ locationData.company_name }                        
                        <br/><b>Address:</b> ${ locationData.addr }
                        <br/><b>City, State Zip:</b> ${ locationData.city }, ${ locationData.state_y } ${ locationData.zipcode }
                        <br/><b>Indoor Coverage Score:</b> ${ locationData.coverage_score }
                        <br/><b>5G:</b> ${ locationData.fiveg } - <b>5G +:</b > ${ locationData.fiveg_plus }
                        <br/><b>Speed and Available Capacity:</b> ${ locationData.tput_text }
                        <br/><b>Roaming:</b> ${ locationData.roam_text } - <b>FNET:</b > ${ locationData.first_net } - <b>FNET Band 14:</b > ${ locationData.band_14 }                        
                        <br/><b>No Low Account:</b> ${ locationData.no_low_account }
                        `);   

}

export { clicked };


