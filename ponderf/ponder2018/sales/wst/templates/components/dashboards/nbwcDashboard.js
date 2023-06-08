const html = ({ id, config }) => `
                    <h3>Dashboard</h3>
                    <div class="ui sixteen column aligned stackable grid">
                        <div class="row">
                            <div class="two wide centered column">
                                <ponder-piechart seriesname='indoorCovScore' confighelper='covScoreConfigHelper.js'
                                        legenddatakey="covScoreLegend" derivation="svidPiechart/svidPiechart.js"
                                        title="Indoor Coverage Score" 
                                        chartid="piechart1" groupbyprop="coverage_score" aggregatetype="COUNT"></ponder-piechart>
                                <ponder-chartlegend legenddatakey="covScoreLegend" legendid='covscorelegend'></ponder-chartlegend>
                            </div>
                            <div class="two wide centered column">
                                <ponder-piechart seriesname='fiveg' confighelper='fivegConfigHelper.js'
                                        legenddatakey="fivegLegend" derivation="svidPiechart/svidPiechart.js"
                                        title="5G" 
                                        chartid="piechart2" groupbyprop="fiveg" aggregatetype="COUNT"></ponder-piechart>
                                <ponder-chartlegend legenddatakey="fivegLegend" legendid='fiveglegend'></ponder-chartlegend>
                            </div>
                            <div class="two wide centered column">
                                <ponder-piechart seriesname='band14' confighelper='band14ConfigHelper.js'
                                        legenddatakey="band14Legend" derivation="svidPiechart/svidPiechart.js"
                                        title="FNET Band 14" 
                                        chartid="piechart3" groupbyprop="band_14" aggregatetype="COUNT"></ponder-piechart>
                                <ponder-chartlegend legenddatakey="band14Legend" legendid='band14legend'></ponder-chartlegend>
                            </div>
                            <div class="two wide centered column">
                                <ponder-piechart seriesname='tput' confighelper='tputConfigHelper.js'
                                        legenddatakey="tputLegend"
                                        title="Speed/Avail Capacity" derivation="svidPiechart/svidPiechart.js"
                                        chartid="piechart4" groupbyprop="tput_text" aggregatetype="COUNT"></ponder-piechart>
                                <ponder-chartlegend legenddatakey="tputLegend" legendid='tputlegend'></ponder-chartlegend>
                            </div>
                            <div class="two wide centered column">
                                <ponder-piechart seriesname='roaming' confighelper='roamingConfigHelper.js'
                                        legenddatakey="roamingLegend"
                                        title="Roaming" derivation="svidPiechart/svidPiechart.js"
                                        chartid="piechart5" groupbyprop="roam_text" aggregatetype="COUNT"></ponder-piechart>
                                <ponder-chartlegend legenddatakey="roamingLegend" legendid='roaminglegend'></ponder-chartlegend>
                            </div>
                            <div class="two wide centered column">
                                <ponder-piechart seriesname='fiberCust' confighelper='fiberCustConfigHelper.js'
                                        legenddatakey="fiberCust"
                                        title="Legacy Device Penetration" derivation="svidPiechart/svidPiechart.js"
                                        chartid="piechart6" groupbyprop="fiber_cust" aggregatetype="COUNT"></ponder-piechart>
                                <ponder-chartlegend legenddatakey="fiberCust" legendid='fiberCustlegend'></ponder-chartlegend>
                            </div>
                        </div>
                </div>
`;

export { html };