import { html } from 'lit-element';

const template = ({ showScoringDetailsModal }) => html`
<div class="container">
    <div class="ui text menu">

        <div class="item">
            <img class="logo" src="images/ponder_logo.jpg" />
        </div>

        <h2 class="ui header">                            
            &nbsp;&nbsp;Select - Wireless BroadBand
        </h2>
        
        <div class="ui right item">
            <button @click="${ showScoringDetailsModal }" class="ui blue button">Methodology</button>
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
    <h4><b><u>High Speed Suitability Rating</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Excellent: Very efficient data use and site has available capacity. Excellent speed to be expected and no side effect on existing mobile users. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Very Good: Efficient data use and site has available capacity. Good speed to be expected and no side effect on existing mobile users. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Good: Reasonably efficient data use and site has some capacity available. OK speeds to be expected. New AWB users will have moderate impact on existing mobile users (download/upload speed reduction for all). <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Feasible: Data use is marginally efficient and site shows sign of capacity limitations. Low speeds to be expected. New AWB users will have moderate impact on existing mobile users (download/upload speed reduction for all). <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Low Speed Failover Only: Data use is not efficient and site shows signs of capacity limitations. Very low speeds to be expected. New AWB users will have strong impact on all existing mobile users. Strictly reserved to low speed backup scenario (ask Market RAN for area load analysis). <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;No AWB- Check with RAN: Location cannot handle AWB under any circumstance. Contact Market RAN for deeper analysis. <br />
    </h6>
    <h4><b><u>Mobile Speed Experience Rating</u></b></h4>
    <h6>
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;High Speed: Very fast downloads available (top 20% in the network). Outstanding experience. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Medium Speed: Consistently fast download available. Seamless experience with video and downloads. <br />
        &nbsp;&nbsp;&nbsp;&nbsp; •       &nbsp;&nbsp;Low Speed: Download speed may dip during busiest time of the day. Video quality may be degraded at that time. <br />
        <br />
    </h6>
  </div>
  <div class="actions">
        <div class="ui positive green button">OK</div>
  </div>
</div>
`;

export default template;                            