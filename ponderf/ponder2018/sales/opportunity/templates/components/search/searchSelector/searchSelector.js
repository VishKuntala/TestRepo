import { html } from "lit-element";

const template = ({ id }) => {
    return html`
        <select id="${id}" name="Address Search" class="ui fluid search dropdown">
         </select>
    `;
};

export default template;
