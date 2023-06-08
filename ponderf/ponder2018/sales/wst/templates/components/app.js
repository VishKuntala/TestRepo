import { html } from 'lit-element';
import '../../assets/styles/global-vars.css';
import '../../assets/styles/color-vars.css';
import '../../assets/styles/styles.css';


const template = ({ appName }) => {
    return html`
        <div class="ui ">
          <ponder-appheader></ponder-appheader>
          <ponder-appbody></ponder-appbody>
        </div>
        <div class="ui acknowledge modal">
          <h2 class="ui header">AT&T Proprietary and Confidential Information</h2>
          <div class="content">
            <div class="item">
                Not for use or disclosure outside the AT&T companies except under written agreement.
            </div>
            <br>
            <div class="item">
                Disclaimer: The use of Ponder tool data for anything other than its intended purpose is <FONT COLOR="RED">STRICTLY PROHIBITED</FONT>. Any such use is a violation of the AT&T Code of Conduct.
            </div>
          </div>
          <div class="actions">
            <button id='acknowledgeBtn' class="ui positive green button">Acknowledge</button>
          </div>
        </div>

<div class="ui notauthorized modal">
    <h2 class="ui header">Not Authorized</h2>
  <div class="content">
    You do not have the required permissions to access this tool. <a class="kt-link" href="mailto:g16274@att.com?subject=PONDER (${appName}) Access Request">Contact Support</a>.
  </div>
  <div class="actions">
        <div class="ui negative red button">Close</div>
  </div>
</div>

<div class="ui rivals modal">
    <h2 class="ui header">SIP Rivals Competitor Info</h2>
  <div class="scrolling content">
    <div id='psaInfo'></div>
    <h4>Top 5 Competitors based on SIP Rivals Data DL Speed for ZIP <span class ="rivalsInfoZip"></span></h4>
    <table id="dlSpeed" class="ui celled compact table">
    </table>
    <h4>T-Mobile Hotspot based on SIP Rivals Information for ZIP <span class ="rivalsInfoZip"></span></h4>
    <table id="tmobilehotspot" class="ui celled compact table">
    </table>
  </div>
  <div class="actions">
    <button id='rivalsCloseBtn' class="ui positive green button">Close</button>
  </div>
</div>

    `
};

export default template;                            
