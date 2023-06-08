import { html } from 'lit-element';

const template = ({ id }) => html`<div id="${id}" class="ui fluid container segment">
<div class="ui one column padded grid"></div>
    <div class="row">
        <div class="column">
            <div  class="ui fluid form">
                   <div class="content field">
                
                            <div class="field">
                                <label>Market</label>
                               <ponder-search-dd storeDataKey="markets"   
                                                defaultText="Select to populate list..." 
                                                searchDropdownId="markets-${id}" > 
                                </ponder-search-dd>
                            </div>
                
                    </div>
               <div class="ui secondary submit button">Submit</div>
            </div>
        </div>
    </div>
</div>`;

export default template;