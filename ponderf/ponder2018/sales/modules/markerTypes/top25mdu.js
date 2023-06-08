const clicked = async (map, closestLocation, market, groupBy) => {
    let top25MDULinkDesc;
    if (Access == "Unlimited") {
        top25MDULinkDesc = '<button class="top25mdulink-button" style="background-color: white; border-style: none;"><a href="#" class="top25mdulink">Click to Export Unit Numbers</a></button><br><button class="top25mdulink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>';
    } else {
        top25MDULinkDesc = '<a href="#" class="top25mdulink">Click to Show Unit Numbers</a>';
    }
    const mdu = closestLocation.p;
    if (mdu) {
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                       <h4><b>Market Top 25 MDU</b></h4>
                       <b>Address:</b> ${mdu.HOUSE_NUMBER} ${mdu.PREFIX} ${mdu.STREET_NAME}
                       <br/><b>City, State Zip:</b> ${mdu.CITY} ${mdu.STATE} ${mdu.ZIP}
                       <br/><b>Indoor Coverage Score:</b> ${mdu.WIRELESS_SCORE_TEXT}
                       <br/><b>Fiber Available:</b> ${mdu.FIBER_AVAILABLE}
                       <br/><b>Fiber Customers:</b> ${mdu.FIBER_CUSTOMERS} (${mdu.FIBER_PENETRATION_RATE}%)
                       <br/><b>Fiber Opportunity:</b> ${mdu.FIBER_OPPORTUNITY}
                       <br/><b>Market Rank:</b> ${mdu.MARKET_RANK}
                       <br/>${top25MDULinkDesc}`);
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
};

export { clicked };
