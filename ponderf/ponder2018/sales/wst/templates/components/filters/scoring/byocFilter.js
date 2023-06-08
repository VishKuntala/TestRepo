const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="four fields">
                    <div class="required field">
                        <label>Access Type</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AccessTypes?q={query}" ddValuesDataKey="byocAccessTypes"
                                         clearable="false" requeryonselect="true"
                                         initialselectedtext="All" initialselectedvalue="all"
                                        defaultText="Select Access Type..." pillslabel="Access Type"
                                        pillsvaluesource="text"
                                        datakey="accessType" pillspriority="a"
                                        derivation="filterDropdown/filterDropdown.js"
                                        searchDropdownId="accessType-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="required field">
                        <label>Cluster Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/ClusterNames?q={query}"
                                        datakey="clusterId" pillspriority="b" 
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" searchable="true"
                                        defaultText="Select Cluster Name..." pillslabel="Cluster Name" 
                                        pillsvaluesource="text"
                                        searchDropdownId="clusterId-${id}">
                        </ponder-search-dd>
                    </div>                    
                    <div class="field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode" classnames="usstates" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="State" 
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Zipcodes?q={query}"
                                        defaultText="Select Zips..."
                                        datakey="zipcode" pillspriority="d" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CoverageScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..."
                                        datakey="indoorCovScore" pillspriority="e"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGs?q={query}"
                                        defaultText="Select 5G..."
                                        datakey="fiveg" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Speed/Avail Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TputTexts?q={query}"
                                        defaultText="Select Speed/Avail Capacity..."
                                        datakey="tputText" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed/Avail Capacity" pillsvaluesource="text"
                                        searchDropdownId="tputText-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>FNET</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Fnets?q={query}"
                                        defaultText="Select FNET..."
                                        datakey="fnet" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="FNET" pillsvaluesource="text"
                                        searchDropdownId="fnet-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Band14s?q={query}"
                                        defaultText="Select Band 14..."
                                        datakey="band14" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Suitability</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Suitabilities?q={query}"
                                        defaultText="Select Suitability..."
                                        datakey="wbbSuitabilityIcs" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Suitability" pillsvaluesource="text"
                                        searchDropdownId="wbbSuitabilityIcs-${id}">
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