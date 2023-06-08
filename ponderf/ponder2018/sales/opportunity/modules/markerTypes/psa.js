import centroid from "@turf/centroid";

const geographyLinks = {
    zips: '<div style = "align:center"> OR </div><a href="#" class="zipGeographyLink">Click to Show Top Fiber Opportunities in this Zip</a>',
    counties: '<div style = "align:center"> OR </div><a href="#" class="countyGeographyLink">Click to Show Top Fiber Opportunities in this County</a>',
    dmas: '<div style = "align:center"> OR </div><a href="#" class="dmaGeographyLink">Click to Show Top Fiber Opportunities in this DMA</a>',
};

const clicked = async (instance, coordinates, psa, config) => {
    console.log('psa clicked');
    //// remove any open popups
    //$('.mapboxgl-popup').remove();    
    const { map, store } = instance;


    if (instance.popup.isOpen()) {
        instance.popup.close();
    }
    instance.popup.setOptions({
        content: `<div class="ui compact message">
                <div class="ui active mini blue elastic loader"></div>
              </div>`,
        position: coordinates,
        closeButton: true
    });
    instance.popup.open(map);

    //const popup = new maplibregl.Popup({
    //    maxWidth: "500px",
    //    closeButton: true,
    //    anchor: "bottom",
    //})
    //    .setLngLat(coordinates)
    //    .setHTML('<div class="ui active mini blue elastic loader"></div>')
    //    .addTo(map);

    try {
        const data = await instance.getData(
            `${store.baseApiUrl}/point/psas/${psa}`,
        );
        const popUpData = data.features[0].properties;
        const psaLink = `<div style = "align:center"></div><a href="#" class="psaFilterLink">Click To Show Fiber Addresses within this PSA</a>`;
        const geographyLink = ["zips", "counties", "dmas"].includes(store.tableType) ? geographyLinks[store.tableType] : "";
        //popup.setHTML(
        //    `
                  //<div style="text-align: center">                   
                  // <b>ZIP CO PSA:</b> ${popUpData.zip_co_psa}
                  // <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score}
                  // <br/><b>Fiber Locations:</b> ${popUpData.fiber_available}
                  // <br/><b>Fiber Penetration:</b> ${popUpData.fiber_percentage}%
                  // <br/><b>Fiber Customer and Wireless Customer:</b> ${popUpData.fiber_customer_wireless_customer}
                  // <br/><b>Fiber Customer and Wireless Cross-Sell Opportunity:</b> ${popUpData.fiber_customer_no_wireless}
                  // <br/><b>Copper Upgrade and Wireless Customer:</b> ${popUpData.copper_upgrade_wireless_customer}
                  // <br/><b>Copper Upgrade and Wireless Cross-Sell Opportunity:</b> ${popUpData.copper_upgrade_no_wireless}
                  // <br/><b>Wireless Customer and Fiber Cross-Sell Opportunity:</b> ${popUpData.wireless_customer_no_fiber}
                  // <br/><b>Opportunity for Fiber and Wireless:</b> ${popUpData.no_fiber_no_wireless}
                  // <br/><b>MDU Density:</b> ${popUpData.mdu_density_text}
                  // <br/>${psaLink}${geographyLink}
                  //</div>
        //        `
        //);

        instance.popup.setOptions({
            closeButton: true,
            content: `<div class="ui message" style="text-align: center">
                   <b>ZIP CO PSA:</b> ${popUpData.zip_co_psa}
                   <br/><b>Indoor Coverage Score:</b> ${popUpData.wireless_score}
                   <br/><b>Fiber Locations:</b> ${popUpData.fiber_available}
                   <br/><b>Fiber Penetration:</b> ${popUpData.fiber_percentage}%
                   <br/><b>Fiber Customer and Wireless Customer:</b> ${popUpData.fiber_customer_wireless_customer}
                   <br/><b>Fiber Customer and Wireless Cross-Sell Opportunity:</b> ${popUpData.fiber_customer_no_wireless}
                   <br/><b>Copper Upgrade and Wireless Customer:</b> ${popUpData.copper_upgrade_wireless_customer}
                   <br/><b>Copper Upgrade and Wireless Cross-Sell Opportunity:</b> ${popUpData.copper_upgrade_no_wireless}
                   <br/><b>Wireless Customer and Fiber Cross-Sell Opportunity:</b> ${popUpData.wireless_customer_no_fiber}
                   <br/><b>Opportunity for Fiber and Wireless:</b> ${popUpData.no_fiber_no_wireless}
                   <br/><b>MDU Density:</b> ${popUpData.mdu_density_text}
                   <br/>${psaLink}${geographyLink}
                  </div>`
        });
        $(".psaFilterLink").on('click', () => {
            console.log('.psaFilterLink clicked');
            instance.store.searchedPSA = popUpData.zip_co_psa;
            instance.store.addPSAFilter = {
                psa: popUpData.zip_co_psa,
                latitude: popUpData.latitude,
                longitude: popUpData.longitude
            };
        });
        $(".dmaGeographyLink").on('click', async () => {
            console.log('.dmaGeographyLink clicked');
            // remove open popup
            /*            $('.mapboxgl-popup').remove();*/
            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            const value = popUpData.dma;
            instance.store.searchMode = 'dmaSearch';
            instance.store.inSearchMode = true;
            instance.store.searchedDMA = value;
            const params = {dma: value};
            const boundaryData = await instance.getData(
                `${store.baseApiUrl}/geodata/${store.heatmap
                }/dmaBoundary.geojson`,
                params
            );
            const dmaCenter = centroid(boundaryData);
            instance.store.zoomToPoint = {
                lat: dmaCenter.geometry.coordinates[1],
                lng: dmaCenter.geometry.coordinates[0],
                zoom: config.heatmapLayers.DMA.minZoom,
                addMarker: false,
            };
            instance.store.setBoundaryLayer = {
                layerName: "DMA_BOUNDARY",
                featureCollection: boundaryData
            };
        });
        $(".countyGeographyLink").on('click', async () => {
            console.log('.countyGeographyLink clicked');
            // remove open popup
            //$('.mapboxgl-popup').remove();
            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            const value = popUpData.county_fips;
            instance.store.searchMode = 'countySearch';
            instance.store.inSearchMode = true;
            instance.store.searchedCounty = value;
            const params = {county: value};
            const boundaryData = await instance.getData(
                `${store.baseApiUrl}/geodata/${store.heatmap}/countyBoundary.geojson`,
                params
            );
            const countyCenter = centroid(boundaryData);
            instance.store.zoomToPoint = {
                lat: countyCenter.geometry.coordinates[1],
                lng: countyCenter.geometry.coordinates[0],
                zoom: config.heatmapLayers.COUNTY.minZoom,
                addMarker: false,
            };
            instance.store.setBoundaryLayer = {
                layerName: "COUNTY_BOUNDARY",
                featureCollection: boundaryData
            };
        });
        $(".zipGeographyLink").on('click', async () => {
            console.log('.zipGeographyLink clicked');
            // remove open popup
            //$('.mapboxgl-popup').remove();
            if (instance.popup.isOpen()) {
                instance.popup.close();
            }
            const value = popUpData.zip;
            instance.store.searchMode = 'zipSearch';
            instance.store.inSearchMode = true;
            instance.store.searchedZip = value;
            const params = { zip: value };
            const boundaryData = await instance.getData(
                `${store.baseApiUrl}/geodata/${store.heatmap}/zipBoundary.geojson`,
                params
            );
            const zipCenter = centroid(boundaryData);
            instance.store.zoomToPoint = {
                lat: zipCenter.geometry.coordinates[1],
                lng: zipCenter.geometry.coordinates[0],
                zoom: config.heatmapLayers.ZIP.minZoom,
                addMarker: false,
            };
            instance.store.setBoundaryLayer = {
                layerName: "ZIP_BOUNDARY",
                featureCollection: boundaryData
            };
        });
    } catch (err) {
        console.error(err);
    }
}

export { clicked };