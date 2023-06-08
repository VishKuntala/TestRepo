const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
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
                                        datakey="psa" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="PSA" pillsvaluesource="text"
                                        searchDropdownId="psa-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Customer Category</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiberStatuses?q="
                                        defaultText="Select Fiber Status..." searchable="true"
                                        datakey="fiberStatus" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Fiber Status" pillsvaluesource="text"
                                        searchDropdownId="fiberStatus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Indoor Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CoverageScores?q={query}"
                                        defaultText="Select Indoor Coverage Score..." searchable="true"
                                        datakey="indoorCovScore" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Indoor Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="indoorCovScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>CSI Eligible</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CsiEligibilities?q="
                                    defaultText="Select CSI Eligibility..." searchable="true"
                                    datakey="csiEligibility" pillspriority="i"
                                    derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                    allowMultipleSelection="true"  pillslabel="CSI Eligibility" pillsvaluesource="text"
                                    searchDropdownId="csieligibility-${id}">
                        </ponder-search-dd>
                    </div>
                </div>

                <div class="four fields">
                    <div class="field">
                        <label>Multi-Gig</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/MultiGigs?q="
                                    defaultText="Select Multi-Gig..." searchable="true"
                                    datakey="multiGig" pillspriority="j"
                                    derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                    allowMultipleSelection="true"  pillslabel="Multi-Gig" pillsvaluesource="text"
                                    searchDropdownId="multigig-${id}">
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