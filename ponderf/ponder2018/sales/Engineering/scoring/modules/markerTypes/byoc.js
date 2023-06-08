
const clicked = async (map, closestLocation, toolConfig) => {
  const campaignName = "Engineering Locations";
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
                      <br/><b>Simple Coverage Score:</b> ${locationData.simple_coverage_score}
                      <br/><b>5G:</b> ${locationData.fiveg} 
                      <br/><b>5G+ mmWave:</b> ${locationData.fiveg_plus_mmwave} <b>- 5G+ Speed:</b> ${locationData.fiveg_plus_speed}
                      <br/><b>5G+ C-Band:</b> ${locationData.fiveg_plus_cband} <b>- C-Band SCS:</b> ${locationData.cband_scs} <b>- C-Band Speed:</b> ${locationData.cband_speed}
                      <br/><b>FNET:</b> ${locationData.first_net} <b>- FNET Band 14:</b> ${locationData.band_14}
                      <br/><b>AWB High Speed Suitability:</b> ${locationData.sales_high_speed_suitability}
                      <br/><b>RAN Suitability Cause:</b> ${locationData.ran_suitability_cause}
                      <br/><b>Speed Experience:</b> ${locationData.speed_experience}
                      <br/><b>Weighted Avg Tput:</b> ${locationData.weighted_avg_tput}
                      <br/><b>Tput Min:</b> ${locationData.tput_min} <b>- Tput Max:</b> ${locationData.tput_max}                      
                      <br/><b>Roaming:</b> ${locationData.roam_text} <b>- Roaming Rate:</b> ${locationData.roaming_rate}
                      <br/><b>CQI:</b> ${locationData.cqi} <b>- Spectrum Efficiency:</b> ${locationData.spectrum_efficiency_12_pl}
                      <br/><b>Available Capacity:</b> ${locationData.avail_capacity}
                      <br/><b>Average MCEP PRB Utilization:</b> ${locationData.weighted_avg_mcep_prbutl}                      
                      <br/><b>Best Servers:</b> ${locationData.best_servers}
                      <br/><b>Azimuth:</b> ${locationData.azimuth} <b>- USID:</b> ${locationData.usid}
                                              `);
  
}

export { clicked };
