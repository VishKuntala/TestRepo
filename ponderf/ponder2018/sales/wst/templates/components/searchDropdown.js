import { html } from 'lit-element';

const template = ({ id, defaultText, allowMultipleSelection, disabled, classNames, clearable, isSearchable, selectable }) => {
    return html`
<div id="${id}" class="ui ${allowMultipleSelection ? 'multiple' : ''}   ${disabled ? 'disabled' : ''} ${classNames ? classNames : ''} fluid ${isSearchable ? 'search' : ''} selection dropdown">
              ${selectable ? html`<i class="dropdown icon"></i>` : html``}
              <div class="default text">${defaultText || "Select..."}</div>
            </div>`
} ;

export default template;