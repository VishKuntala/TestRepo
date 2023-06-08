const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="five fields">
                    <div class="required field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode"  pillspriority="a"
                                        derivation="filterDropdown/filterDropdown.js"
                                        allowMultipleSelection="false" pillslabel="State" 
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="required field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Zipcodes?q={query}"
                                        defaultText="Select Zip..." searchable="true"
                                        datakey="zipcode" pillspriority="b"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Network Build Type</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/NetworkBuildTypes?q={query}"
                                        defaultText="Select Network Build Type..." searchable="true"
                                        datakey="networkbuildtype" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Network Build Type" pillsvaluesource="text"
                                        searchDropdownId="networkbuildtype-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                
                <div class="ui blue submit button disabled btnSubmit">Submit</div>
                <div class="ui btnClear secondary disabled button">Clear</div>
            </div>
        </div>
    </div>
   </div>
   <ponder-pills pillsid="pills-${id}"></ponder-pills>`;

export { html };