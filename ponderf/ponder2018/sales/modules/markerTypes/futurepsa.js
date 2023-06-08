const clicked = async (map, closestLocation, market, groupBy) => {
    const psa = closestLocation.p;
    if (psa) {
        SelectedPSA = psa.ZIP_CO_PSA;
        const addressExportText = `<button class="futurepsa-zipmodaldetaillink-button" style="background-color: white; border-style: none;"><a href="#" data-psa="${psa.ZIP_CO_PSA}" data-wirelessscore="${psa.WIRELESS_SCORE_TEXT}" data-futurefiberopportunity="${psa.FUTURE_FIBER_OPPORTUNITY}" data-green30daydate="${psa.GRN_30DAY_DT}"" class="FuturePSAZipModalDetailLink">Click To Show Fiber Addresses within this PSA</a></button><br><button class="futurepsa-zipmodaldetaillink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>`;
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 350 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                                                <h4><b>Future (T-30) PSA</b></h4>
                                                <b>ZIP CO PSA:</b> ${psa.ZIP_CO_PSA}
                                                <br/><b>Indoor Coverage Score:</b> ${psa.WIRELESS_SCORE_TEXT}
                                                <br/><b>Future (T-30) Fiber Opportunity:</b> ${psa.FUTURE_FIBER_OPPORTUNITY}
                                                <br/><b>T-30 File Date:</b> ${psa.GRN_30DAY_DT}
                                                <br/>${addressExportText}
                                                `);
        popup.openOn(map);
        //on popup open collapse layercontrol
        $(".leaflet-control-layers")
            .each(function () {
                $(this).removeClass("leaflet-control-layers-expanded");
            });
        //on popup close collapse layercontrol
        popup.on('remove', function () {
            $(".leaflet-control-layers")
                .each(function () {
                    $(this).addClass("leaflet-control-layers-expanded");
                });
        });
    }
}

export { clicked };
