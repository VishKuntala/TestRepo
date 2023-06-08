import { html } from 'lit-element';

const template = ({ handleClick, navigateNext, navigatePrev, saveCluster, generateExceptionFile, downloadTemplateFile, sendSupportEmail, uploadLimit }) => html`<div class="ui two top attached steps">
  <div class="active blue step">
    <i class="upload icon"></i>
    <div class="content">
      <div class="title">Step 1: Upload Data</div>
      <div class="description">Upload your Excel File</div>
    </div>
  </div>
  <div class="step">
    <i class="file alternate icon"></i>
    <div class="content">
      <div class="title">Step 2: Set Cluster Info & Save</div>
      <div class="description">Assign cluster name, set sharing options and save cluster</div>
    </div>
  </div>
</div>
<div class="ui hidden divider"></div>
<div class="ui attached segment">
    <div class="ui eight column centered padded grid">
        <div class="row">
            <div class="description">Maximum of ${uploadLimit} locations can be submited at once.</div>
        </div>
        <div class="row">
                <div class="eight wide center aligned column">
                    <div class="ui action input">
                        <input id="files" type="file">
                            <div id="btnImport" @click="${handleClick}" class="ui icon blue button">
                                <i class="arrow alternate circle up icon"></i>
                                    Import
                            </div>
                    </div>
                    <p>
                        <div @click="${downloadTemplateFile}" class="ui icon blue button">
                            <i class="arrow alternate circle down icon"></i>
                            Download Excel Template
                        </div>
                    </p>
                    <div class="ui hidden negative missingfile message">
                            Select a file to import.
                    </div>
                    <div class="ui hidden negative missingdata message">
                      <div class="header">
                        Data Validation Error
                      </div>
                      <p>The file imported was missing required data. Please click on the button below to download the exception list.
                         Retry the import after fixing the data.</p>
                      <p>
                            <div @click="${generateExceptionFile}" class="negative ui icon button">
                                <i class="arrow alternate circle down icon"></i>
                                Download Exceptions
                            </div>
                      </p>
                    </div>
                    <div class="ui hidden positive message">
                      <div class="header">
                        Looks Good!
                      </div>
                      <p>
                        Your cluster contains <span id="spnNoOfLocations"></span>.
                      </p>
                    </div>                    
                    <div class="ui small message">
                        <div>
                            This system of scoring is very standardized and limited to 10,000 locations.
                            If you need to address very large buildings or group of buildings, or if you need more than 10,000 locations,
                            feel free to reach out to us. We will be happy to customize the data pull for your specific business case.
                        </div>
                        <button @click="${sendSupportEmail}" class="ui blue tertiary button">Contact Ponder Support</button>
                    </div>

                </div>
        </div>
    </div>
</div>
<div style="display: none;" class="ui attached segment">
    <div class="ui six column centered padded vertically divided grid">
        <div class="row">
                <div class="six wide left aligned column">
                    
                          
                          <form class="ui form">
  <div class="field">
    <label>Cluster Name (Required):</label>
    <input id="txtClusterName" required name="txtClusterName" type="text">
  </div>
  <div class="field">
    <label>Shared Users (list UIDs, comma separated):</label>
    <input id="txtSharedUids" name="txtSharedUids" type="text">
  </div>
  <div class="inline field">
    <div class="ui checkbox">
      <input type="checkbox" id="chkPublicCluster" name="chkPublicCluster">
      <label>Public Cluster</label>
    </div>
  </div>
<input id="hdnClusterId" type="hidden" >
<input id="frmMode" type="hidden" >
<div class="actions">
  <div id="btnSubmit" @click="${saveCluster}" class="ui green button">Submit</div>
</div>
  <div class="ui error message"></div>
</form>
                        
                </div>
        </div>
    </div>
</div>
<div class="ui hidden divider"></div>
<div class="ui fourteen column centered padded vertically divided grid">
        <div class="row">
            <div class="fourteen wide column">
                <button style="display: none;" @click="${navigatePrev}" class="ui left floated left labeled icon medium blue button prev"><i class="left arrow icon"></i>Previous</button>
                <button @click="${navigateNext}" class="ui right floated right labeled  medium icon blue button next"><i class="right arrow icon"></i>Next</button>
            </div>

        </div>
</div>`;

export default template;    