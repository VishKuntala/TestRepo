
import getPsaDetail from "../getPsaDetail.js";

const modalLinks = {
    "ZIP" : '<div style = "align:center"> OR </div><a href="#" class="ZipDetailLink">Click to Show Top Fiber Opportunities in this Zip</a>',
    "COUNTY": '<div style = "align:center"> OR </div><a href="#" class="CountyDetailLink">Click to Show Top Fiber Opportunities in this County</a>',
    "CMA": '<div style = "align:center"> OR </div><a href="#" class="CMADetailLink">Click to Show Top Fiber Opportunities in this CMA</a>',
    "ZIP-TOUCH": '<div style = "align:center"> OR </div><a href="#" class="ZipTouchDetailLink">Click to Show Top Fiber Opportunities in this Zip</a>',
    "COUNTY-TOUCH": '<div style = "align:center"> OR </div><a href="#" class="CountyTouchDetailLink">Click to Show Top Fiber Opportunities in this County</a>',
    "CMA-TOUCH": '<div style = "align:center"> OR </div><a href="#" class="CMATouchDetailLink">Click to Show Top Fiber Opportunities in this CMA</a>'
};

const clicked = async (map, closestLocation, market, groupBy) => {
    const psaDetail = await getPsaDetail(
       market,
        closestLocation.p.ZIP_CO_PSA.substring(0, 5));
    const psa = R.find(p => p.ZIP_CO_PSA === closestLocation.p.ZIP_CO_PSA, psaDetail);
    if (psa) {

        SelectedPSA = psa.ZIP_CO_PSA;
        const addressExportText = Access == "Unlimited" ?
            '<button class="zipmodaldetaillink-button" style="background-color: white; border-style: none;"><a href="#" class="ZipModalDetailLink">Click to Export Fiber Addresses from this PSA</a></button><br><button class="zipmodaldetaillink-spinner" style="background-color: white; border-style: none; display: none;"><img src="../ajax-loader_2.gif" /></button>'
            : '<a href="#" class="ZipModalDetailLink">Click to Show Fiber Addresses in this PSA</a>';

        const popup = L.popup({ closeButton: true, autoPan: true, maxWidth: 350 });
        popup.setLatLng(closestLocation.latlng);
        popup.setContent(`
                                                <b>ZIP CO PSA:</b> ${psa.ZIP_CO_PSA}
                                                <br/><b>Wireless Score:</b> ${psa.WIRELESS_SCORE_TEXT}
                                                <br/><b>Fiber Locations:</b> ${psa.FIBER_AVAILABLE}
                                                <br/><b>Fiber Customers:</b> ${psa.FIBER_CUSTOMERS} (${(100 * (psa.FIBER_CUSTOMERS / psa.FIBER_AVAILABLE)).toFixed(1)}%)
                                                <br/><b>Fiber Opportunity:</b> ${psa.FIBER_OPPORTUNITY}
                                                <br/>${addressExportText}${modalLinks[groupBy]}
                                                `);
        popup.openOn(map);
    } 
}

export { clicked };