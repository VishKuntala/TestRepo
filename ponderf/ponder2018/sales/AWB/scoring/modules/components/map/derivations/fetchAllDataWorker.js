﻿


onmessage = function (e) {
    
    console.log('Worker: Message received from main script');
    console.log(e);
    const xhr = new XMLHttpRequest();
    const requestComplete = () => {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                console.log(response);
                postMessage(response.d);
            }
        }
    }
    xhr.open('post', `${e.data.baseUrl}/TableData`);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.onreadystatechange = requestComplete;
    xhr.send(JSON.stringify(e.data.postData));
}