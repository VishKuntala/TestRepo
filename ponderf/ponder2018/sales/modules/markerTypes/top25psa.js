const modalLinks = {
    "ZIP": '<div style = "align:center"> OR </div><a href="#" class="ZipDetailLink">Click to Show Top Fiber Opportunities in this Zip</a>',
    "COUNTY": '<div style = "align:center"> OR </div><a href="#" class="CountyDetailLink">Click to Show Top Fiber Opportunities in this County</a>',
    "CMA": '<div style = "align:center"> OR </div><a href="#" class="CMADetailLink">Click to Show Top Fiber Opportunities in this CMA</a>',
    "ZIP-TOUCH": '<div style = "align:center"> OR </div><a href="#" class="ZipTouchDetailLink">Click to Show Top Fiber Opportunities in this Zip</a>',
    "COUNTY-TOUCH": '<div style = "align:center"> OR </div><a href="#" class="CountyTouchDetailLink">Click to Show Top Fiber Opportunities in this County</a>',
    "CMA-TOUCH": '<div style = "align:center"> OR </div><a href="#" class="CMATouchDetailLink">Click to Show Top Fiber Opportunities in this CMA</a>'
};

const clicked = async (map, closestLocation, market, groupBy) => {
    const psa = closestLocation.p;
    if (psa) {
        SelectedPSA = psa.ZIP_CO_PSA;
        const fibercustomers = `${psa.FIBER_CUSTOMERS} (${psa.FIBER_PENETRATION_RATE})`;
        const addressExportText = `<button class="zipmodaldetaillink-button" style="background-color: white; border-style: none;"><a href="#" data-psa="${psa.ZIP_CO_PSA}" data-wirelessscore="${psa.WIRELESS_SCORE_TEXT}" data-fiberavailable="${psa.FIBER_AVAILABLE}" data-fibercustomers="${fibercustomers}" data-fiberopportunity="${psa.FIBER_OPPORTUNITY}" data-copperupgrade="${psa.COPPER_UPGRADE}" class="ZipModalDetailLink">Click To Show Fiber Addresses within this PSA</a></button><br><button class="zipmodaldetaillink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>`;
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 350 });
        popup.setLatLng(closestLocation.latlng);
        const modalLink = groupBy ? modalLinks[groupBy] : '';
        popup.setContent(`
                                                <h4><b>Market Top 25 PSA</b></h4>
                                                <b>ZIP CO PSA:</b> ${psa.ZIP_CO_PSA}
                                                <br/><b>Indoor Coverage Score:</b> ${psa.WIRELESS_SCORE_TEXT}
                                                <br/><b>Market Rank:</b> ${psa.MARKET_RANK}
                                                <br/><b>Fiber Available:</b> ${psa.FIBER_AVAILABLE}
                                                <br/><b>Fiber Customers:</b> ${psa.FIBER_CUSTOMERS} (${psa.FIBER_PENETRATION_RATE})
                                                <br/><b>Fiber Opportunity:</b> ${psa.FIBER_OPPORTUNITY}
                                                <br/><b>Copper Upgrade:</b> ${psa.COPPER_UPGRADE}
                                                <br/><b>MDU Density:</b> ${psa.MDU_DENSITY_TEXT}
                                                <br/>${addressExportText}${modalLink}
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
