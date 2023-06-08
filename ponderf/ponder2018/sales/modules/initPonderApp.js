import createMaskCanvas from './createMaskCanvas.js';
import { closest } from './closestLocation.js';
import getPsaDetail from './getPsaDetail.js';
import { showHideLayers, getMapOverlaysData, resetMapOverlaysData, rebuildMapOverlaysData, hideAllLayers } from './mapLayers.js';
import * as markerTypes from "./markerTypes/index.js";
import {
    startDownloadChecker,
    startRowDownloadChecker,
    downloadFile
} from "./helpers/fileDownload.js";
import { updateOverlaysLabel } from "./helpers/layersControl.js";
import { getExportToExcelData } from "./services/exportToExcel.js";
import { logUIEvent, logAcknowledge } from "./services/logger.js";
import { getJsonData } from "./services/jsonData.js";
import { heatMapConfig, setHeatMapSummary, getHeatMapSummary } from './heatMapConfig.js';
import { exitFullScreen, disableMarketDropdownOptions } from "./helpers/common.js";
import { displayPSAData, displayFuturePSAData } from './searchModal.js';
import { showLimitedUserData } from './limitedUserShowModal.js';

const ponderApp = {
    createMaskCanvas,
    showHideLayers,
    closest,
    getPsaDetail,
    getMapOverlaysData,
    markerTypes,
    startDownloadChecker,
    startRowDownloadChecker,
    downloadFile,
    updateOverlaysLabel,
    getExportToExcelData,
    getJsonData,
    resetMapOverlaysData,
    rebuildMapOverlaysData,
    hideAllLayers,
    heatMapConfig,
    setHeatMapSummary,
    getHeatMapSummary,
    exitFullScreen,
    disableMarketDropdownOptions,
    displayPSAData,
    displayFuturePSAData,
    showLimitedUserData,
    logUIEvent,
    logAcknowledge
};

export default ponderApp;   
