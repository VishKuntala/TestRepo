const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
    process.env.AZURE_STORAGE_CONNECTION_STRING
  );

// Convert stream to text
const streamToText = async readable => {
    readable.setEncoding('utf8');
    let data = '';
    for await (const chunk of readable) {
        data += chunk;
    }
    return data;
}



const get = async (containerName, blobName) => {
    // Get a reference to a container
    const containerClient = blobServiceClient.getContainerClient(containerName);
    // Create if the container does not exist
    const createContainerResponse = await containerClient.createIfNotExists();
    // Get a block blob client
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);
    const blobExists = await blockBlobClient.exists(blobName);
    if (blobExists) {
        const blob = await blockBlobClient.downloadToBuffer();
        // const blobText = await streamToText(downloadBlockBlobResponse.readableStreamBody);
        // return blobText;
        return blob;
    }
    return null;
}

const put = async (containerName, blobName, data) => {
    // Get a reference to a container
    const containerClient = blobServiceClient.getContainerClient(containerName);
    // Create if the container does not exist
    const createContainerResponse = await containerClient.createIfNotExists();
    // Get a block blob client
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);
    await blockBlobClient.upload(data, data.length);
}






module.exports = { get, put };