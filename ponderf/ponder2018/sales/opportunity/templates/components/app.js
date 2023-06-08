import { html } from 'lit-element';
import '../../assets/styles/global-vars.css';
import '../../assets/styles/color-vars.css';
import '../../assets/styles/styles.css';


const template = ({ acknowledgeClick }) => {
    return html`
        <div class="ui ">
          <ponder-appheader></ponder-appheader>
          <ponder-appbody></ponder-appbody>
        </div>
        <div class="ui acknowledge modal">
          <h2 class="ui header">AT&T Proprietary and Confidential Information</h2>
          <div class="content">
            Not for use or disclosure outside the AT&T companies except under written agreement.
          </div>
          <div class="actions">
            <button id='acknowledgeBtn' @click="${acknowledgeClick}" class="ui positive green button">Acknowledge</button>
          </div>
        </div>
    `
};

export default template;                            