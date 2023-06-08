const clicked = async (map, closestLocation) => {
    const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
    popup.setLatLng(closestLocation.latlng);
    popup.setContent(`<h4><b>Future (T-30) Fiber Opportunity</b></h4>
                       <b>Address:</b> ${closestLocation.p.HOUSE_NUMBER || ''} ${closestLocation.p.PREFIX || ''} ${closestLocation.p.STREET_NAME || ''}
                       <br/><b>City, State Zip:</b> ${closestLocation.p.CITY || ''} ${closestLocation.p.STATE || ''} ${closestLocation.p.ZIP || ''}`);
    popup.openOn(map);
};

export { clicked };
