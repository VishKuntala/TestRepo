import { config as tableConfig } from "../components/tabulatr/derivations/opportunity/config/config.js"
import Papa from "papaparse";
import { saveAs } from "file-saver";

const clicked = async (instance, coordinates, accMasterPropertyId) => {
    console.log('acc clicked');
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
        const data = await instance.getData(
            `${store.baseApiUrl}/point/accs/${accMasterPropertyId}`,
        );
        const popUpData = data.features[0].properties;
        const exportACCPropertyUnitsLink = store.accessLevel === 'Unlimited' ? `<br/><div style = "align:center"></div><a href="#" class="exportACCPropertyUnitNumbers">Export Units for this Property</a>` : '';
        //popup.setHTML(
        //    `
        //          <div style="text-align: center">                   
        //           <b>Property ID:</b> ${popUpData.acc_mstr_prpty_id}
        //           <br/><b>Property Name:</b> ${popUpData.property_name}
        //           <br/><b>Fiber Available:</b> ${popUpData.fiber_available}
        //           <br/><b>Fiber Opportunity:</b> ${popUpData.fiber_opportunity}
        //           <br/><b>Fiber Penetration:</b> ${popUpData.fiber_penetration_rate}%
        //           <br/><b>Copper Upgrade:</b> ${popUpData.copper_upgrade}
        //           <br/><b>PSA Coverage Score:</b> ${popUpData.psa_coverage_score}
        //           <br/><b>Contract Type:</b> ${popUpData.contract_type}
        //           <br/><b>Preferred Partner:</b> ${popUpData.preferred_partner}
        //           <br/><b>Area Manager:</b> ${popUpData.area_mgr}
        //           <br/><b>General Manager:</b> ${popUpData.gm}
        //           ${exportACCPropertyUnitsLink}
        //          </div>
        //        `
        //);
        instance.popup.setOptions({
            closeButton: true,
            content: `<div style="text-align: center">                   
                   <b>Property ID:</b> ${popUpData.acc_mstr_prpty_id}
                   <br/><b>Property Name:</b> ${popUpData.property_name}
                   <br/><b>Fiber Available:</b> ${popUpData.fiber_available}
                   <br/><b>Fiber Opportunity:</b> ${popUpData.fiber_opportunity}
                   <br/><b>Fiber Penetration:</b> ${popUpData.fiber_penetration_rate}%
                   <br/><b>Copper Upgrade:</b> ${popUpData.copper_upgrade}
                   <br/><b>PSA Coverage Score:</b> ${popUpData.psa_coverage_score}
                   <br/><b>Contract Type:</b> ${popUpData.contract_type}
                   <br/><b>Preferred Partner:</b> ${popUpData.preferred_partner}
                   <br/><b>Area Manager:</b> ${popUpData.area_mgr}
                   <br/><b>General Manager:</b> ${popUpData.gm}
                   ${exportACCPropertyUnitsLink}
                  </div>`
        });
        $(".exportACCPropertyUnitNumbers").on('click', async () => {
            console.log('.exportACCPropertyUnitNumbers clicked');
            const renameDataKeys = R.curry((keysMap, obj) =>
                R.reduce((acc, key) => R.assoc(keysMap[key] || key, obj[key], acc), {}, R.keys(obj))
            );
            const accMasterPropertyId = popUpData.acc_mstr_prpty_id;
            //get userACCUnitsExportData for accMasterPropertyId
            const response = await instance.postData(`${instance.store.baseApiUrl}/table/useraccsrow`, { accMasterPropertyId });
            if (response) {                
                const exportDataKeysMap = tableConfig.tables.useraccs.userACCUnitsExportDataKeysMap;
                const exportKeys = R.keys(exportDataKeysMap); // get keys to be exported from config                            
                let exportData = response;
                exportData = R.map((x) => R.pick(exportKeys, x), exportData) // pick only specific keys from exportData                
                const exportProperties = R.uniq(exportData.map(x => x.zip_co_psa)).toString();
                //log export event
                const params = {
                    userID: instance.store.userId,
                    eventType: "export_units_for_this_property_acc_popup",
                    logDataType: "PSA",
                    logData: exportProperties,
                    logJsonPayload: `${accMasterPropertyId}`
                };
                await instance.postData(
                    `${instance.store.baseApiUrl}/log/event`,
                    params
                );
                //export data
                exportData = R.map(renameDataKeys(exportDataKeysMap), exportData); //rename keys before export                            
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