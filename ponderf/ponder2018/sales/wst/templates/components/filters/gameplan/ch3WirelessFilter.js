const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <h4 class="ui horizontal divider header">
                    <i class="building icon"></i>
                    Building Location Filters
                </h4>
                <div class="four fields">
                    <div class="required field">
                        <label>Sales Market</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/SalesMarkets?q={query}"
                                        defaultText="Select Sales Market..." pillslabel="Sales Market" pillsvaluesource="text"
                                        datakey="salesMarket" pillspriority="a" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        searchDropdownId="salesMarket-${id}">
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
                                        defaultText="Select State..." searchable="true"
                                        datakey="statecode" classnames="usstates" pillspriority="d"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="State" pillsvaluesource="text"
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
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
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CoverageScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..." searchable="true"
                                        datakey="indoorCovScore" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGs?q={query}"
                                        defaultText="Select 5G..." searchable="true"
                                        datakey="fiveg" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G Plus C-Band</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CBands?q={query}"
                                        defaultText="Select C Band..." searchable="true"
                                        datakey="fivegplusCbandIcs" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="C Band" pillsvaluesource="text"
                                        searchDropdownId="cband-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G Plus mmWave</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGPluses?q={query}"
                                        defaultText="Select 5G Plus..." searchable="true"
                                        datakey="fivegplusMmwave" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G Plus" pillsvaluesource="text"
                                        searchDropdownId="5gplus-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>FNET</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FNets?q={query}"
                                        defaultText="Select FNET..." searchable="true"
                                        datakey="fnet" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="FNET" pillsvaluesource="text"
                                        searchDropdownId="fnet-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Band14s?q={query}"
                                        defaultText="Select Band 14..." searchable="true"
                                        datakey="band14" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Available Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AvailCapacities?q="
                                        defaultText="Select Available Capacity..." searchable="true"
                                        datakey="availCapacity" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Available Capacity" pillsvaluesource="text"
                                        searchDropdownId="availCapacity-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Mobile Peak Speed</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/SpeedExperiences?q={query}"
                                        defaultText="Select Speed Experiences..." searchable="true"
                                        datakey="speedExperienceIcs" pillspriority="m"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed Experience" pillsvaluesource="text"
                                        searchDropdownId="speedExperienceIcs-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Wireless Broadband Suitability</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Suitabilities?q={query}"
                                        defaultText="Select Suitability..." searchable="true"
                                        datakey="wbbSuitabilityIcs" pillspriority="n"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Suitability" pillsvaluesource="text"
                                        searchDropdownId="wbbSuitabilityIcs-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Fiber Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiberStatuses?q="
                                        defaultText="Select Fiber Status..." searchable="true"
                                        datakey="fiberStatus" pillspriority="o"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Status" pillsvaluesource="text"
                                        searchDropdownId="fiberStatus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Newly Lit Building</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/NewlyLits?q="
                                        defaultText="Select Newly Lit..." searchable="true"
                                        datakey="newlyLit" pillspriority="r"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Newly Lit" pillsvaluesource="text"
                                        searchDropdownId="newlylit-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label class="blueLabel">Building First Lit Date</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FirstLits?q="
                                        defaultText="Select First Lit Date..." searchable="true"
                                        datakey="firstLit" pillspriority="s"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Building First Lit Date" pillsvaluesource="text"
                                        searchDropdownId="firstlit-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Multi-Gig</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiGigs?q="
                                        defaultText="Select Multi-Gig..." searchable="true"
                                        datakey="multigig" pillspriority="t"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Multi-Gig" pillsvaluesource="text"
                                        searchDropdownId="multigig-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Multi Tenant</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiTenants?q="
                                        defaultText="Select Multi Tenant..." searchable="true"
                                        datakey="multiTenant" pillspriority="u"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Multi Tenant" pillsvaluesource="text"
                                        searchDropdownId="multiTenant-${id}">
                        </ponder-search-dd>
                    </div>
                </div>



                <h4 class="ui horizontal divider header">
                    <i class="address card outline icon"></i>
                    Business Tenant Filters
                </h4>

                <div class="four fields">
                    <div class="field">
                        <label>Owning Segment Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/OwningSegNames?q={query}"
                                        defaultText="Select Owning Segment Name..." searchable="true"
                                        datakey="owningSegName" pillspriority="v"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Owning Segment Name" pillsvaluesource="text"
                                        searchDropdownId="owningSegName-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Owning Module</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/OwningModuleSpecials?q="
                                        defaultText="Select Owning Module..." searchable="true"
                                        datakey="owningModuleSpecial" pillspriority="w"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Owning Module" pillsvaluesource="text"
                                        searchDropdownId="owningModuleSpecial-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Customer Prospect</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/LocCustProsps?q="
                                        defaultText="Select Customer or Prospect..." searchable="true"
                                        datakey="locCustProsp" pillspriority="x"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Customer Prospect" pillsvaluesource="text"
                                        searchDropdownId="locCustProsp-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Total Fiber Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TotFiberPorts?q="
                                        defaultText="Select Total Fiber Ports..." searchable="true"
                                        datakey="totFiberPort" pillspriority="y"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Total Fiber Ports" pillsvaluesource="text"
                                        searchDropdownId="totFiberPort-${id}">
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