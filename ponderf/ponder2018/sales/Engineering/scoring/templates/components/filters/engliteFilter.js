const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="five fields">
                    <div class="required field">
                        <label>Access Type</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AccessTypes?q={query}" ddValuesDataKey="byocAccessTypes"
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
                        <ponder-search-dd remoteUrl="${config.baseUrl}/ClusterNames?q={query}"
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
                        <ponder-search-dd remoteUrl="${config.baseUrl}/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode" classnames="usstates" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="State" 
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Zipcodes?q={query}"
                                        defaultText="Select Zips..."
                                        datakey="zipcode" pillspriority="d" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Simple Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/CoverageScores?q={query}"
                                        defaultText="Select Simple Coverage Score..."
                                        datakey="covScore" pillspriority="e"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Simple Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="covScore-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="five fields">                    
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/FiveGs?q={query}"
                                        defaultText="Select 5G..."
                                        datakey="fiveg" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G+ mmWave</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/FiveGPluses?q={query}"
                                        defaultText="Select 5G+ mmWave..."
                                        datakey="fivegplus" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G+ mmWave" pillsvaluesource="text"
                                        searchDropdownId="5gPlus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G+ C-Band</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/CBands?q={query}"
                                        defaultText="Select 5G+ C-Band..."
                                        datakey="cband" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G+ C-Band" pillsvaluesource="text"
                                        searchDropdownId="cband-${id}">
                        </ponder-search-dd>
                    </div>                                       
                    <div class="field">
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Band14s?q={query}"
                                        defaultText="Select Band 14..."
                                        datakey="band14" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>FNET</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Fnets?q={query}"
                                        defaultText="Select FNET..."
                                        datakey="fnet" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="FNET" pillsvaluesource="text"
                                        searchDropdownId="fnet-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="five fields">                    
                    <div class="field">
                        <label>Speed Experience</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/SpeedExperiences?q={query}"
                                        defaultText="Select Speed Experience..."
                                        datakey="speedExperience" pillspriority="r"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed Experience" pillsvaluesource="text"
                                        searchDropdownId="speedExperience-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>WBB High Speed Suitability</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Suitabilities?q={query}"
                                        defaultText="Select Wireless Broadband High Speed Suitability..."
                                        datakey="suitability" pillspriority="s"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Wireless Broadband High Speed Suitability" pillsvaluesource="text"
                                        searchDropdownId="suitability-${id}">
                        </ponder-search-dd>
                    </div>                                 
                    <div class="field">
                        <label>Roaming</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/RoamTexts?q={query}"
                                        defaultText="Select Roaming..."
                                        datakey="roamText" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Roaming" pillsvaluesource="text"
                                        searchDropdownId="roamText-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Available Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AvailCapacitys?q={query}"
                                        defaultText="Select Available Capacity..."
                                        datakey="availCapacity" pillspriority="o"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Available Capacity" pillsvaluesource="text"
                                        searchDropdownId="availCapacity-${id}">
                        </ponder-search-dd>
                    </div> 
                </div>
                <div class="five fields">                    
                    
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