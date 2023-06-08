import * as R from 'ramda';

const buildPayloadFromStore =  instance => {
    let postData = {};
    for (let i = 0; i < instance.store.config.filter.dataKeys.length; i += 1) {
        const dataKey = instance.store.config.filter.dataKeys[i];
        if (!R.includes(dataKey, instance.store.config.filter.singularValueDataKeys)) {
            postData[dataKey] = instance.store[dataKey] ? ('\'' + instance.store[dataKey].split(',').join('\',\'') + '\'').replaceAll('^', ',') : ""
        } else {
            postData[dataKey] = instance.store[dataKey] || "";
        }
    }
    if (instance.store.config.searchSelector) {
        for (let i = 0; i < instance.store.config.searchSelector.dataKeys.length; i += 1) {
            const dataKey = instance.store.config.searchSelector.dataKeys[i];
            postData[dataKey] = instance.store[dataKey] || "";
        }
    }
    const sortCriteriaItem = R.find(R.propEq('value', (instance.store.sortCriteria || instance.store.config.startingSortCriteria)))(instance.store.config.sortCriteriaData);
    postData.sortDirection = sortCriteriaItem && sortCriteriaItem.sortDirection ? sortCriteriaItem.sortDirection : 'DESC';
    postData.sortCriteria = instance.store.sortCriteria || instance.store.config.startingSortCriteria || "";
    postData = Object.assign(postData, { "channelCode": instance.store.channelCode, "nsbId": instance.store.nsbId || ""  });
    return postData;
}

export { buildPayloadFromStore };
