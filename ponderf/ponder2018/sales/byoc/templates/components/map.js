import { html } from 'lit-element';

const template = ({id}) => html`<div class="ui fluid container segment">
                                <div subscriptions="mapData" class="ponder-map" id="${id}"></div>
                            </div>`;

export default template;                            