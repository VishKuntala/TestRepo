import { html } from 'lit-element';

const template = ({ id }) => html`
<div id="${id}" class="ui multiple search selection dropdown">
              <input type="hidden">
              <i class="dropdown icon"></i>
              <input type="text" class="search">
              <div class="default text">Select...</div>
            </div>`;

export default template;