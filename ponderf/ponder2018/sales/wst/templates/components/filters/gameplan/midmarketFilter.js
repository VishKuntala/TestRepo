﻿const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="four fields">
                    <div class="field">
                        <label>Sales Market</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/SalesMarkets?q={query}"
                                        defaultText="Select Sales Market..." pillslabel="Sales Market" pillsvaluesource="text"
                                        datakey="salesMarket" pillspriority="a" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        searchDropdownId="salesMarket-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Archetype</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/ArcheTypes?q={query}"
                                        defaultText="Select Archetype..."
                                        datakey="archetype" pillspriority="b"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Archetype" pillsvaluesource="text"
                                        searchDropdownId="archetype-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>DMA</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/DMAs?q={query}"
                                        defaultText="Select DMA..." pillslabel="DMA" pillsvaluesource="text"
                                        datakey="dmaName" pillspriority="c" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"
                                        searchDropdownId="dmaName-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode" classnames="usstates" pillspriority="d"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="State" pillsvaluesource="text"
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Zipcodes?q={query}"
                                        defaultText="Select Zips..." searchable="true"
                                        datakey="zipcode" pillspriority="e"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
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
                        <label>5G Plus C-Band</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CBands?q={query}"
                                        defaultText="Select C Band..."
                                        datakey="fivegplusCbandIcs" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="C Band" pillsvaluesource="text"
                                        searchDropdownId="cband-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>5G Plus mmWave</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGPluses?q={query}"
                                        defaultText="Select 5G Plus..."
                                        datakey="fivegplusMmwave" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G Plus" pillsvaluesource="text"
                                        searchDropdownId="5gplus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>FNET</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FNets?q={query}"
                                        defaultText="Select FNET..."
                                        datakey="fnet" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="FNET" pillsvaluesource="text"
                                        searchDropdownId="fnet-${id}">
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
                        <label>Available Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AvailCapacities?q="
                                        defaultText="Select Available Capacity..."
                                        datakey="availCapacity" pillspriority="p"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Available Capacity" pillsvaluesource="text"
                                        searchDropdownId="availCapacity-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Mobile Peak Speed</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/SpeedExperiences?q={query}"
                                        defaultText="Select Speed Experiences..."
                                        datakey="speedExperienceIcs" pillspriority="m"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed Experience" pillsvaluesource="text"
                                        searchDropdownId="speedExperienceIcs-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Wireless Broadband Suitability</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Suitabilities?q={query}"
                                        defaultText="Select Suitability..."
                                        datakey="wbbSuitabilityIcs" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Suitability" pillsvaluesource="text"
                                        searchDropdownId="wbbSuitabilityIcs-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Fiber Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiberStatuses?q="
                                        defaultText="Select Fiber Status..."
                                        datakey="fiberStatus" pillspriority="p"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Status" pillsvaluesource="text"
                                        searchDropdownId="fiberStatus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Multi-Gig</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiGigs?q="
                                        defaultText="Select Multi-Gig..."
                                        datakey="multigig" pillspriority="o"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Multi-Gig" pillsvaluesource="text"
                                        searchDropdownId="multigig-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>BB Eligible Max Speed</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/EligibleMaxSpeeds?q={query}"
                                        defaultText="Select BB Eligible Max Speed..."
                                        datakey="bbEligibleMaxSpeed" pillspriority="q"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="BB Eligible Max Speed" pillsvaluesource="text"
                                        searchDropdownId="bbEligibleMaxSpeed-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Fiber Competitor - Any</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AnyFiberCompetitors?q="
                                        defaultText="Select Fiber Competitor - Any..."
                                        datakey="anyFiberCompetitor" pillspriority="r"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Competitor - Any" pillsvaluesource="text"
                                        searchDropdownId="anyFiberCompetitor-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Multi Tenant</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiTenants?q="
                                        defaultText="Select Multi Tenant..."
                                        datakey="multiTenant" pillspriority="s"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Multi Tenant" pillsvaluesource="text"
                                        searchDropdownId="multiTenant-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Customers at Location</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CustomersAtLocation?q="
                                        defaultText="Select Customers at Location..."
                                        datakey="customersAtLocation" pillspriority="t"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Customers at Location" pillsvaluesource="text"
                                        searchDropdownId="customersAtLocation-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Total Opportunities at Location</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TotalOpportunities?q={query}"
                                        defaultText="Select Total Opportunities at Location..."
                                        datakey="totalOppsAtLocation" pillspriority="u"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Total Opportunities at Location" pillsvaluesource="text"
                                        searchDropdownId="totalOppsAtLocation-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Total Opportunities at Location (Large)</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TotalLargeOpportunities?q="
                                        defaultText="Select Total Opportunities at Location (Large)..."
                                        datakey="totalLargeOppsAtLocation" pillspriority="v"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Total Opportunities at Location (Large)" pillsvaluesource="text"
                                        searchDropdownId="totalLargeOppsAtLocation-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>ATT Ookla Quantile</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AttOoklaQs?q={query}"
                                        defaultText="Select ATT Ookla Quantile..."
                                        datakey="attOoklaQ" pillspriority="w"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="ATT Ookla Quantile" pillsvaluesource="text"
                                        searchDropdownId="attOoklaQ-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>TMO Ratio Ookla</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TmoRatioOoklas?q={query}"
                                        defaultText="Select TMO Ratio Ookla..."
                                        datakey="tmoRatioOokla" pillspriority="x"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="TMO Ratio Ookla" pillsvaluesource="text"
                                        searchDropdownId="tmoRatioOokla-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>VZN Ratio Ookla</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/VznRationOoklas?q={query}"
                                        defaultText="Select VZN Ration Ookla..."
                                        datakey="vznRatioOokla" pillspriority="y"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="VZN Ration Ookla" pillsvaluesource="text"
                                        searchDropdownId="vznRatioOokla-${id}">
                        </ponder-search-dd>
                    </div>                    
                    <div class="field">
                        <label>Median Household Income</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MedIncomes?q={query}"
                                        defaultText="Select Median Income..."
                                        datakey="medIncome" pillspriority="za"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Median Income" pillsvaluesource="text"
                                        searchDropdownId="medIncome-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Owning Module</label>
                        <ponder-search-textbox 
                                        defaultText=""
                                        datakey="owningModule" pillspriority="zb"
                                        pillslabel="Owning Module" pillsvaluesource="text"
                                        searchtextboxid="owningModule-${id}">
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