import { html } from 'lit-element';

const template = ({ id, headers, rows }) => html`<table id="${id}" class="ui celled table responsive nowrap unstackable">
  <thead>
<tr>
${ headers.map(header => html`<th class="center aligned">${header}</th>`)}
</tr>
  </thead>
 
</table>`;

export default template;                            