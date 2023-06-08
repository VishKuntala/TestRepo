import moment from 'moment';

const clicked = async (instance, coordinates, psa) => {
    console.log('futurePSA clicked');
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
            `${store.baseApiUrl}/point/futurepsas/${psa}`,
        );
        const popUpData = data.features[0].properties;
        //popup.setHTML(
        //    `
        //          <div style="text-align: center">
        //           <h4><b>Future (T-30) PSA</b></h4>
        //           <b>ZIP CO PSA:</b> ${popUpData.zip_co_psa}
        //           <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score_text}
        //           <br/><b>Future (T-30) Fiber Opportunity:</b> ${popUpData.future_fiber_opportunity.toLocaleString()}
        //           <br/><b>T-30 File Date:</b> ${moment(popUpData.grn_30day_dt).format('L')}
        //           <br/><div style = "align:center"></div><a href="#" class="futurePSAFilterLink">Click To Show Fiber Addresses within this PSA</a>
        //          </div>
        //        `
        //);
        instance.popup.setOptions({
            closeButton: true,
            content: `<div class="ui message" style="text-align: center">
                   <h4><b>Future (T-30) PSA</b></h4>
                   <b>ZIP CO PSA:</b> ${popUpData.zip_co_psa}
                   <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score_text}
                   <br/><b>Future (T-30) Fiber Opportunity:</b> ${popUpData.future_fiber_opportunity.toLocaleString()}
                   <br/><b>T-30 File Date:</b> ${moment(popUpData.grn_30day_dt).format('L')}
                   <br/><div style = "align:center"></div><a href="#" class="futurePSAFilterLink">Click To Show Fiber Addresses within this PSA</a>
                  </div>`
        })
        $(".futurePSAFilterLink").on('click', () => {
            console.log('.futurePSAFilterLink clicked');
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