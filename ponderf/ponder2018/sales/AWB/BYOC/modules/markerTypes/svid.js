
const clicked = async (map, closestLocation) => {   

        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 500 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
            <b>SVID Name:</b> ${closestLocation.p.SVID_NAME}
            <br/><b>Address:</b> ${closestLocation.p.ADDR}                        
        `);
        popup.openOn(map);
    
}

export { clicked };