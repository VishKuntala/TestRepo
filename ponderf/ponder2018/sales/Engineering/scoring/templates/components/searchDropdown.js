import { html } from 'lit-element';

const template = ({ id, defaultText, allowMultipleSelection, disabled, classNames, clearable, isSearchable }) => {
    return html`
<div id="${id}" class="ui ${allowMultipleSelection ? 'multiple' : ''}   ${disabled ? 'disabled' : ''} ${classNames ? classNames : ''} fluid ${isSearchable ? 'search' : ''} selection dropdown">
              <i class="dropdown icon"></i>
              <div class="default text">${defaultText || "Select..."}</div>
            </div>`
} ;

export default template;