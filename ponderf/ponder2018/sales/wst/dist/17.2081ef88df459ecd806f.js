(self.webpackChunkleafletapp=self.webpackChunkleafletapp||[]).push([[17],{8017:()=>{onmessage=function(e){console.log("Worker: Message received from main script"),console.log(e);var a=new XMLHttpRequest;a.open("post","".concat(e.data.baseUrl,"/TableData")),a.setRequestHeader("Content-Type","application/json;charset=UTF-8"),a.onreadystatechange=function(){if(a.readyState===XMLHttpRequest.DONE&&200===a.status){var e=JSON.parse(a.responseText);console.log(e),postMessage(e.d)}},a.send(JSON.stringify(e.data.postData))}}}]);