import { html } from 'lit-element';

const template = ({ filterDerivation, dashboardDerivation, datatableDerivation, mapDerivation, config, toolName, initialTool }) => {
    return html`<div class="ui ">
<ponder-appheader initialtool="${initialTool}"></ponder-appheader>
<div class="ui sixteen column padded stackable grid">
        <div class="row">
            <div class="sixteen wide left aligned column">
                <div class="ui raised filter segment">
                    <h3>Filters Customized for ${toolName}&nbsp;<span class="ui blue tertiary showFilter button">Hide Filter</span></h3>
                    <ponder-filter derivation="${filterDerivation}" filterId='filter1'></ponder-filter>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="sixteen wide left aligned column">
                <div class="ui raised mapAndTable segment ">
                    <div class="ui sixteen column padded stackable grid">
                        <div class="row">                            
                            <div class="sixteen wide right aligned column">
                                <h3>${toolName} Locations <span id="mapLocationCount"></span></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="eleven wide left aligned column">
                                <ponder-map mapid='map1' derivation="${mapDerivation}"></ponder-map>
                            </div>
                            <div class="five wide left aligned column">
                                <div class="ui charts segment">
                                    <div class="ui active centered inline loader"></div>
                                    <ponder-barchart  categorylabels=${config.barchart.categoryLabels}
                                        categorydatakeys=${config.barchart.categoryDataKeys}
                                        categorydatavalues=${config.barchart.categoryDataValues}
                                        derivation="svidBarchart/svidBarchart.js" chartid='barchart1'>
                                    </ponder-barchart>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="six wide left aligned column">
                                <h3 id="tableTitle"></h3>
                            </div>
                            <div class="ten wide right aligned column">
                                   <div class="ui labeled input">
                                        <div class="ui label">
                                             Search
                                        </div>
                                        <input id="txtTableSearch" type="text" placeholder="Search...">
                                    </div>
                                    <div class="ui labeled input">
                                        <div class="ui label">
                                            Prioritize By
                                        </div>
                                        <ponder-search-dd
                                                defaultText="Select Sort Criteria..." clearable="false" 
                                                datakey="sortCriteria" classnames="sortcriteria" ddvaluesdatakey="sortCriteriaData"
                                                searchDropdownId="sortCriteria">
                                        </ponder-search-dd>
                                        <div id="tableSortLoader" class="ui active small blue elastic loader"></div>
                                    </div>
                              </div>  
                           </div>
                        <div class="row">
                              <div class="sixteen wide left aligned column">  
                                    <ponder-tabulator tableid="tblSvids"
                                        derivation="${datatableDerivation}"
                                        primarykeycolumn="svid"
                                        headers=${config.dataTableHeaders}
                                        dataKeys=${config.dataTableDataKeys} ></ponder-tabulator>
                                </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>

</div>
`
};

export default template;