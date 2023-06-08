const exitFullScreen = () => {
    if ($(".leaflet-control-zoom-fullscreen")[0].title == 'Exit Full Screen') {
        $(".leaflet-control-zoom-fullscreen")[0].click();
    };
    const cmaModalMap = $("#CMAModalMap .leaflet-control-zoom-fullscreen")[0];
    const countyModalMap = $("#CountyModalMap .leaflet-control-zoom-fullscreen")[0];
    const zipModalMap = $("#ZipModalMap .leaflet-control-zoom-fullscreen")[0];

    if (typeof cmaModalMap !== "undefined") {
        if ($("#CMAModalMap .leaflet-control-zoom-fullscreen")[0].title == 'Exit Full Screen') {
            $("#CMAModalMap .leaflet-control-zoom-fullscreen")[0].click();
        };
    }
    if (typeof countyModalMap !== "undefined") {
        if ($("#CountyModalMap .leaflet-control-zoom-fullscreen")[0].title == 'Exit Full Screen') {
            $("#CountyModalMap .leaflet-control-zoom-fullscreen")[0].click();
        };
    }
    if (typeof zipModalMap !== "undefined") {
        if ($("#ZipModalMap .leaflet-control-zoom-fullscreen")[0].title == 'Exit Full Screen') {
            $("#ZipModalMap .leaflet-control-zoom-fullscreen")[0].click();
        };
    }
};

const disableMarketDropdownOptions = () => {
    $("#ddlMarket option").map(function () {
        if ($(this).text().trim() == "----------") {
            $(this).attr("disabled", "disabled");
        }
    });
}

export { exitFullScreen, disableMarketDropdownOptions };

