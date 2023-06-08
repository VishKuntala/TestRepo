import { html } from 'lit-element';

const template = ({ id, defaultText, textLabel , disabled,  }) => {
    return html`
            <div class='ui input ${disabled ? 'disabled' : ''}'>
                <input id="${id}" placeholder='${defaultText || ""}' />
            </div>`
};

export default template;