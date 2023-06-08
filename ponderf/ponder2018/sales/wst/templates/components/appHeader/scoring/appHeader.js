import { html } from 'lit-element';
import './appHeader.css';

const template = ({ rootUrl, baseApiUrl, showScoringDetailsModal, sendSupportEmail, navigateToByoc, baseSearchApiUrl }) => html`
<nav class="container">
    <div class='nav-items'>
        <div class='left-links'>
            <div class='nav-logo'>
                <img src="assets/images/att_globe_symbol_limited_use_rgb_blk_50x50.png" />
                <span><b>PONDER</b> <span class="gradient-text">fusion</span></span>
            </div>            
        </div>
        <div class='right-links'>
            <button @click="${navigateToByoc}" class="ui mini button">BYOC</button>
            <button @click="${showScoringDetailsModal}" class="ui mini button">Methodology</button>
            <button @click="${sendSupportEmail}" class="ui mini button">Send Feedback</button>
        </div>
    </div>
</nav>
<div class='nav-sub-header'>
    <form class='ui form'>
        <div class="inline fields">
            <div class="field">
                <label>Channel</label>
                <ponder-channel-dropdown></ponder-channel-dropdown>
            </div>
            <div class="field">
                <label>Heatmap</label>
                <ponder-heatmap-dropdown></ponder-heatmap-dropdown>
            </div>
            <div class="field">
                <label>Location Attribute</label>
                <ponder-location-attribute-dropdown></ponder-location-attribute-dropdown>
            </div>
            <div class="field">
                <div id="loadingDiv" class="ui blue slow filling indeterminate progress" style="width:150px;visibility: hidden;">
                    <div class="bar">
                        <div class="progress">Loading map data ...</div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="ponder-search-container ponderHidden">
        <ponder-search-selector selectorid="searchMode"></ponder-search-selector>
        <ponder-search searchid="addSearch" searchmode="addressSearch" defaulttext="Type an address..." remoteurl="${baseSearchApiUrl}/search/addresses?query={query}"></ponder-search>
    </div>
</div>

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
`;

export default template;                            