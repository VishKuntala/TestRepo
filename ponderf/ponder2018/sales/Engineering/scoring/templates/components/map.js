import { html } from 'lit-element';

const template = ({ id }) => html`<div class="ui fluid map container segment">
                                <div  class="ponder-map" id="${id}"></div>
                                <div id="psaFooterUnlimited" style="text-align: center; color: #343a40; font-size: 12px;">                                    
                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #e6b800; display: inline-block; vertical-align: middle;"></></span> Very Weak
                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #ffff00; display: inline-block; vertical-align: middle;"></></span> Uneven
                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #00cc00; display: inline-block; vertical-align: middle;"></></span> Strong
                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #008000; display: inline-block; vertical-align: middle;"></></span> Very Strong
                                    <span style="width: 12px; height: 12px; border-radius: 50%; background-color: #003300; display: inline-block; vertical-align: middle;"></></span> Best
                                </div>
                            </div>`;

export default template;                            