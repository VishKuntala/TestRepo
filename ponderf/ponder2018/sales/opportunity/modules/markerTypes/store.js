const clicked = async (instance, coordinates, locationId) => {
    console.log('store clicked');
    //// remove any open popups
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
            `${store.baseApiUrl}/point/stores/${locationId}`,
        );
        const popUpData = data.features[0].properties;
        //popup.setHTML(
        //    `
                  //<div style="text-align: center">                   
                  // <b>Store Category:</b> ${popUpData.store_category == "ATTR" ? "AT&T Retail Store" : "Authorized Reseller Store"}
                  // <br/><b>Location ID:</b> ${popUpData.location_id}
                  // <br/><b>Location Name:</b> ${popUpData.location_name}
                  //</div>
        //        `
        //);
        instance.popup.setOptions({
            closeButton: true,
            content: `
                  <div class="ui message" style="text-align: center">
                   <b>Store Category:</b> ${popUpData.store_category == "ATTR" ? "AT&T Retail Store" : "Authorized Reseller Store"}
                   <br/><b>Location ID:</b> ${popUpData.location_id}
                   <br/><b>Location Name:</b> ${popUpData.location_name}
                  </div>
                    `
        })
    } catch (err) {
        console.error(err);
    }
}

export { clicked };