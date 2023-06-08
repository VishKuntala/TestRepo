import { html } from 'lit-element';

const template = ({ id, defaultText, allowMultipleSelection }) => html`
<div id="${id}" class="ui ${allowMultipleSelection ? 'multiple' : ''}  search selection dropdown">
              <input type="hidden">
              <i class="dropdown icon"></i>
              <input type="text" class="search">
              <div class="default text">${defaultText || "Select..."}</div>
            </div>`;

export default template;