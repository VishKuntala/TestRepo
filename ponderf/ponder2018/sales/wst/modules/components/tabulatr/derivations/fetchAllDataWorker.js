
onmessage = function (e) {
    const xhr = new XMLHttpRequest();
    const requestComplete = () => {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                postMessage(response.data);
            }
        }
    }
    xhr.open('post', e.data.ajaxURL);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.setRequestHeader("Authorization", e.data.authToken)
    xhr.onreadystatechange = requestComplete;
    xhr.send(JSON.stringify(e.data.postData));
}