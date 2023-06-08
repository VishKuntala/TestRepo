import { html } from 'lit-element';

const template = ({ showScoringDetailsModal }) => html`
<div class="container">
    <div class="ui text menu">

        <div class="item">
            <img class="logo" src="images/ponder_logo.jpg" />
        </div>

        <h2 class="ui header">                            
            &nbsp;&nbsp;Engineering
        </h2>
        
        <div class="ui right item">
            <button @click="${ showScoringDetailsModal }" class="ui blue button">Methodology</button>
        </div>

    </div>
</div>
<div class="ui divider"></div>
<div class="ui coverageScoreHelp modal">
    <div id="methodologyContent" class="scrolling content">
    </div>
  <div class="actions">
        <div class="ui positive green button">OK</div>
  </div>
</div>
`;

export default template;                            