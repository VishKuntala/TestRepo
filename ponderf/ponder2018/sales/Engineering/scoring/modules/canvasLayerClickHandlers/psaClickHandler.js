import getPsaDetail from '../getPsaDetail.js';

const psaClickHandler = async ( closestLocation, map) => {
    const psaDetail = await getPsaDetail(closestLocation.p.ZIP_CO_PSA.substring(0,5));
    const psa = R.find( p => p.ZIP_CO_PSA === closestLocation.p.ZIP_CO_PSA , psaDetail );
    if (psa){
    let popup = L.popup({ closeButton: true, autoPan: false });
                    popup.setLatLng(closestLocation.latlng);
                    popup.setContent(`
                    <b>ZIP CO PSA:</b>${psa.ZIP_CO_PSA}
                    <br/><b>Wireless Score:</b>${psa.WIRELESS_SCORE_TEXT}
                    <br/><b>Fiber Locations:</b>${psa.FIBER_AVAILABLE}
                    <br/><b>Fiber Customers:</b>${psa.FIBER_CUSTOMERS}
                    <br/><b>Fiber Opportunity:</b>${psa.FIBER_OPPORTUNITY}
                    `);
                    popup.openOn(map);
    }
};

export default psaClickHandler;