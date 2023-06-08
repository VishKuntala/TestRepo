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
                        <label>PSA</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Psas?q={query}"
                                        defaultText="Select PSA..." searchable="true"
                                        datakey="psa" pillspriority="r"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="PSA" pillsvaluesource="text"
                                        searchDropdownId="psa-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Store ID</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/LocationIds?q={query}"
                                        defaultText="Select Store ID..." searchable="true" extdataurl="store/location?locationId="
                                        datakey="locationId" pillspriority="s"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Store ID" pillsvaluesource="text"
                                        searchDropdownId="locationid-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Wireline Customers at Location</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/WirelineCustomers?q="
                                        defaultText="Select Wireline Customers at Location..." searchable="true"
                                        datakey="wirelineCust" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Wireline Customers at Location" pillsvaluesource="text"
                                        searchDropdownId="wirelineCust-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Non-Wireline Customers at Location</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/NonWirelineCustomers?q="
                                        defaultText="Select Non-Wireline Customers at Location..." searchable="true"
                                        datakey="nonWirelineCust" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Non-Wireline Customers at Location" pillsvaluesource="text"
                                        searchDropdownId="nonWirelineCust-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Total Wireline Opportunities at Location</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TotalWirelineOpportunities?q={query}"
                                        defaultText="Select Total Wireline Opportunities at Location..." searchable="true"
                                        datakey="totalWirelineOpps" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Total Wireline Opportunities at Location" pillsvaluesource="text"
                                        searchDropdownId="totalWirelineOpps-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>Fiber Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiberStatuses?q="
                                        defaultText="Select Fiber Status..." searchable="true"
                                        datakey="fiberStatus" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Status" pillsvaluesource="text"
                                        searchDropdownId="fiberStatus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label class="blueLabel">Newly Lit Building</label>
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
                    <div class="field">
                        <label>Future Fiber Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FutureFiberStatuses?q={query}"
                                        defaultText="Select Future Fiber Status..." searchable="true"
                                        datakey="futureFiberStatus" pillspriority="t"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Future Fiber Status" pillsvaluesource="text"
                                        searchDropdownId="futureFiberStatus-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>Multi-Gig</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiGigs?q="
                                        defaultText="Select Multi-Gig..." searchable="true"
                                        datakey="multigig" pillspriority="u"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Multi-Gig" pillsvaluesource="text"
                                        searchDropdownId="multigig-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>BB Eligible Max Speed</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/EligibleMaxSpeeds?q={query}"
                                        defaultText="Select BB Eligible Max Speed..." searchable="true"
                                        datakey="bbEligibleMaxSpeed" pillspriority="v"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="BB Eligible Max Speed" pillsvaluesource="text"
                                        searchDropdownId="bbEligibleMaxSpeed-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Multi Tenant</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiTenants?q="
                                        defaultText="Select Multi Tenant..." searchable="true"
                                        datakey="multiTenant" pillspriority="w"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Multi Tenant" pillsvaluesource="text"
                                        searchDropdownId="multiTenant-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Fiber Competitor - Any</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AnyFiberCompetitors?q="
                                        defaultText="Select Fiber Competitor - Any..." searchable="true"
                                        datakey="anyFiberCompetitor" pillspriority="x"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Competitor - Any" pillsvaluesource="text"
                                        searchDropdownId="anyFiberCompetitor-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CoverageScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..." searchable="true"
                                        datakey="indoorCovScore" pillspriority="y"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGs?q={query}"
                                        defaultText="Select 5G..." searchable="true"
                                        datakey="fiveg" pillspriority="z"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G Plus C-Band</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CBands?q={query}"
                                        defaultText="Select C Band..." searchable="true"
                                        datakey="fivegplusCbandIcs" pillspriority="za"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="C Band" pillsvaluesource="text"
                                        searchDropdownId="cband-${id}">
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
                                        datakey="owningSegName" pillspriority="zb"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Owning Segment Name" pillsvaluesource="text"
                                        searchDropdownId="owningSegName-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Owning Module</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/OwningModuleSpecials?q="
                                        defaultText="Select Owning Module..." searchable="true"
                                        datakey="owningModuleSpecial" pillspriority="zc"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Owning Module" pillsvaluesource="text"
                                        searchDropdownId="owningModuleSpecial-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Customer Prospect</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/LocCustProsps?q="
                                        defaultText="Select Customer or Prospect..." searchable="true"
                                        datakey="locCustProsp" pillspriority="zd"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Customer Prospect" pillsvaluesource="text"
                                        searchDropdownId="locCustProsp-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>Total Fiber Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/TotFiberPorts?q="
                                        defaultText="Select Total Fiber Ports..." searchable="true"
                                        datakey="totFiberPort" pillspriority="ze"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Total Fiber Ports" pillsvaluesource="text"
                                        searchDropdownId="totFiberPort-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>ADI Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AdiPorts?q="
                                        defaultText="Select ADI Ports..." searchable="true"
                                        datakey="adiPort" pillspriority="zf"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="ADI Ports" pillsvaluesource="text"
                                        searchDropdownId="adiPort-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>ABF Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/AbfPorts?q={query}"
                                        defaultText="Select ABF Ports..." searchable="true"
                                        datakey="abfPort" pillspriority="zg"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="ABF Ports" pillsvaluesource="text"
                                        searchDropdownId="abfPort-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>GPON Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/GponPorts?q="
                                        defaultText="Select GPON Ports..." searchable="true"
                                        datakey="gponPort" pillspriority="zh"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="GPON Ports" pillsvaluesource="text"
                                        searchDropdownId="gponPort-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>U-Verse Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/BbUversePorts?q="
                                        defaultText="Select U-Verse Ports..." searchable="true"
                                        datakey="bbUversePort" pillspriority="zi"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="U-Verse Ports" pillsvaluesource="text"
                                        searchDropdownId="bbUversePort-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>IPDSL Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/BbIpdslPorts?q="
                                        defaultText="Select IPDSL Ports..." searchable="true"
                                        datakey="bbIpdslPort" pillspriority="zj"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="IPDSL Ports" pillsvaluesource="text"
                                        searchDropdownId="bbIpdslPort-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>DSL Ports</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/BbDslPorts?q={query}"
                                        defaultText="Select DSL Ports..." searchable="true"
                                        datakey="bbDslPort" pillspriority="zk"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="DSL Ports" pillsvaluesource="text"
                                        searchDropdownId="bbDslPort-${id}">
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