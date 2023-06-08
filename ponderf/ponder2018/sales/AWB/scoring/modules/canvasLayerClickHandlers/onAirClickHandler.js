const onAirClickHandler = async ( closestLocation, map) => {

    let popup = L.popup({ closeButton: true, autoPan: false });
                    popup.setLatLng(closestLocation.latlng);
                    popup.setContent(`
                    <b>PACE_NUMBER:</b>closestLocation.p.LOCATION_ID
                    <br/><b>PACE_NAME_SHORT:</b>closestLocation.p.CONTACT_COMPANY_NM
                    `);
                    popup.openOn(map);
    
};

export default onAirClickHandler;