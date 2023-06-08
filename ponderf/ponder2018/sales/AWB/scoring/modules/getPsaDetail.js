import { getJsonData } from "./services/jsonData.js";

const getPsaDetail = async (marketGeo, zip) => {
    try {
        //const zipPsaData = await idbKeyval.get(`psa-detail-${marketGeo}-${zip}`);
        // if (!zipPsaData)
        //{
            const myParamsObject = {
                type: "Get_Zip_PSA_Detail_Market",
                zipVariable: zip
            };
            const response = await getJsonData(JSON.stringify({ myParamsObject }));
            const zipData = JSON.parse(response.d);
            //await idbKeyval.set(`psa-detail-${marketGeo}-${zip}`, zipData);
            return zipData;
       // }
        return zipPsaData;
    } catch (ex){
        console.log(ex);
    }
} 

export default getPsaDetail;