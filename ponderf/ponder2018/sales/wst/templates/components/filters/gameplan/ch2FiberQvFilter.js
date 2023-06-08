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
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CoverageScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..." searchable="true"
                                        datakey="indoorCovScore" pillspriority="o"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGs?q={query}"
                                        defaultText="Select 5G..." searchable="true"
                                        datakey="fiveg" pillspriority="p"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G Plus C-Band</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CBands?q={query}"
                                        defaultText="Select C Band..." searchable="true"
                                        datakey="fivegplusCbandIcs" pillspriority="q"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="C Band" pillsvaluesource="text"
                                        searchDropdownId="cband-${id}">
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

                <h4 class="ui horizontal divider header">
                    <i class="address card outline icon"></i>
                    Business Tenant Filters
                </h4>

                <div class="four fields">
                    <div class="field">
                        <label>Owning Segment Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/OwningSegNames?q={query}"
                                        defaultText="Select Owning Segment Name..." searchable="true"
                                        datakey="owningSegName" pillspriority="r"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Owning Segment Name" pillsvaluesource="text"
                                        searchDropdownId="owningSegName-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Customer Prospect</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/LocCustProsps?q="
                                        defaultText="Select Customer or Prospect..." searchable="true"
                                        datakey="locCustProsp" pillspriority="t"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Customer Prospect" pillsvaluesource="text"
                                        searchDropdownId="locCustProsp-${id}">
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