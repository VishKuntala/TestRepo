const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="four fields">
                    <div class="field">
                        <label>General Manager</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/GeneralManagers?q={query}"
                                        defaultText="Select General Manager..."
                                        datakey="generalManager" pillspriority="a" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js" allowMultipleSelection="true"
                                        pillslabel="General Manager" pillsvaluesource="text"
                                        searchDropdownId="generalManager-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Area Manager</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AreaManagers?q={query}"
                                        defaultText="Select Area Manager..."
                                        datakey="areaManager" pillspriority="b" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js" allowMultipleSelection="true"
                                        pillslabel="Area Manager" pillsvaluesource="text"
                                        searchDropdownId="areaManager-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Preferred Partner</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/PreferredPartners?q={query}"
                                        defaultText="Select Preferred Partner..."
                                        datakey="preferredPartner" pillspriority="c" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js" allowMultipleSelection="true"
                                        pillslabel="Preferred Partner" pillsvaluesource="text"
                                        searchDropdownId="preferredPartner-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Contract Type</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/ContractTypes?q={query}"
                                        defaultText="Select Contract Type..." 
                                        datakey="contractType" pillspriority="c" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js" allowMultipleSelection="true"
                                        pillslabel="Contract Type" pillsvaluesource="text"
                                        searchDropdownId="contractType-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="ui blue submit button disabled btnSubmit">Submit</div>
                <div class="ui btnClear secondary disabled button">Clear</div>
            </div>
        </div>
    </div>
</div>
<ponder-pills pillsid="pills-${id}"></ponder-pills>
`;

export { html };