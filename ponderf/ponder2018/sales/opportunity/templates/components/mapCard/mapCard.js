import { html } from "lit-element";
import { CONSTANTS } from "../../../constants/constants";
import "./mapCard.css";

const template = ({
    mapCardAreaInfo,
    mapCardAreaHeader,
    mapCardPointInfo,
    mapCardPointHeader,
}) => {
    const hideCards = mapCardAreaHeader ? "" : "hideCard";
    const getCardInfo = info =>
        info?.length
            ? info.map(({ label, property }) => {
                  return html`<div><span class='ponder-label'>${label}:</span><span>${property}</span></div>`;
              })
            : CONSTANTS.MAP_AREA_INFO_HELP;

    return html`
        <div class=${`ponder-ui-layer-container ponder-ui-layer-information ${hideCards}`}>
            <div class="ui raised vertical accordion menu areas">
                <div class="item">
                    <a class="active title">
                        <h4>${mapCardAreaHeader}</h4>
                        <i class="minus icon"></i>
                    </a>
                    <div class="active content">
                        ${getCardInfo(mapCardAreaInfo)}
                    </div>
                </div>
            </div>
            <div class="ui raised vertical accordion menu points ${mapCardPointHeader ? '' : 'hideCard'}">
                <div class="item">
                    <a class="active title">
                        <h4>${mapCardPointHeader}</h4>
                        <i class="minus icon"></i>
                    </a>
                    <div class="active content">
                        ${getCardInfo(mapCardPointInfo)}
                    </div>
                </div>
            </div>
        </div>
    `;
};

export default template;
