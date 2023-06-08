import { html } from 'lit-element';
import '../../assets/styles/global-vars.css';
import '../../assets/styles/color-vars.css';
import '../../assets/styles/styles.css';


const template = ({ baseSearchApiUrl, hasAccess }) => {
    if (hasAccess) {
        return html`
        <div class="ui ">
          <ponder-appheader></ponder-appheader>
    <div class="ui acknowledge modal">
        <h2 class="ui header">AT&T Proprietary and Confidential Information</h2>
        <div class="content">
        Not for use or disclosure outside the AT&T companies except under written agreement.
        </div>
        <div class="actions">
        <button id='acknowledgeBtn' class="ui positive green button">Acknowledge</button>
        </div>
    </div>
          <div class="ui hidden divider"></div>
          <div class="ui sixteen column centered stackable grid">

                <div class="row">
                    <div class="six wide center aligned column">
                       <ponder-search searchid="addSearch" searchmode="addressSearch" defaulttext="Start typing an address to check service status..." remoteurl="${baseSearchApiUrl}/search/addresses?query={query}"></ponder-search>
                    </div>
                </div>
                <div class="row">
                    <div class="six wide center aligned column">
                          <div id="divLoader" style="display: none;" class="ui active inverted dimmer">
                              <div class="ui text loader">Processing...</div>
                            </div>
                            <div id="divStatus">
                                <a id="lblStatus" style="display: none;" class="ui grey label">Fiber Availability</a>
                            </div> 
                    </div>
                </div>
            </div>
        </div>`
    } else {

        return html`
<div class="ui ">
          <ponder-appheader></ponder-appheader>            
<div class="ui notauthorized modal">
            <h2 class="ui header">Not Authorized</h2>
          <div class="content">
            You do not have the required permissions to access this tool. <a class="kt-link" href="mailto:g16274@att.com?subject=PONDER Direct Access Request">Contact Support</a>.
          </div>
          <div class="actions">
                <div class="ui negative red button">Close</div>
          </div>
        </div>
       </div>`
    }
};

export default template;                            

