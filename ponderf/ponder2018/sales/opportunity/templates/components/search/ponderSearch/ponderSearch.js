import { html } from "lit-element";
import './ponderSearch.css';

const template = ({ id, defaultText }) => {
    return html`
<div id="${id}" class="ui fluid search clearable selection dropdown visible">
<div class="default text">${defaultText || "Select..."}</div>
</div>`;
};

export default template;