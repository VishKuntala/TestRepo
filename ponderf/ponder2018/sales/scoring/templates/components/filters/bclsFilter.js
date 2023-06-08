const html = ({ id, config }) => `
<div id="filterGrid" class="ui one column padded grid">
    <div class="row">
        <div class="column">
            <div  class="ui fluid filter form">
                <div class="five fields">
                    <div class="required field">
                        <label>VPGM</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Vpgms?q={query}"
                                        defaultText="Select VPGM..."
                                        datakey="vpgm"  pillspriority="a"
                                        derivation="filterDropdown/filterDropdown.js"
                                        allowMultipleSelection="false" pillslabel="VPGM" pillsvaluesource="text"
                                        searchDropdownId="vpgm-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Archetype</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/ArcheTypes?q={query}"
                                        defaultText="Select Archetype..."
                                        datakey="archetype" pillspriority="b"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true"  pillslabel="Archetype" pillsvaluesource="text"
                                        searchDropdownId="archetype-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>DMA Name</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/DmaNames?q={query}"
                                        defaultText="Select DMA Name..."
                                        datakey="dmaName" pillspriority="c"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="DMA Name" pillsvaluesource="text"
                                        searchDropdownId="dmaName-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Zip</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Zipcodes?q={query}"
                                        defaultText="Select Zip..." searchable="true"
                                        datakey="zipcode" pillspriority="d"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Zipcode" pillsvaluesource="text"
                                        searchDropdownId="zips-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Simple Coverage Score</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/CoverageScores?q={query}"
                                        defaultText="Select Coverage Score..."
                                        datakey="covScore" pillspriority="e"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Coverage Score" pillsvaluesource="text"
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
                                        allowMultipleSelection="true" pillslabel="5G" pillsvaluesource="text"
                                        searchDropdownId="5g-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Band 14</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Band14s?q={query}"
                                        defaultText="Select Band 14..."
                                        datakey="band14" pillspriority="g"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Band 14" pillsvaluesource="text"
                                        searchDropdownId="band14-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>AWB Capacity</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AwbCapTexts?q={query}"
                                        defaultText="Select AWB Capacity..."
                                        datakey="awbCapText" pillspriority="h"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="AWB Capacity" pillsvaluesource="text"
                                        searchDropdownId="awbCapText-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>AWB Spectrum Efficiency</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AwbSpecEffs?q={query}"
                                        defaultText="Select AWB Spectrum Efficiency..."
                                        datakey="awbSpecEff" pillspriority="i"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="AWB Spectrum Efficiency" pillsvaluesource="text"
                                        searchDropdownId="awbSpecEff-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>ATT Rank GWS</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AttRankGwss?q={query}"
                                        defaultText="Select ATT Rank GWS..."
                                        datakey="attRankGws" pillspriority="j"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="ATT Rank GWS" pillsvaluesource="text"
                                        searchDropdownId="attRankGws-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="five fields">                    
                    <div class="field">
                        <label>GPON Status</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/gponStatuss?q={query}"
                                        defaultText="Select GPON Status..."
                                        datakey="gponStatus" pillspriority="k"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="GPON Status" pillsvaluesource="text"
                                        searchDropdownId="gponStatus-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Hyper-Gig</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/Hypergigs?q={query}"
                                        defaultText="Select Hyper-Gig Status..."
                                        datakey="hypergig" pillspriority="l"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Hyper-Gig" pillsvaluesource="text"
                                        searchDropdownId="hypergig-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>ATT Ookla Quantile</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/AttOoklaQs?q={query}"
                                        defaultText="Select ATT Ookla Quantile..."
                                        datakey="attOoklaQ" pillspriority="m"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="ATT Ookla Quantile" pillsvaluesource="text"
                                        searchDropdownId="attOoklaQ-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>TMO Ratio Ookla</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/TmoRatioOoklas?q={query}"
                                        defaultText="Select TMO Ratio Ookla..."
                                        datakey="tmoRatioOokla" pillspriority="n"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="TMO Ratio Ookla" pillsvaluesource="text"
                                        searchDropdownId="tmoRatioOokla-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>VZN Ratio Ookla</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/VznRationOoklas?q={query}"
                                        defaultText="Select VZN Ration Ookla..."
                                        datakey="vznRatioOokla" pillspriority="o"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="VZN Ration Ookla" pillsvaluesource="text"
                                        searchDropdownId="vznRatioOokla-${id}">
                        </ponder-search-dd>
                    </div>
                </div>
                <div class="five fields">                    
                    <div class="field">
                        <label>Pop Density</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/PopDensitys?q={query}"
                                        defaultText="Select Pop Density..."
                                        datakey="popDensity" pillspriority="p"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Pop Density" pillsvaluesource="text"
                                        searchDropdownId="popDensity-${id}">
                        </ponder-search-dd>
                    </div>
                    <div class="field">
                        <label>Median Income</label>
                        <ponder-search-dd remoteUrl="${config.baseUrl}/MedIncomes?q={query}"
                                        defaultText="Select Median Income..."
                                        datakey="medIncome" pillspriority="q"
                                        derivation="filterMultiselectDropdown/filterMultiselectDropdown.js"
                                        allowMultipleSelection="true" pillslabel="Median Income" pillsvaluesource="text"
                                        searchDropdownId="medIncome-${id}">
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