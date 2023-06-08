import { html } from "lit-element";
import "./devTools.css";

const template = ({
    currentZoom,
    closeTools,
}) => {

    return html`
        <div class='ponder-dev-tools'>
           <p>Zoom: ${currentZoom}</p>
           <button class='ui button' @click="${closeTools}">Close</button>
        </div>
    `;
};

export default template;
