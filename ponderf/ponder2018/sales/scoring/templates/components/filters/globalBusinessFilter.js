const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="five fields">
                    <div class="required field">
                        <label>Industry</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Industries?q={query}"
                                        defaultText="Select Industry..."
                                        datakey="industry"  pillspriority="a" searchable="true"
                                        derivation="filterDropdown/filterDropdown.js"
                                        allowMultipleSelection="false" pillslabel="Industry"
                                        searchDropdownId="industry-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>SVID</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/SVNames?q={query}"
                                        defaultText="Select SVIDs..."
                                        datakey="svIds" pillspriority="b" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="SVID"
                                        searchDropdownId="svIds-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Company Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/CompanyNames?q={query}"
                                        defaultText="Select Company Names..."
                                        datakey="companyNames" pillspriority="c" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Company Name"
                                        searchDropdownId="companyNames-${id}">
                        </ponder-search-dd>
                    </div>                    
                    <div class="field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/States?q={query}"
                                        defaultText="Select States..."
                                        datakey="statecode" pillspriority="d"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="State"
                                        searchDropdownId="statecode-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Zipcodes?q={query}"
                                        defaultText="Select Zips..."
                                        datakey="zipcode" pillspriority="e" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="five fields">
                    
                    <div class="field">
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/IndoorCovScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..."
                                        datakey="indoorCovScore" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/FiveGs?q={query}"
                                        defaultText="Select 5G..."
                                        datakey="fiveg" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>                    
                    <div class="field">
                        <label>Speed Experience</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/SpeedExperiences?q={query}"
                                        defaultText="Select Speed Experience..."
                                        datakey="speedExperience" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed Experience" pillsvaluesource="text"
                                        searchDropdownId="speedExperience-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Available Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AvailCapacitys?q={query}"
                                        defaultText="Select Available Capacity..."
                                        datakey="availCapacity" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Available Capacity" pillsvaluesource="text"
                                        searchDropdownId="availCapacity-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Roaming Dependency</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/RoamingDependencies?q={query}"
                                        defaultText="Select Roaming Dependency..."
                                        datakey="roamingDependency" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Roaming" pillsvaluesource="text"
                                        searchDropdownId="roamingDependency-${id}">
                        </ponder-search-dd>
                    </div>                    
                </div>
                <div class="five fields">
                    <div class="field">
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Band14s?q={query}"
                                        defaultText="Select Band 14..."
                                        datakey="band14" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Fiber Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/FiberStatuses?q={query}"
                                        defaultText="Select Fiber Status..."
                                        datakey="fiberStatus" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Status" pillsvaluesource="text"
                                        searchDropdownId="fiberStatus-${id}">
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