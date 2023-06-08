import { html } from 'lit-element';
import './appHeader.css';

const template = ({ rootUrl, baseApiUrl, showScoringDetailsModal, dataInfo }) => html`
<nav class="container">
    <div class='nav-items'>
        <div class='left-links'>
            <div class='nav-logo'>
                <img src="assets/images/att_logo_white.png" />
                <span>PONDER Blitz</span>
            </div>
        </div>
        <button @click="${showScoringDetailsModal}" class="ui mini button">Additional Info</button>
    </div>
</nav>
<div class='nav-sub-header'>
    <form class='ui form'>
        <div class="inline fields">
            <div class="field">
                <label>Sales Market</label>
                <ponder-sales-market-dropdown></ponder-sales-market-dropdown>
            </div>
            <div class="field">
                <label>Heatmap</label>
                <ponder-heatmap-dropdown></ponder-heatmap-dropdown>
            </div>
            <div class="field">
                <label id="lblGroupBy">Group Nation By</label>
                <ponder-group-by-dropdown></ponder-group-by-dropdown>
            </div>
           
        </div>
    </form>
    <div class="ponder-search-container">
        <ponder-search-selector selectorid="searchMode"></ponder-search-selector>
        <ponder-search searchid="addSearch" searchmode="addressSearch" defaulttext="Type an address..." remoteurl="${baseApiUrl}/search/addresses?query={query}"></ponder-search>
    </div>
</div>

<div class="ui coverageScoreHelp modal">
  <i class="close icon"></i>
  <div class="content">
    <div style="text-align:center;font-weight: bold">
        <p>${dataInfo[0].display_name}</p>
        <p>${dataInfo[1].display_name}</p>
        <p>${dataInfo[2].display_name}</p>
        <p>${dataInfo[3].display_name}</p>
        <p>${dataInfo[4].display_name}</p>
    </div>
    <h2><b><u>Indoor Coverage Score</u></b></h2>
    <p>The indoor coverage score is built to reflect the way the customer experiences coverage when being indoor. It is accurate and considers the customer's location and its immediate surroundings. Please note that it is still less accurate than a local engineering assessment, so please refer to your market for 100% certainty. The score ranges from 1-Very Weak to 5-Best correspond to the following experience:</p>
    <ul>
      <li>5-Best: Excellent experience in indoor and outdoor conditions.</li>
      <li>4-Very Strong: Very good experience. Excellent coverage outdoor and at strong coverage everywhere indoor.</li>
      <li>3-Strong: Seamless network experience, typical of any cellular network. Good coverage outdoor and in most areas indoor.</li>
      <li>2-Uneven: Good experience outdoor and partially indoor. Some areas may not be adequately covered indoor. Typical situation where enabling Voice over Wi-Fi would be recommended for a seamless experience. In dense urban areas with tall buildings, simple coverage scores can be very different between floors.</li>
      <li>1-Very Weak: Weak outdoor experience, partial indoor coverage is possible but poor experience overall.</li>
    </ul>
  </div>
  <div class="actions">
        <div class="ui positive green button">OK</div>
  </div>
</div>
`;

export default template;                            