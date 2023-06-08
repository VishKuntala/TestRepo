
const clicked = async (instance, coordinates, psa) => {
    console.log('top24MDU clicked');
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
            `${store.baseApiUrl}/point/top25mdus/${psa}`,
        );
        const popUpData = data.features[0].properties;
        //popup.setHTML(
        //    `
                  //<div style="text-align: center">
                  //     <h4><b>Market Top 25 MDU</b></h4>
                  //     <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                  //     <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                  //     <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score_text}
                  //     <br/><b>Fiber Available:</b> ${popUpData.fiber_available}
                  //     <br/><b>Fiber Customers:</b> ${popUpData.fiber_customers} (${popUpData.fiber_penetration_rate}%)
                  //     <br/><b>Fiber Opportunity:</b> ${popUpData.fiber_opportunity}
                  //     <br/><b>Market Rank:</b> ${popUpData.market_rank}
                  //</div>
        //        `
        //);
        instance.popup.setOptions({
            closeButton: true,
            content: `<div class="ui message" style="text-align: center">
                       <h4><b>Market Top 25 MDU</b></h4>
                       <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                       <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                       <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score_text}
                       <br/><b>Fiber Available:</b> ${popUpData.fiber_available}
                       <br/><b>Fiber Customers:</b> ${popUpData.fiber_customers} (${popUpData.fiber_penetration_rate}%)
                       <br/><b>Fiber Opportunity:</b> ${popUpData.fiber_opportunity}
                       <br/><b>Market Rank:</b> ${popUpData.market_rank}
                  </div>`
        })
    } catch (err) {
        console.error(err);
    }
}

export { clicked };