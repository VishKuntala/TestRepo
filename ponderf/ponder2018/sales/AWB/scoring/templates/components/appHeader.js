import { html } from 'lit-element';

const template = ({ title, showScoringDetailsModal, sendSupportEmail, navigateToByoc, showAdditionalInfoModal, initialTool }) => html`
<div class="container">
    <div class="ui sixteen column padded stackable grid">
        <div class="row">
            <div class="five wide left aligned column">
                        <h3  class="ui header">
                            <img  class="logo" src="images/ponder_logo.jpg" />&nbsp;<span style="vertical-align:middle;">Wireless BroadBand Scoring</span>
                        </h3>
            </div>
            <div style="margin-top:2px;" class="six wide center aligned column">
                        <div class="center aligned column">
                            <h1 class="right item">
                                <select class="ui toolSelector dropdown">
                                </select>
                            </h1>
                        </div>
            </div>

            <div style="margin-top:10px;" class="five wide right aligned column">
                <button @click="${navigateToByoc}" class="ui mini blue button">PONDER - Select WBB Cluster Creation</button>
                <button @click="${showAdditionalInfoModal}" class="ui mini blue button">Additional Info</button>
                <button @click="${showScoringDetailsModal}" class="ui mini blue button">Methodology</button>
                <button @click="${sendSupportEmail}" class="ui mini blue button">Send Feedback</button>
            </div>
        </div>    
    </div>
</div>
<div class="ui divider"></div>
<div class="ui coverageScoreHelp modal">
  <i class="close icon"></i>
  <div class="content">
    <h4><b><u>Indoor Coverage Score</u></b></h4>
    <h6>The indoor coverage score is built to reflect the way the customer experiences coverage when being indoor. It is accurate and considers the customer's location and its immediate surroundings.
        Please note that it is still less accurate than a local engineering assessment, so please refer to your market for 100% certainty.
        The score ranges from 1-Very Weak to 5-Best correspond to the following experience: <br /> <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;5-Best: Excellent experience in indoor and outdoor conditions. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;4-Very Strong: Very good experience. Excellent coverage outdoor and at strong coverage everywhere indoor. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;3-Strong: Seamless network experience, typical of any cellular network. Good coverage outdoor and in most areas indoor. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;2-Uneven: Good experience outdoor and partially indoor. Some areas may not be adequately covered indoor. Typical situation where enabling Voice over Wi-Fi would be recommended for a seamless experience. In dense urban areas with tall buildings, simple coverage scores can be very different between floors.<br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;1-Very Weak: Weak outdoor experience, partial indoor coverage is possible but poor experience overall. <br />
        <br />
    </h6>    
    <h4><b><u>Suitability for high download Speed/Volume Rating</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Suitable. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Unsuitable. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Check with RAN. <br />
    </h6>
    <h4><b><u>Mobile Speed Experience Rating</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;High Speed: Very fast downloads available (top 20% in the network). Outstanding experience. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Medium Speed: Consistently fast download available. Seamless experience with video and downloads. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Low Speed: Download speed may dip during busiest time of the day. Video quality may be degraded at that time. <br />
        <br />
    </h6>
    <h4><b><u>5G - Nationwide 5G low and mid-band deployment excluding both C-Band and mmWave</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Yes –  5G is available in the area. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Partial – 5G is available in the area however it may not be available in some or any areas inside this location. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;No – 5G may be available in the area however a serving site was not detected. <br />
        <br />
    </h6>
    <h4><b><u>5G Plus mmWave - 5G+ millimeter wave spectrum is available in limited areas in certain US cities</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Yes –  One or more hotspots in the area are covered with high speed mmWave. The mmWave coverage will note extend beyond these hotspots. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;No – mmWave not available in the immediate surroundings. <br />
        <br />
    </h6>
    <h4><b><u>5G Plus C-Band</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Indoor – C-BAND is available indoor in the immediate area. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Outdoor Only – C-BAND available in the area however indoor coverage is unlikely.<br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;No – C-BAND may be available in the area, however no C-BAND was detected in the immediate surroundings. <br />
        <br />
    </h6>
    <h4><b><u>Azimuth</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;The direction of the Best Server(s) ranked by signal strength and 5G+ availability. <br />
        <br />
    </h6>
  </div>
  <div class="actions">
        <div class="ui positive green button">OK</div>
  </div>
</div>
<div class="ui additionalInfo modal">
  <i class="close icon"></i>
  <div class="content">
    <h3><b><u>Additional Information</u></b></h3>
    <h4>
        <br>
        When 'Check with RAN' is displayed as an output of the tool, the following contact list should be used based on your market:&nbsp;&nbsp;<br><br>
        <a href="/sales/AWB/scoring/TCM_NSE National Contact List 21July22v1.xlsx" download="TCM_NSE National Contact List 21July22v1.xlsx">
        <button class="ui mini blue button" type="button">Download RAN TCM Contact List</button>
        </a>
    </h4>
  </div>
  <div class="actions">
        <div class="ui positive green button">OK</div>
  </div>
</div>
<div class="ui acknowledge modal">
    <h2 class="ui header">AT&T Proprietary and Confidential Information</h2>
  <div class="content">
    Not for use or disclosure outside the AT&T companies except under written agreement.
  </div>
  <div class="actions">
        <div class="ui positive green button">Acknowledge</div>
  </div>
</div>
<div class="ui notauthorized modal">
    <h2 class="ui header">Not Authorized</h2>
  <div class="content">
    You do not have the required permissions to access this tool.
  </div>
  <div class="actions">
        <div class="ui negative red button">Close</div>
  </div>
</div>
`;

export default template;                            