﻿const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="five fields">
                    <div class="required field">
                        <label>AVP</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AVPs?q={query}"
                                        defaultText="Select AVP..." pillslabel="AVP"
                                        datakey="avpId" pillspriority="a" searchable="true"
                                        derivation="filterDropdown/filterDropdown.js"
                                        searchDropdownId="avp-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="required field">
                        <label>Sales Manager</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/SalesManagers?q={query}"
                                        defaultText="Select Sales Manager..." pillslabel="Sales Manager"
                                        datakey="smId" pillspriority="b" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"
                                        searchDropdownId="salesManager-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="required field">
                        <label>Sales Representative</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/SalesRepresentatives?q={query}"
                                        datakey="salesRepId" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" searchable="true"
                                        defaultText="Select Sales Rep..." pillslabel="Sales Representative"
                                        searchDropdownId="salesRepresentative-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="required field">
                        <label>Mobility Seller</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/MobSellers?q="
                                        datakey="mobSellerId" pillspriority="d"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"
                                        defaultText="Select Mobility Seller..." pillslabel="Mobility Seller"
                                        searchDropdownId="mobSeller-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Business Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/SVNames?q={query}"
                                        defaultText="Select Business..." searchable="true"
                                        datakey="svIds" pillspriority="d"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" disabled="true" pillslabel="Business Name" pillsvaluesource="text"
                                        searchDropdownId="businessNames-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="five fields">
                    <div class="field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode" classnames="usstates" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="State" 
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Zipcodes?q={query}"
                                        defaultText="Select Zips..." searchable="true"
                                        datakey="zipcode" pillspriority="f"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Simple Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/CoverageScores?q={query}"
                                        defaultText="Select Coverage Score..."
                                        datakey="covScore" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Coverage Score" pillsvaluesource="text"
                                        searchDropdownId="covScore-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/FiveGs?q={query}"
                                        defaultText="Select 5G..."
                                        datakey="fiveg" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
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
                </div>
                <div class="five fields">
                    <div class="field">
                        <label>Speed/Avail Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/TputTexts?q={query}"
                                        defaultText="Select Speed/Avail Capacity..."
                                        datakey="tputText" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed/Avail Capacity" pillsvaluesource="text"
                                        searchDropdownId="tputText-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Roaming Dependency</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/RoamingDependencies?q={query}"
                                        defaultText="Select Roaming Dependency..."
                                        datakey="roamingDependency" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Roaming" pillsvaluesource="text"
                                        searchDropdownId="roamingDependency-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Legacy Device Penetration</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/LegacyPens?q={query}"
                                        defaultText="Select Legacy Device Penetration..."
                                        datakey="legacyPen" pillspriority="m"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Legacy Device Pen" pillsvaluesource="text"
                                        searchDropdownId="legacyPen-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Fiber Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/FiberStatuses?q="
                                        defaultText="Select Fiber Status..."
                                        datakey="fiberStatus" pillspriority="n"
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
<ponder-pills pillsid="pills-${id}"></ponder-pills>
`;

export { html };