const clicked = async (instance, coordinates, addressId) => {
    console.log('address clicked');
    // remove any open popups
    //$('.mapboxgl-popup').remove();    
    const { map, store } = instance;
    //const popup = new maplibregl.Popup({
    //    maxWidth: "500px",
    //    closeButton: true,
    //    anchor: "bottom",
    //})
    //    .setLngLat(coordinates)
    //    .setHTML('<div class="ui active mini blue elastic loader"></div>')
    //    .addTo(map);

    if (instance.popup.isOpen()) {
        instance.popup.close();
    }
    instance.popup.setOptions({
        content: `<div class="ui compact message">
                <div class="ui active mini blue elastic loader"></div>
              </div>`,
        position: coordinates,
        closeButton: true
    });
    instance.popup.open(map);

    try {
        const data = await instance.getData(
            `${store.baseApiUrl}/point/address/${addressId}`,
        );
        const popUpData = data.features[0].properties;
        //popup.setHTML(
        //    `
        //          <div style="text-align: center">                   
        //           <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
        //           <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
        //           <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
        //           <br/><b>Customer Category:</b> ${popUpData.customer_category}
        //           <br/><b>Regreen:</b> ${popUpData.regreen} - <b>ADSL:</b> ${popUpData.adsl} - <b>CSI Eligible:</b> ${popUpData.csi_eligible}                   
        //           <br/><div style = "align:center"></div><a href="#" class="addressPSAFilterLink">Click To Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
        //          </div>
        //        `
        //);
        instance.popup.setOptions({
            closeButton: true,
            content: `<div class="ui message" style="text-align: center">
                   <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                   <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                   <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
                   <br/><b>Customer Category:</b> ${popUpData.customer_category}
                   <br/><b>Regreen:</b> ${popUpData.regreen} - <b>ADSL:</b> ${popUpData.adsl} - <b>CSI Eligible:</b> ${popUpData.csi_eligible}                   
                   <br/><div style = "align:center"></div><a href="#" class="addressPSAFilterLink">Click To Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
                  </div>`
        })
        $(".addressPSAFilterLink").on('click', () => {
            console.log('.addressPSAFilterLink clicked');
            instance.store.searchedPSA = popUpData.zip_co_psa;
            instance.store.addPSAFilter = {
                psa: popUpData.zip_co_psa,
                latitude: popUpData.latitude,
                longitude: popUpData.longitude
            };
        });
    } catch (err) {
        console.error(err);
    }
}

export { clicked };