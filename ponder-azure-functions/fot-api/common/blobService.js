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

const get = async (containerName, blobName, sortClause, whereClause) => {
    // Get a reference to a container
    const containerClient = blobServiceClient.getContainerClient(containerName);
    // Create if the container does not exist
    const createContainerResponse = await containerClient.createIfNotExists();
    // if (sortClause.trim() === '' && whereClause.trim() === '') {
        // Get a block blob client
        const blockBlobClient = containerClient.getBlockBlobClient(blobName);
        const blobExists = await blockBlobClient.exists(blobName);
        if (blobExists) {
            const downloadBlockBlobResponse = await blockBlobClient.download(0);
            const blobText = await streamToText(downloadBlockBlobResponse.readableStreamBody);
        return blobText;
        }
    // }
    return null;
}

const put = async (containerName, blobName, sortClause, whereClause, data) => {
    // Get a reference to a container
    const containerClient = blobServiceClient.getContainerClient(containerName);
    // Create if the container does not exist
    const createContainerResponse = await containerClient.createIfNotExists();
    // Get a block blob client
    // if (sortClause.trim() === '' && whereClause.trim() === '') {
        const blockBlobClient = containerClient.getBlockBlobClient(blobName);
        await blockBlobClient.upload(data, data.length);
    // }
}




module.exports = { get, put };