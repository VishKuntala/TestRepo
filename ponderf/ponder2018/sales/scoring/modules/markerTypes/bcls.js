
const clicked = async (map, closestLocation, toolConfig) => {

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
                        <b>VPGM:</b> ${locationData.vpgm}
                        <br/><b>Archetype:</b> ${locationData.archetype}
                        <br/><b>DMA Name:</b> ${locationData.dma_nm}
                        <br/><b>MIKEY:</b> ${locationData.mikey}
                        <br/><b>Address:</b> ${locationData.addr}
                        <br/><b>City, State Zip:</b> ${locationData.city}, ${locationData.st} ${locationData.zip}
                        <br/><b>Contact Name:</b> ${locationData.contact_first_nm} ${locationData.contact_last_nm}
                        <br/><b>Contact Phone:</b> ${locationData.contact_phone1}
                        <br/><b>Contact email:</b> ${locationData.contact_email}
                        <br/><b>Simple Coverage Score:</b> ${locationData.simple_coverage_score}
                        <br/><b>5G:</b> ${locationData.fiveg} - <b>FNET Band 14:</b> ${locationData.band_14}
                        <br/><b>AWB Available Capacity:</b> ${locationData.awb_capacity_text}
                        <br/><b>AWB Spectrum Efficiency:</b> ${locationData.awb_spectrum_efficiency}
                        <br/><b>GPON Status:</b> ${locationData.gpon_status} - <b>GPON Customers:</b> ${locationData.gpon_customers} - <b>Hyper-Gig:</b> ${locationData.hypergig}
                        <br/><b>ATT Rank GWS:</b> ${locationData.att_rank_gws}
                        <br/><b>TMO Rank GWS:</b> ${locationData.tmo_rank_gws} - <b>VZN Rank GWS:</b> ${locationData.vz_rank_gws}
                        <br/><b>ATT Ookla Quantile:</b> ${locationData.att_ookla_quantile}
                        <br/><b>TMO Ratio Ookla:</b> ${locationData.tmo_ratio_ookla_lte} - <b>VZN Ratio Ookla:</b> ${locationData.verizon_ratio_ookla_lte}
                        <br/><b>Pop Density:</b> ${locationData.pop_density_text} - <b>Median Income:</b> ${locationData.hh_median_income_text}
                                                `);
        
    
}

export { clicked };