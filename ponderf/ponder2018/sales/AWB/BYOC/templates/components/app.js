import { html } from 'lit-element';

const template = ({ showModal, filterData }) => html`<div class="ui container">
<ponder-appheader></ponder-appheader>
<div class="ui hidden divider"></div>
<div class="ui sixteen column centered stackable grid">
        <div class="row">
            <div class="four wide center aligned column">
                <button @click="${ showModal }" class="ui blue icon button"><i class="arrow alternate circle up icon"></i> Upload New Cluster</button>
            </div>
        </div>
        
        <div class="row">
            <div class="sixteen wide center aligned column">
                <h3>Cluster Schedule Requests History</h3>
                <div class="ui twelve column center aligned grid">                    
                    <div class="three wide column">
                        <div class="ui radio checkbox">
                            <input @click="${filterData}" type="radio" name="clusterFilter"  data-filter-attr="MY" checked="checked">
                            <label>My Clusters</label>
                        </div>
                    </div>
                    <div class="three wide column">
                        <div class="ui radio checkbox">
                            <input @click="${filterData}" type="radio" name="clusterFilter"  data-filter-attr="SHARED">
                            <label>Shared With Me</label>
                        </div>
                    </div>
                    <div class="three wide column">
                        <div class="ui radio checkbox">
                            <input @click="${filterData}" type="radio" name="clusterFilter"  data-filter-attr="PUBLIC">
                            <label>Public</label>
                        </div>
                    </div>
                    <div class="three wide column">
                        <div class="ui radio checkbox">
                            <input @change="${ filterData}" type="radio" name="clusterFilter"  data-filter-attr="ALL">
                            <label>All</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div>
        <ponder-datatable tableid="tblClusters"
                            remoteurl="/sales/AWB/BYOC/BYOC.aspx/Clusters"
                            derivation="clustersDataTable/clustersDataTable.js"
                            primarykeycolumn="byoc_cluster_id"
                            headers="DELETE,USER ID,CLUSTER NAME,NUMBER OF LOCATIONS,DATE REQUESTED,LAST RUN COMPLETED,ACTIONS"
                            dataKeys="admin_user,byoc_cluster_name,number_of_locations,cluster_create_date,cluster_last_run_date" >
        </ponder-datatable>
    </div>

</div>

<div class="ui uploadCluster modal">
<ponder-steps></ponder-steps>
    <div class="actions">
        <div class="ui cancel orange button">Cancel</div>
    </div>
</div>

<div class="ui rerun modal">
  <i class="close icon"></i>
  <div class="header">
    Rerun Cluster
  </div>
  <div class="image content">
    <div class="description">
      <p>Are you sure you want to rerun this cluster?</p>
    </div>
  </div>
  <div class="actions">
    <div class="ui cancel orange icon button">
      No
        <i class="times icon"></i>
    </div>
    <div class="ui positive right labeled icon button">
      Yes
      <i class="checkmark icon"></i>
    </div>
  </div>
</div>

<div class="ui delete modal">
  <i class="close icon"></i>
  <div class="header">
    Delete Cluster
  </div>
  <div class="image content">
    <div class="description">
      <p>Are you sure you want to delete this cluster?</p>
    </div>
  </div>
  <div class="actions">
    <div class="ui cancel orange icon button">
      No
        <i class="times icon"></i>
    </div>
    <div class="ui positive right labeled icon button">
      Yes
      <i class="checkmark icon"></i>
    </div>
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
`;


export default template;                            