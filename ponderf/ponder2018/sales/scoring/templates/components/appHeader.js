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
            <div style="margin-top:2px;" class="six wide center aligned column">
                        <div class="center aligned column">
                            <h1 class="right item">
                                <select class="ui toolSelector dropdown">
                                </select>
                            </h1>
                        </div>
            </div>

            <div style="margin-top:10px;" class="five wide right aligned column">
                <button @click="${navigateToByoc}" class="ui mini blue button">PONDER - Select Cluster Creation</button>
                <button @click="${showScoringDetailsModal}" class="ui mini blue button">Methodology</button>
                <button @click="${sendSupportEmail}" class="ui mini blue button">Send Feedback</button>
            </div>
        </div>    
    </div>
</div>
<div class="ui divider"></div>
<div class="ui coverageScoreHelp modal">
  <i class="close icon"></i>
  <div id="methodologyContent" class="scrolling content">
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