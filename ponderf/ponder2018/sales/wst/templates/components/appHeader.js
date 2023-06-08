import { html } from 'lit-element';

const template = ({ title, showScoringDetailsModal, sendSupportEmail, navigateToByoc, initialTool }) => html`
<div class="container">
    <div class="ui sixteen column padded stackable grid">
        <div class="row">
            <div class="five wide left aligned column">
                        <h3  class="ui header">
                            <img  class="logo" src="images/ponder_logo.jpg" />&nbsp;<span style="vertical-align:middle;">Wireless Scoring</span>
                        </h3>
            </div>
            <div style="margin-top:2px;" class="six wide left aligned column">
<div class='nav-sub-header'>
    <form class='ui form'>
        <div class="inline fields">
            <div class="field">
                <select class="ui toolSelector dropdown">
                                </select>
            </div>
            <div class="field">
                <ponder-heatmap-dropdown></ponder-heatmap-dropdown>
            </div>

        </div>
    </form>
    <div class="ponder-search-container">
    </div>
</div>                 
            </div>



            <div style="margin-top:10px;" class="five wide right aligned column">
                <button @click="${navigateToByoc}" class="ui mini blue button">BYOC</button>
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
    <h6>The simple coverage score is built to reflect the way the customer experiences coverage when being indoor. It is accurate and considers the customer�s business location and its immediate surroundings.
        Please note that it is still less accurate than a local engineering assessment, so please refer to your market for 100% certainty.
        The score ranges from 1�Very Weak to 5-Best correspond to the following experience: <br /> <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;5-Best: Excellent experience in indoor and outdoor conditions. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;4-Very Strong: Very good experience. Excellent coverage outdoor and at strong coverage everywhere indoor. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;3-Strong: Seamless network experience, typical of any cellular network. Good coverage outdoor and in most areas indoor. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;2-Uneven: Good experience outdoor and partially indoor. Some areas may not be adequately covered indoor. Typical situation where enabling Voice over Wi-Fi would be recommended for a seamless experience. In dense urban areas with tall buildings, simple coverage scores can be very different between floors.<br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;1-Very Weak: Weak outdoor experience, partial indoor coverage is possible but poor experience overall. <br />
        <br />
    </h6>
    <h4><b><u>Speed Rating</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;High: Very fast downloads available (top 20% in the network). Outstanding experience. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;Medium: Consistently fast download available. Seamless experience with video and downloads. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;Low: Download speed may dip during busiest time of the day. Video quality may be degraded at that time. <br />
        <br />
    </h6>
    <h4><b><u>Available Capacity Rating</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;Very High Avail Capacity: Sites carry few users and low traffic. Seamless Connection Sharing, even for very demanding tasks. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;High Avail Capacity: Sites carry low traffic for most of the day. Seamless Connection Sharing is possible. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;Medium Avail Capacity: Sites carry moderate traffic. Connection sharing works well but will slow down at peak time. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;Low Avail Capacity: Sites carry many users and high traffic. Connection Sharing works but experience will be degraded at peak time, especially if several users are watching videos at the same time. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; �       &nbsp;&nbsp;Very Low Avail Capacity: Sites carry large amount of users and very high traffic volumes. Individual experience is likely to be affected. Connection Sharing is not recommended. <br />
    </h6>
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