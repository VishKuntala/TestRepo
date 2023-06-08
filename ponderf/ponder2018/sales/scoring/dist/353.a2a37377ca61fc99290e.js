(self.webpackChunkleafletapp=self.webpackChunkleafletapp||[]).push([[353],{6353:(e,l,n)=>{"use strict";n.r(l),n.d(l,{default:()=>a}),n(3609);var t=function(e){var l=e.id,n=e.config;return'\n<div id="filterGrid" class="ui one column padded grid">\n    <div class="row">\n        <div class="column">\n            <div  class="ui fluid filter form">\n                <div class="five fields">\n                    <div class="required field">\n                        <label>Access Type</label>\n                        <ponder-search-dd remoteUrl="'.concat(n.baseUrl,'/AccessTypes?q="\n                                        defaultText="Select Access Type..." pillslabel="Access Type"\n                                        pillsvaluesource="text"\n                                        datakey="accessType" pillspriority="a"\n                                        derivation="filterDropdown/filterDropdown.js"\n                                        searchDropdownId="accessType-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="required field">\n                        <label>Cluster Name</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/ClusterNames?q="\n                                        datakey="clusterId" pillspriority="b"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"\n                                        defaultText="Select Cluster Name..." pillslabel="Cluster Name" \n                                        pillsvaluesource="text"\n                                        searchDropdownId="clusterId-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>                    \n                    <div class="field">\n                        <label>State</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/States?q="\n                                        defaultText="Select State..."\n                                        datakey="statecode" classnames="usstates" pillspriority="c"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true" pillslabel="State" \n                                        searchDropdownId="state-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="field">\n                        <label>Zip</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/Zipcodes?q="\n                                        defaultText="Select Zips..."\n                                        datakey="zipcode" pillspriority="d"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="Zipcode" pillsvaluesource="text"\n                                        searchDropdownId="zips-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="field">\n                        <label>Simple Coverage Score</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/CoverageScores?q="\n                                        defaultText="Select Coverage Score..."\n                                        datakey="covScore" pillspriority="e"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="Coverage Score" pillsvaluesource="text"\n                                        searchDropdownId="covScore-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                </div>\n                <div class="five fields">                    \n                    <div class="field">\n                        <label>5G</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/FiveGs?q="\n                                        defaultText="Select 5G..."\n                                        datakey="fiveg" pillspriority="f"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="5G" pillsvaluesource="text"\n                                        searchDropdownId="5g-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="field">\n                        <label>Band 14</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/Band14s?q="\n                                        defaultText="Select Band 14..."\n                                        datakey="band14" pillspriority="g"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"\n                                        searchDropdownId="band14-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="field">\n                        <label>Speed/Avail Capacity</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/TputTexts?q="\n                                        defaultText="Select Speed/Avail Capacity..."\n                                        datakey="tputText" pillspriority="h"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="Speed/Avail Capacity" pillsvaluesource="text"\n                                        searchDropdownId="tputText-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="field">\n                        <label>Roaming Dependency</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/RoamingDependencies?q="\n                                        defaultText="Select Roaming Dependency..."\n                                        datakey="roamingDependency" pillspriority="i"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="Roaming" pillsvaluesource="text"\n                                        searchDropdownId="roamingDependency-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                    <div class="field">\n                        <label>Legacy Device Penetration</label>\n                        <ponder-search-dd remoteUrl="').concat(n.baseUrl,'/LegacyPens?q="\n                                        defaultText="Select Legacy Device Penetration..."\n                                        datakey="legacyPen" pillspriority="j"\n                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"\n                                        allowMultipleSelection="true"  pillslabel="Legacy Device Pen" pillsvaluesource="text"\n                                        searchDropdownId="legacyPen-').concat(l,'">\n                        </ponder-search-dd>\n                    </div>\n                </div>                \n                <div class="ui blue submit button disabled btnSubmit">Submit</div>\n                <div class="ui btnClear secondary disabled button">Clear</div>\n            </div>\n        </div>\n    </div>\n</div>\n<ponder-pills pillsid="pills-').concat(l,'"></ponder-pills>\n')};const a=function(e){return e.adminUser,e.instance,{html:t}}}}]);