import { html } from 'lit-element';

const template = ({ id, dropdownOptions, handleOnChange }) => {
    const getDropdownOptions = dropdownOptions => {
        return dropdownOptions.map(({ name, value, selected }) =>
            html`
            ${selected
                ? html`<option value="${value}" selected>${name}</option>`
                    : html`<option value="${value}">${name}</option>`
                }`
        );
    }

    return html`
    <select id="${id}" class="ui fluid dropdown" @change="${handleOnChange}">
        ${getDropdownOptions(dropdownOptions)}
    </select>`
};

export default template;



