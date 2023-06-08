import { html } from "lit-element";

const template = ({
    id,
    defaultText,
    allowMultipleSelection,
    disabled,
    classNames,
    isSearchable,
}) => {
    const dropdownClasses = `
        ui
        ${allowMultipleSelection ? "multiple" : ""}
        ${disabled ? "disabled" : ""} 
        ${classNames ? classNames : ""} 
        fluid
        ${isSearchable ? "search" : ""}
        selection
        dropdown
    `;

    return html`
        <div id="${id}" class="${dropdownClasses}">
            <i class="dropdown icon"></i>
            <div class="default text">${defaultText || "Select..."}</div>
        </div>
    `;
};

export default template;
