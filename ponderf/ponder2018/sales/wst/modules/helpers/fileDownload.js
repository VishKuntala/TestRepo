const setCookie = (name, value, expiresInSeconds) => {
  const exdate = new Date();
  exdate.setTime(exdate.getTime() + expiresInSeconds * 1000);
  const c_value =
    escape(value) +
    (expiresInSeconds == null ? "" : "; expires=" + exdate.toUTCString());
  document.cookie = name + "=" + c_value + "; path=/";
};

const getCookie = (name) => {
  const parts = document.cookie.split(name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
};

const expireCookie = (name) => {
  document.cookie =
    encodeURIComponent(name) +
    "=; path=/; expires=" +
    new Date(0).toUTCString();
};

let downloadTimer; // reference to timer object

const startDownloadChecker = (buttonClassName, spinnerClassName, timeout) => {
  const cookieName = "DownloadCompleteChecker";
  let downloadTimerAttempts = timeout; // seconds

  setCookie(cookieName, 0, downloadTimerAttempts);

  // set timer to check for cookie every second
  downloadTimer = window.setInterval(function () {
    const cookie = getCookie(cookieName);
    // if cookie doesn't exist, or attempts have expired, re-enable form
    if (typeof cookie === "undefined" || downloadTimerAttempts == 0) {
      $("." + buttonClassName).removeAttr("disabled");
      $("." + spinnerClassName).hide();
      window.clearInterval(downloadTimer);
      expireCookie(cookieName);
    }
    downloadTimerAttempts--;
  }, 1000);
};

const startRowDownloadChecker = (
  tableName,
  buttonClassName,
  spinnerClassName,
  timeout
) => {
  const cookieName = "DownloadCompleteChecker";
  let downloadTimerAttempts = timeout; // seconds

  setCookie(cookieName, 0, downloadTimerAttempts);

  // set timer to check for cookie every second
  downloadTimer = window.setInterval(function () {
    const cookie = getCookie(cookieName);
    // if cookie doesn't exist, or attempts have expired, re-enable form
    if (typeof cookie === "undefined" || downloadTimerAttempts == 0) {
      const table = $("#" + tableName);
      const tr = table.find("tr.active");
      $(tr)
        .find("." + buttonClassName)
        .removeAttr("disabled");
      $(tr)
        .find("." + spinnerClassName)
        .hide();
      $(tr).removeClass("active");
      window.clearInterval(downloadTimer);
      expireCookie(cookieName);
    }
    downloadTimerAttempts--;
  }, 1000);
};

const downloadFile = (function () {
  const a = document.createElement("a");
  document.body.appendChild(a);
  a.style = "display: none";
  return function (data, fileName) {
    const blob = new Blob([data], { type: "octet/stream" }),
      url = window.URL.createObjectURL(blob);
    a.href = url;
    a.download = fileName;
    a.click();
    window.URL.revokeObjectURL(url);
  };
})();

export { startDownloadChecker, startRowDownloadChecker, downloadFile };
