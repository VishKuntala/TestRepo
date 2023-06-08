const blobStorage = require('@azure/storage-blob');
const {
    DefaultAzureCredential
} = require('@azure/identity');
const {
    BlockBlobClient,
    BlobServiceClient,
    BlobSASPermissions,
    generateBlobSASQueryParameters,
    SASProtocol
} = require('@azure/storage-blob');

const channelFilesConfig = {
    "ch9FiberStores" : {
        "faq" : "Sample_Gameplan_FAQ.pdf"
    }
}

module.exports = async function (context, req) {
    try {

        const accountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
        const containerName = "wst-channel-docs";
        const blobName= channelFilesConfig[req.params.channel][req.params.docKey];
        
            
    const TWO_MINUTES = 2 * 60 * 1000;
    const NOW = new Date();

    // Best practice: set start time a little before current time to 
    // make sure any clock issues are avoided
    const TWO_MINUTES_BEFORE_NOW = new Date(NOW.valueOf() - TWO_MINUTES);
    const TWO_MINUTES_AFTER_NOW = new Date(NOW.valueOf() + TWO_MINUTES);

    // Best practice: use managed identity - DefaultAzureCredential
    const blobServiceClient = new BlobServiceClient(
        `https://${accountName}.blob.core.windows.net`,
        new DefaultAzureCredential()
      );

      const client =blobServiceClient.getContainerClient(containerName);
      const blobClient = client.getBlockBlobClient(blobName);

    // Best practice: delegation key is time-limited  
    // When using a user delegation key, container must already exist 
    const userDelegationKey = await blobServiceClient.getUserDelegationKey(
        TWO_MINUTES_BEFORE_NOW, 
        TWO_MINUTES_AFTER_NOW
    );

    // Need only read permission to download the file
    const blobPermissionsForAnonymousUser = "r"

    // Best practice: SAS options are time-limited
    const sasOptions = {
        blobName,
        containerName,                                           
        permissions: BlobSASPermissions.parse(blobPermissionsForAnonymousUser), 
        protocol: SASProtocol.Https,
        startsOn: TWO_MINUTES_BEFORE_NOW,
        expiresOn: TWO_MINUTES_AFTER_NOW
    };
 
    const sasToken = generateBlobSASQueryParameters(
        sasOptions,
        userDelegationKey,
        accountName 
    ).toString();
    const sasUrl= "https://ponder.blob.core.windows.net/wst-channel-docs/Sample_Gameplan_FAQ.pdf"+"?"+sasToken;
    context.res = {
        status: 200,
        body: sasUrl
    };
      /*  const storageConnStringParts =process.env.AZURE_STORAGE_CONNECTION_STRING.split(';');
        const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
        const storageAccountAccessKey = process.env.AZURE_STORAGE_ACCESS_KEY;
        console.log(storageAccountAccessKey);
        console.log(storageAccountName);
        const creds = new blobStorage.StorageSharedKeyCredential(storageAccountName,storageAccountAccessKey);
        const blobServiceClient = new blobStorage.BlobServiceClient(`https://${storageAccountName}.blob.core.windows.net`,creds);
        const containerName="wst-channel-docs";
        const client =blobServiceClient.getContainerClient(containerName)
        const blobName= channelFilesConfig[req.params.channel][req.params.docKey];
        const blobClient = client.getBlockBlobClient(blobName);
        const blobSAS = blobStorage.generateBlobSASQueryParameters({
        containerName, 
        blobName, 
        permissions: blobStorage.BlobSASPermissions.parse("r"), 
        startsOn: new Date(parseFloat(req.query["start"])),
        expiresOn: new Date(parseFloat(req.query["start"]) + 1*60*1000)
        },
        creds 
    ).toString();

        const sasUrl= blobClient.url+"?"+blobSAS;
        context.res = {
            status: 200,
            body: sasUrl
        }; */
    } catch (ex) {
        context.log(`********************${ex}`);
        context.res = {
            status: 500,
            body: ex
        };   
    }
}