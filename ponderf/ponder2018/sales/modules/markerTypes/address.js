const clicked = async (map, closestLocation) => {    
    const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
    popup.setLatLng(closestLocation.latlng);
    if (
        closestLocation.p.CUSTOMER_CATEGORY == 'AT&T Fiber Customer' ||
        closestLocation.p.CUSTOMER_CATEGORY == 'AT&T Fiber Upgrade' ||
        closestLocation.p.CUSTOMER_CATEGORY == 'AT&T Fiber Prospect'
    ) {
        popup.setContent(`<b>Address:</b> ${closestLocation.p.HOUSE_NUMBER} ${closestLocation.p.PREFIX} ${closestLocation.p.STREET_NAME}
                       <br/><b>City, State Zip:</b> ${closestLocation.p.CITY} ${closestLocation.p.STATE} ${closestLocation.p.ZIP}
                       <br/><b>PSA Wireless Score:</b> ${closestLocation.p.WIRELESS_SCORE}
                       <br/><b>Customer Category:</b> ${closestLocation.p.CUSTOMER_CATEGORY}
                       <br/><b>HyperGig:</b> ${closestLocation.p.HYPERGIG} - <b>Regreen:</b> ${closestLocation.p.REGREEN}                       
                       <br/><b>ADSL Customer:</b> ${closestLocation.p.ADSL} - <b>CSI Eligible:</b> ${closestLocation.p.CSI_ELIGIBLE}`);

    } else if (
        closestLocation.p.CUSTOMER_CATEGORY == 'MDU All AT&T Fiber Customers'
    ) {
        popup.setContent(`<b>Address:</b> ${closestLocation.p.HOUSE_NUMBER} ${closestLocation.p.PREFIX} ${closestLocation.p.STREET_NAME}
                       <br/><b>City, State Zip:</b> ${closestLocation.p.CITY} ${closestLocation.p.STATE} ${closestLocation.p.ZIP}
                       <br/><b>PSA Wireless Score:</b> ${closestLocation.p.WIRELESS_SCORE}
                       <br/><b>HyperGig:</b> ${closestLocation.p.MDU_HYPERGIG} - <b>Regreen:</b> ${closestLocation.p.MDU_REGREEN}
                       <br/><b>ADSL Customer:</b> ${closestLocation.p.MDU_ADSL} - <b>CSI Eligible:</b> ${closestLocation.p.MDU_CSI_ELIGIBLE}
                       <br/> ${closestLocation.p.CUSTOMER_COUNT} AT&T Fiber Customers at this MDU
                       <br/><b>No AT&T Fiber Prospects at this MDU</b>`);
    } else if (
        closestLocation.p.CUSTOMER_CATEGORY == 'MDU with AT&T Fiber Prospects'
    ) {
        let prospectWording = 'Prospects';
        if (closestLocation.p.OPPORTUNITY_COUNT - closestLocation.p.UPGRADE_COUNT == 1) {
            prospectWording = 'Prospect';
        }
        let customerWording = 'Customers';
        if (closestLocation.p.CUSTOMER_COUNT == 1) {
            customerWording = 'Customer';
        }
        let upgradeWording = 'Upgrades';
        if (closestLocation.p.UPGRADE_COUNT == 1) {
            upgradeWording = 'Upgrade';
        }
        popup.setContent(`<b>Address:</b> ${closestLocation.p.HOUSE_NUMBER} ${closestLocation.p.PREFIX} ${closestLocation.p.STREET_NAME}
                       <br/><b>City, State Zip:</b> ${closestLocation.p.CITY} ${closestLocation.p.STATE} ${closestLocation.p.ZIP}
                       <br/><b>PSA Wireless Score:</b> ${closestLocation.p.WIRELESS_SCORE}
                       <br/><b>HyperGig:</b> ${closestLocation.p.MDU_HYPERGIG} - <b>Regreen:</b> ${closestLocation.p.MDU_REGREEN}
                       <br/><b>ADSL Customer:</b> ${closestLocation.p.MDU_ADSL} - <b>CSI Eligible:</b> ${closestLocation.p.MDU_CSI_ELIGIBLE}
                       <br/>${closestLocation.p.CUSTOMER_COUNT} AT&T Fiber ${customerWording} at this MDU
                       <br/>${closestLocation.p.OPPORTUNITY_COUNT - closestLocation.p.UPGRADE_COUNT} AT&T Fiber ${prospectWording} at this MDU
                       <br/>${closestLocation.p.UPGRADE_COUNT} AT&T Fiber ${upgradeWording} at this MDU`);
    }
    popup.openOn(map);
};

export { clicked };
