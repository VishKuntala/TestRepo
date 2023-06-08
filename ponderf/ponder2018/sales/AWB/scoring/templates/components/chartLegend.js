import { html } from 'lit-element';

const template = ({ id, legends }) => html`<div id="${id}">
${ legends.map(legend => html`<div style="text-align: left; font-size:14px; padding-left:40px;padding-bottom:5px;">
    <span style="width: 12px; height: 12px; border-radius: 0%; background-color: ${legend.color}; display: inline-block; vertical-align: middle;"></></span> ${legend.name } <b><span>${legend.y}</span></b>
          </div >
        `)}
</div>`;



export default template;                            