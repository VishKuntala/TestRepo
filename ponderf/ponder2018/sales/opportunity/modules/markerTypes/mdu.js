import Papa from "papaparse";
import { saveAs } from "file-saver";
import { config as tableConfig } from "../components/tabulatr/derivations/opportunity/config/config.js"

const clicked = async (instance, coordinates, addressId) => {
    console.log('mdu clicked');
    const { mduUnitsExportDataKeysMap } = tableConfig.tables.mdus;
    const { accUnitsExportDataKeysMap } = tableConfig.tables.accs;

    const renameDataKeys = R.curry((keysMap, obj) =>
        R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
    );

    // remove any open popups
    //$('.mapboxgl-popup').remove();    
    const { map, store } = instance;
    //const popup = new maplibregl.Popup({
    //    maxWidth: "500px",
    //    closeButton: true,
    //    anchor: "bottom",
    //})
    //    .setLngLat(coordinates)
    //    .setHTML('<div class="ui active mini blue elastic loader"></div>')
    //    .addTo(map);

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

    try {
        const data  = await instance.getData(
            `${store.baseApiUrl}/point/mdus/${addressId}`,
        );
        const popUpData = data.features[0].properties;        
        const exportUnitsFromBuildingLink = store.accessLevel === 'Unlimited' ? `<br/><div style = "align:center"></div><a href="#" class="mduWithATTFiberProspectLayerExportBuildingUnitNumbers">Export Units for this Building</a>` : '';
        const exportUnitsFromPropertyLink = store.accessLevel === 'Unlimited' && popUpData.acc_mstr_prpty_id != null ? `<br/><div style = "align:center"></div><a href="#" class="mduWithATTFiberProspectLayerExportPropertyUnitNumbers">Export Units for this Property</a>` : '';
        const propertyIdInfo = popUpData.acc_mstr_prpty_id != null ? `<b>Property ID:</b> ${popUpData?.acc_mstr_prpty_id}` : '';
        const propertyNameInfo = popUpData.property_name != null ? `<br/><b>Property Name:</b> ${popUpData?.property_name}<br/>` : '';
        if (popUpData.customer_category_id == 7) {
            //popup.setHTML(
            //    `
            //      <div style="text-align: center">
            //       ${propertyIdInfo}
            //       ${propertyNameInfo}
            //       <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
            //       <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
            //       <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
            //       <br/> ${popUpData.customer_count} AT&T Fiber Customers at this MDU
            //       <br/><b>No AT&T Fiber Prospects at this MDU</b>
            //       <br/><div style = "align:center"></div><a href="#" class="mduAllATTFiberCustomerLayerPSAFilterLink">Click To Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
            //       ${exportUnitsFromBuildingLink}
            //       ${exportUnitsFromPropertyLink}
            //      </div>
            //    `
            //);
            instance.popup.setOptions({
                closeButton: true,
                content: `<div class="ui message" style="text-align: center">
                   ${propertyIdInfo}
                   ${propertyNameInfo}
                   <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                   <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                   <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
                   <br/> ${popUpData.customer_count} AT&T Fiber Customers at this MDU
                   <br/><b>No AT&T Fiber Prospects at this MDU</b>
                   <br/><div style = "align:center"></div><a href="#" class="mduAllATTFiberCustomerLayerPSAFilterLink">Click To Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
                   ${exportUnitsFromBuildingLink}
                   ${exportUnitsFromPropertyLink}
                  </div>`
            });
        }
        else if (popUpData.customer_category_id == 8) {
            let prospectWording = 'Prospects';
            if (popUpData.opportunity_count - popUpData.upgrade_count == 1) {
                prospectWording = 'Prospect';
            }
            let customerWording = 'Customers';
            if (popUpData.customer_count == 1) {
                customerWording = 'Customer';
            }
            let upgradeWording = 'Upgrades';
            if (popUpData.upgrade_count == 1) {
                upgradeWording = 'Upgrade';
            }
            //popup.setHTML(
            //    `
            //      <div style="text-align: center">
            //       ${propertyIdInfo}
            //       ${propertyNameInfo}
            //       <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
            //       <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
            //       <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
            //       <br/>${popUpData.customer_count} AT&T Fiber ${customerWording} at this MDU
            //       <br/>${popUpData.opportunity_count - popUpData.upgrade_count} AT&T Fiber ${prospectWording} at this MDU
            //       <br/>${popUpData.upgrade_count} AT&T Fiber ${upgradeWording} at this MDU                   
            //       <br/><b>Regreen:</b> ${popUpData.regreen}
            //       <br/><b>ADSL:</b> ${popUpData.adsl}
            //       <br/><b>CSI Eligible:</b> ${popUpData.csi_eligible}
            //       <br/><div style = "align:center"></div><a href="#" class="mduPSAFilterLink">Click to Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
            //       ${exportUnitsFromBuildingLink}
            //       ${exportUnitsFromPropertyLink}
            //      </div>
            //    `
            //);
            instance.popup.setOptions({
                closeButton: true,
                content: `<div class="ui message" style="text-align: center">
                   ${propertyIdInfo}
                   ${propertyNameInfo}
                   <b>Address:</b> ${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name}
                   <br/><b>City, State Zip:</b> ${popUpData.city} ${popUpData.state} ${popUpData.zip}
                   <br/><b>PSA Wireless Score:</b> ${popUpData.wireless_score}
                   <br/>${popUpData.customer_count} AT&T Fiber ${customerWording} at this MDU
                   <br/>${popUpData.opportunity_count - popUpData.upgrade_count} AT&T Fiber ${prospectWording} at this MDU
                   <br/>${popUpData.upgrade_count} AT&T Fiber ${upgradeWording} at this MDU                   
                   <br/><b>Regreen:</b> ${popUpData.regreen}
                   <br/><b>ADSL:</b> ${popUpData.adsl}
                   <br/><b>CSI Eligible:</b> ${popUpData.csi_eligible}
                   <br/><div style = "align:center"></div><a href="#" class="mduPSAFilterLink">Click to Show Fiber Addresses within PSA ${popUpData.zip_co_psa}</a>
                   ${exportUnitsFromBuildingLink}
                   ${exportUnitsFromPropertyLink}
                  </div>`
            });
        }
        $(".mduPSAFilterLink").on('click', () => {
            console.log('.mduPSAFilterLink clicked');
            instance.store.searchedPSA = popUpData.zip_co_psa;
            instance.store.addPSAFilter = {
                psa: popUpData.zip_co_psa,
                latitude: popUpData.latitude,
                longitude: popUpData.longitude
            };            
        });
        $(".mduWithATTFiberProspectLayerExportBuildingUnitNumbers").on('click', async () => {
            console.log('.mduWithATTFiberProspectLayerExportBuildingUnitNumbers clicked');
            if (instance.store.mduUnitsData) {
                //log export event
                const params = {
                    userID: instance.store.userId,
                    eventType: "export_units_for_this_building",
                    logDataType: "PSA",
                    logData: popUpData.zip_co_psa,
                    logJsonPayload: `${popUpData.house_number} ${popUpData.prefix} ${popUpData.street_name} ${ popUpData.city } ${ popUpData.state } ${ popUpData.zip }`
                };
                await instance.postData(
                    `${instance.store.baseApiUrl}/log/event`,
                    params
                );
                // filter mduUnitsData before export to export data related to specific MDU using latitude and longitude
                const filteredMDUUnitsData = R.filter(v => v.latitude === popUpData.latitude && v.longitude === popUpData.longitude, instance.store.mduUnitsData);
                const exportKeys = R.keys(mduUnitsExportDataKeysMap); // get keys to be exported from config
                let exportData = R.map((x) => R.pick(exportKeys, x), filteredMDUUnitsData) // pick only specific keys from exportData
                exportData = R.map(renameDataKeys(mduUnitsExportDataKeysMap), exportData); //rename keys before export
                const csv = Papa.unparse(exportData);
                const blob = new Blob([csv], {
                    type: "text/plain;charset=utf-8",
                });
                saveAs(blob, `TableDataExport.csv`);
            }
        });
        $(".mduWithATTFiberProspectLayerExportPropertyUnitNumbers").on('click', async () => {        
            console.log('.mduWithATTFiberProspectLayerExportPropertyUnitNumbers clicked');
            if (instance.store.mduUnitsData) {
                //log export event
                const params = {
                    userID: instance.store.userId,
                    eventType: "export_units_for_this_property",
                    logDataType: "PSA",
                    logData: popUpData.zip_co_psa,                    
                    logJsonPayload: `${popUpData.acc_mstr_prpty_id}`
                };
                await instance.postData(
                    `${instance.store.baseApiUrl}/log/event`,
                    params
                );
                // filter mduUnitsData by acc_mstr_prpty_id before export
                const filteredMDUUnitsData = R.filter(v => v.acc_mstr_prpty_id === popUpData.acc_mstr_prpty_id, instance.store.mduUnitsData);
                const exportKeys = R.keys(accUnitsExportDataKeysMap); // get keys to be exported from config
                let exportData = R.map((x) => R.pick(exportKeys, x), filteredMDUUnitsData) // pick only specific keys from exportData
                exportData = R.map(renameDataKeys(accUnitsExportDataKeysMap), exportData); //rename keys before export
                const csv = Papa.unparse(exportData);
                const blob = new Blob([csv], {
                    type: "text/plain;charset=utf-8",
                });
                saveAs(blob, `TableDataExport.csv`);
            }
        });
    } catch (err) {
        console.error(err);
    }
}

export { clicked };