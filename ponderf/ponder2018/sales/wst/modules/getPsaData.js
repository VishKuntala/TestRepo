const getPsaData = async url => {
    try {
    const response = await axios.get(url);
    const decompressedData = LZString.decompressFromBase64(response.data);
    return JSON.parse(decompressedData);
    } catch (ex){
        console.log(ex);
    }
} 

export default getPsaData;