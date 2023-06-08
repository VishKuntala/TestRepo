
const clicked = async (map, closestLocation, toolConfig) => {
    const campaignName = "National Living Unit Locations";
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
                        <br/><b>External Living Unit ID:</b> ${locationData.external_living_unit_id}                        
                        <br/><b>Address:</b> ${locationData.address}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state_cd} ${locationData.zipcode}
                        <br/><b>Unit:</b> ${locationData.address_line_2}
                        <br/><b>Network Build Type:</b> ${locationData.network_build_type_cd}
                                                `);
    

}

export { clicked };

