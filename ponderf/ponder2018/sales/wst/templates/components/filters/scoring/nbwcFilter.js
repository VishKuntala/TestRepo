const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="four fields">
                    <div class="required field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode"  pillspriority="a"
                                        derivation="filterDropdown/filterDropdown.js"
                                        allowMultipleSelection="false" pillslabel="State" 
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Zipcodes?q={query}"
                                        defaultText="Select Zips..." searchable="true"
                                        datakey="zipcode" pillspriority="b"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Campaign Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Campaigns?q={query}"
                                        defaultText="Select Campaign..." searchable="true"
                                        datakey="campaignIds" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" disabled="true" pillslabel="Campaign Name" pillsvaluesource="text"
                                        searchDropdownId="campaignNames-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CoverageScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..."
                                        datakey="indoorCovScore" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGs?q={query}"
                                        defaultText="Select 5G..."
                                        datakey="fiveg" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Band14s?q={query}"
                                        defaultText="Select Band 14..."
                                        datakey="band14" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Speed/Avail Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TputTexts?q={query}"
                                        defaultText="Select Speed/Avail Capacity..."
                                        datakey="tputText" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed/Avail Capacity" pillsvaluesource="text"
                                        searchDropdownId="tputText-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Roaming Dependency</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/RoamingDependencies?q={query}"
                                        defaultText="Select Roaming Dependency..."
                                        datakey="roamingDependency" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Roaming" pillsvaluesource="text"
                                        searchDropdownId="roamingDependency-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Legacy Device Penetration</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/LegacyPens?q={query}"
                                        defaultText="Select Legacy Device Penetration..."
                                        datakey="legacyPen" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Legacy Device Pen" pillsvaluesource="text"
                                        searchDropdownId="legacyPen-${id}">
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