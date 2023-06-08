﻿
const clicked = async (map, closestLocation, toolConfig) => {
  const campaignName = "PONDER - Select Locations";
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
      data: JSON.stringify({ latitude: closestLocation.lat, longitude: closestLocation.lng, byocClusterId: closestLocation.p.byoc_cluster_id }),
      processData: false
  });

  const locationData = response.d[0];
  popup.setContent(`
                      <b>Sales Channel:</b> ${campaignName}
                      <br/><b>Cluster Name:</b> ${locationData.byoc_cluster_name}
                      <br/><b>Company Name:</b> ${locationData.company_name}
                      <br/><b>Location ID:</b> ${locationData.location_id}
                      <br/><b>Address:</b> ${locationData.address}
                      <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.state} ${locationData.zipcode}
                      <br/><b>Indoor Coverage Score:</b> ${locationData.coverage_score}
                      <br/><b>5G:</b> ${locationData.fiveg}
                      <br/><b>5G+ mmWave:</b> ${locationData.fiveg_plus_mmwave}
                      <br/><b>5G+ CBand:</b> ${locationData.fiveg_plus_cband}
                      <br/><b>FNET:</b> ${locationData.first_net}
                      <br/><b>FNET Band 14:</b> ${locationData.band_14}
                      <br/><b>Mobile Speed Experience:</b> ${locationData.speed_experience}
                      <br/><b>Suitability for high download Speed/Volume:</b> ${locationData.legacy_device_text}
                                              `);
  

}

export { clicked };
