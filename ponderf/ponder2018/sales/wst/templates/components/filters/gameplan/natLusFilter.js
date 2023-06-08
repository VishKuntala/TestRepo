const html = ({ id, config }) => `
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
                        <label>DMA</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/DMAs?q={query}"
                                        defaultText="Select DMA..." pillslabel="DMA" pillsvaluesource="text"
                                        datakey="dmaName" pillspriority="b" searchable="true"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"
                                        searchDropdownId="dmaName-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>State</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/States?q={query}"
                                        defaultText="Select State..."
                                        datakey="statecode" classnames="usstates" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="State" pillsvaluesource="text"
                                        searchDropdownId="state-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Zipcodes?q={query}"
                                        defaultText="Select Zips..." searchable="true"
                                        datakey="zipcode" pillspriority="d"
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
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Band14s?q={query}"
                                        defaultText="Select Band 14..."
                                        datakey="band14" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>5G Plus</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/FiveGPluses?q={query}"
                                        defaultText="Select 5G Plus..."
                                        datakey="fivegplus" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="5G Plus" pillsvaluesource="text"
                                        searchDropdownId="5gplus-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>C Band</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CBands?q={query}"
                                        defaultText="Select C Band..."
                                        datakey="cband" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="C Band" pillsvaluesource="text"
                                        searchDropdownId="cband-${id}">
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
                        <label>Suitability</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/Suitabilities?q={query}"
                                        defaultText="Select Suitability..."
                                        datakey="wbbSuitabilityIcs" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Suitability" pillsvaluesource="text"
                                        searchDropdownId="wbbSuitabilityIcs-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>RAN Cause</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/RANCauses?q={query}"
                                        defaultText="Select RAN Cause..."
                                        datakey="ranCause" pillspriority="m"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="RAN Cause" pillsvaluesource="text"
                                        searchDropdownId="rancause-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>Speed Experience</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/SpeedExperiences?q={query}"
                                        defaultText="Select Speed Experiences..."
                                        datakey="speedExperienceIcs" pillspriority="n"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Speed Experience" pillsvaluesource="text"
                                        searchDropdownId="speedExperienceIcs-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Wtd Avg Tput Grp</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/WeightedAvgTuputGrps?q="
                                        defaultText="Select Weighted Avg Tuput Grp..."
                                        datakey="weightedAvgTuputGrp" pillspriority="o"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Weighted Avg Tuput Grp" pillsvaluesource="text"
                                        searchDropdownId="weightedAvgTuputGrp-${id}">
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
                    <div class="field">
                        <label>Roam Text</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/RoamTexts?q={query}"
                                        defaultText="Select Roam Text..."
                                        datakey="roamText" pillspriority="q"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Roam Text" pillsvaluesource="text"
                                        searchDropdownId="roamText-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="four fields">
                    <div class="field">
                        <label>CQI Grp</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CqiGrps?q={query}"
                                        defaultText="Select CQI Grp..."
                                        datakey="cqiGrp" pillspriority="r"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="CQI Grp" pillsvaluesource="text"
                                        searchDropdownId="cqiGrp-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Spectrum Eff12Pl</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/SpectrumEff12Pls?q={query}"
                                        defaultText="Select Spectrum Eff12Pl..."
                                        datakey="spectrumEff12Pl" pillspriority="s"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Spectrum Eff12Ple" pillsvaluesource="text"
                                        searchDropdownId="spectrumEff12Pl-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>CBand Scs</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/CbandScses?q="
                                        defaultText="Select CBand Scs..."
                                        datakey="cbandScs" pillspriority="t"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="CBand Scs" pillsvaluesource="text"
                                        searchDropdownId="cbandScs-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Wtd Avg Mcep</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/filter/WeightedAvgMcepPrbUtlGrps?q="
                                        defaultText="Select Weighted Avg Mcep PrbUtlGrp..."
                                        datakey="weightedAvgMcepPrbUtlGrp" pillspriority="u"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Weighted Avg Mcep PrbUtlGrp" pillsvaluesource="text"
                                        searchDropdownId="weightedAvgMcepPrbUtlGrp-${id}">
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