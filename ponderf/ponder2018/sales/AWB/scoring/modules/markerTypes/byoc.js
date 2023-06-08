
const clicked = async (map, closestLocation, toolConfig) => {
  const campaignName = "PONDER - Select WBB Locations";
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
                      <span class="blueLabel"><br/><b>Indoor Coverage Score:</span></b> ${locationData.simple_coverage_score}
                      <br/><b>5G:</b> ${locationData.fiveg} <b>- 5G+ mmWave:</b> ${locationData.fiveg_plus_mmwave} <b>- 5G+ C-Band:</b> ${locationData.fiveg_plus_cband}                      
                      <br/><b>FNET:</b> ${locationData.first_net} <b>- FNET Band 14:</b> ${locationData.band_14}
                      <span class="blueLabel"><br/><b>Suitability for high download Speed/Volume:</span></b> ${locationData.sales_high_speed_suitability}
                      <br/><b>Mobile Speed Experience:</b> ${locationData.speed_experience}
                      <span class="blueLabel"><br/><b>Azimuth:</span></b> ${locationData.azimuth} <b>- USID:</b> ${locationData.usid}
                                              `);
  

}

export { clicked };
