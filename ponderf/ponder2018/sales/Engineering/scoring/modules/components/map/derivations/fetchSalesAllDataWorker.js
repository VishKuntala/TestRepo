


onmessage = function (e) {
    
    const xhr = new XMLHttpRequest();
    const requestComplete = () => {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                postMessage(response.d);
            }
        }
    }
    xhr.open('post', `${e.data.baseUrl}/SalesTableData`);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.onreadystatechange = requestComplete;
    xhr.send(JSON.stringify(e.data.postData));
}