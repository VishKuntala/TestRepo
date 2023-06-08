
const clicked = async (map, closestLocation) => {   
               
        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                        <b>Store Category:</b> ${closestLocation.p.store_category==="AR"?"Authorized Reseller Store":"AT&T Retail Store"}
                        <br/><b>Location ID:</b> ${closestLocation.p.location_id}
                        <br/><b>Location Name:</b> ${closestLocation.p.location_name}
                                                `);
        popup.openOn(map);
    
}

export { clicked };