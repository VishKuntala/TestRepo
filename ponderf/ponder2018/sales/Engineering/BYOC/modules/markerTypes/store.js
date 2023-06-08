
const clicked = async (map, closestLocation) => {   
               
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                        <b>Store Category:</b> ${closestLocation.p.STORE_CATEGORY==="AR"?"Authorized Reseller Store":"AT&T Retail Store"}
                        <br/><b>Location ID:</b> ${closestLocation.p.LOCATION_ID}
                        <br/><b>Location Name:</b> ${closestLocation.p.LOCATION_NAME}
                                                `);
        popup.openOn(map);
    
}

export { clicked };